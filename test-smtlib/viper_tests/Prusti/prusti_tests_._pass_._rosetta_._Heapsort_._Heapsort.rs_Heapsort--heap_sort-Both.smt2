(get-info :version)
; (:version "4.12.1")
; Started: 2023-10-31 14:09:17
; Silicon.version: 1.1-SNAPSHOT (46944a65@dspil_symbenchmarking)
; Input file: /home/pcorrect/repos/benchmarking_general/silicon_tests/prusti_tests_._pass_._rosetta_._Heapsort_._Heapsort.rs_Heapsort--heap_sort-Both.vpr
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
(declare-sort Set<$Ref> 0)
(declare-sort Set<Bool> 0)
(declare-sort Set<Int> 0)
(declare-sort Set<$Snap> 0)
(declare-sort MirrorDomain 0)
(declare-sort Snap$struct$m_std$$vec$$Vec$i32$struct$m_std$$alloc$$Global 0)
(declare-sort Snap$struct$m_VecWrapperI32 0)
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
(declare-fun $SortWrappers.Snap$struct$m_std$$vec$$Vec$i32$struct$m_std$$alloc$$GlobalTo$Snap (Snap$struct$m_std$$vec$$Vec$i32$struct$m_std$$alloc$$Global) $Snap)
(declare-fun $SortWrappers.$SnapToSnap$struct$m_std$$vec$$Vec$i32$struct$m_std$$alloc$$Global ($Snap) Snap$struct$m_std$$vec$$Vec$i32$struct$m_std$$alloc$$Global)
(assert (forall ((x Snap$struct$m_std$$vec$$Vec$i32$struct$m_std$$alloc$$Global)) (!
    (= x ($SortWrappers.$SnapToSnap$struct$m_std$$vec$$Vec$i32$struct$m_std$$alloc$$Global($SortWrappers.Snap$struct$m_std$$vec$$Vec$i32$struct$m_std$$alloc$$GlobalTo$Snap x)))
    :pattern (($SortWrappers.Snap$struct$m_std$$vec$$Vec$i32$struct$m_std$$alloc$$GlobalTo$Snap x))
    :qid |$Snap.$SnapToSnap$struct$m_std$$vec$$Vec$i32$struct$m_std$$alloc$$GlobalTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Snap$struct$m_std$$vec$$Vec$i32$struct$m_std$$alloc$$GlobalTo$Snap($SortWrappers.$SnapToSnap$struct$m_std$$vec$$Vec$i32$struct$m_std$$alloc$$Global x)))
    :pattern (($SortWrappers.$SnapToSnap$struct$m_std$$vec$$Vec$i32$struct$m_std$$alloc$$Global x))
    :qid |$Snap.Snap$struct$m_std$$vec$$Vec$i32$struct$m_std$$alloc$$GlobalTo$SnapToSnap$struct$m_std$$vec$$Vec$i32$struct$m_std$$alloc$$Global|
    )))
(declare-fun $SortWrappers.Snap$struct$m_VecWrapperI32To$Snap (Snap$struct$m_VecWrapperI32) $Snap)
(declare-fun $SortWrappers.$SnapToSnap$struct$m_VecWrapperI32 ($Snap) Snap$struct$m_VecWrapperI32)
(assert (forall ((x Snap$struct$m_VecWrapperI32)) (!
    (= x ($SortWrappers.$SnapToSnap$struct$m_VecWrapperI32($SortWrappers.Snap$struct$m_VecWrapperI32To$Snap x)))
    :pattern (($SortWrappers.Snap$struct$m_VecWrapperI32To$Snap x))
    :qid |$Snap.$SnapToSnap$struct$m_VecWrapperI32To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Snap$struct$m_VecWrapperI32To$Snap($SortWrappers.$SnapToSnap$struct$m_VecWrapperI32 x)))
    :pattern (($SortWrappers.$SnapToSnap$struct$m_VecWrapperI32 x))
    :qid |$Snap.Snap$struct$m_VecWrapperI32To$SnapToSnap$struct$m_VecWrapperI32|
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
(declare-fun mirror_simple$m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$<Int> (Snap$struct$m_VecWrapperI32) Int)
(declare-fun mirror_simple$m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$<Int> (Snap$struct$m_VecWrapperI32 Int) Int)
(declare-fun cons$0$__$TY$__Snap$struct$m_VecWrapperI32$Snap$struct$m_std$$vec$$Vec$i32$struct$m_std$$alloc$$Global$Snap$struct$m_VecWrapperI32<Snap$struct$m_VecWrapperI32> (Snap$struct$m_std$$vec$$Vec$i32$struct$m_std$$alloc$$Global) Snap$struct$m_VecWrapperI32)
(declare-fun Snap$struct$m_VecWrapperI32$0$field$f$v__$TY$__Snap$struct$m_VecWrapperI32$Snap$struct$m_std$$vec$$Vec$i32$struct$m_std$$alloc$$Global<Snap$struct$m_std$$vec$$Vec$i32$struct$m_std$$alloc$$Global> (Snap$struct$m_VecWrapperI32) Snap$struct$m_std$$vec$$Vec$i32$struct$m_std$$alloc$$Global)
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
(declare-fun snap$__$TY$__Snap$struct$m_std$$vec$$Vec$i32$struct$m_std$$alloc$$Global$struct$m_std$$vec$$Vec$i32$struct$m_std$$alloc$$Global$Snap$struct$m_std$$vec$$Vec$i32$struct$m_std$$alloc$$Global ($Snap $Ref) Snap$struct$m_std$$vec$$Vec$i32$struct$m_std$$alloc$$Global)
(declare-fun snap$__$TY$__Snap$struct$m_std$$vec$$Vec$i32$struct$m_std$$alloc$$Global$struct$m_std$$vec$$Vec$i32$struct$m_std$$alloc$$Global$Snap$struct$m_std$$vec$$Vec$i32$struct$m_std$$alloc$$Global%limited ($Snap $Ref) Snap$struct$m_std$$vec$$Vec$i32$struct$m_std$$alloc$$Global)
(declare-fun snap$__$TY$__Snap$struct$m_std$$vec$$Vec$i32$struct$m_std$$alloc$$Global$struct$m_std$$vec$$Vec$i32$struct$m_std$$alloc$$Global$Snap$struct$m_std$$vec$$Vec$i32$struct$m_std$$alloc$$Global%stateless ($Ref) Bool)
(declare-fun snap$__$TY$__Snap$struct$m_std$$vec$$Vec$i32$struct$m_std$$alloc$$Global$struct$m_std$$vec$$Vec$i32$struct$m_std$$alloc$$Global$Snap$struct$m_std$$vec$$Vec$i32$struct$m_std$$alloc$$Global%precondition ($Snap $Ref) Bool)
(declare-fun m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$ ($Snap Snap$struct$m_VecWrapperI32) Int)
(declare-fun m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$%limited ($Snap Snap$struct$m_VecWrapperI32) Int)
(declare-fun m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$%stateless (Snap$struct$m_VecWrapperI32) Bool)
(declare-fun m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$%precondition ($Snap Snap$struct$m_VecWrapperI32) Bool)
(declare-fun snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 ($Snap $Ref) Snap$struct$m_VecWrapperI32)
(declare-fun snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32%limited ($Snap $Ref) Snap$struct$m_VecWrapperI32)
(declare-fun snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32%stateless ($Ref) Bool)
(declare-fun snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32%precondition ($Snap $Ref) Bool)
(declare-fun m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$ ($Snap Snap$struct$m_VecWrapperI32 Int) Int)
(declare-fun m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$%limited ($Snap Snap$struct$m_VecWrapperI32 Int) Int)
(declare-fun m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$%stateless (Snap$struct$m_VecWrapperI32 Int) Bool)
(declare-fun m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$%precondition ($Snap Snap$struct$m_VecWrapperI32 Int) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun DeadBorrowToken$%trigger ($Snap Int) Bool)
(declare-fun bool%trigger ($Snap $Ref) Bool)
(declare-fun struct$m_VecWrapperI32%trigger ($Snap $Ref) Bool)
(declare-fun struct$m_std$$vec$$Vec$i32$struct$m_std$$alloc$$Global%trigger ($Snap $Ref) Bool)
(declare-fun tuple0$%trigger ($Snap $Ref) Bool)
(declare-fun usize%trigger ($Snap $Ref) Bool)
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
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
(assert (forall ((_l_0 Snap$struct$m_std$$vec$$Vec$i32$struct$m_std$$alloc$$Global) (_r_0 Snap$struct$m_std$$vec$$Vec$i32$struct$m_std$$alloc$$Global)) (!
  (=>
    (=
      (cons$0$__$TY$__Snap$struct$m_VecWrapperI32$Snap$struct$m_std$$vec$$Vec$i32$struct$m_std$$alloc$$Global$Snap$struct$m_VecWrapperI32<Snap$struct$m_VecWrapperI32> _l_0)
      (cons$0$__$TY$__Snap$struct$m_VecWrapperI32$Snap$struct$m_std$$vec$$Vec$i32$struct$m_std$$alloc$$Global$Snap$struct$m_VecWrapperI32<Snap$struct$m_VecWrapperI32> _r_0))
    (= _l_0 _r_0))
  :pattern ((cons$0$__$TY$__Snap$struct$m_VecWrapperI32$Snap$struct$m_std$$vec$$Vec$i32$struct$m_std$$alloc$$Global$Snap$struct$m_VecWrapperI32<Snap$struct$m_VecWrapperI32> _l_0) (cons$0$__$TY$__Snap$struct$m_VecWrapperI32$Snap$struct$m_std$$vec$$Vec$i32$struct$m_std$$alloc$$Global$Snap$struct$m_VecWrapperI32<Snap$struct$m_VecWrapperI32> _r_0))
  :qid |prog.Snap$struct$m_VecWrapperI32$0$injectivity|)))
(assert (forall ((_0 Snap$struct$m_std$$vec$$Vec$i32$struct$m_std$$alloc$$Global)) (!
  (=
    (Snap$struct$m_VecWrapperI32$0$field$f$v__$TY$__Snap$struct$m_VecWrapperI32$Snap$struct$m_std$$vec$$Vec$i32$struct$m_std$$alloc$$Global<Snap$struct$m_std$$vec$$Vec$i32$struct$m_std$$alloc$$Global> (cons$0$__$TY$__Snap$struct$m_VecWrapperI32$Snap$struct$m_std$$vec$$Vec$i32$struct$m_std$$alloc$$Global$Snap$struct$m_VecWrapperI32<Snap$struct$m_VecWrapperI32> _0))
    _0)
  :pattern ((Snap$struct$m_VecWrapperI32$0$field$f$v__$TY$__Snap$struct$m_VecWrapperI32$Snap$struct$m_std$$vec$$Vec$i32$struct$m_std$$alloc$$Global<Snap$struct$m_std$$vec$$Vec$i32$struct$m_std$$alloc$$Global> (cons$0$__$TY$__Snap$struct$m_VecWrapperI32$Snap$struct$m_std$$vec$$Vec$i32$struct$m_std$$alloc$$Global$Snap$struct$m_VecWrapperI32<Snap$struct$m_VecWrapperI32> _0)))
  :qid |prog.Snap$struct$m_VecWrapperI32$0$field$f$v$axiom|)))
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
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap)) (!
  (let ((result@0@00 (read$%limited s@$))) true)
  :pattern ((read$%limited s@$))
  :qid |quant-u-11|)))
(assert (forall ((s@$ $Snap)) (!
  (let ((result@0@00 (read$%limited s@$))) true)
  :pattern ((read$%limited s@$))
  :qid |quant-u-12|)))
