(get-info :version)
; (:version "4.12.1")
; Started: 2023-10-31 14:02:55
; Silicon.version: 1.1-SNAPSHOT (46944a65@dspil_symbenchmarking)
; Input file: /home/pcorrect/repos/benchmarking_general/silicon_tests/prusti_tests_._pass_._issues_._issue-721-1_._issue-721-1.rs_issue_721_1--Path--invariant-Both.vpr
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
(declare-fun Slice$len__$TY$__usize$Slice$usize$$int$ ($Snap $Ref) Int)
(declare-fun Slice$len__$TY$__usize$Slice$usize$$int$%limited ($Snap $Ref) Int)
(declare-fun Slice$len__$TY$__usize$Slice$usize$$int$%stateless ($Ref) Bool)
(declare-fun Slice$len__$TY$__usize$Slice$usize$$int$%precondition ($Snap $Ref) Bool)
(declare-fun lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$ ($Snap $Ref Int) Int)
(declare-fun lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$%limited ($Snap $Ref Int) Int)
(declare-fun lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$%stateless ($Ref Int) Bool)
(declare-fun lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$%precondition ($Snap $Ref Int) Bool)
(declare-fun lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$ ($Snap $Ref Int) Int)
(declare-fun lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$%limited ($Snap $Ref Int) Int)
(declare-fun lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$%stateless ($Ref Int) Bool)
(declare-fun lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$%precondition ($Snap $Ref Int) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun Array$64$usize%trigger ($Snap $Ref) Bool)
(declare-fun DeadBorrowToken$%trigger ($Snap Int) Bool)
(declare-fun Slice$usize%trigger ($Snap $Ref) Bool)
(declare-fun bool%trigger ($Snap $Ref) Bool)
(declare-fun struct$m_Path%trigger ($Snap $Ref) Bool)
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
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap)) (!
  (let ((result@0@00 (read$%limited s@$))) true)
  :pattern ((read$%limited s@$))
  :qid |quant-u-9|)))
(assert (forall ((s@$ $Snap)) (!
  (let ((result@0@00 (read$%limited s@$))) true)
  :pattern ((read$%limited s@$))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (self@1@00 $Ref)) (!
  (=
    (Slice$len__$TY$__usize$Slice$usize$$int$%limited s@$ self@1@00)
    (Slice$len__$TY$__usize$Slice$usize$$int$ s@$ self@1@00))
  :pattern ((Slice$len__$TY$__usize$Slice$usize$$int$ s@$ self@1@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (self@1@00 $Ref)) (!
  (Slice$len__$TY$__usize$Slice$usize$$int$%stateless self@1@00)
  :pattern ((Slice$len__$TY$__usize$Slice$usize$$int$%limited s@$ self@1@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (self@1@00 $Ref)) (!
  (let ((result@2@00 (Slice$len__$TY$__usize$Slice$usize$$int$%limited s@$ self@1@00))) (=>
    (Slice$len__$TY$__usize$Slice$usize$$int$%precondition s@$ self@1@00)
    (and (>= result@2@00 0) (<= result@2@00 18446744073709551615))))
  :pattern ((Slice$len__$TY$__usize$Slice$usize$$int$%limited s@$ self@1@00))
  :qid |quant-u-11|)))
(assert (forall ((s@$ $Snap) (self@1@00 $Ref)) (!
  (let ((result@2@00 (Slice$len__$TY$__usize$Slice$usize$$int$%limited s@$ self@1@00))) true)
  :pattern ((Slice$len__$TY$__usize$Slice$usize$$int$%limited s@$ self@1@00))
  :qid |quant-u-12|)))
(assert (forall ((s@$ $Snap) (self@1@00 $Ref)) (!
  (let ((result@2@00 (Slice$len__$TY$__usize$Slice$usize$$int$%limited s@$ self@1@00))) true)
  :pattern ((Slice$len__$TY$__usize$Slice$usize$$int$%limited s@$ self@1@00))
  :qid |quant-u-13|)))
(assert (forall ((s@$ $Snap) (self@3@00 $Ref) (idx@4@00 Int)) (!
  (=
    (lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$%limited s@$ self@3@00 idx@4@00)
    (lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$ s@$ self@3@00 idx@4@00))
  :pattern ((lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$ s@$ self@3@00 idx@4@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (self@3@00 $Ref) (idx@4@00 Int)) (!
  (lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$%stateless self@3@00 idx@4@00)
  :pattern ((lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$%limited s@$ self@3@00 idx@4@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (self@6@00 $Ref) (idx@7@00 Int)) (!
  (=
    (lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$%limited s@$ self@6@00 idx@7@00)
    (lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$ s@$ self@6@00 idx@7@00))
  :pattern ((lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$ s@$ self@6@00 idx@7@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (self@6@00 $Ref) (idx@7@00 Int)) (!
  (lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$%stateless self@6@00 idx@7@00)
  :pattern ((lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$%limited s@$ self@6@00 idx@7@00))
  :qid |quant-u-7|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- m_Path$$invariant ----------
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
; var _old$pre$0: Ref
(declare-const _old$pre$0@27@01 $Ref)
; [exec]
; var _1: Ref
(declare-const _1@28@01 $Ref)
; [exec]
; var _2: Ref
(declare-const _2@29@01 $Ref)
; [exec]
; var _3: Ref
(declare-const _3@30@01 $Ref)
; [exec]
; var _4: Ref
(declare-const _4@31@01 $Ref)
; [exec]
; var _5: Ref
(declare-const _5@32@01 $Ref)
; [exec]
; var _6: Ref
(declare-const _6@33@01 $Ref)
; [exec]
; var _7: Int
(declare-const _7@34@01 Int)
; [exec]
; var _8: Ref
(declare-const _8@35@01 $Ref)
; [exec]
; var _9: Ref
(declare-const _9@36@01 $Ref)
; [exec]
; var _10: Ref
(declare-const _10@37@01 $Ref)
; [exec]
; var _11: Int
(declare-const _11@38@01 Int)
; [exec]
; var _12: Ref
(declare-const _12@39@01 $Ref)
; [exec]
; var _13: Ref
(declare-const _13@40@01 $Ref)
; [exec]
; var _14: Ref
(declare-const _14@41@01 $Ref)
; [exec]
; var _15: Int
(declare-const _15@42@01 Int)
; [exec]
; var _16: Ref
(declare-const _16@43@01 $Ref)
; [exec]
; var _17: Ref
(declare-const _17@44@01 $Ref)
; [exec]
; var _18: Int
(declare-const _18@45@01 Int)
; [exec]
; var _19: Ref
(declare-const _19@46@01 $Ref)
; [exec]
; var _20: Ref
(declare-const _20@47@01 $Ref)
; [exec]
; var _21: Ref
(declare-const _21@48@01 $Ref)
; [exec]
; var _22: Int
(declare-const _22@49@01 Int)
; [exec]
; var _23: Ref
(declare-const _23@50@01 $Ref)
; [exec]
; var _24: Int
(declare-const _24@51@01 Int)
; [exec]
; var _25: Ref
(declare-const _25@52@01 $Ref)
; [exec]
; var _26: Int
(declare-const _26@53@01 Int)
; [exec]
; var _27: Int
(declare-const _27@54@01 Int)
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
; inhale acc(_1.val_ref, write) && acc(struct$m_Path(_1.val_ref), read$())
(declare-const $t@55@01 $Snap)
(assert (= $t@55@01 ($Snap.combine ($Snap.first $t@55@01) ($Snap.second $t@55@01))))
(assert (not (= _1@28@01 $Ref.null)))
; [eval] read$()
(push) ; 3
(assert (read$%precondition $Snap.unit))
(pop) ; 3
; Joined path conditions
(assert (read$%precondition $Snap.unit))
(push) ; 3
(assert (not (or (= (read$ $Snap.unit) $Perm.No) (< $Perm.No (read$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (<= $Perm.No (read$ $Snap.unit)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label pre
; [exec]
; __t0 := true
; [exec]
; _9 := builtin$havoc_ref()
(declare-const ret@56@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_9.val_ref, write)
(declare-const $t@57@01 $Ref)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= _1@28@01 ret@56@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@56@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; unfold acc(struct$m_Path(_1.val_ref), read$())
; [eval] read$()
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (< $Perm.No (read$ $Snap.unit))))
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
(assert (=
  ($Snap.second $t@55@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@55@01))
    ($Snap.second ($Snap.second $t@55@01)))))
(assert (<= (read$ $Snap.unit) $Perm.Write))
(assert (=>
  (< $Perm.No (read$ $Snap.unit))
  (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second $t@55@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@55@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
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
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
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
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (struct$m_Path%trigger ($Snap.second $t@55@01) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))
; [exec]
; _9.val_ref := _1.val_ref.f$entries
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const val_ref@58@01 $Ref)
(assert (=
  val_ref@58@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= _1@28@01 ret@56@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [exec]
; inhale acc(Array$64$usize(_9.val_ref), read$())
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
(declare-const $t@59@01 $Snap)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))))
  val_ref@58@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))
  val_ref@58@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const $t@60@01 $Snap)
(assert (and
  (=>
    (< $Perm.No (read$ $Snap.unit))
    (=
      $t@60@01
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))))
  (=> (< $Perm.No (read$ $Snap.unit)) (= $t@60@01 $t@59@01))))
(assert (<= $Perm.No (+ (read$ $Snap.unit) (read$ $Snap.unit))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label l0
; [exec]
; label l1
; [exec]
; _8 := builtin$havoc_ref()
(declare-const ret@61@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_8.val_ref, write)
(declare-const $t@62@01 $Ref)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= ret@56@01 ret@61@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= _1@28@01 ret@61@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@61@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(Slice$usize(_8.val_ref), read$())
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
(declare-const $t@63@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale Slice$len__$TY$__usize$Slice$usize$$int$(_8.val_ref) == 64
(declare-const $t@64@01 $Snap)
(assert (= $t@64@01 $Snap.unit))
; [eval] Slice$len__$TY$__usize$Slice$usize$$int$(_8.val_ref) == 64
; [eval] Slice$len__$TY$__usize$Slice$usize$$int$(_8.val_ref)
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
(assert (Slice$len__$TY$__usize$Slice$usize$$int$%precondition $t@63@01 $t@62@01))
(pop) ; 3
; Joined path conditions
(assert (Slice$len__$TY$__usize$Slice$usize$$int$%precondition $t@63@01 $t@62@01))
(assert (= (Slice$len__$TY$__usize$Slice$usize$$int$ $t@63@01 $t@62@01) 64))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (let _LET_0 ==
;     (_9.val_ref) in
;     (let _LET_1 ==
;       (_8.val_ref) in
;       (forall i: Int ::
;         { lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_9.val_ref,
;         i) }
;         { lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$(_8.val_ref,
;         i) }
;         0 <= i && i < 64 ==>
;         lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_LET_0,
;         i) ==
;         lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$(_LET_1,
;         i))))
(declare-const $t@65@01 $Snap)
(assert (= $t@65@01 $Snap.unit))
; [eval] (let _LET_0 == (_9.val_ref) in (let _LET_1 == (_8.val_ref) in (forall i: Int :: { lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_9.val_ref, i) } { lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$(_8.val_ref, i) } 0 <= i && i < 64 ==> lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_LET_0, i) == lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$(_LET_1, i))))
(declare-const letvar@66@01 $Ref)
(assert (= (as letvar@66@01  $Ref) val_ref@58@01))
; [eval] (let _LET_1 == (_8.val_ref) in (forall i: Int :: { lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_9.val_ref, i) } { lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$(_8.val_ref, i) } 0 <= i && i < 64 ==> lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_LET_0, i) == lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$(_LET_1, i)))
(declare-const letvar@67@01 $Ref)
(assert (= (as letvar@67@01  $Ref) $t@62@01))
; [eval] (forall i: Int :: { lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_9.val_ref, i) } { lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$(_8.val_ref, i) } 0 <= i && i < 64 ==> lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_LET_0, i) == lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$(_LET_1, i))
(declare-const i@68@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i && i < 64 ==> lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_LET_0, i) == lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$(_LET_1, i)
; [eval] 0 <= i && i < 64
; [eval] 0 <= i
(push) ; 4
; [then-branch: 0 | 0 <= i@68@01 | live]
; [else-branch: 0 | !(0 <= i@68@01) | live]
(push) ; 5
; [then-branch: 0 | 0 <= i@68@01]
(assert (<= 0 i@68@01))
; [eval] i < 64
(pop) ; 5
(push) ; 5
; [else-branch: 0 | !(0 <= i@68@01)]
(assert (not (<= 0 i@68@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 i@68@01)) (<= 0 i@68@01)))
(push) ; 4
; [then-branch: 1 | i@68@01 < 64 && 0 <= i@68@01 | live]
; [else-branch: 1 | !(i@68@01 < 64 && 0 <= i@68@01) | live]
(push) ; 5
; [then-branch: 1 | i@68@01 < 64 && 0 <= i@68@01]
(assert (and (< i@68@01 64) (<= 0 i@68@01)))
; [eval] lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_LET_0, i) == lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$(_LET_1, i)
; [eval] lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_LET_0, i)
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
  val_ref@58@01)))
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
    (+ (read$ $Snap.unit) (read$ $Snap.unit))
    ($Perm.min (+ (read$ $Snap.unit) (read$ $Snap.unit)) (read$ $Snap.unit)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (<=
  $Perm.No
  (-
    (+ (read$ $Snap.unit) (read$ $Snap.unit))
    ($Perm.min (+ (read$ $Snap.unit) (read$ $Snap.unit)) (read$ $Snap.unit)))))
(set-option :timeout 0)
(push) ; 7
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min (+ (read$ $Snap.unit) (read$ $Snap.unit)) (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min (+ (read$ $Snap.unit) (read$ $Snap.unit)) (read$ $Snap.unit)))
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
  $t@60@01
  ($Snap.combine $Snap.unit $Snap.unit)) val_ref@58@01 i@68@01))
(pop) ; 6
; Joined path conditions
(assert (and
  (<=
    $Perm.No
    (-
      (+ (read$ $Snap.unit) (read$ $Snap.unit))
      ($Perm.min (+ (read$ $Snap.unit) (read$ $Snap.unit)) (read$ $Snap.unit))))
  (lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$%precondition ($Snap.combine
    $t@60@01
    ($Snap.combine $Snap.unit $Snap.unit)) val_ref@58@01 i@68@01)))
; [eval] lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$(_LET_1, i)
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
(assert (not (< i@68@01 (Slice$len__$TY$__usize$Slice$usize$$int$ $t@63@01 $t@62@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (< i@68@01 (Slice$len__$TY$__usize$Slice$usize$$int$ $t@63@01 $t@62@01)))
(assert (lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$%precondition ($Snap.combine
  $t@63@01
  ($Snap.combine $Snap.unit $Snap.unit)) $t@62@01 i@68@01))
(pop) ; 6
; Joined path conditions
(assert (and
  (< i@68@01 (Slice$len__$TY$__usize$Slice$usize$$int$ $t@63@01 $t@62@01))
  (lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$%precondition ($Snap.combine
    $t@63@01
    ($Snap.combine $Snap.unit $Snap.unit)) $t@62@01 i@68@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 1 | !(i@68@01 < 64 && 0 <= i@68@01)]
(assert (not (and (< i@68@01 64) (<= 0 i@68@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and (< i@68@01 64) (<= 0 i@68@01))
  (and
    (< i@68@01 64)
    (<= 0 i@68@01)
    (<=
      $Perm.No
      (-
        (+ (read$ $Snap.unit) (read$ $Snap.unit))
        ($Perm.min (+ (read$ $Snap.unit) (read$ $Snap.unit)) (read$ $Snap.unit))))
    (lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$%precondition ($Snap.combine
      $t@60@01
      ($Snap.combine $Snap.unit $Snap.unit)) val_ref@58@01 i@68@01)
    (< i@68@01 (Slice$len__$TY$__usize$Slice$usize$$int$ $t@63@01 $t@62@01))
    (lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$%precondition ($Snap.combine
      $t@63@01
      ($Snap.combine $Snap.unit $Snap.unit)) $t@62@01 i@68@01))))
; Joined path conditions
(assert (or
  (not (and (< i@68@01 64) (<= 0 i@68@01)))
  (and (< i@68@01 64) (<= 0 i@68@01))))
; [eval] lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_9.val_ref, i)
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
  val_ref@58@01)))
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
    (+ (read$ $Snap.unit) (read$ $Snap.unit))
    ($Perm.min (+ (read$ $Snap.unit) (read$ $Snap.unit)) (read$ $Snap.unit)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (<=
  $Perm.No
  (-
    (+ (read$ $Snap.unit) (read$ $Snap.unit))
    ($Perm.min (+ (read$ $Snap.unit) (read$ $Snap.unit)) (read$ $Snap.unit)))))
(set-option :timeout 0)
(push) ; 5
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min (+ (read$ $Snap.unit) (read$ $Snap.unit)) (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min (+ (read$ $Snap.unit) (read$ $Snap.unit)) (read$ $Snap.unit)))
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
(assert (not (<= 0 i@68@01)))
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
(assert (not (= ret@61@01 ret@56@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@56@01 _1@28@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@61@01 _1@28@01)))
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
  (< $Perm.No (read$ $Snap.unit))
  (not
    (=
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))
      ($Snap.first ($Snap.second ($Snap.second $t@55@01))))))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (< $Perm.No (read$ $Snap.unit))
  (not
    (=
      ($Snap.first ($Snap.second ($Snap.second $t@55@01)))
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (+ (read$ $Snap.unit) (read$ $Snap.unit)))
    (< $Perm.No (read$ $Snap.unit)))
  (not
    (=
      $t@60@01
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
  (and
    (< $Perm.No (read$ $Snap.unit))
    (< $Perm.No (+ (read$ $Snap.unit) (read$ $Snap.unit))))
  (not
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))
      $t@60@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) $t@62@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= $t@62@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= $t@62@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (and
  (and (not (= _1@28@01 ret@56@01)) (not (= _1@28@01 ret@61@01)))
  (and (not (= ret@56@01 _1@28@01)) (not (= ret@56@01 ret@61@01)))
  (and (not (= ret@61@01 _1@28@01)) (not (= ret@61@01 ret@56@01)))))
; [eval] 0 <= idx
(set-option :timeout 0)
(push) ; 5
(assert (not (<= 0 i@68@01)))
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
(assert (not (= ret@61@01 ret@56@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@56@01 _1@28@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@61@01 _1@28@01)))
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
(assert (not (and
  (< $Perm.No (read$ $Snap.unit))
  (not
    (=
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))
      ($Snap.first ($Snap.second ($Snap.second $t@55@01))))))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (< $Perm.No (read$ $Snap.unit))
  (not
    (=
      ($Snap.first ($Snap.second ($Snap.second $t@55@01)))
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (read$ $Snap.unit))
    (<
      $Perm.No
      (-
        (+ (read$ $Snap.unit) (read$ $Snap.unit))
        ($Perm.min (+ (read$ $Snap.unit) (read$ $Snap.unit)) (read$ $Snap.unit)))))
  (not
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))
      $t@60@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (-
        (+ (read$ $Snap.unit) (read$ $Snap.unit))
        ($Perm.min (+ (read$ $Snap.unit) (read$ $Snap.unit)) (read$ $Snap.unit))))
    (< $Perm.No (read$ $Snap.unit)))
  (not
    (=
      $t@60@01
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))))))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) $t@62@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= $t@62@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= $t@62@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (and
  (and (not (= _1@28@01 ret@56@01)) (not (= _1@28@01 ret@61@01)))
  (and (not (= ret@56@01 _1@28@01)) (not (= ret@56@01 ret@61@01)))
  (and (not (= ret@61@01 _1@28@01)) (not (= ret@61@01 ret@56@01)))))
; [eval] 0 <= idx
(set-option :timeout 0)
(push) ; 5
(assert (not (<= 0 i@68@01)))
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
(assert (not (= ret@61@01 ret@56@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@56@01 _1@28@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@61@01 _1@28@01)))
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
  (< $Perm.No (read$ $Snap.unit))
  (not
    (=
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))
      ($Snap.first ($Snap.second ($Snap.second $t@55@01))))))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (< $Perm.No (read$ $Snap.unit))
  (not
    (=
      ($Snap.first ($Snap.second ($Snap.second $t@55@01)))
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (+ (read$ $Snap.unit) (read$ $Snap.unit)))
    (< $Perm.No (read$ $Snap.unit)))
  (not
    (=
      $t@60@01
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
  (and
    (< $Perm.No (read$ $Snap.unit))
    (< $Perm.No (+ (read$ $Snap.unit) (read$ $Snap.unit))))
  (not
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))
      $t@60@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) $t@62@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= $t@62@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= $t@62@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (and
  (and (not (= _1@28@01 ret@56@01)) (not (= _1@28@01 ret@61@01)))
  (and (not (= ret@56@01 _1@28@01)) (not (= ret@56@01 ret@61@01)))
  (and (not (= ret@61@01 _1@28@01)) (not (= ret@61@01 ret@56@01)))))
; [eval] 0 <= idx
(set-option :timeout 0)
(push) ; 5
(assert (not (<= 0 i@68@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(pop) ; 4
; [eval] lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$(_8.val_ref, i)
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
(assert (not (<= 0 i@68@01)))
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
(assert (not (= ret@61@01 ret@56@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@56@01 _1@28@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@61@01 _1@28@01)))
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
  (< $Perm.No (read$ $Snap.unit))
  (not
    (=
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))
      ($Snap.first ($Snap.second ($Snap.second $t@55@01))))))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (< $Perm.No (read$ $Snap.unit))
  (not
    (=
      ($Snap.first ($Snap.second ($Snap.second $t@55@01)))
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (+ (read$ $Snap.unit) (read$ $Snap.unit)))
    (< $Perm.No (read$ $Snap.unit)))
  (not
    (=
      $t@60@01
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
  (and
    (< $Perm.No (read$ $Snap.unit))
    (< $Perm.No (+ (read$ $Snap.unit) (read$ $Snap.unit))))
  (not
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))
      $t@60@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) $t@62@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= $t@62@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= $t@62@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (and
  (and (not (= _1@28@01 ret@56@01)) (not (= _1@28@01 ret@61@01)))
  (and (not (= ret@56@01 _1@28@01)) (not (= ret@56@01 ret@61@01)))
  (and (not (= ret@61@01 _1@28@01)) (not (= ret@61@01 ret@56@01)))))
; [eval] 0 <= idx
(set-option :timeout 0)
(push) ; 5
(assert (not (<= 0 i@68@01)))
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
(assert (not (= ret@61@01 ret@56@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@56@01 _1@28@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@61@01 _1@28@01)))
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
  (< $Perm.No (read$ $Snap.unit))
  (not
    (=
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))
      ($Snap.first ($Snap.second ($Snap.second $t@55@01))))))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (< $Perm.No (read$ $Snap.unit))
  (not
    (=
      ($Snap.first ($Snap.second ($Snap.second $t@55@01)))
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (+ (read$ $Snap.unit) (read$ $Snap.unit)))
    (< $Perm.No (read$ $Snap.unit)))
  (not
    (=
      $t@60@01
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
  (and
    (< $Perm.No (read$ $Snap.unit))
    (< $Perm.No (+ (read$ $Snap.unit) (read$ $Snap.unit))))
  (not
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))
      $t@60@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) $t@62@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= $t@62@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= $t@62@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (and
  (and (not (= _1@28@01 ret@56@01)) (not (= _1@28@01 ret@61@01)))
  (and (not (= ret@56@01 _1@28@01)) (not (= ret@56@01 ret@61@01)))
  (and (not (= ret@61@01 _1@28@01)) (not (= ret@61@01 ret@56@01)))))
