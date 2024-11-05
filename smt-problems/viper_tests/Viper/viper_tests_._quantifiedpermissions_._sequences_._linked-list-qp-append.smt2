(get-info :version)
; (:version "4.12.1")
; Started: 2023-10-31 14:20:53
; Silicon.version: 1.1-SNAPSHOT (46944a65@dspil_symbenchmarking)
; Input file: /home/pcorrect/repos/benchmarking_general/silicon_tests/viper_tests_._quantifiedpermissions_._sequences_._linked-list-qp-append.vpr
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
(declare-sort Seq<Int> 0)
(declare-sort Set<$Ref> 0)
(declare-sort Set<Int> 0)
(declare-sort Set<Seq<$Ref>> 0)
(declare-sort Set<Seq<Int>> 0)
(declare-sort Set<$Snap> 0)
(declare-sort $FVF<nodes> 0)
(declare-sort $FVF<val> 0)
(declare-sort $FVF<next> 0)
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
(declare-fun $SortWrappers.Set<Seq<Int>>To$Snap (Set<Seq<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToSet<Seq<Int>> ($Snap) Set<Seq<Int>>)
(assert (forall ((x Set<Seq<Int>>)) (!
    (= x ($SortWrappers.$SnapToSet<Seq<Int>>($SortWrappers.Set<Seq<Int>>To$Snap x)))
    :pattern (($SortWrappers.Set<Seq<Int>>To$Snap x))
    :qid |$Snap.$SnapToSet<Seq<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Set<Seq<Int>>To$Snap($SortWrappers.$SnapToSet<Seq<Int>> x)))
    :pattern (($SortWrappers.$SnapToSet<Seq<Int>> x))
    :qid |$Snap.Set<Seq<Int>>To$SnapToSet<Seq<Int>>|
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
(declare-fun $SortWrappers.$FVF<nodes>To$Snap ($FVF<nodes>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<nodes> ($Snap) $FVF<nodes>)
(assert (forall ((x $FVF<nodes>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<nodes>($SortWrappers.$FVF<nodes>To$Snap x)))
    :pattern (($SortWrappers.$FVF<nodes>To$Snap x))
    :qid |$Snap.$SnapTo$FVF<nodes>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$FVF<nodes>To$Snap($SortWrappers.$SnapTo$FVF<nodes> x)))
    :pattern (($SortWrappers.$SnapTo$FVF<nodes> x))
    :qid |$Snap.$FVF<nodes>To$SnapTo$FVF<nodes>|
    )))
(declare-fun $SortWrappers.$FVF<val>To$Snap ($FVF<val>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<val> ($Snap) $FVF<val>)
(assert (forall ((x $FVF<val>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<val>($SortWrappers.$FVF<val>To$Snap x)))
    :pattern (($SortWrappers.$FVF<val>To$Snap x))
    :qid |$Snap.$SnapTo$FVF<val>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$FVF<val>To$Snap($SortWrappers.$SnapTo$FVF<val> x)))
    :pattern (($SortWrappers.$SnapTo$FVF<val> x))
    :qid |$Snap.$FVF<val>To$SnapTo$FVF<val>|
    )))
(declare-fun $SortWrappers.$FVF<next>To$Snap ($FVF<next>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<next> ($Snap) $FVF<next>)
(assert (forall ((x $FVF<next>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<next>($SortWrappers.$FVF<next>To$Snap x)))
    :pattern (($SortWrappers.$FVF<next>To$Snap x))
    :qid |$Snap.$SnapTo$FVF<next>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$FVF<next>To$Snap($SortWrappers.$SnapTo$FVF<next> x)))
    :pattern (($SortWrappers.$SnapTo$FVF<next> x))
    :qid |$Snap.$FVF<next>To$SnapTo$FVF<next>|
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
(declare-fun Set_in (Seq<Int> Set<Seq<Int>>) Bool)
(declare-fun Set_card (Set<Seq<Int>>) Int)
(declare-const Set_empty Set<Seq<Int>>)
(declare-fun Set_singleton (Seq<Int>) Set<Seq<Int>>)
(declare-fun Set_unionone (Set<Seq<Int>> Seq<Int>) Set<Seq<Int>>)
(declare-fun Set_union (Set<Seq<Int>> Set<Seq<Int>>) Set<Seq<Int>>)
(declare-fun Set_disjoint (Set<Seq<Int>> Set<Seq<Int>>) Bool)
(declare-fun Set_difference (Set<Seq<Int>> Set<Seq<Int>>) Set<Seq<Int>>)
(declare-fun Set_intersection (Set<Seq<Int>> Set<Seq<Int>>) Set<Seq<Int>>)
(declare-fun Set_subset (Set<Seq<Int>> Set<Seq<Int>>) Bool)
(declare-fun Set_equal (Set<Seq<Int>> Set<Seq<Int>>) Bool)
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
; /field_value_functions_declarations.smt2 [nodes: Seq[Ref]]
(declare-fun $FVF.domain_nodes ($FVF<nodes>) Set<$Ref>)
(declare-fun $FVF.lookup_nodes ($FVF<nodes> $Ref) Seq<$Ref>)
(declare-fun $FVF.after_nodes ($FVF<nodes> $FVF<nodes>) Bool)
(declare-fun $FVF.loc_nodes (Seq<$Ref> $Ref) Bool)
(declare-fun $FVF.perm_nodes ($FPM $Ref) $Perm)
(declare-const $fvfTOP_nodes $FVF<nodes>)
; /field_value_functions_declarations.smt2 [val: Int]
(declare-fun $FVF.domain_val ($FVF<val>) Set<$Ref>)
(declare-fun $FVF.lookup_val ($FVF<val> $Ref) Int)
(declare-fun $FVF.after_val ($FVF<val> $FVF<val>) Bool)
(declare-fun $FVF.loc_val (Int $Ref) Bool)
(declare-fun $FVF.perm_val ($FPM $Ref) $Perm)
(declare-const $fvfTOP_val $FVF<val>)
; /field_value_functions_declarations.smt2 [next: Ref]
(declare-fun $FVF.domain_next ($FVF<next>) Set<$Ref>)
(declare-fun $FVF.lookup_next ($FVF<next> $Ref) $Ref)
(declare-fun $FVF.after_next ($FVF<next> $FVF<next>) Bool)
(declare-fun $FVF.loc_next ($Ref $Ref) Bool)
(declare-fun $FVF.perm_next ($FPM $Ref) $Perm)
(declare-const $fvfTOP_next $FVF<next>)
; Declaring symbols related to program functions (from program analysis)
(declare-fun length ($Snap $Ref) Int)
(declare-fun length%limited ($Snap $Ref) Int)
(declare-fun length%stateless ($Ref) Bool)
(declare-fun length%precondition ($Snap $Ref) Bool)
(declare-fun itemAt ($Snap $Ref Int) Int)
(declare-fun itemAt%limited ($Snap $Ref Int) Int)
(declare-fun itemAt%stateless ($Ref Int) Bool)
(declare-fun itemAt%precondition ($Snap $Ref Int) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun List%trigger ($Snap $Ref) Bool)
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
(assert (forall ((s Set<Seq<Int>>)) (!
  (<= 0 (Set_card s))
  :pattern ((Set_card s))
  :qid |$Set[Seq[Int]]_prog.card_non_negative|)))
(assert (forall ((e Seq<Int>)) (!
  (not (Set_in e (as Set_empty  Set<Seq<Int>>)))
  :pattern ((Set_in e (as Set_empty  Set<Seq<Int>>)))
  :qid |$Set[Seq[Int]]_prog.in_empty_set|)))
(assert (forall ((s Set<Seq<Int>>)) (!
  (and
    (= (= (Set_card s) 0) (= s (as Set_empty  Set<Seq<Int>>)))
    (=>
      (not (= (Set_card s) 0))
      (exists ((e Seq<Int>)) (!
        (Set_in e s)
        :pattern ((Set_in e s))
        ))))
  :pattern ((Set_card s))
  :qid |$Set[Seq[Int]]_prog.empty_set_cardinality|)))
(assert (forall ((e Seq<Int>)) (!
  (Set_in e (Set_singleton e))
  :pattern ((Set_singleton e))
  :qid |$Set[Seq[Int]]_prog.in_singleton_set|)))
(assert (forall ((e1 Seq<Int>) (e2 Seq<Int>)) (!
  (= (Set_in e1 (Set_singleton e2)) (= e1 e2))
  :pattern ((Set_in e1 (Set_singleton e2)))
  :qid |$Set[Seq[Int]]_prog.in_singleton_set_equality|)))
(assert (forall ((e Seq<Int>)) (!
  (= (Set_card (Set_singleton e)) 1)
  :pattern ((Set_card (Set_singleton e)))
  :qid |$Set[Seq[Int]]_prog.singleton_set_cardinality|)))
(assert (forall ((s Set<Seq<Int>>) (e Seq<Int>)) (!
  (Set_in e (Set_unionone s e))
  :pattern ((Set_unionone s e))
  :qid |$Set[Seq[Int]]_prog.in_unionone_same|)))
(assert (forall ((s Set<Seq<Int>>) (e1 Seq<Int>) (e2 Seq<Int>)) (!
  (= (Set_in e1 (Set_unionone s e2)) (or (= e1 e2) (Set_in e1 s)))
  :pattern ((Set_in e1 (Set_unionone s e2)))
  :qid |$Set[Seq[Int]]_prog.in_unionone_other|)))
(assert (forall ((s Set<Seq<Int>>) (e1 Seq<Int>) (e2 Seq<Int>)) (!
  (=> (Set_in e1 s) (Set_in e1 (Set_unionone s e2)))
  :pattern ((Set_in e1 s) (Set_unionone s e2))
  :qid |$Set[Seq[Int]]_prog.invariance_in_unionone|)))
(assert (forall ((s Set<Seq<Int>>) (e Seq<Int>)) (!
  (=> (Set_in e s) (= (Set_card (Set_unionone s e)) (Set_card s)))
  :pattern ((Set_card (Set_unionone s e)))
  :qid |$Set[Seq[Int]]_prog.unionone_cardinality_invariant|)))
(assert (forall ((s Set<Seq<Int>>) (e Seq<Int>)) (!
  (=> (not (Set_in e s)) (= (Set_card (Set_unionone s e)) (+ (Set_card s) 1)))
  :pattern ((Set_card (Set_unionone s e)))
  :qid |$Set[Seq[Int]]_prog.unionone_cardinality_changed|)))
(assert (forall ((s1 Set<Seq<Int>>) (s2 Set<Seq<Int>>) (e Seq<Int>)) (!
  (= (Set_in e (Set_union s1 s2)) (or (Set_in e s1) (Set_in e s2)))
  :pattern ((Set_in e (Set_union s1 s2)))
  :qid |$Set[Seq[Int]]_prog.in_union_in_one|)))
(assert (forall ((s1 Set<Seq<Int>>) (s2 Set<Seq<Int>>) (e Seq<Int>)) (!
  (=> (Set_in e s1) (Set_in e (Set_union s1 s2)))
  :pattern ((Set_in e s1) (Set_union s1 s2))
  :qid |$Set[Seq[Int]]_prog.in_left_in_union|)))
(assert (forall ((s1 Set<Seq<Int>>) (s2 Set<Seq<Int>>) (e Seq<Int>)) (!
  (=> (Set_in e s2) (Set_in e (Set_union s1 s2)))
  :pattern ((Set_in e s2) (Set_union s1 s2))
  :qid |$Set[Seq[Int]]_prog.in_right_in_union|)))
(assert (forall ((s1 Set<Seq<Int>>) (s2 Set<Seq<Int>>) (e Seq<Int>)) (!
  (= (Set_in e (Set_intersection s1 s2)) (and (Set_in e s1) (Set_in e s2)))
  :pattern ((Set_in e (Set_intersection s1 s2)))
  :pattern ((Set_intersection s1 s2) (Set_in e s1))
  :pattern ((Set_intersection s1 s2) (Set_in e s2))
  :qid |$Set[Seq[Int]]_prog.in_intersection_in_both|)))
(assert (forall ((s1 Set<Seq<Int>>) (s2 Set<Seq<Int>>)) (!
  (= (Set_union s1 (Set_union s1 s2)) (Set_union s1 s2))
  :pattern ((Set_union s1 (Set_union s1 s2)))
  :qid |$Set[Seq[Int]]_prog.union_left_idempotency|)))
(assert (forall ((s1 Set<Seq<Int>>) (s2 Set<Seq<Int>>)) (!
  (= (Set_union (Set_union s1 s2) s2) (Set_union s1 s2))
  :pattern ((Set_union (Set_union s1 s2) s2))
  :qid |$Set[Seq[Int]]_prog.union_right_idempotency|)))
(assert (forall ((s1 Set<Seq<Int>>) (s2 Set<Seq<Int>>)) (!
  (= (Set_intersection s1 (Set_intersection s1 s2)) (Set_intersection s1 s2))
  :pattern ((Set_intersection s1 (Set_intersection s1 s2)))
  :qid |$Set[Seq[Int]]_prog.intersection_left_idempotency|)))
(assert (forall ((s1 Set<Seq<Int>>) (s2 Set<Seq<Int>>)) (!
  (= (Set_intersection (Set_intersection s1 s2) s2) (Set_intersection s1 s2))
  :pattern ((Set_intersection (Set_intersection s1 s2) s2))
  :qid |$Set[Seq[Int]]_prog.intersection_right_idempotency|)))
(assert (forall ((s1 Set<Seq<Int>>) (s2 Set<Seq<Int>>)) (!
  (=
    (+ (Set_card (Set_union s1 s2)) (Set_card (Set_intersection s1 s2)))
    (+ (Set_card s1) (Set_card s2)))
  :pattern ((Set_card (Set_union s1 s2)))
  :pattern ((Set_card (Set_intersection s1 s2)))
  :qid |$Set[Seq[Int]]_prog.cardinality_sums|)))
(assert (forall ((s1 Set<Seq<Int>>) (s2 Set<Seq<Int>>) (e Seq<Int>)) (!
  (= (Set_in e (Set_difference s1 s2)) (and (Set_in e s1) (not (Set_in e s2))))
  :pattern ((Set_in e (Set_difference s1 s2)))
  :qid |$Set[Seq[Int]]_prog.in_difference|)))
(assert (forall ((s1 Set<Seq<Int>>) (s2 Set<Seq<Int>>) (e Seq<Int>)) (!
  (=> (Set_in e s2) (not (Set_in e (Set_difference s1 s2))))
  :pattern ((Set_difference s1 s2) (Set_in e s2))
  :qid |$Set[Seq[Int]]_prog.not_in_difference|)))
(assert (forall ((s1 Set<Seq<Int>>) (s2 Set<Seq<Int>>)) (!
  (=
    (Set_subset s1 s2)
    (forall ((e Seq<Int>)) (!
      (=> (Set_in e s1) (Set_in e s2))
      :pattern ((Set_in e s1))
      :pattern ((Set_in e s2))
      )))
  :pattern ((Set_subset s1 s2))
  :qid |$Set[Seq[Int]]_prog.subset_definition|)))
(assert (forall ((s1 Set<Seq<Int>>) (s2 Set<Seq<Int>>)) (!
  (=
    (Set_equal s1 s2)
    (forall ((e Seq<Int>)) (!
      (= (Set_in e s1) (Set_in e s2))
      :pattern ((Set_in e s1))
      :pattern ((Set_in e s2))
      )))
  :pattern ((Set_equal s1 s2))
  :qid |$Set[Seq[Int]]_prog.equality_definition|)))
(assert (forall ((s1 Set<Seq<Int>>) (s2 Set<Seq<Int>>)) (!
  (=> (Set_equal s1 s2) (= s1 s2))
  :pattern ((Set_equal s1 s2))
  :qid |$Set[Seq[Int]]_prog.native_equality|)))
(assert (forall ((s1 Set<Seq<Int>>) (s2 Set<Seq<Int>>)) (!
  (=
    (Set_disjoint s1 s2)
    (forall ((e Seq<Int>)) (!
      (or (not (Set_in e s1)) (not (Set_in e s2)))
      :pattern ((Set_in e s1))
      :pattern ((Set_in e s2))
      )))
  :pattern ((Set_disjoint s1 s2))
  :qid |$Set[Seq[Int]]_prog.disjointness_definition|)))
(assert (forall ((s1 Set<Seq<Int>>) (s2 Set<Seq<Int>>)) (!
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
  :qid |$Set[Seq[Int]]_prog.cardinality_difference|)))
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
; /field_value_functions_axioms.smt2 [nodes: Seq[Ref]]
(assert (forall ((vs $FVF<nodes>) (ws $FVF<nodes>)) (!
    (=>
      (and
        (Set_equal ($FVF.domain_nodes vs) ($FVF.domain_nodes ws))
        (forall ((x $Ref)) (!
          (=>
            (Set_in x ($FVF.domain_nodes vs))
            (= ($FVF.lookup_nodes vs x) ($FVF.lookup_nodes ws x)))
          :pattern (($FVF.lookup_nodes vs x) ($FVF.lookup_nodes ws x))
          :qid |qp.$FVF<nodes>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<nodes>To$Snap vs)
              ($SortWrappers.$FVF<nodes>To$Snap ws)
              )
    :qid |qp.$FVF<nodes>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_nodes pm r))
    :pattern (($FVF.perm_nodes pm r)))))
(assert (forall ((r $Ref) (f Seq<$Ref>)) (!
    (= ($FVF.loc_nodes f r) true)
    :pattern (($FVF.loc_nodes f r)))))
; /field_value_functions_axioms.smt2 [val: Int]
(assert (forall ((vs $FVF<val>) (ws $FVF<val>)) (!
    (=>
      (and
        (Set_equal ($FVF.domain_val vs) ($FVF.domain_val ws))
        (forall ((x $Ref)) (!
          (=>
            (Set_in x ($FVF.domain_val vs))
            (= ($FVF.lookup_val vs x) ($FVF.lookup_val ws x)))
          :pattern (($FVF.lookup_val vs x) ($FVF.lookup_val ws x))
          :qid |qp.$FVF<val>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<val>To$Snap vs)
              ($SortWrappers.$FVF<val>To$Snap ws)
              )
    :qid |qp.$FVF<val>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_val pm r))
    :pattern (($FVF.perm_val pm r)))))
(assert (forall ((r $Ref) (f Int)) (!
    (= ($FVF.loc_val f r) true)
    :pattern (($FVF.loc_val f r)))))
; /field_value_functions_axioms.smt2 [next: Ref]
(assert (forall ((vs $FVF<next>) (ws $FVF<next>)) (!
    (=>
      (and
        (Set_equal ($FVF.domain_next vs) ($FVF.domain_next ws))
        (forall ((x $Ref)) (!
          (=>
            (Set_in x ($FVF.domain_next vs))
            (= ($FVF.lookup_next vs x) ($FVF.lookup_next ws x)))
          :pattern (($FVF.lookup_next vs x) ($FVF.lookup_next ws x))
          :qid |qp.$FVF<next>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<next>To$Snap vs)
              ($SortWrappers.$FVF<next>To$Snap ws)
              )
    :qid |qp.$FVF<next>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_next pm r))
    :pattern (($FVF.perm_next pm r)))))
(assert (forall ((r $Ref) (f $Ref)) (!
    (= ($FVF.loc_next f r) true)
    :pattern (($FVF.loc_next f r)))))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
(declare-fun inv@8@00 ($Snap $Ref $Ref) Int)
(declare-fun inv@10@00 ($Snap $Ref $Ref) Int)
(declare-fun sm@11@00 ($Snap $Ref) $FVF<next>)
(declare-fun inv@16@00 ($Snap $Ref Int $Ref) Int)
(declare-fun inv@18@00 ($Snap $Ref Int $Ref) Int)
(declare-fun sm@19@00 ($Snap $Ref Int) $FVF<next>)
(declare-fun sm@21@00 ($Snap $Ref Int) $FVF<val>)
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (= (length%limited s@$ this@0@00) (length s@$ this@0@00))
  :pattern ((length s@$ this@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (length%stateless this@0@00)
  :pattern ((length%limited s@$ this@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  (and
    (forall ((i@7@00 Int)) (!
      (=>
        (and
          (<
            i@7@00
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
          (<= 0 i@7@00))
        (=
          (inv@8@00 s@$ this@0@00 (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
            i@7@00))
          i@7@00))
      :pattern ((Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
        i@7@00))
      :qid |quant-u-5|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (<
            (inv@8@00 s@$ this@0@00 r)
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
          (<= 0 (inv@8@00 s@$ this@0@00 r)))
        (=
          (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
            (inv@8@00 s@$ this@0@00 r))
          r))
      :pattern ((inv@8@00 s@$ this@0@00 r))
      :qid |val-fctOfInv|))
    (forall ((i@9@00 Int)) (!
      (=>
        (and
          (<
            i@9@00
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
          (<= 0 i@9@00))
        (=
          (inv@10@00 s@$ this@0@00 (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
            i@9@00))
          i@9@00))
      :pattern ((Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
        i@9@00))
      :qid |quant-u-7|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (<
            (inv@10@00 s@$ this@0@00 r)
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
          (<= 0 (inv@10@00 s@$ this@0@00 r)))
        (=
          (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))
            (inv@10@00 s@$ this@0@00 r))
          r))
      :pattern ((inv@10@00 s@$ this@0@00 r))
      :qid |next-fctOfInv|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (<
            (inv@10@00 s@$ this@0@00 r)
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))
          (<= 0 (inv@10@00 s@$ this@0@00 r)))
        (=
          ($FVF.lookup_next (sm@11@00 s@$ this@0@00) r)
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
      :pattern (($FVF.lookup_next (sm@11@00 s@$ this@0@00) r))
      :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
      :qid |qp.fvfValDef0|))
    (forall ((r $Ref)) (!
      ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r) r)
      :pattern (($FVF.lookup_next (sm@11@00 s@$ this@0@00) r))
      :qid |qp.fvfResTrgDef1|))
    (=>
      (length%precondition s@$ this@0@00)
      (=
        (length s@$ this@0@00)
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first s@$))))))
  :pattern ((length s@$ this@0@00))
  :qid |quant-u-9|)))
(assert (forall ((s@$ $Snap) (this@0@00 $Ref)) (!
  true
  :pattern ((length s@$ this@0@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (this@2@00 $Ref) (index@3@00 Int)) (!
  (= (itemAt%limited s@$ this@2@00 index@3@00) (itemAt s@$ this@2@00 index@3@00))
  :pattern ((itemAt s@$ this@2@00 index@3@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (this@2@00 $Ref) (index@3@00 Int)) (!
  (itemAt%stateless this@2@00 index@3@00)
  :pattern ((itemAt%limited s@$ this@2@00 index@3@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (this@2@00 $Ref) (index@3@00 Int)) (!
  (and
    (forall ((i@15@00 Int)) (!
      (=>
        (and
          (<
            i@15@00
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
          (<= 0 i@15@00))
        (=
          (inv@16@00 s@$ this@2@00 index@3@00 (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
            i@15@00))
          i@15@00))
      :pattern ((Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
        i@15@00))
      :qid |quant-u-12|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (<
            (inv@16@00 s@$ this@2@00 index@3@00 r)
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
          (<= 0 (inv@16@00 s@$ this@2@00 index@3@00 r)))
        (=
          (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
            (inv@16@00 s@$ this@2@00 index@3@00 r))
          r))
      :pattern ((inv@16@00 s@$ this@2@00 index@3@00 r))
      :qid |val-fctOfInv|))
    (forall ((i@17@00 Int)) (!
      (=>
        (and
          (<
            i@17@00
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
          (<= 0 i@17@00))
        (=
          (inv@18@00 s@$ this@2@00 index@3@00 (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
            i@17@00))
          i@17@00))
      :pattern ((Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
        i@17@00))
      :qid |quant-u-14|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (<
            (inv@18@00 s@$ this@2@00 index@3@00 r)
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
          (<= 0 (inv@18@00 s@$ this@2@00 index@3@00 r)))
        (=
          (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
            (inv@18@00 s@$ this@2@00 index@3@00 r))
          r))
      :pattern ((inv@18@00 s@$ this@2@00 index@3@00 r))
      :qid |next-fctOfInv|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (<
            (inv@18@00 s@$ this@2@00 index@3@00 r)
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
          (<= 0 (inv@18@00 s@$ this@2@00 index@3@00 r)))
        (=
          ($FVF.lookup_next (sm@19@00 s@$ this@2@00 index@3@00) r)
          ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))) r)))
      :pattern (($FVF.lookup_next (sm@19@00 s@$ this@2@00 index@3@00) r))
      :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))) r))
      :qid |qp.fvfValDef2|))
    (forall ((r $Ref)) (!
      ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first s@$)))))) r) r)
      :pattern (($FVF.lookup_next (sm@19@00 s@$ this@2@00 index@3@00) r))
      :qid |qp.fvfResTrgDef3|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (<
            (inv@16@00 s@$ this@2@00 index@3@00 r)
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))))
          (<= 0 (inv@16@00 s@$ this@2@00 index@3@00 r)))
        (=
          ($FVF.lookup_val (sm@21@00 s@$ this@2@00 index@3@00) r)
          ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))) r)))
      :pattern (($FVF.lookup_val (sm@21@00 s@$ this@2@00 index@3@00) r))
      :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.first s@$))))) r))
      :qid |qp.fvfValDef4|))
    (=>
      (itemAt%precondition s@$ this@2@00 index@3@00)
      (=
        (itemAt s@$ this@2@00 index@3@00)
        ($FVF.lookup_val (sm@21@00 s@$ this@2@00 index@3@00) (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first s@$)))
          index@3@00)))))
  :pattern ((itemAt s@$ this@2@00 index@3@00))
  :qid |quant-u-16|)))