(assert (forall ((s@$ $Snap) (self@1@00 $Ref)) (!
  (=
    (snap$__$TY$__Snap$struct$m_std$$vec$$Vec$i32$struct$m_std$$alloc$$Global$struct$m_std$$vec$$Vec$i32$struct$m_std$$alloc$$Global$Snap$struct$m_std$$vec$$Vec$i32$struct$m_std$$alloc$$Global%limited s@$ self@1@00)
    (snap$__$TY$__Snap$struct$m_std$$vec$$Vec$i32$struct$m_std$$alloc$$Global$struct$m_std$$vec$$Vec$i32$struct$m_std$$alloc$$Global$Snap$struct$m_std$$vec$$Vec$i32$struct$m_std$$alloc$$Global s@$ self@1@00))
  :pattern ((snap$__$TY$__Snap$struct$m_std$$vec$$Vec$i32$struct$m_std$$alloc$$Global$struct$m_std$$vec$$Vec$i32$struct$m_std$$alloc$$Global$Snap$struct$m_std$$vec$$Vec$i32$struct$m_std$$alloc$$Global s@$ self@1@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (self@1@00 $Ref)) (!
  (snap$__$TY$__Snap$struct$m_std$$vec$$Vec$i32$struct$m_std$$alloc$$Global$struct$m_std$$vec$$Vec$i32$struct$m_std$$alloc$$Global$Snap$struct$m_std$$vec$$Vec$i32$struct$m_std$$alloc$$Global%stateless self@1@00)
  :pattern ((snap$__$TY$__Snap$struct$m_std$$vec$$Vec$i32$struct$m_std$$alloc$$Global$struct$m_std$$vec$$Vec$i32$struct$m_std$$alloc$$Global$Snap$struct$m_std$$vec$$Vec$i32$struct$m_std$$alloc$$Global%limited s@$ self@1@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (_1@3@00 Snap$struct$m_VecWrapperI32)) (!
  (=
    (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$%limited s@$ _1@3@00)
    (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$ s@$ _1@3@00))
  :pattern ((m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$ s@$ _1@3@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (_1@3@00 Snap$struct$m_VecWrapperI32)) (!
  (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$%stateless _1@3@00)
  :pattern ((m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$%limited s@$ _1@3@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (_1@3@00 Snap$struct$m_VecWrapperI32)) (!
  (let ((result@4@00 (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$%limited s@$ _1@3@00))) (=>
    (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$%precondition s@$ _1@3@00)
    (and
      (>= result@4@00 0)
      (<= 0 result@4@00)
      (=
        result@4@00
        (mirror_simple$m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$<Int> _1@3@00)))))
  :pattern ((m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$%limited s@$ _1@3@00))
  :qid |quant-u-13|)))
(assert (forall ((s@$ $Snap) (_1@3@00 Snap$struct$m_VecWrapperI32)) (!
  (let ((result@4@00 (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$%limited s@$ _1@3@00))) true)
  :pattern ((m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$%limited s@$ _1@3@00))
  :qid |quant-u-14|)))
(assert (forall ((s@$ $Snap) (_1@3@00 Snap$struct$m_VecWrapperI32)) (!
  (let ((result@4@00 (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$%limited s@$ _1@3@00))) true)
  :pattern ((m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$%limited s@$ _1@3@00))
  :qid |quant-u-15|)))
(assert (forall ((s@$ $Snap) (_1@3@00 Snap$struct$m_VecWrapperI32)) (!
  (let ((result@4@00 (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$%limited s@$ _1@3@00))) true)
  :pattern ((m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$%limited s@$ _1@3@00))
  :qid |quant-u-16|)))
(assert (forall ((s@$ $Snap) (self@5@00 $Ref)) (!
  (=
    (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32%limited s@$ self@5@00)
    (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 s@$ self@5@00))
  :pattern ((snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 s@$ self@5@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (self@5@00 $Ref)) (!
  (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32%stateless self@5@00)
  :pattern ((snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32%limited s@$ self@5@00))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap) (self@5@00 $Ref)) (!
  (=>
    (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32%precondition s@$ self@5@00)
    (=
      (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 s@$ self@5@00)
      (cons$0$__$TY$__Snap$struct$m_VecWrapperI32$Snap$struct$m_std$$vec$$Vec$i32$struct$m_std$$alloc$$Global$Snap$struct$m_VecWrapperI32<Snap$struct$m_VecWrapperI32> (snap$__$TY$__Snap$struct$m_std$$vec$$Vec$i32$struct$m_std$$alloc$$Global$struct$m_std$$vec$$Vec$i32$struct$m_std$$alloc$$Global$Snap$struct$m_std$$vec$$Vec$i32$struct$m_std$$alloc$$Global ($Snap.second s@$) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$))))))
  :pattern ((snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 s@$ self@5@00))
  :pattern ((snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32%stateless self@5@00) (struct$m_VecWrapperI32%trigger s@$ self@5@00))
  :qid |quant-u-17|)))
(assert (forall ((s@$ $Snap) (self@5@00 $Ref)) (!
  (=>
    (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32%precondition s@$ self@5@00)
    (snap$__$TY$__Snap$struct$m_std$$vec$$Vec$i32$struct$m_std$$alloc$$Global$struct$m_std$$vec$$Vec$i32$struct$m_std$$alloc$$Global$Snap$struct$m_std$$vec$$Vec$i32$struct$m_std$$alloc$$Global%precondition ($Snap.second s@$) ($SortWrappers.$SnapTo$Ref ($Snap.first s@$))))
  :pattern ((snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 s@$ self@5@00))
  :qid |quant-u-18|)))
(assert (forall ((s@$ $Snap) (_1@7@00 Snap$struct$m_VecWrapperI32) (_2@8@00 Int)) (!
  (=
    (m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$%limited s@$ _1@7@00 _2@8@00)
    (m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$ s@$ _1@7@00 _2@8@00))
  :pattern ((m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$ s@$ _1@7@00 _2@8@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (_1@7@00 Snap$struct$m_VecWrapperI32) (_2@8@00 Int)) (!
  (m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$%stateless _1@7@00 _2@8@00)
  :pattern ((m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$%limited s@$ _1@7@00 _2@8@00))
  :qid |quant-u-9|)))
(assert (forall ((s@$ $Snap) (_1@7@00 Snap$struct$m_VecWrapperI32) (_2@8@00 Int)) (!
  (let ((result@9@00 (m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$%limited s@$ _1@7@00 _2@8@00))) (=>
    (m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$%precondition s@$ _1@7@00 _2@8@00)
    (=
      result@9@00
      (mirror_simple$m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$<Int> _1@7@00 _2@8@00))))
  :pattern ((m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$%limited s@$ _1@7@00 _2@8@00))
  :qid |quant-u-19|)))
(assert (forall ((s@$ $Snap) (_1@7@00 Snap$struct$m_VecWrapperI32) (_2@8@00 Int)) (!
  (let ((result@9@00 (m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$%limited s@$ _1@7@00 _2@8@00))) true)
  :pattern ((m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$%limited s@$ _1@7@00 _2@8@00))
  :qid |quant-u-20|)))
(assert (forall ((s@$ $Snap) (_1@7@00 Snap$struct$m_VecWrapperI32) (_2@8@00 Int)) (!
  (let ((result@9@00 (m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$%limited s@$ _1@7@00 _2@8@00))) true)
  :pattern ((m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$%limited s@$ _1@7@00 _2@8@00))
  :qid |quant-u-21|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- m_heap_sort ----------
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
; var _preserve$0: Ref
(declare-const _preserve$0@35@01 $Ref)
; [exec]
; var __t33: Bool
(declare-const __t33@36@01 Bool)
; [exec]
; var __t34: Bool
(declare-const __t34@37@01 Bool)
; [exec]
; var __t35: Bool
(declare-const __t35@38@01 Bool)
; [exec]
; var __t36: Bool
(declare-const __t36@39@01 Bool)
; [exec]
; var __t37: Bool
(declare-const __t37@40@01 Bool)
; [exec]
; var __t38: Bool
(declare-const __t38@41@01 Bool)
; [exec]
; var __t39: Bool
(declare-const __t39@42@01 Bool)
; [exec]
; var __t40: Bool
(declare-const __t40@43@01 Bool)
; [exec]
; var __t41: Bool
(declare-const __t41@44@01 Bool)
; [exec]
; var __t42: Bool
(declare-const __t42@45@01 Bool)
; [exec]
; var _preserve$1: Ref
(declare-const _preserve$1@46@01 $Ref)
; [exec]
; var __t43: Bool
(declare-const __t43@47@01 Bool)
; [exec]
; var __t44: Bool
(declare-const __t44@48@01 Bool)
; [exec]
; var __t45: Bool
(declare-const __t45@49@01 Bool)
; [exec]
; var __t46: Bool
(declare-const __t46@50@01 Bool)
; [exec]
; var __t47: Bool
(declare-const __t47@51@01 Bool)
; [exec]
; var __t48: Bool
(declare-const __t48@52@01 Bool)
; [exec]
; var __t49: Bool
(declare-const __t49@53@01 Bool)
; [exec]
; var __t50: Bool
(declare-const __t50@54@01 Bool)
; [exec]
; var _old$pre$0: Ref
(declare-const _old$pre$0@55@01 $Ref)
; [exec]
; var _1: Ref
(declare-const _1@56@01 $Ref)
; [exec]
; var _2: Int
(declare-const _2@57@01 Int)
; [exec]
; var _3: Ref
(declare-const _3@58@01 $Ref)
; [exec]
; var _4: Ref
(declare-const _4@59@01 $Ref)
; [exec]
; var _5: Int
(declare-const _5@60@01 Int)
; [exec]
; var _6: Ref
(declare-const _6@61@01 $Ref)
; [exec]
; var _7: Ref
(declare-const _7@62@01 $Ref)
; [exec]
; var _8: Int
(declare-const _8@63@01 Int)
; [exec]
; var _11: Ref
(declare-const _11@64@01 $Ref)
; [exec]
; var _13: Ref
(declare-const _13@65@01 $Ref)
; [exec]
; var _18: Ref
(declare-const _18@66@01 $Ref)
; [exec]
; var _23: Ref
(declare-const _23@67@01 $Ref)
; [exec]
; var _26: Ref
(declare-const _26@68@01 $Ref)
; [exec]
; var _27: Ref
(declare-const _27@69@01 $Ref)
; [exec]
; var _28: Ref
(declare-const _28@70@01 $Ref)
; [exec]
; var _29: Int
(declare-const _29@71@01 Int)
; [exec]
; var _30: Ref
(declare-const _30@72@01 $Ref)
; [exec]
; var _31: Int
(declare-const _31@73@01 Int)
; [exec]
; var _32: Ref
(declare-const _32@74@01 $Ref)
; [exec]
; var _33: Int
(declare-const _33@75@01 Int)
; [exec]
; var _37: Ref
(declare-const _37@76@01 $Ref)
; [exec]
; var _38: Ref
(declare-const _38@77@01 $Ref)
; [exec]
; var _39: Int
(declare-const _39@78@01 Int)
; [exec]
; var _40: Ref
(declare-const _40@79@01 $Ref)
; [exec]
; var _42: Ref
(declare-const _42@80@01 $Ref)
; [exec]
; var _47: Ref
(declare-const _47@81@01 $Ref)
; [exec]
; var _52: Ref
(declare-const _52@82@01 $Ref)
; [exec]
; var _55: Ref
(declare-const _55@83@01 $Ref)
; [exec]
; var _56: Int
(declare-const _56@84@01 Int)
; [exec]
; var _57: Ref
(declare-const _57@85@01 $Ref)
; [exec]
; var _58: Ref
(declare-const _58@86@01 $Ref)
; [exec]
; var _59: Int
(declare-const _59@87@01 Int)
; [exec]
; var _60: Int
(declare-const _60@88@01 Int)
; [exec]
; var _61: Ref
(declare-const _61@89@01 $Ref)
; [exec]
; var _62: Ref
(declare-const _62@90@01 $Ref)
; [exec]
; var _63: Int
(declare-const _63@91@01 Int)
; [exec]
; var _64: Ref
(declare-const _64@92@01 $Ref)
; [exec]
; var _65: Int
(declare-const _65@93@01 Int)
; [exec]
; var _66: Ref
(declare-const _66@94@01 $Ref)
; [exec]
; var _67: Int
(declare-const _67@95@01 Int)
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
; inhale acc(_1.val_ref, write) &&
;   acc(struct$m_VecWrapperI32(_1.val_ref), write)
(declare-const $t@96@01 $Snap)
(assert (= $t@96@01 ($Snap.combine ($Snap.first $t@96@01) ($Snap.second $t@96@01))))
(assert (not (= _1@56@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale true
(declare-const $t@97@01 $Snap)
(assert (= $t@97@01 $Snap.unit))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label pre
; [exec]
; __t0 := true
; [exec]
; _3 := builtin$havoc_ref()
(declare-const ret@98@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_3.val_ref, write)
(declare-const $t@99@01 $Ref)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= _1@56@01 ret@98@01)))
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
; _3.val_ref := _1.val_ref
(declare-const val_ref@100@01 $Ref)
(assert (= val_ref@100@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@96@01))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= _1@56@01 ret@98@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(struct$m_VecWrapperI32(_1.val_ref), write - read$())
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
; inhale acc(struct$m_VecWrapperI32(_3.val_ref), read$())
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
(declare-const $t@101@01 $Snap)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@96@01)) val_ref@100@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const $t@102@01 $Snap)
(assert (and
  (=>
    (<
      $Perm.No
      (- $Perm.Write ($Perm.min $Perm.Write (- $Perm.Write (read$ $Snap.unit)))))
    (= $t@102@01 ($Snap.second $t@96@01)))
  (=> (< $Perm.No (read$ $Snap.unit)) (= $t@102@01 $t@101@01))))
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
; label l1
; [exec]
; _2 := builtin$havoc_int()
(declare-const ret@103@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _2 >= 0
(declare-const $t@104@01 $Snap)
(assert (= $t@104@01 $Snap.unit))
; [eval] _2 >= 0
(assert (>= ret@103@01 0))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale _2 ==
;   m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_3.val_ref))
(declare-const $t@105@01 $Snap)
(assert (= $t@105@01 $Snap.unit))
; [eval] _2 == m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_3.val_ref))
; [eval] m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_3.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_3.val_ref)
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
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@96@01)) val_ref@100@01)))
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
(assert (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32%precondition $t@102@01 val_ref@100@01))
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
  (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32%precondition $t@102@01 val_ref@100@01)))
(set-option :timeout 0)
(push) ; 3
(assert (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 $t@102@01 val_ref@100@01)))
(pop) ; 3
; Joined path conditions
(assert (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 $t@102@01 val_ref@100@01)))
(assert (=
  ret@103@01
  (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 $t@102@01 val_ref@100@01))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [eval] __t0 && __t0
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | True | live]
; [else-branch: 0 | False | live]
(push) ; 4
; [then-branch: 0 | True]
(pop) ; 4
(push) ; 4
; [else-branch: 0 | False]
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
; [then-branch: 1 | True | live]
; [else-branch: 1 | False | dead]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 1 | True]
; [exec]
; exhale acc(struct$m_VecWrapperI32(old[l0](_3.val_ref)), read$())
; [eval] read$()
(push) ; 4
(pop) ; 4
; Joined path conditions
; [eval] old[l0](_3.val_ref)
(push) ; 4
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@96@01)) val_ref@100@01)))
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
; inhale acc(struct$m_VecWrapperI32(_1.val_ref), write - read$())
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
(declare-const $t@106@01 $Snap)
(declare-const $t@107@01 $Snap)
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
    (= $t@107@01 $t@102@01))
  (=> (< $Perm.No (- $Perm.Write (read$ $Snap.unit))) (= $t@107@01 $t@106@01))))
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
; __t1 := true
; [exec]
; _5 := builtin$havoc_int()
(declare-const ret@108@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale _2 >= 0
(declare-const $t@109@01 $Snap)
(assert (= $t@109@01 $Snap.unit))
; [eval] _2 >= 0
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _5 := _2
; [exec]
; label l3
; [exec]
; _6 := builtin$havoc_ref()
(declare-const ret@110@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_6.val_bool, write)
(declare-const $t@111@01 Bool)
(assert (not (= ret@110@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _6.val_bool := false
; [exec]
; __t30 := _6.val_bool
; [exec]
; assert !__t30
; [eval] !__t30
; [exec]
; __t2 := true
; [exec]
; _4 := builtin$havoc_ref()
(declare-const ret@112@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_4.val_int, write)
(declare-const $t@113@01 Int)
(assert (not (= ret@112@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _4.val_int := _5 / 2
; [eval] _5 / 2
(declare-const val_int@114@01 Int)
(assert (= val_int@114@01 (div ret@103@01 2)))
; [exec]
; _8 := builtin$havoc_int()
(declare-const ret@115@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _8 := _4.val_int
; [exec]
; label l4
; [exec]
; _7 := builtin$havoc_ref()
(declare-const ret@116@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(_7.val_bool, write)
(declare-const $t@117@01 Bool)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@110@01 ret@116@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@116@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _7.val_bool := _8 > 0
; [eval] _8 > 0
(declare-const val_bool@118@01 Bool)
(assert (= val_bool@118@01 (> val_int@114@01 0)))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@110@01 ret@116@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t3 := true
; [exec]
; __t4 := true
; [exec]
; _11 := builtin$havoc_ref()
(declare-const ret@119@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_11.val_bool, write)
(declare-const $t@120@01 Bool)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@110@01 ret@119@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@116@01 ret@119@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@119@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _11.val_bool := _7.val_bool
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@116@01 ret@119@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= ret@110@01 ret@119@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [exec]
; label l5
; [exec]
; __t31 := _11.val_bool
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not val_bool@118@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not val_bool@118@01))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [then-branch: 2 | val_bool@118@01 | live]
; [else-branch: 2 | !(val_bool@118@01) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 2 | val_bool@118@01]
(assert val_bool@118@01)
; [exec]
; label bb0
; [exec]
; __t5 := true
; [exec]
; _13 := builtin$havoc_ref()
(declare-const ret@121@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_13.val_bool, write)
(declare-const $t@122@01 Bool)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@110@01 ret@121@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@116@01 ret@121@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@119@01 ret@121@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@121@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _13.val_bool := false
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@119@01 ret@121@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@116@01 ret@121@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@110@01 ret@121@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t32 := _13.val_bool
; [exec]
; _preserve$0 := _1.val_ref
(declare-const _preserve$0@123@01 $Ref)
(assert (= _preserve$0@123@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@96@01))))
; [exec]
; fold acc(usize(_4), write)
; [eval] 0 <= self.val_int
(set-option :timeout 0)
(push) ; 5
(assert (not (<= 0 val_int@114@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (<= 0 val_int@114@01))
(assert (usize%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap val_int@114@01)
  $Snap.unit) ret@112@01))
; [exec]
; fold acc(bool(_7), write)
(assert (bool%trigger ($SortWrappers.BoolTo$Snap val_bool@118@01) ret@116@01))
; [exec]
; assert _2 >= 0
; [eval] _2 >= 0
; [exec]
; assert _2 ==
;   m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_1.val_ref)) &&
;   ((unfolding acc(usize(_4), write) in _4.val_int) <= _2 / 2 &&
;   (unfolding acc(usize(_4), write) in _4.val_int) > 0)
; [eval] _2 == m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_1.val_ref))
; [eval] m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_1.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_1.val_ref)
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
(pop) ; 6
; 0.00s
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
(push) ; 6
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
(assert (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32%precondition $t@107@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@96@01))))
(pop) ; 5
; Joined path conditions
(assert (and
  (<=
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
        (read$ $Snap.unit))))
  (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32%precondition $t@107@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@96@01)))))
(set-option :timeout 0)
(push) ; 5
(assert (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 $t@107@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@96@01)))))
(pop) ; 5
; Joined path conditions
(assert (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 $t@107@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@96@01)))))
(push) ; 5
(assert (not (=
  ret@103@01
  (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 $t@107@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@96@01)))))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (=
  ret@103@01
  (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 $t@107@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@96@01))))))
