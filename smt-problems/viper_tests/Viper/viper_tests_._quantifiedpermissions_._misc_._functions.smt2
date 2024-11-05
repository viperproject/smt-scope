(get-info :version)
; (:version "4.12.1")
; Started: 2023-10-31 14:14:13
; Silicon.version: 1.1-SNAPSHOT (46944a65@dspil_symbenchmarking)
; Input file: /home/pcorrect/repos/benchmarking_general/silicon_tests/viper_tests_._quantifiedpermissions_._misc_._functions.vpr
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
(declare-sort Seq<$Ref> 0)
(declare-sort Set<Int> 0)
(declare-sort Set<Seq<$Ref>> 0)
(declare-sort Set<$Ref> 0)
(declare-sort Set<$Snap> 0)
(declare-sort $FVF<f> 0)
(declare-sort $FVF<ss> 0)
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
(declare-fun $SortWrappers.Seq<$Ref>To$Snap (Seq<$Ref>) $Snap)
(declare-fun $SortWrappers.$SnapToSeq<$Ref> ($Snap) Seq<$Ref>)
(assert (forall ((x Seq<$Ref>)) (!
    (= x ($SortWrappers.$SnapToSeq<$Ref>($SortWrappers.Seq<$Ref>To$Snap x)))
    :pattern (($SortWrappers.Seq<$Ref>To$Snap x))
    :qid |$Snap.$SnapToSeq<$Ref>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Seq<$Ref>To$Snap($SortWrappers.$SnapToSeq<$Ref> x)))
    :pattern (($SortWrappers.$SnapToSeq<$Ref> x))
    :qid |$Snap.Seq<$Ref>To$SnapToSeq<$Ref>|
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
(declare-fun $SortWrappers.Set<Seq<$Ref>>To$Snap (Set<Seq<$Ref>>) $Snap)
(declare-fun $SortWrappers.$SnapToSet<Seq<$Ref>> ($Snap) Set<Seq<$Ref>>)
(assert (forall ((x Set<Seq<$Ref>>)) (!
    (= x ($SortWrappers.$SnapToSet<Seq<$Ref>>($SortWrappers.Set<Seq<$Ref>>To$Snap x)))
    :pattern (($SortWrappers.Set<Seq<$Ref>>To$Snap x))
    :qid |$Snap.$SnapToSet<Seq<$Ref>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Set<Seq<$Ref>>To$Snap($SortWrappers.$SnapToSet<Seq<$Ref>> x)))
    :pattern (($SortWrappers.$SnapToSet<Seq<$Ref>> x))
    :qid |$Snap.Set<Seq<$Ref>>To$SnapToSet<Seq<$Ref>>|
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
(declare-fun $SortWrappers.$FVF<f>To$Snap ($FVF<f>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<f> ($Snap) $FVF<f>)
(assert (forall ((x $FVF<f>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<f>($SortWrappers.$FVF<f>To$Snap x)))
    :pattern (($SortWrappers.$FVF<f>To$Snap x))
    :qid |$Snap.$SnapTo$FVF<f>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$FVF<f>To$Snap($SortWrappers.$SnapTo$FVF<f> x)))
    :pattern (($SortWrappers.$SnapTo$FVF<f> x))
    :qid |$Snap.$FVF<f>To$SnapTo$FVF<f>|
    )))
(declare-fun $SortWrappers.$FVF<ss>To$Snap ($FVF<ss>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<ss> ($Snap) $FVF<ss>)
(assert (forall ((x $FVF<ss>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<ss>($SortWrappers.$FVF<ss>To$Snap x)))
    :pattern (($SortWrappers.$FVF<ss>To$Snap x))
    :qid |$Snap.$SnapTo$FVF<ss>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$FVF<ss>To$Snap($SortWrappers.$SnapTo$FVF<ss> x)))
    :pattern (($SortWrappers.$SnapTo$FVF<ss> x))
    :qid |$Snap.$FVF<ss>To$SnapTo$FVF<ss>|
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
(declare-fun Set_in (Seq<$Ref> Set<Seq<$Ref>>) Bool)
(declare-fun Set_card (Set<Seq<$Ref>>) Int)
(declare-const Set_empty Set<Seq<$Ref>>)
(declare-fun Set_singleton (Seq<$Ref>) Set<Seq<$Ref>>)
(declare-fun Set_unionone (Set<Seq<$Ref>> Seq<$Ref>) Set<Seq<$Ref>>)
(declare-fun Set_union (Set<Seq<$Ref>> Set<Seq<$Ref>>) Set<Seq<$Ref>>)
(declare-fun Set_disjoint (Set<Seq<$Ref>> Set<Seq<$Ref>>) Bool)
(declare-fun Set_difference (Set<Seq<$Ref>> Set<Seq<$Ref>>) Set<Seq<$Ref>>)
(declare-fun Set_intersection (Set<Seq<$Ref>> Set<Seq<$Ref>>) Set<Seq<$Ref>>)
(declare-fun Set_subset (Set<Seq<$Ref>> Set<Seq<$Ref>>) Bool)
(declare-fun Set_equal (Set<Seq<$Ref>> Set<Seq<$Ref>>) Bool)
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
(declare-fun Seq_length (Seq<$Ref>) Int)
(declare-const Seq_empty Seq<$Ref>)
(declare-fun Seq_singleton ($Ref) Seq<$Ref>)
(declare-fun Seq_build (Seq<$Ref> $Ref) Seq<$Ref>)
(declare-fun Seq_index (Seq<$Ref> Int) $Ref)
(declare-fun Seq_append (Seq<$Ref> Seq<$Ref>) Seq<$Ref>)
(declare-fun Seq_update (Seq<$Ref> Int $Ref) Seq<$Ref>)
(declare-fun Seq_contains (Seq<$Ref> $Ref) Bool)
(declare-fun Seq_take (Seq<$Ref> Int) Seq<$Ref>)
(declare-fun Seq_drop (Seq<$Ref> Int) Seq<$Ref>)
(declare-fun Seq_equal (Seq<$Ref> Seq<$Ref>) Bool)
(declare-fun Seq_sameuntil (Seq<$Ref> Seq<$Ref> Int) Bool)
; /field_value_functions_declarations.smt2 [f: Int]
(declare-fun $FVF.domain_f ($FVF<f>) Set<$Ref>)
(declare-fun $FVF.lookup_f ($FVF<f> $Ref) Int)
(declare-fun $FVF.after_f ($FVF<f> $FVF<f>) Bool)
(declare-fun $FVF.loc_f (Int $Ref) Bool)
(declare-fun $FVF.perm_f ($FPM $Ref) $Perm)
(declare-const $fvfTOP_f $FVF<f>)
; /field_value_functions_declarations.smt2 [ss: Seq[Ref]]
(declare-fun $FVF.domain_ss ($FVF<ss>) Set<$Ref>)
(declare-fun $FVF.lookup_ss ($FVF<ss> $Ref) Seq<$Ref>)
(declare-fun $FVF.after_ss ($FVF<ss> $FVF<ss>) Bool)
(declare-fun $FVF.loc_ss (Seq<$Ref> $Ref) Bool)
(declare-fun $FVF.perm_ss ($FPM $Ref) $Perm)
(declare-const $fvfTOP_ss $FVF<ss>)
; Declaring symbols related to program functions (from program analysis)
(declare-fun fun07 ($Snap Seq<$Ref> Int) Int)
(declare-fun fun07%limited ($Snap Seq<$Ref> Int) Int)
(declare-fun fun07%stateless (Seq<$Ref> Int) Bool)
(declare-fun fun07%precondition ($Snap Seq<$Ref> Int) Bool)
(declare-fun fun08 ($Snap Seq<$Ref> Int) Int)
(declare-fun fun08%limited ($Snap Seq<$Ref> Int) Int)
(declare-fun fun08%stateless (Seq<$Ref> Int) Bool)
(declare-fun fun08%precondition ($Snap Seq<$Ref> Int) Bool)
(declare-fun fun04 ($Snap $Ref Int Int) Int)
(declare-fun fun04%limited ($Snap $Ref Int Int) Int)
(declare-fun fun04%stateless ($Ref Int Int) Bool)
(declare-fun fun04%precondition ($Snap $Ref Int Int) Bool)
(declare-fun fun02 ($Snap Seq<$Ref>) Int)
(declare-fun fun02%limited ($Snap Seq<$Ref>) Int)
(declare-fun fun02%stateless (Seq<$Ref>) Bool)
(declare-fun fun02%precondition ($Snap Seq<$Ref>) Bool)
(declare-fun fun01 ($Snap Seq<$Ref>) Int)
(declare-fun fun01%limited ($Snap Seq<$Ref>) Int)
(declare-fun fun01%stateless (Seq<$Ref>) Bool)
(declare-fun fun01%precondition ($Snap Seq<$Ref>) Bool)
(declare-fun fun06 ($Snap Seq<$Ref> Int Int) Int)
(declare-fun fun06%limited ($Snap Seq<$Ref> Int Int) Int)
(declare-fun fun06%stateless (Seq<$Ref> Int Int) Bool)
(declare-fun fun06%precondition ($Snap Seq<$Ref> Int Int) Bool)
(declare-fun fun03 ($Snap Seq<$Ref> Int) Int)
(declare-fun fun03%limited ($Snap Seq<$Ref> Int) Int)
(declare-fun fun03%stateless (Seq<$Ref> Int) Bool)
(declare-fun fun03%precondition ($Snap Seq<$Ref> Int) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun P02%trigger ($Snap Seq<$Ref> Int) Bool)
(declare-fun P01%trigger ($Snap $Ref Int) Bool)
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
(assert (forall ((s Seq<$Ref>)) (!
  (<= 0 (Seq_length s))
  :pattern ((Seq_length s))
  :qid |$Seq[Ref]_prog.seq_length_non_negative|)))
(assert (= (Seq_length (as Seq_empty  Seq<$Ref>)) 0))
(assert (forall ((s Seq<$Ref>)) (!
  (=> (= (Seq_length s) 0) (= s (as Seq_empty  Seq<$Ref>)))
  :pattern ((Seq_length s))
  :qid |$Seq[Ref]_prog.only_empty_seq_length_zero|)))
(assert (forall ((e $Ref)) (!
  (= (Seq_length (Seq_singleton e)) 1)
  :pattern ((Seq_length (Seq_singleton e)))
  :qid |$Seq[Ref]_prog.length_singleton_seq|)))
(assert (forall ((s Seq<$Ref>) (e $Ref)) (!
  (= (Seq_length (Seq_build s e)) (+ 1 (Seq_length s)))
  :pattern ((Seq_length (Seq_build s e)))
  :qid |$Seq[Ref]_prog.length_seq_build_inc_by_one|)))
(assert (forall ((s Seq<$Ref>) (i Int) (e $Ref)) (!
  (ite
    (= i (Seq_length s))
    (= (Seq_index (Seq_build s e) i) e)
    (= (Seq_index (Seq_build s e) i) (Seq_index s i)))
  :pattern ((Seq_index (Seq_build s e) i))
  :qid |$Seq[Ref]_prog.seq_index_over_build|)))
(assert (forall ((s1 Seq<$Ref>) (s2 Seq<$Ref>)) (!
  (=>
    (and
      (not (= s1 (as Seq_empty  Seq<$Ref>)))
      (not (= s2 (as Seq_empty  Seq<$Ref>))))
    (= (Seq_length (Seq_append s1 s2)) (+ (Seq_length s1) (Seq_length s2))))
  :pattern ((Seq_length (Seq_append s1 s2)))
  :qid |$Seq[Ref]_prog.seq_length_over_append|)))
(assert (forall ((e $Ref)) (!
  (= (Seq_index (Seq_singleton e) 0) e)
  :pattern ((Seq_singleton e))
  :qid |$Seq[Ref]_prog.seq_index_over_singleton|)))
(assert (forall ((e1 $Ref) (e2 $Ref)) (!
  (= (Seq_contains (Seq_singleton e1) e2) (= e1 e2))
  :pattern ((Seq_contains (Seq_singleton e1) e2))
  :qid |$Seq[Ref]_prog.seq_contains_over_singleton|)))
(assert (forall ((s Seq<$Ref>)) (!
  (= (Seq_append (as Seq_empty  Seq<$Ref>) s) s)
  :pattern ((Seq_append (as Seq_empty  Seq<$Ref>) s))
  :qid |$Seq[Ref]_prog.seq_append_empty_left|)))
(assert (forall ((s Seq<$Ref>)) (!
  (= (Seq_append s (as Seq_empty  Seq<$Ref>)) s)
  :pattern ((Seq_append s (as Seq_empty  Seq<$Ref>)))
  :qid |$Seq[Ref]_prog.seq_append_empty_right|)))
(assert (forall ((s1 Seq<$Ref>) (s2 Seq<$Ref>) (i Int)) (!
  (=>
    (and
      (not (= s1 (as Seq_empty  Seq<$Ref>)))
      (not (= s2 (as Seq_empty  Seq<$Ref>))))
    (ite
      (< i (Seq_length s1))
      (= (Seq_index (Seq_append s1 s2) i) (Seq_index s1 i))
      (= (Seq_index (Seq_append s1 s2) i) (Seq_index s2 (- i (Seq_length s1))))))
  :pattern ((Seq_index (Seq_append s1 s2) i))
  :pattern ((Seq_index s1 i) (Seq_append s1 s2))
  :qid |$Seq[Ref]_prog.seq_index_over_append|)))
(assert (forall ((s Seq<$Ref>) (i Int) (e $Ref)) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (= (Seq_length (Seq_update s i e)) (Seq_length s)))
  :pattern ((Seq_length (Seq_update s i e)))
  :qid |$Seq[Ref]_prog.seq_length_invariant_over_update|)))
(assert (forall ((s Seq<$Ref>) (i Int) (e $Ref) (j Int)) (!
  (ite
    (=> (and (<= 0 i) (< i (Seq_length s))) (= i j))
    (= (Seq_index (Seq_update s i e) j) e)
    (= (Seq_index (Seq_update s i e) j) (Seq_index s j)))
  :pattern ((Seq_index (Seq_update s i e) j))
  :qid |$Seq[Ref]_prog.seq_index_over_update|)))
(assert (forall ((s Seq<$Ref>) (e $Ref)) (!
  (=
    (Seq_contains s e)
    (exists ((i Int)) (!
      (and (<= 0 i) (and (< i (Seq_length s)) (= (Seq_index s i) e)))
      :pattern ((Seq_index s i))
      )))
  :pattern ((Seq_contains s e))
  :qid |$Seq[Ref]_prog.seq_element_contains_index_exists|)))
(assert (forall ((e $Ref)) (!
  (not (Seq_contains (as Seq_empty  Seq<$Ref>) e))
  :pattern ((Seq_contains (as Seq_empty  Seq<$Ref>) e))
  :qid |$Seq[Ref]_prog.empty_seq_contains_nothing|)))
(assert (forall ((s1 Seq<$Ref>) (s2 Seq<$Ref>) (e $Ref)) (!
  (=
    (Seq_contains (Seq_append s1 s2) e)
    (or (Seq_contains s1 e) (Seq_contains s2 e)))
  :pattern ((Seq_contains (Seq_append s1 s2) e))
  :qid |$Seq[Ref]_prog.seq_contains_over_append|)))
(assert (forall ((s Seq<$Ref>) (e1 $Ref) (e2 $Ref)) (!
  (= (Seq_contains (Seq_build s e1) e2) (or (= e1 e2) (Seq_contains s e2)))
  :pattern ((Seq_contains (Seq_build s e1) e2))
  :qid |$Seq[Ref]_prog.seq_contains_over_build|)))
(assert (forall ((s Seq<$Ref>) (n Int)) (!
  (=> (<= n 0) (= (Seq_take s n) (as Seq_empty  Seq<$Ref>)))
  :pattern ((Seq_take s n))
  :qid |$Seq[Ref]_prog.seq_take_negative_length|)))
(assert (forall ((s Seq<$Ref>) (n Int) (e $Ref)) (!
  (=
    (Seq_contains (Seq_take s n) e)
    (exists ((i Int)) (!
      (and
        (<= 0 i)
        (and (< i n) (and (< i (Seq_length s)) (= (Seq_index s i) e))))
      :pattern ((Seq_index s i))
      )))
  :pattern ((Seq_contains (Seq_take s n) e))
  :qid |$Seq[Ref]_prog.seq_contains_over_take_index_exists|)))
(assert (forall ((s Seq<$Ref>) (n Int)) (!
  (=> (<= n 0) (= (Seq_drop s n) s))
  :pattern ((Seq_drop s n))
  :qid |$Seq[Ref]_prog.seq_drop_negative_length|)))
(assert (forall ((s Seq<$Ref>) (n Int) (e $Ref)) (!
  (=
    (Seq_contains (Seq_drop s n) e)
    (exists ((i Int)) (!
      (and
        (<= 0 i)
        (and (<= n i) (and (< i (Seq_length s)) (= (Seq_index s i) e))))
      :pattern ((Seq_index s i))
      )))
  :pattern ((Seq_contains (Seq_drop s n) e))
  :qid |$Seq[Ref]_prog.seq_contains_over_drop_index_exists|)))
(assert (forall ((s1 Seq<$Ref>) (s2 Seq<$Ref>)) (!
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
  :qid |$Seq[Ref]_prog.extensional_seq_equality|)))
(assert (forall ((s1 Seq<$Ref>) (s2 Seq<$Ref>)) (!
  (=> (Seq_equal s1 s2) (= s1 s2))
  :pattern ((Seq_equal s1 s2))
  :qid |$Seq[Ref]_prog.seq_equality_identity|)))
(assert (forall ((s1 Seq<$Ref>) (s2 Seq<$Ref>) (n Int)) (!
  (=
    (Seq_sameuntil s1 s2 n)
    (forall ((i Int)) (!
      (=> (and (<= 0 i) (< i n)) (= (Seq_index s1 i) (Seq_index s2 i)))
      :pattern ((Seq_index s1 i))
      :pattern ((Seq_index s2 i))
      )))
  :pattern ((Seq_sameuntil s1 s2 n))
  :qid |$Seq[Ref]_prog.extensional_seq_equality_prefix|)))
(assert (forall ((s Seq<$Ref>) (n Int)) (!
  (=>
    (<= 0 n)
    (ite
      (<= n (Seq_length s))
      (= (Seq_length (Seq_take s n)) n)
      (= (Seq_length (Seq_take s n)) (Seq_length s))))
  :pattern ((Seq_length (Seq_take s n)))
  :qid |$Seq[Ref]_prog.seq_length_over_take|)))
(assert (forall ((s Seq<$Ref>) (n Int) (i Int)) (!
  (=>
    (and (<= 0 i) (and (< i n) (< i (Seq_length s))))
    (= (Seq_index (Seq_take s n) i) (Seq_index s i)))
  :pattern ((Seq_index (Seq_take s n) i))
  :pattern ((Seq_index s i) (Seq_take s n))
  :qid |$Seq[Ref]_prog.seq_index_over_take|)))
(assert (forall ((s Seq<$Ref>) (n Int)) (!
  (=>
    (<= 0 n)
    (ite
      (<= n (Seq_length s))
      (= (Seq_length (Seq_drop s n)) (- (Seq_length s) n))
      (= (Seq_length (Seq_drop s n)) 0)))
  :pattern ((Seq_length (Seq_drop s n)))
  :qid |$Seq[Ref]_prog.seq_length_over_drop|)))
(assert (forall ((s Seq<$Ref>) (n Int) (i Int)) (!
  (=>
    (and (<= 0 n) (and (<= 0 i) (< i (- (Seq_length s) n))))
    (= (Seq_index (Seq_drop s n) i) (Seq_index s (+ i n))))
  :pattern ((Seq_index (Seq_drop s n) i))
  :qid |$Seq[Ref]_prog.seq_index_over_drop_1|)))
(assert (forall ((s Seq<$Ref>) (n Int) (i Int)) (!
  (=>
    (and (<= 0 n) (and (<= n i) (< i (Seq_length s))))
    (= (Seq_index (Seq_drop s n) (- i n)) (Seq_index s i)))
  :pattern ((Seq_index s i) (Seq_drop s n))
  :qid |$Seq[Ref]_prog.seq_index_over_drop_2|)))
(assert (forall ((s Seq<$Ref>) (i Int) (e $Ref) (n Int)) (!
  (=>
    (and (<= 0 i) (and (< i n) (< n (Seq_length s))))
    (= (Seq_take (Seq_update s i e) n) (Seq_update (Seq_take s n) i e)))
  :pattern ((Seq_take (Seq_update s i e) n))
  :qid |$Seq[Ref]_prog.seq_take_over_update_1|)))
(assert (forall ((s Seq<$Ref>) (i Int) (e $Ref) (n Int)) (!
  (=>
    (and (<= n i) (< i (Seq_length s)))
    (= (Seq_take (Seq_update s i e) n) (Seq_take s n)))
  :pattern ((Seq_take (Seq_update s i e) n))
  :qid |$Seq[Ref]_prog.seq_take_over_update_2|)))
(assert (forall ((s Seq<$Ref>) (i Int) (e $Ref) (n Int)) (!
  (=>
    (and (<= 0 n) (and (<= n i) (< i (Seq_length s))))
    (= (Seq_drop (Seq_update s i e) n) (Seq_update (Seq_drop s n) (- i n) e)))
  :pattern ((Seq_drop (Seq_update s i e) n))
  :qid |$Seq[Ref]_prog.seq_drop_over_update_1|)))
(assert (forall ((s Seq<$Ref>) (i Int) (e $Ref) (n Int)) (!
  (=>
    (and (<= 0 i) (and (< i n) (< n (Seq_length s))))
    (= (Seq_drop (Seq_update s i e) n) (Seq_drop s n)))
  :pattern ((Seq_drop (Seq_update s i e) n))
  :qid |$Seq[Ref]_prog.seq_drop_over_update_2|)))
(assert (forall ((s Seq<$Ref>) (e $Ref) (n Int)) (!
  (=>
    (and (<= 0 n) (<= n (Seq_length s)))
    (= (Seq_drop (Seq_build s e) n) (Seq_build (Seq_drop s n) e)))
  :pattern ((Seq_drop (Seq_build s e) n))
  :qid |$Seq[Ref]_prog.seq_drop_over_build|)))
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
(assert (forall ((s Set<Seq<$Ref>>)) (!
  (<= 0 (Set_card s))
  :pattern ((Set_card s))
  :qid |$Set[Seq[Ref]]_prog.card_non_negative|)))
(assert (forall ((e Seq<$Ref>)) (!
  (not (Set_in e (as Set_empty  Set<Seq<$Ref>>)))
  :pattern ((Set_in e (as Set_empty  Set<Seq<$Ref>>)))
  :qid |$Set[Seq[Ref]]_prog.in_empty_set|)))
(assert (forall ((s Set<Seq<$Ref>>)) (!
  (and
    (= (= (Set_card s) 0) (= s (as Set_empty  Set<Seq<$Ref>>)))
    (=>
      (not (= (Set_card s) 0))
      (exists ((e Seq<$Ref>)) (!
        (Set_in e s)
        :pattern ((Set_in e s))
        ))))
  :pattern ((Set_card s))
  :qid |$Set[Seq[Ref]]_prog.empty_set_cardinality|)))
(assert (forall ((e Seq<$Ref>)) (!
  (Set_in e (Set_singleton e))
  :pattern ((Set_singleton e))
  :qid |$Set[Seq[Ref]]_prog.in_singleton_set|)))
(assert (forall ((e1 Seq<$Ref>) (e2 Seq<$Ref>)) (!
  (= (Set_in e1 (Set_singleton e2)) (= e1 e2))
  :pattern ((Set_in e1 (Set_singleton e2)))
  :qid |$Set[Seq[Ref]]_prog.in_singleton_set_equality|)))
(assert (forall ((e Seq<$Ref>)) (!
  (= (Set_card (Set_singleton e)) 1)
  :pattern ((Set_card (Set_singleton e)))
  :qid |$Set[Seq[Ref]]_prog.singleton_set_cardinality|)))
(assert (forall ((s Set<Seq<$Ref>>) (e Seq<$Ref>)) (!
  (Set_in e (Set_unionone s e))
  :pattern ((Set_unionone s e))
  :qid |$Set[Seq[Ref]]_prog.in_unionone_same|)))
(assert (forall ((s Set<Seq<$Ref>>) (e1 Seq<$Ref>) (e2 Seq<$Ref>)) (!
  (= (Set_in e1 (Set_unionone s e2)) (or (= e1 e2) (Set_in e1 s)))
  :pattern ((Set_in e1 (Set_unionone s e2)))
  :qid |$Set[Seq[Ref]]_prog.in_unionone_other|)))
(assert (forall ((s Set<Seq<$Ref>>) (e1 Seq<$Ref>) (e2 Seq<$Ref>)) (!
  (=> (Set_in e1 s) (Set_in e1 (Set_unionone s e2)))
  :pattern ((Set_in e1 s) (Set_unionone s e2))
  :qid |$Set[Seq[Ref]]_prog.invariance_in_unionone|)))
(assert (forall ((s Set<Seq<$Ref>>) (e Seq<$Ref>)) (!
  (=> (Set_in e s) (= (Set_card (Set_unionone s e)) (Set_card s)))
  :pattern ((Set_card (Set_unionone s e)))
  :qid |$Set[Seq[Ref]]_prog.unionone_cardinality_invariant|)))
(assert (forall ((s Set<Seq<$Ref>>) (e Seq<$Ref>)) (!
  (=> (not (Set_in e s)) (= (Set_card (Set_unionone s e)) (+ (Set_card s) 1)))
  :pattern ((Set_card (Set_unionone s e)))
  :qid |$Set[Seq[Ref]]_prog.unionone_cardinality_changed|)))
(assert (forall ((s1 Set<Seq<$Ref>>) (s2 Set<Seq<$Ref>>) (e Seq<$Ref>)) (!
  (= (Set_in e (Set_union s1 s2)) (or (Set_in e s1) (Set_in e s2)))
  :pattern ((Set_in e (Set_union s1 s2)))
  :qid |$Set[Seq[Ref]]_prog.in_union_in_one|)))
(assert (forall ((s1 Set<Seq<$Ref>>) (s2 Set<Seq<$Ref>>) (e Seq<$Ref>)) (!
  (=> (Set_in e s1) (Set_in e (Set_union s1 s2)))
  :pattern ((Set_in e s1) (Set_union s1 s2))
  :qid |$Set[Seq[Ref]]_prog.in_left_in_union|)))
(assert (forall ((s1 Set<Seq<$Ref>>) (s2 Set<Seq<$Ref>>) (e Seq<$Ref>)) (!
  (=> (Set_in e s2) (Set_in e (Set_union s1 s2)))
  :pattern ((Set_in e s2) (Set_union s1 s2))
  :qid |$Set[Seq[Ref]]_prog.in_right_in_union|)))
(assert (forall ((s1 Set<Seq<$Ref>>) (s2 Set<Seq<$Ref>>) (e Seq<$Ref>)) (!
  (= (Set_in e (Set_intersection s1 s2)) (and (Set_in e s1) (Set_in e s2)))
  :pattern ((Set_in e (Set_intersection s1 s2)))
  :pattern ((Set_intersection s1 s2) (Set_in e s1))
  :pattern ((Set_intersection s1 s2) (Set_in e s2))
  :qid |$Set[Seq[Ref]]_prog.in_intersection_in_both|)))
(assert (forall ((s1 Set<Seq<$Ref>>) (s2 Set<Seq<$Ref>>)) (!
  (= (Set_union s1 (Set_union s1 s2)) (Set_union s1 s2))
  :pattern ((Set_union s1 (Set_union s1 s2)))
  :qid |$Set[Seq[Ref]]_prog.union_left_idempotency|)))
(assert (forall ((s1 Set<Seq<$Ref>>) (s2 Set<Seq<$Ref>>)) (!
  (= (Set_union (Set_union s1 s2) s2) (Set_union s1 s2))
  :pattern ((Set_union (Set_union s1 s2) s2))
  :qid |$Set[Seq[Ref]]_prog.union_right_idempotency|)))
(assert (forall ((s1 Set<Seq<$Ref>>) (s2 Set<Seq<$Ref>>)) (!
  (= (Set_intersection s1 (Set_intersection s1 s2)) (Set_intersection s1 s2))
  :pattern ((Set_intersection s1 (Set_intersection s1 s2)))
  :qid |$Set[Seq[Ref]]_prog.intersection_left_idempotency|)))
(assert (forall ((s1 Set<Seq<$Ref>>) (s2 Set<Seq<$Ref>>)) (!
  (= (Set_intersection (Set_intersection s1 s2) s2) (Set_intersection s1 s2))
  :pattern ((Set_intersection (Set_intersection s1 s2) s2))
  :qid |$Set[Seq[Ref]]_prog.intersection_right_idempotency|)))
(assert (forall ((s1 Set<Seq<$Ref>>) (s2 Set<Seq<$Ref>>)) (!
  (=
    (+ (Set_card (Set_union s1 s2)) (Set_card (Set_intersection s1 s2)))
    (+ (Set_card s1) (Set_card s2)))
  :pattern ((Set_card (Set_union s1 s2)))
  :pattern ((Set_card (Set_intersection s1 s2)))
  :qid |$Set[Seq[Ref]]_prog.cardinality_sums|)))
(assert (forall ((s1 Set<Seq<$Ref>>) (s2 Set<Seq<$Ref>>) (e Seq<$Ref>)) (!
  (= (Set_in e (Set_difference s1 s2)) (and (Set_in e s1) (not (Set_in e s2))))
  :pattern ((Set_in e (Set_difference s1 s2)))
  :qid |$Set[Seq[Ref]]_prog.in_difference|)))
(assert (forall ((s1 Set<Seq<$Ref>>) (s2 Set<Seq<$Ref>>) (e Seq<$Ref>)) (!
  (=> (Set_in e s2) (not (Set_in e (Set_difference s1 s2))))
  :pattern ((Set_difference s1 s2) (Set_in e s2))
  :qid |$Set[Seq[Ref]]_prog.not_in_difference|)))
(assert (forall ((s1 Set<Seq<$Ref>>) (s2 Set<Seq<$Ref>>)) (!
  (=
    (Set_subset s1 s2)
    (forall ((e Seq<$Ref>)) (!
      (=> (Set_in e s1) (Set_in e s2))
      :pattern ((Set_in e s1))
      :pattern ((Set_in e s2))
      )))
  :pattern ((Set_subset s1 s2))
  :qid |$Set[Seq[Ref]]_prog.subset_definition|)))
(assert (forall ((s1 Set<Seq<$Ref>>) (s2 Set<Seq<$Ref>>)) (!
  (=
    (Set_equal s1 s2)
    (forall ((e Seq<$Ref>)) (!
      (= (Set_in e s1) (Set_in e s2))
      :pattern ((Set_in e s1))
      :pattern ((Set_in e s2))
      )))
  :pattern ((Set_equal s1 s2))
  :qid |$Set[Seq[Ref]]_prog.equality_definition|)))
(assert (forall ((s1 Set<Seq<$Ref>>) (s2 Set<Seq<$Ref>>)) (!
  (=> (Set_equal s1 s2) (= s1 s2))
  :pattern ((Set_equal s1 s2))
  :qid |$Set[Seq[Ref]]_prog.native_equality|)))
(assert (forall ((s1 Set<Seq<$Ref>>) (s2 Set<Seq<$Ref>>)) (!
  (=
    (Set_disjoint s1 s2)
    (forall ((e Seq<$Ref>)) (!
      (or (not (Set_in e s1)) (not (Set_in e s2)))
      :pattern ((Set_in e s1))
      :pattern ((Set_in e s2))
      )))
  :pattern ((Set_disjoint s1 s2))
  :qid |$Set[Seq[Ref]]_prog.disjointness_definition|)))
(assert (forall ((s1 Set<Seq<$Ref>>) (s2 Set<Seq<$Ref>>)) (!
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
  :qid |$Set[Seq[Ref]]_prog.cardinality_difference|)))
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
; /field_value_functions_axioms.smt2 [f: Int]
(assert (forall ((vs $FVF<f>) (ws $FVF<f>)) (!
    (=>
      (and
        (Set_equal ($FVF.domain_f vs) ($FVF.domain_f ws))
        (forall ((x $Ref)) (!
          (=>
            (Set_in x ($FVF.domain_f vs))
            (= ($FVF.lookup_f vs x) ($FVF.lookup_f ws x)))
          :pattern (($FVF.lookup_f vs x) ($FVF.lookup_f ws x))
          :qid |qp.$FVF<f>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<f>To$Snap vs)
              ($SortWrappers.$FVF<f>To$Snap ws)
              )
    :qid |qp.$FVF<f>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_f pm r))
    :pattern (($FVF.perm_f pm r)))))
(assert (forall ((r $Ref) (f Int)) (!
    (= ($FVF.loc_f f r) true)
    :pattern (($FVF.loc_f f r)))))
; /field_value_functions_axioms.smt2 [ss: Seq[Ref]]
(assert (forall ((vs $FVF<ss>) (ws $FVF<ss>)) (!
    (=>
      (and
        (Set_equal ($FVF.domain_ss vs) ($FVF.domain_ss ws))
        (forall ((x $Ref)) (!
          (=>
            (Set_in x ($FVF.domain_ss vs))
            (= ($FVF.lookup_ss vs x) ($FVF.lookup_ss ws x)))
          :pattern (($FVF.lookup_ss vs x) ($FVF.lookup_ss ws x))
          :qid |qp.$FVF<ss>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<ss>To$Snap vs)
              ($SortWrappers.$FVF<ss>To$Snap ws)
              )
    :qid |qp.$FVF<ss>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_ss pm r))
    :pattern (($FVF.perm_ss pm r)))))
(assert (forall ((r $Ref) (f Seq<$Ref>)) (!
    (= ($FVF.loc_ss f r) true)
    :pattern (($FVF.loc_ss f r)))))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
(declare-fun inv@24@00 ($Snap Seq<$Ref> Int $Ref) Int)
(declare-fun inv@29@00 ($Snap Seq<$Ref> Int $Ref) Int)
(declare-fun inv@34@00 ($Snap Seq<$Ref> Int $Ref) Int)
(declare-fun sm@30@00 ($Snap Seq<$Ref> Int) $FVF<f>)
(declare-fun sm@35@00 ($Snap Seq<$Ref> Int) $FVF<f>)
(declare-fun sm@36@00 ($Snap Seq<$Ref> Int) $FVF<f>)
(declare-fun sm@38@00 ($Snap Seq<$Ref> Int) $FVF<f>)
(declare-fun inv@43@00 ($Snap Seq<$Ref> Int $Ref) Int)
(declare-fun sm@45@00 ($Snap Seq<$Ref> Int) $FVF<f>)
(declare-fun sm@47@00 ($Snap Seq<$Ref> Int) $FVF<f>)
(declare-fun sm@49@00 ($Snap Seq<$Ref> Int) $FVF<f>)
(declare-fun inv@54@00 ($Snap $Ref Int Int $Ref) Int)
(declare-fun inv@56@00 ($Snap $Ref Int Int $Ref) Int)
(declare-fun sm@57@00 ($Snap $Ref Int Int) $FVF<f>)
(declare-fun inv@62@00 ($Snap Seq<$Ref> $Ref) Int)
(declare-fun sm@63@00 ($Snap Seq<$Ref>) $FVF<f>)
(declare-fun sm@65@00 ($Snap Seq<$Ref>) $FVF<f>)
(declare-fun inv@70@00 ($Snap Seq<$Ref> $Ref) Int)
(declare-fun sm@71@00 ($Snap Seq<$Ref>) $FVF<f>)
(declare-fun inv@76@00 ($Snap Seq<$Ref> Int Int $Ref) Int)
(declare-fun inv@78@00 ($Snap Seq<$Ref> Int Int $Ref) Int)
(declare-fun sm@79@00 ($Snap Seq<$Ref> Int Int) $FVF<f>)
(declare-fun inv@84@00 ($Snap Seq<$Ref> Int $Ref) Int)
(declare-fun inv@86@00 ($Snap Seq<$Ref> Int $Ref) Int)
(declare-fun sm@87@00 ($Snap Seq<$Ref> Int) $FVF<f>)
(assert (forall ((s@$ $Snap) (xs@0@00 Seq<$Ref>) (j@1@00 Int)) (!
  (= (fun07%limited s@$ xs@0@00 j@1@00) (fun07 s@$ xs@0@00 j@1@00))
  :pattern ((fun07 s@$ xs@0@00 j@1@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (xs@0@00 Seq<$Ref>) (j@1@00 Int)) (!
  (fun07%stateless xs@0@00 j@1@00)
  :pattern ((fun07%limited s@$ xs@0@00 j@1@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (xs@0@00 Seq<$Ref>) (j@1@00 Int)) (!
  (let ((result@2@00 (fun07%limited s@$ xs@0@00 j@1@00))) (and
    (forall ((i@23@00 Int)) (!
      (=>
        (and (< i@23@00 (Seq_length xs@0@00)) (<= 0 i@23@00))
        (= (inv@24@00 s@$ xs@0@00 j@1@00 (Seq_index xs@0@00 i@23@00)) i@23@00))
      :pattern ((Seq_index xs@0@00 i@23@00))
      :qid |quant-u-15|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (< (inv@24@00 s@$ xs@0@00 j@1@00 r) (Seq_length xs@0@00))
          (<= 0 (inv@24@00 s@$ xs@0@00 j@1@00 r)))
        (= (Seq_index xs@0@00 (inv@24@00 s@$ xs@0@00 j@1@00 r)) r))
      :pattern ((inv@24@00 s@$ xs@0@00 j@1@00 r))
      :qid |f-fctOfInv|))
    (=> (fun07%precondition s@$ xs@0@00 j@1@00) (>= result@2@00 0))))
  :pattern ((fun07%limited s@$ xs@0@00 j@1@00))
  :qid |quant-u-16|)))
(assert (forall ((s@$ $Snap) (xs@0@00 Seq<$Ref>) (j@1@00 Int)) (!
  (let ((result@2@00 (fun07%limited s@$ xs@0@00 j@1@00))) true)
  :pattern ((fun07%limited s@$ xs@0@00 j@1@00))
  :qid |quant-u-17|)))
(assert (forall ((s@$ $Snap) (xs@0@00 Seq<$Ref>) (j@1@00 Int)) (!
  (and
    (forall ((i@23@00 Int)) (!
      (=>
        (and (< i@23@00 (Seq_length xs@0@00)) (<= 0 i@23@00))
        (= (inv@24@00 s@$ xs@0@00 j@1@00 (Seq_index xs@0@00 i@23@00)) i@23@00))
      :pattern ((Seq_index xs@0@00 i@23@00))
      :qid |quant-u-15|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (< (inv@24@00 s@$ xs@0@00 j@1@00 r) (Seq_length xs@0@00))
          (<= 0 (inv@24@00 s@$ xs@0@00 j@1@00 r)))
        (= (Seq_index xs@0@00 (inv@24@00 s@$ xs@0@00 j@1@00 r)) r))
      :pattern ((inv@24@00 s@$ xs@0@00 j@1@00 r))
      :qid |f-fctOfInv|))
    (forall ((i@28@00 Int)) (!
      (=>
        (and (< i@28@00 (Seq_length xs@0@00)) (<= 0 i@28@00))
        (= (inv@29@00 s@$ xs@0@00 j@1@00 (Seq_index xs@0@00 i@28@00)) i@28@00))
      :pattern ((Seq_index xs@0@00 i@28@00))
      :qid |f-invOfFct|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (< (inv@29@00 s@$ xs@0@00 j@1@00 r) (Seq_length xs@0@00))
          (<= 0 (inv@29@00 s@$ xs@0@00 j@1@00 r)))
        (= (Seq_index xs@0@00 (inv@29@00 s@$ xs@0@00 j@1@00 r)) r))
      :pattern ((inv@29@00 s@$ xs@0@00 j@1@00 r))
      :qid |f-fctOfInv|))
    (forall ((i@33@00 Int)) (!
      (=>
        (and (< i@33@00 (Seq_length xs@0@00)) (<= 0 i@33@00))
        (= (inv@34@00 s@$ xs@0@00 j@1@00 (Seq_index xs@0@00 i@33@00)) i@33@00))
      :pattern ((Seq_index xs@0@00 i@33@00))
      :qid |f-invOfFct|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (< (inv@34@00 s@$ xs@0@00 j@1@00 r) (Seq_length xs@0@00))
          (<= 0 (inv@34@00 s@$ xs@0@00 j@1@00 r)))
        (= (Seq_index xs@0@00 (inv@34@00 s@$ xs@0@00 j@1@00 r)) r))
      :pattern ((inv@34@00 s@$ xs@0@00 j@1@00 r))
      :qid |f-fctOfInv|))
    (forall ((r $Ref)) (!
      (and
        (=>
          (Set_in r ($FVF.domain_f (sm@30@00 s@$ xs@0@00 j@1@00)))
          (and
            (< (inv@29@00 s@$ xs@0@00 j@1@00 r) (Seq_length xs@0@00))
            (<= 0 (inv@29@00 s@$ xs@0@00 j@1@00 r))))
        (=>
          (and
            (< (inv@29@00 s@$ xs@0@00 j@1@00 r) (Seq_length xs@0@00))
            (<= 0 (inv@29@00 s@$ xs@0@00 j@1@00 r)))
          (Set_in r ($FVF.domain_f (sm@30@00 s@$ xs@0@00 j@1@00)))))
      :pattern ((Set_in r ($FVF.domain_f (sm@30@00 s@$ xs@0@00 j@1@00))))
      :qid |qp.fvfDomDef1|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (< (inv@29@00 s@$ xs@0@00 j@1@00 r) (Seq_length xs@0@00))
            (<= 0 (inv@29@00 s@$ xs@0@00 j@1@00 r)))
          (and
            (< (inv@24@00 s@$ xs@0@00 j@1@00 r) (Seq_length xs@0@00))
            (<= 0 (inv@24@00 s@$ xs@0@00 j@1@00 r))))
        (=
          ($FVF.lookup_f (sm@30@00 s@$ xs@0@00 j@1@00) r)
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second s@$)) r)))
      :pattern (($FVF.lookup_f (sm@30@00 s@$ xs@0@00 j@1@00) r))
      :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second s@$)) r))
      :qid |qp.fvfValDef0|))
    (forall ((r $Ref)) (!
      (and
        (=>
          (Set_in r ($FVF.domain_f (sm@35@00 s@$ xs@0@00 j@1@00)))
          (and
            (< (inv@34@00 s@$ xs@0@00 j@1@00 r) (Seq_length xs@0@00))
            (<= 0 (inv@34@00 s@$ xs@0@00 j@1@00 r))))
        (=>
          (and
            (< (inv@34@00 s@$ xs@0@00 j@1@00 r) (Seq_length xs@0@00))
            (<= 0 (inv@34@00 s@$ xs@0@00 j@1@00 r)))
          (Set_in r ($FVF.domain_f (sm@35@00 s@$ xs@0@00 j@1@00)))))
      :pattern ((Set_in r ($FVF.domain_f (sm@35@00 s@$ xs@0@00 j@1@00))))
      :qid |qp.fvfDomDef3|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (< (inv@34@00 s@$ xs@0@00 j@1@00 r) (Seq_length xs@0@00))
            (<= 0 (inv@34@00 s@$ xs@0@00 j@1@00 r)))
          (and
            (< (inv@24@00 s@$ xs@0@00 j@1@00 r) (Seq_length xs@0@00))
            (<= 0 (inv@24@00 s@$ xs@0@00 j@1@00 r))))
        (=
          ($FVF.lookup_f (sm@35@00 s@$ xs@0@00 j@1@00) r)
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second s@$)) r)))
      :pattern (($FVF.lookup_f (sm@35@00 s@$ xs@0@00 j@1@00) r))
      :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second s@$)) r))
      :qid |qp.fvfValDef2|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (< (inv@24@00 s@$ xs@0@00 j@1@00 r) (Seq_length xs@0@00))
          (<= 0 (inv@24@00 s@$ xs@0@00 j@1@00 r)))
        (=
          ($FVF.lookup_f (sm@36@00 s@$ xs@0@00 j@1@00) r)
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second s@$)) r)))
      :pattern (($FVF.lookup_f (sm@36@00 s@$ xs@0@00 j@1@00) r))
      :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second s@$)) r))
      :qid |qp.fvfValDef4|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (< (inv@24@00 s@$ xs@0@00 j@1@00 r) (Seq_length xs@0@00))
          (<= 0 (inv@24@00 s@$ xs@0@00 j@1@00 r)))
        (=
          ($FVF.lookup_f (sm@38@00 s@$ xs@0@00 j@1@00) r)
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second s@$)) r)))
      :pattern (($FVF.lookup_f (sm@38@00 s@$ xs@0@00 j@1@00) r))
      :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second s@$)) r))
      :qid |qp.fvfValDef6|))
    (=>
      (fun07%precondition s@$ xs@0@00 j@1@00)
      (=
        (fun07 s@$ xs@0@00 j@1@00)
        (ite
          (< j@1@00 0)
          (fun07%limited ($Snap.combine
            $Snap.unit
            ($SortWrappers.$FVF<f>To$Snap (sm@30@00 s@$ xs@0@00 j@1@00))) xs@0@00 (+
            j@1@00
            1))
          (ite
            (<= (Seq_length xs@0@00) j@1@00)
            (fun07%limited ($Snap.combine
              $Snap.unit
              ($SortWrappers.$FVF<f>To$Snap (sm@35@00 s@$ xs@0@00 j@1@00))) xs@0@00 (-
              j@1@00
              1))
            (*
              (ite
                (and (not (<= (Seq_length xs@0@00) j@1@00)) (not (< j@1@00 0)))
                ($FVF.lookup_f (sm@38@00 s@$ xs@0@00 j@1@00) (Seq_index
                  xs@0@00
                  j@1@00))
                ($FVF.lookup_f (sm@36@00 s@$ xs@0@00 j@1@00) (Seq_index
                  xs@0@00
                  j@1@00)))
              (ite
                (and (not (<= (Seq_length xs@0@00) j@1@00)) (not (< j@1@00 0)))
                ($FVF.lookup_f (sm@38@00 s@$ xs@0@00 j@1@00) (Seq_index
                  xs@0@00
                  j@1@00))
                ($FVF.lookup_f (sm@36@00 s@$ xs@0@00 j@1@00) (Seq_index
                  xs@0@00
                  j@1@00)))))))))
  :pattern ((fun07 s@$ xs@0@00 j@1@00))
  :qid |quant-u-26|)))
(assert (forall ((s@$ $Snap) (xs@0@00 Seq<$Ref>) (j@1@00 Int)) (!
  (=>
    (fun07%precondition s@$ xs@0@00 j@1@00)
    (ite
      (< j@1@00 0)
      (fun07%precondition ($Snap.combine
        $Snap.unit
        ($SortWrappers.$FVF<f>To$Snap (sm@30@00 s@$ xs@0@00 j@1@00))) xs@0@00 (+
        j@1@00
        1))
      (ite
        (<= (Seq_length xs@0@00) j@1@00)
        (fun07%precondition ($Snap.combine
          $Snap.unit
          ($SortWrappers.$FVF<f>To$Snap (sm@35@00 s@$ xs@0@00 j@1@00))) xs@0@00 (-
          j@1@00
          1))
        true)))
  :pattern ((fun07 s@$ xs@0@00 j@1@00))
  :qid |quant-u-27|)))
(assert (forall ((s@$ $Snap) (xs@3@00 Seq<$Ref>) (i@4@00 Int)) (!
  (= (fun08%limited s@$ xs@3@00 i@4@00) (fun08 s@$ xs@3@00 i@4@00))
  :pattern ((fun08 s@$ xs@3@00 i@4@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (xs@3@00 Seq<$Ref>) (i@4@00 Int)) (!
  (fun08%stateless xs@3@00 i@4@00)
  :pattern ((fun08%limited s@$ xs@3@00 i@4@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (xs@3@00 Seq<$Ref>) (i@4@00 Int)) (!
  (let ((result@5@00 (fun08%limited s@$ xs@3@00 i@4@00))) (and
    (forall ((j@42@00 Int)) (!
      (=>
        (and (< j@42@00 (Seq_length xs@3@00)) (<= 0 j@42@00))
        (= (inv@43@00 s@$ xs@3@00 i@4@00 (Seq_index xs@3@00 j@42@00)) j@42@00))
      :pattern ((Seq_index xs@3@00 j@42@00))
      :qid |quant-u-29|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (< (inv@43@00 s@$ xs@3@00 i@4@00 r) (Seq_length xs@3@00))
          (<= 0 (inv@43@00 s@$ xs@3@00 i@4@00 r)))
        (= (Seq_index xs@3@00 (inv@43@00 s@$ xs@3@00 i@4@00 r)) r))
      :pattern ((inv@43@00 s@$ xs@3@00 i@4@00 r))
      :qid |f-fctOfInv|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (< (inv@43@00 s@$ xs@3@00 i@4@00 r) (Seq_length xs@3@00))
          (<= 0 (inv@43@00 s@$ xs@3@00 i@4@00 r)))
        (=
          ($FVF.lookup_f (sm@45@00 s@$ xs@3@00 i@4@00) r)
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second s@$))) r)))
      :pattern (($FVF.lookup_f (sm@45@00 s@$ xs@3@00 i@4@00) r))
      :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second s@$))) r))
      :qid |qp.fvfValDef8|))
    (=>
      (fun08%precondition s@$ xs@3@00 i@4@00)
      (>
        result@5@00
        ($FVF.lookup_f (sm@45@00 s@$ xs@3@00 i@4@00) (Seq_index xs@3@00 i@4@00))))))
  :pattern ((fun08%limited s@$ xs@3@00 i@4@00))
  :qid |quant-u-30|)))
(assert (forall ((s@$ $Snap) (xs@3@00 Seq<$Ref>) (i@4@00 Int)) (!
  (let ((result@5@00 (fun08%limited s@$ xs@3@00 i@4@00))) true)
  :pattern ((fun08%limited s@$ xs@3@00 i@4@00))
  :qid |quant-u-31|)))
(assert (forall ((s@$ $Snap) (xs@3@00 Seq<$Ref>) (i@4@00 Int)) (!
  (and
    (forall ((j@42@00 Int)) (!
      (=>
        (and (< j@42@00 (Seq_length xs@3@00)) (<= 0 j@42@00))
        (= (inv@43@00 s@$ xs@3@00 i@4@00 (Seq_index xs@3@00 j@42@00)) j@42@00))
      :pattern ((Seq_index xs@3@00 j@42@00))
      :qid |quant-u-29|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (< (inv@43@00 s@$ xs@3@00 i@4@00 r) (Seq_length xs@3@00))
          (<= 0 (inv@43@00 s@$ xs@3@00 i@4@00 r)))
        (= (Seq_index xs@3@00 (inv@43@00 s@$ xs@3@00 i@4@00 r)) r))
      :pattern ((inv@43@00 s@$ xs@3@00 i@4@00 r))
      :qid |f-fctOfInv|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (< (inv@43@00 s@$ xs@3@00 i@4@00 r) (Seq_length xs@3@00))
          (<= 0 (inv@43@00 s@$ xs@3@00 i@4@00 r)))
        (=
          ($FVF.lookup_f (sm@47@00 s@$ xs@3@00 i@4@00) r)
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second s@$))) r)))
      :pattern (($FVF.lookup_f (sm@47@00 s@$ xs@3@00 i@4@00) r))
      :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second s@$))) r))
      :qid |qp.fvfValDef10|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (< (inv@43@00 s@$ xs@3@00 i@4@00 r) (Seq_length xs@3@00))
          (<= 0 (inv@43@00 s@$ xs@3@00 i@4@00 r)))
        (=
          ($FVF.lookup_f (sm@49@00 s@$ xs@3@00 i@4@00) r)
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second s@$))) r)))
      :pattern (($FVF.lookup_f (sm@49@00 s@$ xs@3@00 i@4@00) r))
      :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second s@$))) r))
      :qid |qp.fvfValDef12|))
    (=>
      (fun08%precondition s@$ xs@3@00 i@4@00)
      (=
        (fun08 s@$ xs@3@00 i@4@00)
        (+
          ($FVF.lookup_f (sm@49@00 s@$ xs@3@00 i@4@00) (Seq_index xs@3@00 i@4@00))
          1))))
  :pattern ((fun08 s@$ xs@3@00 i@4@00))
  :qid |quant-u-32|)))
(assert (forall ((s@$ $Snap) (xs@3@00 Seq<$Ref>) (i@4@00 Int)) (!
  true
  :pattern ((fun08 s@$ xs@3@00 i@4@00))
  :qid |quant-u-33|)))
(assert (forall ((s@$ $Snap) (x@6@00 $Ref) (n@7@00 Int) (i@8@00 Int)) (!
  (= (fun04%limited s@$ x@6@00 n@7@00 i@8@00) (fun04 s@$ x@6@00 n@7@00 i@8@00))
  :pattern ((fun04 s@$ x@6@00 n@7@00 i@8@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (x@6@00 $Ref) (n@7@00 Int) (i@8@00 Int)) (!
  (fun04%stateless x@6@00 n@7@00 i@8@00)
  :pattern ((fun04%limited s@$ x@6@00 n@7@00 i@8@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (x@6@00 $Ref) (n@7@00 Int) (i@8@00 Int)) (!
  (and
    (forall ((j@53@00 Int)) (!
      (=>
        (and (< j@53@00 3) (<= 0 j@53@00))
        (=
          (inv@54@00 s@$ x@6@00 n@7@00 i@8@00 (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
            j@53@00))
          j@53@00))
      :pattern ((Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
        j@53@00))
      :qid |quant-u-35|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (< (inv@54@00 s@$ x@6@00 n@7@00 i@8@00 r) 3)
          (<= 0 (inv@54@00 s@$ x@6@00 n@7@00 i@8@00 r)))
        (=
          (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
            (inv@54@00 s@$ x@6@00 n@7@00 i@8@00 r))
          r))
      :pattern ((inv@54@00 s@$ x@6@00 n@7@00 i@8@00 r))
      :qid |f-fctOfInv|))
    (forall ((j@55@00 Int)) (!
      (=>
        (and (< j@55@00 n@7@00) (<= 3 j@55@00))
        (=
          (inv@56@00 s@$ x@6@00 n@7@00 i@8@00 (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
            j@55@00))
          j@55@00))
      :pattern ((Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
        j@55@00))
      :qid |quant-u-37|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (< (inv@56@00 s@$ x@6@00 n@7@00 i@8@00 r) n@7@00)
          (<= 3 (inv@56@00 s@$ x@6@00 n@7@00 i@8@00 r)))
        (=
          (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
            (inv@56@00 s@$ x@6@00 n@7@00 i@8@00 r))
          r))
      :pattern ((inv@56@00 s@$ x@6@00 n@7@00 i@8@00 r))
      :qid |f-fctOfInv|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (< (inv@56@00 s@$ x@6@00 n@7@00 i@8@00 r) n@7@00)
          (<= 3 (inv@56@00 s@$ x@6@00 n@7@00 i@8@00 r)))
        (=
          ($FVF.lookup_f (sm@57@00 s@$ x@6@00 n@7@00 i@8@00) r)
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))))) r)))
      :pattern (($FVF.lookup_f (sm@57@00 s@$ x@6@00 n@7@00 i@8@00) r))
      :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))))) r))
      :qid |qp.fvfValDef14|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (< (inv@54@00 s@$ x@6@00 n@7@00 i@8@00 r) 3)
          (<= 0 (inv@54@00 s@$ x@6@00 n@7@00 i@8@00 r)))
        (=
          ($FVF.lookup_f (sm@57@00 s@$ x@6@00 n@7@00 i@8@00) r)
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))))) r)))
      :pattern (($FVF.lookup_f (sm@57@00 s@$ x@6@00 n@7@00 i@8@00) r))
      :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$))))))) r))
      :qid |qp.fvfValDef15|))
    (=>
      (fun04%precondition s@$ x@6@00 n@7@00 i@8@00)
      (=
        (fun04 s@$ x@6@00 n@7@00 i@8@00)
        ($FVF.lookup_f (sm@57@00 s@$ x@6@00 n@7@00 i@8@00) (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
          i@8@00)))))
  :pattern ((fun04 s@$ x@6@00 n@7@00 i@8@00))
  :qid |quant-u-38|)))
(assert (forall ((s@$ $Snap) (x@6@00 $Ref) (n@7@00 Int) (i@8@00 Int)) (!
  true
  :pattern ((fun04 s@$ x@6@00 n@7@00 i@8@00))
  :qid |quant-u-39|)))
(assert (forall ((s@$ $Snap) (xs@10@00 Seq<$Ref>)) (!
  (= (fun02%limited s@$ xs@10@00) (fun02 s@$ xs@10@00))
  :pattern ((fun02 s@$ xs@10@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (xs@10@00 Seq<$Ref>)) (!
  (fun02%stateless xs@10@00)
  :pattern ((fun02%limited s@$ xs@10@00))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap) (xs@10@00 Seq<$Ref>)) (!
  (and
    (forall ((i@61@00 Int)) (!
      (=>
        (and (< i@61@00 (Seq_length xs@10@00)) (<= 0 i@61@00))
        (= (inv@62@00 s@$ xs@10@00 (Seq_index xs@10@00 i@61@00)) i@61@00))
      :pattern ((Seq_index xs@10@00 i@61@00))
      :qid |quant-u-41|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (< (inv@62@00 s@$ xs@10@00 r) (Seq_length xs@10@00))
          (<= 0 (inv@62@00 s@$ xs@10@00 r)))
        (= (Seq_index xs@10@00 (inv@62@00 s@$ xs@10@00 r)) r))
      :pattern ((inv@62@00 s@$ xs@10@00 r))
      :qid |f-fctOfInv|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (< (inv@62@00 s@$ xs@10@00 r) (Seq_length xs@10@00))
          (<= 0 (inv@62@00 s@$ xs@10@00 r)))
        (=
          ($FVF.lookup_f (sm@63@00 s@$ xs@10@00) r)
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second s@$))) r)))
      :pattern (($FVF.lookup_f (sm@63@00 s@$ xs@10@00) r))
      :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second s@$))) r))
      :qid |qp.fvfValDef17|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (< (inv@62@00 s@$ xs@10@00 r) (Seq_length xs@10@00))
          (<= 0 (inv@62@00 s@$ xs@10@00 r)))
        (=
          ($FVF.lookup_f (sm@65@00 s@$ xs@10@00) r)
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second s@$))) r)))
      :pattern (($FVF.lookup_f (sm@65@00 s@$ xs@10@00) r))
      :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second s@$))) r))
      :qid |qp.fvfValDef19|))
    (=>
      (fun02%precondition s@$ xs@10@00)
      (=
        (fun02 s@$ xs@10@00)
        (+
          ($FVF.lookup_f (sm@63@00 s@$ xs@10@00) (Seq_index xs@10@00 0))
          ($FVF.lookup_f (sm@65@00 s@$ xs@10@00) (Seq_index xs@10@00 1))))))
  :pattern ((fun02 s@$ xs@10@00))
  :qid |quant-u-42|)))
(assert (forall ((s@$ $Snap) (xs@10@00 Seq<$Ref>)) (!
  true
  :pattern ((fun02 s@$ xs@10@00))
  :qid |quant-u-43|)))
(assert (forall ((s@$ $Snap) (xs@12@00 Seq<$Ref>)) (!
  (= (fun01%limited s@$ xs@12@00) (fun01 s@$ xs@12@00))
  :pattern ((fun01 s@$ xs@12@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (xs@12@00 Seq<$Ref>)) (!
  (fun01%stateless xs@12@00)
  :pattern ((fun01%limited s@$ xs@12@00))
  :qid |quant-u-9|)))
(assert (forall ((s@$ $Snap) (xs@12@00 Seq<$Ref>)) (!
  (and
    (forall ((i@69@00 Int)) (!
      (=>
        (and (< i@69@00 (Seq_length xs@12@00)) (<= 0 i@69@00))
        (= (inv@70@00 s@$ xs@12@00 (Seq_index xs@12@00 i@69@00)) i@69@00))
      :pattern ((Seq_index xs@12@00 i@69@00))
      :qid |quant-u-45|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (< (inv@70@00 s@$ xs@12@00 r) (Seq_length xs@12@00))
          (<= 0 (inv@70@00 s@$ xs@12@00 r)))
        (= (Seq_index xs@12@00 (inv@70@00 s@$ xs@12@00 r)) r))
      :pattern ((inv@70@00 s@$ xs@12@00 r))
      :qid |f-fctOfInv|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (< (inv@70@00 s@$ xs@12@00 r) (Seq_length xs@12@00))
          (<= 0 (inv@70@00 s@$ xs@12@00 r)))
        (=
          ($FVF.lookup_f (sm@71@00 s@$ xs@12@00) r)
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second s@$))) r)))
      :pattern (($FVF.lookup_f (sm@71@00 s@$ xs@12@00) r))
      :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second s@$))) r))
      :qid |qp.fvfValDef21|))
    (=>
      (fun01%precondition s@$ xs@12@00)
      (=
        (fun01 s@$ xs@12@00)
        ($FVF.lookup_f (sm@71@00 s@$ xs@12@00) (Seq_index xs@12@00 0)))))
  :pattern ((fun01 s@$ xs@12@00))
  :qid |quant-u-46|)))
(assert (forall ((s@$ $Snap) (xs@12@00 Seq<$Ref>)) (!
  true
  :pattern ((fun01 s@$ xs@12@00))
  :qid |quant-u-47|)))
(assert (forall ((s@$ $Snap) (xs@14@00 Seq<$Ref>) (n@15@00 Int) (i@16@00 Int)) (!
  (=
    (fun06%limited s@$ xs@14@00 n@15@00 i@16@00)
    (fun06 s@$ xs@14@00 n@15@00 i@16@00))
  :pattern ((fun06 s@$ xs@14@00 n@15@00 i@16@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (xs@14@00 Seq<$Ref>) (n@15@00 Int) (i@16@00 Int)) (!
  (fun06%stateless xs@14@00 n@15@00 i@16@00)
  :pattern ((fun06%limited s@$ xs@14@00 n@15@00 i@16@00))
  :qid |quant-u-11|)))
(assert (forall ((s@$ $Snap) (xs@14@00 Seq<$Ref>) (n@15@00 Int) (i@16@00 Int)) (!
  (and
    (forall ((j@75@00 Int)) (!
      (=>
        (and (< j@75@00 3) (<= 0 j@75@00))
        (=
          (inv@76@00 s@$ xs@14@00 n@15@00 i@16@00 (Seq_index xs@14@00 j@75@00))
          j@75@00))
      :pattern ((Seq_index xs@14@00 j@75@00))
      :qid |quant-u-49|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (< (inv@76@00 s@$ xs@14@00 n@15@00 i@16@00 r) 3)
          (<= 0 (inv@76@00 s@$ xs@14@00 n@15@00 i@16@00 r)))
        (= (Seq_index xs@14@00 (inv@76@00 s@$ xs@14@00 n@15@00 i@16@00 r)) r))
      :pattern ((inv@76@00 s@$ xs@14@00 n@15@00 i@16@00 r))
      :qid |f-fctOfInv|))
    (forall ((j@77@00 Int)) (!
      (=>
        (and (< j@77@00 n@15@00) (<= 3 j@77@00))
        (=
          (inv@78@00 s@$ xs@14@00 n@15@00 i@16@00 (Seq_index xs@14@00 j@77@00))
          j@77@00))
      :pattern ((Seq_index xs@14@00 j@77@00))
      :qid |quant-u-51|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (< (inv@78@00 s@$ xs@14@00 n@15@00 i@16@00 r) n@15@00)
          (<= 3 (inv@78@00 s@$ xs@14@00 n@15@00 i@16@00 r)))
        (= (Seq_index xs@14@00 (inv@78@00 s@$ xs@14@00 n@15@00 i@16@00 r)) r))
      :pattern ((inv@78@00 s@$ xs@14@00 n@15@00 i@16@00 r))
      :qid |f-fctOfInv|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (< (inv@78@00 s@$ xs@14@00 n@15@00 i@16@00 r) n@15@00)
          (<= 3 (inv@78@00 s@$ xs@14@00 n@15@00 i@16@00 r)))
        (=
          ($FVF.lookup_f (sm@79@00 s@$ xs@14@00 n@15@00 i@16@00) r)
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))) r)))
      :pattern (($FVF.lookup_f (sm@79@00 s@$ xs@14@00 n@15@00 i@16@00) r))
      :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))) r))
      :qid |qp.fvfValDef23|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (< (inv@76@00 s@$ xs@14@00 n@15@00 i@16@00 r) 3)
          (<= 0 (inv@76@00 s@$ xs@14@00 n@15@00 i@16@00 r)))
        (=
          ($FVF.lookup_f (sm@79@00 s@$ xs@14@00 n@15@00 i@16@00) r)
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))) r)))
      :pattern (($FVF.lookup_f (sm@79@00 s@$ xs@14@00 n@15@00 i@16@00) r))
      :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))) r))
      :qid |qp.fvfValDef24|))
    (=>
      (fun06%precondition s@$ xs@14@00 n@15@00 i@16@00)
      (=
        (fun06 s@$ xs@14@00 n@15@00 i@16@00)
        ($FVF.lookup_f (sm@79@00 s@$ xs@14@00 n@15@00 i@16@00) (Seq_index
          xs@14@00
          i@16@00)))))
  :pattern ((fun06 s@$ xs@14@00 n@15@00 i@16@00))
  :qid |quant-u-52|)))
(assert (forall ((s@$ $Snap) (xs@14@00 Seq<$Ref>) (n@15@00 Int) (i@16@00 Int)) (!
  true
  :pattern ((fun06 s@$ xs@14@00 n@15@00 i@16@00))
  :qid |quant-u-53|)))
(assert (forall ((s@$ $Snap) (xs@18@00 Seq<$Ref>) (i@19@00 Int)) (!
  (= (fun03%limited s@$ xs@18@00 i@19@00) (fun03 s@$ xs@18@00 i@19@00))
  :pattern ((fun03 s@$ xs@18@00 i@19@00))
  :qid |quant-u-12|)))
(assert (forall ((s@$ $Snap) (xs@18@00 Seq<$Ref>) (i@19@00 Int)) (!
  (fun03%stateless xs@18@00 i@19@00)
  :pattern ((fun03%limited s@$ xs@18@00 i@19@00))
  :qid |quant-u-13|)))
(assert (forall ((s@$ $Snap) (xs@18@00 Seq<$Ref>) (i@19@00 Int)) (!
  (and
    (forall ((j@83@00 Int)) (!
      (=>
        (and (< j@83@00 3) (<= 0 j@83@00))
        (= (inv@84@00 s@$ xs@18@00 i@19@00 (Seq_index xs@18@00 j@83@00)) j@83@00))
      :pattern ((Seq_index xs@18@00 j@83@00))
      :qid |quant-u-55|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (< (inv@84@00 s@$ xs@18@00 i@19@00 r) 3)
          (<= 0 (inv@84@00 s@$ xs@18@00 i@19@00 r)))
        (= (Seq_index xs@18@00 (inv@84@00 s@$ xs@18@00 i@19@00 r)) r))
      :pattern ((inv@84@00 s@$ xs@18@00 i@19@00 r))
      :qid |f-fctOfInv|))
    (forall ((j@85@00 Int)) (!
      (=>
        (and (< j@85@00 (Seq_length xs@18@00)) (<= 3 j@85@00))
        (= (inv@86@00 s@$ xs@18@00 i@19@00 (Seq_index xs@18@00 j@85@00)) j@85@00))
      :pattern ((Seq_index xs@18@00 j@85@00))
      :qid |quant-u-57|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (< (inv@86@00 s@$ xs@18@00 i@19@00 r) (Seq_length xs@18@00))
          (<= 3 (inv@86@00 s@$ xs@18@00 i@19@00 r)))
        (= (Seq_index xs@18@00 (inv@86@00 s@$ xs@18@00 i@19@00 r)) r))
      :pattern ((inv@86@00 s@$ xs@18@00 i@19@00 r))
      :qid |f-fctOfInv|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (< (inv@86@00 s@$ xs@18@00 i@19@00 r) (Seq_length xs@18@00))
          (<= 3 (inv@86@00 s@$ xs@18@00 i@19@00 r)))
        (=
          ($FVF.lookup_f (sm@87@00 s@$ xs@18@00 i@19@00) r)
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
      :pattern (($FVF.lookup_f (sm@87@00 s@$ xs@18@00 i@19@00) r))
      :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
      :qid |qp.fvfValDef26|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (< (inv@84@00 s@$ xs@18@00 i@19@00 r) 3)
          (<= 0 (inv@84@00 s@$ xs@18@00 i@19@00 r)))
        (=
          ($FVF.lookup_f (sm@87@00 s@$ xs@18@00 i@19@00) r)
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second s@$)))) r)))
      :pattern (($FVF.lookup_f (sm@87@00 s@$ xs@18@00 i@19@00) r))
      :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second s@$)))) r))
      :qid |qp.fvfValDef27|))
    (=>
      (fun03%precondition s@$ xs@18@00 i@19@00)
      (=
        (fun03 s@$ xs@18@00 i@19@00)
        ($FVF.lookup_f (sm@87@00 s@$ xs@18@00 i@19@00) (Seq_index
          xs@18@00
          i@19@00)))))
  :pattern ((fun03 s@$ xs@18@00 i@19@00))
  :qid |quant-u-58|)))
(assert (forall ((s@$ $Snap) (xs@18@00 Seq<$Ref>) (i@19@00 Int)) (!
  true
  :pattern ((fun03 s@$ xs@18@00 i@19@00))
  :qid |quant-u-59|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- test01 ----------
(declare-const xs@0@01 Seq<$Ref>)
(declare-const xs@1@01 Seq<$Ref>)
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
; inhale (forall i: Int, j: Int ::
;     { xs[i], xs[j] }
;     i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==>
;     xs[i] != xs[j])
(declare-const $t@2@01 $Snap)
(assert (= $t@2@01 $Snap.unit))
; [eval] (forall i: Int, j: Int :: { xs[i], xs[j] } i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==> xs[i] != xs[j])
(declare-const i@3@01 Int)
(declare-const j@4@01 Int)
(push) ; 3
; [eval] i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==> xs[i] != xs[j]
; [eval] i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j)))
; [eval] i >= 0
(push) ; 4
; [then-branch: 0 | i@3@01 >= 0 | live]
; [else-branch: 0 | !(i@3@01 >= 0) | live]
(push) ; 5
; [then-branch: 0 | i@3@01 >= 0]
(assert (>= i@3@01 0))
; [eval] i < |xs|
; [eval] |xs|
(push) ; 6
; [then-branch: 1 | i@3@01 < |xs@1@01| | live]
; [else-branch: 1 | !(i@3@01 < |xs@1@01|) | live]
(push) ; 7
; [then-branch: 1 | i@3@01 < |xs@1@01|]
(assert (< i@3@01 (Seq_length xs@1@01)))
; [eval] j >= 0
(push) ; 8
; [then-branch: 2 | j@4@01 >= 0 | live]
; [else-branch: 2 | !(j@4@01 >= 0) | live]
(push) ; 9
; [then-branch: 2 | j@4@01 >= 0]
(assert (>= j@4@01 0))
; [eval] j < |xs|
; [eval] |xs|
(push) ; 10
; [then-branch: 3 | j@4@01 < |xs@1@01| | live]
; [else-branch: 3 | !(j@4@01 < |xs@1@01|) | live]
(push) ; 11
; [then-branch: 3 | j@4@01 < |xs@1@01|]
(assert (< j@4@01 (Seq_length xs@1@01)))
; [eval] i != j
(pop) ; 11
(push) ; 11
; [else-branch: 3 | !(j@4@01 < |xs@1@01|)]
(assert (not (< j@4@01 (Seq_length xs@1@01))))
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or (not (< j@4@01 (Seq_length xs@1@01))) (< j@4@01 (Seq_length xs@1@01))))
(pop) ; 9
(push) ; 9
; [else-branch: 2 | !(j@4@01 >= 0)]
(assert (not (>= j@4@01 0)))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (=>
  (>= j@4@01 0)
  (and
    (>= j@4@01 0)
    (or (not (< j@4@01 (Seq_length xs@1@01))) (< j@4@01 (Seq_length xs@1@01))))))
; Joined path conditions
(assert (or (not (>= j@4@01 0)) (>= j@4@01 0)))
(pop) ; 7
(push) ; 7
; [else-branch: 1 | !(i@3@01 < |xs@1@01|)]
(assert (not (< i@3@01 (Seq_length xs@1@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (< i@3@01 (Seq_length xs@1@01))
  (and
    (< i@3@01 (Seq_length xs@1@01))
    (=>
      (>= j@4@01 0)
      (and
        (>= j@4@01 0)
        (or
          (not (< j@4@01 (Seq_length xs@1@01)))
          (< j@4@01 (Seq_length xs@1@01)))))
    (or (not (>= j@4@01 0)) (>= j@4@01 0)))))
; Joined path conditions
(assert (or (not (< i@3@01 (Seq_length xs@1@01))) (< i@3@01 (Seq_length xs@1@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 0 | !(i@3@01 >= 0)]
(assert (not (>= i@3@01 0)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (>= i@3@01 0)
  (and
    (>= i@3@01 0)
    (=>
      (< i@3@01 (Seq_length xs@1@01))
      (and
        (< i@3@01 (Seq_length xs@1@01))
        (=>
          (>= j@4@01 0)
          (and
            (>= j@4@01 0)
            (or
              (not (< j@4@01 (Seq_length xs@1@01)))
              (< j@4@01 (Seq_length xs@1@01)))))
        (or (not (>= j@4@01 0)) (>= j@4@01 0))))
    (or (not (< i@3@01 (Seq_length xs@1@01))) (< i@3@01 (Seq_length xs@1@01))))))
; Joined path conditions
(assert (or (not (>= i@3@01 0)) (>= i@3@01 0)))
(push) ; 4
; [then-branch: 4 | i@3@01 != j@4@01 && j@4@01 < |xs@1@01| && j@4@01 >= 0 && i@3@01 < |xs@1@01| && i@3@01 >= 0 | live]
; [else-branch: 4 | !(i@3@01 != j@4@01 && j@4@01 < |xs@1@01| && j@4@01 >= 0 && i@3@01 < |xs@1@01| && i@3@01 >= 0) | live]
(push) ; 5
; [then-branch: 4 | i@3@01 != j@4@01 && j@4@01 < |xs@1@01| && j@4@01 >= 0 && i@3@01 < |xs@1@01| && i@3@01 >= 0]
(assert (and
  (and
    (and
      (and (not (= i@3@01 j@4@01)) (< j@4@01 (Seq_length xs@1@01)))
      (>= j@4@01 0))
    (< i@3@01 (Seq_length xs@1@01)))
  (>= i@3@01 0)))
; [eval] xs[i] != xs[j]
; [eval] xs[i]
; [eval] xs[j]
(pop) ; 5
(push) ; 5
; [else-branch: 4 | !(i@3@01 != j@4@01 && j@4@01 < |xs@1@01| && j@4@01 >= 0 && i@3@01 < |xs@1@01| && i@3@01 >= 0)]
(assert (not
  (and
    (and
      (and
        (and (not (= i@3@01 j@4@01)) (< j@4@01 (Seq_length xs@1@01)))
        (>= j@4@01 0))
      (< i@3@01 (Seq_length xs@1@01)))
    (>= i@3@01 0))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (and
      (and
        (and (not (= i@3@01 j@4@01)) (< j@4@01 (Seq_length xs@1@01)))
        (>= j@4@01 0))
      (< i@3@01 (Seq_length xs@1@01)))
    (>= i@3@01 0))
  (and
    (not (= i@3@01 j@4@01))
    (< j@4@01 (Seq_length xs@1@01))
    (>= j@4@01 0)
    (< i@3@01 (Seq_length xs@1@01))
    (>= i@3@01 0))))
; Joined path conditions
(assert (or
  (not
    (and
      (and
        (and
          (and (not (= i@3@01 j@4@01)) (< j@4@01 (Seq_length xs@1@01)))
          (>= j@4@01 0))
        (< i@3@01 (Seq_length xs@1@01)))
      (>= i@3@01 0)))
  (and
    (and
      (and
        (and (not (= i@3@01 j@4@01)) (< j@4@01 (Seq_length xs@1@01)))
        (>= j@4@01 0))
      (< i@3@01 (Seq_length xs@1@01)))
    (>= i@3@01 0))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@3@01 Int) (j@4@01 Int)) (!
  (and
    (=>
      (>= i@3@01 0)
      (and
        (>= i@3@01 0)
        (=>
          (< i@3@01 (Seq_length xs@1@01))
          (and
            (< i@3@01 (Seq_length xs@1@01))
            (=>
              (>= j@4@01 0)
              (and
                (>= j@4@01 0)
                (or
                  (not (< j@4@01 (Seq_length xs@1@01)))
                  (< j@4@01 (Seq_length xs@1@01)))))
            (or (not (>= j@4@01 0)) (>= j@4@01 0))))
        (or
          (not (< i@3@01 (Seq_length xs@1@01)))
          (< i@3@01 (Seq_length xs@1@01)))))
    (or (not (>= i@3@01 0)) (>= i@3@01 0))
    (=>
      (and
        (and
          (and
            (and (not (= i@3@01 j@4@01)) (< j@4@01 (Seq_length xs@1@01)))
            (>= j@4@01 0))
          (< i@3@01 (Seq_length xs@1@01)))
        (>= i@3@01 0))
      (and
        (not (= i@3@01 j@4@01))
        (< j@4@01 (Seq_length xs@1@01))
        (>= j@4@01 0)
        (< i@3@01 (Seq_length xs@1@01))
        (>= i@3@01 0)))
    (or
      (not
        (and
          (and
            (and
              (and (not (= i@3@01 j@4@01)) (< j@4@01 (Seq_length xs@1@01)))
              (>= j@4@01 0))
            (< i@3@01 (Seq_length xs@1@01)))
          (>= i@3@01 0)))
      (and
        (and
          (and
            (and (not (= i@3@01 j@4@01)) (< j@4@01 (Seq_length xs@1@01)))
            (>= j@4@01 0))
          (< i@3@01 (Seq_length xs@1@01)))
        (>= i@3@01 0))))
  :pattern ((Seq_index xs@1@01 i@3@01) (Seq_index xs@1@01 j@4@01))
  :qid |prog.l13-aux|)))
(assert (forall ((i@3@01 Int) (j@4@01 Int)) (!
  (=>
    (and
      (and
        (and
          (and (not (= i@3@01 j@4@01)) (< j@4@01 (Seq_length xs@1@01)))
          (>= j@4@01 0))
        (< i@3@01 (Seq_length xs@1@01)))
      (>= i@3@01 0))
    (not (= (Seq_index xs@1@01 i@3@01) (Seq_index xs@1@01 j@4@01))))
  :pattern ((Seq_index xs@1@01 i@3@01) (Seq_index xs@1@01 j@4@01))
  :qid |prog.l13|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall i: Int ::0 <= i && i < |xs| ==> acc(xs[i].f, write))
(declare-const i@5@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i && i < |xs|
; [eval] 0 <= i
(push) ; 4
; [then-branch: 5 | 0 <= i@5@01 | live]
; [else-branch: 5 | !(0 <= i@5@01) | live]
(push) ; 5
; [then-branch: 5 | 0 <= i@5@01]
(assert (<= 0 i@5@01))
; [eval] i < |xs|
; [eval] |xs|
(pop) ; 5
(push) ; 5
; [else-branch: 5 | !(0 <= i@5@01)]
(assert (not (<= 0 i@5@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 i@5@01)) (<= 0 i@5@01)))
(assert (and (< i@5@01 (Seq_length xs@1@01)) (<= 0 i@5@01)))
; [eval] xs[i]
(push) ; 4
(assert (not (>= i@5@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
(declare-const $t@6@01 $FVF<f>)
(declare-fun inv@7@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@5@01 Int)) (!
  (=>
    (and (< i@5@01 (Seq_length xs@1@01)) (<= 0 i@5@01))
    (or (not (<= 0 i@5@01)) (<= 0 i@5@01)))
  :pattern ((Seq_index xs@1@01 i@5@01))
  :qid |f-aux|)))
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((i@5@01 Int)) (!
  (=>
    (and (< i@5@01 (Seq_length xs@1@01)) (<= 0 i@5@01))
    (= (inv@7@01 (Seq_index xs@1@01 i@5@01)) i@5@01))
  :pattern ((Seq_index xs@1@01 i@5@01))
  :qid |quant-u-69|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@7@01 r) (Seq_length xs@1@01)) (<= 0 (inv@7@01 r)))
    (= (Seq_index xs@1@01 (inv@7@01 r)) r))
  :pattern ((inv@7@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@5@01 Int)) (!
  (=>
    (and (< i@5@01 (Seq_length xs@1@01)) (<= 0 i@5@01))
    (not (= (Seq_index xs@1@01 i@5@01) $Ref.null)))
  :pattern ((Seq_index xs@1@01 i@5@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale |xs| > 3
(declare-const $t@8@01 $Snap)
(assert (= $t@8@01 $Snap.unit))
; [eval] |xs| > 3
; [eval] |xs|
(assert (> (Seq_length xs@1@01) 3))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale fun01(xs) == 5
(declare-const $t@9@01 $Snap)
(assert (= $t@9@01 $Snap.unit))
; [eval] fun01(xs) == 5
; [eval] fun01(xs)
(set-option :timeout 0)
(push) ; 3
; [eval] (forall i: Int, j: Int ::i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==> xs[i] != xs[j])
(declare-const i@10@01 Int)
(declare-const j@11@01 Int)
(push) ; 4
; [eval] i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==> xs[i] != xs[j]
; [eval] i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j)))
; [eval] i >= 0
(push) ; 5
; [then-branch: 6 | i@10@01 >= 0 | live]
; [else-branch: 6 | !(i@10@01 >= 0) | live]
(push) ; 6
; [then-branch: 6 | i@10@01 >= 0]
(assert (>= i@10@01 0))
; [eval] i < |xs|
; [eval] |xs|
(push) ; 7
; [then-branch: 7 | i@10@01 < |xs@1@01| | live]
; [else-branch: 7 | !(i@10@01 < |xs@1@01|) | live]
(push) ; 8
; [then-branch: 7 | i@10@01 < |xs@1@01|]
(assert (< i@10@01 (Seq_length xs@1@01)))
; [eval] j >= 0
(push) ; 9
; [then-branch: 8 | j@11@01 >= 0 | live]
; [else-branch: 8 | !(j@11@01 >= 0) | live]
(push) ; 10
; [then-branch: 8 | j@11@01 >= 0]
(assert (>= j@11@01 0))
; [eval] j < |xs|
; [eval] |xs|
(push) ; 11
; [then-branch: 9 | j@11@01 < |xs@1@01| | live]
; [else-branch: 9 | !(j@11@01 < |xs@1@01|) | live]
(push) ; 12
; [then-branch: 9 | j@11@01 < |xs@1@01|]
(assert (< j@11@01 (Seq_length xs@1@01)))
; [eval] i != j
(pop) ; 12
(push) ; 12
; [else-branch: 9 | !(j@11@01 < |xs@1@01|)]
(assert (not (< j@11@01 (Seq_length xs@1@01))))
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or (not (< j@11@01 (Seq_length xs@1@01))) (< j@11@01 (Seq_length xs@1@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 8 | !(j@11@01 >= 0)]
(assert (not (>= j@11@01 0)))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (=>
  (>= j@11@01 0)
  (and
    (>= j@11@01 0)
    (or (not (< j@11@01 (Seq_length xs@1@01))) (< j@11@01 (Seq_length xs@1@01))))))
; Joined path conditions
(assert (or (not (>= j@11@01 0)) (>= j@11@01 0)))
(pop) ; 8
(push) ; 8
; [else-branch: 7 | !(i@10@01 < |xs@1@01|)]
(assert (not (< i@10@01 (Seq_length xs@1@01))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (< i@10@01 (Seq_length xs@1@01))
  (and
    (< i@10@01 (Seq_length xs@1@01))
    (=>
      (>= j@11@01 0)
      (and
        (>= j@11@01 0)
        (or
          (not (< j@11@01 (Seq_length xs@1@01)))
          (< j@11@01 (Seq_length xs@1@01)))))
    (or (not (>= j@11@01 0)) (>= j@11@01 0)))))
; Joined path conditions
(assert (or (not (< i@10@01 (Seq_length xs@1@01))) (< i@10@01 (Seq_length xs@1@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 6 | !(i@10@01 >= 0)]
(assert (not (>= i@10@01 0)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (>= i@10@01 0)
  (and
    (>= i@10@01 0)
    (=>
      (< i@10@01 (Seq_length xs@1@01))
      (and
        (< i@10@01 (Seq_length xs@1@01))
        (=>
          (>= j@11@01 0)
          (and
            (>= j@11@01 0)
            (or
              (not (< j@11@01 (Seq_length xs@1@01)))
              (< j@11@01 (Seq_length xs@1@01)))))
        (or (not (>= j@11@01 0)) (>= j@11@01 0))))
    (or (not (< i@10@01 (Seq_length xs@1@01))) (< i@10@01 (Seq_length xs@1@01))))))
; Joined path conditions
(assert (or (not (>= i@10@01 0)) (>= i@10@01 0)))
(push) ; 5
; [then-branch: 10 | i@10@01 != j@11@01 && j@11@01 < |xs@1@01| && j@11@01 >= 0 && i@10@01 < |xs@1@01| && i@10@01 >= 0 | live]
; [else-branch: 10 | !(i@10@01 != j@11@01 && j@11@01 < |xs@1@01| && j@11@01 >= 0 && i@10@01 < |xs@1@01| && i@10@01 >= 0) | live]
(push) ; 6
; [then-branch: 10 | i@10@01 != j@11@01 && j@11@01 < |xs@1@01| && j@11@01 >= 0 && i@10@01 < |xs@1@01| && i@10@01 >= 0]
(assert (and
  (and
    (and
      (and (not (= i@10@01 j@11@01)) (< j@11@01 (Seq_length xs@1@01)))
      (>= j@11@01 0))
    (< i@10@01 (Seq_length xs@1@01)))
  (>= i@10@01 0)))
; [eval] xs[i] != xs[j]
; [eval] xs[i]
; [eval] xs[j]
(pop) ; 6
(push) ; 6
; [else-branch: 10 | !(i@10@01 != j@11@01 && j@11@01 < |xs@1@01| && j@11@01 >= 0 && i@10@01 < |xs@1@01| && i@10@01 >= 0)]
(assert (not
  (and
    (and
      (and
        (and (not (= i@10@01 j@11@01)) (< j@11@01 (Seq_length xs@1@01)))
        (>= j@11@01 0))
      (< i@10@01 (Seq_length xs@1@01)))
    (>= i@10@01 0))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (and
      (and
        (and (not (= i@10@01 j@11@01)) (< j@11@01 (Seq_length xs@1@01)))
        (>= j@11@01 0))
      (< i@10@01 (Seq_length xs@1@01)))
    (>= i@10@01 0))
  (and
    (not (= i@10@01 j@11@01))
    (< j@11@01 (Seq_length xs@1@01))
    (>= j@11@01 0)
    (< i@10@01 (Seq_length xs@1@01))
    (>= i@10@01 0))))
; Joined path conditions
(assert (or
  (not
    (and
      (and
        (and
          (and (not (= i@10@01 j@11@01)) (< j@11@01 (Seq_length xs@1@01)))
          (>= j@11@01 0))
        (< i@10@01 (Seq_length xs@1@01)))
      (>= i@10@01 0)))
  (and
    (and
      (and
        (and (not (= i@10@01 j@11@01)) (< j@11@01 (Seq_length xs@1@01)))
        (>= j@11@01 0))
      (< i@10@01 (Seq_length xs@1@01)))
    (>= i@10@01 0))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 4
(assert (not (forall ((i@10@01 Int) (j@11@01 Int)) (!
  (=>
    (and
      (and
        (and
          (and (not (= i@10@01 j@11@01)) (< j@11@01 (Seq_length xs@1@01)))
          (>= j@11@01 0))
        (< i@10@01 (Seq_length xs@1@01)))
      (>= i@10@01 0))
    (not (= (Seq_index xs@1@01 i@10@01) (Seq_index xs@1@01 j@11@01))))
  
  :qid |prog.l7|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (forall ((i@10@01 Int) (j@11@01 Int)) (!
  (=>
    (and
      (and
        (and
          (and (not (= i@10@01 j@11@01)) (< j@11@01 (Seq_length xs@1@01)))
          (>= j@11@01 0))
        (< i@10@01 (Seq_length xs@1@01)))
      (>= i@10@01 0))
    (not (= (Seq_index xs@1@01 i@10@01) (Seq_index xs@1@01 j@11@01))))
  
  :qid |prog.l7|)))
(declare-const i@12@01 Int)
(push) ; 4
; [eval] 0 <= i && i < |xs|
; [eval] 0 <= i
(push) ; 5
; [then-branch: 11 | 0 <= i@12@01 | live]
; [else-branch: 11 | !(0 <= i@12@01) | live]
(push) ; 6
; [then-branch: 11 | 0 <= i@12@01]
(assert (<= 0 i@12@01))
; [eval] i < |xs|
; [eval] |xs|
(pop) ; 6
(push) ; 6
; [else-branch: 11 | !(0 <= i@12@01)]
(assert (not (<= 0 i@12@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 i@12@01)) (<= 0 i@12@01)))
(assert (and (< i@12@01 (Seq_length xs@1@01)) (<= 0 i@12@01)))
; [eval] xs[i]
(push) ; 5
(assert (not (>= i@12@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@13@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@12@01 Int)) (!
  (=>
    (and (< i@12@01 (Seq_length xs@1@01)) (<= 0 i@12@01))
    (or (not (<= 0 i@12@01)) (<= 0 i@12@01)))
  :pattern ((Seq_index xs@1@01 i@12@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@12@01 Int) (i2@12@01 Int)) (!
  (=>
    (and
      (and (< i1@12@01 (Seq_length xs@1@01)) (<= 0 i1@12@01))
      (and (< i2@12@01 (Seq_length xs@1@01)) (<= 0 i2@12@01))
      (= (Seq_index xs@1@01 i1@12@01) (Seq_index xs@1@01 i2@12@01)))
    (= i1@12@01 i2@12@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@12@01 Int)) (!
  (=>
    (and (< i@12@01 (Seq_length xs@1@01)) (<= 0 i@12@01))
    (= (inv@13@01 (Seq_index xs@1@01 i@12@01)) i@12@01))
  :pattern ((Seq_index xs@1@01 i@12@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@13@01 r) (Seq_length xs@1@01)) (<= 0 (inv@13@01 r)))
    (= (Seq_index xs@1@01 (inv@13@01 r)) r))
  :pattern ((inv@13@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@14@01 ((r $Ref)) $Perm
  (ite
    (and (< (inv@13@01 r) (Seq_length xs@1@01)) (<= 0 (inv@13@01 r)))
    ($Perm.min
      (ite
        (and (< (inv@7@01 r) (Seq_length xs@1@01)) (<= 0 (inv@7@01 r)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (< (inv@7@01 r) (Seq_length xs@1@01)) (<= 0 (inv@7@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@14@01 r))
    $Perm.No)
  
  :qid |quant-u-72|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (< (inv@13@01 r) (Seq_length xs@1@01)) (<= 0 (inv@13@01 r)))
    (= (- $Perm.Write (pTaken@14@01 r)) $Perm.No))
  
  :qid |quant-u-73|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@15@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@15@01  $FVF<f>)))
      (and (< (inv@13@01 r) (Seq_length xs@1@01)) (<= 0 (inv@13@01 r))))
    (=>
      (and (< (inv@13@01 r) (Seq_length xs@1@01)) (<= 0 (inv@13@01 r)))
      (Set_in r ($FVF.domain_f (as sm@15@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@15@01  $FVF<f>))))
  :qid |qp.fvfDomDef1|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@13@01 r) (Seq_length xs@1@01)) (<= 0 (inv@13@01 r)))
      (and (< (inv@7@01 r) (Seq_length xs@1@01)) (<= 0 (inv@7@01 r))))
    (= ($FVF.lookup_f (as sm@15@01  $FVF<f>) r) ($FVF.lookup_f $t@6@01 r)))
  :pattern (($FVF.lookup_f (as sm@15@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@6@01 r))
  :qid |qp.fvfValDef0|)))
; [eval] |xs| > 3
; [eval] |xs|
(assert (fun01%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$FVF<f>To$Snap (as sm@15@01  $FVF<f>))
    $Snap.unit)) xs@1@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((i@12@01 Int)) (!
  (=>
    (and (< i@12@01 (Seq_length xs@1@01)) (<= 0 i@12@01))
    (= (inv@13@01 (Seq_index xs@1@01 i@12@01)) i@12@01))
  :pattern ((Seq_index xs@1@01 i@12@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@13@01 r) (Seq_length xs@1@01)) (<= 0 (inv@13@01 r)))
    (= (Seq_index xs@1@01 (inv@13@01 r)) r))
  :pattern ((inv@13@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@15@01  $FVF<f>)))
      (and (< (inv@13@01 r) (Seq_length xs@1@01)) (<= 0 (inv@13@01 r))))
    (=>
      (and (< (inv@13@01 r) (Seq_length xs@1@01)) (<= 0 (inv@13@01 r)))
      (Set_in r ($FVF.domain_f (as sm@15@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@15@01  $FVF<f>))))
  :qid |qp.fvfDomDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@13@01 r) (Seq_length xs@1@01)) (<= 0 (inv@13@01 r)))
      (and (< (inv@7@01 r) (Seq_length xs@1@01)) (<= 0 (inv@7@01 r))))
    (= ($FVF.lookup_f (as sm@15@01  $FVF<f>) r) ($FVF.lookup_f $t@6@01 r)))
  :pattern (($FVF.lookup_f (as sm@15@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@6@01 r))
  :qid |qp.fvfValDef0|)))
(assert (and
  (forall ((i@10@01 Int) (j@11@01 Int)) (!
    (=>
      (and
        (and
          (and
            (and (not (= i@10@01 j@11@01)) (< j@11@01 (Seq_length xs@1@01)))
            (>= j@11@01 0))
          (< i@10@01 (Seq_length xs@1@01)))
        (>= i@10@01 0))
      (not (= (Seq_index xs@1@01 i@10@01) (Seq_index xs@1@01 j@11@01))))
    
    :qid |prog.l7|))
  (forall ((i@12@01 Int)) (!
    (=>
      (and (< i@12@01 (Seq_length xs@1@01)) (<= 0 i@12@01))
      (or (not (<= 0 i@12@01)) (<= 0 i@12@01)))
    :pattern ((Seq_index xs@1@01 i@12@01))
    :qid |f-aux|))
  (fun01%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<f>To$Snap (as sm@15@01  $FVF<f>))
      $Snap.unit)) xs@1@01)))
(assert (=
  (fun01 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<f>To$Snap (as sm@15@01  $FVF<f>))
      $Snap.unit)) xs@1@01)
  5))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert fun01(xs) == 5
; [eval] fun01(xs) == 5
; [eval] fun01(xs)
(set-option :timeout 0)
(push) ; 3
; [eval] (forall i: Int, j: Int ::i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==> xs[i] != xs[j])
(declare-const i@16@01 Int)
(declare-const j@17@01 Int)
(push) ; 4
; [eval] i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==> xs[i] != xs[j]
; [eval] i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j)))
; [eval] i >= 0
(push) ; 5
; [then-branch: 12 | i@16@01 >= 0 | live]
; [else-branch: 12 | !(i@16@01 >= 0) | live]
(push) ; 6
; [then-branch: 12 | i@16@01 >= 0]
(assert (>= i@16@01 0))
; [eval] i < |xs|
; [eval] |xs|
(push) ; 7
; [then-branch: 13 | i@16@01 < |xs@1@01| | live]
; [else-branch: 13 | !(i@16@01 < |xs@1@01|) | live]
(push) ; 8
; [then-branch: 13 | i@16@01 < |xs@1@01|]
(assert (< i@16@01 (Seq_length xs@1@01)))
; [eval] j >= 0
(push) ; 9
; [then-branch: 14 | j@17@01 >= 0 | live]
; [else-branch: 14 | !(j@17@01 >= 0) | live]
(push) ; 10
; [then-branch: 14 | j@17@01 >= 0]
(assert (>= j@17@01 0))
; [eval] j < |xs|
; [eval] |xs|
(push) ; 11
; [then-branch: 15 | j@17@01 < |xs@1@01| | live]
; [else-branch: 15 | !(j@17@01 < |xs@1@01|) | live]
(push) ; 12
; [then-branch: 15 | j@17@01 < |xs@1@01|]
(assert (< j@17@01 (Seq_length xs@1@01)))
; [eval] i != j
(pop) ; 12
(push) ; 12
; [else-branch: 15 | !(j@17@01 < |xs@1@01|)]
(assert (not (< j@17@01 (Seq_length xs@1@01))))
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or (not (< j@17@01 (Seq_length xs@1@01))) (< j@17@01 (Seq_length xs@1@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 14 | !(j@17@01 >= 0)]
(assert (not (>= j@17@01 0)))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (=>
  (>= j@17@01 0)
  (and
    (>= j@17@01 0)
    (or (not (< j@17@01 (Seq_length xs@1@01))) (< j@17@01 (Seq_length xs@1@01))))))
; Joined path conditions
(assert (or (not (>= j@17@01 0)) (>= j@17@01 0)))
(pop) ; 8
(push) ; 8
; [else-branch: 13 | !(i@16@01 < |xs@1@01|)]
(assert (not (< i@16@01 (Seq_length xs@1@01))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (< i@16@01 (Seq_length xs@1@01))
  (and
    (< i@16@01 (Seq_length xs@1@01))
    (=>
      (>= j@17@01 0)
      (and
        (>= j@17@01 0)
        (or
          (not (< j@17@01 (Seq_length xs@1@01)))
          (< j@17@01 (Seq_length xs@1@01)))))
    (or (not (>= j@17@01 0)) (>= j@17@01 0)))))
; Joined path conditions
(assert (or (not (< i@16@01 (Seq_length xs@1@01))) (< i@16@01 (Seq_length xs@1@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 12 | !(i@16@01 >= 0)]
(assert (not (>= i@16@01 0)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (>= i@16@01 0)
  (and
    (>= i@16@01 0)
    (=>
      (< i@16@01 (Seq_length xs@1@01))
      (and
        (< i@16@01 (Seq_length xs@1@01))
        (=>
          (>= j@17@01 0)
          (and
            (>= j@17@01 0)
            (or
              (not (< j@17@01 (Seq_length xs@1@01)))
              (< j@17@01 (Seq_length xs@1@01)))))
        (or (not (>= j@17@01 0)) (>= j@17@01 0))))
    (or (not (< i@16@01 (Seq_length xs@1@01))) (< i@16@01 (Seq_length xs@1@01))))))
; Joined path conditions
(assert (or (not (>= i@16@01 0)) (>= i@16@01 0)))
(push) ; 5
; [then-branch: 16 | i@16@01 != j@17@01 && j@17@01 < |xs@1@01| && j@17@01 >= 0 && i@16@01 < |xs@1@01| && i@16@01 >= 0 | live]
; [else-branch: 16 | !(i@16@01 != j@17@01 && j@17@01 < |xs@1@01| && j@17@01 >= 0 && i@16@01 < |xs@1@01| && i@16@01 >= 0) | live]
(push) ; 6
; [then-branch: 16 | i@16@01 != j@17@01 && j@17@01 < |xs@1@01| && j@17@01 >= 0 && i@16@01 < |xs@1@01| && i@16@01 >= 0]
(assert (and
  (and
    (and
      (and (not (= i@16@01 j@17@01)) (< j@17@01 (Seq_length xs@1@01)))
      (>= j@17@01 0))
    (< i@16@01 (Seq_length xs@1@01)))
  (>= i@16@01 0)))
; [eval] xs[i] != xs[j]
; [eval] xs[i]
; [eval] xs[j]
(pop) ; 6
(push) ; 6
; [else-branch: 16 | !(i@16@01 != j@17@01 && j@17@01 < |xs@1@01| && j@17@01 >= 0 && i@16@01 < |xs@1@01| && i@16@01 >= 0)]
(assert (not
  (and
    (and
      (and
        (and (not (= i@16@01 j@17@01)) (< j@17@01 (Seq_length xs@1@01)))
        (>= j@17@01 0))
      (< i@16@01 (Seq_length xs@1@01)))
    (>= i@16@01 0))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (and
      (and
        (and (not (= i@16@01 j@17@01)) (< j@17@01 (Seq_length xs@1@01)))
        (>= j@17@01 0))
      (< i@16@01 (Seq_length xs@1@01)))
    (>= i@16@01 0))
  (and
    (not (= i@16@01 j@17@01))
    (< j@17@01 (Seq_length xs@1@01))
    (>= j@17@01 0)
    (< i@16@01 (Seq_length xs@1@01))
    (>= i@16@01 0))))
; Joined path conditions
(assert (or
  (not
    (and
      (and
        (and
          (and (not (= i@16@01 j@17@01)) (< j@17@01 (Seq_length xs@1@01)))
          (>= j@17@01 0))
        (< i@16@01 (Seq_length xs@1@01)))
      (>= i@16@01 0)))
  (and
    (and
      (and
        (and (not (= i@16@01 j@17@01)) (< j@17@01 (Seq_length xs@1@01)))
        (>= j@17@01 0))
      (< i@16@01 (Seq_length xs@1@01)))
    (>= i@16@01 0))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 4
(assert (not (forall ((i@16@01 Int) (j@17@01 Int)) (!
  (=>
    (and
      (and
        (and
          (and (not (= i@16@01 j@17@01)) (< j@17@01 (Seq_length xs@1@01)))
          (>= j@17@01 0))
        (< i@16@01 (Seq_length xs@1@01)))
      (>= i@16@01 0))
    (not (= (Seq_index xs@1@01 i@16@01) (Seq_index xs@1@01 j@17@01))))
  
  :qid |prog.l7|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (forall ((i@16@01 Int) (j@17@01 Int)) (!
  (=>
    (and
      (and
        (and
          (and (not (= i@16@01 j@17@01)) (< j@17@01 (Seq_length xs@1@01)))
          (>= j@17@01 0))
        (< i@16@01 (Seq_length xs@1@01)))
      (>= i@16@01 0))
    (not (= (Seq_index xs@1@01 i@16@01) (Seq_index xs@1@01 j@17@01))))
  
  :qid |prog.l7|)))
(declare-const i@18@01 Int)
(push) ; 4
; [eval] 0 <= i && i < |xs|
; [eval] 0 <= i
(push) ; 5
; [then-branch: 17 | 0 <= i@18@01 | live]
; [else-branch: 17 | !(0 <= i@18@01) | live]
(push) ; 6
; [then-branch: 17 | 0 <= i@18@01]
(assert (<= 0 i@18@01))
; [eval] i < |xs|
; [eval] |xs|
(pop) ; 6
(push) ; 6
; [else-branch: 17 | !(0 <= i@18@01)]
(assert (not (<= 0 i@18@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 i@18@01)) (<= 0 i@18@01)))
(assert (and (< i@18@01 (Seq_length xs@1@01)) (<= 0 i@18@01)))
; [eval] xs[i]
(push) ; 5
(assert (not (>= i@18@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@19@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@18@01 Int)) (!
  (=>
    (and (< i@18@01 (Seq_length xs@1@01)) (<= 0 i@18@01))
    (or (not (<= 0 i@18@01)) (<= 0 i@18@01)))
  :pattern ((Seq_index xs@1@01 i@18@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@18@01 Int) (i2@18@01 Int)) (!
  (=>
    (and
      (and (< i1@18@01 (Seq_length xs@1@01)) (<= 0 i1@18@01))
      (and (< i2@18@01 (Seq_length xs@1@01)) (<= 0 i2@18@01))
      (= (Seq_index xs@1@01 i1@18@01) (Seq_index xs@1@01 i2@18@01)))
    (= i1@18@01 i2@18@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@18@01 Int)) (!
  (=>
    (and (< i@18@01 (Seq_length xs@1@01)) (<= 0 i@18@01))
    (= (inv@19@01 (Seq_index xs@1@01 i@18@01)) i@18@01))
  :pattern ((Seq_index xs@1@01 i@18@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@19@01 r) (Seq_length xs@1@01)) (<= 0 (inv@19@01 r)))
    (= (Seq_index xs@1@01 (inv@19@01 r)) r))
  :pattern ((inv@19@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@20@01 ((r $Ref)) $Perm
  (ite
    (and (< (inv@19@01 r) (Seq_length xs@1@01)) (<= 0 (inv@19@01 r)))
    ($Perm.min
      (ite
        (and (< (inv@7@01 r) (Seq_length xs@1@01)) (<= 0 (inv@7@01 r)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (< (inv@7@01 r) (Seq_length xs@1@01)) (<= 0 (inv@7@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@20@01 r))
    $Perm.No)
  
  :qid |quant-u-76|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (< (inv@19@01 r) (Seq_length xs@1@01)) (<= 0 (inv@19@01 r)))
    (= (- $Perm.Write (pTaken@20@01 r)) $Perm.No))
  
  :qid |quant-u-77|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@21@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@21@01  $FVF<f>)))
      (and (< (inv@19@01 r) (Seq_length xs@1@01)) (<= 0 (inv@19@01 r))))
    (=>
      (and (< (inv@19@01 r) (Seq_length xs@1@01)) (<= 0 (inv@19@01 r)))
      (Set_in r ($FVF.domain_f (as sm@21@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@21@01  $FVF<f>))))
  :qid |qp.fvfDomDef3|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@19@01 r) (Seq_length xs@1@01)) (<= 0 (inv@19@01 r)))
      (and (< (inv@7@01 r) (Seq_length xs@1@01)) (<= 0 (inv@7@01 r))))
    (= ($FVF.lookup_f (as sm@21@01  $FVF<f>) r) ($FVF.lookup_f $t@6@01 r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@6@01 r))
  :qid |qp.fvfValDef2|)))
; [eval] |xs| > 3
; [eval] |xs|
(assert (fun01%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$FVF<f>To$Snap (as sm@21@01  $FVF<f>))
    $Snap.unit)) xs@1@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((i@18@01 Int)) (!
  (=>
    (and (< i@18@01 (Seq_length xs@1@01)) (<= 0 i@18@01))
    (= (inv@19@01 (Seq_index xs@1@01 i@18@01)) i@18@01))
  :pattern ((Seq_index xs@1@01 i@18@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@19@01 r) (Seq_length xs@1@01)) (<= 0 (inv@19@01 r)))
    (= (Seq_index xs@1@01 (inv@19@01 r)) r))
  :pattern ((inv@19@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@21@01  $FVF<f>)))
      (and (< (inv@19@01 r) (Seq_length xs@1@01)) (<= 0 (inv@19@01 r))))
    (=>
      (and (< (inv@19@01 r) (Seq_length xs@1@01)) (<= 0 (inv@19@01 r)))
      (Set_in r ($FVF.domain_f (as sm@21@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@21@01  $FVF<f>))))
  :qid |qp.fvfDomDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@19@01 r) (Seq_length xs@1@01)) (<= 0 (inv@19@01 r)))
      (and (< (inv@7@01 r) (Seq_length xs@1@01)) (<= 0 (inv@7@01 r))))
    (= ($FVF.lookup_f (as sm@21@01  $FVF<f>) r) ($FVF.lookup_f $t@6@01 r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@6@01 r))
  :qid |qp.fvfValDef2|)))
(assert (and
  (forall ((i@16@01 Int) (j@17@01 Int)) (!
    (=>
      (and
        (and
          (and
            (and (not (= i@16@01 j@17@01)) (< j@17@01 (Seq_length xs@1@01)))
            (>= j@17@01 0))
          (< i@16@01 (Seq_length xs@1@01)))
        (>= i@16@01 0))
      (not (= (Seq_index xs@1@01 i@16@01) (Seq_index xs@1@01 j@17@01))))
    
    :qid |prog.l7|))
  (forall ((i@18@01 Int)) (!
    (=>
      (and (< i@18@01 (Seq_length xs@1@01)) (<= 0 i@18@01))
      (or (not (<= 0 i@18@01)) (<= 0 i@18@01)))
    :pattern ((Seq_index xs@1@01 i@18@01))
    :qid |f-aux|))
  (fun01%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<f>To$Snap (as sm@21@01  $FVF<f>))
      $Snap.unit)) xs@1@01)))
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  (fun01 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<f>To$Snap (as sm@21@01  $FVF<f>))
      $Snap.unit)) xs@1@01)
  5)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (=
  (fun01 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<f>To$Snap (as sm@21@01  $FVF<f>))
      $Snap.unit)) xs@1@01)
  5))
(pop) ; 2
(pop) ; 1
; ---------- test02 ----------
(declare-const xs@22@01 Seq<$Ref>)
(declare-const xs@23@01 Seq<$Ref>)
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
; inhale (forall i: Int, j: Int ::
;     { xs[i], xs[j] }
;     i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==>
;     xs[i] != xs[j])
(declare-const $t@24@01 $Snap)
(assert (= $t@24@01 $Snap.unit))
; [eval] (forall i: Int, j: Int :: { xs[i], xs[j] } i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==> xs[i] != xs[j])
(declare-const i@25@01 Int)
(declare-const j@26@01 Int)
(push) ; 3
; [eval] i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==> xs[i] != xs[j]
; [eval] i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j)))
; [eval] i >= 0
(push) ; 4
; [then-branch: 18 | i@25@01 >= 0 | live]
; [else-branch: 18 | !(i@25@01 >= 0) | live]
(push) ; 5
; [then-branch: 18 | i@25@01 >= 0]
(assert (>= i@25@01 0))
; [eval] i < |xs|
; [eval] |xs|
(push) ; 6
; [then-branch: 19 | i@25@01 < |xs@23@01| | live]
; [else-branch: 19 | !(i@25@01 < |xs@23@01|) | live]
(push) ; 7
; [then-branch: 19 | i@25@01 < |xs@23@01|]
(assert (< i@25@01 (Seq_length xs@23@01)))
; [eval] j >= 0
(push) ; 8
; [then-branch: 20 | j@26@01 >= 0 | live]
; [else-branch: 20 | !(j@26@01 >= 0) | live]
(push) ; 9
; [then-branch: 20 | j@26@01 >= 0]
(assert (>= j@26@01 0))
; [eval] j < |xs|
; [eval] |xs|
(push) ; 10
; [then-branch: 21 | j@26@01 < |xs@23@01| | live]
; [else-branch: 21 | !(j@26@01 < |xs@23@01|) | live]
(push) ; 11
; [then-branch: 21 | j@26@01 < |xs@23@01|]
(assert (< j@26@01 (Seq_length xs@23@01)))
; [eval] i != j
(pop) ; 11
(push) ; 11
; [else-branch: 21 | !(j@26@01 < |xs@23@01|)]
(assert (not (< j@26@01 (Seq_length xs@23@01))))
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or (not (< j@26@01 (Seq_length xs@23@01))) (< j@26@01 (Seq_length xs@23@01))))
(pop) ; 9
(push) ; 9
; [else-branch: 20 | !(j@26@01 >= 0)]
(assert (not (>= j@26@01 0)))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (=>
  (>= j@26@01 0)
  (and
    (>= j@26@01 0)
    (or
      (not (< j@26@01 (Seq_length xs@23@01)))
      (< j@26@01 (Seq_length xs@23@01))))))
; Joined path conditions
(assert (or (not (>= j@26@01 0)) (>= j@26@01 0)))
(pop) ; 7
(push) ; 7
; [else-branch: 19 | !(i@25@01 < |xs@23@01|)]
(assert (not (< i@25@01 (Seq_length xs@23@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (< i@25@01 (Seq_length xs@23@01))
  (and
    (< i@25@01 (Seq_length xs@23@01))
    (=>
      (>= j@26@01 0)
      (and
        (>= j@26@01 0)
        (or
          (not (< j@26@01 (Seq_length xs@23@01)))
          (< j@26@01 (Seq_length xs@23@01)))))
    (or (not (>= j@26@01 0)) (>= j@26@01 0)))))
; Joined path conditions
(assert (or (not (< i@25@01 (Seq_length xs@23@01))) (< i@25@01 (Seq_length xs@23@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 18 | !(i@25@01 >= 0)]
(assert (not (>= i@25@01 0)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (>= i@25@01 0)
  (and
    (>= i@25@01 0)
    (=>
      (< i@25@01 (Seq_length xs@23@01))
      (and
        (< i@25@01 (Seq_length xs@23@01))
        (=>
          (>= j@26@01 0)
          (and
            (>= j@26@01 0)
            (or
              (not (< j@26@01 (Seq_length xs@23@01)))
              (< j@26@01 (Seq_length xs@23@01)))))
        (or (not (>= j@26@01 0)) (>= j@26@01 0))))
    (or
      (not (< i@25@01 (Seq_length xs@23@01)))
      (< i@25@01 (Seq_length xs@23@01))))))
; Joined path conditions
(assert (or (not (>= i@25@01 0)) (>= i@25@01 0)))
(push) ; 4
; [then-branch: 22 | i@25@01 != j@26@01 && j@26@01 < |xs@23@01| && j@26@01 >= 0 && i@25@01 < |xs@23@01| && i@25@01 >= 0 | live]
; [else-branch: 22 | !(i@25@01 != j@26@01 && j@26@01 < |xs@23@01| && j@26@01 >= 0 && i@25@01 < |xs@23@01| && i@25@01 >= 0) | live]
(push) ; 5
; [then-branch: 22 | i@25@01 != j@26@01 && j@26@01 < |xs@23@01| && j@26@01 >= 0 && i@25@01 < |xs@23@01| && i@25@01 >= 0]
(assert (and
  (and
    (and
      (and (not (= i@25@01 j@26@01)) (< j@26@01 (Seq_length xs@23@01)))
      (>= j@26@01 0))
    (< i@25@01 (Seq_length xs@23@01)))
  (>= i@25@01 0)))
; [eval] xs[i] != xs[j]
; [eval] xs[i]
; [eval] xs[j]
(pop) ; 5
(push) ; 5
; [else-branch: 22 | !(i@25@01 != j@26@01 && j@26@01 < |xs@23@01| && j@26@01 >= 0 && i@25@01 < |xs@23@01| && i@25@01 >= 0)]
(assert (not
  (and
    (and
      (and
        (and (not (= i@25@01 j@26@01)) (< j@26@01 (Seq_length xs@23@01)))
        (>= j@26@01 0))
      (< i@25@01 (Seq_length xs@23@01)))
    (>= i@25@01 0))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (and
      (and
        (and (not (= i@25@01 j@26@01)) (< j@26@01 (Seq_length xs@23@01)))
        (>= j@26@01 0))
      (< i@25@01 (Seq_length xs@23@01)))
    (>= i@25@01 0))
  (and
    (not (= i@25@01 j@26@01))
    (< j@26@01 (Seq_length xs@23@01))
    (>= j@26@01 0)
    (< i@25@01 (Seq_length xs@23@01))
    (>= i@25@01 0))))
; Joined path conditions
(assert (or
  (not
    (and
      (and
        (and
          (and (not (= i@25@01 j@26@01)) (< j@26@01 (Seq_length xs@23@01)))
          (>= j@26@01 0))
        (< i@25@01 (Seq_length xs@23@01)))
      (>= i@25@01 0)))
  (and
    (and
      (and
        (and (not (= i@25@01 j@26@01)) (< j@26@01 (Seq_length xs@23@01)))
        (>= j@26@01 0))
      (< i@25@01 (Seq_length xs@23@01)))
    (>= i@25@01 0))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@25@01 Int) (j@26@01 Int)) (!
  (and
    (=>
      (>= i@25@01 0)
      (and
        (>= i@25@01 0)
        (=>
          (< i@25@01 (Seq_length xs@23@01))
          (and
            (< i@25@01 (Seq_length xs@23@01))
            (=>
              (>= j@26@01 0)
              (and
                (>= j@26@01 0)
                (or
                  (not (< j@26@01 (Seq_length xs@23@01)))
                  (< j@26@01 (Seq_length xs@23@01)))))
            (or (not (>= j@26@01 0)) (>= j@26@01 0))))
        (or
          (not (< i@25@01 (Seq_length xs@23@01)))
          (< i@25@01 (Seq_length xs@23@01)))))
    (or (not (>= i@25@01 0)) (>= i@25@01 0))
    (=>
      (and
        (and
          (and
            (and (not (= i@25@01 j@26@01)) (< j@26@01 (Seq_length xs@23@01)))
            (>= j@26@01 0))
          (< i@25@01 (Seq_length xs@23@01)))
        (>= i@25@01 0))
      (and
        (not (= i@25@01 j@26@01))
        (< j@26@01 (Seq_length xs@23@01))
        (>= j@26@01 0)
        (< i@25@01 (Seq_length xs@23@01))
        (>= i@25@01 0)))
    (or
      (not
        (and
          (and
            (and
              (and (not (= i@25@01 j@26@01)) (< j@26@01 (Seq_length xs@23@01)))
              (>= j@26@01 0))
            (< i@25@01 (Seq_length xs@23@01)))
          (>= i@25@01 0)))
      (and
        (and
          (and
            (and (not (= i@25@01 j@26@01)) (< j@26@01 (Seq_length xs@23@01)))
            (>= j@26@01 0))
          (< i@25@01 (Seq_length xs@23@01)))
        (>= i@25@01 0))))
  :pattern ((Seq_index xs@23@01 i@25@01) (Seq_index xs@23@01 j@26@01))
  :qid |prog.l28-aux|)))
(assert (forall ((i@25@01 Int) (j@26@01 Int)) (!
  (=>
    (and
      (and
        (and
          (and (not (= i@25@01 j@26@01)) (< j@26@01 (Seq_length xs@23@01)))
          (>= j@26@01 0))
        (< i@25@01 (Seq_length xs@23@01)))
      (>= i@25@01 0))
    (not (= (Seq_index xs@23@01 i@25@01) (Seq_index xs@23@01 j@26@01))))
  :pattern ((Seq_index xs@23@01 i@25@01) (Seq_index xs@23@01 j@26@01))
  :qid |prog.l28|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall i: Int ::0 <= i && i < |xs| ==> acc(xs[i].f, write))
(declare-const i@27@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i && i < |xs|
; [eval] 0 <= i
(push) ; 4
; [then-branch: 23 | 0 <= i@27@01 | live]
; [else-branch: 23 | !(0 <= i@27@01) | live]
(push) ; 5
; [then-branch: 23 | 0 <= i@27@01]
(assert (<= 0 i@27@01))
; [eval] i < |xs|
; [eval] |xs|
(pop) ; 5
(push) ; 5
; [else-branch: 23 | !(0 <= i@27@01)]
(assert (not (<= 0 i@27@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 i@27@01)) (<= 0 i@27@01)))
(assert (and (< i@27@01 (Seq_length xs@23@01)) (<= 0 i@27@01)))
; [eval] xs[i]
(push) ; 4
(assert (not (>= i@27@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
(declare-const $t@28@01 $FVF<f>)
(declare-fun inv@29@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@27@01 Int)) (!
  (=>
    (and (< i@27@01 (Seq_length xs@23@01)) (<= 0 i@27@01))
    (or (not (<= 0 i@27@01)) (<= 0 i@27@01)))
  :pattern ((Seq_index xs@23@01 i@27@01))
  :qid |f-aux|)))
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((i@27@01 Int)) (!
  (=>
    (and (< i@27@01 (Seq_length xs@23@01)) (<= 0 i@27@01))
    (= (inv@29@01 (Seq_index xs@23@01 i@27@01)) i@27@01))
  :pattern ((Seq_index xs@23@01 i@27@01))
  :qid |quant-u-79|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
    (= (Seq_index xs@23@01 (inv@29@01 r)) r))
  :pattern ((inv@29@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@27@01 Int)) (!
  (=>
    (and (< i@27@01 (Seq_length xs@23@01)) (<= 0 i@27@01))
    (not (= (Seq_index xs@23@01 i@27@01) $Ref.null)))
  :pattern ((Seq_index xs@23@01 i@27@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale |xs| > 3
(declare-const $t@30@01 $Snap)
(assert (= $t@30@01 $Snap.unit))
; [eval] |xs| > 3
; [eval] |xs|
(assert (> (Seq_length xs@23@01) 3))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; xs[0].f := 3
; [eval] xs[0]
(set-option :timeout 0)
(push) ; 3
(assert (not (< 0 (Seq_length xs@23@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@31@01 ((r $Ref)) $Perm
  (ite
    (= r (Seq_index xs@23@01 0))
    ($Perm.min
      (ite
        (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@31@01 r))
    $Perm.No)
  
  :qid |quant-u-81|))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=> (= r (Seq_index xs@23@01 0)) (= (- $Perm.Write (pTaken@31@01 r)) $Perm.No))
  
  :qid |quant-u-82|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@32@01 $FVF<f>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_f (as sm@32@01  $FVF<f>) (Seq_index xs@23@01 0)) 3))
; [exec]
; xs[1].f := 7
; [eval] xs[1]
(set-option :timeout 0)
(push) ; 3
(assert (not (< 1 (Seq_length xs@23@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@33@01 ((r $Ref)) $Perm
  (ite
    (= r (Seq_index xs@23@01 1))
    ($Perm.min
      (-
        (ite
          (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
          $Perm.Write
          $Perm.No)
        (pTaken@31@01 r))
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@34@01 ((r $Ref)) $Perm
  (ite
    (= r (Seq_index xs@23@01 1))
    ($Perm.min
      (ite (= r (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@33@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (-
        (ite
          (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
          $Perm.Write
          $Perm.No)
        (pTaken@31@01 r))
      (pTaken@33@01 r))
    $Perm.No)
  
  :qid |quant-u-84|))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=> (= r (Seq_index xs@23@01 1)) (= (- $Perm.Write (pTaken@33@01 r)) $Perm.No))
  
  :qid |quant-u-85|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@35@01 $FVF<f>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_f (as sm@35@01  $FVF<f>) (Seq_index xs@23@01 1)) 7))
; [exec]
; assert fun02(xs) == 10
; [eval] fun02(xs) == 10
; [eval] fun02(xs)
(set-option :timeout 0)
(push) ; 3
; [eval] (forall i: Int, j: Int ::i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==> xs[i] != xs[j])
(declare-const i@36@01 Int)
(declare-const j@37@01 Int)
(push) ; 4
; [eval] i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==> xs[i] != xs[j]
; [eval] i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j)))
; [eval] i >= 0
(push) ; 5
; [then-branch: 24 | i@36@01 >= 0 | live]
; [else-branch: 24 | !(i@36@01 >= 0) | live]
(push) ; 6
; [then-branch: 24 | i@36@01 >= 0]
(assert (>= i@36@01 0))
; [eval] i < |xs|
; [eval] |xs|
(push) ; 7
; [then-branch: 25 | i@36@01 < |xs@23@01| | live]
; [else-branch: 25 | !(i@36@01 < |xs@23@01|) | live]
(push) ; 8
; [then-branch: 25 | i@36@01 < |xs@23@01|]
(assert (< i@36@01 (Seq_length xs@23@01)))
; [eval] j >= 0
(push) ; 9
; [then-branch: 26 | j@37@01 >= 0 | live]
; [else-branch: 26 | !(j@37@01 >= 0) | live]
(push) ; 10
; [then-branch: 26 | j@37@01 >= 0]
(assert (>= j@37@01 0))
; [eval] j < |xs|
; [eval] |xs|
(push) ; 11
; [then-branch: 27 | j@37@01 < |xs@23@01| | live]
; [else-branch: 27 | !(j@37@01 < |xs@23@01|) | live]
(push) ; 12
; [then-branch: 27 | j@37@01 < |xs@23@01|]
(assert (< j@37@01 (Seq_length xs@23@01)))
; [eval] i != j
(pop) ; 12
(push) ; 12
; [else-branch: 27 | !(j@37@01 < |xs@23@01|)]
(assert (not (< j@37@01 (Seq_length xs@23@01))))
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or (not (< j@37@01 (Seq_length xs@23@01))) (< j@37@01 (Seq_length xs@23@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 26 | !(j@37@01 >= 0)]
(assert (not (>= j@37@01 0)))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (=>
  (>= j@37@01 0)
  (and
    (>= j@37@01 0)
    (or
      (not (< j@37@01 (Seq_length xs@23@01)))
      (< j@37@01 (Seq_length xs@23@01))))))
; Joined path conditions
(assert (or (not (>= j@37@01 0)) (>= j@37@01 0)))
(pop) ; 8
(push) ; 8
; [else-branch: 25 | !(i@36@01 < |xs@23@01|)]
(assert (not (< i@36@01 (Seq_length xs@23@01))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (< i@36@01 (Seq_length xs@23@01))
  (and
    (< i@36@01 (Seq_length xs@23@01))
    (=>
      (>= j@37@01 0)
      (and
        (>= j@37@01 0)
        (or
          (not (< j@37@01 (Seq_length xs@23@01)))
          (< j@37@01 (Seq_length xs@23@01)))))
    (or (not (>= j@37@01 0)) (>= j@37@01 0)))))
; Joined path conditions
(assert (or (not (< i@36@01 (Seq_length xs@23@01))) (< i@36@01 (Seq_length xs@23@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 24 | !(i@36@01 >= 0)]
(assert (not (>= i@36@01 0)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (>= i@36@01 0)
  (and
    (>= i@36@01 0)
    (=>
      (< i@36@01 (Seq_length xs@23@01))
      (and
        (< i@36@01 (Seq_length xs@23@01))
        (=>
          (>= j@37@01 0)
          (and
            (>= j@37@01 0)
            (or
              (not (< j@37@01 (Seq_length xs@23@01)))
              (< j@37@01 (Seq_length xs@23@01)))))
        (or (not (>= j@37@01 0)) (>= j@37@01 0))))
    (or
      (not (< i@36@01 (Seq_length xs@23@01)))
      (< i@36@01 (Seq_length xs@23@01))))))
; Joined path conditions
(assert (or (not (>= i@36@01 0)) (>= i@36@01 0)))
(push) ; 5
; [then-branch: 28 | i@36@01 != j@37@01 && j@37@01 < |xs@23@01| && j@37@01 >= 0 && i@36@01 < |xs@23@01| && i@36@01 >= 0 | live]
; [else-branch: 28 | !(i@36@01 != j@37@01 && j@37@01 < |xs@23@01| && j@37@01 >= 0 && i@36@01 < |xs@23@01| && i@36@01 >= 0) | live]
(push) ; 6
; [then-branch: 28 | i@36@01 != j@37@01 && j@37@01 < |xs@23@01| && j@37@01 >= 0 && i@36@01 < |xs@23@01| && i@36@01 >= 0]
(assert (and
  (and
    (and
      (and (not (= i@36@01 j@37@01)) (< j@37@01 (Seq_length xs@23@01)))
      (>= j@37@01 0))
    (< i@36@01 (Seq_length xs@23@01)))
  (>= i@36@01 0)))
; [eval] xs[i] != xs[j]
; [eval] xs[i]
; [eval] xs[j]
(pop) ; 6
(push) ; 6
; [else-branch: 28 | !(i@36@01 != j@37@01 && j@37@01 < |xs@23@01| && j@37@01 >= 0 && i@36@01 < |xs@23@01| && i@36@01 >= 0)]
(assert (not
  (and
    (and
      (and
        (and (not (= i@36@01 j@37@01)) (< j@37@01 (Seq_length xs@23@01)))
        (>= j@37@01 0))
      (< i@36@01 (Seq_length xs@23@01)))
    (>= i@36@01 0))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (and
      (and
        (and (not (= i@36@01 j@37@01)) (< j@37@01 (Seq_length xs@23@01)))
        (>= j@37@01 0))
      (< i@36@01 (Seq_length xs@23@01)))
    (>= i@36@01 0))
  (and
    (not (= i@36@01 j@37@01))
    (< j@37@01 (Seq_length xs@23@01))
    (>= j@37@01 0)
    (< i@36@01 (Seq_length xs@23@01))
    (>= i@36@01 0))))
; Joined path conditions
(assert (or
  (not
    (and
      (and
        (and
          (and (not (= i@36@01 j@37@01)) (< j@37@01 (Seq_length xs@23@01)))
          (>= j@37@01 0))
        (< i@36@01 (Seq_length xs@23@01)))
      (>= i@36@01 0)))
  (and
    (and
      (and
        (and (not (= i@36@01 j@37@01)) (< j@37@01 (Seq_length xs@23@01)))
        (>= j@37@01 0))
      (< i@36@01 (Seq_length xs@23@01)))
    (>= i@36@01 0))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 4
(assert (not (forall ((i@36@01 Int) (j@37@01 Int)) (!
  (=>
    (and
      (and
        (and
          (and (not (= i@36@01 j@37@01)) (< j@37@01 (Seq_length xs@23@01)))
          (>= j@37@01 0))
        (< i@36@01 (Seq_length xs@23@01)))
      (>= i@36@01 0))
    (not (= (Seq_index xs@23@01 i@36@01) (Seq_index xs@23@01 j@37@01))))
  
  :qid |prog.l22|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (forall ((i@36@01 Int) (j@37@01 Int)) (!
  (=>
    (and
      (and
        (and
          (and (not (= i@36@01 j@37@01)) (< j@37@01 (Seq_length xs@23@01)))
          (>= j@37@01 0))
        (< i@36@01 (Seq_length xs@23@01)))
      (>= i@36@01 0))
    (not (= (Seq_index xs@23@01 i@36@01) (Seq_index xs@23@01 j@37@01))))
  
  :qid |prog.l22|)))
(declare-const i@38@01 Int)
(push) ; 4
; [eval] 0 <= i && i < |xs|
; [eval] 0 <= i
(push) ; 5
; [then-branch: 29 | 0 <= i@38@01 | live]
; [else-branch: 29 | !(0 <= i@38@01) | live]
(push) ; 6
; [then-branch: 29 | 0 <= i@38@01]
(assert (<= 0 i@38@01))
; [eval] i < |xs|
; [eval] |xs|
(pop) ; 6
(push) ; 6
; [else-branch: 29 | !(0 <= i@38@01)]
(assert (not (<= 0 i@38@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 i@38@01)) (<= 0 i@38@01)))
(assert (and (< i@38@01 (Seq_length xs@23@01)) (<= 0 i@38@01)))
; [eval] xs[i]
(push) ; 5
(assert (not (>= i@38@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@39@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@38@01 Int)) (!
  (=>
    (and (< i@38@01 (Seq_length xs@23@01)) (<= 0 i@38@01))
    (or (not (<= 0 i@38@01)) (<= 0 i@38@01)))
  :pattern ((Seq_index xs@23@01 i@38@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@38@01 Int) (i2@38@01 Int)) (!
  (=>
    (and
      (and (< i1@38@01 (Seq_length xs@23@01)) (<= 0 i1@38@01))
      (and (< i2@38@01 (Seq_length xs@23@01)) (<= 0 i2@38@01))
      (= (Seq_index xs@23@01 i1@38@01) (Seq_index xs@23@01 i2@38@01)))
    (= i1@38@01 i2@38@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@38@01 Int)) (!
  (=>
    (and (< i@38@01 (Seq_length xs@23@01)) (<= 0 i@38@01))
    (= (inv@39@01 (Seq_index xs@23@01 i@38@01)) i@38@01))
  :pattern ((Seq_index xs@23@01 i@38@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@39@01 r) (Seq_length xs@23@01)) (<= 0 (inv@39@01 r)))
    (= (Seq_index xs@23@01 (inv@39@01 r)) r))
  :pattern ((inv@39@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@40@01 ((r $Ref)) $Perm
  (ite
    (and (< (inv@39@01 r) (Seq_length xs@23@01)) (<= 0 (inv@39@01 r)))
    ($Perm.min
      (ite (= r (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@41@01 ((r $Ref)) $Perm
  (ite
    (and (< (inv@39@01 r) (Seq_length xs@23@01)) (<= 0 (inv@39@01 r)))
    ($Perm.min
      (ite (= r (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@40@01 r)))
    $Perm.No))
(define-fun pTaken@42@01 ((r $Ref)) $Perm
  (ite
    (and (< (inv@39@01 r) (Seq_length xs@23@01)) (<= 0 (inv@39@01 r)))
    ($Perm.min
      (-
        (-
          (ite
            (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
            $Perm.Write
            $Perm.No)
          (pTaken@31@01 r))
        (pTaken@33@01 r))
      (- (- $Perm.Write (pTaken@40@01 r)) (pTaken@41@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (=
  (-
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)
    (pTaken@40@01 (Seq_index xs@23@01 1)))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (< (inv@39@01 r) (Seq_length xs@23@01)) (<= 0 (inv@39@01 r)))
    (= (- $Perm.Write (pTaken@40@01 r)) $Perm.No))
  
  :qid |quant-u-89|))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (=
  (-
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)
    (pTaken@41@01 (Seq_index xs@23@01 0)))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (< (inv@39@01 r) (Seq_length xs@23@01)) (<= 0 (inv@39@01 r)))
    (= (- (- $Perm.Write (pTaken@40@01 r)) (pTaken@41@01 r)) $Perm.No))
  
  :qid |quant-u-91|))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (-
        (-
          (ite
            (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
            $Perm.Write
            $Perm.No)
          (pTaken@31@01 r))
        (pTaken@33@01 r))
      (pTaken@42@01 r))
    $Perm.No)
  
  :qid |quant-u-92|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (< (inv@39@01 r) (Seq_length xs@23@01)) (<= 0 (inv@39@01 r)))
    (=
      (- (- (- $Perm.Write (pTaken@40@01 r)) (pTaken@41@01 r)) (pTaken@42@01 r))
      $Perm.No))
  
  :qid |quant-u-93|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@43@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@43@01  $FVF<f>)))
      (and (< (inv@39@01 r) (Seq_length xs@23@01)) (<= 0 (inv@39@01 r))))
    (=>
      (and (< (inv@39@01 r) (Seq_length xs@23@01)) (<= 0 (inv@39@01 r)))
      (Set_in r ($FVF.domain_f (as sm@43@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@43@01  $FVF<f>))))
  :qid |qp.fvfDomDef7|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@39@01 r) (Seq_length xs@23@01)) (<= 0 (inv@39@01 r)))
      (= r (Seq_index xs@23@01 1)))
    (=
      ($FVF.lookup_f (as sm@43@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@43@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@35@01  $FVF<f>) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@39@01 r) (Seq_length xs@23@01)) (<= 0 (inv@39@01 r)))
      (= r (Seq_index xs@23@01 0)))
    (=
      ($FVF.lookup_f (as sm@43@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@32@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@43@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@32@01  $FVF<f>) r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@39@01 r) (Seq_length xs@23@01)) (<= 0 (inv@39@01 r)))
      (<
        $Perm.No
        (-
          (-
            (ite
              (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
              $Perm.Write
              $Perm.No)
            (pTaken@31@01 r))
          (pTaken@33@01 r))))
    (= ($FVF.lookup_f (as sm@43@01  $FVF<f>) r) ($FVF.lookup_f $t@28@01 r)))
  :pattern (($FVF.lookup_f (as sm@43@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@28@01 r))
  :qid |qp.fvfValDef6|)))
; [eval] |xs| > 3
; [eval] |xs|
(assert (fun02%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$FVF<f>To$Snap (as sm@43@01  $FVF<f>))
    $Snap.unit)) xs@23@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((i@38@01 Int)) (!
  (=>
    (and (< i@38@01 (Seq_length xs@23@01)) (<= 0 i@38@01))
    (= (inv@39@01 (Seq_index xs@23@01 i@38@01)) i@38@01))
  :pattern ((Seq_index xs@23@01 i@38@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@39@01 r) (Seq_length xs@23@01)) (<= 0 (inv@39@01 r)))
    (= (Seq_index xs@23@01 (inv@39@01 r)) r))
  :pattern ((inv@39@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@43@01  $FVF<f>)))
      (and (< (inv@39@01 r) (Seq_length xs@23@01)) (<= 0 (inv@39@01 r))))
    (=>
      (and (< (inv@39@01 r) (Seq_length xs@23@01)) (<= 0 (inv@39@01 r)))
      (Set_in r ($FVF.domain_f (as sm@43@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@43@01  $FVF<f>))))
  :qid |qp.fvfDomDef7|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@39@01 r) (Seq_length xs@23@01)) (<= 0 (inv@39@01 r)))
      (= r (Seq_index xs@23@01 1)))
    (=
      ($FVF.lookup_f (as sm@43@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@43@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@35@01  $FVF<f>) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@39@01 r) (Seq_length xs@23@01)) (<= 0 (inv@39@01 r)))
      (= r (Seq_index xs@23@01 0)))
    (=
      ($FVF.lookup_f (as sm@43@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@32@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@43@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@32@01  $FVF<f>) r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@39@01 r) (Seq_length xs@23@01)) (<= 0 (inv@39@01 r)))
      (<
        $Perm.No
        (-
          (-
            (ite
              (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
              $Perm.Write
              $Perm.No)
            (pTaken@31@01 r))
          (pTaken@33@01 r))))
    (= ($FVF.lookup_f (as sm@43@01  $FVF<f>) r) ($FVF.lookup_f $t@28@01 r)))
  :pattern (($FVF.lookup_f (as sm@43@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@28@01 r))
  :qid |qp.fvfValDef6|)))
(assert (and
  (forall ((i@36@01 Int) (j@37@01 Int)) (!
    (=>
      (and
        (and
          (and
            (and (not (= i@36@01 j@37@01)) (< j@37@01 (Seq_length xs@23@01)))
            (>= j@37@01 0))
          (< i@36@01 (Seq_length xs@23@01)))
        (>= i@36@01 0))
      (not (= (Seq_index xs@23@01 i@36@01) (Seq_index xs@23@01 j@37@01))))
    
    :qid |prog.l22|))
  (forall ((i@38@01 Int)) (!
    (=>
      (and (< i@38@01 (Seq_length xs@23@01)) (<= 0 i@38@01))
      (or (not (<= 0 i@38@01)) (<= 0 i@38@01)))
    :pattern ((Seq_index xs@23@01 i@38@01))
    :qid |f-aux|))
  (fun02%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<f>To$Snap (as sm@43@01  $FVF<f>))
      $Snap.unit)) xs@23@01)))
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  (fun02 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<f>To$Snap (as sm@43@01  $FVF<f>))
      $Snap.unit)) xs@23@01)
  10)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (=
  (fun02 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<f>To$Snap (as sm@43@01  $FVF<f>))
      $Snap.unit)) xs@23@01)
  10))
; [exec]
; xs[0].f := xs[1].f
; [eval] xs[0]
(push) ; 3
(assert (not (< 0 (Seq_length xs@23@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [eval] xs[1]
(push) ; 3
(assert (not (< 1 (Seq_length xs@23@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const sm@44@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@23@01 1))
    (=
      ($FVF.lookup_f (as sm@44@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@44@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@35@01  $FVF<f>) r))
  :qid |qp.fvfValDef8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@23@01 0))
    (=
      ($FVF.lookup_f (as sm@44@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@32@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@44@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@32@01  $FVF<f>) r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (-
          (ite
            (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
            $Perm.Write
            $Perm.No)
          (pTaken@31@01 r))
        (pTaken@33@01 r)))
    (= ($FVF.lookup_f (as sm@44@01  $FVF<f>) r) ($FVF.lookup_f $t@28@01 r)))
  :pattern (($FVF.lookup_f (as sm@44@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@28@01 r))
  :qid |qp.fvfValDef10|)))
(declare-const pm@45@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@45@01  $FPM) r)
    (+
      (+
        (ite (= r (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)
        (ite (= r (Seq_index xs@23@01 0)) $Perm.Write $Perm.No))
      (-
        (-
          (ite
            (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
            $Perm.Write
            $Perm.No)
          (pTaken@31@01 r))
        (pTaken@33@01 r))))
  :pattern (($FVF.perm_f (as pm@45@01  $FPM) r))
  :qid |qp.resPrmSumDef11|)))
(push) ; 3
(assert (not (< $Perm.No ($FVF.perm_f (as pm@45@01  $FPM) (Seq_index xs@23@01 1)))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@46@01 ((r $Ref)) $Perm
  (ite
    (= r (Seq_index xs@23@01 0))
    ($Perm.min
      (ite (= r (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@47@01 ((r $Ref)) $Perm
  (ite
    (= r (Seq_index xs@23@01 0))
    ($Perm.min
      (ite (= r (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@46@01 r)))
    $Perm.No))
(define-fun pTaken@48@01 ((r $Ref)) $Perm
  (ite
    (= r (Seq_index xs@23@01 0))
    ($Perm.min
      (-
        (-
          (ite
            (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
            $Perm.Write
            $Perm.No)
          (pTaken@31@01 r))
        (pTaken@33@01 r))
      (- (- $Perm.Write (pTaken@46@01 r)) (pTaken@47@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (=
  (-
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)
    (pTaken@46@01 (Seq_index xs@23@01 0)))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=> (= r (Seq_index xs@23@01 0)) (= (- $Perm.Write (pTaken@46@01 r)) $Perm.No))
  
  :qid |quant-u-96|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@49@01 $FVF<f>)
; Definitional axioms for singleton-FVF's value
(assert (=
  ($FVF.lookup_f (as sm@49@01  $FVF<f>) (Seq_index xs@23@01 0))
  ($FVF.lookup_f (as sm@44@01  $FVF<f>) (Seq_index xs@23@01 1))))
; [exec]
; assert fun02(xs) == 14
; [eval] fun02(xs) == 14
; [eval] fun02(xs)
(set-option :timeout 0)
(push) ; 3
; [eval] (forall i: Int, j: Int ::i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==> xs[i] != xs[j])
(declare-const i@50@01 Int)
(declare-const j@51@01 Int)
(push) ; 4
; [eval] i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==> xs[i] != xs[j]
; [eval] i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j)))
; [eval] i >= 0
(push) ; 5
; [then-branch: 30 | i@50@01 >= 0 | live]
; [else-branch: 30 | !(i@50@01 >= 0) | live]
(push) ; 6
; [then-branch: 30 | i@50@01 >= 0]
(assert (>= i@50@01 0))
; [eval] i < |xs|
; [eval] |xs|
(push) ; 7
; [then-branch: 31 | i@50@01 < |xs@23@01| | live]
; [else-branch: 31 | !(i@50@01 < |xs@23@01|) | live]
(push) ; 8
; [then-branch: 31 | i@50@01 < |xs@23@01|]
(assert (< i@50@01 (Seq_length xs@23@01)))
; [eval] j >= 0
(push) ; 9
; [then-branch: 32 | j@51@01 >= 0 | live]
; [else-branch: 32 | !(j@51@01 >= 0) | live]
(push) ; 10
; [then-branch: 32 | j@51@01 >= 0]
(assert (>= j@51@01 0))
; [eval] j < |xs|
; [eval] |xs|
(push) ; 11
; [then-branch: 33 | j@51@01 < |xs@23@01| | live]
; [else-branch: 33 | !(j@51@01 < |xs@23@01|) | live]
(push) ; 12
; [then-branch: 33 | j@51@01 < |xs@23@01|]
(assert (< j@51@01 (Seq_length xs@23@01)))
; [eval] i != j
(pop) ; 12
(push) ; 12
; [else-branch: 33 | !(j@51@01 < |xs@23@01|)]
(assert (not (< j@51@01 (Seq_length xs@23@01))))
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or (not (< j@51@01 (Seq_length xs@23@01))) (< j@51@01 (Seq_length xs@23@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 32 | !(j@51@01 >= 0)]
(assert (not (>= j@51@01 0)))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (=>
  (>= j@51@01 0)
  (and
    (>= j@51@01 0)
    (or
      (not (< j@51@01 (Seq_length xs@23@01)))
      (< j@51@01 (Seq_length xs@23@01))))))
; Joined path conditions
(assert (or (not (>= j@51@01 0)) (>= j@51@01 0)))
(pop) ; 8
(push) ; 8
; [else-branch: 31 | !(i@50@01 < |xs@23@01|)]
(assert (not (< i@50@01 (Seq_length xs@23@01))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (< i@50@01 (Seq_length xs@23@01))
  (and
    (< i@50@01 (Seq_length xs@23@01))
    (=>
      (>= j@51@01 0)
      (and
        (>= j@51@01 0)
        (or
          (not (< j@51@01 (Seq_length xs@23@01)))
          (< j@51@01 (Seq_length xs@23@01)))))
    (or (not (>= j@51@01 0)) (>= j@51@01 0)))))
; Joined path conditions
(assert (or (not (< i@50@01 (Seq_length xs@23@01))) (< i@50@01 (Seq_length xs@23@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 30 | !(i@50@01 >= 0)]
(assert (not (>= i@50@01 0)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (>= i@50@01 0)
  (and
    (>= i@50@01 0)
    (=>
      (< i@50@01 (Seq_length xs@23@01))
      (and
        (< i@50@01 (Seq_length xs@23@01))
        (=>
          (>= j@51@01 0)
          (and
            (>= j@51@01 0)
            (or
              (not (< j@51@01 (Seq_length xs@23@01)))
              (< j@51@01 (Seq_length xs@23@01)))))
        (or (not (>= j@51@01 0)) (>= j@51@01 0))))
    (or
      (not (< i@50@01 (Seq_length xs@23@01)))
      (< i@50@01 (Seq_length xs@23@01))))))
; Joined path conditions
(assert (or (not (>= i@50@01 0)) (>= i@50@01 0)))
(push) ; 5
; [then-branch: 34 | i@50@01 != j@51@01 && j@51@01 < |xs@23@01| && j@51@01 >= 0 && i@50@01 < |xs@23@01| && i@50@01 >= 0 | live]
; [else-branch: 34 | !(i@50@01 != j@51@01 && j@51@01 < |xs@23@01| && j@51@01 >= 0 && i@50@01 < |xs@23@01| && i@50@01 >= 0) | live]
(push) ; 6
; [then-branch: 34 | i@50@01 != j@51@01 && j@51@01 < |xs@23@01| && j@51@01 >= 0 && i@50@01 < |xs@23@01| && i@50@01 >= 0]
(assert (and
  (and
    (and
      (and (not (= i@50@01 j@51@01)) (< j@51@01 (Seq_length xs@23@01)))
      (>= j@51@01 0))
    (< i@50@01 (Seq_length xs@23@01)))
  (>= i@50@01 0)))
; [eval] xs[i] != xs[j]
; [eval] xs[i]
; [eval] xs[j]
(pop) ; 6
(push) ; 6
; [else-branch: 34 | !(i@50@01 != j@51@01 && j@51@01 < |xs@23@01| && j@51@01 >= 0 && i@50@01 < |xs@23@01| && i@50@01 >= 0)]
(assert (not
  (and
    (and
      (and
        (and (not (= i@50@01 j@51@01)) (< j@51@01 (Seq_length xs@23@01)))
        (>= j@51@01 0))
      (< i@50@01 (Seq_length xs@23@01)))
    (>= i@50@01 0))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (and
      (and
        (and (not (= i@50@01 j@51@01)) (< j@51@01 (Seq_length xs@23@01)))
        (>= j@51@01 0))
      (< i@50@01 (Seq_length xs@23@01)))
    (>= i@50@01 0))
  (and
    (not (= i@50@01 j@51@01))
    (< j@51@01 (Seq_length xs@23@01))
    (>= j@51@01 0)
    (< i@50@01 (Seq_length xs@23@01))
    (>= i@50@01 0))))
; Joined path conditions
(assert (or
  (not
    (and
      (and
        (and
          (and (not (= i@50@01 j@51@01)) (< j@51@01 (Seq_length xs@23@01)))
          (>= j@51@01 0))
        (< i@50@01 (Seq_length xs@23@01)))
      (>= i@50@01 0)))
  (and
    (and
      (and
        (and (not (= i@50@01 j@51@01)) (< j@51@01 (Seq_length xs@23@01)))
        (>= j@51@01 0))
      (< i@50@01 (Seq_length xs@23@01)))
    (>= i@50@01 0))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 4
(assert (not (forall ((i@50@01 Int) (j@51@01 Int)) (!
  (=>
    (and
      (and
        (and
          (and (not (= i@50@01 j@51@01)) (< j@51@01 (Seq_length xs@23@01)))
          (>= j@51@01 0))
        (< i@50@01 (Seq_length xs@23@01)))
      (>= i@50@01 0))
    (not (= (Seq_index xs@23@01 i@50@01) (Seq_index xs@23@01 j@51@01))))
  
  :qid |prog.l22|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (forall ((i@50@01 Int) (j@51@01 Int)) (!
  (=>
    (and
      (and
        (and
          (and (not (= i@50@01 j@51@01)) (< j@51@01 (Seq_length xs@23@01)))
          (>= j@51@01 0))
        (< i@50@01 (Seq_length xs@23@01)))
      (>= i@50@01 0))
    (not (= (Seq_index xs@23@01 i@50@01) (Seq_index xs@23@01 j@51@01))))
  
  :qid |prog.l22|)))
(declare-const i@52@01 Int)
(push) ; 4
; [eval] 0 <= i && i < |xs|
; [eval] 0 <= i
(push) ; 5
; [then-branch: 35 | 0 <= i@52@01 | live]
; [else-branch: 35 | !(0 <= i@52@01) | live]
(push) ; 6
; [then-branch: 35 | 0 <= i@52@01]
(assert (<= 0 i@52@01))
; [eval] i < |xs|
; [eval] |xs|
(pop) ; 6
(push) ; 6
; [else-branch: 35 | !(0 <= i@52@01)]
(assert (not (<= 0 i@52@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 i@52@01)) (<= 0 i@52@01)))
(assert (and (< i@52@01 (Seq_length xs@23@01)) (<= 0 i@52@01)))
; [eval] xs[i]
(push) ; 5
(assert (not (>= i@52@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@53@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@52@01 Int)) (!
  (=>
    (and (< i@52@01 (Seq_length xs@23@01)) (<= 0 i@52@01))
    (or (not (<= 0 i@52@01)) (<= 0 i@52@01)))
  :pattern ((Seq_index xs@23@01 i@52@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@52@01 Int) (i2@52@01 Int)) (!
  (=>
    (and
      (and (< i1@52@01 (Seq_length xs@23@01)) (<= 0 i1@52@01))
      (and (< i2@52@01 (Seq_length xs@23@01)) (<= 0 i2@52@01))
      (= (Seq_index xs@23@01 i1@52@01) (Seq_index xs@23@01 i2@52@01)))
    (= i1@52@01 i2@52@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@52@01 Int)) (!
  (=>
    (and (< i@52@01 (Seq_length xs@23@01)) (<= 0 i@52@01))
    (= (inv@53@01 (Seq_index xs@23@01 i@52@01)) i@52@01))
  :pattern ((Seq_index xs@23@01 i@52@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@53@01 r) (Seq_length xs@23@01)) (<= 0 (inv@53@01 r)))
    (= (Seq_index xs@23@01 (inv@53@01 r)) r))
  :pattern ((inv@53@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@54@01 ((r $Ref)) $Perm
  (ite
    (and (< (inv@53@01 r) (Seq_length xs@23@01)) (<= 0 (inv@53@01 r)))
    ($Perm.min
      (ite (= r (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@55@01 ((r $Ref)) $Perm
  (ite
    (and (< (inv@53@01 r) (Seq_length xs@23@01)) (<= 0 (inv@53@01 r)))
    ($Perm.min
      (-
        (-
          (ite
            (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
            $Perm.Write
            $Perm.No)
          (pTaken@31@01 r))
        (pTaken@33@01 r))
      (- $Perm.Write (pTaken@54@01 r)))
    $Perm.No))
(define-fun pTaken@56@01 ((r $Ref)) $Perm
  (ite
    (and (< (inv@53@01 r) (Seq_length xs@23@01)) (<= 0 (inv@53@01 r)))
    ($Perm.min
      (ite (= r (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)
      (- (- $Perm.Write (pTaken@54@01 r)) (pTaken@55@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (=
  (-
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)
    (pTaken@54@01 (Seq_index xs@23@01 0)))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (< (inv@53@01 r) (Seq_length xs@23@01)) (<= 0 (inv@53@01 r)))
    (= (- $Perm.Write (pTaken@54@01 r)) $Perm.No))
  
  :qid |quant-u-100|))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (-
        (-
          (ite
            (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
            $Perm.Write
            $Perm.No)
          (pTaken@31@01 r))
        (pTaken@33@01 r))
      (pTaken@55@01 r))
    $Perm.No)
  
  :qid |quant-u-101|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (< (inv@53@01 r) (Seq_length xs@23@01)) (<= 0 (inv@53@01 r)))
    (= (- (- $Perm.Write (pTaken@54@01 r)) (pTaken@55@01 r)) $Perm.No))
  
  :qid |quant-u-102|))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (=
  (-
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)
    (pTaken@56@01 (Seq_index xs@23@01 1)))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (< (inv@53@01 r) (Seq_length xs@23@01)) (<= 0 (inv@53@01 r)))
    (=
      (- (- (- $Perm.Write (pTaken@54@01 r)) (pTaken@55@01 r)) (pTaken@56@01 r))
      $Perm.No))
  
  :qid |quant-u-104|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@57@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@57@01  $FVF<f>)))
      (and (< (inv@53@01 r) (Seq_length xs@23@01)) (<= 0 (inv@53@01 r))))
    (=>
      (and (< (inv@53@01 r) (Seq_length xs@23@01)) (<= 0 (inv@53@01 r)))
      (Set_in r ($FVF.domain_f (as sm@57@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@57@01  $FVF<f>))))
  :qid |qp.fvfDomDef15|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@53@01 r) (Seq_length xs@23@01)) (<= 0 (inv@53@01 r)))
      (= r (Seq_index xs@23@01 0)))
    (=
      ($FVF.lookup_f (as sm@57@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@49@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@57@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@49@01  $FVF<f>) r))
  :qid |qp.fvfValDef12|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@53@01 r) (Seq_length xs@23@01)) (<= 0 (inv@53@01 r)))
      (<
        $Perm.No
        (-
          (-
            (ite
              (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
              $Perm.Write
              $Perm.No)
            (pTaken@31@01 r))
          (pTaken@33@01 r))))
    (= ($FVF.lookup_f (as sm@57@01  $FVF<f>) r) ($FVF.lookup_f $t@28@01 r)))
  :pattern (($FVF.lookup_f (as sm@57@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@28@01 r))
  :qid |qp.fvfValDef13|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@53@01 r) (Seq_length xs@23@01)) (<= 0 (inv@53@01 r)))
      (= r (Seq_index xs@23@01 1)))
    (=
      ($FVF.lookup_f (as sm@57@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@57@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@35@01  $FVF<f>) r))
  :qid |qp.fvfValDef14|)))
; [eval] |xs| > 3
; [eval] |xs|
(assert (fun02%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$FVF<f>To$Snap (as sm@57@01  $FVF<f>))
    $Snap.unit)) xs@23@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((i@52@01 Int)) (!
  (=>
    (and (< i@52@01 (Seq_length xs@23@01)) (<= 0 i@52@01))
    (= (inv@53@01 (Seq_index xs@23@01 i@52@01)) i@52@01))
  :pattern ((Seq_index xs@23@01 i@52@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@53@01 r) (Seq_length xs@23@01)) (<= 0 (inv@53@01 r)))
    (= (Seq_index xs@23@01 (inv@53@01 r)) r))
  :pattern ((inv@53@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@57@01  $FVF<f>)))
      (and (< (inv@53@01 r) (Seq_length xs@23@01)) (<= 0 (inv@53@01 r))))
    (=>
      (and (< (inv@53@01 r) (Seq_length xs@23@01)) (<= 0 (inv@53@01 r)))
      (Set_in r ($FVF.domain_f (as sm@57@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@57@01  $FVF<f>))))
  :qid |qp.fvfDomDef15|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@53@01 r) (Seq_length xs@23@01)) (<= 0 (inv@53@01 r)))
      (= r (Seq_index xs@23@01 0)))
    (=
      ($FVF.lookup_f (as sm@57@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@49@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@57@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@49@01  $FVF<f>) r))
  :qid |qp.fvfValDef12|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@53@01 r) (Seq_length xs@23@01)) (<= 0 (inv@53@01 r)))
      (<
        $Perm.No
        (-
          (-
            (ite
              (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
              $Perm.Write
              $Perm.No)
            (pTaken@31@01 r))
          (pTaken@33@01 r))))
    (= ($FVF.lookup_f (as sm@57@01  $FVF<f>) r) ($FVF.lookup_f $t@28@01 r)))
  :pattern (($FVF.lookup_f (as sm@57@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@28@01 r))
  :qid |qp.fvfValDef13|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@53@01 r) (Seq_length xs@23@01)) (<= 0 (inv@53@01 r)))
      (= r (Seq_index xs@23@01 1)))
    (=
      ($FVF.lookup_f (as sm@57@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@57@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@35@01  $FVF<f>) r))
  :qid |qp.fvfValDef14|)))
(assert (and
  (forall ((i@50@01 Int) (j@51@01 Int)) (!
    (=>
      (and
        (and
          (and
            (and (not (= i@50@01 j@51@01)) (< j@51@01 (Seq_length xs@23@01)))
            (>= j@51@01 0))
          (< i@50@01 (Seq_length xs@23@01)))
        (>= i@50@01 0))
      (not (= (Seq_index xs@23@01 i@50@01) (Seq_index xs@23@01 j@51@01))))
    
    :qid |prog.l22|))
  (forall ((i@52@01 Int)) (!
    (=>
      (and (< i@52@01 (Seq_length xs@23@01)) (<= 0 i@52@01))
      (or (not (<= 0 i@52@01)) (<= 0 i@52@01)))
    :pattern ((Seq_index xs@23@01 i@52@01))
    :qid |f-aux|))
  (fun02%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<f>To$Snap (as sm@57@01  $FVF<f>))
      $Snap.unit)) xs@23@01)))
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  (fun02 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<f>To$Snap (as sm@57@01  $FVF<f>))
      $Snap.unit)) xs@23@01)
  14)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (=
  (fun02 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<f>To$Snap (as sm@57@01  $FVF<f>))
      $Snap.unit)) xs@23@01)
  14))
; [exec]
; xs[0].f := xs[2].f
; [eval] xs[0]
(push) ; 3
(assert (not (< 0 (Seq_length xs@23@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [eval] xs[2]
(push) ; 3
(assert (not (< 2 (Seq_length xs@23@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const sm@58@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@23@01 0))
    (=
      ($FVF.lookup_f (as sm@58@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@49@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@58@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@49@01  $FVF<f>) r))
  :qid |qp.fvfValDef16|)))
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (-
          (ite
            (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
            $Perm.Write
            $Perm.No)
          (pTaken@31@01 r))
        (pTaken@33@01 r)))
    (= ($FVF.lookup_f (as sm@58@01  $FVF<f>) r) ($FVF.lookup_f $t@28@01 r)))
  :pattern (($FVF.lookup_f (as sm@58@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@28@01 r))
  :qid |qp.fvfValDef17|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@23@01 1))
    (=
      ($FVF.lookup_f (as sm@58@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@58@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@35@01  $FVF<f>) r))
  :qid |qp.fvfValDef18|)))
(declare-const pm@59@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@59@01  $FPM) r)
    (+
      (+
        (ite (= r (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)
        (-
          (-
            (ite
              (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
              $Perm.Write
              $Perm.No)
            (pTaken@31@01 r))
          (pTaken@33@01 r)))
      (ite (= r (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@59@01  $FPM) r))
  :qid |qp.resPrmSumDef19|)))
(push) ; 3
(assert (not (< $Perm.No ($FVF.perm_f (as pm@59@01  $FPM) (Seq_index xs@23@01 2)))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@60@01 ((r $Ref)) $Perm
  (ite
    (= r (Seq_index xs@23@01 0))
    ($Perm.min
      (ite (= r (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@61@01 ((r $Ref)) $Perm
  (ite
    (= r (Seq_index xs@23@01 0))
    ($Perm.min
      (-
        (-
          (ite
            (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
            $Perm.Write
            $Perm.No)
          (pTaken@31@01 r))
        (pTaken@33@01 r))
      (- $Perm.Write (pTaken@60@01 r)))
    $Perm.No))
(define-fun pTaken@62@01 ((r $Ref)) $Perm
  (ite
    (= r (Seq_index xs@23@01 0))
    ($Perm.min
      (ite (= r (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)
      (- (- $Perm.Write (pTaken@60@01 r)) (pTaken@61@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (=
  (-
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)
    (pTaken@60@01 (Seq_index xs@23@01 0)))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=> (= r (Seq_index xs@23@01 0)) (= (- $Perm.Write (pTaken@60@01 r)) $Perm.No))
  
  :qid |quant-u-107|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@63@01 $FVF<f>)
; Definitional axioms for singleton-FVF's value
(assert (=
  ($FVF.lookup_f (as sm@63@01  $FVF<f>) (Seq_index xs@23@01 0))
  ($FVF.lookup_f (as sm@58@01  $FVF<f>) (Seq_index xs@23@01 2))))
; [exec]
; assert fun02(xs) == 14
; [eval] fun02(xs) == 14
; [eval] fun02(xs)
(set-option :timeout 0)
(push) ; 3
; [eval] (forall i: Int, j: Int ::i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==> xs[i] != xs[j])
(declare-const i@64@01 Int)
(declare-const j@65@01 Int)
(push) ; 4
; [eval] i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==> xs[i] != xs[j]
; [eval] i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j)))
; [eval] i >= 0
(push) ; 5
; [then-branch: 36 | i@64@01 >= 0 | live]
; [else-branch: 36 | !(i@64@01 >= 0) | live]
(push) ; 6
; [then-branch: 36 | i@64@01 >= 0]
(assert (>= i@64@01 0))
; [eval] i < |xs|
; [eval] |xs|
(push) ; 7
; [then-branch: 37 | i@64@01 < |xs@23@01| | live]
; [else-branch: 37 | !(i@64@01 < |xs@23@01|) | live]
(push) ; 8
; [then-branch: 37 | i@64@01 < |xs@23@01|]
(assert (< i@64@01 (Seq_length xs@23@01)))
; [eval] j >= 0
(push) ; 9
; [then-branch: 38 | j@65@01 >= 0 | live]
; [else-branch: 38 | !(j@65@01 >= 0) | live]
(push) ; 10
; [then-branch: 38 | j@65@01 >= 0]
(assert (>= j@65@01 0))
; [eval] j < |xs|
; [eval] |xs|
(push) ; 11
; [then-branch: 39 | j@65@01 < |xs@23@01| | live]
; [else-branch: 39 | !(j@65@01 < |xs@23@01|) | live]
(push) ; 12
; [then-branch: 39 | j@65@01 < |xs@23@01|]
(assert (< j@65@01 (Seq_length xs@23@01)))
; [eval] i != j
(pop) ; 12
(push) ; 12
; [else-branch: 39 | !(j@65@01 < |xs@23@01|)]
(assert (not (< j@65@01 (Seq_length xs@23@01))))
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or (not (< j@65@01 (Seq_length xs@23@01))) (< j@65@01 (Seq_length xs@23@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 38 | !(j@65@01 >= 0)]
(assert (not (>= j@65@01 0)))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (=>
  (>= j@65@01 0)
  (and
    (>= j@65@01 0)
    (or
      (not (< j@65@01 (Seq_length xs@23@01)))
      (< j@65@01 (Seq_length xs@23@01))))))
; Joined path conditions
(assert (or (not (>= j@65@01 0)) (>= j@65@01 0)))
(pop) ; 8
(push) ; 8
; [else-branch: 37 | !(i@64@01 < |xs@23@01|)]
(assert (not (< i@64@01 (Seq_length xs@23@01))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (< i@64@01 (Seq_length xs@23@01))
  (and
    (< i@64@01 (Seq_length xs@23@01))
    (=>
      (>= j@65@01 0)
      (and
        (>= j@65@01 0)
        (or
          (not (< j@65@01 (Seq_length xs@23@01)))
          (< j@65@01 (Seq_length xs@23@01)))))
    (or (not (>= j@65@01 0)) (>= j@65@01 0)))))
; Joined path conditions
(assert (or (not (< i@64@01 (Seq_length xs@23@01))) (< i@64@01 (Seq_length xs@23@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 36 | !(i@64@01 >= 0)]
(assert (not (>= i@64@01 0)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (>= i@64@01 0)
  (and
    (>= i@64@01 0)
    (=>
      (< i@64@01 (Seq_length xs@23@01))
      (and
        (< i@64@01 (Seq_length xs@23@01))
        (=>
          (>= j@65@01 0)
          (and
            (>= j@65@01 0)
            (or
              (not (< j@65@01 (Seq_length xs@23@01)))
              (< j@65@01 (Seq_length xs@23@01)))))
        (or (not (>= j@65@01 0)) (>= j@65@01 0))))
    (or
      (not (< i@64@01 (Seq_length xs@23@01)))
      (< i@64@01 (Seq_length xs@23@01))))))
; Joined path conditions
(assert (or (not (>= i@64@01 0)) (>= i@64@01 0)))
(push) ; 5
; [then-branch: 40 | i@64@01 != j@65@01 && j@65@01 < |xs@23@01| && j@65@01 >= 0 && i@64@01 < |xs@23@01| && i@64@01 >= 0 | live]
; [else-branch: 40 | !(i@64@01 != j@65@01 && j@65@01 < |xs@23@01| && j@65@01 >= 0 && i@64@01 < |xs@23@01| && i@64@01 >= 0) | live]
(push) ; 6
; [then-branch: 40 | i@64@01 != j@65@01 && j@65@01 < |xs@23@01| && j@65@01 >= 0 && i@64@01 < |xs@23@01| && i@64@01 >= 0]
(assert (and
  (and
    (and
      (and (not (= i@64@01 j@65@01)) (< j@65@01 (Seq_length xs@23@01)))
      (>= j@65@01 0))
    (< i@64@01 (Seq_length xs@23@01)))
  (>= i@64@01 0)))
; [eval] xs[i] != xs[j]
; [eval] xs[i]
; [eval] xs[j]
(pop) ; 6
(push) ; 6
; [else-branch: 40 | !(i@64@01 != j@65@01 && j@65@01 < |xs@23@01| && j@65@01 >= 0 && i@64@01 < |xs@23@01| && i@64@01 >= 0)]
(assert (not
  (and
    (and
      (and
        (and (not (= i@64@01 j@65@01)) (< j@65@01 (Seq_length xs@23@01)))
        (>= j@65@01 0))
      (< i@64@01 (Seq_length xs@23@01)))
    (>= i@64@01 0))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (and
      (and
        (and (not (= i@64@01 j@65@01)) (< j@65@01 (Seq_length xs@23@01)))
        (>= j@65@01 0))
      (< i@64@01 (Seq_length xs@23@01)))
    (>= i@64@01 0))
  (and
    (not (= i@64@01 j@65@01))
    (< j@65@01 (Seq_length xs@23@01))
    (>= j@65@01 0)
    (< i@64@01 (Seq_length xs@23@01))
    (>= i@64@01 0))))
; Joined path conditions
(assert (or
  (not
    (and
      (and
        (and
          (and (not (= i@64@01 j@65@01)) (< j@65@01 (Seq_length xs@23@01)))
          (>= j@65@01 0))
        (< i@64@01 (Seq_length xs@23@01)))
      (>= i@64@01 0)))
  (and
    (and
      (and
        (and (not (= i@64@01 j@65@01)) (< j@65@01 (Seq_length xs@23@01)))
        (>= j@65@01 0))
      (< i@64@01 (Seq_length xs@23@01)))
    (>= i@64@01 0))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 4
(assert (not (forall ((i@64@01 Int) (j@65@01 Int)) (!
  (=>
    (and
      (and
        (and
          (and (not (= i@64@01 j@65@01)) (< j@65@01 (Seq_length xs@23@01)))
          (>= j@65@01 0))
        (< i@64@01 (Seq_length xs@23@01)))
      (>= i@64@01 0))
    (not (= (Seq_index xs@23@01 i@64@01) (Seq_index xs@23@01 j@65@01))))
  
  :qid |prog.l22|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (forall ((i@64@01 Int) (j@65@01 Int)) (!
  (=>
    (and
      (and
        (and
          (and (not (= i@64@01 j@65@01)) (< j@65@01 (Seq_length xs@23@01)))
          (>= j@65@01 0))
        (< i@64@01 (Seq_length xs@23@01)))
      (>= i@64@01 0))
    (not (= (Seq_index xs@23@01 i@64@01) (Seq_index xs@23@01 j@65@01))))
  
  :qid |prog.l22|)))
(declare-const i@66@01 Int)
(push) ; 4
; [eval] 0 <= i && i < |xs|
; [eval] 0 <= i
(push) ; 5
; [then-branch: 41 | 0 <= i@66@01 | live]
; [else-branch: 41 | !(0 <= i@66@01) | live]
(push) ; 6
; [then-branch: 41 | 0 <= i@66@01]
(assert (<= 0 i@66@01))
; [eval] i < |xs|
; [eval] |xs|
(pop) ; 6
(push) ; 6
; [else-branch: 41 | !(0 <= i@66@01)]
(assert (not (<= 0 i@66@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 i@66@01)) (<= 0 i@66@01)))
(assert (and (< i@66@01 (Seq_length xs@23@01)) (<= 0 i@66@01)))
; [eval] xs[i]
(push) ; 5
(assert (not (>= i@66@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@67@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@66@01 Int)) (!
  (=>
    (and (< i@66@01 (Seq_length xs@23@01)) (<= 0 i@66@01))
    (or (not (<= 0 i@66@01)) (<= 0 i@66@01)))
  :pattern ((Seq_index xs@23@01 i@66@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@66@01 Int) (i2@66@01 Int)) (!
  (=>
    (and
      (and (< i1@66@01 (Seq_length xs@23@01)) (<= 0 i1@66@01))
      (and (< i2@66@01 (Seq_length xs@23@01)) (<= 0 i2@66@01))
      (= (Seq_index xs@23@01 i1@66@01) (Seq_index xs@23@01 i2@66@01)))
    (= i1@66@01 i2@66@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@66@01 Int)) (!
  (=>
    (and (< i@66@01 (Seq_length xs@23@01)) (<= 0 i@66@01))
    (= (inv@67@01 (Seq_index xs@23@01 i@66@01)) i@66@01))
  :pattern ((Seq_index xs@23@01 i@66@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@67@01 r) (Seq_length xs@23@01)) (<= 0 (inv@67@01 r)))
    (= (Seq_index xs@23@01 (inv@67@01 r)) r))
  :pattern ((inv@67@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@68@01 ((r $Ref)) $Perm
  (ite
    (and (< (inv@67@01 r) (Seq_length xs@23@01)) (<= 0 (inv@67@01 r)))
    ($Perm.min
      (ite (= r (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@69@01 ((r $Ref)) $Perm
  (ite
    (and (< (inv@67@01 r) (Seq_length xs@23@01)) (<= 0 (inv@67@01 r)))
    ($Perm.min
      (ite (= r (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@68@01 r)))
    $Perm.No))
(define-fun pTaken@70@01 ((r $Ref)) $Perm
  (ite
    (and (< (inv@67@01 r) (Seq_length xs@23@01)) (<= 0 (inv@67@01 r)))
    ($Perm.min
      (-
        (-
          (ite
            (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
            $Perm.Write
            $Perm.No)
          (pTaken@31@01 r))
        (pTaken@33@01 r))
      (- (- $Perm.Write (pTaken@68@01 r)) (pTaken@69@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (=
  (-
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)
    (pTaken@68@01 (Seq_index xs@23@01 0)))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (< (inv@67@01 r) (Seq_length xs@23@01)) (<= 0 (inv@67@01 r)))
    (= (- $Perm.Write (pTaken@68@01 r)) $Perm.No))
  
  :qid |quant-u-111|))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (=
  (-
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)
    (pTaken@69@01 (Seq_index xs@23@01 1)))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (< (inv@67@01 r) (Seq_length xs@23@01)) (<= 0 (inv@67@01 r)))
    (= (- (- $Perm.Write (pTaken@68@01 r)) (pTaken@69@01 r)) $Perm.No))
  
  :qid |quant-u-113|))))
(check-sat)
; unknown
(pop) ; 4
; 0.01s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (-
        (-
          (ite
            (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
            $Perm.Write
            $Perm.No)
          (pTaken@31@01 r))
        (pTaken@33@01 r))
      (pTaken@70@01 r))
    $Perm.No)
  
  :qid |quant-u-114|))))
(check-sat)
; unsat
(pop) ; 4
; 0.01s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (< (inv@67@01 r) (Seq_length xs@23@01)) (<= 0 (inv@67@01 r)))
    (=
      (- (- (- $Perm.Write (pTaken@68@01 r)) (pTaken@69@01 r)) (pTaken@70@01 r))
      $Perm.No))
  
  :qid |quant-u-115|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@71@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@71@01  $FVF<f>)))
      (and (< (inv@67@01 r) (Seq_length xs@23@01)) (<= 0 (inv@67@01 r))))
    (=>
      (and (< (inv@67@01 r) (Seq_length xs@23@01)) (<= 0 (inv@67@01 r)))
      (Set_in r ($FVF.domain_f (as sm@71@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@71@01  $FVF<f>))))
  :qid |qp.fvfDomDef23|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@67@01 r) (Seq_length xs@23@01)) (<= 0 (inv@67@01 r)))
      (= r (Seq_index xs@23@01 0)))
    (=
      ($FVF.lookup_f (as sm@71@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@71@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@63@01  $FVF<f>) r))
  :qid |qp.fvfValDef20|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@67@01 r) (Seq_length xs@23@01)) (<= 0 (inv@67@01 r)))
      (= r (Seq_index xs@23@01 1)))
    (=
      ($FVF.lookup_f (as sm@71@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@71@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@35@01  $FVF<f>) r))
  :qid |qp.fvfValDef21|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@67@01 r) (Seq_length xs@23@01)) (<= 0 (inv@67@01 r)))
      (<
        $Perm.No
        (-
          (-
            (ite
              (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
              $Perm.Write
              $Perm.No)
            (pTaken@31@01 r))
          (pTaken@33@01 r))))
    (= ($FVF.lookup_f (as sm@71@01  $FVF<f>) r) ($FVF.lookup_f $t@28@01 r)))
  :pattern (($FVF.lookup_f (as sm@71@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@28@01 r))
  :qid |qp.fvfValDef22|)))
; [eval] |xs| > 3
; [eval] |xs|
(assert (fun02%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$FVF<f>To$Snap (as sm@71@01  $FVF<f>))
    $Snap.unit)) xs@23@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((i@66@01 Int)) (!
  (=>
    (and (< i@66@01 (Seq_length xs@23@01)) (<= 0 i@66@01))
    (= (inv@67@01 (Seq_index xs@23@01 i@66@01)) i@66@01))
  :pattern ((Seq_index xs@23@01 i@66@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@67@01 r) (Seq_length xs@23@01)) (<= 0 (inv@67@01 r)))
    (= (Seq_index xs@23@01 (inv@67@01 r)) r))
  :pattern ((inv@67@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@71@01  $FVF<f>)))
      (and (< (inv@67@01 r) (Seq_length xs@23@01)) (<= 0 (inv@67@01 r))))
    (=>
      (and (< (inv@67@01 r) (Seq_length xs@23@01)) (<= 0 (inv@67@01 r)))
      (Set_in r ($FVF.domain_f (as sm@71@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@71@01  $FVF<f>))))
  :qid |qp.fvfDomDef23|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@67@01 r) (Seq_length xs@23@01)) (<= 0 (inv@67@01 r)))
      (= r (Seq_index xs@23@01 0)))
    (=
      ($FVF.lookup_f (as sm@71@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@71@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@63@01  $FVF<f>) r))
  :qid |qp.fvfValDef20|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@67@01 r) (Seq_length xs@23@01)) (<= 0 (inv@67@01 r)))
      (= r (Seq_index xs@23@01 1)))
    (=
      ($FVF.lookup_f (as sm@71@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@71@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@35@01  $FVF<f>) r))
  :qid |qp.fvfValDef21|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@67@01 r) (Seq_length xs@23@01)) (<= 0 (inv@67@01 r)))
      (<
        $Perm.No
        (-
          (-
            (ite
              (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
              $Perm.Write
              $Perm.No)
            (pTaken@31@01 r))
          (pTaken@33@01 r))))
    (= ($FVF.lookup_f (as sm@71@01  $FVF<f>) r) ($FVF.lookup_f $t@28@01 r)))
  :pattern (($FVF.lookup_f (as sm@71@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@28@01 r))
  :qid |qp.fvfValDef22|)))
(assert (and
  (forall ((i@64@01 Int) (j@65@01 Int)) (!
    (=>
      (and
        (and
          (and
            (and (not (= i@64@01 j@65@01)) (< j@65@01 (Seq_length xs@23@01)))
            (>= j@65@01 0))
          (< i@64@01 (Seq_length xs@23@01)))
        (>= i@64@01 0))
      (not (= (Seq_index xs@23@01 i@64@01) (Seq_index xs@23@01 j@65@01))))
    
    :qid |prog.l22|))
  (forall ((i@66@01 Int)) (!
    (=>
      (and (< i@66@01 (Seq_length xs@23@01)) (<= 0 i@66@01))
      (or (not (<= 0 i@66@01)) (<= 0 i@66@01)))
    :pattern ((Seq_index xs@23@01 i@66@01))
    :qid |f-aux|))
  (fun02%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<f>To$Snap (as sm@71@01  $FVF<f>))
      $Snap.unit)) xs@23@01)))
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  (fun02 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<f>To$Snap (as sm@71@01  $FVF<f>))
      $Snap.unit)) xs@23@01)
  14)))
(check-sat)
; unknown
(pop) ; 3
; 0.04s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0))
    (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)))
  (not
    (=
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) (Seq_index xs@23@01 0))
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) (Seq_index xs@23@01 1)))))))
(check-sat)
; unknown
(pop) ; 3
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1))
    (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)))
  (not
    (=
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) (Seq_index xs@23@01 1))
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) (Seq_index xs@23@01 0)))))))
(check-sat)
; unknown
(pop) ; 3
; 0.01s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
  (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))))
(declare-const sm@72@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@23@01 0))
    (=
      ($FVF.lookup_f (as sm@72@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@72@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@63@01  $FVF<f>) r))
  :qid |qp.fvfValDef24|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@23@01 1))
    (=
      ($FVF.lookup_f (as sm@72@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@72@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@35@01  $FVF<f>) r))
  :qid |qp.fvfValDef25|)))
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (-
          (ite
            (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
            $Perm.Write
            $Perm.No)
          (pTaken@31@01 r))
        (pTaken@33@01 r)))
    (= ($FVF.lookup_f (as sm@72@01  $FVF<f>) r) ($FVF.lookup_f $t@28@01 r)))
  :pattern (($FVF.lookup_f (as sm@72@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@28@01 r))
  :qid |qp.fvfValDef26|)))
(declare-const pm@73@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@73@01  $FPM) r)
    (+
      (+
        (ite (= r (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)
        (ite (= r (Seq_index xs@23@01 1)) $Perm.Write $Perm.No))
      (-
        (-
          (ite
            (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
            $Perm.Write
            $Perm.No)
          (pTaken@31@01 r))
        (pTaken@33@01 r))))
  :pattern (($FVF.perm_f (as pm@73@01  $FPM) r))
  :qid |qp.resPrmSumDef27|)))
(assert (<= ($FVF.perm_f (as pm@73@01  $FPM) (Seq_index xs@23@01 0)) $Perm.Write))
(assert (<= ($FVF.perm_f (as pm@73@01  $FPM) (Seq_index xs@23@01 1)) $Perm.Write))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@73@01  $FPM) r) $Perm.Write)
  :pattern ((inv@29@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] fun02(xs) == 14
; [eval] fun02(xs)
(set-option :timeout 0)
(push) ; 3
; [eval] (forall i: Int, j: Int ::i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==> xs[i] != xs[j])
(declare-const i@74@01 Int)
(declare-const j@75@01 Int)
(push) ; 4
; [eval] i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==> xs[i] != xs[j]
; [eval] i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j)))
; [eval] i >= 0
(push) ; 5
; [then-branch: 42 | i@74@01 >= 0 | live]
; [else-branch: 42 | !(i@74@01 >= 0) | live]
(push) ; 6
; [then-branch: 42 | i@74@01 >= 0]
(assert (>= i@74@01 0))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1))
    (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)))
  (not
    (=
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) (Seq_index xs@23@01 1))
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) (Seq_index xs@23@01 0)))))))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0))
    (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)))
  (not
    (=
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) (Seq_index xs@23@01 0))
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) (Seq_index xs@23@01 1)))))))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))
  (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))))
(declare-const sm@76@01 $FVF<f>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (-
          (ite
            (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
            $Perm.Write
            $Perm.No)
          (pTaken@31@01 r))
        (pTaken@33@01 r)))
    (= ($FVF.lookup_f (as sm@76@01  $FVF<f>) r) ($FVF.lookup_f $t@28@01 r)))
  :pattern (($FVF.lookup_f (as sm@76@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@28@01 r))
  :qid |qp.fvfValDef28|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@23@01 1))
    (=
      ($FVF.lookup_f (as sm@76@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@76@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@35@01  $FVF<f>) r))
  :qid |qp.fvfValDef29|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@23@01 0))
    (=
      ($FVF.lookup_f (as sm@76@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@76@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@63@01  $FVF<f>) r))
  :qid |qp.fvfValDef30|)))
(declare-const pm@77@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@77@01  $FPM) r)
    (+
      (+
        (-
          (-
            (ite
              (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
              $Perm.Write
              $Perm.No)
            (pTaken@31@01 r))
          (pTaken@33@01 r))
        (ite (= r (Seq_index xs@23@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@77@01  $FPM) r))
  :qid |qp.resPrmSumDef31|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@77@01  $FPM) r) $Perm.Write)
  :pattern ((inv@29@01 r))
  :qid |qp-fld-prm-bnd|)))
(assert (<= ($FVF.perm_f (as pm@77@01  $FPM) (Seq_index xs@23@01 1)) $Perm.Write))
(assert (<= ($FVF.perm_f (as pm@77@01  $FPM) (Seq_index xs@23@01 0)) $Perm.Write))
; [eval] i < |xs|
; [eval] |xs|
(set-option :timeout 0)
(push) ; 7
; [then-branch: 43 | i@74@01 < |xs@23@01| | live]
; [else-branch: 43 | !(i@74@01 < |xs@23@01|) | live]
(push) ; 8
; [then-branch: 43 | i@74@01 < |xs@23@01|]
(assert (< i@74@01 (Seq_length xs@23@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0))
    (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)))
  (not
    (=
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) (Seq_index xs@23@01 0))
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) (Seq_index xs@23@01 1)))))))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1))
    (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)))
  (not
    (=
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) (Seq_index xs@23@01 1))
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) (Seq_index xs@23@01 0)))))))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
  (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))))
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] j >= 0
(set-option :timeout 0)
(push) ; 9
; [then-branch: 44 | j@75@01 >= 0 | live]
; [else-branch: 44 | !(j@75@01 >= 0) | live]
(push) ; 10
; [then-branch: 44 | j@75@01 >= 0]
(assert (>= j@75@01 0))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1))
    (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)))
  (not
    (=
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) (Seq_index xs@23@01 1))
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) (Seq_index xs@23@01 0)))))))
(check-sat)
; unknown
(pop) ; 11
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0))
    (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)))
  (not
    (=
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) (Seq_index xs@23@01 0))
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) (Seq_index xs@23@01 1)))))))
(check-sat)
; unknown
(pop) ; 11
; 0.01s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))
  (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))))
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] j < |xs|
; [eval] |xs|
(set-option :timeout 0)
(push) ; 11
; [then-branch: 45 | j@75@01 < |xs@23@01| | live]
; [else-branch: 45 | !(j@75@01 < |xs@23@01|) | live]
(push) ; 12
; [then-branch: 45 | j@75@01 < |xs@23@01|]
(assert (< j@75@01 (Seq_length xs@23@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0))
    (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)))
  (not
    (=
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) (Seq_index xs@23@01 0))
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) (Seq_index xs@23@01 1)))))))
(check-sat)
; unknown
(pop) ; 13
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1))
    (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)))
  (not
    (=
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) (Seq_index xs@23@01 1))
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) (Seq_index xs@23@01 0)))))))
(check-sat)
; unknown
(pop) ; 13
; 0.01s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
  (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))))
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] i != j
(pop) ; 12
(set-option :timeout 0)
(push) ; 12
; [else-branch: 45 | !(j@75@01 < |xs@23@01|)]
(assert (not (< j@75@01 (Seq_length xs@23@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0))
    (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)))
  (not
    (=
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) (Seq_index xs@23@01 0))
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) (Seq_index xs@23@01 1)))))))
(check-sat)
; unknown
(pop) ; 13
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1))
    (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)))
  (not
    (=
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) (Seq_index xs@23@01 1))
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) (Seq_index xs@23@01 0)))))))
(check-sat)
; unknown
(pop) ; 13
; 0.01s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
  (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))))
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(pop) ; 12
(pop) ; 11
; Joined path conditions
(assert (=>
  (< j@75@01 (Seq_length xs@23@01))
  (and
    (< j@75@01 (Seq_length xs@23@01))
    (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
    (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0))))))
; Joined path conditions
(assert (=>
  (not (< j@75@01 (Seq_length xs@23@01)))
  (and
    (not (< j@75@01 (Seq_length xs@23@01)))
    (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
    (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0))))))
(assert (or (not (< j@75@01 (Seq_length xs@23@01))) (< j@75@01 (Seq_length xs@23@01))))
(pop) ; 10
(set-option :timeout 0)
(push) ; 10
; [else-branch: 44 | !(j@75@01 >= 0)]
(assert (not (>= j@75@01 0)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1))
    (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)))
  (not
    (=
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) (Seq_index xs@23@01 1))
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) (Seq_index xs@23@01 0)))))))
(check-sat)
; unknown
(pop) ; 11
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0))
    (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)))
  (not
    (=
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) (Seq_index xs@23@01 0))
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) (Seq_index xs@23@01 1)))))))
(check-sat)
; unknown
(pop) ; 11
; 0.01s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))
  (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))))
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (=>
  (>= j@75@01 0)
  (and
    (>= j@75@01 0)
    (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))
    (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
    (=>
      (< j@75@01 (Seq_length xs@23@01))
      (and
        (< j@75@01 (Seq_length xs@23@01))
        (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
        (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))))
    (=>
      (not (< j@75@01 (Seq_length xs@23@01)))
      (and
        (not (< j@75@01 (Seq_length xs@23@01)))
        (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
        (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))))
    (or
      (not (< j@75@01 (Seq_length xs@23@01)))
      (< j@75@01 (Seq_length xs@23@01))))))
; Joined path conditions
(assert (=>
  (not (>= j@75@01 0))
  (and
    (not (>= j@75@01 0))
    (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))
    (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1))))))
(assert (or (not (>= j@75@01 0)) (>= j@75@01 0)))
(pop) ; 8
(set-option :timeout 0)
(push) ; 8
; [else-branch: 43 | !(i@74@01 < |xs@23@01|)]
(assert (not (< i@74@01 (Seq_length xs@23@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0))
    (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)))
  (not
    (=
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) (Seq_index xs@23@01 0))
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) (Seq_index xs@23@01 1)))))))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1))
    (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)))
  (not
    (=
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) (Seq_index xs@23@01 1))
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) (Seq_index xs@23@01 0)))))))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
  (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))))
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (< i@74@01 (Seq_length xs@23@01))
  (and
    (< i@74@01 (Seq_length xs@23@01))
    (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
    (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))
    (=>
      (>= j@75@01 0)
      (and
        (>= j@75@01 0)
        (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))
        (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
        (=>
          (< j@75@01 (Seq_length xs@23@01))
          (and
            (< j@75@01 (Seq_length xs@23@01))
            (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
            (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))))
        (=>
          (not (< j@75@01 (Seq_length xs@23@01)))
          (and
            (not (< j@75@01 (Seq_length xs@23@01)))
            (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
            (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))))
        (or
          (not (< j@75@01 (Seq_length xs@23@01)))
          (< j@75@01 (Seq_length xs@23@01)))))
    (=>
      (not (>= j@75@01 0))
      (and
        (not (>= j@75@01 0))
        (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))
        (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))))
    (or (not (>= j@75@01 0)) (>= j@75@01 0)))))
; Joined path conditions
(assert (=>
  (not (< i@74@01 (Seq_length xs@23@01)))
  (and
    (not (< i@74@01 (Seq_length xs@23@01)))
    (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
    (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0))))))
(assert (or (not (< i@74@01 (Seq_length xs@23@01))) (< i@74@01 (Seq_length xs@23@01))))
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 42 | !(i@74@01 >= 0)]
(assert (not (>= i@74@01 0)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1))
    (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)))
  (not
    (=
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) (Seq_index xs@23@01 1))
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) (Seq_index xs@23@01 0)))))))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0))
    (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)))
  (not
    (=
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) (Seq_index xs@23@01 0))
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) (Seq_index xs@23@01 1)))))))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))
  (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))))
(declare-const sm@78@01 $FVF<f>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (-
          (ite
            (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
            $Perm.Write
            $Perm.No)
          (pTaken@31@01 r))
        (pTaken@33@01 r)))
    (= ($FVF.lookup_f (as sm@78@01  $FVF<f>) r) ($FVF.lookup_f $t@28@01 r)))
  :pattern (($FVF.lookup_f (as sm@78@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@28@01 r))
  :qid |qp.fvfValDef32|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@23@01 1))
    (=
      ($FVF.lookup_f (as sm@78@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@78@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@35@01  $FVF<f>) r))
  :qid |qp.fvfValDef33|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@23@01 0))
    (=
      ($FVF.lookup_f (as sm@78@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@78@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@63@01  $FVF<f>) r))
  :qid |qp.fvfValDef34|)))
(declare-const pm@79@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@79@01  $FPM) r)
    (+
      (+
        (-
          (-
            (ite
              (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
              $Perm.Write
              $Perm.No)
            (pTaken@31@01 r))
          (pTaken@33@01 r))
        (ite (= r (Seq_index xs@23@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@79@01  $FPM) r))
  :qid |qp.resPrmSumDef35|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@79@01  $FPM) r) $Perm.Write)
  :pattern ((inv@29@01 r))
  :qid |qp-fld-prm-bnd|)))
(assert (<= ($FVF.perm_f (as pm@79@01  $FPM) (Seq_index xs@23@01 1)) $Perm.Write))
(assert (<= ($FVF.perm_f (as pm@79@01  $FPM) (Seq_index xs@23@01 0)) $Perm.Write))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (-
          (ite
            (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
            $Perm.Write
            $Perm.No)
          (pTaken@31@01 r))
        (pTaken@33@01 r)))
    (= ($FVF.lookup_f (as sm@76@01  $FVF<f>) r) ($FVF.lookup_f $t@28@01 r)))
  :pattern (($FVF.lookup_f (as sm@76@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@28@01 r))
  :qid |qp.fvfValDef28|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@23@01 1))
    (=
      ($FVF.lookup_f (as sm@76@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@76@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@35@01  $FVF<f>) r))
  :qid |qp.fvfValDef29|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@23@01 0))
    (=
      ($FVF.lookup_f (as sm@76@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@76@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@63@01  $FVF<f>) r))
  :qid |qp.fvfValDef30|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@77@01  $FPM) r)
    (+
      (+
        (-
          (-
            (ite
              (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
              $Perm.Write
              $Perm.No)
            (pTaken@31@01 r))
          (pTaken@33@01 r))
        (ite (= r (Seq_index xs@23@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@77@01  $FPM) r))
  :qid |qp.resPrmSumDef31|)))
(assert (=>
  (>= i@74@01 0)
  (and
    (>= i@74@01 0)
    (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))
    (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@77@01  $FPM) r) $Perm.Write)
      :pattern ((inv@29@01 r))
      :qid |qp-fld-prm-bnd|))
    (<= ($FVF.perm_f (as pm@77@01  $FPM) (Seq_index xs@23@01 1)) $Perm.Write)
    (<= ($FVF.perm_f (as pm@77@01  $FPM) (Seq_index xs@23@01 0)) $Perm.Write)
    (=>
      (< i@74@01 (Seq_length xs@23@01))
      (and
        (< i@74@01 (Seq_length xs@23@01))
        (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
        (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))
        (=>
          (>= j@75@01 0)
          (and
            (>= j@75@01 0)
            (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))
            (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
            (=>
              (< j@75@01 (Seq_length xs@23@01))
              (and
                (< j@75@01 (Seq_length xs@23@01))
                (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
                (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))))
            (=>
              (not (< j@75@01 (Seq_length xs@23@01)))
              (and
                (not (< j@75@01 (Seq_length xs@23@01)))
                (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
                (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))))
            (or
              (not (< j@75@01 (Seq_length xs@23@01)))
              (< j@75@01 (Seq_length xs@23@01)))))
        (=>
          (not (>= j@75@01 0))
          (and
            (not (>= j@75@01 0))
            (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))
            (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))))
        (or (not (>= j@75@01 0)) (>= j@75@01 0))))
    (=>
      (not (< i@74@01 (Seq_length xs@23@01)))
      (and
        (not (< i@74@01 (Seq_length xs@23@01)))
        (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
        (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))))
    (or
      (not (< i@74@01 (Seq_length xs@23@01)))
      (< i@74@01 (Seq_length xs@23@01))))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (-
          (ite
            (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
            $Perm.Write
            $Perm.No)
          (pTaken@31@01 r))
        (pTaken@33@01 r)))
    (= ($FVF.lookup_f (as sm@78@01  $FVF<f>) r) ($FVF.lookup_f $t@28@01 r)))
  :pattern (($FVF.lookup_f (as sm@78@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@28@01 r))
  :qid |qp.fvfValDef32|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@23@01 1))
    (=
      ($FVF.lookup_f (as sm@78@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@78@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@35@01  $FVF<f>) r))
  :qid |qp.fvfValDef33|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@23@01 0))
    (=
      ($FVF.lookup_f (as sm@78@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@78@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@63@01  $FVF<f>) r))
  :qid |qp.fvfValDef34|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@79@01  $FPM) r)
    (+
      (+
        (-
          (-
            (ite
              (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
              $Perm.Write
              $Perm.No)
            (pTaken@31@01 r))
          (pTaken@33@01 r))
        (ite (= r (Seq_index xs@23@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@79@01  $FPM) r))
  :qid |qp.resPrmSumDef35|)))
(assert (=>
  (not (>= i@74@01 0))
  (and
    (not (>= i@74@01 0))
    (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))
    (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@79@01  $FPM) r) $Perm.Write)
      :pattern ((inv@29@01 r))
      :qid |qp-fld-prm-bnd|))
    (<= ($FVF.perm_f (as pm@79@01  $FPM) (Seq_index xs@23@01 1)) $Perm.Write)
    (<= ($FVF.perm_f (as pm@79@01  $FPM) (Seq_index xs@23@01 0)) $Perm.Write))))
(assert (or (not (>= i@74@01 0)) (>= i@74@01 0)))
(set-option :timeout 0)
(push) ; 5
; [then-branch: 46 | i@74@01 != j@75@01 && j@75@01 < |xs@23@01| && j@75@01 >= 0 && i@74@01 < |xs@23@01| && i@74@01 >= 0 | live]
; [else-branch: 46 | !(i@74@01 != j@75@01 && j@75@01 < |xs@23@01| && j@75@01 >= 0 && i@74@01 < |xs@23@01| && i@74@01 >= 0) | live]
(push) ; 6
; [then-branch: 46 | i@74@01 != j@75@01 && j@75@01 < |xs@23@01| && j@75@01 >= 0 && i@74@01 < |xs@23@01| && i@74@01 >= 0]
(assert (and
  (and
    (and
      (and (not (= i@74@01 j@75@01)) (< j@75@01 (Seq_length xs@23@01)))
      (>= j@75@01 0))
    (< i@74@01 (Seq_length xs@23@01)))
  (>= i@74@01 0)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1))
    (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)))
  (not
    (=
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) (Seq_index xs@23@01 1))
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) (Seq_index xs@23@01 0)))))))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0))
    (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)))
  (not
    (=
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) (Seq_index xs@23@01 0))
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) (Seq_index xs@23@01 1)))))))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))
  (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))))
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@79@01  $FPM) r) $Perm.Write)
  :pattern ((inv@29@01 r))
  :qid |qp-fld-prm-bnd|)))
(assert (<= ($FVF.perm_f (as pm@79@01  $FPM) (Seq_index xs@23@01 1)) $Perm.Write))
(assert (<= ($FVF.perm_f (as pm@79@01  $FPM) (Seq_index xs@23@01 0)) $Perm.Write))
; [eval] xs[i] != xs[j]
; [eval] xs[i]
; [eval] xs[j]
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 46 | !(i@74@01 != j@75@01 && j@75@01 < |xs@23@01| && j@75@01 >= 0 && i@74@01 < |xs@23@01| && i@74@01 >= 0)]
(assert (not
  (and
    (and
      (and
        (and (not (= i@74@01 j@75@01)) (< j@75@01 (Seq_length xs@23@01)))
        (>= j@75@01 0))
      (< i@74@01 (Seq_length xs@23@01)))
    (>= i@74@01 0))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1))
    (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)))
  (not
    (=
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) (Seq_index xs@23@01 1))
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) (Seq_index xs@23@01 0)))))))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0))
    (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)))
  (not
    (=
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) (Seq_index xs@23@01 0))
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) (Seq_index xs@23@01 1)))))))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))
  (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))))
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@79@01  $FPM) r) $Perm.Write)
  :pattern ((inv@29@01 r))
  :qid |qp-fld-prm-bnd|)))
(assert (<= ($FVF.perm_f (as pm@79@01  $FPM) (Seq_index xs@23@01 1)) $Perm.Write))
(assert (<= ($FVF.perm_f (as pm@79@01  $FPM) (Seq_index xs@23@01 0)) $Perm.Write))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (and
      (and
        (and (not (= i@74@01 j@75@01)) (< j@75@01 (Seq_length xs@23@01)))
        (>= j@75@01 0))
      (< i@74@01 (Seq_length xs@23@01)))
    (>= i@74@01 0))
  (and
    (not (= i@74@01 j@75@01))
    (< j@75@01 (Seq_length xs@23@01))
    (>= j@75@01 0)
    (< i@74@01 (Seq_length xs@23@01))
    (>= i@74@01 0)
    (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))
    (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@79@01  $FPM) r) $Perm.Write)
      :pattern ((inv@29@01 r))
      :qid |qp-fld-prm-bnd|))
    (<= ($FVF.perm_f (as pm@79@01  $FPM) (Seq_index xs@23@01 1)) $Perm.Write)
    (<= ($FVF.perm_f (as pm@79@01  $FPM) (Seq_index xs@23@01 0)) $Perm.Write))))
; Joined path conditions
(assert (=>
  (not
    (and
      (and
        (and
          (and (not (= i@74@01 j@75@01)) (< j@75@01 (Seq_length xs@23@01)))
          (>= j@75@01 0))
        (< i@74@01 (Seq_length xs@23@01)))
      (>= i@74@01 0)))
  (and
    (not
      (and
        (and
          (and
            (and (not (= i@74@01 j@75@01)) (< j@75@01 (Seq_length xs@23@01)))
            (>= j@75@01 0))
          (< i@74@01 (Seq_length xs@23@01)))
        (>= i@74@01 0)))
    (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))
    (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@79@01  $FPM) r) $Perm.Write)
      :pattern ((inv@29@01 r))
      :qid |qp-fld-prm-bnd|))
    (<= ($FVF.perm_f (as pm@79@01  $FPM) (Seq_index xs@23@01 1)) $Perm.Write)
    (<= ($FVF.perm_f (as pm@79@01  $FPM) (Seq_index xs@23@01 0)) $Perm.Write))))
(assert (or
  (not
    (and
      (and
        (and
          (and (not (= i@74@01 j@75@01)) (< j@75@01 (Seq_length xs@23@01)))
          (>= j@75@01 0))
        (< i@74@01 (Seq_length xs@23@01)))
      (>= i@74@01 0)))
  (and
    (and
      (and
        (and (not (= i@74@01 j@75@01)) (< j@75@01 (Seq_length xs@23@01)))
        (>= j@75@01 0))
      (< i@74@01 (Seq_length xs@23@01)))
    (>= i@74@01 0))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (-
          (ite
            (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
            $Perm.Write
            $Perm.No)
          (pTaken@31@01 r))
        (pTaken@33@01 r)))
    (= ($FVF.lookup_f (as sm@76@01  $FVF<f>) r) ($FVF.lookup_f $t@28@01 r)))
  :pattern (($FVF.lookup_f (as sm@76@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@28@01 r))
  :qid |qp.fvfValDef28|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@23@01 1))
    (=
      ($FVF.lookup_f (as sm@76@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@76@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@35@01  $FVF<f>) r))
  :qid |qp.fvfValDef29|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@23@01 0))
    (=
      ($FVF.lookup_f (as sm@76@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@76@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@63@01  $FVF<f>) r))
  :qid |qp.fvfValDef30|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@77@01  $FPM) r)
    (+
      (+
        (-
          (-
            (ite
              (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
              $Perm.Write
              $Perm.No)
            (pTaken@31@01 r))
          (pTaken@33@01 r))
        (ite (= r (Seq_index xs@23@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@77@01  $FPM) r))
  :qid |qp.resPrmSumDef31|)))
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (-
          (ite
            (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
            $Perm.Write
            $Perm.No)
          (pTaken@31@01 r))
        (pTaken@33@01 r)))
    (= ($FVF.lookup_f (as sm@78@01  $FVF<f>) r) ($FVF.lookup_f $t@28@01 r)))
  :pattern (($FVF.lookup_f (as sm@78@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@28@01 r))
  :qid |qp.fvfValDef32|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@23@01 1))
    (=
      ($FVF.lookup_f (as sm@78@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@78@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@35@01  $FVF<f>) r))
  :qid |qp.fvfValDef33|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@23@01 0))
    (=
      ($FVF.lookup_f (as sm@78@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@78@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@63@01  $FVF<f>) r))
  :qid |qp.fvfValDef34|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@79@01  $FPM) r)
    (+
      (+
        (-
          (-
            (ite
              (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
              $Perm.Write
              $Perm.No)
            (pTaken@31@01 r))
          (pTaken@33@01 r))
        (ite (= r (Seq_index xs@23@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@79@01  $FPM) r))
  :qid |qp.resPrmSumDef35|)))
; Nested auxiliary terms: non-globals (aux)
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((i@74@01 Int) (j@75@01 Int)) (!
  (=>
    (and
      (and
        (and
          (and (not (= i@74@01 j@75@01)) (< j@75@01 (Seq_length xs@23@01)))
          (>= j@75@01 0))
        (< i@74@01 (Seq_length xs@23@01)))
      (>= i@74@01 0))
    (not (= (Seq_index xs@23@01 i@74@01) (Seq_index xs@23@01 j@75@01))))
  
  :qid |prog.l22|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (forall ((i@74@01 Int) (j@75@01 Int)) (!
  (=>
    (and
      (and
        (and
          (and (not (= i@74@01 j@75@01)) (< j@75@01 (Seq_length xs@23@01)))
          (>= j@75@01 0))
        (< i@74@01 (Seq_length xs@23@01)))
      (>= i@74@01 0))
    (not (= (Seq_index xs@23@01 i@74@01) (Seq_index xs@23@01 j@75@01))))
  
  :qid |prog.l22|)))
(declare-const i@80@01 Int)
(push) ; 4
; [eval] 0 <= i && i < |xs|
; [eval] 0 <= i
(push) ; 5
; [then-branch: 47 | 0 <= i@80@01 | live]
; [else-branch: 47 | !(0 <= i@80@01) | live]
(push) ; 6
; [then-branch: 47 | 0 <= i@80@01]
(assert (<= 0 i@80@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1))
    (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)))
  (not
    (=
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) (Seq_index xs@23@01 1))
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) (Seq_index xs@23@01 0)))))))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0))
    (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)))
  (not
    (=
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) (Seq_index xs@23@01 0))
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) (Seq_index xs@23@01 1)))))))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))
  (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))))
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(declare-const pm@81@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@81@01  $FPM) r)
    (+
      (+
        (-
          (-
            (ite
              (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
              $Perm.Write
              $Perm.No)
            (pTaken@31@01 r))
          (pTaken@33@01 r))
        (ite (= r (Seq_index xs@23@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@81@01  $FPM) r))
  :qid |qp.resPrmSumDef36|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@81@01  $FPM) r) $Perm.Write)
  :pattern ((inv@29@01 r))
  :qid |qp-fld-prm-bnd|)))
(assert (<= ($FVF.perm_f (as pm@81@01  $FPM) (Seq_index xs@23@01 1)) $Perm.Write))
(assert (<= ($FVF.perm_f (as pm@81@01  $FPM) (Seq_index xs@23@01 0)) $Perm.Write))
; [eval] i < |xs|
; [eval] |xs|
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 47 | !(0 <= i@80@01)]
(assert (not (<= 0 i@80@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1))
    (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)))
  (not
    (=
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) (Seq_index xs@23@01 1))
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) (Seq_index xs@23@01 0)))))))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0))
    (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)))
  (not
    (=
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) (Seq_index xs@23@01 0))
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) (Seq_index xs@23@01 1)))))))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))
  (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))))
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(declare-const pm@82@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@82@01  $FPM) r)
    (+
      (+
        (-
          (-
            (ite
              (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
              $Perm.Write
              $Perm.No)
            (pTaken@31@01 r))
          (pTaken@33@01 r))
        (ite (= r (Seq_index xs@23@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@82@01  $FPM) r))
  :qid |qp.resPrmSumDef37|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@82@01  $FPM) r) $Perm.Write)
  :pattern ((inv@29@01 r))
  :qid |qp-fld-prm-bnd|)))
(assert (<= ($FVF.perm_f (as pm@82@01  $FPM) (Seq_index xs@23@01 1)) $Perm.Write))
(assert (<= ($FVF.perm_f (as pm@82@01  $FPM) (Seq_index xs@23@01 0)) $Perm.Write))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@81@01  $FPM) r)
    (+
      (+
        (-
          (-
            (ite
              (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
              $Perm.Write
              $Perm.No)
            (pTaken@31@01 r))
          (pTaken@33@01 r))
        (ite (= r (Seq_index xs@23@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@81@01  $FPM) r))
  :qid |qp.resPrmSumDef36|)))
(assert (=>
  (<= 0 i@80@01)
  (and
    (<= 0 i@80@01)
    (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))
    (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@81@01  $FPM) r) $Perm.Write)
      :pattern ((inv@29@01 r))
      :qid |qp-fld-prm-bnd|))
    (<= ($FVF.perm_f (as pm@81@01  $FPM) (Seq_index xs@23@01 1)) $Perm.Write)
    (<= ($FVF.perm_f (as pm@81@01  $FPM) (Seq_index xs@23@01 0)) $Perm.Write))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@82@01  $FPM) r)
    (+
      (+
        (-
          (-
            (ite
              (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
              $Perm.Write
              $Perm.No)
            (pTaken@31@01 r))
          (pTaken@33@01 r))
        (ite (= r (Seq_index xs@23@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@82@01  $FPM) r))
  :qid |qp.resPrmSumDef37|)))
(assert (=>
  (not (<= 0 i@80@01))
  (and
    (not (<= 0 i@80@01))
    (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))
    (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@82@01  $FPM) r) $Perm.Write)
      :pattern ((inv@29@01 r))
      :qid |qp-fld-prm-bnd|))
    (<= ($FVF.perm_f (as pm@82@01  $FPM) (Seq_index xs@23@01 1)) $Perm.Write)
    (<= ($FVF.perm_f (as pm@82@01  $FPM) (Seq_index xs@23@01 0)) $Perm.Write))))
(assert (or (not (<= 0 i@80@01)) (<= 0 i@80@01)))
(assert (and (< i@80@01 (Seq_length xs@23@01)) (<= 0 i@80@01)))
; [eval] xs[i]
(set-option :timeout 0)
(push) ; 5
(assert (not (>= i@80@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@83@01 ($Ref) Int)
; Nested auxiliary terms: globals
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@81@01  $FPM) r)
    (+
      (+
        (-
          (-
            (ite
              (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
              $Perm.Write
              $Perm.No)
            (pTaken@31@01 r))
          (pTaken@33@01 r))
        (ite (= r (Seq_index xs@23@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@81@01  $FPM) r))
  :qid |qp.resPrmSumDef36|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@82@01  $FPM) r)
    (+
      (+
        (-
          (-
            (ite
              (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
              $Perm.Write
              $Perm.No)
            (pTaken@31@01 r))
          (pTaken@33@01 r))
        (ite (= r (Seq_index xs@23@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@82@01  $FPM) r))
  :qid |qp.resPrmSumDef37|)))
; Nested auxiliary terms: non-globals
(assert (forall ((i@80@01 Int)) (!
  (=>
    (and (< i@80@01 (Seq_length xs@23@01)) (<= 0 i@80@01))
    (and
      (=>
        (<= 0 i@80@01)
        (and
          (<= 0 i@80@01)
          (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))
          (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
          (forall ((r $Ref)) (!
            (<= ($FVF.perm_f (as pm@81@01  $FPM) r) $Perm.Write)
            :pattern ((inv@29@01 r))
            :qid |qp-fld-prm-bnd|))
          (<=
            ($FVF.perm_f (as pm@81@01  $FPM) (Seq_index xs@23@01 1))
            $Perm.Write)
          (<=
            ($FVF.perm_f (as pm@81@01  $FPM) (Seq_index xs@23@01 0))
            $Perm.Write)))
      (=>
        (not (<= 0 i@80@01))
        (and
          (not (<= 0 i@80@01))
          (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))
          (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
          (forall ((r $Ref)) (!
            (<= ($FVF.perm_f (as pm@82@01  $FPM) r) $Perm.Write)
            :pattern ((inv@29@01 r))
            :qid |qp-fld-prm-bnd|))
          (<=
            ($FVF.perm_f (as pm@82@01  $FPM) (Seq_index xs@23@01 1))
            $Perm.Write)
          (<=
            ($FVF.perm_f (as pm@82@01  $FPM) (Seq_index xs@23@01 0))
            $Perm.Write)))
      (or (not (<= 0 i@80@01)) (<= 0 i@80@01))))
  :pattern ((Seq_index xs@23@01 i@80@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@80@01 Int) (i2@80@01 Int)) (!
  (=>
    (and
      (and (< i1@80@01 (Seq_length xs@23@01)) (<= 0 i1@80@01))
      (and (< i2@80@01 (Seq_length xs@23@01)) (<= 0 i2@80@01))
      (= (Seq_index xs@23@01 i1@80@01) (Seq_index xs@23@01 i2@80@01)))
    (= i1@80@01 i2@80@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@80@01 Int)) (!
  (=>
    (and (< i@80@01 (Seq_length xs@23@01)) (<= 0 i@80@01))
    (= (inv@83@01 (Seq_index xs@23@01 i@80@01)) i@80@01))
  :pattern ((Seq_index xs@23@01 i@80@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@83@01 r) (Seq_length xs@23@01)) (<= 0 (inv@83@01 r)))
    (= (Seq_index xs@23@01 (inv@83@01 r)) r))
  :pattern ((inv@83@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@84@01 ((r $Ref)) $Perm
  (ite
    (and (< (inv@83@01 r) (Seq_length xs@23@01)) (<= 0 (inv@83@01 r)))
    ($Perm.min
      (-
        (-
          (ite
            (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
            $Perm.Write
            $Perm.No)
          (pTaken@31@01 r))
        (pTaken@33@01 r))
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@85@01 ((r $Ref)) $Perm
  (ite
    (and (< (inv@83@01 r) (Seq_length xs@23@01)) (<= 0 (inv@83@01 r)))
    ($Perm.min
      (ite (= r (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@84@01 r)))
    $Perm.No))
(define-fun pTaken@86@01 ((r $Ref)) $Perm
  (ite
    (and (< (inv@83@01 r) (Seq_length xs@23@01)) (<= 0 (inv@83@01 r)))
    ($Perm.min
      (ite (= r (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)
      (- (- $Perm.Write (pTaken@84@01 r)) (pTaken@85@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (-
        (-
          (ite
            (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
            $Perm.Write
            $Perm.No)
          (pTaken@31@01 r))
        (pTaken@33@01 r))
      (pTaken@84@01 r))
    $Perm.No)
  
  :qid |quant-u-118|))))
(check-sat)
; unsat
(pop) ; 4
; 0.01s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (< (inv@83@01 r) (Seq_length xs@23@01)) (<= 0 (inv@83@01 r)))
    (= (- $Perm.Write (pTaken@84@01 r)) $Perm.No))
  
  :qid |quant-u-119|))))
(check-sat)
; unknown
(pop) ; 4
; 0.02s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (=
  (-
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)
    (pTaken@85@01 (Seq_index xs@23@01 1)))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (< (inv@83@01 r) (Seq_length xs@23@01)) (<= 0 (inv@83@01 r)))
    (= (- (- $Perm.Write (pTaken@84@01 r)) (pTaken@85@01 r)) $Perm.No))
  
  :qid |quant-u-121|))))
(check-sat)
; unknown
(pop) ; 4
; 0.02s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (=
  (-
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)
    (pTaken@86@01 (Seq_index xs@23@01 0)))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (< (inv@83@01 r) (Seq_length xs@23@01)) (<= 0 (inv@83@01 r)))
    (=
      (- (- (- $Perm.Write (pTaken@84@01 r)) (pTaken@85@01 r)) (pTaken@86@01 r))
      $Perm.No))
  
  :qid |quant-u-123|))))
(check-sat)
; unsat
(pop) ; 4
; 0.01s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@87@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@87@01  $FVF<f>)))
      (and (< (inv@83@01 r) (Seq_length xs@23@01)) (<= 0 (inv@83@01 r))))
    (=>
      (and (< (inv@83@01 r) (Seq_length xs@23@01)) (<= 0 (inv@83@01 r)))
      (Set_in r ($FVF.domain_f (as sm@87@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@87@01  $FVF<f>))))
  :qid |qp.fvfDomDef41|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@83@01 r) (Seq_length xs@23@01)) (<= 0 (inv@83@01 r)))
      (<
        $Perm.No
        (-
          (-
            (ite
              (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
              $Perm.Write
              $Perm.No)
            (pTaken@31@01 r))
          (pTaken@33@01 r))))
    (= ($FVF.lookup_f (as sm@87@01  $FVF<f>) r) ($FVF.lookup_f $t@28@01 r)))
  :pattern (($FVF.lookup_f (as sm@87@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@28@01 r))
  :qid |qp.fvfValDef38|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@83@01 r) (Seq_length xs@23@01)) (<= 0 (inv@83@01 r)))
      (= r (Seq_index xs@23@01 1)))
    (=
      ($FVF.lookup_f (as sm@87@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@87@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@35@01  $FVF<f>) r))
  :qid |qp.fvfValDef39|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@83@01 r) (Seq_length xs@23@01)) (<= 0 (inv@83@01 r)))
      (= r (Seq_index xs@23@01 0)))
    (=
      ($FVF.lookup_f (as sm@87@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@87@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@63@01  $FVF<f>) r))
  :qid |qp.fvfValDef40|)))
; [eval] |xs| > 3
; [eval] |xs|
(assert (fun02%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$FVF<f>To$Snap (as sm@87@01  $FVF<f>))
    $Snap.unit)) xs@23@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (-
          (ite
            (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
            $Perm.Write
            $Perm.No)
          (pTaken@31@01 r))
        (pTaken@33@01 r)))
    (= ($FVF.lookup_f (as sm@76@01  $FVF<f>) r) ($FVF.lookup_f $t@28@01 r)))
  :pattern (($FVF.lookup_f (as sm@76@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@28@01 r))
  :qid |qp.fvfValDef28|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@23@01 1))
    (=
      ($FVF.lookup_f (as sm@76@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@76@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@35@01  $FVF<f>) r))
  :qid |qp.fvfValDef29|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@23@01 0))
    (=
      ($FVF.lookup_f (as sm@76@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@76@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@63@01  $FVF<f>) r))
  :qid |qp.fvfValDef30|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@77@01  $FPM) r)
    (+
      (+
        (-
          (-
            (ite
              (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
              $Perm.Write
              $Perm.No)
            (pTaken@31@01 r))
          (pTaken@33@01 r))
        (ite (= r (Seq_index xs@23@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@77@01  $FPM) r))
  :qid |qp.resPrmSumDef31|)))
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (-
          (ite
            (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
            $Perm.Write
            $Perm.No)
          (pTaken@31@01 r))
        (pTaken@33@01 r)))
    (= ($FVF.lookup_f (as sm@78@01  $FVF<f>) r) ($FVF.lookup_f $t@28@01 r)))
  :pattern (($FVF.lookup_f (as sm@78@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@28@01 r))
  :qid |qp.fvfValDef32|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@23@01 1))
    (=
      ($FVF.lookup_f (as sm@78@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@78@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@35@01  $FVF<f>) r))
  :qid |qp.fvfValDef33|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@23@01 0))
    (=
      ($FVF.lookup_f (as sm@78@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@78@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@63@01  $FVF<f>) r))
  :qid |qp.fvfValDef34|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@79@01  $FPM) r)
    (+
      (+
        (-
          (-
            (ite
              (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
              $Perm.Write
              $Perm.No)
            (pTaken@31@01 r))
          (pTaken@33@01 r))
        (ite (= r (Seq_index xs@23@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@79@01  $FPM) r))
  :qid |qp.resPrmSumDef35|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@81@01  $FPM) r)
    (+
      (+
        (-
          (-
            (ite
              (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
              $Perm.Write
              $Perm.No)
            (pTaken@31@01 r))
          (pTaken@33@01 r))
        (ite (= r (Seq_index xs@23@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@81@01  $FPM) r))
  :qid |qp.resPrmSumDef36|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@82@01  $FPM) r)
    (+
      (+
        (-
          (-
            (ite
              (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
              $Perm.Write
              $Perm.No)
            (pTaken@31@01 r))
          (pTaken@33@01 r))
        (ite (= r (Seq_index xs@23@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@82@01  $FPM) r))
  :qid |qp.resPrmSumDef37|)))
(assert (forall ((i@80@01 Int)) (!
  (=>
    (and (< i@80@01 (Seq_length xs@23@01)) (<= 0 i@80@01))
    (= (inv@83@01 (Seq_index xs@23@01 i@80@01)) i@80@01))
  :pattern ((Seq_index xs@23@01 i@80@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@83@01 r) (Seq_length xs@23@01)) (<= 0 (inv@83@01 r)))
    (= (Seq_index xs@23@01 (inv@83@01 r)) r))
  :pattern ((inv@83@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@87@01  $FVF<f>)))
      (and (< (inv@83@01 r) (Seq_length xs@23@01)) (<= 0 (inv@83@01 r))))
    (=>
      (and (< (inv@83@01 r) (Seq_length xs@23@01)) (<= 0 (inv@83@01 r)))
      (Set_in r ($FVF.domain_f (as sm@87@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@87@01  $FVF<f>))))
  :qid |qp.fvfDomDef41|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@83@01 r) (Seq_length xs@23@01)) (<= 0 (inv@83@01 r)))
      (<
        $Perm.No
        (-
          (-
            (ite
              (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
              $Perm.Write
              $Perm.No)
            (pTaken@31@01 r))
          (pTaken@33@01 r))))
    (= ($FVF.lookup_f (as sm@87@01  $FVF<f>) r) ($FVF.lookup_f $t@28@01 r)))
  :pattern (($FVF.lookup_f (as sm@87@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@28@01 r))
  :qid |qp.fvfValDef38|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@83@01 r) (Seq_length xs@23@01)) (<= 0 (inv@83@01 r)))
      (= r (Seq_index xs@23@01 1)))
    (=
      ($FVF.lookup_f (as sm@87@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@87@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@35@01  $FVF<f>) r))
  :qid |qp.fvfValDef39|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@83@01 r) (Seq_length xs@23@01)) (<= 0 (inv@83@01 r)))
      (= r (Seq_index xs@23@01 0)))
    (=
      ($FVF.lookup_f (as sm@87@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@87@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@63@01  $FVF<f>) r))
  :qid |qp.fvfValDef40|)))
(assert (and
  (forall ((i@74@01 Int) (j@75@01 Int)) (!
    (=>
      (and
        (and
          (and
            (and (not (= i@74@01 j@75@01)) (< j@75@01 (Seq_length xs@23@01)))
            (>= j@75@01 0))
          (< i@74@01 (Seq_length xs@23@01)))
        (>= i@74@01 0))
      (not (= (Seq_index xs@23@01 i@74@01) (Seq_index xs@23@01 j@75@01))))
    
    :qid |prog.l22|))
  (forall ((i@80@01 Int)) (!
    (=>
      (and (< i@80@01 (Seq_length xs@23@01)) (<= 0 i@80@01))
      (and
        (=>
          (<= 0 i@80@01)
          (and
            (<= 0 i@80@01)
            (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))
            (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
            (forall ((r $Ref)) (!
              (<= ($FVF.perm_f (as pm@81@01  $FPM) r) $Perm.Write)
              :pattern ((inv@29@01 r))
              :qid |qp-fld-prm-bnd|))
            (<=
              ($FVF.perm_f (as pm@81@01  $FPM) (Seq_index xs@23@01 1))
              $Perm.Write)
            (<=
              ($FVF.perm_f (as pm@81@01  $FPM) (Seq_index xs@23@01 0))
              $Perm.Write)))
        (=>
          (not (<= 0 i@80@01))
          (and
            (not (<= 0 i@80@01))
            (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))
            (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
            (forall ((r $Ref)) (!
              (<= ($FVF.perm_f (as pm@82@01  $FPM) r) $Perm.Write)
              :pattern ((inv@29@01 r))
              :qid |qp-fld-prm-bnd|))
            (<=
              ($FVF.perm_f (as pm@82@01  $FPM) (Seq_index xs@23@01 1))
              $Perm.Write)
            (<=
              ($FVF.perm_f (as pm@82@01  $FPM) (Seq_index xs@23@01 0))
              $Perm.Write)))
        (or (not (<= 0 i@80@01)) (<= 0 i@80@01))))
    :pattern ((Seq_index xs@23@01 i@80@01))
    :qid |f-aux|))
  (fun02%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<f>To$Snap (as sm@87@01  $FVF<f>))
      $Snap.unit)) xs@23@01)))
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  (fun02 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<f>To$Snap (as sm@87@01  $FVF<f>))
      $Snap.unit)) xs@23@01)
  14)))
(check-sat)
; unknown
(pop) ; 3
; 0.12s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0))
    (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)))
  (not
    (=
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) (Seq_index xs@23@01 0))
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) (Seq_index xs@23@01 1)))))))
(check-sat)
; unknown
(pop) ; 3
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1))
    (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)))
  (not
    (=
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) (Seq_index xs@23@01 1))
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) (Seq_index xs@23@01 0)))))))
(check-sat)
; unknown
(pop) ; 3
; 0.01s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
  (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))))
(declare-const sm@88@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@23@01 0))
    (=
      ($FVF.lookup_f (as sm@88@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@88@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@63@01  $FVF<f>) r))
  :qid |qp.fvfValDef42|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@23@01 1))
    (=
      ($FVF.lookup_f (as sm@88@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@88@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@35@01  $FVF<f>) r))
  :qid |qp.fvfValDef43|)))
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (-
          (ite
            (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
            $Perm.Write
            $Perm.No)
          (pTaken@31@01 r))
        (pTaken@33@01 r)))
    (= ($FVF.lookup_f (as sm@88@01  $FVF<f>) r) ($FVF.lookup_f $t@28@01 r)))
  :pattern (($FVF.lookup_f (as sm@88@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@28@01 r))
  :qid |qp.fvfValDef44|)))
(declare-const pm@89@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@89@01  $FPM) r)
    (+
      (+
        (ite (= r (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)
        (ite (= r (Seq_index xs@23@01 1)) $Perm.Write $Perm.No))
      (-
        (-
          (ite
            (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
            $Perm.Write
            $Perm.No)
          (pTaken@31@01 r))
        (pTaken@33@01 r))))
  :pattern (($FVF.perm_f (as pm@89@01  $FPM) r))
  :qid |qp.resPrmSumDef45|)))
(assert (<= ($FVF.perm_f (as pm@89@01  $FPM) (Seq_index xs@23@01 0)) $Perm.Write))
(assert (<= ($FVF.perm_f (as pm@89@01  $FPM) (Seq_index xs@23@01 1)) $Perm.Write))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@89@01  $FPM) r) $Perm.Write)
  :pattern ((inv@29@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] fun02(xs) == 14
; [eval] fun02(xs)
(set-option :timeout 0)
(push) ; 3
; [eval] (forall i: Int, j: Int ::i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==> xs[i] != xs[j])
(declare-const i@90@01 Int)
(declare-const j@91@01 Int)
(push) ; 4
; [eval] i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==> xs[i] != xs[j]
; [eval] i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j)))
; [eval] i >= 0
(push) ; 5
; [then-branch: 48 | i@90@01 >= 0 | live]
; [else-branch: 48 | !(i@90@01 >= 0) | live]
(push) ; 6
; [then-branch: 48 | i@90@01 >= 0]
(assert (>= i@90@01 0))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0))
    (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)))
  (not
    (=
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) (Seq_index xs@23@01 0))
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) (Seq_index xs@23@01 1)))))))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1))
    (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)))
  (not
    (=
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) (Seq_index xs@23@01 1))
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) (Seq_index xs@23@01 0)))))))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
  (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))))
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] i < |xs|
; [eval] |xs|
(set-option :timeout 0)
(push) ; 7
; [then-branch: 49 | i@90@01 < |xs@23@01| | live]
; [else-branch: 49 | !(i@90@01 < |xs@23@01|) | live]
(push) ; 8
; [then-branch: 49 | i@90@01 < |xs@23@01|]
(assert (< i@90@01 (Seq_length xs@23@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1))
    (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)))
  (not
    (=
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) (Seq_index xs@23@01 1))
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) (Seq_index xs@23@01 0)))))))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0))
    (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)))
  (not
    (=
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) (Seq_index xs@23@01 0))
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) (Seq_index xs@23@01 1)))))))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))
  (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))))
(declare-const sm@92@01 $FVF<f>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (-
          (ite
            (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
            $Perm.Write
            $Perm.No)
          (pTaken@31@01 r))
        (pTaken@33@01 r)))
    (= ($FVF.lookup_f (as sm@92@01  $FVF<f>) r) ($FVF.lookup_f $t@28@01 r)))
  :pattern (($FVF.lookup_f (as sm@92@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@28@01 r))
  :qid |qp.fvfValDef46|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@23@01 1))
    (=
      ($FVF.lookup_f (as sm@92@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@92@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@35@01  $FVF<f>) r))
  :qid |qp.fvfValDef47|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@23@01 0))
    (=
      ($FVF.lookup_f (as sm@92@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@92@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@63@01  $FVF<f>) r))
  :qid |qp.fvfValDef48|)))
(declare-const pm@93@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@93@01  $FPM) r)
    (+
      (+
        (-
          (-
            (ite
              (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
              $Perm.Write
              $Perm.No)
            (pTaken@31@01 r))
          (pTaken@33@01 r))
        (ite (= r (Seq_index xs@23@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@93@01  $FPM) r))
  :qid |qp.resPrmSumDef49|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@93@01  $FPM) r) $Perm.Write)
  :pattern ((inv@29@01 r))
  :qid |qp-fld-prm-bnd|)))
(assert (<= ($FVF.perm_f (as pm@93@01  $FPM) (Seq_index xs@23@01 1)) $Perm.Write))
(assert (<= ($FVF.perm_f (as pm@93@01  $FPM) (Seq_index xs@23@01 0)) $Perm.Write))
; [eval] j >= 0
(set-option :timeout 0)
(push) ; 9
; [then-branch: 50 | j@91@01 >= 0 | live]
; [else-branch: 50 | !(j@91@01 >= 0) | live]
(push) ; 10
; [then-branch: 50 | j@91@01 >= 0]
(assert (>= j@91@01 0))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0))
    (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)))
  (not
    (=
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) (Seq_index xs@23@01 0))
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) (Seq_index xs@23@01 1)))))))
(check-sat)
; unknown
(pop) ; 11
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1))
    (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)))
  (not
    (=
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) (Seq_index xs@23@01 1))
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) (Seq_index xs@23@01 0)))))))
(check-sat)
; unknown
(pop) ; 11
; 0.01s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
  (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))))
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] j < |xs|
; [eval] |xs|
(set-option :timeout 0)
(push) ; 11
; [then-branch: 51 | j@91@01 < |xs@23@01| | live]
; [else-branch: 51 | !(j@91@01 < |xs@23@01|) | live]
(push) ; 12
; [then-branch: 51 | j@91@01 < |xs@23@01|]
(assert (< j@91@01 (Seq_length xs@23@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1))
    (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)))
  (not
    (=
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) (Seq_index xs@23@01 1))
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) (Seq_index xs@23@01 0)))))))
(check-sat)
; unknown
(pop) ; 13
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0))
    (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)))
  (not
    (=
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) (Seq_index xs@23@01 0))
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) (Seq_index xs@23@01 1)))))))
(check-sat)
; unknown
(pop) ; 13
; 0.01s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))
  (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))))
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] i != j
(pop) ; 12
(set-option :timeout 0)
(push) ; 12
; [else-branch: 51 | !(j@91@01 < |xs@23@01|)]
(assert (not (< j@91@01 (Seq_length xs@23@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1))
    (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)))
  (not
    (=
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) (Seq_index xs@23@01 1))
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) (Seq_index xs@23@01 0)))))))
(check-sat)
; unknown
(pop) ; 13
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0))
    (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)))
  (not
    (=
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) (Seq_index xs@23@01 0))
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) (Seq_index xs@23@01 1)))))))
(check-sat)
; unknown
(pop) ; 13
; 0.01s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))
  (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))))
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(pop) ; 12
(pop) ; 11
; Joined path conditions
(assert (=>
  (< j@91@01 (Seq_length xs@23@01))
  (and
    (< j@91@01 (Seq_length xs@23@01))
    (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))
    (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1))))))
; Joined path conditions
(assert (=>
  (not (< j@91@01 (Seq_length xs@23@01)))
  (and
    (not (< j@91@01 (Seq_length xs@23@01)))
    (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))
    (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1))))))
(assert (or (not (< j@91@01 (Seq_length xs@23@01))) (< j@91@01 (Seq_length xs@23@01))))
(pop) ; 10
(set-option :timeout 0)
(push) ; 10
; [else-branch: 50 | !(j@91@01 >= 0)]
(assert (not (>= j@91@01 0)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0))
    (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)))
  (not
    (=
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) (Seq_index xs@23@01 0))
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) (Seq_index xs@23@01 1)))))))
(check-sat)
; unknown
(pop) ; 11
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1))
    (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)))
  (not
    (=
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) (Seq_index xs@23@01 1))
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) (Seq_index xs@23@01 0)))))))
(check-sat)
; unknown
(pop) ; 11
; 0.01s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
  (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))))
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (=>
  (>= j@91@01 0)
  (and
    (>= j@91@01 0)
    (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
    (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))
    (=>
      (< j@91@01 (Seq_length xs@23@01))
      (and
        (< j@91@01 (Seq_length xs@23@01))
        (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))
        (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))))
    (=>
      (not (< j@91@01 (Seq_length xs@23@01)))
      (and
        (not (< j@91@01 (Seq_length xs@23@01)))
        (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))
        (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))))
    (or
      (not (< j@91@01 (Seq_length xs@23@01)))
      (< j@91@01 (Seq_length xs@23@01))))))
; Joined path conditions
(assert (=>
  (not (>= j@91@01 0))
  (and
    (not (>= j@91@01 0))
    (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
    (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0))))))
(assert (or (not (>= j@91@01 0)) (>= j@91@01 0)))
(pop) ; 8
(set-option :timeout 0)
(push) ; 8
; [else-branch: 49 | !(i@90@01 < |xs@23@01|)]
(assert (not (< i@90@01 (Seq_length xs@23@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1))
    (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)))
  (not
    (=
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) (Seq_index xs@23@01 1))
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) (Seq_index xs@23@01 0)))))))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0))
    (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)))
  (not
    (=
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) (Seq_index xs@23@01 0))
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) (Seq_index xs@23@01 1)))))))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))
  (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))))
(declare-const sm@94@01 $FVF<f>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (-
          (ite
            (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
            $Perm.Write
            $Perm.No)
          (pTaken@31@01 r))
        (pTaken@33@01 r)))
    (= ($FVF.lookup_f (as sm@94@01  $FVF<f>) r) ($FVF.lookup_f $t@28@01 r)))
  :pattern (($FVF.lookup_f (as sm@94@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@28@01 r))
  :qid |qp.fvfValDef50|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@23@01 1))
    (=
      ($FVF.lookup_f (as sm@94@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@94@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@35@01  $FVF<f>) r))
  :qid |qp.fvfValDef51|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@23@01 0))
    (=
      ($FVF.lookup_f (as sm@94@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@94@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@63@01  $FVF<f>) r))
  :qid |qp.fvfValDef52|)))
(declare-const pm@95@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@95@01  $FPM) r)
    (+
      (+
        (-
          (-
            (ite
              (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
              $Perm.Write
              $Perm.No)
            (pTaken@31@01 r))
          (pTaken@33@01 r))
        (ite (= r (Seq_index xs@23@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@95@01  $FPM) r))
  :qid |qp.resPrmSumDef53|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@95@01  $FPM) r) $Perm.Write)
  :pattern ((inv@29@01 r))
  :qid |qp-fld-prm-bnd|)))
(assert (<= ($FVF.perm_f (as pm@95@01  $FPM) (Seq_index xs@23@01 1)) $Perm.Write))
(assert (<= ($FVF.perm_f (as pm@95@01  $FPM) (Seq_index xs@23@01 0)) $Perm.Write))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (-
          (ite
            (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
            $Perm.Write
            $Perm.No)
          (pTaken@31@01 r))
        (pTaken@33@01 r)))
    (= ($FVF.lookup_f (as sm@92@01  $FVF<f>) r) ($FVF.lookup_f $t@28@01 r)))
  :pattern (($FVF.lookup_f (as sm@92@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@28@01 r))
  :qid |qp.fvfValDef46|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@23@01 1))
    (=
      ($FVF.lookup_f (as sm@92@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@92@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@35@01  $FVF<f>) r))
  :qid |qp.fvfValDef47|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@23@01 0))
    (=
      ($FVF.lookup_f (as sm@92@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@92@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@63@01  $FVF<f>) r))
  :qid |qp.fvfValDef48|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@93@01  $FPM) r)
    (+
      (+
        (-
          (-
            (ite
              (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
              $Perm.Write
              $Perm.No)
            (pTaken@31@01 r))
          (pTaken@33@01 r))
        (ite (= r (Seq_index xs@23@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@93@01  $FPM) r))
  :qid |qp.resPrmSumDef49|)))
(assert (=>
  (< i@90@01 (Seq_length xs@23@01))
  (and
    (< i@90@01 (Seq_length xs@23@01))
    (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))
    (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@93@01  $FPM) r) $Perm.Write)
      :pattern ((inv@29@01 r))
      :qid |qp-fld-prm-bnd|))
    (<= ($FVF.perm_f (as pm@93@01  $FPM) (Seq_index xs@23@01 1)) $Perm.Write)
    (<= ($FVF.perm_f (as pm@93@01  $FPM) (Seq_index xs@23@01 0)) $Perm.Write)
    (=>
      (>= j@91@01 0)
      (and
        (>= j@91@01 0)
        (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
        (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))
        (=>
          (< j@91@01 (Seq_length xs@23@01))
          (and
            (< j@91@01 (Seq_length xs@23@01))
            (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))
            (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))))
        (=>
          (not (< j@91@01 (Seq_length xs@23@01)))
          (and
            (not (< j@91@01 (Seq_length xs@23@01)))
            (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))
            (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))))
        (or
          (not (< j@91@01 (Seq_length xs@23@01)))
          (< j@91@01 (Seq_length xs@23@01)))))
    (=>
      (not (>= j@91@01 0))
      (and
        (not (>= j@91@01 0))
        (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
        (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))))
    (or (not (>= j@91@01 0)) (>= j@91@01 0)))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (-
          (ite
            (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
            $Perm.Write
            $Perm.No)
          (pTaken@31@01 r))
        (pTaken@33@01 r)))
    (= ($FVF.lookup_f (as sm@94@01  $FVF<f>) r) ($FVF.lookup_f $t@28@01 r)))
  :pattern (($FVF.lookup_f (as sm@94@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@28@01 r))
  :qid |qp.fvfValDef50|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@23@01 1))
    (=
      ($FVF.lookup_f (as sm@94@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@94@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@35@01  $FVF<f>) r))
  :qid |qp.fvfValDef51|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@23@01 0))
    (=
      ($FVF.lookup_f (as sm@94@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@94@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@63@01  $FVF<f>) r))
  :qid |qp.fvfValDef52|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@95@01  $FPM) r)
    (+
      (+
        (-
          (-
            (ite
              (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
              $Perm.Write
              $Perm.No)
            (pTaken@31@01 r))
          (pTaken@33@01 r))
        (ite (= r (Seq_index xs@23@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@95@01  $FPM) r))
  :qid |qp.resPrmSumDef53|)))
(assert (=>
  (not (< i@90@01 (Seq_length xs@23@01)))
  (and
    (not (< i@90@01 (Seq_length xs@23@01)))
    (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))
    (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@95@01  $FPM) r) $Perm.Write)
      :pattern ((inv@29@01 r))
      :qid |qp-fld-prm-bnd|))
    (<= ($FVF.perm_f (as pm@95@01  $FPM) (Seq_index xs@23@01 1)) $Perm.Write)
    (<= ($FVF.perm_f (as pm@95@01  $FPM) (Seq_index xs@23@01 0)) $Perm.Write))))
(assert (or (not (< i@90@01 (Seq_length xs@23@01))) (< i@90@01 (Seq_length xs@23@01))))
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 48 | !(i@90@01 >= 0)]
(assert (not (>= i@90@01 0)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0))
    (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)))
  (not
    (=
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) (Seq_index xs@23@01 0))
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) (Seq_index xs@23@01 1)))))))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1))
    (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)))
  (not
    (=
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) (Seq_index xs@23@01 1))
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) (Seq_index xs@23@01 0)))))))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
  (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))))
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (-
          (ite
            (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
            $Perm.Write
            $Perm.No)
          (pTaken@31@01 r))
        (pTaken@33@01 r)))
    (= ($FVF.lookup_f (as sm@92@01  $FVF<f>) r) ($FVF.lookup_f $t@28@01 r)))
  :pattern (($FVF.lookup_f (as sm@92@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@28@01 r))
  :qid |qp.fvfValDef46|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@23@01 1))
    (=
      ($FVF.lookup_f (as sm@92@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@92@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@35@01  $FVF<f>) r))
  :qid |qp.fvfValDef47|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@23@01 0))
    (=
      ($FVF.lookup_f (as sm@92@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@92@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@63@01  $FVF<f>) r))
  :qid |qp.fvfValDef48|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@93@01  $FPM) r)
    (+
      (+
        (-
          (-
            (ite
              (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
              $Perm.Write
              $Perm.No)
            (pTaken@31@01 r))
          (pTaken@33@01 r))
        (ite (= r (Seq_index xs@23@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@93@01  $FPM) r))
  :qid |qp.resPrmSumDef49|)))
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (-
          (ite
            (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
            $Perm.Write
            $Perm.No)
          (pTaken@31@01 r))
        (pTaken@33@01 r)))
    (= ($FVF.lookup_f (as sm@94@01  $FVF<f>) r) ($FVF.lookup_f $t@28@01 r)))
  :pattern (($FVF.lookup_f (as sm@94@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@28@01 r))
  :qid |qp.fvfValDef50|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@23@01 1))
    (=
      ($FVF.lookup_f (as sm@94@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@94@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@35@01  $FVF<f>) r))
  :qid |qp.fvfValDef51|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@23@01 0))
    (=
      ($FVF.lookup_f (as sm@94@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@94@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@63@01  $FVF<f>) r))
  :qid |qp.fvfValDef52|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@95@01  $FPM) r)
    (+
      (+
        (-
          (-
            (ite
              (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
              $Perm.Write
              $Perm.No)
            (pTaken@31@01 r))
          (pTaken@33@01 r))
        (ite (= r (Seq_index xs@23@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@95@01  $FPM) r))
  :qid |qp.resPrmSumDef53|)))
(assert (=>
  (>= i@90@01 0)
  (and
    (>= i@90@01 0)
    (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
    (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))
    (=>
      (< i@90@01 (Seq_length xs@23@01))
      (and
        (< i@90@01 (Seq_length xs@23@01))
        (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))
        (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
        (forall ((r $Ref)) (!
          (<= ($FVF.perm_f (as pm@93@01  $FPM) r) $Perm.Write)
          :pattern ((inv@29@01 r))
          :qid |qp-fld-prm-bnd|))
        (<= ($FVF.perm_f (as pm@93@01  $FPM) (Seq_index xs@23@01 1)) $Perm.Write)
        (<= ($FVF.perm_f (as pm@93@01  $FPM) (Seq_index xs@23@01 0)) $Perm.Write)
        (=>
          (>= j@91@01 0)
          (and
            (>= j@91@01 0)
            (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
            (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))
            (=>
              (< j@91@01 (Seq_length xs@23@01))
              (and
                (< j@91@01 (Seq_length xs@23@01))
                (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))
                (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))))
            (=>
              (not (< j@91@01 (Seq_length xs@23@01)))
              (and
                (not (< j@91@01 (Seq_length xs@23@01)))
                (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))
                (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))))
            (or
              (not (< j@91@01 (Seq_length xs@23@01)))
              (< j@91@01 (Seq_length xs@23@01)))))
        (=>
          (not (>= j@91@01 0))
          (and
            (not (>= j@91@01 0))
            (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
            (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))))
        (or (not (>= j@91@01 0)) (>= j@91@01 0))))
    (=>
      (not (< i@90@01 (Seq_length xs@23@01)))
      (and
        (not (< i@90@01 (Seq_length xs@23@01)))
        (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))
        (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
        (forall ((r $Ref)) (!
          (<= ($FVF.perm_f (as pm@95@01  $FPM) r) $Perm.Write)
          :pattern ((inv@29@01 r))
          :qid |qp-fld-prm-bnd|))
        (<= ($FVF.perm_f (as pm@95@01  $FPM) (Seq_index xs@23@01 1)) $Perm.Write)
        (<= ($FVF.perm_f (as pm@95@01  $FPM) (Seq_index xs@23@01 0)) $Perm.Write)))
    (or
      (not (< i@90@01 (Seq_length xs@23@01)))
      (< i@90@01 (Seq_length xs@23@01))))))
; Joined path conditions
(assert (=>
  (not (>= i@90@01 0))
  (and
    (not (>= i@90@01 0))
    (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
    (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0))))))
(assert (or (not (>= i@90@01 0)) (>= i@90@01 0)))
(set-option :timeout 0)
(push) ; 5
; [then-branch: 52 | i@90@01 != j@91@01 && j@91@01 < |xs@23@01| && j@91@01 >= 0 && i@90@01 < |xs@23@01| && i@90@01 >= 0 | live]
; [else-branch: 52 | !(i@90@01 != j@91@01 && j@91@01 < |xs@23@01| && j@91@01 >= 0 && i@90@01 < |xs@23@01| && i@90@01 >= 0) | live]
(push) ; 6
; [then-branch: 52 | i@90@01 != j@91@01 && j@91@01 < |xs@23@01| && j@91@01 >= 0 && i@90@01 < |xs@23@01| && i@90@01 >= 0]
(assert (and
  (and
    (and
      (and (not (= i@90@01 j@91@01)) (< j@91@01 (Seq_length xs@23@01)))
      (>= j@91@01 0))
    (< i@90@01 (Seq_length xs@23@01)))
  (>= i@90@01 0)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0))
    (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)))
  (not
    (=
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) (Seq_index xs@23@01 0))
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) (Seq_index xs@23@01 1)))))))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1))
    (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)))
  (not
    (=
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) (Seq_index xs@23@01 1))
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) (Seq_index xs@23@01 0)))))))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
  (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))))
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] xs[i] != xs[j]
; [eval] xs[i]
; [eval] xs[j]
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 52 | !(i@90@01 != j@91@01 && j@91@01 < |xs@23@01| && j@91@01 >= 0 && i@90@01 < |xs@23@01| && i@90@01 >= 0)]
(assert (not
  (and
    (and
      (and
        (and (not (= i@90@01 j@91@01)) (< j@91@01 (Seq_length xs@23@01)))
        (>= j@91@01 0))
      (< i@90@01 (Seq_length xs@23@01)))
    (>= i@90@01 0))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0))
    (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)))
  (not
    (=
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) (Seq_index xs@23@01 0))
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) (Seq_index xs@23@01 1)))))))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1))
    (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)))
  (not
    (=
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) (Seq_index xs@23@01 1))
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) (Seq_index xs@23@01 0)))))))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
  (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))))
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (and
      (and
        (and (not (= i@90@01 j@91@01)) (< j@91@01 (Seq_length xs@23@01)))
        (>= j@91@01 0))
      (< i@90@01 (Seq_length xs@23@01)))
    (>= i@90@01 0))
  (and
    (not (= i@90@01 j@91@01))
    (< j@91@01 (Seq_length xs@23@01))
    (>= j@91@01 0)
    (< i@90@01 (Seq_length xs@23@01))
    (>= i@90@01 0)
    (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
    (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0))))))
; Joined path conditions
(assert (=>
  (not
    (and
      (and
        (and
          (and (not (= i@90@01 j@91@01)) (< j@91@01 (Seq_length xs@23@01)))
          (>= j@91@01 0))
        (< i@90@01 (Seq_length xs@23@01)))
      (>= i@90@01 0)))
  (and
    (not
      (and
        (and
          (and
            (and (not (= i@90@01 j@91@01)) (< j@91@01 (Seq_length xs@23@01)))
            (>= j@91@01 0))
          (< i@90@01 (Seq_length xs@23@01)))
        (>= i@90@01 0)))
    (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
    (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0))))))
(assert (or
  (not
    (and
      (and
        (and
          (and (not (= i@90@01 j@91@01)) (< j@91@01 (Seq_length xs@23@01)))
          (>= j@91@01 0))
        (< i@90@01 (Seq_length xs@23@01)))
      (>= i@90@01 0)))
  (and
    (and
      (and
        (and (not (= i@90@01 j@91@01)) (< j@91@01 (Seq_length xs@23@01)))
        (>= j@91@01 0))
      (< i@90@01 (Seq_length xs@23@01)))
    (>= i@90@01 0))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (-
          (ite
            (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
            $Perm.Write
            $Perm.No)
          (pTaken@31@01 r))
        (pTaken@33@01 r)))
    (= ($FVF.lookup_f (as sm@92@01  $FVF<f>) r) ($FVF.lookup_f $t@28@01 r)))
  :pattern (($FVF.lookup_f (as sm@92@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@28@01 r))
  :qid |qp.fvfValDef46|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@23@01 1))
    (=
      ($FVF.lookup_f (as sm@92@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@92@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@35@01  $FVF<f>) r))
  :qid |qp.fvfValDef47|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@23@01 0))
    (=
      ($FVF.lookup_f (as sm@92@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@92@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@63@01  $FVF<f>) r))
  :qid |qp.fvfValDef48|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@93@01  $FPM) r)
    (+
      (+
        (-
          (-
            (ite
              (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
              $Perm.Write
              $Perm.No)
            (pTaken@31@01 r))
          (pTaken@33@01 r))
        (ite (= r (Seq_index xs@23@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@93@01  $FPM) r))
  :qid |qp.resPrmSumDef49|)))
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (-
          (ite
            (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
            $Perm.Write
            $Perm.No)
          (pTaken@31@01 r))
        (pTaken@33@01 r)))
    (= ($FVF.lookup_f (as sm@94@01  $FVF<f>) r) ($FVF.lookup_f $t@28@01 r)))
  :pattern (($FVF.lookup_f (as sm@94@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@28@01 r))
  :qid |qp.fvfValDef50|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@23@01 1))
    (=
      ($FVF.lookup_f (as sm@94@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@94@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@35@01  $FVF<f>) r))
  :qid |qp.fvfValDef51|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@23@01 0))
    (=
      ($FVF.lookup_f (as sm@94@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@94@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@63@01  $FVF<f>) r))
  :qid |qp.fvfValDef52|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@95@01  $FPM) r)
    (+
      (+
        (-
          (-
            (ite
              (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
              $Perm.Write
              $Perm.No)
            (pTaken@31@01 r))
          (pTaken@33@01 r))
        (ite (= r (Seq_index xs@23@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@95@01  $FPM) r))
  :qid |qp.resPrmSumDef53|)))
; Nested auxiliary terms: non-globals (aux)
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((i@90@01 Int) (j@91@01 Int)) (!
  (=>
    (and
      (and
        (and
          (and (not (= i@90@01 j@91@01)) (< j@91@01 (Seq_length xs@23@01)))
          (>= j@91@01 0))
        (< i@90@01 (Seq_length xs@23@01)))
      (>= i@90@01 0))
    (not (= (Seq_index xs@23@01 i@90@01) (Seq_index xs@23@01 j@91@01))))
  
  :qid |prog.l22|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (forall ((i@90@01 Int) (j@91@01 Int)) (!
  (=>
    (and
      (and
        (and
          (and (not (= i@90@01 j@91@01)) (< j@91@01 (Seq_length xs@23@01)))
          (>= j@91@01 0))
        (< i@90@01 (Seq_length xs@23@01)))
      (>= i@90@01 0))
    (not (= (Seq_index xs@23@01 i@90@01) (Seq_index xs@23@01 j@91@01))))
  
  :qid |prog.l22|)))
(declare-const i@96@01 Int)
(push) ; 4
; [eval] 0 <= i && i < |xs|
; [eval] 0 <= i
(push) ; 5
; [then-branch: 53 | 0 <= i@96@01 | live]
; [else-branch: 53 | !(0 <= i@96@01) | live]
(push) ; 6
; [then-branch: 53 | 0 <= i@96@01]
(assert (<= 0 i@96@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0))
    (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)))
  (not
    (=
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) (Seq_index xs@23@01 0))
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) (Seq_index xs@23@01 1)))))))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1))
    (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)))
  (not
    (=
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) (Seq_index xs@23@01 1))
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) (Seq_index xs@23@01 0)))))))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
  (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))))
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] i < |xs|
; [eval] |xs|
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 53 | !(0 <= i@96@01)]
(assert (not (<= 0 i@96@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0))
    (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)))
  (not
    (=
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) (Seq_index xs@23@01 0))
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) (Seq_index xs@23@01 1)))))))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1))
    (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)))
  (not
    (=
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) (Seq_index xs@23@01 1))
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) (Seq_index xs@23@01 0)))))))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
  (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))))
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (<= 0 i@96@01)
  (and
    (<= 0 i@96@01)
    (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
    (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0))))))
; Joined path conditions
(assert (=>
  (not (<= 0 i@96@01))
  (and
    (not (<= 0 i@96@01))
    (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
    (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0))))))
(assert (or (not (<= 0 i@96@01)) (<= 0 i@96@01)))
(assert (and (< i@96@01 (Seq_length xs@23@01)) (<= 0 i@96@01)))
; [eval] xs[i]
(set-option :timeout 0)
(push) ; 5
(assert (not (>= i@96@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@97@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@96@01 Int)) (!
  (=>
    (and (< i@96@01 (Seq_length xs@23@01)) (<= 0 i@96@01))
    (and
      (=>
        (<= 0 i@96@01)
        (and
          (<= 0 i@96@01)
          (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
          (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))))
      (=>
        (not (<= 0 i@96@01))
        (and
          (not (<= 0 i@96@01))
          (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
          (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))))
      (or (not (<= 0 i@96@01)) (<= 0 i@96@01))))
  :pattern ((Seq_index xs@23@01 i@96@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@96@01 Int) (i2@96@01 Int)) (!
  (=>
    (and
      (and (< i1@96@01 (Seq_length xs@23@01)) (<= 0 i1@96@01))
      (and (< i2@96@01 (Seq_length xs@23@01)) (<= 0 i2@96@01))
      (= (Seq_index xs@23@01 i1@96@01) (Seq_index xs@23@01 i2@96@01)))
    (= i1@96@01 i2@96@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@96@01 Int)) (!
  (=>
    (and (< i@96@01 (Seq_length xs@23@01)) (<= 0 i@96@01))
    (= (inv@97@01 (Seq_index xs@23@01 i@96@01)) i@96@01))
  :pattern ((Seq_index xs@23@01 i@96@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@97@01 r) (Seq_length xs@23@01)) (<= 0 (inv@97@01 r)))
    (= (Seq_index xs@23@01 (inv@97@01 r)) r))
  :pattern ((inv@97@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@98@01 ((r $Ref)) $Perm
  (ite
    (and (< (inv@97@01 r) (Seq_length xs@23@01)) (<= 0 (inv@97@01 r)))
    ($Perm.min
      (ite (= r (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@99@01 ((r $Ref)) $Perm
  (ite
    (and (< (inv@97@01 r) (Seq_length xs@23@01)) (<= 0 (inv@97@01 r)))
    ($Perm.min
      (ite (= r (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@98@01 r)))
    $Perm.No))
(define-fun pTaken@100@01 ((r $Ref)) $Perm
  (ite
    (and (< (inv@97@01 r) (Seq_length xs@23@01)) (<= 0 (inv@97@01 r)))
    ($Perm.min
      (-
        (-
          (ite
            (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
            $Perm.Write
            $Perm.No)
          (pTaken@31@01 r))
        (pTaken@33@01 r))
      (- (- $Perm.Write (pTaken@98@01 r)) (pTaken@99@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (=
  (-
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)
    (pTaken@98@01 (Seq_index xs@23@01 0)))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (< (inv@97@01 r) (Seq_length xs@23@01)) (<= 0 (inv@97@01 r)))
    (= (- $Perm.Write (pTaken@98@01 r)) $Perm.No))
  
  :qid |quant-u-127|))))
(check-sat)
; unknown
(pop) ; 4
; 0.10s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (=
  (-
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)
    (pTaken@99@01 (Seq_index xs@23@01 1)))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (< (inv@97@01 r) (Seq_length xs@23@01)) (<= 0 (inv@97@01 r)))
    (= (- (- $Perm.Write (pTaken@98@01 r)) (pTaken@99@01 r)) $Perm.No))
  
  :qid |quant-u-129|))))
(check-sat)
; unknown
(pop) ; 4
; 0.10s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (-
        (-
          (ite
            (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
            $Perm.Write
            $Perm.No)
          (pTaken@31@01 r))
        (pTaken@33@01 r))
      (pTaken@100@01 r))
    $Perm.No)
  
  :qid |quant-u-130|))))
(check-sat)
; unsat
(pop) ; 4
; 0.01s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (< (inv@97@01 r) (Seq_length xs@23@01)) (<= 0 (inv@97@01 r)))
    (=
      (- (- (- $Perm.Write (pTaken@98@01 r)) (pTaken@99@01 r)) (pTaken@100@01 r))
      $Perm.No))
  
  :qid |quant-u-131|))))
(check-sat)
; unsat
(pop) ; 4
; 0.01s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@101@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@101@01  $FVF<f>)))
      (and (< (inv@97@01 r) (Seq_length xs@23@01)) (<= 0 (inv@97@01 r))))
    (=>
      (and (< (inv@97@01 r) (Seq_length xs@23@01)) (<= 0 (inv@97@01 r)))
      (Set_in r ($FVF.domain_f (as sm@101@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@101@01  $FVF<f>))))
  :qid |qp.fvfDomDef57|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@97@01 r) (Seq_length xs@23@01)) (<= 0 (inv@97@01 r)))
      (= r (Seq_index xs@23@01 0)))
    (=
      ($FVF.lookup_f (as sm@101@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@101@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@63@01  $FVF<f>) r))
  :qid |qp.fvfValDef54|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@97@01 r) (Seq_length xs@23@01)) (<= 0 (inv@97@01 r)))
      (= r (Seq_index xs@23@01 1)))
    (=
      ($FVF.lookup_f (as sm@101@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@101@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@35@01  $FVF<f>) r))
  :qid |qp.fvfValDef55|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@97@01 r) (Seq_length xs@23@01)) (<= 0 (inv@97@01 r)))
      (<
        $Perm.No
        (-
          (-
            (ite
              (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
              $Perm.Write
              $Perm.No)
            (pTaken@31@01 r))
          (pTaken@33@01 r))))
    (= ($FVF.lookup_f (as sm@101@01  $FVF<f>) r) ($FVF.lookup_f $t@28@01 r)))
  :pattern (($FVF.lookup_f (as sm@101@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@28@01 r))
  :qid |qp.fvfValDef56|)))
; [eval] |xs| > 3
; [eval] |xs|
(assert (fun02%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$FVF<f>To$Snap (as sm@101@01  $FVF<f>))
    $Snap.unit)) xs@23@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (-
          (ite
            (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
            $Perm.Write
            $Perm.No)
          (pTaken@31@01 r))
        (pTaken@33@01 r)))
    (= ($FVF.lookup_f (as sm@92@01  $FVF<f>) r) ($FVF.lookup_f $t@28@01 r)))
  :pattern (($FVF.lookup_f (as sm@92@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@28@01 r))
  :qid |qp.fvfValDef46|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@23@01 1))
    (=
      ($FVF.lookup_f (as sm@92@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@92@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@35@01  $FVF<f>) r))
  :qid |qp.fvfValDef47|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@23@01 0))
    (=
      ($FVF.lookup_f (as sm@92@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@92@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@63@01  $FVF<f>) r))
  :qid |qp.fvfValDef48|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@93@01  $FPM) r)
    (+
      (+
        (-
          (-
            (ite
              (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
              $Perm.Write
              $Perm.No)
            (pTaken@31@01 r))
          (pTaken@33@01 r))
        (ite (= r (Seq_index xs@23@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@93@01  $FPM) r))
  :qid |qp.resPrmSumDef49|)))
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (-
          (ite
            (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
            $Perm.Write
            $Perm.No)
          (pTaken@31@01 r))
        (pTaken@33@01 r)))
    (= ($FVF.lookup_f (as sm@94@01  $FVF<f>) r) ($FVF.lookup_f $t@28@01 r)))
  :pattern (($FVF.lookup_f (as sm@94@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@28@01 r))
  :qid |qp.fvfValDef50|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@23@01 1))
    (=
      ($FVF.lookup_f (as sm@94@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@94@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@35@01  $FVF<f>) r))
  :qid |qp.fvfValDef51|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@23@01 0))
    (=
      ($FVF.lookup_f (as sm@94@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@94@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@63@01  $FVF<f>) r))
  :qid |qp.fvfValDef52|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@95@01  $FPM) r)
    (+
      (+
        (-
          (-
            (ite
              (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
              $Perm.Write
              $Perm.No)
            (pTaken@31@01 r))
          (pTaken@33@01 r))
        (ite (= r (Seq_index xs@23@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@95@01  $FPM) r))
  :qid |qp.resPrmSumDef53|)))
(assert (forall ((i@96@01 Int)) (!
  (=>
    (and (< i@96@01 (Seq_length xs@23@01)) (<= 0 i@96@01))
    (= (inv@97@01 (Seq_index xs@23@01 i@96@01)) i@96@01))
  :pattern ((Seq_index xs@23@01 i@96@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@97@01 r) (Seq_length xs@23@01)) (<= 0 (inv@97@01 r)))
    (= (Seq_index xs@23@01 (inv@97@01 r)) r))
  :pattern ((inv@97@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@101@01  $FVF<f>)))
      (and (< (inv@97@01 r) (Seq_length xs@23@01)) (<= 0 (inv@97@01 r))))
    (=>
      (and (< (inv@97@01 r) (Seq_length xs@23@01)) (<= 0 (inv@97@01 r)))
      (Set_in r ($FVF.domain_f (as sm@101@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@101@01  $FVF<f>))))
  :qid |qp.fvfDomDef57|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@97@01 r) (Seq_length xs@23@01)) (<= 0 (inv@97@01 r)))
      (= r (Seq_index xs@23@01 0)))
    (=
      ($FVF.lookup_f (as sm@101@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@101@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@63@01  $FVF<f>) r))
  :qid |qp.fvfValDef54|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@97@01 r) (Seq_length xs@23@01)) (<= 0 (inv@97@01 r)))
      (= r (Seq_index xs@23@01 1)))
    (=
      ($FVF.lookup_f (as sm@101@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@101@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@35@01  $FVF<f>) r))
  :qid |qp.fvfValDef55|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@97@01 r) (Seq_length xs@23@01)) (<= 0 (inv@97@01 r)))
      (<
        $Perm.No
        (-
          (-
            (ite
              (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
              $Perm.Write
              $Perm.No)
            (pTaken@31@01 r))
          (pTaken@33@01 r))))
    (= ($FVF.lookup_f (as sm@101@01  $FVF<f>) r) ($FVF.lookup_f $t@28@01 r)))
  :pattern (($FVF.lookup_f (as sm@101@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@28@01 r))
  :qid |qp.fvfValDef56|)))
(assert (and
  (forall ((i@90@01 Int) (j@91@01 Int)) (!
    (=>
      (and
        (and
          (and
            (and (not (= i@90@01 j@91@01)) (< j@91@01 (Seq_length xs@23@01)))
            (>= j@91@01 0))
          (< i@90@01 (Seq_length xs@23@01)))
        (>= i@90@01 0))
      (not (= (Seq_index xs@23@01 i@90@01) (Seq_index xs@23@01 j@91@01))))
    
    :qid |prog.l22|))
  (forall ((i@96@01 Int)) (!
    (=>
      (and (< i@96@01 (Seq_length xs@23@01)) (<= 0 i@96@01))
      (and
        (=>
          (<= 0 i@96@01)
          (and
            (<= 0 i@96@01)
            (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
            (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))))
        (=>
          (not (<= 0 i@96@01))
          (and
            (not (<= 0 i@96@01))
            (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
            (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))))
        (or (not (<= 0 i@96@01)) (<= 0 i@96@01))))
    :pattern ((Seq_index xs@23@01 i@96@01))
    :qid |f-aux|))
  (fun02%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<f>To$Snap (as sm@101@01  $FVF<f>))
      $Snap.unit)) xs@23@01)))
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  (fun02 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<f>To$Snap (as sm@101@01  $FVF<f>))
      $Snap.unit)) xs@23@01)
  14)))
(check-sat)
; unknown
(pop) ; 3
; 0.25s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0))
    (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)))
  (not
    (=
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) (Seq_index xs@23@01 0))
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) (Seq_index xs@23@01 1)))))))
(check-sat)
; unknown
(pop) ; 3
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1))
    (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)))
  (not
    (=
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) (Seq_index xs@23@01 1))
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) (Seq_index xs@23@01 0)))))))
(check-sat)
; unknown
(pop) ; 3
; 0.01s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
  (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))))
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] fun02(xs) == 14
; [eval] fun02(xs)
(set-option :timeout 0)
(push) ; 3
; [eval] (forall i: Int, j: Int ::i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==> xs[i] != xs[j])
(declare-const i@102@01 Int)
(declare-const j@103@01 Int)
(push) ; 4
; [eval] i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==> xs[i] != xs[j]
; [eval] i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j)))
; [eval] i >= 0
(push) ; 5
; [then-branch: 54 | i@102@01 >= 0 | live]
; [else-branch: 54 | !(i@102@01 >= 0) | live]
(push) ; 6
; [then-branch: 54 | i@102@01 >= 0]
(assert (>= i@102@01 0))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1))
    (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)))
  (not
    (=
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) (Seq_index xs@23@01 1))
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) (Seq_index xs@23@01 0)))))))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0))
    (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)))
  (not
    (=
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) (Seq_index xs@23@01 0))
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) (Seq_index xs@23@01 1)))))))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))
  (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))))
(declare-const sm@104@01 $FVF<f>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (-
          (ite
            (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
            $Perm.Write
            $Perm.No)
          (pTaken@31@01 r))
        (pTaken@33@01 r)))
    (= ($FVF.lookup_f (as sm@104@01  $FVF<f>) r) ($FVF.lookup_f $t@28@01 r)))
  :pattern (($FVF.lookup_f (as sm@104@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@28@01 r))
  :qid |qp.fvfValDef58|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@23@01 1))
    (=
      ($FVF.lookup_f (as sm@104@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@104@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@35@01  $FVF<f>) r))
  :qid |qp.fvfValDef59|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@23@01 0))
    (=
      ($FVF.lookup_f (as sm@104@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@104@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@63@01  $FVF<f>) r))
  :qid |qp.fvfValDef60|)))
(declare-const pm@105@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@105@01  $FPM) r)
    (+
      (+
        (-
          (-
            (ite
              (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
              $Perm.Write
              $Perm.No)
            (pTaken@31@01 r))
          (pTaken@33@01 r))
        (ite (= r (Seq_index xs@23@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@105@01  $FPM) r))
  :qid |qp.resPrmSumDef61|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@105@01  $FPM) r) $Perm.Write)
  :pattern ((inv@29@01 r))
  :qid |qp-fld-prm-bnd|)))
(assert (<= ($FVF.perm_f (as pm@105@01  $FPM) (Seq_index xs@23@01 1)) $Perm.Write))
(assert (<= ($FVF.perm_f (as pm@105@01  $FPM) (Seq_index xs@23@01 0)) $Perm.Write))
; [eval] i < |xs|
; [eval] |xs|
(set-option :timeout 0)
(push) ; 7
; [then-branch: 55 | i@102@01 < |xs@23@01| | live]
; [else-branch: 55 | !(i@102@01 < |xs@23@01|) | live]
(push) ; 8
; [then-branch: 55 | i@102@01 < |xs@23@01|]
(assert (< i@102@01 (Seq_length xs@23@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0))
    (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)))
  (not
    (=
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) (Seq_index xs@23@01 0))
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) (Seq_index xs@23@01 1)))))))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1))
    (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)))
  (not
    (=
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) (Seq_index xs@23@01 1))
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) (Seq_index xs@23@01 0)))))))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
  (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))))
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] j >= 0
(set-option :timeout 0)
(push) ; 9
; [then-branch: 56 | j@103@01 >= 0 | live]
; [else-branch: 56 | !(j@103@01 >= 0) | live]
(push) ; 10
; [then-branch: 56 | j@103@01 >= 0]
(assert (>= j@103@01 0))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1))
    (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)))
  (not
    (=
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) (Seq_index xs@23@01 1))
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) (Seq_index xs@23@01 0)))))))
(check-sat)
; unknown
(pop) ; 11
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0))
    (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)))
  (not
    (=
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) (Seq_index xs@23@01 0))
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) (Seq_index xs@23@01 1)))))))
(check-sat)
; unknown
(pop) ; 11
; 0.01s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))
  (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))))
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] j < |xs|
; [eval] |xs|
(set-option :timeout 0)
(push) ; 11
; [then-branch: 57 | j@103@01 < |xs@23@01| | live]
; [else-branch: 57 | !(j@103@01 < |xs@23@01|) | live]
(push) ; 12
; [then-branch: 57 | j@103@01 < |xs@23@01|]
(assert (< j@103@01 (Seq_length xs@23@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0))
    (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)))
  (not
    (=
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) (Seq_index xs@23@01 0))
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) (Seq_index xs@23@01 1)))))))
(check-sat)
; unknown
(pop) ; 13
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1))
    (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)))
  (not
    (=
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) (Seq_index xs@23@01 1))
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) (Seq_index xs@23@01 0)))))))
(check-sat)
; unknown
(pop) ; 13
; 0.01s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
  (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))))
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] i != j
(pop) ; 12
(set-option :timeout 0)
(push) ; 12
; [else-branch: 57 | !(j@103@01 < |xs@23@01|)]
(assert (not (< j@103@01 (Seq_length xs@23@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0))
    (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)))
  (not
    (=
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) (Seq_index xs@23@01 0))
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) (Seq_index xs@23@01 1)))))))
(check-sat)
; unknown
(pop) ; 13
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1))
    (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)))
  (not
    (=
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) (Seq_index xs@23@01 1))
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) (Seq_index xs@23@01 0)))))))
(check-sat)
; unknown
(pop) ; 13
; 0.01s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
  (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))))
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(pop) ; 12
(pop) ; 11
; Joined path conditions
(assert (=>
  (< j@103@01 (Seq_length xs@23@01))
  (and
    (< j@103@01 (Seq_length xs@23@01))
    (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
    (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0))))))
; Joined path conditions
(assert (=>
  (not (< j@103@01 (Seq_length xs@23@01)))
  (and
    (not (< j@103@01 (Seq_length xs@23@01)))
    (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
    (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0))))))
(assert (or (not (< j@103@01 (Seq_length xs@23@01))) (< j@103@01 (Seq_length xs@23@01))))
(pop) ; 10
(set-option :timeout 0)
(push) ; 10
; [else-branch: 56 | !(j@103@01 >= 0)]
(assert (not (>= j@103@01 0)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1))
    (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)))
  (not
    (=
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) (Seq_index xs@23@01 1))
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) (Seq_index xs@23@01 0)))))))
(check-sat)
; unknown
(pop) ; 11
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0))
    (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)))
  (not
    (=
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) (Seq_index xs@23@01 0))
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) (Seq_index xs@23@01 1)))))))
(check-sat)
; unknown
(pop) ; 11
; 0.01s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))
  (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))))
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (=>
  (>= j@103@01 0)
  (and
    (>= j@103@01 0)
    (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))
    (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
    (=>
      (< j@103@01 (Seq_length xs@23@01))
      (and
        (< j@103@01 (Seq_length xs@23@01))
        (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
        (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))))
    (=>
      (not (< j@103@01 (Seq_length xs@23@01)))
      (and
        (not (< j@103@01 (Seq_length xs@23@01)))
        (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
        (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))))
    (or
      (not (< j@103@01 (Seq_length xs@23@01)))
      (< j@103@01 (Seq_length xs@23@01))))))
; Joined path conditions
(assert (=>
  (not (>= j@103@01 0))
  (and
    (not (>= j@103@01 0))
    (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))
    (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1))))))
(assert (or (not (>= j@103@01 0)) (>= j@103@01 0)))
(pop) ; 8
(set-option :timeout 0)
(push) ; 8
; [else-branch: 55 | !(i@102@01 < |xs@23@01|)]
(assert (not (< i@102@01 (Seq_length xs@23@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0))
    (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)))
  (not
    (=
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) (Seq_index xs@23@01 0))
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) (Seq_index xs@23@01 1)))))))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1))
    (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)))
  (not
    (=
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) (Seq_index xs@23@01 1))
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) (Seq_index xs@23@01 0)))))))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
  (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))))
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (< i@102@01 (Seq_length xs@23@01))
  (and
    (< i@102@01 (Seq_length xs@23@01))
    (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
    (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))
    (=>
      (>= j@103@01 0)
      (and
        (>= j@103@01 0)
        (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))
        (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
        (=>
          (< j@103@01 (Seq_length xs@23@01))
          (and
            (< j@103@01 (Seq_length xs@23@01))
            (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
            (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))))
        (=>
          (not (< j@103@01 (Seq_length xs@23@01)))
          (and
            (not (< j@103@01 (Seq_length xs@23@01)))
            (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
            (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))))
        (or
          (not (< j@103@01 (Seq_length xs@23@01)))
          (< j@103@01 (Seq_length xs@23@01)))))
    (=>
      (not (>= j@103@01 0))
      (and
        (not (>= j@103@01 0))
        (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))
        (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))))
    (or (not (>= j@103@01 0)) (>= j@103@01 0)))))
; Joined path conditions
(assert (=>
  (not (< i@102@01 (Seq_length xs@23@01)))
  (and
    (not (< i@102@01 (Seq_length xs@23@01)))
    (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
    (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0))))))
(assert (or (not (< i@102@01 (Seq_length xs@23@01))) (< i@102@01 (Seq_length xs@23@01))))
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 54 | !(i@102@01 >= 0)]
(assert (not (>= i@102@01 0)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1))
    (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)))
  (not
    (=
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) (Seq_index xs@23@01 1))
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) (Seq_index xs@23@01 0)))))))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0))
    (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)))
  (not
    (=
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) (Seq_index xs@23@01 0))
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) (Seq_index xs@23@01 1)))))))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))
  (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))))
(declare-const sm@106@01 $FVF<f>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (-
          (ite
            (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
            $Perm.Write
            $Perm.No)
          (pTaken@31@01 r))
        (pTaken@33@01 r)))
    (= ($FVF.lookup_f (as sm@106@01  $FVF<f>) r) ($FVF.lookup_f $t@28@01 r)))
  :pattern (($FVF.lookup_f (as sm@106@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@28@01 r))
  :qid |qp.fvfValDef62|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@23@01 1))
    (=
      ($FVF.lookup_f (as sm@106@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@106@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@35@01  $FVF<f>) r))
  :qid |qp.fvfValDef63|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@23@01 0))
    (=
      ($FVF.lookup_f (as sm@106@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@106@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@63@01  $FVF<f>) r))
  :qid |qp.fvfValDef64|)))
(declare-const pm@107@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@107@01  $FPM) r)
    (+
      (+
        (-
          (-
            (ite
              (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
              $Perm.Write
              $Perm.No)
            (pTaken@31@01 r))
          (pTaken@33@01 r))
        (ite (= r (Seq_index xs@23@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@107@01  $FPM) r))
  :qid |qp.resPrmSumDef65|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@107@01  $FPM) r) $Perm.Write)
  :pattern ((inv@29@01 r))
  :qid |qp-fld-prm-bnd|)))
(assert (<= ($FVF.perm_f (as pm@107@01  $FPM) (Seq_index xs@23@01 1)) $Perm.Write))
(assert (<= ($FVF.perm_f (as pm@107@01  $FPM) (Seq_index xs@23@01 0)) $Perm.Write))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (-
          (ite
            (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
            $Perm.Write
            $Perm.No)
          (pTaken@31@01 r))
        (pTaken@33@01 r)))
    (= ($FVF.lookup_f (as sm@104@01  $FVF<f>) r) ($FVF.lookup_f $t@28@01 r)))
  :pattern (($FVF.lookup_f (as sm@104@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@28@01 r))
  :qid |qp.fvfValDef58|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@23@01 1))
    (=
      ($FVF.lookup_f (as sm@104@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@104@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@35@01  $FVF<f>) r))
  :qid |qp.fvfValDef59|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@23@01 0))
    (=
      ($FVF.lookup_f (as sm@104@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@104@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@63@01  $FVF<f>) r))
  :qid |qp.fvfValDef60|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@105@01  $FPM) r)
    (+
      (+
        (-
          (-
            (ite
              (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
              $Perm.Write
              $Perm.No)
            (pTaken@31@01 r))
          (pTaken@33@01 r))
        (ite (= r (Seq_index xs@23@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@105@01  $FPM) r))
  :qid |qp.resPrmSumDef61|)))
(assert (=>
  (>= i@102@01 0)
  (and
    (>= i@102@01 0)
    (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))
    (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@105@01  $FPM) r) $Perm.Write)
      :pattern ((inv@29@01 r))
      :qid |qp-fld-prm-bnd|))
    (<= ($FVF.perm_f (as pm@105@01  $FPM) (Seq_index xs@23@01 1)) $Perm.Write)
    (<= ($FVF.perm_f (as pm@105@01  $FPM) (Seq_index xs@23@01 0)) $Perm.Write)
    (=>
      (< i@102@01 (Seq_length xs@23@01))
      (and
        (< i@102@01 (Seq_length xs@23@01))
        (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
        (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))
        (=>
          (>= j@103@01 0)
          (and
            (>= j@103@01 0)
            (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))
            (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
            (=>
              (< j@103@01 (Seq_length xs@23@01))
              (and
                (< j@103@01 (Seq_length xs@23@01))
                (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
                (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))))
            (=>
              (not (< j@103@01 (Seq_length xs@23@01)))
              (and
                (not (< j@103@01 (Seq_length xs@23@01)))
                (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
                (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))))
            (or
              (not (< j@103@01 (Seq_length xs@23@01)))
              (< j@103@01 (Seq_length xs@23@01)))))
        (=>
          (not (>= j@103@01 0))
          (and
            (not (>= j@103@01 0))
            (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))
            (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))))
        (or (not (>= j@103@01 0)) (>= j@103@01 0))))
    (=>
      (not (< i@102@01 (Seq_length xs@23@01)))
      (and
        (not (< i@102@01 (Seq_length xs@23@01)))
        (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
        (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))))
    (or
      (not (< i@102@01 (Seq_length xs@23@01)))
      (< i@102@01 (Seq_length xs@23@01))))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (-
          (ite
            (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
            $Perm.Write
            $Perm.No)
          (pTaken@31@01 r))
        (pTaken@33@01 r)))
    (= ($FVF.lookup_f (as sm@106@01  $FVF<f>) r) ($FVF.lookup_f $t@28@01 r)))
  :pattern (($FVF.lookup_f (as sm@106@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@28@01 r))
  :qid |qp.fvfValDef62|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@23@01 1))
    (=
      ($FVF.lookup_f (as sm@106@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@106@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@35@01  $FVF<f>) r))
  :qid |qp.fvfValDef63|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@23@01 0))
    (=
      ($FVF.lookup_f (as sm@106@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@106@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@63@01  $FVF<f>) r))
  :qid |qp.fvfValDef64|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@107@01  $FPM) r)
    (+
      (+
        (-
          (-
            (ite
              (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
              $Perm.Write
              $Perm.No)
            (pTaken@31@01 r))
          (pTaken@33@01 r))
        (ite (= r (Seq_index xs@23@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@107@01  $FPM) r))
  :qid |qp.resPrmSumDef65|)))
(assert (=>
  (not (>= i@102@01 0))
  (and
    (not (>= i@102@01 0))
    (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))
    (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@107@01  $FPM) r) $Perm.Write)
      :pattern ((inv@29@01 r))
      :qid |qp-fld-prm-bnd|))
    (<= ($FVF.perm_f (as pm@107@01  $FPM) (Seq_index xs@23@01 1)) $Perm.Write)
    (<= ($FVF.perm_f (as pm@107@01  $FPM) (Seq_index xs@23@01 0)) $Perm.Write))))
(assert (or (not (>= i@102@01 0)) (>= i@102@01 0)))
(set-option :timeout 0)
(push) ; 5
; [then-branch: 58 | i@102@01 != j@103@01 && j@103@01 < |xs@23@01| && j@103@01 >= 0 && i@102@01 < |xs@23@01| && i@102@01 >= 0 | live]
; [else-branch: 58 | !(i@102@01 != j@103@01 && j@103@01 < |xs@23@01| && j@103@01 >= 0 && i@102@01 < |xs@23@01| && i@102@01 >= 0) | live]
(push) ; 6
; [then-branch: 58 | i@102@01 != j@103@01 && j@103@01 < |xs@23@01| && j@103@01 >= 0 && i@102@01 < |xs@23@01| && i@102@01 >= 0]
(assert (and
  (and
    (and
      (and (not (= i@102@01 j@103@01)) (< j@103@01 (Seq_length xs@23@01)))
      (>= j@103@01 0))
    (< i@102@01 (Seq_length xs@23@01)))
  (>= i@102@01 0)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1))
    (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)))
  (not
    (=
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) (Seq_index xs@23@01 1))
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) (Seq_index xs@23@01 0)))))))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0))
    (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)))
  (not
    (=
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) (Seq_index xs@23@01 0))
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) (Seq_index xs@23@01 1)))))))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))
  (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))))
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@107@01  $FPM) r) $Perm.Write)
  :pattern ((inv@29@01 r))
  :qid |qp-fld-prm-bnd|)))
(assert (<= ($FVF.perm_f (as pm@107@01  $FPM) (Seq_index xs@23@01 1)) $Perm.Write))
(assert (<= ($FVF.perm_f (as pm@107@01  $FPM) (Seq_index xs@23@01 0)) $Perm.Write))
; [eval] xs[i] != xs[j]
; [eval] xs[i]
; [eval] xs[j]
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 58 | !(i@102@01 != j@103@01 && j@103@01 < |xs@23@01| && j@103@01 >= 0 && i@102@01 < |xs@23@01| && i@102@01 >= 0)]
(assert (not
  (and
    (and
      (and
        (and (not (= i@102@01 j@103@01)) (< j@103@01 (Seq_length xs@23@01)))
        (>= j@103@01 0))
      (< i@102@01 (Seq_length xs@23@01)))
    (>= i@102@01 0))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1))
    (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)))
  (not
    (=
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) (Seq_index xs@23@01 1))
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) (Seq_index xs@23@01 0)))))))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0))
    (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)))
  (not
    (=
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) (Seq_index xs@23@01 0))
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) (Seq_index xs@23@01 1)))))))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))
  (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))))
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@107@01  $FPM) r) $Perm.Write)
  :pattern ((inv@29@01 r))
  :qid |qp-fld-prm-bnd|)))
(assert (<= ($FVF.perm_f (as pm@107@01  $FPM) (Seq_index xs@23@01 1)) $Perm.Write))
(assert (<= ($FVF.perm_f (as pm@107@01  $FPM) (Seq_index xs@23@01 0)) $Perm.Write))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (and
      (and
        (and (not (= i@102@01 j@103@01)) (< j@103@01 (Seq_length xs@23@01)))
        (>= j@103@01 0))
      (< i@102@01 (Seq_length xs@23@01)))
    (>= i@102@01 0))
  (and
    (not (= i@102@01 j@103@01))
    (< j@103@01 (Seq_length xs@23@01))
    (>= j@103@01 0)
    (< i@102@01 (Seq_length xs@23@01))
    (>= i@102@01 0)
    (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))
    (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@107@01  $FPM) r) $Perm.Write)
      :pattern ((inv@29@01 r))
      :qid |qp-fld-prm-bnd|))
    (<= ($FVF.perm_f (as pm@107@01  $FPM) (Seq_index xs@23@01 1)) $Perm.Write)
    (<= ($FVF.perm_f (as pm@107@01  $FPM) (Seq_index xs@23@01 0)) $Perm.Write))))
; Joined path conditions
(assert (=>
  (not
    (and
      (and
        (and
          (and (not (= i@102@01 j@103@01)) (< j@103@01 (Seq_length xs@23@01)))
          (>= j@103@01 0))
        (< i@102@01 (Seq_length xs@23@01)))
      (>= i@102@01 0)))
  (and
    (not
      (and
        (and
          (and
            (and (not (= i@102@01 j@103@01)) (< j@103@01 (Seq_length xs@23@01)))
            (>= j@103@01 0))
          (< i@102@01 (Seq_length xs@23@01)))
        (>= i@102@01 0)))
    (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))
    (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@107@01  $FPM) r) $Perm.Write)
      :pattern ((inv@29@01 r))
      :qid |qp-fld-prm-bnd|))
    (<= ($FVF.perm_f (as pm@107@01  $FPM) (Seq_index xs@23@01 1)) $Perm.Write)
    (<= ($FVF.perm_f (as pm@107@01  $FPM) (Seq_index xs@23@01 0)) $Perm.Write))))
(assert (or
  (not
    (and
      (and
        (and
          (and (not (= i@102@01 j@103@01)) (< j@103@01 (Seq_length xs@23@01)))
          (>= j@103@01 0))
        (< i@102@01 (Seq_length xs@23@01)))
      (>= i@102@01 0)))
  (and
    (and
      (and
        (and (not (= i@102@01 j@103@01)) (< j@103@01 (Seq_length xs@23@01)))
        (>= j@103@01 0))
      (< i@102@01 (Seq_length xs@23@01)))
    (>= i@102@01 0))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (-
          (ite
            (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
            $Perm.Write
            $Perm.No)
          (pTaken@31@01 r))
        (pTaken@33@01 r)))
    (= ($FVF.lookup_f (as sm@104@01  $FVF<f>) r) ($FVF.lookup_f $t@28@01 r)))
  :pattern (($FVF.lookup_f (as sm@104@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@28@01 r))
  :qid |qp.fvfValDef58|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@23@01 1))
    (=
      ($FVF.lookup_f (as sm@104@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@104@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@35@01  $FVF<f>) r))
  :qid |qp.fvfValDef59|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@23@01 0))
    (=
      ($FVF.lookup_f (as sm@104@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@104@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@63@01  $FVF<f>) r))
  :qid |qp.fvfValDef60|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@105@01  $FPM) r)
    (+
      (+
        (-
          (-
            (ite
              (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
              $Perm.Write
              $Perm.No)
            (pTaken@31@01 r))
          (pTaken@33@01 r))
        (ite (= r (Seq_index xs@23@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@105@01  $FPM) r))
  :qid |qp.resPrmSumDef61|)))
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (-
          (ite
            (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
            $Perm.Write
            $Perm.No)
          (pTaken@31@01 r))
        (pTaken@33@01 r)))
    (= ($FVF.lookup_f (as sm@106@01  $FVF<f>) r) ($FVF.lookup_f $t@28@01 r)))
  :pattern (($FVF.lookup_f (as sm@106@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@28@01 r))
  :qid |qp.fvfValDef62|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@23@01 1))
    (=
      ($FVF.lookup_f (as sm@106@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@106@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@35@01  $FVF<f>) r))
  :qid |qp.fvfValDef63|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@23@01 0))
    (=
      ($FVF.lookup_f (as sm@106@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@106@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@63@01  $FVF<f>) r))
  :qid |qp.fvfValDef64|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@107@01  $FPM) r)
    (+
      (+
        (-
          (-
            (ite
              (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
              $Perm.Write
              $Perm.No)
            (pTaken@31@01 r))
          (pTaken@33@01 r))
        (ite (= r (Seq_index xs@23@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@107@01  $FPM) r))
  :qid |qp.resPrmSumDef65|)))
; Nested auxiliary terms: non-globals (aux)
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((i@102@01 Int) (j@103@01 Int)) (!
  (=>
    (and
      (and
        (and
          (and (not (= i@102@01 j@103@01)) (< j@103@01 (Seq_length xs@23@01)))
          (>= j@103@01 0))
        (< i@102@01 (Seq_length xs@23@01)))
      (>= i@102@01 0))
    (not (= (Seq_index xs@23@01 i@102@01) (Seq_index xs@23@01 j@103@01))))
  
  :qid |prog.l22|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (forall ((i@102@01 Int) (j@103@01 Int)) (!
  (=>
    (and
      (and
        (and
          (and (not (= i@102@01 j@103@01)) (< j@103@01 (Seq_length xs@23@01)))
          (>= j@103@01 0))
        (< i@102@01 (Seq_length xs@23@01)))
      (>= i@102@01 0))
    (not (= (Seq_index xs@23@01 i@102@01) (Seq_index xs@23@01 j@103@01))))
  
  :qid |prog.l22|)))
(declare-const i@108@01 Int)
(push) ; 4
; [eval] 0 <= i && i < |xs|
; [eval] 0 <= i
(push) ; 5
; [then-branch: 59 | 0 <= i@108@01 | live]
; [else-branch: 59 | !(0 <= i@108@01) | live]
(push) ; 6
; [then-branch: 59 | 0 <= i@108@01]
(assert (<= 0 i@108@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1))
    (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)))
  (not
    (=
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) (Seq_index xs@23@01 1))
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) (Seq_index xs@23@01 0)))))))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0))
    (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)))
  (not
    (=
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) (Seq_index xs@23@01 0))
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) (Seq_index xs@23@01 1)))))))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))
  (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))))
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(declare-const pm@109@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@109@01  $FPM) r)
    (+
      (+
        (-
          (-
            (ite
              (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
              $Perm.Write
              $Perm.No)
            (pTaken@31@01 r))
          (pTaken@33@01 r))
        (ite (= r (Seq_index xs@23@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@109@01  $FPM) r))
  :qid |qp.resPrmSumDef66|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@109@01  $FPM) r) $Perm.Write)
  :pattern ((inv@29@01 r))
  :qid |qp-fld-prm-bnd|)))
(assert (<= ($FVF.perm_f (as pm@109@01  $FPM) (Seq_index xs@23@01 1)) $Perm.Write))
(assert (<= ($FVF.perm_f (as pm@109@01  $FPM) (Seq_index xs@23@01 0)) $Perm.Write))
; [eval] i < |xs|
; [eval] |xs|
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 59 | !(0 <= i@108@01)]
(assert (not (<= 0 i@108@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1))
    (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)))
  (not
    (=
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) (Seq_index xs@23@01 1))
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) (Seq_index xs@23@01 0)))))))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0))
    (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)))
  (not
    (=
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) (Seq_index xs@23@01 0))
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) (Seq_index xs@23@01 1)))))))
(check-sat)
; unknown
(pop) ; 7
; 0.01s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))
  (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))))
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(declare-const pm@110@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@110@01  $FPM) r)
    (+
      (+
        (-
          (-
            (ite
              (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
              $Perm.Write
              $Perm.No)
            (pTaken@31@01 r))
          (pTaken@33@01 r))
        (ite (= r (Seq_index xs@23@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@110@01  $FPM) r))
  :qid |qp.resPrmSumDef67|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@110@01  $FPM) r) $Perm.Write)
  :pattern ((inv@29@01 r))
  :qid |qp-fld-prm-bnd|)))
(assert (<= ($FVF.perm_f (as pm@110@01  $FPM) (Seq_index xs@23@01 1)) $Perm.Write))
(assert (<= ($FVF.perm_f (as pm@110@01  $FPM) (Seq_index xs@23@01 0)) $Perm.Write))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@109@01  $FPM) r)
    (+
      (+
        (-
          (-
            (ite
              (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
              $Perm.Write
              $Perm.No)
            (pTaken@31@01 r))
          (pTaken@33@01 r))
        (ite (= r (Seq_index xs@23@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@109@01  $FPM) r))
  :qid |qp.resPrmSumDef66|)))
(assert (=>
  (<= 0 i@108@01)
  (and
    (<= 0 i@108@01)
    (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))
    (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@109@01  $FPM) r) $Perm.Write)
      :pattern ((inv@29@01 r))
      :qid |qp-fld-prm-bnd|))
    (<= ($FVF.perm_f (as pm@109@01  $FPM) (Seq_index xs@23@01 1)) $Perm.Write)
    (<= ($FVF.perm_f (as pm@109@01  $FPM) (Seq_index xs@23@01 0)) $Perm.Write))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@110@01  $FPM) r)
    (+
      (+
        (-
          (-
            (ite
              (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
              $Perm.Write
              $Perm.No)
            (pTaken@31@01 r))
          (pTaken@33@01 r))
        (ite (= r (Seq_index xs@23@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@110@01  $FPM) r))
  :qid |qp.resPrmSumDef67|)))
(assert (=>
  (not (<= 0 i@108@01))
  (and
    (not (<= 0 i@108@01))
    (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))
    (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@110@01  $FPM) r) $Perm.Write)
      :pattern ((inv@29@01 r))
      :qid |qp-fld-prm-bnd|))
    (<= ($FVF.perm_f (as pm@110@01  $FPM) (Seq_index xs@23@01 1)) $Perm.Write)
    (<= ($FVF.perm_f (as pm@110@01  $FPM) (Seq_index xs@23@01 0)) $Perm.Write))))
(assert (or (not (<= 0 i@108@01)) (<= 0 i@108@01)))
(assert (and (< i@108@01 (Seq_length xs@23@01)) (<= 0 i@108@01)))
; [eval] xs[i]
(set-option :timeout 0)
(push) ; 5
(assert (not (>= i@108@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@111@01 ($Ref) Int)
; Nested auxiliary terms: globals
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@109@01  $FPM) r)
    (+
      (+
        (-
          (-
            (ite
              (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
              $Perm.Write
              $Perm.No)
            (pTaken@31@01 r))
          (pTaken@33@01 r))
        (ite (= r (Seq_index xs@23@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@109@01  $FPM) r))
  :qid |qp.resPrmSumDef66|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@110@01  $FPM) r)
    (+
      (+
        (-
          (-
            (ite
              (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
              $Perm.Write
              $Perm.No)
            (pTaken@31@01 r))
          (pTaken@33@01 r))
        (ite (= r (Seq_index xs@23@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@110@01  $FPM) r))
  :qid |qp.resPrmSumDef67|)))
; Nested auxiliary terms: non-globals
(assert (forall ((i@108@01 Int)) (!
  (=>
    (and (< i@108@01 (Seq_length xs@23@01)) (<= 0 i@108@01))
    (and
      (=>
        (<= 0 i@108@01)
        (and
          (<= 0 i@108@01)
          (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))
          (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
          (forall ((r $Ref)) (!
            (<= ($FVF.perm_f (as pm@109@01  $FPM) r) $Perm.Write)
            :pattern ((inv@29@01 r))
            :qid |qp-fld-prm-bnd|))
          (<=
            ($FVF.perm_f (as pm@109@01  $FPM) (Seq_index xs@23@01 1))
            $Perm.Write)
          (<=
            ($FVF.perm_f (as pm@109@01  $FPM) (Seq_index xs@23@01 0))
            $Perm.Write)))
      (=>
        (not (<= 0 i@108@01))
        (and
          (not (<= 0 i@108@01))
          (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))
          (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
          (forall ((r $Ref)) (!
            (<= ($FVF.perm_f (as pm@110@01  $FPM) r) $Perm.Write)
            :pattern ((inv@29@01 r))
            :qid |qp-fld-prm-bnd|))
          (<=
            ($FVF.perm_f (as pm@110@01  $FPM) (Seq_index xs@23@01 1))
            $Perm.Write)
          (<=
            ($FVF.perm_f (as pm@110@01  $FPM) (Seq_index xs@23@01 0))
            $Perm.Write)))
      (or (not (<= 0 i@108@01)) (<= 0 i@108@01))))
  :pattern ((Seq_index xs@23@01 i@108@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@108@01 Int) (i2@108@01 Int)) (!
  (=>
    (and
      (and (< i1@108@01 (Seq_length xs@23@01)) (<= 0 i1@108@01))
      (and (< i2@108@01 (Seq_length xs@23@01)) (<= 0 i2@108@01))
      (= (Seq_index xs@23@01 i1@108@01) (Seq_index xs@23@01 i2@108@01)))
    (= i1@108@01 i2@108@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@108@01 Int)) (!
  (=>
    (and (< i@108@01 (Seq_length xs@23@01)) (<= 0 i@108@01))
    (= (inv@111@01 (Seq_index xs@23@01 i@108@01)) i@108@01))
  :pattern ((Seq_index xs@23@01 i@108@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@111@01 r) (Seq_length xs@23@01)) (<= 0 (inv@111@01 r)))
    (= (Seq_index xs@23@01 (inv@111@01 r)) r))
  :pattern ((inv@111@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@112@01 ((r $Ref)) $Perm
  (ite
    (and (< (inv@111@01 r) (Seq_length xs@23@01)) (<= 0 (inv@111@01 r)))
    ($Perm.min
      (-
        (-
          (ite
            (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
            $Perm.Write
            $Perm.No)
          (pTaken@31@01 r))
        (pTaken@33@01 r))
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@113@01 ((r $Ref)) $Perm
  (ite
    (and (< (inv@111@01 r) (Seq_length xs@23@01)) (<= 0 (inv@111@01 r)))
    ($Perm.min
      (ite (= r (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@112@01 r)))
    $Perm.No))
(define-fun pTaken@114@01 ((r $Ref)) $Perm
  (ite
    (and (< (inv@111@01 r) (Seq_length xs@23@01)) (<= 0 (inv@111@01 r)))
    ($Perm.min
      (ite (= r (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)
      (- (- $Perm.Write (pTaken@112@01 r)) (pTaken@113@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (-
        (-
          (ite
            (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
            $Perm.Write
            $Perm.No)
          (pTaken@31@01 r))
        (pTaken@33@01 r))
      (pTaken@112@01 r))
    $Perm.No)
  
  :qid |quant-u-134|))))
(check-sat)
; unsat
(pop) ; 4
; 0.01s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (< (inv@111@01 r) (Seq_length xs@23@01)) (<= 0 (inv@111@01 r)))
    (= (- $Perm.Write (pTaken@112@01 r)) $Perm.No))
  
  :qid |quant-u-135|))))
(check-sat)
; unknown
(pop) ; 4
; 0.45s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (=
  (-
    (ite (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 1)) $Perm.Write $Perm.No)
    (pTaken@113@01 (Seq_index xs@23@01 1)))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (< (inv@111@01 r) (Seq_length xs@23@01)) (<= 0 (inv@111@01 r)))
    (= (- (- $Perm.Write (pTaken@112@01 r)) (pTaken@113@01 r)) $Perm.No))
  
  :qid |quant-u-137|))))
(check-sat)
; unknown
(pop) ; 4
; 0.24s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (=
  (-
    (ite (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)
    (pTaken@114@01 (Seq_index xs@23@01 0)))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (< (inv@111@01 r) (Seq_length xs@23@01)) (<= 0 (inv@111@01 r)))
    (=
      (-
        (- (- $Perm.Write (pTaken@112@01 r)) (pTaken@113@01 r))
        (pTaken@114@01 r))
      $Perm.No))
  
  :qid |quant-u-139|))))
(check-sat)
; unsat
(pop) ; 4
; 0.01s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@115@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@115@01  $FVF<f>)))
      (and (< (inv@111@01 r) (Seq_length xs@23@01)) (<= 0 (inv@111@01 r))))
    (=>
      (and (< (inv@111@01 r) (Seq_length xs@23@01)) (<= 0 (inv@111@01 r)))
      (Set_in r ($FVF.domain_f (as sm@115@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@115@01  $FVF<f>))))
  :qid |qp.fvfDomDef71|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@111@01 r) (Seq_length xs@23@01)) (<= 0 (inv@111@01 r)))
      (<
        $Perm.No
        (-
          (-
            (ite
              (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
              $Perm.Write
              $Perm.No)
            (pTaken@31@01 r))
          (pTaken@33@01 r))))
    (= ($FVF.lookup_f (as sm@115@01  $FVF<f>) r) ($FVF.lookup_f $t@28@01 r)))
  :pattern (($FVF.lookup_f (as sm@115@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@28@01 r))
  :qid |qp.fvfValDef68|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@111@01 r) (Seq_length xs@23@01)) (<= 0 (inv@111@01 r)))
      (= r (Seq_index xs@23@01 1)))
    (=
      ($FVF.lookup_f (as sm@115@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@115@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@35@01  $FVF<f>) r))
  :qid |qp.fvfValDef69|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@111@01 r) (Seq_length xs@23@01)) (<= 0 (inv@111@01 r)))
      (= r (Seq_index xs@23@01 0)))
    (=
      ($FVF.lookup_f (as sm@115@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@115@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@63@01  $FVF<f>) r))
  :qid |qp.fvfValDef70|)))
; [eval] |xs| > 3
; [eval] |xs|
(assert (fun02%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$FVF<f>To$Snap (as sm@115@01  $FVF<f>))
    $Snap.unit)) xs@23@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (-
          (ite
            (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
            $Perm.Write
            $Perm.No)
          (pTaken@31@01 r))
        (pTaken@33@01 r)))
    (= ($FVF.lookup_f (as sm@104@01  $FVF<f>) r) ($FVF.lookup_f $t@28@01 r)))
  :pattern (($FVF.lookup_f (as sm@104@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@28@01 r))
  :qid |qp.fvfValDef58|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@23@01 1))
    (=
      ($FVF.lookup_f (as sm@104@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@104@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@35@01  $FVF<f>) r))
  :qid |qp.fvfValDef59|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@23@01 0))
    (=
      ($FVF.lookup_f (as sm@104@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@104@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@63@01  $FVF<f>) r))
  :qid |qp.fvfValDef60|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@105@01  $FPM) r)
    (+
      (+
        (-
          (-
            (ite
              (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
              $Perm.Write
              $Perm.No)
            (pTaken@31@01 r))
          (pTaken@33@01 r))
        (ite (= r (Seq_index xs@23@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@105@01  $FPM) r))
  :qid |qp.resPrmSumDef61|)))
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (-
          (ite
            (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
            $Perm.Write
            $Perm.No)
          (pTaken@31@01 r))
        (pTaken@33@01 r)))
    (= ($FVF.lookup_f (as sm@106@01  $FVF<f>) r) ($FVF.lookup_f $t@28@01 r)))
  :pattern (($FVF.lookup_f (as sm@106@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@28@01 r))
  :qid |qp.fvfValDef62|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@23@01 1))
    (=
      ($FVF.lookup_f (as sm@106@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@106@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@35@01  $FVF<f>) r))
  :qid |qp.fvfValDef63|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@23@01 0))
    (=
      ($FVF.lookup_f (as sm@106@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@106@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@63@01  $FVF<f>) r))
  :qid |qp.fvfValDef64|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@107@01  $FPM) r)
    (+
      (+
        (-
          (-
            (ite
              (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
              $Perm.Write
              $Perm.No)
            (pTaken@31@01 r))
          (pTaken@33@01 r))
        (ite (= r (Seq_index xs@23@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@107@01  $FPM) r))
  :qid |qp.resPrmSumDef65|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@109@01  $FPM) r)
    (+
      (+
        (-
          (-
            (ite
              (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
              $Perm.Write
              $Perm.No)
            (pTaken@31@01 r))
          (pTaken@33@01 r))
        (ite (= r (Seq_index xs@23@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@109@01  $FPM) r))
  :qid |qp.resPrmSumDef66|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@110@01  $FPM) r)
    (+
      (+
        (-
          (-
            (ite
              (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
              $Perm.Write
              $Perm.No)
            (pTaken@31@01 r))
          (pTaken@33@01 r))
        (ite (= r (Seq_index xs@23@01 1)) $Perm.Write $Perm.No))
      (ite (= r (Seq_index xs@23@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@110@01  $FPM) r))
  :qid |qp.resPrmSumDef67|)))
(assert (forall ((i@108@01 Int)) (!
  (=>
    (and (< i@108@01 (Seq_length xs@23@01)) (<= 0 i@108@01))
    (= (inv@111@01 (Seq_index xs@23@01 i@108@01)) i@108@01))
  :pattern ((Seq_index xs@23@01 i@108@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@111@01 r) (Seq_length xs@23@01)) (<= 0 (inv@111@01 r)))
    (= (Seq_index xs@23@01 (inv@111@01 r)) r))
  :pattern ((inv@111@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@115@01  $FVF<f>)))
      (and (< (inv@111@01 r) (Seq_length xs@23@01)) (<= 0 (inv@111@01 r))))
    (=>
      (and (< (inv@111@01 r) (Seq_length xs@23@01)) (<= 0 (inv@111@01 r)))
      (Set_in r ($FVF.domain_f (as sm@115@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@115@01  $FVF<f>))))
  :qid |qp.fvfDomDef71|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@111@01 r) (Seq_length xs@23@01)) (<= 0 (inv@111@01 r)))
      (<
        $Perm.No
        (-
          (-
            (ite
              (and (< (inv@29@01 r) (Seq_length xs@23@01)) (<= 0 (inv@29@01 r)))
              $Perm.Write
              $Perm.No)
            (pTaken@31@01 r))
          (pTaken@33@01 r))))
    (= ($FVF.lookup_f (as sm@115@01  $FVF<f>) r) ($FVF.lookup_f $t@28@01 r)))
  :pattern (($FVF.lookup_f (as sm@115@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@28@01 r))
  :qid |qp.fvfValDef68|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@111@01 r) (Seq_length xs@23@01)) (<= 0 (inv@111@01 r)))
      (= r (Seq_index xs@23@01 1)))
    (=
      ($FVF.lookup_f (as sm@115@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@35@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@115@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@35@01  $FVF<f>) r))
  :qid |qp.fvfValDef69|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@111@01 r) (Seq_length xs@23@01)) (<= 0 (inv@111@01 r)))
      (= r (Seq_index xs@23@01 0)))
    (=
      ($FVF.lookup_f (as sm@115@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@63@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@115@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@63@01  $FVF<f>) r))
  :qid |qp.fvfValDef70|)))
(assert (and
  (forall ((i@102@01 Int) (j@103@01 Int)) (!
    (=>
      (and
        (and
          (and
            (and (not (= i@102@01 j@103@01)) (< j@103@01 (Seq_length xs@23@01)))
            (>= j@103@01 0))
          (< i@102@01 (Seq_length xs@23@01)))
        (>= i@102@01 0))
      (not (= (Seq_index xs@23@01 i@102@01) (Seq_index xs@23@01 j@103@01))))
    
    :qid |prog.l22|))
  (forall ((i@108@01 Int)) (!
    (=>
      (and (< i@108@01 (Seq_length xs@23@01)) (<= 0 i@108@01))
      (and
        (=>
          (<= 0 i@108@01)
          (and
            (<= 0 i@108@01)
            (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))
            (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
            (forall ((r $Ref)) (!
              (<= ($FVF.perm_f (as pm@109@01  $FPM) r) $Perm.Write)
              :pattern ((inv@29@01 r))
              :qid |qp-fld-prm-bnd|))
            (<=
              ($FVF.perm_f (as pm@109@01  $FPM) (Seq_index xs@23@01 1))
              $Perm.Write)
            (<=
              ($FVF.perm_f (as pm@109@01  $FPM) (Seq_index xs@23@01 0))
              $Perm.Write)))
        (=>
          (not (<= 0 i@108@01))
          (and
            (not (<= 0 i@108@01))
            (not (= (Seq_index xs@23@01 1) (Seq_index xs@23@01 0)))
            (not (= (Seq_index xs@23@01 0) (Seq_index xs@23@01 1)))
            (forall ((r $Ref)) (!
              (<= ($FVF.perm_f (as pm@110@01  $FPM) r) $Perm.Write)
              :pattern ((inv@29@01 r))
              :qid |qp-fld-prm-bnd|))
            (<=
              ($FVF.perm_f (as pm@110@01  $FPM) (Seq_index xs@23@01 1))
              $Perm.Write)
            (<=
              ($FVF.perm_f (as pm@110@01  $FPM) (Seq_index xs@23@01 0))
              $Perm.Write)))
        (or (not (<= 0 i@108@01)) (<= 0 i@108@01))))
    :pattern ((Seq_index xs@23@01 i@108@01))
    :qid |f-aux|))
  (fun02%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<f>To$Snap (as sm@115@01  $FVF<f>))
      $Snap.unit)) xs@23@01)))
(set-option :timeout 0)
(push) ; 3
(assert (not (=
  (fun02 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<f>To$Snap (as sm@115@01  $FVF<f>))
      $Snap.unit)) xs@23@01)
  14)))
(check-sat)
; unknown
(pop) ; 3
; 0.53s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test03 ----------
(declare-const xs@116@01 Seq<$Ref>)
(declare-const xs@117@01 Seq<$Ref>)
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
; inhale |xs| > 6
(declare-const $t@118@01 $Snap)
(assert (= $t@118@01 $Snap.unit))
; [eval] |xs| > 6
; [eval] |xs|
(assert (> (Seq_length xs@117@01) 6))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall k: Int, j: Int ::
;     { xs[k], xs[j] }
;     k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==>
;     xs[k] != xs[j])
(declare-const $t@119@01 $Snap)
(assert (= $t@119@01 $Snap.unit))
; [eval] (forall k: Int, j: Int :: { xs[k], xs[j] } k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==> xs[k] != xs[j])
(declare-const k@120@01 Int)
(declare-const j@121@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==> xs[k] != xs[j]
; [eval] k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j)))
; [eval] k >= 0
(push) ; 4
; [then-branch: 60 | k@120@01 >= 0 | live]
; [else-branch: 60 | !(k@120@01 >= 0) | live]
(push) ; 5
; [then-branch: 60 | k@120@01 >= 0]
(assert (>= k@120@01 0))
; [eval] k < |xs|
; [eval] |xs|
(push) ; 6
; [then-branch: 61 | k@120@01 < |xs@117@01| | live]
; [else-branch: 61 | !(k@120@01 < |xs@117@01|) | live]
(push) ; 7
; [then-branch: 61 | k@120@01 < |xs@117@01|]
(assert (< k@120@01 (Seq_length xs@117@01)))
; [eval] j >= 0
(push) ; 8
; [then-branch: 62 | j@121@01 >= 0 | live]
; [else-branch: 62 | !(j@121@01 >= 0) | live]
(push) ; 9
; [then-branch: 62 | j@121@01 >= 0]
(assert (>= j@121@01 0))
; [eval] j < |xs|
; [eval] |xs|
(push) ; 10
; [then-branch: 63 | j@121@01 < |xs@117@01| | live]
; [else-branch: 63 | !(j@121@01 < |xs@117@01|) | live]
(push) ; 11
; [then-branch: 63 | j@121@01 < |xs@117@01|]
(assert (< j@121@01 (Seq_length xs@117@01)))
; [eval] k != j
(pop) ; 11
(push) ; 11
; [else-branch: 63 | !(j@121@01 < |xs@117@01|)]
(assert (not (< j@121@01 (Seq_length xs@117@01))))
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (not (< j@121@01 (Seq_length xs@117@01)))
  (< j@121@01 (Seq_length xs@117@01))))
(pop) ; 9
(push) ; 9
; [else-branch: 62 | !(j@121@01 >= 0)]
(assert (not (>= j@121@01 0)))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (=>
  (>= j@121@01 0)
  (and
    (>= j@121@01 0)
    (or
      (not (< j@121@01 (Seq_length xs@117@01)))
      (< j@121@01 (Seq_length xs@117@01))))))
; Joined path conditions
(assert (or (not (>= j@121@01 0)) (>= j@121@01 0)))
(pop) ; 7
(push) ; 7
; [else-branch: 61 | !(k@120@01 < |xs@117@01|)]
(assert (not (< k@120@01 (Seq_length xs@117@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (< k@120@01 (Seq_length xs@117@01))
  (and
    (< k@120@01 (Seq_length xs@117@01))
    (=>
      (>= j@121@01 0)
      (and
        (>= j@121@01 0)
        (or
          (not (< j@121@01 (Seq_length xs@117@01)))
          (< j@121@01 (Seq_length xs@117@01)))))
    (or (not (>= j@121@01 0)) (>= j@121@01 0)))))
; Joined path conditions
(assert (or
  (not (< k@120@01 (Seq_length xs@117@01)))
  (< k@120@01 (Seq_length xs@117@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 60 | !(k@120@01 >= 0)]
(assert (not (>= k@120@01 0)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (>= k@120@01 0)
  (and
    (>= k@120@01 0)
    (=>
      (< k@120@01 (Seq_length xs@117@01))
      (and
        (< k@120@01 (Seq_length xs@117@01))
        (=>
          (>= j@121@01 0)
          (and
            (>= j@121@01 0)
            (or
              (not (< j@121@01 (Seq_length xs@117@01)))
              (< j@121@01 (Seq_length xs@117@01)))))
        (or (not (>= j@121@01 0)) (>= j@121@01 0))))
    (or
      (not (< k@120@01 (Seq_length xs@117@01)))
      (< k@120@01 (Seq_length xs@117@01))))))
; Joined path conditions
(assert (or (not (>= k@120@01 0)) (>= k@120@01 0)))
(push) ; 4
; [then-branch: 64 | k@120@01 != j@121@01 && j@121@01 < |xs@117@01| && j@121@01 >= 0 && k@120@01 < |xs@117@01| && k@120@01 >= 0 | live]
; [else-branch: 64 | !(k@120@01 != j@121@01 && j@121@01 < |xs@117@01| && j@121@01 >= 0 && k@120@01 < |xs@117@01| && k@120@01 >= 0) | live]
(push) ; 5
; [then-branch: 64 | k@120@01 != j@121@01 && j@121@01 < |xs@117@01| && j@121@01 >= 0 && k@120@01 < |xs@117@01| && k@120@01 >= 0]
(assert (and
  (and
    (and
      (and (not (= k@120@01 j@121@01)) (< j@121@01 (Seq_length xs@117@01)))
      (>= j@121@01 0))
    (< k@120@01 (Seq_length xs@117@01)))
  (>= k@120@01 0)))
; [eval] xs[k] != xs[j]
; [eval] xs[k]
; [eval] xs[j]
(pop) ; 5
(push) ; 5
; [else-branch: 64 | !(k@120@01 != j@121@01 && j@121@01 < |xs@117@01| && j@121@01 >= 0 && k@120@01 < |xs@117@01| && k@120@01 >= 0)]
(assert (not
  (and
    (and
      (and
        (and (not (= k@120@01 j@121@01)) (< j@121@01 (Seq_length xs@117@01)))
        (>= j@121@01 0))
      (< k@120@01 (Seq_length xs@117@01)))
    (>= k@120@01 0))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (and
      (and
        (and (not (= k@120@01 j@121@01)) (< j@121@01 (Seq_length xs@117@01)))
        (>= j@121@01 0))
      (< k@120@01 (Seq_length xs@117@01)))
    (>= k@120@01 0))
  (and
    (not (= k@120@01 j@121@01))
    (< j@121@01 (Seq_length xs@117@01))
    (>= j@121@01 0)
    (< k@120@01 (Seq_length xs@117@01))
    (>= k@120@01 0))))
; Joined path conditions
(assert (or
  (not
    (and
      (and
        (and
          (and (not (= k@120@01 j@121@01)) (< j@121@01 (Seq_length xs@117@01)))
          (>= j@121@01 0))
        (< k@120@01 (Seq_length xs@117@01)))
      (>= k@120@01 0)))
  (and
    (and
      (and
        (and (not (= k@120@01 j@121@01)) (< j@121@01 (Seq_length xs@117@01)))
        (>= j@121@01 0))
      (< k@120@01 (Seq_length xs@117@01)))
    (>= k@120@01 0))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@120@01 Int) (j@121@01 Int)) (!
  (and
    (=>
      (>= k@120@01 0)
      (and
        (>= k@120@01 0)
        (=>
          (< k@120@01 (Seq_length xs@117@01))
          (and
            (< k@120@01 (Seq_length xs@117@01))
            (=>
              (>= j@121@01 0)
              (and
                (>= j@121@01 0)
                (or
                  (not (< j@121@01 (Seq_length xs@117@01)))
                  (< j@121@01 (Seq_length xs@117@01)))))
            (or (not (>= j@121@01 0)) (>= j@121@01 0))))
        (or
          (not (< k@120@01 (Seq_length xs@117@01)))
          (< k@120@01 (Seq_length xs@117@01)))))
    (or (not (>= k@120@01 0)) (>= k@120@01 0))
    (=>
      (and
        (and
          (and
            (and (not (= k@120@01 j@121@01)) (< j@121@01 (Seq_length xs@117@01)))
            (>= j@121@01 0))
          (< k@120@01 (Seq_length xs@117@01)))
        (>= k@120@01 0))
      (and
        (not (= k@120@01 j@121@01))
        (< j@121@01 (Seq_length xs@117@01))
        (>= j@121@01 0)
        (< k@120@01 (Seq_length xs@117@01))
        (>= k@120@01 0)))
    (or
      (not
        (and
          (and
            (and
              (and
                (not (= k@120@01 j@121@01))
                (< j@121@01 (Seq_length xs@117@01)))
              (>= j@121@01 0))
            (< k@120@01 (Seq_length xs@117@01)))
          (>= k@120@01 0)))
      (and
        (and
          (and
            (and (not (= k@120@01 j@121@01)) (< j@121@01 (Seq_length xs@117@01)))
            (>= j@121@01 0))
          (< k@120@01 (Seq_length xs@117@01)))
        (>= k@120@01 0))))
  :pattern ((Seq_index xs@117@01 k@120@01) (Seq_index xs@117@01 j@121@01))
  :qid |prog.l54-aux|)))
(assert (forall ((k@120@01 Int) (j@121@01 Int)) (!
  (=>
    (and
      (and
        (and
          (and (not (= k@120@01 j@121@01)) (< j@121@01 (Seq_length xs@117@01)))
          (>= j@121@01 0))
        (< k@120@01 (Seq_length xs@117@01)))
      (>= k@120@01 0))
    (not (= (Seq_index xs@117@01 k@120@01) (Seq_index xs@117@01 j@121@01))))
  :pattern ((Seq_index xs@117@01 k@120@01) (Seq_index xs@117@01 j@121@01))
  :qid |prog.l54|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall j: Int ::0 <= j && j < 3 ==> acc(xs[j].f, write))
(declare-const j@122@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= j && j < 3
; [eval] 0 <= j
(push) ; 4
; [then-branch: 65 | 0 <= j@122@01 | live]
; [else-branch: 65 | !(0 <= j@122@01) | live]
(push) ; 5
; [then-branch: 65 | 0 <= j@122@01]
(assert (<= 0 j@122@01))
; [eval] j < 3
(pop) ; 5
(push) ; 5
; [else-branch: 65 | !(0 <= j@122@01)]
(assert (not (<= 0 j@122@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 j@122@01)) (<= 0 j@122@01)))
(assert (and (< j@122@01 3) (<= 0 j@122@01)))
; [eval] xs[j]
(push) ; 4
(assert (not (>= j@122@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< j@122@01 (Seq_length xs@117@01))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
(declare-const $t@123@01 $FVF<f>)
(declare-fun inv@124@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@122@01 Int)) (!
  (=>
    (and (< j@122@01 3) (<= 0 j@122@01))
    (or (not (<= 0 j@122@01)) (<= 0 j@122@01)))
  :pattern ((Seq_index xs@117@01 j@122@01))
  :qid |f-aux|)))
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((j@122@01 Int)) (!
  (=>
    (and (< j@122@01 3) (<= 0 j@122@01))
    (= (inv@124@01 (Seq_index xs@117@01 j@122@01)) j@122@01))
  :pattern ((Seq_index xs@117@01 j@122@01))
  :qid |quant-u-141|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@124@01 r) 3) (<= 0 (inv@124@01 r)))
    (= (Seq_index xs@117@01 (inv@124@01 r)) r))
  :pattern ((inv@124@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j@122@01 Int)) (!
  (=>
    (and (< j@122@01 3) (<= 0 j@122@01))
    (not (= (Seq_index xs@117@01 j@122@01) $Ref.null)))
  :pattern ((Seq_index xs@117@01 j@122@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall j: Int ::3 <= j && j < |xs| ==> acc(xs[j].f, write))
(declare-const j@125@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 3 <= j && j < |xs|
; [eval] 3 <= j
(push) ; 4
; [then-branch: 66 | 3 <= j@125@01 | live]
; [else-branch: 66 | !(3 <= j@125@01) | live]
(push) ; 5
; [then-branch: 66 | 3 <= j@125@01]
(assert (<= 3 j@125@01))
; [eval] j < |xs|
; [eval] |xs|
(pop) ; 5
(push) ; 5
; [else-branch: 66 | !(3 <= j@125@01)]
(assert (not (<= 3 j@125@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 3 j@125@01)) (<= 3 j@125@01)))
(assert (and (< j@125@01 (Seq_length xs@117@01)) (<= 3 j@125@01)))
; [eval] xs[j]
(push) ; 4
(assert (not (>= j@125@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
(declare-const $t@126@01 $FVF<f>)
(declare-fun inv@127@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@125@01 Int)) (!
  (=>
    (and (< j@125@01 (Seq_length xs@117@01)) (<= 3 j@125@01))
    (or (not (<= 3 j@125@01)) (<= 3 j@125@01)))
  :pattern ((Seq_index xs@117@01 j@125@01))
  :qid |f-aux|)))
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((j@125@01 Int)) (!
  (=>
    (and (< j@125@01 (Seq_length xs@117@01)) (<= 3 j@125@01))
    (= (inv@127@01 (Seq_index xs@117@01 j@125@01)) j@125@01))
  :pattern ((Seq_index xs@117@01 j@125@01))
  :qid |quant-u-143|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@127@01 r) (Seq_length xs@117@01)) (<= 3 (inv@127@01 r)))
    (= (Seq_index xs@117@01 (inv@127@01 r)) r))
  :pattern ((inv@127@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j@125@01 Int)) (!
  (=>
    (and (< j@125@01 (Seq_length xs@117@01)) (<= 3 j@125@01))
    (not (= (Seq_index xs@117@01 j@125@01) $Ref.null)))
  :pattern ((Seq_index xs@117@01 j@125@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale xs[0].f < xs[1].f
(declare-const $t@128@01 $Snap)
(assert (= $t@128@01 $Snap.unit))
; [eval] xs[0].f < xs[1].f
; [eval] xs[0]
(set-option :timeout 0)
(push) ; 3
(assert (not (< 0 (Seq_length xs@117@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const sm@129@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@127@01 r) (Seq_length xs@117@01)) (<= 3 (inv@127@01 r)))
    (= ($FVF.lookup_f (as sm@129@01  $FVF<f>) r) ($FVF.lookup_f $t@126@01 r)))
  :pattern (($FVF.lookup_f (as sm@129@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@126@01 r))
  :qid |qp.fvfValDef72|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@124@01 r) 3) (<= 0 (inv@124@01 r)))
    (= ($FVF.lookup_f (as sm@129@01  $FVF<f>) r) ($FVF.lookup_f $t@123@01 r)))
  :pattern (($FVF.lookup_f (as sm@129@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@123@01 r))
  :qid |qp.fvfValDef73|)))
(declare-const pm@130@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@130@01  $FPM) r)
    (+
      (ite
        (and (< (inv@127@01 r) (Seq_length xs@117@01)) (<= 3 (inv@127@01 r)))
        $Perm.Write
        $Perm.No)
      (ite (and (< (inv@124@01 r) 3) (<= 0 (inv@124@01 r))) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@130@01  $FPM) r))
  :qid |qp.resPrmSumDef74|)))
(push) ; 3
(assert (not (< $Perm.No ($FVF.perm_f (as pm@130@01  $FPM) (Seq_index xs@117@01 0)))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [eval] xs[1]
(push) ; 3
(assert (not (< 1 (Seq_length xs@117@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const sm@131@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@127@01 r) (Seq_length xs@117@01)) (<= 3 (inv@127@01 r)))
    (= ($FVF.lookup_f (as sm@131@01  $FVF<f>) r) ($FVF.lookup_f $t@126@01 r)))
  :pattern (($FVF.lookup_f (as sm@131@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@126@01 r))
  :qid |qp.fvfValDef75|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@124@01 r) 3) (<= 0 (inv@124@01 r)))
    (= ($FVF.lookup_f (as sm@131@01  $FVF<f>) r) ($FVF.lookup_f $t@123@01 r)))
  :pattern (($FVF.lookup_f (as sm@131@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@123@01 r))
  :qid |qp.fvfValDef76|)))
(declare-const pm@132@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@132@01  $FPM) r)
    (+
      (ite
        (and (< (inv@127@01 r) (Seq_length xs@117@01)) (<= 3 (inv@127@01 r)))
        $Perm.Write
        $Perm.No)
      (ite (and (< (inv@124@01 r) 3) (<= 0 (inv@124@01 r))) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@132@01  $FPM) r))
  :qid |qp.resPrmSumDef77|)))
(push) ; 3
(assert (not (< $Perm.No ($FVF.perm_f (as pm@132@01  $FPM) (Seq_index xs@117@01 1)))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (<
  ($FVF.lookup_f (as sm@129@01  $FVF<f>) (Seq_index xs@117@01 0))
  ($FVF.lookup_f (as sm@131@01  $FVF<f>) (Seq_index xs@117@01 1))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert fun03(xs, 0) < fun03(xs, 1)
; [eval] fun03(xs, 0) < fun03(xs, 1)
; [eval] fun03(xs, 0)
(set-option :timeout 0)
(push) ; 3
; [eval] |xs| > 6
; [eval] |xs|
; [eval] (forall k: Int, j: Int ::k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==> xs[k] != xs[j])
(declare-const k@133@01 Int)
(declare-const j@134@01 Int)
(push) ; 4
; [eval] k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==> xs[k] != xs[j]
; [eval] k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j)))
; [eval] k >= 0
(push) ; 5
; [then-branch: 67 | k@133@01 >= 0 | live]
; [else-branch: 67 | !(k@133@01 >= 0) | live]
(push) ; 6
; [then-branch: 67 | k@133@01 >= 0]
(assert (>= k@133@01 0))
; [eval] k < |xs|
; [eval] |xs|
(push) ; 7
; [then-branch: 68 | k@133@01 < |xs@117@01| | live]
; [else-branch: 68 | !(k@133@01 < |xs@117@01|) | live]
(push) ; 8
; [then-branch: 68 | k@133@01 < |xs@117@01|]
(assert (< k@133@01 (Seq_length xs@117@01)))
; [eval] j >= 0
(push) ; 9
; [then-branch: 69 | j@134@01 >= 0 | live]
; [else-branch: 69 | !(j@134@01 >= 0) | live]
(push) ; 10
; [then-branch: 69 | j@134@01 >= 0]
(assert (>= j@134@01 0))
; [eval] j < |xs|
; [eval] |xs|
(push) ; 11
; [then-branch: 70 | j@134@01 < |xs@117@01| | live]
; [else-branch: 70 | !(j@134@01 < |xs@117@01|) | live]
(push) ; 12
; [then-branch: 70 | j@134@01 < |xs@117@01|]
(assert (< j@134@01 (Seq_length xs@117@01)))
; [eval] k != j
(pop) ; 12
(push) ; 12
; [else-branch: 70 | !(j@134@01 < |xs@117@01|)]
(assert (not (< j@134@01 (Seq_length xs@117@01))))
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or
  (not (< j@134@01 (Seq_length xs@117@01)))
  (< j@134@01 (Seq_length xs@117@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 69 | !(j@134@01 >= 0)]
(assert (not (>= j@134@01 0)))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (=>
  (>= j@134@01 0)
  (and
    (>= j@134@01 0)
    (or
      (not (< j@134@01 (Seq_length xs@117@01)))
      (< j@134@01 (Seq_length xs@117@01))))))
; Joined path conditions
(assert (or (not (>= j@134@01 0)) (>= j@134@01 0)))
(pop) ; 8
(push) ; 8
; [else-branch: 68 | !(k@133@01 < |xs@117@01|)]
(assert (not (< k@133@01 (Seq_length xs@117@01))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (< k@133@01 (Seq_length xs@117@01))
  (and
    (< k@133@01 (Seq_length xs@117@01))
    (=>
      (>= j@134@01 0)
      (and
        (>= j@134@01 0)
        (or
          (not (< j@134@01 (Seq_length xs@117@01)))
          (< j@134@01 (Seq_length xs@117@01)))))
    (or (not (>= j@134@01 0)) (>= j@134@01 0)))))
; Joined path conditions
(assert (or
  (not (< k@133@01 (Seq_length xs@117@01)))
  (< k@133@01 (Seq_length xs@117@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 67 | !(k@133@01 >= 0)]
(assert (not (>= k@133@01 0)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (>= k@133@01 0)
  (and
    (>= k@133@01 0)
    (=>
      (< k@133@01 (Seq_length xs@117@01))
      (and
        (< k@133@01 (Seq_length xs@117@01))
        (=>
          (>= j@134@01 0)
          (and
            (>= j@134@01 0)
            (or
              (not (< j@134@01 (Seq_length xs@117@01)))
              (< j@134@01 (Seq_length xs@117@01)))))
        (or (not (>= j@134@01 0)) (>= j@134@01 0))))
    (or
      (not (< k@133@01 (Seq_length xs@117@01)))
      (< k@133@01 (Seq_length xs@117@01))))))
; Joined path conditions
(assert (or (not (>= k@133@01 0)) (>= k@133@01 0)))
(push) ; 5
; [then-branch: 71 | k@133@01 != j@134@01 && j@134@01 < |xs@117@01| && j@134@01 >= 0 && k@133@01 < |xs@117@01| && k@133@01 >= 0 | live]
; [else-branch: 71 | !(k@133@01 != j@134@01 && j@134@01 < |xs@117@01| && j@134@01 >= 0 && k@133@01 < |xs@117@01| && k@133@01 >= 0) | live]
(push) ; 6
; [then-branch: 71 | k@133@01 != j@134@01 && j@134@01 < |xs@117@01| && j@134@01 >= 0 && k@133@01 < |xs@117@01| && k@133@01 >= 0]
(assert (and
  (and
    (and
      (and (not (= k@133@01 j@134@01)) (< j@134@01 (Seq_length xs@117@01)))
      (>= j@134@01 0))
    (< k@133@01 (Seq_length xs@117@01)))
  (>= k@133@01 0)))
; [eval] xs[k] != xs[j]
; [eval] xs[k]
; [eval] xs[j]
(pop) ; 6
(push) ; 6
; [else-branch: 71 | !(k@133@01 != j@134@01 && j@134@01 < |xs@117@01| && j@134@01 >= 0 && k@133@01 < |xs@117@01| && k@133@01 >= 0)]
(assert (not
  (and
    (and
      (and
        (and (not (= k@133@01 j@134@01)) (< j@134@01 (Seq_length xs@117@01)))
        (>= j@134@01 0))
      (< k@133@01 (Seq_length xs@117@01)))
    (>= k@133@01 0))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (and
      (and
        (and (not (= k@133@01 j@134@01)) (< j@134@01 (Seq_length xs@117@01)))
        (>= j@134@01 0))
      (< k@133@01 (Seq_length xs@117@01)))
    (>= k@133@01 0))
  (and
    (not (= k@133@01 j@134@01))
    (< j@134@01 (Seq_length xs@117@01))
    (>= j@134@01 0)
    (< k@133@01 (Seq_length xs@117@01))
    (>= k@133@01 0))))
; Joined path conditions
(assert (or
  (not
    (and
      (and
        (and
          (and (not (= k@133@01 j@134@01)) (< j@134@01 (Seq_length xs@117@01)))
          (>= j@134@01 0))
        (< k@133@01 (Seq_length xs@117@01)))
      (>= k@133@01 0)))
  (and
    (and
      (and
        (and (not (= k@133@01 j@134@01)) (< j@134@01 (Seq_length xs@117@01)))
        (>= j@134@01 0))
      (< k@133@01 (Seq_length xs@117@01)))
    (>= k@133@01 0))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 4
(assert (not (forall ((k@133@01 Int) (j@134@01 Int)) (!
  (=>
    (and
      (and
        (and
          (and (not (= k@133@01 j@134@01)) (< j@134@01 (Seq_length xs@117@01)))
          (>= j@134@01 0))
        (< k@133@01 (Seq_length xs@117@01)))
      (>= k@133@01 0))
    (not (= (Seq_index xs@117@01 k@133@01) (Seq_index xs@117@01 j@134@01))))
  
  :qid |prog.l46|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (forall ((k@133@01 Int) (j@134@01 Int)) (!
  (=>
    (and
      (and
        (and
          (and (not (= k@133@01 j@134@01)) (< j@134@01 (Seq_length xs@117@01)))
          (>= j@134@01 0))
        (< k@133@01 (Seq_length xs@117@01)))
      (>= k@133@01 0))
    (not (= (Seq_index xs@117@01 k@133@01) (Seq_index xs@117@01 j@134@01))))
  
  :qid |prog.l46|)))
(declare-const j@135@01 Int)
(push) ; 4
; [eval] 0 <= j && j < 3
; [eval] 0 <= j
(push) ; 5
; [then-branch: 72 | 0 <= j@135@01 | live]
; [else-branch: 72 | !(0 <= j@135@01) | live]
(push) ; 6
; [then-branch: 72 | 0 <= j@135@01]
(assert (<= 0 j@135@01))
; [eval] j < 3
(pop) ; 6
(push) ; 6
; [else-branch: 72 | !(0 <= j@135@01)]
(assert (not (<= 0 j@135@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 j@135@01)) (<= 0 j@135@01)))
(assert (and (< j@135@01 3) (<= 0 j@135@01)))
; [eval] xs[j]
(push) ; 5
(assert (not (>= j@135@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< j@135@01 (Seq_length xs@117@01))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@136@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@135@01 Int)) (!
  (=>
    (and (< j@135@01 3) (<= 0 j@135@01))
    (or (not (<= 0 j@135@01)) (<= 0 j@135@01)))
  :pattern ((Seq_index xs@117@01 j@135@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((j1@135@01 Int) (j2@135@01 Int)) (!
  (=>
    (and
      (and (< j1@135@01 3) (<= 0 j1@135@01))
      (and (< j2@135@01 3) (<= 0 j2@135@01))
      (= (Seq_index xs@117@01 j1@135@01) (Seq_index xs@117@01 j2@135@01)))
    (= j1@135@01 j2@135@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@135@01 Int)) (!
  (=>
    (and (< j@135@01 3) (<= 0 j@135@01))
    (= (inv@136@01 (Seq_index xs@117@01 j@135@01)) j@135@01))
  :pattern ((Seq_index xs@117@01 j@135@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@136@01 r) 3) (<= 0 (inv@136@01 r)))
    (= (Seq_index xs@117@01 (inv@136@01 r)) r))
  :pattern ((inv@136@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@137@01 ((r $Ref)) $Perm
  (ite
    (and (< (inv@136@01 r) 3) (<= 0 (inv@136@01 r)))
    ($Perm.min
      (ite
        (and (< (inv@127@01 r) (Seq_length xs@117@01)) (<= 3 (inv@127@01 r)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@138@01 ((r $Ref)) $Perm
  (ite
    (and (< (inv@136@01 r) 3) (<= 0 (inv@136@01 r)))
    ($Perm.min
      (ite (and (< (inv@124@01 r) 3) (<= 0 (inv@124@01 r))) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@137@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (< (inv@127@01 r) (Seq_length xs@117@01)) (<= 3 (inv@127@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@137@01 r))
    $Perm.No)
  
  :qid |quant-u-146|))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (< (inv@136@01 r) 3) (<= 0 (inv@136@01 r)))
    (= (- $Perm.Write (pTaken@137@01 r)) $Perm.No))
  
  :qid |quant-u-147|))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite (and (< (inv@124@01 r) 3) (<= 0 (inv@124@01 r))) $Perm.Write $Perm.No)
      (pTaken@138@01 r))
    $Perm.No)
  
  :qid |quant-u-148|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (< (inv@136@01 r) 3) (<= 0 (inv@136@01 r)))
    (= (- (- $Perm.Write (pTaken@137@01 r)) (pTaken@138@01 r)) $Perm.No))
  
  :qid |quant-u-149|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@139@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@139@01  $FVF<f>)))
      (and (< (inv@136@01 r) 3) (<= 0 (inv@136@01 r))))
    (=>
      (and (< (inv@136@01 r) 3) (<= 0 (inv@136@01 r)))
      (Set_in r ($FVF.domain_f (as sm@139@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@139@01  $FVF<f>))))
  :qid |qp.fvfDomDef80|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@136@01 r) 3) (<= 0 (inv@136@01 r)))
      (and (< (inv@127@01 r) (Seq_length xs@117@01)) (<= 3 (inv@127@01 r))))
    (= ($FVF.lookup_f (as sm@139@01  $FVF<f>) r) ($FVF.lookup_f $t@126@01 r)))
  :pattern (($FVF.lookup_f (as sm@139@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@126@01 r))
  :qid |qp.fvfValDef78|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@136@01 r) 3) (<= 0 (inv@136@01 r)))
      (and (< (inv@124@01 r) 3) (<= 0 (inv@124@01 r))))
    (= ($FVF.lookup_f (as sm@139@01  $FVF<f>) r) ($FVF.lookup_f $t@123@01 r)))
  :pattern (($FVF.lookup_f (as sm@139@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@123@01 r))
  :qid |qp.fvfValDef79|)))
(declare-const j@140@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] 3 <= j && j < |xs|
; [eval] 3 <= j
(push) ; 5
; [then-branch: 73 | 3 <= j@140@01 | live]
; [else-branch: 73 | !(3 <= j@140@01) | live]
(push) ; 6
; [then-branch: 73 | 3 <= j@140@01]
(assert (<= 3 j@140@01))
; [eval] j < |xs|
; [eval] |xs|
(pop) ; 6
(push) ; 6
; [else-branch: 73 | !(3 <= j@140@01)]
(assert (not (<= 3 j@140@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 3 j@140@01)) (<= 3 j@140@01)))
(assert (and (< j@140@01 (Seq_length xs@117@01)) (<= 3 j@140@01)))
; [eval] xs[j]
(push) ; 5
(assert (not (>= j@140@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@141@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@140@01 Int)) (!
  (=>
    (and (< j@140@01 (Seq_length xs@117@01)) (<= 3 j@140@01))
    (or (not (<= 3 j@140@01)) (<= 3 j@140@01)))
  :pattern ((Seq_index xs@117@01 j@140@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((j1@140@01 Int) (j2@140@01 Int)) (!
  (=>
    (and
      (and (< j1@140@01 (Seq_length xs@117@01)) (<= 3 j1@140@01))
      (and (< j2@140@01 (Seq_length xs@117@01)) (<= 3 j2@140@01))
      (= (Seq_index xs@117@01 j1@140@01) (Seq_index xs@117@01 j2@140@01)))
    (= j1@140@01 j2@140@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@140@01 Int)) (!
  (=>
    (and (< j@140@01 (Seq_length xs@117@01)) (<= 3 j@140@01))
    (= (inv@141@01 (Seq_index xs@117@01 j@140@01)) j@140@01))
  :pattern ((Seq_index xs@117@01 j@140@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@141@01 r) (Seq_length xs@117@01)) (<= 3 (inv@141@01 r)))
    (= (Seq_index xs@117@01 (inv@141@01 r)) r))
  :pattern ((inv@141@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@142@01 ((r $Ref)) $Perm
  (ite
    (and (< (inv@141@01 r) (Seq_length xs@117@01)) (<= 3 (inv@141@01 r)))
    ($Perm.min
      (-
        (ite
          (and (< (inv@127@01 r) (Seq_length xs@117@01)) (<= 3 (inv@127@01 r)))
          $Perm.Write
          $Perm.No)
        (pTaken@137@01 r))
      $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (-
        (ite
          (and (< (inv@127@01 r) (Seq_length xs@117@01)) (<= 3 (inv@127@01 r)))
          $Perm.Write
          $Perm.No)
        (pTaken@137@01 r))
      (pTaken@142@01 r))
    $Perm.No)
  
  :qid |quant-u-152|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (< (inv@141@01 r) (Seq_length xs@117@01)) (<= 3 (inv@141@01 r)))
    (= (- $Perm.Write (pTaken@142@01 r)) $Perm.No))
  
  :qid |quant-u-153|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@143@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@143@01  $FVF<f>)))
      (and (< (inv@141@01 r) (Seq_length xs@117@01)) (<= 3 (inv@141@01 r))))
    (=>
      (and (< (inv@141@01 r) (Seq_length xs@117@01)) (<= 3 (inv@141@01 r)))
      (Set_in r ($FVF.domain_f (as sm@143@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@143@01  $FVF<f>))))
  :qid |qp.fvfDomDef82|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@141@01 r) (Seq_length xs@117@01)) (<= 3 (inv@141@01 r)))
      (<
        $Perm.No
        (-
          (ite
            (and (< (inv@127@01 r) (Seq_length xs@117@01)) (<= 3 (inv@127@01 r)))
            $Perm.Write
            $Perm.No)
          (pTaken@137@01 r))))
    (= ($FVF.lookup_f (as sm@143@01  $FVF<f>) r) ($FVF.lookup_f $t@126@01 r)))
  :pattern (($FVF.lookup_f (as sm@143@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@126@01 r))
  :qid |qp.fvfValDef81|)))
; [eval] 0 <= i
; [eval] i < |xs|
; [eval] |xs|
(set-option :timeout 0)
(push) ; 4
(assert (not (< 0 (Seq_length xs@117@01))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (< 0 (Seq_length xs@117@01)))
(assert (fun03%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<f>To$Snap (as sm@139@01  $FVF<f>))
      ($Snap.combine
        ($SortWrappers.$FVF<f>To$Snap (as sm@143@01  $FVF<f>))
        ($Snap.combine $Snap.unit $Snap.unit))))) xs@117@01 0))
(pop) ; 3
; Joined path conditions
(assert (forall ((j@135@01 Int)) (!
  (=>
    (and (< j@135@01 3) (<= 0 j@135@01))
    (= (inv@136@01 (Seq_index xs@117@01 j@135@01)) j@135@01))
  :pattern ((Seq_index xs@117@01 j@135@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@136@01 r) 3) (<= 0 (inv@136@01 r)))
    (= (Seq_index xs@117@01 (inv@136@01 r)) r))
  :pattern ((inv@136@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@139@01  $FVF<f>)))
      (and (< (inv@136@01 r) 3) (<= 0 (inv@136@01 r))))
    (=>
      (and (< (inv@136@01 r) 3) (<= 0 (inv@136@01 r)))
      (Set_in r ($FVF.domain_f (as sm@139@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@139@01  $FVF<f>))))
  :qid |qp.fvfDomDef80|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@136@01 r) 3) (<= 0 (inv@136@01 r)))
      (and (< (inv@127@01 r) (Seq_length xs@117@01)) (<= 3 (inv@127@01 r))))
    (= ($FVF.lookup_f (as sm@139@01  $FVF<f>) r) ($FVF.lookup_f $t@126@01 r)))
  :pattern (($FVF.lookup_f (as sm@139@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@126@01 r))
  :qid |qp.fvfValDef78|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@136@01 r) 3) (<= 0 (inv@136@01 r)))
      (and (< (inv@124@01 r) 3) (<= 0 (inv@124@01 r))))
    (= ($FVF.lookup_f (as sm@139@01  $FVF<f>) r) ($FVF.lookup_f $t@123@01 r)))
  :pattern (($FVF.lookup_f (as sm@139@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@123@01 r))
  :qid |qp.fvfValDef79|)))
(assert (forall ((j@140@01 Int)) (!
  (=>
    (and (< j@140@01 (Seq_length xs@117@01)) (<= 3 j@140@01))
    (= (inv@141@01 (Seq_index xs@117@01 j@140@01)) j@140@01))
  :pattern ((Seq_index xs@117@01 j@140@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@141@01 r) (Seq_length xs@117@01)) (<= 3 (inv@141@01 r)))
    (= (Seq_index xs@117@01 (inv@141@01 r)) r))
  :pattern ((inv@141@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@143@01  $FVF<f>)))
      (and (< (inv@141@01 r) (Seq_length xs@117@01)) (<= 3 (inv@141@01 r))))
    (=>
      (and (< (inv@141@01 r) (Seq_length xs@117@01)) (<= 3 (inv@141@01 r)))
      (Set_in r ($FVF.domain_f (as sm@143@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@143@01  $FVF<f>))))
  :qid |qp.fvfDomDef82|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@141@01 r) (Seq_length xs@117@01)) (<= 3 (inv@141@01 r)))
      (<
        $Perm.No
        (-
          (ite
            (and (< (inv@127@01 r) (Seq_length xs@117@01)) (<= 3 (inv@127@01 r)))
            $Perm.Write
            $Perm.No)
          (pTaken@137@01 r))))
    (= ($FVF.lookup_f (as sm@143@01  $FVF<f>) r) ($FVF.lookup_f $t@126@01 r)))
  :pattern (($FVF.lookup_f (as sm@143@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@126@01 r))
  :qid |qp.fvfValDef81|)))
(assert (and
  (forall ((k@133@01 Int) (j@134@01 Int)) (!
    (=>
      (and
        (and
          (and
            (and (not (= k@133@01 j@134@01)) (< j@134@01 (Seq_length xs@117@01)))
            (>= j@134@01 0))
          (< k@133@01 (Seq_length xs@117@01)))
        (>= k@133@01 0))
      (not (= (Seq_index xs@117@01 k@133@01) (Seq_index xs@117@01 j@134@01))))
    
    :qid |prog.l46|))
  (forall ((j@135@01 Int)) (!
    (=>
      (and (< j@135@01 3) (<= 0 j@135@01))
      (or (not (<= 0 j@135@01)) (<= 0 j@135@01)))
    :pattern ((Seq_index xs@117@01 j@135@01))
    :qid |f-aux|))
  (forall ((j@140@01 Int)) (!
    (=>
      (and (< j@140@01 (Seq_length xs@117@01)) (<= 3 j@140@01))
      (or (not (<= 3 j@140@01)) (<= 3 j@140@01)))
    :pattern ((Seq_index xs@117@01 j@140@01))
    :qid |f-aux|))
  (< 0 (Seq_length xs@117@01))
  (fun03%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$FVF<f>To$Snap (as sm@139@01  $FVF<f>))
        ($Snap.combine
          ($SortWrappers.$FVF<f>To$Snap (as sm@143@01  $FVF<f>))
          ($Snap.combine $Snap.unit $Snap.unit))))) xs@117@01 0)))
; [eval] fun03(xs, 1)
(push) ; 3
; [eval] |xs| > 6
; [eval] |xs|
; [eval] (forall k: Int, j: Int ::k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==> xs[k] != xs[j])
(declare-const k@144@01 Int)
(declare-const j@145@01 Int)
(push) ; 4
; [eval] k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==> xs[k] != xs[j]
; [eval] k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j)))
; [eval] k >= 0
(push) ; 5
; [then-branch: 74 | k@144@01 >= 0 | live]
; [else-branch: 74 | !(k@144@01 >= 0) | live]
(push) ; 6
; [then-branch: 74 | k@144@01 >= 0]
(assert (>= k@144@01 0))
; [eval] k < |xs|
; [eval] |xs|
(push) ; 7
; [then-branch: 75 | k@144@01 < |xs@117@01| | live]
; [else-branch: 75 | !(k@144@01 < |xs@117@01|) | live]
(push) ; 8
; [then-branch: 75 | k@144@01 < |xs@117@01|]
(assert (< k@144@01 (Seq_length xs@117@01)))
; [eval] j >= 0
(push) ; 9
; [then-branch: 76 | j@145@01 >= 0 | live]
; [else-branch: 76 | !(j@145@01 >= 0) | live]
(push) ; 10
; [then-branch: 76 | j@145@01 >= 0]
(assert (>= j@145@01 0))
; [eval] j < |xs|
; [eval] |xs|
(push) ; 11
; [then-branch: 77 | j@145@01 < |xs@117@01| | live]
; [else-branch: 77 | !(j@145@01 < |xs@117@01|) | live]
(push) ; 12
; [then-branch: 77 | j@145@01 < |xs@117@01|]
(assert (< j@145@01 (Seq_length xs@117@01)))
; [eval] k != j
(pop) ; 12
(push) ; 12
; [else-branch: 77 | !(j@145@01 < |xs@117@01|)]
(assert (not (< j@145@01 (Seq_length xs@117@01))))
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or
  (not (< j@145@01 (Seq_length xs@117@01)))
  (< j@145@01 (Seq_length xs@117@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 76 | !(j@145@01 >= 0)]
(assert (not (>= j@145@01 0)))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (=>
  (>= j@145@01 0)
  (and
    (>= j@145@01 0)
    (or
      (not (< j@145@01 (Seq_length xs@117@01)))
      (< j@145@01 (Seq_length xs@117@01))))))
; Joined path conditions
(assert (or (not (>= j@145@01 0)) (>= j@145@01 0)))
(pop) ; 8
(push) ; 8
; [else-branch: 75 | !(k@144@01 < |xs@117@01|)]
(assert (not (< k@144@01 (Seq_length xs@117@01))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (< k@144@01 (Seq_length xs@117@01))
  (and
    (< k@144@01 (Seq_length xs@117@01))
    (=>
      (>= j@145@01 0)
      (and
        (>= j@145@01 0)
        (or
          (not (< j@145@01 (Seq_length xs@117@01)))
          (< j@145@01 (Seq_length xs@117@01)))))
    (or (not (>= j@145@01 0)) (>= j@145@01 0)))))
; Joined path conditions
(assert (or
  (not (< k@144@01 (Seq_length xs@117@01)))
  (< k@144@01 (Seq_length xs@117@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 74 | !(k@144@01 >= 0)]
(assert (not (>= k@144@01 0)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (>= k@144@01 0)
  (and
    (>= k@144@01 0)
    (=>
      (< k@144@01 (Seq_length xs@117@01))
      (and
        (< k@144@01 (Seq_length xs@117@01))
        (=>
          (>= j@145@01 0)
          (and
            (>= j@145@01 0)
            (or
              (not (< j@145@01 (Seq_length xs@117@01)))
              (< j@145@01 (Seq_length xs@117@01)))))
        (or (not (>= j@145@01 0)) (>= j@145@01 0))))
    (or
      (not (< k@144@01 (Seq_length xs@117@01)))
      (< k@144@01 (Seq_length xs@117@01))))))
; Joined path conditions
(assert (or (not (>= k@144@01 0)) (>= k@144@01 0)))
(push) ; 5
; [then-branch: 78 | k@144@01 != j@145@01 && j@145@01 < |xs@117@01| && j@145@01 >= 0 && k@144@01 < |xs@117@01| && k@144@01 >= 0 | live]
; [else-branch: 78 | !(k@144@01 != j@145@01 && j@145@01 < |xs@117@01| && j@145@01 >= 0 && k@144@01 < |xs@117@01| && k@144@01 >= 0) | live]
(push) ; 6
; [then-branch: 78 | k@144@01 != j@145@01 && j@145@01 < |xs@117@01| && j@145@01 >= 0 && k@144@01 < |xs@117@01| && k@144@01 >= 0]
(assert (and
  (and
    (and
      (and (not (= k@144@01 j@145@01)) (< j@145@01 (Seq_length xs@117@01)))
      (>= j@145@01 0))
    (< k@144@01 (Seq_length xs@117@01)))
  (>= k@144@01 0)))
; [eval] xs[k] != xs[j]
; [eval] xs[k]
; [eval] xs[j]
(pop) ; 6
(push) ; 6
; [else-branch: 78 | !(k@144@01 != j@145@01 && j@145@01 < |xs@117@01| && j@145@01 >= 0 && k@144@01 < |xs@117@01| && k@144@01 >= 0)]
(assert (not
  (and
    (and
      (and
        (and (not (= k@144@01 j@145@01)) (< j@145@01 (Seq_length xs@117@01)))
        (>= j@145@01 0))
      (< k@144@01 (Seq_length xs@117@01)))
    (>= k@144@01 0))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (and
      (and
        (and (not (= k@144@01 j@145@01)) (< j@145@01 (Seq_length xs@117@01)))
        (>= j@145@01 0))
      (< k@144@01 (Seq_length xs@117@01)))
    (>= k@144@01 0))
  (and
    (not (= k@144@01 j@145@01))
    (< j@145@01 (Seq_length xs@117@01))
    (>= j@145@01 0)
    (< k@144@01 (Seq_length xs@117@01))
    (>= k@144@01 0))))
; Joined path conditions
(assert (or
  (not
    (and
      (and
        (and
          (and (not (= k@144@01 j@145@01)) (< j@145@01 (Seq_length xs@117@01)))
          (>= j@145@01 0))
        (< k@144@01 (Seq_length xs@117@01)))
      (>= k@144@01 0)))
  (and
    (and
      (and
        (and (not (= k@144@01 j@145@01)) (< j@145@01 (Seq_length xs@117@01)))
        (>= j@145@01 0))
      (< k@144@01 (Seq_length xs@117@01)))
    (>= k@144@01 0))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 4
(assert (not (forall ((k@144@01 Int) (j@145@01 Int)) (!
  (=>
    (and
      (and
        (and
          (and (not (= k@144@01 j@145@01)) (< j@145@01 (Seq_length xs@117@01)))
          (>= j@145@01 0))
        (< k@144@01 (Seq_length xs@117@01)))
      (>= k@144@01 0))
    (not (= (Seq_index xs@117@01 k@144@01) (Seq_index xs@117@01 j@145@01))))
  
  :qid |prog.l46|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (forall ((k@144@01 Int) (j@145@01 Int)) (!
  (=>
    (and
      (and
        (and
          (and (not (= k@144@01 j@145@01)) (< j@145@01 (Seq_length xs@117@01)))
          (>= j@145@01 0))
        (< k@144@01 (Seq_length xs@117@01)))
      (>= k@144@01 0))
    (not (= (Seq_index xs@117@01 k@144@01) (Seq_index xs@117@01 j@145@01))))
  
  :qid |prog.l46|)))
(declare-const j@146@01 Int)
(push) ; 4
; [eval] 0 <= j && j < 3
; [eval] 0 <= j
(push) ; 5
; [then-branch: 79 | 0 <= j@146@01 | live]
; [else-branch: 79 | !(0 <= j@146@01) | live]
(push) ; 6
; [then-branch: 79 | 0 <= j@146@01]
(assert (<= 0 j@146@01))
; [eval] j < 3
(pop) ; 6
(push) ; 6
; [else-branch: 79 | !(0 <= j@146@01)]
(assert (not (<= 0 j@146@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 j@146@01)) (<= 0 j@146@01)))
(assert (and (< j@146@01 3) (<= 0 j@146@01)))
; [eval] xs[j]
(push) ; 5
(assert (not (>= j@146@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< j@146@01 (Seq_length xs@117@01))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@147@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@146@01 Int)) (!
  (=>
    (and (< j@146@01 3) (<= 0 j@146@01))
    (or (not (<= 0 j@146@01)) (<= 0 j@146@01)))
  :pattern ((Seq_index xs@117@01 j@146@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((j1@146@01 Int) (j2@146@01 Int)) (!
  (=>
    (and
      (and (< j1@146@01 3) (<= 0 j1@146@01))
      (and (< j2@146@01 3) (<= 0 j2@146@01))
      (= (Seq_index xs@117@01 j1@146@01) (Seq_index xs@117@01 j2@146@01)))
    (= j1@146@01 j2@146@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@146@01 Int)) (!
  (=>
    (and (< j@146@01 3) (<= 0 j@146@01))
    (= (inv@147@01 (Seq_index xs@117@01 j@146@01)) j@146@01))
  :pattern ((Seq_index xs@117@01 j@146@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@147@01 r) 3) (<= 0 (inv@147@01 r)))
    (= (Seq_index xs@117@01 (inv@147@01 r)) r))
  :pattern ((inv@147@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@148@01 ((r $Ref)) $Perm
  (ite
    (and (< (inv@147@01 r) 3) (<= 0 (inv@147@01 r)))
    ($Perm.min
      (ite
        (and (< (inv@127@01 r) (Seq_length xs@117@01)) (<= 3 (inv@127@01 r)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@149@01 ((r $Ref)) $Perm
  (ite
    (and (< (inv@147@01 r) 3) (<= 0 (inv@147@01 r)))
    ($Perm.min
      (ite (and (< (inv@124@01 r) 3) (<= 0 (inv@124@01 r))) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@148@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (< (inv@127@01 r) (Seq_length xs@117@01)) (<= 3 (inv@127@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@148@01 r))
    $Perm.No)
  
  :qid |quant-u-156|))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (< (inv@147@01 r) 3) (<= 0 (inv@147@01 r)))
    (= (- $Perm.Write (pTaken@148@01 r)) $Perm.No))
  
  :qid |quant-u-157|))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite (and (< (inv@124@01 r) 3) (<= 0 (inv@124@01 r))) $Perm.Write $Perm.No)
      (pTaken@149@01 r))
    $Perm.No)
  
  :qid |quant-u-158|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (< (inv@147@01 r) 3) (<= 0 (inv@147@01 r)))
    (= (- (- $Perm.Write (pTaken@148@01 r)) (pTaken@149@01 r)) $Perm.No))
  
  :qid |quant-u-159|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@150@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@150@01  $FVF<f>)))
      (and (< (inv@147@01 r) 3) (<= 0 (inv@147@01 r))))
    (=>
      (and (< (inv@147@01 r) 3) (<= 0 (inv@147@01 r)))
      (Set_in r ($FVF.domain_f (as sm@150@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@150@01  $FVF<f>))))
  :qid |qp.fvfDomDef85|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@147@01 r) 3) (<= 0 (inv@147@01 r)))
      (and (< (inv@127@01 r) (Seq_length xs@117@01)) (<= 3 (inv@127@01 r))))
    (= ($FVF.lookup_f (as sm@150@01  $FVF<f>) r) ($FVF.lookup_f $t@126@01 r)))
  :pattern (($FVF.lookup_f (as sm@150@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@126@01 r))
  :qid |qp.fvfValDef83|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@147@01 r) 3) (<= 0 (inv@147@01 r)))
      (and (< (inv@124@01 r) 3) (<= 0 (inv@124@01 r))))
    (= ($FVF.lookup_f (as sm@150@01  $FVF<f>) r) ($FVF.lookup_f $t@123@01 r)))
  :pattern (($FVF.lookup_f (as sm@150@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@123@01 r))
  :qid |qp.fvfValDef84|)))
(declare-const j@151@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] 3 <= j && j < |xs|
; [eval] 3 <= j
(push) ; 5
; [then-branch: 80 | 3 <= j@151@01 | live]
; [else-branch: 80 | !(3 <= j@151@01) | live]
(push) ; 6
; [then-branch: 80 | 3 <= j@151@01]
(assert (<= 3 j@151@01))
; [eval] j < |xs|
; [eval] |xs|
(pop) ; 6
(push) ; 6
; [else-branch: 80 | !(3 <= j@151@01)]
(assert (not (<= 3 j@151@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 3 j@151@01)) (<= 3 j@151@01)))
(assert (and (< j@151@01 (Seq_length xs@117@01)) (<= 3 j@151@01)))
; [eval] xs[j]
(push) ; 5
(assert (not (>= j@151@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@152@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@151@01 Int)) (!
  (=>
    (and (< j@151@01 (Seq_length xs@117@01)) (<= 3 j@151@01))
    (or (not (<= 3 j@151@01)) (<= 3 j@151@01)))
  :pattern ((Seq_index xs@117@01 j@151@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((j1@151@01 Int) (j2@151@01 Int)) (!
  (=>
    (and
      (and (< j1@151@01 (Seq_length xs@117@01)) (<= 3 j1@151@01))
      (and (< j2@151@01 (Seq_length xs@117@01)) (<= 3 j2@151@01))
      (= (Seq_index xs@117@01 j1@151@01) (Seq_index xs@117@01 j2@151@01)))
    (= j1@151@01 j2@151@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@151@01 Int)) (!
  (=>
    (and (< j@151@01 (Seq_length xs@117@01)) (<= 3 j@151@01))
    (= (inv@152@01 (Seq_index xs@117@01 j@151@01)) j@151@01))
  :pattern ((Seq_index xs@117@01 j@151@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@152@01 r) (Seq_length xs@117@01)) (<= 3 (inv@152@01 r)))
    (= (Seq_index xs@117@01 (inv@152@01 r)) r))
  :pattern ((inv@152@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@153@01 ((r $Ref)) $Perm
  (ite
    (and (< (inv@152@01 r) (Seq_length xs@117@01)) (<= 3 (inv@152@01 r)))
    ($Perm.min
      (-
        (ite
          (and (< (inv@127@01 r) (Seq_length xs@117@01)) (<= 3 (inv@127@01 r)))
          $Perm.Write
          $Perm.No)
        (pTaken@148@01 r))
      $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (-
        (ite
          (and (< (inv@127@01 r) (Seq_length xs@117@01)) (<= 3 (inv@127@01 r)))
          $Perm.Write
          $Perm.No)
        (pTaken@148@01 r))
      (pTaken@153@01 r))
    $Perm.No)
  
  :qid |quant-u-162|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (< (inv@152@01 r) (Seq_length xs@117@01)) (<= 3 (inv@152@01 r)))
    (= (- $Perm.Write (pTaken@153@01 r)) $Perm.No))
  
  :qid |quant-u-163|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@154@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@154@01  $FVF<f>)))
      (and (< (inv@152@01 r) (Seq_length xs@117@01)) (<= 3 (inv@152@01 r))))
    (=>
      (and (< (inv@152@01 r) (Seq_length xs@117@01)) (<= 3 (inv@152@01 r)))
      (Set_in r ($FVF.domain_f (as sm@154@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@154@01  $FVF<f>))))
  :qid |qp.fvfDomDef87|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@152@01 r) (Seq_length xs@117@01)) (<= 3 (inv@152@01 r)))
      (<
        $Perm.No
        (-
          (ite
            (and (< (inv@127@01 r) (Seq_length xs@117@01)) (<= 3 (inv@127@01 r)))
            $Perm.Write
            $Perm.No)
          (pTaken@148@01 r))))
    (= ($FVF.lookup_f (as sm@154@01  $FVF<f>) r) ($FVF.lookup_f $t@126@01 r)))
  :pattern (($FVF.lookup_f (as sm@154@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@126@01 r))
  :qid |qp.fvfValDef86|)))
; [eval] 0 <= i
; [eval] i < |xs|
; [eval] |xs|
(set-option :timeout 0)
(push) ; 4
(assert (not (< 1 (Seq_length xs@117@01))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (< 1 (Seq_length xs@117@01)))
(assert (fun03%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<f>To$Snap (as sm@150@01  $FVF<f>))
      ($Snap.combine
        ($SortWrappers.$FVF<f>To$Snap (as sm@154@01  $FVF<f>))
        ($Snap.combine $Snap.unit $Snap.unit))))) xs@117@01 1))
(pop) ; 3
; Joined path conditions
(assert (forall ((j@146@01 Int)) (!
  (=>
    (and (< j@146@01 3) (<= 0 j@146@01))
    (= (inv@147@01 (Seq_index xs@117@01 j@146@01)) j@146@01))
  :pattern ((Seq_index xs@117@01 j@146@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@147@01 r) 3) (<= 0 (inv@147@01 r)))
    (= (Seq_index xs@117@01 (inv@147@01 r)) r))
  :pattern ((inv@147@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@150@01  $FVF<f>)))
      (and (< (inv@147@01 r) 3) (<= 0 (inv@147@01 r))))
    (=>
      (and (< (inv@147@01 r) 3) (<= 0 (inv@147@01 r)))
      (Set_in r ($FVF.domain_f (as sm@150@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@150@01  $FVF<f>))))
  :qid |qp.fvfDomDef85|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@147@01 r) 3) (<= 0 (inv@147@01 r)))
      (and (< (inv@127@01 r) (Seq_length xs@117@01)) (<= 3 (inv@127@01 r))))
    (= ($FVF.lookup_f (as sm@150@01  $FVF<f>) r) ($FVF.lookup_f $t@126@01 r)))
  :pattern (($FVF.lookup_f (as sm@150@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@126@01 r))
  :qid |qp.fvfValDef83|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@147@01 r) 3) (<= 0 (inv@147@01 r)))
      (and (< (inv@124@01 r) 3) (<= 0 (inv@124@01 r))))
    (= ($FVF.lookup_f (as sm@150@01  $FVF<f>) r) ($FVF.lookup_f $t@123@01 r)))
  :pattern (($FVF.lookup_f (as sm@150@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@123@01 r))
  :qid |qp.fvfValDef84|)))
(assert (forall ((j@151@01 Int)) (!
  (=>
    (and (< j@151@01 (Seq_length xs@117@01)) (<= 3 j@151@01))
    (= (inv@152@01 (Seq_index xs@117@01 j@151@01)) j@151@01))
  :pattern ((Seq_index xs@117@01 j@151@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@152@01 r) (Seq_length xs@117@01)) (<= 3 (inv@152@01 r)))
    (= (Seq_index xs@117@01 (inv@152@01 r)) r))
  :pattern ((inv@152@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@154@01  $FVF<f>)))
      (and (< (inv@152@01 r) (Seq_length xs@117@01)) (<= 3 (inv@152@01 r))))
    (=>
      (and (< (inv@152@01 r) (Seq_length xs@117@01)) (<= 3 (inv@152@01 r)))
      (Set_in r ($FVF.domain_f (as sm@154@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@154@01  $FVF<f>))))
  :qid |qp.fvfDomDef87|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@152@01 r) (Seq_length xs@117@01)) (<= 3 (inv@152@01 r)))
      (<
        $Perm.No
        (-
          (ite
            (and (< (inv@127@01 r) (Seq_length xs@117@01)) (<= 3 (inv@127@01 r)))
            $Perm.Write
            $Perm.No)
          (pTaken@148@01 r))))
    (= ($FVF.lookup_f (as sm@154@01  $FVF<f>) r) ($FVF.lookup_f $t@126@01 r)))
  :pattern (($FVF.lookup_f (as sm@154@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@126@01 r))
  :qid |qp.fvfValDef86|)))
(assert (and
  (forall ((k@144@01 Int) (j@145@01 Int)) (!
    (=>
      (and
        (and
          (and
            (and (not (= k@144@01 j@145@01)) (< j@145@01 (Seq_length xs@117@01)))
            (>= j@145@01 0))
          (< k@144@01 (Seq_length xs@117@01)))
        (>= k@144@01 0))
      (not (= (Seq_index xs@117@01 k@144@01) (Seq_index xs@117@01 j@145@01))))
    
    :qid |prog.l46|))
  (forall ((j@146@01 Int)) (!
    (=>
      (and (< j@146@01 3) (<= 0 j@146@01))
      (or (not (<= 0 j@146@01)) (<= 0 j@146@01)))
    :pattern ((Seq_index xs@117@01 j@146@01))
    :qid |f-aux|))
  (forall ((j@151@01 Int)) (!
    (=>
      (and (< j@151@01 (Seq_length xs@117@01)) (<= 3 j@151@01))
      (or (not (<= 3 j@151@01)) (<= 3 j@151@01)))
    :pattern ((Seq_index xs@117@01 j@151@01))
    :qid |f-aux|))
  (< 1 (Seq_length xs@117@01))
  (fun03%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$FVF<f>To$Snap (as sm@150@01  $FVF<f>))
        ($Snap.combine
          ($SortWrappers.$FVF<f>To$Snap (as sm@154@01  $FVF<f>))
          ($Snap.combine $Snap.unit $Snap.unit))))) xs@117@01 1)))
(push) ; 3
(assert (not (<
  (fun03 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$FVF<f>To$Snap (as sm@139@01  $FVF<f>))
        ($Snap.combine
          ($SortWrappers.$FVF<f>To$Snap (as sm@143@01  $FVF<f>))
          ($Snap.combine $Snap.unit $Snap.unit))))) xs@117@01 0)
  (fun03 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$FVF<f>To$Snap (as sm@150@01  $FVF<f>))
        ($Snap.combine
          ($SortWrappers.$FVF<f>To$Snap (as sm@154@01  $FVF<f>))
          ($Snap.combine $Snap.unit $Snap.unit))))) xs@117@01 1))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (<
  (fun03 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$FVF<f>To$Snap (as sm@139@01  $FVF<f>))
        ($Snap.combine
          ($SortWrappers.$FVF<f>To$Snap (as sm@143@01  $FVF<f>))
          ($Snap.combine $Snap.unit $Snap.unit))))) xs@117@01 0)
  (fun03 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$FVF<f>To$Snap (as sm@150@01  $FVF<f>))
        ($Snap.combine
          ($SortWrappers.$FVF<f>To$Snap (as sm@154@01  $FVF<f>))
          ($Snap.combine $Snap.unit $Snap.unit))))) xs@117@01 1)))
(pop) ; 2
(pop) ; 1
; ---------- test06a ----------
(declare-const xs@155@01 Seq<$Ref>)
(declare-const n@156@01 Int)
(declare-const xs@157@01 Seq<$Ref>)
(declare-const n@158@01 Int)
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
; var v1: Int
(declare-const v1@159@01 Int)
; [exec]
; inhale |xs| == n && 6 < n
(declare-const $t@160@01 $Snap)
(assert (= $t@160@01 ($Snap.combine ($Snap.first $t@160@01) ($Snap.second $t@160@01))))
(assert (= ($Snap.first $t@160@01) $Snap.unit))
; [eval] |xs| == n
; [eval] |xs|
(assert (= (Seq_length xs@157@01) n@158@01))
(assert (= ($Snap.second $t@160@01) $Snap.unit))
; [eval] 6 < n
(assert (< 6 n@158@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall k: Int, j: Int ::
;     { xs[k], xs[j] }
;     k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==>
;     xs[k] != xs[j])
(declare-const $t@161@01 $Snap)
(assert (= $t@161@01 $Snap.unit))
; [eval] (forall k: Int, j: Int :: { xs[k], xs[j] } k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==> xs[k] != xs[j])
(declare-const k@162@01 Int)
(declare-const j@163@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==> xs[k] != xs[j]
; [eval] k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j)))
; [eval] k >= 0
(push) ; 4
; [then-branch: 81 | k@162@01 >= 0 | live]
; [else-branch: 81 | !(k@162@01 >= 0) | live]
(push) ; 5
; [then-branch: 81 | k@162@01 >= 0]
(assert (>= k@162@01 0))
; [eval] k < |xs|
; [eval] |xs|
(push) ; 6
; [then-branch: 82 | k@162@01 < |xs@157@01| | live]
; [else-branch: 82 | !(k@162@01 < |xs@157@01|) | live]
(push) ; 7
; [then-branch: 82 | k@162@01 < |xs@157@01|]
(assert (< k@162@01 (Seq_length xs@157@01)))
; [eval] j >= 0
(push) ; 8
; [then-branch: 83 | j@163@01 >= 0 | live]
; [else-branch: 83 | !(j@163@01 >= 0) | live]
(push) ; 9
; [then-branch: 83 | j@163@01 >= 0]
(assert (>= j@163@01 0))
; [eval] j < |xs|
; [eval] |xs|
(push) ; 10
; [then-branch: 84 | j@163@01 < |xs@157@01| | live]
; [else-branch: 84 | !(j@163@01 < |xs@157@01|) | live]
(push) ; 11
; [then-branch: 84 | j@163@01 < |xs@157@01|]
(assert (< j@163@01 (Seq_length xs@157@01)))
; [eval] k != j
(pop) ; 11
(push) ; 11
; [else-branch: 84 | !(j@163@01 < |xs@157@01|)]
(assert (not (< j@163@01 (Seq_length xs@157@01))))
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (not (< j@163@01 (Seq_length xs@157@01)))
  (< j@163@01 (Seq_length xs@157@01))))
(pop) ; 9
(push) ; 9
; [else-branch: 83 | !(j@163@01 >= 0)]
(assert (not (>= j@163@01 0)))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (=>
  (>= j@163@01 0)
  (and
    (>= j@163@01 0)
    (or
      (not (< j@163@01 (Seq_length xs@157@01)))
      (< j@163@01 (Seq_length xs@157@01))))))
; Joined path conditions
(assert (or (not (>= j@163@01 0)) (>= j@163@01 0)))
(pop) ; 7
(push) ; 7
; [else-branch: 82 | !(k@162@01 < |xs@157@01|)]
(assert (not (< k@162@01 (Seq_length xs@157@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (< k@162@01 (Seq_length xs@157@01))
  (and
    (< k@162@01 (Seq_length xs@157@01))
    (=>
      (>= j@163@01 0)
      (and
        (>= j@163@01 0)
        (or
          (not (< j@163@01 (Seq_length xs@157@01)))
          (< j@163@01 (Seq_length xs@157@01)))))
    (or (not (>= j@163@01 0)) (>= j@163@01 0)))))
; Joined path conditions
(assert (or
  (not (< k@162@01 (Seq_length xs@157@01)))
  (< k@162@01 (Seq_length xs@157@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 81 | !(k@162@01 >= 0)]
(assert (not (>= k@162@01 0)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (>= k@162@01 0)
  (and
    (>= k@162@01 0)
    (=>
      (< k@162@01 (Seq_length xs@157@01))
      (and
        (< k@162@01 (Seq_length xs@157@01))
        (=>
          (>= j@163@01 0)
          (and
            (>= j@163@01 0)
            (or
              (not (< j@163@01 (Seq_length xs@157@01)))
              (< j@163@01 (Seq_length xs@157@01)))))
        (or (not (>= j@163@01 0)) (>= j@163@01 0))))
    (or
      (not (< k@162@01 (Seq_length xs@157@01)))
      (< k@162@01 (Seq_length xs@157@01))))))
; Joined path conditions
(assert (or (not (>= k@162@01 0)) (>= k@162@01 0)))
(push) ; 4
; [then-branch: 85 | k@162@01 != j@163@01 && j@163@01 < |xs@157@01| && j@163@01 >= 0 && k@162@01 < |xs@157@01| && k@162@01 >= 0 | live]
; [else-branch: 85 | !(k@162@01 != j@163@01 && j@163@01 < |xs@157@01| && j@163@01 >= 0 && k@162@01 < |xs@157@01| && k@162@01 >= 0) | live]
(push) ; 5
; [then-branch: 85 | k@162@01 != j@163@01 && j@163@01 < |xs@157@01| && j@163@01 >= 0 && k@162@01 < |xs@157@01| && k@162@01 >= 0]
(assert (and
  (and
    (and
      (and (not (= k@162@01 j@163@01)) (< j@163@01 (Seq_length xs@157@01)))
      (>= j@163@01 0))
    (< k@162@01 (Seq_length xs@157@01)))
  (>= k@162@01 0)))
; [eval] xs[k] != xs[j]
; [eval] xs[k]
; [eval] xs[j]
(pop) ; 5
(push) ; 5
; [else-branch: 85 | !(k@162@01 != j@163@01 && j@163@01 < |xs@157@01| && j@163@01 >= 0 && k@162@01 < |xs@157@01| && k@162@01 >= 0)]
(assert (not
  (and
    (and
      (and
        (and (not (= k@162@01 j@163@01)) (< j@163@01 (Seq_length xs@157@01)))
        (>= j@163@01 0))
      (< k@162@01 (Seq_length xs@157@01)))
    (>= k@162@01 0))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (and
      (and
        (and (not (= k@162@01 j@163@01)) (< j@163@01 (Seq_length xs@157@01)))
        (>= j@163@01 0))
      (< k@162@01 (Seq_length xs@157@01)))
    (>= k@162@01 0))
  (and
    (not (= k@162@01 j@163@01))
    (< j@163@01 (Seq_length xs@157@01))
    (>= j@163@01 0)
    (< k@162@01 (Seq_length xs@157@01))
    (>= k@162@01 0))))
; Joined path conditions
(assert (or
  (not
    (and
      (and
        (and
          (and (not (= k@162@01 j@163@01)) (< j@163@01 (Seq_length xs@157@01)))
          (>= j@163@01 0))
        (< k@162@01 (Seq_length xs@157@01)))
      (>= k@162@01 0)))
  (and
    (and
      (and
        (and (not (= k@162@01 j@163@01)) (< j@163@01 (Seq_length xs@157@01)))
        (>= j@163@01 0))
      (< k@162@01 (Seq_length xs@157@01)))
    (>= k@162@01 0))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@162@01 Int) (j@163@01 Int)) (!
  (and
    (=>
      (>= k@162@01 0)
      (and
        (>= k@162@01 0)
        (=>
          (< k@162@01 (Seq_length xs@157@01))
          (and
            (< k@162@01 (Seq_length xs@157@01))
            (=>
              (>= j@163@01 0)
              (and
                (>= j@163@01 0)
                (or
                  (not (< j@163@01 (Seq_length xs@157@01)))
                  (< j@163@01 (Seq_length xs@157@01)))))
            (or (not (>= j@163@01 0)) (>= j@163@01 0))))
        (or
          (not (< k@162@01 (Seq_length xs@157@01)))
          (< k@162@01 (Seq_length xs@157@01)))))
    (or (not (>= k@162@01 0)) (>= k@162@01 0))
    (=>
      (and
        (and
          (and
            (and (not (= k@162@01 j@163@01)) (< j@163@01 (Seq_length xs@157@01)))
            (>= j@163@01 0))
          (< k@162@01 (Seq_length xs@157@01)))
        (>= k@162@01 0))
      (and
        (not (= k@162@01 j@163@01))
        (< j@163@01 (Seq_length xs@157@01))
        (>= j@163@01 0)
        (< k@162@01 (Seq_length xs@157@01))
        (>= k@162@01 0)))
    (or
      (not
        (and
          (and
            (and
              (and
                (not (= k@162@01 j@163@01))
                (< j@163@01 (Seq_length xs@157@01)))
              (>= j@163@01 0))
            (< k@162@01 (Seq_length xs@157@01)))
          (>= k@162@01 0)))
      (and
        (and
          (and
            (and (not (= k@162@01 j@163@01)) (< j@163@01 (Seq_length xs@157@01)))
            (>= j@163@01 0))
          (< k@162@01 (Seq_length xs@157@01)))
        (>= k@162@01 0))))
  :pattern ((Seq_index xs@157@01 k@162@01) (Seq_index xs@157@01 j@163@01))
  :qid |prog.l72-aux|)))
(assert (forall ((k@162@01 Int) (j@163@01 Int)) (!
  (=>
    (and
      (and
        (and
          (and (not (= k@162@01 j@163@01)) (< j@163@01 (Seq_length xs@157@01)))
          (>= j@163@01 0))
        (< k@162@01 (Seq_length xs@157@01)))
      (>= k@162@01 0))
    (not (= (Seq_index xs@157@01 k@162@01) (Seq_index xs@157@01 j@163@01))))
  :pattern ((Seq_index xs@157@01 k@162@01) (Seq_index xs@157@01 j@163@01))
  :qid |prog.l72|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall j: Int ::0 <= j && j < 3 ==> acc(xs[j].f, write))
(declare-const j@164@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= j && j < 3
; [eval] 0 <= j
(push) ; 4
; [then-branch: 86 | 0 <= j@164@01 | live]
; [else-branch: 86 | !(0 <= j@164@01) | live]
(push) ; 5
; [then-branch: 86 | 0 <= j@164@01]
(assert (<= 0 j@164@01))
; [eval] j < 3
(pop) ; 5
(push) ; 5
; [else-branch: 86 | !(0 <= j@164@01)]
(assert (not (<= 0 j@164@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 j@164@01)) (<= 0 j@164@01)))
(assert (and (< j@164@01 3) (<= 0 j@164@01)))
; [eval] xs[j]
(push) ; 4
(assert (not (>= j@164@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< j@164@01 (Seq_length xs@157@01))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
(declare-const $t@165@01 $FVF<f>)
(declare-fun inv@166@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@164@01 Int)) (!
  (=>
    (and (< j@164@01 3) (<= 0 j@164@01))
    (or (not (<= 0 j@164@01)) (<= 0 j@164@01)))
  :pattern ((Seq_index xs@157@01 j@164@01))
  :qid |f-aux|)))
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((j@164@01 Int)) (!
  (=>
    (and (< j@164@01 3) (<= 0 j@164@01))
    (= (inv@166@01 (Seq_index xs@157@01 j@164@01)) j@164@01))
  :pattern ((Seq_index xs@157@01 j@164@01))
  :qid |quant-u-165|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@166@01 r) 3) (<= 0 (inv@166@01 r)))
    (= (Seq_index xs@157@01 (inv@166@01 r)) r))
  :pattern ((inv@166@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j@164@01 Int)) (!
  (=>
    (and (< j@164@01 3) (<= 0 j@164@01))
    (not (= (Seq_index xs@157@01 j@164@01) $Ref.null)))
  :pattern ((Seq_index xs@157@01 j@164@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall j: Int ::3 <= j && j < n ==> acc(xs[j].f, write))
(declare-const j@167@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 3 <= j && j < n
; [eval] 3 <= j
(push) ; 4
; [then-branch: 87 | 3 <= j@167@01 | live]
; [else-branch: 87 | !(3 <= j@167@01) | live]
(push) ; 5
; [then-branch: 87 | 3 <= j@167@01]
(assert (<= 3 j@167@01))
; [eval] j < n
(pop) ; 5
(push) ; 5
; [else-branch: 87 | !(3 <= j@167@01)]
(assert (not (<= 3 j@167@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 3 j@167@01)) (<= 3 j@167@01)))
(assert (and (< j@167@01 n@158@01) (<= 3 j@167@01)))
; [eval] xs[j]
(push) ; 4
(assert (not (>= j@167@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< j@167@01 (Seq_length xs@157@01))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
(declare-const $t@168@01 $FVF<f>)
(declare-fun inv@169@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@167@01 Int)) (!
  (=>
    (and (< j@167@01 n@158@01) (<= 3 j@167@01))
    (or (not (<= 3 j@167@01)) (<= 3 j@167@01)))
  :pattern ((Seq_index xs@157@01 j@167@01))
  :qid |f-aux|)))
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((j@167@01 Int)) (!
  (=>
    (and (< j@167@01 n@158@01) (<= 3 j@167@01))
    (= (inv@169@01 (Seq_index xs@157@01 j@167@01)) j@167@01))
  :pattern ((Seq_index xs@157@01 j@167@01))
  :qid |quant-u-167|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@169@01 r) n@158@01) (<= 3 (inv@169@01 r)))
    (= (Seq_index xs@157@01 (inv@169@01 r)) r))
  :pattern ((inv@169@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j@167@01 Int)) (!
  (=>
    (and (< j@167@01 n@158@01) (<= 3 j@167@01))
    (not (= (Seq_index xs@157@01 j@167@01) $Ref.null)))
  :pattern ((Seq_index xs@157@01 j@167@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; v1 := xs[2].f
; [eval] xs[2]
(set-option :timeout 0)
(push) ; 3
(assert (not (< 2 (Seq_length xs@157@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const sm@170@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@169@01 r) n@158@01) (<= 3 (inv@169@01 r)))
    (= ($FVF.lookup_f (as sm@170@01  $FVF<f>) r) ($FVF.lookup_f $t@168@01 r)))
  :pattern (($FVF.lookup_f (as sm@170@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@168@01 r))
  :qid |qp.fvfValDef88|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@166@01 r) 3) (<= 0 (inv@166@01 r)))
    (= ($FVF.lookup_f (as sm@170@01  $FVF<f>) r) ($FVF.lookup_f $t@165@01 r)))
  :pattern (($FVF.lookup_f (as sm@170@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@165@01 r))
  :qid |qp.fvfValDef89|)))
(declare-const pm@171@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@171@01  $FPM) r)
    (+
      (ite
        (and (< (inv@169@01 r) n@158@01) (<= 3 (inv@169@01 r)))
        $Perm.Write
        $Perm.No)
      (ite (and (< (inv@166@01 r) 3) (<= 0 (inv@166@01 r))) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@171@01  $FPM) r))
  :qid |qp.resPrmSumDef90|)))
(push) ; 3
(assert (not (< $Perm.No ($FVF.perm_f (as pm@171@01  $FPM) (Seq_index xs@157@01 2)))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const v1@172@01 Int)
(assert (= v1@172@01 ($FVF.lookup_f (as sm@170@01  $FVF<f>) (Seq_index xs@157@01 2))))
; [exec]
; fold acc(P02(xs, n), write)
; [eval] |xs| == n
; [eval] |xs|
; [eval] 3 <= n
(push) ; 3
(assert (not (<= 3 n@158@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (<= 3 n@158@01))
; [eval] (forall k: Int, j: Int :: { xs[k], xs[j] } k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==> xs[k] != xs[j])
(declare-const k@173@01 Int)
(declare-const j@174@01 Int)
(push) ; 3
; [eval] k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==> xs[k] != xs[j]
; [eval] k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j)))
; [eval] k >= 0
(push) ; 4
; [then-branch: 88 | k@173@01 >= 0 | live]
; [else-branch: 88 | !(k@173@01 >= 0) | live]
(push) ; 5
; [then-branch: 88 | k@173@01 >= 0]
(assert (>= k@173@01 0))
; [eval] k < |xs|
; [eval] |xs|
(push) ; 6
; [then-branch: 89 | k@173@01 < |xs@157@01| | live]
; [else-branch: 89 | !(k@173@01 < |xs@157@01|) | live]
(push) ; 7
; [then-branch: 89 | k@173@01 < |xs@157@01|]
(assert (< k@173@01 (Seq_length xs@157@01)))
; [eval] j >= 0
(push) ; 8
; [then-branch: 90 | j@174@01 >= 0 | live]
; [else-branch: 90 | !(j@174@01 >= 0) | live]
(push) ; 9
; [then-branch: 90 | j@174@01 >= 0]
(assert (>= j@174@01 0))
; [eval] j < |xs|
; [eval] |xs|
(push) ; 10
; [then-branch: 91 | j@174@01 < |xs@157@01| | live]
; [else-branch: 91 | !(j@174@01 < |xs@157@01|) | live]
(push) ; 11
; [then-branch: 91 | j@174@01 < |xs@157@01|]
(assert (< j@174@01 (Seq_length xs@157@01)))
; [eval] k != j
(pop) ; 11
(push) ; 11
; [else-branch: 91 | !(j@174@01 < |xs@157@01|)]
(assert (not (< j@174@01 (Seq_length xs@157@01))))
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (not (< j@174@01 (Seq_length xs@157@01)))
  (< j@174@01 (Seq_length xs@157@01))))
(pop) ; 9
(push) ; 9
; [else-branch: 90 | !(j@174@01 >= 0)]
(assert (not (>= j@174@01 0)))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (=>
  (>= j@174@01 0)
  (and
    (>= j@174@01 0)
    (or
      (not (< j@174@01 (Seq_length xs@157@01)))
      (< j@174@01 (Seq_length xs@157@01))))))
; Joined path conditions
(assert (or (not (>= j@174@01 0)) (>= j@174@01 0)))
(pop) ; 7
(push) ; 7
; [else-branch: 89 | !(k@173@01 < |xs@157@01|)]
(assert (not (< k@173@01 (Seq_length xs@157@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (< k@173@01 (Seq_length xs@157@01))
  (and
    (< k@173@01 (Seq_length xs@157@01))
    (=>
      (>= j@174@01 0)
      (and
        (>= j@174@01 0)
        (or
          (not (< j@174@01 (Seq_length xs@157@01)))
          (< j@174@01 (Seq_length xs@157@01)))))
    (or (not (>= j@174@01 0)) (>= j@174@01 0)))))
; Joined path conditions
(assert (or
  (not (< k@173@01 (Seq_length xs@157@01)))
  (< k@173@01 (Seq_length xs@157@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 88 | !(k@173@01 >= 0)]
(assert (not (>= k@173@01 0)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (>= k@173@01 0)
  (and
    (>= k@173@01 0)
    (=>
      (< k@173@01 (Seq_length xs@157@01))
      (and
        (< k@173@01 (Seq_length xs@157@01))
        (=>
          (>= j@174@01 0)
          (and
            (>= j@174@01 0)
            (or
              (not (< j@174@01 (Seq_length xs@157@01)))
              (< j@174@01 (Seq_length xs@157@01)))))
        (or (not (>= j@174@01 0)) (>= j@174@01 0))))
    (or
      (not (< k@173@01 (Seq_length xs@157@01)))
      (< k@173@01 (Seq_length xs@157@01))))))
; Joined path conditions
(assert (or (not (>= k@173@01 0)) (>= k@173@01 0)))
(push) ; 4
; [then-branch: 92 | k@173@01 != j@174@01 && j@174@01 < |xs@157@01| && j@174@01 >= 0 && k@173@01 < |xs@157@01| && k@173@01 >= 0 | live]
; [else-branch: 92 | !(k@173@01 != j@174@01 && j@174@01 < |xs@157@01| && j@174@01 >= 0 && k@173@01 < |xs@157@01| && k@173@01 >= 0) | live]
(push) ; 5
; [then-branch: 92 | k@173@01 != j@174@01 && j@174@01 < |xs@157@01| && j@174@01 >= 0 && k@173@01 < |xs@157@01| && k@173@01 >= 0]
(assert (and
  (and
    (and
      (and (not (= k@173@01 j@174@01)) (< j@174@01 (Seq_length xs@157@01)))
      (>= j@174@01 0))
    (< k@173@01 (Seq_length xs@157@01)))
  (>= k@173@01 0)))
; [eval] xs[k] != xs[j]
; [eval] xs[k]
; [eval] xs[j]
(pop) ; 5
(push) ; 5
; [else-branch: 92 | !(k@173@01 != j@174@01 && j@174@01 < |xs@157@01| && j@174@01 >= 0 && k@173@01 < |xs@157@01| && k@173@01 >= 0)]
(assert (not
  (and
    (and
      (and
        (and (not (= k@173@01 j@174@01)) (< j@174@01 (Seq_length xs@157@01)))
        (>= j@174@01 0))
      (< k@173@01 (Seq_length xs@157@01)))
    (>= k@173@01 0))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (and
      (and
        (and (not (= k@173@01 j@174@01)) (< j@174@01 (Seq_length xs@157@01)))
        (>= j@174@01 0))
      (< k@173@01 (Seq_length xs@157@01)))
    (>= k@173@01 0))
  (and
    (not (= k@173@01 j@174@01))
    (< j@174@01 (Seq_length xs@157@01))
    (>= j@174@01 0)
    (< k@173@01 (Seq_length xs@157@01))
    (>= k@173@01 0))))
; Joined path conditions
(assert (or
  (not
    (and
      (and
        (and
          (and (not (= k@173@01 j@174@01)) (< j@174@01 (Seq_length xs@157@01)))
          (>= j@174@01 0))
        (< k@173@01 (Seq_length xs@157@01)))
      (>= k@173@01 0)))
  (and
    (and
      (and
        (and (not (= k@173@01 j@174@01)) (< j@174@01 (Seq_length xs@157@01)))
        (>= j@174@01 0))
      (< k@173@01 (Seq_length xs@157@01)))
    (>= k@173@01 0))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@173@01 Int) (j@174@01 Int)) (!
  (and
    (=>
      (>= k@173@01 0)
      (and
        (>= k@173@01 0)
        (=>
          (< k@173@01 (Seq_length xs@157@01))
          (and
            (< k@173@01 (Seq_length xs@157@01))
            (=>
              (>= j@174@01 0)
              (and
                (>= j@174@01 0)
                (or
                  (not (< j@174@01 (Seq_length xs@157@01)))
                  (< j@174@01 (Seq_length xs@157@01)))))
            (or (not (>= j@174@01 0)) (>= j@174@01 0))))
        (or
          (not (< k@173@01 (Seq_length xs@157@01)))
          (< k@173@01 (Seq_length xs@157@01)))))
    (or (not (>= k@173@01 0)) (>= k@173@01 0))
    (=>
      (and
        (and
          (and
            (and (not (= k@173@01 j@174@01)) (< j@174@01 (Seq_length xs@157@01)))
            (>= j@174@01 0))
          (< k@173@01 (Seq_length xs@157@01)))
        (>= k@173@01 0))
      (and
        (not (= k@173@01 j@174@01))
        (< j@174@01 (Seq_length xs@157@01))
        (>= j@174@01 0)
        (< k@173@01 (Seq_length xs@157@01))
        (>= k@173@01 0)))
    (or
      (not
        (and
          (and
            (and
              (and
                (not (= k@173@01 j@174@01))
                (< j@174@01 (Seq_length xs@157@01)))
              (>= j@174@01 0))
            (< k@173@01 (Seq_length xs@157@01)))
          (>= k@173@01 0)))
      (and
        (and
          (and
            (and (not (= k@173@01 j@174@01)) (< j@174@01 (Seq_length xs@157@01)))
            (>= j@174@01 0))
          (< k@173@01 (Seq_length xs@157@01)))
        (>= k@173@01 0))))
  :pattern ((Seq_index xs@157@01 k@173@01) (Seq_index xs@157@01 j@174@01))
  :qid |prog.l65-aux|)))
(push) ; 3
(assert (not (forall ((k@173@01 Int) (j@174@01 Int)) (!
  (=>
    (and
      (and
        (and
          (and (not (= k@173@01 j@174@01)) (< j@174@01 (Seq_length xs@157@01)))
          (>= j@174@01 0))
        (< k@173@01 (Seq_length xs@157@01)))
      (>= k@173@01 0))
    (not (= (Seq_index xs@157@01 k@173@01) (Seq_index xs@157@01 j@174@01))))
  :pattern ((Seq_index xs@157@01 k@173@01) (Seq_index xs@157@01 j@174@01))
  :qid |prog.l65|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (forall ((k@173@01 Int) (j@174@01 Int)) (!
  (=>
    (and
      (and
        (and
          (and (not (= k@173@01 j@174@01)) (< j@174@01 (Seq_length xs@157@01)))
          (>= j@174@01 0))
        (< k@173@01 (Seq_length xs@157@01)))
      (>= k@173@01 0))
    (not (= (Seq_index xs@157@01 k@173@01) (Seq_index xs@157@01 j@174@01))))
  :pattern ((Seq_index xs@157@01 k@173@01) (Seq_index xs@157@01 j@174@01))
  :qid |prog.l65|)))
(declare-const j@175@01 Int)
(push) ; 3
; [eval] 0 <= j && j < 3
; [eval] 0 <= j
(push) ; 4
; [then-branch: 93 | 0 <= j@175@01 | live]
; [else-branch: 93 | !(0 <= j@175@01) | live]
(push) ; 5
; [then-branch: 93 | 0 <= j@175@01]
(assert (<= 0 j@175@01))
; [eval] j < 3
(pop) ; 5
(push) ; 5
; [else-branch: 93 | !(0 <= j@175@01)]
(assert (not (<= 0 j@175@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 j@175@01)) (<= 0 j@175@01)))
(assert (and (< j@175@01 3) (<= 0 j@175@01)))
; [eval] xs[j]
(push) ; 4
(assert (not (>= j@175@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< j@175@01 (Seq_length xs@157@01))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@176@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@175@01 Int)) (!
  (=>
    (and (< j@175@01 3) (<= 0 j@175@01))
    (or (not (<= 0 j@175@01)) (<= 0 j@175@01)))
  :pattern ((Seq_index xs@157@01 j@175@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j1@175@01 Int) (j2@175@01 Int)) (!
  (=>
    (and
      (and (< j1@175@01 3) (<= 0 j1@175@01))
      (and (< j2@175@01 3) (<= 0 j2@175@01))
      (= (Seq_index xs@157@01 j1@175@01) (Seq_index xs@157@01 j2@175@01)))
    (= j1@175@01 j2@175@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@175@01 Int)) (!
  (=>
    (and (< j@175@01 3) (<= 0 j@175@01))
    (= (inv@176@01 (Seq_index xs@157@01 j@175@01)) j@175@01))
  :pattern ((Seq_index xs@157@01 j@175@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@176@01 r) 3) (<= 0 (inv@176@01 r)))
    (= (Seq_index xs@157@01 (inv@176@01 r)) r))
  :pattern ((inv@176@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@177@01 ((r $Ref)) $Perm
  (ite
    (and (< (inv@176@01 r) 3) (<= 0 (inv@176@01 r)))
    ($Perm.min
      (ite
        (and (< (inv@169@01 r) n@158@01) (<= 3 (inv@169@01 r)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@178@01 ((r $Ref)) $Perm
  (ite
    (and (< (inv@176@01 r) 3) (<= 0 (inv@176@01 r)))
    ($Perm.min
      (ite (and (< (inv@166@01 r) 3) (<= 0 (inv@166@01 r))) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@177@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (< (inv@169@01 r) n@158@01) (<= 3 (inv@169@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@177@01 r))
    $Perm.No)
  
  :qid |quant-u-170|))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (< (inv@176@01 r) 3) (<= 0 (inv@176@01 r)))
    (= (- $Perm.Write (pTaken@177@01 r)) $Perm.No))
  
  :qid |quant-u-171|))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite (and (< (inv@166@01 r) 3) (<= 0 (inv@166@01 r))) $Perm.Write $Perm.No)
      (pTaken@178@01 r))
    $Perm.No)
  
  :qid |quant-u-172|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (< (inv@176@01 r) 3) (<= 0 (inv@176@01 r)))
    (= (- (- $Perm.Write (pTaken@177@01 r)) (pTaken@178@01 r)) $Perm.No))
  
  :qid |quant-u-173|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@179@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@179@01  $FVF<f>)))
      (and (< (inv@176@01 r) 3) (<= 0 (inv@176@01 r))))
    (=>
      (and (< (inv@176@01 r) 3) (<= 0 (inv@176@01 r)))
      (Set_in r ($FVF.domain_f (as sm@179@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@179@01  $FVF<f>))))
  :qid |qp.fvfDomDef93|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@176@01 r) 3) (<= 0 (inv@176@01 r)))
      (and (< (inv@169@01 r) n@158@01) (<= 3 (inv@169@01 r))))
    (= ($FVF.lookup_f (as sm@179@01  $FVF<f>) r) ($FVF.lookup_f $t@168@01 r)))
  :pattern (($FVF.lookup_f (as sm@179@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@168@01 r))
  :qid |qp.fvfValDef91|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@176@01 r) 3) (<= 0 (inv@176@01 r)))
      (and (< (inv@166@01 r) 3) (<= 0 (inv@166@01 r))))
    (= ($FVF.lookup_f (as sm@179@01  $FVF<f>) r) ($FVF.lookup_f $t@165@01 r)))
  :pattern (($FVF.lookup_f (as sm@179@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@165@01 r))
  :qid |qp.fvfValDef92|)))
(declare-const j@180@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 3 <= j && j < n
; [eval] 3 <= j
(push) ; 4
; [then-branch: 94 | 3 <= j@180@01 | live]
; [else-branch: 94 | !(3 <= j@180@01) | live]
(push) ; 5
; [then-branch: 94 | 3 <= j@180@01]
(assert (<= 3 j@180@01))
; [eval] j < n
(pop) ; 5
(push) ; 5
; [else-branch: 94 | !(3 <= j@180@01)]
(assert (not (<= 3 j@180@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 3 j@180@01)) (<= 3 j@180@01)))
(assert (and (< j@180@01 n@158@01) (<= 3 j@180@01)))
; [eval] xs[j]
(push) ; 4
(assert (not (>= j@180@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< j@180@01 (Seq_length xs@157@01))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@181@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@180@01 Int)) (!
  (=>
    (and (< j@180@01 n@158@01) (<= 3 j@180@01))
    (or (not (<= 3 j@180@01)) (<= 3 j@180@01)))
  :pattern ((Seq_index xs@157@01 j@180@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j1@180@01 Int) (j2@180@01 Int)) (!
  (=>
    (and
      (and (< j1@180@01 n@158@01) (<= 3 j1@180@01))
      (and (< j2@180@01 n@158@01) (<= 3 j2@180@01))
      (= (Seq_index xs@157@01 j1@180@01) (Seq_index xs@157@01 j2@180@01)))
    (= j1@180@01 j2@180@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@180@01 Int)) (!
  (=>
    (and (< j@180@01 n@158@01) (<= 3 j@180@01))
    (= (inv@181@01 (Seq_index xs@157@01 j@180@01)) j@180@01))
  :pattern ((Seq_index xs@157@01 j@180@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@181@01 r) n@158@01) (<= 3 (inv@181@01 r)))
    (= (Seq_index xs@157@01 (inv@181@01 r)) r))
  :pattern ((inv@181@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@182@01 ((r $Ref)) $Perm
  (ite
    (and (< (inv@181@01 r) n@158@01) (<= 3 (inv@181@01 r)))
    ($Perm.min
      (-
        (ite
          (and (< (inv@169@01 r) n@158@01) (<= 3 (inv@169@01 r)))
          $Perm.Write
          $Perm.No)
        (pTaken@177@01 r))
      $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (-
        (ite
          (and (< (inv@169@01 r) n@158@01) (<= 3 (inv@169@01 r)))
          $Perm.Write
          $Perm.No)
        (pTaken@177@01 r))
      (pTaken@182@01 r))
    $Perm.No)
  
  :qid |quant-u-176|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (< (inv@181@01 r) n@158@01) (<= 3 (inv@181@01 r)))
    (= (- $Perm.Write (pTaken@182@01 r)) $Perm.No))
  
  :qid |quant-u-177|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@183@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@183@01  $FVF<f>)))
      (and (< (inv@181@01 r) n@158@01) (<= 3 (inv@181@01 r))))
    (=>
      (and (< (inv@181@01 r) n@158@01) (<= 3 (inv@181@01 r)))
      (Set_in r ($FVF.domain_f (as sm@183@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@183@01  $FVF<f>))))
  :qid |qp.fvfDomDef95|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@181@01 r) n@158@01) (<= 3 (inv@181@01 r)))
      (<
        $Perm.No
        (-
          (ite
            (and (< (inv@169@01 r) n@158@01) (<= 3 (inv@169@01 r)))
            $Perm.Write
            $Perm.No)
          (pTaken@177@01 r))))
    (= ($FVF.lookup_f (as sm@183@01  $FVF<f>) r) ($FVF.lookup_f $t@168@01 r)))
  :pattern (($FVF.lookup_f (as sm@183@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@168@01 r))
  :qid |qp.fvfValDef94|)))
(assert (P02%trigger ($Snap.combine
  $Snap.unit
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$FVF<f>To$Snap (as sm@179@01  $FVF<f>))
        ($SortWrappers.$FVF<f>To$Snap (as sm@183@01  $FVF<f>)))))) xs@157@01 n@158@01))
; [exec]
; unfold acc(P02(xs, n), write)
; [eval] |xs| == n
; [eval] |xs|
; [eval] 3 <= n
; [eval] (forall k: Int, j: Int :: { xs[k], xs[j] } k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==> xs[k] != xs[j])
(declare-const k@184@01 Int)
(declare-const j@185@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==> xs[k] != xs[j]
; [eval] k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j)))
; [eval] k >= 0
(push) ; 4
; [then-branch: 95 | k@184@01 >= 0 | live]
; [else-branch: 95 | !(k@184@01 >= 0) | live]
(push) ; 5
; [then-branch: 95 | k@184@01 >= 0]
(assert (>= k@184@01 0))
; [eval] k < |xs|
; [eval] |xs|
(push) ; 6
; [then-branch: 96 | k@184@01 < |xs@157@01| | live]
; [else-branch: 96 | !(k@184@01 < |xs@157@01|) | live]
(push) ; 7
; [then-branch: 96 | k@184@01 < |xs@157@01|]
(assert (< k@184@01 (Seq_length xs@157@01)))
; [eval] j >= 0
(push) ; 8
; [then-branch: 97 | j@185@01 >= 0 | live]
; [else-branch: 97 | !(j@185@01 >= 0) | live]
(push) ; 9
; [then-branch: 97 | j@185@01 >= 0]
(assert (>= j@185@01 0))
; [eval] j < |xs|
; [eval] |xs|
(push) ; 10
; [then-branch: 98 | j@185@01 < |xs@157@01| | live]
; [else-branch: 98 | !(j@185@01 < |xs@157@01|) | live]
(push) ; 11
; [then-branch: 98 | j@185@01 < |xs@157@01|]
(assert (< j@185@01 (Seq_length xs@157@01)))
; [eval] k != j
(pop) ; 11
(push) ; 11
; [else-branch: 98 | !(j@185@01 < |xs@157@01|)]
(assert (not (< j@185@01 (Seq_length xs@157@01))))
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (not (< j@185@01 (Seq_length xs@157@01)))
  (< j@185@01 (Seq_length xs@157@01))))
(pop) ; 9
(push) ; 9
; [else-branch: 97 | !(j@185@01 >= 0)]
(assert (not (>= j@185@01 0)))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (=>
  (>= j@185@01 0)
  (and
    (>= j@185@01 0)
    (or
      (not (< j@185@01 (Seq_length xs@157@01)))
      (< j@185@01 (Seq_length xs@157@01))))))
; Joined path conditions
(assert (or (not (>= j@185@01 0)) (>= j@185@01 0)))
(pop) ; 7
(push) ; 7
; [else-branch: 96 | !(k@184@01 < |xs@157@01|)]
(assert (not (< k@184@01 (Seq_length xs@157@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (< k@184@01 (Seq_length xs@157@01))
  (and
    (< k@184@01 (Seq_length xs@157@01))
    (=>
      (>= j@185@01 0)
      (and
        (>= j@185@01 0)
        (or
          (not (< j@185@01 (Seq_length xs@157@01)))
          (< j@185@01 (Seq_length xs@157@01)))))
    (or (not (>= j@185@01 0)) (>= j@185@01 0)))))
; Joined path conditions
(assert (or
  (not (< k@184@01 (Seq_length xs@157@01)))
  (< k@184@01 (Seq_length xs@157@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 95 | !(k@184@01 >= 0)]
(assert (not (>= k@184@01 0)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (>= k@184@01 0)
  (and
    (>= k@184@01 0)
    (=>
      (< k@184@01 (Seq_length xs@157@01))
      (and
        (< k@184@01 (Seq_length xs@157@01))
        (=>
          (>= j@185@01 0)
          (and
            (>= j@185@01 0)
            (or
              (not (< j@185@01 (Seq_length xs@157@01)))
              (< j@185@01 (Seq_length xs@157@01)))))
        (or (not (>= j@185@01 0)) (>= j@185@01 0))))
    (or
      (not (< k@184@01 (Seq_length xs@157@01)))
      (< k@184@01 (Seq_length xs@157@01))))))
; Joined path conditions
(assert (or (not (>= k@184@01 0)) (>= k@184@01 0)))
(push) ; 4
; [then-branch: 99 | k@184@01 != j@185@01 && j@185@01 < |xs@157@01| && j@185@01 >= 0 && k@184@01 < |xs@157@01| && k@184@01 >= 0 | live]
; [else-branch: 99 | !(k@184@01 != j@185@01 && j@185@01 < |xs@157@01| && j@185@01 >= 0 && k@184@01 < |xs@157@01| && k@184@01 >= 0) | live]
(push) ; 5
; [then-branch: 99 | k@184@01 != j@185@01 && j@185@01 < |xs@157@01| && j@185@01 >= 0 && k@184@01 < |xs@157@01| && k@184@01 >= 0]
(assert (and
  (and
    (and
      (and (not (= k@184@01 j@185@01)) (< j@185@01 (Seq_length xs@157@01)))
      (>= j@185@01 0))
    (< k@184@01 (Seq_length xs@157@01)))
  (>= k@184@01 0)))
; [eval] xs[k] != xs[j]
; [eval] xs[k]
; [eval] xs[j]
(pop) ; 5
(push) ; 5
; [else-branch: 99 | !(k@184@01 != j@185@01 && j@185@01 < |xs@157@01| && j@185@01 >= 0 && k@184@01 < |xs@157@01| && k@184@01 >= 0)]
(assert (not
  (and
    (and
      (and
        (and (not (= k@184@01 j@185@01)) (< j@185@01 (Seq_length xs@157@01)))
        (>= j@185@01 0))
      (< k@184@01 (Seq_length xs@157@01)))
    (>= k@184@01 0))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (and
      (and
        (and (not (= k@184@01 j@185@01)) (< j@185@01 (Seq_length xs@157@01)))
        (>= j@185@01 0))
      (< k@184@01 (Seq_length xs@157@01)))
    (>= k@184@01 0))
  (and
    (not (= k@184@01 j@185@01))
    (< j@185@01 (Seq_length xs@157@01))
    (>= j@185@01 0)
    (< k@184@01 (Seq_length xs@157@01))
    (>= k@184@01 0))))
; Joined path conditions
(assert (or
  (not
    (and
      (and
        (and
          (and (not (= k@184@01 j@185@01)) (< j@185@01 (Seq_length xs@157@01)))
          (>= j@185@01 0))
        (< k@184@01 (Seq_length xs@157@01)))
      (>= k@184@01 0)))
  (and
    (and
      (and
        (and (not (= k@184@01 j@185@01)) (< j@185@01 (Seq_length xs@157@01)))
        (>= j@185@01 0))
      (< k@184@01 (Seq_length xs@157@01)))
    (>= k@184@01 0))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@184@01 Int) (j@185@01 Int)) (!
  (and
    (=>
      (>= k@184@01 0)
      (and
        (>= k@184@01 0)
        (=>
          (< k@184@01 (Seq_length xs@157@01))
          (and
            (< k@184@01 (Seq_length xs@157@01))
            (=>
              (>= j@185@01 0)
              (and
                (>= j@185@01 0)
                (or
                  (not (< j@185@01 (Seq_length xs@157@01)))
                  (< j@185@01 (Seq_length xs@157@01)))))
            (or (not (>= j@185@01 0)) (>= j@185@01 0))))
        (or
          (not (< k@184@01 (Seq_length xs@157@01)))
          (< k@184@01 (Seq_length xs@157@01)))))
    (or (not (>= k@184@01 0)) (>= k@184@01 0))
    (=>
      (and
        (and
          (and
            (and (not (= k@184@01 j@185@01)) (< j@185@01 (Seq_length xs@157@01)))
            (>= j@185@01 0))
          (< k@184@01 (Seq_length xs@157@01)))
        (>= k@184@01 0))
      (and
        (not (= k@184@01 j@185@01))
        (< j@185@01 (Seq_length xs@157@01))
        (>= j@185@01 0)
        (< k@184@01 (Seq_length xs@157@01))
        (>= k@184@01 0)))
    (or
      (not
        (and
          (and
            (and
              (and
                (not (= k@184@01 j@185@01))
                (< j@185@01 (Seq_length xs@157@01)))
              (>= j@185@01 0))
            (< k@184@01 (Seq_length xs@157@01)))
          (>= k@184@01 0)))
      (and
        (and
          (and
            (and (not (= k@184@01 j@185@01)) (< j@185@01 (Seq_length xs@157@01)))
            (>= j@185@01 0))
          (< k@184@01 (Seq_length xs@157@01)))
        (>= k@184@01 0))))
  :pattern ((Seq_index xs@157@01 k@184@01) (Seq_index xs@157@01 j@185@01))
  :qid |prog.l65-aux|)))
(assert (forall ((k@184@01 Int) (j@185@01 Int)) (!
  (=>
    (and
      (and
        (and
          (and (not (= k@184@01 j@185@01)) (< j@185@01 (Seq_length xs@157@01)))
          (>= j@185@01 0))
        (< k@184@01 (Seq_length xs@157@01)))
      (>= k@184@01 0))
    (not (= (Seq_index xs@157@01 k@184@01) (Seq_index xs@157@01 j@185@01))))
  :pattern ((Seq_index xs@157@01 k@184@01) (Seq_index xs@157@01 j@185@01))
  :qid |prog.l65|)))
(declare-const j@186@01 Int)
(push) ; 3
; [eval] 0 <= j && j < 3
; [eval] 0 <= j
(push) ; 4
; [then-branch: 100 | 0 <= j@186@01 | live]
; [else-branch: 100 | !(0 <= j@186@01) | live]
(push) ; 5
; [then-branch: 100 | 0 <= j@186@01]
(assert (<= 0 j@186@01))
; [eval] j < 3
(pop) ; 5
(push) ; 5
; [else-branch: 100 | !(0 <= j@186@01)]
(assert (not (<= 0 j@186@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 j@186@01)) (<= 0 j@186@01)))
(assert (and (< j@186@01 3) (<= 0 j@186@01)))
; [eval] xs[j]
(push) ; 4
(assert (not (>= j@186@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< j@186@01 (Seq_length xs@157@01))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@187@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@186@01 Int)) (!
  (=>
    (and (< j@186@01 3) (<= 0 j@186@01))
    (or (not (<= 0 j@186@01)) (<= 0 j@186@01)))
  :pattern ((Seq_index xs@157@01 j@186@01))
  :qid |f-aux|)))
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((j@186@01 Int)) (!
  (=>
    (and (< j@186@01 3) (<= 0 j@186@01))
    (= (inv@187@01 (Seq_index xs@157@01 j@186@01)) j@186@01))
  :pattern ((Seq_index xs@157@01 j@186@01))
  :qid |quant-u-179|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@187@01 r) 3) (<= 0 (inv@187@01 r)))
    (= (Seq_index xs@157@01 (inv@187@01 r)) r))
  :pattern ((inv@187@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j@186@01 Int)) (!
  (=>
    (and (< j@186@01 3) (<= 0 j@186@01))
    (not (= (Seq_index xs@157@01 j@186@01) $Ref.null)))
  :pattern ((Seq_index xs@157@01 j@186@01))
  :qid |f-permImpliesNonNull|)))
(declare-const j@188@01 Int)
(push) ; 3
; [eval] 3 <= j && j < n
; [eval] 3 <= j
(push) ; 4
; [then-branch: 101 | 3 <= j@188@01 | live]
; [else-branch: 101 | !(3 <= j@188@01) | live]
(push) ; 5
; [then-branch: 101 | 3 <= j@188@01]
(assert (<= 3 j@188@01))
; [eval] j < n
(pop) ; 5
(push) ; 5
; [else-branch: 101 | !(3 <= j@188@01)]
(assert (not (<= 3 j@188@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 3 j@188@01)) (<= 3 j@188@01)))
(assert (and (< j@188@01 n@158@01) (<= 3 j@188@01)))
; [eval] xs[j]
(push) ; 4
(assert (not (>= j@188@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< j@188@01 (Seq_length xs@157@01))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@189@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@188@01 Int)) (!
  (=>
    (and (< j@188@01 n@158@01) (<= 3 j@188@01))
    (or (not (<= 3 j@188@01)) (<= 3 j@188@01)))
  :pattern ((Seq_index xs@157@01 j@188@01))
  :qid |f-aux|)))
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((j@188@01 Int)) (!
  (=>
    (and (< j@188@01 n@158@01) (<= 3 j@188@01))
    (= (inv@189@01 (Seq_index xs@157@01 j@188@01)) j@188@01))
  :pattern ((Seq_index xs@157@01 j@188@01))
  :qid |quant-u-181|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@189@01 r) n@158@01) (<= 3 (inv@189@01 r)))
    (= (Seq_index xs@157@01 (inv@189@01 r)) r))
  :pattern ((inv@189@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j@188@01 Int)) (!
  (=>
    (and (< j@188@01 n@158@01) (<= 3 j@188@01))
    (not (= (Seq_index xs@157@01 j@188@01) $Ref.null)))
  :pattern ((Seq_index xs@157@01 j@188@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
; [exec]
; assert false
(set-option :timeout 0)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const sm@190@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@189@01 r) n@158@01) (<= 3 (inv@189@01 r)))
    (=
      ($FVF.lookup_f (as sm@190@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@183@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@190@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@183@01  $FVF<f>) r))
  :qid |qp.fvfValDef96|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@187@01 r) 3) (<= 0 (inv@187@01 r)))
    (=
      ($FVF.lookup_f (as sm@190@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@179@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@190@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@179@01  $FVF<f>) r))
  :qid |qp.fvfValDef97|)))
(declare-const pm@191@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@191@01  $FPM) r)
    (+
      (ite
        (and (< (inv@189@01 r) n@158@01) (<= 3 (inv@189@01 r)))
        $Perm.Write
        $Perm.No)
      (ite (and (< (inv@187@01 r) 3) (<= 0 (inv@187@01 r))) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@191@01  $FPM) r))
  :qid |qp.resPrmSumDef98|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@191@01  $FPM) r) $Perm.Write)
  :pattern ((inv@189@01 r))
  :qid |qp-fld-prm-bnd|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@191@01  $FPM) r) $Perm.Write)
  :pattern ((inv@187@01 r))
  :qid |qp-fld-prm-bnd|)))
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 2
(pop) ; 1
; ---------- test06b ----------
(declare-const xs@192@01 Seq<$Ref>)
(declare-const n@193@01 Int)
(declare-const xs@194@01 Seq<$Ref>)
(declare-const n@195@01 Int)
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
; var v1: Int
(declare-const v1@196@01 Int)
; [exec]
; var v2: Int
(declare-const v2@197@01 Int)
; [exec]
; inhale acc(P02(xs, n), write)
(declare-const $t@198@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale 6 < n
(declare-const $t@199@01 $Snap)
(assert (= $t@199@01 $Snap.unit))
; [eval] 6 < n
(assert (< 6 n@195@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; unfold acc(P02(xs, n), write)
(assert (= $t@198@01 ($Snap.combine ($Snap.first $t@198@01) ($Snap.second $t@198@01))))
(assert (= ($Snap.first $t@198@01) $Snap.unit))
; [eval] |xs| == n
; [eval] |xs|
(assert (= (Seq_length xs@194@01) n@195@01))
(assert (=
  ($Snap.second $t@198@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@198@01))
    ($Snap.second ($Snap.second $t@198@01)))))
(assert (= ($Snap.first ($Snap.second $t@198@01)) $Snap.unit))
; [eval] 3 <= n
(assert (<= 3 n@195@01))
(assert (=
  ($Snap.second ($Snap.second $t@198@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@198@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@198@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@198@01))) $Snap.unit))
; [eval] (forall k: Int, j: Int :: { xs[k], xs[j] } k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==> xs[k] != xs[j])
(declare-const k@200@01 Int)
(declare-const j@201@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==> xs[k] != xs[j]
; [eval] k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j)))
; [eval] k >= 0
(push) ; 4
; [then-branch: 102 | k@200@01 >= 0 | live]
; [else-branch: 102 | !(k@200@01 >= 0) | live]
(push) ; 5
; [then-branch: 102 | k@200@01 >= 0]
(assert (>= k@200@01 0))
; [eval] k < |xs|
; [eval] |xs|
(push) ; 6
; [then-branch: 103 | k@200@01 < |xs@194@01| | live]
; [else-branch: 103 | !(k@200@01 < |xs@194@01|) | live]
(push) ; 7
; [then-branch: 103 | k@200@01 < |xs@194@01|]
(assert (< k@200@01 (Seq_length xs@194@01)))
; [eval] j >= 0
(push) ; 8
; [then-branch: 104 | j@201@01 >= 0 | live]
; [else-branch: 104 | !(j@201@01 >= 0) | live]
(push) ; 9
; [then-branch: 104 | j@201@01 >= 0]
(assert (>= j@201@01 0))
; [eval] j < |xs|
; [eval] |xs|
(push) ; 10
; [then-branch: 105 | j@201@01 < |xs@194@01| | live]
; [else-branch: 105 | !(j@201@01 < |xs@194@01|) | live]
(push) ; 11
; [then-branch: 105 | j@201@01 < |xs@194@01|]
(assert (< j@201@01 (Seq_length xs@194@01)))
; [eval] k != j
(pop) ; 11
(push) ; 11
; [else-branch: 105 | !(j@201@01 < |xs@194@01|)]
(assert (not (< j@201@01 (Seq_length xs@194@01))))
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (not (< j@201@01 (Seq_length xs@194@01)))
  (< j@201@01 (Seq_length xs@194@01))))
(pop) ; 9
(push) ; 9
; [else-branch: 104 | !(j@201@01 >= 0)]
(assert (not (>= j@201@01 0)))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (=>
  (>= j@201@01 0)
  (and
    (>= j@201@01 0)
    (or
      (not (< j@201@01 (Seq_length xs@194@01)))
      (< j@201@01 (Seq_length xs@194@01))))))
; Joined path conditions
(assert (or (not (>= j@201@01 0)) (>= j@201@01 0)))
(pop) ; 7
(push) ; 7
; [else-branch: 103 | !(k@200@01 < |xs@194@01|)]
(assert (not (< k@200@01 (Seq_length xs@194@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (< k@200@01 (Seq_length xs@194@01))
  (and
    (< k@200@01 (Seq_length xs@194@01))
    (=>
      (>= j@201@01 0)
      (and
        (>= j@201@01 0)
        (or
          (not (< j@201@01 (Seq_length xs@194@01)))
          (< j@201@01 (Seq_length xs@194@01)))))
    (or (not (>= j@201@01 0)) (>= j@201@01 0)))))
; Joined path conditions
(assert (or
  (not (< k@200@01 (Seq_length xs@194@01)))
  (< k@200@01 (Seq_length xs@194@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 102 | !(k@200@01 >= 0)]
(assert (not (>= k@200@01 0)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (>= k@200@01 0)
  (and
    (>= k@200@01 0)
    (=>
      (< k@200@01 (Seq_length xs@194@01))
      (and
        (< k@200@01 (Seq_length xs@194@01))
        (=>
          (>= j@201@01 0)
          (and
            (>= j@201@01 0)
            (or
              (not (< j@201@01 (Seq_length xs@194@01)))
              (< j@201@01 (Seq_length xs@194@01)))))
        (or (not (>= j@201@01 0)) (>= j@201@01 0))))
    (or
      (not (< k@200@01 (Seq_length xs@194@01)))
      (< k@200@01 (Seq_length xs@194@01))))))
; Joined path conditions
(assert (or (not (>= k@200@01 0)) (>= k@200@01 0)))
(push) ; 4
; [then-branch: 106 | k@200@01 != j@201@01 && j@201@01 < |xs@194@01| && j@201@01 >= 0 && k@200@01 < |xs@194@01| && k@200@01 >= 0 | live]
; [else-branch: 106 | !(k@200@01 != j@201@01 && j@201@01 < |xs@194@01| && j@201@01 >= 0 && k@200@01 < |xs@194@01| && k@200@01 >= 0) | live]
(push) ; 5
; [then-branch: 106 | k@200@01 != j@201@01 && j@201@01 < |xs@194@01| && j@201@01 >= 0 && k@200@01 < |xs@194@01| && k@200@01 >= 0]
(assert (and
  (and
    (and
      (and (not (= k@200@01 j@201@01)) (< j@201@01 (Seq_length xs@194@01)))
      (>= j@201@01 0))
    (< k@200@01 (Seq_length xs@194@01)))
  (>= k@200@01 0)))
; [eval] xs[k] != xs[j]
; [eval] xs[k]
; [eval] xs[j]
(pop) ; 5
(push) ; 5
; [else-branch: 106 | !(k@200@01 != j@201@01 && j@201@01 < |xs@194@01| && j@201@01 >= 0 && k@200@01 < |xs@194@01| && k@200@01 >= 0)]
(assert (not
  (and
    (and
      (and
        (and (not (= k@200@01 j@201@01)) (< j@201@01 (Seq_length xs@194@01)))
        (>= j@201@01 0))
      (< k@200@01 (Seq_length xs@194@01)))
    (>= k@200@01 0))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (and
      (and
        (and (not (= k@200@01 j@201@01)) (< j@201@01 (Seq_length xs@194@01)))
        (>= j@201@01 0))
      (< k@200@01 (Seq_length xs@194@01)))
    (>= k@200@01 0))
  (and
    (not (= k@200@01 j@201@01))
    (< j@201@01 (Seq_length xs@194@01))
    (>= j@201@01 0)
    (< k@200@01 (Seq_length xs@194@01))
    (>= k@200@01 0))))
; Joined path conditions
(assert (or
  (not
    (and
      (and
        (and
          (and (not (= k@200@01 j@201@01)) (< j@201@01 (Seq_length xs@194@01)))
          (>= j@201@01 0))
        (< k@200@01 (Seq_length xs@194@01)))
      (>= k@200@01 0)))
  (and
    (and
      (and
        (and (not (= k@200@01 j@201@01)) (< j@201@01 (Seq_length xs@194@01)))
        (>= j@201@01 0))
      (< k@200@01 (Seq_length xs@194@01)))
    (>= k@200@01 0))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@200@01 Int) (j@201@01 Int)) (!
  (and
    (=>
      (>= k@200@01 0)
      (and
        (>= k@200@01 0)
        (=>
          (< k@200@01 (Seq_length xs@194@01))
          (and
            (< k@200@01 (Seq_length xs@194@01))
            (=>
              (>= j@201@01 0)
              (and
                (>= j@201@01 0)
                (or
                  (not (< j@201@01 (Seq_length xs@194@01)))
                  (< j@201@01 (Seq_length xs@194@01)))))
            (or (not (>= j@201@01 0)) (>= j@201@01 0))))
        (or
          (not (< k@200@01 (Seq_length xs@194@01)))
          (< k@200@01 (Seq_length xs@194@01)))))
    (or (not (>= k@200@01 0)) (>= k@200@01 0))
    (=>
      (and
        (and
          (and
            (and (not (= k@200@01 j@201@01)) (< j@201@01 (Seq_length xs@194@01)))
            (>= j@201@01 0))
          (< k@200@01 (Seq_length xs@194@01)))
        (>= k@200@01 0))
      (and
        (not (= k@200@01 j@201@01))
        (< j@201@01 (Seq_length xs@194@01))
        (>= j@201@01 0)
        (< k@200@01 (Seq_length xs@194@01))
        (>= k@200@01 0)))
    (or
      (not
        (and
          (and
            (and
              (and
                (not (= k@200@01 j@201@01))
                (< j@201@01 (Seq_length xs@194@01)))
              (>= j@201@01 0))
            (< k@200@01 (Seq_length xs@194@01)))
          (>= k@200@01 0)))
      (and
        (and
          (and
            (and (not (= k@200@01 j@201@01)) (< j@201@01 (Seq_length xs@194@01)))
            (>= j@201@01 0))
          (< k@200@01 (Seq_length xs@194@01)))
        (>= k@200@01 0))))
  :pattern ((Seq_index xs@194@01 k@200@01) (Seq_index xs@194@01 j@201@01))
  :qid |prog.l65-aux|)))
(assert (forall ((k@200@01 Int) (j@201@01 Int)) (!
  (=>
    (and
      (and
        (and
          (and (not (= k@200@01 j@201@01)) (< j@201@01 (Seq_length xs@194@01)))
          (>= j@201@01 0))
        (< k@200@01 (Seq_length xs@194@01)))
      (>= k@200@01 0))
    (not (= (Seq_index xs@194@01 k@200@01) (Seq_index xs@194@01 j@201@01))))
  :pattern ((Seq_index xs@194@01 k@200@01) (Seq_index xs@194@01 j@201@01))
  :qid |prog.l65|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@198@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@198@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@198@01)))))))
(declare-const j@202@01 Int)
(push) ; 3
; [eval] 0 <= j && j < 3
; [eval] 0 <= j
(push) ; 4
; [then-branch: 107 | 0 <= j@202@01 | live]
; [else-branch: 107 | !(0 <= j@202@01) | live]
(push) ; 5
; [then-branch: 107 | 0 <= j@202@01]
(assert (<= 0 j@202@01))
; [eval] j < 3
(pop) ; 5
(push) ; 5
; [else-branch: 107 | !(0 <= j@202@01)]
(assert (not (<= 0 j@202@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 j@202@01)) (<= 0 j@202@01)))
(assert (and (< j@202@01 3) (<= 0 j@202@01)))
; [eval] xs[j]
(push) ; 4
(assert (not (>= j@202@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< j@202@01 (Seq_length xs@194@01))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@203@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@202@01 Int)) (!
  (=>
    (and (< j@202@01 3) (<= 0 j@202@01))
    (or (not (<= 0 j@202@01)) (<= 0 j@202@01)))
  :pattern ((Seq_index xs@194@01 j@202@01))
  :qid |f-aux|)))
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((j@202@01 Int)) (!
  (=>
    (and (< j@202@01 3) (<= 0 j@202@01))
    (= (inv@203@01 (Seq_index xs@194@01 j@202@01)) j@202@01))
  :pattern ((Seq_index xs@194@01 j@202@01))
  :qid |quant-u-183|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@203@01 r) 3) (<= 0 (inv@203@01 r)))
    (= (Seq_index xs@194@01 (inv@203@01 r)) r))
  :pattern ((inv@203@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j@202@01 Int)) (!
  (=>
    (and (< j@202@01 3) (<= 0 j@202@01))
    (not (= (Seq_index xs@194@01 j@202@01) $Ref.null)))
  :pattern ((Seq_index xs@194@01 j@202@01))
  :qid |f-permImpliesNonNull|)))
(declare-const j@204@01 Int)
(push) ; 3
; [eval] 3 <= j && j < n
; [eval] 3 <= j
(push) ; 4
; [then-branch: 108 | 3 <= j@204@01 | live]
; [else-branch: 108 | !(3 <= j@204@01) | live]
(push) ; 5
; [then-branch: 108 | 3 <= j@204@01]
(assert (<= 3 j@204@01))
; [eval] j < n
(pop) ; 5
(push) ; 5
; [else-branch: 108 | !(3 <= j@204@01)]
(assert (not (<= 3 j@204@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 3 j@204@01)) (<= 3 j@204@01)))
(assert (and (< j@204@01 n@195@01) (<= 3 j@204@01)))
; [eval] xs[j]
(push) ; 4
(assert (not (>= j@204@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< j@204@01 (Seq_length xs@194@01))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@205@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@204@01 Int)) (!
  (=>
    (and (< j@204@01 n@195@01) (<= 3 j@204@01))
    (or (not (<= 3 j@204@01)) (<= 3 j@204@01)))
  :pattern ((Seq_index xs@194@01 j@204@01))
  :qid |f-aux|)))
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((j@204@01 Int)) (!
  (=>
    (and (< j@204@01 n@195@01) (<= 3 j@204@01))
    (= (inv@205@01 (Seq_index xs@194@01 j@204@01)) j@204@01))
  :pattern ((Seq_index xs@194@01 j@204@01))
  :qid |quant-u-185|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@205@01 r) n@195@01) (<= 3 (inv@205@01 r)))
    (= (Seq_index xs@194@01 (inv@205@01 r)) r))
  :pattern ((inv@205@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j@204@01 Int)) (!
  (=>
    (and (< j@204@01 n@195@01) (<= 3 j@204@01))
    (not (= (Seq_index xs@194@01 j@204@01) $Ref.null)))
  :pattern ((Seq_index xs@194@01 j@204@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (P02%trigger $t@198@01 xs@194@01 n@195@01))
; [exec]
; v1 := xs[2].f
; [eval] xs[2]
(set-option :timeout 0)
(push) ; 3
(assert (not (< 2 (Seq_length xs@194@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const sm@206@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@205@01 r) n@195@01) (<= 3 (inv@205@01 r)))
    (=
      ($FVF.lookup_f (as sm@206@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@198@01))))) r)))
  :pattern (($FVF.lookup_f (as sm@206@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@198@01))))) r))
  :qid |qp.fvfValDef99|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@203@01 r) 3) (<= 0 (inv@203@01 r)))
    (=
      ($FVF.lookup_f (as sm@206@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@198@01))))) r)))
  :pattern (($FVF.lookup_f (as sm@206@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@198@01))))) r))
  :qid |qp.fvfValDef100|)))
(declare-const pm@207@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@207@01  $FPM) r)
    (+
      (ite
        (and (< (inv@205@01 r) n@195@01) (<= 3 (inv@205@01 r)))
        $Perm.Write
        $Perm.No)
      (ite (and (< (inv@203@01 r) 3) (<= 0 (inv@203@01 r))) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@207@01  $FPM) r))
  :qid |qp.resPrmSumDef101|)))
(push) ; 3
(assert (not (< $Perm.No ($FVF.perm_f (as pm@207@01  $FPM) (Seq_index xs@194@01 2)))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const v1@208@01 Int)
(assert (= v1@208@01 ($FVF.lookup_f (as sm@206@01  $FVF<f>) (Seq_index xs@194@01 2))))
; [exec]
; v2 := xs[1].f
; [eval] xs[1]
(push) ; 3
(assert (not (< 1 (Seq_length xs@194@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const sm@209@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@205@01 r) n@195@01) (<= 3 (inv@205@01 r)))
    (=
      ($FVF.lookup_f (as sm@209@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@198@01))))) r)))
  :pattern (($FVF.lookup_f (as sm@209@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@198@01))))) r))
  :qid |qp.fvfValDef102|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@203@01 r) 3) (<= 0 (inv@203@01 r)))
    (=
      ($FVF.lookup_f (as sm@209@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@198@01))))) r)))
  :pattern (($FVF.lookup_f (as sm@209@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@198@01))))) r))
  :qid |qp.fvfValDef103|)))
(declare-const pm@210@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@210@01  $FPM) r)
    (+
      (ite
        (and (< (inv@205@01 r) n@195@01) (<= 3 (inv@205@01 r)))
        $Perm.Write
        $Perm.No)
      (ite (and (< (inv@203@01 r) 3) (<= 0 (inv@203@01 r))) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@210@01  $FPM) r))
  :qid |qp.resPrmSumDef104|)))
(push) ; 3
(assert (not (< $Perm.No ($FVF.perm_f (as pm@210@01  $FPM) (Seq_index xs@194@01 1)))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const v2@211@01 Int)
(assert (= v2@211@01 ($FVF.lookup_f (as sm@209@01  $FVF<f>) (Seq_index xs@194@01 1))))
; [exec]
; fold acc(P02(xs, n), write)
; [eval] |xs| == n
; [eval] |xs|
; [eval] 3 <= n
; [eval] (forall k: Int, j: Int :: { xs[k], xs[j] } k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==> xs[k] != xs[j])
(declare-const k@212@01 Int)
(declare-const j@213@01 Int)
(push) ; 3
; [eval] k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==> xs[k] != xs[j]
; [eval] k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j)))
; [eval] k >= 0
(push) ; 4
; [then-branch: 109 | k@212@01 >= 0 | live]
; [else-branch: 109 | !(k@212@01 >= 0) | live]
(push) ; 5
; [then-branch: 109 | k@212@01 >= 0]
(assert (>= k@212@01 0))
; [eval] k < |xs|
; [eval] |xs|
(push) ; 6
; [then-branch: 110 | k@212@01 < |xs@194@01| | live]
; [else-branch: 110 | !(k@212@01 < |xs@194@01|) | live]
(push) ; 7
; [then-branch: 110 | k@212@01 < |xs@194@01|]
(assert (< k@212@01 (Seq_length xs@194@01)))
; [eval] j >= 0
(push) ; 8
; [then-branch: 111 | j@213@01 >= 0 | live]
; [else-branch: 111 | !(j@213@01 >= 0) | live]
(push) ; 9
; [then-branch: 111 | j@213@01 >= 0]
(assert (>= j@213@01 0))
; [eval] j < |xs|
; [eval] |xs|
(push) ; 10
; [then-branch: 112 | j@213@01 < |xs@194@01| | live]
; [else-branch: 112 | !(j@213@01 < |xs@194@01|) | live]
(push) ; 11
; [then-branch: 112 | j@213@01 < |xs@194@01|]
(assert (< j@213@01 (Seq_length xs@194@01)))
; [eval] k != j
(pop) ; 11
(push) ; 11
; [else-branch: 112 | !(j@213@01 < |xs@194@01|)]
(assert (not (< j@213@01 (Seq_length xs@194@01))))
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (not (< j@213@01 (Seq_length xs@194@01)))
  (< j@213@01 (Seq_length xs@194@01))))
(pop) ; 9
(push) ; 9
; [else-branch: 111 | !(j@213@01 >= 0)]
(assert (not (>= j@213@01 0)))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (=>
  (>= j@213@01 0)
  (and
    (>= j@213@01 0)
    (or
      (not (< j@213@01 (Seq_length xs@194@01)))
      (< j@213@01 (Seq_length xs@194@01))))))
; Joined path conditions
(assert (or (not (>= j@213@01 0)) (>= j@213@01 0)))
(pop) ; 7
(push) ; 7
; [else-branch: 110 | !(k@212@01 < |xs@194@01|)]
(assert (not (< k@212@01 (Seq_length xs@194@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (< k@212@01 (Seq_length xs@194@01))
  (and
    (< k@212@01 (Seq_length xs@194@01))
    (=>
      (>= j@213@01 0)
      (and
        (>= j@213@01 0)
        (or
          (not (< j@213@01 (Seq_length xs@194@01)))
          (< j@213@01 (Seq_length xs@194@01)))))
    (or (not (>= j@213@01 0)) (>= j@213@01 0)))))
; Joined path conditions
(assert (or
  (not (< k@212@01 (Seq_length xs@194@01)))
  (< k@212@01 (Seq_length xs@194@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 109 | !(k@212@01 >= 0)]
(assert (not (>= k@212@01 0)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (>= k@212@01 0)
  (and
    (>= k@212@01 0)
    (=>
      (< k@212@01 (Seq_length xs@194@01))
      (and
        (< k@212@01 (Seq_length xs@194@01))
        (=>
          (>= j@213@01 0)
          (and
            (>= j@213@01 0)
            (or
              (not (< j@213@01 (Seq_length xs@194@01)))
              (< j@213@01 (Seq_length xs@194@01)))))
        (or (not (>= j@213@01 0)) (>= j@213@01 0))))
    (or
      (not (< k@212@01 (Seq_length xs@194@01)))
      (< k@212@01 (Seq_length xs@194@01))))))
; Joined path conditions
(assert (or (not (>= k@212@01 0)) (>= k@212@01 0)))
(push) ; 4
; [then-branch: 113 | k@212@01 != j@213@01 && j@213@01 < |xs@194@01| && j@213@01 >= 0 && k@212@01 < |xs@194@01| && k@212@01 >= 0 | live]
; [else-branch: 113 | !(k@212@01 != j@213@01 && j@213@01 < |xs@194@01| && j@213@01 >= 0 && k@212@01 < |xs@194@01| && k@212@01 >= 0) | live]
(push) ; 5
; [then-branch: 113 | k@212@01 != j@213@01 && j@213@01 < |xs@194@01| && j@213@01 >= 0 && k@212@01 < |xs@194@01| && k@212@01 >= 0]
(assert (and
  (and
    (and
      (and (not (= k@212@01 j@213@01)) (< j@213@01 (Seq_length xs@194@01)))
      (>= j@213@01 0))
    (< k@212@01 (Seq_length xs@194@01)))
  (>= k@212@01 0)))
; [eval] xs[k] != xs[j]
; [eval] xs[k]
; [eval] xs[j]
(pop) ; 5
(push) ; 5
; [else-branch: 113 | !(k@212@01 != j@213@01 && j@213@01 < |xs@194@01| && j@213@01 >= 0 && k@212@01 < |xs@194@01| && k@212@01 >= 0)]
(assert (not
  (and
    (and
      (and
        (and (not (= k@212@01 j@213@01)) (< j@213@01 (Seq_length xs@194@01)))
        (>= j@213@01 0))
      (< k@212@01 (Seq_length xs@194@01)))
    (>= k@212@01 0))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (and
      (and
        (and (not (= k@212@01 j@213@01)) (< j@213@01 (Seq_length xs@194@01)))
        (>= j@213@01 0))
      (< k@212@01 (Seq_length xs@194@01)))
    (>= k@212@01 0))
  (and
    (not (= k@212@01 j@213@01))
    (< j@213@01 (Seq_length xs@194@01))
    (>= j@213@01 0)
    (< k@212@01 (Seq_length xs@194@01))
    (>= k@212@01 0))))
; Joined path conditions
(assert (or
  (not
    (and
      (and
        (and
          (and (not (= k@212@01 j@213@01)) (< j@213@01 (Seq_length xs@194@01)))
          (>= j@213@01 0))
        (< k@212@01 (Seq_length xs@194@01)))
      (>= k@212@01 0)))
  (and
    (and
      (and
        (and (not (= k@212@01 j@213@01)) (< j@213@01 (Seq_length xs@194@01)))
        (>= j@213@01 0))
      (< k@212@01 (Seq_length xs@194@01)))
    (>= k@212@01 0))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@212@01 Int) (j@213@01 Int)) (!
  (and
    (=>
      (>= k@212@01 0)
      (and
        (>= k@212@01 0)
        (=>
          (< k@212@01 (Seq_length xs@194@01))
          (and
            (< k@212@01 (Seq_length xs@194@01))
            (=>
              (>= j@213@01 0)
              (and
                (>= j@213@01 0)
                (or
                  (not (< j@213@01 (Seq_length xs@194@01)))
                  (< j@213@01 (Seq_length xs@194@01)))))
            (or (not (>= j@213@01 0)) (>= j@213@01 0))))
        (or
          (not (< k@212@01 (Seq_length xs@194@01)))
          (< k@212@01 (Seq_length xs@194@01)))))
    (or (not (>= k@212@01 0)) (>= k@212@01 0))
    (=>
      (and
        (and
          (and
            (and (not (= k@212@01 j@213@01)) (< j@213@01 (Seq_length xs@194@01)))
            (>= j@213@01 0))
          (< k@212@01 (Seq_length xs@194@01)))
        (>= k@212@01 0))
      (and
        (not (= k@212@01 j@213@01))
        (< j@213@01 (Seq_length xs@194@01))
        (>= j@213@01 0)
        (< k@212@01 (Seq_length xs@194@01))
        (>= k@212@01 0)))
    (or
      (not
        (and
          (and
            (and
              (and
                (not (= k@212@01 j@213@01))
                (< j@213@01 (Seq_length xs@194@01)))
              (>= j@213@01 0))
            (< k@212@01 (Seq_length xs@194@01)))
          (>= k@212@01 0)))
      (and
        (and
          (and
            (and (not (= k@212@01 j@213@01)) (< j@213@01 (Seq_length xs@194@01)))
            (>= j@213@01 0))
          (< k@212@01 (Seq_length xs@194@01)))
        (>= k@212@01 0))))
  :pattern ((Seq_index xs@194@01 k@212@01) (Seq_index xs@194@01 j@213@01))
  :qid |prog.l65-aux|)))
(push) ; 3
(assert (not (forall ((k@212@01 Int) (j@213@01 Int)) (!
  (=>
    (and
      (and
        (and
          (and (not (= k@212@01 j@213@01)) (< j@213@01 (Seq_length xs@194@01)))
          (>= j@213@01 0))
        (< k@212@01 (Seq_length xs@194@01)))
      (>= k@212@01 0))
    (not (= (Seq_index xs@194@01 k@212@01) (Seq_index xs@194@01 j@213@01))))
  :pattern ((Seq_index xs@194@01 k@212@01) (Seq_index xs@194@01 j@213@01))
  :qid |prog.l65|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (forall ((k@212@01 Int) (j@213@01 Int)) (!
  (=>
    (and
      (and
        (and
          (and (not (= k@212@01 j@213@01)) (< j@213@01 (Seq_length xs@194@01)))
          (>= j@213@01 0))
        (< k@212@01 (Seq_length xs@194@01)))
      (>= k@212@01 0))
    (not (= (Seq_index xs@194@01 k@212@01) (Seq_index xs@194@01 j@213@01))))
  :pattern ((Seq_index xs@194@01 k@212@01) (Seq_index xs@194@01 j@213@01))
  :qid |prog.l65|)))
(declare-const j@214@01 Int)
(push) ; 3
; [eval] 0 <= j && j < 3
; [eval] 0 <= j
(push) ; 4
; [then-branch: 114 | 0 <= j@214@01 | live]
; [else-branch: 114 | !(0 <= j@214@01) | live]
(push) ; 5
; [then-branch: 114 | 0 <= j@214@01]
(assert (<= 0 j@214@01))
; [eval] j < 3
(pop) ; 5
(push) ; 5
; [else-branch: 114 | !(0 <= j@214@01)]
(assert (not (<= 0 j@214@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 j@214@01)) (<= 0 j@214@01)))
(assert (and (< j@214@01 3) (<= 0 j@214@01)))
; [eval] xs[j]
(push) ; 4
(assert (not (>= j@214@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< j@214@01 (Seq_length xs@194@01))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@215@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@214@01 Int)) (!
  (=>
    (and (< j@214@01 3) (<= 0 j@214@01))
    (or (not (<= 0 j@214@01)) (<= 0 j@214@01)))
  :pattern ((Seq_index xs@194@01 j@214@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j1@214@01 Int) (j2@214@01 Int)) (!
  (=>
    (and
      (and (< j1@214@01 3) (<= 0 j1@214@01))
      (and (< j2@214@01 3) (<= 0 j2@214@01))
      (= (Seq_index xs@194@01 j1@214@01) (Seq_index xs@194@01 j2@214@01)))
    (= j1@214@01 j2@214@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@214@01 Int)) (!
  (=>
    (and (< j@214@01 3) (<= 0 j@214@01))
    (= (inv@215@01 (Seq_index xs@194@01 j@214@01)) j@214@01))
  :pattern ((Seq_index xs@194@01 j@214@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@215@01 r) 3) (<= 0 (inv@215@01 r)))
    (= (Seq_index xs@194@01 (inv@215@01 r)) r))
  :pattern ((inv@215@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@216@01 ((r $Ref)) $Perm
  (ite
    (and (< (inv@215@01 r) 3) (<= 0 (inv@215@01 r)))
    ($Perm.min
      (ite
        (and (< (inv@205@01 r) n@195@01) (<= 3 (inv@205@01 r)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@217@01 ((r $Ref)) $Perm
  (ite
    (and (< (inv@215@01 r) 3) (<= 0 (inv@215@01 r)))
    ($Perm.min
      (ite (and (< (inv@203@01 r) 3) (<= 0 (inv@203@01 r))) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@216@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (< (inv@205@01 r) n@195@01) (<= 3 (inv@205@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@216@01 r))
    $Perm.No)
  
  :qid |quant-u-188|))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (< (inv@215@01 r) 3) (<= 0 (inv@215@01 r)))
    (= (- $Perm.Write (pTaken@216@01 r)) $Perm.No))
  
  :qid |quant-u-189|))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite (and (< (inv@203@01 r) 3) (<= 0 (inv@203@01 r))) $Perm.Write $Perm.No)
      (pTaken@217@01 r))
    $Perm.No)
  
  :qid |quant-u-190|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (< (inv@215@01 r) 3) (<= 0 (inv@215@01 r)))
    (= (- (- $Perm.Write (pTaken@216@01 r)) (pTaken@217@01 r)) $Perm.No))
  
  :qid |quant-u-191|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@218@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@218@01  $FVF<f>)))
      (and (< (inv@215@01 r) 3) (<= 0 (inv@215@01 r))))
    (=>
      (and (< (inv@215@01 r) 3) (<= 0 (inv@215@01 r)))
      (Set_in r ($FVF.domain_f (as sm@218@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@218@01  $FVF<f>))))
  :qid |qp.fvfDomDef107|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@215@01 r) 3) (<= 0 (inv@215@01 r)))
      (and (< (inv@205@01 r) n@195@01) (<= 3 (inv@205@01 r))))
    (=
      ($FVF.lookup_f (as sm@218@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@198@01))))) r)))
  :pattern (($FVF.lookup_f (as sm@218@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@198@01))))) r))
  :qid |qp.fvfValDef105|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@215@01 r) 3) (<= 0 (inv@215@01 r)))
      (and (< (inv@203@01 r) 3) (<= 0 (inv@203@01 r))))
    (=
      ($FVF.lookup_f (as sm@218@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@198@01))))) r)))
  :pattern (($FVF.lookup_f (as sm@218@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@198@01))))) r))
  :qid |qp.fvfValDef106|)))
(declare-const j@219@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 3 <= j && j < n
; [eval] 3 <= j
(push) ; 4
; [then-branch: 115 | 3 <= j@219@01 | live]
; [else-branch: 115 | !(3 <= j@219@01) | live]
(push) ; 5
; [then-branch: 115 | 3 <= j@219@01]
(assert (<= 3 j@219@01))
; [eval] j < n
(pop) ; 5
(push) ; 5
; [else-branch: 115 | !(3 <= j@219@01)]
(assert (not (<= 3 j@219@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 3 j@219@01)) (<= 3 j@219@01)))
(assert (and (< j@219@01 n@195@01) (<= 3 j@219@01)))
; [eval] xs[j]
(push) ; 4
(assert (not (>= j@219@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< j@219@01 (Seq_length xs@194@01))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@220@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@219@01 Int)) (!
  (=>
    (and (< j@219@01 n@195@01) (<= 3 j@219@01))
    (or (not (<= 3 j@219@01)) (<= 3 j@219@01)))
  :pattern ((Seq_index xs@194@01 j@219@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j1@219@01 Int) (j2@219@01 Int)) (!
  (=>
    (and
      (and (< j1@219@01 n@195@01) (<= 3 j1@219@01))
      (and (< j2@219@01 n@195@01) (<= 3 j2@219@01))
      (= (Seq_index xs@194@01 j1@219@01) (Seq_index xs@194@01 j2@219@01)))
    (= j1@219@01 j2@219@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@219@01 Int)) (!
  (=>
    (and (< j@219@01 n@195@01) (<= 3 j@219@01))
    (= (inv@220@01 (Seq_index xs@194@01 j@219@01)) j@219@01))
  :pattern ((Seq_index xs@194@01 j@219@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@220@01 r) n@195@01) (<= 3 (inv@220@01 r)))
    (= (Seq_index xs@194@01 (inv@220@01 r)) r))
  :pattern ((inv@220@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@221@01 ((r $Ref)) $Perm
  (ite
    (and (< (inv@220@01 r) n@195@01) (<= 3 (inv@220@01 r)))
    ($Perm.min
      (-
        (ite
          (and (< (inv@205@01 r) n@195@01) (<= 3 (inv@205@01 r)))
          $Perm.Write
          $Perm.No)
        (pTaken@216@01 r))
      $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (-
        (ite
          (and (< (inv@205@01 r) n@195@01) (<= 3 (inv@205@01 r)))
          $Perm.Write
          $Perm.No)
        (pTaken@216@01 r))
      (pTaken@221@01 r))
    $Perm.No)
  
  :qid |quant-u-194|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (< (inv@220@01 r) n@195@01) (<= 3 (inv@220@01 r)))
    (= (- $Perm.Write (pTaken@221@01 r)) $Perm.No))
  
  :qid |quant-u-195|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@222@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@222@01  $FVF<f>)))
      (and (< (inv@220@01 r) n@195@01) (<= 3 (inv@220@01 r))))
    (=>
      (and (< (inv@220@01 r) n@195@01) (<= 3 (inv@220@01 r)))
      (Set_in r ($FVF.domain_f (as sm@222@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@222@01  $FVF<f>))))
  :qid |qp.fvfDomDef109|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@220@01 r) n@195@01) (<= 3 (inv@220@01 r)))
      (<
        $Perm.No
        (-
          (ite
            (and (< (inv@205@01 r) n@195@01) (<= 3 (inv@205@01 r)))
            $Perm.Write
            $Perm.No)
          (pTaken@216@01 r))))
    (=
      ($FVF.lookup_f (as sm@222@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@198@01))))) r)))
  :pattern (($FVF.lookup_f (as sm@222@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@198@01))))) r))
  :qid |qp.fvfValDef108|)))
(assert (P02%trigger ($Snap.combine
  $Snap.unit
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$FVF<f>To$Snap (as sm@218@01  $FVF<f>))
        ($SortWrappers.$FVF<f>To$Snap (as sm@222@01  $FVF<f>)))))) xs@194@01 n@195@01))
; [exec]
; unfold acc(P02(xs, n), write)
; [eval] |xs| == n
; [eval] |xs|
; [eval] 3 <= n
; [eval] (forall k: Int, j: Int :: { xs[k], xs[j] } k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==> xs[k] != xs[j])
(declare-const k@223@01 Int)
(declare-const j@224@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==> xs[k] != xs[j]
; [eval] k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j)))
; [eval] k >= 0
(push) ; 4
; [then-branch: 116 | k@223@01 >= 0 | live]
; [else-branch: 116 | !(k@223@01 >= 0) | live]
(push) ; 5
; [then-branch: 116 | k@223@01 >= 0]
(assert (>= k@223@01 0))
; [eval] k < |xs|
; [eval] |xs|
(push) ; 6
; [then-branch: 117 | k@223@01 < |xs@194@01| | live]
; [else-branch: 117 | !(k@223@01 < |xs@194@01|) | live]
(push) ; 7
; [then-branch: 117 | k@223@01 < |xs@194@01|]
(assert (< k@223@01 (Seq_length xs@194@01)))
; [eval] j >= 0
(push) ; 8
; [then-branch: 118 | j@224@01 >= 0 | live]
; [else-branch: 118 | !(j@224@01 >= 0) | live]
(push) ; 9
; [then-branch: 118 | j@224@01 >= 0]
(assert (>= j@224@01 0))
; [eval] j < |xs|
; [eval] |xs|
(push) ; 10
; [then-branch: 119 | j@224@01 < |xs@194@01| | live]
; [else-branch: 119 | !(j@224@01 < |xs@194@01|) | live]
(push) ; 11
; [then-branch: 119 | j@224@01 < |xs@194@01|]
(assert (< j@224@01 (Seq_length xs@194@01)))
; [eval] k != j
(pop) ; 11
(push) ; 11
; [else-branch: 119 | !(j@224@01 < |xs@194@01|)]
(assert (not (< j@224@01 (Seq_length xs@194@01))))
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (not (< j@224@01 (Seq_length xs@194@01)))
  (< j@224@01 (Seq_length xs@194@01))))
(pop) ; 9
(push) ; 9
; [else-branch: 118 | !(j@224@01 >= 0)]
(assert (not (>= j@224@01 0)))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (=>
  (>= j@224@01 0)
  (and
    (>= j@224@01 0)
    (or
      (not (< j@224@01 (Seq_length xs@194@01)))
      (< j@224@01 (Seq_length xs@194@01))))))
; Joined path conditions
(assert (or (not (>= j@224@01 0)) (>= j@224@01 0)))
(pop) ; 7
(push) ; 7
; [else-branch: 117 | !(k@223@01 < |xs@194@01|)]
(assert (not (< k@223@01 (Seq_length xs@194@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (< k@223@01 (Seq_length xs@194@01))
  (and
    (< k@223@01 (Seq_length xs@194@01))
    (=>
      (>= j@224@01 0)
      (and
        (>= j@224@01 0)
        (or
          (not (< j@224@01 (Seq_length xs@194@01)))
          (< j@224@01 (Seq_length xs@194@01)))))
    (or (not (>= j@224@01 0)) (>= j@224@01 0)))))
; Joined path conditions
(assert (or
  (not (< k@223@01 (Seq_length xs@194@01)))
  (< k@223@01 (Seq_length xs@194@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 116 | !(k@223@01 >= 0)]
(assert (not (>= k@223@01 0)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (>= k@223@01 0)
  (and
    (>= k@223@01 0)
    (=>
      (< k@223@01 (Seq_length xs@194@01))
      (and
        (< k@223@01 (Seq_length xs@194@01))
        (=>
          (>= j@224@01 0)
          (and
            (>= j@224@01 0)
            (or
              (not (< j@224@01 (Seq_length xs@194@01)))
              (< j@224@01 (Seq_length xs@194@01)))))
        (or (not (>= j@224@01 0)) (>= j@224@01 0))))
    (or
      (not (< k@223@01 (Seq_length xs@194@01)))
      (< k@223@01 (Seq_length xs@194@01))))))
; Joined path conditions
(assert (or (not (>= k@223@01 0)) (>= k@223@01 0)))
(push) ; 4
; [then-branch: 120 | k@223@01 != j@224@01 && j@224@01 < |xs@194@01| && j@224@01 >= 0 && k@223@01 < |xs@194@01| && k@223@01 >= 0 | live]
; [else-branch: 120 | !(k@223@01 != j@224@01 && j@224@01 < |xs@194@01| && j@224@01 >= 0 && k@223@01 < |xs@194@01| && k@223@01 >= 0) | live]
(push) ; 5
; [then-branch: 120 | k@223@01 != j@224@01 && j@224@01 < |xs@194@01| && j@224@01 >= 0 && k@223@01 < |xs@194@01| && k@223@01 >= 0]
(assert (and
  (and
    (and
      (and (not (= k@223@01 j@224@01)) (< j@224@01 (Seq_length xs@194@01)))
      (>= j@224@01 0))
    (< k@223@01 (Seq_length xs@194@01)))
  (>= k@223@01 0)))
; [eval] xs[k] != xs[j]
; [eval] xs[k]
; [eval] xs[j]
(pop) ; 5
(push) ; 5
; [else-branch: 120 | !(k@223@01 != j@224@01 && j@224@01 < |xs@194@01| && j@224@01 >= 0 && k@223@01 < |xs@194@01| && k@223@01 >= 0)]
(assert (not
  (and
    (and
      (and
        (and (not (= k@223@01 j@224@01)) (< j@224@01 (Seq_length xs@194@01)))
        (>= j@224@01 0))
      (< k@223@01 (Seq_length xs@194@01)))
    (>= k@223@01 0))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (and
      (and
        (and (not (= k@223@01 j@224@01)) (< j@224@01 (Seq_length xs@194@01)))
        (>= j@224@01 0))
      (< k@223@01 (Seq_length xs@194@01)))
    (>= k@223@01 0))
  (and
    (not (= k@223@01 j@224@01))
    (< j@224@01 (Seq_length xs@194@01))
    (>= j@224@01 0)
    (< k@223@01 (Seq_length xs@194@01))
    (>= k@223@01 0))))
; Joined path conditions
(assert (or
  (not
    (and
      (and
        (and
          (and (not (= k@223@01 j@224@01)) (< j@224@01 (Seq_length xs@194@01)))
          (>= j@224@01 0))
        (< k@223@01 (Seq_length xs@194@01)))
      (>= k@223@01 0)))
  (and
    (and
      (and
        (and (not (= k@223@01 j@224@01)) (< j@224@01 (Seq_length xs@194@01)))
        (>= j@224@01 0))
      (< k@223@01 (Seq_length xs@194@01)))
    (>= k@223@01 0))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@223@01 Int) (j@224@01 Int)) (!
  (and
    (=>
      (>= k@223@01 0)
      (and
        (>= k@223@01 0)
        (=>
          (< k@223@01 (Seq_length xs@194@01))
          (and
            (< k@223@01 (Seq_length xs@194@01))
            (=>
              (>= j@224@01 0)
              (and
                (>= j@224@01 0)
                (or
                  (not (< j@224@01 (Seq_length xs@194@01)))
                  (< j@224@01 (Seq_length xs@194@01)))))
            (or (not (>= j@224@01 0)) (>= j@224@01 0))))
        (or
          (not (< k@223@01 (Seq_length xs@194@01)))
          (< k@223@01 (Seq_length xs@194@01)))))
    (or (not (>= k@223@01 0)) (>= k@223@01 0))
    (=>
      (and
        (and
          (and
            (and (not (= k@223@01 j@224@01)) (< j@224@01 (Seq_length xs@194@01)))
            (>= j@224@01 0))
          (< k@223@01 (Seq_length xs@194@01)))
        (>= k@223@01 0))
      (and
        (not (= k@223@01 j@224@01))
        (< j@224@01 (Seq_length xs@194@01))
        (>= j@224@01 0)
        (< k@223@01 (Seq_length xs@194@01))
        (>= k@223@01 0)))
    (or
      (not
        (and
          (and
            (and
              (and
                (not (= k@223@01 j@224@01))
                (< j@224@01 (Seq_length xs@194@01)))
              (>= j@224@01 0))
            (< k@223@01 (Seq_length xs@194@01)))
          (>= k@223@01 0)))
      (and
        (and
          (and
            (and (not (= k@223@01 j@224@01)) (< j@224@01 (Seq_length xs@194@01)))
            (>= j@224@01 0))
          (< k@223@01 (Seq_length xs@194@01)))
        (>= k@223@01 0))))
  :pattern ((Seq_index xs@194@01 k@223@01) (Seq_index xs@194@01 j@224@01))
  :qid |prog.l65-aux|)))
(assert (forall ((k@223@01 Int) (j@224@01 Int)) (!
  (=>
    (and
      (and
        (and
          (and (not (= k@223@01 j@224@01)) (< j@224@01 (Seq_length xs@194@01)))
          (>= j@224@01 0))
        (< k@223@01 (Seq_length xs@194@01)))
      (>= k@223@01 0))
    (not (= (Seq_index xs@194@01 k@223@01) (Seq_index xs@194@01 j@224@01))))
  :pattern ((Seq_index xs@194@01 k@223@01) (Seq_index xs@194@01 j@224@01))
  :qid |prog.l65|)))
(declare-const j@225@01 Int)
(push) ; 3
; [eval] 0 <= j && j < 3
; [eval] 0 <= j
(push) ; 4
; [then-branch: 121 | 0 <= j@225@01 | live]
; [else-branch: 121 | !(0 <= j@225@01) | live]
(push) ; 5
; [then-branch: 121 | 0 <= j@225@01]
(assert (<= 0 j@225@01))
; [eval] j < 3
(pop) ; 5
(push) ; 5
; [else-branch: 121 | !(0 <= j@225@01)]
(assert (not (<= 0 j@225@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 j@225@01)) (<= 0 j@225@01)))
(assert (and (< j@225@01 3) (<= 0 j@225@01)))
; [eval] xs[j]
(push) ; 4
(assert (not (>= j@225@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< j@225@01 (Seq_length xs@194@01))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@226@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@225@01 Int)) (!
  (=>
    (and (< j@225@01 3) (<= 0 j@225@01))
    (or (not (<= 0 j@225@01)) (<= 0 j@225@01)))
  :pattern ((Seq_index xs@194@01 j@225@01))
  :qid |f-aux|)))
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((j@225@01 Int)) (!
  (=>
    (and (< j@225@01 3) (<= 0 j@225@01))
    (= (inv@226@01 (Seq_index xs@194@01 j@225@01)) j@225@01))
  :pattern ((Seq_index xs@194@01 j@225@01))
  :qid |quant-u-197|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@226@01 r) 3) (<= 0 (inv@226@01 r)))
    (= (Seq_index xs@194@01 (inv@226@01 r)) r))
  :pattern ((inv@226@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j@225@01 Int)) (!
  (=>
    (and (< j@225@01 3) (<= 0 j@225@01))
    (not (= (Seq_index xs@194@01 j@225@01) $Ref.null)))
  :pattern ((Seq_index xs@194@01 j@225@01))
  :qid |f-permImpliesNonNull|)))
(declare-const j@227@01 Int)
(push) ; 3
; [eval] 3 <= j && j < n
; [eval] 3 <= j
(push) ; 4
; [then-branch: 122 | 3 <= j@227@01 | live]
; [else-branch: 122 | !(3 <= j@227@01) | live]
(push) ; 5
; [then-branch: 122 | 3 <= j@227@01]
(assert (<= 3 j@227@01))
; [eval] j < n
(pop) ; 5
(push) ; 5
; [else-branch: 122 | !(3 <= j@227@01)]
(assert (not (<= 3 j@227@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 3 j@227@01)) (<= 3 j@227@01)))
(assert (and (< j@227@01 n@195@01) (<= 3 j@227@01)))
; [eval] xs[j]
(push) ; 4
(assert (not (>= j@227@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< j@227@01 (Seq_length xs@194@01))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@228@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@227@01 Int)) (!
  (=>
    (and (< j@227@01 n@195@01) (<= 3 j@227@01))
    (or (not (<= 3 j@227@01)) (<= 3 j@227@01)))
  :pattern ((Seq_index xs@194@01 j@227@01))
  :qid |f-aux|)))
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((j@227@01 Int)) (!
  (=>
    (and (< j@227@01 n@195@01) (<= 3 j@227@01))
    (= (inv@228@01 (Seq_index xs@194@01 j@227@01)) j@227@01))
  :pattern ((Seq_index xs@194@01 j@227@01))
  :qid |quant-u-199|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@228@01 r) n@195@01) (<= 3 (inv@228@01 r)))
    (= (Seq_index xs@194@01 (inv@228@01 r)) r))
  :pattern ((inv@228@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j@227@01 Int)) (!
  (=>
    (and (< j@227@01 n@195@01) (<= 3 j@227@01))
    (not (= (Seq_index xs@194@01 j@227@01) $Ref.null)))
  :pattern ((Seq_index xs@194@01 j@227@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
; [exec]
; assert false
(set-option :timeout 0)
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const sm@229@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@228@01 r) n@195@01) (<= 3 (inv@228@01 r)))
    (=
      ($FVF.lookup_f (as sm@229@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@222@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@229@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@222@01  $FVF<f>) r))
  :qid |qp.fvfValDef110|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@226@01 r) 3) (<= 0 (inv@226@01 r)))
    (=
      ($FVF.lookup_f (as sm@229@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@218@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@229@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@218@01  $FVF<f>) r))
  :qid |qp.fvfValDef111|)))
(declare-const pm@230@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@230@01  $FPM) r)
    (+
      (ite
        (and (< (inv@228@01 r) n@195@01) (<= 3 (inv@228@01 r)))
        $Perm.Write
        $Perm.No)
      (ite (and (< (inv@226@01 r) 3) (<= 0 (inv@226@01 r))) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@230@01  $FPM) r))
  :qid |qp.resPrmSumDef112|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@230@01  $FPM) r) $Perm.Write)
  :pattern ((inv@228@01 r))
  :qid |qp-fld-prm-bnd|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@230@01  $FPM) r) $Perm.Write)
  :pattern ((inv@226@01 r))
  :qid |qp-fld-prm-bnd|)))
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 2
(pop) ; 1
; ---------- test05 ----------
(declare-const xs@231@01 Seq<$Ref>)
(declare-const n@232@01 Int)
(declare-const i@233@01 Int)
(declare-const xs@234@01 Seq<$Ref>)
(declare-const n@235@01 Int)
(declare-const i@236@01 Int)
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
; var v1: Int
(declare-const v1@237@01 Int)
; [exec]
; var v2: Int
(declare-const v2@238@01 Int)
; [exec]
; inhale acc(P02(xs, n), write)
(declare-const $t@239@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale 6 < n
(declare-const $t@240@01 $Snap)
(assert (= $t@240@01 $Snap.unit))
; [eval] 6 < n
(assert (< 6 n@235@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale i == 4
(declare-const $t@241@01 $Snap)
(assert (= $t@241@01 $Snap.unit))
; [eval] i == 4
(assert (= i@236@01 4))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; unfold acc(P02(xs, n), write)
(assert (= $t@239@01 ($Snap.combine ($Snap.first $t@239@01) ($Snap.second $t@239@01))))
(assert (= ($Snap.first $t@239@01) $Snap.unit))
; [eval] |xs| == n
; [eval] |xs|
(assert (= (Seq_length xs@234@01) n@235@01))
(assert (=
  ($Snap.second $t@239@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@239@01))
    ($Snap.second ($Snap.second $t@239@01)))))
(assert (= ($Snap.first ($Snap.second $t@239@01)) $Snap.unit))
; [eval] 3 <= n
(assert (<= 3 n@235@01))
(assert (=
  ($Snap.second ($Snap.second $t@239@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@239@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@239@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@239@01))) $Snap.unit))
; [eval] (forall k: Int, j: Int :: { xs[k], xs[j] } k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==> xs[k] != xs[j])
(declare-const k@242@01 Int)
(declare-const j@243@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==> xs[k] != xs[j]
; [eval] k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j)))
; [eval] k >= 0
(push) ; 4
; [then-branch: 123 | k@242@01 >= 0 | live]
; [else-branch: 123 | !(k@242@01 >= 0) | live]
(push) ; 5
; [then-branch: 123 | k@242@01 >= 0]
(assert (>= k@242@01 0))
; [eval] k < |xs|
; [eval] |xs|
(push) ; 6
; [then-branch: 124 | k@242@01 < |xs@234@01| | live]
; [else-branch: 124 | !(k@242@01 < |xs@234@01|) | live]
(push) ; 7
; [then-branch: 124 | k@242@01 < |xs@234@01|]
(assert (< k@242@01 (Seq_length xs@234@01)))
; [eval] j >= 0
(push) ; 8
; [then-branch: 125 | j@243@01 >= 0 | live]
; [else-branch: 125 | !(j@243@01 >= 0) | live]
(push) ; 9
; [then-branch: 125 | j@243@01 >= 0]
(assert (>= j@243@01 0))
; [eval] j < |xs|
; [eval] |xs|
(push) ; 10
; [then-branch: 126 | j@243@01 < |xs@234@01| | live]
; [else-branch: 126 | !(j@243@01 < |xs@234@01|) | live]
(push) ; 11
; [then-branch: 126 | j@243@01 < |xs@234@01|]
(assert (< j@243@01 (Seq_length xs@234@01)))
; [eval] k != j
(pop) ; 11
(push) ; 11
; [else-branch: 126 | !(j@243@01 < |xs@234@01|)]
(assert (not (< j@243@01 (Seq_length xs@234@01))))
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (not (< j@243@01 (Seq_length xs@234@01)))
  (< j@243@01 (Seq_length xs@234@01))))
(pop) ; 9
(push) ; 9
; [else-branch: 125 | !(j@243@01 >= 0)]
(assert (not (>= j@243@01 0)))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (=>
  (>= j@243@01 0)
  (and
    (>= j@243@01 0)
    (or
      (not (< j@243@01 (Seq_length xs@234@01)))
      (< j@243@01 (Seq_length xs@234@01))))))
; Joined path conditions
(assert (or (not (>= j@243@01 0)) (>= j@243@01 0)))
(pop) ; 7
(push) ; 7
; [else-branch: 124 | !(k@242@01 < |xs@234@01|)]
(assert (not (< k@242@01 (Seq_length xs@234@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (< k@242@01 (Seq_length xs@234@01))
  (and
    (< k@242@01 (Seq_length xs@234@01))
    (=>
      (>= j@243@01 0)
      (and
        (>= j@243@01 0)
        (or
          (not (< j@243@01 (Seq_length xs@234@01)))
          (< j@243@01 (Seq_length xs@234@01)))))
    (or (not (>= j@243@01 0)) (>= j@243@01 0)))))
; Joined path conditions
(assert (or
  (not (< k@242@01 (Seq_length xs@234@01)))
  (< k@242@01 (Seq_length xs@234@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 123 | !(k@242@01 >= 0)]
(assert (not (>= k@242@01 0)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (>= k@242@01 0)
  (and
    (>= k@242@01 0)
    (=>
      (< k@242@01 (Seq_length xs@234@01))
      (and
        (< k@242@01 (Seq_length xs@234@01))
        (=>
          (>= j@243@01 0)
          (and
            (>= j@243@01 0)
            (or
              (not (< j@243@01 (Seq_length xs@234@01)))
              (< j@243@01 (Seq_length xs@234@01)))))
        (or (not (>= j@243@01 0)) (>= j@243@01 0))))
    (or
      (not (< k@242@01 (Seq_length xs@234@01)))
      (< k@242@01 (Seq_length xs@234@01))))))
; Joined path conditions
(assert (or (not (>= k@242@01 0)) (>= k@242@01 0)))
(push) ; 4
; [then-branch: 127 | k@242@01 != j@243@01 && j@243@01 < |xs@234@01| && j@243@01 >= 0 && k@242@01 < |xs@234@01| && k@242@01 >= 0 | live]
; [else-branch: 127 | !(k@242@01 != j@243@01 && j@243@01 < |xs@234@01| && j@243@01 >= 0 && k@242@01 < |xs@234@01| && k@242@01 >= 0) | live]
(push) ; 5
; [then-branch: 127 | k@242@01 != j@243@01 && j@243@01 < |xs@234@01| && j@243@01 >= 0 && k@242@01 < |xs@234@01| && k@242@01 >= 0]
(assert (and
  (and
    (and
      (and (not (= k@242@01 j@243@01)) (< j@243@01 (Seq_length xs@234@01)))
      (>= j@243@01 0))
    (< k@242@01 (Seq_length xs@234@01)))
  (>= k@242@01 0)))
; [eval] xs[k] != xs[j]
; [eval] xs[k]
; [eval] xs[j]
(pop) ; 5
(push) ; 5
; [else-branch: 127 | !(k@242@01 != j@243@01 && j@243@01 < |xs@234@01| && j@243@01 >= 0 && k@242@01 < |xs@234@01| && k@242@01 >= 0)]
(assert (not
  (and
    (and
      (and
        (and (not (= k@242@01 j@243@01)) (< j@243@01 (Seq_length xs@234@01)))
        (>= j@243@01 0))
      (< k@242@01 (Seq_length xs@234@01)))
    (>= k@242@01 0))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (and
      (and
        (and (not (= k@242@01 j@243@01)) (< j@243@01 (Seq_length xs@234@01)))
        (>= j@243@01 0))
      (< k@242@01 (Seq_length xs@234@01)))
    (>= k@242@01 0))
  (and
    (not (= k@242@01 j@243@01))
    (< j@243@01 (Seq_length xs@234@01))
    (>= j@243@01 0)
    (< k@242@01 (Seq_length xs@234@01))
    (>= k@242@01 0))))
; Joined path conditions
(assert (or
  (not
    (and
      (and
        (and
          (and (not (= k@242@01 j@243@01)) (< j@243@01 (Seq_length xs@234@01)))
          (>= j@243@01 0))
        (< k@242@01 (Seq_length xs@234@01)))
      (>= k@242@01 0)))
  (and
    (and
      (and
        (and (not (= k@242@01 j@243@01)) (< j@243@01 (Seq_length xs@234@01)))
        (>= j@243@01 0))
      (< k@242@01 (Seq_length xs@234@01)))
    (>= k@242@01 0))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@242@01 Int) (j@243@01 Int)) (!
  (and
    (=>
      (>= k@242@01 0)
      (and
        (>= k@242@01 0)
        (=>
          (< k@242@01 (Seq_length xs@234@01))
          (and
            (< k@242@01 (Seq_length xs@234@01))
            (=>
              (>= j@243@01 0)
              (and
                (>= j@243@01 0)
                (or
                  (not (< j@243@01 (Seq_length xs@234@01)))
                  (< j@243@01 (Seq_length xs@234@01)))))
            (or (not (>= j@243@01 0)) (>= j@243@01 0))))
        (or
          (not (< k@242@01 (Seq_length xs@234@01)))
          (< k@242@01 (Seq_length xs@234@01)))))
    (or (not (>= k@242@01 0)) (>= k@242@01 0))
    (=>
      (and
        (and
          (and
            (and (not (= k@242@01 j@243@01)) (< j@243@01 (Seq_length xs@234@01)))
            (>= j@243@01 0))
          (< k@242@01 (Seq_length xs@234@01)))
        (>= k@242@01 0))
      (and
        (not (= k@242@01 j@243@01))
        (< j@243@01 (Seq_length xs@234@01))
        (>= j@243@01 0)
        (< k@242@01 (Seq_length xs@234@01))
        (>= k@242@01 0)))
    (or
      (not
        (and
          (and
            (and
              (and
                (not (= k@242@01 j@243@01))
                (< j@243@01 (Seq_length xs@234@01)))
              (>= j@243@01 0))
            (< k@242@01 (Seq_length xs@234@01)))
          (>= k@242@01 0)))
      (and
        (and
          (and
            (and (not (= k@242@01 j@243@01)) (< j@243@01 (Seq_length xs@234@01)))
            (>= j@243@01 0))
          (< k@242@01 (Seq_length xs@234@01)))
        (>= k@242@01 0))))
  :pattern ((Seq_index xs@234@01 k@242@01) (Seq_index xs@234@01 j@243@01))
  :qid |prog.l65-aux|)))
(assert (forall ((k@242@01 Int) (j@243@01 Int)) (!
  (=>
    (and
      (and
        (and
          (and (not (= k@242@01 j@243@01)) (< j@243@01 (Seq_length xs@234@01)))
          (>= j@243@01 0))
        (< k@242@01 (Seq_length xs@234@01)))
      (>= k@242@01 0))
    (not (= (Seq_index xs@234@01 k@242@01) (Seq_index xs@234@01 j@243@01))))
  :pattern ((Seq_index xs@234@01 k@242@01) (Seq_index xs@234@01 j@243@01))
  :qid |prog.l65|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@239@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@239@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@239@01)))))))
(declare-const j@244@01 Int)
(push) ; 3
; [eval] 0 <= j && j < 3
; [eval] 0 <= j
(push) ; 4
; [then-branch: 128 | 0 <= j@244@01 | live]
; [else-branch: 128 | !(0 <= j@244@01) | live]
(push) ; 5
; [then-branch: 128 | 0 <= j@244@01]
(assert (<= 0 j@244@01))
; [eval] j < 3
(pop) ; 5
(push) ; 5
; [else-branch: 128 | !(0 <= j@244@01)]
(assert (not (<= 0 j@244@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 j@244@01)) (<= 0 j@244@01)))
(assert (and (< j@244@01 3) (<= 0 j@244@01)))
; [eval] xs[j]
(push) ; 4
(assert (not (>= j@244@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< j@244@01 (Seq_length xs@234@01))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@245@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@244@01 Int)) (!
  (=>
    (and (< j@244@01 3) (<= 0 j@244@01))
    (or (not (<= 0 j@244@01)) (<= 0 j@244@01)))
  :pattern ((Seq_index xs@234@01 j@244@01))
  :qid |f-aux|)))
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((j@244@01 Int)) (!
  (=>
    (and (< j@244@01 3) (<= 0 j@244@01))
    (= (inv@245@01 (Seq_index xs@234@01 j@244@01)) j@244@01))
  :pattern ((Seq_index xs@234@01 j@244@01))
  :qid |quant-u-201|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@245@01 r) 3) (<= 0 (inv@245@01 r)))
    (= (Seq_index xs@234@01 (inv@245@01 r)) r))
  :pattern ((inv@245@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j@244@01 Int)) (!
  (=>
    (and (< j@244@01 3) (<= 0 j@244@01))
    (not (= (Seq_index xs@234@01 j@244@01) $Ref.null)))
  :pattern ((Seq_index xs@234@01 j@244@01))
  :qid |f-permImpliesNonNull|)))
(declare-const j@246@01 Int)
(push) ; 3
; [eval] 3 <= j && j < n
; [eval] 3 <= j
(push) ; 4
; [then-branch: 129 | 3 <= j@246@01 | live]
; [else-branch: 129 | !(3 <= j@246@01) | live]
(push) ; 5
; [then-branch: 129 | 3 <= j@246@01]
(assert (<= 3 j@246@01))
; [eval] j < n
(pop) ; 5
(push) ; 5
; [else-branch: 129 | !(3 <= j@246@01)]
(assert (not (<= 3 j@246@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 3 j@246@01)) (<= 3 j@246@01)))
(assert (and (< j@246@01 n@235@01) (<= 3 j@246@01)))
; [eval] xs[j]
(push) ; 4
(assert (not (>= j@246@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< j@246@01 (Seq_length xs@234@01))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@247@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@246@01 Int)) (!
  (=>
    (and (< j@246@01 n@235@01) (<= 3 j@246@01))
    (or (not (<= 3 j@246@01)) (<= 3 j@246@01)))
  :pattern ((Seq_index xs@234@01 j@246@01))
  :qid |f-aux|)))
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((j@246@01 Int)) (!
  (=>
    (and (< j@246@01 n@235@01) (<= 3 j@246@01))
    (= (inv@247@01 (Seq_index xs@234@01 j@246@01)) j@246@01))
  :pattern ((Seq_index xs@234@01 j@246@01))
  :qid |quant-u-203|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@247@01 r) n@235@01) (<= 3 (inv@247@01 r)))
    (= (Seq_index xs@234@01 (inv@247@01 r)) r))
  :pattern ((inv@247@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j@246@01 Int)) (!
  (=>
    (and (< j@246@01 n@235@01) (<= 3 j@246@01))
    (not (= (Seq_index xs@234@01 j@246@01) $Ref.null)))
  :pattern ((Seq_index xs@234@01 j@246@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (P02%trigger $t@239@01 xs@234@01 n@235@01))
; [exec]
; v1 := xs[i].f
; [eval] xs[i]
(set-option :timeout 0)
(push) ; 3
(assert (not (>= i@236@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@236@01 (Seq_length xs@234@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const sm@248@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@247@01 r) n@235@01) (<= 3 (inv@247@01 r)))
    (=
      ($FVF.lookup_f (as sm@248@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@239@01))))) r)))
  :pattern (($FVF.lookup_f (as sm@248@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@239@01))))) r))
  :qid |qp.fvfValDef113|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@245@01 r) 3) (<= 0 (inv@245@01 r)))
    (=
      ($FVF.lookup_f (as sm@248@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@239@01))))) r)))
  :pattern (($FVF.lookup_f (as sm@248@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@239@01))))) r))
  :qid |qp.fvfValDef114|)))
(declare-const pm@249@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@249@01  $FPM) r)
    (+
      (ite
        (and (< (inv@247@01 r) n@235@01) (<= 3 (inv@247@01 r)))
        $Perm.Write
        $Perm.No)
      (ite (and (< (inv@245@01 r) 3) (<= 0 (inv@245@01 r))) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@249@01  $FPM) r))
  :qid |qp.resPrmSumDef115|)))
(push) ; 3
(assert (not (< $Perm.No ($FVF.perm_f (as pm@249@01  $FPM) (Seq_index xs@234@01 i@236@01)))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const v1@250@01 Int)
(assert (=
  v1@250@01
  ($FVF.lookup_f (as sm@248@01  $FVF<f>) (Seq_index xs@234@01 i@236@01))))
; [exec]
; fold acc(P02(xs, n), write)
; [eval] |xs| == n
; [eval] |xs|
; [eval] 3 <= n
; [eval] (forall k: Int, j: Int :: { xs[k], xs[j] } k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==> xs[k] != xs[j])
(declare-const k@251@01 Int)
(declare-const j@252@01 Int)
(push) ; 3
; [eval] k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==> xs[k] != xs[j]
; [eval] k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j)))
; [eval] k >= 0
(push) ; 4
; [then-branch: 130 | k@251@01 >= 0 | live]
; [else-branch: 130 | !(k@251@01 >= 0) | live]
(push) ; 5
; [then-branch: 130 | k@251@01 >= 0]
(assert (>= k@251@01 0))
; [eval] k < |xs|
; [eval] |xs|
(push) ; 6
; [then-branch: 131 | k@251@01 < |xs@234@01| | live]
; [else-branch: 131 | !(k@251@01 < |xs@234@01|) | live]
(push) ; 7
; [then-branch: 131 | k@251@01 < |xs@234@01|]
(assert (< k@251@01 (Seq_length xs@234@01)))
; [eval] j >= 0
(push) ; 8
; [then-branch: 132 | j@252@01 >= 0 | live]
; [else-branch: 132 | !(j@252@01 >= 0) | live]
(push) ; 9
; [then-branch: 132 | j@252@01 >= 0]
(assert (>= j@252@01 0))
; [eval] j < |xs|
; [eval] |xs|
(push) ; 10
; [then-branch: 133 | j@252@01 < |xs@234@01| | live]
; [else-branch: 133 | !(j@252@01 < |xs@234@01|) | live]
(push) ; 11
; [then-branch: 133 | j@252@01 < |xs@234@01|]
(assert (< j@252@01 (Seq_length xs@234@01)))
; [eval] k != j
(pop) ; 11
(push) ; 11
; [else-branch: 133 | !(j@252@01 < |xs@234@01|)]
(assert (not (< j@252@01 (Seq_length xs@234@01))))
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (not (< j@252@01 (Seq_length xs@234@01)))
  (< j@252@01 (Seq_length xs@234@01))))
(pop) ; 9
(push) ; 9
; [else-branch: 132 | !(j@252@01 >= 0)]
(assert (not (>= j@252@01 0)))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (=>
  (>= j@252@01 0)
  (and
    (>= j@252@01 0)
    (or
      (not (< j@252@01 (Seq_length xs@234@01)))
      (< j@252@01 (Seq_length xs@234@01))))))
; Joined path conditions
(assert (or (not (>= j@252@01 0)) (>= j@252@01 0)))
(pop) ; 7
(push) ; 7
; [else-branch: 131 | !(k@251@01 < |xs@234@01|)]
(assert (not (< k@251@01 (Seq_length xs@234@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (< k@251@01 (Seq_length xs@234@01))
  (and
    (< k@251@01 (Seq_length xs@234@01))
    (=>
      (>= j@252@01 0)
      (and
        (>= j@252@01 0)
        (or
          (not (< j@252@01 (Seq_length xs@234@01)))
          (< j@252@01 (Seq_length xs@234@01)))))
    (or (not (>= j@252@01 0)) (>= j@252@01 0)))))
; Joined path conditions
(assert (or
  (not (< k@251@01 (Seq_length xs@234@01)))
  (< k@251@01 (Seq_length xs@234@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 130 | !(k@251@01 >= 0)]
(assert (not (>= k@251@01 0)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (>= k@251@01 0)
  (and
    (>= k@251@01 0)
    (=>
      (< k@251@01 (Seq_length xs@234@01))
      (and
        (< k@251@01 (Seq_length xs@234@01))
        (=>
          (>= j@252@01 0)
          (and
            (>= j@252@01 0)
            (or
              (not (< j@252@01 (Seq_length xs@234@01)))
              (< j@252@01 (Seq_length xs@234@01)))))
        (or (not (>= j@252@01 0)) (>= j@252@01 0))))
    (or
      (not (< k@251@01 (Seq_length xs@234@01)))
      (< k@251@01 (Seq_length xs@234@01))))))
; Joined path conditions
(assert (or (not (>= k@251@01 0)) (>= k@251@01 0)))
(push) ; 4
; [then-branch: 134 | k@251@01 != j@252@01 && j@252@01 < |xs@234@01| && j@252@01 >= 0 && k@251@01 < |xs@234@01| && k@251@01 >= 0 | live]
; [else-branch: 134 | !(k@251@01 != j@252@01 && j@252@01 < |xs@234@01| && j@252@01 >= 0 && k@251@01 < |xs@234@01| && k@251@01 >= 0) | live]
(push) ; 5
; [then-branch: 134 | k@251@01 != j@252@01 && j@252@01 < |xs@234@01| && j@252@01 >= 0 && k@251@01 < |xs@234@01| && k@251@01 >= 0]
(assert (and
  (and
    (and
      (and (not (= k@251@01 j@252@01)) (< j@252@01 (Seq_length xs@234@01)))
      (>= j@252@01 0))
    (< k@251@01 (Seq_length xs@234@01)))
  (>= k@251@01 0)))
; [eval] xs[k] != xs[j]
; [eval] xs[k]
; [eval] xs[j]
(pop) ; 5
(push) ; 5
; [else-branch: 134 | !(k@251@01 != j@252@01 && j@252@01 < |xs@234@01| && j@252@01 >= 0 && k@251@01 < |xs@234@01| && k@251@01 >= 0)]
(assert (not
  (and
    (and
      (and
        (and (not (= k@251@01 j@252@01)) (< j@252@01 (Seq_length xs@234@01)))
        (>= j@252@01 0))
      (< k@251@01 (Seq_length xs@234@01)))
    (>= k@251@01 0))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (and
      (and
        (and (not (= k@251@01 j@252@01)) (< j@252@01 (Seq_length xs@234@01)))
        (>= j@252@01 0))
      (< k@251@01 (Seq_length xs@234@01)))
    (>= k@251@01 0))
  (and
    (not (= k@251@01 j@252@01))
    (< j@252@01 (Seq_length xs@234@01))
    (>= j@252@01 0)
    (< k@251@01 (Seq_length xs@234@01))
    (>= k@251@01 0))))
; Joined path conditions
(assert (or
  (not
    (and
      (and
        (and
          (and (not (= k@251@01 j@252@01)) (< j@252@01 (Seq_length xs@234@01)))
          (>= j@252@01 0))
        (< k@251@01 (Seq_length xs@234@01)))
      (>= k@251@01 0)))
  (and
    (and
      (and
        (and (not (= k@251@01 j@252@01)) (< j@252@01 (Seq_length xs@234@01)))
        (>= j@252@01 0))
      (< k@251@01 (Seq_length xs@234@01)))
    (>= k@251@01 0))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@251@01 Int) (j@252@01 Int)) (!
  (and
    (=>
      (>= k@251@01 0)
      (and
        (>= k@251@01 0)
        (=>
          (< k@251@01 (Seq_length xs@234@01))
          (and
            (< k@251@01 (Seq_length xs@234@01))
            (=>
              (>= j@252@01 0)
              (and
                (>= j@252@01 0)
                (or
                  (not (< j@252@01 (Seq_length xs@234@01)))
                  (< j@252@01 (Seq_length xs@234@01)))))
            (or (not (>= j@252@01 0)) (>= j@252@01 0))))
        (or
          (not (< k@251@01 (Seq_length xs@234@01)))
          (< k@251@01 (Seq_length xs@234@01)))))
    (or (not (>= k@251@01 0)) (>= k@251@01 0))
    (=>
      (and
        (and
          (and
            (and (not (= k@251@01 j@252@01)) (< j@252@01 (Seq_length xs@234@01)))
            (>= j@252@01 0))
          (< k@251@01 (Seq_length xs@234@01)))
        (>= k@251@01 0))
      (and
        (not (= k@251@01 j@252@01))
        (< j@252@01 (Seq_length xs@234@01))
        (>= j@252@01 0)
        (< k@251@01 (Seq_length xs@234@01))
        (>= k@251@01 0)))
    (or
      (not
        (and
          (and
            (and
              (and
                (not (= k@251@01 j@252@01))
                (< j@252@01 (Seq_length xs@234@01)))
              (>= j@252@01 0))
            (< k@251@01 (Seq_length xs@234@01)))
          (>= k@251@01 0)))
      (and
        (and
          (and
            (and (not (= k@251@01 j@252@01)) (< j@252@01 (Seq_length xs@234@01)))
            (>= j@252@01 0))
          (< k@251@01 (Seq_length xs@234@01)))
        (>= k@251@01 0))))
  :pattern ((Seq_index xs@234@01 k@251@01) (Seq_index xs@234@01 j@252@01))
  :qid |prog.l65-aux|)))
(push) ; 3
(assert (not (forall ((k@251@01 Int) (j@252@01 Int)) (!
  (=>
    (and
      (and
        (and
          (and (not (= k@251@01 j@252@01)) (< j@252@01 (Seq_length xs@234@01)))
          (>= j@252@01 0))
        (< k@251@01 (Seq_length xs@234@01)))
      (>= k@251@01 0))
    (not (= (Seq_index xs@234@01 k@251@01) (Seq_index xs@234@01 j@252@01))))
  :pattern ((Seq_index xs@234@01 k@251@01) (Seq_index xs@234@01 j@252@01))
  :qid |prog.l65|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (forall ((k@251@01 Int) (j@252@01 Int)) (!
  (=>
    (and
      (and
        (and
          (and (not (= k@251@01 j@252@01)) (< j@252@01 (Seq_length xs@234@01)))
          (>= j@252@01 0))
        (< k@251@01 (Seq_length xs@234@01)))
      (>= k@251@01 0))
    (not (= (Seq_index xs@234@01 k@251@01) (Seq_index xs@234@01 j@252@01))))
  :pattern ((Seq_index xs@234@01 k@251@01) (Seq_index xs@234@01 j@252@01))
  :qid |prog.l65|)))
(declare-const j@253@01 Int)
(push) ; 3
; [eval] 0 <= j && j < 3
; [eval] 0 <= j
(push) ; 4
; [then-branch: 135 | 0 <= j@253@01 | live]
; [else-branch: 135 | !(0 <= j@253@01) | live]
(push) ; 5
; [then-branch: 135 | 0 <= j@253@01]
(assert (<= 0 j@253@01))
; [eval] j < 3
(pop) ; 5
(push) ; 5
; [else-branch: 135 | !(0 <= j@253@01)]
(assert (not (<= 0 j@253@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 j@253@01)) (<= 0 j@253@01)))
(assert (and (< j@253@01 3) (<= 0 j@253@01)))
; [eval] xs[j]
(push) ; 4
(assert (not (>= j@253@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< j@253@01 (Seq_length xs@234@01))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@254@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@253@01 Int)) (!
  (=>
    (and (< j@253@01 3) (<= 0 j@253@01))
    (or (not (<= 0 j@253@01)) (<= 0 j@253@01)))
  :pattern ((Seq_index xs@234@01 j@253@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j1@253@01 Int) (j2@253@01 Int)) (!
  (=>
    (and
      (and (< j1@253@01 3) (<= 0 j1@253@01))
      (and (< j2@253@01 3) (<= 0 j2@253@01))
      (= (Seq_index xs@234@01 j1@253@01) (Seq_index xs@234@01 j2@253@01)))
    (= j1@253@01 j2@253@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@253@01 Int)) (!
  (=>
    (and (< j@253@01 3) (<= 0 j@253@01))
    (= (inv@254@01 (Seq_index xs@234@01 j@253@01)) j@253@01))
  :pattern ((Seq_index xs@234@01 j@253@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@254@01 r) 3) (<= 0 (inv@254@01 r)))
    (= (Seq_index xs@234@01 (inv@254@01 r)) r))
  :pattern ((inv@254@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@255@01 ((r $Ref)) $Perm
  (ite
    (and (< (inv@254@01 r) 3) (<= 0 (inv@254@01 r)))
    ($Perm.min
      (ite
        (and (< (inv@247@01 r) n@235@01) (<= 3 (inv@247@01 r)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@256@01 ((r $Ref)) $Perm
  (ite
    (and (< (inv@254@01 r) 3) (<= 0 (inv@254@01 r)))
    ($Perm.min
      (ite (and (< (inv@245@01 r) 3) (<= 0 (inv@245@01 r))) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@255@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (< (inv@247@01 r) n@235@01) (<= 3 (inv@247@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@255@01 r))
    $Perm.No)
  
  :qid |quant-u-206|))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (< (inv@254@01 r) 3) (<= 0 (inv@254@01 r)))
    (= (- $Perm.Write (pTaken@255@01 r)) $Perm.No))
  
  :qid |quant-u-207|))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite (and (< (inv@245@01 r) 3) (<= 0 (inv@245@01 r))) $Perm.Write $Perm.No)
      (pTaken@256@01 r))
    $Perm.No)
  
  :qid |quant-u-208|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (< (inv@254@01 r) 3) (<= 0 (inv@254@01 r)))
    (= (- (- $Perm.Write (pTaken@255@01 r)) (pTaken@256@01 r)) $Perm.No))
  
  :qid |quant-u-209|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@257@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@257@01  $FVF<f>)))
      (and (< (inv@254@01 r) 3) (<= 0 (inv@254@01 r))))
    (=>
      (and (< (inv@254@01 r) 3) (<= 0 (inv@254@01 r)))
      (Set_in r ($FVF.domain_f (as sm@257@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@257@01  $FVF<f>))))
  :qid |qp.fvfDomDef118|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@254@01 r) 3) (<= 0 (inv@254@01 r)))
      (and (< (inv@247@01 r) n@235@01) (<= 3 (inv@247@01 r))))
    (=
      ($FVF.lookup_f (as sm@257@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@239@01))))) r)))
  :pattern (($FVF.lookup_f (as sm@257@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@239@01))))) r))
  :qid |qp.fvfValDef116|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@254@01 r) 3) (<= 0 (inv@254@01 r)))
      (and (< (inv@245@01 r) 3) (<= 0 (inv@245@01 r))))
    (=
      ($FVF.lookup_f (as sm@257@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@239@01))))) r)))
  :pattern (($FVF.lookup_f (as sm@257@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@239@01))))) r))
  :qid |qp.fvfValDef117|)))
(declare-const j@258@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 3 <= j && j < n
; [eval] 3 <= j
(push) ; 4
; [then-branch: 136 | 3 <= j@258@01 | live]
; [else-branch: 136 | !(3 <= j@258@01) | live]
(push) ; 5
; [then-branch: 136 | 3 <= j@258@01]
(assert (<= 3 j@258@01))
; [eval] j < n
(pop) ; 5
(push) ; 5
; [else-branch: 136 | !(3 <= j@258@01)]
(assert (not (<= 3 j@258@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 3 j@258@01)) (<= 3 j@258@01)))
(assert (and (< j@258@01 n@235@01) (<= 3 j@258@01)))
; [eval] xs[j]
(push) ; 4
(assert (not (>= j@258@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< j@258@01 (Seq_length xs@234@01))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@259@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@258@01 Int)) (!
  (=>
    (and (< j@258@01 n@235@01) (<= 3 j@258@01))
    (or (not (<= 3 j@258@01)) (<= 3 j@258@01)))
  :pattern ((Seq_index xs@234@01 j@258@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j1@258@01 Int) (j2@258@01 Int)) (!
  (=>
    (and
      (and (< j1@258@01 n@235@01) (<= 3 j1@258@01))
      (and (< j2@258@01 n@235@01) (<= 3 j2@258@01))
      (= (Seq_index xs@234@01 j1@258@01) (Seq_index xs@234@01 j2@258@01)))
    (= j1@258@01 j2@258@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@258@01 Int)) (!
  (=>
    (and (< j@258@01 n@235@01) (<= 3 j@258@01))
    (= (inv@259@01 (Seq_index xs@234@01 j@258@01)) j@258@01))
  :pattern ((Seq_index xs@234@01 j@258@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@259@01 r) n@235@01) (<= 3 (inv@259@01 r)))
    (= (Seq_index xs@234@01 (inv@259@01 r)) r))
  :pattern ((inv@259@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@260@01 ((r $Ref)) $Perm
  (ite
    (and (< (inv@259@01 r) n@235@01) (<= 3 (inv@259@01 r)))
    ($Perm.min
      (-
        (ite
          (and (< (inv@247@01 r) n@235@01) (<= 3 (inv@247@01 r)))
          $Perm.Write
          $Perm.No)
        (pTaken@255@01 r))
      $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (-
        (ite
          (and (< (inv@247@01 r) n@235@01) (<= 3 (inv@247@01 r)))
          $Perm.Write
          $Perm.No)
        (pTaken@255@01 r))
      (pTaken@260@01 r))
    $Perm.No)
  
  :qid |quant-u-212|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (< (inv@259@01 r) n@235@01) (<= 3 (inv@259@01 r)))
    (= (- $Perm.Write (pTaken@260@01 r)) $Perm.No))
  
  :qid |quant-u-213|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@261@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@261@01  $FVF<f>)))
      (and (< (inv@259@01 r) n@235@01) (<= 3 (inv@259@01 r))))
    (=>
      (and (< (inv@259@01 r) n@235@01) (<= 3 (inv@259@01 r)))
      (Set_in r ($FVF.domain_f (as sm@261@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@261@01  $FVF<f>))))
  :qid |qp.fvfDomDef120|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@259@01 r) n@235@01) (<= 3 (inv@259@01 r)))
      (<
        $Perm.No
        (-
          (ite
            (and (< (inv@247@01 r) n@235@01) (<= 3 (inv@247@01 r)))
            $Perm.Write
            $Perm.No)
          (pTaken@255@01 r))))
    (=
      ($FVF.lookup_f (as sm@261@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@239@01))))) r)))
  :pattern (($FVF.lookup_f (as sm@261@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@239@01))))) r))
  :qid |qp.fvfValDef119|)))
(assert (P02%trigger ($Snap.combine
  $Snap.unit
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$FVF<f>To$Snap (as sm@257@01  $FVF<f>))
        ($SortWrappers.$FVF<f>To$Snap (as sm@261@01  $FVF<f>)))))) xs@234@01 n@235@01))
; [exec]
; assert v1 == fun06(xs, n, i)
; [eval] v1 == fun06(xs, n, i)
; [eval] fun06(xs, n, i)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 < i
(push) ; 4
(assert (not (< 0 i@236@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (< 0 i@236@01))
; [eval] i < n
(push) ; 4
(assert (not (< i@236@01 n@235@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (< i@236@01 n@235@01))
(assert (fun06%precondition ($Snap.combine
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$FVF<f>To$Snap (as sm@257@01  $FVF<f>))
          ($SortWrappers.$FVF<f>To$Snap (as sm@261@01  $FVF<f>))))))
  ($Snap.combine $Snap.unit $Snap.unit)) xs@234@01 n@235@01 i@236@01))
(pop) ; 3
; Joined path conditions
(assert (and
  (< 0 i@236@01)
  (< i@236@01 n@235@01)
  (fun06%precondition ($Snap.combine
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.$FVF<f>To$Snap (as sm@257@01  $FVF<f>))
            ($SortWrappers.$FVF<f>To$Snap (as sm@261@01  $FVF<f>))))))
    ($Snap.combine $Snap.unit $Snap.unit)) xs@234@01 n@235@01 i@236@01)))
(push) ; 3
(assert (not (=
  v1@250@01
  (fun06 ($Snap.combine
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.$FVF<f>To$Snap (as sm@257@01  $FVF<f>))
            ($SortWrappers.$FVF<f>To$Snap (as sm@261@01  $FVF<f>))))))
    ($Snap.combine $Snap.unit $Snap.unit)) xs@234@01 n@235@01 i@236@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (=
  v1@250@01
  (fun06 ($Snap.combine
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.$FVF<f>To$Snap (as sm@257@01  $FVF<f>))
            ($SortWrappers.$FVF<f>To$Snap (as sm@261@01  $FVF<f>))))))
    ($Snap.combine $Snap.unit $Snap.unit)) xs@234@01 n@235@01 i@236@01)))
; [exec]
; unfold acc(P02(xs, n), write)
; [eval] |xs| == n
; [eval] |xs|
; [eval] 3 <= n
; [eval] (forall k: Int, j: Int :: { xs[k], xs[j] } k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==> xs[k] != xs[j])
(declare-const k@262@01 Int)
(declare-const j@263@01 Int)
(push) ; 3
; [eval] k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==> xs[k] != xs[j]
; [eval] k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j)))
; [eval] k >= 0
(push) ; 4
; [then-branch: 137 | k@262@01 >= 0 | live]
; [else-branch: 137 | !(k@262@01 >= 0) | live]
(push) ; 5
; [then-branch: 137 | k@262@01 >= 0]
(assert (>= k@262@01 0))
; [eval] k < |xs|
; [eval] |xs|
(push) ; 6
; [then-branch: 138 | k@262@01 < |xs@234@01| | live]
; [else-branch: 138 | !(k@262@01 < |xs@234@01|) | live]
(push) ; 7
; [then-branch: 138 | k@262@01 < |xs@234@01|]
(assert (< k@262@01 (Seq_length xs@234@01)))
; [eval] j >= 0
(push) ; 8
; [then-branch: 139 | j@263@01 >= 0 | live]
; [else-branch: 139 | !(j@263@01 >= 0) | live]
(push) ; 9
; [then-branch: 139 | j@263@01 >= 0]
(assert (>= j@263@01 0))
; [eval] j < |xs|
; [eval] |xs|
(push) ; 10
; [then-branch: 140 | j@263@01 < |xs@234@01| | live]
; [else-branch: 140 | !(j@263@01 < |xs@234@01|) | live]
(push) ; 11
; [then-branch: 140 | j@263@01 < |xs@234@01|]
(assert (< j@263@01 (Seq_length xs@234@01)))
; [eval] k != j
(pop) ; 11
(push) ; 11
; [else-branch: 140 | !(j@263@01 < |xs@234@01|)]
(assert (not (< j@263@01 (Seq_length xs@234@01))))
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (not (< j@263@01 (Seq_length xs@234@01)))
  (< j@263@01 (Seq_length xs@234@01))))
(pop) ; 9
(push) ; 9
; [else-branch: 139 | !(j@263@01 >= 0)]
(assert (not (>= j@263@01 0)))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (=>
  (>= j@263@01 0)
  (and
    (>= j@263@01 0)
    (or
      (not (< j@263@01 (Seq_length xs@234@01)))
      (< j@263@01 (Seq_length xs@234@01))))))
; Joined path conditions
(assert (or (not (>= j@263@01 0)) (>= j@263@01 0)))
(pop) ; 7
(push) ; 7
; [else-branch: 138 | !(k@262@01 < |xs@234@01|)]
(assert (not (< k@262@01 (Seq_length xs@234@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (< k@262@01 (Seq_length xs@234@01))
  (and
    (< k@262@01 (Seq_length xs@234@01))
    (=>
      (>= j@263@01 0)
      (and
        (>= j@263@01 0)
        (or
          (not (< j@263@01 (Seq_length xs@234@01)))
          (< j@263@01 (Seq_length xs@234@01)))))
    (or (not (>= j@263@01 0)) (>= j@263@01 0)))))
; Joined path conditions
(assert (or
  (not (< k@262@01 (Seq_length xs@234@01)))
  (< k@262@01 (Seq_length xs@234@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 137 | !(k@262@01 >= 0)]
(assert (not (>= k@262@01 0)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (>= k@262@01 0)
  (and
    (>= k@262@01 0)
    (=>
      (< k@262@01 (Seq_length xs@234@01))
      (and
        (< k@262@01 (Seq_length xs@234@01))
        (=>
          (>= j@263@01 0)
          (and
            (>= j@263@01 0)
            (or
              (not (< j@263@01 (Seq_length xs@234@01)))
              (< j@263@01 (Seq_length xs@234@01)))))
        (or (not (>= j@263@01 0)) (>= j@263@01 0))))
    (or
      (not (< k@262@01 (Seq_length xs@234@01)))
      (< k@262@01 (Seq_length xs@234@01))))))
; Joined path conditions
(assert (or (not (>= k@262@01 0)) (>= k@262@01 0)))
(push) ; 4
; [then-branch: 141 | k@262@01 != j@263@01 && j@263@01 < |xs@234@01| && j@263@01 >= 0 && k@262@01 < |xs@234@01| && k@262@01 >= 0 | live]
; [else-branch: 141 | !(k@262@01 != j@263@01 && j@263@01 < |xs@234@01| && j@263@01 >= 0 && k@262@01 < |xs@234@01| && k@262@01 >= 0) | live]
(push) ; 5
; [then-branch: 141 | k@262@01 != j@263@01 && j@263@01 < |xs@234@01| && j@263@01 >= 0 && k@262@01 < |xs@234@01| && k@262@01 >= 0]
(assert (and
  (and
    (and
      (and (not (= k@262@01 j@263@01)) (< j@263@01 (Seq_length xs@234@01)))
      (>= j@263@01 0))
    (< k@262@01 (Seq_length xs@234@01)))
  (>= k@262@01 0)))
; [eval] xs[k] != xs[j]
; [eval] xs[k]
; [eval] xs[j]
(pop) ; 5
(push) ; 5
; [else-branch: 141 | !(k@262@01 != j@263@01 && j@263@01 < |xs@234@01| && j@263@01 >= 0 && k@262@01 < |xs@234@01| && k@262@01 >= 0)]
(assert (not
  (and
    (and
      (and
        (and (not (= k@262@01 j@263@01)) (< j@263@01 (Seq_length xs@234@01)))
        (>= j@263@01 0))
      (< k@262@01 (Seq_length xs@234@01)))
    (>= k@262@01 0))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (and
      (and
        (and (not (= k@262@01 j@263@01)) (< j@263@01 (Seq_length xs@234@01)))
        (>= j@263@01 0))
      (< k@262@01 (Seq_length xs@234@01)))
    (>= k@262@01 0))
  (and
    (not (= k@262@01 j@263@01))
    (< j@263@01 (Seq_length xs@234@01))
    (>= j@263@01 0)
    (< k@262@01 (Seq_length xs@234@01))
    (>= k@262@01 0))))
; Joined path conditions
(assert (or
  (not
    (and
      (and
        (and
          (and (not (= k@262@01 j@263@01)) (< j@263@01 (Seq_length xs@234@01)))
          (>= j@263@01 0))
        (< k@262@01 (Seq_length xs@234@01)))
      (>= k@262@01 0)))
  (and
    (and
      (and
        (and (not (= k@262@01 j@263@01)) (< j@263@01 (Seq_length xs@234@01)))
        (>= j@263@01 0))
      (< k@262@01 (Seq_length xs@234@01)))
    (>= k@262@01 0))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@262@01 Int) (j@263@01 Int)) (!
  (and
    (=>
      (>= k@262@01 0)
      (and
        (>= k@262@01 0)
        (=>
          (< k@262@01 (Seq_length xs@234@01))
          (and
            (< k@262@01 (Seq_length xs@234@01))
            (=>
              (>= j@263@01 0)
              (and
                (>= j@263@01 0)
                (or
                  (not (< j@263@01 (Seq_length xs@234@01)))
                  (< j@263@01 (Seq_length xs@234@01)))))
            (or (not (>= j@263@01 0)) (>= j@263@01 0))))
        (or
          (not (< k@262@01 (Seq_length xs@234@01)))
          (< k@262@01 (Seq_length xs@234@01)))))
    (or (not (>= k@262@01 0)) (>= k@262@01 0))
    (=>
      (and
        (and
          (and
            (and (not (= k@262@01 j@263@01)) (< j@263@01 (Seq_length xs@234@01)))
            (>= j@263@01 0))
          (< k@262@01 (Seq_length xs@234@01)))
        (>= k@262@01 0))
      (and
        (not (= k@262@01 j@263@01))
        (< j@263@01 (Seq_length xs@234@01))
        (>= j@263@01 0)
        (< k@262@01 (Seq_length xs@234@01))
        (>= k@262@01 0)))
    (or
      (not
        (and
          (and
            (and
              (and
                (not (= k@262@01 j@263@01))
                (< j@263@01 (Seq_length xs@234@01)))
              (>= j@263@01 0))
            (< k@262@01 (Seq_length xs@234@01)))
          (>= k@262@01 0)))
      (and
        (and
          (and
            (and (not (= k@262@01 j@263@01)) (< j@263@01 (Seq_length xs@234@01)))
            (>= j@263@01 0))
          (< k@262@01 (Seq_length xs@234@01)))
        (>= k@262@01 0))))
  :pattern ((Seq_index xs@234@01 k@262@01) (Seq_index xs@234@01 j@263@01))
  :qid |prog.l65-aux|)))
(assert (forall ((k@262@01 Int) (j@263@01 Int)) (!
  (=>
    (and
      (and
        (and
          (and (not (= k@262@01 j@263@01)) (< j@263@01 (Seq_length xs@234@01)))
          (>= j@263@01 0))
        (< k@262@01 (Seq_length xs@234@01)))
      (>= k@262@01 0))
    (not (= (Seq_index xs@234@01 k@262@01) (Seq_index xs@234@01 j@263@01))))
  :pattern ((Seq_index xs@234@01 k@262@01) (Seq_index xs@234@01 j@263@01))
  :qid |prog.l65|)))
(declare-const j@264@01 Int)
(push) ; 3
; [eval] 0 <= j && j < 3
; [eval] 0 <= j
(push) ; 4
; [then-branch: 142 | 0 <= j@264@01 | live]
; [else-branch: 142 | !(0 <= j@264@01) | live]
(push) ; 5
; [then-branch: 142 | 0 <= j@264@01]
(assert (<= 0 j@264@01))
; [eval] j < 3
(pop) ; 5
(push) ; 5
; [else-branch: 142 | !(0 <= j@264@01)]
(assert (not (<= 0 j@264@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 j@264@01)) (<= 0 j@264@01)))
(assert (and (< j@264@01 3) (<= 0 j@264@01)))
; [eval] xs[j]
(push) ; 4
(assert (not (>= j@264@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< j@264@01 (Seq_length xs@234@01))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@265@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@264@01 Int)) (!
  (=>
    (and (< j@264@01 3) (<= 0 j@264@01))
    (or (not (<= 0 j@264@01)) (<= 0 j@264@01)))
  :pattern ((Seq_index xs@234@01 j@264@01))
  :qid |f-aux|)))
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((j@264@01 Int)) (!
  (=>
    (and (< j@264@01 3) (<= 0 j@264@01))
    (= (inv@265@01 (Seq_index xs@234@01 j@264@01)) j@264@01))
  :pattern ((Seq_index xs@234@01 j@264@01))
  :qid |quant-u-215|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@265@01 r) 3) (<= 0 (inv@265@01 r)))
    (= (Seq_index xs@234@01 (inv@265@01 r)) r))
  :pattern ((inv@265@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j@264@01 Int)) (!
  (=>
    (and (< j@264@01 3) (<= 0 j@264@01))
    (not (= (Seq_index xs@234@01 j@264@01) $Ref.null)))
  :pattern ((Seq_index xs@234@01 j@264@01))
  :qid |f-permImpliesNonNull|)))
(declare-const j@266@01 Int)
(push) ; 3
; [eval] 3 <= j && j < n
; [eval] 3 <= j
(push) ; 4
; [then-branch: 143 | 3 <= j@266@01 | live]
; [else-branch: 143 | !(3 <= j@266@01) | live]
(push) ; 5
; [then-branch: 143 | 3 <= j@266@01]
(assert (<= 3 j@266@01))
; [eval] j < n
(pop) ; 5
(push) ; 5
; [else-branch: 143 | !(3 <= j@266@01)]
(assert (not (<= 3 j@266@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 3 j@266@01)) (<= 3 j@266@01)))
(assert (and (< j@266@01 n@235@01) (<= 3 j@266@01)))
; [eval] xs[j]
(push) ; 4
(assert (not (>= j@266@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< j@266@01 (Seq_length xs@234@01))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@267@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@266@01 Int)) (!
  (=>
    (and (< j@266@01 n@235@01) (<= 3 j@266@01))
    (or (not (<= 3 j@266@01)) (<= 3 j@266@01)))
  :pattern ((Seq_index xs@234@01 j@266@01))
  :qid |f-aux|)))
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((j@266@01 Int)) (!
  (=>
    (and (< j@266@01 n@235@01) (<= 3 j@266@01))
    (= (inv@267@01 (Seq_index xs@234@01 j@266@01)) j@266@01))
  :pattern ((Seq_index xs@234@01 j@266@01))
  :qid |quant-u-217|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@267@01 r) n@235@01) (<= 3 (inv@267@01 r)))
    (= (Seq_index xs@234@01 (inv@267@01 r)) r))
  :pattern ((inv@267@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j@266@01 Int)) (!
  (=>
    (and (< j@266@01 n@235@01) (<= 3 j@266@01))
    (not (= (Seq_index xs@234@01 j@266@01) $Ref.null)))
  :pattern ((Seq_index xs@234@01 j@266@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
; [exec]
; xs[i].f := 0
; [eval] xs[i]
(set-option :timeout 0)
(push) ; 3
(assert (not (>= i@236@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@236@01 (Seq_length xs@234@01))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@268@01 ((r $Ref)) $Perm
  (ite
    (= r (Seq_index xs@234@01 i@236@01))
    ($Perm.min
      (ite
        (and (< (inv@267@01 r) n@235@01) (<= 3 (inv@267@01 r)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@269@01 ((r $Ref)) $Perm
  (ite
    (= r (Seq_index xs@234@01 i@236@01))
    ($Perm.min
      (ite (and (< (inv@265@01 r) 3) (<= 0 (inv@265@01 r))) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@268@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (< (inv@267@01 r) n@235@01) (<= 3 (inv@267@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@268@01 r))
    $Perm.No)
  
  :qid |quant-u-219|))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@234@01 i@236@01))
    (= (- $Perm.Write (pTaken@268@01 r)) $Perm.No))
  
  :qid |quant-u-220|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@270@01 $FVF<f>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_f (as sm@270@01  $FVF<f>) (Seq_index xs@234@01 i@236@01)) 0))
; [exec]
; fold acc(P02(xs, n), write)
; [eval] |xs| == n
; [eval] |xs|
; [eval] 3 <= n
; [eval] (forall k: Int, j: Int :: { xs[k], xs[j] } k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==> xs[k] != xs[j])
(declare-const k@271@01 Int)
(declare-const j@272@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==> xs[k] != xs[j]
; [eval] k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j)))
; [eval] k >= 0
(push) ; 4
; [then-branch: 144 | k@271@01 >= 0 | live]
; [else-branch: 144 | !(k@271@01 >= 0) | live]
(push) ; 5
; [then-branch: 144 | k@271@01 >= 0]
(assert (>= k@271@01 0))
; [eval] k < |xs|
; [eval] |xs|
(push) ; 6
; [then-branch: 145 | k@271@01 < |xs@234@01| | live]
; [else-branch: 145 | !(k@271@01 < |xs@234@01|) | live]
(push) ; 7
; [then-branch: 145 | k@271@01 < |xs@234@01|]
(assert (< k@271@01 (Seq_length xs@234@01)))
; [eval] j >= 0
(push) ; 8
; [then-branch: 146 | j@272@01 >= 0 | live]
; [else-branch: 146 | !(j@272@01 >= 0) | live]
(push) ; 9
; [then-branch: 146 | j@272@01 >= 0]
(assert (>= j@272@01 0))
; [eval] j < |xs|
; [eval] |xs|
(push) ; 10
; [then-branch: 147 | j@272@01 < |xs@234@01| | live]
; [else-branch: 147 | !(j@272@01 < |xs@234@01|) | live]
(push) ; 11
; [then-branch: 147 | j@272@01 < |xs@234@01|]
(assert (< j@272@01 (Seq_length xs@234@01)))
; [eval] k != j
(pop) ; 11
(push) ; 11
; [else-branch: 147 | !(j@272@01 < |xs@234@01|)]
(assert (not (< j@272@01 (Seq_length xs@234@01))))
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (not (< j@272@01 (Seq_length xs@234@01)))
  (< j@272@01 (Seq_length xs@234@01))))
(pop) ; 9
(push) ; 9
; [else-branch: 146 | !(j@272@01 >= 0)]
(assert (not (>= j@272@01 0)))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (=>
  (>= j@272@01 0)
  (and
    (>= j@272@01 0)
    (or
      (not (< j@272@01 (Seq_length xs@234@01)))
      (< j@272@01 (Seq_length xs@234@01))))))
; Joined path conditions
(assert (or (not (>= j@272@01 0)) (>= j@272@01 0)))
(pop) ; 7
(push) ; 7
; [else-branch: 145 | !(k@271@01 < |xs@234@01|)]
(assert (not (< k@271@01 (Seq_length xs@234@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (< k@271@01 (Seq_length xs@234@01))
  (and
    (< k@271@01 (Seq_length xs@234@01))
    (=>
      (>= j@272@01 0)
      (and
        (>= j@272@01 0)
        (or
          (not (< j@272@01 (Seq_length xs@234@01)))
          (< j@272@01 (Seq_length xs@234@01)))))
    (or (not (>= j@272@01 0)) (>= j@272@01 0)))))
; Joined path conditions
(assert (or
  (not (< k@271@01 (Seq_length xs@234@01)))
  (< k@271@01 (Seq_length xs@234@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 144 | !(k@271@01 >= 0)]
(assert (not (>= k@271@01 0)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (>= k@271@01 0)
  (and
    (>= k@271@01 0)
    (=>
      (< k@271@01 (Seq_length xs@234@01))
      (and
        (< k@271@01 (Seq_length xs@234@01))
        (=>
          (>= j@272@01 0)
          (and
            (>= j@272@01 0)
            (or
              (not (< j@272@01 (Seq_length xs@234@01)))
              (< j@272@01 (Seq_length xs@234@01)))))
        (or (not (>= j@272@01 0)) (>= j@272@01 0))))
    (or
      (not (< k@271@01 (Seq_length xs@234@01)))
      (< k@271@01 (Seq_length xs@234@01))))))
; Joined path conditions
(assert (or (not (>= k@271@01 0)) (>= k@271@01 0)))
(push) ; 4
; [then-branch: 148 | k@271@01 != j@272@01 && j@272@01 < |xs@234@01| && j@272@01 >= 0 && k@271@01 < |xs@234@01| && k@271@01 >= 0 | live]
; [else-branch: 148 | !(k@271@01 != j@272@01 && j@272@01 < |xs@234@01| && j@272@01 >= 0 && k@271@01 < |xs@234@01| && k@271@01 >= 0) | live]
(push) ; 5
; [then-branch: 148 | k@271@01 != j@272@01 && j@272@01 < |xs@234@01| && j@272@01 >= 0 && k@271@01 < |xs@234@01| && k@271@01 >= 0]
(assert (and
  (and
    (and
      (and (not (= k@271@01 j@272@01)) (< j@272@01 (Seq_length xs@234@01)))
      (>= j@272@01 0))
    (< k@271@01 (Seq_length xs@234@01)))
  (>= k@271@01 0)))
; [eval] xs[k] != xs[j]
; [eval] xs[k]
; [eval] xs[j]
(pop) ; 5
(push) ; 5
; [else-branch: 148 | !(k@271@01 != j@272@01 && j@272@01 < |xs@234@01| && j@272@01 >= 0 && k@271@01 < |xs@234@01| && k@271@01 >= 0)]
(assert (not
  (and
    (and
      (and
        (and (not (= k@271@01 j@272@01)) (< j@272@01 (Seq_length xs@234@01)))
        (>= j@272@01 0))
      (< k@271@01 (Seq_length xs@234@01)))
    (>= k@271@01 0))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (and
      (and
        (and (not (= k@271@01 j@272@01)) (< j@272@01 (Seq_length xs@234@01)))
        (>= j@272@01 0))
      (< k@271@01 (Seq_length xs@234@01)))
    (>= k@271@01 0))
  (and
    (not (= k@271@01 j@272@01))
    (< j@272@01 (Seq_length xs@234@01))
    (>= j@272@01 0)
    (< k@271@01 (Seq_length xs@234@01))
    (>= k@271@01 0))))
; Joined path conditions
(assert (or
  (not
    (and
      (and
        (and
          (and (not (= k@271@01 j@272@01)) (< j@272@01 (Seq_length xs@234@01)))
          (>= j@272@01 0))
        (< k@271@01 (Seq_length xs@234@01)))
      (>= k@271@01 0)))
  (and
    (and
      (and
        (and (not (= k@271@01 j@272@01)) (< j@272@01 (Seq_length xs@234@01)))
        (>= j@272@01 0))
      (< k@271@01 (Seq_length xs@234@01)))
    (>= k@271@01 0))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@271@01 Int) (j@272@01 Int)) (!
  (and
    (=>
      (>= k@271@01 0)
      (and
        (>= k@271@01 0)
        (=>
          (< k@271@01 (Seq_length xs@234@01))
          (and
            (< k@271@01 (Seq_length xs@234@01))
            (=>
              (>= j@272@01 0)
              (and
                (>= j@272@01 0)
                (or
                  (not (< j@272@01 (Seq_length xs@234@01)))
                  (< j@272@01 (Seq_length xs@234@01)))))
            (or (not (>= j@272@01 0)) (>= j@272@01 0))))
        (or
          (not (< k@271@01 (Seq_length xs@234@01)))
          (< k@271@01 (Seq_length xs@234@01)))))
    (or (not (>= k@271@01 0)) (>= k@271@01 0))
    (=>
      (and
        (and
          (and
            (and (not (= k@271@01 j@272@01)) (< j@272@01 (Seq_length xs@234@01)))
            (>= j@272@01 0))
          (< k@271@01 (Seq_length xs@234@01)))
        (>= k@271@01 0))
      (and
        (not (= k@271@01 j@272@01))
        (< j@272@01 (Seq_length xs@234@01))
        (>= j@272@01 0)
        (< k@271@01 (Seq_length xs@234@01))
        (>= k@271@01 0)))
    (or
      (not
        (and
          (and
            (and
              (and
                (not (= k@271@01 j@272@01))
                (< j@272@01 (Seq_length xs@234@01)))
              (>= j@272@01 0))
            (< k@271@01 (Seq_length xs@234@01)))
          (>= k@271@01 0)))
      (and
        (and
          (and
            (and (not (= k@271@01 j@272@01)) (< j@272@01 (Seq_length xs@234@01)))
            (>= j@272@01 0))
          (< k@271@01 (Seq_length xs@234@01)))
        (>= k@271@01 0))))
  :pattern ((Seq_index xs@234@01 k@271@01) (Seq_index xs@234@01 j@272@01))
  :qid |prog.l65-aux|)))
(push) ; 3
(assert (not (forall ((k@271@01 Int) (j@272@01 Int)) (!
  (=>
    (and
      (and
        (and
          (and (not (= k@271@01 j@272@01)) (< j@272@01 (Seq_length xs@234@01)))
          (>= j@272@01 0))
        (< k@271@01 (Seq_length xs@234@01)))
      (>= k@271@01 0))
    (not (= (Seq_index xs@234@01 k@271@01) (Seq_index xs@234@01 j@272@01))))
  :pattern ((Seq_index xs@234@01 k@271@01) (Seq_index xs@234@01 j@272@01))
  :qid |prog.l65|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (forall ((k@271@01 Int) (j@272@01 Int)) (!
  (=>
    (and
      (and
        (and
          (and (not (= k@271@01 j@272@01)) (< j@272@01 (Seq_length xs@234@01)))
          (>= j@272@01 0))
        (< k@271@01 (Seq_length xs@234@01)))
      (>= k@271@01 0))
    (not (= (Seq_index xs@234@01 k@271@01) (Seq_index xs@234@01 j@272@01))))
  :pattern ((Seq_index xs@234@01 k@271@01) (Seq_index xs@234@01 j@272@01))
  :qid |prog.l65|)))
(declare-const j@273@01 Int)
(push) ; 3
; [eval] 0 <= j && j < 3
; [eval] 0 <= j
(push) ; 4
; [then-branch: 149 | 0 <= j@273@01 | live]
; [else-branch: 149 | !(0 <= j@273@01) | live]
(push) ; 5
; [then-branch: 149 | 0 <= j@273@01]
(assert (<= 0 j@273@01))
; [eval] j < 3
(pop) ; 5
(push) ; 5
; [else-branch: 149 | !(0 <= j@273@01)]
(assert (not (<= 0 j@273@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 j@273@01)) (<= 0 j@273@01)))
(assert (and (< j@273@01 3) (<= 0 j@273@01)))
; [eval] xs[j]
(push) ; 4
(assert (not (>= j@273@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< j@273@01 (Seq_length xs@234@01))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@274@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@273@01 Int)) (!
  (=>
    (and (< j@273@01 3) (<= 0 j@273@01))
    (or (not (<= 0 j@273@01)) (<= 0 j@273@01)))
  :pattern ((Seq_index xs@234@01 j@273@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j1@273@01 Int) (j2@273@01 Int)) (!
  (=>
    (and
      (and (< j1@273@01 3) (<= 0 j1@273@01))
      (and (< j2@273@01 3) (<= 0 j2@273@01))
      (= (Seq_index xs@234@01 j1@273@01) (Seq_index xs@234@01 j2@273@01)))
    (= j1@273@01 j2@273@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@273@01 Int)) (!
  (=>
    (and (< j@273@01 3) (<= 0 j@273@01))
    (= (inv@274@01 (Seq_index xs@234@01 j@273@01)) j@273@01))
  :pattern ((Seq_index xs@234@01 j@273@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@274@01 r) 3) (<= 0 (inv@274@01 r)))
    (= (Seq_index xs@234@01 (inv@274@01 r)) r))
  :pattern ((inv@274@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@275@01 ((r $Ref)) $Perm
  (ite
    (and (< (inv@274@01 r) 3) (<= 0 (inv@274@01 r)))
    ($Perm.min
      (ite (= r (Seq_index xs@234@01 i@236@01)) $Perm.Write $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@276@01 ((r $Ref)) $Perm
  (ite
    (and (< (inv@274@01 r) 3) (<= 0 (inv@274@01 r)))
    ($Perm.min
      (ite (and (< (inv@265@01 r) 3) (<= 0 (inv@265@01 r))) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@275@01 r)))
    $Perm.No))
(define-fun pTaken@277@01 ((r $Ref)) $Perm
  (ite
    (and (< (inv@274@01 r) 3) (<= 0 (inv@274@01 r)))
    ($Perm.min
      (-
        (ite
          (and (< (inv@267@01 r) n@235@01) (<= 3 (inv@267@01 r)))
          $Perm.Write
          $Perm.No)
        (pTaken@268@01 r))
      (- (- $Perm.Write (pTaken@275@01 r)) (pTaken@276@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (=
  (-
    (ite
      (= (Seq_index xs@234@01 i@236@01) (Seq_index xs@234@01 i@236@01))
      $Perm.Write
      $Perm.No)
    (pTaken@275@01 (Seq_index xs@234@01 i@236@01)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (< (inv@274@01 r) 3) (<= 0 (inv@274@01 r)))
    (= (- $Perm.Write (pTaken@275@01 r)) $Perm.No))
  
  :qid |quant-u-224|))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite (and (< (inv@265@01 r) 3) (<= 0 (inv@265@01 r))) $Perm.Write $Perm.No)
      (pTaken@276@01 r))
    $Perm.No)
  
  :qid |quant-u-225|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (< (inv@274@01 r) 3) (<= 0 (inv@274@01 r)))
    (= (- (- $Perm.Write (pTaken@275@01 r)) (pTaken@276@01 r)) $Perm.No))
  
  :qid |quant-u-226|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@278@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@278@01  $FVF<f>)))
      (and (< (inv@274@01 r) 3) (<= 0 (inv@274@01 r))))
    (=>
      (and (< (inv@274@01 r) 3) (<= 0 (inv@274@01 r)))
      (Set_in r ($FVF.domain_f (as sm@278@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@278@01  $FVF<f>))))
  :qid |qp.fvfDomDef124|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@274@01 r) 3) (<= 0 (inv@274@01 r)))
      (= r (Seq_index xs@234@01 i@236@01)))
    (=
      ($FVF.lookup_f (as sm@278@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@270@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@278@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@270@01  $FVF<f>) r))
  :qid |qp.fvfValDef121|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@274@01 r) 3) (<= 0 (inv@274@01 r)))
      (and (< (inv@265@01 r) 3) (<= 0 (inv@265@01 r))))
    (=
      ($FVF.lookup_f (as sm@278@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@257@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@278@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@257@01  $FVF<f>) r))
  :qid |qp.fvfValDef122|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@274@01 r) 3) (<= 0 (inv@274@01 r)))
      (<
        $Perm.No
        (-
          (ite
            (and (< (inv@267@01 r) n@235@01) (<= 3 (inv@267@01 r)))
            $Perm.Write
            $Perm.No)
          (pTaken@268@01 r))))
    (=
      ($FVF.lookup_f (as sm@278@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@261@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@278@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@261@01  $FVF<f>) r))
  :qid |qp.fvfValDef123|)))
(declare-const j@279@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 3 <= j && j < n
; [eval] 3 <= j
(push) ; 4
; [then-branch: 150 | 3 <= j@279@01 | live]
; [else-branch: 150 | !(3 <= j@279@01) | live]
(push) ; 5
; [then-branch: 150 | 3 <= j@279@01]
(assert (<= 3 j@279@01))
; [eval] j < n
(pop) ; 5
(push) ; 5
; [else-branch: 150 | !(3 <= j@279@01)]
(assert (not (<= 3 j@279@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 3 j@279@01)) (<= 3 j@279@01)))
(assert (and (< j@279@01 n@235@01) (<= 3 j@279@01)))
; [eval] xs[j]
(push) ; 4
(assert (not (>= j@279@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< j@279@01 (Seq_length xs@234@01))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@280@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@279@01 Int)) (!
  (=>
    (and (< j@279@01 n@235@01) (<= 3 j@279@01))
    (or (not (<= 3 j@279@01)) (<= 3 j@279@01)))
  :pattern ((Seq_index xs@234@01 j@279@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j1@279@01 Int) (j2@279@01 Int)) (!
  (=>
    (and
      (and (< j1@279@01 n@235@01) (<= 3 j1@279@01))
      (and (< j2@279@01 n@235@01) (<= 3 j2@279@01))
      (= (Seq_index xs@234@01 j1@279@01) (Seq_index xs@234@01 j2@279@01)))
    (= j1@279@01 j2@279@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@279@01 Int)) (!
  (=>
    (and (< j@279@01 n@235@01) (<= 3 j@279@01))
    (= (inv@280@01 (Seq_index xs@234@01 j@279@01)) j@279@01))
  :pattern ((Seq_index xs@234@01 j@279@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@280@01 r) n@235@01) (<= 3 (inv@280@01 r)))
    (= (Seq_index xs@234@01 (inv@280@01 r)) r))
  :pattern ((inv@280@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@281@01 ((r $Ref)) $Perm
  (ite
    (and (< (inv@280@01 r) n@235@01) (<= 3 (inv@280@01 r)))
    ($Perm.min
      (-
        (ite
          (and (< (inv@267@01 r) n@235@01) (<= 3 (inv@267@01 r)))
          $Perm.Write
          $Perm.No)
        (pTaken@268@01 r))
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@282@01 ((r $Ref)) $Perm
  (ite
    (and (< (inv@280@01 r) n@235@01) (<= 3 (inv@280@01 r)))
    ($Perm.min
      (-
        (ite (= r (Seq_index xs@234@01 i@236@01)) $Perm.Write $Perm.No)
        (pTaken@275@01 r))
      (- $Perm.Write (pTaken@281@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (-
        (ite
          (and (< (inv@267@01 r) n@235@01) (<= 3 (inv@267@01 r)))
          $Perm.Write
          $Perm.No)
        (pTaken@268@01 r))
      (pTaken@281@01 r))
    $Perm.No)
  
  :qid |quant-u-229|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (< (inv@280@01 r) n@235@01) (<= 3 (inv@280@01 r)))
    (= (- $Perm.Write (pTaken@281@01 r)) $Perm.No))
  
  :qid |quant-u-230|))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (=
  (-
    (-
      (ite
        (= (Seq_index xs@234@01 i@236@01) (Seq_index xs@234@01 i@236@01))
        $Perm.Write
        $Perm.No)
      (pTaken@275@01 (Seq_index xs@234@01 i@236@01)))
    (pTaken@282@01 (Seq_index xs@234@01 i@236@01)))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (< (inv@280@01 r) n@235@01) (<= 3 (inv@280@01 r)))
    (= (- (- $Perm.Write (pTaken@281@01 r)) (pTaken@282@01 r)) $Perm.No))
  
  :qid |quant-u-232|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@283@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@283@01  $FVF<f>)))
      (and (< (inv@280@01 r) n@235@01) (<= 3 (inv@280@01 r))))
    (=>
      (and (< (inv@280@01 r) n@235@01) (<= 3 (inv@280@01 r)))
      (Set_in r ($FVF.domain_f (as sm@283@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@283@01  $FVF<f>))))
  :qid |qp.fvfDomDef127|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@280@01 r) n@235@01) (<= 3 (inv@280@01 r)))
      (<
        $Perm.No
        (-
          (ite
            (and (< (inv@267@01 r) n@235@01) (<= 3 (inv@267@01 r)))
            $Perm.Write
            $Perm.No)
          (pTaken@268@01 r))))
    (=
      ($FVF.lookup_f (as sm@283@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@261@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@283@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@261@01  $FVF<f>) r))
  :qid |qp.fvfValDef125|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@280@01 r) n@235@01) (<= 3 (inv@280@01 r)))
      (<
        $Perm.No
        (-
          (ite (= r (Seq_index xs@234@01 i@236@01)) $Perm.Write $Perm.No)
          (pTaken@275@01 r))))
    (=
      ($FVF.lookup_f (as sm@283@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@270@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@283@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@270@01  $FVF<f>) r))
  :qid |qp.fvfValDef126|)))
(assert (P02%trigger ($Snap.combine
  $Snap.unit
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$FVF<f>To$Snap (as sm@278@01  $FVF<f>))
        ($SortWrappers.$FVF<f>To$Snap (as sm@283@01  $FVF<f>)))))) xs@234@01 n@235@01))
; [exec]
; v2 := fun06(xs, n, i)
; [eval] fun06(xs, n, i)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 < i
; [eval] i < n
(assert (fun06%precondition ($Snap.combine
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$FVF<f>To$Snap (as sm@278@01  $FVF<f>))
          ($SortWrappers.$FVF<f>To$Snap (as sm@283@01  $FVF<f>))))))
  ($Snap.combine $Snap.unit $Snap.unit)) xs@234@01 n@235@01 i@236@01))
(pop) ; 3
; Joined path conditions
(assert (fun06%precondition ($Snap.combine
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$FVF<f>To$Snap (as sm@278@01  $FVF<f>))
          ($SortWrappers.$FVF<f>To$Snap (as sm@283@01  $FVF<f>))))))
  ($Snap.combine $Snap.unit $Snap.unit)) xs@234@01 n@235@01 i@236@01))
(declare-const v2@284@01 Int)
(assert (=
  v2@284@01
  (fun06 ($Snap.combine
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.$FVF<f>To$Snap (as sm@278@01  $FVF<f>))
            ($SortWrappers.$FVF<f>To$Snap (as sm@283@01  $FVF<f>))))))
    ($Snap.combine $Snap.unit $Snap.unit)) xs@234@01 n@235@01 i@236@01)))
; [exec]
; assert v2 == 0
; [eval] v2 == 0
(push) ; 3
(assert (not (= v2@284@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (= v2@284@01 0))
; [exec]
; assert v2 == v1
; [eval] v2 == v1
(push) ; 3
(assert (not (= v2@284@01 v1@250@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.04s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] v2 == v1
(set-option :timeout 0)
(push) ; 3
(assert (not (= v2@284@01 v1@250@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.04s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] v2 == v1
(set-option :timeout 0)
(push) ; 3
(assert (not (= v2@284@01 v1@250@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.03s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] v2 == v1
(set-option :timeout 0)
(push) ; 3
(assert (not (= v2@284@01 v1@250@01)))
(check-sat)
; unknown
(pop) ; 3
; 0.03s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test04 ----------
(declare-const x@285@01 $Ref)
(declare-const n@286@01 Int)
(declare-const x@287@01 $Ref)
(declare-const n@288@01 Int)
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
; var v1: Int
(declare-const v1@289@01 Int)
; [exec]
; var v2: Int
(declare-const v2@290@01 Int)
; [exec]
; inhale acc(P01(x, n), write)
(declare-const $t@291@01 $Snap)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale 6 < n
(declare-const $t@292@01 $Snap)
(assert (= $t@292@01 $Snap.unit))
; [eval] 6 < n
(assert (< 6 n@288@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; unfold acc(P01(x, n), write)
(assert (= $t@291@01 ($Snap.combine ($Snap.first $t@291@01) ($Snap.second $t@291@01))))
(assert (not (= x@287@01 $Ref.null)))
(assert (=
  ($Snap.second $t@291@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@291@01))
    ($Snap.second ($Snap.second $t@291@01)))))
(assert (= ($Snap.first ($Snap.second $t@291@01)) $Snap.unit))
; [eval] |x.ss| == n
; [eval] |x.ss|
(assert (=
  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))
  n@288@01))
(assert (=
  ($Snap.second ($Snap.second $t@291@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@291@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@291@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@291@01))) $Snap.unit))
; [eval] 3 <= n
(assert (<= 3 n@288@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@291@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@291@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@291@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@291@01))))
  $Snap.unit))
; [eval] (forall k: Int, j: Int :: { x.ss[k], x.ss[j] } k >= 0 && (k < |x.ss| && (j >= 0 && (j < |x.ss| && k != j))) ==> x.ss[k] != x.ss[j])
(declare-const k@293@01 Int)
(declare-const j@294@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] k >= 0 && (k < |x.ss| && (j >= 0 && (j < |x.ss| && k != j))) ==> x.ss[k] != x.ss[j]
; [eval] k >= 0 && (k < |x.ss| && (j >= 0 && (j < |x.ss| && k != j)))
; [eval] k >= 0
(push) ; 4
; [then-branch: 151 | k@293@01 >= 0 | live]
; [else-branch: 151 | !(k@293@01 >= 0) | live]
(push) ; 5
; [then-branch: 151 | k@293@01 >= 0]
(assert (>= k@293@01 0))
; [eval] k < |x.ss|
; [eval] |x.ss|
(push) ; 6
; [then-branch: 152 | k@293@01 < |First:($t@291@01)| | live]
; [else-branch: 152 | !(k@293@01 < |First:($t@291@01)|) | live]
(push) ; 7
; [then-branch: 152 | k@293@01 < |First:($t@291@01)|]
(assert (<
  k@293@01
  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
; [eval] j >= 0
(push) ; 8
; [then-branch: 153 | j@294@01 >= 0 | live]
; [else-branch: 153 | !(j@294@01 >= 0) | live]
(push) ; 9
; [then-branch: 153 | j@294@01 >= 0]
(assert (>= j@294@01 0))
; [eval] j < |x.ss|
; [eval] |x.ss|
(push) ; 10
; [then-branch: 154 | j@294@01 < |First:($t@291@01)| | live]
; [else-branch: 154 | !(j@294@01 < |First:($t@291@01)|) | live]
(push) ; 11
; [then-branch: 154 | j@294@01 < |First:($t@291@01)|]
(assert (<
  j@294@01
  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
; [eval] k != j
(pop) ; 11
(push) ; 11
; [else-branch: 154 | !(j@294@01 < |First:($t@291@01)|)]
(assert (not
  (<
    j@294@01
    (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))))))
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (<
      j@294@01
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
  (<
    j@294@01
    (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))))))
(pop) ; 9
(push) ; 9
; [else-branch: 153 | !(j@294@01 >= 0)]
(assert (not (>= j@294@01 0)))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (=>
  (>= j@294@01 0)
  (and
    (>= j@294@01 0)
    (or
      (not
        (<
          j@294@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
      (<
        j@294@01
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))))))))
; Joined path conditions
(assert (or (not (>= j@294@01 0)) (>= j@294@01 0)))
(pop) ; 7
(push) ; 7
; [else-branch: 152 | !(k@293@01 < |First:($t@291@01)|)]
(assert (not
  (<
    k@293@01
    (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (<
    k@293@01
    (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))))
  (and
    (<
      k@293@01
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))))
    (=>
      (>= j@294@01 0)
      (and
        (>= j@294@01 0)
        (or
          (not
            (<
              j@294@01
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
          (<
            j@294@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))))
    (or (not (>= j@294@01 0)) (>= j@294@01 0)))))
; Joined path conditions
(assert (or
  (not
    (<
      k@293@01
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
  (<
    k@293@01
    (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))))))
(pop) ; 5
(push) ; 5
; [else-branch: 151 | !(k@293@01 >= 0)]
(assert (not (>= k@293@01 0)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (>= k@293@01 0)
  (and
    (>= k@293@01 0)
    (=>
      (<
        k@293@01
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))))
      (and
        (<
          k@293@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))))
        (=>
          (>= j@294@01 0)
          (and
            (>= j@294@01 0)
            (or
              (not
                (<
                  j@294@01
                  (Seq_length
                    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
              (<
                j@294@01
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))))
        (or (not (>= j@294@01 0)) (>= j@294@01 0))))
    (or
      (not
        (<
          k@293@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
      (<
        k@293@01
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))))))))
; Joined path conditions
(assert (or (not (>= k@293@01 0)) (>= k@293@01 0)))
(push) ; 4
; [then-branch: 155 | k@293@01 != j@294@01 && j@294@01 < |First:($t@291@01)| && j@294@01 >= 0 && k@293@01 < |First:($t@291@01)| && k@293@01 >= 0 | live]
; [else-branch: 155 | !(k@293@01 != j@294@01 && j@294@01 < |First:($t@291@01)| && j@294@01 >= 0 && k@293@01 < |First:($t@291@01)| && k@293@01 >= 0) | live]
(push) ; 5
; [then-branch: 155 | k@293@01 != j@294@01 && j@294@01 < |First:($t@291@01)| && j@294@01 >= 0 && k@293@01 < |First:($t@291@01)| && k@293@01 >= 0]
(assert (and
  (and
    (and
      (and
        (not (= k@293@01 j@294@01))
        (<
          j@294@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
      (>= j@294@01 0))
    (<
      k@293@01
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
  (>= k@293@01 0)))
; [eval] x.ss[k] != x.ss[j]
; [eval] x.ss[k]
; [eval] x.ss[j]
(pop) ; 5
(push) ; 5
; [else-branch: 155 | !(k@293@01 != j@294@01 && j@294@01 < |First:($t@291@01)| && j@294@01 >= 0 && k@293@01 < |First:($t@291@01)| && k@293@01 >= 0)]
(assert (not
  (and
    (and
      (and
        (and
          (not (= k@293@01 j@294@01))
          (<
            j@294@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
        (>= j@294@01 0))
      (<
        k@293@01
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
    (>= k@293@01 0))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (and
      (and
        (and
          (not (= k@293@01 j@294@01))
          (<
            j@294@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
        (>= j@294@01 0))
      (<
        k@293@01
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
    (>= k@293@01 0))
  (and
    (not (= k@293@01 j@294@01))
    (<
      j@294@01
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))))
    (>= j@294@01 0)
    (<
      k@293@01
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))))
    (>= k@293@01 0))))
; Joined path conditions
(assert (or
  (not
    (and
      (and
        (and
          (and
            (not (= k@293@01 j@294@01))
            (<
              j@294@01
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
          (>= j@294@01 0))
        (<
          k@293@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
      (>= k@293@01 0)))
  (and
    (and
      (and
        (and
          (not (= k@293@01 j@294@01))
          (<
            j@294@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
        (>= j@294@01 0))
      (<
        k@293@01
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
    (>= k@293@01 0))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@293@01 Int) (j@294@01 Int)) (!
  (and
    (=>
      (>= k@293@01 0)
      (and
        (>= k@293@01 0)
        (=>
          (<
            k@293@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))))
          (and
            (<
              k@293@01
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))))
            (=>
              (>= j@294@01 0)
              (and
                (>= j@294@01 0)
                (or
                  (not
                    (<
                      j@294@01
                      (Seq_length
                        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
                  (<
                    j@294@01
                    (Seq_length
                      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))))
            (or (not (>= j@294@01 0)) (>= j@294@01 0))))
        (or
          (not
            (<
              k@293@01
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
          (<
            k@293@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))))
    (or (not (>= k@293@01 0)) (>= k@293@01 0))
    (=>
      (and
        (and
          (and
            (and
              (not (= k@293@01 j@294@01))
              (<
                j@294@01
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
            (>= j@294@01 0))
          (<
            k@293@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
        (>= k@293@01 0))
      (and
        (not (= k@293@01 j@294@01))
        (<
          j@294@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))))
        (>= j@294@01 0)
        (<
          k@293@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))))
        (>= k@293@01 0)))
    (or
      (not
        (and
          (and
            (and
              (and
                (not (= k@293@01 j@294@01))
                (<
                  j@294@01
                  (Seq_length
                    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
              (>= j@294@01 0))
            (<
              k@293@01
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
          (>= k@293@01 0)))
      (and
        (and
          (and
            (and
              (not (= k@293@01 j@294@01))
              (<
                j@294@01
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
            (>= j@294@01 0))
          (<
            k@293@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
        (>= k@293@01 0))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
    k@293@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
    j@294@01))
  :qid |prog.l132-aux|)))
(assert (forall ((k@293@01 Int) (j@294@01 Int)) (!
  (=>
    (and
      (and
        (and
          (and
            (not (= k@293@01 j@294@01))
            (<
              j@294@01
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
          (>= j@294@01 0))
        (<
          k@293@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
      (>= k@293@01 0))
    (not
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
          k@293@01)
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
          j@294@01))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
    k@293@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
    j@294@01))
  :qid |prog.l132|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@291@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@291@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@291@01))))))))
(declare-const j@295@01 Int)
(push) ; 3
; [eval] 0 <= j && j < 3
; [eval] 0 <= j
(push) ; 4
; [then-branch: 156 | 0 <= j@295@01 | live]
; [else-branch: 156 | !(0 <= j@295@01) | live]
(push) ; 5
; [then-branch: 156 | 0 <= j@295@01]
(assert (<= 0 j@295@01))
; [eval] j < 3
(pop) ; 5
(push) ; 5
; [else-branch: 156 | !(0 <= j@295@01)]
(assert (not (<= 0 j@295@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 j@295@01)) (<= 0 j@295@01)))
(assert (and (< j@295@01 3) (<= 0 j@295@01)))
; [eval] x.ss[j]
(push) ; 4
(assert (not (>= j@295@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (<
  j@295@01
  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@296@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@295@01 Int)) (!
  (=>
    (and (< j@295@01 3) (<= 0 j@295@01))
    (or (not (<= 0 j@295@01)) (<= 0 j@295@01)))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
    j@295@01))
  :qid |f-aux|)))
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((j@295@01 Int)) (!
  (=>
    (and (< j@295@01 3) (<= 0 j@295@01))
    (=
      (inv@296@01 (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
        j@295@01))
      j@295@01))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
    j@295@01))
  :qid |quant-u-234|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@296@01 r) 3) (<= 0 (inv@296@01 r)))
    (=
      (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
        (inv@296@01 r))
      r))
  :pattern ((inv@296@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j@295@01 Int)) (!
  (=>
    (and (< j@295@01 3) (<= 0 j@295@01))
    (not
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
          j@295@01)
        $Ref.null)))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
    j@295@01))
  :qid |f-permImpliesNonNull|)))
(declare-const j@297@01 Int)
(push) ; 3
; [eval] 3 <= j && j < n
; [eval] 3 <= j
(push) ; 4
; [then-branch: 157 | 3 <= j@297@01 | live]
; [else-branch: 157 | !(3 <= j@297@01) | live]
(push) ; 5
; [then-branch: 157 | 3 <= j@297@01]
(assert (<= 3 j@297@01))
; [eval] j < n
(pop) ; 5
(push) ; 5
; [else-branch: 157 | !(3 <= j@297@01)]
(assert (not (<= 3 j@297@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 3 j@297@01)) (<= 3 j@297@01)))
(assert (and (< j@297@01 n@288@01) (<= 3 j@297@01)))
; [eval] x.ss[j]
(push) ; 4
(assert (not (>= j@297@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (<
  j@297@01
  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@298@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@297@01 Int)) (!
  (=>
    (and (< j@297@01 n@288@01) (<= 3 j@297@01))
    (or (not (<= 3 j@297@01)) (<= 3 j@297@01)))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
    j@297@01))
  :qid |f-aux|)))
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((j@297@01 Int)) (!
  (=>
    (and (< j@297@01 n@288@01) (<= 3 j@297@01))
    (=
      (inv@298@01 (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
        j@297@01))
      j@297@01))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
    j@297@01))
  :qid |quant-u-236|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@298@01 r) n@288@01) (<= 3 (inv@298@01 r)))
    (=
      (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
        (inv@298@01 r))
      r))
  :pattern ((inv@298@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j@297@01 Int)) (!
  (=>
    (and (< j@297@01 n@288@01) (<= 3 j@297@01))
    (not
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
          j@297@01)
        $Ref.null)))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
    j@297@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (P01%trigger $t@291@01 x@287@01 n@288@01))
; [exec]
; v1 := x.ss[2].f
; [eval] x.ss[2]
(set-option :timeout 0)
(push) ; 3
(assert (not (< 2 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const sm@299@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@298@01 r) n@288@01) (<= 3 (inv@298@01 r)))
    (=
      ($FVF.lookup_f (as sm@299@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@291@01)))))) r)))
  :pattern (($FVF.lookup_f (as sm@299@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@291@01)))))) r))
  :qid |qp.fvfValDef128|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@296@01 r) 3) (<= 0 (inv@296@01 r)))
    (=
      ($FVF.lookup_f (as sm@299@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@291@01)))))) r)))
  :pattern (($FVF.lookup_f (as sm@299@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@291@01)))))) r))
  :qid |qp.fvfValDef129|)))
(declare-const pm@300@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@300@01  $FPM) r)
    (+
      (ite
        (and (< (inv@298@01 r) n@288@01) (<= 3 (inv@298@01 r)))
        $Perm.Write
        $Perm.No)
      (ite (and (< (inv@296@01 r) 3) (<= 0 (inv@296@01 r))) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@300@01  $FPM) r))
  :qid |qp.resPrmSumDef130|)))
(push) ; 3
(assert (not (<
  $Perm.No
  ($FVF.perm_f (as pm@300@01  $FPM) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
    2)))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const v1@301@01 Int)
(assert (=
  v1@301@01
  ($FVF.lookup_f (as sm@299@01  $FVF<f>) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
    2))))
; [exec]
; v2 := x.ss[4].f
; [eval] x.ss[4]
(push) ; 3
(assert (not (< 4 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const sm@302@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@298@01 r) n@288@01) (<= 3 (inv@298@01 r)))
    (=
      ($FVF.lookup_f (as sm@302@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@291@01)))))) r)))
  :pattern (($FVF.lookup_f (as sm@302@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@291@01)))))) r))
  :qid |qp.fvfValDef131|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@296@01 r) 3) (<= 0 (inv@296@01 r)))
    (=
      ($FVF.lookup_f (as sm@302@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@291@01)))))) r)))
  :pattern (($FVF.lookup_f (as sm@302@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@291@01)))))) r))
  :qid |qp.fvfValDef132|)))
(declare-const pm@303@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@303@01  $FPM) r)
    (+
      (ite
        (and (< (inv@298@01 r) n@288@01) (<= 3 (inv@298@01 r)))
        $Perm.Write
        $Perm.No)
      (ite (and (< (inv@296@01 r) 3) (<= 0 (inv@296@01 r))) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@303@01  $FPM) r))
  :qid |qp.resPrmSumDef133|)))
(push) ; 3
(assert (not (<
  $Perm.No
  ($FVF.perm_f (as pm@303@01  $FPM) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
    4)))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const v2@304@01 Int)
(assert (=
  v2@304@01
  ($FVF.lookup_f (as sm@302@01  $FVF<f>) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
    4))))
; [exec]
; fold acc(P01(x, n), write)
; [eval] |x.ss| == n
; [eval] |x.ss|
; [eval] 3 <= n
; [eval] (forall k: Int, j: Int :: { x.ss[k], x.ss[j] } k >= 0 && (k < |x.ss| && (j >= 0 && (j < |x.ss| && k != j))) ==> x.ss[k] != x.ss[j])
(declare-const k@305@01 Int)
(declare-const j@306@01 Int)
(push) ; 3
; [eval] k >= 0 && (k < |x.ss| && (j >= 0 && (j < |x.ss| && k != j))) ==> x.ss[k] != x.ss[j]
; [eval] k >= 0 && (k < |x.ss| && (j >= 0 && (j < |x.ss| && k != j)))
; [eval] k >= 0
(push) ; 4
; [then-branch: 158 | k@305@01 >= 0 | live]
; [else-branch: 158 | !(k@305@01 >= 0) | live]
(push) ; 5
; [then-branch: 158 | k@305@01 >= 0]
(assert (>= k@305@01 0))
; [eval] k < |x.ss|
; [eval] |x.ss|
(push) ; 6
; [then-branch: 159 | k@305@01 < |First:($t@291@01)| | live]
; [else-branch: 159 | !(k@305@01 < |First:($t@291@01)|) | live]
(push) ; 7
; [then-branch: 159 | k@305@01 < |First:($t@291@01)|]
(assert (<
  k@305@01
  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
; [eval] j >= 0
(push) ; 8
; [then-branch: 160 | j@306@01 >= 0 | live]
; [else-branch: 160 | !(j@306@01 >= 0) | live]
(push) ; 9
; [then-branch: 160 | j@306@01 >= 0]
(assert (>= j@306@01 0))
; [eval] j < |x.ss|
; [eval] |x.ss|
(push) ; 10
; [then-branch: 161 | j@306@01 < |First:($t@291@01)| | live]
; [else-branch: 161 | !(j@306@01 < |First:($t@291@01)|) | live]
(push) ; 11
; [then-branch: 161 | j@306@01 < |First:($t@291@01)|]
(assert (<
  j@306@01
  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
; [eval] k != j
(pop) ; 11
(push) ; 11
; [else-branch: 161 | !(j@306@01 < |First:($t@291@01)|)]
(assert (not
  (<
    j@306@01
    (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))))))
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (<
      j@306@01
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
  (<
    j@306@01
    (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))))))
(pop) ; 9
(push) ; 9
; [else-branch: 160 | !(j@306@01 >= 0)]
(assert (not (>= j@306@01 0)))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (=>
  (>= j@306@01 0)
  (and
    (>= j@306@01 0)
    (or
      (not
        (<
          j@306@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
      (<
        j@306@01
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))))))))
; Joined path conditions
(assert (or (not (>= j@306@01 0)) (>= j@306@01 0)))
(pop) ; 7
(push) ; 7
; [else-branch: 159 | !(k@305@01 < |First:($t@291@01)|)]
(assert (not
  (<
    k@305@01
    (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (<
    k@305@01
    (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))))
  (and
    (<
      k@305@01
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))))
    (=>
      (>= j@306@01 0)
      (and
        (>= j@306@01 0)
        (or
          (not
            (<
              j@306@01
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
          (<
            j@306@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))))
    (or (not (>= j@306@01 0)) (>= j@306@01 0)))))
; Joined path conditions
(assert (or
  (not
    (<
      k@305@01
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
  (<
    k@305@01
    (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))))))
(pop) ; 5
(push) ; 5
; [else-branch: 158 | !(k@305@01 >= 0)]
(assert (not (>= k@305@01 0)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (>= k@305@01 0)
  (and
    (>= k@305@01 0)
    (=>
      (<
        k@305@01
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))))
      (and
        (<
          k@305@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))))
        (=>
          (>= j@306@01 0)
          (and
            (>= j@306@01 0)
            (or
              (not
                (<
                  j@306@01
                  (Seq_length
                    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
              (<
                j@306@01
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))))
        (or (not (>= j@306@01 0)) (>= j@306@01 0))))
    (or
      (not
        (<
          k@305@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
      (<
        k@305@01
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))))))))
; Joined path conditions
(assert (or (not (>= k@305@01 0)) (>= k@305@01 0)))
(push) ; 4
; [then-branch: 162 | k@305@01 != j@306@01 && j@306@01 < |First:($t@291@01)| && j@306@01 >= 0 && k@305@01 < |First:($t@291@01)| && k@305@01 >= 0 | live]
; [else-branch: 162 | !(k@305@01 != j@306@01 && j@306@01 < |First:($t@291@01)| && j@306@01 >= 0 && k@305@01 < |First:($t@291@01)| && k@305@01 >= 0) | live]
(push) ; 5
; [then-branch: 162 | k@305@01 != j@306@01 && j@306@01 < |First:($t@291@01)| && j@306@01 >= 0 && k@305@01 < |First:($t@291@01)| && k@305@01 >= 0]
(assert (and
  (and
    (and
      (and
        (not (= k@305@01 j@306@01))
        (<
          j@306@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
      (>= j@306@01 0))
    (<
      k@305@01
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
  (>= k@305@01 0)))
; [eval] x.ss[k] != x.ss[j]
; [eval] x.ss[k]
; [eval] x.ss[j]
(pop) ; 5
(push) ; 5
; [else-branch: 162 | !(k@305@01 != j@306@01 && j@306@01 < |First:($t@291@01)| && j@306@01 >= 0 && k@305@01 < |First:($t@291@01)| && k@305@01 >= 0)]
(assert (not
  (and
    (and
      (and
        (and
          (not (= k@305@01 j@306@01))
          (<
            j@306@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
        (>= j@306@01 0))
      (<
        k@305@01
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
    (>= k@305@01 0))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (and
      (and
        (and
          (not (= k@305@01 j@306@01))
          (<
            j@306@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
        (>= j@306@01 0))
      (<
        k@305@01
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
    (>= k@305@01 0))
  (and
    (not (= k@305@01 j@306@01))
    (<
      j@306@01
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))))
    (>= j@306@01 0)
    (<
      k@305@01
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))))
    (>= k@305@01 0))))
; Joined path conditions
(assert (or
  (not
    (and
      (and
        (and
          (and
            (not (= k@305@01 j@306@01))
            (<
              j@306@01
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
          (>= j@306@01 0))
        (<
          k@305@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
      (>= k@305@01 0)))
  (and
    (and
      (and
        (and
          (not (= k@305@01 j@306@01))
          (<
            j@306@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
        (>= j@306@01 0))
      (<
        k@305@01
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
    (>= k@305@01 0))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@305@01 Int) (j@306@01 Int)) (!
  (and
    (=>
      (>= k@305@01 0)
      (and
        (>= k@305@01 0)
        (=>
          (<
            k@305@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))))
          (and
            (<
              k@305@01
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))))
            (=>
              (>= j@306@01 0)
              (and
                (>= j@306@01 0)
                (or
                  (not
                    (<
                      j@306@01
                      (Seq_length
                        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
                  (<
                    j@306@01
                    (Seq_length
                      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))))
            (or (not (>= j@306@01 0)) (>= j@306@01 0))))
        (or
          (not
            (<
              k@305@01
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
          (<
            k@305@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))))
    (or (not (>= k@305@01 0)) (>= k@305@01 0))
    (=>
      (and
        (and
          (and
            (and
              (not (= k@305@01 j@306@01))
              (<
                j@306@01
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
            (>= j@306@01 0))
          (<
            k@305@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
        (>= k@305@01 0))
      (and
        (not (= k@305@01 j@306@01))
        (<
          j@306@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))))
        (>= j@306@01 0)
        (<
          k@305@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))))
        (>= k@305@01 0)))
    (or
      (not
        (and
          (and
            (and
              (and
                (not (= k@305@01 j@306@01))
                (<
                  j@306@01
                  (Seq_length
                    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
              (>= j@306@01 0))
            (<
              k@305@01
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
          (>= k@305@01 0)))
      (and
        (and
          (and
            (and
              (not (= k@305@01 j@306@01))
              (<
                j@306@01
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
            (>= j@306@01 0))
          (<
            k@305@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
        (>= k@305@01 0))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
    k@305@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
    j@306@01))
  :qid |prog.l132-aux|)))
(push) ; 3
(assert (not (forall ((k@305@01 Int) (j@306@01 Int)) (!
  (=>
    (and
      (and
        (and
          (and
            (not (= k@305@01 j@306@01))
            (<
              j@306@01
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
          (>= j@306@01 0))
        (<
          k@305@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
      (>= k@305@01 0))
    (not
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
          k@305@01)
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
          j@306@01))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
    k@305@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
    j@306@01))
  :qid |prog.l132|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (forall ((k@305@01 Int) (j@306@01 Int)) (!
  (=>
    (and
      (and
        (and
          (and
            (not (= k@305@01 j@306@01))
            (<
              j@306@01
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
          (>= j@306@01 0))
        (<
          k@305@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
      (>= k@305@01 0))
    (not
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
          k@305@01)
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
          j@306@01))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
    k@305@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
    j@306@01))
  :qid |prog.l132|)))
(declare-const j@307@01 Int)
(push) ; 3
; [eval] 0 <= j && j < 3
; [eval] 0 <= j
(push) ; 4
; [then-branch: 163 | 0 <= j@307@01 | live]
; [else-branch: 163 | !(0 <= j@307@01) | live]
(push) ; 5
; [then-branch: 163 | 0 <= j@307@01]
(assert (<= 0 j@307@01))
; [eval] j < 3
(pop) ; 5
(push) ; 5
; [else-branch: 163 | !(0 <= j@307@01)]
(assert (not (<= 0 j@307@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 j@307@01)) (<= 0 j@307@01)))
(assert (and (< j@307@01 3) (<= 0 j@307@01)))
; [eval] x.ss[j]
(push) ; 4
(assert (not (>= j@307@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (<
  j@307@01
  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@308@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@307@01 Int)) (!
  (=>
    (and (< j@307@01 3) (<= 0 j@307@01))
    (or (not (<= 0 j@307@01)) (<= 0 j@307@01)))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
    j@307@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j1@307@01 Int) (j2@307@01 Int)) (!
  (=>
    (and
      (and (< j1@307@01 3) (<= 0 j1@307@01))
      (and (< j2@307@01 3) (<= 0 j2@307@01))
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
          j1@307@01)
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
          j2@307@01)))
    (= j1@307@01 j2@307@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@307@01 Int)) (!
  (=>
    (and (< j@307@01 3) (<= 0 j@307@01))
    (=
      (inv@308@01 (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
        j@307@01))
      j@307@01))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
    j@307@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@308@01 r) 3) (<= 0 (inv@308@01 r)))
    (=
      (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
        (inv@308@01 r))
      r))
  :pattern ((inv@308@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@309@01 ((r $Ref)) $Perm
  (ite
    (and (< (inv@308@01 r) 3) (<= 0 (inv@308@01 r)))
    ($Perm.min
      (ite
        (and (< (inv@298@01 r) n@288@01) (<= 3 (inv@298@01 r)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@310@01 ((r $Ref)) $Perm
  (ite
    (and (< (inv@308@01 r) 3) (<= 0 (inv@308@01 r)))
    ($Perm.min
      (ite (and (< (inv@296@01 r) 3) (<= 0 (inv@296@01 r))) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@309@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (< (inv@298@01 r) n@288@01) (<= 3 (inv@298@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@309@01 r))
    $Perm.No)
  
  :qid |quant-u-239|))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (< (inv@308@01 r) 3) (<= 0 (inv@308@01 r)))
    (= (- $Perm.Write (pTaken@309@01 r)) $Perm.No))
  
  :qid |quant-u-240|))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite (and (< (inv@296@01 r) 3) (<= 0 (inv@296@01 r))) $Perm.Write $Perm.No)
      (pTaken@310@01 r))
    $Perm.No)
  
  :qid |quant-u-241|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (< (inv@308@01 r) 3) (<= 0 (inv@308@01 r)))
    (= (- (- $Perm.Write (pTaken@309@01 r)) (pTaken@310@01 r)) $Perm.No))
  
  :qid |quant-u-242|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@311@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@311@01  $FVF<f>)))
      (and (< (inv@308@01 r) 3) (<= 0 (inv@308@01 r))))
    (=>
      (and (< (inv@308@01 r) 3) (<= 0 (inv@308@01 r)))
      (Set_in r ($FVF.domain_f (as sm@311@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@311@01  $FVF<f>))))
  :qid |qp.fvfDomDef136|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@308@01 r) 3) (<= 0 (inv@308@01 r)))
      (and (< (inv@298@01 r) n@288@01) (<= 3 (inv@298@01 r))))
    (=
      ($FVF.lookup_f (as sm@311@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@291@01)))))) r)))
  :pattern (($FVF.lookup_f (as sm@311@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@291@01)))))) r))
  :qid |qp.fvfValDef134|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@308@01 r) 3) (<= 0 (inv@308@01 r)))
      (and (< (inv@296@01 r) 3) (<= 0 (inv@296@01 r))))
    (=
      ($FVF.lookup_f (as sm@311@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@291@01)))))) r)))
  :pattern (($FVF.lookup_f (as sm@311@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@291@01)))))) r))
  :qid |qp.fvfValDef135|)))
(declare-const j@312@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 3 <= j && j < n
; [eval] 3 <= j
(push) ; 4
; [then-branch: 164 | 3 <= j@312@01 | live]
; [else-branch: 164 | !(3 <= j@312@01) | live]
(push) ; 5
; [then-branch: 164 | 3 <= j@312@01]
(assert (<= 3 j@312@01))
; [eval] j < n
(pop) ; 5
(push) ; 5
; [else-branch: 164 | !(3 <= j@312@01)]
(assert (not (<= 3 j@312@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 3 j@312@01)) (<= 3 j@312@01)))
(assert (and (< j@312@01 n@288@01) (<= 3 j@312@01)))
; [eval] x.ss[j]
(push) ; 4
(assert (not (>= j@312@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (<
  j@312@01
  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@313@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@312@01 Int)) (!
  (=>
    (and (< j@312@01 n@288@01) (<= 3 j@312@01))
    (or (not (<= 3 j@312@01)) (<= 3 j@312@01)))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
    j@312@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j1@312@01 Int) (j2@312@01 Int)) (!
  (=>
    (and
      (and (< j1@312@01 n@288@01) (<= 3 j1@312@01))
      (and (< j2@312@01 n@288@01) (<= 3 j2@312@01))
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
          j1@312@01)
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
          j2@312@01)))
    (= j1@312@01 j2@312@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@312@01 Int)) (!
  (=>
    (and (< j@312@01 n@288@01) (<= 3 j@312@01))
    (=
      (inv@313@01 (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
        j@312@01))
      j@312@01))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
    j@312@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@313@01 r) n@288@01) (<= 3 (inv@313@01 r)))
    (=
      (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
        (inv@313@01 r))
      r))
  :pattern ((inv@313@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@314@01 ((r $Ref)) $Perm
  (ite
    (and (< (inv@313@01 r) n@288@01) (<= 3 (inv@313@01 r)))
    ($Perm.min
      (-
        (ite
          (and (< (inv@298@01 r) n@288@01) (<= 3 (inv@298@01 r)))
          $Perm.Write
          $Perm.No)
        (pTaken@309@01 r))
      $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (-
        (ite
          (and (< (inv@298@01 r) n@288@01) (<= 3 (inv@298@01 r)))
          $Perm.Write
          $Perm.No)
        (pTaken@309@01 r))
      (pTaken@314@01 r))
    $Perm.No)
  
  :qid |quant-u-245|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (< (inv@313@01 r) n@288@01) (<= 3 (inv@313@01 r)))
    (= (- $Perm.Write (pTaken@314@01 r)) $Perm.No))
  
  :qid |quant-u-246|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@315@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@315@01  $FVF<f>)))
      (and (< (inv@313@01 r) n@288@01) (<= 3 (inv@313@01 r))))
    (=>
      (and (< (inv@313@01 r) n@288@01) (<= 3 (inv@313@01 r)))
      (Set_in r ($FVF.domain_f (as sm@315@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@315@01  $FVF<f>))))
  :qid |qp.fvfDomDef138|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@313@01 r) n@288@01) (<= 3 (inv@313@01 r)))
      (<
        $Perm.No
        (-
          (ite
            (and (< (inv@298@01 r) n@288@01) (<= 3 (inv@298@01 r)))
            $Perm.Write
            $Perm.No)
          (pTaken@309@01 r))))
    (=
      ($FVF.lookup_f (as sm@315@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@291@01)))))) r)))
  :pattern (($FVF.lookup_f (as sm@315@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@291@01)))))) r))
  :qid |qp.fvfValDef137|)))
(assert (P01%trigger ($Snap.combine
  ($Snap.first $t@291@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$FVF<f>To$Snap (as sm@311@01  $FVF<f>))
          ($SortWrappers.$FVF<f>To$Snap (as sm@315@01  $FVF<f>))))))) x@287@01 n@288@01))
; [exec]
; assert v1 == fun04(x, n, 2)
; [eval] v1 == fun04(x, n, 2)
; [eval] fun04(x, n, 2)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 < i
; [eval] i < n
(push) ; 4
(assert (not (< 2 n@288@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (< 2 n@288@01))
(assert (fun04%precondition ($Snap.combine
  ($Snap.combine
    ($Snap.first $t@291@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.$FVF<f>To$Snap (as sm@311@01  $FVF<f>))
            ($SortWrappers.$FVF<f>To$Snap (as sm@315@01  $FVF<f>)))))))
  ($Snap.combine $Snap.unit $Snap.unit)) x@287@01 n@288@01 2))
(pop) ; 3
; Joined path conditions
(assert (and
  (< 2 n@288@01)
  (fun04%precondition ($Snap.combine
    ($Snap.combine
      ($Snap.first $t@291@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($SortWrappers.$FVF<f>To$Snap (as sm@311@01  $FVF<f>))
              ($SortWrappers.$FVF<f>To$Snap (as sm@315@01  $FVF<f>)))))))
    ($Snap.combine $Snap.unit $Snap.unit)) x@287@01 n@288@01 2)))
(push) ; 3
(assert (not (=
  v1@301@01
  (fun04 ($Snap.combine
    ($Snap.combine
      ($Snap.first $t@291@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($SortWrappers.$FVF<f>To$Snap (as sm@311@01  $FVF<f>))
              ($SortWrappers.$FVF<f>To$Snap (as sm@315@01  $FVF<f>)))))))
    ($Snap.combine $Snap.unit $Snap.unit)) x@287@01 n@288@01 2))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (=
  v1@301@01
  (fun04 ($Snap.combine
    ($Snap.combine
      ($Snap.first $t@291@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($SortWrappers.$FVF<f>To$Snap (as sm@311@01  $FVF<f>))
              ($SortWrappers.$FVF<f>To$Snap (as sm@315@01  $FVF<f>)))))))
    ($Snap.combine $Snap.unit $Snap.unit)) x@287@01 n@288@01 2)))
; [exec]
; assert v2 == fun04(x, n, 4)
; [eval] v2 == fun04(x, n, 4)
; [eval] fun04(x, n, 4)
(push) ; 3
; [eval] 0 < i
; [eval] i < n
(push) ; 4
(assert (not (< 4 n@288@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (< 4 n@288@01))
(assert (fun04%precondition ($Snap.combine
  ($Snap.combine
    ($Snap.first $t@291@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.$FVF<f>To$Snap (as sm@311@01  $FVF<f>))
            ($SortWrappers.$FVF<f>To$Snap (as sm@315@01  $FVF<f>)))))))
  ($Snap.combine $Snap.unit $Snap.unit)) x@287@01 n@288@01 4))
(pop) ; 3
; Joined path conditions
(assert (and
  (< 4 n@288@01)
  (fun04%precondition ($Snap.combine
    ($Snap.combine
      ($Snap.first $t@291@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($SortWrappers.$FVF<f>To$Snap (as sm@311@01  $FVF<f>))
              ($SortWrappers.$FVF<f>To$Snap (as sm@315@01  $FVF<f>)))))))
    ($Snap.combine $Snap.unit $Snap.unit)) x@287@01 n@288@01 4)))
(push) ; 3
(assert (not (=
  v2@304@01
  (fun04 ($Snap.combine
    ($Snap.combine
      ($Snap.first $t@291@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($SortWrappers.$FVF<f>To$Snap (as sm@311@01  $FVF<f>))
              ($SortWrappers.$FVF<f>To$Snap (as sm@315@01  $FVF<f>)))))))
    ($Snap.combine $Snap.unit $Snap.unit)) x@287@01 n@288@01 4))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (=
  v2@304@01
  (fun04 ($Snap.combine
    ($Snap.combine
      ($Snap.first $t@291@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($SortWrappers.$FVF<f>To$Snap (as sm@311@01  $FVF<f>))
              ($SortWrappers.$FVF<f>To$Snap (as sm@315@01  $FVF<f>)))))))
    ($Snap.combine $Snap.unit $Snap.unit)) x@287@01 n@288@01 4)))
; [exec]
; unfold acc(P01(x, n), write)
; [eval] |x.ss| == n
; [eval] |x.ss|
; [eval] 3 <= n
; [eval] (forall k: Int, j: Int :: { x.ss[k], x.ss[j] } k >= 0 && (k < |x.ss| && (j >= 0 && (j < |x.ss| && k != j))) ==> x.ss[k] != x.ss[j])
(declare-const k@316@01 Int)
(declare-const j@317@01 Int)
(push) ; 3
; [eval] k >= 0 && (k < |x.ss| && (j >= 0 && (j < |x.ss| && k != j))) ==> x.ss[k] != x.ss[j]
; [eval] k >= 0 && (k < |x.ss| && (j >= 0 && (j < |x.ss| && k != j)))
; [eval] k >= 0
(push) ; 4
; [then-branch: 165 | k@316@01 >= 0 | live]
; [else-branch: 165 | !(k@316@01 >= 0) | live]
(push) ; 5
; [then-branch: 165 | k@316@01 >= 0]
(assert (>= k@316@01 0))
; [eval] k < |x.ss|
; [eval] |x.ss|
(push) ; 6
; [then-branch: 166 | k@316@01 < |First:($t@291@01)| | live]
; [else-branch: 166 | !(k@316@01 < |First:($t@291@01)|) | live]
(push) ; 7
; [then-branch: 166 | k@316@01 < |First:($t@291@01)|]
(assert (<
  k@316@01
  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
; [eval] j >= 0
(push) ; 8
; [then-branch: 167 | j@317@01 >= 0 | live]
; [else-branch: 167 | !(j@317@01 >= 0) | live]
(push) ; 9
; [then-branch: 167 | j@317@01 >= 0]
(assert (>= j@317@01 0))
; [eval] j < |x.ss|
; [eval] |x.ss|
(push) ; 10
; [then-branch: 168 | j@317@01 < |First:($t@291@01)| | live]
; [else-branch: 168 | !(j@317@01 < |First:($t@291@01)|) | live]
(push) ; 11
; [then-branch: 168 | j@317@01 < |First:($t@291@01)|]
(assert (<
  j@317@01
  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
; [eval] k != j
(pop) ; 11
(push) ; 11
; [else-branch: 168 | !(j@317@01 < |First:($t@291@01)|)]
(assert (not
  (<
    j@317@01
    (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))))))
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (<
      j@317@01
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
  (<
    j@317@01
    (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))))))
(pop) ; 9
(push) ; 9
; [else-branch: 167 | !(j@317@01 >= 0)]
(assert (not (>= j@317@01 0)))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (=>
  (>= j@317@01 0)
  (and
    (>= j@317@01 0)
    (or
      (not
        (<
          j@317@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
      (<
        j@317@01
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))))))))
; Joined path conditions
(assert (or (not (>= j@317@01 0)) (>= j@317@01 0)))
(pop) ; 7
(push) ; 7
; [else-branch: 166 | !(k@316@01 < |First:($t@291@01)|)]
(assert (not
  (<
    k@316@01
    (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (<
    k@316@01
    (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))))
  (and
    (<
      k@316@01
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))))
    (=>
      (>= j@317@01 0)
      (and
        (>= j@317@01 0)
        (or
          (not
            (<
              j@317@01
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
          (<
            j@317@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))))
    (or (not (>= j@317@01 0)) (>= j@317@01 0)))))
; Joined path conditions
(assert (or
  (not
    (<
      k@316@01
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
  (<
    k@316@01
    (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))))))
(pop) ; 5
(push) ; 5
; [else-branch: 165 | !(k@316@01 >= 0)]
(assert (not (>= k@316@01 0)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (>= k@316@01 0)
  (and
    (>= k@316@01 0)
    (=>
      (<
        k@316@01
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))))
      (and
        (<
          k@316@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))))
        (=>
          (>= j@317@01 0)
          (and
            (>= j@317@01 0)
            (or
              (not
                (<
                  j@317@01
                  (Seq_length
                    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
              (<
                j@317@01
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))))
        (or (not (>= j@317@01 0)) (>= j@317@01 0))))
    (or
      (not
        (<
          k@316@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
      (<
        k@316@01
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))))))))
; Joined path conditions
(assert (or (not (>= k@316@01 0)) (>= k@316@01 0)))
(push) ; 4
; [then-branch: 169 | k@316@01 != j@317@01 && j@317@01 < |First:($t@291@01)| && j@317@01 >= 0 && k@316@01 < |First:($t@291@01)| && k@316@01 >= 0 | live]
; [else-branch: 169 | !(k@316@01 != j@317@01 && j@317@01 < |First:($t@291@01)| && j@317@01 >= 0 && k@316@01 < |First:($t@291@01)| && k@316@01 >= 0) | live]
(push) ; 5
; [then-branch: 169 | k@316@01 != j@317@01 && j@317@01 < |First:($t@291@01)| && j@317@01 >= 0 && k@316@01 < |First:($t@291@01)| && k@316@01 >= 0]
(assert (and
  (and
    (and
      (and
        (not (= k@316@01 j@317@01))
        (<
          j@317@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
      (>= j@317@01 0))
    (<
      k@316@01
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
  (>= k@316@01 0)))
; [eval] x.ss[k] != x.ss[j]
; [eval] x.ss[k]
; [eval] x.ss[j]
(pop) ; 5
(push) ; 5
; [else-branch: 169 | !(k@316@01 != j@317@01 && j@317@01 < |First:($t@291@01)| && j@317@01 >= 0 && k@316@01 < |First:($t@291@01)| && k@316@01 >= 0)]
(assert (not
  (and
    (and
      (and
        (and
          (not (= k@316@01 j@317@01))
          (<
            j@317@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
        (>= j@317@01 0))
      (<
        k@316@01
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
    (>= k@316@01 0))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (and
      (and
        (and
          (not (= k@316@01 j@317@01))
          (<
            j@317@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
        (>= j@317@01 0))
      (<
        k@316@01
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
    (>= k@316@01 0))
  (and
    (not (= k@316@01 j@317@01))
    (<
      j@317@01
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))))
    (>= j@317@01 0)
    (<
      k@316@01
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))))
    (>= k@316@01 0))))
; Joined path conditions
(assert (or
  (not
    (and
      (and
        (and
          (and
            (not (= k@316@01 j@317@01))
            (<
              j@317@01
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
          (>= j@317@01 0))
        (<
          k@316@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
      (>= k@316@01 0)))
  (and
    (and
      (and
        (and
          (not (= k@316@01 j@317@01))
          (<
            j@317@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
        (>= j@317@01 0))
      (<
        k@316@01
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
    (>= k@316@01 0))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@316@01 Int) (j@317@01 Int)) (!
  (and
    (=>
      (>= k@316@01 0)
      (and
        (>= k@316@01 0)
        (=>
          (<
            k@316@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))))
          (and
            (<
              k@316@01
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))))
            (=>
              (>= j@317@01 0)
              (and
                (>= j@317@01 0)
                (or
                  (not
                    (<
                      j@317@01
                      (Seq_length
                        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
                  (<
                    j@317@01
                    (Seq_length
                      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))))
            (or (not (>= j@317@01 0)) (>= j@317@01 0))))
        (or
          (not
            (<
              k@316@01
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
          (<
            k@316@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))))
    (or (not (>= k@316@01 0)) (>= k@316@01 0))
    (=>
      (and
        (and
          (and
            (and
              (not (= k@316@01 j@317@01))
              (<
                j@317@01
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
            (>= j@317@01 0))
          (<
            k@316@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
        (>= k@316@01 0))
      (and
        (not (= k@316@01 j@317@01))
        (<
          j@317@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))))
        (>= j@317@01 0)
        (<
          k@316@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))))
        (>= k@316@01 0)))
    (or
      (not
        (and
          (and
            (and
              (and
                (not (= k@316@01 j@317@01))
                (<
                  j@317@01
                  (Seq_length
                    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
              (>= j@317@01 0))
            (<
              k@316@01
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
          (>= k@316@01 0)))
      (and
        (and
          (and
            (and
              (not (= k@316@01 j@317@01))
              (<
                j@317@01
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
            (>= j@317@01 0))
          (<
            k@316@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
        (>= k@316@01 0))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
    k@316@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
    j@317@01))
  :qid |prog.l132-aux|)))
(assert (forall ((k@316@01 Int) (j@317@01 Int)) (!
  (=>
    (and
      (and
        (and
          (and
            (not (= k@316@01 j@317@01))
            (<
              j@317@01
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
          (>= j@317@01 0))
        (<
          k@316@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
      (>= k@316@01 0))
    (not
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
          k@316@01)
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
          j@317@01))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
    k@316@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
    j@317@01))
  :qid |prog.l132|)))
(declare-const j@318@01 Int)
(push) ; 3
; [eval] 0 <= j && j < 3
; [eval] 0 <= j
(push) ; 4
; [then-branch: 170 | 0 <= j@318@01 | live]
; [else-branch: 170 | !(0 <= j@318@01) | live]
(push) ; 5
; [then-branch: 170 | 0 <= j@318@01]
(assert (<= 0 j@318@01))
; [eval] j < 3
(pop) ; 5
(push) ; 5
; [else-branch: 170 | !(0 <= j@318@01)]
(assert (not (<= 0 j@318@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 j@318@01)) (<= 0 j@318@01)))
(assert (and (< j@318@01 3) (<= 0 j@318@01)))
; [eval] x.ss[j]
(push) ; 4
(assert (not (>= j@318@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (<
  j@318@01
  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@319@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@318@01 Int)) (!
  (=>
    (and (< j@318@01 3) (<= 0 j@318@01))
    (or (not (<= 0 j@318@01)) (<= 0 j@318@01)))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
    j@318@01))
  :qid |f-aux|)))
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((j@318@01 Int)) (!
  (=>
    (and (< j@318@01 3) (<= 0 j@318@01))
    (=
      (inv@319@01 (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
        j@318@01))
      j@318@01))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
    j@318@01))
  :qid |quant-u-248|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@319@01 r) 3) (<= 0 (inv@319@01 r)))
    (=
      (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
        (inv@319@01 r))
      r))
  :pattern ((inv@319@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j@318@01 Int)) (!
  (=>
    (and (< j@318@01 3) (<= 0 j@318@01))
    (not
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
          j@318@01)
        $Ref.null)))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
    j@318@01))
  :qid |f-permImpliesNonNull|)))
(declare-const j@320@01 Int)
(push) ; 3
; [eval] 3 <= j && j < n
; [eval] 3 <= j
(push) ; 4
; [then-branch: 171 | 3 <= j@320@01 | live]
; [else-branch: 171 | !(3 <= j@320@01) | live]
(push) ; 5
; [then-branch: 171 | 3 <= j@320@01]
(assert (<= 3 j@320@01))
; [eval] j < n
(pop) ; 5
(push) ; 5
; [else-branch: 171 | !(3 <= j@320@01)]
(assert (not (<= 3 j@320@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 3 j@320@01)) (<= 3 j@320@01)))
(assert (and (< j@320@01 n@288@01) (<= 3 j@320@01)))
; [eval] x.ss[j]
(push) ; 4
(assert (not (>= j@320@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (<
  j@320@01
  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@321@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@320@01 Int)) (!
  (=>
    (and (< j@320@01 n@288@01) (<= 3 j@320@01))
    (or (not (<= 3 j@320@01)) (<= 3 j@320@01)))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
    j@320@01))
  :qid |f-aux|)))
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((j@320@01 Int)) (!
  (=>
    (and (< j@320@01 n@288@01) (<= 3 j@320@01))
    (=
      (inv@321@01 (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
        j@320@01))
      j@320@01))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
    j@320@01))
  :qid |quant-u-250|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@321@01 r) n@288@01) (<= 3 (inv@321@01 r)))
    (=
      (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
        (inv@321@01 r))
      r))
  :pattern ((inv@321@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j@320@01 Int)) (!
  (=>
    (and (< j@320@01 n@288@01) (<= 3 j@320@01))
    (not
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
          j@320@01)
        $Ref.null)))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
    j@320@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
; [exec]
; x.ss[4].f := 0
; [eval] x.ss[4]
(set-option :timeout 0)
(push) ; 3
(assert (not (< 4 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@322@01 ((r $Ref)) $Perm
  (ite
    (= r (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)) 4))
    ($Perm.min
      (ite
        (and (< (inv@321@01 r) n@288@01) (<= 3 (inv@321@01 r)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@323@01 ((r $Ref)) $Perm
  (ite
    (= r (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)) 4))
    ($Perm.min
      (ite (and (< (inv@319@01 r) 3) (<= 0 (inv@319@01 r))) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@322@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (< (inv@321@01 r) n@288@01) (<= 3 (inv@321@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@322@01 r))
    $Perm.No)
  
  :qid |quant-u-252|))))
(check-sat)
; unknown
(pop) ; 3
; 0.01s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)) 4))
    (= (- $Perm.Write (pTaken@322@01 r)) $Perm.No))
  
  :qid |quant-u-253|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@324@01 $FVF<f>)
; Definitional axioms for singleton-FVF's value
(assert (=
  ($FVF.lookup_f (as sm@324@01  $FVF<f>) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
    4))
  0))
; [exec]
; fold acc(P01(x, n), write)
; [eval] |x.ss| == n
; [eval] |x.ss|
; [eval] 3 <= n
; [eval] (forall k: Int, j: Int :: { x.ss[k], x.ss[j] } k >= 0 && (k < |x.ss| && (j >= 0 && (j < |x.ss| && k != j))) ==> x.ss[k] != x.ss[j])
(declare-const k@325@01 Int)
(declare-const j@326@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] k >= 0 && (k < |x.ss| && (j >= 0 && (j < |x.ss| && k != j))) ==> x.ss[k] != x.ss[j]
; [eval] k >= 0 && (k < |x.ss| && (j >= 0 && (j < |x.ss| && k != j)))
; [eval] k >= 0
(push) ; 4
; [then-branch: 172 | k@325@01 >= 0 | live]
; [else-branch: 172 | !(k@325@01 >= 0) | live]
(push) ; 5
; [then-branch: 172 | k@325@01 >= 0]
(assert (>= k@325@01 0))
; [eval] k < |x.ss|
; [eval] |x.ss|
(push) ; 6
; [then-branch: 173 | k@325@01 < |First:($t@291@01)| | live]
; [else-branch: 173 | !(k@325@01 < |First:($t@291@01)|) | live]
(push) ; 7
; [then-branch: 173 | k@325@01 < |First:($t@291@01)|]
(assert (<
  k@325@01
  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
; [eval] j >= 0
(push) ; 8
; [then-branch: 174 | j@326@01 >= 0 | live]
; [else-branch: 174 | !(j@326@01 >= 0) | live]
(push) ; 9
; [then-branch: 174 | j@326@01 >= 0]
(assert (>= j@326@01 0))
; [eval] j < |x.ss|
; [eval] |x.ss|
(push) ; 10
; [then-branch: 175 | j@326@01 < |First:($t@291@01)| | live]
; [else-branch: 175 | !(j@326@01 < |First:($t@291@01)|) | live]
(push) ; 11
; [then-branch: 175 | j@326@01 < |First:($t@291@01)|]
(assert (<
  j@326@01
  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
; [eval] k != j
(pop) ; 11
(push) ; 11
; [else-branch: 175 | !(j@326@01 < |First:($t@291@01)|)]
(assert (not
  (<
    j@326@01
    (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))))))
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (<
      j@326@01
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
  (<
    j@326@01
    (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))))))
(pop) ; 9
(push) ; 9
; [else-branch: 174 | !(j@326@01 >= 0)]
(assert (not (>= j@326@01 0)))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (=>
  (>= j@326@01 0)
  (and
    (>= j@326@01 0)
    (or
      (not
        (<
          j@326@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
      (<
        j@326@01
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))))))))
; Joined path conditions
(assert (or (not (>= j@326@01 0)) (>= j@326@01 0)))
(pop) ; 7
(push) ; 7
; [else-branch: 173 | !(k@325@01 < |First:($t@291@01)|)]
(assert (not
  (<
    k@325@01
    (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (<
    k@325@01
    (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))))
  (and
    (<
      k@325@01
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))))
    (=>
      (>= j@326@01 0)
      (and
        (>= j@326@01 0)
        (or
          (not
            (<
              j@326@01
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
          (<
            j@326@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))))
    (or (not (>= j@326@01 0)) (>= j@326@01 0)))))
; Joined path conditions
(assert (or
  (not
    (<
      k@325@01
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
  (<
    k@325@01
    (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))))))
(pop) ; 5
(push) ; 5
; [else-branch: 172 | !(k@325@01 >= 0)]
(assert (not (>= k@325@01 0)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (>= k@325@01 0)
  (and
    (>= k@325@01 0)
    (=>
      (<
        k@325@01
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))))
      (and
        (<
          k@325@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))))
        (=>
          (>= j@326@01 0)
          (and
            (>= j@326@01 0)
            (or
              (not
                (<
                  j@326@01
                  (Seq_length
                    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
              (<
                j@326@01
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))))
        (or (not (>= j@326@01 0)) (>= j@326@01 0))))
    (or
      (not
        (<
          k@325@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
      (<
        k@325@01
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))))))))
; Joined path conditions
(assert (or (not (>= k@325@01 0)) (>= k@325@01 0)))
(push) ; 4
; [then-branch: 176 | k@325@01 != j@326@01 && j@326@01 < |First:($t@291@01)| && j@326@01 >= 0 && k@325@01 < |First:($t@291@01)| && k@325@01 >= 0 | live]
; [else-branch: 176 | !(k@325@01 != j@326@01 && j@326@01 < |First:($t@291@01)| && j@326@01 >= 0 && k@325@01 < |First:($t@291@01)| && k@325@01 >= 0) | live]
(push) ; 5
; [then-branch: 176 | k@325@01 != j@326@01 && j@326@01 < |First:($t@291@01)| && j@326@01 >= 0 && k@325@01 < |First:($t@291@01)| && k@325@01 >= 0]
(assert (and
  (and
    (and
      (and
        (not (= k@325@01 j@326@01))
        (<
          j@326@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
      (>= j@326@01 0))
    (<
      k@325@01
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
  (>= k@325@01 0)))
; [eval] x.ss[k] != x.ss[j]
; [eval] x.ss[k]
; [eval] x.ss[j]
(pop) ; 5
(push) ; 5
; [else-branch: 176 | !(k@325@01 != j@326@01 && j@326@01 < |First:($t@291@01)| && j@326@01 >= 0 && k@325@01 < |First:($t@291@01)| && k@325@01 >= 0)]
(assert (not
  (and
    (and
      (and
        (and
          (not (= k@325@01 j@326@01))
          (<
            j@326@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
        (>= j@326@01 0))
      (<
        k@325@01
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
    (>= k@325@01 0))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (and
      (and
        (and
          (not (= k@325@01 j@326@01))
          (<
            j@326@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
        (>= j@326@01 0))
      (<
        k@325@01
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
    (>= k@325@01 0))
  (and
    (not (= k@325@01 j@326@01))
    (<
      j@326@01
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))))
    (>= j@326@01 0)
    (<
      k@325@01
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))))
    (>= k@325@01 0))))
; Joined path conditions
(assert (or
  (not
    (and
      (and
        (and
          (and
            (not (= k@325@01 j@326@01))
            (<
              j@326@01
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
          (>= j@326@01 0))
        (<
          k@325@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
      (>= k@325@01 0)))
  (and
    (and
      (and
        (and
          (not (= k@325@01 j@326@01))
          (<
            j@326@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
        (>= j@326@01 0))
      (<
        k@325@01
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
    (>= k@325@01 0))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@325@01 Int) (j@326@01 Int)) (!
  (and
    (=>
      (>= k@325@01 0)
      (and
        (>= k@325@01 0)
        (=>
          (<
            k@325@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))))
          (and
            (<
              k@325@01
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))))
            (=>
              (>= j@326@01 0)
              (and
                (>= j@326@01 0)
                (or
                  (not
                    (<
                      j@326@01
                      (Seq_length
                        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
                  (<
                    j@326@01
                    (Seq_length
                      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))))
            (or (not (>= j@326@01 0)) (>= j@326@01 0))))
        (or
          (not
            (<
              k@325@01
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
          (<
            k@325@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))))
    (or (not (>= k@325@01 0)) (>= k@325@01 0))
    (=>
      (and
        (and
          (and
            (and
              (not (= k@325@01 j@326@01))
              (<
                j@326@01
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
            (>= j@326@01 0))
          (<
            k@325@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
        (>= k@325@01 0))
      (and
        (not (= k@325@01 j@326@01))
        (<
          j@326@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))))
        (>= j@326@01 0)
        (<
          k@325@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))))
        (>= k@325@01 0)))
    (or
      (not
        (and
          (and
            (and
              (and
                (not (= k@325@01 j@326@01))
                (<
                  j@326@01
                  (Seq_length
                    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
              (>= j@326@01 0))
            (<
              k@325@01
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
          (>= k@325@01 0)))
      (and
        (and
          (and
            (and
              (not (= k@325@01 j@326@01))
              (<
                j@326@01
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
            (>= j@326@01 0))
          (<
            k@325@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
        (>= k@325@01 0))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
    k@325@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
    j@326@01))
  :qid |prog.l132-aux|)))
(push) ; 3
(assert (not (forall ((k@325@01 Int) (j@326@01 Int)) (!
  (=>
    (and
      (and
        (and
          (and
            (not (= k@325@01 j@326@01))
            (<
              j@326@01
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
          (>= j@326@01 0))
        (<
          k@325@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
      (>= k@325@01 0))
    (not
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
          k@325@01)
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
          j@326@01))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
    k@325@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
    j@326@01))
  :qid |prog.l132|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (forall ((k@325@01 Int) (j@326@01 Int)) (!
  (=>
    (and
      (and
        (and
          (and
            (not (= k@325@01 j@326@01))
            (<
              j@326@01
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
          (>= j@326@01 0))
        (<
          k@325@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)))))
      (>= k@325@01 0))
    (not
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
          k@325@01)
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
          j@326@01))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
    k@325@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
    j@326@01))
  :qid |prog.l132|)))
(declare-const j@327@01 Int)
(push) ; 3
; [eval] 0 <= j && j < 3
; [eval] 0 <= j
(push) ; 4
; [then-branch: 177 | 0 <= j@327@01 | live]
; [else-branch: 177 | !(0 <= j@327@01) | live]
(push) ; 5
; [then-branch: 177 | 0 <= j@327@01]
(assert (<= 0 j@327@01))
; [eval] j < 3
(pop) ; 5
(push) ; 5
; [else-branch: 177 | !(0 <= j@327@01)]
(assert (not (<= 0 j@327@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 j@327@01)) (<= 0 j@327@01)))
(assert (and (< j@327@01 3) (<= 0 j@327@01)))
; [eval] x.ss[j]
(push) ; 4
(assert (not (>= j@327@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (<
  j@327@01
  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@328@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@327@01 Int)) (!
  (=>
    (and (< j@327@01 3) (<= 0 j@327@01))
    (or (not (<= 0 j@327@01)) (<= 0 j@327@01)))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
    j@327@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j1@327@01 Int) (j2@327@01 Int)) (!
  (=>
    (and
      (and (< j1@327@01 3) (<= 0 j1@327@01))
      (and (< j2@327@01 3) (<= 0 j2@327@01))
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
          j1@327@01)
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
          j2@327@01)))
    (= j1@327@01 j2@327@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@327@01 Int)) (!
  (=>
    (and (< j@327@01 3) (<= 0 j@327@01))
    (=
      (inv@328@01 (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
        j@327@01))
      j@327@01))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
    j@327@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@328@01 r) 3) (<= 0 (inv@328@01 r)))
    (=
      (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
        (inv@328@01 r))
      r))
  :pattern ((inv@328@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@329@01 ((r $Ref)) $Perm
  (ite
    (and (< (inv@328@01 r) 3) (<= 0 (inv@328@01 r)))
    ($Perm.min
      (ite
        (=
          r
          (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)) 4))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@330@01 ((r $Ref)) $Perm
  (ite
    (and (< (inv@328@01 r) 3) (<= 0 (inv@328@01 r)))
    ($Perm.min
      (ite (and (< (inv@319@01 r) 3) (<= 0 (inv@319@01 r))) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@329@01 r)))
    $Perm.No))
(define-fun pTaken@331@01 ((r $Ref)) $Perm
  (ite
    (and (< (inv@328@01 r) 3) (<= 0 (inv@328@01 r)))
    ($Perm.min
      (-
        (ite
          (and (< (inv@321@01 r) n@288@01) (<= 3 (inv@321@01 r)))
          $Perm.Write
          $Perm.No)
        (pTaken@322@01 r))
      (- (- $Perm.Write (pTaken@329@01 r)) (pTaken@330@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (=
  (-
    (ite
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)) 4)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)) 4))
      $Perm.Write
      $Perm.No)
    (pTaken@329@01 (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
      4)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 3
; 0.01s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (< (inv@328@01 r) 3) (<= 0 (inv@328@01 r)))
    (= (- $Perm.Write (pTaken@329@01 r)) $Perm.No))
  
  :qid |quant-u-257|))))
(check-sat)
; unknown
(pop) ; 3
; 0.01s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite (and (< (inv@319@01 r) 3) (<= 0 (inv@319@01 r))) $Perm.Write $Perm.No)
      (pTaken@330@01 r))
    $Perm.No)
  
  :qid |quant-u-258|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (< (inv@328@01 r) 3) (<= 0 (inv@328@01 r)))
    (= (- (- $Perm.Write (pTaken@329@01 r)) (pTaken@330@01 r)) $Perm.No))
  
  :qid |quant-u-259|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@332@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@332@01  $FVF<f>)))
      (and (< (inv@328@01 r) 3) (<= 0 (inv@328@01 r))))
    (=>
      (and (< (inv@328@01 r) 3) (<= 0 (inv@328@01 r)))
      (Set_in r ($FVF.domain_f (as sm@332@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@332@01  $FVF<f>))))
  :qid |qp.fvfDomDef142|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@328@01 r) 3) (<= 0 (inv@328@01 r)))
      (=
        r
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)) 4)))
    (=
      ($FVF.lookup_f (as sm@332@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@324@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@332@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@324@01  $FVF<f>) r))
  :qid |qp.fvfValDef139|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@328@01 r) 3) (<= 0 (inv@328@01 r)))
      (and (< (inv@319@01 r) 3) (<= 0 (inv@319@01 r))))
    (=
      ($FVF.lookup_f (as sm@332@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@311@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@332@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@311@01  $FVF<f>) r))
  :qid |qp.fvfValDef140|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@328@01 r) 3) (<= 0 (inv@328@01 r)))
      (<
        $Perm.No
        (-
          (ite
            (and (< (inv@321@01 r) n@288@01) (<= 3 (inv@321@01 r)))
            $Perm.Write
            $Perm.No)
          (pTaken@322@01 r))))
    (=
      ($FVF.lookup_f (as sm@332@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@315@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@332@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@315@01  $FVF<f>) r))
  :qid |qp.fvfValDef141|)))
(declare-const j@333@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 3 <= j && j < n
; [eval] 3 <= j
(push) ; 4
; [then-branch: 178 | 3 <= j@333@01 | live]
; [else-branch: 178 | !(3 <= j@333@01) | live]
(push) ; 5
; [then-branch: 178 | 3 <= j@333@01]
(assert (<= 3 j@333@01))
; [eval] j < n
(pop) ; 5
(push) ; 5
; [else-branch: 178 | !(3 <= j@333@01)]
(assert (not (<= 3 j@333@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 3 j@333@01)) (<= 3 j@333@01)))
(assert (and (< j@333@01 n@288@01) (<= 3 j@333@01)))
; [eval] x.ss[j]
(push) ; 4
(assert (not (>= j@333@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (<
  j@333@01
  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@334@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@333@01 Int)) (!
  (=>
    (and (< j@333@01 n@288@01) (<= 3 j@333@01))
    (or (not (<= 3 j@333@01)) (<= 3 j@333@01)))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
    j@333@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j1@333@01 Int) (j2@333@01 Int)) (!
  (=>
    (and
      (and (< j1@333@01 n@288@01) (<= 3 j1@333@01))
      (and (< j2@333@01 n@288@01) (<= 3 j2@333@01))
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
          j1@333@01)
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
          j2@333@01)))
    (= j1@333@01 j2@333@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@333@01 Int)) (!
  (=>
    (and (< j@333@01 n@288@01) (<= 3 j@333@01))
    (=
      (inv@334@01 (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
        j@333@01))
      j@333@01))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
    j@333@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@334@01 r) n@288@01) (<= 3 (inv@334@01 r)))
    (=
      (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
        (inv@334@01 r))
      r))
  :pattern ((inv@334@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@335@01 ((r $Ref)) $Perm
  (ite
    (and (< (inv@334@01 r) n@288@01) (<= 3 (inv@334@01 r)))
    ($Perm.min
      (-
        (ite
          (and (< (inv@321@01 r) n@288@01) (<= 3 (inv@321@01 r)))
          $Perm.Write
          $Perm.No)
        (pTaken@322@01 r))
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@336@01 ((r $Ref)) $Perm
  (ite
    (and (< (inv@334@01 r) n@288@01) (<= 3 (inv@334@01 r)))
    ($Perm.min
      (-
        (ite
          (=
            r
            (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
              4))
          $Perm.Write
          $Perm.No)
        (pTaken@329@01 r))
      (- $Perm.Write (pTaken@335@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (-
        (ite
          (and (< (inv@321@01 r) n@288@01) (<= 3 (inv@321@01 r)))
          $Perm.Write
          $Perm.No)
        (pTaken@322@01 r))
      (pTaken@335@01 r))
    $Perm.No)
  
  :qid |quant-u-262|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (< (inv@334@01 r) n@288@01) (<= 3 (inv@334@01 r)))
    (= (- $Perm.Write (pTaken@335@01 r)) $Perm.No))
  
  :qid |quant-u-263|))))
(check-sat)
; unknown
(pop) ; 3
; 0.01s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (=
  (-
    (-
      (ite
        (=
          (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)) 4)
          (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01)) 4))
        $Perm.Write
        $Perm.No)
      (pTaken@329@01 (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
        4)))
    (pTaken@336@01 (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
      4)))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (< (inv@334@01 r) n@288@01) (<= 3 (inv@334@01 r)))
    (= (- (- $Perm.Write (pTaken@335@01 r)) (pTaken@336@01 r)) $Perm.No))
  
  :qid |quant-u-265|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@337@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@337@01  $FVF<f>)))
      (and (< (inv@334@01 r) n@288@01) (<= 3 (inv@334@01 r))))
    (=>
      (and (< (inv@334@01 r) n@288@01) (<= 3 (inv@334@01 r)))
      (Set_in r ($FVF.domain_f (as sm@337@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@337@01  $FVF<f>))))
  :qid |qp.fvfDomDef145|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@334@01 r) n@288@01) (<= 3 (inv@334@01 r)))
      (<
        $Perm.No
        (-
          (ite
            (and (< (inv@321@01 r) n@288@01) (<= 3 (inv@321@01 r)))
            $Perm.Write
            $Perm.No)
          (pTaken@322@01 r))))
    (=
      ($FVF.lookup_f (as sm@337@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@315@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@337@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@315@01  $FVF<f>) r))
  :qid |qp.fvfValDef143|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@334@01 r) n@288@01) (<= 3 (inv@334@01 r)))
      (<
        $Perm.No
        (-
          (ite
            (=
              r
              (Seq_index
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@291@01))
                4))
            $Perm.Write
            $Perm.No)
          (pTaken@329@01 r))))
    (=
      ($FVF.lookup_f (as sm@337@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@324@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@337@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@324@01  $FVF<f>) r))
  :qid |qp.fvfValDef144|)))
(assert (P01%trigger ($Snap.combine
  ($Snap.first $t@291@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$FVF<f>To$Snap (as sm@332@01  $FVF<f>))
          ($SortWrappers.$FVF<f>To$Snap (as sm@337@01  $FVF<f>))))))) x@287@01 n@288@01))
; [exec]
; assert v1 == fun04(x, n, 2)
; [eval] v1 == fun04(x, n, 2)
; [eval] fun04(x, n, 2)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 < i
; [eval] i < n
(assert (fun04%precondition ($Snap.combine
  ($Snap.combine
    ($Snap.first $t@291@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.$FVF<f>To$Snap (as sm@332@01  $FVF<f>))
            ($SortWrappers.$FVF<f>To$Snap (as sm@337@01  $FVF<f>)))))))
  ($Snap.combine $Snap.unit $Snap.unit)) x@287@01 n@288@01 2))
(pop) ; 3
; Joined path conditions
(assert (fun04%precondition ($Snap.combine
  ($Snap.combine
    ($Snap.first $t@291@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.$FVF<f>To$Snap (as sm@332@01  $FVF<f>))
            ($SortWrappers.$FVF<f>To$Snap (as sm@337@01  $FVF<f>)))))))
  ($Snap.combine $Snap.unit $Snap.unit)) x@287@01 n@288@01 2))
(push) ; 3
(assert (not (=
  v1@301@01
  (fun04 ($Snap.combine
    ($Snap.combine
      ($Snap.first $t@291@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($SortWrappers.$FVF<f>To$Snap (as sm@332@01  $FVF<f>))
              ($SortWrappers.$FVF<f>To$Snap (as sm@337@01  $FVF<f>)))))))
    ($Snap.combine $Snap.unit $Snap.unit)) x@287@01 n@288@01 2))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (=
  v1@301@01
  (fun04 ($Snap.combine
    ($Snap.combine
      ($Snap.first $t@291@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($SortWrappers.$FVF<f>To$Snap (as sm@332@01  $FVF<f>))
              ($SortWrappers.$FVF<f>To$Snap (as sm@337@01  $FVF<f>)))))))
    ($Snap.combine $Snap.unit $Snap.unit)) x@287@01 n@288@01 2)))
; [exec]
; assert v2 == fun04(x, n, 4)
; [eval] v2 == fun04(x, n, 4)
; [eval] fun04(x, n, 4)
(push) ; 3
; [eval] 0 < i
; [eval] i < n
(assert (fun04%precondition ($Snap.combine
  ($Snap.combine
    ($Snap.first $t@291@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.$FVF<f>To$Snap (as sm@332@01  $FVF<f>))
            ($SortWrappers.$FVF<f>To$Snap (as sm@337@01  $FVF<f>)))))))
  ($Snap.combine $Snap.unit $Snap.unit)) x@287@01 n@288@01 4))
(pop) ; 3
; Joined path conditions
(assert (fun04%precondition ($Snap.combine
  ($Snap.combine
    ($Snap.first $t@291@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.$FVF<f>To$Snap (as sm@332@01  $FVF<f>))
            ($SortWrappers.$FVF<f>To$Snap (as sm@337@01  $FVF<f>)))))))
  ($Snap.combine $Snap.unit $Snap.unit)) x@287@01 n@288@01 4))
(push) ; 3
(assert (not (=
  v2@304@01
  (fun04 ($Snap.combine
    ($Snap.combine
      ($Snap.first $t@291@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($SortWrappers.$FVF<f>To$Snap (as sm@332@01  $FVF<f>))
              ($SortWrappers.$FVF<f>To$Snap (as sm@337@01  $FVF<f>)))))))
    ($Snap.combine $Snap.unit $Snap.unit)) x@287@01 n@288@01 4))))
(check-sat)
; unknown
(pop) ; 3
; 0.09s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] v2 == fun04(x, n, 4)
; [eval] fun04(x, n, 4)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 < i
; [eval] i < n
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (=
  v2@304@01
  (fun04 ($Snap.combine
    ($Snap.combine
      ($Snap.first $t@291@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($SortWrappers.$FVF<f>To$Snap (as sm@332@01  $FVF<f>))
              ($SortWrappers.$FVF<f>To$Snap (as sm@337@01  $FVF<f>)))))))
    ($Snap.combine $Snap.unit $Snap.unit)) x@287@01 n@288@01 4))))
(check-sat)
; unknown
(pop) ; 3
; 0.09s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] v2 == fun04(x, n, 4)
; [eval] fun04(x, n, 4)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 < i
; [eval] i < n
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (=
  v2@304@01
  (fun04 ($Snap.combine
    ($Snap.combine
      ($Snap.first $t@291@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($SortWrappers.$FVF<f>To$Snap (as sm@332@01  $FVF<f>))
              ($SortWrappers.$FVF<f>To$Snap (as sm@337@01  $FVF<f>)))))))
    ($Snap.combine $Snap.unit $Snap.unit)) x@287@01 n@288@01 4))))
(check-sat)
; unknown
(pop) ; 3
; 0.14s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [eval] v2 == fun04(x, n, 4)
; [eval] fun04(x, n, 4)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 < i
; [eval] i < n
(pop) ; 3
; Joined path conditions
(push) ; 3
(assert (not (=
  v2@304@01
  (fun04 ($Snap.combine
    ($Snap.combine
      ($Snap.first $t@291@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($SortWrappers.$FVF<f>To$Snap (as sm@332@01  $FVF<f>))
              ($SortWrappers.$FVF<f>To$Snap (as sm@337@01  $FVF<f>)))))))
    ($Snap.combine $Snap.unit $Snap.unit)) x@287@01 n@288@01 4))))
(check-sat)
; unknown
(pop) ; 3
; 0.09s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test07 ----------
(declare-const xs@338@01 Seq<$Ref>)
(declare-const xs@339@01 Seq<$Ref>)
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
; inhale (forall k: Int, j: Int ::
;     { xs[k], xs[j] }
;     k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==>
;     xs[k] != xs[j])
(declare-const $t@340@01 $Snap)
(assert (= $t@340@01 $Snap.unit))
; [eval] (forall k: Int, j: Int :: { xs[k], xs[j] } k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==> xs[k] != xs[j])
(declare-const k@341@01 Int)
(declare-const j@342@01 Int)
(push) ; 3
; [eval] k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==> xs[k] != xs[j]
; [eval] k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j)))
; [eval] k >= 0
(push) ; 4
; [then-branch: 179 | k@341@01 >= 0 | live]
; [else-branch: 179 | !(k@341@01 >= 0) | live]
(push) ; 5
; [then-branch: 179 | k@341@01 >= 0]
(assert (>= k@341@01 0))
; [eval] k < |xs|
; [eval] |xs|
(push) ; 6
; [then-branch: 180 | k@341@01 < |xs@339@01| | live]
; [else-branch: 180 | !(k@341@01 < |xs@339@01|) | live]
(push) ; 7
; [then-branch: 180 | k@341@01 < |xs@339@01|]
(assert (< k@341@01 (Seq_length xs@339@01)))
; [eval] j >= 0
(push) ; 8
; [then-branch: 181 | j@342@01 >= 0 | live]
; [else-branch: 181 | !(j@342@01 >= 0) | live]
(push) ; 9
; [then-branch: 181 | j@342@01 >= 0]
(assert (>= j@342@01 0))
; [eval] j < |xs|
; [eval] |xs|
(push) ; 10
; [then-branch: 182 | j@342@01 < |xs@339@01| | live]
; [else-branch: 182 | !(j@342@01 < |xs@339@01|) | live]
(push) ; 11
; [then-branch: 182 | j@342@01 < |xs@339@01|]
(assert (< j@342@01 (Seq_length xs@339@01)))
; [eval] k != j
(pop) ; 11
(push) ; 11
; [else-branch: 182 | !(j@342@01 < |xs@339@01|)]
(assert (not (< j@342@01 (Seq_length xs@339@01))))
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (not (< j@342@01 (Seq_length xs@339@01)))
  (< j@342@01 (Seq_length xs@339@01))))
(pop) ; 9
(push) ; 9
; [else-branch: 181 | !(j@342@01 >= 0)]
(assert (not (>= j@342@01 0)))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (=>
  (>= j@342@01 0)
  (and
    (>= j@342@01 0)
    (or
      (not (< j@342@01 (Seq_length xs@339@01)))
      (< j@342@01 (Seq_length xs@339@01))))))
; Joined path conditions
(assert (or (not (>= j@342@01 0)) (>= j@342@01 0)))
(pop) ; 7
(push) ; 7
; [else-branch: 180 | !(k@341@01 < |xs@339@01|)]
(assert (not (< k@341@01 (Seq_length xs@339@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (< k@341@01 (Seq_length xs@339@01))
  (and
    (< k@341@01 (Seq_length xs@339@01))
    (=>
      (>= j@342@01 0)
      (and
        (>= j@342@01 0)
        (or
          (not (< j@342@01 (Seq_length xs@339@01)))
          (< j@342@01 (Seq_length xs@339@01)))))
    (or (not (>= j@342@01 0)) (>= j@342@01 0)))))
; Joined path conditions
(assert (or
  (not (< k@341@01 (Seq_length xs@339@01)))
  (< k@341@01 (Seq_length xs@339@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 179 | !(k@341@01 >= 0)]
(assert (not (>= k@341@01 0)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (>= k@341@01 0)
  (and
    (>= k@341@01 0)
    (=>
      (< k@341@01 (Seq_length xs@339@01))
      (and
        (< k@341@01 (Seq_length xs@339@01))
        (=>
          (>= j@342@01 0)
          (and
            (>= j@342@01 0)
            (or
              (not (< j@342@01 (Seq_length xs@339@01)))
              (< j@342@01 (Seq_length xs@339@01)))))
        (or (not (>= j@342@01 0)) (>= j@342@01 0))))
    (or
      (not (< k@341@01 (Seq_length xs@339@01)))
      (< k@341@01 (Seq_length xs@339@01))))))
; Joined path conditions
(assert (or (not (>= k@341@01 0)) (>= k@341@01 0)))
(push) ; 4
; [then-branch: 183 | k@341@01 != j@342@01 && j@342@01 < |xs@339@01| && j@342@01 >= 0 && k@341@01 < |xs@339@01| && k@341@01 >= 0 | live]
; [else-branch: 183 | !(k@341@01 != j@342@01 && j@342@01 < |xs@339@01| && j@342@01 >= 0 && k@341@01 < |xs@339@01| && k@341@01 >= 0) | live]
(push) ; 5
; [then-branch: 183 | k@341@01 != j@342@01 && j@342@01 < |xs@339@01| && j@342@01 >= 0 && k@341@01 < |xs@339@01| && k@341@01 >= 0]
(assert (and
  (and
    (and
      (and (not (= k@341@01 j@342@01)) (< j@342@01 (Seq_length xs@339@01)))
      (>= j@342@01 0))
    (< k@341@01 (Seq_length xs@339@01)))
  (>= k@341@01 0)))
; [eval] xs[k] != xs[j]
; [eval] xs[k]
; [eval] xs[j]
(pop) ; 5
(push) ; 5
; [else-branch: 183 | !(k@341@01 != j@342@01 && j@342@01 < |xs@339@01| && j@342@01 >= 0 && k@341@01 < |xs@339@01| && k@341@01 >= 0)]
(assert (not
  (and
    (and
      (and
        (and (not (= k@341@01 j@342@01)) (< j@342@01 (Seq_length xs@339@01)))
        (>= j@342@01 0))
      (< k@341@01 (Seq_length xs@339@01)))
    (>= k@341@01 0))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (and
      (and
        (and (not (= k@341@01 j@342@01)) (< j@342@01 (Seq_length xs@339@01)))
        (>= j@342@01 0))
      (< k@341@01 (Seq_length xs@339@01)))
    (>= k@341@01 0))
  (and
    (not (= k@341@01 j@342@01))
    (< j@342@01 (Seq_length xs@339@01))
    (>= j@342@01 0)
    (< k@341@01 (Seq_length xs@339@01))
    (>= k@341@01 0))))
; Joined path conditions
(assert (or
  (not
    (and
      (and
        (and
          (and (not (= k@341@01 j@342@01)) (< j@342@01 (Seq_length xs@339@01)))
          (>= j@342@01 0))
        (< k@341@01 (Seq_length xs@339@01)))
      (>= k@341@01 0)))
  (and
    (and
      (and
        (and (not (= k@341@01 j@342@01)) (< j@342@01 (Seq_length xs@339@01)))
        (>= j@342@01 0))
      (< k@341@01 (Seq_length xs@339@01)))
    (>= k@341@01 0))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@341@01 Int) (j@342@01 Int)) (!
  (and
    (=>
      (>= k@341@01 0)
      (and
        (>= k@341@01 0)
        (=>
          (< k@341@01 (Seq_length xs@339@01))
          (and
            (< k@341@01 (Seq_length xs@339@01))
            (=>
              (>= j@342@01 0)
              (and
                (>= j@342@01 0)
                (or
                  (not (< j@342@01 (Seq_length xs@339@01)))
                  (< j@342@01 (Seq_length xs@339@01)))))
            (or (not (>= j@342@01 0)) (>= j@342@01 0))))
        (or
          (not (< k@341@01 (Seq_length xs@339@01)))
          (< k@341@01 (Seq_length xs@339@01)))))
    (or (not (>= k@341@01 0)) (>= k@341@01 0))
    (=>
      (and
        (and
          (and
            (and (not (= k@341@01 j@342@01)) (< j@342@01 (Seq_length xs@339@01)))
            (>= j@342@01 0))
          (< k@341@01 (Seq_length xs@339@01)))
        (>= k@341@01 0))
      (and
        (not (= k@341@01 j@342@01))
        (< j@342@01 (Seq_length xs@339@01))
        (>= j@342@01 0)
        (< k@341@01 (Seq_length xs@339@01))
        (>= k@341@01 0)))
    (or
      (not
        (and
          (and
            (and
              (and
                (not (= k@341@01 j@342@01))
                (< j@342@01 (Seq_length xs@339@01)))
              (>= j@342@01 0))
            (< k@341@01 (Seq_length xs@339@01)))
          (>= k@341@01 0)))
      (and
        (and
          (and
            (and (not (= k@341@01 j@342@01)) (< j@342@01 (Seq_length xs@339@01)))
            (>= j@342@01 0))
          (< k@341@01 (Seq_length xs@339@01)))
        (>= k@341@01 0))))
  :pattern ((Seq_index xs@339@01 k@341@01) (Seq_index xs@339@01 j@342@01))
  :qid |prog.l185-aux|)))
(assert (forall ((k@341@01 Int) (j@342@01 Int)) (!
  (=>
    (and
      (and
        (and
          (and (not (= k@341@01 j@342@01)) (< j@342@01 (Seq_length xs@339@01)))
          (>= j@342@01 0))
        (< k@341@01 (Seq_length xs@339@01)))
      (>= k@341@01 0))
    (not (= (Seq_index xs@339@01 k@341@01) (Seq_index xs@339@01 j@342@01))))
  :pattern ((Seq_index xs@339@01 k@341@01) (Seq_index xs@339@01 j@342@01))
  :qid |prog.l185|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall i: Int ::0 <= i && i < |xs| ==> acc(xs[i].f, write))
(declare-const i@343@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i && i < |xs|
; [eval] 0 <= i
(push) ; 4
; [then-branch: 184 | 0 <= i@343@01 | live]
; [else-branch: 184 | !(0 <= i@343@01) | live]
(push) ; 5
; [then-branch: 184 | 0 <= i@343@01]
(assert (<= 0 i@343@01))
; [eval] i < |xs|
; [eval] |xs|
(pop) ; 5
(push) ; 5
; [else-branch: 184 | !(0 <= i@343@01)]
(assert (not (<= 0 i@343@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 i@343@01)) (<= 0 i@343@01)))
(assert (and (< i@343@01 (Seq_length xs@339@01)) (<= 0 i@343@01)))
; [eval] xs[i]
(push) ; 4
(assert (not (>= i@343@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
(declare-const $t@344@01 $FVF<f>)
(declare-fun inv@345@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@343@01 Int)) (!
  (=>
    (and (< i@343@01 (Seq_length xs@339@01)) (<= 0 i@343@01))
    (or (not (<= 0 i@343@01)) (<= 0 i@343@01)))
  :pattern ((Seq_index xs@339@01 i@343@01))
  :qid |f-aux|)))
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((i@343@01 Int)) (!
  (=>
    (and (< i@343@01 (Seq_length xs@339@01)) (<= 0 i@343@01))
    (= (inv@345@01 (Seq_index xs@339@01 i@343@01)) i@343@01))
  :pattern ((Seq_index xs@339@01 i@343@01))
  :qid |quant-u-267|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@345@01 r) (Seq_length xs@339@01)) (<= 0 (inv@345@01 r)))
    (= (Seq_index xs@339@01 (inv@345@01 r)) r))
  :pattern ((inv@345@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@343@01 Int)) (!
  (=>
    (and (< i@343@01 (Seq_length xs@339@01)) (<= 0 i@343@01))
    (not (= (Seq_index xs@339@01 i@343@01) $Ref.null)))
  :pattern ((Seq_index xs@339@01 i@343@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale |xs| > 3
(declare-const $t@346@01 $Snap)
(assert (= $t@346@01 $Snap.unit))
; [eval] |xs| > 3
; [eval] |xs|
(assert (> (Seq_length xs@339@01) 3))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; assert fun07(xs, -10) >= 0
; [eval] fun07(xs, -10) >= 0
; [eval] fun07(xs, -10)
; [eval] -10
(set-option :timeout 0)
(push) ; 3
; [eval] (forall k: Int, i: Int ::k >= 0 && (k < |xs| && (i >= 0 && (i < |xs| && k != i))) ==> xs[k] != xs[i])
(declare-const k@347@01 Int)
(declare-const i@348@01 Int)
(push) ; 4
; [eval] k >= 0 && (k < |xs| && (i >= 0 && (i < |xs| && k != i))) ==> xs[k] != xs[i]
; [eval] k >= 0 && (k < |xs| && (i >= 0 && (i < |xs| && k != i)))
; [eval] k >= 0
(push) ; 5
; [then-branch: 185 | k@347@01 >= 0 | live]
; [else-branch: 185 | !(k@347@01 >= 0) | live]
(push) ; 6
; [then-branch: 185 | k@347@01 >= 0]
(assert (>= k@347@01 0))
; [eval] k < |xs|
; [eval] |xs|
(push) ; 7
; [then-branch: 186 | k@347@01 < |xs@339@01| | live]
; [else-branch: 186 | !(k@347@01 < |xs@339@01|) | live]
(push) ; 8
; [then-branch: 186 | k@347@01 < |xs@339@01|]
(assert (< k@347@01 (Seq_length xs@339@01)))
; [eval] i >= 0
(push) ; 9
; [then-branch: 187 | i@348@01 >= 0 | live]
; [else-branch: 187 | !(i@348@01 >= 0) | live]
(push) ; 10
; [then-branch: 187 | i@348@01 >= 0]
(assert (>= i@348@01 0))
; [eval] i < |xs|
; [eval] |xs|
(push) ; 11
; [then-branch: 188 | i@348@01 < |xs@339@01| | live]
; [else-branch: 188 | !(i@348@01 < |xs@339@01|) | live]
(push) ; 12
; [then-branch: 188 | i@348@01 < |xs@339@01|]
(assert (< i@348@01 (Seq_length xs@339@01)))
; [eval] k != i
(pop) ; 12
(push) ; 12
; [else-branch: 188 | !(i@348@01 < |xs@339@01|)]
(assert (not (< i@348@01 (Seq_length xs@339@01))))
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or
  (not (< i@348@01 (Seq_length xs@339@01)))
  (< i@348@01 (Seq_length xs@339@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 187 | !(i@348@01 >= 0)]
(assert (not (>= i@348@01 0)))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (=>
  (>= i@348@01 0)
  (and
    (>= i@348@01 0)
    (or
      (not (< i@348@01 (Seq_length xs@339@01)))
      (< i@348@01 (Seq_length xs@339@01))))))
; Joined path conditions
(assert (or (not (>= i@348@01 0)) (>= i@348@01 0)))
(pop) ; 8
(push) ; 8
; [else-branch: 186 | !(k@347@01 < |xs@339@01|)]
(assert (not (< k@347@01 (Seq_length xs@339@01))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (< k@347@01 (Seq_length xs@339@01))
  (and
    (< k@347@01 (Seq_length xs@339@01))
    (=>
      (>= i@348@01 0)
      (and
        (>= i@348@01 0)
        (or
          (not (< i@348@01 (Seq_length xs@339@01)))
          (< i@348@01 (Seq_length xs@339@01)))))
    (or (not (>= i@348@01 0)) (>= i@348@01 0)))))
; Joined path conditions
(assert (or
  (not (< k@347@01 (Seq_length xs@339@01)))
  (< k@347@01 (Seq_length xs@339@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 185 | !(k@347@01 >= 0)]
(assert (not (>= k@347@01 0)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (>= k@347@01 0)
  (and
    (>= k@347@01 0)
    (=>
      (< k@347@01 (Seq_length xs@339@01))
      (and
        (< k@347@01 (Seq_length xs@339@01))
        (=>
          (>= i@348@01 0)
          (and
            (>= i@348@01 0)
            (or
              (not (< i@348@01 (Seq_length xs@339@01)))
              (< i@348@01 (Seq_length xs@339@01)))))
        (or (not (>= i@348@01 0)) (>= i@348@01 0))))
    (or
      (not (< k@347@01 (Seq_length xs@339@01)))
      (< k@347@01 (Seq_length xs@339@01))))))
; Joined path conditions
(assert (or (not (>= k@347@01 0)) (>= k@347@01 0)))
(push) ; 5
; [then-branch: 189 | k@347@01 != i@348@01 && i@348@01 < |xs@339@01| && i@348@01 >= 0 && k@347@01 < |xs@339@01| && k@347@01 >= 0 | live]
; [else-branch: 189 | !(k@347@01 != i@348@01 && i@348@01 < |xs@339@01| && i@348@01 >= 0 && k@347@01 < |xs@339@01| && k@347@01 >= 0) | live]
(push) ; 6
; [then-branch: 189 | k@347@01 != i@348@01 && i@348@01 < |xs@339@01| && i@348@01 >= 0 && k@347@01 < |xs@339@01| && k@347@01 >= 0]
(assert (and
  (and
    (and
      (and (not (= k@347@01 i@348@01)) (< i@348@01 (Seq_length xs@339@01)))
      (>= i@348@01 0))
    (< k@347@01 (Seq_length xs@339@01)))
  (>= k@347@01 0)))
; [eval] xs[k] != xs[i]
; [eval] xs[k]
; [eval] xs[i]
(pop) ; 6
(push) ; 6
; [else-branch: 189 | !(k@347@01 != i@348@01 && i@348@01 < |xs@339@01| && i@348@01 >= 0 && k@347@01 < |xs@339@01| && k@347@01 >= 0)]
(assert (not
  (and
    (and
      (and
        (and (not (= k@347@01 i@348@01)) (< i@348@01 (Seq_length xs@339@01)))
        (>= i@348@01 0))
      (< k@347@01 (Seq_length xs@339@01)))
    (>= k@347@01 0))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (and
      (and
        (and (not (= k@347@01 i@348@01)) (< i@348@01 (Seq_length xs@339@01)))
        (>= i@348@01 0))
      (< k@347@01 (Seq_length xs@339@01)))
    (>= k@347@01 0))
  (and
    (not (= k@347@01 i@348@01))
    (< i@348@01 (Seq_length xs@339@01))
    (>= i@348@01 0)
    (< k@347@01 (Seq_length xs@339@01))
    (>= k@347@01 0))))
; Joined path conditions
(assert (or
  (not
    (and
      (and
        (and
          (and (not (= k@347@01 i@348@01)) (< i@348@01 (Seq_length xs@339@01)))
          (>= i@348@01 0))
        (< k@347@01 (Seq_length xs@339@01)))
      (>= k@347@01 0)))
  (and
    (and
      (and
        (and (not (= k@347@01 i@348@01)) (< i@348@01 (Seq_length xs@339@01)))
        (>= i@348@01 0))
      (< k@347@01 (Seq_length xs@339@01)))
    (>= k@347@01 0))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 4
(assert (not (forall ((k@347@01 Int) (i@348@01 Int)) (!
  (=>
    (and
      (and
        (and
          (and (not (= k@347@01 i@348@01)) (< i@348@01 (Seq_length xs@339@01)))
          (>= i@348@01 0))
        (< k@347@01 (Seq_length xs@339@01)))
      (>= k@347@01 0))
    (not (= (Seq_index xs@339@01 k@347@01) (Seq_index xs@339@01 i@348@01))))
  
  :qid |prog.l168|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (forall ((k@347@01 Int) (i@348@01 Int)) (!
  (=>
    (and
      (and
        (and
          (and (not (= k@347@01 i@348@01)) (< i@348@01 (Seq_length xs@339@01)))
          (>= i@348@01 0))
        (< k@347@01 (Seq_length xs@339@01)))
      (>= k@347@01 0))
    (not (= (Seq_index xs@339@01 k@347@01) (Seq_index xs@339@01 i@348@01))))
  
  :qid |prog.l168|)))
(declare-const i@349@01 Int)
(push) ; 4
; [eval] 0 <= i && i < |xs|
; [eval] 0 <= i
(push) ; 5
; [then-branch: 190 | 0 <= i@349@01 | live]
; [else-branch: 190 | !(0 <= i@349@01) | live]
(push) ; 6
; [then-branch: 190 | 0 <= i@349@01]
(assert (<= 0 i@349@01))
; [eval] i < |xs|
; [eval] |xs|
(pop) ; 6
(push) ; 6
; [else-branch: 190 | !(0 <= i@349@01)]
(assert (not (<= 0 i@349@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 i@349@01)) (<= 0 i@349@01)))
(assert (and (< i@349@01 (Seq_length xs@339@01)) (<= 0 i@349@01)))
; [eval] xs[i]
(push) ; 5
(assert (not (>= i@349@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@350@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@349@01 Int)) (!
  (=>
    (and (< i@349@01 (Seq_length xs@339@01)) (<= 0 i@349@01))
    (or (not (<= 0 i@349@01)) (<= 0 i@349@01)))
  :pattern ((Seq_index xs@339@01 i@349@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@349@01 Int) (i2@349@01 Int)) (!
  (=>
    (and
      (and (< i1@349@01 (Seq_length xs@339@01)) (<= 0 i1@349@01))
      (and (< i2@349@01 (Seq_length xs@339@01)) (<= 0 i2@349@01))
      (= (Seq_index xs@339@01 i1@349@01) (Seq_index xs@339@01 i2@349@01)))
    (= i1@349@01 i2@349@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@349@01 Int)) (!
  (=>
    (and (< i@349@01 (Seq_length xs@339@01)) (<= 0 i@349@01))
    (= (inv@350@01 (Seq_index xs@339@01 i@349@01)) i@349@01))
  :pattern ((Seq_index xs@339@01 i@349@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@350@01 r) (Seq_length xs@339@01)) (<= 0 (inv@350@01 r)))
    (= (Seq_index xs@339@01 (inv@350@01 r)) r))
  :pattern ((inv@350@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@351@01 ((r $Ref)) $Perm
  (ite
    (and (< (inv@350@01 r) (Seq_length xs@339@01)) (<= 0 (inv@350@01 r)))
    ($Perm.min
      (ite
        (and (< (inv@345@01 r) (Seq_length xs@339@01)) (<= 0 (inv@345@01 r)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (< (inv@345@01 r) (Seq_length xs@339@01)) (<= 0 (inv@345@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@351@01 r))
    $Perm.No)
  
  :qid |quant-u-270|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (< (inv@350@01 r) (Seq_length xs@339@01)) (<= 0 (inv@350@01 r)))
    (= (- $Perm.Write (pTaken@351@01 r)) $Perm.No))
  
  :qid |quant-u-271|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@352@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@352@01  $FVF<f>)))
      (and (< (inv@350@01 r) (Seq_length xs@339@01)) (<= 0 (inv@350@01 r))))
    (=>
      (and (< (inv@350@01 r) (Seq_length xs@339@01)) (<= 0 (inv@350@01 r)))
      (Set_in r ($FVF.domain_f (as sm@352@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@352@01  $FVF<f>))))
  :qid |qp.fvfDomDef147|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@350@01 r) (Seq_length xs@339@01)) (<= 0 (inv@350@01 r)))
      (and (< (inv@345@01 r) (Seq_length xs@339@01)) (<= 0 (inv@345@01 r))))
    (= ($FVF.lookup_f (as sm@352@01  $FVF<f>) r) ($FVF.lookup_f $t@344@01 r)))
  :pattern (($FVF.lookup_f (as sm@352@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@344@01 r))
  :qid |qp.fvfValDef146|)))
(assert (fun07%precondition ($Snap.combine
  $Snap.unit
  ($SortWrappers.$FVF<f>To$Snap (as sm@352@01  $FVF<f>))) xs@339@01 (- 0 10)))
(pop) ; 3
; Joined path conditions
(assert (forall ((i@349@01 Int)) (!
  (=>
    (and (< i@349@01 (Seq_length xs@339@01)) (<= 0 i@349@01))
    (= (inv@350@01 (Seq_index xs@339@01 i@349@01)) i@349@01))
  :pattern ((Seq_index xs@339@01 i@349@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@350@01 r) (Seq_length xs@339@01)) (<= 0 (inv@350@01 r)))
    (= (Seq_index xs@339@01 (inv@350@01 r)) r))
  :pattern ((inv@350@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@352@01  $FVF<f>)))
      (and (< (inv@350@01 r) (Seq_length xs@339@01)) (<= 0 (inv@350@01 r))))
    (=>
      (and (< (inv@350@01 r) (Seq_length xs@339@01)) (<= 0 (inv@350@01 r)))
      (Set_in r ($FVF.domain_f (as sm@352@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@352@01  $FVF<f>))))
  :qid |qp.fvfDomDef147|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@350@01 r) (Seq_length xs@339@01)) (<= 0 (inv@350@01 r)))
      (and (< (inv@345@01 r) (Seq_length xs@339@01)) (<= 0 (inv@345@01 r))))
    (= ($FVF.lookup_f (as sm@352@01  $FVF<f>) r) ($FVF.lookup_f $t@344@01 r)))
  :pattern (($FVF.lookup_f (as sm@352@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@344@01 r))
  :qid |qp.fvfValDef146|)))
(assert (and
  (forall ((k@347@01 Int) (i@348@01 Int)) (!
    (=>
      (and
        (and
          (and
            (and (not (= k@347@01 i@348@01)) (< i@348@01 (Seq_length xs@339@01)))
            (>= i@348@01 0))
          (< k@347@01 (Seq_length xs@339@01)))
        (>= k@347@01 0))
      (not (= (Seq_index xs@339@01 k@347@01) (Seq_index xs@339@01 i@348@01))))
    
    :qid |prog.l168|))
  (forall ((i@349@01 Int)) (!
    (=>
      (and (< i@349@01 (Seq_length xs@339@01)) (<= 0 i@349@01))
      (or (not (<= 0 i@349@01)) (<= 0 i@349@01)))
    :pattern ((Seq_index xs@339@01 i@349@01))
    :qid |f-aux|))
  (fun07%precondition ($Snap.combine
    $Snap.unit
    ($SortWrappers.$FVF<f>To$Snap (as sm@352@01  $FVF<f>))) xs@339@01 (- 0 10))))
(set-option :timeout 0)
(push) ; 3
(assert (not (>=
  (fun07 ($Snap.combine
    $Snap.unit
    ($SortWrappers.$FVF<f>To$Snap (as sm@352@01  $FVF<f>))) xs@339@01 (- 0 10))
  0)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (>=
  (fun07 ($Snap.combine
    $Snap.unit
    ($SortWrappers.$FVF<f>To$Snap (as sm@352@01  $FVF<f>))) xs@339@01 (- 0 10))
  0))
; [exec]
; assert fun08(xs, 2) > xs[2].f
; [eval] fun08(xs, 2) > xs[2].f
; [eval] fun08(xs, 2)
(push) ; 3
; [eval] (forall k: Int, j: Int ::k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==> xs[k] != xs[j])
(declare-const k@353@01 Int)
(declare-const j@354@01 Int)
(push) ; 4
; [eval] k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j))) ==> xs[k] != xs[j]
; [eval] k >= 0 && (k < |xs| && (j >= 0 && (j < |xs| && k != j)))
; [eval] k >= 0
(push) ; 5
; [then-branch: 191 | k@353@01 >= 0 | live]
; [else-branch: 191 | !(k@353@01 >= 0) | live]
(push) ; 6
; [then-branch: 191 | k@353@01 >= 0]
(assert (>= k@353@01 0))
; [eval] k < |xs|
; [eval] |xs|
(push) ; 7
; [then-branch: 192 | k@353@01 < |xs@339@01| | live]
; [else-branch: 192 | !(k@353@01 < |xs@339@01|) | live]
(push) ; 8
; [then-branch: 192 | k@353@01 < |xs@339@01|]
(assert (< k@353@01 (Seq_length xs@339@01)))
; [eval] j >= 0
(push) ; 9
; [then-branch: 193 | j@354@01 >= 0 | live]
; [else-branch: 193 | !(j@354@01 >= 0) | live]
(push) ; 10
; [then-branch: 193 | j@354@01 >= 0]
(assert (>= j@354@01 0))
; [eval] j < |xs|
; [eval] |xs|
(push) ; 11
; [then-branch: 194 | j@354@01 < |xs@339@01| | live]
; [else-branch: 194 | !(j@354@01 < |xs@339@01|) | live]
(push) ; 12
; [then-branch: 194 | j@354@01 < |xs@339@01|]
(assert (< j@354@01 (Seq_length xs@339@01)))
; [eval] k != j
(pop) ; 12
(push) ; 12
; [else-branch: 194 | !(j@354@01 < |xs@339@01|)]
(assert (not (< j@354@01 (Seq_length xs@339@01))))
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or
  (not (< j@354@01 (Seq_length xs@339@01)))
  (< j@354@01 (Seq_length xs@339@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 193 | !(j@354@01 >= 0)]
(assert (not (>= j@354@01 0)))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (=>
  (>= j@354@01 0)
  (and
    (>= j@354@01 0)
    (or
      (not (< j@354@01 (Seq_length xs@339@01)))
      (< j@354@01 (Seq_length xs@339@01))))))
; Joined path conditions
(assert (or (not (>= j@354@01 0)) (>= j@354@01 0)))
(pop) ; 8
(push) ; 8
; [else-branch: 192 | !(k@353@01 < |xs@339@01|)]
(assert (not (< k@353@01 (Seq_length xs@339@01))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (< k@353@01 (Seq_length xs@339@01))
  (and
    (< k@353@01 (Seq_length xs@339@01))
    (=>
      (>= j@354@01 0)
      (and
        (>= j@354@01 0)
        (or
          (not (< j@354@01 (Seq_length xs@339@01)))
          (< j@354@01 (Seq_length xs@339@01)))))
    (or (not (>= j@354@01 0)) (>= j@354@01 0)))))
; Joined path conditions
(assert (or
  (not (< k@353@01 (Seq_length xs@339@01)))
  (< k@353@01 (Seq_length xs@339@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 191 | !(k@353@01 >= 0)]
(assert (not (>= k@353@01 0)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (>= k@353@01 0)
  (and
    (>= k@353@01 0)
    (=>
      (< k@353@01 (Seq_length xs@339@01))
      (and
        (< k@353@01 (Seq_length xs@339@01))
        (=>
          (>= j@354@01 0)
          (and
            (>= j@354@01 0)
            (or
              (not (< j@354@01 (Seq_length xs@339@01)))
              (< j@354@01 (Seq_length xs@339@01)))))
        (or (not (>= j@354@01 0)) (>= j@354@01 0))))
    (or
      (not (< k@353@01 (Seq_length xs@339@01)))
      (< k@353@01 (Seq_length xs@339@01))))))
; Joined path conditions
(assert (or (not (>= k@353@01 0)) (>= k@353@01 0)))
(push) ; 5
; [then-branch: 195 | k@353@01 != j@354@01 && j@354@01 < |xs@339@01| && j@354@01 >= 0 && k@353@01 < |xs@339@01| && k@353@01 >= 0 | live]
; [else-branch: 195 | !(k@353@01 != j@354@01 && j@354@01 < |xs@339@01| && j@354@01 >= 0 && k@353@01 < |xs@339@01| && k@353@01 >= 0) | live]
(push) ; 6
; [then-branch: 195 | k@353@01 != j@354@01 && j@354@01 < |xs@339@01| && j@354@01 >= 0 && k@353@01 < |xs@339@01| && k@353@01 >= 0]
(assert (and
  (and
    (and
      (and (not (= k@353@01 j@354@01)) (< j@354@01 (Seq_length xs@339@01)))
      (>= j@354@01 0))
    (< k@353@01 (Seq_length xs@339@01)))
  (>= k@353@01 0)))
; [eval] xs[k] != xs[j]
; [eval] xs[k]
; [eval] xs[j]
(pop) ; 6
(push) ; 6
; [else-branch: 195 | !(k@353@01 != j@354@01 && j@354@01 < |xs@339@01| && j@354@01 >= 0 && k@353@01 < |xs@339@01| && k@353@01 >= 0)]
(assert (not
  (and
    (and
      (and
        (and (not (= k@353@01 j@354@01)) (< j@354@01 (Seq_length xs@339@01)))
        (>= j@354@01 0))
      (< k@353@01 (Seq_length xs@339@01)))
    (>= k@353@01 0))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (and
      (and
        (and (not (= k@353@01 j@354@01)) (< j@354@01 (Seq_length xs@339@01)))
        (>= j@354@01 0))
      (< k@353@01 (Seq_length xs@339@01)))
    (>= k@353@01 0))
  (and
    (not (= k@353@01 j@354@01))
    (< j@354@01 (Seq_length xs@339@01))
    (>= j@354@01 0)
    (< k@353@01 (Seq_length xs@339@01))
    (>= k@353@01 0))))
; Joined path conditions
(assert (or
  (not
    (and
      (and
        (and
          (and (not (= k@353@01 j@354@01)) (< j@354@01 (Seq_length xs@339@01)))
          (>= j@354@01 0))
        (< k@353@01 (Seq_length xs@339@01)))
      (>= k@353@01 0)))
  (and
    (and
      (and
        (and (not (= k@353@01 j@354@01)) (< j@354@01 (Seq_length xs@339@01)))
        (>= j@354@01 0))
      (< k@353@01 (Seq_length xs@339@01)))
    (>= k@353@01 0))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 4
(assert (not (forall ((k@353@01 Int) (j@354@01 Int)) (!
  (=>
    (and
      (and
        (and
          (and (not (= k@353@01 j@354@01)) (< j@354@01 (Seq_length xs@339@01)))
          (>= j@354@01 0))
        (< k@353@01 (Seq_length xs@339@01)))
      (>= k@353@01 0))
    (not (= (Seq_index xs@339@01 k@353@01) (Seq_index xs@339@01 j@354@01))))
  
  :qid |prog.l178|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (forall ((k@353@01 Int) (j@354@01 Int)) (!
  (=>
    (and
      (and
        (and
          (and (not (= k@353@01 j@354@01)) (< j@354@01 (Seq_length xs@339@01)))
          (>= j@354@01 0))
        (< k@353@01 (Seq_length xs@339@01)))
      (>= k@353@01 0))
    (not (= (Seq_index xs@339@01 k@353@01) (Seq_index xs@339@01 j@354@01))))
  
  :qid |prog.l178|)))
(declare-const j@355@01 Int)
(push) ; 4
; [eval] 0 <= j && j < |xs|
; [eval] 0 <= j
(push) ; 5
; [then-branch: 196 | 0 <= j@355@01 | live]
; [else-branch: 196 | !(0 <= j@355@01) | live]
(push) ; 6
; [then-branch: 196 | 0 <= j@355@01]
(assert (<= 0 j@355@01))
; [eval] j < |xs|
; [eval] |xs|
(pop) ; 6
(push) ; 6
; [else-branch: 196 | !(0 <= j@355@01)]
(assert (not (<= 0 j@355@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 j@355@01)) (<= 0 j@355@01)))
(assert (and (< j@355@01 (Seq_length xs@339@01)) (<= 0 j@355@01)))
; [eval] xs[j]
(push) ; 5
(assert (not (>= j@355@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@356@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((j@355@01 Int)) (!
  (=>
    (and (< j@355@01 (Seq_length xs@339@01)) (<= 0 j@355@01))
    (or (not (<= 0 j@355@01)) (<= 0 j@355@01)))
  :pattern ((Seq_index xs@339@01 j@355@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((j1@355@01 Int) (j2@355@01 Int)) (!
  (=>
    (and
      (and (< j1@355@01 (Seq_length xs@339@01)) (<= 0 j1@355@01))
      (and (< j2@355@01 (Seq_length xs@339@01)) (<= 0 j2@355@01))
      (= (Seq_index xs@339@01 j1@355@01) (Seq_index xs@339@01 j2@355@01)))
    (= j1@355@01 j2@355@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@355@01 Int)) (!
  (=>
    (and (< j@355@01 (Seq_length xs@339@01)) (<= 0 j@355@01))
    (= (inv@356@01 (Seq_index xs@339@01 j@355@01)) j@355@01))
  :pattern ((Seq_index xs@339@01 j@355@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@356@01 r) (Seq_length xs@339@01)) (<= 0 (inv@356@01 r)))
    (= (Seq_index xs@339@01 (inv@356@01 r)) r))
  :pattern ((inv@356@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@357@01 ((r $Ref)) $Perm
  (ite
    (and (< (inv@356@01 r) (Seq_length xs@339@01)) (<= 0 (inv@356@01 r)))
    ($Perm.min
      (ite
        (and (< (inv@345@01 r) (Seq_length xs@339@01)) (<= 0 (inv@345@01 r)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (< (inv@345@01 r) (Seq_length xs@339@01)) (<= 0 (inv@345@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@357@01 r))
    $Perm.No)
  
  :qid |quant-u-274|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (< (inv@356@01 r) (Seq_length xs@339@01)) (<= 0 (inv@356@01 r)))
    (= (- $Perm.Write (pTaken@357@01 r)) $Perm.No))
  
  :qid |quant-u-275|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@358@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@358@01  $FVF<f>)))
      (and (< (inv@356@01 r) (Seq_length xs@339@01)) (<= 0 (inv@356@01 r))))
    (=>
      (and (< (inv@356@01 r) (Seq_length xs@339@01)) (<= 0 (inv@356@01 r)))
      (Set_in r ($FVF.domain_f (as sm@358@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@358@01  $FVF<f>))))
  :qid |qp.fvfDomDef149|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@356@01 r) (Seq_length xs@339@01)) (<= 0 (inv@356@01 r)))
      (and (< (inv@345@01 r) (Seq_length xs@339@01)) (<= 0 (inv@345@01 r))))
    (= ($FVF.lookup_f (as sm@358@01  $FVF<f>) r) ($FVF.lookup_f $t@344@01 r)))
  :pattern (($FVF.lookup_f (as sm@358@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@344@01 r))
  :qid |qp.fvfValDef148|)))
; [eval] 0 <= i
; [eval] i < |xs|
; [eval] |xs|
(set-option :timeout 0)
(push) ; 4
(assert (not (< 2 (Seq_length xs@339@01))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (< 2 (Seq_length xs@339@01)))
(assert (fun08%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$FVF<f>To$Snap (as sm@358@01  $FVF<f>))
    ($Snap.combine $Snap.unit $Snap.unit))) xs@339@01 2))
(pop) ; 3
; Joined path conditions
(assert (forall ((j@355@01 Int)) (!
  (=>
    (and (< j@355@01 (Seq_length xs@339@01)) (<= 0 j@355@01))
    (= (inv@356@01 (Seq_index xs@339@01 j@355@01)) j@355@01))
  :pattern ((Seq_index xs@339@01 j@355@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@356@01 r) (Seq_length xs@339@01)) (<= 0 (inv@356@01 r)))
    (= (Seq_index xs@339@01 (inv@356@01 r)) r))
  :pattern ((inv@356@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@358@01  $FVF<f>)))
      (and (< (inv@356@01 r) (Seq_length xs@339@01)) (<= 0 (inv@356@01 r))))
    (=>
      (and (< (inv@356@01 r) (Seq_length xs@339@01)) (<= 0 (inv@356@01 r)))
      (Set_in r ($FVF.domain_f (as sm@358@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@358@01  $FVF<f>))))
  :qid |qp.fvfDomDef149|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@356@01 r) (Seq_length xs@339@01)) (<= 0 (inv@356@01 r)))
      (and (< (inv@345@01 r) (Seq_length xs@339@01)) (<= 0 (inv@345@01 r))))
    (= ($FVF.lookup_f (as sm@358@01  $FVF<f>) r) ($FVF.lookup_f $t@344@01 r)))
  :pattern (($FVF.lookup_f (as sm@358@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@344@01 r))
  :qid |qp.fvfValDef148|)))
(assert (and
  (forall ((k@353@01 Int) (j@354@01 Int)) (!
    (=>
      (and
        (and
          (and
            (and (not (= k@353@01 j@354@01)) (< j@354@01 (Seq_length xs@339@01)))
            (>= j@354@01 0))
          (< k@353@01 (Seq_length xs@339@01)))
        (>= k@353@01 0))
      (not (= (Seq_index xs@339@01 k@353@01) (Seq_index xs@339@01 j@354@01))))
    
    :qid |prog.l178|))
  (forall ((j@355@01 Int)) (!
    (=>
      (and (< j@355@01 (Seq_length xs@339@01)) (<= 0 j@355@01))
      (or (not (<= 0 j@355@01)) (<= 0 j@355@01)))
    :pattern ((Seq_index xs@339@01 j@355@01))
    :qid |f-aux|))
  (< 2 (Seq_length xs@339@01))
  (fun08%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<f>To$Snap (as sm@358@01  $FVF<f>))
      ($Snap.combine $Snap.unit $Snap.unit))) xs@339@01 2)))
; [eval] xs[2]
(declare-const sm@359@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@345@01 r) (Seq_length xs@339@01)) (<= 0 (inv@345@01 r)))
    (= ($FVF.lookup_f (as sm@359@01  $FVF<f>) r) ($FVF.lookup_f $t@344@01 r)))
  :pattern (($FVF.lookup_f (as sm@359@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@344@01 r))
  :qid |qp.fvfValDef150|)))
(declare-const pm@360@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@360@01  $FPM) r)
    (ite
      (and (< (inv@345@01 r) (Seq_length xs@339@01)) (<= 0 (inv@345@01 r)))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@360@01  $FPM) r))
  :qid |qp.resPrmSumDef151|)))
(push) ; 3
(assert (not (< $Perm.No ($FVF.perm_f (as pm@360@01  $FPM) (Seq_index xs@339@01 2)))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (>
  (fun08 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<f>To$Snap (as sm@358@01  $FVF<f>))
      ($Snap.combine $Snap.unit $Snap.unit))) xs@339@01 2)
  ($FVF.lookup_f (as sm@359@01  $FVF<f>) (Seq_index xs@339@01 2)))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (>
  (fun08 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<f>To$Snap (as sm@358@01  $FVF<f>))
      ($Snap.combine $Snap.unit $Snap.unit))) xs@339@01 2)
  ($FVF.lookup_f (as sm@359@01  $FVF<f>) (Seq_index xs@339@01 2))))
; [exec]
; assert fun07(xs, -10) > 0
; [eval] fun07(xs, -10) > 0
; [eval] fun07(xs, -10)
; [eval] -10
(push) ; 3
; [eval] (forall k: Int, i: Int ::k >= 0 && (k < |xs| && (i >= 0 && (i < |xs| && k != i))) ==> xs[k] != xs[i])
(declare-const k@361@01 Int)
(declare-const i@362@01 Int)
(push) ; 4
; [eval] k >= 0 && (k < |xs| && (i >= 0 && (i < |xs| && k != i))) ==> xs[k] != xs[i]
; [eval] k >= 0 && (k < |xs| && (i >= 0 && (i < |xs| && k != i)))
; [eval] k >= 0
(push) ; 5
; [then-branch: 197 | k@361@01 >= 0 | live]
; [else-branch: 197 | !(k@361@01 >= 0) | live]
(push) ; 6
; [then-branch: 197 | k@361@01 >= 0]
(assert (>= k@361@01 0))
; [eval] k < |xs|
; [eval] |xs|
(push) ; 7
; [then-branch: 198 | k@361@01 < |xs@339@01| | live]
; [else-branch: 198 | !(k@361@01 < |xs@339@01|) | live]
(push) ; 8
; [then-branch: 198 | k@361@01 < |xs@339@01|]
(assert (< k@361@01 (Seq_length xs@339@01)))
; [eval] i >= 0
(push) ; 9
; [then-branch: 199 | i@362@01 >= 0 | live]
; [else-branch: 199 | !(i@362@01 >= 0) | live]
(push) ; 10
; [then-branch: 199 | i@362@01 >= 0]
(assert (>= i@362@01 0))
; [eval] i < |xs|
; [eval] |xs|
(push) ; 11
; [then-branch: 200 | i@362@01 < |xs@339@01| | live]
; [else-branch: 200 | !(i@362@01 < |xs@339@01|) | live]
(push) ; 12
; [then-branch: 200 | i@362@01 < |xs@339@01|]
(assert (< i@362@01 (Seq_length xs@339@01)))
; [eval] k != i
(pop) ; 12
(push) ; 12
; [else-branch: 200 | !(i@362@01 < |xs@339@01|)]
(assert (not (< i@362@01 (Seq_length xs@339@01))))
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or
  (not (< i@362@01 (Seq_length xs@339@01)))
  (< i@362@01 (Seq_length xs@339@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 199 | !(i@362@01 >= 0)]
(assert (not (>= i@362@01 0)))
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (=>
  (>= i@362@01 0)
  (and
    (>= i@362@01 0)
    (or
      (not (< i@362@01 (Seq_length xs@339@01)))
      (< i@362@01 (Seq_length xs@339@01))))))
; Joined path conditions
(assert (or (not (>= i@362@01 0)) (>= i@362@01 0)))
(pop) ; 8
(push) ; 8
; [else-branch: 198 | !(k@361@01 < |xs@339@01|)]
(assert (not (< k@361@01 (Seq_length xs@339@01))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (< k@361@01 (Seq_length xs@339@01))
  (and
    (< k@361@01 (Seq_length xs@339@01))
    (=>
      (>= i@362@01 0)
      (and
        (>= i@362@01 0)
        (or
          (not (< i@362@01 (Seq_length xs@339@01)))
          (< i@362@01 (Seq_length xs@339@01)))))
    (or (not (>= i@362@01 0)) (>= i@362@01 0)))))
; Joined path conditions
(assert (or
  (not (< k@361@01 (Seq_length xs@339@01)))
  (< k@361@01 (Seq_length xs@339@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 197 | !(k@361@01 >= 0)]
(assert (not (>= k@361@01 0)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (>= k@361@01 0)
  (and
    (>= k@361@01 0)
    (=>
      (< k@361@01 (Seq_length xs@339@01))
      (and
        (< k@361@01 (Seq_length xs@339@01))
        (=>
          (>= i@362@01 0)
          (and
            (>= i@362@01 0)
            (or
              (not (< i@362@01 (Seq_length xs@339@01)))
              (< i@362@01 (Seq_length xs@339@01)))))
        (or (not (>= i@362@01 0)) (>= i@362@01 0))))
    (or
      (not (< k@361@01 (Seq_length xs@339@01)))
      (< k@361@01 (Seq_length xs@339@01))))))
; Joined path conditions
(assert (or (not (>= k@361@01 0)) (>= k@361@01 0)))
(push) ; 5
; [then-branch: 201 | k@361@01 != i@362@01 && i@362@01 < |xs@339@01| && i@362@01 >= 0 && k@361@01 < |xs@339@01| && k@361@01 >= 0 | live]
; [else-branch: 201 | !(k@361@01 != i@362@01 && i@362@01 < |xs@339@01| && i@362@01 >= 0 && k@361@01 < |xs@339@01| && k@361@01 >= 0) | live]
(push) ; 6
; [then-branch: 201 | k@361@01 != i@362@01 && i@362@01 < |xs@339@01| && i@362@01 >= 0 && k@361@01 < |xs@339@01| && k@361@01 >= 0]
(assert (and
  (and
    (and
      (and (not (= k@361@01 i@362@01)) (< i@362@01 (Seq_length xs@339@01)))
      (>= i@362@01 0))
    (< k@361@01 (Seq_length xs@339@01)))
  (>= k@361@01 0)))
; [eval] xs[k] != xs[i]
; [eval] xs[k]
; [eval] xs[i]
(pop) ; 6
(push) ; 6
; [else-branch: 201 | !(k@361@01 != i@362@01 && i@362@01 < |xs@339@01| && i@362@01 >= 0 && k@361@01 < |xs@339@01| && k@361@01 >= 0)]
(assert (not
  (and
    (and
      (and
        (and (not (= k@361@01 i@362@01)) (< i@362@01 (Seq_length xs@339@01)))
        (>= i@362@01 0))
      (< k@361@01 (Seq_length xs@339@01)))
    (>= k@361@01 0))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (and
      (and
        (and (not (= k@361@01 i@362@01)) (< i@362@01 (Seq_length xs@339@01)))
        (>= i@362@01 0))
      (< k@361@01 (Seq_length xs@339@01)))
    (>= k@361@01 0))
  (and
    (not (= k@361@01 i@362@01))
    (< i@362@01 (Seq_length xs@339@01))
    (>= i@362@01 0)
    (< k@361@01 (Seq_length xs@339@01))
    (>= k@361@01 0))))
; Joined path conditions
(assert (or
  (not
    (and
      (and
        (and
          (and (not (= k@361@01 i@362@01)) (< i@362@01 (Seq_length xs@339@01)))
          (>= i@362@01 0))
        (< k@361@01 (Seq_length xs@339@01)))
      (>= k@361@01 0)))
  (and
    (and
      (and
        (and (not (= k@361@01 i@362@01)) (< i@362@01 (Seq_length xs@339@01)))
        (>= i@362@01 0))
      (< k@361@01 (Seq_length xs@339@01)))
    (>= k@361@01 0))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 4
(assert (not (forall ((k@361@01 Int) (i@362@01 Int)) (!
  (=>
    (and
      (and
        (and
          (and (not (= k@361@01 i@362@01)) (< i@362@01 (Seq_length xs@339@01)))
          (>= i@362@01 0))
        (< k@361@01 (Seq_length xs@339@01)))
      (>= k@361@01 0))
    (not (= (Seq_index xs@339@01 k@361@01) (Seq_index xs@339@01 i@362@01))))
  
  :qid |prog.l168|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (forall ((k@361@01 Int) (i@362@01 Int)) (!
  (=>
    (and
      (and
        (and
          (and (not (= k@361@01 i@362@01)) (< i@362@01 (Seq_length xs@339@01)))
          (>= i@362@01 0))
        (< k@361@01 (Seq_length xs@339@01)))
      (>= k@361@01 0))
    (not (= (Seq_index xs@339@01 k@361@01) (Seq_index xs@339@01 i@362@01))))
  
  :qid |prog.l168|)))
(declare-const i@363@01 Int)
(push) ; 4
; [eval] 0 <= i && i < |xs|
; [eval] 0 <= i
(push) ; 5
; [then-branch: 202 | 0 <= i@363@01 | live]
; [else-branch: 202 | !(0 <= i@363@01) | live]
(push) ; 6
; [then-branch: 202 | 0 <= i@363@01]
(assert (<= 0 i@363@01))
; [eval] i < |xs|
; [eval] |xs|
(pop) ; 6
(push) ; 6
; [else-branch: 202 | !(0 <= i@363@01)]
(assert (not (<= 0 i@363@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 i@363@01)) (<= 0 i@363@01)))
(assert (and (< i@363@01 (Seq_length xs@339@01)) (<= 0 i@363@01)))
; [eval] xs[i]
(push) ; 5
(assert (not (>= i@363@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@364@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@363@01 Int)) (!
  (=>
    (and (< i@363@01 (Seq_length xs@339@01)) (<= 0 i@363@01))
    (or (not (<= 0 i@363@01)) (<= 0 i@363@01)))
  :pattern ((Seq_index xs@339@01 i@363@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@363@01 Int) (i2@363@01 Int)) (!
  (=>
    (and
      (and (< i1@363@01 (Seq_length xs@339@01)) (<= 0 i1@363@01))
      (and (< i2@363@01 (Seq_length xs@339@01)) (<= 0 i2@363@01))
      (= (Seq_index xs@339@01 i1@363@01) (Seq_index xs@339@01 i2@363@01)))
    (= i1@363@01 i2@363@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@363@01 Int)) (!
  (=>
    (and (< i@363@01 (Seq_length xs@339@01)) (<= 0 i@363@01))
    (= (inv@364@01 (Seq_index xs@339@01 i@363@01)) i@363@01))
  :pattern ((Seq_index xs@339@01 i@363@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@364@01 r) (Seq_length xs@339@01)) (<= 0 (inv@364@01 r)))
    (= (Seq_index xs@339@01 (inv@364@01 r)) r))
  :pattern ((inv@364@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@365@01 ((r $Ref)) $Perm
  (ite
    (and (< (inv@364@01 r) (Seq_length xs@339@01)) (<= 0 (inv@364@01 r)))
    ($Perm.min
      (ite
        (and (< (inv@345@01 r) (Seq_length xs@339@01)) (<= 0 (inv@345@01 r)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (< (inv@345@01 r) (Seq_length xs@339@01)) (<= 0 (inv@345@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@365@01 r))
    $Perm.No)
  
  :qid |quant-u-278|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (< (inv@364@01 r) (Seq_length xs@339@01)) (<= 0 (inv@364@01 r)))
    (= (- $Perm.Write (pTaken@365@01 r)) $Perm.No))
  
  :qid |quant-u-279|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@366@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@366@01  $FVF<f>)))
      (and (< (inv@364@01 r) (Seq_length xs@339@01)) (<= 0 (inv@364@01 r))))
    (=>
      (and (< (inv@364@01 r) (Seq_length xs@339@01)) (<= 0 (inv@364@01 r)))
      (Set_in r ($FVF.domain_f (as sm@366@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@366@01  $FVF<f>))))
  :qid |qp.fvfDomDef153|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@364@01 r) (Seq_length xs@339@01)) (<= 0 (inv@364@01 r)))
      (and (< (inv@345@01 r) (Seq_length xs@339@01)) (<= 0 (inv@345@01 r))))
    (= ($FVF.lookup_f (as sm@366@01  $FVF<f>) r) ($FVF.lookup_f $t@344@01 r)))
  :pattern (($FVF.lookup_f (as sm@366@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@344@01 r))
  :qid |qp.fvfValDef152|)))
(assert (fun07%precondition ($Snap.combine
  $Snap.unit
  ($SortWrappers.$FVF<f>To$Snap (as sm@366@01  $FVF<f>))) xs@339@01 (- 0 10)))
(pop) ; 3
; Joined path conditions
(assert (forall ((i@363@01 Int)) (!
  (=>
    (and (< i@363@01 (Seq_length xs@339@01)) (<= 0 i@363@01))
    (= (inv@364@01 (Seq_index xs@339@01 i@363@01)) i@363@01))
  :pattern ((Seq_index xs@339@01 i@363@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@364@01 r) (Seq_length xs@339@01)) (<= 0 (inv@364@01 r)))
    (= (Seq_index xs@339@01 (inv@364@01 r)) r))
  :pattern ((inv@364@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@366@01  $FVF<f>)))
      (and (< (inv@364@01 r) (Seq_length xs@339@01)) (<= 0 (inv@364@01 r))))
    (=>
      (and (< (inv@364@01 r) (Seq_length xs@339@01)) (<= 0 (inv@364@01 r)))
      (Set_in r ($FVF.domain_f (as sm@366@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@366@01  $FVF<f>))))
  :qid |qp.fvfDomDef153|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@364@01 r) (Seq_length xs@339@01)) (<= 0 (inv@364@01 r)))
      (and (< (inv@345@01 r) (Seq_length xs@339@01)) (<= 0 (inv@345@01 r))))
    (= ($FVF.lookup_f (as sm@366@01  $FVF<f>) r) ($FVF.lookup_f $t@344@01 r)))
  :pattern (($FVF.lookup_f (as sm@366@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@344@01 r))
  :qid |qp.fvfValDef152|)))
(assert (and
  (forall ((k@361@01 Int) (i@362@01 Int)) (!
    (=>
      (and
        (and
          (and
            (and (not (= k@361@01 i@362@01)) (< i@362@01 (Seq_length xs@339@01)))
            (>= i@362@01 0))
          (< k@361@01 (Seq_length xs@339@01)))
        (>= k@361@01 0))
      (not (= (Seq_index xs@339@01 k@361@01) (Seq_index xs@339@01 i@362@01))))
    
    :qid |prog.l168|))
  (forall ((i@363@01 Int)) (!
    (=>
      (and (< i@363@01 (Seq_length xs@339@01)) (<= 0 i@363@01))
      (or (not (<= 0 i@363@01)) (<= 0 i@363@01)))
    :pattern ((Seq_index xs@339@01 i@363@01))
    :qid |f-aux|))
  (fun07%precondition ($Snap.combine
    $Snap.unit
    ($SortWrappers.$FVF<f>To$Snap (as sm@366@01  $FVF<f>))) xs@339@01 (- 0 10))))
(set-option :timeout 0)
(push) ; 3
(assert (not (>
  (fun07 ($Snap.combine
    $Snap.unit
    ($SortWrappers.$FVF<f>To$Snap (as sm@366@01  $FVF<f>))) xs@339@01 (- 0 10))
  0)))
(check-sat)
; unknown
(pop) ; 3
; 0.04s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const sm@367@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@345@01 r) (Seq_length xs@339@01)) (<= 0 (inv@345@01 r)))
    (= ($FVF.lookup_f (as sm@367@01  $FVF<f>) r) ($FVF.lookup_f $t@344@01 r)))
  :pattern (($FVF.lookup_f (as sm@367@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@344@01 r))
  :qid |qp.fvfValDef154|)))
(declare-const pm@368@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@368@01  $FPM) r)
    (ite
      (and (< (inv@345@01 r) (Seq_length xs@339@01)) (<= 0 (inv@345@01 r)))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@368@01  $FPM) r))
  :qid |qp.resPrmSumDef155|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@368@01  $FPM) r) $Perm.Write)
  :pattern ((inv@345@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] fun07(xs, -10) > 0
; [eval] fun07(xs, -10)
; [eval] -10
(set-option :timeout 0)
(push) ; 3
; [eval] (forall k: Int, i: Int ::k >= 0 && (k < |xs| && (i >= 0 && (i < |xs| && k != i))) ==> xs[k] != xs[i])
(declare-const k@369@01 Int)
(declare-const i@370@01 Int)
(push) ; 4
; [eval] k >= 0 && (k < |xs| && (i >= 0 && (i < |xs| && k != i))) ==> xs[k] != xs[i]
; [eval] k >= 0 && (k < |xs| && (i >= 0 && (i < |xs| && k != i)))
; [eval] k >= 0
(push) ; 5
; [then-branch: 203 | k@369@01 >= 0 | live]
; [else-branch: 203 | !(k@369@01 >= 0) | live]
(push) ; 6
; [then-branch: 203 | k@369@01 >= 0]
(assert (>= k@369@01 0))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] k < |xs|
; [eval] |xs|
(set-option :timeout 0)
(push) ; 7
; [then-branch: 204 | k@369@01 < |xs@339@01| | live]
; [else-branch: 204 | !(k@369@01 < |xs@339@01|) | live]
(push) ; 8
; [then-branch: 204 | k@369@01 < |xs@339@01|]
(assert (< k@369@01 (Seq_length xs@339@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] i >= 0
(set-option :timeout 0)
(push) ; 9
; [then-branch: 205 | i@370@01 >= 0 | live]
; [else-branch: 205 | !(i@370@01 >= 0) | live]
(push) ; 10
; [then-branch: 205 | i@370@01 >= 0]
(assert (>= i@370@01 0))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] i < |xs|
; [eval] |xs|
(set-option :timeout 0)
(push) ; 11
; [then-branch: 206 | i@370@01 < |xs@339@01| | live]
; [else-branch: 206 | !(i@370@01 < |xs@339@01|) | live]
(push) ; 12
; [then-branch: 206 | i@370@01 < |xs@339@01|]
(assert (< i@370@01 (Seq_length xs@339@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] k != i
(pop) ; 12
(set-option :timeout 0)
(push) ; 12
; [else-branch: 206 | !(i@370@01 < |xs@339@01|)]
(assert (not (< i@370@01 (Seq_length xs@339@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or
  (not (< i@370@01 (Seq_length xs@339@01)))
  (< i@370@01 (Seq_length xs@339@01))))
(pop) ; 10
(set-option :timeout 0)
(push) ; 10
; [else-branch: 205 | !(i@370@01 >= 0)]
(assert (not (>= i@370@01 0)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (=>
  (>= i@370@01 0)
  (and
    (>= i@370@01 0)
    (or
      (not (< i@370@01 (Seq_length xs@339@01)))
      (< i@370@01 (Seq_length xs@339@01))))))
; Joined path conditions
(assert (or (not (>= i@370@01 0)) (>= i@370@01 0)))
(pop) ; 8
(set-option :timeout 0)
(push) ; 8
; [else-branch: 204 | !(k@369@01 < |xs@339@01|)]
(assert (not (< k@369@01 (Seq_length xs@339@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (< k@369@01 (Seq_length xs@339@01))
  (and
    (< k@369@01 (Seq_length xs@339@01))
    (=>
      (>= i@370@01 0)
      (and
        (>= i@370@01 0)
        (or
          (not (< i@370@01 (Seq_length xs@339@01)))
          (< i@370@01 (Seq_length xs@339@01)))))
    (or (not (>= i@370@01 0)) (>= i@370@01 0)))))
; Joined path conditions
(assert (or
  (not (< k@369@01 (Seq_length xs@339@01)))
  (< k@369@01 (Seq_length xs@339@01))))
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 203 | !(k@369@01 >= 0)]
(assert (not (>= k@369@01 0)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (>= k@369@01 0)
  (and
    (>= k@369@01 0)
    (=>
      (< k@369@01 (Seq_length xs@339@01))
      (and
        (< k@369@01 (Seq_length xs@339@01))
        (=>
          (>= i@370@01 0)
          (and
            (>= i@370@01 0)
            (or
              (not (< i@370@01 (Seq_length xs@339@01)))
              (< i@370@01 (Seq_length xs@339@01)))))
        (or (not (>= i@370@01 0)) (>= i@370@01 0))))
    (or
      (not (< k@369@01 (Seq_length xs@339@01)))
      (< k@369@01 (Seq_length xs@339@01))))))
; Joined path conditions
(assert (or (not (>= k@369@01 0)) (>= k@369@01 0)))
(set-option :timeout 0)
(push) ; 5
; [then-branch: 207 | k@369@01 != i@370@01 && i@370@01 < |xs@339@01| && i@370@01 >= 0 && k@369@01 < |xs@339@01| && k@369@01 >= 0 | live]
; [else-branch: 207 | !(k@369@01 != i@370@01 && i@370@01 < |xs@339@01| && i@370@01 >= 0 && k@369@01 < |xs@339@01| && k@369@01 >= 0) | live]
(push) ; 6
; [then-branch: 207 | k@369@01 != i@370@01 && i@370@01 < |xs@339@01| && i@370@01 >= 0 && k@369@01 < |xs@339@01| && k@369@01 >= 0]
(assert (and
  (and
    (and
      (and (not (= k@369@01 i@370@01)) (< i@370@01 (Seq_length xs@339@01)))
      (>= i@370@01 0))
    (< k@369@01 (Seq_length xs@339@01)))
  (>= k@369@01 0)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] xs[k] != xs[i]
; [eval] xs[k]
; [eval] xs[i]
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 207 | !(k@369@01 != i@370@01 && i@370@01 < |xs@339@01| && i@370@01 >= 0 && k@369@01 < |xs@339@01| && k@369@01 >= 0)]
(assert (not
  (and
    (and
      (and
        (and (not (= k@369@01 i@370@01)) (< i@370@01 (Seq_length xs@339@01)))
        (>= i@370@01 0))
      (< k@369@01 (Seq_length xs@339@01)))
    (>= k@369@01 0))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (and
      (and
        (and (not (= k@369@01 i@370@01)) (< i@370@01 (Seq_length xs@339@01)))
        (>= i@370@01 0))
      (< k@369@01 (Seq_length xs@339@01)))
    (>= k@369@01 0))
  (and
    (not (= k@369@01 i@370@01))
    (< i@370@01 (Seq_length xs@339@01))
    (>= i@370@01 0)
    (< k@369@01 (Seq_length xs@339@01))
    (>= k@369@01 0))))
; Joined path conditions
(assert (or
  (not
    (and
      (and
        (and
          (and (not (= k@369@01 i@370@01)) (< i@370@01 (Seq_length xs@339@01)))
          (>= i@370@01 0))
        (< k@369@01 (Seq_length xs@339@01)))
      (>= k@369@01 0)))
  (and
    (and
      (and
        (and (not (= k@369@01 i@370@01)) (< i@370@01 (Seq_length xs@339@01)))
        (>= i@370@01 0))
      (< k@369@01 (Seq_length xs@339@01)))
    (>= k@369@01 0))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((k@369@01 Int) (i@370@01 Int)) (!
  (=>
    (and
      (and
        (and
          (and (not (= k@369@01 i@370@01)) (< i@370@01 (Seq_length xs@339@01)))
          (>= i@370@01 0))
        (< k@369@01 (Seq_length xs@339@01)))
      (>= k@369@01 0))
    (not (= (Seq_index xs@339@01 k@369@01) (Seq_index xs@339@01 i@370@01))))
  
  :qid |prog.l168|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (forall ((k@369@01 Int) (i@370@01 Int)) (!
  (=>
    (and
      (and
        (and
          (and (not (= k@369@01 i@370@01)) (< i@370@01 (Seq_length xs@339@01)))
          (>= i@370@01 0))
        (< k@369@01 (Seq_length xs@339@01)))
      (>= k@369@01 0))
    (not (= (Seq_index xs@339@01 k@369@01) (Seq_index xs@339@01 i@370@01))))
  
  :qid |prog.l168|)))
(declare-const i@371@01 Int)
(push) ; 4
; [eval] 0 <= i && i < |xs|
; [eval] 0 <= i
(push) ; 5
; [then-branch: 208 | 0 <= i@371@01 | live]
; [else-branch: 208 | !(0 <= i@371@01) | live]
(push) ; 6
; [then-branch: 208 | 0 <= i@371@01]
(assert (<= 0 i@371@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] i < |xs|
; [eval] |xs|
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 208 | !(0 <= i@371@01)]
(assert (not (<= 0 i@371@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 i@371@01)) (<= 0 i@371@01)))
(assert (and (< i@371@01 (Seq_length xs@339@01)) (<= 0 i@371@01)))
; [eval] xs[i]
(set-option :timeout 0)
(push) ; 5
(assert (not (>= i@371@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@372@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@371@01 Int)) (!
  (=>
    (and (< i@371@01 (Seq_length xs@339@01)) (<= 0 i@371@01))
    (or (not (<= 0 i@371@01)) (<= 0 i@371@01)))
  :pattern ((Seq_index xs@339@01 i@371@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@371@01 Int) (i2@371@01 Int)) (!
  (=>
    (and
      (and (< i1@371@01 (Seq_length xs@339@01)) (<= 0 i1@371@01))
      (and (< i2@371@01 (Seq_length xs@339@01)) (<= 0 i2@371@01))
      (= (Seq_index xs@339@01 i1@371@01) (Seq_index xs@339@01 i2@371@01)))
    (= i1@371@01 i2@371@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@371@01 Int)) (!
  (=>
    (and (< i@371@01 (Seq_length xs@339@01)) (<= 0 i@371@01))
    (= (inv@372@01 (Seq_index xs@339@01 i@371@01)) i@371@01))
  :pattern ((Seq_index xs@339@01 i@371@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@372@01 r) (Seq_length xs@339@01)) (<= 0 (inv@372@01 r)))
    (= (Seq_index xs@339@01 (inv@372@01 r)) r))
  :pattern ((inv@372@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@373@01 ((r $Ref)) $Perm
  (ite
    (and (< (inv@372@01 r) (Seq_length xs@339@01)) (<= 0 (inv@372@01 r)))
    ($Perm.min
      (ite
        (and (< (inv@345@01 r) (Seq_length xs@339@01)) (<= 0 (inv@345@01 r)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (< (inv@345@01 r) (Seq_length xs@339@01)) (<= 0 (inv@345@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@373@01 r))
    $Perm.No)
  
  :qid |quant-u-282|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (< (inv@372@01 r) (Seq_length xs@339@01)) (<= 0 (inv@372@01 r)))
    (= (- $Perm.Write (pTaken@373@01 r)) $Perm.No))
  
  :qid |quant-u-283|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@374@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@374@01  $FVF<f>)))
      (and (< (inv@372@01 r) (Seq_length xs@339@01)) (<= 0 (inv@372@01 r))))
    (=>
      (and (< (inv@372@01 r) (Seq_length xs@339@01)) (<= 0 (inv@372@01 r)))
      (Set_in r ($FVF.domain_f (as sm@374@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@374@01  $FVF<f>))))
  :qid |qp.fvfDomDef157|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@372@01 r) (Seq_length xs@339@01)) (<= 0 (inv@372@01 r)))
      (and (< (inv@345@01 r) (Seq_length xs@339@01)) (<= 0 (inv@345@01 r))))
    (= ($FVF.lookup_f (as sm@374@01  $FVF<f>) r) ($FVF.lookup_f $t@344@01 r)))
  :pattern (($FVF.lookup_f (as sm@374@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@344@01 r))
  :qid |qp.fvfValDef156|)))
(assert (fun07%precondition ($Snap.combine
  $Snap.unit
  ($SortWrappers.$FVF<f>To$Snap (as sm@374@01  $FVF<f>))) xs@339@01 (- 0 10)))
(pop) ; 3
; Joined path conditions
(assert (forall ((i@371@01 Int)) (!
  (=>
    (and (< i@371@01 (Seq_length xs@339@01)) (<= 0 i@371@01))
    (= (inv@372@01 (Seq_index xs@339@01 i@371@01)) i@371@01))
  :pattern ((Seq_index xs@339@01 i@371@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@372@01 r) (Seq_length xs@339@01)) (<= 0 (inv@372@01 r)))
    (= (Seq_index xs@339@01 (inv@372@01 r)) r))
  :pattern ((inv@372@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@374@01  $FVF<f>)))
      (and (< (inv@372@01 r) (Seq_length xs@339@01)) (<= 0 (inv@372@01 r))))
    (=>
      (and (< (inv@372@01 r) (Seq_length xs@339@01)) (<= 0 (inv@372@01 r)))
      (Set_in r ($FVF.domain_f (as sm@374@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@374@01  $FVF<f>))))
  :qid |qp.fvfDomDef157|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@372@01 r) (Seq_length xs@339@01)) (<= 0 (inv@372@01 r)))
      (and (< (inv@345@01 r) (Seq_length xs@339@01)) (<= 0 (inv@345@01 r))))
    (= ($FVF.lookup_f (as sm@374@01  $FVF<f>) r) ($FVF.lookup_f $t@344@01 r)))
  :pattern (($FVF.lookup_f (as sm@374@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@344@01 r))
  :qid |qp.fvfValDef156|)))
(assert (and
  (forall ((k@369@01 Int) (i@370@01 Int)) (!
    (=>
      (and
        (and
          (and
            (and (not (= k@369@01 i@370@01)) (< i@370@01 (Seq_length xs@339@01)))
            (>= i@370@01 0))
          (< k@369@01 (Seq_length xs@339@01)))
        (>= k@369@01 0))
      (not (= (Seq_index xs@339@01 k@369@01) (Seq_index xs@339@01 i@370@01))))
    
    :qid |prog.l168|))
  (forall ((i@371@01 Int)) (!
    (=>
      (and (< i@371@01 (Seq_length xs@339@01)) (<= 0 i@371@01))
      (or (not (<= 0 i@371@01)) (<= 0 i@371@01)))
    :pattern ((Seq_index xs@339@01 i@371@01))
    :qid |f-aux|))
  (fun07%precondition ($Snap.combine
    $Snap.unit
    ($SortWrappers.$FVF<f>To$Snap (as sm@374@01  $FVF<f>))) xs@339@01 (- 0 10))))
(set-option :timeout 0)
(push) ; 3
(assert (not (>
  (fun07 ($Snap.combine
    $Snap.unit
    ($SortWrappers.$FVF<f>To$Snap (as sm@374@01  $FVF<f>))) xs@339@01 (- 0 10))
  0)))
(check-sat)
; unknown
(pop) ; 3
; 0.03s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const sm@375@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@345@01 r) (Seq_length xs@339@01)) (<= 0 (inv@345@01 r)))
    (= ($FVF.lookup_f (as sm@375@01  $FVF<f>) r) ($FVF.lookup_f $t@344@01 r)))
  :pattern (($FVF.lookup_f (as sm@375@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@344@01 r))
  :qid |qp.fvfValDef158|)))
(declare-const pm@376@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@376@01  $FPM) r)
    (ite
      (and (< (inv@345@01 r) (Seq_length xs@339@01)) (<= 0 (inv@345@01 r)))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@376@01  $FPM) r))
  :qid |qp.resPrmSumDef159|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@376@01  $FPM) r) $Perm.Write)
  :pattern ((inv@345@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] fun07(xs, -10) > 0
; [eval] fun07(xs, -10)
; [eval] -10
(set-option :timeout 0)
(push) ; 3
; [eval] (forall k: Int, i: Int ::k >= 0 && (k < |xs| && (i >= 0 && (i < |xs| && k != i))) ==> xs[k] != xs[i])
(declare-const k@377@01 Int)
(declare-const i@378@01 Int)
(push) ; 4
; [eval] k >= 0 && (k < |xs| && (i >= 0 && (i < |xs| && k != i))) ==> xs[k] != xs[i]
; [eval] k >= 0 && (k < |xs| && (i >= 0 && (i < |xs| && k != i)))
; [eval] k >= 0
(push) ; 5
; [then-branch: 209 | k@377@01 >= 0 | live]
; [else-branch: 209 | !(k@377@01 >= 0) | live]
(push) ; 6
; [then-branch: 209 | k@377@01 >= 0]
(assert (>= k@377@01 0))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] k < |xs|
; [eval] |xs|
(set-option :timeout 0)
(push) ; 7
; [then-branch: 210 | k@377@01 < |xs@339@01| | live]
; [else-branch: 210 | !(k@377@01 < |xs@339@01|) | live]
(push) ; 8
; [then-branch: 210 | k@377@01 < |xs@339@01|]
(assert (< k@377@01 (Seq_length xs@339@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] i >= 0
(set-option :timeout 0)
(push) ; 9
; [then-branch: 211 | i@378@01 >= 0 | live]
; [else-branch: 211 | !(i@378@01 >= 0) | live]
(push) ; 10
; [then-branch: 211 | i@378@01 >= 0]
(assert (>= i@378@01 0))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] i < |xs|
; [eval] |xs|
(set-option :timeout 0)
(push) ; 11
; [then-branch: 212 | i@378@01 < |xs@339@01| | live]
; [else-branch: 212 | !(i@378@01 < |xs@339@01|) | live]
(push) ; 12
; [then-branch: 212 | i@378@01 < |xs@339@01|]
(assert (< i@378@01 (Seq_length xs@339@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] k != i
(pop) ; 12
(set-option :timeout 0)
(push) ; 12
; [else-branch: 212 | !(i@378@01 < |xs@339@01|)]
(assert (not (< i@378@01 (Seq_length xs@339@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or
  (not (< i@378@01 (Seq_length xs@339@01)))
  (< i@378@01 (Seq_length xs@339@01))))
(pop) ; 10
(set-option :timeout 0)
(push) ; 10
; [else-branch: 211 | !(i@378@01 >= 0)]
(assert (not (>= i@378@01 0)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (=>
  (>= i@378@01 0)
  (and
    (>= i@378@01 0)
    (or
      (not (< i@378@01 (Seq_length xs@339@01)))
      (< i@378@01 (Seq_length xs@339@01))))))
; Joined path conditions
(assert (or (not (>= i@378@01 0)) (>= i@378@01 0)))
(pop) ; 8
(set-option :timeout 0)
(push) ; 8
; [else-branch: 210 | !(k@377@01 < |xs@339@01|)]
(assert (not (< k@377@01 (Seq_length xs@339@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (< k@377@01 (Seq_length xs@339@01))
  (and
    (< k@377@01 (Seq_length xs@339@01))
    (=>
      (>= i@378@01 0)
      (and
        (>= i@378@01 0)
        (or
          (not (< i@378@01 (Seq_length xs@339@01)))
          (< i@378@01 (Seq_length xs@339@01)))))
    (or (not (>= i@378@01 0)) (>= i@378@01 0)))))
; Joined path conditions
(assert (or
  (not (< k@377@01 (Seq_length xs@339@01)))
  (< k@377@01 (Seq_length xs@339@01))))
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 209 | !(k@377@01 >= 0)]
(assert (not (>= k@377@01 0)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (>= k@377@01 0)
  (and
    (>= k@377@01 0)
    (=>
      (< k@377@01 (Seq_length xs@339@01))
      (and
        (< k@377@01 (Seq_length xs@339@01))
        (=>
          (>= i@378@01 0)
          (and
            (>= i@378@01 0)
            (or
              (not (< i@378@01 (Seq_length xs@339@01)))
              (< i@378@01 (Seq_length xs@339@01)))))
        (or (not (>= i@378@01 0)) (>= i@378@01 0))))
    (or
      (not (< k@377@01 (Seq_length xs@339@01)))
      (< k@377@01 (Seq_length xs@339@01))))))
; Joined path conditions
(assert (or (not (>= k@377@01 0)) (>= k@377@01 0)))
(set-option :timeout 0)
(push) ; 5
; [then-branch: 213 | k@377@01 != i@378@01 && i@378@01 < |xs@339@01| && i@378@01 >= 0 && k@377@01 < |xs@339@01| && k@377@01 >= 0 | live]
; [else-branch: 213 | !(k@377@01 != i@378@01 && i@378@01 < |xs@339@01| && i@378@01 >= 0 && k@377@01 < |xs@339@01| && k@377@01 >= 0) | live]
(push) ; 6
; [then-branch: 213 | k@377@01 != i@378@01 && i@378@01 < |xs@339@01| && i@378@01 >= 0 && k@377@01 < |xs@339@01| && k@377@01 >= 0]
(assert (and
  (and
    (and
      (and (not (= k@377@01 i@378@01)) (< i@378@01 (Seq_length xs@339@01)))
      (>= i@378@01 0))
    (< k@377@01 (Seq_length xs@339@01)))
  (>= k@377@01 0)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] xs[k] != xs[i]
; [eval] xs[k]
; [eval] xs[i]
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 213 | !(k@377@01 != i@378@01 && i@378@01 < |xs@339@01| && i@378@01 >= 0 && k@377@01 < |xs@339@01| && k@377@01 >= 0)]
(assert (not
  (and
    (and
      (and
        (and (not (= k@377@01 i@378@01)) (< i@378@01 (Seq_length xs@339@01)))
        (>= i@378@01 0))
      (< k@377@01 (Seq_length xs@339@01)))
    (>= k@377@01 0))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (and
      (and
        (and (not (= k@377@01 i@378@01)) (< i@378@01 (Seq_length xs@339@01)))
        (>= i@378@01 0))
      (< k@377@01 (Seq_length xs@339@01)))
    (>= k@377@01 0))
  (and
    (not (= k@377@01 i@378@01))
    (< i@378@01 (Seq_length xs@339@01))
    (>= i@378@01 0)
    (< k@377@01 (Seq_length xs@339@01))
    (>= k@377@01 0))))
; Joined path conditions
(assert (or
  (not
    (and
      (and
        (and
          (and (not (= k@377@01 i@378@01)) (< i@378@01 (Seq_length xs@339@01)))
          (>= i@378@01 0))
        (< k@377@01 (Seq_length xs@339@01)))
      (>= k@377@01 0)))
  (and
    (and
      (and
        (and (not (= k@377@01 i@378@01)) (< i@378@01 (Seq_length xs@339@01)))
        (>= i@378@01 0))
      (< k@377@01 (Seq_length xs@339@01)))
    (>= k@377@01 0))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((k@377@01 Int) (i@378@01 Int)) (!
  (=>
    (and
      (and
        (and
          (and (not (= k@377@01 i@378@01)) (< i@378@01 (Seq_length xs@339@01)))
          (>= i@378@01 0))
        (< k@377@01 (Seq_length xs@339@01)))
      (>= k@377@01 0))
    (not (= (Seq_index xs@339@01 k@377@01) (Seq_index xs@339@01 i@378@01))))
  
  :qid |prog.l168|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (forall ((k@377@01 Int) (i@378@01 Int)) (!
  (=>
    (and
      (and
        (and
          (and (not (= k@377@01 i@378@01)) (< i@378@01 (Seq_length xs@339@01)))
          (>= i@378@01 0))
        (< k@377@01 (Seq_length xs@339@01)))
      (>= k@377@01 0))
    (not (= (Seq_index xs@339@01 k@377@01) (Seq_index xs@339@01 i@378@01))))
  
  :qid |prog.l168|)))
(declare-const i@379@01 Int)
(push) ; 4
; [eval] 0 <= i && i < |xs|
; [eval] 0 <= i
(push) ; 5
; [then-branch: 214 | 0 <= i@379@01 | live]
; [else-branch: 214 | !(0 <= i@379@01) | live]
(push) ; 6
; [then-branch: 214 | 0 <= i@379@01]
(assert (<= 0 i@379@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] i < |xs|
; [eval] |xs|
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 214 | !(0 <= i@379@01)]
(assert (not (<= 0 i@379@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 i@379@01)) (<= 0 i@379@01)))
(assert (and (< i@379@01 (Seq_length xs@339@01)) (<= 0 i@379@01)))
; [eval] xs[i]
(set-option :timeout 0)
(push) ; 5
(assert (not (>= i@379@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@380@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@379@01 Int)) (!
  (=>
    (and (< i@379@01 (Seq_length xs@339@01)) (<= 0 i@379@01))
    (or (not (<= 0 i@379@01)) (<= 0 i@379@01)))
  :pattern ((Seq_index xs@339@01 i@379@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@379@01 Int) (i2@379@01 Int)) (!
  (=>
    (and
      (and (< i1@379@01 (Seq_length xs@339@01)) (<= 0 i1@379@01))
      (and (< i2@379@01 (Seq_length xs@339@01)) (<= 0 i2@379@01))
      (= (Seq_index xs@339@01 i1@379@01) (Seq_index xs@339@01 i2@379@01)))
    (= i1@379@01 i2@379@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@379@01 Int)) (!
  (=>
    (and (< i@379@01 (Seq_length xs@339@01)) (<= 0 i@379@01))
    (= (inv@380@01 (Seq_index xs@339@01 i@379@01)) i@379@01))
  :pattern ((Seq_index xs@339@01 i@379@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@380@01 r) (Seq_length xs@339@01)) (<= 0 (inv@380@01 r)))
    (= (Seq_index xs@339@01 (inv@380@01 r)) r))
  :pattern ((inv@380@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@381@01 ((r $Ref)) $Perm
  (ite
    (and (< (inv@380@01 r) (Seq_length xs@339@01)) (<= 0 (inv@380@01 r)))
    ($Perm.min
      (ite
        (and (< (inv@345@01 r) (Seq_length xs@339@01)) (<= 0 (inv@345@01 r)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (< (inv@345@01 r) (Seq_length xs@339@01)) (<= 0 (inv@345@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@381@01 r))
    $Perm.No)
  
  :qid |quant-u-286|))))
(check-sat)
; unsat
(pop) ; 4
; 0.01s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (< (inv@380@01 r) (Seq_length xs@339@01)) (<= 0 (inv@380@01 r)))
    (= (- $Perm.Write (pTaken@381@01 r)) $Perm.No))
  
  :qid |quant-u-287|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@382@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@382@01  $FVF<f>)))
      (and (< (inv@380@01 r) (Seq_length xs@339@01)) (<= 0 (inv@380@01 r))))
    (=>
      (and (< (inv@380@01 r) (Seq_length xs@339@01)) (<= 0 (inv@380@01 r)))
      (Set_in r ($FVF.domain_f (as sm@382@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@382@01  $FVF<f>))))
  :qid |qp.fvfDomDef161|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@380@01 r) (Seq_length xs@339@01)) (<= 0 (inv@380@01 r)))
      (and (< (inv@345@01 r) (Seq_length xs@339@01)) (<= 0 (inv@345@01 r))))
    (= ($FVF.lookup_f (as sm@382@01  $FVF<f>) r) ($FVF.lookup_f $t@344@01 r)))
  :pattern (($FVF.lookup_f (as sm@382@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@344@01 r))
  :qid |qp.fvfValDef160|)))
(assert (fun07%precondition ($Snap.combine
  $Snap.unit
  ($SortWrappers.$FVF<f>To$Snap (as sm@382@01  $FVF<f>))) xs@339@01 (- 0 10)))
(pop) ; 3
; Joined path conditions
(assert (forall ((i@379@01 Int)) (!
  (=>
    (and (< i@379@01 (Seq_length xs@339@01)) (<= 0 i@379@01))
    (= (inv@380@01 (Seq_index xs@339@01 i@379@01)) i@379@01))
  :pattern ((Seq_index xs@339@01 i@379@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@380@01 r) (Seq_length xs@339@01)) (<= 0 (inv@380@01 r)))
    (= (Seq_index xs@339@01 (inv@380@01 r)) r))
  :pattern ((inv@380@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@382@01  $FVF<f>)))
      (and (< (inv@380@01 r) (Seq_length xs@339@01)) (<= 0 (inv@380@01 r))))
    (=>
      (and (< (inv@380@01 r) (Seq_length xs@339@01)) (<= 0 (inv@380@01 r)))
      (Set_in r ($FVF.domain_f (as sm@382@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@382@01  $FVF<f>))))
  :qid |qp.fvfDomDef161|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@380@01 r) (Seq_length xs@339@01)) (<= 0 (inv@380@01 r)))
      (and (< (inv@345@01 r) (Seq_length xs@339@01)) (<= 0 (inv@345@01 r))))
    (= ($FVF.lookup_f (as sm@382@01  $FVF<f>) r) ($FVF.lookup_f $t@344@01 r)))
  :pattern (($FVF.lookup_f (as sm@382@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@344@01 r))
  :qid |qp.fvfValDef160|)))
(assert (and
  (forall ((k@377@01 Int) (i@378@01 Int)) (!
    (=>
      (and
        (and
          (and
            (and (not (= k@377@01 i@378@01)) (< i@378@01 (Seq_length xs@339@01)))
            (>= i@378@01 0))
          (< k@377@01 (Seq_length xs@339@01)))
        (>= k@377@01 0))
      (not (= (Seq_index xs@339@01 k@377@01) (Seq_index xs@339@01 i@378@01))))
    
    :qid |prog.l168|))
  (forall ((i@379@01 Int)) (!
    (=>
      (and (< i@379@01 (Seq_length xs@339@01)) (<= 0 i@379@01))
      (or (not (<= 0 i@379@01)) (<= 0 i@379@01)))
    :pattern ((Seq_index xs@339@01 i@379@01))
    :qid |f-aux|))
  (fun07%precondition ($Snap.combine
    $Snap.unit
    ($SortWrappers.$FVF<f>To$Snap (as sm@382@01  $FVF<f>))) xs@339@01 (- 0 10))))
(set-option :timeout 0)
(push) ; 3
(assert (not (>
  (fun07 ($Snap.combine
    $Snap.unit
    ($SortWrappers.$FVF<f>To$Snap (as sm@382@01  $FVF<f>))) xs@339@01 (- 0 10))
  0)))
(check-sat)
; unknown
(pop) ; 3
; 0.04s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] fun07(xs, -10) > 0
; [eval] fun07(xs, -10)
; [eval] -10
(set-option :timeout 0)
(push) ; 3
; [eval] (forall k: Int, i: Int ::k >= 0 && (k < |xs| && (i >= 0 && (i < |xs| && k != i))) ==> xs[k] != xs[i])
(declare-const k@383@01 Int)
(declare-const i@384@01 Int)
(push) ; 4
; [eval] k >= 0 && (k < |xs| && (i >= 0 && (i < |xs| && k != i))) ==> xs[k] != xs[i]
; [eval] k >= 0 && (k < |xs| && (i >= 0 && (i < |xs| && k != i)))
; [eval] k >= 0
(push) ; 5
; [then-branch: 215 | k@383@01 >= 0 | live]
; [else-branch: 215 | !(k@383@01 >= 0) | live]
(push) ; 6
; [then-branch: 215 | k@383@01 >= 0]
(assert (>= k@383@01 0))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] k < |xs|
; [eval] |xs|
(set-option :timeout 0)
(push) ; 7
; [then-branch: 216 | k@383@01 < |xs@339@01| | live]
; [else-branch: 216 | !(k@383@01 < |xs@339@01|) | live]
(push) ; 8
; [then-branch: 216 | k@383@01 < |xs@339@01|]
(assert (< k@383@01 (Seq_length xs@339@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] i >= 0
(set-option :timeout 0)
(push) ; 9
; [then-branch: 217 | i@384@01 >= 0 | live]
; [else-branch: 217 | !(i@384@01 >= 0) | live]
(push) ; 10
; [then-branch: 217 | i@384@01 >= 0]
(assert (>= i@384@01 0))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] i < |xs|
; [eval] |xs|
(set-option :timeout 0)
(push) ; 11
; [then-branch: 218 | i@384@01 < |xs@339@01| | live]
; [else-branch: 218 | !(i@384@01 < |xs@339@01|) | live]
(push) ; 12
; [then-branch: 218 | i@384@01 < |xs@339@01|]
(assert (< i@384@01 (Seq_length xs@339@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] k != i
(pop) ; 12
(set-option :timeout 0)
(push) ; 12
; [else-branch: 218 | !(i@384@01 < |xs@339@01|)]
(assert (not (< i@384@01 (Seq_length xs@339@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or
  (not (< i@384@01 (Seq_length xs@339@01)))
  (< i@384@01 (Seq_length xs@339@01))))
(pop) ; 10
(set-option :timeout 0)
(push) ; 10
; [else-branch: 217 | !(i@384@01 >= 0)]
(assert (not (>= i@384@01 0)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (=>
  (>= i@384@01 0)
  (and
    (>= i@384@01 0)
    (or
      (not (< i@384@01 (Seq_length xs@339@01)))
      (< i@384@01 (Seq_length xs@339@01))))))
; Joined path conditions
(assert (or (not (>= i@384@01 0)) (>= i@384@01 0)))
(pop) ; 8
(set-option :timeout 0)
(push) ; 8
; [else-branch: 216 | !(k@383@01 < |xs@339@01|)]
(assert (not (< k@383@01 (Seq_length xs@339@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (=>
  (< k@383@01 (Seq_length xs@339@01))
  (and
    (< k@383@01 (Seq_length xs@339@01))
    (=>
      (>= i@384@01 0)
      (and
        (>= i@384@01 0)
        (or
          (not (< i@384@01 (Seq_length xs@339@01)))
          (< i@384@01 (Seq_length xs@339@01)))))
    (or (not (>= i@384@01 0)) (>= i@384@01 0)))))
; Joined path conditions
(assert (or
  (not (< k@383@01 (Seq_length xs@339@01)))
  (< k@383@01 (Seq_length xs@339@01))))
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 215 | !(k@383@01 >= 0)]
(assert (not (>= k@383@01 0)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (>= k@383@01 0)
  (and
    (>= k@383@01 0)
    (=>
      (< k@383@01 (Seq_length xs@339@01))
      (and
        (< k@383@01 (Seq_length xs@339@01))
        (=>
          (>= i@384@01 0)
          (and
            (>= i@384@01 0)
            (or
              (not (< i@384@01 (Seq_length xs@339@01)))
              (< i@384@01 (Seq_length xs@339@01)))))
        (or (not (>= i@384@01 0)) (>= i@384@01 0))))
    (or
      (not (< k@383@01 (Seq_length xs@339@01)))
      (< k@383@01 (Seq_length xs@339@01))))))
; Joined path conditions
(assert (or (not (>= k@383@01 0)) (>= k@383@01 0)))
(set-option :timeout 0)
(push) ; 5
; [then-branch: 219 | k@383@01 != i@384@01 && i@384@01 < |xs@339@01| && i@384@01 >= 0 && k@383@01 < |xs@339@01| && k@383@01 >= 0 | live]
; [else-branch: 219 | !(k@383@01 != i@384@01 && i@384@01 < |xs@339@01| && i@384@01 >= 0 && k@383@01 < |xs@339@01| && k@383@01 >= 0) | live]
(push) ; 6
; [then-branch: 219 | k@383@01 != i@384@01 && i@384@01 < |xs@339@01| && i@384@01 >= 0 && k@383@01 < |xs@339@01| && k@383@01 >= 0]
(assert (and
  (and
    (and
      (and (not (= k@383@01 i@384@01)) (< i@384@01 (Seq_length xs@339@01)))
      (>= i@384@01 0))
    (< k@383@01 (Seq_length xs@339@01)))
  (>= k@383@01 0)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] xs[k] != xs[i]
; [eval] xs[k]
; [eval] xs[i]
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 219 | !(k@383@01 != i@384@01 && i@384@01 < |xs@339@01| && i@384@01 >= 0 && k@383@01 < |xs@339@01| && k@383@01 >= 0)]
(assert (not
  (and
    (and
      (and
        (and (not (= k@383@01 i@384@01)) (< i@384@01 (Seq_length xs@339@01)))
        (>= i@384@01 0))
      (< k@383@01 (Seq_length xs@339@01)))
    (>= k@383@01 0))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (and
      (and
        (and (not (= k@383@01 i@384@01)) (< i@384@01 (Seq_length xs@339@01)))
        (>= i@384@01 0))
      (< k@383@01 (Seq_length xs@339@01)))
    (>= k@383@01 0))
  (and
    (not (= k@383@01 i@384@01))
    (< i@384@01 (Seq_length xs@339@01))
    (>= i@384@01 0)
    (< k@383@01 (Seq_length xs@339@01))
    (>= k@383@01 0))))
; Joined path conditions
(assert (or
  (not
    (and
      (and
        (and
          (and (not (= k@383@01 i@384@01)) (< i@384@01 (Seq_length xs@339@01)))
          (>= i@384@01 0))
        (< k@383@01 (Seq_length xs@339@01)))
      (>= k@383@01 0)))
  (and
    (and
      (and
        (and (not (= k@383@01 i@384@01)) (< i@384@01 (Seq_length xs@339@01)))
        (>= i@384@01 0))
      (< k@383@01 (Seq_length xs@339@01)))
    (>= k@383@01 0))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((k@383@01 Int) (i@384@01 Int)) (!
  (=>
    (and
      (and
        (and
          (and (not (= k@383@01 i@384@01)) (< i@384@01 (Seq_length xs@339@01)))
          (>= i@384@01 0))
        (< k@383@01 (Seq_length xs@339@01)))
      (>= k@383@01 0))
    (not (= (Seq_index xs@339@01 k@383@01) (Seq_index xs@339@01 i@384@01))))
  
  :qid |prog.l168|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (forall ((k@383@01 Int) (i@384@01 Int)) (!
  (=>
    (and
      (and
        (and
          (and (not (= k@383@01 i@384@01)) (< i@384@01 (Seq_length xs@339@01)))
          (>= i@384@01 0))
        (< k@383@01 (Seq_length xs@339@01)))
      (>= k@383@01 0))
    (not (= (Seq_index xs@339@01 k@383@01) (Seq_index xs@339@01 i@384@01))))
  
  :qid |prog.l168|)))
(declare-const i@385@01 Int)
(push) ; 4
; [eval] 0 <= i && i < |xs|
; [eval] 0 <= i
(push) ; 5
; [then-branch: 220 | 0 <= i@385@01 | live]
; [else-branch: 220 | !(0 <= i@385@01) | live]
(push) ; 6
; [then-branch: 220 | 0 <= i@385@01]
(assert (<= 0 i@385@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] i < |xs|
; [eval] |xs|
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 220 | !(0 <= i@385@01)]
(assert (not (<= 0 i@385@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 i@385@01)) (<= 0 i@385@01)))
(assert (and (< i@385@01 (Seq_length xs@339@01)) (<= 0 i@385@01)))
; [eval] xs[i]
(set-option :timeout 0)
(push) ; 5
(assert (not (>= i@385@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@386@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@385@01 Int)) (!
  (=>
    (and (< i@385@01 (Seq_length xs@339@01)) (<= 0 i@385@01))
    (or (not (<= 0 i@385@01)) (<= 0 i@385@01)))
  :pattern ((Seq_index xs@339@01 i@385@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@385@01 Int) (i2@385@01 Int)) (!
  (=>
    (and
      (and (< i1@385@01 (Seq_length xs@339@01)) (<= 0 i1@385@01))
      (and (< i2@385@01 (Seq_length xs@339@01)) (<= 0 i2@385@01))
      (= (Seq_index xs@339@01 i1@385@01) (Seq_index xs@339@01 i2@385@01)))
    (= i1@385@01 i2@385@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@385@01 Int)) (!
  (=>
    (and (< i@385@01 (Seq_length xs@339@01)) (<= 0 i@385@01))
    (= (inv@386@01 (Seq_index xs@339@01 i@385@01)) i@385@01))
  :pattern ((Seq_index xs@339@01 i@385@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@386@01 r) (Seq_length xs@339@01)) (<= 0 (inv@386@01 r)))
    (= (Seq_index xs@339@01 (inv@386@01 r)) r))
  :pattern ((inv@386@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@387@01 ((r $Ref)) $Perm
  (ite
    (and (< (inv@386@01 r) (Seq_length xs@339@01)) (<= 0 (inv@386@01 r)))
    ($Perm.min
      (ite
        (and (< (inv@345@01 r) (Seq_length xs@339@01)) (<= 0 (inv@345@01 r)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (< (inv@345@01 r) (Seq_length xs@339@01)) (<= 0 (inv@345@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@387@01 r))
    $Perm.No)
  
  :qid |quant-u-290|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and (< (inv@386@01 r) (Seq_length xs@339@01)) (<= 0 (inv@386@01 r)))
    (= (- $Perm.Write (pTaken@387@01 r)) $Perm.No))
  
  :qid |quant-u-291|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@388@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@388@01  $FVF<f>)))
      (and (< (inv@386@01 r) (Seq_length xs@339@01)) (<= 0 (inv@386@01 r))))
    (=>
      (and (< (inv@386@01 r) (Seq_length xs@339@01)) (<= 0 (inv@386@01 r)))
      (Set_in r ($FVF.domain_f (as sm@388@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@388@01  $FVF<f>))))
  :qid |qp.fvfDomDef163|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@386@01 r) (Seq_length xs@339@01)) (<= 0 (inv@386@01 r)))
      (and (< (inv@345@01 r) (Seq_length xs@339@01)) (<= 0 (inv@345@01 r))))
    (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) r) ($FVF.lookup_f $t@344@01 r)))
  :pattern (($FVF.lookup_f (as sm@388@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@344@01 r))
  :qid |qp.fvfValDef162|)))
(assert (fun07%precondition ($Snap.combine
  $Snap.unit
  ($SortWrappers.$FVF<f>To$Snap (as sm@388@01  $FVF<f>))) xs@339@01 (- 0 10)))
(pop) ; 3
; Joined path conditions
(assert (forall ((i@385@01 Int)) (!
  (=>
    (and (< i@385@01 (Seq_length xs@339@01)) (<= 0 i@385@01))
    (= (inv@386@01 (Seq_index xs@339@01 i@385@01)) i@385@01))
  :pattern ((Seq_index xs@339@01 i@385@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@386@01 r) (Seq_length xs@339@01)) (<= 0 (inv@386@01 r)))
    (= (Seq_index xs@339@01 (inv@386@01 r)) r))
  :pattern ((inv@386@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@388@01  $FVF<f>)))
      (and (< (inv@386@01 r) (Seq_length xs@339@01)) (<= 0 (inv@386@01 r))))
    (=>
      (and (< (inv@386@01 r) (Seq_length xs@339@01)) (<= 0 (inv@386@01 r)))
      (Set_in r ($FVF.domain_f (as sm@388@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@388@01  $FVF<f>))))
  :qid |qp.fvfDomDef163|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@386@01 r) (Seq_length xs@339@01)) (<= 0 (inv@386@01 r)))
      (and (< (inv@345@01 r) (Seq_length xs@339@01)) (<= 0 (inv@345@01 r))))
    (= ($FVF.lookup_f (as sm@388@01  $FVF<f>) r) ($FVF.lookup_f $t@344@01 r)))
  :pattern (($FVF.lookup_f (as sm@388@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@344@01 r))
  :qid |qp.fvfValDef162|)))
(assert (and
  (forall ((k@383@01 Int) (i@384@01 Int)) (!
    (=>
      (and
        (and
          (and
            (and (not (= k@383@01 i@384@01)) (< i@384@01 (Seq_length xs@339@01)))
            (>= i@384@01 0))
          (< k@383@01 (Seq_length xs@339@01)))
        (>= k@383@01 0))
      (not (= (Seq_index xs@339@01 k@383@01) (Seq_index xs@339@01 i@384@01))))
    
    :qid |prog.l168|))
  (forall ((i@385@01 Int)) (!
    (=>
      (and (< i@385@01 (Seq_length xs@339@01)) (<= 0 i@385@01))
      (or (not (<= 0 i@385@01)) (<= 0 i@385@01)))
    :pattern ((Seq_index xs@339@01 i@385@01))
    :qid |f-aux|))
  (fun07%precondition ($Snap.combine
    $Snap.unit
    ($SortWrappers.$FVF<f>To$Snap (as sm@388@01  $FVF<f>))) xs@339@01 (- 0 10))))
(set-option :timeout 0)
(push) ; 3
(assert (not (>
  (fun07 ($Snap.combine
    $Snap.unit
    ($SortWrappers.$FVF<f>To$Snap (as sm@388@01  $FVF<f>))) xs@339@01 (- 0 10))
  0)))
(check-sat)
; unknown
(pop) ; 3
; 0.05s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