(assert (forall ((s@$ $Snap) (this@2@00 $Ref) (index@3@00 Int)) (!
  true
  :pattern ((itemAt s@$ this@2@00 index@3@00))
  :qid |quant-u-17|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- append ----------
(declare-const this@0@01 $Ref)
(declare-const elem@1@01 Int)
(declare-const this@2@01 $Ref)
(declare-const elem@3@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@4@01 $Snap)
(assert (= $t@4@01 ($Snap.combine ($Snap.first $t@4@01) ($Snap.second $t@4@01))))
(assert (= ($Snap.second $t@4@01) $Snap.unit))
; [eval] 0 < length(this) ==> itemAt(this, length(this) - 1) <= elem
; [eval] 0 < length(this)
; [eval] length(this)
(push) ; 2
(assert (length%precondition ($Snap.first $t@4@01) this@2@01))
(pop) ; 2
; Joined path conditions
(assert (length%precondition ($Snap.first $t@4@01) this@2@01))
(push) ; 2
(push) ; 3
(set-option :timeout 10)
(assert (not (not (< 0 (length ($Snap.first $t@4@01) this@2@01)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< 0 (length ($Snap.first $t@4@01) this@2@01))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [then-branch: 0 | 0 < length(First:($t@4@01), this@2@01) | live]
; [else-branch: 0 | !(0 < length(First:($t@4@01), this@2@01)) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | 0 < length(First:($t@4@01), this@2@01)]
(assert (< 0 (length ($Snap.first $t@4@01) this@2@01)))
; [eval] itemAt(this, length(this) - 1) <= elem
; [eval] itemAt(this, length(this) - 1)
; [eval] length(this) - 1
; [eval] length(this)
(push) ; 4
(pop) ; 4
; Joined path conditions
(push) ; 4
; [eval] 0 <= index
(push) ; 5
(assert (not (<= 0 (- (length ($Snap.first $t@4@01) this@2@01) 1))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (<= 0 (- (length ($Snap.first $t@4@01) this@2@01) 1)))
; [eval] index < length(this)
; [eval] length(this)
(push) ; 5
(pop) ; 5
; Joined path conditions
(push) ; 5
(assert (not (<
  (- (length ($Snap.first $t@4@01) this@2@01) 1)
  (length ($Snap.first $t@4@01) this@2@01))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (<
  (- (length ($Snap.first $t@4@01) this@2@01) 1)
  (length ($Snap.first $t@4@01) this@2@01)))
(assert (itemAt%precondition ($Snap.combine
  ($Snap.first $t@4@01)
  ($Snap.combine $Snap.unit $Snap.unit)) this@2@01 (-
  (length ($Snap.first $t@4@01) this@2@01)
  1)))
(pop) ; 4
; Joined path conditions
(assert (and
  (<= 0 (- (length ($Snap.first $t@4@01) this@2@01) 1))
  (<
    (- (length ($Snap.first $t@4@01) this@2@01) 1)
    (length ($Snap.first $t@4@01) this@2@01))
  (itemAt%precondition ($Snap.combine
    ($Snap.first $t@4@01)
    ($Snap.combine $Snap.unit $Snap.unit)) this@2@01 (-
    (length ($Snap.first $t@4@01) this@2@01)
    1))))
(pop) ; 3
(push) ; 3
; [else-branch: 0 | !(0 < length(First:($t@4@01), this@2@01))]
(assert (not (< 0 (length ($Snap.first $t@4@01) this@2@01))))
(pop) ; 3
(pop) ; 2
; Joined path conditions
(assert (=>
  (< 0 (length ($Snap.first $t@4@01) this@2@01))
  (and
    (< 0 (length ($Snap.first $t@4@01) this@2@01))
    (<= 0 (- (length ($Snap.first $t@4@01) this@2@01) 1))
    (<
      (- (length ($Snap.first $t@4@01) this@2@01) 1)
      (length ($Snap.first $t@4@01) this@2@01))
    (itemAt%precondition ($Snap.combine
      ($Snap.first $t@4@01)
      ($Snap.combine $Snap.unit $Snap.unit)) this@2@01 (-
      (length ($Snap.first $t@4@01) this@2@01)
      1)))))
; Joined path conditions
(assert (or
  (not (< 0 (length ($Snap.first $t@4@01) this@2@01)))
  (< 0 (length ($Snap.first $t@4@01) this@2@01))))
(assert (=>
  (< 0 (length ($Snap.first $t@4@01) this@2@01))
  (<=
    (itemAt ($Snap.combine
      ($Snap.first $t@4@01)
      ($Snap.combine $Snap.unit $Snap.unit)) this@2@01 (-
      (length ($Snap.first $t@4@01) this@2@01)
      1))
    elem@3@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@5@01 $Snap)
(assert (= $t@5@01 ($Snap.combine ($Snap.first $t@5@01) ($Snap.second $t@5@01))))
(assert (=
  ($Snap.second $t@5@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@5@01))
    ($Snap.second ($Snap.second $t@5@01)))))
(assert (= ($Snap.first ($Snap.second $t@5@01)) $Snap.unit))
; [eval] length(this) == old(length(this)) + 1
; [eval] length(this)
(push) ; 3
(assert (length%precondition ($Snap.first $t@5@01) this@2@01))
(pop) ; 3
; Joined path conditions
(assert (length%precondition ($Snap.first $t@5@01) this@2@01))
; [eval] old(length(this)) + 1
; [eval] old(length(this))
; [eval] length(this)
(push) ; 3
(pop) ; 3
; Joined path conditions
(assert (=
  (length ($Snap.first $t@5@01) this@2@01)
  (+ (length ($Snap.first $t@4@01) this@2@01) 1)))
(assert (=
  ($Snap.second ($Snap.second $t@5@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@5@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@5@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@5@01))) $Snap.unit))
; [eval] itemAt(this, length(this) - 1) == elem
; [eval] itemAt(this, length(this) - 1)
; [eval] length(this) - 1
; [eval] length(this)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
; [eval] 0 <= index
(push) ; 4
(assert (not (<= 0 (- (length ($Snap.first $t@5@01) this@2@01) 1))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (<= 0 (- (length ($Snap.first $t@5@01) this@2@01) 1)))
; [eval] index < length(this)
; [eval] length(this)
(push) ; 4
(pop) ; 4
; Joined path conditions
(push) ; 4
(assert (not (<
  (- (length ($Snap.first $t@5@01) this@2@01) 1)
  (length ($Snap.first $t@5@01) this@2@01))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (<
  (- (length ($Snap.first $t@5@01) this@2@01) 1)
  (length ($Snap.first $t@5@01) this@2@01)))
(assert (itemAt%precondition ($Snap.combine
  ($Snap.first $t@5@01)
  ($Snap.combine $Snap.unit $Snap.unit)) this@2@01 (-
  (length ($Snap.first $t@5@01) this@2@01)
  1)))
(pop) ; 3
; Joined path conditions
(assert (and
  (<= 0 (- (length ($Snap.first $t@5@01) this@2@01) 1))
  (<
    (- (length ($Snap.first $t@5@01) this@2@01) 1)
    (length ($Snap.first $t@5@01) this@2@01))
  (itemAt%precondition ($Snap.combine
    ($Snap.first $t@5@01)
    ($Snap.combine $Snap.unit $Snap.unit)) this@2@01 (-
    (length ($Snap.first $t@5@01) this@2@01)
    1))))
(assert (=
  (itemAt ($Snap.combine
    ($Snap.first $t@5@01)
    ($Snap.combine $Snap.unit $Snap.unit)) this@2@01 (-
    (length ($Snap.first $t@5@01) this@2@01)
    1))
  elem@3@01))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@5@01))) $Snap.unit))
; [eval] (forall i: Int :: { old(itemAt(this, i)) } 0 <= i && i < length(this) - 1 ==> itemAt(this, i) == old(itemAt(this, i)))
(declare-const i@6@01 Int)
(push) ; 3
; [eval] 0 <= i && i < length(this) - 1 ==> itemAt(this, i) == old(itemAt(this, i))
; [eval] 0 <= i && i < length(this) - 1
; [eval] 0 <= i
(push) ; 4
; [then-branch: 1 | 0 <= i@6@01 | live]
; [else-branch: 1 | !(0 <= i@6@01) | live]
(push) ; 5
; [then-branch: 1 | 0 <= i@6@01]
(assert (<= 0 i@6@01))
; [eval] i < length(this) - 1
; [eval] length(this) - 1
; [eval] length(this)
(push) ; 6
(pop) ; 6
; Joined path conditions
(pop) ; 5
(push) ; 5
; [else-branch: 1 | !(0 <= i@6@01)]
(assert (not (<= 0 i@6@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 i@6@01)) (<= 0 i@6@01)))
(push) ; 4
; [then-branch: 2 | i@6@01 < length(First:($t@5@01), this@2@01) - 1 && 0 <= i@6@01 | live]
; [else-branch: 2 | !(i@6@01 < length(First:($t@5@01), this@2@01) - 1 && 0 <= i@6@01) | live]
(push) ; 5
; [then-branch: 2 | i@6@01 < length(First:($t@5@01), this@2@01) - 1 && 0 <= i@6@01]
(assert (and (< i@6@01 (- (length ($Snap.first $t@5@01) this@2@01) 1)) (<= 0 i@6@01)))
; [eval] itemAt(this, i) == old(itemAt(this, i))
; [eval] itemAt(this, i)
(push) ; 6
; [eval] 0 <= index
; [eval] index < length(this)
; [eval] length(this)
(push) ; 7
(pop) ; 7
; Joined path conditions
(push) ; 7
(assert (not (< i@6@01 (length ($Snap.first $t@5@01) this@2@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (< i@6@01 (length ($Snap.first $t@5@01) this@2@01)))
(assert (itemAt%precondition ($Snap.combine
  ($Snap.first $t@5@01)
  ($Snap.combine $Snap.unit $Snap.unit)) this@2@01 i@6@01))
(pop) ; 6
; Joined path conditions
(assert (and
  (< i@6@01 (length ($Snap.first $t@5@01) this@2@01))
  (itemAt%precondition ($Snap.combine
    ($Snap.first $t@5@01)
    ($Snap.combine $Snap.unit $Snap.unit)) this@2@01 i@6@01)))
; [eval] old(itemAt(this, i))
; [eval] itemAt(this, i)
(push) ; 6
; [eval] 0 <= index
; [eval] index < length(this)
; [eval] length(this)
(push) ; 7
(pop) ; 7
; Joined path conditions
(push) ; 7
(assert (not (< i@6@01 (length ($Snap.first $t@4@01) this@2@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (< i@6@01 (length ($Snap.first $t@4@01) this@2@01)))
(assert (itemAt%precondition ($Snap.combine
  ($Snap.first $t@4@01)
  ($Snap.combine $Snap.unit $Snap.unit)) this@2@01 i@6@01))
(pop) ; 6
; Joined path conditions
(assert (and
  (< i@6@01 (length ($Snap.first $t@4@01) this@2@01))
  (itemAt%precondition ($Snap.combine
    ($Snap.first $t@4@01)
    ($Snap.combine $Snap.unit $Snap.unit)) this@2@01 i@6@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 2 | !(i@6@01 < length(First:($t@5@01), this@2@01) - 1 && 0 <= i@6@01)]
(assert (not
  (and (< i@6@01 (- (length ($Snap.first $t@5@01) this@2@01) 1)) (<= 0 i@6@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and (< i@6@01 (- (length ($Snap.first $t@5@01) this@2@01) 1)) (<= 0 i@6@01))
  (and
    (< i@6@01 (- (length ($Snap.first $t@5@01) this@2@01) 1))
    (<= 0 i@6@01)
    (< i@6@01 (length ($Snap.first $t@5@01) this@2@01))
    (itemAt%precondition ($Snap.combine
      ($Snap.first $t@5@01)
      ($Snap.combine $Snap.unit $Snap.unit)) this@2@01 i@6@01)
    (< i@6@01 (length ($Snap.first $t@4@01) this@2@01))
    (itemAt%precondition ($Snap.combine
      ($Snap.first $t@4@01)
      ($Snap.combine $Snap.unit $Snap.unit)) this@2@01 i@6@01))))
; Joined path conditions
(assert (or
  (not
    (and (< i@6@01 (- (length ($Snap.first $t@5@01) this@2@01) 1)) (<= 0 i@6@01)))
  (and (< i@6@01 (- (length ($Snap.first $t@5@01) this@2@01) 1)) (<= 0 i@6@01))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@6@01 Int)) (!
  (and
    (or (not (<= 0 i@6@01)) (<= 0 i@6@01))
    (=>
      (and
        (< i@6@01 (- (length ($Snap.first $t@5@01) this@2@01) 1))
        (<= 0 i@6@01))
      (and
        (< i@6@01 (- (length ($Snap.first $t@5@01) this@2@01) 1))
        (<= 0 i@6@01)
        (< i@6@01 (length ($Snap.first $t@5@01) this@2@01))
        (itemAt%precondition ($Snap.combine
          ($Snap.first $t@5@01)
          ($Snap.combine $Snap.unit $Snap.unit)) this@2@01 i@6@01)
        (< i@6@01 (length ($Snap.first $t@4@01) this@2@01))
        (itemAt%precondition ($Snap.combine
          ($Snap.first $t@4@01)
          ($Snap.combine $Snap.unit $Snap.unit)) this@2@01 i@6@01)))
    (or
      (not
        (and
          (< i@6@01 (- (length ($Snap.first $t@5@01) this@2@01) 1))
          (<= 0 i@6@01)))
      (and
        (< i@6@01 (- (length ($Snap.first $t@5@01) this@2@01) 1))
        (<= 0 i@6@01))))
  :pattern ((itemAt%limited ($Snap.combine
    ($Snap.first $t@4@01)
    ($Snap.combine $Snap.unit $Snap.unit)) this@2@01 i@6@01))
  :qid |prog.l43-aux|)))
(assert (forall ((i@6@01 Int)) (!
  (=>
    (and (< i@6@01 (- (length ($Snap.first $t@5@01) this@2@01) 1)) (<= 0 i@6@01))
    (=
      (itemAt ($Snap.combine
        ($Snap.first $t@5@01)
        ($Snap.combine $Snap.unit $Snap.unit)) this@2@01 i@6@01)
      (itemAt ($Snap.combine
        ($Snap.first $t@4@01)
        ($Snap.combine $Snap.unit $Snap.unit)) this@2@01 i@6@01)))
  :pattern ((itemAt%limited ($Snap.combine
    ($Snap.first $t@4@01)
    ($Snap.combine $Snap.unit $Snap.unit)) this@2@01 i@6@01))
  :qid |prog.l43|)))
(pop) ; 2
(push) ; 2
; [exec]
; var n: Ref
(declare-const n@7@01 $Ref)
; [exec]
; unfold acc(List(this), write)
(assert (=
  ($Snap.first $t@4@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@4@01))
    ($Snap.second ($Snap.first $t@4@01)))))
(assert (not (= this@2@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.first $t@4@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@4@01)))
    ($Snap.second ($Snap.second ($Snap.first $t@4@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.first $t@4@01))) $Snap.unit))
; [eval] (forall i: Int, j: Int :: { (i in [0..|this.nodes|)), (j in [0..|this.nodes|)) } { (i in [0..|this.nodes|)), this.nodes[j] } { (j in [0..|this.nodes|)), this.nodes[i] } { this.nodes[i], this.nodes[j] } (i in [0..|this.nodes|)) && ((j in [0..|this.nodes|)) && i != j) ==> this.nodes[i] != this.nodes[j])
(declare-const i@8@01 Int)
(declare-const j@9@01 Int)
(push) ; 3
; [eval] (i in [0..|this.nodes|)) && ((j in [0..|this.nodes|)) && i != j) ==> this.nodes[i] != this.nodes[j]
; [eval] (i in [0..|this.nodes|)) && ((j in [0..|this.nodes|)) && i != j)
; [eval] (i in [0..|this.nodes|))
; [eval] [0..|this.nodes|)
; [eval] |this.nodes|
(push) ; 4
; [then-branch: 3 | i@8@01 in [0..|First:(First:($t@4@01))|] | live]
; [else-branch: 3 | !(i@8@01 in [0..|First:(First:($t@4@01))|]) | live]
(push) ; 5
; [then-branch: 3 | i@8@01 in [0..|First:(First:($t@4@01))|]]
(assert (Seq_contains
  (Seq_range
    0
    (Seq_length
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
  i@8@01))
; [eval] (j in [0..|this.nodes|))
; [eval] [0..|this.nodes|)
; [eval] |this.nodes|
(push) ; 6
; [then-branch: 4 | j@9@01 in [0..|First:(First:($t@4@01))|] | live]
; [else-branch: 4 | !(j@9@01 in [0..|First:(First:($t@4@01))|]) | live]
(push) ; 7
; [then-branch: 4 | j@9@01 in [0..|First:(First:($t@4@01))|]]
(assert (Seq_contains
  (Seq_range
    0
    (Seq_length
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
  j@9@01))
; [eval] i != j
(pop) ; 7
(push) ; 7
; [else-branch: 4 | !(j@9@01 in [0..|First:(First:($t@4@01))|])]
(assert (not
  (Seq_contains
    (Seq_range
      0
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
    j@9@01)))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (Seq_contains
      (Seq_range
        0
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
      j@9@01))
  (Seq_contains
    (Seq_range
      0
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
    j@9@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 3 | !(i@8@01 in [0..|First:(First:($t@4@01))|])]
(assert (not
  (Seq_contains
    (Seq_range
      0
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
    i@8@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (Seq_contains
    (Seq_range
      0
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
    i@8@01)
  (and
    (Seq_contains
      (Seq_range
        0
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
      i@8@01)
    (or
      (not
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
          j@9@01))
      (Seq_contains
        (Seq_range
          0
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
        j@9@01)))))
; Joined path conditions
(assert (or
  (not
    (Seq_contains
      (Seq_range
        0
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
      i@8@01))
  (Seq_contains
    (Seq_range
      0
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
    i@8@01)))
(push) ; 4
; [then-branch: 5 | i@8@01 != j@9@01 && j@9@01 in [0..|First:(First:($t@4@01))|] && i@8@01 in [0..|First:(First:($t@4@01))|] | live]
; [else-branch: 5 | !(i@8@01 != j@9@01 && j@9@01 in [0..|First:(First:($t@4@01))|] && i@8@01 in [0..|First:(First:($t@4@01))|]) | live]
(push) ; 5
; [then-branch: 5 | i@8@01 != j@9@01 && j@9@01 in [0..|First:(First:($t@4@01))|] && i@8@01 in [0..|First:(First:($t@4@01))|]]
(assert (and
  (and
    (not (= i@8@01 j@9@01))
    (Seq_contains
      (Seq_range
        0
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
      j@9@01))
  (Seq_contains
    (Seq_range
      0
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
    i@8@01)))
; [eval] this.nodes[i] != this.nodes[j]
; [eval] this.nodes[i]
(push) ; 6
(assert (not (>= i@8@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (<
  i@8@01
  (Seq_length
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [eval] this.nodes[j]
(push) ; 6
(assert (not (>= j@9@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (<
  j@9@01
  (Seq_length
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 5 | !(i@8@01 != j@9@01 && j@9@01 in [0..|First:(First:($t@4@01))|] && i@8@01 in [0..|First:(First:($t@4@01))|])]
(assert (not
  (and
    (and
      (not (= i@8@01 j@9@01))
      (Seq_contains
        (Seq_range
          0
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
        j@9@01))
    (Seq_contains
      (Seq_range
        0
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
      i@8@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (and
      (not (= i@8@01 j@9@01))
      (Seq_contains
        (Seq_range
          0
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
        j@9@01))
    (Seq_contains
      (Seq_range
        0
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
      i@8@01))
  (and
    (not (= i@8@01 j@9@01))
    (Seq_contains
      (Seq_range
        0
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
      j@9@01)
    (Seq_contains
      (Seq_range
        0
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
      i@8@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (and
        (not (= i@8@01 j@9@01))
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
          j@9@01))
      (Seq_contains
        (Seq_range
          0
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
        i@8@01)))
  (and
    (and
      (not (= i@8@01 j@9@01))
      (Seq_contains
        (Seq_range
          0
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
        j@9@01))
    (Seq_contains
      (Seq_range
        0
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
      i@8@01))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@8@01 Int) (j@9@01 Int)) (!
  (and
    (=>
      (Seq_contains
        (Seq_range
          0
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
        i@8@01)
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
          i@8@01)
        (or
          (not
            (Seq_contains
              (Seq_range
                0
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
              j@9@01))
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
            j@9@01))))
    (or
      (not
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
          i@8@01))
      (Seq_contains
        (Seq_range
          0
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
        i@8@01))
    (=>
      (and
        (and
          (not (= i@8@01 j@9@01))
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
            j@9@01))
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
          i@8@01))
      (and
        (not (= i@8@01 j@9@01))
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
          j@9@01)
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
          i@8@01)))
    (or
      (not
        (and
          (and
            (not (= i@8@01 j@9@01))
            (Seq_contains
              (Seq_range
                0
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
              j@9@01))
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
            i@8@01)))
      (and
        (and
          (not (= i@8@01 j@9@01))
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
            j@9@01))
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
          i@8@01))))
  :pattern ((Seq_contains
    (Seq_range
      0
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
    i@8@01) (Seq_contains
    (Seq_range
      0
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
    j@9@01))
  :qid |prog.l16-aux|)))
(assert (forall ((i@8@01 Int) (j@9@01 Int)) (!
  (and
    (=>
      (Seq_contains
        (Seq_range
          0
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
        i@8@01)
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
          i@8@01)
        (or
          (not
            (Seq_contains
              (Seq_range
                0
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
              j@9@01))
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
            j@9@01))))
    (or
      (not
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
          i@8@01))
      (Seq_contains
        (Seq_range
          0
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
        i@8@01))
    (=>
      (and
        (and
          (not (= i@8@01 j@9@01))
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
            j@9@01))
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
          i@8@01))
      (and
        (not (= i@8@01 j@9@01))
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
          j@9@01)
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
          i@8@01)))
    (or
      (not
        (and
          (and
            (not (= i@8@01 j@9@01))
            (Seq_contains
              (Seq_range
                0
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
              j@9@01))
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
            i@8@01)))
      (and
        (and
          (not (= i@8@01 j@9@01))
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
            j@9@01))
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
          i@8@01))))
  :pattern ((Seq_contains
    (Seq_range
      0
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
    i@8@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
    j@9@01))
  :qid |prog.l16-aux|)))
(assert (forall ((i@8@01 Int) (j@9@01 Int)) (!
  (and
    (=>
      (Seq_contains
        (Seq_range
          0
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
        i@8@01)
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
          i@8@01)
        (or
          (not
            (Seq_contains
              (Seq_range
                0
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
              j@9@01))
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
            j@9@01))))
    (or
      (not
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
          i@8@01))
      (Seq_contains
        (Seq_range
          0
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
        i@8@01))
    (=>
      (and
        (and
          (not (= i@8@01 j@9@01))
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
            j@9@01))
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
          i@8@01))
      (and
        (not (= i@8@01 j@9@01))
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
          j@9@01)
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
          i@8@01)))
    (or
      (not
        (and
          (and
            (not (= i@8@01 j@9@01))
            (Seq_contains
              (Seq_range
                0
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
              j@9@01))
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
            i@8@01)))
      (and
        (and
          (not (= i@8@01 j@9@01))
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
            j@9@01))
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
          i@8@01))))
  :pattern ((Seq_contains
    (Seq_range
      0
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
    j@9@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
    i@8@01))
  :qid |prog.l16-aux|)))
(assert (forall ((i@8@01 Int) (j@9@01 Int)) (!
  (and
    (=>
      (Seq_contains
        (Seq_range
          0
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
        i@8@01)
      (and
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
          i@8@01)
        (or
          (not
            (Seq_contains
              (Seq_range
                0
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
              j@9@01))
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
            j@9@01))))
    (or
      (not
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
          i@8@01))
      (Seq_contains
        (Seq_range
          0
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
        i@8@01))
    (=>
      (and
        (and
          (not (= i@8@01 j@9@01))
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
            j@9@01))
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
          i@8@01))
      (and
        (not (= i@8@01 j@9@01))
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
          j@9@01)
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
          i@8@01)))
    (or
      (not
        (and
          (and
            (not (= i@8@01 j@9@01))
            (Seq_contains
              (Seq_range
                0
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
              j@9@01))
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
            i@8@01)))
      (and
        (and
          (not (= i@8@01 j@9@01))
          (Seq_contains
            (Seq_range
              0
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
            j@9@01))
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
          i@8@01))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
    i@8@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
    j@9@01))
  :qid |prog.l16-aux|)))
(assert (forall ((i@8@01 Int) (j@9@01 Int)) (!
  (=>
    (and
      (and
        (not (= i@8@01 j@9@01))
        (Seq_contains
          (Seq_range
            0
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
          j@9@01))
      (Seq_contains
        (Seq_range
          0
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
        i@8@01))
    (not
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
          i@8@01)
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
          j@9@01))))
  :pattern ((Seq_contains
    (Seq_range
      0
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
    i@8@01) (Seq_contains
    (Seq_range
      0
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
    j@9@01))
  :pattern ((Seq_contains
    (Seq_range
      0
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
    i@8@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
    j@9@01))
  :pattern ((Seq_contains
    (Seq_range
      0
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
    j@9@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
    i@8@01))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
    i@8@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
    j@9@01))
  :qid |prog.l16|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first $t@4@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@4@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))))
(declare-const i@10@01 Int)
(push) ; 3
; [eval] 0 <= i && i < |this.nodes|
; [eval] 0 <= i
(push) ; 4
; [then-branch: 6 | 0 <= i@10@01 | live]
; [else-branch: 6 | !(0 <= i@10@01) | live]
(push) ; 5
; [then-branch: 6 | 0 <= i@10@01]
(assert (<= 0 i@10@01))
; [eval] i < |this.nodes|
; [eval] |this.nodes|
(pop) ; 5
(push) ; 5
; [else-branch: 6 | !(0 <= i@10@01)]
(assert (not (<= 0 i@10@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 i@10@01)) (<= 0 i@10@01)))
(assert (and
  (<
    i@10@01
    (Seq_length
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
  (<= 0 i@10@01)))
; [eval] this.nodes[i]
(push) ; 4
(assert (not (>= i@10@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@11@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@10@01 Int)) (!
  (=>
    (and
      (<
        i@10@01
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
      (<= 0 i@10@01))
    (or (not (<= 0 i@10@01)) (<= 0 i@10@01)))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
    i@10@01))
  :qid |val-aux|)))
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((i@10@01 Int)) (!
  (=>
    (and
      (<
        i@10@01
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
      (<= 0 i@10@01))
    (=
      (inv@11@01 (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
        i@10@01))
      i@10@01))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
    i@10@01))
  :qid |quant-u-24|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<
        (inv@11@01 r)
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
      (<= 0 (inv@11@01 r)))
    (=
      (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
        (inv@11@01 r))
      r))
  :pattern ((inv@11@01 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@10@01 Int)) (!
  (=>
    (and
      (<
        i@10@01
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
      (<= 0 i@10@01))
    (not
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
          i@10@01)
        $Ref.null)))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
    i@10@01))
  :qid |val-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01))))))))
(declare-const i@12@01 Int)
(push) ; 3
; [eval] 0 <= i && i < |this.nodes|
; [eval] 0 <= i
(push) ; 4
; [then-branch: 7 | 0 <= i@12@01 | live]
; [else-branch: 7 | !(0 <= i@12@01) | live]
(push) ; 5
; [then-branch: 7 | 0 <= i@12@01]
(assert (<= 0 i@12@01))
; [eval] i < |this.nodes|
; [eval] |this.nodes|
(pop) ; 5
(push) ; 5
; [else-branch: 7 | !(0 <= i@12@01)]
(assert (not (<= 0 i@12@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 i@12@01)) (<= 0 i@12@01)))
(assert (and
  (<
    i@12@01
    (Seq_length
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
  (<= 0 i@12@01)))
; [eval] this.nodes[i]
(push) ; 4
(assert (not (>= i@12@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@13@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@12@01 Int)) (!
  (=>
    (and
      (<
        i@12@01
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
      (<= 0 i@12@01))
    (or (not (<= 0 i@12@01)) (<= 0 i@12@01)))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
    i@12@01))
  :qid |next-aux|)))
; Check receiver injectivity
; Definitional axioms for inverse functions
(assert (forall ((i@12@01 Int)) (!
  (=>
    (and
      (<
        i@12@01
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
      (<= 0 i@12@01))
    (=
      (inv@13@01 (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
        i@12@01))
      i@12@01))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
    i@12@01))
  :qid |quant-u-26|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<
        (inv@13@01 r)
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
      (<= 0 (inv@13@01 r)))
    (=
      (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
        (inv@13@01 r))
      r))
  :pattern ((inv@13@01 r))
  :qid |next-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@12@01 Int)) (!
  (=>
    (and
      (<
        i@12@01
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
      (<= 0 i@12@01))
    (not
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
          i@12@01)
        $Ref.null)))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
    i@12@01))
  :qid |next-permImpliesNonNull|)))
(declare-const sm@14@01 $FVF<next>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<
        (inv@13@01 r)
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
      (<= 0 (inv@13@01 r)))
    (=
      ($FVF.lookup_next (as sm@14@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@14@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r) r)
  :pattern (($FVF.lookup_next (as sm@14@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<
        (inv@13@01 r)
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
      (<= 0 (inv@13@01 r)))
    ($FVF.loc_next ($FVF.lookup_next (as sm@14@01  $FVF<next>) r) r))
  :pattern ((inv@13@01 r))
  :qid |quant-u-27|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))
  $Snap.unit))