; [eval] (unfolding acc(usize(_4), write) in _4.val_int) <= _2 / 2
; [eval] (unfolding acc(usize(_4), write) in _4.val_int)
(push) ; 5
; [eval] 0 <= self.val_int
(pop) ; 5
; Joined path conditions
; [eval] _2 / 2
(push) ; 5
(assert (not (<= val_int@114@01 (div ret@103@01 2))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (<= val_int@114@01 (div ret@103@01 2)))
; [eval] (unfolding acc(usize(_4), write) in _4.val_int) > 0
; [eval] (unfolding acc(usize(_4), write) in _4.val_int)
(push) ; 5
; [eval] 0 <= self.val_int
(pop) ; 5
; Joined path conditions
(push) ; 5
(assert (not (> val_int@114@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (> val_int@114@01 0))
; [exec]
; assert true
; [exec]
; assert _preserve$0 == _1.val_ref
; [eval] _preserve$0 == _1.val_ref
; [exec]
; exhale acc(usize(_4), write) &&
;   (acc(bool(_7), write) &&
;   (acc(_1.val_ref, read$()) &&
;   (acc(struct$m_VecWrapperI32(_1.val_ref), write) && _2 >= 0)))
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
; 0.00s
; (get-info :all-statistics)
(assert (<= $Perm.No (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))))
(assert (<= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.Write))
(assert (=>
  (< $Perm.No (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))))
  (not (= _1@56@01 $Ref.null))))
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
(set-option :timeout 0)
(push) ; 5
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
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
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
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [eval] _2 >= 0
; [exec]
; _11 := builtin$havoc_ref()
(declare-const ret@124@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _13 := builtin$havoc_ref()
(declare-const ret@125@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _18 := builtin$havoc_ref()
(declare-const ret@126@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _23 := builtin$havoc_ref()
(declare-const ret@127@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _26 := builtin$havoc_ref()
(declare-const ret@128@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _27 := builtin$havoc_ref()
(declare-const ret@129@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _28 := builtin$havoc_ref()
(declare-const ret@130@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _29 := builtin$havoc_int()
(declare-const ret@131@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _30 := builtin$havoc_ref()
(declare-const ret@132@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _31 := builtin$havoc_int()
(declare-const ret@133@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _32 := builtin$havoc_ref()
(declare-const ret@134@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _33 := builtin$havoc_int()
(declare-const ret@135@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _4 := builtin$havoc_ref()
(declare-const ret@136@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t10 := builtin$havoc_bool()
(declare-const ret@137@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t11 := builtin$havoc_bool()
(declare-const ret@138@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t12 := builtin$havoc_bool()
(declare-const ret@139@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t13 := builtin$havoc_bool()
(declare-const ret@140@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t14 := builtin$havoc_bool()
(declare-const ret@141@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t3 := builtin$havoc_bool()
(declare-const ret@142@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t33 := builtin$havoc_bool()
(declare-const ret@143@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t34 := builtin$havoc_bool()
(declare-const ret@144@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t35 := builtin$havoc_bool()
(declare-const ret@145@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t36 := builtin$havoc_bool()
(declare-const ret@146@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t37 := builtin$havoc_bool()
(declare-const ret@147@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t38 := builtin$havoc_bool()
(declare-const ret@148@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t39 := builtin$havoc_bool()
(declare-const ret@149@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t4 := builtin$havoc_bool()
(declare-const ret@150@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t40 := builtin$havoc_bool()
(declare-const ret@151@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t5 := builtin$havoc_bool()
(declare-const ret@152@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t6 := builtin$havoc_bool()
(declare-const ret@153@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t7 := builtin$havoc_bool()
(declare-const ret@154@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t8 := builtin$havoc_bool()
(declare-const ret@155@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t9 := builtin$havoc_bool()
(declare-const ret@156@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(usize(_4), write) &&
;   (acc(bool(_7), write) &&
;   (acc(_1.val_ref, read$()) &&
;   (acc(struct$m_VecWrapperI32(_1.val_ref), write) && _2 >= 0)))
(declare-const $t@157@01 $Snap)
(assert (= $t@157@01 ($Snap.combine ($Snap.first $t@157@01) ($Snap.second $t@157@01))))
(assert (=
  ($Snap.second $t@157@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@157@01))
    ($Snap.second ($Snap.second $t@157@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@157@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@157@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@157@01))))))
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
(declare-const $t@158@01 $Ref)
(assert (and
  (=>
    (< $Perm.No (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))))
    (= $t@158@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@96@01))))
  (=>
    (< $Perm.No (read$ $Snap.unit))
    (=
      $t@158@01
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@157@01))))))))
(assert (<=
  $Perm.No
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
    (read$ $Snap.unit))))
(assert (<=
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
    (read$ $Snap.unit))
  $Perm.Write))
(assert (=>
  (<
    $Perm.No
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
      (read$ $Snap.unit)))
  (not (= _1@56@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@157@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@157@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@157@01)))))))
(push) ; 5
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@157@01))))
  $Snap.unit))
; [eval] _2 >= 0
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale _preserve$0 == _1.val_ref
(declare-const $t@159@01 $Snap)
(assert (= $t@159@01 $Snap.unit))
; [eval] _preserve$0 == _1.val_ref
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (= _preserve$0@123@01 $t@158@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale true
(declare-const $t@160@01 $Snap)
(assert (= $t@160@01 $Snap.unit))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; __t3 := true
; [exec]
; __t4 := true
; [exec]
; _11 := builtin$havoc_ref()
(declare-const ret@161@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_11.val_bool, write)
(declare-const $t@162@01 Bool)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@110@01 ret@161@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@119@01 ret@161@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@121@01 ret@161@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@161@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; unfold acc(bool(_7), write)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@121@01 ret@116@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@119@01 ret@116@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@110@01 ret@116@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@161@01 ret@116@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (bool%trigger ($Snap.first ($Snap.second $t@157@01)) ret@116@01))
; [exec]
; _11.val_bool := _7.val_bool
(declare-const val_bool@163@01 Bool)
(assert (=
  val_bool@163@01
  ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second $t@157@01)))))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@110@01 ret@161@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@119@01 ret@161@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@121@01 ret@161@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@116@01 ret@161@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [exec]
; label l8
; [exec]
; __t33 := _11.val_bool
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not val_bool@163@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not val_bool@163@01))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [then-branch: 3 | val_bool@163@01 | live]
; [else-branch: 3 | !(val_bool@163@01) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 3 | val_bool@163@01]
(assert val_bool@163@01)
; [exec]
; label bb1
; [exec]
; __t5 := true
; [exec]
; _13 := builtin$havoc_ref()
(declare-const ret@164@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_13.val_bool, write)
(declare-const $t@165@01 Bool)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@116@01 ret@164@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@121@01 ret@164@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@119@01 ret@164@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@110@01 ret@164@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@161@01 ret@164@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@164@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _13.val_bool := false
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@161@01 ret@164@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@110@01 ret@164@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@119@01 ret@164@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@121@01 ret@164@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@116@01 ret@164@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t34 := _13.val_bool
; [exec]
; inhale _2 ==
;   m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_1.val_ref)) &&
;   ((unfolding acc(usize(_4), write) in _4.val_int) <= _2 / 2 &&
;   (unfolding acc(usize(_4), write) in _4.val_int) > 0)
(declare-const $t@166@01 $Snap)
(assert (= $t@166@01 ($Snap.combine ($Snap.first $t@166@01) ($Snap.second $t@166@01))))
(assert (= ($Snap.first $t@166@01) $Snap.unit))
; [eval] _2 == m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_1.val_ref))
; [eval] m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_1.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_1.val_ref)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
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
; 0.00s
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
(assert (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@157@01)))) $t@158@01))
(pop) ; 6
; Joined path conditions
(assert (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@157@01)))) $t@158@01))
(set-option :timeout 0)
(push) ; 6
(assert (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@157@01)))) $t@158@01)))
(pop) ; 6
; Joined path conditions
(assert (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@157@01)))) $t@158@01)))
(assert (=
  ret@103@01
  (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@157@01)))) $t@158@01))))
(assert (=
  ($Snap.second $t@166@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@166@01))
    ($Snap.second ($Snap.second $t@166@01)))))
(assert (= ($Snap.first ($Snap.second $t@166@01)) $Snap.unit))
; [eval] (unfolding acc(usize(_4), write) in _4.val_int) <= _2 / 2
; [eval] (unfolding acc(usize(_4), write) in _4.val_int)
(push) ; 6
(assert (usize%trigger ($Snap.first $t@157@01) ret@136@01))
(assert (=
  ($Snap.first $t@157@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@157@01))
    ($Snap.second ($Snap.first $t@157@01)))))
(assert (not (= ret@136@01 $Ref.null)))
(assert (= ($Snap.second ($Snap.first $t@157@01)) $Snap.unit))
; [eval] 0 <= self.val_int
(assert (<= 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@157@01)))))
(pop) ; 6
; Joined path conditions
(assert (and
  (usize%trigger ($Snap.first $t@157@01) ret@136@01)
  (=
    ($Snap.first $t@157@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@157@01))
      ($Snap.second ($Snap.first $t@157@01))))
  (not (= ret@136@01 $Ref.null))
  (= ($Snap.second ($Snap.first $t@157@01)) $Snap.unit)
  (<= 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@157@01))))))
; [eval] _2 / 2
(assert (<=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@157@01)))
  (div ret@103@01 2)))
(assert (= ($Snap.second ($Snap.second $t@166@01)) $Snap.unit))
; [eval] (unfolding acc(usize(_4), write) in _4.val_int) > 0
; [eval] (unfolding acc(usize(_4), write) in _4.val_int)
(push) ; 6
; [eval] 0 <= self.val_int
(pop) ; 6
; Joined path conditions
(assert (> ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@157@01))) 0))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; __t6 := true
; [exec]
; __t7 := true
; [exec]
; _18 := builtin$havoc_ref()
(declare-const ret@167@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_18.val_bool, write)
(declare-const $t@168@01 Bool)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@116@01 ret@167@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@121@01 ret@167@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@119@01 ret@167@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@110@01 ret@167@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@161@01 ret@167@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@164@01 ret@167@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@167@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _18.val_bool := false
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@164@01 ret@167@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@161@01 ret@167@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@110@01 ret@167@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@119@01 ret@167@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@121@01 ret@167@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@116@01 ret@167@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t35 := _18.val_bool
; [exec]
; __t8 := true
; [exec]
; __t9 := true
; [exec]
; _23 := builtin$havoc_ref()
(declare-const ret@169@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_23.val_bool, write)
(declare-const $t@170@01 Bool)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@116@01 ret@169@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@121@01 ret@169@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@119@01 ret@169@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@110@01 ret@169@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@161@01 ret@169@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@164@01 ret@169@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@167@01 ret@169@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@169@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _23.val_bool := false
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@167@01 ret@169@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@164@01 ret@169@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@161@01 ret@169@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@110@01 ret@169@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@119@01 ret@169@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@121@01 ret@169@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@116@01 ret@169@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t36 := _23.val_bool
; [exec]
; __t10 := true
; [exec]
; __t11 := true
; [exec]
; _26 := builtin$havoc_ref()
(declare-const ret@171@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_26.tuple_0, write)
(declare-const $t@172@01 $Ref)
(assert (not (= ret@171@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_26.tuple_0.val_int, write)
(declare-const $t@173@01 Int)
(assert (not (= $t@172@01 $Ref.null)))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale acc(_26.tuple_1, write)
(declare-const $t@174@01 $Ref)
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale acc(_26.tuple_1.val_bool, write)
(declare-const $t@175@01 Bool)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@169@01 $t@174@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@167@01 $t@174@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@164@01 $t@174@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@161@01 $t@174@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@110@01 $t@174@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@119@01 $t@174@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@121@01 $t@174@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@116@01 $t@174@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (not (= $t@174@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; unfold acc(usize(_4), write)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= $t@172@01 ret@136@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [eval] 0 <= self.val_int
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
; [exec]
; _26.tuple_0.val_int := _4.val_int - 1
; [eval] _4.val_int - 1
(declare-const val_int@176@01 Int)
(assert (=
  val_int@176@01
  (- ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@157@01))) 1)))
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@136@01 $t@172@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [exec]
; _26.tuple_1.val_bool := false
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@116@01 $t@174@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@121@01 $t@174@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@119@01 $t@174@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@110@01 $t@174@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@161@01 $t@174@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@164@01 $t@174@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@167@01 $t@174@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@169@01 $t@174@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t37 := _26.tuple_1.val_bool
; [exec]
; assert !__t37
; [eval] !__t37
; [exec]
; __t12 := true
; [exec]
; _4 := _26.tuple_0
; [exec]
; label l11
; [exec]
; _28 := builtin$havoc_ref()
(declare-const ret@177@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_28.val_ref, write)
(declare-const $t@178@01 $Ref)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= _1@56@01 ret@177@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@98@01 ret@177@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@177@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _28.val_ref := _1.val_ref
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@98@01 ret@177@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= _1@56@01 ret@177@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [exec]
; label l12
; [exec]
; _29 := builtin$havoc_int()
(declare-const ret@179@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _29 := _4.val_int
; [exec]
; label l13
; [exec]
; _31 := builtin$havoc_int()
(declare-const ret@180@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale _2 >= 0
(declare-const $t@181@01 $Snap)
(assert (= $t@181@01 $Snap.unit))
; [eval] _2 >= 0
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _31 := _2
; [exec]
; label l14
; [exec]
; _32 := builtin$havoc_ref()
(declare-const ret@182@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_32.tuple_0, write)
(declare-const $t@183@01 $Ref)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@171@01 ret@182@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@182@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_32.tuple_0.val_int, write)
(declare-const $t@184@01 Int)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@136@01 $t@183@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= $t@172@01 $t@183@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (not (= $t@183@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_32.tuple_1, write)
(declare-const $t@185@01 $Ref)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@171@01 ret@182@01)))
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
; inhale acc(_32.tuple_1.val_bool, write)
(declare-const $t@186@01 Bool)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= $t@174@01 $t@185@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@116@01 $t@185@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@121@01 $t@185@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@119@01 $t@185@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@110@01 $t@185@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@161@01 $t@185@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@164@01 $t@185@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@167@01 $t@185@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@169@01 $t@185@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (not (= $t@185@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _32.tuple_0.val_int := _31 - 1
; [eval] _31 - 1
(declare-const val_int@187@01 Int)
(assert (= val_int@187@01 (- ret@103@01 1)))
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= $t@172@01 $t@183@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@136@01 $t@183@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [exec]
; _32.tuple_1.val_bool := false
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= $t@174@01 $t@185@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@116@01 $t@185@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@121@01 $t@185@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@119@01 $t@185@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@110@01 $t@185@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@161@01 $t@185@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@164@01 $t@185@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@167@01 $t@185@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@169@01 $t@185@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t38 := _32.tuple_1.val_bool
; [exec]
; assert !__t38
; [eval] !__t38
; [exec]
; __t13 := true
; [exec]
; _30 := _32.tuple_0
; [exec]
; label l15
; [exec]
; label l16
; [exec]
; assert _30.val_int <
;   m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_28.val_ref)) &&
;   (0 <= _29 &&
;   (_29 <
;   m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_28.val_ref)) &&
;   (0 <= _30.val_int &&
;   _30.val_int <
;   m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_28.val_ref)))))
; [eval] _30.val_int < m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_28.val_ref))
; [eval] m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_28.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_28.val_ref)
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
; 0.00s
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
(pop) ; 6
; Joined path conditions
(set-option :timeout 0)
(push) ; 6
(pop) ; 6
; Joined path conditions
(push) ; 6
(assert (not (<
  val_int@187@01
  (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@157@01)))) $t@158@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (<
  val_int@187@01
  (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@157@01)))) $t@158@01))))
; [eval] 0 <= _29
(push) ; 6
(assert (not (<= 0 val_int@176@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (<= 0 val_int@176@01))
; [eval] _29 < m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_28.val_ref))
; [eval] m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_28.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_28.val_ref)
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
; 0.00s
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
(pop) ; 6
; Joined path conditions
(set-option :timeout 0)
(push) ; 6
(pop) ; 6
; Joined path conditions
(push) ; 6
(assert (not (<
  val_int@176@01
  (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@157@01)))) $t@158@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (<
  val_int@176@01
  (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@157@01)))) $t@158@01))))
; [eval] 0 <= _30.val_int
(push) ; 6
(assert (not (<= 0 val_int@187@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (<= 0 val_int@187@01))
; [eval] _30.val_int < m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_28.val_ref))
; [eval] m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_28.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_28.val_ref)
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
; 0.00s
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
(pop) ; 6
; Joined path conditions
(set-option :timeout 0)
(push) ; 6
(pop) ; 6
; Joined path conditions
; [exec]
; assert true
; [exec]
; assert _29 >= 0
; [eval] _29 >= 0
(push) ; 6
(assert (not (>= val_int@176@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (>= val_int@176@01 0))
; [exec]
; fold acc(usize(_30), write)
; [eval] 0 <= self.val_int
(assert (usize%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap val_int@187@01)
  $Snap.unit) $t@183@01))