; [eval] 0 <= idx
(set-option :timeout 0)
(push) ; 5
(assert (not (<= 0 i@68@01)))
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
(assert (not (= ret@61@01 ret@56@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@56@01 _1@28@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@61@01 _1@28@01)))
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
  (< $Perm.No (read$ $Snap.unit))
  (not
    (=
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))
      ($Snap.first ($Snap.second ($Snap.second $t@55@01))))))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (< $Perm.No (read$ $Snap.unit))
  (not
    (=
      ($Snap.first ($Snap.second ($Snap.second $t@55@01)))
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (+ (read$ $Snap.unit) (read$ $Snap.unit)))
    (< $Perm.No (read$ $Snap.unit)))
  (not
    (=
      $t@60@01
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
  (and
    (< $Perm.No (read$ $Snap.unit))
    (< $Perm.No (+ (read$ $Snap.unit) (read$ $Snap.unit))))
  (not
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))
      $t@60@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) $t@62@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= $t@62@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= $t@62@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (and
  (and (not (= _1@28@01 ret@56@01)) (not (= _1@28@01 ret@61@01)))
  (and (not (= ret@56@01 _1@28@01)) (not (= ret@56@01 ret@61@01)))
  (and (not (= ret@61@01 _1@28@01)) (not (= ret@61@01 ret@56@01)))))
; [eval] 0 <= idx
(set-option :timeout 0)
(push) ; 5
(assert (not (<= 0 i@68@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(pop) ; 4
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@68@01 Int)) (!
  (and
    (or (not (<= 0 i@68@01)) (<= 0 i@68@01))
    (=>
      (and (< i@68@01 64) (<= 0 i@68@01))
      (and
        (< i@68@01 64)
        (<= 0 i@68@01)
        (<=
          $Perm.No
          (-
            (+ (read$ $Snap.unit) (read$ $Snap.unit))
            ($Perm.min
              (+ (read$ $Snap.unit) (read$ $Snap.unit))
              (read$ $Snap.unit))))
        (lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$%precondition ($Snap.combine
          $t@60@01
          ($Snap.combine $Snap.unit $Snap.unit)) val_ref@58@01 i@68@01)
        (< i@68@01 (Slice$len__$TY$__usize$Slice$usize$$int$ $t@63@01 $t@62@01))
        (lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$%precondition ($Snap.combine
          $t@63@01
          ($Snap.combine $Snap.unit $Snap.unit)) $t@62@01 i@68@01)))
    (or
      (not (and (< i@68@01 64) (<= 0 i@68@01)))
      (and (< i@68@01 64) (<= 0 i@68@01))))
  
  :qid |prog.l414-aux|)))
(assert (forall ((i@68@01 Int)) (!
  (=>
    (and (< i@68@01 64) (<= 0 i@68@01))
    (=
      (lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$ ($Snap.combine
        $t@60@01
        ($Snap.combine $Snap.unit $Snap.unit)) val_ref@58@01 i@68@01)
      (lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$ ($Snap.combine
        $t@63@01
        ($Snap.combine $Snap.unit $Snap.unit)) $t@62@01 i@68@01)))
  
  :qid |prog.l414|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label l2
; [exec]
; _7 := builtin$havoc_int()
(declare-const ret@69@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _7 := Slice$len__$TY$__usize$Slice$usize$$int$(_8.val_ref)
; [eval] Slice$len__$TY$__usize$Slice$usize$$int$(_8.val_ref)
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
(declare-const _7@70@01 Int)
(assert (= _7@70@01 (Slice$len__$TY$__usize$Slice$usize$$int$ $t@63@01 $t@62@01)))
; [eval] __t0 && (__t0 && __t0)
(set-option :timeout 0)
(push) ; 3
; [then-branch: 2 | True | live]
; [else-branch: 2 | False | live]
(push) ; 4
; [then-branch: 2 | True]
(push) ; 5
; [then-branch: 3 | True | live]
; [else-branch: 3 | False | live]
(push) ; 6
; [then-branch: 3 | True]
(pop) ; 6
(push) ; 6
; [else-branch: 3 | False]
(assert false)
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(pop) ; 4
(push) ; 4
; [else-branch: 2 | False]
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
; [then-branch: 4 | True | live]
; [else-branch: 4 | False | dead]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 4 | True]
; [exec]
; exhale acc(Array$64$usize(_9.val_ref), read$())
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
  val_ref@58@01)))
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
    (+ (read$ $Snap.unit) (read$ $Snap.unit))
    ($Perm.min (+ (read$ $Snap.unit) (read$ $Snap.unit)) (read$ $Snap.unit)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (<=
  $Perm.No
  (-
    (+ (read$ $Snap.unit) (read$ $Snap.unit))
    ($Perm.min (+ (read$ $Snap.unit) (read$ $Snap.unit)) (read$ $Snap.unit)))))
(set-option :timeout 0)
(push) ; 4
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min (+ (read$ $Snap.unit) (read$ $Snap.unit)) (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min (+ (read$ $Snap.unit) (read$ $Snap.unit)) (read$ $Snap.unit)))
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
; __t1 := true
; [exec]
; _6 := builtin$havoc_ref()
(declare-const ret@71@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_6.val_bool, write)
(declare-const $t@72@01 Bool)
(assert (not (= ret@71@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _6.val_bool := _7 == 64
; [eval] _7 == 64
(declare-const val_bool@73@01 Bool)
(assert (= val_bool@73@01 (= _7@70@01 64)))
; [exec]
; __t20 := _6.val_bool
; [eval] !__t20
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not val_bool@73@01))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [then-branch: 5 | !(val_bool@73@01) | dead]
; [else-branch: 5 | val_bool@73@01 | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 5 | val_bool@73@01]
(assert val_bool@73@01)
(pop) ; 4
; [eval] !!__t20
; [eval] !__t20
(push) ; 4
(set-option :timeout 10)
(assert (not (not val_bool@73@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not val_bool@73@01))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [then-branch: 6 | val_bool@73@01 | live]
; [else-branch: 6 | !(val_bool@73@01) | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 6 | val_bool@73@01]
(assert val_bool@73@01)
; [exec]
; label return
; [exec]
; __t2 := true
; [exec]
; _13 := builtin$havoc_ref()
(declare-const ret@74@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_13.val_ref, write)
(declare-const $t@75@01 $Ref)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@61@01 ret@74@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@56@01 ret@74@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _1@28@01 ret@74@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@74@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _13.val_ref := _1.val_ref.f$max_counts
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(declare-const val_ref@76@01 $Ref)
(assert (=
  val_ref@76@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))))))
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _1@28@01 ret@74@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@56@01 ret@74@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@61@01 ret@74@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [exec]
; inhale acc(Array$64$usize(_13.val_ref), read$())
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
(declare-const $t@77@01 $Snap)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))
  val_ref@76@01)))
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
  val_ref@76@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(declare-const $t@78@01 $Snap)
(assert (and
  (=>
    (< $Perm.No (read$ $Snap.unit))
    (=
      $t@78@01
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))))
  (=> (< $Perm.No (read$ $Snap.unit)) (= $t@78@01 $t@77@01))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label l6
; [exec]
; label l7
; [exec]
; _12 := builtin$havoc_ref()
(declare-const ret@79@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_12.val_ref, write)
(declare-const $t@80@01 $Ref)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@74@01 ret@79@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= _1@28@01 ret@79@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@56@01 ret@79@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= ret@61@01 ret@79@01)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@79@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(Slice$usize(_12.val_ref), read$())
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
(declare-const $t@81@01 $Snap)
(push) ; 5
(set-option :timeout 10)
(assert (not (= $t@62@01 $t@80@01)))
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
; inhale Slice$len__$TY$__usize$Slice$usize$$int$(_12.val_ref) == 64
(declare-const $t@82@01 $Snap)
(assert (= $t@82@01 $Snap.unit))
; [eval] Slice$len__$TY$__usize$Slice$usize$$int$(_12.val_ref) == 64
; [eval] Slice$len__$TY$__usize$Slice$usize$$int$(_12.val_ref)
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
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (Slice$len__$TY$__usize$Slice$usize$$int$%precondition $t@81@01 $t@80@01))
(pop) ; 5
; Joined path conditions
(assert (Slice$len__$TY$__usize$Slice$usize$$int$%precondition $t@81@01 $t@80@01))
(assert (= (Slice$len__$TY$__usize$Slice$usize$$int$ $t@81@01 $t@80@01) 64))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (let _LET_2 ==
;     (_13.val_ref) in
;     (let _LET_3 ==
;       (_12.val_ref) in
;       (forall i: Int ::
;         { lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_13.val_ref,
;         i) }
;         { lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$(_12.val_ref,
;         i) }
;         0 <= i && i < 64 ==>
;         lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_LET_2,
;         i) ==
;         lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$(_LET_3,
;         i))))
(declare-const $t@83@01 $Snap)
(assert (= $t@83@01 $Snap.unit))
; [eval] (let _LET_2 == (_13.val_ref) in (let _LET_3 == (_12.val_ref) in (forall i: Int :: { lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_13.val_ref, i) } { lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$(_12.val_ref, i) } 0 <= i && i < 64 ==> lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_LET_2, i) == lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$(_LET_3, i))))
(declare-const letvar@84@01 $Ref)
(assert (= (as letvar@84@01  $Ref) val_ref@76@01))
; [eval] (let _LET_3 == (_12.val_ref) in (forall i: Int :: { lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_13.val_ref, i) } { lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$(_12.val_ref, i) } 0 <= i && i < 64 ==> lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_LET_2, i) == lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$(_LET_3, i)))
(declare-const letvar@85@01 $Ref)
(assert (= (as letvar@85@01  $Ref) $t@80@01))
; [eval] (forall i: Int :: { lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_13.val_ref, i) } { lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$(_12.val_ref, i) } 0 <= i && i < 64 ==> lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_LET_2, i) == lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$(_LET_3, i))
(declare-const i@86@01 Int)
(set-option :timeout 0)
(push) ; 5
; [eval] 0 <= i && i < 64 ==> lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_LET_2, i) == lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$(_LET_3, i)
; [eval] 0 <= i && i < 64
; [eval] 0 <= i
(push) ; 6
; [then-branch: 7 | 0 <= i@86@01 | live]
; [else-branch: 7 | !(0 <= i@86@01) | live]
(push) ; 7
; [then-branch: 7 | 0 <= i@86@01]
(assert (<= 0 i@86@01))
; [eval] i < 64
(pop) ; 7
(push) ; 7
; [else-branch: 7 | !(0 <= i@86@01)]
(assert (not (<= 0 i@86@01)))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 i@86@01)) (<= 0 i@86@01)))
(push) ; 6
; [then-branch: 8 | i@86@01 < 64 && 0 <= i@86@01 | live]
; [else-branch: 8 | !(i@86@01 < 64 && 0 <= i@86@01) | live]
(push) ; 7
; [then-branch: 8 | i@86@01 < 64 && 0 <= i@86@01]
(assert (and (< i@86@01 64) (<= 0 i@86@01)))
; [eval] lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_LET_2, i) == lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$(_LET_3, i)
; [eval] lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_LET_2, i)
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
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))))
  val_ref@76@01)))
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
    (+ (read$ $Snap.unit) (read$ $Snap.unit))
    ($Perm.min (+ (read$ $Snap.unit) (read$ $Snap.unit)) (read$ $Snap.unit)))
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
      ($Perm.min (+ (read$ $Snap.unit) (read$ $Snap.unit)) (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min (+ (read$ $Snap.unit) (read$ $Snap.unit)) (read$ $Snap.unit)))
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
; [eval] idx < 64
(assert (lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$%precondition ($Snap.combine
  $t@78@01
  ($Snap.combine $Snap.unit $Snap.unit)) val_ref@76@01 i@86@01))
(pop) ; 8
; Joined path conditions
(assert (lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$%precondition ($Snap.combine
  $t@78@01
  ($Snap.combine $Snap.unit $Snap.unit)) val_ref@76@01 i@86@01))
; [eval] lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$(_LET_3, i)
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
; [eval] 0 <= idx
; [eval] idx < Slice$len__$TY$__usize$Slice$usize$$int$(self)
; [eval] Slice$len__$TY$__usize$Slice$usize$$int$(self)
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
(assert (not (< i@86@01 (Slice$len__$TY$__usize$Slice$usize$$int$ $t@81@01 $t@80@01))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (< i@86@01 (Slice$len__$TY$__usize$Slice$usize$$int$ $t@81@01 $t@80@01)))
(assert (lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$%precondition ($Snap.combine
  $t@81@01
  ($Snap.combine $Snap.unit $Snap.unit)) $t@80@01 i@86@01))
(pop) ; 8
; Joined path conditions
(assert (and
  (< i@86@01 (Slice$len__$TY$__usize$Slice$usize$$int$ $t@81@01 $t@80@01))
  (lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$%precondition ($Snap.combine
    $t@81@01
    ($Snap.combine $Snap.unit $Snap.unit)) $t@80@01 i@86@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 8 | !(i@86@01 < 64 && 0 <= i@86@01)]
(assert (not (and (< i@86@01 64) (<= 0 i@86@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (and (< i@86@01 64) (<= 0 i@86@01))
  (and
    (< i@86@01 64)
    (<= 0 i@86@01)
    (lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$%precondition ($Snap.combine
      $t@78@01
      ($Snap.combine $Snap.unit $Snap.unit)) val_ref@76@01 i@86@01)
    (< i@86@01 (Slice$len__$TY$__usize$Slice$usize$$int$ $t@81@01 $t@80@01))
    (lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$%precondition ($Snap.combine
      $t@81@01
      ($Snap.combine $Snap.unit $Snap.unit)) $t@80@01 i@86@01))))
; Joined path conditions
(assert (or
  (not (and (< i@86@01 64) (<= 0 i@86@01)))
  (and (< i@86@01 64) (<= 0 i@86@01))))
; [eval] lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_13.val_ref, i)
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
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))))
  val_ref@76@01)))
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
    (+ (read$ $Snap.unit) (read$ $Snap.unit))
    ($Perm.min (+ (read$ $Snap.unit) (read$ $Snap.unit)) (read$ $Snap.unit)))
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
      ($Perm.min (+ (read$ $Snap.unit) (read$ $Snap.unit)) (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min (+ (read$ $Snap.unit) (read$ $Snap.unit)) (read$ $Snap.unit)))
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
(set-option :timeout 0)
(push) ; 7
(assert (not (<= 0 i@86@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@79@01 ret@74@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01))))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@74@01 _1@28@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@79@01 _1@28@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= _1@28@01 ret@56@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@74@01 ret@56@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@79@01 ret@56@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@56@01 ret@61@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= _1@28@01 ret@61@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@74@01 ret@61@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@79@01 ret@61@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@62@01 $t@80@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@81@01 $t@63@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@63@01 $t@81@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (< $Perm.No (read$ $Snap.unit))
  (not
    (=
      ($Snap.first ($Snap.second ($Snap.second $t@55@01)))
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (< $Perm.No (read$ $Snap.unit))
  (not
    (=
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))
      ($Snap.first ($Snap.second ($Snap.second $t@55@01))))))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (+ (read$ $Snap.unit) (read$ $Snap.unit)))
    (<
      $Perm.No
      (-
        (+ (read$ $Snap.unit) (read$ $Snap.unit))
        ($Perm.min (+ (read$ $Snap.unit) (read$ $Snap.unit)) (read$ $Snap.unit)))))
  (not (= $t@78@01 $t@60@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (-
        (+ (read$ $Snap.unit) (read$ $Snap.unit))
        ($Perm.min (+ (read$ $Snap.unit) (read$ $Snap.unit)) (read$ $Snap.unit))))
    (< $Perm.No (+ (read$ $Snap.unit) (read$ $Snap.unit))))
  (not (= $t@60@01 $t@78@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= $t@62@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= $t@62@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= $t@62@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= $t@62@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) $t@62@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) $t@80@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= $t@80@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= $t@80@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= $t@80@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= $t@80@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (and
  (and
    (not (= ret@61@01 ret@56@01))
    (not (= ret@61@01 _1@28@01))
    (not (= ret@61@01 ret@74@01))
    (not (= ret@61@01 ret@79@01)))
  (and
    (not (= ret@56@01 ret@61@01))
    (not (= ret@56@01 _1@28@01))
    (not (= ret@56@01 ret@74@01))
    (not (= ret@56@01 ret@79@01)))
  (and
    (not (= _1@28@01 ret@61@01))
    (not (= _1@28@01 ret@56@01))
    (not (= _1@28@01 ret@74@01))
    (not (= _1@28@01 ret@79@01)))
  (and
    (not (= ret@74@01 ret@61@01))
    (not (= ret@74@01 ret@56@01))
    (not (= ret@74@01 _1@28@01))
    (not (= ret@74@01 ret@79@01)))
  (and
    (not (= ret@79@01 ret@61@01))
    (not (= ret@79@01 ret@56@01))
    (not (= ret@79@01 _1@28@01))
    (not (= ret@79@01 ret@74@01)))))
; [eval] 0 <= idx
(set-option :timeout 0)
(push) ; 7
(assert (not (<= 0 i@86@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@79@01 ret@74@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01))))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@74@01 _1@28@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@79@01 _1@28@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= _1@28@01 ret@56@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@74@01 ret@56@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@79@01 ret@56@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@56@01 ret@61@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= _1@28@01 ret@61@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@74@01 ret@61@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@79@01 ret@61@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@62@01 $t@80@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@81@01 $t@63@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@63@01 $t@81@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (< $Perm.No (read$ $Snap.unit))
  (not
    (=
      ($Snap.first ($Snap.second ($Snap.second $t@55@01)))
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (< $Perm.No (read$ $Snap.unit))
  (not
    (=
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))
      ($Snap.first ($Snap.second ($Snap.second $t@55@01))))))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (<
    $Perm.No
    (-
      (+ (read$ $Snap.unit) (read$ $Snap.unit))
      ($Perm.min (+ (read$ $Snap.unit) (read$ $Snap.unit)) (read$ $Snap.unit))))
  (not (= $t@60@01 $t@78@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (<
    $Perm.No
    (-
      (+ (read$ $Snap.unit) (read$ $Snap.unit))
      ($Perm.min (+ (read$ $Snap.unit) (read$ $Snap.unit)) (read$ $Snap.unit))))
  (not (= $t@78@01 $t@60@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= $t@62@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= $t@62@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= $t@62@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= $t@62@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) $t@62@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) $t@80@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= $t@80@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= $t@80@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= $t@80@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= $t@80@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (and
  (and
    (not (= ret@61@01 ret@56@01))
    (not (= ret@61@01 _1@28@01))
    (not (= ret@61@01 ret@74@01))
    (not (= ret@61@01 ret@79@01)))
  (and
    (not (= ret@56@01 ret@61@01))
    (not (= ret@56@01 _1@28@01))
    (not (= ret@56@01 ret@74@01))
    (not (= ret@56@01 ret@79@01)))
  (and
    (not (= _1@28@01 ret@61@01))
    (not (= _1@28@01 ret@56@01))
    (not (= _1@28@01 ret@74@01))
    (not (= _1@28@01 ret@79@01)))
  (and
    (not (= ret@74@01 ret@61@01))
    (not (= ret@74@01 ret@56@01))
    (not (= ret@74@01 _1@28@01))
    (not (= ret@74@01 ret@79@01)))
  (and
    (not (= ret@79@01 ret@61@01))
    (not (= ret@79@01 ret@56@01))
    (not (= ret@79@01 _1@28@01))
    (not (= ret@79@01 ret@74@01)))))
; [eval] 0 <= idx
(set-option :timeout 0)
(push) ; 7
(assert (not (<= 0 i@86@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@79@01 ret@74@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01))))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@74@01 _1@28@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@79@01 _1@28@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= _1@28@01 ret@56@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@74@01 ret@56@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@79@01 ret@56@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@56@01 ret@61@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= _1@28@01 ret@61@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@74@01 ret@61@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@79@01 ret@61@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@62@01 $t@80@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@81@01 $t@63@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@63@01 $t@81@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (< $Perm.No (read$ $Snap.unit))
  (not
    (=
      ($Snap.first ($Snap.second ($Snap.second $t@55@01)))
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (< $Perm.No (read$ $Snap.unit))
  (not
    (=
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))
      ($Snap.first ($Snap.second ($Snap.second $t@55@01))))))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (+ (read$ $Snap.unit) (read$ $Snap.unit)))
    (<
      $Perm.No
      (-
        (+ (read$ $Snap.unit) (read$ $Snap.unit))
        ($Perm.min (+ (read$ $Snap.unit) (read$ $Snap.unit)) (read$ $Snap.unit)))))
  (not (= $t@78@01 $t@60@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (-
        (+ (read$ $Snap.unit) (read$ $Snap.unit))
        ($Perm.min (+ (read$ $Snap.unit) (read$ $Snap.unit)) (read$ $Snap.unit))))
    (< $Perm.No (+ (read$ $Snap.unit) (read$ $Snap.unit))))
  (not (= $t@60@01 $t@78@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= $t@62@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= $t@62@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= $t@62@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= $t@62@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) $t@62@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) $t@80@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= $t@80@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= $t@80@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= $t@80@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= $t@80@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (and
  (and
    (not (= ret@61@01 ret@56@01))
    (not (= ret@61@01 _1@28@01))
    (not (= ret@61@01 ret@74@01))
    (not (= ret@61@01 ret@79@01)))
  (and
    (not (= ret@56@01 ret@61@01))
    (not (= ret@56@01 _1@28@01))
    (not (= ret@56@01 ret@74@01))
    (not (= ret@56@01 ret@79@01)))
  (and
    (not (= _1@28@01 ret@61@01))
    (not (= _1@28@01 ret@56@01))
    (not (= _1@28@01 ret@74@01))
    (not (= _1@28@01 ret@79@01)))
  (and
    (not (= ret@74@01 ret@61@01))
    (not (= ret@74@01 ret@56@01))
    (not (= ret@74@01 _1@28@01))
    (not (= ret@74@01 ret@79@01)))
  (and
    (not (= ret@79@01 ret@61@01))
    (not (= ret@79@01 ret@56@01))
    (not (= ret@79@01 _1@28@01))
    (not (= ret@79@01 ret@74@01)))))
; [eval] 0 <= idx
(set-option :timeout 0)
(push) ; 7
(assert (not (<= 0 i@86@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(pop) ; 6
; [eval] lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$(_12.val_ref, i)
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
(set-option :timeout 0)
(push) ; 7
(assert (not (<= 0 i@86@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@79@01 ret@74@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01))))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@74@01 _1@28@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@79@01 _1@28@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= _1@28@01 ret@56@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@74@01 ret@56@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@79@01 ret@56@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@56@01 ret@61@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= _1@28@01 ret@61@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@74@01 ret@61@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@79@01 ret@61@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@62@01 $t@80@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@81@01 $t@63@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@63@01 $t@81@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (< $Perm.No (read$ $Snap.unit))
  (not
    (=
      ($Snap.first ($Snap.second ($Snap.second $t@55@01)))
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (< $Perm.No (read$ $Snap.unit))
  (not
    (=
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))
      ($Snap.first ($Snap.second ($Snap.second $t@55@01))))))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (+ (read$ $Snap.unit) (read$ $Snap.unit)))
    (<
      $Perm.No
      (-
        (+ (read$ $Snap.unit) (read$ $Snap.unit))
        ($Perm.min (+ (read$ $Snap.unit) (read$ $Snap.unit)) (read$ $Snap.unit)))))
  (not (= $t@78@01 $t@60@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (-
        (+ (read$ $Snap.unit) (read$ $Snap.unit))
        ($Perm.min (+ (read$ $Snap.unit) (read$ $Snap.unit)) (read$ $Snap.unit))))
    (< $Perm.No (+ (read$ $Snap.unit) (read$ $Snap.unit))))
  (not (= $t@60@01 $t@78@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= $t@62@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= $t@62@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= $t@62@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= $t@62@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) $t@62@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) $t@80@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= $t@80@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= $t@80@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= $t@80@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= $t@80@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (and
  (and
    (not (= ret@61@01 ret@56@01))
    (not (= ret@61@01 _1@28@01))
    (not (= ret@61@01 ret@74@01))
    (not (= ret@61@01 ret@79@01)))
  (and
    (not (= ret@56@01 ret@61@01))
    (not (= ret@56@01 _1@28@01))
    (not (= ret@56@01 ret@74@01))
    (not (= ret@56@01 ret@79@01)))
  (and
    (not (= _1@28@01 ret@61@01))
    (not (= _1@28@01 ret@56@01))
    (not (= _1@28@01 ret@74@01))
    (not (= _1@28@01 ret@79@01)))
  (and
    (not (= ret@74@01 ret@61@01))
    (not (= ret@74@01 ret@56@01))
    (not (= ret@74@01 _1@28@01))
    (not (= ret@74@01 ret@79@01)))
  (and
    (not (= ret@79@01 ret@61@01))
    (not (= ret@79@01 ret@56@01))
    (not (= ret@79@01 _1@28@01))
    (not (= ret@79@01 ret@74@01)))))