; [eval] (forall i: Int :: { this.nodes[i].next } 0 <= i && i < |this.nodes| ==> (this.nodes[i] in this.nodes) && (i < |this.nodes| - 1 ? this.nodes[i].next == this.nodes[i + 1] : this.nodes[i].next == null))
(declare-const i@15@01 Int)
(push) ; 3
; [eval] 0 <= i && i < |this.nodes| ==> (this.nodes[i] in this.nodes) && (i < |this.nodes| - 1 ? this.nodes[i].next == this.nodes[i + 1] : this.nodes[i].next == null)
; [eval] 0 <= i && i < |this.nodes|
; [eval] 0 <= i
(push) ; 4
; [then-branch: 8 | 0 <= i@15@01 | live]
; [else-branch: 8 | !(0 <= i@15@01) | live]
(push) ; 5
; [then-branch: 8 | 0 <= i@15@01]
(assert (<= 0 i@15@01))
; [eval] i < |this.nodes|
; [eval] |this.nodes|
(pop) ; 5
(push) ; 5
; [else-branch: 8 | !(0 <= i@15@01)]
(assert (not (<= 0 i@15@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 i@15@01)) (<= 0 i@15@01)))
(push) ; 4
; [then-branch: 9 | i@15@01 < |First:(First:($t@4@01))| && 0 <= i@15@01 | live]
; [else-branch: 9 | !(i@15@01 < |First:(First:($t@4@01))| && 0 <= i@15@01) | live]
(push) ; 5
; [then-branch: 9 | i@15@01 < |First:(First:($t@4@01))| && 0 <= i@15@01]
(assert (and
  (<
    i@15@01
    (Seq_length
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
  (<= 0 i@15@01)))
; [eval] (this.nodes[i] in this.nodes) && (i < |this.nodes| - 1 ? this.nodes[i].next == this.nodes[i + 1] : this.nodes[i].next == null)
; [eval] (this.nodes[i] in this.nodes)
; [eval] this.nodes[i]
(push) ; 6
(assert (not (>= i@15@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(push) ; 6
; [then-branch: 10 | First:(First:($t@4@01))[i@15@01] in First:(First:($t@4@01)) | live]
; [else-branch: 10 | !(First:(First:($t@4@01))[i@15@01] in First:(First:($t@4@01))) | live]
(push) ; 7
; [then-branch: 10 | First:(First:($t@4@01))[i@15@01] in First:(First:($t@4@01))]
(assert (Seq_contains
  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
  (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
    i@15@01)))
; [eval] (i < |this.nodes| - 1 ? this.nodes[i].next == this.nodes[i + 1] : this.nodes[i].next == null)
; [eval] i < |this.nodes| - 1
; [eval] |this.nodes| - 1
; [eval] |this.nodes|
(push) ; 8
; [then-branch: 11 | i@15@01 < |First:(First:($t@4@01))| - 1 | live]
; [else-branch: 11 | !(i@15@01 < |First:(First:($t@4@01))| - 1) | live]
(push) ; 9
; [then-branch: 11 | i@15@01 < |First:(First:($t@4@01))| - 1]
(assert (<
  i@15@01
  (-
    (Seq_length
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01))))
    1)))
; [eval] this.nodes[i].next == this.nodes[i + 1]
; [eval] this.nodes[i]
(push) ; 10
(assert (not (>= i@15@01 0)))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert ($FVF.loc_next ($FVF.lookup_next (as sm@14@01  $FVF<next>) (Seq_index
  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
  i@15@01)) (Seq_index
  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
  i@15@01)))
(push) ; 10
(assert (not (and
  (<
    (inv@13@01 (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
      i@15@01))
    (Seq_length
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
  (<=
    0
    (inv@13@01 (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
      i@15@01))))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [eval] this.nodes[i + 1]
; [eval] i + 1
(push) ; 10
(assert (not (>= (+ i@15@01 1) 0)))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(push) ; 10
(assert (not (<
  (+ i@15@01 1)
  (Seq_length
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(pop) ; 9
(push) ; 9
; [else-branch: 11 | !(i@15@01 < |First:(First:($t@4@01))| - 1)]
(assert (not
  (<
    i@15@01
    (-
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01))))
      1))))
; [eval] this.nodes[i].next == null
; [eval] this.nodes[i]
(push) ; 10
(assert (not (>= i@15@01 0)))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(assert ($FVF.loc_next ($FVF.lookup_next (as sm@14@01  $FVF<next>) (Seq_index
  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
  i@15@01)) (Seq_index
  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
  i@15@01)))
(push) ; 10
(assert (not (and
  (<
    (inv@13@01 (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
      i@15@01))
    (Seq_length
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
  (<=
    0
    (inv@13@01 (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
      i@15@01))))))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (=>
  (<
    i@15@01
    (-
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01))))
      1))
  (and
    (<
      i@15@01
      (-
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01))))
        1))
    ($FVF.loc_next ($FVF.lookup_next (as sm@14@01  $FVF<next>) (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
      i@15@01)) (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
      i@15@01)))))
; Joined path conditions
(assert (=>
  (not
    (<
      i@15@01
      (-
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01))))
        1)))
  (and
    (not
      (<
        i@15@01
        (-
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01))))
          1)))
    ($FVF.loc_next ($FVF.lookup_next (as sm@14@01  $FVF<next>) (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
      i@15@01)) (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
      i@15@01)))))
(assert (or
  (not
    (<
      i@15@01
      (-
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01))))
        1)))
  (<
    i@15@01
    (-
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01))))
      1))))
(pop) ; 7
(push) ; 7
; [else-branch: 10 | !(First:(First:($t@4@01))[i@15@01] in First:(First:($t@4@01)))]
(assert (not
  (Seq_contains
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
    (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
      i@15@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (Seq_contains
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
    (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
      i@15@01))
  (and
    (Seq_contains
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
      (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
        i@15@01))
    (=>
      (<
        i@15@01
        (-
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01))))
          1))
      (and
        (<
          i@15@01
          (-
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01))))
            1))
        ($FVF.loc_next ($FVF.lookup_next (as sm@14@01  $FVF<next>) (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
          i@15@01)) (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
          i@15@01))))
    (=>
      (not
        (<
          i@15@01
          (-
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01))))
            1)))
      (and
        (not
          (<
            i@15@01
            (-
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01))))
              1)))
        ($FVF.loc_next ($FVF.lookup_next (as sm@14@01  $FVF<next>) (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
          i@15@01)) (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
          i@15@01))))
    (or
      (not
        (<
          i@15@01
          (-
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01))))
            1)))
      (<
        i@15@01
        (-
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01))))
          1))))))
; Joined path conditions
(assert (or
  (not
    (Seq_contains
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
      (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
        i@15@01)))
  (Seq_contains
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
    (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
      i@15@01))))
(pop) ; 5
(push) ; 5
; [else-branch: 9 | !(i@15@01 < |First:(First:($t@4@01))| && 0 <= i@15@01)]
(assert (not
  (and
    (<
      i@15@01
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
    (<= 0 i@15@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (<
      i@15@01
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
    (<= 0 i@15@01))
  (and
    (<
      i@15@01
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
    (<= 0 i@15@01)
    (=>
      (Seq_contains
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
          i@15@01))
      (and
        (Seq_contains
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
          (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
            i@15@01))
        (=>
          (<
            i@15@01
            (-
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01))))
              1))
          (and
            (<
              i@15@01
              (-
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01))))
                1))
            ($FVF.loc_next ($FVF.lookup_next (as sm@14@01  $FVF<next>) (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
              i@15@01)) (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
              i@15@01))))
        (=>
          (not
            (<
              i@15@01
              (-
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01))))
                1)))
          (and
            (not
              (<
                i@15@01
                (-
                  (Seq_length
                    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01))))
                  1)))
            ($FVF.loc_next ($FVF.lookup_next (as sm@14@01  $FVF<next>) (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
              i@15@01)) (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
              i@15@01))))
        (or
          (not
            (<
              i@15@01
              (-
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01))))
                1)))
          (<
            i@15@01
            (-
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01))))
              1)))))
    (or
      (not
        (Seq_contains
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
          (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
            i@15@01)))
      (Seq_contains
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
          i@15@01))))))
; Joined path conditions
(assert (or
  (not
    (and
      (<
        i@15@01
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
      (<= 0 i@15@01)))
  (and
    (<
      i@15@01
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
    (<= 0 i@15@01))))
; Definitional axioms for snapshot map values
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@15@01 Int)) (!
  (and
    (or (not (<= 0 i@15@01)) (<= 0 i@15@01))
    (=>
      (and
        (<
          i@15@01
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
        (<= 0 i@15@01))
      (and
        (<
          i@15@01
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
        (<= 0 i@15@01)
        (=>
          (Seq_contains
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
            (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
              i@15@01))
          (and
            (Seq_contains
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
              (Seq_index
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
                i@15@01))
            (=>
              (<
                i@15@01
                (-
                  (Seq_length
                    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01))))
                  1))
              (and
                (<
                  i@15@01
                  (-
                    (Seq_length
                      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01))))
                    1))
                ($FVF.loc_next ($FVF.lookup_next (as sm@14@01  $FVF<next>) (Seq_index
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
                  i@15@01)) (Seq_index
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
                  i@15@01))))
            (=>
              (not
                (<
                  i@15@01
                  (-
                    (Seq_length
                      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01))))
                    1)))
              (and
                (not
                  (<
                    i@15@01
                    (-
                      (Seq_length
                        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01))))
                      1)))
                ($FVF.loc_next ($FVF.lookup_next (as sm@14@01  $FVF<next>) (Seq_index
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
                  i@15@01)) (Seq_index
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
                  i@15@01))))
            (or
              (not
                (<
                  i@15@01
                  (-
                    (Seq_length
                      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01))))
                    1)))
              (<
                i@15@01
                (-
                  (Seq_length
                    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01))))
                  1)))))
        (or
          (not
            (Seq_contains
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
              (Seq_index
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
                i@15@01)))
          (Seq_contains
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
            (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
              i@15@01)))))
    (or
      (not
        (and
          (<
            i@15@01
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
          (<= 0 i@15@01)))
      (and
        (<
          i@15@01
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
        (<= 0 i@15@01))))
  :pattern (($FVF.loc_next ($FVF.lookup_next (as sm@14@01  $FVF<next>) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
    i@15@01)) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
    i@15@01)))
  :qid |prog.l19-aux|)))
(assert (forall ((i@15@01 Int)) (!
  (=>
    (and
      (<
        i@15@01
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
      (<= 0 i@15@01))
    (and
      (ite
        (<
          i@15@01
          (-
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01))))
            1))
        (=
          ($FVF.lookup_next (as sm@14@01  $FVF<next>) (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
            i@15@01))
          (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
            (+ i@15@01 1)))
        (=
          ($FVF.lookup_next (as sm@14@01  $FVF<next>) (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
            i@15@01))
          $Ref.null))
      (Seq_contains
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
          i@15@01))))
  :pattern (($FVF.loc_next ($FVF.lookup_next (as sm@14@01  $FVF<next>) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
    i@15@01)) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
    i@15@01)))
  :qid |prog.l19|)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (List%trigger ($Snap.first $t@4@01) this@2@01))
; [exec]
; n := new()
(declare-const n@16@01 $Ref)
(assert (not (= n@16@01 $Ref.null)))
(assert (not (= n@16@01 this@2@01)))
(assert (not (= n@16@01 n@7@01)))
(assert (not
  (Seq_contains
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
    n@16@01)))
; [exec]
; inhale acc(n.val, write) &&
;   (acc(n.next, write) &&
;   (forall i: Int ::
;     { this.nodes[i] }
;     0 <= i && i < |this.nodes| ==> this.nodes[i] != n))
(declare-const $t@17@01 $Snap)
(assert (= $t@17@01 ($Snap.combine ($Snap.first $t@17@01) ($Snap.second $t@17@01))))
(declare-const sm@18@01 $FVF<val>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_val (as sm@18@01  $FVF<val>) n@16@01)
  ($SortWrappers.$SnapToInt ($Snap.first $t@17@01))))
(assert (<= $Perm.No (ite (= n@16@01 n@16@01) $Perm.Write $Perm.No)))
(assert (<= (ite (= n@16@01 n@16@01) $Perm.Write $Perm.No) $Perm.Write))
(assert (=> (= n@16@01 n@16@01) (not (= n@16@01 $Ref.null))))
(assert (=
  ($Snap.second $t@17@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@17@01))
    ($Snap.second ($Snap.second $t@17@01)))))
(declare-const sm@19@01 $FVF<next>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_next (as sm@19@01  $FVF<next>) n@16@01)
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second $t@17@01)))))
(declare-const sm@20@01 $FVF<next>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r n@16@01)
    (=
      ($FVF.lookup_next (as sm@20@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@19@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@20@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@19@01  $FVF<next>) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<
        (inv@13@01 r)
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
      (<= 0 (inv@13@01 r)))
    (=
      ($FVF.lookup_next (as sm@20@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@20@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@19@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r) r))
  :pattern (($FVF.lookup_next (as sm@20@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef4|)))
(assert ($FVF.loc_next ($FVF.lookup_next (as sm@20@01  $FVF<next>) n@16@01) n@16@01))
(assert (= ($Snap.second ($Snap.second $t@17@01)) $Snap.unit))
; [eval] (forall i: Int :: { this.nodes[i] } 0 <= i && i < |this.nodes| ==> this.nodes[i] != n)
(declare-const i@21@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i && i < |this.nodes| ==> this.nodes[i] != n
; [eval] 0 <= i && i < |this.nodes|
; [eval] 0 <= i
(push) ; 4
; [then-branch: 12 | 0 <= i@21@01 | live]
; [else-branch: 12 | !(0 <= i@21@01) | live]
(push) ; 5
; [then-branch: 12 | 0 <= i@21@01]
(assert (<= 0 i@21@01))
; [eval] i < |this.nodes|
; [eval] |this.nodes|
(pop) ; 5
(push) ; 5
; [else-branch: 12 | !(0 <= i@21@01)]
(assert (not (<= 0 i@21@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 i@21@01)) (<= 0 i@21@01)))
(push) ; 4
; [then-branch: 13 | i@21@01 < |First:(First:($t@4@01))| && 0 <= i@21@01 | live]
; [else-branch: 13 | !(i@21@01 < |First:(First:($t@4@01))| && 0 <= i@21@01) | live]
(push) ; 5
; [then-branch: 13 | i@21@01 < |First:(First:($t@4@01))| && 0 <= i@21@01]
(assert (and
  (<
    i@21@01
    (Seq_length
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
  (<= 0 i@21@01)))
; [eval] this.nodes[i] != n
; [eval] this.nodes[i]
(push) ; 6
(assert (not (>= i@21@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 13 | !(i@21@01 < |First:(First:($t@4@01))| && 0 <= i@21@01)]
(assert (not
  (and
    (<
      i@21@01
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
    (<= 0 i@21@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (and
      (<
        i@21@01
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
      (<= 0 i@21@01)))
  (and
    (<
      i@21@01
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
    (<= 0 i@21@01))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@21@01 Int)) (!
  (and
    (or (not (<= 0 i@21@01)) (<= 0 i@21@01))
    (or
      (not
        (and
          (<
            i@21@01
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
          (<= 0 i@21@01)))
      (and
        (<
          i@21@01
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
        (<= 0 i@21@01))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
    i@21@01))
  :qid |prog.l49-aux|)))
(assert (forall ((i@21@01 Int)) (!
  (=>
    (and
      (<
        i@21@01
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
      (<= 0 i@21@01))
    (not
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
          i@21@01)
        n@16@01)))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
    i@21@01))
  :qid |prog.l49|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; n.next := null
; Definitional axioms for snapshot map values
; Precomputing data for removing quantified permissions
(define-fun pTaken@22@01 ((r $Ref)) $Perm
  (ite
    (= r n@16@01)
    ($Perm.min (ite (= r n@16@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
(define-fun pTaken@23@01 ((r $Ref)) $Perm
  (ite
    (= r n@16@01)
    ($Perm.min
      (ite
        (and
          (<
            (inv@13@01 r)
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
          (<= 0 (inv@13@01 r)))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@22@01 r)))
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
  (- (ite (= n@16@01 n@16@01) $Perm.Write $Perm.No) (pTaken@22@01 n@16@01))
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
  (=> (= r n@16@01) (= (- $Perm.Write (pTaken@22@01 r)) $Perm.No))
  
  :qid |quant-u-30|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@24@01 $FVF<next>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_next (as sm@24@01  $FVF<next>) n@16@01) $Ref.null))
(assert ($FVF.loc_next ($FVF.lookup_next (as sm@24@01  $FVF<next>) n@16@01) n@16@01))
; [exec]
; n.val := elem
; Precomputing data for removing quantified permissions
(define-fun pTaken@25@01 ((r $Ref)) $Perm
  (ite
    (= r n@16@01)
    ($Perm.min (ite (= r n@16@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
(define-fun pTaken@26@01 ((r $Ref)) $Perm
  (ite
    (= r n@16@01)
    ($Perm.min
      (ite
        (and
          (<
            (inv@11@01 r)
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
          (<= 0 (inv@11@01 r)))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@25@01 r)))
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
  (- (ite (= n@16@01 n@16@01) $Perm.Write $Perm.No) (pTaken@25@01 n@16@01))
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
  (=> (= r n@16@01) (= (- $Perm.Write (pTaken@25@01 r)) $Perm.No))
  
  :qid |quant-u-33|))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@27@01 $FVF<val>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_val (as sm@27@01  $FVF<val>) n@16@01) elem@3@01))
; [eval] |this.nodes| > 0
; [eval] |this.nodes|
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (>
    (Seq_length
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01))))
    0))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (>
  (Seq_length
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01))))
  0)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [then-branch: 14 | |First:(First:($t@4@01))| > 0 | live]
; [else-branch: 14 | !(|First:(First:($t@4@01))| > 0) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 14 | |First:(First:($t@4@01))| > 0]
(assert (>
  (Seq_length
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01))))
  0))
; [exec]
; this.nodes[|this.nodes| - 1].next := n
; [eval] this.nodes[|this.nodes| - 1]
; [eval] |this.nodes| - 1
; [eval] |this.nodes|
(push) ; 4
(assert (not (>=
  (-
    (Seq_length
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01))))
    1)
  0)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (<
  (-
    (Seq_length
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01))))
    1)
  (Seq_length
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(declare-const sm@28@01 $FVF<next>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<
        (inv@13@01 r)
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
      (<= 0 (inv@13@01 r)))
    (=
      ($FVF.lookup_next (as sm@28@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@28@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r n@16@01)
    (=
      ($FVF.lookup_next (as sm@28@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@24@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@28@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@24@01  $FVF<next>) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r) r)
    ($FVF.loc_next ($FVF.lookup_next (as sm@24@01  $FVF<next>) r) r))
  :pattern (($FVF.lookup_next (as sm@28@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef7|)))
(assert ($FVF.loc_next ($FVF.lookup_next (as sm@28@01  $FVF<next>) (Seq_index
  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
  (-
    (Seq_length
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01))))
    1))) (Seq_index
  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
  (-
    (Seq_length
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01))))
    1))))
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  n@16@01
  (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
    (-
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01))))
      1)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@29@01 ((r $Ref)) $Perm
  (ite
    (=
      r
      (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
        (-
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01))))
          1)))
    ($Perm.min
      (ite
        (and
          (<
            (inv@13@01 r)
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
          (<= 0 (inv@13@01 r)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@30@01 ((r $Ref)) $Perm
  (ite
    (=
      r
      (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
        (-
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01))))
          1)))
    ($Perm.min
      (ite (= r n@16@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@29@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
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
        (and
          (<
            (inv@13@01 r)
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
          (<= 0 (inv@13@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@29@01 r))
    $Perm.No)
  
  :qid |quant-u-35|))))
(check-sat)
; unknown
(pop) ; 4
; 0.23s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (=
      r
      (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
        (-
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01))))
          1)))
    (= (- $Perm.Write (pTaken@29@01 r)) $Perm.No))
  
  :qid |quant-u-36|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@31@01 $FVF<next>)
; Definitional axioms for singleton-FVF's value
(assert (=
  ($FVF.lookup_next (as sm@31@01  $FVF<next>) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
    (-
      (Seq_length
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01))))
      1)))
  n@16@01))
(assert ($FVF.loc_next ($FVF.lookup_next (as sm@31@01  $FVF<next>) (Seq_index
  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
  (-
    (Seq_length
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01))))
    1))) (Seq_index
  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
  (-
    (Seq_length
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01))))
    1))))
; [exec]
; this.nodes := this.nodes ++ Seq(n)
; [eval] this.nodes ++ Seq(n)
; [eval] Seq(n)
(assert (= (Seq_length (Seq_singleton n@16@01)) 1))
(declare-const nodes@32@01 Seq<$Ref>)
(assert (Seq_equal
  nodes@32@01
  (Seq_append
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
    (Seq_singleton n@16@01))))
; [exec]
; fold acc(List(this), write)
; [eval] (forall i: Int, j: Int :: { (i in [0..|this.nodes|)), (j in [0..|this.nodes|)) } { (i in [0..|this.nodes|)), this.nodes[j] } { (j in [0..|this.nodes|)), this.nodes[i] } { this.nodes[i], this.nodes[j] } (i in [0..|this.nodes|)) && ((j in [0..|this.nodes|)) && i != j) ==> this.nodes[i] != this.nodes[j])
(declare-const i@33@01 Int)
(declare-const j@34@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] (i in [0..|this.nodes|)) && ((j in [0..|this.nodes|)) && i != j) ==> this.nodes[i] != this.nodes[j]
; [eval] (i in [0..|this.nodes|)) && ((j in [0..|this.nodes|)) && i != j)
; [eval] (i in [0..|this.nodes|))
; [eval] [0..|this.nodes|)
; [eval] |this.nodes|
(push) ; 5
; [then-branch: 15 | i@33@01 in [0..|nodes@32@01|] | live]
; [else-branch: 15 | !(i@33@01 in [0..|nodes@32@01|]) | live]
(push) ; 6
; [then-branch: 15 | i@33@01 in [0..|nodes@32@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) i@33@01))
; [eval] (j in [0..|this.nodes|))
; [eval] [0..|this.nodes|)
; [eval] |this.nodes|
(push) ; 7
; [then-branch: 16 | j@34@01 in [0..|nodes@32@01|] | live]
; [else-branch: 16 | !(j@34@01 in [0..|nodes@32@01|]) | live]
(push) ; 8
; [then-branch: 16 | j@34@01 in [0..|nodes@32@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) j@34@01))
; [eval] i != j
(pop) ; 8
(push) ; 8
; [else-branch: 16 | !(j@34@01 in [0..|nodes@32@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) j@34@01)))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or
  (not (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) j@34@01))
  (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) j@34@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 15 | !(i@33@01 in [0..|nodes@32@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) i@33@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) i@33@01)
  (and
    (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) i@33@01)
    (or
      (not (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) j@34@01))
      (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) j@34@01)))))
; Joined path conditions
(assert (or
  (not (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) i@33@01))
  (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) i@33@01)))
(push) ; 5
; [then-branch: 17 | i@33@01 != j@34@01 && j@34@01 in [0..|nodes@32@01|] && i@33@01 in [0..|nodes@32@01|] | live]
; [else-branch: 17 | !(i@33@01 != j@34@01 && j@34@01 in [0..|nodes@32@01|] && i@33@01 in [0..|nodes@32@01|]) | live]
(push) ; 6
; [then-branch: 17 | i@33@01 != j@34@01 && j@34@01 in [0..|nodes@32@01|] && i@33@01 in [0..|nodes@32@01|]]
(assert (and
  (and
    (not (= i@33@01 j@34@01))
    (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) j@34@01))
  (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) i@33@01)))
; [eval] this.nodes[i] != this.nodes[j]
; [eval] this.nodes[i]
(push) ; 7
(assert (not (>= i@33@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@33@01 (Seq_length nodes@32@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [eval] this.nodes[j]
(push) ; 7
(assert (not (>= j@34@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< j@34@01 (Seq_length nodes@32@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 17 | !(i@33@01 != j@34@01 && j@34@01 in [0..|nodes@32@01|] && i@33@01 in [0..|nodes@32@01|])]
(assert (not
  (and
    (and
      (not (= i@33@01 j@34@01))
      (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) j@34@01))
    (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) i@33@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (and
      (not (= i@33@01 j@34@01))
      (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) j@34@01))
    (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) i@33@01))
  (and
    (not (= i@33@01 j@34@01))
    (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) j@34@01)
    (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) i@33@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (and
        (not (= i@33@01 j@34@01))
        (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) j@34@01))
      (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) i@33@01)))
  (and
    (and
      (not (= i@33@01 j@34@01))
      (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) j@34@01))
    (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) i@33@01))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@33@01 Int) (j@34@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) i@33@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) i@33@01)
        (or
          (not (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) j@34@01))
          (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) j@34@01))))
    (or
      (not (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) i@33@01))
      (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) i@33@01))
    (=>
      (and
        (and
          (not (= i@33@01 j@34@01))
          (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) j@34@01))
        (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) i@33@01))
      (and
        (not (= i@33@01 j@34@01))
        (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) j@34@01)
        (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) i@33@01)))
    (or
      (not
        (and
          (and
            (not (= i@33@01 j@34@01))
            (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) j@34@01))
          (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) i@33@01)))
      (and
        (and
          (not (= i@33@01 j@34@01))
          (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) j@34@01))
        (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) i@33@01))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) i@33@01) (Seq_contains
    (Seq_range 0 (Seq_length nodes@32@01))
    j@34@01))
  :qid |prog.l16-aux|)))
(assert (forall ((i@33@01 Int) (j@34@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) i@33@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) i@33@01)
        (or
          (not (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) j@34@01))
          (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) j@34@01))))
    (or
      (not (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) i@33@01))
      (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) i@33@01))
    (=>
      (and
        (and
          (not (= i@33@01 j@34@01))
          (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) j@34@01))
        (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) i@33@01))
      (and
        (not (= i@33@01 j@34@01))
        (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) j@34@01)
        (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) i@33@01)))
    (or
      (not
        (and
          (and
            (not (= i@33@01 j@34@01))
            (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) j@34@01))
          (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) i@33@01)))
      (and
        (and
          (not (= i@33@01 j@34@01))
          (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) j@34@01))
        (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) i@33@01))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) i@33@01) (Seq_index
    nodes@32@01
    j@34@01))
  :qid |prog.l16-aux|)))
(assert (forall ((i@33@01 Int) (j@34@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) i@33@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) i@33@01)
        (or
          (not (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) j@34@01))
          (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) j@34@01))))
    (or
      (not (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) i@33@01))
      (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) i@33@01))
    (=>
      (and
        (and
          (not (= i@33@01 j@34@01))
          (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) j@34@01))
        (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) i@33@01))
      (and
        (not (= i@33@01 j@34@01))
        (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) j@34@01)
        (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) i@33@01)))
    (or
      (not
        (and
          (and
            (not (= i@33@01 j@34@01))
            (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) j@34@01))
          (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) i@33@01)))
      (and
        (and
          (not (= i@33@01 j@34@01))
          (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) j@34@01))
        (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) i@33@01))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) j@34@01) (Seq_index
    nodes@32@01
    i@33@01))
  :qid |prog.l16-aux|)))
(assert (forall ((i@33@01 Int) (j@34@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) i@33@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) i@33@01)
        (or
          (not (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) j@34@01))
          (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) j@34@01))))
    (or
      (not (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) i@33@01))
      (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) i@33@01))
    (=>
      (and
        (and
          (not (= i@33@01 j@34@01))
          (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) j@34@01))
        (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) i@33@01))
      (and
        (not (= i@33@01 j@34@01))
        (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) j@34@01)
        (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) i@33@01)))
    (or
      (not
        (and
          (and
            (not (= i@33@01 j@34@01))
            (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) j@34@01))
          (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) i@33@01)))
      (and
        (and
          (not (= i@33@01 j@34@01))
          (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) j@34@01))
        (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) i@33@01))))
  :pattern ((Seq_index nodes@32@01 i@33@01) (Seq_index nodes@32@01 j@34@01))
  :qid |prog.l16-aux|)))
(push) ; 4
(assert (not (forall ((i@33@01 Int) (j@34@01 Int)) (!
  (=>
    (and
      (and
        (not (= i@33@01 j@34@01))
        (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) j@34@01))
      (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) i@33@01))
    (not (= (Seq_index nodes@32@01 i@33@01) (Seq_index nodes@32@01 j@34@01))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) i@33@01) (Seq_contains
    (Seq_range 0 (Seq_length nodes@32@01))
    j@34@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) i@33@01) (Seq_index
    nodes@32@01
    j@34@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) j@34@01) (Seq_index
    nodes@32@01
    i@33@01))
  :pattern ((Seq_index nodes@32@01 i@33@01) (Seq_index nodes@32@01 j@34@01))
  :qid |prog.l16|))))
(check-sat)
; unsat
(pop) ; 4
; 0.19s
; (get-info :all-statistics)
(assert (forall ((i@33@01 Int) (j@34@01 Int)) (!
  (=>
    (and
      (and
        (not (= i@33@01 j@34@01))
        (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) j@34@01))
      (Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) i@33@01))
    (not (= (Seq_index nodes@32@01 i@33@01) (Seq_index nodes@32@01 j@34@01))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) i@33@01) (Seq_contains
    (Seq_range 0 (Seq_length nodes@32@01))
    j@34@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) i@33@01) (Seq_index
    nodes@32@01
    j@34@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length nodes@32@01)) j@34@01) (Seq_index
    nodes@32@01
    i@33@01))
  :pattern ((Seq_index nodes@32@01 i@33@01) (Seq_index nodes@32@01 j@34@01))
  :qid |prog.l16|)))