; [exec]
; exhale acc(_28.val_ref, write) &&
;   (acc(struct$m_VecWrapperI32(_28.val_ref), write) &&
;   (_29 >= 0 && acc(usize(_30), write)))
; [eval] _29 >= 0
; [exec]
; _27 := builtin$havoc_ref()
(declare-const ret@188@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(struct$m_VecWrapperI32(old[l16](_28.val_ref)), write)
; [eval] old[l16](_28.val_ref)
(declare-const $t@189@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(tuple0$(_27), write)
(declare-const $t@190@01 $Snap)
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale true
(declare-const $t@191@01 $Snap)
(assert (= $t@191@01 $Snap.unit))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(old[l16](_28.val_ref))) ==
;   old[l16](m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_28.val_ref)))
(declare-const $t@192@01 $Snap)
(assert (= $t@192@01 $Snap.unit))
; [eval] m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(old[l16](_28.val_ref))) == old[l16](m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_28.val_ref)))
; [eval] m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(old[l16](_28.val_ref)))
; [eval] snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(old[l16](_28.val_ref))
; [eval] old[l16](_28.val_ref)
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
; 0.00s
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
(assert (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32%precondition $t@189@01 $t@158@01))
(pop) ; 6
; Joined path conditions
(assert (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32%precondition $t@189@01 $t@158@01))
(set-option :timeout 0)
(push) ; 6
(assert (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 $t@189@01 $t@158@01)))
(pop) ; 6
; Joined path conditions
(assert (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 $t@189@01 $t@158@01)))
; [eval] old[l16](m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_28.val_ref)))
; [eval] m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_28.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_28.val_ref)
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
; 0.00s
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
(pop) ; 6
; Joined path conditions
(set-option :timeout 0)
(push) ; 6
(pop) ; 6
; Joined path conditions
(assert (=
  (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 $t@189@01 $t@158@01))
  (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@157@01)))) $t@158@01))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label l17
; [exec]
; __t14 := true
; [exec]
; _33 := builtin$havoc_int()
(declare-const ret@193@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _33 := _4.val_int
; [exec]
; label l19
; [exec]
; _7.val_bool := _33 > 0
; [eval] _33 > 0
(declare-const val_bool@194@01 Bool)
(assert (= val_bool@194@01 (> val_int@176@01 0)))
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= $t@185@01 ret@116@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= $t@174@01 ret@116@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@121@01 ret@116@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@119@01 ret@116@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@110@01 ret@116@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@161@01 ret@116@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@164@01 ret@116@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@167@01 ret@116@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@169@01 ret@116@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t3 := true
; [exec]
; __t4 := true
; [exec]
; _11 := builtin$havoc_ref()
(declare-const ret@195@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_11.val_bool, write)
(declare-const $t@196@01 Bool)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@169@01 ret@195@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@167@01 ret@195@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@164@01 ret@195@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@161@01 ret@195@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@110@01 ret@195@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@119@01 ret@195@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@121@01 ret@195@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= $t@174@01 ret@195@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= $t@185@01 ret@195@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@116@01 ret@195@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@195@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _11.val_bool := _7.val_bool
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@116@01 ret@195@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= $t@185@01 ret@195@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= $t@174@01 ret@195@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@121@01 ret@195@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@119@01 ret@195@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@110@01 ret@195@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@161@01 ret@195@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@164@01 ret@195@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@167@01 ret@195@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@169@01 ret@195@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [exec]
; label l20
; [exec]
; __t39 := _11.val_bool
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not val_bool@194@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not val_bool@194@01))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [then-branch: 4 | val_bool@194@01 | live]
; [else-branch: 4 | !(val_bool@194@01) | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 4 | val_bool@194@01]
(assert val_bool@194@01)
; [exec]
; label loop3_inv_post_fnspc
; [exec]
; __t5 := true
; [exec]
; _13 := builtin$havoc_ref()
(declare-const ret@197@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_13.val_bool, write)
(declare-const $t@198@01 Bool)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@169@01 ret@197@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@167@01 ret@197@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@164@01 ret@197@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@161@01 ret@197@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@110@01 ret@197@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@119@01 ret@197@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@121@01 ret@197@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@174@01 ret@197@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@185@01 ret@197@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@116@01 ret@197@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@195@01 ret@197@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@197@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _13.val_bool := false
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@195@01 ret@197@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@116@01 ret@197@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@185@01 ret@197@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@174@01 ret@197@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@121@01 ret@197@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@119@01 ret@197@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@110@01 ret@197@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@161@01 ret@197@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@164@01 ret@197@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@167@01 ret@197@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@169@01 ret@197@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t40 := _13.val_bool
; [exec]
; fold acc(usize(_4), write)
; [eval] 0 <= self.val_int
(assert (usize%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap val_int@176@01)
  $Snap.unit) $t@172@01))
; [exec]
; fold acc(bool(_7), write)
(assert (bool%trigger ($SortWrappers.BoolTo$Snap val_bool@194@01) ret@116@01))
; [exec]
; assert _2 >= 0
; [eval] _2 >= 0
; [exec]
; assert _2 ==
;   m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_1.val_ref)) &&
;   ((unfolding acc(usize(_4), write) in _4.val_int) <= _2 / 2 &&
;   (unfolding acc(usize(_4), write) in _4.val_int) > 0)
; [eval] _2 == m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_1.val_ref))
; [eval] m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_1.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_1.val_ref)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
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
(pop) ; 7
; Joined path conditions
(set-option :timeout 0)
(push) ; 7
(pop) ; 7
; Joined path conditions
(push) ; 7
(assert (not (=
  ret@103@01
  (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 $t@189@01 $t@158@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (=
  ret@103@01
  (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 $t@189@01 $t@158@01))))
; [eval] (unfolding acc(usize(_4), write) in _4.val_int) <= _2 / 2
; [eval] (unfolding acc(usize(_4), write) in _4.val_int)
(push) ; 7
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@136@01 $t@172@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [eval] 0 <= self.val_int
(pop) ; 7
; Joined path conditions
; [eval] _2 / 2
(set-option :timeout 0)
(push) ; 7
(assert (not (<= val_int@176@01 (div ret@103@01 2))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (<= val_int@176@01 (div ret@103@01 2)))
; [eval] (unfolding acc(usize(_4), write) in _4.val_int) > 0
; [eval] (unfolding acc(usize(_4), write) in _4.val_int)
(push) ; 7
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@136@01 $t@172@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [eval] 0 <= self.val_int
(pop) ; 7
; Joined path conditions
(set-option :timeout 0)
(push) ; 7
(assert (not (> val_int@176@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (> val_int@176@01 0))
; [exec]
; assert true
; [exec]
; assert _preserve$0 == _1.val_ref
; [eval] _preserve$0 == _1.val_ref
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(usize(_4), write) &&
;   (acc(bool(_7), write) &&
;   (acc(_1.val_ref, read$()) &&
;   (acc(struct$m_VecWrapperI32(_1.val_ref), write) && _2 >= 0)))
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
      (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
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
      (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
        (read$ $Snap.unit))
      (read$ $Snap.unit)))))
(assert (<=
  (-
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
        (read$ $Snap.unit))
      (read$ $Snap.unit)))
  $Perm.Write))