; [eval] 0 <= idx
(set-option :timeout 0)
(push) ; 7
(assert (not (<= 0 i@86@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@79@01 ret@74@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01))))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@74@01 _1@28@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@79@01 _1@28@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= _1@28@01 ret@56@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@74@01 ret@56@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@79@01 ret@56@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@56@01 ret@61@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= _1@28@01 ret@61@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@74@01 ret@61@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@79@01 ret@61@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (< $Perm.No (read$ $Snap.unit))
  (not
    (=
      ($Snap.first ($Snap.second ($Snap.second $t@55@01)))
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (< $Perm.No (read$ $Snap.unit))
  (not
    (=
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))
      ($Snap.first ($Snap.second ($Snap.second $t@55@01))))))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (+ (read$ $Snap.unit) (read$ $Snap.unit)))
    (<
      $Perm.No
      (-
        (+ (read$ $Snap.unit) (read$ $Snap.unit))
        ($Perm.min (+ (read$ $Snap.unit) (read$ $Snap.unit)) (read$ $Snap.unit)))))
  (not (= $t@78@01 $t@60@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (-
        (+ (read$ $Snap.unit) (read$ $Snap.unit))
        ($Perm.min (+ (read$ $Snap.unit) (read$ $Snap.unit)) (read$ $Snap.unit))))
    (< $Perm.No (+ (read$ $Snap.unit) (read$ $Snap.unit))))
  (not (= $t@60@01 $t@78@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= $t@62@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= $t@62@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= $t@62@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= $t@62@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) $t@62@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) $t@80@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= $t@80@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= $t@80@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= $t@80@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= $t@80@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (and
  (and
    (not (= ret@61@01 ret@56@01))
    (not (= ret@61@01 _1@28@01))
    (not (= ret@61@01 ret@74@01))
    (not (= ret@61@01 ret@79@01)))
  (and
    (not (= ret@56@01 ret@61@01))
    (not (= ret@56@01 _1@28@01))
    (not (= ret@56@01 ret@74@01))
    (not (= ret@56@01 ret@79@01)))
  (and
    (not (= _1@28@01 ret@61@01))
    (not (= _1@28@01 ret@56@01))
    (not (= _1@28@01 ret@74@01))
    (not (= _1@28@01 ret@79@01)))
  (and
    (not (= ret@74@01 ret@61@01))
    (not (= ret@74@01 ret@56@01))
    (not (= ret@74@01 _1@28@01))
    (not (= ret@74@01 ret@79@01)))
  (and
    (not (= ret@79@01 ret@61@01))
    (not (= ret@79@01 ret@56@01))
    (not (= ret@79@01 _1@28@01))
    (not (= ret@79@01 ret@74@01)))))
; [eval] 0 <= idx
(set-option :timeout 0)
(push) ; 7
(assert (not (<= 0 i@86@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@79@01 ret@74@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01))))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@74@01 _1@28@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@79@01 _1@28@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= _1@28@01 ret@56@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@74@01 ret@56@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@79@01 ret@56@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@56@01 ret@61@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= _1@28@01 ret@61@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@74@01 ret@61@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@79@01 ret@61@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@62@01 $t@80@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@81@01 $t@63@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@63@01 $t@81@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (< $Perm.No (read$ $Snap.unit))
  (not
    (=
      ($Snap.first ($Snap.second ($Snap.second $t@55@01)))
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (< $Perm.No (read$ $Snap.unit))
  (not
    (=
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))
      ($Snap.first ($Snap.second ($Snap.second $t@55@01))))))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (< $Perm.No (+ (read$ $Snap.unit) (read$ $Snap.unit)))
    (<
      $Perm.No
      (-
        (+ (read$ $Snap.unit) (read$ $Snap.unit))
        ($Perm.min (+ (read$ $Snap.unit) (read$ $Snap.unit)) (read$ $Snap.unit)))))
  (not (= $t@78@01 $t@60@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (-
        (+ (read$ $Snap.unit) (read$ $Snap.unit))
        ($Perm.min (+ (read$ $Snap.unit) (read$ $Snap.unit)) (read$ $Snap.unit))))
    (< $Perm.No (+ (read$ $Snap.unit) (read$ $Snap.unit))))
  (not (= $t@60@01 $t@78@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= $t@62@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= $t@62@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= $t@62@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= $t@62@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) $t@62@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) $t@80@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= $t@80@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= $t@80@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= $t@80@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (not (= $t@80@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (and
  (and
    (not (= ret@61@01 ret@56@01))
    (not (= ret@61@01 _1@28@01))
    (not (= ret@61@01 ret@74@01))
    (not (= ret@61@01 ret@79@01)))
  (and
    (not (= ret@56@01 ret@61@01))
    (not (= ret@56@01 _1@28@01))
    (not (= ret@56@01 ret@74@01))
    (not (= ret@56@01 ret@79@01)))
  (and
    (not (= _1@28@01 ret@61@01))
    (not (= _1@28@01 ret@56@01))
    (not (= _1@28@01 ret@74@01))
    (not (= _1@28@01 ret@79@01)))
  (and
    (not (= ret@74@01 ret@61@01))
    (not (= ret@74@01 ret@56@01))
    (not (= ret@74@01 _1@28@01))
    (not (= ret@74@01 ret@79@01)))
  (and
    (not (= ret@79@01 ret@61@01))
    (not (= ret@79@01 ret@56@01))
    (not (= ret@79@01 _1@28@01))
    (not (= ret@79@01 ret@74@01)))))
; [eval] 0 <= idx
(set-option :timeout 0)
(push) ; 7
(assert (not (<= 0 i@86@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(pop) ; 6
(pop) ; 5
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@86@01 Int)) (!
  (and
    (or (not (<= 0 i@86@01)) (<= 0 i@86@01))
    (=>
      (and (< i@86@01 64) (<= 0 i@86@01))
      (and
        (< i@86@01 64)
        (<= 0 i@86@01)
        (lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$%precondition ($Snap.combine
          $t@78@01
          ($Snap.combine $Snap.unit $Snap.unit)) val_ref@76@01 i@86@01)
        (< i@86@01 (Slice$len__$TY$__usize$Slice$usize$$int$ $t@81@01 $t@80@01))
        (lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$%precondition ($Snap.combine
          $t@81@01
          ($Snap.combine $Snap.unit $Snap.unit)) $t@80@01 i@86@01)))
    (or
      (not (and (< i@86@01 64) (<= 0 i@86@01)))
      (and (< i@86@01 64) (<= 0 i@86@01))))
  
  :qid |prog.l824-aux|)))
(assert (forall ((i@86@01 Int)) (!
  (=>
    (and (< i@86@01 64) (<= 0 i@86@01))
    (=
      (lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$ ($Snap.combine
        $t@78@01
        ($Snap.combine $Snap.unit $Snap.unit)) val_ref@76@01 i@86@01)
      (lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$ ($Snap.combine
        $t@81@01
        ($Snap.combine $Snap.unit $Snap.unit)) $t@80@01 i@86@01)))
  
  :qid |prog.l824|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label l8
; [exec]
; _11 := builtin$havoc_int()
(declare-const ret@87@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _11 := Slice$len__$TY$__usize$Slice$usize$$int$(_12.val_ref)
; [eval] Slice$len__$TY$__usize$Slice$usize$$int$(_12.val_ref)
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
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(pop) ; 5
; Joined path conditions
(declare-const _11@88@01 Int)
(assert (= _11@88@01 (Slice$len__$TY$__usize$Slice$usize$$int$ $t@81@01 $t@80@01)))
; [eval] __t2 && (__t2 && __t2)
(set-option :timeout 0)
(push) ; 5
; [then-branch: 9 | True | live]
; [else-branch: 9 | False | live]
(push) ; 6
; [then-branch: 9 | True]
(push) ; 7
; [then-branch: 10 | True | live]
; [else-branch: 10 | False | live]
(push) ; 8
; [then-branch: 10 | True]
(pop) ; 8
(push) ; 8
; [else-branch: 10 | False]
(assert false)
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(pop) ; 6
(push) ; 6
; [else-branch: 9 | False]
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
; [then-branch: 11 | True | live]
; [else-branch: 11 | False | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 11 | True]
; [exec]
; exhale acc(Array$64$usize(_13.val_ref), read$())
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
  val_ref@76@01)))
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
    (+ (read$ $Snap.unit) (read$ $Snap.unit))
    ($Perm.min (+ (read$ $Snap.unit) (read$ $Snap.unit)) (read$ $Snap.unit)))
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
      ($Perm.min (+ (read$ $Snap.unit) (read$ $Snap.unit)) (read$ $Snap.unit)))
    $Perm.No)
  (<
    (-
      (read$ $Snap.unit)
      ($Perm.min (+ (read$ $Snap.unit) (read$ $Snap.unit)) (read$ $Snap.unit)))
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
; __t3 := true
; [exec]
; _10 := builtin$havoc_ref()
(declare-const ret@89@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_10.val_bool, write)
(declare-const $t@90@01 Bool)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@71@01 ret@89@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@89@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _10.val_bool := _11 == 64
; [eval] _11 == 64
(declare-const val_bool@91@01 Bool)
(assert (= val_bool@91@01 (= _11@88@01 64)))
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= ret@71@01 ret@89@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [exec]
; _5 := _10
; [exec]
; label l10
; [exec]
; label l3
; [exec]
; __t5 := true
; [exec]
; __t21 := _5.val_bool
; [eval] !__t21
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not val_bool@91@01))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [then-branch: 12 | !(val_bool@91@01) | dead]
; [else-branch: 12 | val_bool@91@01 | live]
(set-option :timeout 0)
(push) ; 6
; [else-branch: 12 | val_bool@91@01]
(assert val_bool@91@01)
(pop) ; 6
; [eval] !!__t21
; [eval] !__t21
(push) ; 6
(set-option :timeout 10)
(assert (not (not val_bool@91@01)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not val_bool@91@01))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [then-branch: 13 | val_bool@91@01 | live]
; [else-branch: 13 | !(val_bool@91@01) | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 13 | val_bool@91@01]
(assert val_bool@91@01)
; [exec]
; label bb16
; [exec]
; __t6 := true
; [exec]
; _17 := builtin$havoc_ref()
(declare-const ret@92@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_17.val_ref, write)
(declare-const $t@93@01 $Ref)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@79@01 ret@92@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@74@01 ret@92@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= _1@28@01 ret@92@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@56@01 ret@92@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@61@01 ret@92@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@92@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _17.val_ref := _1.val_ref.f$entries
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(declare-const val_ref@94@01 $Ref)
(assert (=
  val_ref@94@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))))
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@61@01 ret@92@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@56@01 ret@92@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= _1@28@01 ret@92@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@74@01 ret@92@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@79@01 ret@92@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [exec]
; inhale acc(Array$64$usize(_17.val_ref), read$())
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
(declare-const $t@95@01 $Snap)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))))
  val_ref@94@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))
  val_ref@94@01)))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(declare-const $t@96@01 $Snap)
(assert (and
  (=>
    (<
      $Perm.No
      (-
        (+ (read$ $Snap.unit) (read$ $Snap.unit))
        ($Perm.min (+ (read$ $Snap.unit) (read$ $Snap.unit)) (read$ $Snap.unit))))
    (= $t@96@01 $t@60@01))
  (=> (< $Perm.No (read$ $Snap.unit)) (= $t@96@01 $t@95@01))))