(declare-const i@35@01 Int)
(push) ; 4
; [eval] 0 <= i && i < |this.nodes|
; [eval] 0 <= i
(push) ; 5
; [then-branch: 18 | 0 <= i@35@01 | live]
; [else-branch: 18 | !(0 <= i@35@01) | live]
(push) ; 6
; [then-branch: 18 | 0 <= i@35@01]
(assert (<= 0 i@35@01))
; [eval] i < |this.nodes|
; [eval] |this.nodes|
(pop) ; 6
(push) ; 6
; [else-branch: 18 | !(0 <= i@35@01)]
(assert (not (<= 0 i@35@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 i@35@01)) (<= 0 i@35@01)))
(assert (and (< i@35@01 (Seq_length nodes@32@01)) (<= 0 i@35@01)))
; [eval] this.nodes[i]
(push) ; 5
(assert (not (>= i@35@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@36@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@35@01 Int)) (!
  (=>
    (and (< i@35@01 (Seq_length nodes@32@01)) (<= 0 i@35@01))
    (or (not (<= 0 i@35@01)) (<= 0 i@35@01)))
  :pattern ((Seq_index nodes@32@01 i@35@01))
  :qid |val-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@35@01 Int) (i2@35@01 Int)) (!
  (=>
    (and
      (and (< i1@35@01 (Seq_length nodes@32@01)) (<= 0 i1@35@01))
      (and (< i2@35@01 (Seq_length nodes@32@01)) (<= 0 i2@35@01))
      (= (Seq_index nodes@32@01 i1@35@01) (Seq_index nodes@32@01 i2@35@01)))
    (= i1@35@01 i2@35@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@35@01 Int)) (!
  (=>
    (and (< i@35@01 (Seq_length nodes@32@01)) (<= 0 i@35@01))
    (= (inv@36@01 (Seq_index nodes@32@01 i@35@01)) i@35@01))
  :pattern ((Seq_index nodes@32@01 i@35@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@36@01 r) (Seq_length nodes@32@01)) (<= 0 (inv@36@01 r)))
    (= (Seq_index nodes@32@01 (inv@36@01 r)) r))
  :pattern ((inv@36@01 r))
  :qid |val-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@37@01 ((r $Ref)) $Perm
  (ite
    (and (< (inv@36@01 r) (Seq_length nodes@32@01)) (<= 0 (inv@36@01 r)))
    ($Perm.min (ite (= r n@16@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
(define-fun pTaken@38@01 ((r $Ref)) $Perm
  (ite
    (and (< (inv@36@01 r) (Seq_length nodes@32@01)) (<= 0 (inv@36@01 r)))
    ($Perm.min
      (ite
        (and
          (<
            (inv@11@01 r)
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
          (<= 0 (inv@11@01 r)))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@37@01 r)))
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
  (- (ite (= n@16@01 n@16@01) $Perm.Write $Perm.No) (pTaken@37@01 n@16@01))
  $Perm.No)))
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
    (and (< (inv@36@01 r) (Seq_length nodes@32@01)) (<= 0 (inv@36@01 r)))
    (= (- $Perm.Write (pTaken@37@01 r)) $Perm.No))
  
  :qid |quant-u-40|))))
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
      (ite
        (and
          (<
            (inv@11@01 r)
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
          (<= 0 (inv@11@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@38@01 r))
    $Perm.No)
  
  :qid |quant-u-41|))))
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
    (and (< (inv@36@01 r) (Seq_length nodes@32@01)) (<= 0 (inv@36@01 r)))
    (= (- (- $Perm.Write (pTaken@37@01 r)) (pTaken@38@01 r)) $Perm.No))
  
  :qid |quant-u-42|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@39@01 $FVF<val>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@39@01  $FVF<val>)))
      (and (< (inv@36@01 r) (Seq_length nodes@32@01)) (<= 0 (inv@36@01 r))))
    (=>
      (and (< (inv@36@01 r) (Seq_length nodes@32@01)) (<= 0 (inv@36@01 r)))
      (Set_in r ($FVF.domain_val (as sm@39@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@39@01  $FVF<val>))))
  :qid |qp.fvfDomDef10|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@36@01 r) (Seq_length nodes@32@01)) (<= 0 (inv@36@01 r)))
      (= r n@16@01))
    (=
      ($FVF.lookup_val (as sm@39@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@27@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@39@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@27@01  $FVF<val>) r))
  :qid |qp.fvfValDef8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@36@01 r) (Seq_length nodes@32@01)) (<= 0 (inv@36@01 r)))
      (and
        (<
          (inv@11@01 r)
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
        (<= 0 (inv@11@01 r))))
    (=
      ($FVF.lookup_val (as sm@39@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@4@01))))) r)))
  :pattern (($FVF.lookup_val (as sm@39@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@4@01))))) r))
  :qid |qp.fvfValDef9|)))
(declare-const i@40@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] 0 <= i && i < |this.nodes|
; [eval] 0 <= i
(push) ; 5
; [then-branch: 19 | 0 <= i@40@01 | live]
; [else-branch: 19 | !(0 <= i@40@01) | live]
(push) ; 6
; [then-branch: 19 | 0 <= i@40@01]
(assert (<= 0 i@40@01))
; [eval] i < |this.nodes|
; [eval] |this.nodes|
(pop) ; 6
(push) ; 6
; [else-branch: 19 | !(0 <= i@40@01)]
(assert (not (<= 0 i@40@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 i@40@01)) (<= 0 i@40@01)))
(assert (and (< i@40@01 (Seq_length nodes@32@01)) (<= 0 i@40@01)))
; [eval] this.nodes[i]
(push) ; 5
(assert (not (>= i@40@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@41@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@40@01 Int)) (!
  (=>
    (and (< i@40@01 (Seq_length nodes@32@01)) (<= 0 i@40@01))
    (or (not (<= 0 i@40@01)) (<= 0 i@40@01)))
  :pattern ((Seq_index nodes@32@01 i@40@01))
  :qid |next-aux|)))
(declare-const sm@42@01 $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
        (-
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01))))
          1)))
    (=
      ($FVF.lookup_next (as sm@42@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@31@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@42@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@31@01  $FVF<next>) r))
  :qid |qp.fvfValDef11|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r n@16@01)
    (=
      ($FVF.lookup_next (as sm@42@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@24@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@42@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@24@01  $FVF<next>) r))
  :qid |qp.fvfValDef12|)))
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (ite
          (and
            (<
              (inv@13@01 r)
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
            (<= 0 (inv@13@01 r)))
          $Perm.Write
          $Perm.No)
        (pTaken@29@01 r)))
    (=
      ($FVF.lookup_next (as sm@42@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@42@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r))
  :qid |qp.fvfValDef13|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@31@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next (as sm@24@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r) r))
  :pattern (($FVF.lookup_next (as sm@42@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef14|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@40@01 Int) (i2@40@01 Int)) (!
  (=>
    (and
      (and
        (and (< i1@40@01 (Seq_length nodes@32@01)) (<= 0 i1@40@01))
        ($FVF.loc_next ($FVF.lookup_next (as sm@42@01  $FVF<next>) (Seq_index
          nodes@32@01
          i1@40@01)) (Seq_index nodes@32@01 i1@40@01)))
      (and
        (and (< i2@40@01 (Seq_length nodes@32@01)) (<= 0 i2@40@01))
        ($FVF.loc_next ($FVF.lookup_next (as sm@42@01  $FVF<next>) (Seq_index
          nodes@32@01
          i2@40@01)) (Seq_index nodes@32@01 i2@40@01)))
      (= (Seq_index nodes@32@01 i1@40@01) (Seq_index nodes@32@01 i2@40@01)))
    (= i1@40@01 i2@40@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@40@01 Int)) (!
  (=>
    (and (< i@40@01 (Seq_length nodes@32@01)) (<= 0 i@40@01))
    (= (inv@41@01 (Seq_index nodes@32@01 i@40@01)) i@40@01))
  :pattern ((Seq_index nodes@32@01 i@40@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@41@01 r) (Seq_length nodes@32@01)) (<= 0 (inv@41@01 r)))
    (= (Seq_index nodes@32@01 (inv@41@01 r)) r))
  :pattern ((inv@41@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@41@01 r) (Seq_length nodes@32@01)) (<= 0 (inv@41@01 r)))
    ($FVF.loc_next ($FVF.lookup_next (as sm@42@01  $FVF<next>) r) r))
  :pattern ((inv@41@01 r))
  :qid |quant-u-44|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@43@01 ((r $Ref)) $Perm
  (ite
    (and (< (inv@41@01 r) (Seq_length nodes@32@01)) (<= 0 (inv@41@01 r)))
    ($Perm.min
      (ite
        (=
          r
          (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
            (-
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01))))
              1)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@44@01 ((r $Ref)) $Perm
  (ite
    (and (< (inv@41@01 r) (Seq_length nodes@32@01)) (<= 0 (inv@41@01 r)))
    ($Perm.min
      (ite (= r n@16@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@43@01 r)))
    $Perm.No))
(define-fun pTaken@45@01 ((r $Ref)) $Perm
  (ite
    (and (< (inv@41@01 r) (Seq_length nodes@32@01)) (<= 0 (inv@41@01 r)))
    ($Perm.min
      (-
        (ite
          (and
            (<
              (inv@13@01 r)
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
            (<= 0 (inv@13@01 r)))
          $Perm.Write
          $Perm.No)
        (pTaken@29@01 r))
      (- (- $Perm.Write (pTaken@43@01 r)) (pTaken@44@01 r)))
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
    (ite
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
          (-
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01))))
            1))
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
          (-
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01))))
            1)))
      $Perm.Write
      $Perm.No)
    (pTaken@43@01 (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
      (-
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01))))
        1))))
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
    (and (< (inv@41@01 r) (Seq_length nodes@32@01)) (<= 0 (inv@41@01 r)))
    (= (- $Perm.Write (pTaken@43@01 r)) $Perm.No))
  
  :qid |quant-u-47|))))
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
  (- (ite (= n@16@01 n@16@01) $Perm.Write $Perm.No) (pTaken@44@01 n@16@01))
  $Perm.No)))
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
    (and (< (inv@41@01 r) (Seq_length nodes@32@01)) (<= 0 (inv@41@01 r)))
    (= (- (- $Perm.Write (pTaken@43@01 r)) (pTaken@44@01 r)) $Perm.No))
  
  :qid |quant-u-49|))))
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
        (ite
          (and
            (<
              (inv@13@01 r)
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
            (<= 0 (inv@13@01 r)))
          $Perm.Write
          $Perm.No)
        (pTaken@29@01 r))
      (pTaken@45@01 r))
    $Perm.No)
  
  :qid |quant-u-50|))))
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
    (and (< (inv@41@01 r) (Seq_length nodes@32@01)) (<= 0 (inv@41@01 r)))
    (=
      (- (- (- $Perm.Write (pTaken@43@01 r)) (pTaken@44@01 r)) (pTaken@45@01 r))
      $Perm.No))
  
  :qid |quant-u-51|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@46@01 $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@46@01  $FVF<next>)))
      (and (< (inv@41@01 r) (Seq_length nodes@32@01)) (<= 0 (inv@41@01 r))))
    (=>
      (and (< (inv@41@01 r) (Seq_length nodes@32@01)) (<= 0 (inv@41@01 r)))
      (Set_in r ($FVF.domain_next (as sm@46@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@46@01  $FVF<next>))))
  :qid |qp.fvfDomDef19|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@41@01 r) (Seq_length nodes@32@01)) (<= 0 (inv@41@01 r)))
      (=
        r
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
          (-
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01))))
            1))))
    (=
      ($FVF.lookup_next (as sm@46@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@31@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@46@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@31@01  $FVF<next>) r))
  :qid |qp.fvfValDef15|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@41@01 r) (Seq_length nodes@32@01)) (<= 0 (inv@41@01 r)))
      (= r n@16@01))
    (=
      ($FVF.lookup_next (as sm@46@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@24@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@46@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@24@01  $FVF<next>) r))
  :qid |qp.fvfValDef16|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@41@01 r) (Seq_length nodes@32@01)) (<= 0 (inv@41@01 r)))
      (<
        $Perm.No
        (-
          (ite
            (and
              (<
                (inv@13@01 r)
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
              (<= 0 (inv@13@01 r)))
            $Perm.Write
            $Perm.No)
          (pTaken@29@01 r))))
    (=
      ($FVF.lookup_next (as sm@46@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@46@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r))
  :qid |qp.fvfValDef17|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@31@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next (as sm@24@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r) r))
  :pattern (($FVF.lookup_next (as sm@46@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef18|)))
; [eval] (forall i: Int :: { this.nodes[i].next } 0 <= i && i < |this.nodes| ==> (this.nodes[i] in this.nodes) && (i < |this.nodes| - 1 ? this.nodes[i].next == this.nodes[i + 1] : this.nodes[i].next == null))
(declare-const i@47@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] 0 <= i && i < |this.nodes| ==> (this.nodes[i] in this.nodes) && (i < |this.nodes| - 1 ? this.nodes[i].next == this.nodes[i + 1] : this.nodes[i].next == null)
; [eval] 0 <= i && i < |this.nodes|
; [eval] 0 <= i
(push) ; 5
; [then-branch: 20 | 0 <= i@47@01 | live]
; [else-branch: 20 | !(0 <= i@47@01) | live]
(push) ; 6
; [then-branch: 20 | 0 <= i@47@01]
(assert (<= 0 i@47@01))
; [eval] i < |this.nodes|
; [eval] |this.nodes|
(pop) ; 6
(push) ; 6
; [else-branch: 20 | !(0 <= i@47@01)]
(assert (not (<= 0 i@47@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 i@47@01)) (<= 0 i@47@01)))
(push) ; 5
; [then-branch: 21 | i@47@01 < |nodes@32@01| && 0 <= i@47@01 | live]
; [else-branch: 21 | !(i@47@01 < |nodes@32@01| && 0 <= i@47@01) | live]
(push) ; 6
; [then-branch: 21 | i@47@01 < |nodes@32@01| && 0 <= i@47@01]
(assert (and (< i@47@01 (Seq_length nodes@32@01)) (<= 0 i@47@01)))
; [eval] (this.nodes[i] in this.nodes) && (i < |this.nodes| - 1 ? this.nodes[i].next == this.nodes[i + 1] : this.nodes[i].next == null)
; [eval] (this.nodes[i] in this.nodes)
; [eval] this.nodes[i]
(push) ; 7
(assert (not (>= i@47@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(push) ; 7
; [then-branch: 22 | nodes@32@01[i@47@01] in nodes@32@01 | live]
; [else-branch: 22 | !(nodes@32@01[i@47@01] in nodes@32@01) | live]
(push) ; 8
; [then-branch: 22 | nodes@32@01[i@47@01] in nodes@32@01]
(assert (Seq_contains nodes@32@01 (Seq_index nodes@32@01 i@47@01)))
; [eval] (i < |this.nodes| - 1 ? this.nodes[i].next == this.nodes[i + 1] : this.nodes[i].next == null)
; [eval] i < |this.nodes| - 1
; [eval] |this.nodes| - 1
; [eval] |this.nodes|
(push) ; 9
; [then-branch: 23 | i@47@01 < |nodes@32@01| - 1 | live]
; [else-branch: 23 | !(i@47@01 < |nodes@32@01| - 1) | live]
(push) ; 10
; [then-branch: 23 | i@47@01 < |nodes@32@01| - 1]
(assert (< i@47@01 (- (Seq_length nodes@32@01) 1)))
; [eval] this.nodes[i].next == this.nodes[i + 1]
; [eval] this.nodes[i]
(push) ; 11
(assert (not (>= i@47@01 0)))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(declare-const sm@48@01 $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (ite
          (and
            (<
              (inv@13@01 r)
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
            (<= 0 (inv@13@01 r)))
          $Perm.Write
          $Perm.No)
        (pTaken@29@01 r)))
    (=
      ($FVF.lookup_next (as sm@48@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@48@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r))
  :qid |qp.fvfValDef20|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r n@16@01)
    (=
      ($FVF.lookup_next (as sm@48@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@24@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@48@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@24@01  $FVF<next>) r))
  :qid |qp.fvfValDef21|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
        (-
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01))))
          1)))
    (=
      ($FVF.lookup_next (as sm@48@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@31@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@48@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@31@01  $FVF<next>) r))
  :qid |qp.fvfValDef22|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r) r)
    ($FVF.loc_next ($FVF.lookup_next (as sm@24@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next (as sm@31@01  $FVF<next>) r) r))
  :pattern (($FVF.lookup_next (as sm@48@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef23|)))
(declare-const pm@49@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@49@01  $FPM) r)
    (+
      (+
        (-
          (ite
            (and
              (<
                (inv@13@01 r)
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
              (<= 0 (inv@13@01 r)))
            $Perm.Write
            $Perm.No)
          (pTaken@29@01 r))
        (ite (= r n@16@01) $Perm.Write $Perm.No))
      (ite
        (=
          r
          (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
            (-
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01))))
              1)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_next (as pm@49@01  $FPM) r))
  :qid |qp.resPrmSumDef24|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@48@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r) r)
    ($FVF.loc_next ($FVF.lookup_next (as sm@24@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next (as sm@31@01  $FVF<next>) r) r))
  :pattern (($FVF.perm_next (as pm@49@01  $FPM) r))
  :qid |qp.resTrgDef25|)))
(assert ($FVF.loc_next ($FVF.lookup_next (as sm@48@01  $FVF<next>) (Seq_index
  nodes@32@01
  i@47@01)) (Seq_index nodes@32@01 i@47@01)))
(push) ; 11
(assert (not (< $Perm.No ($FVF.perm_next (as pm@49@01  $FPM) (Seq_index nodes@32@01 i@47@01)))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [eval] this.nodes[i + 1]
; [eval] i + 1
(push) ; 11
(assert (not (>= (+ i@47@01 1) 0)))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(push) ; 11
(assert (not (< (+ i@47@01 1) (Seq_length nodes@32@01))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(pop) ; 10
(push) ; 10
; [else-branch: 23 | !(i@47@01 < |nodes@32@01| - 1)]
(assert (not (< i@47@01 (- (Seq_length nodes@32@01) 1))))
; [eval] this.nodes[i].next == null
; [eval] this.nodes[i]
(push) ; 11
(assert (not (>= i@47@01 0)))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(declare-const sm@50@01 $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (ite
          (and
            (<
              (inv@13@01 r)
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
            (<= 0 (inv@13@01 r)))
          $Perm.Write
          $Perm.No)
        (pTaken@29@01 r)))
    (=
      ($FVF.lookup_next (as sm@50@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@50@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r))
  :qid |qp.fvfValDef26|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r n@16@01)
    (=
      ($FVF.lookup_next (as sm@50@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@24@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@50@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@24@01  $FVF<next>) r))
  :qid |qp.fvfValDef27|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
        (-
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01))))
          1)))
    (=
      ($FVF.lookup_next (as sm@50@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@31@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@50@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@31@01  $FVF<next>) r))
  :qid |qp.fvfValDef28|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r) r)
    ($FVF.loc_next ($FVF.lookup_next (as sm@24@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next (as sm@31@01  $FVF<next>) r) r))
  :pattern (($FVF.lookup_next (as sm@50@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef29|)))
(declare-const pm@51@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@51@01  $FPM) r)
    (+
      (+
        (-
          (ite
            (and
              (<
                (inv@13@01 r)
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
              (<= 0 (inv@13@01 r)))
            $Perm.Write
            $Perm.No)
          (pTaken@29@01 r))
        (ite (= r n@16@01) $Perm.Write $Perm.No))
      (ite
        (=
          r
          (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
            (-
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01))))
              1)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_next (as pm@51@01  $FPM) r))
  :qid |qp.resPrmSumDef30|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@50@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r) r)
    ($FVF.loc_next ($FVF.lookup_next (as sm@24@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next (as sm@31@01  $FVF<next>) r) r))
  :pattern (($FVF.perm_next (as pm@51@01  $FPM) r))
  :qid |qp.resTrgDef31|)))
(assert ($FVF.loc_next ($FVF.lookup_next (as sm@50@01  $FVF<next>) (Seq_index
  nodes@32@01
  i@47@01)) (Seq_index nodes@32@01 i@47@01)))
(push) ; 11
(assert (not (< $Perm.No ($FVF.perm_next (as pm@51@01  $FPM) (Seq_index nodes@32@01 i@47@01)))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (ite
          (and
            (<
              (inv@13@01 r)
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
            (<= 0 (inv@13@01 r)))
          $Perm.Write
          $Perm.No)
        (pTaken@29@01 r)))
    (=
      ($FVF.lookup_next (as sm@48@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@48@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r))
  :qid |qp.fvfValDef20|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r n@16@01)
    (=
      ($FVF.lookup_next (as sm@48@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@24@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@48@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@24@01  $FVF<next>) r))
  :qid |qp.fvfValDef21|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
        (-
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01))))
          1)))
    (=
      ($FVF.lookup_next (as sm@48@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@31@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@48@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@31@01  $FVF<next>) r))
  :qid |qp.fvfValDef22|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r) r)
    ($FVF.loc_next ($FVF.lookup_next (as sm@24@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next (as sm@31@01  $FVF<next>) r) r))
  :pattern (($FVF.lookup_next (as sm@48@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef23|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@49@01  $FPM) r)
    (+
      (+
        (-
          (ite
            (and
              (<
                (inv@13@01 r)
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
              (<= 0 (inv@13@01 r)))
            $Perm.Write
            $Perm.No)
          (pTaken@29@01 r))
        (ite (= r n@16@01) $Perm.Write $Perm.No))
      (ite
        (=
          r
          (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
            (-
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01))))
              1)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_next (as pm@49@01  $FPM) r))
  :qid |qp.resPrmSumDef24|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@48@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r) r)
    ($FVF.loc_next ($FVF.lookup_next (as sm@24@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next (as sm@31@01  $FVF<next>) r) r))
  :pattern (($FVF.perm_next (as pm@49@01  $FPM) r))
  :qid |qp.resTrgDef25|)))
(assert (=>
  (< i@47@01 (- (Seq_length nodes@32@01) 1))
  (and
    (< i@47@01 (- (Seq_length nodes@32@01) 1))
    ($FVF.loc_next ($FVF.lookup_next (as sm@48@01  $FVF<next>) (Seq_index
      nodes@32@01
      i@47@01)) (Seq_index nodes@32@01 i@47@01)))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (ite
          (and
            (<
              (inv@13@01 r)
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
            (<= 0 (inv@13@01 r)))
          $Perm.Write
          $Perm.No)
        (pTaken@29@01 r)))
    (=
      ($FVF.lookup_next (as sm@50@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@50@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r))
  :qid |qp.fvfValDef26|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r n@16@01)
    (=
      ($FVF.lookup_next (as sm@50@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@24@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@50@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@24@01  $FVF<next>) r))
  :qid |qp.fvfValDef27|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
        (-
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01))))
          1)))
    (=
      ($FVF.lookup_next (as sm@50@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@31@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@50@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@31@01  $FVF<next>) r))
  :qid |qp.fvfValDef28|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r) r)
    ($FVF.loc_next ($FVF.lookup_next (as sm@24@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next (as sm@31@01  $FVF<next>) r) r))
  :pattern (($FVF.lookup_next (as sm@50@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef29|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@51@01  $FPM) r)
    (+
      (+
        (-
          (ite
            (and
              (<
                (inv@13@01 r)
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
              (<= 0 (inv@13@01 r)))
            $Perm.Write
            $Perm.No)
          (pTaken@29@01 r))
        (ite (= r n@16@01) $Perm.Write $Perm.No))
      (ite
        (=
          r
          (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
            (-
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01))))
              1)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_next (as pm@51@01  $FPM) r))
  :qid |qp.resPrmSumDef30|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@50@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r) r)
    ($FVF.loc_next ($FVF.lookup_next (as sm@24@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next (as sm@31@01  $FVF<next>) r) r))
  :pattern (($FVF.perm_next (as pm@51@01  $FPM) r))
  :qid |qp.resTrgDef31|)))
(assert (=>
  (not (< i@47@01 (- (Seq_length nodes@32@01) 1)))
  (and
    (not (< i@47@01 (- (Seq_length nodes@32@01) 1)))
    ($FVF.loc_next ($FVF.lookup_next (as sm@50@01  $FVF<next>) (Seq_index
      nodes@32@01
      i@47@01)) (Seq_index nodes@32@01 i@47@01)))))
(assert (or
  (not (< i@47@01 (- (Seq_length nodes@32@01) 1)))
  (< i@47@01 (- (Seq_length nodes@32@01) 1))))
(pop) ; 8
(push) ; 8
; [else-branch: 22 | !(nodes@32@01[i@47@01] in nodes@32@01)]
(assert (not (Seq_contains nodes@32@01 (Seq_index nodes@32@01 i@47@01))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (ite
          (and
            (<
              (inv@13@01 r)
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
            (<= 0 (inv@13@01 r)))
          $Perm.Write
          $Perm.No)
        (pTaken@29@01 r)))
    (=
      ($FVF.lookup_next (as sm@48@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@48@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r))
  :qid |qp.fvfValDef20|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r n@16@01)
    (=
      ($FVF.lookup_next (as sm@48@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@24@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@48@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@24@01  $FVF<next>) r))
  :qid |qp.fvfValDef21|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
        (-
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01))))
          1)))
    (=
      ($FVF.lookup_next (as sm@48@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@31@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@48@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@31@01  $FVF<next>) r))
  :qid |qp.fvfValDef22|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r) r)
    ($FVF.loc_next ($FVF.lookup_next (as sm@24@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next (as sm@31@01  $FVF<next>) r) r))
  :pattern (($FVF.lookup_next (as sm@48@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef23|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@49@01  $FPM) r)
    (+
      (+
        (-
          (ite
            (and
              (<
                (inv@13@01 r)
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
              (<= 0 (inv@13@01 r)))
            $Perm.Write
            $Perm.No)
          (pTaken@29@01 r))
        (ite (= r n@16@01) $Perm.Write $Perm.No))
      (ite
        (=
          r
          (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
            (-
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01))))
              1)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_next (as pm@49@01  $FPM) r))
  :qid |qp.resPrmSumDef24|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@48@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r) r)
    ($FVF.loc_next ($FVF.lookup_next (as sm@24@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next (as sm@31@01  $FVF<next>) r) r))
  :pattern (($FVF.perm_next (as pm@49@01  $FPM) r))
  :qid |qp.resTrgDef25|)))
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (ite
          (and
            (<
              (inv@13@01 r)
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
            (<= 0 (inv@13@01 r)))
          $Perm.Write
          $Perm.No)
        (pTaken@29@01 r)))
    (=
      ($FVF.lookup_next (as sm@50@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@50@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r))
  :qid |qp.fvfValDef26|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r n@16@01)
    (=
      ($FVF.lookup_next (as sm@50@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@24@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@50@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@24@01  $FVF<next>) r))
  :qid |qp.fvfValDef27|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
        (-
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01))))
          1)))
    (=
      ($FVF.lookup_next (as sm@50@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@31@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@50@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@31@01  $FVF<next>) r))
  :qid |qp.fvfValDef28|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r) r)
    ($FVF.loc_next ($FVF.lookup_next (as sm@24@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next (as sm@31@01  $FVF<next>) r) r))
  :pattern (($FVF.lookup_next (as sm@50@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef29|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@51@01  $FPM) r)
    (+
      (+
        (-
          (ite
            (and
              (<
                (inv@13@01 r)
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
              (<= 0 (inv@13@01 r)))
            $Perm.Write
            $Perm.No)
          (pTaken@29@01 r))
        (ite (= r n@16@01) $Perm.Write $Perm.No))
      (ite
        (=
          r
          (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
            (-
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01))))
              1)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_next (as pm@51@01  $FPM) r))
  :qid |qp.resPrmSumDef30|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@50@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r) r)
    ($FVF.loc_next ($FVF.lookup_next (as sm@24@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next (as sm@31@01  $FVF<next>) r) r))
  :pattern (($FVF.perm_next (as pm@51@01  $FPM) r))
  :qid |qp.resTrgDef31|)))
(assert (=>
  (Seq_contains nodes@32@01 (Seq_index nodes@32@01 i@47@01))
  (and
    (Seq_contains nodes@32@01 (Seq_index nodes@32@01 i@47@01))
    (=>
      (< i@47@01 (- (Seq_length nodes@32@01) 1))
      (and
        (< i@47@01 (- (Seq_length nodes@32@01) 1))
        ($FVF.loc_next ($FVF.lookup_next (as sm@48@01  $FVF<next>) (Seq_index
          nodes@32@01
          i@47@01)) (Seq_index nodes@32@01 i@47@01))))
    (=>
      (not (< i@47@01 (- (Seq_length nodes@32@01) 1)))
      (and
        (not (< i@47@01 (- (Seq_length nodes@32@01) 1)))
        ($FVF.loc_next ($FVF.lookup_next (as sm@50@01  $FVF<next>) (Seq_index
          nodes@32@01
          i@47@01)) (Seq_index nodes@32@01 i@47@01))))
    (or
      (not (< i@47@01 (- (Seq_length nodes@32@01) 1)))
      (< i@47@01 (- (Seq_length nodes@32@01) 1))))))