(assert (=>
  (<
    $Perm.No
    (-
      (+
        (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
          (read$ $Snap.unit))
        (read$ $Snap.unit))))
  (not (= _1@56@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 7
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
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
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [eval] _2 >= 0
; [exec]
; inhale false
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 4 | !(val_bool@194@01)]
(assert (not val_bool@194@01))
(pop) ; 6
; [eval] !__t39
(push) ; 6
(set-option :timeout 10)
(assert (not val_bool@194@01))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not val_bool@194@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [then-branch: 5 | !(val_bool@194@01) | live]
; [else-branch: 5 | val_bool@194@01 | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 5 | !(val_bool@194@01)]
(assert (not val_bool@194@01))
; [exec]
; label bb2
; [exec]
; label loop3_start
; [exec]
; __t15 := true
; [exec]
; _37 := builtin$havoc_ref()
(declare-const ret@199@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_37.val_int, write)
(declare-const $t@200@01 Int)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@172@01 ret@199@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@136@01 ret@199@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@199@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _37.val_int := _2
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@136@01 ret@199@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@172@01 ret@199@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [exec]
; label l23
; [exec]
; _39 := builtin$havoc_int()
(declare-const ret@201@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _39 := _37.val_int
; [exec]
; label l24
; [exec]
; _38 := builtin$havoc_ref()
(declare-const ret@202@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(_38.val_bool, write)
(declare-const $t@203@01 Bool)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@169@01 ret@202@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@167@01 ret@202@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@164@01 ret@202@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@161@01 ret@202@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@110@01 ret@202@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@119@01 ret@202@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@121@01 ret@202@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@174@01 ret@202@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@185@01 ret@202@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@116@01 ret@202@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@195@01 ret@202@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@202@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _38.val_bool := _39 > 1
; [eval] _39 > 1
(declare-const val_bool@204@01 Bool)
(assert (= val_bool@204@01 (> ret@103@01 1)))
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@195@01 ret@202@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@116@01 ret@202@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@185@01 ret@202@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@174@01 ret@202@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@121@01 ret@202@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@119@01 ret@202@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@110@01 ret@202@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@161@01 ret@202@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@164@01 ret@202@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@167@01 ret@202@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@169@01 ret@202@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t16 := true
; [exec]
; __t17 := true
; [exec]
; _40 := builtin$havoc_ref()
(declare-const ret@205@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_40.val_bool, write)
(declare-const $t@206@01 Bool)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@169@01 ret@205@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@167@01 ret@205@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@164@01 ret@205@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@161@01 ret@205@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@110@01 ret@205@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@119@01 ret@205@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@121@01 ret@205@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@174@01 ret@205@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@185@01 ret@205@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@116@01 ret@205@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@195@01 ret@205@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@202@01 ret@205@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@205@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _40.val_bool := _38.val_bool
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@202@01 ret@205@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@195@01 ret@205@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@116@01 ret@205@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@185@01 ret@205@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@174@01 ret@205@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@121@01 ret@205@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@119@01 ret@205@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@110@01 ret@205@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@161@01 ret@205@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@164@01 ret@205@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@167@01 ret@205@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@169@01 ret@205@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [exec]
; label l25
; [exec]
; __t41 := _40.val_bool
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not val_bool@204@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not val_bool@204@01))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [then-branch: 6 | val_bool@204@01 | live]
; [else-branch: 6 | !(val_bool@204@01) | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 6 | val_bool@204@01]
(assert val_bool@204@01)
; [exec]
; label loop3_group1_bb4
; [exec]
; __t18 := true
; [exec]
; _42 := builtin$havoc_ref()
(declare-const ret@207@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_42.val_bool, write)
(declare-const $t@208@01 Bool)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@169@01 ret@207@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@167@01 ret@207@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@164@01 ret@207@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@161@01 ret@207@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@110@01 ret@207@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@119@01 ret@207@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@121@01 ret@207@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= $t@174@01 ret@207@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= $t@185@01 ret@207@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@116@01 ret@207@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@195@01 ret@207@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@202@01 ret@207@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@205@01 ret@207@01)))
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
; _42.val_bool := false
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@205@01 ret@207@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@202@01 ret@207@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@195@01 ret@207@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@116@01 ret@207@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= $t@185@01 ret@207@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= $t@174@01 ret@207@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@121@01 ret@207@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@119@01 ret@207@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@110@01 ret@207@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@161@01 ret@207@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@164@01 ret@207@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@167@01 ret@207@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@169@01 ret@207@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t42 := _42.val_bool
; [exec]
; _preserve$1 := _1.val_ref
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [exec]
; fold acc(usize(_37), write)
; [eval] 0 <= self.val_int
(set-option :timeout 0)
(push) ; 8
(assert (not (<= 0 ret@103@01)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (<= 0 ret@103@01))
(assert (usize%trigger ($Snap.combine ($SortWrappers.IntTo$Snap ret@103@01) $Snap.unit) ret@199@01))
; [exec]
; fold acc(bool(_38), write)
(assert (bool%trigger ($SortWrappers.BoolTo$Snap val_bool@204@01) ret@202@01))
; [exec]
; assert _2 >= 0
; [eval] _2 >= 0
; [exec]
; assert _2 ==
;   m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_1.val_ref)) &&
;   ((unfolding acc(usize(_37), write) in _37.val_int) <= _2 &&
;   (unfolding acc(usize(_37), write) in _37.val_int) > 1)
; [eval] _2 == m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_1.val_ref))
; [eval] m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_1.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_1.val_ref)
(push) ; 8
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
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
(assert (not (= (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(assert (not (or
  (= (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No)
  (< (- (read$ $Snap.unit) ($Perm.min $Perm.Write (read$ $Snap.unit))) $Perm.No))))
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
(pop) ; 8
; Joined path conditions
(push) ; 8
(assert (not (=
  ret@103@01
  (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 $t@189@01 $t@158@01)))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (=
  ret@103@01
  (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 $t@189@01 $t@158@01))))
; [eval] (unfolding acc(usize(_37), write) in _37.val_int) <= _2
; [eval] (unfolding acc(usize(_37), write) in _37.val_int)
(push) ; 8
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@172@01 ret@199@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@136@01 ret@199@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [eval] 0 <= self.val_int
(pop) ; 8
; Joined path conditions
; [eval] (unfolding acc(usize(_37), write) in _37.val_int) > 1
; [eval] (unfolding acc(usize(_37), write) in _37.val_int)
(set-option :timeout 0)
(push) ; 8
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@172@01 ret@199@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@136@01 ret@199@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [eval] 0 <= self.val_int
(pop) ; 8
; Joined path conditions
(set-option :timeout 0)
(push) ; 8
(assert (not (> ret@103@01 1)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (> ret@103@01 1))
; [exec]
; assert true
; [exec]
; assert _preserve$1 == _1.val_ref
; [eval] _preserve$1 == _1.val_ref
(push) ; 8
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(usize(_37), write) &&
;   (acc(bool(_38), write) &&
;   (acc(_1.val_ref, read$()) &&
;   (acc(struct$m_VecWrapperI32(_1.val_ref), write) && _2 >= 0)))
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
      (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
        (read$ $Snap.unit))
      (read$ $Snap.unit)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (<=
  $Perm.No
  (-
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
        (read$ $Snap.unit))
      (read$ $Snap.unit)))))
(assert (<=
  (-
    (+
      (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
        (read$ $Snap.unit))
      (read$ $Snap.unit)))
  $Perm.Write))
(assert (=>
  (<
    $Perm.No
    (-
      (+
        (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
          (read$ $Snap.unit))
        (read$ $Snap.unit))))
  (not (= _1@56@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 8
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
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
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [eval] _2 >= 0
; [exec]
; _37 := builtin$havoc_ref()
(declare-const ret@209@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _40 := builtin$havoc_ref()
(declare-const ret@210@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _42 := builtin$havoc_ref()
(declare-const ret@211@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _47 := builtin$havoc_ref()
(declare-const ret@212@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _52 := builtin$havoc_ref()
(declare-const ret@213@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _55 := builtin$havoc_ref()
(declare-const ret@214@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _56 := builtin$havoc_int()
(declare-const ret@215@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _57 := builtin$havoc_ref()
(declare-const ret@216@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _58 := builtin$havoc_ref()
(declare-const ret@217@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _59 := builtin$havoc_int()
(declare-const ret@218@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _60 := builtin$havoc_int()
(declare-const ret@219@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _61 := builtin$havoc_ref()
(declare-const ret@220@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _62 := builtin$havoc_ref()
(declare-const ret@221@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _63 := builtin$havoc_int()
(declare-const ret@222@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _64 := builtin$havoc_ref()
(declare-const ret@223@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _65 := builtin$havoc_int()
(declare-const ret@224@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _66 := builtin$havoc_ref()
(declare-const ret@225@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _67 := builtin$havoc_int()
(declare-const ret@226@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t16 := builtin$havoc_bool()
(declare-const ret@227@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t17 := builtin$havoc_bool()
(declare-const ret@228@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t18 := builtin$havoc_bool()
(declare-const ret@229@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t19 := builtin$havoc_bool()
(declare-const ret@230@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t20 := builtin$havoc_bool()
(declare-const ret@231@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t21 := builtin$havoc_bool()
(declare-const ret@232@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t22 := builtin$havoc_bool()
(declare-const ret@233@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t23 := builtin$havoc_bool()
(declare-const ret@234@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t24 := builtin$havoc_bool()
(declare-const ret@235@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t25 := builtin$havoc_bool()
(declare-const ret@236@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t26 := builtin$havoc_bool()
(declare-const ret@237@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t27 := builtin$havoc_bool()
(declare-const ret@238@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t28 := builtin$havoc_bool()
(declare-const ret@239@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t43 := builtin$havoc_bool()
(declare-const ret@240@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t44 := builtin$havoc_bool()
(declare-const ret@241@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t45 := builtin$havoc_bool()
(declare-const ret@242@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t46 := builtin$havoc_bool()
(declare-const ret@243@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t47 := builtin$havoc_bool()
(declare-const ret@244@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t48 := builtin$havoc_bool()
(declare-const ret@245@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t49 := builtin$havoc_bool()
(declare-const ret@246@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; __t50 := builtin$havoc_bool()
(declare-const ret@247@01 Bool)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(usize(_37), write) &&
;   (acc(bool(_38), write) &&
;   (acc(_1.val_ref, read$()) &&
;   (acc(struct$m_VecWrapperI32(_1.val_ref), write) && _2 >= 0)))
(declare-const $t@248@01 $Snap)
(assert (= $t@248@01 ($Snap.combine ($Snap.first $t@248@01) ($Snap.second $t@248@01))))
(assert (=
  ($Snap.second $t@248@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@248@01))
    ($Snap.second ($Snap.second $t@248@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@248@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@248@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@248@01))))))
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
(declare-const $t@249@01 $Ref)
(assert (and
  (=>
    (<
      $Perm.No
      (-
        (+
          (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
            (read$ $Snap.unit))
          (read$ $Snap.unit))))
    (= $t@249@01 $t@158@01))
  (=>
    (< $Perm.No (read$ $Snap.unit))
    (=
      $t@249@01
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second $t@248@01))))))))
(assert (<=
  $Perm.No
  (+
    (-
      (+
        (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    (read$ $Snap.unit))))
(assert (<=
  (+
    (-
      (+
        (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    (read$ $Snap.unit))
  $Perm.Write))
(assert (=>
  (<
    $Perm.No
    (+
      (-
        (+
          (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      (read$ $Snap.unit)))
  (not (= _1@56@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@248@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@248@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@248@01)))))))
(push) ; 8
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (-
      (+
        (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@248@01))))
  $Snap.unit))
; [eval] _2 >= 0
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale _preserve$1 == _1.val_ref
(declare-const $t@250@01 $Snap)
(assert (= $t@250@01 $Snap.unit))
; [eval] _preserve$1 == _1.val_ref
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (-
      (+
        (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (= $t@158@01 $t@249@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale true
(declare-const $t@251@01 $Snap)
(assert (= $t@251@01 $Snap.unit))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; __t16 := true
; [exec]
; __t17 := true
; [exec]
; _40 := builtin$havoc_ref()
(declare-const ret@252@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_40.val_bool, write)
(declare-const $t@253@01 Bool)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@169@01 ret@252@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@167@01 ret@252@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@164@01 ret@252@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@161@01 ret@252@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@110@01 ret@252@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@119@01 ret@252@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@121@01 ret@252@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= $t@174@01 ret@252@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= $t@185@01 ret@252@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@116@01 ret@252@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@195@01 ret@252@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@205@01 ret@252@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@207@01 ret@252@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@252@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; unfold acc(bool(_38), write)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@207@01 ret@202@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@205@01 ret@202@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@195@01 ret@202@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@116@01 ret@202@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= $t@185@01 ret@202@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= $t@174@01 ret@202@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@121@01 ret@202@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@119@01 ret@202@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@110@01 ret@202@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@161@01 ret@202@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@164@01 ret@202@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@167@01 ret@202@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@169@01 ret@202@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@252@01 ret@202@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (bool%trigger ($Snap.first ($Snap.second $t@248@01)) ret@202@01))
; [exec]
; _40.val_bool := _38.val_bool
(declare-const val_bool@254@01 Bool)
(assert (=
  val_bool@254@01
  ($SortWrappers.$SnapToBool ($Snap.first ($Snap.second $t@248@01)))))
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@169@01 ret@252@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@167@01 ret@252@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@164@01 ret@252@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@161@01 ret@252@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@110@01 ret@252@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@119@01 ret@252@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@121@01 ret@252@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= $t@174@01 ret@252@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= $t@185@01 ret@252@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@116@01 ret@252@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@195@01 ret@252@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@205@01 ret@252@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@207@01 ret@252@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@202@01 ret@252@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [exec]
; label l28
; [exec]
; __t43 := _40.val_bool
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not val_bool@254@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not val_bool@254@01))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [then-branch: 7 | val_bool@254@01 | live]
; [else-branch: 7 | !(val_bool@254@01) | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 7 | val_bool@254@01]
(assert val_bool@254@01)
; [exec]
; label l7
; [exec]
; __t18 := true
; [exec]
; _42 := builtin$havoc_ref()
(declare-const ret@255@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_42.val_bool, write)
(declare-const $t@256@01 Bool)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@202@01 ret@255@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@207@01 ret@255@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@205@01 ret@255@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@195@01 ret@255@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@116@01 ret@255@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@185@01 ret@255@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@174@01 ret@255@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@121@01 ret@255@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@119@01 ret@255@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@110@01 ret@255@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@161@01 ret@255@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@164@01 ret@255@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@167@01 ret@255@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@169@01 ret@255@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@252@01 ret@255@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@255@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _42.val_bool := false
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@252@01 ret@255@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@169@01 ret@255@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@167@01 ret@255@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@164@01 ret@255@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@161@01 ret@255@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@110@01 ret@255@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@119@01 ret@255@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@121@01 ret@255@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@174@01 ret@255@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@185@01 ret@255@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@116@01 ret@255@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@195@01 ret@255@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@205@01 ret@255@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@207@01 ret@255@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@202@01 ret@255@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t44 := _42.val_bool
; [exec]
; inhale _2 ==
;   m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_1.val_ref)) &&
;   ((unfolding acc(usize(_37), write) in _37.val_int) <= _2 &&
;   (unfolding acc(usize(_37), write) in _37.val_int) > 1)
(declare-const $t@257@01 $Snap)
(assert (= $t@257@01 ($Snap.combine ($Snap.first $t@257@01) ($Snap.second $t@257@01))))
(assert (= ($Snap.first $t@257@01) $Snap.unit))
; [eval] _2 == m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_1.val_ref))
; [eval] m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_1.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_1.val_ref)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (-
      (+
        (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
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
(assert (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@248@01)))) $t@249@01))
(pop) ; 9
; Joined path conditions
(assert (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32%precondition ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@248@01)))) $t@249@01))
(set-option :timeout 0)
(push) ; 9
(assert (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@248@01)))) $t@249@01)))
(pop) ; 9
; Joined path conditions
(assert (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@248@01)))) $t@249@01)))
(assert (=
  ret@103@01
  (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@248@01)))) $t@249@01))))
(assert (=
  ($Snap.second $t@257@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@257@01))
    ($Snap.second ($Snap.second $t@257@01)))))
(assert (= ($Snap.first ($Snap.second $t@257@01)) $Snap.unit))
; [eval] (unfolding acc(usize(_37), write) in _37.val_int) <= _2
; [eval] (unfolding acc(usize(_37), write) in _37.val_int)
(push) ; 9
(assert (usize%trigger ($Snap.first $t@248@01) ret@209@01))
(assert (=
  ($Snap.first $t@248@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@248@01))
    ($Snap.second ($Snap.first $t@248@01)))))
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@136@01 ret@209@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@172@01 ret@209@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@209@01 $Ref.null)))
(assert (= ($Snap.second ($Snap.first $t@248@01)) $Snap.unit))
; [eval] 0 <= self.val_int
(assert (<= 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@248@01)))))
(pop) ; 9
; Joined path conditions
(assert (and
  (usize%trigger ($Snap.first $t@248@01) ret@209@01)
  (=
    ($Snap.first $t@248@01)
    ($Snap.combine
      ($Snap.first ($Snap.first $t@248@01))
      ($Snap.second ($Snap.first $t@248@01))))
  (not (= ret@209@01 $Ref.null))
  (= ($Snap.second ($Snap.first $t@248@01)) $Snap.unit)
  (<= 0 ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@248@01))))))
(assert (<= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@248@01))) ret@103@01))
(assert (= ($Snap.second ($Snap.second $t@257@01)) $Snap.unit))
; [eval] (unfolding acc(usize(_37), write) in _37.val_int) > 1
; [eval] (unfolding acc(usize(_37), write) in _37.val_int)
(set-option :timeout 0)
(push) ; 9
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@136@01 ret@209@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@172@01 ret@209@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [eval] 0 <= self.val_int
(pop) ; 9
; Joined path conditions
(assert (> ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@248@01))) 1))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; __t19 := true
; [exec]
; __t20 := true
; [exec]
; _47 := builtin$havoc_ref()
(declare-const ret@258@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_47.val_bool, write)
(declare-const $t@259@01 Bool)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@202@01 ret@258@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@207@01 ret@258@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@205@01 ret@258@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@195@01 ret@258@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@116@01 ret@258@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@185@01 ret@258@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@174@01 ret@258@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@121@01 ret@258@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@119@01 ret@258@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@110@01 ret@258@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@161@01 ret@258@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@164@01 ret@258@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@167@01 ret@258@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@169@01 ret@258@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@252@01 ret@258@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@255@01 ret@258@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@258@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _47.val_bool := false
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@255@01 ret@258@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@252@01 ret@258@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@169@01 ret@258@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@167@01 ret@258@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@164@01 ret@258@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@161@01 ret@258@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@110@01 ret@258@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@119@01 ret@258@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@121@01 ret@258@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@174@01 ret@258@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@185@01 ret@258@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@116@01 ret@258@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@195@01 ret@258@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@205@01 ret@258@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@207@01 ret@258@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@202@01 ret@258@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t45 := _47.val_bool
; [exec]
; __t21 := true
; [exec]
; __t22 := true
; [exec]
; _52 := builtin$havoc_ref()
(declare-const ret@260@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_52.val_bool, write)
(declare-const $t@261@01 Bool)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@202@01 ret@260@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@207@01 ret@260@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@205@01 ret@260@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@195@01 ret@260@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@116@01 ret@260@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@185@01 ret@260@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@174@01 ret@260@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@121@01 ret@260@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@119@01 ret@260@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@110@01 ret@260@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@161@01 ret@260@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@164@01 ret@260@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@167@01 ret@260@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@169@01 ret@260@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@252@01 ret@260@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@255@01 ret@260@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@258@01 ret@260@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@260@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _52.val_bool := false
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@258@01 ret@260@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@255@01 ret@260@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@252@01 ret@260@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@169@01 ret@260@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@167@01 ret@260@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@164@01 ret@260@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@161@01 ret@260@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@110@01 ret@260@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@119@01 ret@260@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@121@01 ret@260@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@174@01 ret@260@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@185@01 ret@260@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@116@01 ret@260@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@195@01 ret@260@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@205@01 ret@260@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@207@01 ret@260@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@202@01 ret@260@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t46 := _52.val_bool
; [exec]
; __t23 := true
; [exec]
; __t24 := true
; [exec]
; _55 := builtin$havoc_ref()
(declare-const ret@262@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_55.tuple_0, write)
(declare-const $t@263@01 $Ref)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@171@01 ret@262@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@182@01 ret@262@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@262@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_55.tuple_0.val_int, write)
(declare-const $t@264@01 Int)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@172@01 $t@263@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@136@01 $t@263@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (not (= $t@263@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_55.tuple_1, write)
(declare-const $t@265@01 $Ref)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@171@01 ret@262@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@182@01 ret@262@01)))
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
; inhale acc(_55.tuple_1.val_bool, write)
(declare-const $t@266@01 Bool)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@260@01 $t@265@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@258@01 $t@265@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@255@01 $t@265@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@252@01 $t@265@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@169@01 $t@265@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@167@01 $t@265@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@164@01 $t@265@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@161@01 $t@265@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@110@01 $t@265@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@119@01 $t@265@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@121@01 $t@265@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@174@01 $t@265@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@185@01 $t@265@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@116@01 $t@265@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@195@01 $t@265@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@205@01 $t@265@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@207@01 $t@265@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@202@01 $t@265@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (not (= $t@265@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; unfold acc(usize(_37), write)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@136@01 ret@209@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@172@01 ret@209@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@263@01 ret@209@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [eval] 0 <= self.val_int
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
; [exec]
; _55.tuple_0.val_int := _37.val_int - 1
; [eval] _37.val_int - 1
(declare-const val_int@267@01 Int)
(assert (=
  val_int@267@01
  (- ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first $t@248@01))) 1)))
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@172@01 $t@263@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@136@01 $t@263@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@209@01 $t@263@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [exec]
; _55.tuple_1.val_bool := false
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@202@01 $t@265@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@207@01 $t@265@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@205@01 $t@265@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@195@01 $t@265@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@116@01 $t@265@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@185@01 $t@265@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@174@01 $t@265@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@121@01 $t@265@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@119@01 $t@265@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@110@01 $t@265@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@161@01 $t@265@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@164@01 $t@265@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@167@01 $t@265@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@169@01 $t@265@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@252@01 $t@265@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@255@01 $t@265@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@258@01 $t@265@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@260@01 $t@265@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t47 := _55.tuple_1.val_bool
; [exec]
; assert !__t47
; [eval] !__t47
; [exec]
; __t25 := true
; [exec]
; _37 := _55.tuple_0
; [exec]
; label l31
; [exec]
; _56 := builtin$havoc_int()
(declare-const ret@268@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _56 := 0
; [exec]
; _58 := builtin$havoc_ref()
(declare-const ret@269@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(_58.val_ref, write)
(declare-const $t@270@01 $Ref)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= _1@56@01 ret@269@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@98@01 ret@269@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@269@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _58.val_ref := _1.val_ref
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (-
      (+
        (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@98@01 ret@269@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= _1@56@01 ret@269@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [exec]
; label l32
; [exec]
; _59 := builtin$havoc_int()
(declare-const ret@271@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _59 := _56
; [exec]
; label l33
; [exec]
; _60 := builtin$havoc_int()
(declare-const ret@272@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _60 := _37.val_int
; [exec]
; label l34
; [exec]
; label l35
; [exec]
; assert 0 <= _59 &&
;   (_59 <
;   m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_58.val_ref)) &&
;   (0 <= _60 &&
;   _60 <
;   m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_58.val_ref))))
; [eval] 0 <= _59
; [eval] _59 < m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_58.val_ref))
; [eval] m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_58.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_58.val_ref)
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
(assert (not (<
  0
  (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@248@01)))) $t@249@01)))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (<
  0
  (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@248@01)))) $t@249@01))))
; [eval] 0 <= _60
(push) ; 9
(assert (not (<= 0 val_int@267@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (<= 0 val_int@267@01))
; [eval] _60 < m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_58.val_ref))
; [eval] m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_58.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_58.val_ref)
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
(assert (not (<
  val_int@267@01
  (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@248@01)))) $t@249@01)))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (<
  val_int@267@01
  (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@248@01)))) $t@249@01))))