(assert (<=
  $Perm.No
  (+
    (-
      (+ (read$ $Snap.unit) (read$ $Snap.unit))
      ($Perm.min (+ (read$ $Snap.unit) (read$ $Snap.unit)) (read$ $Snap.unit)))
    (read$ $Snap.unit))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label l13
; [exec]
; label l14
; [exec]
; _16 := builtin$havoc_ref()
(declare-const ret@97@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_16.val_ref, write)
(declare-const $t@98@01 $Ref)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@92@01 ret@97@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@61@01 ret@97@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@56@01 ret@97@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= _1@28@01 ret@97@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@74@01 ret@97@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= ret@79@01 ret@97@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@97@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(Slice$usize(_16.val_ref), read$())
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
(declare-const $t@99@01 $Snap)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@62@01 $t@98@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= $t@80@01 $t@98@01)))
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
; inhale Slice$len__$TY$__usize$Slice$usize$$int$(_16.val_ref) == 64
(declare-const $t@100@01 $Snap)
(assert (= $t@100@01 $Snap.unit))
; [eval] Slice$len__$TY$__usize$Slice$usize$$int$(_16.val_ref) == 64
; [eval] Slice$len__$TY$__usize$Slice$usize$$int$(_16.val_ref)
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
(assert (Slice$len__$TY$__usize$Slice$usize$$int$%precondition $t@99@01 $t@98@01))
(pop) ; 7
; Joined path conditions
(assert (Slice$len__$TY$__usize$Slice$usize$$int$%precondition $t@99@01 $t@98@01))
(assert (= (Slice$len__$TY$__usize$Slice$usize$$int$ $t@99@01 $t@98@01) 64))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (let _LET_4 ==
;     (_17.val_ref) in
;     (let _LET_5 ==
;       (_16.val_ref) in
;       (forall i: Int ::
;         { lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_17.val_ref,
;         i) }
;         { lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$(_16.val_ref,
;         i) }
;         0 <= i && i < 64 ==>
;         lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_LET_4,
;         i) ==
;         lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$(_LET_5,
;         i))))
(declare-const $t@101@01 $Snap)
(assert (= $t@101@01 $Snap.unit))
; [eval] (let _LET_4 == (_17.val_ref) in (let _LET_5 == (_16.val_ref) in (forall i: Int :: { lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_17.val_ref, i) } { lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$(_16.val_ref, i) } 0 <= i && i < 64 ==> lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_LET_4, i) == lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$(_LET_5, i))))
(declare-const letvar@102@01 $Ref)
(assert (= (as letvar@102@01  $Ref) val_ref@94@01))
; [eval] (let _LET_5 == (_16.val_ref) in (forall i: Int :: { lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_17.val_ref, i) } { lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$(_16.val_ref, i) } 0 <= i && i < 64 ==> lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_LET_4, i) == lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$(_LET_5, i)))
(declare-const letvar@103@01 $Ref)
(assert (= (as letvar@103@01  $Ref) $t@98@01))
; [eval] (forall i: Int :: { lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_17.val_ref, i) } { lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$(_16.val_ref, i) } 0 <= i && i < 64 ==> lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_LET_4, i) == lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$(_LET_5, i))
(declare-const i@104@01 Int)
(set-option :timeout 0)
(push) ; 7
; [eval] 0 <= i && i < 64 ==> lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_LET_4, i) == lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$(_LET_5, i)
; [eval] 0 <= i && i < 64
; [eval] 0 <= i
(push) ; 8
; [then-branch: 14 | 0 <= i@104@01 | live]
; [else-branch: 14 | !(0 <= i@104@01) | live]
(push) ; 9
; [then-branch: 14 | 0 <= i@104@01]
(assert (<= 0 i@104@01))
; [eval] i < 64
(pop) ; 9
(push) ; 9
; [else-branch: 14 | !(0 <= i@104@01)]
(assert (not (<= 0 i@104@01)))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 i@104@01)) (<= 0 i@104@01)))
(push) ; 8
; [then-branch: 15 | i@104@01 < 64 && 0 <= i@104@01 | live]
; [else-branch: 15 | !(i@104@01 < 64 && 0 <= i@104@01) | live]
(push) ; 9
; [then-branch: 15 | i@104@01 < 64 && 0 <= i@104@01]
(assert (and (< i@104@01 64) (<= 0 i@104@01)))
; [eval] lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_LET_4, i) == lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$(_LET_5, i)
; [eval] lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_LET_4, i)
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
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))
  val_ref@94@01)))
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
    (+
      (-
        (+ (read$ $Snap.unit) (read$ $Snap.unit))
        ($Perm.min (+ (read$ $Snap.unit) (read$ $Snap.unit)) (read$ $Snap.unit)))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (-
          (+ (read$ $Snap.unit) (read$ $Snap.unit))
          ($Perm.min
            (+ (read$ $Snap.unit) (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit))
      (read$ $Snap.unit)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(assert (<=
  $Perm.No
  (-
    (+
      (-
        (+ (read$ $Snap.unit) (read$ $Snap.unit))
        ($Perm.min (+ (read$ $Snap.unit) (read$ $Snap.unit)) (read$ $Snap.unit)))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (-
          (+ (read$ $Snap.unit) (read$ $Snap.unit))
          ($Perm.min
            (+ (read$ $Snap.unit) (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit))
      (read$ $Snap.unit)))))
(set-option :timeout 0)
(push) ; 11
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (-
            (+ (read$ $Snap.unit) (read$ $Snap.unit))
            ($Perm.min
              (+ (read$ $Snap.unit) (read$ $Snap.unit))
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
            (+ (read$ $Snap.unit) (read$ $Snap.unit))
            ($Perm.min
              (+ (read$ $Snap.unit) (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
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
; [eval] 0 <= idx
; [eval] idx < 64
(assert (lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$%precondition ($Snap.combine
  $t@96@01
  ($Snap.combine $Snap.unit $Snap.unit)) val_ref@94@01 i@104@01))
(pop) ; 10
; Joined path conditions
(assert (and
  (<=
    $Perm.No
    (-
      (+
        (-
          (+ (read$ $Snap.unit) (read$ $Snap.unit))
          ($Perm.min
            (+ (read$ $Snap.unit) (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (-
            (+ (read$ $Snap.unit) (read$ $Snap.unit))
            ($Perm.min
              (+ (read$ $Snap.unit) (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        (read$ $Snap.unit))))
  (lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$%precondition ($Snap.combine
    $t@96@01
    ($Snap.combine $Snap.unit $Snap.unit)) val_ref@94@01 i@104@01)))
; [eval] lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$(_LET_5, i)
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
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [eval] 0 <= idx
; [eval] idx < Slice$len__$TY$__usize$Slice$usize$$int$(self)
; [eval] Slice$len__$TY$__usize$Slice$usize$$int$(self)
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
(assert (not (< i@104@01 (Slice$len__$TY$__usize$Slice$usize$$int$ $t@99@01 $t@98@01))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(assert (< i@104@01 (Slice$len__$TY$__usize$Slice$usize$$int$ $t@99@01 $t@98@01)))
(assert (lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$%precondition ($Snap.combine
  $t@99@01
  ($Snap.combine $Snap.unit $Snap.unit)) $t@98@01 i@104@01))
(pop) ; 10
; Joined path conditions
(assert (and
  (< i@104@01 (Slice$len__$TY$__usize$Slice$usize$$int$ $t@99@01 $t@98@01))
  (lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$%precondition ($Snap.combine
    $t@99@01
    ($Snap.combine $Snap.unit $Snap.unit)) $t@98@01 i@104@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 15 | !(i@104@01 < 64 && 0 <= i@104@01)]
(assert (not (and (< i@104@01 64) (<= 0 i@104@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (=>
  (and (< i@104@01 64) (<= 0 i@104@01))
  (and
    (< i@104@01 64)
    (<= 0 i@104@01)
    (<=
      $Perm.No
      (-
        (+
          (-
            (+ (read$ $Snap.unit) (read$ $Snap.unit))
            ($Perm.min
              (+ (read$ $Snap.unit) (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              (+ (read$ $Snap.unit) (read$ $Snap.unit))
              ($Perm.min
                (+ (read$ $Snap.unit) (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          (read$ $Snap.unit))))
    (lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$%precondition ($Snap.combine
      $t@96@01
      ($Snap.combine $Snap.unit $Snap.unit)) val_ref@94@01 i@104@01)
    (< i@104@01 (Slice$len__$TY$__usize$Slice$usize$$int$ $t@99@01 $t@98@01))
    (lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$%precondition ($Snap.combine
      $t@99@01
      ($Snap.combine $Snap.unit $Snap.unit)) $t@98@01 i@104@01))))
; Joined path conditions
(assert (or
  (not (and (< i@104@01 64) (<= 0 i@104@01)))
  (and (< i@104@01 64) (<= 0 i@104@01))))
; [eval] lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_17.val_ref, i)
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
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))
  val_ref@94@01)))
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
    (+
      (-
        (+ (read$ $Snap.unit) (read$ $Snap.unit))
        ($Perm.min (+ (read$ $Snap.unit) (read$ $Snap.unit)) (read$ $Snap.unit)))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (-
          (+ (read$ $Snap.unit) (read$ $Snap.unit))
          ($Perm.min
            (+ (read$ $Snap.unit) (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit))
      (read$ $Snap.unit)))
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
      (-
        (+ (read$ $Snap.unit) (read$ $Snap.unit))
        ($Perm.min (+ (read$ $Snap.unit) (read$ $Snap.unit)) (read$ $Snap.unit)))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (-
          (+ (read$ $Snap.unit) (read$ $Snap.unit))
          ($Perm.min
            (+ (read$ $Snap.unit) (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit))
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
            (+ (read$ $Snap.unit) (read$ $Snap.unit))
            ($Perm.min
              (+ (read$ $Snap.unit) (read$ $Snap.unit))
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
            (+ (read$ $Snap.unit) (read$ $Snap.unit))
            ($Perm.min
              (+ (read$ $Snap.unit) (read$ $Snap.unit))
              (read$ $Snap.unit)))
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
(set-option :timeout 0)
(push) ; 9
(assert (not (<= 0 i@104@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@97@01 ret@92@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@92@01 ret@61@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@97@01 ret@61@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@61@01 ret@56@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@92@01 ret@56@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@97@01 ret@56@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@56@01 _1@28@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@61@01 _1@28@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@92@01 _1@28@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@97@01 _1@28@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01)))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@80@01 $t@62@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@89@01 ret@71@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= _1@28@01 ret@74@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@56@01 ret@74@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@61@01 ret@74@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@92@01 ret@74@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@97@01 ret@74@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@74@01 ret@79@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= _1@28@01 ret@79@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@56@01 ret@79@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@61@01 ret@79@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@92@01 ret@79@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@97@01 ret@79@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@62@01 $t@98@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@80@01 $t@98@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@99@01 $t@63@01)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@99@01 $t@81@01)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@63@01 $t@99@01)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@63@01 $t@81@01)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@81@01 $t@99@01)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@81@01 $t@63@01)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (< $Perm.No (read$ $Snap.unit))
  (not
    (=
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))
      ($Snap.first ($Snap.second ($Snap.second $t@55@01))))))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (< $Perm.No (read$ $Snap.unit))
  (not
    (=
      ($Snap.first ($Snap.second ($Snap.second $t@55@01)))
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (+
        (-
          (+ (read$ $Snap.unit) (read$ $Snap.unit))
          ($Perm.min
            (+ (read$ $Snap.unit) (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit)))
    (<
      $Perm.No
      (-
        (+ (read$ $Snap.unit) (read$ $Snap.unit))
        ($Perm.min (+ (read$ $Snap.unit) (read$ $Snap.unit)) (read$ $Snap.unit)))))
  (not (= $t@96@01 $t@78@01)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (-
        (+ (read$ $Snap.unit) (read$ $Snap.unit))
        ($Perm.min (+ (read$ $Snap.unit) (read$ $Snap.unit)) (read$ $Snap.unit))))
    (<
      $Perm.No
      (+
        (-
          (+ (read$ $Snap.unit) (read$ $Snap.unit))
          ($Perm.min
            (+ (read$ $Snap.unit) (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit))))
  (not (= $t@78@01 $t@96@01)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@80@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@80@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@80@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@80@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@80@01 val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@80@01 $t@98@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 $t@98@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) $t@80@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) $t@62@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) $t@98@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 $t@98@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@62@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@62@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@62@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@62@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@62@01 val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@62@01 $t@98@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 $t@98@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@98@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@98@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@98@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@98@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@98@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@98@01 val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_bool@73@01 val_bool@91@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_bool@91@01 val_bool@73@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (and
  (and
    (and
      (not (= ret@79@01 ret@74@01))
      (not (= ret@79@01 _1@28@01))
      (not (= ret@79@01 ret@56@01))
      (not (= ret@79@01 ret@61@01))
      (not (= ret@79@01 ret@92@01))
      (not (= ret@79@01 ret@97@01)))
    (and
      (not (= ret@74@01 ret@79@01))
      (not (= ret@74@01 _1@28@01))
      (not (= ret@74@01 ret@56@01))
      (not (= ret@74@01 ret@61@01))
      (not (= ret@74@01 ret@92@01))
      (not (= ret@74@01 ret@97@01)))
    (and
      (not (= _1@28@01 ret@79@01))
      (not (= _1@28@01 ret@74@01))
      (not (= _1@28@01 ret@56@01))
      (not (= _1@28@01 ret@61@01))
      (not (= _1@28@01 ret@92@01))
      (not (= _1@28@01 ret@97@01)))
    (and
      (not (= ret@56@01 ret@79@01))
      (not (= ret@56@01 ret@74@01))
      (not (= ret@56@01 _1@28@01))
      (not (= ret@56@01 ret@61@01))
      (not (= ret@56@01 ret@92@01))
      (not (= ret@56@01 ret@97@01)))
    (and
      (not (= ret@61@01 ret@79@01))
      (not (= ret@61@01 ret@74@01))
      (not (= ret@61@01 _1@28@01))
      (not (= ret@61@01 ret@56@01))
      (not (= ret@61@01 ret@92@01))
      (not (= ret@61@01 ret@97@01)))
    (and
      (not (= ret@92@01 ret@79@01))
      (not (= ret@92@01 ret@74@01))
      (not (= ret@92@01 _1@28@01))
      (not (= ret@92@01 ret@56@01))
      (not (= ret@92@01 ret@61@01))
      (not (= ret@92@01 ret@97@01)))
    (and
      (not (= ret@97@01 ret@79@01))
      (not (= ret@97@01 ret@74@01))
      (not (= ret@97@01 _1@28@01))
      (not (= ret@97@01 ret@56@01))
      (not (= ret@97@01 ret@61@01))
      (not (= ret@97@01 ret@92@01))))
  (and (not (= ret@71@01 ret@89@01)) (not (= ret@89@01 ret@71@01)))))
; [eval] 0 <= idx
(set-option :timeout 0)
(push) ; 9
(assert (not (<= 0 i@104@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@97@01 ret@92@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@92@01 ret@61@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@97@01 ret@61@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@61@01 ret@56@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@92@01 ret@56@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@97@01 ret@56@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@56@01 _1@28@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@61@01 _1@28@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@92@01 _1@28@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@97@01 _1@28@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01)))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@80@01 $t@62@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@89@01 ret@71@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= _1@28@01 ret@74@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@56@01 ret@74@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@61@01 ret@74@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@92@01 ret@74@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@97@01 ret@74@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@74@01 ret@79@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= _1@28@01 ret@79@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@56@01 ret@79@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@61@01 ret@79@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@92@01 ret@79@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@97@01 ret@79@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@62@01 $t@98@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@80@01 $t@98@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@99@01 $t@63@01)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@99@01 $t@81@01)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@63@01 $t@99@01)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@63@01 $t@81@01)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@81@01 $t@99@01)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@81@01 $t@63@01)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (< $Perm.No (read$ $Snap.unit))
  (not
    (=
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))
      ($Snap.first ($Snap.second ($Snap.second $t@55@01))))))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (< $Perm.No (read$ $Snap.unit))
  (not
    (=
      ($Snap.first ($Snap.second ($Snap.second $t@55@01)))
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (-
        (+ (read$ $Snap.unit) (read$ $Snap.unit))
        ($Perm.min (+ (read$ $Snap.unit) (read$ $Snap.unit)) (read$ $Snap.unit))))
    (<
      $Perm.No
      (-
        (+
          (-
            (+ (read$ $Snap.unit) (read$ $Snap.unit))
            ($Perm.min
              (+ (read$ $Snap.unit) (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              (+ (read$ $Snap.unit) (read$ $Snap.unit))
              ($Perm.min
                (+ (read$ $Snap.unit) (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))))
  (not (= $t@78@01 $t@96@01)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (-
        (+
          (-
            (+ (read$ $Snap.unit) (read$ $Snap.unit))
            ($Perm.min
              (+ (read$ $Snap.unit) (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              (+ (read$ $Snap.unit) (read$ $Snap.unit))
              ($Perm.min
                (+ (read$ $Snap.unit) (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          (read$ $Snap.unit))))
    (<
      $Perm.No
      (-
        (+ (read$ $Snap.unit) (read$ $Snap.unit))
        ($Perm.min (+ (read$ $Snap.unit) (read$ $Snap.unit)) (read$ $Snap.unit)))))
  (not (= $t@96@01 $t@78@01)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@80@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@80@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@80@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@80@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@80@01 val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@80@01 $t@98@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 $t@98@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) $t@80@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) $t@62@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) $t@98@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 $t@98@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@62@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@62@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@62@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@62@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@62@01 val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@62@01 $t@98@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 $t@98@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@98@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@98@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@98@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@98@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@98@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@98@01 val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_bool@73@01 val_bool@91@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_bool@91@01 val_bool@73@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (and
  (and
    (and
      (not (= ret@79@01 ret@74@01))
      (not (= ret@79@01 _1@28@01))
      (not (= ret@79@01 ret@56@01))
      (not (= ret@79@01 ret@61@01))
      (not (= ret@79@01 ret@92@01))
      (not (= ret@79@01 ret@97@01)))
    (and
      (not (= ret@74@01 ret@79@01))
      (not (= ret@74@01 _1@28@01))
      (not (= ret@74@01 ret@56@01))
      (not (= ret@74@01 ret@61@01))
      (not (= ret@74@01 ret@92@01))
      (not (= ret@74@01 ret@97@01)))
    (and
      (not (= _1@28@01 ret@79@01))
      (not (= _1@28@01 ret@74@01))
      (not (= _1@28@01 ret@56@01))
      (not (= _1@28@01 ret@61@01))
      (not (= _1@28@01 ret@92@01))
      (not (= _1@28@01 ret@97@01)))
    (and
      (not (= ret@56@01 ret@79@01))
      (not (= ret@56@01 ret@74@01))
      (not (= ret@56@01 _1@28@01))
      (not (= ret@56@01 ret@61@01))
      (not (= ret@56@01 ret@92@01))
      (not (= ret@56@01 ret@97@01)))
    (and
      (not (= ret@61@01 ret@79@01))
      (not (= ret@61@01 ret@74@01))
      (not (= ret@61@01 _1@28@01))
      (not (= ret@61@01 ret@56@01))
      (not (= ret@61@01 ret@92@01))
      (not (= ret@61@01 ret@97@01)))
    (and
      (not (= ret@92@01 ret@79@01))
      (not (= ret@92@01 ret@74@01))
      (not (= ret@92@01 _1@28@01))
      (not (= ret@92@01 ret@56@01))
      (not (= ret@92@01 ret@61@01))
      (not (= ret@92@01 ret@97@01)))
    (and
      (not (= ret@97@01 ret@79@01))
      (not (= ret@97@01 ret@74@01))
      (not (= ret@97@01 _1@28@01))
      (not (= ret@97@01 ret@56@01))
      (not (= ret@97@01 ret@61@01))
      (not (= ret@97@01 ret@92@01))))
  (and (not (= ret@71@01 ret@89@01)) (not (= ret@89@01 ret@71@01)))))
; [eval] 0 <= idx
(set-option :timeout 0)
(push) ; 9
(assert (not (<= 0 i@104@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@97@01 ret@92@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@92@01 ret@61@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@97@01 ret@61@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@61@01 ret@56@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@92@01 ret@56@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@97@01 ret@56@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@56@01 _1@28@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@61@01 _1@28@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@92@01 _1@28@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@97@01 _1@28@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01)))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@80@01 $t@62@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@89@01 ret@71@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= _1@28@01 ret@74@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@56@01 ret@74@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@61@01 ret@74@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@92@01 ret@74@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@97@01 ret@74@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@74@01 ret@79@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= _1@28@01 ret@79@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@56@01 ret@79@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@61@01 ret@79@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@92@01 ret@79@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@97@01 ret@79@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@62@01 $t@98@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@80@01 $t@98@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@99@01 $t@63@01)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@99@01 $t@81@01)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@63@01 $t@99@01)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@63@01 $t@81@01)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@81@01 $t@99@01)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@81@01 $t@63@01)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (< $Perm.No (read$ $Snap.unit))
  (not
    (=
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))
      ($Snap.first ($Snap.second ($Snap.second $t@55@01))))))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (< $Perm.No (read$ $Snap.unit))
  (not
    (=
      ($Snap.first ($Snap.second ($Snap.second $t@55@01)))
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (+
        (-
          (+ (read$ $Snap.unit) (read$ $Snap.unit))
          ($Perm.min
            (+ (read$ $Snap.unit) (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit)))
    (<
      $Perm.No
      (-
        (+ (read$ $Snap.unit) (read$ $Snap.unit))
        ($Perm.min (+ (read$ $Snap.unit) (read$ $Snap.unit)) (read$ $Snap.unit)))))
  (not (= $t@96@01 $t@78@01)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (-
        (+ (read$ $Snap.unit) (read$ $Snap.unit))
        ($Perm.min (+ (read$ $Snap.unit) (read$ $Snap.unit)) (read$ $Snap.unit))))
    (<
      $Perm.No
      (+
        (-
          (+ (read$ $Snap.unit) (read$ $Snap.unit))
          ($Perm.min
            (+ (read$ $Snap.unit) (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit))))
  (not (= $t@78@01 $t@96@01)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@80@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@80@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@80@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@80@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@80@01 val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@80@01 $t@98@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 $t@98@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) $t@80@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) $t@62@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) $t@98@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 $t@98@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@62@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@62@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@62@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@62@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@62@01 val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@62@01 $t@98@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 $t@98@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@98@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@98@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@98@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@98@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@98@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@98@01 val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_bool@73@01 val_bool@91@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_bool@91@01 val_bool@73@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (and
  (and
    (and
      (not (= ret@79@01 ret@74@01))
      (not (= ret@79@01 _1@28@01))
      (not (= ret@79@01 ret@56@01))
      (not (= ret@79@01 ret@61@01))
      (not (= ret@79@01 ret@92@01))
      (not (= ret@79@01 ret@97@01)))
    (and
      (not (= ret@74@01 ret@79@01))
      (not (= ret@74@01 _1@28@01))
      (not (= ret@74@01 ret@56@01))
      (not (= ret@74@01 ret@61@01))
      (not (= ret@74@01 ret@92@01))
      (not (= ret@74@01 ret@97@01)))
    (and
      (not (= _1@28@01 ret@79@01))
      (not (= _1@28@01 ret@74@01))
      (not (= _1@28@01 ret@56@01))
      (not (= _1@28@01 ret@61@01))
      (not (= _1@28@01 ret@92@01))
      (not (= _1@28@01 ret@97@01)))
    (and
      (not (= ret@56@01 ret@79@01))
      (not (= ret@56@01 ret@74@01))
      (not (= ret@56@01 _1@28@01))
      (not (= ret@56@01 ret@61@01))
      (not (= ret@56@01 ret@92@01))
      (not (= ret@56@01 ret@97@01)))
    (and
      (not (= ret@61@01 ret@79@01))
      (not (= ret@61@01 ret@74@01))
      (not (= ret@61@01 _1@28@01))
      (not (= ret@61@01 ret@56@01))
      (not (= ret@61@01 ret@92@01))
      (not (= ret@61@01 ret@97@01)))
    (and
      (not (= ret@92@01 ret@79@01))
      (not (= ret@92@01 ret@74@01))
      (not (= ret@92@01 _1@28@01))
      (not (= ret@92@01 ret@56@01))
      (not (= ret@92@01 ret@61@01))
      (not (= ret@92@01 ret@97@01)))
    (and
      (not (= ret@97@01 ret@79@01))
      (not (= ret@97@01 ret@74@01))
      (not (= ret@97@01 _1@28@01))
      (not (= ret@97@01 ret@56@01))
      (not (= ret@97@01 ret@61@01))
      (not (= ret@97@01 ret@92@01))))
  (and (not (= ret@71@01 ret@89@01)) (not (= ret@89@01 ret@71@01)))))
; [eval] 0 <= idx
(set-option :timeout 0)
(push) ; 9
(assert (not (<= 0 i@104@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(pop) ; 8
; [eval] lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$(_16.val_ref, i)
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
; [eval] 0 <= idx
(set-option :timeout 0)
(push) ; 9
(assert (not (<= 0 i@104@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@97@01 ret@92@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@92@01 ret@61@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@97@01 ret@61@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@61@01 ret@56@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@92@01 ret@56@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@97@01 ret@56@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@56@01 _1@28@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@61@01 _1@28@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@92@01 _1@28@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@97@01 _1@28@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01)))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@80@01 $t@62@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@89@01 ret@71@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= _1@28@01 ret@74@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@56@01 ret@74@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@61@01 ret@74@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@92@01 ret@74@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@97@01 ret@74@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@74@01 ret@79@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= _1@28@01 ret@79@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@56@01 ret@79@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@61@01 ret@79@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@92@01 ret@79@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@97@01 ret@79@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@62@01 $t@98@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@80@01 $t@98@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@99@01 $t@63@01)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@99@01 $t@81@01)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@63@01 $t@99@01)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@63@01 $t@81@01)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@81@01 $t@99@01)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@81@01 $t@63@01)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (< $Perm.No (read$ $Snap.unit))
  (not
    (=
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))
      ($Snap.first ($Snap.second ($Snap.second $t@55@01))))))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (< $Perm.No (read$ $Snap.unit))
  (not
    (=
      ($Snap.first ($Snap.second ($Snap.second $t@55@01)))
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (+
        (-
          (+ (read$ $Snap.unit) (read$ $Snap.unit))
          ($Perm.min
            (+ (read$ $Snap.unit) (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit)))
    (<
      $Perm.No
      (-
        (+ (read$ $Snap.unit) (read$ $Snap.unit))
        ($Perm.min (+ (read$ $Snap.unit) (read$ $Snap.unit)) (read$ $Snap.unit)))))
  (not (= $t@96@01 $t@78@01)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (-
        (+ (read$ $Snap.unit) (read$ $Snap.unit))
        ($Perm.min (+ (read$ $Snap.unit) (read$ $Snap.unit)) (read$ $Snap.unit))))
    (<
      $Perm.No
      (+
        (-
          (+ (read$ $Snap.unit) (read$ $Snap.unit))
          ($Perm.min
            (+ (read$ $Snap.unit) (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit))))
  (not (= $t@78@01 $t@96@01)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@80@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@80@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@80@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@80@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@80@01 val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@80@01 $t@98@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 $t@98@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) $t@80@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) $t@62@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) $t@98@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 $t@98@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@62@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@62@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@62@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@62@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@62@01 val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@62@01 $t@98@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 $t@98@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@98@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@98@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@98@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@98@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@98@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@98@01 val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_bool@73@01 val_bool@91@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_bool@91@01 val_bool@73@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (and
  (and
    (and
      (not (= ret@79@01 ret@74@01))
      (not (= ret@79@01 _1@28@01))
      (not (= ret@79@01 ret@56@01))
      (not (= ret@79@01 ret@61@01))
      (not (= ret@79@01 ret@92@01))
      (not (= ret@79@01 ret@97@01)))
    (and
      (not (= ret@74@01 ret@79@01))
      (not (= ret@74@01 _1@28@01))
      (not (= ret@74@01 ret@56@01))
      (not (= ret@74@01 ret@61@01))
      (not (= ret@74@01 ret@92@01))
      (not (= ret@74@01 ret@97@01)))
    (and
      (not (= _1@28@01 ret@79@01))
      (not (= _1@28@01 ret@74@01))
      (not (= _1@28@01 ret@56@01))
      (not (= _1@28@01 ret@61@01))
      (not (= _1@28@01 ret@92@01))
      (not (= _1@28@01 ret@97@01)))
    (and
      (not (= ret@56@01 ret@79@01))
      (not (= ret@56@01 ret@74@01))
      (not (= ret@56@01 _1@28@01))
      (not (= ret@56@01 ret@61@01))
      (not (= ret@56@01 ret@92@01))
      (not (= ret@56@01 ret@97@01)))
    (and
      (not (= ret@61@01 ret@79@01))
      (not (= ret@61@01 ret@74@01))
      (not (= ret@61@01 _1@28@01))
      (not (= ret@61@01 ret@56@01))
      (not (= ret@61@01 ret@92@01))
      (not (= ret@61@01 ret@97@01)))
    (and
      (not (= ret@92@01 ret@79@01))
      (not (= ret@92@01 ret@74@01))
      (not (= ret@92@01 _1@28@01))
      (not (= ret@92@01 ret@56@01))
      (not (= ret@92@01 ret@61@01))
      (not (= ret@92@01 ret@97@01)))
    (and
      (not (= ret@97@01 ret@79@01))
      (not (= ret@97@01 ret@74@01))
      (not (= ret@97@01 _1@28@01))
      (not (= ret@97@01 ret@56@01))
      (not (= ret@97@01 ret@61@01))
      (not (= ret@97@01 ret@92@01))))
  (and (not (= ret@71@01 ret@89@01)) (not (= ret@89@01 ret@71@01)))))
; [eval] 0 <= idx
(set-option :timeout 0)
(push) ; 9
(assert (not (<= 0 i@104@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@97@01 ret@92@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@92@01 ret@61@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@97@01 ret@61@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@61@01 ret@56@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@92@01 ret@56@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@97@01 ret@56@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@56@01 _1@28@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@61@01 _1@28@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@92@01 _1@28@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@97@01 _1@28@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01)))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@80@01 $t@62@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@89@01 ret@71@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= _1@28@01 ret@74@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@56@01 ret@74@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@61@01 ret@74@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@92@01 ret@74@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@97@01 ret@74@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@74@01 ret@79@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= _1@28@01 ret@79@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@56@01 ret@79@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@61@01 ret@79@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@92@01 ret@79@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@97@01 ret@79@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@63@01 $t@81@01)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@81@01 $t@63@01)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (< $Perm.No (read$ $Snap.unit))
  (not
    (=
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))
      ($Snap.first ($Snap.second ($Snap.second $t@55@01))))))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (< $Perm.No (read$ $Snap.unit))
  (not
    (=
      ($Snap.first ($Snap.second ($Snap.second $t@55@01)))
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (+
        (-
          (+ (read$ $Snap.unit) (read$ $Snap.unit))
          ($Perm.min
            (+ (read$ $Snap.unit) (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit)))
    (<
      $Perm.No
      (-
        (+ (read$ $Snap.unit) (read$ $Snap.unit))
        ($Perm.min (+ (read$ $Snap.unit) (read$ $Snap.unit)) (read$ $Snap.unit)))))
  (not (= $t@96@01 $t@78@01)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (-
        (+ (read$ $Snap.unit) (read$ $Snap.unit))
        ($Perm.min (+ (read$ $Snap.unit) (read$ $Snap.unit)) (read$ $Snap.unit))))
    (<
      $Perm.No
      (+
        (-
          (+ (read$ $Snap.unit) (read$ $Snap.unit))
          ($Perm.min
            (+ (read$ $Snap.unit) (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit))))
  (not (= $t@78@01 $t@96@01)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@80@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@80@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@80@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@80@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@80@01 val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@80@01 $t@98@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 $t@98@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) $t@80@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) $t@62@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) $t@98@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 $t@98@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@62@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@62@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@62@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@62@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@62@01 val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@62@01 $t@98@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 $t@98@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@98@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@98@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@98@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@98@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@98@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@98@01 val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_bool@73@01 val_bool@91@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_bool@91@01 val_bool@73@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (and
  (and
    (and
      (not (= ret@79@01 ret@74@01))
      (not (= ret@79@01 _1@28@01))
      (not (= ret@79@01 ret@56@01))
      (not (= ret@79@01 ret@61@01))
      (not (= ret@79@01 ret@92@01))
      (not (= ret@79@01 ret@97@01)))
    (and
      (not (= ret@74@01 ret@79@01))
      (not (= ret@74@01 _1@28@01))
      (not (= ret@74@01 ret@56@01))
      (not (= ret@74@01 ret@61@01))
      (not (= ret@74@01 ret@92@01))
      (not (= ret@74@01 ret@97@01)))
    (and
      (not (= _1@28@01 ret@79@01))
      (not (= _1@28@01 ret@74@01))
      (not (= _1@28@01 ret@56@01))
      (not (= _1@28@01 ret@61@01))
      (not (= _1@28@01 ret@92@01))
      (not (= _1@28@01 ret@97@01)))
    (and
      (not (= ret@56@01 ret@79@01))
      (not (= ret@56@01 ret@74@01))
      (not (= ret@56@01 _1@28@01))
      (not (= ret@56@01 ret@61@01))
      (not (= ret@56@01 ret@92@01))
      (not (= ret@56@01 ret@97@01)))
    (and
      (not (= ret@61@01 ret@79@01))
      (not (= ret@61@01 ret@74@01))
      (not (= ret@61@01 _1@28@01))
      (not (= ret@61@01 ret@56@01))
      (not (= ret@61@01 ret@92@01))
      (not (= ret@61@01 ret@97@01)))
    (and
      (not (= ret@92@01 ret@79@01))
      (not (= ret@92@01 ret@74@01))
      (not (= ret@92@01 _1@28@01))
      (not (= ret@92@01 ret@56@01))
      (not (= ret@92@01 ret@61@01))
      (not (= ret@92@01 ret@97@01)))
    (and
      (not (= ret@97@01 ret@79@01))
      (not (= ret@97@01 ret@74@01))
      (not (= ret@97@01 _1@28@01))
      (not (= ret@97@01 ret@56@01))
      (not (= ret@97@01 ret@61@01))
      (not (= ret@97@01 ret@92@01))))
  (and (not (= ret@71@01 ret@89@01)) (not (= ret@89@01 ret@71@01)))))
; [eval] 0 <= idx
(set-option :timeout 0)
(push) ; 9
(assert (not (<= 0 i@104@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@97@01 ret@92@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@92@01 ret@61@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@97@01 ret@61@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@61@01 ret@56@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@92@01 ret@56@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@97@01 ret@56@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@56@01 _1@28@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@61@01 _1@28@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@92@01 _1@28@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@97@01 _1@28@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01)))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@80@01 $t@62@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@89@01 ret@71@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= _1@28@01 ret@74@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@56@01 ret@74@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@61@01 ret@74@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@92@01 ret@74@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@97@01 ret@74@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@74@01 ret@79@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= _1@28@01 ret@79@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@56@01 ret@79@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@61@01 ret@79@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@92@01 ret@79@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@97@01 ret@79@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@62@01 $t@98@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= $t@80@01 $t@98@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@99@01 $t@63@01)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@99@01 $t@81@01)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@63@01 $t@99@01)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@63@01 $t@81@01)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@81@01 $t@99@01)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@81@01 $t@63@01)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (< $Perm.No (read$ $Snap.unit))
  (not
    (=
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))
      ($Snap.first ($Snap.second ($Snap.second $t@55@01))))))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (< $Perm.No (read$ $Snap.unit))
  (not
    (=
      ($Snap.first ($Snap.second ($Snap.second $t@55@01)))
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (+
        (-
          (+ (read$ $Snap.unit) (read$ $Snap.unit))
          ($Perm.min
            (+ (read$ $Snap.unit) (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit)))
    (<
      $Perm.No
      (-
        (+ (read$ $Snap.unit) (read$ $Snap.unit))
        ($Perm.min (+ (read$ $Snap.unit) (read$ $Snap.unit)) (read$ $Snap.unit)))))
  (not (= $t@96@01 $t@78@01)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (-
        (+ (read$ $Snap.unit) (read$ $Snap.unit))
        ($Perm.min (+ (read$ $Snap.unit) (read$ $Snap.unit)) (read$ $Snap.unit))))
    (<
      $Perm.No
      (+
        (-
          (+ (read$ $Snap.unit) (read$ $Snap.unit))
          ($Perm.min
            (+ (read$ $Snap.unit) (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit))))
  (not (= $t@78@01 $t@96@01)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@80@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@80@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@80@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@80@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@80@01 val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@80@01 $t@98@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 $t@98@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) $t@80@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) $t@62@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) $t@98@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 $t@98@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@62@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@62@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@62@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@62@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@62@01 val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@62@01 $t@98@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 $t@98@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@98@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@98@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@98@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@98@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@98@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= $t@98@01 val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_bool@73@01 val_bool@91@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= val_bool@91@01 val_bool@73@01))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (and
  (and
    (and
      (not (= ret@79@01 ret@74@01))
      (not (= ret@79@01 _1@28@01))
      (not (= ret@79@01 ret@56@01))
      (not (= ret@79@01 ret@61@01))
      (not (= ret@79@01 ret@92@01))
      (not (= ret@79@01 ret@97@01)))
    (and
      (not (= ret@74@01 ret@79@01))
      (not (= ret@74@01 _1@28@01))
      (not (= ret@74@01 ret@56@01))
      (not (= ret@74@01 ret@61@01))
      (not (= ret@74@01 ret@92@01))
      (not (= ret@74@01 ret@97@01)))
    (and
      (not (= _1@28@01 ret@79@01))
      (not (= _1@28@01 ret@74@01))
      (not (= _1@28@01 ret@56@01))
      (not (= _1@28@01 ret@61@01))
      (not (= _1@28@01 ret@92@01))
      (not (= _1@28@01 ret@97@01)))
    (and
      (not (= ret@56@01 ret@79@01))
      (not (= ret@56@01 ret@74@01))
      (not (= ret@56@01 _1@28@01))
      (not (= ret@56@01 ret@61@01))
      (not (= ret@56@01 ret@92@01))
      (not (= ret@56@01 ret@97@01)))
    (and
      (not (= ret@61@01 ret@79@01))
      (not (= ret@61@01 ret@74@01))
      (not (= ret@61@01 _1@28@01))
      (not (= ret@61@01 ret@56@01))
      (not (= ret@61@01 ret@92@01))
      (not (= ret@61@01 ret@97@01)))
    (and
      (not (= ret@92@01 ret@79@01))
      (not (= ret@92@01 ret@74@01))
      (not (= ret@92@01 _1@28@01))
      (not (= ret@92@01 ret@56@01))
      (not (= ret@92@01 ret@61@01))
      (not (= ret@92@01 ret@97@01)))
    (and
      (not (= ret@97@01 ret@79@01))
      (not (= ret@97@01 ret@74@01))
      (not (= ret@97@01 _1@28@01))
      (not (= ret@97@01 ret@56@01))
      (not (= ret@97@01 ret@61@01))
      (not (= ret@97@01 ret@92@01))))
  (and (not (= ret@71@01 ret@89@01)) (not (= ret@89@01 ret@71@01)))))