; Joined path conditions
(assert (or
  (not (Seq_contains nodes@32@01 (Seq_index nodes@32@01 i@47@01)))
  (Seq_contains nodes@32@01 (Seq_index nodes@32@01 i@47@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 21 | !(i@47@01 < |nodes@32@01| && 0 <= i@47@01)]
(assert (not (and (< i@47@01 (Seq_length nodes@32@01)) (<= 0 i@47@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (ite
          (and
            (<
              (inv@13@01 r)
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
            (<= 0 (inv@13@01 r)))
          $Perm.Write
          $Perm.No)
        (pTaken@29@01 r)))
    (=
      ($FVF.lookup_next (as sm@48@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@48@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r))
  :qid |qp.fvfValDef20|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r n@16@01)
    (=
      ($FVF.lookup_next (as sm@48@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@24@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@48@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@24@01  $FVF<next>) r))
  :qid |qp.fvfValDef21|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
        (-
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01))))
          1)))
    (=
      ($FVF.lookup_next (as sm@48@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@31@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@48@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@31@01  $FVF<next>) r))
  :qid |qp.fvfValDef22|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r) r)
    ($FVF.loc_next ($FVF.lookup_next (as sm@24@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next (as sm@31@01  $FVF<next>) r) r))
  :pattern (($FVF.lookup_next (as sm@48@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef23|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@49@01  $FPM) r)
    (+
      (+
        (-
          (ite
            (and
              (<
                (inv@13@01 r)
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
              (<= 0 (inv@13@01 r)))
            $Perm.Write
            $Perm.No)
          (pTaken@29@01 r))
        (ite (= r n@16@01) $Perm.Write $Perm.No))
      (ite
        (=
          r
          (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
            (-
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01))))
              1)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_next (as pm@49@01  $FPM) r))
  :qid |qp.resPrmSumDef24|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@48@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r) r)
    ($FVF.loc_next ($FVF.lookup_next (as sm@24@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next (as sm@31@01  $FVF<next>) r) r))
  :pattern (($FVF.perm_next (as pm@49@01  $FPM) r))
  :qid |qp.resTrgDef25|)))
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (ite
          (and
            (<
              (inv@13@01 r)
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
            (<= 0 (inv@13@01 r)))
          $Perm.Write
          $Perm.No)
        (pTaken@29@01 r)))
    (=
      ($FVF.lookup_next (as sm@50@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@50@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r))
  :qid |qp.fvfValDef26|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r n@16@01)
    (=
      ($FVF.lookup_next (as sm@50@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@24@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@50@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@24@01  $FVF<next>) r))
  :qid |qp.fvfValDef27|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
        (-
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01))))
          1)))
    (=
      ($FVF.lookup_next (as sm@50@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@31@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@50@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@31@01  $FVF<next>) r))
  :qid |qp.fvfValDef28|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r) r)
    ($FVF.loc_next ($FVF.lookup_next (as sm@24@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next (as sm@31@01  $FVF<next>) r) r))
  :pattern (($FVF.lookup_next (as sm@50@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef29|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@51@01  $FPM) r)
    (+
      (+
        (-
          (ite
            (and
              (<
                (inv@13@01 r)
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
              (<= 0 (inv@13@01 r)))
            $Perm.Write
            $Perm.No)
          (pTaken@29@01 r))
        (ite (= r n@16@01) $Perm.Write $Perm.No))
      (ite
        (=
          r
          (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
            (-
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01))))
              1)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_next (as pm@51@01  $FPM) r))
  :qid |qp.resPrmSumDef30|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@50@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r) r)
    ($FVF.loc_next ($FVF.lookup_next (as sm@24@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next (as sm@31@01  $FVF<next>) r) r))
  :pattern (($FVF.perm_next (as pm@51@01  $FPM) r))
  :qid |qp.resTrgDef31|)))
(assert (=>
  (and (< i@47@01 (Seq_length nodes@32@01)) (<= 0 i@47@01))
  (and
    (< i@47@01 (Seq_length nodes@32@01))
    (<= 0 i@47@01)
    (=>
      (Seq_contains nodes@32@01 (Seq_index nodes@32@01 i@47@01))
      (and
        (Seq_contains nodes@32@01 (Seq_index nodes@32@01 i@47@01))
        (=>
          (< i@47@01 (- (Seq_length nodes@32@01) 1))
          (and
            (< i@47@01 (- (Seq_length nodes@32@01) 1))
            ($FVF.loc_next ($FVF.lookup_next (as sm@48@01  $FVF<next>) (Seq_index
              nodes@32@01
              i@47@01)) (Seq_index nodes@32@01 i@47@01))))
        (=>
          (not (< i@47@01 (- (Seq_length nodes@32@01) 1)))
          (and
            (not (< i@47@01 (- (Seq_length nodes@32@01) 1)))
            ($FVF.loc_next ($FVF.lookup_next (as sm@50@01  $FVF<next>) (Seq_index
              nodes@32@01
              i@47@01)) (Seq_index nodes@32@01 i@47@01))))
        (or
          (not (< i@47@01 (- (Seq_length nodes@32@01) 1)))
          (< i@47@01 (- (Seq_length nodes@32@01) 1)))))
    (or
      (not (Seq_contains nodes@32@01 (Seq_index nodes@32@01 i@47@01)))
      (Seq_contains nodes@32@01 (Seq_index nodes@32@01 i@47@01))))))
; Joined path conditions
(assert (or
  (not (and (< i@47@01 (Seq_length nodes@32@01)) (<= 0 i@47@01)))
  (and (< i@47@01 (Seq_length nodes@32@01)) (<= 0 i@47@01))))
(declare-const sm@52@01 $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (ite
          (and
            (<
              (inv@13@01 r)
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
            (<= 0 (inv@13@01 r)))
          $Perm.Write
          $Perm.No)
        (pTaken@29@01 r)))
    (=
      ($FVF.lookup_next (as sm@52@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@52@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r))
  :qid |qp.fvfValDef32|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r n@16@01)
    (=
      ($FVF.lookup_next (as sm@52@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@24@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@52@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@24@01  $FVF<next>) r))
  :qid |qp.fvfValDef33|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
        (-
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01))))
          1)))
    (=
      ($FVF.lookup_next (as sm@52@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@31@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@52@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@31@01  $FVF<next>) r))
  :qid |qp.fvfValDef34|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r) r)
    ($FVF.loc_next ($FVF.lookup_next (as sm@24@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next (as sm@31@01  $FVF<next>) r) r))
  :pattern (($FVF.lookup_next (as sm@52@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef35|)))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (ite
          (and
            (<
              (inv@13@01 r)
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
            (<= 0 (inv@13@01 r)))
          $Perm.Write
          $Perm.No)
        (pTaken@29@01 r)))
    (=
      ($FVF.lookup_next (as sm@48@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@48@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r))
  :qid |qp.fvfValDef20|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r n@16@01)
    (=
      ($FVF.lookup_next (as sm@48@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@24@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@48@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@24@01  $FVF<next>) r))
  :qid |qp.fvfValDef21|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
        (-
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01))))
          1)))
    (=
      ($FVF.lookup_next (as sm@48@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@31@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@48@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@31@01  $FVF<next>) r))
  :qid |qp.fvfValDef22|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r) r)
    ($FVF.loc_next ($FVF.lookup_next (as sm@24@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next (as sm@31@01  $FVF<next>) r) r))
  :pattern (($FVF.lookup_next (as sm@48@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef23|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@49@01  $FPM) r)
    (+
      (+
        (-
          (ite
            (and
              (<
                (inv@13@01 r)
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
              (<= 0 (inv@13@01 r)))
            $Perm.Write
            $Perm.No)
          (pTaken@29@01 r))
        (ite (= r n@16@01) $Perm.Write $Perm.No))
      (ite
        (=
          r
          (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
            (-
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01))))
              1)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_next (as pm@49@01  $FPM) r))
  :qid |qp.resPrmSumDef24|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@48@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r) r)
    ($FVF.loc_next ($FVF.lookup_next (as sm@24@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next (as sm@31@01  $FVF<next>) r) r))
  :pattern (($FVF.perm_next (as pm@49@01  $FPM) r))
  :qid |qp.resTrgDef25|)))
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (ite
          (and
            (<
              (inv@13@01 r)
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
            (<= 0 (inv@13@01 r)))
          $Perm.Write
          $Perm.No)
        (pTaken@29@01 r)))
    (=
      ($FVF.lookup_next (as sm@50@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@50@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r))
  :qid |qp.fvfValDef26|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r n@16@01)
    (=
      ($FVF.lookup_next (as sm@50@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@24@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@50@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@24@01  $FVF<next>) r))
  :qid |qp.fvfValDef27|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
        (-
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01))))
          1)))
    (=
      ($FVF.lookup_next (as sm@50@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@31@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@50@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@31@01  $FVF<next>) r))
  :qid |qp.fvfValDef28|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r) r)
    ($FVF.loc_next ($FVF.lookup_next (as sm@24@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next (as sm@31@01  $FVF<next>) r) r))
  :pattern (($FVF.lookup_next (as sm@50@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef29|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@51@01  $FPM) r)
    (+
      (+
        (-
          (ite
            (and
              (<
                (inv@13@01 r)
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
              (<= 0 (inv@13@01 r)))
            $Perm.Write
            $Perm.No)
          (pTaken@29@01 r))
        (ite (= r n@16@01) $Perm.Write $Perm.No))
      (ite
        (=
          r
          (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
            (-
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01))))
              1)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_next (as pm@51@01  $FPM) r))
  :qid |qp.resPrmSumDef30|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@50@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r) r)
    ($FVF.loc_next ($FVF.lookup_next (as sm@24@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next (as sm@31@01  $FVF<next>) r) r))
  :pattern (($FVF.perm_next (as pm@51@01  $FPM) r))
  :qid |qp.resTrgDef31|)))
(assert (forall ((r $Ref)) (!
  (=>
    (<
      $Perm.No
      (-
        (ite
          (and
            (<
              (inv@13@01 r)
              (Seq_length
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
            (<= 0 (inv@13@01 r)))
          $Perm.Write
          $Perm.No)
        (pTaken@29@01 r)))
    (=
      ($FVF.lookup_next (as sm@52@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@52@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r))
  :qid |qp.fvfValDef32|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r n@16@01)
    (=
      ($FVF.lookup_next (as sm@52@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@24@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@52@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@24@01  $FVF<next>) r))
  :qid |qp.fvfValDef33|)))
(assert (forall ((r $Ref)) (!
  (=>
    (=
      r
      (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))
        (-
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01))))
          1)))
    (=
      ($FVF.lookup_next (as sm@52@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@31@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@52@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@31@01  $FVF<next>) r))
  :qid |qp.fvfValDef34|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r) r)
    ($FVF.loc_next ($FVF.lookup_next (as sm@24@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next (as sm@31@01  $FVF<next>) r) r))
  :pattern (($FVF.lookup_next (as sm@52@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef35|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@47@01 Int)) (!
  (and
    (or (not (<= 0 i@47@01)) (<= 0 i@47@01))
    (=>
      (and (< i@47@01 (Seq_length nodes@32@01)) (<= 0 i@47@01))
      (and
        (< i@47@01 (Seq_length nodes@32@01))
        (<= 0 i@47@01)
        (=>
          (Seq_contains nodes@32@01 (Seq_index nodes@32@01 i@47@01))
          (and
            (Seq_contains nodes@32@01 (Seq_index nodes@32@01 i@47@01))
            (=>
              (< i@47@01 (- (Seq_length nodes@32@01) 1))
              (and
                (< i@47@01 (- (Seq_length nodes@32@01) 1))
                ($FVF.loc_next ($FVF.lookup_next (as sm@48@01  $FVF<next>) (Seq_index
                  nodes@32@01
                  i@47@01)) (Seq_index nodes@32@01 i@47@01))))
            (=>
              (not (< i@47@01 (- (Seq_length nodes@32@01) 1)))
              (and
                (not (< i@47@01 (- (Seq_length nodes@32@01) 1)))
                ($FVF.loc_next ($FVF.lookup_next (as sm@50@01  $FVF<next>) (Seq_index
                  nodes@32@01
                  i@47@01)) (Seq_index nodes@32@01 i@47@01))))
            (or
              (not (< i@47@01 (- (Seq_length nodes@32@01) 1)))
              (< i@47@01 (- (Seq_length nodes@32@01) 1)))))
        (or
          (not (Seq_contains nodes@32@01 (Seq_index nodes@32@01 i@47@01)))
          (Seq_contains nodes@32@01 (Seq_index nodes@32@01 i@47@01)))))
    (or
      (not (and (< i@47@01 (Seq_length nodes@32@01)) (<= 0 i@47@01)))
      (and (< i@47@01 (Seq_length nodes@32@01)) (<= 0 i@47@01))))
  :pattern (($FVF.loc_next ($FVF.lookup_next (as sm@52@01  $FVF<next>) (Seq_index
    nodes@32@01
    i@47@01)) (Seq_index nodes@32@01 i@47@01)))
  :qid |prog.l19-aux|)))
(push) ; 4
(assert (not (forall ((i@47@01 Int)) (!
  (=>
    (and (< i@47@01 (Seq_length nodes@32@01)) (<= 0 i@47@01))
    (and
      (ite
        (< i@47@01 (- (Seq_length nodes@32@01) 1))
        (=
          ($FVF.lookup_next (as sm@48@01  $FVF<next>) (Seq_index
            nodes@32@01
            i@47@01))
          (Seq_index nodes@32@01 (+ i@47@01 1)))
        (=
          ($FVF.lookup_next (as sm@50@01  $FVF<next>) (Seq_index
            nodes@32@01
            i@47@01))
          $Ref.null))
      (Seq_contains nodes@32@01 (Seq_index nodes@32@01 i@47@01))))
  :pattern (($FVF.loc_next ($FVF.lookup_next (as sm@52@01  $FVF<next>) (Seq_index
    nodes@32@01
    i@47@01)) (Seq_index nodes@32@01 i@47@01)))
  :qid |prog.l19|))))
(check-sat)
; unsat
(pop) ; 4
; 0.01s
; (get-info :all-statistics)
(assert (forall ((i@47@01 Int)) (!
  (=>
    (and (< i@47@01 (Seq_length nodes@32@01)) (<= 0 i@47@01))
    (and
      (ite
        (< i@47@01 (- (Seq_length nodes@32@01) 1))
        (=
          ($FVF.lookup_next (as sm@48@01  $FVF<next>) (Seq_index
            nodes@32@01
            i@47@01))
          (Seq_index nodes@32@01 (+ i@47@01 1)))
        (=
          ($FVF.lookup_next (as sm@50@01  $FVF<next>) (Seq_index
            nodes@32@01
            i@47@01))
          $Ref.null))
      (Seq_contains nodes@32@01 (Seq_index nodes@32@01 i@47@01))))
  :pattern (($FVF.loc_next ($FVF.lookup_next (as sm@52@01  $FVF<next>) (Seq_index
    nodes@32@01
    i@47@01)) (Seq_index nodes@32@01 i@47@01)))
  :qid |prog.l19|)))
(assert (List%trigger ($Snap.combine
  ($SortWrappers.Seq<$Ref>To$Snap nodes@32@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<val>To$Snap (as sm@39@01  $FVF<val>))
      ($Snap.combine
        ($SortWrappers.$FVF<next>To$Snap (as sm@46@01  $FVF<next>))
        $Snap.unit)))) this@2@01))
; [eval] length(this) == old(length(this)) + 1
; [eval] length(this)
(push) ; 4
(assert (length%precondition ($Snap.combine
  ($SortWrappers.Seq<$Ref>To$Snap nodes@32@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<val>To$Snap (as sm@39@01  $FVF<val>))
      ($Snap.combine
        ($SortWrappers.$FVF<next>To$Snap (as sm@46@01  $FVF<next>))
        $Snap.unit)))) this@2@01))
(pop) ; 4
; Joined path conditions
(assert (length%precondition ($Snap.combine
  ($SortWrappers.Seq<$Ref>To$Snap nodes@32@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<val>To$Snap (as sm@39@01  $FVF<val>))
      ($Snap.combine
        ($SortWrappers.$FVF<next>To$Snap (as sm@46@01  $FVF<next>))
        $Snap.unit)))) this@2@01))
; [eval] old(length(this)) + 1
; [eval] old(length(this))
; [eval] length(this)
(push) ; 4
(pop) ; 4
; Joined path conditions
(push) ; 4
(assert (not (=
  (length ($Snap.combine
    ($SortWrappers.Seq<$Ref>To$Snap nodes@32@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$FVF<val>To$Snap (as sm@39@01  $FVF<val>))
        ($Snap.combine
          ($SortWrappers.$FVF<next>To$Snap (as sm@46@01  $FVF<next>))
          $Snap.unit)))) this@2@01)
  (+ (length ($Snap.first $t@4@01) this@2@01) 1))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (=
  (length ($Snap.combine
    ($SortWrappers.Seq<$Ref>To$Snap nodes@32@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$FVF<val>To$Snap (as sm@39@01  $FVF<val>))
        ($Snap.combine
          ($SortWrappers.$FVF<next>To$Snap (as sm@46@01  $FVF<next>))
          $Snap.unit)))) this@2@01)
  (+ (length ($Snap.first $t@4@01) this@2@01) 1)))
; [eval] itemAt(this, length(this) - 1) == elem
; [eval] itemAt(this, length(this) - 1)
; [eval] length(this) - 1
; [eval] length(this)
(push) ; 4
(pop) ; 4
; Joined path conditions
(push) ; 4
; [eval] 0 <= index
(push) ; 5
(assert (not (<=
  0
  (-
    (length ($Snap.combine
      ($SortWrappers.Seq<$Ref>To$Snap nodes@32@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$FVF<val>To$Snap (as sm@39@01  $FVF<val>))
          ($Snap.combine
            ($SortWrappers.$FVF<next>To$Snap (as sm@46@01  $FVF<next>))
            $Snap.unit)))) this@2@01)
    1))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (<=
  0
  (-
    (length ($Snap.combine
      ($SortWrappers.Seq<$Ref>To$Snap nodes@32@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$FVF<val>To$Snap (as sm@39@01  $FVF<val>))
          ($Snap.combine
            ($SortWrappers.$FVF<next>To$Snap (as sm@46@01  $FVF<next>))
            $Snap.unit)))) this@2@01)
    1)))
; [eval] index < length(this)
; [eval] length(this)
(push) ; 5
(pop) ; 5
; Joined path conditions
(push) ; 5
(assert (not (<
  (-
    (length ($Snap.combine
      ($SortWrappers.Seq<$Ref>To$Snap nodes@32@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$FVF<val>To$Snap (as sm@39@01  $FVF<val>))
          ($Snap.combine
            ($SortWrappers.$FVF<next>To$Snap (as sm@46@01  $FVF<next>))
            $Snap.unit)))) this@2@01)
    1)
  (length ($Snap.combine
    ($SortWrappers.Seq<$Ref>To$Snap nodes@32@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$FVF<val>To$Snap (as sm@39@01  $FVF<val>))
        ($Snap.combine
          ($SortWrappers.$FVF<next>To$Snap (as sm@46@01  $FVF<next>))
          $Snap.unit)))) this@2@01))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (<
  (-
    (length ($Snap.combine
      ($SortWrappers.Seq<$Ref>To$Snap nodes@32@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$FVF<val>To$Snap (as sm@39@01  $FVF<val>))
          ($Snap.combine
            ($SortWrappers.$FVF<next>To$Snap (as sm@46@01  $FVF<next>))
            $Snap.unit)))) this@2@01)
    1)
  (length ($Snap.combine
    ($SortWrappers.Seq<$Ref>To$Snap nodes@32@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$FVF<val>To$Snap (as sm@39@01  $FVF<val>))
        ($Snap.combine
          ($SortWrappers.$FVF<next>To$Snap (as sm@46@01  $FVF<next>))
          $Snap.unit)))) this@2@01)))
(assert (itemAt%precondition ($Snap.combine
  ($Snap.combine
    ($SortWrappers.Seq<$Ref>To$Snap nodes@32@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$FVF<val>To$Snap (as sm@39@01  $FVF<val>))
        ($Snap.combine
          ($SortWrappers.$FVF<next>To$Snap (as sm@46@01  $FVF<next>))
          $Snap.unit))))
  ($Snap.combine $Snap.unit $Snap.unit)) this@2@01 (-
  (length ($Snap.combine
    ($SortWrappers.Seq<$Ref>To$Snap nodes@32@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$FVF<val>To$Snap (as sm@39@01  $FVF<val>))
        ($Snap.combine
          ($SortWrappers.$FVF<next>To$Snap (as sm@46@01  $FVF<next>))
          $Snap.unit)))) this@2@01)
  1)))
(pop) ; 4
; Joined path conditions
(assert (and
  (<=
    0
    (-
      (length ($Snap.combine
        ($SortWrappers.Seq<$Ref>To$Snap nodes@32@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.$FVF<val>To$Snap (as sm@39@01  $FVF<val>))
            ($Snap.combine
              ($SortWrappers.$FVF<next>To$Snap (as sm@46@01  $FVF<next>))
              $Snap.unit)))) this@2@01)
      1))
  (<
    (-
      (length ($Snap.combine
        ($SortWrappers.Seq<$Ref>To$Snap nodes@32@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.$FVF<val>To$Snap (as sm@39@01  $FVF<val>))
            ($Snap.combine
              ($SortWrappers.$FVF<next>To$Snap (as sm@46@01  $FVF<next>))
              $Snap.unit)))) this@2@01)
      1)
    (length ($Snap.combine
      ($SortWrappers.Seq<$Ref>To$Snap nodes@32@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$FVF<val>To$Snap (as sm@39@01  $FVF<val>))
          ($Snap.combine
            ($SortWrappers.$FVF<next>To$Snap (as sm@46@01  $FVF<next>))
            $Snap.unit)))) this@2@01))
  (itemAt%precondition ($Snap.combine
    ($Snap.combine
      ($SortWrappers.Seq<$Ref>To$Snap nodes@32@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$FVF<val>To$Snap (as sm@39@01  $FVF<val>))
          ($Snap.combine
            ($SortWrappers.$FVF<next>To$Snap (as sm@46@01  $FVF<next>))
            $Snap.unit))))
    ($Snap.combine $Snap.unit $Snap.unit)) this@2@01 (-
    (length ($Snap.combine
      ($SortWrappers.Seq<$Ref>To$Snap nodes@32@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$FVF<val>To$Snap (as sm@39@01  $FVF<val>))
          ($Snap.combine
            ($SortWrappers.$FVF<next>To$Snap (as sm@46@01  $FVF<next>))
            $Snap.unit)))) this@2@01)
    1))))
(push) ; 4
(assert (not (=
  (itemAt ($Snap.combine
    ($Snap.combine
      ($SortWrappers.Seq<$Ref>To$Snap nodes@32@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$FVF<val>To$Snap (as sm@39@01  $FVF<val>))
          ($Snap.combine
            ($SortWrappers.$FVF<next>To$Snap (as sm@46@01  $FVF<next>))
            $Snap.unit))))
    ($Snap.combine $Snap.unit $Snap.unit)) this@2@01 (-
    (length ($Snap.combine
      ($SortWrappers.Seq<$Ref>To$Snap nodes@32@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$FVF<val>To$Snap (as sm@39@01  $FVF<val>))
          ($Snap.combine
            ($SortWrappers.$FVF<next>To$Snap (as sm@46@01  $FVF<next>))
            $Snap.unit)))) this@2@01)
    1))
  elem@3@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (=
  (itemAt ($Snap.combine
    ($Snap.combine
      ($SortWrappers.Seq<$Ref>To$Snap nodes@32@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$FVF<val>To$Snap (as sm@39@01  $FVF<val>))
          ($Snap.combine
            ($SortWrappers.$FVF<next>To$Snap (as sm@46@01  $FVF<next>))
            $Snap.unit))))
    ($Snap.combine $Snap.unit $Snap.unit)) this@2@01 (-
    (length ($Snap.combine
      ($SortWrappers.Seq<$Ref>To$Snap nodes@32@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$FVF<val>To$Snap (as sm@39@01  $FVF<val>))
          ($Snap.combine
            ($SortWrappers.$FVF<next>To$Snap (as sm@46@01  $FVF<next>))
            $Snap.unit)))) this@2@01)
    1))
  elem@3@01))
; [eval] (forall i: Int :: { old(itemAt(this, i)) } 0 <= i && i < length(this) - 1 ==> itemAt(this, i) == old(itemAt(this, i)))
(declare-const i@53@01 Int)
(push) ; 4
; [eval] 0 <= i && i < length(this) - 1 ==> itemAt(this, i) == old(itemAt(this, i))
; [eval] 0 <= i && i < length(this) - 1
; [eval] 0 <= i
(push) ; 5
; [then-branch: 24 | 0 <= i@53@01 | live]
; [else-branch: 24 | !(0 <= i@53@01) | live]
(push) ; 6
; [then-branch: 24 | 0 <= i@53@01]
(assert (<= 0 i@53@01))
; [eval] i < length(this) - 1
; [eval] length(this) - 1
; [eval] length(this)
(push) ; 7
(pop) ; 7
; Joined path conditions
(pop) ; 6
(push) ; 6
; [else-branch: 24 | !(0 <= i@53@01)]
(assert (not (<= 0 i@53@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 i@53@01)) (<= 0 i@53@01)))
(push) ; 5
; [then-branch: 25 | i@53@01 < length((nodes@32@01, (_, (sm@39@01, (sm@46@01, _)))), this@2@01) - 1 && 0 <= i@53@01 | live]
; [else-branch: 25 | !(i@53@01 < length((nodes@32@01, (_, (sm@39@01, (sm@46@01, _)))), this@2@01) - 1 && 0 <= i@53@01) | live]
(push) ; 6
; [then-branch: 25 | i@53@01 < length((nodes@32@01, (_, (sm@39@01, (sm@46@01, _)))), this@2@01) - 1 && 0 <= i@53@01]
(assert (and
  (<
    i@53@01
    (-
      (length ($Snap.combine
        ($SortWrappers.Seq<$Ref>To$Snap nodes@32@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.$FVF<val>To$Snap (as sm@39@01  $FVF<val>))
            ($Snap.combine
              ($SortWrappers.$FVF<next>To$Snap (as sm@46@01  $FVF<next>))
              $Snap.unit)))) this@2@01)
      1))
  (<= 0 i@53@01)))
; [eval] itemAt(this, i) == old(itemAt(this, i))
; [eval] itemAt(this, i)
(push) ; 7
; [eval] 0 <= index
; [eval] index < length(this)
; [eval] length(this)
(push) ; 8
(pop) ; 8
; Joined path conditions
(push) ; 8
(assert (not (<
  i@53@01
  (length ($Snap.combine
    ($SortWrappers.Seq<$Ref>To$Snap nodes@32@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$FVF<val>To$Snap (as sm@39@01  $FVF<val>))
        ($Snap.combine
          ($SortWrappers.$FVF<next>To$Snap (as sm@46@01  $FVF<next>))
          $Snap.unit)))) this@2@01))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (<
  i@53@01
  (length ($Snap.combine
    ($SortWrappers.Seq<$Ref>To$Snap nodes@32@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$FVF<val>To$Snap (as sm@39@01  $FVF<val>))
        ($Snap.combine
          ($SortWrappers.$FVF<next>To$Snap (as sm@46@01  $FVF<next>))
          $Snap.unit)))) this@2@01)))
(assert (itemAt%precondition ($Snap.combine
  ($Snap.combine
    ($SortWrappers.Seq<$Ref>To$Snap nodes@32@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$FVF<val>To$Snap (as sm@39@01  $FVF<val>))
        ($Snap.combine
          ($SortWrappers.$FVF<next>To$Snap (as sm@46@01  $FVF<next>))
          $Snap.unit))))
  ($Snap.combine $Snap.unit $Snap.unit)) this@2@01 i@53@01))
(pop) ; 7
; Joined path conditions
(assert (and
  (<
    i@53@01
    (length ($Snap.combine
      ($SortWrappers.Seq<$Ref>To$Snap nodes@32@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$FVF<val>To$Snap (as sm@39@01  $FVF<val>))
          ($Snap.combine
            ($SortWrappers.$FVF<next>To$Snap (as sm@46@01  $FVF<next>))
            $Snap.unit)))) this@2@01))
  (itemAt%precondition ($Snap.combine
    ($Snap.combine
      ($SortWrappers.Seq<$Ref>To$Snap nodes@32@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$FVF<val>To$Snap (as sm@39@01  $FVF<val>))
          ($Snap.combine
            ($SortWrappers.$FVF<next>To$Snap (as sm@46@01  $FVF<next>))
            $Snap.unit))))
    ($Snap.combine $Snap.unit $Snap.unit)) this@2@01 i@53@01)))