; [exec]
; assert true
; [exec]
; assert _59 >= 0
; [eval] _59 >= 0
; [exec]
; assert _60 >= 0
; [eval] _60 >= 0
(push) ; 9
(assert (not (>= val_int@267@01 0)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (>= val_int@267@01 0))
; [exec]
; exhale acc(_58.val_ref, write) &&
;   (acc(struct$m_VecWrapperI32(_58.val_ref), write) &&
;   (_59 >= 0 && _60 >= 0))
; [eval] _59 >= 0
; [eval] _60 >= 0
; [exec]
; _57 := builtin$havoc_ref()
(declare-const ret@273@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(struct$m_VecWrapperI32(old[l35](_58.val_ref)), write)
; [eval] old[l35](_58.val_ref)
(declare-const $t@274@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(tuple0$(_57), write)
(declare-const $t@275@01 $Snap)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@273@01)))
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
(declare-const $t@276@01 $Snap)
(assert (= $t@276@01 $Snap.unit))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(old[l35](_58.val_ref))) ==
;   old[l35](m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_58.val_ref))) &&
;   (m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(old[l35](_58.val_ref)),
;   old[l35](_59)) ==
;   old[l35](m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_58.val_ref),
;   _60)) &&
;   (m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(old[l35](_58.val_ref)),
;   old[l35](_60)) ==
;   old[l35](m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_58.val_ref),
;   _59)) &&
;   (forall _0_quant_0: Int ::
;     { m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(old[l35](_58.val_ref)),
;     _0_quant_0) }
;     { old[l35](m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_58.val_ref),
;     _0_quant_0)) }
;     0 <= _0_quant_0 ==>
;     !(0 <= _0_quant_0) ||
;     (!(_0_quant_0 <
;     m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(old[l35](_58.val_ref)))) ||
;     (_0_quant_0 == old[l35](_59) ||
;     (_0_quant_0 == old[l35](_60) ||
;     m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(old[l35](_58.val_ref)),
;     _0_quant_0) ==
;     old[l35](m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_58.val_ref),
;     _0_quant_0))))))))
(declare-const $t@277@01 $Snap)
(assert (= $t@277@01 ($Snap.combine ($Snap.first $t@277@01) ($Snap.second $t@277@01))))
(assert (= ($Snap.first $t@277@01) $Snap.unit))
; [eval] m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(old[l35](_58.val_ref))) == old[l35](m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_58.val_ref)))
; [eval] m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(old[l35](_58.val_ref)))
; [eval] snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(old[l35](_58.val_ref))
; [eval] old[l35](_58.val_ref)
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
(assert (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32%precondition $t@274@01 $t@249@01))
(pop) ; 9
; Joined path conditions
(assert (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32%precondition $t@274@01 $t@249@01))
(set-option :timeout 0)
(push) ; 9
(assert (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 $t@274@01 $t@249@01)))
(pop) ; 9
; Joined path conditions
(assert (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 $t@274@01 $t@249@01)))
; [eval] old[l35](m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_58.val_ref)))
; [eval] m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_58.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_58.val_ref)
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
  (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 $t@274@01 $t@249@01))
  (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@248@01)))) $t@249@01))))
(assert (=
  ($Snap.second $t@277@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@277@01))
    ($Snap.second ($Snap.second $t@277@01)))))
(assert (= ($Snap.first ($Snap.second $t@277@01)) $Snap.unit))
; [eval] m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(old[l35](_58.val_ref)), old[l35](_59)) == old[l35](m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_58.val_ref), _60))
; [eval] m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(old[l35](_58.val_ref)), old[l35](_59))
; [eval] snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(old[l35](_58.val_ref))
; [eval] old[l35](_58.val_ref)
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
; [eval] old[l35](_59)
(set-option :timeout 0)
(push) ; 9
; [eval] 0 <= _2
; [eval] _2 < m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(_1)
; [eval] m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(_1)
(push) ; 10
(pop) ; 10
; Joined path conditions
(push) ; 10
(assert (not (<
  0
  (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 $t@274@01 $t@249@01)))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (<
  0
  (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 $t@274@01 $t@249@01))))
; [eval] 0 <= _2
(assert (m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 $t@274@01 $t@249@01) 0))
(pop) ; 9
; Joined path conditions
(assert (and
  (<
    0
    (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 $t@274@01 $t@249@01)))
  (m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 $t@274@01 $t@249@01) 0)))
; [eval] old[l35](m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_58.val_ref), _60))
; [eval] m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_58.val_ref), _60)
; [eval] snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_58.val_ref)
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
; [eval] _2 < m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(_1)
; [eval] m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(_1)
(push) ; 10
(pop) ; 10
; Joined path conditions
; [eval] 0 <= _2
(assert (m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@248@01)))) $t@249@01) val_int@267@01))
(pop) ; 9
; Joined path conditions
(assert (m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@248@01)))) $t@249@01) val_int@267@01))
(assert (=
  (m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$ ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 $t@274@01 $t@249@01) 0)
  (m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$ ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@248@01)))) $t@249@01) val_int@267@01)))
(assert (=
  ($Snap.second ($Snap.second $t@277@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@277@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@277@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@277@01))) $Snap.unit))
; [eval] m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(old[l35](_58.val_ref)), old[l35](_60)) == old[l35](m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_58.val_ref), _59))
; [eval] m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(old[l35](_58.val_ref)), old[l35](_60))
; [eval] snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(old[l35](_58.val_ref))
; [eval] old[l35](_58.val_ref)
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
; [eval] old[l35](_60)
(set-option :timeout 0)
(push) ; 9
; [eval] 0 <= _2
; [eval] _2 < m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(_1)
; [eval] m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(_1)
(push) ; 10
(pop) ; 10
; Joined path conditions
(push) ; 10
(assert (not (<
  val_int@267@01
  (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 $t@274@01 $t@249@01)))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (<
  val_int@267@01
  (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 $t@274@01 $t@249@01))))
; [eval] 0 <= _2
(assert (m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 $t@274@01 $t@249@01) val_int@267@01))
(pop) ; 9
; Joined path conditions
(assert (and
  (<
    val_int@267@01
    (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 $t@274@01 $t@249@01)))
  (m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 $t@274@01 $t@249@01) val_int@267@01)))
; [eval] old[l35](m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_58.val_ref), _59))
; [eval] m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_58.val_ref), _59)
; [eval] snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_58.val_ref)
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
; [eval] _2 < m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(_1)
; [eval] m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(_1)
(push) ; 10
(pop) ; 10
; Joined path conditions
; [eval] 0 <= _2
(assert (m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@248@01)))) $t@249@01) 0))
(pop) ; 9
; Joined path conditions
(assert (m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@248@01)))) $t@249@01) 0))
(assert (=
  (m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$ ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 $t@274@01 $t@249@01) val_int@267@01)
  (m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$ ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@248@01)))) $t@249@01) 0)))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@277@01))) $Snap.unit))
; [eval] (forall _0_quant_0: Int :: { m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(old[l35](_58.val_ref)), _0_quant_0) } { old[l35](m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_58.val_ref), _0_quant_0)) } 0 <= _0_quant_0 ==> !(0 <= _0_quant_0) || (!(_0_quant_0 < m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(old[l35](_58.val_ref)))) || (_0_quant_0 == old[l35](_59) || (_0_quant_0 == old[l35](_60) || m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(old[l35](_58.val_ref)), _0_quant_0) == old[l35](m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_58.val_ref), _0_quant_0))))))
(declare-const _0_quant_0@278@01 Int)
(push) ; 9
; [eval] 0 <= _0_quant_0 ==> !(0 <= _0_quant_0) || (!(_0_quant_0 < m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(old[l35](_58.val_ref)))) || (_0_quant_0 == old[l35](_59) || (_0_quant_0 == old[l35](_60) || m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(old[l35](_58.val_ref)), _0_quant_0) == old[l35](m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_58.val_ref), _0_quant_0)))))
; [eval] 0 <= _0_quant_0
(push) ; 10
; [then-branch: 8 | 0 <= _0_quant_0@278@01 | live]
; [else-branch: 8 | !(0 <= _0_quant_0@278@01) | live]
(push) ; 11
; [then-branch: 8 | 0 <= _0_quant_0@278@01]
(assert (<= 0 _0_quant_0@278@01))
; [eval] !(0 <= _0_quant_0) || (!(_0_quant_0 < m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(old[l35](_58.val_ref)))) || (_0_quant_0 == old[l35](_59) || (_0_quant_0 == old[l35](_60) || m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(old[l35](_58.val_ref)), _0_quant_0) == old[l35](m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_58.val_ref), _0_quant_0)))))
; [eval] !(0 <= _0_quant_0)
; [eval] 0 <= _0_quant_0
(push) ; 12
; [then-branch: 9 | !(0 <= _0_quant_0@278@01) | live]
; [else-branch: 9 | 0 <= _0_quant_0@278@01 | live]
(push) ; 13
; [then-branch: 9 | !(0 <= _0_quant_0@278@01)]
(assert (not (<= 0 _0_quant_0@278@01)))
(pop) ; 13
(push) ; 13
; [else-branch: 9 | 0 <= _0_quant_0@278@01]
; [eval] !(_0_quant_0 < m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(old[l35](_58.val_ref))))
; [eval] _0_quant_0 < m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(old[l35](_58.val_ref)))
; [eval] m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(old[l35](_58.val_ref)))
; [eval] snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(old[l35](_58.val_ref))
; [eval] old[l35](_58.val_ref)
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
; [then-branch: 10 | !(_0_quant_0@278@01 < m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$((_, _), snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32($t@274@01, $t@249@01))) | live]
; [else-branch: 10 | _0_quant_0@278@01 < m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$((_, _), snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32($t@274@01, $t@249@01)) | live]
(push) ; 15
; [then-branch: 10 | !(_0_quant_0@278@01 < m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$((_, _), snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32($t@274@01, $t@249@01)))]
(assert (not
  (<
    _0_quant_0@278@01
    (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 $t@274@01 $t@249@01)))))
(pop) ; 15
(push) ; 15
; [else-branch: 10 | _0_quant_0@278@01 < m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$((_, _), snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32($t@274@01, $t@249@01))]
(assert (<
  _0_quant_0@278@01
  (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 $t@274@01 $t@249@01))))
; [eval] _0_quant_0 == old[l35](_59)
; [eval] old[l35](_59)
(push) ; 16
; [then-branch: 11 | _0_quant_0@278@01 == 0 | live]
; [else-branch: 11 | _0_quant_0@278@01 != 0 | live]
(push) ; 17
; [then-branch: 11 | _0_quant_0@278@01 == 0]
(assert (= _0_quant_0@278@01 0))
(pop) ; 17
(push) ; 17
; [else-branch: 11 | _0_quant_0@278@01 != 0]
(assert (not (= _0_quant_0@278@01 0)))
; [eval] _0_quant_0 == old[l35](_60)
; [eval] old[l35](_60)
(push) ; 18
; [then-branch: 12 | _0_quant_0@278@01 == val_int@267@01 | live]
; [else-branch: 12 | _0_quant_0@278@01 != val_int@267@01 | live]
(push) ; 19
; [then-branch: 12 | _0_quant_0@278@01 == val_int@267@01]
(assert (= _0_quant_0@278@01 val_int@267@01))
(pop) ; 19
(push) ; 19
; [else-branch: 12 | _0_quant_0@278@01 != val_int@267@01]
(assert (not (= _0_quant_0@278@01 val_int@267@01)))
; [eval] m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(old[l35](_58.val_ref)), _0_quant_0) == old[l35](m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_58.val_ref), _0_quant_0))
; [eval] m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(old[l35](_58.val_ref)), _0_quant_0)
; [eval] snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(old[l35](_58.val_ref))
; [eval] old[l35](_58.val_ref)
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
; 0.00s
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
; [eval] _2 < m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(_1)
; [eval] m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(_1)
(push) ; 21
(pop) ; 21
; Joined path conditions
; [eval] 0 <= _2
(assert (m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 $t@274@01 $t@249@01) _0_quant_0@278@01))
(pop) ; 20
; Joined path conditions
(assert (m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 $t@274@01 $t@249@01) _0_quant_0@278@01))
; [eval] old[l35](m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_58.val_ref), _0_quant_0))
; [eval] m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_58.val_ref), _0_quant_0)
; [eval] snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_58.val_ref)
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
; 0.00s
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
; [eval] _2 < m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(_1)
; [eval] m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(_1)
(push) ; 21
(pop) ; 21
; Joined path conditions
(push) ; 21
(assert (not (<
  _0_quant_0@278@01
  (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@248@01)))) $t@249@01)))))
(check-sat)
; unsat
(pop) ; 21
; 0.00s
; (get-info :all-statistics)
(assert (<
  _0_quant_0@278@01
  (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@248@01)))) $t@249@01))))
; [eval] 0 <= _2
(assert (m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@248@01)))) $t@249@01) _0_quant_0@278@01))
(pop) ; 20
; Joined path conditions
(assert (and
  (<
    _0_quant_0@278@01
    (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@248@01)))) $t@249@01)))
  (m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@248@01)))) $t@249@01) _0_quant_0@278@01)))
(pop) ; 19
(pop) ; 18
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= _0_quant_0@278@01 val_int@267@01))
  (and
    (not (= _0_quant_0@278@01 val_int@267@01))
    (m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 $t@274@01 $t@249@01) _0_quant_0@278@01)
    (<
      _0_quant_0@278@01
      (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@248@01)))) $t@249@01)))
    (m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$%precondition ($Snap.combine
      $Snap.unit
      ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@248@01)))) $t@249@01) _0_quant_0@278@01))))
(assert (or
  (not (= _0_quant_0@278@01 val_int@267@01))
  (= _0_quant_0@278@01 val_int@267@01)))
(pop) ; 17
(pop) ; 16
; Joined path conditions
; Joined path conditions
(assert (=>
  (not (= _0_quant_0@278@01 0))
  (and
    (not (= _0_quant_0@278@01 0))
    (=>
      (not (= _0_quant_0@278@01 val_int@267@01))
      (and
        (not (= _0_quant_0@278@01 val_int@267@01))
        (m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$%precondition ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 $t@274@01 $t@249@01) _0_quant_0@278@01)
        (<
          _0_quant_0@278@01
          (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$ ($Snap.combine
            $Snap.unit
            $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@248@01)))) $t@249@01)))
        (m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$%precondition ($Snap.combine
          $Snap.unit
          ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@248@01)))) $t@249@01) _0_quant_0@278@01)))
    (or
      (not (= _0_quant_0@278@01 val_int@267@01))
      (= _0_quant_0@278@01 val_int@267@01)))))
(assert (or (not (= _0_quant_0@278@01 0)) (= _0_quant_0@278@01 0)))
(pop) ; 15
(pop) ; 14
; Joined path conditions
; Joined path conditions
(assert (=>
  (<
    _0_quant_0@278@01
    (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 $t@274@01 $t@249@01)))
  (and
    (<
      _0_quant_0@278@01
      (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 $t@274@01 $t@249@01)))
    (=>
      (not (= _0_quant_0@278@01 0))
      (and
        (not (= _0_quant_0@278@01 0))
        (=>
          (not (= _0_quant_0@278@01 val_int@267@01))
          (and
            (not (= _0_quant_0@278@01 val_int@267@01))
            (m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$%precondition ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 $t@274@01 $t@249@01) _0_quant_0@278@01)
            (<
              _0_quant_0@278@01
              (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$ ($Snap.combine
                $Snap.unit
                $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@248@01)))) $t@249@01)))
            (m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$%precondition ($Snap.combine
              $Snap.unit
              ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@248@01)))) $t@249@01) _0_quant_0@278@01)))
        (or
          (not (= _0_quant_0@278@01 val_int@267@01))
          (= _0_quant_0@278@01 val_int@267@01))))
    (or (not (= _0_quant_0@278@01 0)) (= _0_quant_0@278@01 0)))))
(assert (or
  (<
    _0_quant_0@278@01
    (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$ ($Snap.combine
      $Snap.unit
      $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 $t@274@01 $t@249@01)))
  (not
    (<
      _0_quant_0@278@01
      (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$ ($Snap.combine
        $Snap.unit
        $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 $t@274@01 $t@249@01))))))
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 _0_quant_0@278@01)
  (and
    (=>
      (<
        _0_quant_0@278@01
        (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$ ($Snap.combine
          $Snap.unit
          $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 $t@274@01 $t@249@01)))
      (and
        (<
          _0_quant_0@278@01
          (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$ ($Snap.combine
            $Snap.unit
            $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 $t@274@01 $t@249@01)))
        (=>
          (not (= _0_quant_0@278@01 0))
          (and
            (not (= _0_quant_0@278@01 0))
            (=>
              (not (= _0_quant_0@278@01 val_int@267@01))
              (and
                (not (= _0_quant_0@278@01 val_int@267@01))
                (m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$%precondition ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 $t@274@01 $t@249@01) _0_quant_0@278@01)
                (<
                  _0_quant_0@278@01
                  (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$ ($Snap.combine
                    $Snap.unit
                    $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@248@01)))) $t@249@01)))
                (m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$%precondition ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@248@01)))) $t@249@01) _0_quant_0@278@01)))
            (or
              (not (= _0_quant_0@278@01 val_int@267@01))
              (= _0_quant_0@278@01 val_int@267@01))))
        (or (not (= _0_quant_0@278@01 0)) (= _0_quant_0@278@01 0))))
    (or
      (<
        _0_quant_0@278@01
        (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$ ($Snap.combine
          $Snap.unit
          $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 $t@274@01 $t@249@01)))
      (not
        (<
          _0_quant_0@278@01
          (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$ ($Snap.combine
            $Snap.unit
            $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 $t@274@01 $t@249@01))))))))