; [eval] 0 <= idx
(set-option :timeout 0)
(push) ; 9
(assert (not (<= 0 i@104@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(pop) ; 8
(pop) ; 7
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@104@01 Int)) (!
  (and
    (or (not (<= 0 i@104@01)) (<= 0 i@104@01))
    (=>
      (and (< i@104@01 64) (<= 0 i@104@01))
      (and
        (< i@104@01 64)
        (<= 0 i@104@01)
        (<=
          $Perm.No
          (-
            (+
              (-
                (+ (read$ $Snap.unit) (read$ $Snap.unit))
                ($Perm.min
                  (+ (read$ $Snap.unit) (read$ $Snap.unit))
                  (read$ $Snap.unit)))
              (read$ $Snap.unit))
            ($Perm.min
              (+
                (-
                  (+ (read$ $Snap.unit) (read$ $Snap.unit))
                  ($Perm.min
                    (+ (read$ $Snap.unit) (read$ $Snap.unit))
                    (read$ $Snap.unit)))
                (read$ $Snap.unit))
              (read$ $Snap.unit))))
        (lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$%precondition ($Snap.combine
          $t@96@01
          ($Snap.combine $Snap.unit $Snap.unit)) val_ref@94@01 i@104@01)
        (< i@104@01 (Slice$len__$TY$__usize$Slice$usize$$int$ $t@99@01 $t@98@01))
        (lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$%precondition ($Snap.combine
          $t@99@01
          ($Snap.combine $Snap.unit $Snap.unit)) $t@98@01 i@104@01)))
    (or
      (not (and (< i@104@01 64) (<= 0 i@104@01)))
      (and (< i@104@01 64) (<= 0 i@104@01))))
  
  :qid |prog.l567-aux|)))
(assert (forall ((i@104@01 Int)) (!
  (=>
    (and (< i@104@01 64) (<= 0 i@104@01))
    (=
      (lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$ ($Snap.combine
        $t@96@01
        ($Snap.combine $Snap.unit $Snap.unit)) val_ref@94@01 i@104@01)
      (lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$ ($Snap.combine
        $t@99@01
        ($Snap.combine $Snap.unit $Snap.unit)) $t@98@01 i@104@01)))
  
  :qid |prog.l567|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label l15
; [exec]
; _15 := builtin$havoc_int()
(declare-const ret@105@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _15 := Slice$len__$TY$__usize$Slice$usize$$int$(_16.val_ref)
; [eval] Slice$len__$TY$__usize$Slice$usize$$int$(_16.val_ref)
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
(declare-const _15@106@01 Int)
(assert (= _15@106@01 (Slice$len__$TY$__usize$Slice$usize$$int$ $t@99@01 $t@98@01)))
; [eval] __t6 && (__t6 && __t6)
(set-option :timeout 0)
(push) ; 7
; [then-branch: 16 | True | live]
; [else-branch: 16 | False | live]
(push) ; 8
; [then-branch: 16 | True]
(push) ; 9
; [then-branch: 17 | True | live]
; [else-branch: 17 | False | live]
(push) ; 10
; [then-branch: 17 | True]
(pop) ; 10
(push) ; 10
; [else-branch: 17 | False]
(assert false)
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(pop) ; 8
(push) ; 8
; [else-branch: 16 | False]
(assert false)
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
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
; exhale acc(Array$64$usize(_17.val_ref), read$())
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
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))
  val_ref@94@01)))
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
      (-
        (+ (read$ $Snap.unit) (read$ $Snap.unit))
        ($Perm.min (+ (read$ $Snap.unit) (read$ $Snap.unit)) (read$ $Snap.unit)))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (-
          (+ (read$ $Snap.unit) (read$ $Snap.unit))
          ($Perm.min
            (+ (read$ $Snap.unit) (read$ $Snap.unit))
            (read$ $Snap.unit)))
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
      (-
        (+ (read$ $Snap.unit) (read$ $Snap.unit))
        ($Perm.min (+ (read$ $Snap.unit) (read$ $Snap.unit)) (read$ $Snap.unit)))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (-
          (+ (read$ $Snap.unit) (read$ $Snap.unit))
          ($Perm.min
            (+ (read$ $Snap.unit) (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit))
      (read$ $Snap.unit)))))
(set-option :timeout 0)
(push) ; 8
(assert (not (or
  (=
    (-
      (read$ $Snap.unit)
      ($Perm.min
        (+
          (-
            (+ (read$ $Snap.unit) (read$ $Snap.unit))
            ($Perm.min
              (+ (read$ $Snap.unit) (read$ $Snap.unit))
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
            (+ (read$ $Snap.unit) (read$ $Snap.unit))
            ($Perm.min
              (+ (read$ $Snap.unit) (read$ $Snap.unit))
              (read$ $Snap.unit)))
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
; __t7 := true
; [exec]
; _20 := builtin$havoc_ref()
(declare-const ret@107@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_20.val_ref, write)
(declare-const $t@108@01 $Ref)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@97@01 ret@107@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@92@01 ret@107@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@61@01 ret@107@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@56@01 ret@107@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= _1@28@01 ret@107@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@74@01 ret@107@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@79@01 ret@107@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@107@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _20.val_ref := _1.val_ref.f$max_counts
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(declare-const val_ref@109@01 $Ref)
(assert (=
  val_ref@109@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))))))
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@79@01 ret@107@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@74@01 ret@107@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= _1@28@01 ret@107@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@56@01 ret@107@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@61@01 ret@107@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@92@01 ret@107@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@97@01 ret@107@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [exec]
; inhale acc(Array$64$usize(_20.val_ref), read$())
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
(declare-const $t@110@01 $Snap)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))
  val_ref@109@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))))
  val_ref@109@01)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(declare-const $t@111@01 $Snap)