; [eval] old(itemAt(this, i))
; [eval] itemAt(this, i)
(push) ; 7
; [eval] 0 <= index
; [eval] index < length(this)
; [eval] length(this)
(push) ; 8
(pop) ; 8
; Joined path conditions
(push) ; 8
(assert (not (< i@53@01 (length ($Snap.first $t@4@01) this@2@01))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (< i@53@01 (length ($Snap.first $t@4@01) this@2@01)))
(assert (itemAt%precondition ($Snap.combine
  ($Snap.first $t@4@01)
  ($Snap.combine $Snap.unit $Snap.unit)) this@2@01 i@53@01))
(pop) ; 7
; Joined path conditions
(assert (and
  (< i@53@01 (length ($Snap.first $t@4@01) this@2@01))
  (itemAt%precondition ($Snap.combine
    ($Snap.first $t@4@01)
    ($Snap.combine $Snap.unit $Snap.unit)) this@2@01 i@53@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 25 | !(i@53@01 < length((nodes@32@01, (_, (sm@39@01, (sm@46@01, _)))), this@2@01) - 1 && 0 <= i@53@01)]
(assert (not
  (and
    (<
      i@53@01
      (-
        (length ($Snap.combine
          ($SortWrappers.Seq<$Ref>To$Snap nodes@32@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($SortWrappers.$FVF<val>To$Snap (as sm@39@01  $FVF<val>))
              ($Snap.combine
                ($SortWrappers.$FVF<next>To$Snap (as sm@46@01  $FVF<next>))
                $Snap.unit)))) this@2@01)
        1))
    (<= 0 i@53@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (<
      i@53@01
      (-
        (length ($Snap.combine
          ($SortWrappers.Seq<$Ref>To$Snap nodes@32@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($SortWrappers.$FVF<val>To$Snap (as sm@39@01  $FVF<val>))
              ($Snap.combine
                ($SortWrappers.$FVF<next>To$Snap (as sm@46@01  $FVF<next>))
                $Snap.unit)))) this@2@01)
        1))
    (<= 0 i@53@01))
  (and
    (<
      i@53@01
      (-
        (length ($Snap.combine
          ($SortWrappers.Seq<$Ref>To$Snap nodes@32@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($SortWrappers.$FVF<val>To$Snap (as sm@39@01  $FVF<val>))
              ($Snap.combine
                ($SortWrappers.$FVF<next>To$Snap (as sm@46@01  $FVF<next>))
                $Snap.unit)))) this@2@01)
        1))
    (<= 0 i@53@01)
    (<
      i@53@01
      (length ($Snap.combine
        ($SortWrappers.Seq<$Ref>To$Snap nodes@32@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.$FVF<val>To$Snap (as sm@39@01  $FVF<val>))
            ($Snap.combine
              ($SortWrappers.$FVF<next>To$Snap (as sm@46@01  $FVF<next>))
              $Snap.unit)))) this@2@01))
    (itemAt%precondition ($Snap.combine
      ($Snap.combine
        ($SortWrappers.Seq<$Ref>To$Snap nodes@32@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.$FVF<val>To$Snap (as sm@39@01  $FVF<val>))
            ($Snap.combine
              ($SortWrappers.$FVF<next>To$Snap (as sm@46@01  $FVF<next>))
              $Snap.unit))))
      ($Snap.combine $Snap.unit $Snap.unit)) this@2@01 i@53@01)
    (< i@53@01 (length ($Snap.first $t@4@01) this@2@01))
    (itemAt%precondition ($Snap.combine
      ($Snap.first $t@4@01)
      ($Snap.combine $Snap.unit $Snap.unit)) this@2@01 i@53@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (<
        i@53@01
        (-
          (length ($Snap.combine
            ($SortWrappers.Seq<$Ref>To$Snap nodes@32@01)
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                ($SortWrappers.$FVF<val>To$Snap (as sm@39@01  $FVF<val>))
                ($Snap.combine
                  ($SortWrappers.$FVF<next>To$Snap (as sm@46@01  $FVF<next>))
                  $Snap.unit)))) this@2@01)
          1))
      (<= 0 i@53@01)))
  (and
    (<
      i@53@01
      (-
        (length ($Snap.combine
          ($SortWrappers.Seq<$Ref>To$Snap nodes@32@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($SortWrappers.$FVF<val>To$Snap (as sm@39@01  $FVF<val>))
              ($Snap.combine
                ($SortWrappers.$FVF<next>To$Snap (as sm@46@01  $FVF<next>))
                $Snap.unit)))) this@2@01)
        1))
    (<= 0 i@53@01))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@53@01 Int)) (!
  (and
    (or (not (<= 0 i@53@01)) (<= 0 i@53@01))
    (=>
      (and
        (<
          i@53@01
          (-
            (length ($Snap.combine
              ($SortWrappers.Seq<$Ref>To$Snap nodes@32@01)
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  ($SortWrappers.$FVF<val>To$Snap (as sm@39@01  $FVF<val>))
                  ($Snap.combine
                    ($SortWrappers.$FVF<next>To$Snap (as sm@46@01  $FVF<next>))
                    $Snap.unit)))) this@2@01)
            1))
        (<= 0 i@53@01))
      (and
        (<
          i@53@01
          (-
            (length ($Snap.combine
              ($SortWrappers.Seq<$Ref>To$Snap nodes@32@01)
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  ($SortWrappers.$FVF<val>To$Snap (as sm@39@01  $FVF<val>))
                  ($Snap.combine
                    ($SortWrappers.$FVF<next>To$Snap (as sm@46@01  $FVF<next>))
                    $Snap.unit)))) this@2@01)
            1))
        (<= 0 i@53@01)
        (<
          i@53@01
          (length ($Snap.combine
            ($SortWrappers.Seq<$Ref>To$Snap nodes@32@01)
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                ($SortWrappers.$FVF<val>To$Snap (as sm@39@01  $FVF<val>))
                ($Snap.combine
                  ($SortWrappers.$FVF<next>To$Snap (as sm@46@01  $FVF<next>))
                  $Snap.unit)))) this@2@01))
        (itemAt%precondition ($Snap.combine
          ($Snap.combine
            ($SortWrappers.Seq<$Ref>To$Snap nodes@32@01)
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                ($SortWrappers.$FVF<val>To$Snap (as sm@39@01  $FVF<val>))
                ($Snap.combine
                  ($SortWrappers.$FVF<next>To$Snap (as sm@46@01  $FVF<next>))
                  $Snap.unit))))
          ($Snap.combine $Snap.unit $Snap.unit)) this@2@01 i@53@01)
        (< i@53@01 (length ($Snap.first $t@4@01) this@2@01))
        (itemAt%precondition ($Snap.combine
          ($Snap.first $t@4@01)
          ($Snap.combine $Snap.unit $Snap.unit)) this@2@01 i@53@01)))
    (or
      (not
        (and
          (<
            i@53@01
            (-
              (length ($Snap.combine
                ($SortWrappers.Seq<$Ref>To$Snap nodes@32@01)
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    ($SortWrappers.$FVF<val>To$Snap (as sm@39@01  $FVF<val>))
                    ($Snap.combine
                      ($SortWrappers.$FVF<next>To$Snap (as sm@46@01  $FVF<next>))
                      $Snap.unit)))) this@2@01)
              1))
          (<= 0 i@53@01)))
      (and
        (<
          i@53@01
          (-
            (length ($Snap.combine
              ($SortWrappers.Seq<$Ref>To$Snap nodes@32@01)
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  ($SortWrappers.$FVF<val>To$Snap (as sm@39@01  $FVF<val>))
                  ($Snap.combine
                    ($SortWrappers.$FVF<next>To$Snap (as sm@46@01  $FVF<next>))
                    $Snap.unit)))) this@2@01)
            1))
        (<= 0 i@53@01))))
  :pattern ((itemAt%limited ($Snap.combine
    ($Snap.first $t@4@01)
    ($Snap.combine $Snap.unit $Snap.unit)) this@2@01 i@53@01))
  :qid |prog.l43-aux|)))
(assert (forall ((i@53@01 Int)) (!
  (and
    (length%precondition ($Snap.combine
      ($SortWrappers.Seq<$Ref>To$Snap nodes@32@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$FVF<val>To$Snap (as sm@39@01  $FVF<val>))
          ($Snap.combine
            ($SortWrappers.$FVF<next>To$Snap (as sm@46@01  $FVF<next>))
            $Snap.unit)))) this@2@01)
    (=>
      (and
        (<
          i@53@01
          (-
            (length ($Snap.combine
              ($SortWrappers.Seq<$Ref>To$Snap nodes@32@01)
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  ($SortWrappers.$FVF<val>To$Snap (as sm@39@01  $FVF<val>))
                  ($Snap.combine
                    ($SortWrappers.$FVF<next>To$Snap (as sm@46@01  $FVF<next>))
                    $Snap.unit)))) this@2@01)
            1))
        (<= 0 i@53@01))
      (and
        (itemAt%precondition ($Snap.combine
          ($Snap.combine
            ($SortWrappers.Seq<$Ref>To$Snap nodes@32@01)
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                ($SortWrappers.$FVF<val>To$Snap (as sm@39@01  $FVF<val>))
                ($Snap.combine
                  ($SortWrappers.$FVF<next>To$Snap (as sm@46@01  $FVF<next>))
                  $Snap.unit))))
          ($Snap.combine $Snap.unit $Snap.unit)) this@2@01 i@53@01)
        (itemAt%precondition ($Snap.combine
          ($Snap.first $t@4@01)
          ($Snap.combine $Snap.unit $Snap.unit)) this@2@01 i@53@01))))
  :pattern ((itemAt%limited ($Snap.combine
    ($Snap.first $t@4@01)
    ($Snap.combine $Snap.unit $Snap.unit)) this@2@01 i@53@01))
  :qid |prog.l43_precondition|)))
(push) ; 4
(assert (not (forall ((i@53@01 Int)) (!
  (=>
    (and
      (and
        (length%precondition ($Snap.combine
          ($SortWrappers.Seq<$Ref>To$Snap nodes@32@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($SortWrappers.$FVF<val>To$Snap (as sm@39@01  $FVF<val>))
              ($Snap.combine
                ($SortWrappers.$FVF<next>To$Snap (as sm@46@01  $FVF<next>))
                $Snap.unit)))) this@2@01)
        (=>
          (and
            (<
              i@53@01
              (-
                (length ($Snap.combine
                  ($SortWrappers.Seq<$Ref>To$Snap nodes@32@01)
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      ($SortWrappers.$FVF<val>To$Snap (as sm@39@01  $FVF<val>))
                      ($Snap.combine
                        ($SortWrappers.$FVF<next>To$Snap (as sm@46@01  $FVF<next>))
                        $Snap.unit)))) this@2@01)
                1))
            (<= 0 i@53@01))
          (and
            (itemAt%precondition ($Snap.combine
              ($Snap.combine
                ($SortWrappers.Seq<$Ref>To$Snap nodes@32@01)
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    ($SortWrappers.$FVF<val>To$Snap (as sm@39@01  $FVF<val>))
                    ($Snap.combine
                      ($SortWrappers.$FVF<next>To$Snap (as sm@46@01  $FVF<next>))
                      $Snap.unit))))
              ($Snap.combine $Snap.unit $Snap.unit)) this@2@01 i@53@01)
            (itemAt%precondition ($Snap.combine
              ($Snap.first $t@4@01)
              ($Snap.combine $Snap.unit $Snap.unit)) this@2@01 i@53@01))))
      (and
        (<
          i@53@01
          (-
            (length ($Snap.combine
              ($SortWrappers.Seq<$Ref>To$Snap nodes@32@01)
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  ($SortWrappers.$FVF<val>To$Snap (as sm@39@01  $FVF<val>))
                  ($Snap.combine
                    ($SortWrappers.$FVF<next>To$Snap (as sm@46@01  $FVF<next>))
                    $Snap.unit)))) this@2@01)
            1))
        (<= 0 i@53@01)))
    (=
      (itemAt ($Snap.combine
        ($Snap.combine
          ($SortWrappers.Seq<$Ref>To$Snap nodes@32@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($SortWrappers.$FVF<val>To$Snap (as sm@39@01  $FVF<val>))
              ($Snap.combine
                ($SortWrappers.$FVF<next>To$Snap (as sm@46@01  $FVF<next>))
                $Snap.unit))))
        ($Snap.combine $Snap.unit $Snap.unit)) this@2@01 i@53@01)
      (itemAt ($Snap.combine
        ($Snap.first $t@4@01)
        ($Snap.combine $Snap.unit $Snap.unit)) this@2@01 i@53@01)))
  :pattern ((itemAt%limited ($Snap.combine
    ($Snap.first $t@4@01)
    ($Snap.combine $Snap.unit $Snap.unit)) this@2@01 i@53@01))
  :qid |prog.l43|))))
(check-sat)
; unsat
(pop) ; 4
; 0.01s
; (get-info :all-statistics)
(assert (forall ((i@53@01 Int)) (!
  (=>
    (and
      (<
        i@53@01
        (-
          (length ($Snap.combine
            ($SortWrappers.Seq<$Ref>To$Snap nodes@32@01)
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                ($SortWrappers.$FVF<val>To$Snap (as sm@39@01  $FVF<val>))
                ($Snap.combine
                  ($SortWrappers.$FVF<next>To$Snap (as sm@46@01  $FVF<next>))
                  $Snap.unit)))) this@2@01)
          1))
      (<= 0 i@53@01))
    (=
      (itemAt ($Snap.combine
        ($Snap.combine
          ($SortWrappers.Seq<$Ref>To$Snap nodes@32@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($SortWrappers.$FVF<val>To$Snap (as sm@39@01  $FVF<val>))
              ($Snap.combine
                ($SortWrappers.$FVF<next>To$Snap (as sm@46@01  $FVF<next>))
                $Snap.unit))))
        ($Snap.combine $Snap.unit $Snap.unit)) this@2@01 i@53@01)
      (itemAt ($Snap.combine
        ($Snap.first $t@4@01)
        ($Snap.combine $Snap.unit $Snap.unit)) this@2@01 i@53@01)))
  :pattern ((itemAt%limited ($Snap.combine
    ($Snap.first $t@4@01)
    ($Snap.combine $Snap.unit $Snap.unit)) this@2@01 i@53@01))
  :qid |prog.l43|)))
(pop) ; 3
(push) ; 3
; [else-branch: 14 | !(|First:(First:($t@4@01))| > 0)]
(assert (not
  (>
    (Seq_length
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01))))
    0)))
(pop) ; 3
; [eval] !(|this.nodes| > 0)
; [eval] |this.nodes| > 0
; [eval] |this.nodes|
(push) ; 3
(set-option :timeout 10)
(assert (not (>
  (Seq_length
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01))))
  0)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (>
    (Seq_length
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01))))
    0))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [then-branch: 26 | !(|First:(First:($t@4@01))| > 0) | live]
; [else-branch: 26 | |First:(First:($t@4@01))| > 0 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 26 | !(|First:(First:($t@4@01))| > 0)]
(assert (not
  (>
    (Seq_length
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01))))
    0)))
; [exec]
; this.nodes := Seq(n)
; [eval] Seq(n)
(assert (= (Seq_length (Seq_singleton n@16@01)) 1))
(declare-const nodes@54@01 Seq<$Ref>)
(assert (Seq_equal nodes@54@01 (Seq_singleton n@16@01)))
; [exec]
; fold acc(List(this), write)
; [eval] (forall i: Int, j: Int :: { (i in [0..|this.nodes|)), (j in [0..|this.nodes|)) } { (i in [0..|this.nodes|)), this.nodes[j] } { (j in [0..|this.nodes|)), this.nodes[i] } { this.nodes[i], this.nodes[j] } (i in [0..|this.nodes|)) && ((j in [0..|this.nodes|)) && i != j) ==> this.nodes[i] != this.nodes[j])
(declare-const i@55@01 Int)
(declare-const j@56@01 Int)
(push) ; 4
; [eval] (i in [0..|this.nodes|)) && ((j in [0..|this.nodes|)) && i != j) ==> this.nodes[i] != this.nodes[j]
; [eval] (i in [0..|this.nodes|)) && ((j in [0..|this.nodes|)) && i != j)
; [eval] (i in [0..|this.nodes|))
; [eval] [0..|this.nodes|)
; [eval] |this.nodes|
(push) ; 5
; [then-branch: 27 | i@55@01 in [0..|nodes@54@01|] | live]
; [else-branch: 27 | !(i@55@01 in [0..|nodes@54@01|]) | live]
(push) ; 6
; [then-branch: 27 | i@55@01 in [0..|nodes@54@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) i@55@01))
; [eval] (j in [0..|this.nodes|))
; [eval] [0..|this.nodes|)
; [eval] |this.nodes|
(push) ; 7
; [then-branch: 28 | j@56@01 in [0..|nodes@54@01|] | live]
; [else-branch: 28 | !(j@56@01 in [0..|nodes@54@01|]) | live]
(push) ; 8
; [then-branch: 28 | j@56@01 in [0..|nodes@54@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) j@56@01))
; [eval] i != j
(pop) ; 8
(push) ; 8
; [else-branch: 28 | !(j@56@01 in [0..|nodes@54@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) j@56@01)))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or
  (not (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) j@56@01))
  (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) j@56@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 27 | !(i@55@01 in [0..|nodes@54@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) i@55@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) i@55@01)
  (and
    (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) i@55@01)
    (or
      (not (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) j@56@01))
      (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) j@56@01)))))
; Joined path conditions
(assert (or
  (not (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) i@55@01))
  (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) i@55@01)))
(push) ; 5
; [then-branch: 29 | i@55@01 != j@56@01 && j@56@01 in [0..|nodes@54@01|] && i@55@01 in [0..|nodes@54@01|] | live]
; [else-branch: 29 | !(i@55@01 != j@56@01 && j@56@01 in [0..|nodes@54@01|] && i@55@01 in [0..|nodes@54@01|]) | live]
(push) ; 6
; [then-branch: 29 | i@55@01 != j@56@01 && j@56@01 in [0..|nodes@54@01|] && i@55@01 in [0..|nodes@54@01|]]
(assert (and
  (and
    (not (= i@55@01 j@56@01))
    (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) j@56@01))
  (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) i@55@01)))
; [eval] this.nodes[i] != this.nodes[j]
; [eval] this.nodes[i]
(push) ; 7
(assert (not (>= i@55@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@55@01 (Seq_length nodes@54@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [eval] this.nodes[j]
(push) ; 7
(assert (not (>= j@56@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< j@56@01 (Seq_length nodes@54@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 29 | !(i@55@01 != j@56@01 && j@56@01 in [0..|nodes@54@01|] && i@55@01 in [0..|nodes@54@01|])]
(assert (not
  (and
    (and
      (not (= i@55@01 j@56@01))
      (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) j@56@01))
    (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) i@55@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (and
      (not (= i@55@01 j@56@01))
      (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) j@56@01))
    (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) i@55@01))
  (and
    (not (= i@55@01 j@56@01))
    (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) j@56@01)
    (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) i@55@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (and
        (not (= i@55@01 j@56@01))
        (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) j@56@01))
      (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) i@55@01)))
  (and
    (and
      (not (= i@55@01 j@56@01))
      (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) j@56@01))
    (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) i@55@01))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@55@01 Int) (j@56@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) i@55@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) i@55@01)
        (or
          (not (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) j@56@01))
          (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) j@56@01))))
    (or
      (not (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) i@55@01))
      (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) i@55@01))
    (=>
      (and
        (and
          (not (= i@55@01 j@56@01))
          (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) j@56@01))
        (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) i@55@01))
      (and
        (not (= i@55@01 j@56@01))
        (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) j@56@01)
        (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) i@55@01)))
    (or
      (not
        (and
          (and
            (not (= i@55@01 j@56@01))
            (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) j@56@01))
          (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) i@55@01)))
      (and
        (and
          (not (= i@55@01 j@56@01))
          (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) j@56@01))
        (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) i@55@01))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) i@55@01) (Seq_contains
    (Seq_range 0 (Seq_length nodes@54@01))
    j@56@01))
  :qid |prog.l16-aux|)))
(assert (forall ((i@55@01 Int) (j@56@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) i@55@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) i@55@01)
        (or
          (not (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) j@56@01))
          (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) j@56@01))))
    (or
      (not (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) i@55@01))
      (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) i@55@01))
    (=>
      (and
        (and
          (not (= i@55@01 j@56@01))
          (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) j@56@01))
        (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) i@55@01))
      (and
        (not (= i@55@01 j@56@01))
        (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) j@56@01)
        (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) i@55@01)))
    (or
      (not
        (and
          (and
            (not (= i@55@01 j@56@01))
            (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) j@56@01))
          (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) i@55@01)))
      (and
        (and
          (not (= i@55@01 j@56@01))
          (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) j@56@01))
        (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) i@55@01))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) i@55@01) (Seq_index
    nodes@54@01
    j@56@01))
  :qid |prog.l16-aux|)))
(assert (forall ((i@55@01 Int) (j@56@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) i@55@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) i@55@01)
        (or
          (not (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) j@56@01))
          (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) j@56@01))))
    (or
      (not (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) i@55@01))
      (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) i@55@01))
    (=>
      (and
        (and
          (not (= i@55@01 j@56@01))
          (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) j@56@01))
        (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) i@55@01))
      (and
        (not (= i@55@01 j@56@01))
        (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) j@56@01)
        (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) i@55@01)))
    (or
      (not
        (and
          (and
            (not (= i@55@01 j@56@01))
            (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) j@56@01))
          (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) i@55@01)))
      (and
        (and
          (not (= i@55@01 j@56@01))
          (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) j@56@01))
        (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) i@55@01))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) j@56@01) (Seq_index
    nodes@54@01
    i@55@01))
  :qid |prog.l16-aux|)))
(assert (forall ((i@55@01 Int) (j@56@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) i@55@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) i@55@01)
        (or
          (not (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) j@56@01))
          (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) j@56@01))))
    (or
      (not (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) i@55@01))
      (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) i@55@01))
    (=>
      (and
        (and
          (not (= i@55@01 j@56@01))
          (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) j@56@01))
        (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) i@55@01))
      (and
        (not (= i@55@01 j@56@01))
        (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) j@56@01)
        (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) i@55@01)))
    (or
      (not
        (and
          (and
            (not (= i@55@01 j@56@01))
            (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) j@56@01))
          (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) i@55@01)))
      (and
        (and
          (not (= i@55@01 j@56@01))
          (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) j@56@01))
        (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) i@55@01))))
  :pattern ((Seq_index nodes@54@01 i@55@01) (Seq_index nodes@54@01 j@56@01))
  :qid |prog.l16-aux|)))
(push) ; 4
(assert (not (forall ((i@55@01 Int) (j@56@01 Int)) (!
  (=>
    (and
      (and
        (not (= i@55@01 j@56@01))
        (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) j@56@01))
      (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) i@55@01))
    (not (= (Seq_index nodes@54@01 i@55@01) (Seq_index nodes@54@01 j@56@01))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) i@55@01) (Seq_contains
    (Seq_range 0 (Seq_length nodes@54@01))
    j@56@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) i@55@01) (Seq_index
    nodes@54@01
    j@56@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) j@56@01) (Seq_index
    nodes@54@01
    i@55@01))
  :pattern ((Seq_index nodes@54@01 i@55@01) (Seq_index nodes@54@01 j@56@01))
  :qid |prog.l16|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (forall ((i@55@01 Int) (j@56@01 Int)) (!
  (=>
    (and
      (and
        (not (= i@55@01 j@56@01))
        (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) j@56@01))
      (Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) i@55@01))
    (not (= (Seq_index nodes@54@01 i@55@01) (Seq_index nodes@54@01 j@56@01))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) i@55@01) (Seq_contains
    (Seq_range 0 (Seq_length nodes@54@01))
    j@56@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) i@55@01) (Seq_index
    nodes@54@01
    j@56@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length nodes@54@01)) j@56@01) (Seq_index
    nodes@54@01
    i@55@01))
  :pattern ((Seq_index nodes@54@01 i@55@01) (Seq_index nodes@54@01 j@56@01))
  :qid |prog.l16|)))
(declare-const i@57@01 Int)
(push) ; 4
; [eval] 0 <= i && i < |this.nodes|
; [eval] 0 <= i
(push) ; 5
; [then-branch: 30 | 0 <= i@57@01 | live]
; [else-branch: 30 | !(0 <= i@57@01) | live]
(push) ; 6
; [then-branch: 30 | 0 <= i@57@01]
(assert (<= 0 i@57@01))
; [eval] i < |this.nodes|
; [eval] |this.nodes|
(pop) ; 6
(push) ; 6
; [else-branch: 30 | !(0 <= i@57@01)]
(assert (not (<= 0 i@57@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 i@57@01)) (<= 0 i@57@01)))
(assert (and (< i@57@01 (Seq_length nodes@54@01)) (<= 0 i@57@01)))
; [eval] this.nodes[i]
(push) ; 5
(assert (not (>= i@57@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@58@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@57@01 Int)) (!
  (=>
    (and (< i@57@01 (Seq_length nodes@54@01)) (<= 0 i@57@01))
    (or (not (<= 0 i@57@01)) (<= 0 i@57@01)))
  :pattern ((Seq_index nodes@54@01 i@57@01))
  :qid |val-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@57@01 Int) (i2@57@01 Int)) (!
  (=>
    (and
      (and (< i1@57@01 (Seq_length nodes@54@01)) (<= 0 i1@57@01))
      (and (< i2@57@01 (Seq_length nodes@54@01)) (<= 0 i2@57@01))
      (= (Seq_index nodes@54@01 i1@57@01) (Seq_index nodes@54@01 i2@57@01)))
    (= i1@57@01 i2@57@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@57@01 Int)) (!
  (=>
    (and (< i@57@01 (Seq_length nodes@54@01)) (<= 0 i@57@01))
    (= (inv@58@01 (Seq_index nodes@54@01 i@57@01)) i@57@01))
  :pattern ((Seq_index nodes@54@01 i@57@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@58@01 r) (Seq_length nodes@54@01)) (<= 0 (inv@58@01 r)))
    (= (Seq_index nodes@54@01 (inv@58@01 r)) r))
  :pattern ((inv@58@01 r))
  :qid |val-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@59@01 ((r $Ref)) $Perm
  (ite
    (and (< (inv@58@01 r) (Seq_length nodes@54@01)) (<= 0 (inv@58@01 r)))
    ($Perm.min
      (ite
        (and
          (<
            (inv@11@01 r)
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
          (<= 0 (inv@11@01 r)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@60@01 ((r $Ref)) $Perm
  (ite
    (and (< (inv@58@01 r) (Seq_length nodes@54@01)) (<= 0 (inv@58@01 r)))
    ($Perm.min
      (ite (= r n@16@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@59@01 r)))
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
        (and
          (<
            (inv@11@01 r)
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
          (<= 0 (inv@11@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@59@01 r))
    $Perm.No)
  
  :qid |quant-u-54|))))
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
    (and (< (inv@58@01 r) (Seq_length nodes@54@01)) (<= 0 (inv@58@01 r)))
    (= (- $Perm.Write (pTaken@59@01 r)) $Perm.No))
  
  :qid |quant-u-55|))))
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
  (- (ite (= n@16@01 n@16@01) $Perm.Write $Perm.No) (pTaken@60@01 n@16@01))
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
    (and (< (inv@58@01 r) (Seq_length nodes@54@01)) (<= 0 (inv@58@01 r)))
    (= (- (- $Perm.Write (pTaken@59@01 r)) (pTaken@60@01 r)) $Perm.No))
  
  :qid |quant-u-57|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@61@01 $FVF<val>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@61@01  $FVF<val>)))
      (and (< (inv@58@01 r) (Seq_length nodes@54@01)) (<= 0 (inv@58@01 r))))
    (=>
      (and (< (inv@58@01 r) (Seq_length nodes@54@01)) (<= 0 (inv@58@01 r)))
      (Set_in r ($FVF.domain_val (as sm@61@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@61@01  $FVF<val>))))
  :qid |qp.fvfDomDef38|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@58@01 r) (Seq_length nodes@54@01)) (<= 0 (inv@58@01 r)))
      (and
        (<
          (inv@11@01 r)
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
        (<= 0 (inv@11@01 r))))
    (=
      ($FVF.lookup_val (as sm@61@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@4@01))))) r)))
  :pattern (($FVF.lookup_val (as sm@61@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.first $t@4@01))))) r))
  :qid |qp.fvfValDef36|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@58@01 r) (Seq_length nodes@54@01)) (<= 0 (inv@58@01 r)))
      (= r n@16@01))
    (=
      ($FVF.lookup_val (as sm@61@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@27@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@61@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@27@01  $FVF<val>) r))
  :qid |qp.fvfValDef37|)))
(declare-const i@62@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] 0 <= i && i < |this.nodes|
; [eval] 0 <= i
(push) ; 5
; [then-branch: 31 | 0 <= i@62@01 | live]
; [else-branch: 31 | !(0 <= i@62@01) | live]
(push) ; 6
; [then-branch: 31 | 0 <= i@62@01]
(assert (<= 0 i@62@01))
; [eval] i < |this.nodes|
; [eval] |this.nodes|
(pop) ; 6
(push) ; 6
; [else-branch: 31 | !(0 <= i@62@01)]
(assert (not (<= 0 i@62@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 i@62@01)) (<= 0 i@62@01)))
(assert (and (< i@62@01 (Seq_length nodes@54@01)) (<= 0 i@62@01)))
; [eval] this.nodes[i]
(push) ; 5
(assert (not (>= i@62@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@63@01 ($Ref) Int)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@62@01 Int)) (!
  (=>
    (and (< i@62@01 (Seq_length nodes@54@01)) (<= 0 i@62@01))
    (or (not (<= 0 i@62@01)) (<= 0 i@62@01)))
  :pattern ((Seq_index nodes@54@01 i@62@01))
  :qid |next-aux|)))