(assert (or (<= 0 _0_quant_0@278@01) (not (<= 0 _0_quant_0@278@01))))
(pop) ; 11
(push) ; 11
; [else-branch: 8 | !(0 <= _0_quant_0@278@01)]
(assert (not (<= 0 _0_quant_0@278@01)))
(pop) ; 11
(pop) ; 10
; Joined path conditions
(assert (=>
  (<= 0 _0_quant_0@278@01)
  (and
    (<= 0 _0_quant_0@278@01)
    (=>
      (<= 0 _0_quant_0@278@01)
      (and
        (=>
          (<
            _0_quant_0@278@01
            (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$ ($Snap.combine
              $Snap.unit
              $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 $t@274@01 $t@249@01)))
          (and
            (<
              _0_quant_0@278@01
              (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$ ($Snap.combine
                $Snap.unit
                $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 $t@274@01 $t@249@01)))
            (=>
              (not (= _0_quant_0@278@01 0))
              (and
                (not (= _0_quant_0@278@01 0))
                (=>
                  (not (= _0_quant_0@278@01 val_int@267@01))
                  (and
                    (not (= _0_quant_0@278@01 val_int@267@01))
                    (m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$%precondition ($Snap.combine
                      $Snap.unit
                      ($Snap.combine
                        $Snap.unit
                        ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 $t@274@01 $t@249@01) _0_quant_0@278@01)
                    (<
                      _0_quant_0@278@01
                      (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$ ($Snap.combine
                        $Snap.unit
                        $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@248@01)))) $t@249@01)))
                    (m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$%precondition ($Snap.combine
                      $Snap.unit
                      ($Snap.combine
                        $Snap.unit
                        ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@248@01)))) $t@249@01) _0_quant_0@278@01)))
                (or
                  (not (= _0_quant_0@278@01 val_int@267@01))
                  (= _0_quant_0@278@01 val_int@267@01))))
            (or (not (= _0_quant_0@278@01 0)) (= _0_quant_0@278@01 0))))
        (or
          (<
            _0_quant_0@278@01
            (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$ ($Snap.combine
              $Snap.unit
              $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 $t@274@01 $t@249@01)))
          (not
            (<
              _0_quant_0@278@01
              (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$ ($Snap.combine
                $Snap.unit
                $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 $t@274@01 $t@249@01)))))))
    (or (<= 0 _0_quant_0@278@01) (not (<= 0 _0_quant_0@278@01))))))
; Joined path conditions
(assert (or (not (<= 0 _0_quant_0@278@01)) (<= 0 _0_quant_0@278@01)))
(pop) ; 9
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
            (=>
              (<
                _0_quant_0@278@01
                (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$ ($Snap.combine
                  $Snap.unit
                  $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 $t@274@01 $t@249@01)))
              (and
                (<
                  _0_quant_0@278@01
                  (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$ ($Snap.combine
                    $Snap.unit
                    $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 $t@274@01 $t@249@01)))
                (=>
                  (not (= _0_quant_0@278@01 0))
                  (and
                    (not (= _0_quant_0@278@01 0))
                    (=>
                      (not (= _0_quant_0@278@01 val_int@267@01))
                      (and
                        (not (= _0_quant_0@278@01 val_int@267@01))
                        (m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$%precondition ($Snap.combine
                          $Snap.unit
                          ($Snap.combine
                            $Snap.unit
                            ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 $t@274@01 $t@249@01) _0_quant_0@278@01)
                        (<
                          _0_quant_0@278@01
                          (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$ ($Snap.combine
                            $Snap.unit
                            $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@248@01)))) $t@249@01)))
                        (m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$%precondition ($Snap.combine
                          $Snap.unit
                          ($Snap.combine
                            $Snap.unit
                            ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@248@01)))) $t@249@01) _0_quant_0@278@01)))
                    (or
                      (not (= _0_quant_0@278@01 val_int@267@01))
                      (= _0_quant_0@278@01 val_int@267@01))))
                (or (not (= _0_quant_0@278@01 0)) (= _0_quant_0@278@01 0))))
            (or
              (<
                _0_quant_0@278@01
                (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$ ($Snap.combine
                  $Snap.unit
                  $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 $t@274@01 $t@249@01)))
              (not
                (<
                  _0_quant_0@278@01
                  (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$ ($Snap.combine
                    $Snap.unit
                    $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 $t@274@01 $t@249@01)))))))
        (or (<= 0 _0_quant_0@278@01) (not (<= 0 _0_quant_0@278@01)))))
    (or (not (<= 0 _0_quant_0@278@01)) (<= 0 _0_quant_0@278@01)))
  :pattern ((m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$%limited ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 $t@274@01 $t@249@01) _0_quant_0@278@01))
  :qid |prog.l1010-aux|)))
(assert (forall ((_0_quant_0@278@01 Int)) (!
  (and
    (=>
      (<= 0 _0_quant_0@278@01)
      (and
        (<= 0 _0_quant_0@278@01)
        (=>
          (<= 0 _0_quant_0@278@01)
          (and
            (=>
              (<
                _0_quant_0@278@01
                (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$ ($Snap.combine
                  $Snap.unit
                  $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 $t@274@01 $t@249@01)))
              (and
                (<
                  _0_quant_0@278@01
                  (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$ ($Snap.combine
                    $Snap.unit
                    $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 $t@274@01 $t@249@01)))
                (=>
                  (not (= _0_quant_0@278@01 0))
                  (and
                    (not (= _0_quant_0@278@01 0))
                    (=>
                      (not (= _0_quant_0@278@01 val_int@267@01))
                      (and
                        (not (= _0_quant_0@278@01 val_int@267@01))
                        (m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$%precondition ($Snap.combine
                          $Snap.unit
                          ($Snap.combine
                            $Snap.unit
                            ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 $t@274@01 $t@249@01) _0_quant_0@278@01)
                        (<
                          _0_quant_0@278@01
                          (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$ ($Snap.combine
                            $Snap.unit
                            $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@248@01)))) $t@249@01)))
                        (m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$%precondition ($Snap.combine
                          $Snap.unit
                          ($Snap.combine
                            $Snap.unit
                            ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@248@01)))) $t@249@01) _0_quant_0@278@01)))
                    (or
                      (not (= _0_quant_0@278@01 val_int@267@01))
                      (= _0_quant_0@278@01 val_int@267@01))))
                (or (not (= _0_quant_0@278@01 0)) (= _0_quant_0@278@01 0))))
            (or
              (<
                _0_quant_0@278@01
                (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$ ($Snap.combine
                  $Snap.unit
                  $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 $t@274@01 $t@249@01)))
              (not
                (<
                  _0_quant_0@278@01
                  (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$ ($Snap.combine
                    $Snap.unit
                    $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 $t@274@01 $t@249@01)))))))
        (or (<= 0 _0_quant_0@278@01) (not (<= 0 _0_quant_0@278@01)))))
    (or (not (<= 0 _0_quant_0@278@01)) (<= 0 _0_quant_0@278@01)))
  :pattern ((m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$%limited ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@248@01)))) $t@249@01) _0_quant_0@278@01))
  :qid |prog.l1010-aux|)))
(assert (forall ((_0_quant_0@278@01 Int)) (!
  (=>
    (<= 0 _0_quant_0@278@01)
    (or
      (not (<= 0 _0_quant_0@278@01))
      (or
        (not
          (<
            _0_quant_0@278@01
            (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$ ($Snap.combine
              $Snap.unit
              $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 $t@274@01 $t@249@01))))
        (or
          (= _0_quant_0@278@01 0)
          (or
            (= _0_quant_0@278@01 val_int@267@01)
            (=
              (m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$ ($Snap.combine
                $Snap.unit
                ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 $t@274@01 $t@249@01) _0_quant_0@278@01)
              (m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$ ($Snap.combine
                $Snap.unit
                ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@248@01)))) $t@249@01) _0_quant_0@278@01)))))))
  :pattern ((m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$%limited ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 $t@274@01 $t@249@01) _0_quant_0@278@01))
  :pattern ((m_VecWrapperI32$$lookup__$TY$__Snap$struct$m_VecWrapperI32$$int$$$int$%limited ($Snap.combine
    $Snap.unit
    ($Snap.combine $Snap.unit ($Snap.combine $Snap.unit $Snap.unit))) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@248@01)))) $t@249@01) _0_quant_0@278@01))
  :qid |prog.l1010|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label l36
; [exec]
; __t26 := true
; [exec]
; _62 := builtin$havoc_ref()
(declare-const ret@279@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_62.val_ref, write)
(declare-const $t@280@01 $Ref)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= _1@56@01 ret@279@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@98@01 ret@279@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@279@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _62.val_ref := _1.val_ref
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (-
      (+
        (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@98@01 ret@279@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= _1@56@01 ret@279@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [exec]
; label l38
; [exec]
; _63 := builtin$havoc_int()
(declare-const ret@281@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _63 := _56
; [exec]
; label l39
; [exec]
; _65 := builtin$havoc_int()
(declare-const ret@282@01 Int)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; _65 := _37.val_int
; [exec]
; label l40
; [exec]
; _66 := builtin$havoc_ref()
(declare-const ret@283@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(_66.tuple_0, write)
(declare-const $t@284@01 $Ref)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@182@01 ret@283@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@171@01 ret@283@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@262@01 ret@283@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@283@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_66.tuple_0.val_int, write)
(declare-const $t@285@01 Int)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@209@01 $t@284@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@136@01 $t@284@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@172@01 $t@284@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@263@01 $t@284@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (not (= $t@284@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(_66.tuple_1, write)
(declare-const $t@286@01 $Ref)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@182@01 ret@283@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@171@01 ret@283@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@262@01 ret@283@01)))
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
; inhale acc(_66.tuple_1.val_bool, write)
(declare-const $t@287@01 Bool)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@265@01 $t@286@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@202@01 $t@286@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@207@01 $t@286@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@205@01 $t@286@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@195@01 $t@286@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@116@01 $t@286@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@185@01 $t@286@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@174@01 $t@286@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@121@01 $t@286@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@119@01 $t@286@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@110@01 $t@286@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@161@01 $t@286@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@164@01 $t@286@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@167@01 $t@286@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@169@01 $t@286@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@252@01 $t@286@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@255@01 $t@286@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@258@01 $t@286@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@260@01 $t@286@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (not (= $t@286@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _66.tuple_0.val_int := _65 - 1
; [eval] _65 - 1
(declare-const val_int@288@01 Int)
(assert (= val_int@288@01 (- val_int@267@01 1)))
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@263@01 $t@284@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@172@01 $t@284@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@136@01 $t@284@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@209@01 $t@284@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [exec]
; _66.tuple_1.val_bool := false
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@265@01 $t@286@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@202@01 $t@286@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@207@01 $t@286@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@205@01 $t@286@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@195@01 $t@286@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@116@01 $t@286@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@185@01 $t@286@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@174@01 $t@286@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@121@01 $t@286@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@119@01 $t@286@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@110@01 $t@286@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@161@01 $t@286@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@164@01 $t@286@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@167@01 $t@286@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@169@01 $t@286@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@252@01 $t@286@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@255@01 $t@286@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@258@01 $t@286@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@260@01 $t@286@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t48 := _66.tuple_1.val_bool
; [exec]
; assert !__t48
; [eval] !__t48
; [exec]
; __t27 := true
; [exec]
; _64 := _66.tuple_0
; [exec]
; label l41
; [exec]
; label l42
; [exec]
; assert _64.val_int <
;   m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_62.val_ref)) &&
;   (0 <= _63 &&
;   (_63 <
;   m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_62.val_ref)) &&
;   (0 <= _64.val_int &&
;   _64.val_int <
;   m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_62.val_ref)))))
; [eval] _64.val_int < m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_62.val_ref))
; [eval] m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_62.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_62.val_ref)
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
(assert (not (<
  val_int@288@01
  (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 $t@274@01 $t@249@01)))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (<
  val_int@288@01
  (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 $t@274@01 $t@249@01))))
; [eval] 0 <= _63
; [eval] _63 < m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_62.val_ref))
; [eval] m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_62.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_62.val_ref)
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
; [eval] 0 <= _64.val_int
(push) ; 9
(assert (not (<= 0 val_int@288@01)))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (<= 0 val_int@288@01))
; [eval] _64.val_int < m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_62.val_ref))
; [eval] m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_62.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_62.val_ref)
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
; [exec]
; assert true
; [exec]
; assert _63 >= 0
; [eval] _63 >= 0
; [exec]
; fold acc(usize(_64), write)
; [eval] 0 <= self.val_int
(assert (usize%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap val_int@288@01)
  $Snap.unit) $t@284@01))
; [exec]
; exhale acc(_62.val_ref, write) &&
;   (acc(struct$m_VecWrapperI32(_62.val_ref), write) &&
;   (_63 >= 0 && acc(usize(_64), write)))
; [eval] _63 >= 0
; [exec]
; _61 := builtin$havoc_ref()
(declare-const ret@289@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(struct$m_VecWrapperI32(old[l42](_62.val_ref)), write)
; [eval] old[l42](_62.val_ref)
(declare-const $t@290@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(tuple0$(_61), write)
(declare-const $t@291@01 $Snap)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@188@01 ret@289@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@273@01 ret@289@01)))
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
(declare-const $t@292@01 $Snap)
(assert (= $t@292@01 $Snap.unit))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(old[l42](_62.val_ref))) ==
;   old[l42](m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_62.val_ref)))
(declare-const $t@293@01 $Snap)
(assert (= $t@293@01 $Snap.unit))
; [eval] m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(old[l42](_62.val_ref))) == old[l42](m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_62.val_ref)))
; [eval] m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(old[l42](_62.val_ref)))
; [eval] snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(old[l42](_62.val_ref))
; [eval] old[l42](_62.val_ref)
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
(assert (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32%precondition $t@290@01 $t@249@01))
(pop) ; 9
; Joined path conditions
(assert (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32%precondition $t@290@01 $t@249@01))
(set-option :timeout 0)
(push) ; 9
(assert (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 $t@290@01 $t@249@01)))
(pop) ; 9
; Joined path conditions
(assert (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 $t@290@01 $t@249@01)))
; [eval] old[l42](m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_62.val_ref)))
; [eval] m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_62.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_62.val_ref)
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
  (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 $t@290@01 $t@249@01))
  (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 $t@274@01 $t@249@01))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label l43