(assert (and
  (=>
    (<
      $Perm.No
      (-
        (+ (read$ $Snap.unit) (read$ $Snap.unit))
        ($Perm.min (+ (read$ $Snap.unit) (read$ $Snap.unit)) (read$ $Snap.unit))))
    (= $t@111@01 $t@78@01))
  (=> (< $Perm.No (read$ $Snap.unit)) (= $t@111@01 $t@110@01))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label l17
; [exec]
; label l18
; [exec]
; _19 := builtin$havoc_ref()
(declare-const ret@112@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_19.val_ref, write)
(declare-const $t@113@01 $Ref)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@107@01 ret@112@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@79@01 ret@112@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@74@01 ret@112@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= _1@28@01 ret@112@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@56@01 ret@112@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@61@01 ret@112@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@92@01 ret@112@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= ret@97@01 ret@112@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@112@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(Slice$usize(_19.val_ref), read$())
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
(declare-const $t@114@01 $Snap)
(push) ; 8
(set-option :timeout 10)
(assert (not (= $t@80@01 $t@113@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= $t@62@01 $t@113@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (= $t@98@01 $t@113@01)))
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
; inhale Slice$len__$TY$__usize$Slice$usize$$int$(_19.val_ref) == 64
(declare-const $t@115@01 $Snap)
(assert (= $t@115@01 $Snap.unit))
; [eval] Slice$len__$TY$__usize$Slice$usize$$int$(_19.val_ref) == 64
; [eval] Slice$len__$TY$__usize$Slice$usize$$int$(_19.val_ref)
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
(assert (Slice$len__$TY$__usize$Slice$usize$$int$%precondition $t@114@01 $t@113@01))
(pop) ; 8
; Joined path conditions
(assert (Slice$len__$TY$__usize$Slice$usize$$int$%precondition $t@114@01 $t@113@01))
(assert (= (Slice$len__$TY$__usize$Slice$usize$$int$ $t@114@01 $t@113@01) 64))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (let _LET_6 ==
;     (_20.val_ref) in
;     (let _LET_7 ==
;       (_19.val_ref) in
;       (forall i: Int ::
;         { lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_20.val_ref,
;         i) }
;         { lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$(_19.val_ref,
;         i) }
;         0 <= i && i < 64 ==>
;         lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_LET_6,
;         i) ==
;         lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$(_LET_7,
;         i))))
(declare-const $t@116@01 $Snap)
(assert (= $t@116@01 $Snap.unit))
; [eval] (let _LET_6 == (_20.val_ref) in (let _LET_7 == (_19.val_ref) in (forall i: Int :: { lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_20.val_ref, i) } { lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$(_19.val_ref, i) } 0 <= i && i < 64 ==> lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_LET_6, i) == lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$(_LET_7, i))))
(declare-const letvar@117@01 $Ref)
(assert (= (as letvar@117@01  $Ref) val_ref@109@01))
; [eval] (let _LET_7 == (_19.val_ref) in (forall i: Int :: { lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_20.val_ref, i) } { lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$(_19.val_ref, i) } 0 <= i && i < 64 ==> lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_LET_6, i) == lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$(_LET_7, i)))
(declare-const letvar@118@01 $Ref)
(assert (= (as letvar@118@01  $Ref) $t@113@01))
; [eval] (forall i: Int :: { lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_20.val_ref, i) } { lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$(_19.val_ref, i) } 0 <= i && i < 64 ==> lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_LET_6, i) == lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$(_LET_7, i))
(declare-const i@119@01 Int)
(set-option :timeout 0)
(push) ; 8
; [eval] 0 <= i && i < 64 ==> lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_LET_6, i) == lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$(_LET_7, i)
; [eval] 0 <= i && i < 64
; [eval] 0 <= i
(push) ; 9
; [then-branch: 19 | 0 <= i@119@01 | live]
; [else-branch: 19 | !(0 <= i@119@01) | live]
(push) ; 10
; [then-branch: 19 | 0 <= i@119@01]
(assert (<= 0 i@119@01))
; [eval] i < 64
(pop) ; 10
(push) ; 10
; [else-branch: 19 | !(0 <= i@119@01)]
(assert (not (<= 0 i@119@01)))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 i@119@01)) (<= 0 i@119@01)))
(push) ; 9
; [then-branch: 20 | i@119@01 < 64 && 0 <= i@119@01 | live]
; [else-branch: 20 | !(i@119@01 < 64 && 0 <= i@119@01) | live]
(push) ; 10
; [then-branch: 20 | i@119@01 < 64 && 0 <= i@119@01]
(assert (and (< i@119@01 64) (<= 0 i@119@01)))
; [eval] lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_LET_6, i) == lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$(_LET_7, i)
; [eval] lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_LET_6, i)
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
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))))
  val_ref@109@01)))
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
    (+
      (-
        (+ (read$ $Snap.unit) (read$ $Snap.unit))
        ($Perm.min (+ (read$ $Snap.unit) (read$ $Snap.unit)) (read$ $Snap.unit)))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (-
          (+ (read$ $Snap.unit) (read$ $Snap.unit))
          ($Perm.min
            (+ (read$ $Snap.unit) (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit))
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
        (+
          (-
            (+ (read$ $Snap.unit) (read$ $Snap.unit))
            ($Perm.min
              (+ (read$ $Snap.unit) (read$ $Snap.unit))
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
            (+ (read$ $Snap.unit) (read$ $Snap.unit))
            ($Perm.min
              (+ (read$ $Snap.unit) (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
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
; [eval] idx < 64
(assert (lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$%precondition ($Snap.combine
  $t@111@01
  ($Snap.combine $Snap.unit $Snap.unit)) val_ref@109@01 i@119@01))
(pop) ; 11
; Joined path conditions
(assert (lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$%precondition ($Snap.combine
  $t@111@01
  ($Snap.combine $Snap.unit $Snap.unit)) val_ref@109@01 i@119@01))
; [eval] lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$(_LET_7, i)
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
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [eval] 0 <= idx
; [eval] idx < Slice$len__$TY$__usize$Slice$usize$$int$(self)
; [eval] Slice$len__$TY$__usize$Slice$usize$$int$(self)
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
(assert (not (< i@119@01 (Slice$len__$TY$__usize$Slice$usize$$int$ $t@114@01 $t@113@01))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(assert (< i@119@01 (Slice$len__$TY$__usize$Slice$usize$$int$ $t@114@01 $t@113@01)))
(assert (lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$%precondition ($Snap.combine
  $t@114@01
  ($Snap.combine $Snap.unit $Snap.unit)) $t@113@01 i@119@01))
(pop) ; 11
; Joined path conditions
(assert (and
  (< i@119@01 (Slice$len__$TY$__usize$Slice$usize$$int$ $t@114@01 $t@113@01))
  (lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$%precondition ($Snap.combine
    $t@114@01
    ($Snap.combine $Snap.unit $Snap.unit)) $t@113@01 i@119@01)))
(pop) ; 10
(push) ; 10
; [else-branch: 20 | !(i@119@01 < 64 && 0 <= i@119@01)]
(assert (not (and (< i@119@01 64) (<= 0 i@119@01))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (=>
  (and (< i@119@01 64) (<= 0 i@119@01))
  (and
    (< i@119@01 64)
    (<= 0 i@119@01)
    (lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$%precondition ($Snap.combine
      $t@111@01
      ($Snap.combine $Snap.unit $Snap.unit)) val_ref@109@01 i@119@01)
    (< i@119@01 (Slice$len__$TY$__usize$Slice$usize$$int$ $t@114@01 $t@113@01))
    (lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$%precondition ($Snap.combine
      $t@114@01
      ($Snap.combine $Snap.unit $Snap.unit)) $t@113@01 i@119@01))))
; Joined path conditions
(assert (or
  (not (and (< i@119@01 64) (<= 0 i@119@01)))
  (and (< i@119@01 64) (<= 0 i@119@01))))
; [eval] lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$(_20.val_ref, i)
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
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))))
  val_ref@109@01)))
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
    (+
      (-
        (+ (read$ $Snap.unit) (read$ $Snap.unit))
        ($Perm.min (+ (read$ $Snap.unit) (read$ $Snap.unit)) (read$ $Snap.unit)))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (-
          (+ (read$ $Snap.unit) (read$ $Snap.unit))
          ($Perm.min
            (+ (read$ $Snap.unit) (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit))
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
        (+
          (-
            (+ (read$ $Snap.unit) (read$ $Snap.unit))
            ($Perm.min
              (+ (read$ $Snap.unit) (read$ $Snap.unit))
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
            (+ (read$ $Snap.unit) (read$ $Snap.unit))
            ($Perm.min
              (+ (read$ $Snap.unit) (read$ $Snap.unit))
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
; [eval] 0 <= idx
(set-option :timeout 0)
(push) ; 10
(assert (not (<= 0 i@119@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@112@01 ret@107@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@107@01 ret@79@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@112@01 ret@79@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@79@01 ret@74@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@107@01 ret@74@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@112@01 ret@74@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@98@01 $t@62@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@74@01 _1@28@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@79@01 _1@28@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@107@01 _1@28@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@112@01 _1@28@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= _1@28@01 ret@56@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@74@01 ret@56@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@79@01 ret@56@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@107@01 ret@56@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@112@01 ret@56@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@56@01 ret@61@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= _1@28@01 ret@61@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@74@01 ret@61@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@79@01 ret@61@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@107@01 ret@61@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@112@01 ret@61@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@62@01 $t@80@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@98@01 $t@80@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@71@01 ret@89@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@61@01 ret@92@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@56@01 ret@92@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= _1@28@01 ret@92@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@74@01 ret@92@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@79@01 ret@92@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@107@01 ret@92@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@112@01 ret@92@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@92@01 ret@97@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@61@01 ret@97@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@56@01 ret@97@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= _1@28@01 ret@97@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@74@01 ret@97@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@79@01 ret@97@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@107@01 ret@97@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@112@01 ret@97@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@80@01 $t@113@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@62@01 $t@113@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@98@01 $t@113@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@114@01 $t@81@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@114@01 $t@63@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@114@01 $t@99@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@81@01 $t@114@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@81@01 $t@63@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@81@01 $t@99@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@63@01 $t@114@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@63@01 $t@81@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@63@01 $t@99@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@99@01 $t@114@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@99@01 $t@81@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@99@01 $t@63@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and
  (< $Perm.No (read$ $Snap.unit))
  (not
    (=
      ($Snap.first ($Snap.second ($Snap.second $t@55@01)))
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and
  (< $Perm.No (read$ $Snap.unit))
  (not
    (=
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))
      ($Snap.first ($Snap.second ($Snap.second $t@55@01))))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (+
        (-
          (+ (read$ $Snap.unit) (read$ $Snap.unit))
          ($Perm.min
            (+ (read$ $Snap.unit) (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit)))
    (<
      $Perm.No
      (-
        (+
          (-
            (+ (read$ $Snap.unit) (read$ $Snap.unit))
            ($Perm.min
              (+ (read$ $Snap.unit) (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              (+ (read$ $Snap.unit) (read$ $Snap.unit))
              ($Perm.min
                (+ (read$ $Snap.unit) (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))))
  (not (= $t@111@01 $t@96@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (-
        (+
          (-
            (+ (read$ $Snap.unit) (read$ $Snap.unit))
            ($Perm.min
              (+ (read$ $Snap.unit) (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              (+ (read$ $Snap.unit) (read$ $Snap.unit))
              ($Perm.min
                (+ (read$ $Snap.unit) (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          (read$ $Snap.unit))))
    (<
      $Perm.No
      (+
        (-
          (+ (read$ $Snap.unit) (read$ $Snap.unit))
          ($Perm.min
            (+ (read$ $Snap.unit) (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit))))
  (not (= $t@96@01 $t@111@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@98@01 val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@98@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@98@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@98@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@98@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@98@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@98@01 val_ref@109@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@98@01 $t@113@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 $t@98@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 val_ref@109@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 $t@113@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@62@01 $t@98@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@62@01 val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@62@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@62@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@62@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@62@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@62@01 val_ref@109@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@62@01 $t@113@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 $t@98@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 val_ref@109@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 $t@113@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) $t@98@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) $t@62@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) $t@80@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) val_ref@109@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) $t@113@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 $t@98@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 val_ref@109@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 $t@113@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@80@01 $t@98@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@80@01 val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@80@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@80@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@80@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@80@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@80@01 val_ref@109@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@80@01 $t@113@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@109@01 $t@98@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@109@01 val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@109@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@109@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@109@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@109@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@109@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@109@01 $t@113@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@113@01 $t@98@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@113@01 val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@113@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@113@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@113@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@113@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@113@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@113@01 val_ref@109@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_bool@91@01 val_bool@73@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_bool@73@01 val_bool@91@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (and
  (and
    (and
      (not (= ret@97@01 ret@92@01))
      (not (= ret@97@01 ret@61@01))
      (not (= ret@97@01 ret@56@01))
      (not (= ret@97@01 _1@28@01))
      (not (= ret@97@01 ret@74@01))
      (not (= ret@97@01 ret@79@01))
      (not (= ret@97@01 ret@107@01))
      (not (= ret@97@01 ret@112@01)))
    (and
      (not (= ret@92@01 ret@97@01))
      (not (= ret@92@01 ret@61@01))
      (not (= ret@92@01 ret@56@01))
      (not (= ret@92@01 _1@28@01))
      (not (= ret@92@01 ret@74@01))
      (not (= ret@92@01 ret@79@01))
      (not (= ret@92@01 ret@107@01))
      (not (= ret@92@01 ret@112@01)))
    (and
      (not (= ret@61@01 ret@97@01))
      (not (= ret@61@01 ret@92@01))
      (not (= ret@61@01 ret@56@01))
      (not (= ret@61@01 _1@28@01))
      (not (= ret@61@01 ret@74@01))
      (not (= ret@61@01 ret@79@01))
      (not (= ret@61@01 ret@107@01))
      (not (= ret@61@01 ret@112@01)))
    (and
      (not (= ret@56@01 ret@97@01))
      (not (= ret@56@01 ret@92@01))
      (not (= ret@56@01 ret@61@01))
      (not (= ret@56@01 _1@28@01))
      (not (= ret@56@01 ret@74@01))
      (not (= ret@56@01 ret@79@01))
      (not (= ret@56@01 ret@107@01))
      (not (= ret@56@01 ret@112@01)))
    (and
      (not (= _1@28@01 ret@97@01))
      (not (= _1@28@01 ret@92@01))
      (not (= _1@28@01 ret@61@01))
      (not (= _1@28@01 ret@56@01))
      (not (= _1@28@01 ret@74@01))
      (not (= _1@28@01 ret@79@01))
      (not (= _1@28@01 ret@107@01))
      (not (= _1@28@01 ret@112@01)))
    (and
      (not (= ret@74@01 ret@97@01))
      (not (= ret@74@01 ret@92@01))
      (not (= ret@74@01 ret@61@01))
      (not (= ret@74@01 ret@56@01))
      (not (= ret@74@01 _1@28@01))
      (not (= ret@74@01 ret@79@01))
      (not (= ret@74@01 ret@107@01))
      (not (= ret@74@01 ret@112@01)))
    (and
      (not (= ret@79@01 ret@97@01))
      (not (= ret@79@01 ret@92@01))
      (not (= ret@79@01 ret@61@01))
      (not (= ret@79@01 ret@56@01))
      (not (= ret@79@01 _1@28@01))
      (not (= ret@79@01 ret@74@01))
      (not (= ret@79@01 ret@107@01))
      (not (= ret@79@01 ret@112@01)))
    (and
      (not (= ret@107@01 ret@97@01))
      (not (= ret@107@01 ret@92@01))
      (not (= ret@107@01 ret@61@01))
      (not (= ret@107@01 ret@56@01))
      (not (= ret@107@01 _1@28@01))
      (not (= ret@107@01 ret@74@01))
      (not (= ret@107@01 ret@79@01))
      (not (= ret@107@01 ret@112@01)))
    (and
      (not (= ret@112@01 ret@97@01))
      (not (= ret@112@01 ret@92@01))
      (not (= ret@112@01 ret@61@01))
      (not (= ret@112@01 ret@56@01))
      (not (= ret@112@01 _1@28@01))
      (not (= ret@112@01 ret@74@01))
      (not (= ret@112@01 ret@79@01))
      (not (= ret@112@01 ret@107@01))))
  (and (not (= ret@89@01 ret@71@01)) (not (= ret@71@01 ret@89@01)))))
; [eval] 0 <= idx
(set-option :timeout 0)
(push) ; 10
(assert (not (<= 0 i@119@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@112@01 ret@107@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@107@01 ret@79@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@112@01 ret@79@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@79@01 ret@74@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@107@01 ret@74@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@112@01 ret@74@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@98@01 $t@62@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@74@01 _1@28@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@79@01 _1@28@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@107@01 _1@28@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@112@01 _1@28@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= _1@28@01 ret@56@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@74@01 ret@56@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@79@01 ret@56@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@107@01 ret@56@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@112@01 ret@56@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@56@01 ret@61@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= _1@28@01 ret@61@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@74@01 ret@61@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@79@01 ret@61@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@107@01 ret@61@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@112@01 ret@61@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@62@01 $t@80@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@98@01 $t@80@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@71@01 ret@89@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@61@01 ret@92@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@56@01 ret@92@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= _1@28@01 ret@92@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@74@01 ret@92@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@79@01 ret@92@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@107@01 ret@92@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@112@01 ret@92@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@92@01 ret@97@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@61@01 ret@97@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@56@01 ret@97@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= _1@28@01 ret@97@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@74@01 ret@97@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@79@01 ret@97@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@107@01 ret@97@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@112@01 ret@97@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@80@01 $t@113@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@62@01 $t@113@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@98@01 $t@113@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@114@01 $t@81@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@114@01 $t@63@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@114@01 $t@99@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@81@01 $t@114@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@81@01 $t@63@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@81@01 $t@99@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@63@01 $t@114@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@63@01 $t@81@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@63@01 $t@99@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@99@01 $t@114@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@99@01 $t@81@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@99@01 $t@63@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and
  (< $Perm.No (read$ $Snap.unit))
  (not
    (=
      ($Snap.first ($Snap.second ($Snap.second $t@55@01)))
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and
  (< $Perm.No (read$ $Snap.unit))
  (not
    (=
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))
      ($Snap.first ($Snap.second ($Snap.second $t@55@01))))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and
  (<
    $Perm.No
    (-
      (+
        (-
          (+ (read$ $Snap.unit) (read$ $Snap.unit))
          ($Perm.min
            (+ (read$ $Snap.unit) (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (-
            (+ (read$ $Snap.unit) (read$ $Snap.unit))
            ($Perm.min
              (+ (read$ $Snap.unit) (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        (read$ $Snap.unit))))
  (not (= $t@96@01 $t@111@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and
  (<
    $Perm.No
    (-
      (+
        (-
          (+ (read$ $Snap.unit) (read$ $Snap.unit))
          ($Perm.min
            (+ (read$ $Snap.unit) (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (-
            (+ (read$ $Snap.unit) (read$ $Snap.unit))
            ($Perm.min
              (+ (read$ $Snap.unit) (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        (read$ $Snap.unit))))
  (not (= $t@111@01 $t@96@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@98@01 val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@98@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@98@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@98@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@98@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@98@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@98@01 val_ref@109@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@98@01 $t@113@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 $t@98@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 val_ref@109@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 $t@113@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@62@01 $t@98@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@62@01 val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@62@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@62@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@62@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@62@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@62@01 val_ref@109@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@62@01 $t@113@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 $t@98@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 val_ref@109@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 $t@113@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) $t@98@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) $t@62@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) $t@80@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) val_ref@109@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) $t@113@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 $t@98@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 val_ref@109@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 $t@113@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@80@01 $t@98@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@80@01 val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@80@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@80@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@80@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@80@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@80@01 val_ref@109@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@80@01 $t@113@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@109@01 $t@98@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@109@01 val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@109@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@109@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@109@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@109@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@109@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@109@01 $t@113@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@113@01 $t@98@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@113@01 val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@113@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@113@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@113@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@113@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@113@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@113@01 val_ref@109@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_bool@91@01 val_bool@73@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_bool@73@01 val_bool@91@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (and
  (and
    (and
      (not (= ret@97@01 ret@92@01))
      (not (= ret@97@01 ret@61@01))
      (not (= ret@97@01 ret@56@01))
      (not (= ret@97@01 _1@28@01))
      (not (= ret@97@01 ret@74@01))
      (not (= ret@97@01 ret@79@01))
      (not (= ret@97@01 ret@107@01))
      (not (= ret@97@01 ret@112@01)))
    (and
      (not (= ret@92@01 ret@97@01))
      (not (= ret@92@01 ret@61@01))
      (not (= ret@92@01 ret@56@01))
      (not (= ret@92@01 _1@28@01))
      (not (= ret@92@01 ret@74@01))
      (not (= ret@92@01 ret@79@01))
      (not (= ret@92@01 ret@107@01))
      (not (= ret@92@01 ret@112@01)))
    (and
      (not (= ret@61@01 ret@97@01))
      (not (= ret@61@01 ret@92@01))
      (not (= ret@61@01 ret@56@01))
      (not (= ret@61@01 _1@28@01))
      (not (= ret@61@01 ret@74@01))
      (not (= ret@61@01 ret@79@01))
      (not (= ret@61@01 ret@107@01))
      (not (= ret@61@01 ret@112@01)))
    (and
      (not (= ret@56@01 ret@97@01))
      (not (= ret@56@01 ret@92@01))
      (not (= ret@56@01 ret@61@01))
      (not (= ret@56@01 _1@28@01))
      (not (= ret@56@01 ret@74@01))
      (not (= ret@56@01 ret@79@01))
      (not (= ret@56@01 ret@107@01))
      (not (= ret@56@01 ret@112@01)))
    (and
      (not (= _1@28@01 ret@97@01))
      (not (= _1@28@01 ret@92@01))
      (not (= _1@28@01 ret@61@01))
      (not (= _1@28@01 ret@56@01))
      (not (= _1@28@01 ret@74@01))
      (not (= _1@28@01 ret@79@01))
      (not (= _1@28@01 ret@107@01))
      (not (= _1@28@01 ret@112@01)))
    (and
      (not (= ret@74@01 ret@97@01))
      (not (= ret@74@01 ret@92@01))
      (not (= ret@74@01 ret@61@01))
      (not (= ret@74@01 ret@56@01))
      (not (= ret@74@01 _1@28@01))
      (not (= ret@74@01 ret@79@01))
      (not (= ret@74@01 ret@107@01))
      (not (= ret@74@01 ret@112@01)))
    (and
      (not (= ret@79@01 ret@97@01))
      (not (= ret@79@01 ret@92@01))
      (not (= ret@79@01 ret@61@01))
      (not (= ret@79@01 ret@56@01))
      (not (= ret@79@01 _1@28@01))
      (not (= ret@79@01 ret@74@01))
      (not (= ret@79@01 ret@107@01))
      (not (= ret@79@01 ret@112@01)))
    (and
      (not (= ret@107@01 ret@97@01))
      (not (= ret@107@01 ret@92@01))
      (not (= ret@107@01 ret@61@01))
      (not (= ret@107@01 ret@56@01))
      (not (= ret@107@01 _1@28@01))
      (not (= ret@107@01 ret@74@01))
      (not (= ret@107@01 ret@79@01))
      (not (= ret@107@01 ret@112@01)))
    (and
      (not (= ret@112@01 ret@97@01))
      (not (= ret@112@01 ret@92@01))
      (not (= ret@112@01 ret@61@01))
      (not (= ret@112@01 ret@56@01))
      (not (= ret@112@01 _1@28@01))
      (not (= ret@112@01 ret@74@01))
      (not (= ret@112@01 ret@79@01))
      (not (= ret@112@01 ret@107@01))))
  (and (not (= ret@89@01 ret@71@01)) (not (= ret@71@01 ret@89@01)))))
; [eval] 0 <= idx
(set-option :timeout 0)
(push) ; 10
(assert (not (<= 0 i@119@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@112@01 ret@107@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@107@01 ret@79@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@112@01 ret@79@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@79@01 ret@74@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@107@01 ret@74@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@112@01 ret@74@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@98@01 $t@62@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@74@01 _1@28@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@79@01 _1@28@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@107@01 _1@28@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@112@01 _1@28@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= _1@28@01 ret@56@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@74@01 ret@56@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@79@01 ret@56@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@107@01 ret@56@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@112@01 ret@56@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@56@01 ret@61@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= _1@28@01 ret@61@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@74@01 ret@61@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@79@01 ret@61@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@107@01 ret@61@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@112@01 ret@61@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@62@01 $t@80@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@98@01 $t@80@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@71@01 ret@89@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@61@01 ret@92@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@56@01 ret@92@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= _1@28@01 ret@92@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@74@01 ret@92@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@79@01 ret@92@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@107@01 ret@92@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@112@01 ret@92@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@92@01 ret@97@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@61@01 ret@97@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@56@01 ret@97@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= _1@28@01 ret@97@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@74@01 ret@97@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@79@01 ret@97@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@107@01 ret@97@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@112@01 ret@97@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@80@01 $t@113@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@62@01 $t@113@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@98@01 $t@113@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@114@01 $t@81@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@114@01 $t@63@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@114@01 $t@99@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@81@01 $t@114@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@81@01 $t@63@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@81@01 $t@99@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@63@01 $t@114@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@63@01 $t@81@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@63@01 $t@99@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@99@01 $t@114@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@99@01 $t@81@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@99@01 $t@63@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and
  (< $Perm.No (read$ $Snap.unit))
  (not
    (=
      ($Snap.first ($Snap.second ($Snap.second $t@55@01)))
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and
  (< $Perm.No (read$ $Snap.unit))
  (not
    (=
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))
      ($Snap.first ($Snap.second ($Snap.second $t@55@01))))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (+
        (-
          (+ (read$ $Snap.unit) (read$ $Snap.unit))
          ($Perm.min
            (+ (read$ $Snap.unit) (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit)))
    (<
      $Perm.No
      (-
        (+
          (-
            (+ (read$ $Snap.unit) (read$ $Snap.unit))
            ($Perm.min
              (+ (read$ $Snap.unit) (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              (+ (read$ $Snap.unit) (read$ $Snap.unit))
              ($Perm.min
                (+ (read$ $Snap.unit) (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))))
  (not (= $t@111@01 $t@96@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (-
        (+
          (-
            (+ (read$ $Snap.unit) (read$ $Snap.unit))
            ($Perm.min
              (+ (read$ $Snap.unit) (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              (+ (read$ $Snap.unit) (read$ $Snap.unit))
              ($Perm.min
                (+ (read$ $Snap.unit) (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          (read$ $Snap.unit))))
    (<
      $Perm.No
      (+
        (-
          (+ (read$ $Snap.unit) (read$ $Snap.unit))
          ($Perm.min
            (+ (read$ $Snap.unit) (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit))))
  (not (= $t@96@01 $t@111@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@98@01 val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@98@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@98@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@98@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@98@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@98@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@98@01 val_ref@109@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@98@01 $t@113@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 $t@98@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 val_ref@109@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 $t@113@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@62@01 $t@98@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@62@01 val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@62@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@62@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@62@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@62@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@62@01 val_ref@109@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@62@01 $t@113@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 $t@98@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 val_ref@109@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 $t@113@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) $t@98@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) $t@62@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) $t@80@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) val_ref@109@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) $t@113@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 $t@98@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 val_ref@109@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 $t@113@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@80@01 $t@98@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@80@01 val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@80@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@80@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@80@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@80@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@80@01 val_ref@109@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@80@01 $t@113@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@109@01 $t@98@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@109@01 val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@109@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@109@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@109@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@109@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@109@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@109@01 $t@113@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@113@01 $t@98@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@113@01 val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@113@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@113@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@113@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@113@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@113@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@113@01 val_ref@109@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_bool@91@01 val_bool@73@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_bool@73@01 val_bool@91@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (and
  (and
    (and
      (not (= ret@97@01 ret@92@01))
      (not (= ret@97@01 ret@61@01))
      (not (= ret@97@01 ret@56@01))
      (not (= ret@97@01 _1@28@01))
      (not (= ret@97@01 ret@74@01))
      (not (= ret@97@01 ret@79@01))
      (not (= ret@97@01 ret@107@01))
      (not (= ret@97@01 ret@112@01)))
    (and
      (not (= ret@92@01 ret@97@01))
      (not (= ret@92@01 ret@61@01))
      (not (= ret@92@01 ret@56@01))
      (not (= ret@92@01 _1@28@01))
      (not (= ret@92@01 ret@74@01))
      (not (= ret@92@01 ret@79@01))
      (not (= ret@92@01 ret@107@01))
      (not (= ret@92@01 ret@112@01)))
    (and
      (not (= ret@61@01 ret@97@01))
      (not (= ret@61@01 ret@92@01))
      (not (= ret@61@01 ret@56@01))
      (not (= ret@61@01 _1@28@01))
      (not (= ret@61@01 ret@74@01))
      (not (= ret@61@01 ret@79@01))
      (not (= ret@61@01 ret@107@01))
      (not (= ret@61@01 ret@112@01)))
    (and
      (not (= ret@56@01 ret@97@01))
      (not (= ret@56@01 ret@92@01))
      (not (= ret@56@01 ret@61@01))
      (not (= ret@56@01 _1@28@01))
      (not (= ret@56@01 ret@74@01))
      (not (= ret@56@01 ret@79@01))
      (not (= ret@56@01 ret@107@01))
      (not (= ret@56@01 ret@112@01)))
    (and
      (not (= _1@28@01 ret@97@01))
      (not (= _1@28@01 ret@92@01))
      (not (= _1@28@01 ret@61@01))
      (not (= _1@28@01 ret@56@01))
      (not (= _1@28@01 ret@74@01))
      (not (= _1@28@01 ret@79@01))
      (not (= _1@28@01 ret@107@01))
      (not (= _1@28@01 ret@112@01)))
    (and
      (not (= ret@74@01 ret@97@01))
      (not (= ret@74@01 ret@92@01))
      (not (= ret@74@01 ret@61@01))
      (not (= ret@74@01 ret@56@01))
      (not (= ret@74@01 _1@28@01))
      (not (= ret@74@01 ret@79@01))
      (not (= ret@74@01 ret@107@01))
      (not (= ret@74@01 ret@112@01)))
    (and
      (not (= ret@79@01 ret@97@01))
      (not (= ret@79@01 ret@92@01))
      (not (= ret@79@01 ret@61@01))
      (not (= ret@79@01 ret@56@01))
      (not (= ret@79@01 _1@28@01))
      (not (= ret@79@01 ret@74@01))
      (not (= ret@79@01 ret@107@01))
      (not (= ret@79@01 ret@112@01)))
    (and
      (not (= ret@107@01 ret@97@01))
      (not (= ret@107@01 ret@92@01))
      (not (= ret@107@01 ret@61@01))
      (not (= ret@107@01 ret@56@01))
      (not (= ret@107@01 _1@28@01))
      (not (= ret@107@01 ret@74@01))
      (not (= ret@107@01 ret@79@01))
      (not (= ret@107@01 ret@112@01)))
    (and
      (not (= ret@112@01 ret@97@01))
      (not (= ret@112@01 ret@92@01))
      (not (= ret@112@01 ret@61@01))
      (not (= ret@112@01 ret@56@01))
      (not (= ret@112@01 _1@28@01))
      (not (= ret@112@01 ret@74@01))
      (not (= ret@112@01 ret@79@01))
      (not (= ret@112@01 ret@107@01))))
  (and (not (= ret@89@01 ret@71@01)) (not (= ret@71@01 ret@89@01)))))
; [eval] 0 <= idx
(set-option :timeout 0)
(push) ; 10
(assert (not (<= 0 i@119@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(pop) ; 9
; [eval] lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$(_19.val_ref, i)
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
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [eval] 0 <= idx
(set-option :timeout 0)
(push) ; 10
(assert (not (<= 0 i@119@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@112@01 ret@107@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@107@01 ret@79@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@112@01 ret@79@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@79@01 ret@74@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@107@01 ret@74@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@112@01 ret@74@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@98@01 $t@62@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@74@01 _1@28@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@79@01 _1@28@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@107@01 _1@28@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@112@01 _1@28@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= _1@28@01 ret@56@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@74@01 ret@56@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@79@01 ret@56@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@107@01 ret@56@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@112@01 ret@56@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@56@01 ret@61@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= _1@28@01 ret@61@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@74@01 ret@61@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@79@01 ret@61@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@107@01 ret@61@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@112@01 ret@61@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@62@01 $t@80@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@98@01 $t@80@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@71@01 ret@89@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@61@01 ret@92@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@56@01 ret@92@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= _1@28@01 ret@92@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@74@01 ret@92@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@79@01 ret@92@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@107@01 ret@92@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@112@01 ret@92@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@92@01 ret@97@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@61@01 ret@97@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@56@01 ret@97@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= _1@28@01 ret@97@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@74@01 ret@97@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@79@01 ret@97@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@107@01 ret@97@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@112@01 ret@97@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@80@01 $t@113@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@62@01 $t@113@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@98@01 $t@113@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@114@01 $t@81@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@114@01 $t@63@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@114@01 $t@99@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@81@01 $t@114@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@81@01 $t@63@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@81@01 $t@99@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@63@01 $t@114@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@63@01 $t@81@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@63@01 $t@99@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@99@01 $t@114@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@99@01 $t@81@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@99@01 $t@63@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and
  (< $Perm.No (read$ $Snap.unit))
  (not
    (=
      ($Snap.first ($Snap.second ($Snap.second $t@55@01)))
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and
  (< $Perm.No (read$ $Snap.unit))
  (not
    (=
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))
      ($Snap.first ($Snap.second ($Snap.second $t@55@01))))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (+
        (-
          (+ (read$ $Snap.unit) (read$ $Snap.unit))
          ($Perm.min
            (+ (read$ $Snap.unit) (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit)))
    (<
      $Perm.No
      (-
        (+
          (-
            (+ (read$ $Snap.unit) (read$ $Snap.unit))
            ($Perm.min
              (+ (read$ $Snap.unit) (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              (+ (read$ $Snap.unit) (read$ $Snap.unit))
              ($Perm.min
                (+ (read$ $Snap.unit) (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))))
  (not (= $t@111@01 $t@96@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (-
        (+
          (-
            (+ (read$ $Snap.unit) (read$ $Snap.unit))
            ($Perm.min
              (+ (read$ $Snap.unit) (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              (+ (read$ $Snap.unit) (read$ $Snap.unit))
              ($Perm.min
                (+ (read$ $Snap.unit) (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          (read$ $Snap.unit))))
    (<
      $Perm.No
      (+
        (-
          (+ (read$ $Snap.unit) (read$ $Snap.unit))
          ($Perm.min
            (+ (read$ $Snap.unit) (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit))))
  (not (= $t@96@01 $t@111@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@98@01 val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@98@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@98@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@98@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@98@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@98@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@98@01 val_ref@109@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@98@01 $t@113@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 $t@98@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 val_ref@109@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 $t@113@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@62@01 $t@98@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@62@01 val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@62@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@62@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@62@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@62@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@62@01 val_ref@109@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@62@01 $t@113@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 $t@98@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 val_ref@109@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 $t@113@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) $t@98@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) $t@62@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) $t@80@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) val_ref@109@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) $t@113@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 $t@98@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 val_ref@109@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 $t@113@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@80@01 $t@98@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@80@01 val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@80@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@80@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@80@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@80@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@80@01 val_ref@109@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@80@01 $t@113@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@109@01 $t@98@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@109@01 val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@109@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@109@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@109@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@109@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@109@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@109@01 $t@113@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@113@01 $t@98@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@113@01 val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@113@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@113@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@113@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@113@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@113@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@113@01 val_ref@109@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_bool@91@01 val_bool@73@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_bool@73@01 val_bool@91@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (and
  (and
    (and
      (not (= ret@97@01 ret@92@01))
      (not (= ret@97@01 ret@61@01))
      (not (= ret@97@01 ret@56@01))
      (not (= ret@97@01 _1@28@01))
      (not (= ret@97@01 ret@74@01))
      (not (= ret@97@01 ret@79@01))
      (not (= ret@97@01 ret@107@01))
      (not (= ret@97@01 ret@112@01)))
    (and
      (not (= ret@92@01 ret@97@01))
      (not (= ret@92@01 ret@61@01))
      (not (= ret@92@01 ret@56@01))
      (not (= ret@92@01 _1@28@01))
      (not (= ret@92@01 ret@74@01))
      (not (= ret@92@01 ret@79@01))
      (not (= ret@92@01 ret@107@01))
      (not (= ret@92@01 ret@112@01)))
    (and
      (not (= ret@61@01 ret@97@01))
      (not (= ret@61@01 ret@92@01))
      (not (= ret@61@01 ret@56@01))
      (not (= ret@61@01 _1@28@01))
      (not (= ret@61@01 ret@74@01))
      (not (= ret@61@01 ret@79@01))
      (not (= ret@61@01 ret@107@01))
      (not (= ret@61@01 ret@112@01)))
    (and
      (not (= ret@56@01 ret@97@01))
      (not (= ret@56@01 ret@92@01))
      (not (= ret@56@01 ret@61@01))
      (not (= ret@56@01 _1@28@01))
      (not (= ret@56@01 ret@74@01))
      (not (= ret@56@01 ret@79@01))
      (not (= ret@56@01 ret@107@01))
      (not (= ret@56@01 ret@112@01)))
    (and
      (not (= _1@28@01 ret@97@01))
      (not (= _1@28@01 ret@92@01))
      (not (= _1@28@01 ret@61@01))
      (not (= _1@28@01 ret@56@01))
      (not (= _1@28@01 ret@74@01))
      (not (= _1@28@01 ret@79@01))
      (not (= _1@28@01 ret@107@01))
      (not (= _1@28@01 ret@112@01)))
    (and
      (not (= ret@74@01 ret@97@01))
      (not (= ret@74@01 ret@92@01))
      (not (= ret@74@01 ret@61@01))
      (not (= ret@74@01 ret@56@01))
      (not (= ret@74@01 _1@28@01))
      (not (= ret@74@01 ret@79@01))
      (not (= ret@74@01 ret@107@01))
      (not (= ret@74@01 ret@112@01)))
    (and
      (not (= ret@79@01 ret@97@01))
      (not (= ret@79@01 ret@92@01))
      (not (= ret@79@01 ret@61@01))
      (not (= ret@79@01 ret@56@01))
      (not (= ret@79@01 _1@28@01))
      (not (= ret@79@01 ret@74@01))
      (not (= ret@79@01 ret@107@01))
      (not (= ret@79@01 ret@112@01)))
    (and
      (not (= ret@107@01 ret@97@01))
      (not (= ret@107@01 ret@92@01))
      (not (= ret@107@01 ret@61@01))
      (not (= ret@107@01 ret@56@01))
      (not (= ret@107@01 _1@28@01))
      (not (= ret@107@01 ret@74@01))
      (not (= ret@107@01 ret@79@01))
      (not (= ret@107@01 ret@112@01)))
    (and
      (not (= ret@112@01 ret@97@01))
      (not (= ret@112@01 ret@92@01))
      (not (= ret@112@01 ret@61@01))
      (not (= ret@112@01 ret@56@01))
      (not (= ret@112@01 _1@28@01))
      (not (= ret@112@01 ret@74@01))
      (not (= ret@112@01 ret@79@01))
      (not (= ret@112@01 ret@107@01))))
  (and (not (= ret@89@01 ret@71@01)) (not (= ret@71@01 ret@89@01)))))
; [eval] 0 <= idx
(set-option :timeout 0)
(push) ; 10
(assert (not (<= 0 i@119@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@112@01 ret@107@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@107@01 ret@79@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@112@01 ret@79@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@79@01 ret@74@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@107@01 ret@74@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@112@01 ret@74@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@98@01 $t@62@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@74@01 _1@28@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@79@01 _1@28@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@107@01 _1@28@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@112@01 _1@28@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= _1@28@01 ret@56@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@74@01 ret@56@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@79@01 ret@56@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@107@01 ret@56@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@112@01 ret@56@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@56@01 ret@61@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= _1@28@01 ret@61@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@74@01 ret@61@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@79@01 ret@61@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@107@01 ret@61@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@112@01 ret@61@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@62@01 $t@80@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@98@01 $t@80@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@71@01 ret@89@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@61@01 ret@92@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@56@01 ret@92@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= _1@28@01 ret@92@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@74@01 ret@92@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@79@01 ret@92@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@107@01 ret@92@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@112@01 ret@92@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@92@01 ret@97@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@61@01 ret@97@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@56@01 ret@97@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= _1@28@01 ret@97@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@74@01 ret@97@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@79@01 ret@97@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@107@01 ret@97@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@112@01 ret@97@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@81@01 $t@63@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@81@01 $t@99@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@63@01 $t@81@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@63@01 $t@99@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@99@01 $t@81@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@99@01 $t@63@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and
  (< $Perm.No (read$ $Snap.unit))
  (not
    (=
      ($Snap.first ($Snap.second ($Snap.second $t@55@01)))
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and
  (< $Perm.No (read$ $Snap.unit))
  (not
    (=
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))
      ($Snap.first ($Snap.second ($Snap.second $t@55@01))))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (+
        (-
          (+ (read$ $Snap.unit) (read$ $Snap.unit))
          ($Perm.min
            (+ (read$ $Snap.unit) (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit)))
    (<
      $Perm.No
      (-
        (+
          (-
            (+ (read$ $Snap.unit) (read$ $Snap.unit))
            ($Perm.min
              (+ (read$ $Snap.unit) (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              (+ (read$ $Snap.unit) (read$ $Snap.unit))
              ($Perm.min
                (+ (read$ $Snap.unit) (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))))
  (not (= $t@111@01 $t@96@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (-
        (+
          (-
            (+ (read$ $Snap.unit) (read$ $Snap.unit))
            ($Perm.min
              (+ (read$ $Snap.unit) (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              (+ (read$ $Snap.unit) (read$ $Snap.unit))
              ($Perm.min
                (+ (read$ $Snap.unit) (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          (read$ $Snap.unit))))
    (<
      $Perm.No
      (+
        (-
          (+ (read$ $Snap.unit) (read$ $Snap.unit))
          ($Perm.min
            (+ (read$ $Snap.unit) (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit))))
  (not (= $t@96@01 $t@111@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@98@01 val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@98@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@98@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@98@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@98@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@98@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@98@01 val_ref@109@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@98@01 $t@113@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 $t@98@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 val_ref@109@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 $t@113@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@62@01 $t@98@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@62@01 val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@62@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@62@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@62@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@62@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@62@01 val_ref@109@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@62@01 $t@113@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 $t@98@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 val_ref@109@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 $t@113@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) $t@98@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) $t@62@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) $t@80@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) val_ref@109@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) $t@113@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 $t@98@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 val_ref@109@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 $t@113@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@80@01 $t@98@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@80@01 val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@80@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@80@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@80@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@80@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@80@01 val_ref@109@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@80@01 $t@113@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@109@01 $t@98@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@109@01 val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@109@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@109@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@109@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@109@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@109@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@109@01 $t@113@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@113@01 $t@98@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@113@01 val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@113@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@113@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@113@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@113@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@113@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@113@01 val_ref@109@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_bool@91@01 val_bool@73@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_bool@73@01 val_bool@91@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (and
  (and
    (and
      (not (= ret@97@01 ret@92@01))
      (not (= ret@97@01 ret@61@01))
      (not (= ret@97@01 ret@56@01))
      (not (= ret@97@01 _1@28@01))
      (not (= ret@97@01 ret@74@01))
      (not (= ret@97@01 ret@79@01))
      (not (= ret@97@01 ret@107@01))
      (not (= ret@97@01 ret@112@01)))
    (and
      (not (= ret@92@01 ret@97@01))
      (not (= ret@92@01 ret@61@01))
      (not (= ret@92@01 ret@56@01))
      (not (= ret@92@01 _1@28@01))
      (not (= ret@92@01 ret@74@01))
      (not (= ret@92@01 ret@79@01))
      (not (= ret@92@01 ret@107@01))
      (not (= ret@92@01 ret@112@01)))
    (and
      (not (= ret@61@01 ret@97@01))
      (not (= ret@61@01 ret@92@01))
      (not (= ret@61@01 ret@56@01))
      (not (= ret@61@01 _1@28@01))
      (not (= ret@61@01 ret@74@01))
      (not (= ret@61@01 ret@79@01))
      (not (= ret@61@01 ret@107@01))
      (not (= ret@61@01 ret@112@01)))
    (and
      (not (= ret@56@01 ret@97@01))
      (not (= ret@56@01 ret@92@01))
      (not (= ret@56@01 ret@61@01))
      (not (= ret@56@01 _1@28@01))
      (not (= ret@56@01 ret@74@01))
      (not (= ret@56@01 ret@79@01))
      (not (= ret@56@01 ret@107@01))
      (not (= ret@56@01 ret@112@01)))
    (and
      (not (= _1@28@01 ret@97@01))
      (not (= _1@28@01 ret@92@01))
      (not (= _1@28@01 ret@61@01))
      (not (= _1@28@01 ret@56@01))
      (not (= _1@28@01 ret@74@01))
      (not (= _1@28@01 ret@79@01))
      (not (= _1@28@01 ret@107@01))
      (not (= _1@28@01 ret@112@01)))
    (and
      (not (= ret@74@01 ret@97@01))
      (not (= ret@74@01 ret@92@01))
      (not (= ret@74@01 ret@61@01))
      (not (= ret@74@01 ret@56@01))
      (not (= ret@74@01 _1@28@01))
      (not (= ret@74@01 ret@79@01))
      (not (= ret@74@01 ret@107@01))
      (not (= ret@74@01 ret@112@01)))
    (and
      (not (= ret@79@01 ret@97@01))
      (not (= ret@79@01 ret@92@01))
      (not (= ret@79@01 ret@61@01))
      (not (= ret@79@01 ret@56@01))
      (not (= ret@79@01 _1@28@01))
      (not (= ret@79@01 ret@74@01))
      (not (= ret@79@01 ret@107@01))
      (not (= ret@79@01 ret@112@01)))
    (and
      (not (= ret@107@01 ret@97@01))
      (not (= ret@107@01 ret@92@01))
      (not (= ret@107@01 ret@61@01))
      (not (= ret@107@01 ret@56@01))
      (not (= ret@107@01 _1@28@01))
      (not (= ret@107@01 ret@74@01))
      (not (= ret@107@01 ret@79@01))
      (not (= ret@107@01 ret@112@01)))
    (and
      (not (= ret@112@01 ret@97@01))
      (not (= ret@112@01 ret@92@01))
      (not (= ret@112@01 ret@61@01))
      (not (= ret@112@01 ret@56@01))
      (not (= ret@112@01 _1@28@01))
      (not (= ret@112@01 ret@74@01))
      (not (= ret@112@01 ret@79@01))
      (not (= ret@112@01 ret@107@01))))
  (and (not (= ret@89@01 ret@71@01)) (not (= ret@71@01 ret@89@01)))))
; [eval] 0 <= idx
(set-option :timeout 0)
(push) ; 10
(assert (not (<= 0 i@119@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@112@01 ret@107@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@107@01 ret@79@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@112@01 ret@79@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@79@01 ret@74@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@107@01 ret@74@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@112@01 ret@74@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@98@01 $t@62@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@74@01 _1@28@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@79@01 _1@28@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@107@01 _1@28@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@112@01 _1@28@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= _1@28@01 ret@56@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@74@01 ret@56@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@79@01 ret@56@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@107@01 ret@56@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@112@01 ret@56@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@56@01 ret@61@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= _1@28@01 ret@61@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@74@01 ret@61@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@79@01 ret@61@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@107@01 ret@61@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@112@01 ret@61@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@62@01 $t@80@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@98@01 $t@80@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@71@01 ret@89@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@61@01 ret@92@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@56@01 ret@92@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= _1@28@01 ret@92@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@74@01 ret@92@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@79@01 ret@92@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@107@01 ret@92@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@112@01 ret@92@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@92@01 ret@97@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@61@01 ret@97@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@56@01 ret@97@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= _1@28@01 ret@97@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@74@01 ret@97@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@79@01 ret@97@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@107@01 ret@97@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@112@01 ret@97@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@80@01 $t@113@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@62@01 $t@113@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= $t@98@01 $t@113@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@114@01 $t@81@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@114@01 $t@63@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@114@01 $t@99@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@81@01 $t@114@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@81@01 $t@63@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@81@01 $t@99@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@63@01 $t@114@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@63@01 $t@81@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@63@01 $t@99@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@99@01 $t@114@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@99@01 $t@81@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and (< $Perm.No (read$ $Snap.unit)) (not (= $t@99@01 $t@63@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and
  (< $Perm.No (read$ $Snap.unit))
  (not
    (=
      ($Snap.first ($Snap.second ($Snap.second $t@55@01)))
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and
  (< $Perm.No (read$ $Snap.unit))
  (not
    (=
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))
      ($Snap.first ($Snap.second ($Snap.second $t@55@01))))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (+
        (-
          (+ (read$ $Snap.unit) (read$ $Snap.unit))
          ($Perm.min
            (+ (read$ $Snap.unit) (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit)))
    (<
      $Perm.No
      (-
        (+
          (-
            (+ (read$ $Snap.unit) (read$ $Snap.unit))
            ($Perm.min
              (+ (read$ $Snap.unit) (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              (+ (read$ $Snap.unit) (read$ $Snap.unit))
              ($Perm.min
                (+ (read$ $Snap.unit) (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))))
  (not (= $t@111@01 $t@96@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (and
  (and
    (<
      $Perm.No
      (-
        (+
          (-
            (+ (read$ $Snap.unit) (read$ $Snap.unit))
            ($Perm.min
              (+ (read$ $Snap.unit) (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              (+ (read$ $Snap.unit) (read$ $Snap.unit))
              ($Perm.min
                (+ (read$ $Snap.unit) (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          (read$ $Snap.unit))))
    (<
      $Perm.No
      (+
        (-
          (+ (read$ $Snap.unit) (read$ $Snap.unit))
          ($Perm.min
            (+ (read$ $Snap.unit) (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit))))
  (not (= $t@96@01 $t@111@01)))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@98@01 val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@98@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@98@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@98@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@98@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@98@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@98@01 val_ref@109@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@98@01 $t@113@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 $t@98@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 val_ref@109@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@94@01 $t@113@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@62@01 $t@98@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@62@01 val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@62@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@62@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@62@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@62@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@62@01 val_ref@109@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@62@01 $t@113@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 $t@98@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 val_ref@109@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@58@01 $t@113@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) $t@98@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) $t@62@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) $t@80@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) val_ref@109@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) $t@113@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 $t@98@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 val_ref@109@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@76@01 $t@113@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@80@01 $t@98@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@80@01 val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@80@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@80@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@80@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@80@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@80@01 val_ref@109@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@80@01 $t@113@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@109@01 $t@98@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@109@01 val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@109@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@109@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@109@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@109@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@109@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_ref@109@01 $t@113@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@113@01 $t@98@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@113@01 val_ref@94@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@113@01 $t@62@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@113@01 val_ref@58@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@113@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@113@01 val_ref@76@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@113@01 $t@80@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= $t@113@01 val_ref@109@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_bool@91@01 val_bool@73@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not (= val_bool@73@01 val_bool@91@01))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (and
  (and
    (and
      (not (= ret@97@01 ret@92@01))
      (not (= ret@97@01 ret@61@01))
      (not (= ret@97@01 ret@56@01))
      (not (= ret@97@01 _1@28@01))
      (not (= ret@97@01 ret@74@01))
      (not (= ret@97@01 ret@79@01))
      (not (= ret@97@01 ret@107@01))
      (not (= ret@97@01 ret@112@01)))
    (and
      (not (= ret@92@01 ret@97@01))
      (not (= ret@92@01 ret@61@01))
      (not (= ret@92@01 ret@56@01))
      (not (= ret@92@01 _1@28@01))
      (not (= ret@92@01 ret@74@01))
      (not (= ret@92@01 ret@79@01))
      (not (= ret@92@01 ret@107@01))
      (not (= ret@92@01 ret@112@01)))
    (and
      (not (= ret@61@01 ret@97@01))
      (not (= ret@61@01 ret@92@01))
      (not (= ret@61@01 ret@56@01))
      (not (= ret@61@01 _1@28@01))
      (not (= ret@61@01 ret@74@01))
      (not (= ret@61@01 ret@79@01))
      (not (= ret@61@01 ret@107@01))
      (not (= ret@61@01 ret@112@01)))
    (and
      (not (= ret@56@01 ret@97@01))
      (not (= ret@56@01 ret@92@01))
      (not (= ret@56@01 ret@61@01))
      (not (= ret@56@01 _1@28@01))
      (not (= ret@56@01 ret@74@01))
      (not (= ret@56@01 ret@79@01))
      (not (= ret@56@01 ret@107@01))
      (not (= ret@56@01 ret@112@01)))
    (and
      (not (= _1@28@01 ret@97@01))
      (not (= _1@28@01 ret@92@01))
      (not (= _1@28@01 ret@61@01))
      (not (= _1@28@01 ret@56@01))
      (not (= _1@28@01 ret@74@01))
      (not (= _1@28@01 ret@79@01))
      (not (= _1@28@01 ret@107@01))
      (not (= _1@28@01 ret@112@01)))
    (and
      (not (= ret@74@01 ret@97@01))
      (not (= ret@74@01 ret@92@01))
      (not (= ret@74@01 ret@61@01))
      (not (= ret@74@01 ret@56@01))
      (not (= ret@74@01 _1@28@01))
      (not (= ret@74@01 ret@79@01))
      (not (= ret@74@01 ret@107@01))
      (not (= ret@74@01 ret@112@01)))
    (and
      (not (= ret@79@01 ret@97@01))
      (not (= ret@79@01 ret@92@01))
      (not (= ret@79@01 ret@61@01))
      (not (= ret@79@01 ret@56@01))
      (not (= ret@79@01 _1@28@01))
      (not (= ret@79@01 ret@74@01))
      (not (= ret@79@01 ret@107@01))
      (not (= ret@79@01 ret@112@01)))
    (and
      (not (= ret@107@01 ret@97@01))
      (not (= ret@107@01 ret@92@01))
      (not (= ret@107@01 ret@61@01))
      (not (= ret@107@01 ret@56@01))
      (not (= ret@107@01 _1@28@01))
      (not (= ret@107@01 ret@74@01))
      (not (= ret@107@01 ret@79@01))
      (not (= ret@107@01 ret@112@01)))
    (and
      (not (= ret@112@01 ret@97@01))
      (not (= ret@112@01 ret@92@01))
      (not (= ret@112@01 ret@61@01))
      (not (= ret@112@01 ret@56@01))
      (not (= ret@112@01 _1@28@01))
      (not (= ret@112@01 ret@74@01))
      (not (= ret@112@01 ret@79@01))
      (not (= ret@112@01 ret@107@01))))
  (and (not (= ret@89@01 ret@71@01)) (not (= ret@71@01 ret@89@01)))))
; [eval] 0 <= idx
(set-option :timeout 0)
(push) ; 10
(assert (not (<= 0 i@119@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(pop) ; 9
(pop) ; 8
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@119@01 Int)) (!
  (and
    (or (not (<= 0 i@119@01)) (<= 0 i@119@01))
    (=>
      (and (< i@119@01 64) (<= 0 i@119@01))
      (and
        (< i@119@01 64)
        (<= 0 i@119@01)
        (lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$%precondition ($Snap.combine
          $t@111@01
          ($Snap.combine $Snap.unit $Snap.unit)) val_ref@109@01 i@119@01)
        (<
          i@119@01
          (Slice$len__$TY$__usize$Slice$usize$$int$ $t@114@01 $t@113@01))
        (lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$%precondition ($Snap.combine
          $t@114@01
          ($Snap.combine $Snap.unit $Snap.unit)) $t@113@01 i@119@01)))
    (or
      (not (and (< i@119@01 64) (<= 0 i@119@01)))
      (and (< i@119@01 64) (<= 0 i@119@01))))
  
  :qid |prog.l614-aux|)))
(assert (forall ((i@119@01 Int)) (!
  (=>
    (and (< i@119@01 64) (<= 0 i@119@01))
    (=
      (lookup_pure__$TY$__Array$64$usize$usize$Array$64$usize$$int$$$int$ ($Snap.combine
        $t@111@01
        ($Snap.combine $Snap.unit $Snap.unit)) val_ref@109@01 i@119@01)
      (lookup_pure__$TY$__Slice$usize$usize$Slice$usize$$int$$$int$ ($Snap.combine
        $t@114@01
        ($Snap.combine $Snap.unit $Snap.unit)) $t@113@01 i@119@01)))
  
  :qid |prog.l614|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; label l19
; [exec]
; _18 := builtin$havoc_int()
(declare-const ret@120@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _18 := Slice$len__$TY$__usize$Slice$usize$$int$(_19.val_ref)
; [eval] Slice$len__$TY$__usize$Slice$usize$$int$(_19.val_ref)
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
(declare-const _18@121@01 Int)
(assert (= _18@121@01 (Slice$len__$TY$__usize$Slice$usize$$int$ $t@114@01 $t@113@01)))
; [eval] __t7 && (__t7 && __t7)
(set-option :timeout 0)
(push) ; 8
; [then-branch: 21 | True | live]
; [else-branch: 21 | False | live]
(push) ; 9
; [then-branch: 21 | True]
(push) ; 10
; [then-branch: 22 | True | live]
; [else-branch: 22 | False | live]
(push) ; 11
; [then-branch: 22 | True]
(pop) ; 11
(push) ; 11
; [else-branch: 22 | False]
(assert false)
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(pop) ; 9
(push) ; 9
; [else-branch: 21 | False]
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
; 0.00s
; (get-info :all-statistics)
; [then-branch: 23 | True | live]
; [else-branch: 23 | False | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 23 | True]
; [exec]
; exhale acc(Array$64$usize(_20.val_ref), read$())
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
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))))
  val_ref@109@01)))
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
    (+
      (-
        (+ (read$ $Snap.unit) (read$ $Snap.unit))
        ($Perm.min (+ (read$ $Snap.unit) (read$ $Snap.unit)) (read$ $Snap.unit)))
      (read$ $Snap.unit))
    ($Perm.min
      (+
        (-
          (+ (read$ $Snap.unit) (read$ $Snap.unit))
          ($Perm.min
            (+ (read$ $Snap.unit) (read$ $Snap.unit))
            (read$ $Snap.unit)))
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
          (-
            (+ (read$ $Snap.unit) (read$ $Snap.unit))
            ($Perm.min
              (+ (read$ $Snap.unit) (read$ $Snap.unit))
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
            (+ (read$ $Snap.unit) (read$ $Snap.unit))
            ($Perm.min
              (+ (read$ $Snap.unit) (read$ $Snap.unit))
              (read$ $Snap.unit)))
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
; [exec]
; __t8 := true
; [exec]
; _14 := builtin$havoc_ref()
(declare-const ret@122@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_14.val_bool, write)
(declare-const $t@123@01 Bool)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@71@01 ret@122@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@89@01 ret@122@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@122@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _14.val_bool := _15 == _18
; [eval] _15 == _18
(declare-const val_bool@124@01 Bool)
(assert (= val_bool@124@01 (= _15@106@01 _18@121@01)))
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@89@01 ret@122@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= ret@71@01 ret@122@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [exec]
; _4 := _14
; [exec]
; label l21
; [exec]
; label l5
; [exec]
; __t10 := true
; [exec]
; __t22 := _4.val_bool
; [eval] !__t22
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not val_bool@124@01))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [then-branch: 24 | !(val_bool@124@01) | dead]
; [else-branch: 24 | val_bool@124@01 | live]
(set-option :timeout 0)
(push) ; 9
; [else-branch: 24 | val_bool@124@01]
(assert val_bool@124@01)
(pop) ; 9
; [eval] !!__t22
; [eval] !__t22
(push) ; 9
(set-option :timeout 10)
(assert (not (not val_bool@124@01)))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not val_bool@124@01))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [then-branch: 25 | val_bool@124@01 | live]
; [else-branch: 25 | !(val_bool@124@01) | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 25 | val_bool@124@01]
(assert val_bool@124@01)
; [exec]
; label bb14
; [exec]
; __t11 := true
; [exec]
; _22 := builtin$havoc_int()
(declare-const ret@125@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; unfold acc(usize(_1.val_ref.f$current), read$())
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [eval] read$()
(set-option :timeout 0)
(push) ; 10
(pop) ; 10
; Joined path conditions
(push) ; 10
(assert (not (< $Perm.No (read$ $Snap.unit))))
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
(assert (=
  ($Snap.first ($Snap.second ($Snap.second $t@55@01)))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@55@01))))
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@55@01)))))))
(assert (=>
  (< $Perm.No (read$ $Snap.unit))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01)))
      $Ref.null))))
(assert (=
  ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@55@01))))
  $Snap.unit))
; [eval] 0 <= self.val_int
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (<=
  0
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@55@01)))))))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (usize%trigger ($Snap.first ($Snap.second ($Snap.second $t@55@01))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01)))))
; [exec]
; _22 := _1.val_ref.f$current.val_int
(set-option :timeout 0)
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
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(declare-const _22@126@01 Int)
(assert (=
  _22@126@01
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@55@01)))))))
; [exec]
; label l24
; [exec]
; _21 := builtin$havoc_ref()
(declare-const ret@127@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_21.val_bool, write)
(declare-const $t@128@01 Bool)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@122@01 ret@127@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@89@01 ret@127@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@71@01 ret@127@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@127@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _21.val_bool := _22 < 64
; [eval] _22 < 64
(declare-const val_bool@129@01 Bool)
(assert (= val_bool@129@01 (< _22@126@01 64)))
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@71@01 ret@127@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@89@01 ret@127@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (= ret@122@01 ret@127@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [exec]
; _3 := _21
; [exec]
; label l25
; [exec]
; label bb17
; [exec]
; __t13 := true
; [exec]
; __t23 := _3.val_bool
; [eval] !__t23
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not val_bool@129@01))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (not val_bool@129@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [then-branch: 26 | !(val_bool@129@01) | live]
; [else-branch: 26 | val_bool@129@01 | live]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 26 | !(val_bool@129@01)]
(assert (not val_bool@129@01))
; [exec]
; label bb15
; [exec]
; __t15 := true
; [exec]
; _2 := builtin$havoc_ref()
(declare-const ret@130@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_2.val_bool, write)
(declare-const $t@131@01 Bool)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@122@01 ret@130@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@89@01 ret@130@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@71@01 ret@130@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@127@01 ret@130@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@130@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _2.val_bool := false
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@127@01 ret@130@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@71@01 ret@130@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@89@01 ret@130@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@122@01 ret@130@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [exec]
; unfold acc(usize(_1.val_ref.f$depth), read$())
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [eval] read$()
(set-option :timeout 0)
(push) ; 11
(pop) ; 11
; Joined path conditions
(push) ; 11
(assert (not (< $Perm.No (read$ $Snap.unit))))
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
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))))
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01)))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(assert (=>
  (< $Perm.No (read$ $Snap.unit))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))
      $Ref.null))))
(assert (=
  ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))
  $Snap.unit))
; [eval] 0 <= self.val_int
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(assert (<=
  0
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (usize%trigger ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))
; [exec]
; label l11
; [exec]
; __t16 := true
; [exec]
; __t24 := _2.val_bool
; [eval] !__t24
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [then-branch: 27 | True | live]
; [else-branch: 27 | False | dead]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 27 | True]
; [exec]
; label bb11
; [exec]
; __t18 := true
; [exec]
; _0 := builtin$havoc_ref()
(declare-const ret@132@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_0.val_bool, write)
(declare-const $t@133@01 Bool)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@130@01 ret@132@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@127@01 ret@132@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@71@01 ret@132@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@89@01 ret@132@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@122@01 ret@132@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@132@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _0.val_bool := false
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@122@01 ret@132@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@89@01 ret@132@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@71@01 ret@132@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@127@01 ret@132@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@130@01 ret@132@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [exec]
; label l16
; [exec]
; __t19 := true
; [exec]
; label l36
; [exec]
; fold acc(usize(_1.val_ref.f$current), read$())
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [eval] read$()
(set-option :timeout 0)
(push) ; 12
(pop) ; 12
; Joined path conditions
(push) ; 12
(assert (not (< $Perm.No (read$ $Snap.unit))))
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
; [eval] 0 <= self.val_int
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(assert (usize%trigger ($Snap.combine
  ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@55@01))))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01)))))
; [exec]
; fold acc(usize(_1.val_ref.f$depth), read$())
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [eval] read$()
(set-option :timeout 0)
(push) ; 12
(pop) ; 12
; Joined path conditions
(push) ; 12
(assert (not (< $Perm.No (read$ $Snap.unit))))
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
; [eval] 0 <= self.val_int
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(assert (usize%trigger ($Snap.combine
  ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01)))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [exec]
; fold acc(struct$m_Path(_1.val_ref), read$())
; [eval] read$()
(set-option :timeout 0)
(push) ; 12
(pop) ; 12
; Joined path conditions
(push) ; 12
(assert (not (< $Perm.No (read$ $Snap.unit))))
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
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
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
        (-
          (+ (read$ $Snap.unit) (read$ $Snap.unit))
          ($Perm.min
            (+ (read$ $Snap.unit) (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (-
            (+ (read$ $Snap.unit) (read$ $Snap.unit))
            ($Perm.min
              (+ (read$ $Snap.unit) (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    ($Perm.min
      (-
        (+
          (-
            (+ (read$ $Snap.unit) (read$ $Snap.unit))
            ($Perm.min
              (+ (read$ $Snap.unit) (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              (+ (read$ $Snap.unit) (read$ $Snap.unit))
              ($Perm.min
                (+ (read$ $Snap.unit) (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      (read$ $Snap.unit)))
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
      (read$ $Snap.unit)
      ($Perm.min
        (-
          (+
            (-
              (+ (read$ $Snap.unit) (read$ $Snap.unit))
              ($Perm.min
                (+ (read$ $Snap.unit) (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (-
                (+ (read$ $Snap.unit) (read$ $Snap.unit))
                ($Perm.min
                  (+ (read$ $Snap.unit) (read$ $Snap.unit))
                  (read$ $Snap.unit)))
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
            (-
              (+ (read$ $Snap.unit) (read$ $Snap.unit))
              ($Perm.min
                (+ (read$ $Snap.unit) (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (-
                (+ (read$ $Snap.unit) (read$ $Snap.unit))
                ($Perm.min
                  (+ (read$ $Snap.unit) (read$ $Snap.unit))
                  (read$ $Snap.unit)))
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
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
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
        (-
          (+ (read$ $Snap.unit) (read$ $Snap.unit))
          ($Perm.min
            (+ (read$ $Snap.unit) (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (-
            (+ (read$ $Snap.unit) (read$ $Snap.unit))
            ($Perm.min
              (+ (read$ $Snap.unit) (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    ($Perm.min
      (-
        (+
          (-
            (+ (read$ $Snap.unit) (read$ $Snap.unit))
            ($Perm.min
              (+ (read$ $Snap.unit) (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              (+ (read$ $Snap.unit) (read$ $Snap.unit))
              ($Perm.min
                (+ (read$ $Snap.unit) (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      (read$ $Snap.unit)))
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
      (read$ $Snap.unit)
      ($Perm.min
        (-
          (+
            (-
              (+ (read$ $Snap.unit) (read$ $Snap.unit))
              ($Perm.min
                (+ (read$ $Snap.unit) (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (-
                (+ (read$ $Snap.unit) (read$ $Snap.unit))
                ($Perm.min
                  (+ (read$ $Snap.unit) (read$ $Snap.unit))
                  (read$ $Snap.unit)))
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
            (-
              (+ (read$ $Snap.unit) (read$ $Snap.unit))
              ($Perm.min
                (+ (read$ $Snap.unit) (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (-
                (+ (read$ $Snap.unit) (read$ $Snap.unit))
                ($Perm.min
                  (+ (read$ $Snap.unit) (read$ $Snap.unit))
                  (read$ $Snap.unit)))
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
(assert (struct$m_Path%trigger ($Snap.combine
  ($Snap.first ($Snap.second $t@55@01))
  ($Snap.combine
    ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@55@01))))
      $Snap.unit)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01))))
      ($Snap.combine
        ($Snap.combine
          ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))
          $Snap.unit)
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))
          ($Snap.combine
            $t@96@01
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))
              $t@111@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))
; [exec]
; _old$pre$0 := _1.val_ref
(declare-const _old$pre$0@134@01 $Ref)
(assert (= _old$pre$0@134@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))
; [exec]
; fold acc(bool(_0), write)
(assert (bool%trigger ($SortWrappers.BoolTo$Snap false) ret@132@01))
; [exec]
; exhale acc(struct$m_Path(_old$pre$0), read$())
; [eval] read$()
(set-option :timeout 0)
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
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) _old$pre$0@134@01)))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(bool(_0), write)
; [exec]
; label end_of_method
(pop) ; 11
; [eval] !!__t24
; [eval] !__t24
; [then-branch: 28 | False | dead]
; [else-branch: 28 | True | live]
(set-option :timeout 0)
(push) ; 11
; [else-branch: 28 | True]
(pop) ; 11
(pop) ; 10
(push) ; 10
; [else-branch: 26 | val_bool@129@01]
(assert val_bool@129@01)
(pop) ; 10
; [eval] !!__t23
; [eval] !__t23
(push) ; 10
(set-option :timeout 10)
(assert (not (not val_bool@129@01)))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not val_bool@129@01))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [then-branch: 29 | val_bool@129@01 | live]
; [else-branch: 29 | !(val_bool@129@01) | live]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 29 | val_bool@129@01]
(assert val_bool@129@01)
; [exec]
; label bb13
; [exec]
; __t14 := true
; [exec]
; _24 := builtin$havoc_int()
(declare-const ret@135@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; unfold acc(usize(_1.val_ref.f$depth), read$())
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [eval] read$()
(set-option :timeout 0)
(push) ; 11
(pop) ; 11
; Joined path conditions
(push) ; 11
(assert (not (< $Perm.No (read$ $Snap.unit))))
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
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))))
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01)))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(assert (=>
  (< $Perm.No (read$ $Snap.unit))
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))
      $Ref.null))))
(assert (=
  ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))
  $Snap.unit))
; [eval] 0 <= self.val_int
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(assert (<=
  0
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (usize%trigger ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))
; [exec]
; _24 := _1.val_ref.f$depth.val_int
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(declare-const _24@136@01 Int)
(assert (=
  _24@136@01
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))))
; [exec]
; label l28
; [exec]
; _23 := builtin$havoc_ref()
(declare-const ret@137@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_23.val_bool, write)
(declare-const $t@138@01 Bool)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@127@01 ret@137@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@71@01 ret@137@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@89@01 ret@137@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@122@01 ret@137@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@137@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _23.val_bool := _24 < 64
; [eval] _24 < 64
(declare-const val_bool@139@01 Bool)
(assert (= val_bool@139@01 (< _24@136@01 64)))
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@122@01 ret@137@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@89@01 ret@137@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@71@01 ret@137@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (= ret@127@01 ret@137@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [exec]
; _2 := _23
; [exec]
; label l29
; [exec]
; label l11
; [exec]
; __t16 := true
; [exec]
; __t24 := _2.val_bool
; [eval] !__t24
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not val_bool@139@01))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not val_bool@139@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [then-branch: 30 | !(val_bool@139@01) | live]
; [else-branch: 30 | val_bool@139@01 | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 30 | !(val_bool@139@01)]
(assert (not val_bool@139@01))
; [exec]
; label bb11
; [exec]
; __t18 := true
; [exec]
; _0 := builtin$havoc_ref()
(declare-const ret@140@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_0.val_bool, write)
(declare-const $t@141@01 Bool)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@127@01 ret@140@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@71@01 ret@140@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@89@01 ret@140@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@122@01 ret@140@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@137@01 ret@140@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@140@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _0.val_bool := false
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@137@01 ret@140@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@122@01 ret@140@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@89@01 ret@140@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@71@01 ret@140@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@127@01 ret@140@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [exec]
; label l16
; [exec]
; __t19 := true
; [exec]
; label l36
; [exec]
; fold acc(usize(_1.val_ref.f$current), read$())
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [eval] read$()
(set-option :timeout 0)
(push) ; 12
(pop) ; 12
; Joined path conditions
(push) ; 12
(assert (not (< $Perm.No (read$ $Snap.unit))))
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
; [eval] 0 <= self.val_int
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(assert (usize%trigger ($Snap.combine
  ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@55@01))))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01)))))
; [exec]
; fold acc(usize(_1.val_ref.f$depth), read$())
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [eval] read$()
(set-option :timeout 0)
(push) ; 12
(pop) ; 12
; Joined path conditions
(push) ; 12
(assert (not (< $Perm.No (read$ $Snap.unit))))
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
; [eval] 0 <= self.val_int
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(assert (usize%trigger ($Snap.combine
  ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01)))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [exec]
; fold acc(struct$m_Path(_1.val_ref), read$())
; [eval] read$()
(set-option :timeout 0)
(push) ; 12
(pop) ; 12
; Joined path conditions
(push) ; 12
(assert (not (< $Perm.No (read$ $Snap.unit))))
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
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
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
        (-
          (+ (read$ $Snap.unit) (read$ $Snap.unit))
          ($Perm.min
            (+ (read$ $Snap.unit) (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (-
            (+ (read$ $Snap.unit) (read$ $Snap.unit))
            ($Perm.min
              (+ (read$ $Snap.unit) (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    ($Perm.min
      (-
        (+
          (-
            (+ (read$ $Snap.unit) (read$ $Snap.unit))
            ($Perm.min
              (+ (read$ $Snap.unit) (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              (+ (read$ $Snap.unit) (read$ $Snap.unit))
              ($Perm.min
                (+ (read$ $Snap.unit) (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      (read$ $Snap.unit)))
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
      (read$ $Snap.unit)
      ($Perm.min
        (-
          (+
            (-
              (+ (read$ $Snap.unit) (read$ $Snap.unit))
              ($Perm.min
                (+ (read$ $Snap.unit) (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (-
                (+ (read$ $Snap.unit) (read$ $Snap.unit))
                ($Perm.min
                  (+ (read$ $Snap.unit) (read$ $Snap.unit))
                  (read$ $Snap.unit)))
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
            (-
              (+ (read$ $Snap.unit) (read$ $Snap.unit))
              ($Perm.min
                (+ (read$ $Snap.unit) (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (-
                (+ (read$ $Snap.unit) (read$ $Snap.unit))
                ($Perm.min
                  (+ (read$ $Snap.unit) (read$ $Snap.unit))
                  (read$ $Snap.unit)))
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
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
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
        (-
          (+ (read$ $Snap.unit) (read$ $Snap.unit))
          ($Perm.min
            (+ (read$ $Snap.unit) (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (-
            (+ (read$ $Snap.unit) (read$ $Snap.unit))
            ($Perm.min
              (+ (read$ $Snap.unit) (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    ($Perm.min
      (-
        (+
          (-
            (+ (read$ $Snap.unit) (read$ $Snap.unit))
            ($Perm.min
              (+ (read$ $Snap.unit) (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              (+ (read$ $Snap.unit) (read$ $Snap.unit))
              ($Perm.min
                (+ (read$ $Snap.unit) (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      (read$ $Snap.unit)))
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
      (read$ $Snap.unit)
      ($Perm.min
        (-
          (+
            (-
              (+ (read$ $Snap.unit) (read$ $Snap.unit))
              ($Perm.min
                (+ (read$ $Snap.unit) (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (-
                (+ (read$ $Snap.unit) (read$ $Snap.unit))
                ($Perm.min
                  (+ (read$ $Snap.unit) (read$ $Snap.unit))
                  (read$ $Snap.unit)))
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
            (-
              (+ (read$ $Snap.unit) (read$ $Snap.unit))
              ($Perm.min
                (+ (read$ $Snap.unit) (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (-
                (+ (read$ $Snap.unit) (read$ $Snap.unit))
                ($Perm.min
                  (+ (read$ $Snap.unit) (read$ $Snap.unit))
                  (read$ $Snap.unit)))
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
(assert (struct$m_Path%trigger ($Snap.combine
  ($Snap.first ($Snap.second $t@55@01))
  ($Snap.combine
    ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@55@01))))
      $Snap.unit)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01))))
      ($Snap.combine
        ($Snap.combine
          ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))
          $Snap.unit)
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))
          ($Snap.combine
            $t@96@01
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))
              $t@111@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))
; [exec]
; _old$pre$0 := _1.val_ref
(declare-const _old$pre$0@142@01 $Ref)
(assert (= _old$pre$0@142@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))
; [exec]
; fold acc(bool(_0), write)
(assert (bool%trigger ($SortWrappers.BoolTo$Snap false) ret@140@01))
; [exec]
; exhale acc(struct$m_Path(_old$pre$0), read$())
; [eval] read$()
(set-option :timeout 0)
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
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) _old$pre$0@142@01)))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(bool(_0), write)
; [exec]
; label end_of_method
(pop) ; 11
(set-option :timeout 0)
(push) ; 11
; [else-branch: 30 | val_bool@139@01]
(assert val_bool@139@01)
(pop) ; 11
; [eval] !!__t24
; [eval] !__t24
(push) ; 11
(set-option :timeout 10)
(assert (not (not val_bool@139@01)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not val_bool@139@01))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [then-branch: 31 | val_bool@139@01 | live]
; [else-branch: 31 | !(val_bool@139@01) | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 31 | val_bool@139@01]
(assert val_bool@139@01)
; [exec]
; label l12
; [exec]
; __t17 := true
; [exec]
; _26 := builtin$havoc_int()
(declare-const ret@143@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _26 := _1.val_ref.f$current.val_int
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(declare-const _26@144@01 Int)
(assert (=
  _26@144@01
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@55@01)))))))
; [exec]
; label l32
; [exec]
; _27 := builtin$havoc_int()
(declare-const ret@145@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; _27 := _1.val_ref.f$depth.val_int
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(declare-const _27@146@01 Int)
(assert (=
  _27@146@01
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))))
; [exec]
; label l33
; [exec]
; _25 := builtin$havoc_ref()
(declare-const ret@147@01 $Ref)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; inhale acc(_25.val_bool, write)
(declare-const $t@148@01 Bool)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@127@01 ret@147@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@71@01 ret@147@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@89@01 ret@147@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@122@01 ret@147@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@137@01 ret@147@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(assert (not (= ret@147@01 $Ref.null)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; _25.val_bool := _26 <= _27
; [eval] _26 <= _27
(declare-const val_bool@149@01 Bool)
(assert (= val_bool@149@01 (<= _26@144@01 _27@146@01)))
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@137@01 ret@147@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@122@01 ret@147@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@89@01 ret@147@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@71@01 ret@147@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= ret@127@01 ret@147@01)))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [exec]
; _0 := _25
; [exec]
; label l34
; [exec]
; label l16
; [exec]
; __t19 := true
; [exec]
; label l36
; [exec]
; fold acc(usize(_1.val_ref.f$current), read$())
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [eval] read$()
(set-option :timeout 0)
(push) ; 12
(pop) ; 12
; Joined path conditions
(push) ; 12
(assert (not (< $Perm.No (read$ $Snap.unit))))
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
; [eval] 0 <= self.val_int
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(assert (usize%trigger ($Snap.combine
  ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@55@01))))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01)))))
; [exec]
; fold acc(usize(_1.val_ref.f$depth), read$())
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [eval] read$()
(set-option :timeout 0)
(push) ; 12
(pop) ; 12
; Joined path conditions
(push) ; 12
(assert (not (< $Perm.No (read$ $Snap.unit))))
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
; [eval] 0 <= self.val_int
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(assert (usize%trigger ($Snap.combine
  ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))
  $Snap.unit) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01)))))))
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@55@01)))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [exec]
; fold acc(struct$m_Path(_1.val_ref), read$())
; [eval] read$()
(set-option :timeout 0)
(push) ; 12
(pop) ; 12
; Joined path conditions
(push) ; 12
(assert (not (< $Perm.No (read$ $Snap.unit))))
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
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
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
        (-
          (+ (read$ $Snap.unit) (read$ $Snap.unit))
          ($Perm.min
            (+ (read$ $Snap.unit) (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (-
            (+ (read$ $Snap.unit) (read$ $Snap.unit))
            ($Perm.min
              (+ (read$ $Snap.unit) (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    ($Perm.min
      (-
        (+
          (-
            (+ (read$ $Snap.unit) (read$ $Snap.unit))
            ($Perm.min
              (+ (read$ $Snap.unit) (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              (+ (read$ $Snap.unit) (read$ $Snap.unit))
              ($Perm.min
                (+ (read$ $Snap.unit) (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      (read$ $Snap.unit)))
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
      (read$ $Snap.unit)
      ($Perm.min
        (-
          (+
            (-
              (+ (read$ $Snap.unit) (read$ $Snap.unit))
              ($Perm.min
                (+ (read$ $Snap.unit) (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (-
                (+ (read$ $Snap.unit) (read$ $Snap.unit))
                ($Perm.min
                  (+ (read$ $Snap.unit) (read$ $Snap.unit))
                  (read$ $Snap.unit)))
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
            (-
              (+ (read$ $Snap.unit) (read$ $Snap.unit))
              ($Perm.min
                (+ (read$ $Snap.unit) (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (-
                (+ (read$ $Snap.unit) (read$ $Snap.unit))
                ($Perm.min
                  (+ (read$ $Snap.unit) (read$ $Snap.unit))
                  (read$ $Snap.unit)))
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
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
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
        (-
          (+ (read$ $Snap.unit) (read$ $Snap.unit))
          ($Perm.min
            (+ (read$ $Snap.unit) (read$ $Snap.unit))
            (read$ $Snap.unit)))
        (read$ $Snap.unit))
      ($Perm.min
        (+
          (-
            (+ (read$ $Snap.unit) (read$ $Snap.unit))
            ($Perm.min
              (+ (read$ $Snap.unit) (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        (read$ $Snap.unit)))
    ($Perm.min
      (-
        (+
          (-
            (+ (read$ $Snap.unit) (read$ $Snap.unit))
            ($Perm.min
              (+ (read$ $Snap.unit) (read$ $Snap.unit))
              (read$ $Snap.unit)))
          (read$ $Snap.unit))
        ($Perm.min
          (+
            (-
              (+ (read$ $Snap.unit) (read$ $Snap.unit))
              ($Perm.min
                (+ (read$ $Snap.unit) (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          (read$ $Snap.unit)))
      (read$ $Snap.unit)))
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
      (read$ $Snap.unit)
      ($Perm.min
        (-
          (+
            (-
              (+ (read$ $Snap.unit) (read$ $Snap.unit))
              ($Perm.min
                (+ (read$ $Snap.unit) (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (-
                (+ (read$ $Snap.unit) (read$ $Snap.unit))
                ($Perm.min
                  (+ (read$ $Snap.unit) (read$ $Snap.unit))
                  (read$ $Snap.unit)))
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
            (-
              (+ (read$ $Snap.unit) (read$ $Snap.unit))
              ($Perm.min
                (+ (read$ $Snap.unit) (read$ $Snap.unit))
                (read$ $Snap.unit)))
            (read$ $Snap.unit))
          ($Perm.min
            (+
              (-
                (+ (read$ $Snap.unit) (read$ $Snap.unit))
                ($Perm.min
                  (+ (read$ $Snap.unit) (read$ $Snap.unit))
                  (read$ $Snap.unit)))
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
(assert (struct$m_Path%trigger ($Snap.combine
  ($Snap.first ($Snap.second $t@55@01))
  ($Snap.combine
    ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@55@01))))
      $Snap.unit)
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@55@01))))
      ($Snap.combine
        ($Snap.combine
          ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))
          $Snap.unit)
        ($Snap.combine
          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))
          ($Snap.combine
            $t@96@01
            ($Snap.combine
              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@55@01))))))))
              $t@111@01))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))
; [exec]
; _old$pre$0 := _1.val_ref
(declare-const _old$pre$0@150@01 $Ref)
(assert (= _old$pre$0@150@01 ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01))))
; [exec]
; fold acc(bool(_0), write)
(assert (bool%trigger ($SortWrappers.BoolTo$Snap val_bool@149@01) ret@147@01))
; [exec]
; exhale acc(struct$m_Path(_old$pre$0), read$())
; [eval] read$()
(set-option :timeout 0)
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
(assert (not (= ($SortWrappers.$SnapTo$Ref ($Snap.first $t@55@01)) _old$pre$0@150@01)))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (< $Perm.No (read$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [exec]
; exhale acc(bool(_0), write)
; [exec]
; label end_of_method
(pop) ; 11
(set-option :timeout 0)
(push) ; 11
; [else-branch: 31 | !(val_bool@139@01)]
(assert (not val_bool@139@01))
(pop) ; 11
(pop) ; 10
(push) ; 10
; [else-branch: 29 | !(val_bool@129@01)]
(assert (not val_bool@129@01))
(pop) ; 10
(pop) ; 9
(pop) ; 8
; [eval] !(__t7 && (__t7 && __t7))
; [eval] __t7 && (__t7 && __t7)
(push) ; 8
; [then-branch: 32 | True | live]
; [else-branch: 32 | False | live]
(push) ; 9
; [then-branch: 32 | True]
(push) ; 10
; [then-branch: 33 | True | live]
; [else-branch: 33 | False | live]
(push) ; 11
; [then-branch: 33 | True]
(pop) ; 11
(push) ; 11
; [else-branch: 33 | False]
(assert false)
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(pop) ; 9
(push) ; 9
; [else-branch: 32 | False]
(assert false)
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
; [then-branch: 34 | False | dead]
; [else-branch: 34 | True | live]
(push) ; 8
; [else-branch: 34 | True]
(pop) ; 8
(pop) ; 7
; [eval] !(__t6 && (__t6 && __t6))
; [eval] __t6 && (__t6 && __t6)
(push) ; 7
; [then-branch: 35 | True | live]
; [else-branch: 35 | False | live]
(push) ; 8
; [then-branch: 35 | True]
(push) ; 9
; [then-branch: 36 | True | live]
; [else-branch: 36 | False | live]
(push) ; 10
; [then-branch: 36 | True]
(pop) ; 10
(push) ; 10
; [else-branch: 36 | False]
(assert false)
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(pop) ; 8
(push) ; 8
; [else-branch: 35 | False]
(assert false)
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
; [then-branch: 37 | False | dead]
; [else-branch: 37 | True | live]
(push) ; 7
; [else-branch: 37 | True]
(pop) ; 7
(pop) ; 6
(pop) ; 5
; [eval] !(__t2 && (__t2 && __t2))
; [eval] __t2 && (__t2 && __t2)
(push) ; 5
; [then-branch: 38 | True | live]
; [else-branch: 38 | False | live]
(push) ; 6
; [then-branch: 38 | True]
(push) ; 7
; [then-branch: 39 | True | live]
; [else-branch: 39 | False | live]
(push) ; 8
; [then-branch: 39 | True]
(pop) ; 8
(push) ; 8
; [else-branch: 39 | False]
(assert false)
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(pop) ; 6
(push) ; 6
; [else-branch: 38 | False]
(assert false)
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
; [then-branch: 40 | False | dead]
; [else-branch: 40 | True | live]
(push) ; 5
; [else-branch: 40 | True]
(pop) ; 5
(pop) ; 4
(pop) ; 3
; [eval] !(__t0 && (__t0 && __t0))
; [eval] __t0 && (__t0 && __t0)
(push) ; 3
; [then-branch: 41 | True | live]
; [else-branch: 41 | False | live]
(push) ; 4
; [then-branch: 41 | True]
(push) ; 5
; [then-branch: 42 | True | live]
; [else-branch: 42 | False | live]
(push) ; 6
; [then-branch: 42 | True]
(pop) ; 6
(push) ; 6
; [else-branch: 42 | False]
(assert false)
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(pop) ; 4
(push) ; 4
; [else-branch: 41 | False]
(assert false)
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
; [then-branch: 43 | False | dead]
; [else-branch: 43 | True | live]
(push) ; 3
; [else-branch: 43 | True]
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- builtin$havoc_bool ----------
(declare-const ret@151@01 Bool)
(declare-const ret@152@01 Bool)
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
(declare-const ret@153@01 Int)
(declare-const ret@154@01 Int)
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
(declare-const ret@155@01 $Ref)
(declare-const ret@156@01 $Ref)
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