(declare-const sm@64@01 $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<
        (inv@13@01 r)
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
      (<= 0 (inv@13@01 r)))
    (=
      ($FVF.lookup_next (as sm@64@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@64@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r))
  :qid |qp.fvfValDef39|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r n@16@01)
    (=
      ($FVF.lookup_next (as sm@64@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@24@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@64@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@24@01  $FVF<next>) r))
  :qid |qp.fvfValDef40|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r) r)
    ($FVF.loc_next ($FVF.lookup_next (as sm@24@01  $FVF<next>) r) r))
  :pattern (($FVF.lookup_next (as sm@64@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef41|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@62@01 Int) (i2@62@01 Int)) (!
  (=>
    (and
      (and
        (and (< i1@62@01 (Seq_length nodes@54@01)) (<= 0 i1@62@01))
        ($FVF.loc_next ($FVF.lookup_next (as sm@64@01  $FVF<next>) (Seq_index
          nodes@54@01
          i1@62@01)) (Seq_index nodes@54@01 i1@62@01)))
      (and
        (and (< i2@62@01 (Seq_length nodes@54@01)) (<= 0 i2@62@01))
        ($FVF.loc_next ($FVF.lookup_next (as sm@64@01  $FVF<next>) (Seq_index
          nodes@54@01
          i2@62@01)) (Seq_index nodes@54@01 i2@62@01)))
      (= (Seq_index nodes@54@01 i1@62@01) (Seq_index nodes@54@01 i2@62@01)))
    (= i1@62@01 i2@62@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@62@01 Int)) (!
  (=>
    (and (< i@62@01 (Seq_length nodes@54@01)) (<= 0 i@62@01))
    (= (inv@63@01 (Seq_index nodes@54@01 i@62@01)) i@62@01))
  :pattern ((Seq_index nodes@54@01 i@62@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@63@01 r) (Seq_length nodes@54@01)) (<= 0 (inv@63@01 r)))
    (= (Seq_index nodes@54@01 (inv@63@01 r)) r))
  :pattern ((inv@63@01 r))
  :qid |next-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (< (inv@63@01 r) (Seq_length nodes@54@01)) (<= 0 (inv@63@01 r)))
    ($FVF.loc_next ($FVF.lookup_next (as sm@64@01  $FVF<next>) r) r))
  :pattern ((inv@63@01 r))
  :qid |quant-u-59|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@65@01 ((r $Ref)) $Perm
  (ite
    (and (< (inv@63@01 r) (Seq_length nodes@54@01)) (<= 0 (inv@63@01 r)))
    ($Perm.min
      (ite
        (and
          (<
            (inv@13@01 r)
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
          (<= 0 (inv@13@01 r)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@66@01 ((r $Ref)) $Perm
  (ite
    (and (< (inv@63@01 r) (Seq_length nodes@54@01)) (<= 0 (inv@63@01 r)))
    ($Perm.min
      (ite (= r n@16@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@65@01 r)))
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
        (and
          (<
            (inv@13@01 r)
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
          (<= 0 (inv@13@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@65@01 r))
    $Perm.No)
  
  :qid |quant-u-61|))))
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
    (and (< (inv@63@01 r) (Seq_length nodes@54@01)) (<= 0 (inv@63@01 r)))
    (= (- $Perm.Write (pTaken@65@01 r)) $Perm.No))
  
  :qid |quant-u-62|))))
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
  (- (ite (= n@16@01 n@16@01) $Perm.Write $Perm.No) (pTaken@66@01 n@16@01))
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
    (and (< (inv@63@01 r) (Seq_length nodes@54@01)) (<= 0 (inv@63@01 r)))
    (= (- (- $Perm.Write (pTaken@65@01 r)) (pTaken@66@01 r)) $Perm.No))
  
  :qid |quant-u-64|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@67@01 $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@67@01  $FVF<next>)))
      (and (< (inv@63@01 r) (Seq_length nodes@54@01)) (<= 0 (inv@63@01 r))))
    (=>
      (and (< (inv@63@01 r) (Seq_length nodes@54@01)) (<= 0 (inv@63@01 r)))
      (Set_in r ($FVF.domain_next (as sm@67@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@67@01  $FVF<next>))))
  :qid |qp.fvfDomDef45|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@63@01 r) (Seq_length nodes@54@01)) (<= 0 (inv@63@01 r)))
      (and
        (<
          (inv@13@01 r)
          (Seq_length
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
        (<= 0 (inv@13@01 r))))
    (=
      ($FVF.lookup_next (as sm@67@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@67@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r))
  :qid |qp.fvfValDef42|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (< (inv@63@01 r) (Seq_length nodes@54@01)) (<= 0 (inv@63@01 r)))
      (= r n@16@01))
    (=
      ($FVF.lookup_next (as sm@67@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@24@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@67@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@24@01  $FVF<next>) r))
  :qid |qp.fvfValDef43|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r) r)
    ($FVF.loc_next ($FVF.lookup_next (as sm@24@01  $FVF<next>) r) r))
  :pattern (($FVF.lookup_next (as sm@67@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef44|)))
; [eval] (forall i: Int :: { this.nodes[i].next } 0 <= i && i < |this.nodes| ==> (this.nodes[i] in this.nodes) && (i < |this.nodes| - 1 ? this.nodes[i].next == this.nodes[i + 1] : this.nodes[i].next == null))
(declare-const i@68@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] 0 <= i && i < |this.nodes| ==> (this.nodes[i] in this.nodes) && (i < |this.nodes| - 1 ? this.nodes[i].next == this.nodes[i + 1] : this.nodes[i].next == null)
; [eval] 0 <= i && i < |this.nodes|
; [eval] 0 <= i
(push) ; 5
; [then-branch: 32 | 0 <= i@68@01 | live]
; [else-branch: 32 | !(0 <= i@68@01) | live]
(push) ; 6
; [then-branch: 32 | 0 <= i@68@01]
(assert (<= 0 i@68@01))
; [eval] i < |this.nodes|
; [eval] |this.nodes|
(pop) ; 6
(push) ; 6
; [else-branch: 32 | !(0 <= i@68@01)]
(assert (not (<= 0 i@68@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 i@68@01)) (<= 0 i@68@01)))
(push) ; 5
; [then-branch: 33 | i@68@01 < |nodes@54@01| && 0 <= i@68@01 | live]
; [else-branch: 33 | !(i@68@01 < |nodes@54@01| && 0 <= i@68@01) | live]
(push) ; 6
; [then-branch: 33 | i@68@01 < |nodes@54@01| && 0 <= i@68@01]
(assert (and (< i@68@01 (Seq_length nodes@54@01)) (<= 0 i@68@01)))
; [eval] (this.nodes[i] in this.nodes) && (i < |this.nodes| - 1 ? this.nodes[i].next == this.nodes[i + 1] : this.nodes[i].next == null)
; [eval] (this.nodes[i] in this.nodes)
; [eval] this.nodes[i]
(push) ; 7
(assert (not (>= i@68@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(push) ; 7
; [then-branch: 34 | nodes@54@01[i@68@01] in nodes@54@01 | live]
; [else-branch: 34 | !(nodes@54@01[i@68@01] in nodes@54@01) | live]
(push) ; 8
; [then-branch: 34 | nodes@54@01[i@68@01] in nodes@54@01]
(assert (Seq_contains nodes@54@01 (Seq_index nodes@54@01 i@68@01)))
; [eval] (i < |this.nodes| - 1 ? this.nodes[i].next == this.nodes[i + 1] : this.nodes[i].next == null)
; [eval] i < |this.nodes| - 1
; [eval] |this.nodes| - 1
; [eval] |this.nodes|
(push) ; 9
; [then-branch: 35 | i@68@01 < |nodes@54@01| - 1 | live]
; [else-branch: 35 | !(i@68@01 < |nodes@54@01| - 1) | live]
(push) ; 10
; [then-branch: 35 | i@68@01 < |nodes@54@01| - 1]
(assert (< i@68@01 (- (Seq_length nodes@54@01) 1)))
; [eval] this.nodes[i].next == this.nodes[i + 1]
; [eval] this.nodes[i]
(push) ; 11
(assert (not (>= i@68@01 0)))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(declare-const sm@69@01 $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r n@16@01)
    (=
      ($FVF.lookup_next (as sm@69@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@24@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@69@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@24@01  $FVF<next>) r))
  :qid |qp.fvfValDef46|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<
        (inv@13@01 r)
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
      (<= 0 (inv@13@01 r)))
    (=
      ($FVF.lookup_next (as sm@69@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@69@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r))
  :qid |qp.fvfValDef47|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@24@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r) r))
  :pattern (($FVF.lookup_next (as sm@69@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef48|)))
(declare-const pm@70@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@70@01  $FPM) r)
    (+
      (ite (= r n@16@01) $Perm.Write $Perm.No)
      (ite
        (and
          (<
            (inv@13@01 r)
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
          (<= 0 (inv@13@01 r)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_next (as pm@70@01  $FPM) r))
  :qid |qp.resPrmSumDef49|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@69@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next (as sm@24@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r) r))
  :pattern (($FVF.perm_next (as pm@70@01  $FPM) r))
  :qid |qp.resTrgDef50|)))
(assert ($FVF.loc_next ($FVF.lookup_next (as sm@69@01  $FVF<next>) (Seq_index
  nodes@54@01
  i@68@01)) (Seq_index nodes@54@01 i@68@01)))
(push) ; 11
(assert (not (< $Perm.No ($FVF.perm_next (as pm@70@01  $FPM) (Seq_index nodes@54@01 i@68@01)))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [eval] this.nodes[i + 1]
; [eval] i + 1
(push) ; 11
(assert (not (>= (+ i@68@01 1) 0)))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(push) ; 11
(assert (not (< (+ i@68@01 1) (Seq_length nodes@54@01))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(pop) ; 10
(push) ; 10
; [else-branch: 35 | !(i@68@01 < |nodes@54@01| - 1)]
(assert (not (< i@68@01 (- (Seq_length nodes@54@01) 1))))
; [eval] this.nodes[i].next == null
; [eval] this.nodes[i]
(push) ; 11
(assert (not (>= i@68@01 0)))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(declare-const sm@71@01 $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r n@16@01)
    (=
      ($FVF.lookup_next (as sm@71@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@24@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@71@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@24@01  $FVF<next>) r))
  :qid |qp.fvfValDef51|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<
        (inv@13@01 r)
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
      (<= 0 (inv@13@01 r)))
    (=
      ($FVF.lookup_next (as sm@71@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@71@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r))
  :qid |qp.fvfValDef52|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@24@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r) r))
  :pattern (($FVF.lookup_next (as sm@71@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef53|)))
(declare-const pm@72@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@72@01  $FPM) r)
    (+
      (ite (= r n@16@01) $Perm.Write $Perm.No)
      (ite
        (and
          (<
            (inv@13@01 r)
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
          (<= 0 (inv@13@01 r)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_next (as pm@72@01  $FPM) r))
  :qid |qp.resPrmSumDef54|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@71@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next (as sm@24@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r) r))
  :pattern (($FVF.perm_next (as pm@72@01  $FPM) r))
  :qid |qp.resTrgDef55|)))
(assert ($FVF.loc_next ($FVF.lookup_next (as sm@71@01  $FVF<next>) (Seq_index
  nodes@54@01
  i@68@01)) (Seq_index nodes@54@01 i@68@01)))
(push) ; 11
(assert (not (< $Perm.No ($FVF.perm_next (as pm@72@01  $FPM) (Seq_index nodes@54@01 i@68@01)))))
(check-sat)
; unsat
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(pop) ; 10
(pop) ; 9
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r n@16@01)
    (=
      ($FVF.lookup_next (as sm@69@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@24@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@69@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@24@01  $FVF<next>) r))
  :qid |qp.fvfValDef46|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<
        (inv@13@01 r)
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
      (<= 0 (inv@13@01 r)))
    (=
      ($FVF.lookup_next (as sm@69@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@69@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r))
  :qid |qp.fvfValDef47|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@24@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r) r))
  :pattern (($FVF.lookup_next (as sm@69@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef48|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@70@01  $FPM) r)
    (+
      (ite (= r n@16@01) $Perm.Write $Perm.No)
      (ite
        (and
          (<
            (inv@13@01 r)
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
          (<= 0 (inv@13@01 r)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_next (as pm@70@01  $FPM) r))
  :qid |qp.resPrmSumDef49|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@69@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next (as sm@24@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r) r))
  :pattern (($FVF.perm_next (as pm@70@01  $FPM) r))
  :qid |qp.resTrgDef50|)))
(assert (=>
  (< i@68@01 (- (Seq_length nodes@54@01) 1))
  (and
    (< i@68@01 (- (Seq_length nodes@54@01) 1))
    ($FVF.loc_next ($FVF.lookup_next (as sm@69@01  $FVF<next>) (Seq_index
      nodes@54@01
      i@68@01)) (Seq_index nodes@54@01 i@68@01)))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r n@16@01)
    (=
      ($FVF.lookup_next (as sm@71@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@24@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@71@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@24@01  $FVF<next>) r))
  :qid |qp.fvfValDef51|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<
        (inv@13@01 r)
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
      (<= 0 (inv@13@01 r)))
    (=
      ($FVF.lookup_next (as sm@71@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@71@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r))
  :qid |qp.fvfValDef52|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@24@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r) r))
  :pattern (($FVF.lookup_next (as sm@71@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef53|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@72@01  $FPM) r)
    (+
      (ite (= r n@16@01) $Perm.Write $Perm.No)
      (ite
        (and
          (<
            (inv@13@01 r)
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
          (<= 0 (inv@13@01 r)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_next (as pm@72@01  $FPM) r))
  :qid |qp.resPrmSumDef54|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@71@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next (as sm@24@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r) r))
  :pattern (($FVF.perm_next (as pm@72@01  $FPM) r))
  :qid |qp.resTrgDef55|)))
(assert (=>
  (not (< i@68@01 (- (Seq_length nodes@54@01) 1)))
  (and
    (not (< i@68@01 (- (Seq_length nodes@54@01) 1)))
    ($FVF.loc_next ($FVF.lookup_next (as sm@71@01  $FVF<next>) (Seq_index
      nodes@54@01
      i@68@01)) (Seq_index nodes@54@01 i@68@01)))))
(assert (or
  (not (< i@68@01 (- (Seq_length nodes@54@01) 1)))
  (< i@68@01 (- (Seq_length nodes@54@01) 1))))
(pop) ; 8
(push) ; 8
; [else-branch: 34 | !(nodes@54@01[i@68@01] in nodes@54@01)]
(assert (not (Seq_contains nodes@54@01 (Seq_index nodes@54@01 i@68@01))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r n@16@01)
    (=
      ($FVF.lookup_next (as sm@69@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@24@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@69@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@24@01  $FVF<next>) r))
  :qid |qp.fvfValDef46|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<
        (inv@13@01 r)
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
      (<= 0 (inv@13@01 r)))
    (=
      ($FVF.lookup_next (as sm@69@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@69@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r))
  :qid |qp.fvfValDef47|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@24@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r) r))
  :pattern (($FVF.lookup_next (as sm@69@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef48|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@70@01  $FPM) r)
    (+
      (ite (= r n@16@01) $Perm.Write $Perm.No)
      (ite
        (and
          (<
            (inv@13@01 r)
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
          (<= 0 (inv@13@01 r)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_next (as pm@70@01  $FPM) r))
  :qid |qp.resPrmSumDef49|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@69@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next (as sm@24@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r) r))
  :pattern (($FVF.perm_next (as pm@70@01  $FPM) r))
  :qid |qp.resTrgDef50|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r n@16@01)
    (=
      ($FVF.lookup_next (as sm@71@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@24@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@71@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@24@01  $FVF<next>) r))
  :qid |qp.fvfValDef51|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<
        (inv@13@01 r)
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
      (<= 0 (inv@13@01 r)))
    (=
      ($FVF.lookup_next (as sm@71@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@71@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r))
  :qid |qp.fvfValDef52|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@24@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r) r))
  :pattern (($FVF.lookup_next (as sm@71@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef53|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@72@01  $FPM) r)
    (+
      (ite (= r n@16@01) $Perm.Write $Perm.No)
      (ite
        (and
          (<
            (inv@13@01 r)
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
          (<= 0 (inv@13@01 r)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_next (as pm@72@01  $FPM) r))
  :qid |qp.resPrmSumDef54|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@71@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next (as sm@24@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r) r))
  :pattern (($FVF.perm_next (as pm@72@01  $FPM) r))
  :qid |qp.resTrgDef55|)))
(assert (=>
  (Seq_contains nodes@54@01 (Seq_index nodes@54@01 i@68@01))
  (and
    (Seq_contains nodes@54@01 (Seq_index nodes@54@01 i@68@01))
    (=>
      (< i@68@01 (- (Seq_length nodes@54@01) 1))
      (and
        (< i@68@01 (- (Seq_length nodes@54@01) 1))
        ($FVF.loc_next ($FVF.lookup_next (as sm@69@01  $FVF<next>) (Seq_index
          nodes@54@01
          i@68@01)) (Seq_index nodes@54@01 i@68@01))))
    (=>
      (not (< i@68@01 (- (Seq_length nodes@54@01) 1)))
      (and
        (not (< i@68@01 (- (Seq_length nodes@54@01) 1)))
        ($FVF.loc_next ($FVF.lookup_next (as sm@71@01  $FVF<next>) (Seq_index
          nodes@54@01
          i@68@01)) (Seq_index nodes@54@01 i@68@01))))
    (or
      (not (< i@68@01 (- (Seq_length nodes@54@01) 1)))
      (< i@68@01 (- (Seq_length nodes@54@01) 1))))))
; Joined path conditions
(assert (or
  (not (Seq_contains nodes@54@01 (Seq_index nodes@54@01 i@68@01)))
  (Seq_contains nodes@54@01 (Seq_index nodes@54@01 i@68@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 33 | !(i@68@01 < |nodes@54@01| && 0 <= i@68@01)]
(assert (not (and (< i@68@01 (Seq_length nodes@54@01)) (<= 0 i@68@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r n@16@01)
    (=
      ($FVF.lookup_next (as sm@69@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@24@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@69@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@24@01  $FVF<next>) r))
  :qid |qp.fvfValDef46|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<
        (inv@13@01 r)
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
      (<= 0 (inv@13@01 r)))
    (=
      ($FVF.lookup_next (as sm@69@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@69@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r))
  :qid |qp.fvfValDef47|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@24@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r) r))
  :pattern (($FVF.lookup_next (as sm@69@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef48|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@70@01  $FPM) r)
    (+
      (ite (= r n@16@01) $Perm.Write $Perm.No)
      (ite
        (and
          (<
            (inv@13@01 r)
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
          (<= 0 (inv@13@01 r)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_next (as pm@70@01  $FPM) r))
  :qid |qp.resPrmSumDef49|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@69@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next (as sm@24@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r) r))
  :pattern (($FVF.perm_next (as pm@70@01  $FPM) r))
  :qid |qp.resTrgDef50|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r n@16@01)
    (=
      ($FVF.lookup_next (as sm@71@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@24@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@71@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@24@01  $FVF<next>) r))
  :qid |qp.fvfValDef51|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<
        (inv@13@01 r)
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
      (<= 0 (inv@13@01 r)))
    (=
      ($FVF.lookup_next (as sm@71@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@71@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r))
  :qid |qp.fvfValDef52|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@24@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r) r))
  :pattern (($FVF.lookup_next (as sm@71@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef53|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@72@01  $FPM) r)
    (+
      (ite (= r n@16@01) $Perm.Write $Perm.No)
      (ite
        (and
          (<
            (inv@13@01 r)
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
          (<= 0 (inv@13@01 r)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_next (as pm@72@01  $FPM) r))
  :qid |qp.resPrmSumDef54|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@71@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next (as sm@24@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r) r))
  :pattern (($FVF.perm_next (as pm@72@01  $FPM) r))
  :qid |qp.resTrgDef55|)))
(assert (=>
  (and (< i@68@01 (Seq_length nodes@54@01)) (<= 0 i@68@01))
  (and
    (< i@68@01 (Seq_length nodes@54@01))
    (<= 0 i@68@01)
    (=>
      (Seq_contains nodes@54@01 (Seq_index nodes@54@01 i@68@01))
      (and
        (Seq_contains nodes@54@01 (Seq_index nodes@54@01 i@68@01))
        (=>
          (< i@68@01 (- (Seq_length nodes@54@01) 1))
          (and
            (< i@68@01 (- (Seq_length nodes@54@01) 1))
            ($FVF.loc_next ($FVF.lookup_next (as sm@69@01  $FVF<next>) (Seq_index
              nodes@54@01
              i@68@01)) (Seq_index nodes@54@01 i@68@01))))
        (=>
          (not (< i@68@01 (- (Seq_length nodes@54@01) 1)))
          (and
            (not (< i@68@01 (- (Seq_length nodes@54@01) 1)))
            ($FVF.loc_next ($FVF.lookup_next (as sm@71@01  $FVF<next>) (Seq_index
              nodes@54@01
              i@68@01)) (Seq_index nodes@54@01 i@68@01))))
        (or
          (not (< i@68@01 (- (Seq_length nodes@54@01) 1)))
          (< i@68@01 (- (Seq_length nodes@54@01) 1)))))
    (or
      (not (Seq_contains nodes@54@01 (Seq_index nodes@54@01 i@68@01)))
      (Seq_contains nodes@54@01 (Seq_index nodes@54@01 i@68@01))))))
; Joined path conditions
(assert (or
  (not (and (< i@68@01 (Seq_length nodes@54@01)) (<= 0 i@68@01)))
  (and (< i@68@01 (Seq_length nodes@54@01)) (<= 0 i@68@01))))
(declare-const sm@73@01 $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r n@16@01)
    (=
      ($FVF.lookup_next (as sm@73@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@24@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@73@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@24@01  $FVF<next>) r))
  :qid |qp.fvfValDef56|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<
        (inv@13@01 r)
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
      (<= 0 (inv@13@01 r)))
    (=
      ($FVF.lookup_next (as sm@73@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@73@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r))
  :qid |qp.fvfValDef57|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@24@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r) r))
  :pattern (($FVF.lookup_next (as sm@73@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef58|)))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (= r n@16@01)
    (=
      ($FVF.lookup_next (as sm@69@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@24@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@69@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@24@01  $FVF<next>) r))
  :qid |qp.fvfValDef46|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<
        (inv@13@01 r)
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
      (<= 0 (inv@13@01 r)))
    (=
      ($FVF.lookup_next (as sm@69@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@69@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r))
  :qid |qp.fvfValDef47|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@24@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r) r))
  :pattern (($FVF.lookup_next (as sm@69@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef48|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@70@01  $FPM) r)
    (+
      (ite (= r n@16@01) $Perm.Write $Perm.No)
      (ite
        (and
          (<
            (inv@13@01 r)
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
          (<= 0 (inv@13@01 r)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_next (as pm@70@01  $FPM) r))
  :qid |qp.resPrmSumDef49|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@69@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next (as sm@24@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r) r))
  :pattern (($FVF.perm_next (as pm@70@01  $FPM) r))
  :qid |qp.resTrgDef50|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r n@16@01)
    (=
      ($FVF.lookup_next (as sm@71@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@24@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@71@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@24@01  $FVF<next>) r))
  :qid |qp.fvfValDef51|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<
        (inv@13@01 r)
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
      (<= 0 (inv@13@01 r)))
    (=
      ($FVF.lookup_next (as sm@71@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@71@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r))
  :qid |qp.fvfValDef52|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@24@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r) r))
  :pattern (($FVF.lookup_next (as sm@71@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef53|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@72@01  $FPM) r)
    (+
      (ite (= r n@16@01) $Perm.Write $Perm.No)
      (ite
        (and
          (<
            (inv@13@01 r)
            (Seq_length
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
          (<= 0 (inv@13@01 r)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_next (as pm@72@01  $FPM) r))
  :qid |qp.resPrmSumDef54|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@71@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next (as sm@24@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r) r))
  :pattern (($FVF.perm_next (as pm@72@01  $FPM) r))
  :qid |qp.resTrgDef55|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r n@16@01)
    (=
      ($FVF.lookup_next (as sm@73@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@24@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@73@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@24@01  $FVF<next>) r))
  :qid |qp.fvfValDef56|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (<
        (inv@13@01 r)
        (Seq_length
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01)))))
      (<= 0 (inv@13@01 r)))
    (=
      ($FVF.lookup_next (as sm@73@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r)))
  :pattern (($FVF.lookup_next (as sm@73@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r))
  :qid |qp.fvfValDef57|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_next ($FVF.lookup_next (as sm@24@01  $FVF<next>) r) r)
    ($FVF.loc_next ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first $t@4@01)))))) r) r))
  :pattern (($FVF.lookup_next (as sm@73@01  $FVF<next>) r))
  :qid |qp.fvfResTrgDef58|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@68@01 Int)) (!
  (and
    (or (not (<= 0 i@68@01)) (<= 0 i@68@01))
    (=>
      (and (< i@68@01 (Seq_length nodes@54@01)) (<= 0 i@68@01))
      (and
        (< i@68@01 (Seq_length nodes@54@01))
        (<= 0 i@68@01)
        (=>
          (Seq_contains nodes@54@01 (Seq_index nodes@54@01 i@68@01))
          (and
            (Seq_contains nodes@54@01 (Seq_index nodes@54@01 i@68@01))
            (=>
              (< i@68@01 (- (Seq_length nodes@54@01) 1))
              (and
                (< i@68@01 (- (Seq_length nodes@54@01) 1))
                ($FVF.loc_next ($FVF.lookup_next (as sm@69@01  $FVF<next>) (Seq_index
                  nodes@54@01
                  i@68@01)) (Seq_index nodes@54@01 i@68@01))))
            (=>
              (not (< i@68@01 (- (Seq_length nodes@54@01) 1)))
              (and
                (not (< i@68@01 (- (Seq_length nodes@54@01) 1)))
                ($FVF.loc_next ($FVF.lookup_next (as sm@71@01  $FVF<next>) (Seq_index
                  nodes@54@01
                  i@68@01)) (Seq_index nodes@54@01 i@68@01))))
            (or
              (not (< i@68@01 (- (Seq_length nodes@54@01) 1)))
              (< i@68@01 (- (Seq_length nodes@54@01) 1)))))
        (or
          (not (Seq_contains nodes@54@01 (Seq_index nodes@54@01 i@68@01)))
          (Seq_contains nodes@54@01 (Seq_index nodes@54@01 i@68@01)))))
    (or
      (not (and (< i@68@01 (Seq_length nodes@54@01)) (<= 0 i@68@01)))
      (and (< i@68@01 (Seq_length nodes@54@01)) (<= 0 i@68@01))))
  :pattern (($FVF.loc_next ($FVF.lookup_next (as sm@73@01  $FVF<next>) (Seq_index
    nodes@54@01
    i@68@01)) (Seq_index nodes@54@01 i@68@01)))
  :qid |prog.l19-aux|)))