; [exec]
; __t28 := true
; [exec]
; _67 := builtin$havoc_int()
(declare-const ret@294@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _67 := _37.val_int
; [exec]
; label l45
; [exec]
; _38.val_bool := _67 > 1
; [eval] _67 > 1
(declare-const val_bool@295@01 Bool)
(assert (= val_bool@295@01 (> val_int@267@01 1)))
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@286@01 ret@202@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@265@01 ret@202@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@207@01 ret@202@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@205@01 ret@202@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@195@01 ret@202@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@116@01 ret@202@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@185@01 ret@202@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@174@01 ret@202@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@121@01 ret@202@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@119@01 ret@202@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@110@01 ret@202@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@161@01 ret@202@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@164@01 ret@202@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@167@01 ret@202@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@169@01 ret@202@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@252@01 ret@202@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@255@01 ret@202@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@258@01 ret@202@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@260@01 ret@202@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t16 := true
; [exec]
; __t17 := true
; [exec]
; _40 := builtin$havoc_ref()
(declare-const ret@296@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_40.val_bool, write)
(declare-const $t@297@01 Bool)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@260@01 ret@296@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@258@01 ret@296@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@255@01 ret@296@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@252@01 ret@296@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@169@01 ret@296@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@167@01 ret@296@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@164@01 ret@296@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@161@01 ret@296@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@110@01 ret@296@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@119@01 ret@296@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@121@01 ret@296@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@174@01 ret@296@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@185@01 ret@296@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@116@01 ret@296@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@195@01 ret@296@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@205@01 ret@296@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@207@01 ret@296@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@265@01 ret@296@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@286@01 ret@296@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@202@01 ret@296@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@296@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _40.val_bool := _38.val_bool
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@202@01 ret@296@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@286@01 ret@296@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@265@01 ret@296@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@207@01 ret@296@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@205@01 ret@296@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@195@01 ret@296@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@116@01 ret@296@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@185@01 ret@296@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@174@01 ret@296@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@121@01 ret@296@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@119@01 ret@296@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@110@01 ret@296@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@161@01 ret@296@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@164@01 ret@296@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@167@01 ret@296@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@169@01 ret@296@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@252@01 ret@296@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@255@01 ret@296@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@258@01 ret@296@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@260@01 ret@296@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [exec]
; label l46
; [exec]
; __t49 := _40.val_bool
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not val_bool@295@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not val_bool@295@01))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [then-branch: 13 | val_bool@295@01 | live]
; [else-branch: 13 | !(val_bool@295@01) | live]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 13 | val_bool@295@01]
(assert val_bool@295@01)
; [exec]
; label loop3_inv_post_perm
; [exec]
; __t18 := true
; [exec]
; _42 := builtin$havoc_ref()
(declare-const ret@298@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_42.val_bool, write)
(declare-const $t@299@01 Bool)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@260@01 ret@298@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@258@01 ret@298@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@255@01 ret@298@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@252@01 ret@298@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@169@01 ret@298@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@167@01 ret@298@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@164@01 ret@298@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@161@01 ret@298@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@110@01 ret@298@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@119@01 ret@298@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@121@01 ret@298@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@174@01 ret@298@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@185@01 ret@298@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@116@01 ret@298@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@195@01 ret@298@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@205@01 ret@298@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@207@01 ret@298@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@265@01 ret@298@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@286@01 ret@298@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@202@01 ret@298@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@296@01 ret@298@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@298@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _42.val_bool := false
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@296@01 ret@298@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@202@01 ret@298@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@286@01 ret@298@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@265@01 ret@298@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@207@01 ret@298@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@205@01 ret@298@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@195@01 ret@298@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@116@01 ret@298@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@185@01 ret@298@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@174@01 ret@298@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@121@01 ret@298@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@119@01 ret@298@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@110@01 ret@298@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@161@01 ret@298@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@164@01 ret@298@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@167@01 ret@298@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@169@01 ret@298@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@252@01 ret@298@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@255@01 ret@298@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@258@01 ret@298@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@260@01 ret@298@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t50 := _42.val_bool
; [exec]
; fold acc(usize(_37), write)
; [eval] 0 <= self.val_int
(assert (usize%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap val_int@267@01)
  $Snap.unit) $t@263@01))
; [exec]
; fold acc(bool(_38), write)
(assert (bool%trigger ($SortWrappers.BoolTo$Snap val_bool@295@01) ret@202@01))
; [exec]
; assert _2 ==
;   m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_1.val_ref)) &&
;   ((unfolding acc(usize(_37), write) in _37.val_int) <= _2 &&
;   (unfolding acc(usize(_37), write) in _37.val_int) > 1)
; [eval] _2 == m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_1.val_ref))
; [eval] m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_1.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_1.val_ref)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (-
      (+
        (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
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
(assert (not (=
  ret@103@01
  (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 $t@290@01 $t@249@01)))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (=
  ret@103@01
  (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 $t@290@01 $t@249@01))))
; [eval] (unfolding acc(usize(_37), write) in _37.val_int) <= _2
; [eval] (unfolding acc(usize(_37), write) in _37.val_int)
(push) ; 10
(push) ; 11
(set-option :timeout 10)
(assert (not (= $t@172@01 $t@263@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@136@01 $t@263@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@209@01 $t@263@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [eval] 0 <= self.val_int
(pop) ; 10
; Joined path conditions
(set-option :timeout 0)
(push) ; 10
(assert (not (<= val_int@267@01 ret@103@01)))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (<= val_int@267@01 ret@103@01))
; [eval] (unfolding acc(usize(_37), write) in _37.val_int) > 1
; [eval] (unfolding acc(usize(_37), write) in _37.val_int)
(push) ; 10
(push) ; 11
(set-option :timeout 10)
(assert (not (= $t@172@01 $t@263@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@136@01 $t@263@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@209@01 $t@263@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [eval] 0 <= self.val_int
(pop) ; 10
; Joined path conditions
(set-option :timeout 0)
(push) ; 10
(assert (not (> val_int@267@01 1)))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (> val_int@267@01 1))
; [exec]
; assert true
; [exec]
; assert _preserve$1 == _1.val_ref
; [eval] _preserve$1 == _1.val_ref
(push) ; 10
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (-
      (+
        (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(usize(_37), write) &&
;   (acc(bool(_38), write) &&
;   (acc(_1.val_ref, read$()) &&
;   (acc(struct$m_VecWrapperI32(_1.val_ref), write) && _2 >= 0)))
; [eval] read$()
(set-option :timeout 0)
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
          (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (-
          (+
            (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit))
      (read$ $Snap.unit)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (<=
  $Perm.No
  (-
    (+
      (-
        (+
          (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (-
          (+
            (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit))
      (read$ $Snap.unit)))))
(assert (<=
  (-
    (+
      (-
        (+
          (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (-
          (+
            (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit))
      (read$ $Snap.unit)))
  $Perm.Write))
(assert (=>
  (<
    $Perm.No
    (-
      (+
        (-
          (+
            (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
              (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (-
            (+
              (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        (read$ $Snap.unit))))
  (not (= _1@56@01 $Ref.null))))
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
              (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (-
            (+
              (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
                (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
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
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (-
      (+
        (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [eval] _2 >= 0
; [exec]
; inhale false
(pop) ; 9
(set-option :timeout 0)
(push) ; 9
; [else-branch: 13 | !(val_bool@295@01)]
(assert (not val_bool@295@01))
(pop) ; 9
; [eval] !__t49
(push) ; 9
(set-option :timeout 10)
(assert (not val_bool@295@01))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not val_bool@295@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [then-branch: 14 | !(val_bool@295@01) | live]
; [else-branch: 14 | val_bool@295@01 | live]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 14 | !(val_bool@295@01)]
(assert (not val_bool@295@01))
; [exec]
; label loop3_group2_bb5
; [exec]
; inhale _2 >= 0
(declare-const $t@300@01 $Snap)
(assert (= $t@300@01 $Snap.unit))
; [eval] _2 >= 0
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label loop3_inv_pre
; [exec]
; __t29 := true
; [exec]
; label l50
; [exec]
; _old$pre$0 := _1.val_ref
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (-
      (+
        (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit)))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [exec]
; fold acc(tuple0$(_0), write)
(assert (tuple0$%trigger $Snap.unit _0@1@01))
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@289@01 _0@1@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@188@01 _0@1@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@273@01 _0@1@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [exec]
; assert m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_old$pre$0)) ==
;   old[pre](m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_1.val_ref)))
; [eval] m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_old$pre$0)) == old[pre](m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_1.val_ref)))
; [eval] m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_old$pre$0))
; [eval] snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_old$pre$0)
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
; [eval] old[pre](m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_1.val_ref)))
; [eval] m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_1.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_1.val_ref)
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
(assert (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32%precondition ($Snap.second $t@96@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@96@01))))
(pop) ; 10
; Joined path conditions
(assert (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32%precondition ($Snap.second $t@96@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@96@01))))
(set-option :timeout 0)
(push) ; 10
(assert (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 ($Snap.second $t@96@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@96@01)))))
(pop) ; 10
; Joined path conditions
(assert (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 ($Snap.second $t@96@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@96@01)))))
(push) ; 10
(assert (not (=
  (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 $t@290@01 $t@249@01))
  (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 ($Snap.second $t@96@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@96@01)))))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (=
  (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 $t@290@01 $t@249@01))
  (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 ($Snap.second $t@96@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@96@01))))))
; [exec]
; assert true
; [exec]
; exhale acc(struct$m_VecWrapperI32(_old$pre$0), write)
; [exec]
; exhale acc(tuple0$(_0), write)
; [exec]
; label end_of_method
(pop) ; 9
(push) ; 9
; [else-branch: 14 | val_bool@295@01]
(assert val_bool@295@01)
(pop) ; 9
(pop) ; 8
(push) ; 8
; [else-branch: 7 | !(val_bool@254@01)]
(assert (not val_bool@254@01))
(pop) ; 8
; [eval] !__t43
(push) ; 8
(set-option :timeout 10)
(assert (not val_bool@254@01))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not val_bool@254@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [then-branch: 15 | !(val_bool@254@01) | live]
; [else-branch: 15 | val_bool@254@01 | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 15 | !(val_bool@254@01)]
(assert (not val_bool@254@01))
; [exec]
; label l6
; [exec]
; label end_of_method
(pop) ; 8
(push) ; 8
; [else-branch: 15 | val_bool@254@01]
(assert val_bool@254@01)
(pop) ; 8
(pop) ; 7
; [eval] !__t41
(push) ; 7
(set-option :timeout 10)
(assert (not val_bool@204@01))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [then-branch: 16 | !(val_bool@204@01) | dead]
; [else-branch: 16 | val_bool@204@01 | live]
(set-option :timeout 0)
(push) ; 7
; [else-branch: 16 | val_bool@204@01]
(assert val_bool@204@01)
(pop) ; 7
(pop) ; 6
(push) ; 6
; [else-branch: 5 | val_bool@194@01]
(assert val_bool@194@01)
(pop) ; 6
(pop) ; 5
(push) ; 5
; [else-branch: 3 | !(val_bool@163@01)]
(assert (not val_bool@163@01))
(pop) ; 5
; [eval] !__t33
(push) ; 5
(set-option :timeout 10)
(assert (not val_bool@163@01))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not val_bool@163@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [then-branch: 17 | !(val_bool@163@01) | live]
; [else-branch: 17 | val_bool@163@01 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 17 | !(val_bool@163@01)]
(assert (not val_bool@163@01))
; [exec]
; label l2
; [exec]
; label end_of_method
(pop) ; 5
(push) ; 5
; [else-branch: 17 | val_bool@163@01]
(assert val_bool@163@01)
(pop) ; 5
(pop) ; 4
(push) ; 4
; [else-branch: 2 | !(val_bool@118@01)]
(assert (not val_bool@118@01))
(pop) ; 4
; [eval] !__t31
(push) ; 4
(set-option :timeout 10)
(assert (not val_bool@118@01))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not val_bool@118@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [then-branch: 18 | !(val_bool@118@01) | live]
; [else-branch: 18 | val_bool@118@01 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 18 | !(val_bool@118@01)]
(assert (not val_bool@118@01))
; [exec]
; label return
; [exec]
; label loop3_start
; [exec]
; __t15 := true
; [exec]
; _37 := builtin$havoc_ref()
(declare-const ret@301@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_37.val_int, write)
(declare-const $t@302@01 Int)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@112@01 ret@301@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@301@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _37.val_int := _2
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@112@01 ret@301@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [exec]
; label l23
; [exec]
; _39 := builtin$havoc_int()
(declare-const ret@303@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _39 := _37.val_int
; [exec]
; label l24
; [exec]
; _38 := builtin$havoc_ref()
(declare-const ret@304@01 $Ref)
; State saturation: after contract
(check-sat)
; unknown
; [exec]
; inhale acc(_38.val_bool, write)
(declare-const $t@305@01 Bool)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@110@01 ret@304@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@116@01 ret@304@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@119@01 ret@304@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@304@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _38.val_bool := _39 > 1
; [eval] _39 > 1
(declare-const val_bool@306@01 Bool)
(assert (= val_bool@306@01 (> ret@103@01 1)))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@119@01 ret@304@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@116@01 ret@304@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@110@01 ret@304@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [exec]
; __t16 := true
; [exec]
; __t17 := true
; [exec]
; _40 := builtin$havoc_ref()
(declare-const ret@307@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_40.val_bool, write)
(declare-const $t@308@01 Bool)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@110@01 ret@307@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@116@01 ret@307@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@119@01 ret@307@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@304@01 ret@307@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@307@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _40.val_bool := _38.val_bool
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@304@01 ret@307@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@119@01 ret@307@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@116@01 ret@307@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@110@01 ret@307@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [exec]
; label l25
; [exec]
; __t41 := _40.val_bool
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not val_bool@306@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [then-branch: 19 | val_bool@306@01 | dead]
; [else-branch: 19 | !(val_bool@306@01) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 19 | !(val_bool@306@01)]
(assert (not val_bool@306@01))
(pop) ; 5
; [eval] !__t41
(push) ; 5
(set-option :timeout 10)
(assert (not val_bool@306@01))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not val_bool@306@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [then-branch: 20 | !(val_bool@306@01) | live]
; [else-branch: 20 | val_bool@306@01 | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 20 | !(val_bool@306@01)]
(assert (not val_bool@306@01))
; [exec]
; label loop3_group1_bb3
; [exec]
; label loop3_inv_pre
; [exec]
; __t29 := true
; [exec]
; label l50
; [exec]
; _old$pre$0 := _1.val_ref
(declare-const _old$pre$0@309@01 $Ref)
(assert (= _old$pre$0@309@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@96@01))))
; [exec]
; fold acc(tuple0$(_0), write)
(assert (tuple0$%trigger $Snap.unit _0@1@01))
; [exec]
; assert m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_old$pre$0)) ==
;   old[pre](m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_1.val_ref)))
; [eval] m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_old$pre$0)) == old[pre](m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_1.val_ref)))
; [eval] m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_old$pre$0))
; [eval] snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_old$pre$0)
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
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@96@01)) _old$pre$0@309@01)))
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
(pop) ; 7
; 0.00s
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
(push) ; 7
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
(assert (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32%precondition $t@107@01 _old$pre$0@309@01))
(pop) ; 6
; Joined path conditions
(assert (and
  (<=
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
        (read$ $Snap.unit))))
  (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32%precondition $t@107@01 _old$pre$0@309@01)))
(set-option :timeout 0)
(push) ; 6
(assert (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 $t@107@01 _old$pre$0@309@01)))
(pop) ; 6
; Joined path conditions
(assert (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 $t@107@01 _old$pre$0@309@01)))
; [eval] old[pre](m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_1.val_ref)))
; [eval] m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$(snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_1.val_ref))
; [eval] snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32(_1.val_ref)
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
(assert (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32%precondition ($Snap.second $t@96@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@96@01))))
(pop) ; 6
; Joined path conditions
(assert (and
  (<= $Perm.No (- $Perm.Write ($Perm.min $Perm.Write (read$ $Snap.unit))))
  (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32%precondition ($Snap.second $t@96@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@96@01)))))
(set-option :timeout 0)
(push) ; 6
(assert (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 ($Snap.second $t@96@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@96@01)))))
(pop) ; 6
; Joined path conditions
(assert (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$%precondition ($Snap.combine
  $Snap.unit
  $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 ($Snap.second $t@96@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@96@01)))))
(push) ; 6
(assert (not (=
  (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 $t@107@01 _old$pre$0@309@01))
  (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 ($Snap.second $t@96@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@96@01)))))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (=
  (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 $t@107@01 _old$pre$0@309@01))
  (m_VecWrapperI32$$len__$TY$__Snap$struct$m_VecWrapperI32$$int$ ($Snap.combine
    $Snap.unit
    $Snap.unit) (snap$__$TY$__Snap$struct$m_VecWrapperI32$struct$m_VecWrapperI32$Snap$struct$m_VecWrapperI32 ($Snap.second $t@96@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@96@01))))))
; [exec]
; assert true
; [exec]
; exhale acc(struct$m_VecWrapperI32(_old$pre$0), write)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@96@01)) _old$pre$0@309@01)))
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
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
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
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(tuple0$(_0), write)
; [exec]
; label end_of_method
(pop) ; 5
(pop) ; 4
(push) ; 4
; [else-branch: 18 | val_bool@118@01]
(assert val_bool@118@01)
(pop) ; 4
(pop) ; 3
; [eval] !(__t0 && __t0)
; [eval] __t0 && __t0
(push) ; 3
; [then-branch: 21 | True | live]
; [else-branch: 21 | False | live]
(push) ; 4
; [then-branch: 21 | True]
(pop) ; 4
(push) ; 4
; [else-branch: 21 | False]
(assert false)
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
; [then-branch: 22 | False | dead]
; [else-branch: 22 | True | live]
(push) ; 3
; [else-branch: 22 | True]
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