(push) ; 4
(assert (not (forall ((i@68@01 Int)) (!
  (=>
    (and (< i@68@01 (Seq_length nodes@54@01)) (<= 0 i@68@01))
    (and
      (ite
        (< i@68@01 (- (Seq_length nodes@54@01) 1))
        (=
          ($FVF.lookup_next (as sm@69@01  $FVF<next>) (Seq_index
            nodes@54@01
            i@68@01))
          (Seq_index nodes@54@01 (+ i@68@01 1)))
        (=
          ($FVF.lookup_next (as sm@71@01  $FVF<next>) (Seq_index
            nodes@54@01
            i@68@01))
          $Ref.null))
      (Seq_contains nodes@54@01 (Seq_index nodes@54@01 i@68@01))))
  :pattern (($FVF.loc_next ($FVF.lookup_next (as sm@73@01  $FVF<next>) (Seq_index
    nodes@54@01
    i@68@01)) (Seq_index nodes@54@01 i@68@01)))
  :qid |prog.l19|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (forall ((i@68@01 Int)) (!
  (=>
    (and (< i@68@01 (Seq_length nodes@54@01)) (<= 0 i@68@01))
    (and
      (ite
        (< i@68@01 (- (Seq_length nodes@54@01) 1))
        (=
          ($FVF.lookup_next (as sm@69@01  $FVF<next>) (Seq_index
            nodes@54@01
            i@68@01))
          (Seq_index nodes@54@01 (+ i@68@01 1)))
        (=
          ($FVF.lookup_next (as sm@71@01  $FVF<next>) (Seq_index
            nodes@54@01
            i@68@01))
          $Ref.null))
      (Seq_contains nodes@54@01 (Seq_index nodes@54@01 i@68@01))))
  :pattern (($FVF.loc_next ($FVF.lookup_next (as sm@73@01  $FVF<next>) (Seq_index
    nodes@54@01
    i@68@01)) (Seq_index nodes@54@01 i@68@01)))
  :qid |prog.l19|)))
(assert (List%trigger ($Snap.combine
  ($SortWrappers.Seq<$Ref>To$Snap nodes@54@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<val>To$Snap (as sm@61@01  $FVF<val>))
      ($Snap.combine
        ($SortWrappers.$FVF<next>To$Snap (as sm@67@01  $FVF<next>))
        $Snap.unit)))) this@2@01))
; [eval] length(this) == old(length(this)) + 1
; [eval] length(this)
(push) ; 4
(assert (length%precondition ($Snap.combine
  ($SortWrappers.Seq<$Ref>To$Snap nodes@54@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<val>To$Snap (as sm@61@01  $FVF<val>))
      ($Snap.combine
        ($SortWrappers.$FVF<next>To$Snap (as sm@67@01  $FVF<next>))
        $Snap.unit)))) this@2@01))
(pop) ; 4
; Joined path conditions
(assert (length%precondition ($Snap.combine
  ($SortWrappers.Seq<$Ref>To$Snap nodes@54@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<val>To$Snap (as sm@61@01  $FVF<val>))
      ($Snap.combine
        ($SortWrappers.$FVF<next>To$Snap (as sm@67@01  $FVF<next>))
        $Snap.unit)))) this@2@01))
; [eval] old(length(this)) + 1
; [eval] old(length(this))
; [eval] length(this)
(push) ; 4
(pop) ; 4
; Joined path conditions
(push) ; 4
(assert (not (=
  (length ($Snap.combine
    ($SortWrappers.Seq<$Ref>To$Snap nodes@54@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$FVF<val>To$Snap (as sm@61@01  $FVF<val>))
        ($Snap.combine
          ($SortWrappers.$FVF<next>To$Snap (as sm@67@01  $FVF<next>))
          $Snap.unit)))) this@2@01)
  (+ (length ($Snap.first $t@4@01) this@2@01) 1))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (=
  (length ($Snap.combine
    ($SortWrappers.Seq<$Ref>To$Snap nodes@54@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$FVF<val>To$Snap (as sm@61@01  $FVF<val>))
        ($Snap.combine
          ($SortWrappers.$FVF<next>To$Snap (as sm@67@01  $FVF<next>))
          $Snap.unit)))) this@2@01)
  (+ (length ($Snap.first $t@4@01) this@2@01) 1)))
; [eval] itemAt(this, length(this) - 1) == elem
; [eval] itemAt(this, length(this) - 1)
; [eval] length(this) - 1
; [eval] length(this)
(push) ; 4
(pop) ; 4
; Joined path conditions
(push) ; 4
; [eval] 0 <= index
(push) ; 5
(assert (not (<=
  0
  (-
    (length ($Snap.combine
      ($SortWrappers.Seq<$Ref>To$Snap nodes@54@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$FVF<val>To$Snap (as sm@61@01  $FVF<val>))
          ($Snap.combine
            ($SortWrappers.$FVF<next>To$Snap (as sm@67@01  $FVF<next>))
            $Snap.unit)))) this@2@01)
    1))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (<=
  0
  (-
    (length ($Snap.combine
      ($SortWrappers.Seq<$Ref>To$Snap nodes@54@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$FVF<val>To$Snap (as sm@61@01  $FVF<val>))
          ($Snap.combine
            ($SortWrappers.$FVF<next>To$Snap (as sm@67@01  $FVF<next>))
            $Snap.unit)))) this@2@01)
    1)))
; [eval] index < length(this)
; [eval] length(this)
(push) ; 5
(pop) ; 5
; Joined path conditions
(push) ; 5
(assert (not (<
  (-
    (length ($Snap.combine
      ($SortWrappers.Seq<$Ref>To$Snap nodes@54@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$FVF<val>To$Snap (as sm@61@01  $FVF<val>))
          ($Snap.combine
            ($SortWrappers.$FVF<next>To$Snap (as sm@67@01  $FVF<next>))
            $Snap.unit)))) this@2@01)
    1)
  (length ($Snap.combine
    ($SortWrappers.Seq<$Ref>To$Snap nodes@54@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$FVF<val>To$Snap (as sm@61@01  $FVF<val>))
        ($Snap.combine
          ($SortWrappers.$FVF<next>To$Snap (as sm@67@01  $FVF<next>))
          $Snap.unit)))) this@2@01))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (<
  (-
    (length ($Snap.combine
      ($SortWrappers.Seq<$Ref>To$Snap nodes@54@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$FVF<val>To$Snap (as sm@61@01  $FVF<val>))
          ($Snap.combine
            ($SortWrappers.$FVF<next>To$Snap (as sm@67@01  $FVF<next>))
            $Snap.unit)))) this@2@01)
    1)
  (length ($Snap.combine
    ($SortWrappers.Seq<$Ref>To$Snap nodes@54@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$FVF<val>To$Snap (as sm@61@01  $FVF<val>))
        ($Snap.combine
          ($SortWrappers.$FVF<next>To$Snap (as sm@67@01  $FVF<next>))
          $Snap.unit)))) this@2@01)))
(assert (itemAt%precondition ($Snap.combine
  ($Snap.combine
    ($SortWrappers.Seq<$Ref>To$Snap nodes@54@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$FVF<val>To$Snap (as sm@61@01  $FVF<val>))
        ($Snap.combine
          ($SortWrappers.$FVF<next>To$Snap (as sm@67@01  $FVF<next>))
          $Snap.unit))))
  ($Snap.combine $Snap.unit $Snap.unit)) this@2@01 (-
  (length ($Snap.combine
    ($SortWrappers.Seq<$Ref>To$Snap nodes@54@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$FVF<val>To$Snap (as sm@61@01  $FVF<val>))
        ($Snap.combine
          ($SortWrappers.$FVF<next>To$Snap (as sm@67@01  $FVF<next>))
          $Snap.unit)))) this@2@01)
  1)))
(pop) ; 4
; Joined path conditions
(assert (and
  (<=
    0
    (-
      (length ($Snap.combine
        ($SortWrappers.Seq<$Ref>To$Snap nodes@54@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.$FVF<val>To$Snap (as sm@61@01  $FVF<val>))
            ($Snap.combine
              ($SortWrappers.$FVF<next>To$Snap (as sm@67@01  $FVF<next>))
              $Snap.unit)))) this@2@01)
      1))
  (<
    (-
      (length ($Snap.combine
        ($SortWrappers.Seq<$Ref>To$Snap nodes@54@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.$FVF<val>To$Snap (as sm@61@01  $FVF<val>))
            ($Snap.combine
              ($SortWrappers.$FVF<next>To$Snap (as sm@67@01  $FVF<next>))
              $Snap.unit)))) this@2@01)
      1)
    (length ($Snap.combine
      ($SortWrappers.Seq<$Ref>To$Snap nodes@54@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$FVF<val>To$Snap (as sm@61@01  $FVF<val>))
          ($Snap.combine
            ($SortWrappers.$FVF<next>To$Snap (as sm@67@01  $FVF<next>))
            $Snap.unit)))) this@2@01))
  (itemAt%precondition ($Snap.combine
    ($Snap.combine
      ($SortWrappers.Seq<$Ref>To$Snap nodes@54@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$FVF<val>To$Snap (as sm@61@01  $FVF<val>))
          ($Snap.combine
            ($SortWrappers.$FVF<next>To$Snap (as sm@67@01  $FVF<next>))
            $Snap.unit))))
    ($Snap.combine $Snap.unit $Snap.unit)) this@2@01 (-
    (length ($Snap.combine
      ($SortWrappers.Seq<$Ref>To$Snap nodes@54@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$FVF<val>To$Snap (as sm@61@01  $FVF<val>))
          ($Snap.combine
            ($SortWrappers.$FVF<next>To$Snap (as sm@67@01  $FVF<next>))
            $Snap.unit)))) this@2@01)
    1))))
(push) ; 4
(assert (not (=
  (itemAt ($Snap.combine
    ($Snap.combine
      ($SortWrappers.Seq<$Ref>To$Snap nodes@54@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$FVF<val>To$Snap (as sm@61@01  $FVF<val>))
          ($Snap.combine
            ($SortWrappers.$FVF<next>To$Snap (as sm@67@01  $FVF<next>))
            $Snap.unit))))
    ($Snap.combine $Snap.unit $Snap.unit)) this@2@01 (-
    (length ($Snap.combine
      ($SortWrappers.Seq<$Ref>To$Snap nodes@54@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$FVF<val>To$Snap (as sm@61@01  $FVF<val>))
          ($Snap.combine
            ($SortWrappers.$FVF<next>To$Snap (as sm@67@01  $FVF<next>))
            $Snap.unit)))) this@2@01)
    1))
  elem@3@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (=
  (itemAt ($Snap.combine
    ($Snap.combine
      ($SortWrappers.Seq<$Ref>To$Snap nodes@54@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$FVF<val>To$Snap (as sm@61@01  $FVF<val>))
          ($Snap.combine
            ($SortWrappers.$FVF<next>To$Snap (as sm@67@01  $FVF<next>))
            $Snap.unit))))
    ($Snap.combine $Snap.unit $Snap.unit)) this@2@01 (-
    (length ($Snap.combine
      ($SortWrappers.Seq<$Ref>To$Snap nodes@54@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$FVF<val>To$Snap (as sm@61@01  $FVF<val>))
          ($Snap.combine
            ($SortWrappers.$FVF<next>To$Snap (as sm@67@01  $FVF<next>))
            $Snap.unit)))) this@2@01)
    1))
  elem@3@01))
; [eval] (forall i: Int :: { old(itemAt(this, i)) } 0 <= i && i < length(this) - 1 ==> itemAt(this, i) == old(itemAt(this, i)))
(declare-const i@74@01 Int)
(push) ; 4
; [eval] 0 <= i && i < length(this) - 1 ==> itemAt(this, i) == old(itemAt(this, i))
; [eval] 0 <= i && i < length(this) - 1
; [eval] 0 <= i
(push) ; 5
; [then-branch: 36 | 0 <= i@74@01 | live]
; [else-branch: 36 | !(0 <= i@74@01) | live]
(push) ; 6
; [then-branch: 36 | 0 <= i@74@01]
(assert (<= 0 i@74@01))
; [eval] i < length(this) - 1
; [eval] length(this) - 1
; [eval] length(this)
(push) ; 7
(pop) ; 7
; Joined path conditions
(pop) ; 6
(push) ; 6
; [else-branch: 36 | !(0 <= i@74@01)]
(assert (not (<= 0 i@74@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (not (<= 0 i@74@01)) (<= 0 i@74@01)))
(push) ; 5
; [then-branch: 37 | i@74@01 < length((nodes@54@01, (_, (sm@61@01, (sm@67@01, _)))), this@2@01) - 1 && 0 <= i@74@01 | live]
; [else-branch: 37 | !(i@74@01 < length((nodes@54@01, (_, (sm@61@01, (sm@67@01, _)))), this@2@01) - 1 && 0 <= i@74@01) | live]
(push) ; 6
; [then-branch: 37 | i@74@01 < length((nodes@54@01, (_, (sm@61@01, (sm@67@01, _)))), this@2@01) - 1 && 0 <= i@74@01]
(assert (and
  (<
    i@74@01
    (-
      (length ($Snap.combine
        ($SortWrappers.Seq<$Ref>To$Snap nodes@54@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.$FVF<val>To$Snap (as sm@61@01  $FVF<val>))
            ($Snap.combine
              ($SortWrappers.$FVF<next>To$Snap (as sm@67@01  $FVF<next>))
              $Snap.unit)))) this@2@01)
      1))
  (<= 0 i@74@01)))
; [eval] itemAt(this, i) == old(itemAt(this, i))
; [eval] itemAt(this, i)
(push) ; 7
; [eval] 0 <= index
; [eval] index < length(this)
; [eval] length(this)
(push) ; 8
(pop) ; 8
; Joined path conditions
(push) ; 8
(assert (not (<
  i@74@01
  (length ($Snap.combine
    ($SortWrappers.Seq<$Ref>To$Snap nodes@54@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$FVF<val>To$Snap (as sm@61@01  $FVF<val>))
        ($Snap.combine
          ($SortWrappers.$FVF<next>To$Snap (as sm@67@01  $FVF<next>))
          $Snap.unit)))) this@2@01))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (<
  i@74@01
  (length ($Snap.combine
    ($SortWrappers.Seq<$Ref>To$Snap nodes@54@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$FVF<val>To$Snap (as sm@61@01  $FVF<val>))
        ($Snap.combine
          ($SortWrappers.$FVF<next>To$Snap (as sm@67@01  $FVF<next>))
          $Snap.unit)))) this@2@01)))
(assert (itemAt%precondition ($Snap.combine
  ($Snap.combine
    ($SortWrappers.Seq<$Ref>To$Snap nodes@54@01)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$FVF<val>To$Snap (as sm@61@01  $FVF<val>))
        ($Snap.combine
          ($SortWrappers.$FVF<next>To$Snap (as sm@67@01  $FVF<next>))
          $Snap.unit))))
  ($Snap.combine $Snap.unit $Snap.unit)) this@2@01 i@74@01))
(pop) ; 7
; Joined path conditions
(assert (and
  (<
    i@74@01
    (length ($Snap.combine
      ($SortWrappers.Seq<$Ref>To$Snap nodes@54@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$FVF<val>To$Snap (as sm@61@01  $FVF<val>))
          ($Snap.combine
            ($SortWrappers.$FVF<next>To$Snap (as sm@67@01  $FVF<next>))
            $Snap.unit)))) this@2@01))
  (itemAt%precondition ($Snap.combine
    ($Snap.combine
      ($SortWrappers.Seq<$Ref>To$Snap nodes@54@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$FVF<val>To$Snap (as sm@61@01  $FVF<val>))
          ($Snap.combine
            ($SortWrappers.$FVF<next>To$Snap (as sm@67@01  $FVF<next>))
            $Snap.unit))))
    ($Snap.combine $Snap.unit $Snap.unit)) this@2@01 i@74@01)))
; [eval] old(itemAt(this, i))
; [eval] itemAt(this, i)
(push) ; 7
; [eval] 0 <= index
; [eval] index < length(this)
; [eval] length(this)
(push) ; 8
(pop) ; 8
; Joined path conditions
(push) ; 8
(assert (not (< i@74@01 (length ($Snap.first $t@4@01) this@2@01))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (< i@74@01 (length ($Snap.first $t@4@01) this@2@01)))
(assert (itemAt%precondition ($Snap.combine
  ($Snap.first $t@4@01)
  ($Snap.combine $Snap.unit $Snap.unit)) this@2@01 i@74@01))
(pop) ; 7
; Joined path conditions
(assert (and
  (< i@74@01 (length ($Snap.first $t@4@01) this@2@01))
  (itemAt%precondition ($Snap.combine
    ($Snap.first $t@4@01)
    ($Snap.combine $Snap.unit $Snap.unit)) this@2@01 i@74@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 37 | !(i@74@01 < length((nodes@54@01, (_, (sm@61@01, (sm@67@01, _)))), this@2@01) - 1 && 0 <= i@74@01)]
(assert (not
  (and
    (<
      i@74@01
      (-
        (length ($Snap.combine
          ($SortWrappers.Seq<$Ref>To$Snap nodes@54@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($SortWrappers.$FVF<val>To$Snap (as sm@61@01  $FVF<val>))
              ($Snap.combine
                ($SortWrappers.$FVF<next>To$Snap (as sm@67@01  $FVF<next>))
                $Snap.unit)))) this@2@01)
        1))
    (<= 0 i@74@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (<
      i@74@01
      (-
        (length ($Snap.combine
          ($SortWrappers.Seq<$Ref>To$Snap nodes@54@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($SortWrappers.$FVF<val>To$Snap (as sm@61@01  $FVF<val>))
              ($Snap.combine
                ($SortWrappers.$FVF<next>To$Snap (as sm@67@01  $FVF<next>))
                $Snap.unit)))) this@2@01)
        1))
    (<= 0 i@74@01))
  (and
    (<
      i@74@01
      (-
        (length ($Snap.combine
          ($SortWrappers.Seq<$Ref>To$Snap nodes@54@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($SortWrappers.$FVF<val>To$Snap (as sm@61@01  $FVF<val>))
              ($Snap.combine
                ($SortWrappers.$FVF<next>To$Snap (as sm@67@01  $FVF<next>))
                $Snap.unit)))) this@2@01)
        1))
    (<= 0 i@74@01)
    (<
      i@74@01
      (length ($Snap.combine
        ($SortWrappers.Seq<$Ref>To$Snap nodes@54@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.$FVF<val>To$Snap (as sm@61@01  $FVF<val>))
            ($Snap.combine
              ($SortWrappers.$FVF<next>To$Snap (as sm@67@01  $FVF<next>))
              $Snap.unit)))) this@2@01))
    (itemAt%precondition ($Snap.combine
      ($Snap.combine
        ($SortWrappers.Seq<$Ref>To$Snap nodes@54@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.$FVF<val>To$Snap (as sm@61@01  $FVF<val>))
            ($Snap.combine
              ($SortWrappers.$FVF<next>To$Snap (as sm@67@01  $FVF<next>))
              $Snap.unit))))
      ($Snap.combine $Snap.unit $Snap.unit)) this@2@01 i@74@01)
    (< i@74@01 (length ($Snap.first $t@4@01) this@2@01))
    (itemAt%precondition ($Snap.combine
      ($Snap.first $t@4@01)
      ($Snap.combine $Snap.unit $Snap.unit)) this@2@01 i@74@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (<
        i@74@01
        (-
          (length ($Snap.combine
            ($SortWrappers.Seq<$Ref>To$Snap nodes@54@01)
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                ($SortWrappers.$FVF<val>To$Snap (as sm@61@01  $FVF<val>))
                ($Snap.combine
                  ($SortWrappers.$FVF<next>To$Snap (as sm@67@01  $FVF<next>))
                  $Snap.unit)))) this@2@01)
          1))
      (<= 0 i@74@01)))
  (and
    (<
      i@74@01
      (-
        (length ($Snap.combine
          ($SortWrappers.Seq<$Ref>To$Snap nodes@54@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($SortWrappers.$FVF<val>To$Snap (as sm@61@01  $FVF<val>))
              ($Snap.combine
                ($SortWrappers.$FVF<next>To$Snap (as sm@67@01  $FVF<next>))
                $Snap.unit)))) this@2@01)
        1))
    (<= 0 i@74@01))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@74@01 Int)) (!
  (and
    (or (not (<= 0 i@74@01)) (<= 0 i@74@01))
    (=>
      (and
        (<
          i@74@01
          (-
            (length ($Snap.combine
              ($SortWrappers.Seq<$Ref>To$Snap nodes@54@01)
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  ($SortWrappers.$FVF<val>To$Snap (as sm@61@01  $FVF<val>))
                  ($Snap.combine
                    ($SortWrappers.$FVF<next>To$Snap (as sm@67@01  $FVF<next>))
                    $Snap.unit)))) this@2@01)
            1))
        (<= 0 i@74@01))
      (and
        (<
          i@74@01
          (-
            (length ($Snap.combine
              ($SortWrappers.Seq<$Ref>To$Snap nodes@54@01)
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  ($SortWrappers.$FVF<val>To$Snap (as sm@61@01  $FVF<val>))
                  ($Snap.combine
                    ($SortWrappers.$FVF<next>To$Snap (as sm@67@01  $FVF<next>))
                    $Snap.unit)))) this@2@01)
            1))
        (<= 0 i@74@01)
        (<
          i@74@01
          (length ($Snap.combine
            ($SortWrappers.Seq<$Ref>To$Snap nodes@54@01)
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                ($SortWrappers.$FVF<val>To$Snap (as sm@61@01  $FVF<val>))
                ($Snap.combine
                  ($SortWrappers.$FVF<next>To$Snap (as sm@67@01  $FVF<next>))
                  $Snap.unit)))) this@2@01))
        (itemAt%precondition ($Snap.combine
          ($Snap.combine
            ($SortWrappers.Seq<$Ref>To$Snap nodes@54@01)
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                ($SortWrappers.$FVF<val>To$Snap (as sm@61@01  $FVF<val>))
                ($Snap.combine
                  ($SortWrappers.$FVF<next>To$Snap (as sm@67@01  $FVF<next>))
                  $Snap.unit))))
          ($Snap.combine $Snap.unit $Snap.unit)) this@2@01 i@74@01)
        (< i@74@01 (length ($Snap.first $t@4@01) this@2@01))
        (itemAt%precondition ($Snap.combine
          ($Snap.first $t@4@01)
          ($Snap.combine $Snap.unit $Snap.unit)) this@2@01 i@74@01)))
    (or
      (not
        (and
          (<
            i@74@01
            (-
              (length ($Snap.combine
                ($SortWrappers.Seq<$Ref>To$Snap nodes@54@01)
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    ($SortWrappers.$FVF<val>To$Snap (as sm@61@01  $FVF<val>))
                    ($Snap.combine
                      ($SortWrappers.$FVF<next>To$Snap (as sm@67@01  $FVF<next>))
                      $Snap.unit)))) this@2@01)
              1))
          (<= 0 i@74@01)))
      (and
        (<
          i@74@01
          (-
            (length ($Snap.combine
              ($SortWrappers.Seq<$Ref>To$Snap nodes@54@01)
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  ($SortWrappers.$FVF<val>To$Snap (as sm@61@01  $FVF<val>))
                  ($Snap.combine
                    ($SortWrappers.$FVF<next>To$Snap (as sm@67@01  $FVF<next>))
                    $Snap.unit)))) this@2@01)
            1))
        (<= 0 i@74@01))))
  :pattern ((itemAt%limited ($Snap.combine
    ($Snap.first $t@4@01)
    ($Snap.combine $Snap.unit $Snap.unit)) this@2@01 i@74@01))
  :qid |prog.l43-aux|)))
(assert (forall ((i@74@01 Int)) (!
  (and
    (length%precondition ($Snap.combine
      ($SortWrappers.Seq<$Ref>To$Snap nodes@54@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$FVF<val>To$Snap (as sm@61@01  $FVF<val>))
          ($Snap.combine
            ($SortWrappers.$FVF<next>To$Snap (as sm@67@01  $FVF<next>))
            $Snap.unit)))) this@2@01)
    (=>
      (and
        (<
          i@74@01
          (-
            (length ($Snap.combine
              ($SortWrappers.Seq<$Ref>To$Snap nodes@54@01)
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  ($SortWrappers.$FVF<val>To$Snap (as sm@61@01  $FVF<val>))
                  ($Snap.combine
                    ($SortWrappers.$FVF<next>To$Snap (as sm@67@01  $FVF<next>))
                    $Snap.unit)))) this@2@01)
            1))
        (<= 0 i@74@01))
      (and
        (itemAt%precondition ($Snap.combine
          ($Snap.combine
            ($SortWrappers.Seq<$Ref>To$Snap nodes@54@01)
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                ($SortWrappers.$FVF<val>To$Snap (as sm@61@01  $FVF<val>))
                ($Snap.combine
                  ($SortWrappers.$FVF<next>To$Snap (as sm@67@01  $FVF<next>))
                  $Snap.unit))))
          ($Snap.combine $Snap.unit $Snap.unit)) this@2@01 i@74@01)
        (itemAt%precondition ($Snap.combine
          ($Snap.first $t@4@01)
          ($Snap.combine $Snap.unit $Snap.unit)) this@2@01 i@74@01))))
  :pattern ((itemAt%limited ($Snap.combine
    ($Snap.first $t@4@01)
    ($Snap.combine $Snap.unit $Snap.unit)) this@2@01 i@74@01))
  :qid |prog.l43_precondition|)))
(push) ; 4
(assert (not (forall ((i@74@01 Int)) (!
  (=>
    (and
      (and
        (length%precondition ($Snap.combine
          ($SortWrappers.Seq<$Ref>To$Snap nodes@54@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($SortWrappers.$FVF<val>To$Snap (as sm@61@01  $FVF<val>))
              ($Snap.combine
                ($SortWrappers.$FVF<next>To$Snap (as sm@67@01  $FVF<next>))
                $Snap.unit)))) this@2@01)
        (=>
          (and
            (<
              i@74@01
              (-
                (length ($Snap.combine
                  ($SortWrappers.Seq<$Ref>To$Snap nodes@54@01)
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      ($SortWrappers.$FVF<val>To$Snap (as sm@61@01  $FVF<val>))
                      ($Snap.combine
                        ($SortWrappers.$FVF<next>To$Snap (as sm@67@01  $FVF<next>))
                        $Snap.unit)))) this@2@01)
                1))
            (<= 0 i@74@01))
          (and
            (itemAt%precondition ($Snap.combine
              ($Snap.combine
                ($SortWrappers.Seq<$Ref>To$Snap nodes@54@01)
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    ($SortWrappers.$FVF<val>To$Snap (as sm@61@01  $FVF<val>))
                    ($Snap.combine
                      ($SortWrappers.$FVF<next>To$Snap (as sm@67@01  $FVF<next>))
                      $Snap.unit))))
              ($Snap.combine $Snap.unit $Snap.unit)) this@2@01 i@74@01)
            (itemAt%precondition ($Snap.combine
              ($Snap.first $t@4@01)
              ($Snap.combine $Snap.unit $Snap.unit)) this@2@01 i@74@01))))
      (and
        (<
          i@74@01
          (-
            (length ($Snap.combine
              ($SortWrappers.Seq<$Ref>To$Snap nodes@54@01)
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  ($SortWrappers.$FVF<val>To$Snap (as sm@61@01  $FVF<val>))
                  ($Snap.combine
                    ($SortWrappers.$FVF<next>To$Snap (as sm@67@01  $FVF<next>))
                    $Snap.unit)))) this@2@01)
            1))
        (<= 0 i@74@01)))
    (=
      (itemAt ($Snap.combine
        ($Snap.combine
          ($SortWrappers.Seq<$Ref>To$Snap nodes@54@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($SortWrappers.$FVF<val>To$Snap (as sm@61@01  $FVF<val>))
              ($Snap.combine
                ($SortWrappers.$FVF<next>To$Snap (as sm@67@01  $FVF<next>))
                $Snap.unit))))
        ($Snap.combine $Snap.unit $Snap.unit)) this@2@01 i@74@01)
      (itemAt ($Snap.combine
        ($Snap.first $t@4@01)
        ($Snap.combine $Snap.unit $Snap.unit)) this@2@01 i@74@01)))
  :pattern ((itemAt%limited ($Snap.combine
    ($Snap.first $t@4@01)
    ($Snap.combine $Snap.unit $Snap.unit)) this@2@01 i@74@01))
  :qid |prog.l43|))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (forall ((i@74@01 Int)) (!
  (=>
    (and
      (<
        i@74@01
        (-
          (length ($Snap.combine
            ($SortWrappers.Seq<$Ref>To$Snap nodes@54@01)
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                ($SortWrappers.$FVF<val>To$Snap (as sm@61@01  $FVF<val>))
                ($Snap.combine
                  ($SortWrappers.$FVF<next>To$Snap (as sm@67@01  $FVF<next>))
                  $Snap.unit)))) this@2@01)
          1))
      (<= 0 i@74@01))
    (=
      (itemAt ($Snap.combine
        ($Snap.combine
          ($SortWrappers.Seq<$Ref>To$Snap nodes@54@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($SortWrappers.$FVF<val>To$Snap (as sm@61@01  $FVF<val>))
              ($Snap.combine
                ($SortWrappers.$FVF<next>To$Snap (as sm@67@01  $FVF<next>))
                $Snap.unit))))
        ($Snap.combine $Snap.unit $Snap.unit)) this@2@01 i@74@01)
      (itemAt ($Snap.combine
        ($Snap.first $t@4@01)
        ($Snap.combine $Snap.unit $Snap.unit)) this@2@01 i@74@01)))
  :pattern ((itemAt%limited ($Snap.combine
    ($Snap.first $t@4@01)
    ($Snap.combine $Snap.unit $Snap.unit)) this@2@01 i@74@01))
  :qid |prog.l43|)))
(pop) ; 3
(push) ; 3
; [else-branch: 26 | |First:(First:($t@4@01))| > 0]
(assert (>
  (Seq_length
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.first $t@4@01))))
  0))
(pop) ; 3
(pop) ; 2
(pop) ; 1
