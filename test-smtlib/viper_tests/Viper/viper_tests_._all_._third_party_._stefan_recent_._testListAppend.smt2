(get-info :version)
; (:version "4.12.1")
; Started: 2023-10-31 14:09:04
; Silicon.version: 1.1-SNAPSHOT (46944a65@dspil_symbenchmarking)
; Input file: /home/pcorrect/repos/benchmarking_general/silicon_tests/viper_tests_._all_._third_party_._stefan_recent_._testListAppend.vpr
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
; ////////// Symbols
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
; Declaring symbols related to program functions (from program analysis)
(declare-fun List__contents ($Snap $Ref) Seq<Int>)
(declare-fun List__contents%limited ($Snap $Ref) Seq<Int>)
(declare-fun List__contents%stateless ($Ref) Bool)
(declare-fun List__contents%precondition ($Snap $Ref) Bool)
(declare-fun Wand_list_for_list__get_out_1_0 ($Snap $Ref) Seq<Int>)
(declare-fun Wand_list_for_list__get_out_1_0%limited ($Snap $Ref) Seq<Int>)
(declare-fun Wand_list_for_list__get_out_1_0%stateless ($Ref) Bool)
(declare-fun Wand_list_for_list__get_out_1_0%precondition ($Snap $Ref) Bool)
(declare-fun Wand_list_for_list__get_out_1 ($Snap $Ref) $Ref)
(declare-fun Wand_list_for_list__get_out_1%limited ($Snap $Ref) $Ref)
(declare-fun Wand_list_for_list__get_out_1%stateless ($Ref) Bool)
(declare-fun Wand_list_for_list__get_out_1%precondition ($Snap $Ref) Bool)
(declare-fun List__get_next ($Snap $Ref) $Ref)
(declare-fun List__get_next%limited ($Snap $Ref) $Ref)
(declare-fun List__get_next%stateless ($Ref) Bool)
(declare-fun List__get_next%precondition ($Snap $Ref) Bool)
(declare-fun Wand_list_for_list__get_in_1 ($Snap $Ref) $Ref)
(declare-fun Wand_list_for_list__get_in_1%limited ($Snap $Ref) $Ref)
(declare-fun Wand_list_for_list__get_in_1%stateless ($Ref) Bool)
(declare-fun Wand_list_for_list__get_in_1%precondition ($Snap $Ref) Bool)
(declare-fun Wand_list_for_list__get_in_1_0 ($Snap $Ref) Seq<Int>)
(declare-fun Wand_list_for_list__get_in_1_0%limited ($Snap $Ref) Seq<Int>)
(declare-fun Wand_list_for_list__get_in_1_0%stateless ($Ref) Bool)
(declare-fun Wand_list_for_list__get_in_1_0%precondition ($Snap $Ref) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun Wand_list_for_list__valid_wand%trigger ($Snap $Ref) Bool)
(declare-fun List__state%trigger ($Snap $Ref) Bool)
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
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
(declare-fun joined_unfolding@12@00 ($Snap $Ref) Seq<Int>)
(declare-fun joined_unfolding@32@00 ($Snap $Ref) Seq<Int>)
(declare-fun $k@13@00 () $Perm)
(declare-fun $k@14@00 () $Perm)
(declare-fun $k@15@00 () $Perm)
(declare-fun $k@16@00 () $Perm)
(declare-fun $k@17@00 () $Perm)
(declare-fun $k@18@00 () $Perm)
(declare-fun $k@19@00 () $Perm)
(declare-fun $k@20@00 () $Perm)
(declare-fun $k@21@00 () $Perm)
(declare-fun $k@22@00 () $Perm)
(declare-fun $k@23@00 () $Perm)
(declare-fun $k@24@00 () $Perm)
(declare-fun $k@25@00 () $Perm)
(declare-fun $k@26@00 () $Perm)
(declare-fun $k@27@00 () $Perm)
(declare-fun $k@28@00 () $Perm)
(declare-fun $k@29@00 () $Perm)
(declare-fun $k@30@00 () $Perm)
(declare-fun $k@31@00 () $Perm)
(declare-fun joined_unfolding@53@00 ($Snap $Ref) $Ref)
(declare-fun $k@34@00 () $Perm)
(declare-fun $k@35@00 () $Perm)
(declare-fun $k@36@00 () $Perm)
(declare-fun $k@37@00 () $Perm)
(declare-fun $k@38@00 () $Perm)
(declare-fun $k@39@00 () $Perm)
(declare-fun $k@40@00 () $Perm)
(declare-fun $k@41@00 () $Perm)
(declare-fun $k@42@00 () $Perm)
(declare-fun $k@43@00 () $Perm)
(declare-fun $k@44@00 () $Perm)
(declare-fun $k@45@00 () $Perm)
(declare-fun $k@46@00 () $Perm)
(declare-fun $k@47@00 () $Perm)
(declare-fun $k@48@00 () $Perm)
(declare-fun $k@49@00 () $Perm)
(declare-fun $k@50@00 () $Perm)
(declare-fun $k@51@00 () $Perm)
(declare-fun $k@52@00 () $Perm)
(declare-fun joined_unfolding@54@00 ($Snap $Ref) $Ref)
(declare-fun joined_unfolding@75@00 ($Snap $Ref) $Ref)
(declare-fun $k@56@00 () $Perm)
(declare-fun $k@57@00 () $Perm)
(declare-fun $k@58@00 () $Perm)
(declare-fun $k@59@00 () $Perm)
(declare-fun $k@60@00 () $Perm)
(declare-fun $k@61@00 () $Perm)
(declare-fun $k@62@00 () $Perm)
(declare-fun $k@63@00 () $Perm)
(declare-fun $k@64@00 () $Perm)
(declare-fun $k@65@00 () $Perm)
(declare-fun $k@66@00 () $Perm)
(declare-fun $k@67@00 () $Perm)
(declare-fun $k@68@00 () $Perm)
(declare-fun $k@69@00 () $Perm)
(declare-fun $k@70@00 () $Perm)
(declare-fun $k@71@00 () $Perm)
(declare-fun $k@72@00 () $Perm)
(declare-fun $k@73@00 () $Perm)
(declare-fun $k@74@00 () $Perm)
(declare-fun joined_unfolding@95@00 ($Snap $Ref) Seq<Int>)
(declare-fun $k@76@00 () $Perm)
(declare-fun $k@77@00 () $Perm)
(declare-fun $k@78@00 () $Perm)
(declare-fun $k@79@00 () $Perm)
(declare-fun $k@80@00 () $Perm)
(declare-fun $k@81@00 () $Perm)
(declare-fun $k@82@00 () $Perm)
(declare-fun $k@83@00 () $Perm)
(declare-fun $k@84@00 () $Perm)
(declare-fun $k@85@00 () $Perm)
(declare-fun $k@86@00 () $Perm)
(declare-fun $k@87@00 () $Perm)
(declare-fun $k@88@00 () $Perm)
(declare-fun $k@89@00 () $Perm)
(declare-fun $k@90@00 () $Perm)
(declare-fun $k@91@00 () $Perm)
(declare-fun $k@92@00 () $Perm)
(declare-fun $k@93@00 () $Perm)
(declare-fun $k@94@00 () $Perm)
(assert (forall ((s@$ $Snap) (diz@0@00 $Ref)) (!
  (Seq_equal (List__contents%limited s@$ diz@0@00) (List__contents s@$ diz@0@00))
  :pattern ((List__contents s@$ diz@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (diz@0@00 $Ref)) (!
  (List__contents%stateless diz@0@00)
  :pattern ((List__contents%limited s@$ diz@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (diz@0@00 $Ref)) (!
  (=>
    (List__contents%precondition s@$ diz@0@00)
    (Seq_equal
      (List__contents s@$ diz@0@00)
      (ite
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
          $Ref.null)
        (Seq_singleton ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))))
        (Seq_append
          (Seq_singleton ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second s@$))))
          (List__contents%limited ($Snap.combine
            $Snap.unit
            ($Snap.second ($Snap.second ($Snap.second s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))))))))
  :pattern ((List__contents s@$ diz@0@00))
  :pattern ((List__contents%stateless diz@0@00) (List__state%trigger ($Snap.second s@$) diz@0@00))
  :qid |quant-u-12|)))
(assert (forall ((s@$ $Snap) (diz@0@00 $Ref)) (!
  (=>
    (List__contents%precondition s@$ diz@0@00)
    (ite
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))
        $Ref.null)
      true
      (List__contents%precondition ($Snap.combine
        $Snap.unit
        ($Snap.second ($Snap.second ($Snap.second s@$)))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$)))))))
  :pattern ((List__contents s@$ diz@0@00))
  :qid |quant-u-13|)))
(assert (forall ((s@$ $Snap) (diz@2@00 $Ref)) (!
  (Seq_equal
    (Wand_list_for_list__get_out_1_0%limited s@$ diz@2@00)
    (Wand_list_for_list__get_out_1_0 s@$ diz@2@00))
  :pattern ((Wand_list_for_list__get_out_1_0 s@$ diz@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (diz@2@00 $Ref)) (!
  (Wand_list_for_list__get_out_1_0%stateless diz@2@00)
  :pattern ((Wand_list_for_list__get_out_1_0%limited s@$ diz@2@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (diz@2@00 $Ref)) (!
  (and
    ($Perm.isReadVar $k@13@00)
    ($Perm.isReadVar $k@14@00)
    ($Perm.isReadVar $k@15@00)
    ($Perm.isReadVar $k@16@00)
    ($Perm.isReadVar $k@17@00)
    ($Perm.isReadVar $k@18@00)
    ($Perm.isReadVar $k@19@00)
    ($Perm.isReadVar $k@20@00)
    ($Perm.isReadVar $k@21@00)
    ($Perm.isReadVar $k@22@00)
    ($Perm.isReadVar $k@23@00)
    ($Perm.isReadVar $k@24@00)
    ($Perm.isReadVar $k@25@00)
    ($Perm.isReadVar $k@26@00)
    ($Perm.isReadVar $k@27@00)
    ($Perm.isReadVar $k@28@00)
    ($Perm.isReadVar $k@29@00)
    ($Perm.isReadVar $k@30@00)
    ($Perm.isReadVar $k@31@00)
    (=>
      (Wand_list_for_list__get_out_1_0%precondition s@$ diz@2@00)
      (Seq_equal
        (Wand_list_for_list__get_out_1_0 s@$ diz@2@00)
        ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))))))
  :pattern ((Wand_list_for_list__get_out_1_0 s@$ diz@2@00))
  :qid |quant-u-14|)))
(assert (forall ((s@$ $Snap) (diz@2@00 $Ref)) (!
  true
  :pattern ((Wand_list_for_list__get_out_1_0 s@$ diz@2@00))
  :qid |quant-u-15|)))
(assert (forall ((s@$ $Snap) (diz@4@00 $Ref)) (!
  (=
    (Wand_list_for_list__get_out_1%limited s@$ diz@4@00)
    (Wand_list_for_list__get_out_1 s@$ diz@4@00))
  :pattern ((Wand_list_for_list__get_out_1 s@$ diz@4@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (diz@4@00 $Ref)) (!
  (Wand_list_for_list__get_out_1%stateless diz@4@00)
  :pattern ((Wand_list_for_list__get_out_1%limited s@$ diz@4@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (diz@4@00 $Ref)) (!
  (let ((result@5@00 (Wand_list_for_list__get_out_1%limited s@$ diz@4@00))) (=>
    (Wand_list_for_list__get_out_1%precondition s@$ diz@4@00)
    (not (= result@5@00 $Ref.null))))
  :pattern ((Wand_list_for_list__get_out_1%limited s@$ diz@4@00))
  :qid |quant-u-16|)))
(assert (forall ((s@$ $Snap) (diz@4@00 $Ref)) (!
  (let ((result@5@00 (Wand_list_for_list__get_out_1%limited s@$ diz@4@00))) true)
  :pattern ((Wand_list_for_list__get_out_1%limited s@$ diz@4@00))
  :qid |quant-u-17|)))
(assert (forall ((s@$ $Snap) (diz@4@00 $Ref)) (!
  (and
    ($Perm.isReadVar $k@34@00)
    ($Perm.isReadVar $k@35@00)
    ($Perm.isReadVar $k@36@00)
    ($Perm.isReadVar $k@37@00)
    ($Perm.isReadVar $k@38@00)
    ($Perm.isReadVar $k@39@00)
    ($Perm.isReadVar $k@40@00)
    ($Perm.isReadVar $k@41@00)
    ($Perm.isReadVar $k@42@00)
    ($Perm.isReadVar $k@43@00)
    ($Perm.isReadVar $k@44@00)
    ($Perm.isReadVar $k@45@00)
    ($Perm.isReadVar $k@46@00)
    ($Perm.isReadVar $k@47@00)
    ($Perm.isReadVar $k@48@00)
    ($Perm.isReadVar $k@49@00)
    ($Perm.isReadVar $k@50@00)
    ($Perm.isReadVar $k@51@00)
    ($Perm.isReadVar $k@52@00)
    (=>
      (Wand_list_for_list__get_out_1%precondition s@$ diz@4@00)
      (=
        (Wand_list_for_list__get_out_1 s@$ diz@4@00)
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))))
  :pattern ((Wand_list_for_list__get_out_1 s@$ diz@4@00))
  :qid |quant-u-18|)))
(assert (forall ((s@$ $Snap) (diz@4@00 $Ref)) (!
  true
  :pattern ((Wand_list_for_list__get_out_1 s@$ diz@4@00))
  :qid |quant-u-19|)))
(assert (forall ((s@$ $Snap) (diz@6@00 $Ref)) (!
  (= (List__get_next%limited s@$ diz@6@00) (List__get_next s@$ diz@6@00))
  :pattern ((List__get_next s@$ diz@6@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (diz@6@00 $Ref)) (!
  (List__get_next%stateless diz@6@00)
  :pattern ((List__get_next%limited s@$ diz@6@00))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap) (diz@6@00 $Ref)) (!
  (=>
    (List__get_next%precondition s@$ diz@6@00)
    (=
      (List__get_next s@$ diz@6@00)
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second s@$))))))
  :pattern ((List__get_next s@$ diz@6@00))
  :qid |quant-u-20|)))
(assert (forall ((s@$ $Snap) (diz@6@00 $Ref)) (!
  true
  :pattern ((List__get_next s@$ diz@6@00))
  :qid |quant-u-21|)))
(assert (forall ((s@$ $Snap) (diz@8@00 $Ref)) (!
  (=
    (Wand_list_for_list__get_in_1%limited s@$ diz@8@00)
    (Wand_list_for_list__get_in_1 s@$ diz@8@00))
  :pattern ((Wand_list_for_list__get_in_1 s@$ diz@8@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (diz@8@00 $Ref)) (!
  (Wand_list_for_list__get_in_1%stateless diz@8@00)
  :pattern ((Wand_list_for_list__get_in_1%limited s@$ diz@8@00))
  :qid |quant-u-9|)))
(assert (forall ((s@$ $Snap) (diz@8@00 $Ref)) (!
  (let ((result@9@00 (Wand_list_for_list__get_in_1%limited s@$ diz@8@00))) (=>
    (Wand_list_for_list__get_in_1%precondition s@$ diz@8@00)
    (not (= result@9@00 $Ref.null))))
  :pattern ((Wand_list_for_list__get_in_1%limited s@$ diz@8@00))
  :qid |quant-u-22|)))
(assert (forall ((s@$ $Snap) (diz@8@00 $Ref)) (!
  (let ((result@9@00 (Wand_list_for_list__get_in_1%limited s@$ diz@8@00))) true)
  :pattern ((Wand_list_for_list__get_in_1%limited s@$ diz@8@00))
  :qid |quant-u-23|)))
(assert (forall ((s@$ $Snap) (diz@8@00 $Ref)) (!
  (and
    ($Perm.isReadVar $k@56@00)
    ($Perm.isReadVar $k@57@00)
    ($Perm.isReadVar $k@58@00)
    ($Perm.isReadVar $k@59@00)
    ($Perm.isReadVar $k@60@00)
    ($Perm.isReadVar $k@61@00)
    ($Perm.isReadVar $k@62@00)
    ($Perm.isReadVar $k@63@00)
    ($Perm.isReadVar $k@64@00)
    ($Perm.isReadVar $k@65@00)
    ($Perm.isReadVar $k@66@00)
    ($Perm.isReadVar $k@67@00)
    ($Perm.isReadVar $k@68@00)
    ($Perm.isReadVar $k@69@00)
    ($Perm.isReadVar $k@70@00)
    ($Perm.isReadVar $k@71@00)
    ($Perm.isReadVar $k@72@00)
    ($Perm.isReadVar $k@73@00)
    ($Perm.isReadVar $k@74@00)
    (=>
      (Wand_list_for_list__get_in_1%precondition s@$ diz@8@00)
      (=
        (Wand_list_for_list__get_in_1 s@$ diz@8@00)
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))))))
  :pattern ((Wand_list_for_list__get_in_1 s@$ diz@8@00))
  :qid |quant-u-24|)))
(assert (forall ((s@$ $Snap) (diz@8@00 $Ref)) (!
  true
  :pattern ((Wand_list_for_list__get_in_1 s@$ diz@8@00))
  :qid |quant-u-25|)))
(assert (forall ((s@$ $Snap) (diz@10@00 $Ref)) (!
  (Seq_equal
    (Wand_list_for_list__get_in_1_0%limited s@$ diz@10@00)
    (Wand_list_for_list__get_in_1_0 s@$ diz@10@00))
  :pattern ((Wand_list_for_list__get_in_1_0 s@$ diz@10@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (diz@10@00 $Ref)) (!
  (Wand_list_for_list__get_in_1_0%stateless diz@10@00)
  :pattern ((Wand_list_for_list__get_in_1_0%limited s@$ diz@10@00))
  :qid |quant-u-11|)))
(assert (forall ((s@$ $Snap) (diz@10@00 $Ref)) (!
  (and
    ($Perm.isReadVar $k@76@00)
    ($Perm.isReadVar $k@77@00)
    ($Perm.isReadVar $k@78@00)
    ($Perm.isReadVar $k@79@00)
    ($Perm.isReadVar $k@80@00)
    ($Perm.isReadVar $k@81@00)
    ($Perm.isReadVar $k@82@00)
    ($Perm.isReadVar $k@83@00)
    ($Perm.isReadVar $k@84@00)
    ($Perm.isReadVar $k@85@00)
    ($Perm.isReadVar $k@86@00)
    ($Perm.isReadVar $k@87@00)
    ($Perm.isReadVar $k@88@00)
    ($Perm.isReadVar $k@89@00)
    ($Perm.isReadVar $k@90@00)
    ($Perm.isReadVar $k@91@00)
    ($Perm.isReadVar $k@92@00)
    ($Perm.isReadVar $k@93@00)
    ($Perm.isReadVar $k@94@00)
    (=>
      (Wand_list_for_list__get_in_1_0%precondition s@$ diz@10@00)
      (Seq_equal
        (Wand_list_for_list__get_in_1_0 s@$ diz@10@00)
        ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))))
  :pattern ((Wand_list_for_list__get_in_1_0 s@$ diz@10@00))
  :qid |quant-u-26|)))
(assert (forall ((s@$ $Snap) (diz@10@00 $Ref)) (!
  true
  :pattern ((Wand_list_for_list__get_in_1_0 s@$ diz@10@00))
  :qid |quant-u-27|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- Wand_list_for_list___apply ----------
(declare-const diz@0@01 $Ref)
(declare-const current_thread_id@1@01 Int)
(declare-const diz@2@01 $Ref)
(declare-const current_thread_id@3@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@4@01 $Snap)
(assert (= $t@4@01 ($Snap.combine ($Snap.first $t@4@01) ($Snap.second $t@4@01))))
(assert (= ($Snap.first $t@4@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@2@01 $Ref.null)))
(assert (=
  ($Snap.second $t@4@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@4@01))
    ($Snap.second ($Snap.second $t@4@01)))))
(assert (= ($Snap.first ($Snap.second $t@4@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@3@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@4@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@4@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))))
; [eval] Wand_list_for_list__get_in_1(diz)
(push) ; 2
; [eval] diz != null
(assert (Wand_list_for_list__get_in_1%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) diz@2@01))
(pop) ; 2
; Joined path conditions
(assert (Wand_list_for_list__get_in_1%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) diz@2@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))
  $Snap.unit))
; [eval] List__contents(Wand_list_for_list__get_in_1(diz)) == Wand_list_for_list__get_in_1_0(diz)
; [eval] List__contents(Wand_list_for_list__get_in_1(diz))
; [eval] Wand_list_for_list__get_in_1(diz)
(push) ; 2
; [eval] diz != null
(pop) ; 2
; Joined path conditions
(push) ; 2
; [eval] diz != null
(push) ; 3
(assert (not (not
  (=
    (Wand_list_for_list__get_in_1 ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) diz@2@01)
    $Ref.null))))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (not
  (=
    (Wand_list_for_list__get_in_1 ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) diz@2@01)
    $Ref.null)))
(assert (List__contents%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))) (Wand_list_for_list__get_in_1 ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) diz@2@01)))
(pop) ; 2
; Joined path conditions
(assert (and
  (not
    (=
      (Wand_list_for_list__get_in_1 ($Snap.combine
        $Snap.unit
        ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) diz@2@01)
      $Ref.null))
  (List__contents%precondition ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))) (Wand_list_for_list__get_in_1 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) diz@2@01))))
; [eval] Wand_list_for_list__get_in_1_0(diz)
(push) ; 2
; [eval] diz != null
(assert (Wand_list_for_list__get_in_1_0%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) diz@2@01))
(pop) ; 2
; Joined path conditions
(assert (Wand_list_for_list__get_in_1_0%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) diz@2@01))
(assert (Seq_equal
  (List__contents ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))) (Wand_list_for_list__get_in_1 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) diz@2@01))
  (Wand_list_for_list__get_in_1_0 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) diz@2@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))
  $Snap.unit))
; [eval] Wand_list_for_list__get_out_1(diz) != null
; [eval] Wand_list_for_list__get_out_1(diz)
(push) ; 2
; [eval] diz != null
(assert (Wand_list_for_list__get_out_1%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) diz@2@01))
(pop) ; 2
; Joined path conditions
(assert (Wand_list_for_list__get_out_1%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) diz@2@01))
(assert (not
  (=
    (Wand_list_for_list__get_out_1 ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) diz@2@01)
    $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@5@01 $Snap)
(assert (= $t@5@01 ($Snap.combine ($Snap.first $t@5@01) ($Snap.second $t@5@01))))
; [eval] old(Wand_list_for_list__get_out_1(diz))
; [eval] Wand_list_for_list__get_out_1(diz)
(push) ; 3
; [eval] diz != null
(pop) ; 3
; Joined path conditions
(assert (= ($Snap.second $t@5@01) $Snap.unit))
; [eval] List__contents(old(Wand_list_for_list__get_out_1(diz))) == old(Wand_list_for_list__get_out_1_0(diz))
; [eval] List__contents(old(Wand_list_for_list__get_out_1(diz)))
; [eval] old(Wand_list_for_list__get_out_1(diz))
; [eval] Wand_list_for_list__get_out_1(diz)
(push) ; 3
; [eval] diz != null
(pop) ; 3
; Joined path conditions
(push) ; 3
; [eval] diz != null
(assert (List__contents%precondition ($Snap.combine $Snap.unit ($Snap.first $t@5@01)) (Wand_list_for_list__get_out_1 ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) diz@2@01)))
(pop) ; 3
; Joined path conditions
(assert (List__contents%precondition ($Snap.combine $Snap.unit ($Snap.first $t@5@01)) (Wand_list_for_list__get_out_1 ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) diz@2@01)))
; [eval] old(Wand_list_for_list__get_out_1_0(diz))
; [eval] Wand_list_for_list__get_out_1_0(diz)
(push) ; 3
; [eval] diz != null
(assert (Wand_list_for_list__get_out_1_0%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) diz@2@01))
(pop) ; 3
; Joined path conditions
(assert (Wand_list_for_list__get_out_1_0%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) diz@2@01))
(assert (Seq_equal
  (List__contents ($Snap.combine $Snap.unit ($Snap.first $t@5@01)) (Wand_list_for_list__get_out_1 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) diz@2@01))
  (Wand_list_for_list__get_out_1_0 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) diz@2@01)))
(pop) ; 2
(push) ; 2
; [exec]
; unfold acc(Wand_list_for_list__valid_wand(diz), write)
(assert (=
  ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@4@01))))
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))
(declare-const $k@6@01 $Perm)
(assert ($Perm.isReadVar $k@6@01))
(assert (<= $Perm.No $k@6@01))
(assert (<= $k@6@01 $Perm.Write))
(assert (=> (< $Perm.No $k@6@01) (not (= diz@2@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))
  $Snap.unit))
; [eval] 1 <= diz.Wand_list_for_list__lemma
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@6@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (<=
  1
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))
(declare-const $k@7@01 $Perm)
(assert ($Perm.isReadVar $k@7@01))
(assert (<= $Perm.No $k@7@01))
(assert (<= $k@7@01 $Perm.Write))
(assert (=> (< $Perm.No $k@7@01) (not (= diz@2@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))
  $Snap.unit))
; [eval] diz.Wand_list_for_list__in_1 != null
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@7@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))
    $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))
(declare-const $k@8@01 $Perm)
(assert ($Perm.isReadVar $k@8@01))
(assert (<= $Perm.No $k@8@01))
(assert (<= $k@8@01 $Perm.Write))
(assert (=> (< $Perm.No $k@8@01) (not (= diz@2@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))
(declare-const $k@9@01 $Perm)
(assert ($Perm.isReadVar $k@9@01))
(assert (<= $Perm.No $k@9@01))
(assert (<= $k@9@01 $Perm.Write))
(assert (=> (< $Perm.No $k@9@01) (not (= diz@2@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))
  $Snap.unit))
; [eval] diz.Wand_list_for_list__out_1 != null
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@9@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))
    $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))
(declare-const $k@10@01 $Perm)
(assert ($Perm.isReadVar $k@10@01))
(assert (<= $Perm.No $k@10@01))
(assert (<= $k@10@01 $Perm.Write))
(assert (=> (< $Perm.No $k@10@01) (not (= diz@2@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))
(declare-const $k@11@01 $Perm)
(assert ($Perm.isReadVar $k@11@01))
(assert (<= $Perm.No $k@11@01))
(assert (<= $k@11@01 $Perm.Write))
(assert (=> (< $Perm.No $k@11@01) (not (= diz@2@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))
(declare-const $k@12@01 $Perm)
(assert ($Perm.isReadVar $k@12@01))
(assert (<= $Perm.No $k@12@01))
(assert (<= $k@12@01 $Perm.Write))
(assert (=> (< $Perm.No $k@12@01) (not (= diz@2@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))
(declare-const $k@13@01 $Perm)
(assert ($Perm.isReadVar $k@13@01))
(assert (<= $Perm.No $k@13@01))
(assert (<= $k@13@01 $Perm.Write))
(assert (=> (< $Perm.No $k@13@01) (not (= diz@2@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))
(declare-const $k@14@01 $Perm)
(assert ($Perm.isReadVar $k@14@01))
(assert (<= $Perm.No $k@14@01))
(assert (<= $k@14@01 $Perm.Write))
(assert (=> (< $Perm.No $k@14@01) (not (= diz@2@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))
(declare-const $k@15@01 $Perm)
(assert ($Perm.isReadVar $k@15@01))
(assert (<= $Perm.No $k@15@01))
(assert (<= $k@15@01 $Perm.Write))
(assert (=> (< $Perm.No $k@15@01) (not (= diz@2@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))
(declare-const $k@16@01 $Perm)
(assert ($Perm.isReadVar $k@16@01))
(assert (<= $Perm.No $k@16@01))
(assert (<= $k@16@01 $Perm.Write))
(assert (=> (< $Perm.No $k@16@01) (not (= diz@2@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))
(declare-const $k@17@01 $Perm)
(assert ($Perm.isReadVar $k@17@01))
(assert (<= $Perm.No $k@17@01))
(assert (<= $k@17@01 $Perm.Write))
(assert (=> (< $Perm.No $k@17@01) (not (= diz@2@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))
(declare-const $k@18@01 $Perm)
(assert ($Perm.isReadVar $k@18@01))
(assert (<= $Perm.No $k@18@01))
(assert (<= $k@18@01 $Perm.Write))
(assert (=> (< $Perm.No $k@18@01) (not (= diz@2@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))
; [eval] diz.Wand_list_for_list__lemma == 1
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@6@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))
    1))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))
  1)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [then-branch: 0 | First:(First:(Second:(Second:($t@4@01)))) == 1 | live]
; [else-branch: 0 | First:(First:(Second:(Second:($t@4@01)))) != 1 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | First:(First:(Second:(Second:($t@4@01)))) == 1]
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))
  1))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))
(assert (=
  ($Snap.first ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))
  $Snap.unit))
; [eval] diz.Wand_list_for_list__this_1 != null
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@11@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))
    $Ref.null)))
(assert (=
  ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@15@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))
    $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@15@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))
  $Snap.unit))
; [eval] diz.Wand_list_for_list__tmp_1.List__next == diz.Wand_list_for_list__cursor_1
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@15@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@17@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))))
  $Snap.unit))
; [eval] diz.Wand_list_for_list__tmp_suffix_1 == Seq(diz.Wand_list_for_list__tmp_1.List__val) ++ diz.Wand_list_for_list__suffix_1
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@13@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [eval] Seq(diz.Wand_list_for_list__tmp_1.List__val) ++ diz.Wand_list_for_list__suffix_1
; [eval] Seq(diz.Wand_list_for_list__tmp_1.List__val)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@15@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (=
  (Seq_length
    (Seq_singleton ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))))
  1))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@16@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (Seq_equal
  ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))
  (Seq_append
    (Seq_singleton ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))
    ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))))
  $Snap.unit))
; [eval] diz.Wand_list_for_list__wand_1 != null
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@18@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))
    $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))))))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@18@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))))))
  $Snap.unit))
; [eval] Wand_list_for_list__get_in_1(diz.Wand_list_for_list__wand_1) == diz.Wand_list_for_list__tmp_1
; [eval] Wand_list_for_list__get_in_1(diz.Wand_list_for_list__wand_1)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@18@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
; [eval] diz != null
(assert (Wand_list_for_list__get_in_1%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))
(pop) ; 4
; Joined path conditions
(assert (Wand_list_for_list__get_in_1%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@15@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (=
  (Wand_list_for_list__get_in_1 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))))))))
  $Snap.unit))
; [eval] Wand_list_for_list__get_in_1_0(diz.Wand_list_for_list__wand_1) == diz.Wand_list_for_list__tmp_suffix_1 ++ diz.Wand_list_for_list__L2_1
; [eval] Wand_list_for_list__get_in_1_0(diz.Wand_list_for_list__wand_1)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@18@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
; [eval] diz != null
(assert (Wand_list_for_list__get_in_1_0%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))
(pop) ; 4
; Joined path conditions
(assert (Wand_list_for_list__get_in_1_0%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))
; [eval] diz.Wand_list_for_list__tmp_suffix_1 ++ diz.Wand_list_for_list__L2_1
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@13@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@12@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (Seq_equal
  (Wand_list_for_list__get_in_1_0 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))
  (Seq_append
    ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))
    ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))))))))
  $Snap.unit))
; [eval] Wand_list_for_list__get_out_1(diz.Wand_list_for_list__wand_1) == diz.Wand_list_for_list__this_1
; [eval] Wand_list_for_list__get_out_1(diz.Wand_list_for_list__wand_1)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@18@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
; [eval] diz != null
(assert (Wand_list_for_list__get_out_1%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))
(pop) ; 4
; Joined path conditions
(assert (Wand_list_for_list__get_out_1%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@11@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (=
  (Wand_list_for_list__get_out_1 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))))))))))
  $Snap.unit))
; [eval] Wand_list_for_list__get_out_1_0(diz.Wand_list_for_list__wand_1) == diz.Wand_list_for_list__L1_1 ++ diz.Wand_list_for_list__L2_1
; [eval] Wand_list_for_list__get_out_1_0(diz.Wand_list_for_list__wand_1)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@18@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
; [eval] diz != null
(assert (Wand_list_for_list__get_out_1_0%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))
(pop) ; 4
; Joined path conditions
(assert (Wand_list_for_list__get_out_1_0%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))
; [eval] diz.Wand_list_for_list__L1_1 ++ diz.Wand_list_for_list__L2_1
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@14@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@12@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (Seq_equal
  (Wand_list_for_list__get_out_1_0 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))
  (Seq_append
    ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))
    ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))))))))))
  $Snap.unit))
; [eval] diz.Wand_list_for_list__in_1 == diz.Wand_list_for_list__cursor_1
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@7@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@17@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))))))))))))
  $Snap.unit))
; [eval] diz.Wand_list_for_list__in_1_0 == diz.Wand_list_for_list__suffix_1 ++ diz.Wand_list_for_list__L2_1
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@8@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [eval] diz.Wand_list_for_list__suffix_1 ++ diz.Wand_list_for_list__L2_1
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@16@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@12@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (Seq_equal
  ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))
  (Seq_append
    ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))
    ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))))))))))))
  $Snap.unit))
; [eval] diz.Wand_list_for_list__out_1 == diz.Wand_list_for_list__this_1
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@9@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@11@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))))))))))))
  $Snap.unit))
; [eval] diz.Wand_list_for_list__out_1_0 == diz.Wand_list_for_list__L1_1 ++ diz.Wand_list_for_list__L2_1
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@10@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [eval] diz.Wand_list_for_list__L1_1 ++ diz.Wand_list_for_list__L2_1
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@14@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@12@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (Seq_equal
  ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))
  (Seq_append
    ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))
    ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))
(declare-const $k@19@01 $Perm)
(assert ($Perm.isReadVar $k@19@01))
(assert (<= $Perm.No $k@19@01))
(assert (<= $k@19@01 $Perm.Write))
(assert (=> (< $Perm.No $k@19@01) (not (= diz@2@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))))
(declare-const $k@20@01 $Perm)
(assert ($Perm.isReadVar $k@20@01))
(assert (<= $Perm.No $k@20@01))
(assert (<= $k@20@01 $Perm.Write))
(assert (=> (< $Perm.No $k@20@01) (not (= diz@2@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))))
(declare-const $k@21@01 $Perm)
(assert ($Perm.isReadVar $k@21@01))
(assert (<= $Perm.No $k@21@01))
(assert (<= $k@21@01 $Perm.Write))
(assert (=> (< $Perm.No $k@21@01) (not (= diz@2@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))
  $Snap.unit))
; [eval] diz.Wand_list_for_list__lemma == 2 ==> diz.Wand_list_for_list__this_2 != null && (diz.Wand_list_for_list__in_1 == diz.Wand_list_for_list__this_2 && (diz.Wand_list_for_list__in_1_0 == diz.Wand_list_for_list__L1_2 ++ diz.Wand_list_for_list__L2_2 && (diz.Wand_list_for_list__out_1 == diz.Wand_list_for_list__this_2 && diz.Wand_list_for_list__out_1_0 == diz.Wand_list_for_list__L1_2 ++ diz.Wand_list_for_list__L2_2)))
; [eval] diz.Wand_list_for_list__lemma == 2
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@6@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))
    2))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [then-branch: 1 | First:(First:(Second:(Second:($t@4@01)))) == 2 | dead]
; [else-branch: 1 | First:(First:(Second:(Second:($t@4@01)))) != 2 | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 1 | First:(First:(Second:(Second:($t@4@01)))) != 2]
(assert (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))
    2)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))
    2)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))
  $Snap.unit))
; [eval] diz.Wand_list_for_list__lemma <= 2
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@6@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (<=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))
  2))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (Wand_list_for_list__valid_wand%trigger ($Snap.first ($Snap.second ($Snap.second $t@4@01))) diz@2@01))
; [eval] diz.Wand_list_for_list__lemma == 1
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@6@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))
    1))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [then-branch: 2 | First:(First:(Second:(Second:($t@4@01)))) == 1 | live]
; [else-branch: 2 | First:(First:(Second:(Second:($t@4@01)))) != 1 | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 2 | First:(First:(Second:(Second:($t@4@01)))) == 1]
; [exec]
; fold acc(List__state(diz.Wand_list_for_list__tmp_1), write)
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@15@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [eval] diz.List__next != null
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))
    $Ref.null))))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [then-branch: 3 | First:(Second:(Second:(First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:(Second:(Second:($t@4@01))))))))))))))))))))))) != Null | live]
; [else-branch: 3 | First:(Second:(Second:(First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:(Second:(Second:($t@4@01))))))))))))))))))))))) == Null | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 3 | First:(Second:(Second:(First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:(Second:(Second:($t@4@01))))))))))))))))))))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))
    $Ref.null)))
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  (Wand_list_for_list__get_in_1 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) diz@2@01)
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (List__state%trigger ($Snap.combine
  ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))
; [exec]
; Wand_list_for_list___apply(diz.Wand_list_for_list__wand_1, current_thread_id)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No $k@18@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [eval] diz != null
; [eval] current_thread_id >= 0
; [eval] Wand_list_for_list__get_in_1(diz)
(set-option :timeout 0)
(push) ; 6
; [eval] diz != null
(pop) ; 6
; Joined path conditions
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))
  (Wand_list_for_list__get_in_1 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [eval] List__contents(Wand_list_for_list__get_in_1(diz)) == Wand_list_for_list__get_in_1_0(diz)
; [eval] List__contents(Wand_list_for_list__get_in_1(diz))
; [eval] Wand_list_for_list__get_in_1(diz)
(set-option :timeout 0)
(push) ; 6
; [eval] diz != null
(pop) ; 6
; Joined path conditions
(push) ; 6
; [eval] diz != null
(push) ; 7
(assert (not (not
  (=
    (Wand_list_for_list__get_in_1 ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))
    $Ref.null))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (not
  (=
    (Wand_list_for_list__get_in_1 ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))
    $Ref.null)))
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))
  (Wand_list_for_list__get_in_1 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (List__contents%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))) (Wand_list_for_list__get_in_1 ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))
(pop) ; 6
; Joined path conditions
(assert (and
  (not
    (=
      (Wand_list_for_list__get_in_1 ($Snap.combine
        $Snap.unit
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))
      $Ref.null))
  (List__contents%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))) (Wand_list_for_list__get_in_1 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))
; [eval] Wand_list_for_list__get_in_1_0(diz)
(set-option :timeout 0)
(push) ; 6
; [eval] diz != null
(pop) ; 6
; Joined path conditions
(push) ; 6
(assert (not (Seq_equal
  (List__contents ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))) (Wand_list_for_list__get_in_1 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))
  (Wand_list_for_list__get_in_1_0 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))
(check-sat)
; unsat
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(assert (Seq_equal
  (List__contents ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))) (Wand_list_for_list__get_in_1 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))
  (Wand_list_for_list__get_in_1_0 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))
; [eval] Wand_list_for_list__get_out_1(diz) != null
; [eval] Wand_list_for_list__get_out_1(diz)
(push) ; 6
; [eval] diz != null
(pop) ; 6
; Joined path conditions
(push) ; 6
(assert (not (not
  (=
    (Wand_list_for_list__get_out_1 ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))
    $Ref.null))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (not
  (=
    (Wand_list_for_list__get_out_1 ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))
    $Ref.null)))
(declare-const $t@22@01 $Snap)
(assert (= $t@22@01 ($Snap.combine ($Snap.first $t@22@01) ($Snap.second $t@22@01))))
; [eval] old(Wand_list_for_list__get_out_1(diz))
; [eval] Wand_list_for_list__get_out_1(diz)
(push) ; 6
; [eval] diz != null
(pop) ; 6
; Joined path conditions
(assert (= ($Snap.second $t@22@01) $Snap.unit))
; [eval] List__contents(old(Wand_list_for_list__get_out_1(diz))) == old(Wand_list_for_list__get_out_1_0(diz))
; [eval] List__contents(old(Wand_list_for_list__get_out_1(diz)))
; [eval] old(Wand_list_for_list__get_out_1(diz))
; [eval] Wand_list_for_list__get_out_1(diz)
(push) ; 6
; [eval] diz != null
(pop) ; 6
; Joined path conditions
(push) ; 6
; [eval] diz != null
(assert (List__contents%precondition ($Snap.combine $Snap.unit ($Snap.first $t@22@01)) (Wand_list_for_list__get_out_1 ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))
(pop) ; 6
; Joined path conditions
(assert (List__contents%precondition ($Snap.combine $Snap.unit ($Snap.first $t@22@01)) (Wand_list_for_list__get_out_1 ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))
; [eval] old(Wand_list_for_list__get_out_1_0(diz))
; [eval] Wand_list_for_list__get_out_1_0(diz)
(push) ; 6
; [eval] diz != null
(pop) ; 6
; Joined path conditions
(assert (Seq_equal
  (List__contents ($Snap.combine $Snap.unit ($Snap.first $t@22@01)) (Wand_list_for_list__get_out_1 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))
  (Wand_list_for_list__get_out_1_0 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; assert acc(List__state(old(Wand_list_for_list__get_out_1(diz))), write) &&
;   List__contents(old(Wand_list_for_list__get_out_1(diz))) ==
;   old(Wand_list_for_list__get_out_1_0(diz))
; [eval] old(Wand_list_for_list__get_out_1(diz))
; [eval] Wand_list_for_list__get_out_1(diz)
(set-option :timeout 0)
(push) ; 6
; [eval] diz != null
(pop) ; 6
; Joined path conditions
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  (Wand_list_for_list__get_out_1 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))
  (Wand_list_for_list__get_out_1 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) diz@2@01))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [eval] List__contents(old(Wand_list_for_list__get_out_1(diz))) == old(Wand_list_for_list__get_out_1_0(diz))
; [eval] List__contents(old(Wand_list_for_list__get_out_1(diz)))
; [eval] old(Wand_list_for_list__get_out_1(diz))
; [eval] Wand_list_for_list__get_out_1(diz)
(set-option :timeout 0)
(push) ; 6
; [eval] diz != null
(pop) ; 6
; Joined path conditions
(push) ; 6
; [eval] diz != null
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  (Wand_list_for_list__get_out_1 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))
  (Wand_list_for_list__get_out_1 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) diz@2@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (List__contents%precondition ($Snap.combine $Snap.unit ($Snap.first $t@22@01)) (Wand_list_for_list__get_out_1 ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) diz@2@01)))
(pop) ; 6
; Joined path conditions
(assert (List__contents%precondition ($Snap.combine $Snap.unit ($Snap.first $t@22@01)) (Wand_list_for_list__get_out_1 ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) diz@2@01)))
; [eval] old(Wand_list_for_list__get_out_1_0(diz))
; [eval] Wand_list_for_list__get_out_1_0(diz)
(set-option :timeout 0)
(push) ; 6
; [eval] diz != null
(assert (Wand_list_for_list__get_out_1_0%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) diz@2@01))
(pop) ; 6
; Joined path conditions
(assert (Wand_list_for_list__get_out_1_0%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) diz@2@01))
(push) ; 6
(assert (not (Seq_equal
  (List__contents ($Snap.combine $Snap.unit ($Snap.first $t@22@01)) (Wand_list_for_list__get_out_1 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) diz@2@01))
  (Wand_list_for_list__get_out_1_0 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) diz@2@01))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (Seq_equal
  (List__contents ($Snap.combine $Snap.unit ($Snap.first $t@22@01)) (Wand_list_for_list__get_out_1 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) diz@2@01))
  (Wand_list_for_list__get_out_1_0 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) diz@2@01)))
; [exec]
; inhale false
(pop) ; 5
(pop) ; 4
; [eval] !(diz.Wand_list_for_list__lemma == 1)
; [eval] diz.Wand_list_for_list__lemma == 1
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@6@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [then-branch: 4 | First:(First:(Second:(Second:($t@4@01)))) != 1 | dead]
; [else-branch: 4 | First:(First:(Second:(Second:($t@4@01)))) == 1 | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 4 | First:(First:(Second:(Second:($t@4@01)))) == 1]
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 0 | First:(First:(Second:(Second:($t@4@01)))) != 1]
(assert (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))
    1)))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))
  $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))
(declare-const $k@23@01 $Perm)
(assert ($Perm.isReadVar $k@23@01))
(assert (<= $Perm.No $k@23@01))
(assert (<= $k@23@01 $Perm.Write))
(assert (=> (< $Perm.No $k@23@01) (not (= diz@2@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))))
(declare-const $k@24@01 $Perm)
(assert ($Perm.isReadVar $k@24@01))
(assert (<= $Perm.No $k@24@01))
(assert (<= $k@24@01 $Perm.Write))
(assert (=> (< $Perm.No $k@24@01) (not (= diz@2@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))))
(declare-const $k@25@01 $Perm)
(assert ($Perm.isReadVar $k@25@01))
(assert (<= $Perm.No $k@25@01))
(assert (<= $k@25@01 $Perm.Write))
(assert (=> (< $Perm.No $k@25@01) (not (= diz@2@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))
  $Snap.unit))
; [eval] diz.Wand_list_for_list__lemma == 2 ==> diz.Wand_list_for_list__this_2 != null && (diz.Wand_list_for_list__in_1 == diz.Wand_list_for_list__this_2 && (diz.Wand_list_for_list__in_1_0 == diz.Wand_list_for_list__L1_2 ++ diz.Wand_list_for_list__L2_2 && (diz.Wand_list_for_list__out_1 == diz.Wand_list_for_list__this_2 && diz.Wand_list_for_list__out_1_0 == diz.Wand_list_for_list__L1_2 ++ diz.Wand_list_for_list__L2_2)))
; [eval] diz.Wand_list_for_list__lemma == 2
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@6@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))
    2))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))
  2)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [then-branch: 5 | First:(First:(Second:(Second:($t@4@01)))) == 2 | live]
; [else-branch: 5 | First:(First:(Second:(Second:($t@4@01)))) != 2 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 5 | First:(First:(Second:(Second:($t@4@01)))) == 2]
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))
  2))
; [eval] diz.Wand_list_for_list__this_2 != null && (diz.Wand_list_for_list__in_1 == diz.Wand_list_for_list__this_2 && (diz.Wand_list_for_list__in_1_0 == diz.Wand_list_for_list__L1_2 ++ diz.Wand_list_for_list__L2_2 && (diz.Wand_list_for_list__out_1 == diz.Wand_list_for_list__this_2 && diz.Wand_list_for_list__out_1_0 == diz.Wand_list_for_list__L1_2 ++ diz.Wand_list_for_list__L2_2)))
; [eval] diz.Wand_list_for_list__this_2 != null
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No $k@23@01)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
; [then-branch: 6 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:(Second:(Second:($t@4@01))))))))))))))))))))) != Null | live]
; [else-branch: 6 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:(Second:(Second:($t@4@01))))))))))))))))))))) == Null | live]
(push) ; 7
; [then-branch: 6 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:(Second:(Second:($t@4@01))))))))))))))))))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))
    $Ref.null)))
; [eval] diz.Wand_list_for_list__in_1 == diz.Wand_list_for_list__this_2
(push) ; 8
(set-option :timeout 10)
(assert (not (< $Perm.No $k@7@01)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (< $Perm.No $k@23@01)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
; [then-branch: 7 | First:(Second:(Second:(First:(Second:(Second:($t@4@01)))))) == First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:(Second:(Second:($t@4@01))))))))))))))))))))) | live]
; [else-branch: 7 | First:(Second:(Second:(First:(Second:(Second:($t@4@01)))))) != First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:(Second:(Second:($t@4@01))))))))))))))))))))) | live]
(push) ; 9
; [then-branch: 7 | First:(Second:(Second:(First:(Second:(Second:($t@4@01)))))) == First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:(Second:(Second:($t@4@01)))))))))))))))))))))]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))
; [eval] diz.Wand_list_for_list__in_1_0 == diz.Wand_list_for_list__L1_2 ++ diz.Wand_list_for_list__L2_2
(push) ; 10
(set-option :timeout 10)
(assert (not (< $Perm.No $k@8@01)))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [eval] diz.Wand_list_for_list__L1_2 ++ diz.Wand_list_for_list__L2_2
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (< $Perm.No $k@25@01)))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 10)
(assert (not (< $Perm.No $k@24@01)))
(check-sat)
; unsat
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 10
; [then-branch: 8 | First:(Second:(Second:(Second:(Second:(First:(Second:(Second:($t@4@01)))))))) === First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:(Second:(Second:($t@4@01))))))))))))))))))))))) ++ First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:(Second:(Second:($t@4@01)))))))))))))))))))))) | live]
; [else-branch: 8 | !(First:(Second:(Second:(Second:(Second:(First:(Second:(Second:($t@4@01)))))))) === First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:(Second:(Second:($t@4@01))))))))))))))))))))))) ++ First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:(Second:(Second:($t@4@01))))))))))))))))))))))) | live]
(push) ; 11
; [then-branch: 8 | First:(Second:(Second:(Second:(Second:(First:(Second:(Second:($t@4@01)))))))) === First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:(Second:(Second:($t@4@01))))))))))))))))))))))) ++ First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:(Second:(Second:($t@4@01))))))))))))))))))))))]
(assert (Seq_equal
  ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))
  (Seq_append
    ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))
    ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))))
; [eval] diz.Wand_list_for_list__out_1 == diz.Wand_list_for_list__this_2
(push) ; 12
(set-option :timeout 10)
(assert (not (< $Perm.No $k@9@01)))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (< $Perm.No $k@23@01)))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
; [then-branch: 9 | First:(Second:(Second:(Second:(Second:(Second:(First:(Second:(Second:($t@4@01))))))))) == First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:(Second:(Second:($t@4@01))))))))))))))))))))) | live]
; [else-branch: 9 | First:(Second:(Second:(Second:(Second:(Second:(First:(Second:(Second:($t@4@01))))))))) != First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:(Second:(Second:($t@4@01))))))))))))))))))))) | live]
(push) ; 13
; [then-branch: 9 | First:(Second:(Second:(Second:(Second:(Second:(First:(Second:(Second:($t@4@01))))))))) == First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:(Second:(Second:($t@4@01)))))))))))))))))))))]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))
; [eval] diz.Wand_list_for_list__out_1_0 == diz.Wand_list_for_list__L1_2 ++ diz.Wand_list_for_list__L2_2
(push) ; 14
(set-option :timeout 10)
(assert (not (< $Perm.No $k@10@01)))
(check-sat)
; unsat
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
; [eval] diz.Wand_list_for_list__L1_2 ++ diz.Wand_list_for_list__L2_2
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (< $Perm.No $k@25@01)))
(check-sat)
; unsat
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 14
(set-option :timeout 10)
(assert (not (< $Perm.No $k@24@01)))
(check-sat)
; unsat
(pop) ; 14
; 0.00s
; (get-info :all-statistics)
(pop) ; 13
(set-option :timeout 0)
(push) ; 13
; [else-branch: 9 | First:(Second:(Second:(Second:(Second:(Second:(First:(Second:(Second:($t@4@01))))))))) != First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:(Second:(Second:($t@4@01)))))))))))))))))))))]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))))
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))))
(pop) ; 11
(push) ; 11
; [else-branch: 8 | !(First:(Second:(Second:(Second:(Second:(First:(Second:(Second:($t@4@01)))))))) === First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:(Second:(Second:($t@4@01))))))))))))))))))))))) ++ First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:(Second:(Second:($t@4@01)))))))))))))))))))))))]
(assert (not
  (Seq_equal
    ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))
    (Seq_append
      ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))
      ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))))))
(pop) ; 11
(pop) ; 10
; Joined path conditions
(assert (=>
  (Seq_equal
    ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))
    (Seq_append
      ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))
      ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))))
  (and
    (Seq_equal
      ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))
      (Seq_append
        ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))
        ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))))
    (or
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))))))
; Joined path conditions
(assert (or
  (not
    (Seq_equal
      ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))
      (Seq_append
        ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))
        ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))))
  (Seq_equal
    ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))
    (Seq_append
      ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))
      ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))))))
(pop) ; 9
(push) ; 9
; [else-branch: 7 | First:(Second:(Second:(First:(Second:(Second:($t@4@01)))))) != First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:(Second:(Second:($t@4@01)))))))))))))))))))))]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (=>
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))
  (and
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))
    (=>
      (Seq_equal
        ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))
        (Seq_append
          ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))
          ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))))
      (and
        (Seq_equal
          ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))
          (Seq_append
            ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))
            ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))))
        (or
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))))
    (or
      (not
        (Seq_equal
          ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))
          (Seq_append
            ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))
            ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))))
      (Seq_equal
        ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))
        (Seq_append
          ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))
          ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))))))))
; Joined path conditions
(assert (or
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))))
(pop) ; 7
(push) ; 7
; [else-branch: 6 | First:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(Second:(First:(Second:(Second:($t@4@01))))))))))))))))))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))
  $Ref.null))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))
      $Ref.null))
  (and
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))
        $Ref.null))
    (=>
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))
      (and
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))
        (=>
          (Seq_equal
            ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))
            (Seq_append
              ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))
              ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))))
          (and
            (Seq_equal
              ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))
              (Seq_append
                ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))
                ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))))
            (or
              (not
                (=
                  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))
                  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))
              (=
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))
                ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))))
        (or
          (not
            (Seq_equal
              ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))
              (Seq_append
                ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))
                ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))))
          (Seq_equal
            ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))
            (Seq_append
              ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))
              ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))))))
    (or
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))))))
; Joined path conditions
(assert (or
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))
    $Ref.null)
  (not
    (=
      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))
      $Ref.null))))
(pop) ; 5
(push) ; 5
; [else-branch: 5 | First:(First:(Second:(Second:($t@4@01)))) != 2]
(assert (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))
    2)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))
    2)
  (and
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))
      2)
    (=>
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))
          $Ref.null))
      (and
        (not
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))
            $Ref.null))
        (=>
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))
          (and
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))
            (=>
              (Seq_equal
                ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))
                (Seq_append
                  ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))
                  ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))))
              (and
                (Seq_equal
                  ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))
                  (Seq_append
                    ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))
                    ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))))
                (or
                  (not
                    (=
                      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))
                      ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))
                  (=
                    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))
                    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))))
            (or
              (not
                (Seq_equal
                  ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))
                  (Seq_append
                    ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))
                    ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))))
              (Seq_equal
                ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))
                (Seq_append
                  ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))
                  ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))))))
        (or
          (not
            (=
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))
              ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))))
    (or
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))
        $Ref.null)
      (not
        (=
          ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))
          $Ref.null))))))
; Joined path conditions
(assert (or
  (not
    (=
      ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))
      2))
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))
    2)))
(assert (=>
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))
    2)
  (and
    (and
      (and
        (and
          (Seq_equal
            ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))
            (Seq_append
              ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))
              ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))))))))))))))))))
          (=
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))
            ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))
        (Seq_equal
          ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))))
          (Seq_append
            ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))
            ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))))
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))))
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))
    (not
      (=
        ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))
        $Ref.null)))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@4@01))))))))))))))))))))))))
  $Snap.unit))
; [eval] diz.Wand_list_for_list__lemma <= 2
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@6@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (<=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))
  2))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (Wand_list_for_list__valid_wand%trigger ($Snap.first ($Snap.second ($Snap.second $t@4@01))) diz@2@01))
; [eval] diz.Wand_list_for_list__lemma == 1
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@6@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [then-branch: 10 | First:(First:(Second:(Second:($t@4@01)))) == 1 | dead]
; [else-branch: 10 | First:(First:(Second:(Second:($t@4@01)))) != 1 | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 10 | First:(First:(Second:(Second:($t@4@01)))) != 1]
(pop) ; 4
; [eval] !(diz.Wand_list_for_list__lemma == 1)
; [eval] diz.Wand_list_for_list__lemma == 1
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@6@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))
  1)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [then-branch: 11 | First:(First:(Second:(Second:($t@4@01)))) != 1 | live]
; [else-branch: 11 | First:(First:(Second:(Second:($t@4@01)))) == 1 | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 11 | First:(First:(Second:(Second:($t@4@01)))) != 1]
; [eval] diz.Wand_list_for_list__lemma == 2
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@6@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))
    2))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))
  2)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [then-branch: 12 | First:(First:(Second:(Second:($t@4@01)))) == 2 | live]
; [else-branch: 12 | First:(First:(Second:(Second:($t@4@01)))) != 2 | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 12 | First:(First:(Second:(Second:($t@4@01)))) == 2]
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))
  2))
; [exec]
; assert acc(List__state(old(Wand_list_for_list__get_out_1(diz))), write) &&
;   List__contents(old(Wand_list_for_list__get_out_1(diz))) ==
;   old(Wand_list_for_list__get_out_1_0(diz))
; [eval] old(Wand_list_for_list__get_out_1(diz))
; [eval] Wand_list_for_list__get_out_1(diz)
(push) ; 6
; [eval] diz != null
(pop) ; 6
; Joined path conditions
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  (Wand_list_for_list__get_in_1 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) diz@2@01)
  (Wand_list_for_list__get_out_1 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) diz@2@01))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [eval] List__contents(old(Wand_list_for_list__get_out_1(diz))) == old(Wand_list_for_list__get_out_1_0(diz))
; [eval] List__contents(old(Wand_list_for_list__get_out_1(diz)))
; [eval] old(Wand_list_for_list__get_out_1(diz))
; [eval] Wand_list_for_list__get_out_1(diz)
(set-option :timeout 0)
(push) ; 6
; [eval] diz != null
(pop) ; 6
; Joined path conditions
(push) ; 6
; [eval] diz != null
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  (Wand_list_for_list__get_in_1 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) diz@2@01)
  (Wand_list_for_list__get_out_1 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) diz@2@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (List__contents%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))) (Wand_list_for_list__get_out_1 ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) diz@2@01)))
(pop) ; 6
; Joined path conditions
(assert (List__contents%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))) (Wand_list_for_list__get_out_1 ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) diz@2@01)))
; [eval] old(Wand_list_for_list__get_out_1_0(diz))
; [eval] Wand_list_for_list__get_out_1_0(diz)
(set-option :timeout 0)
(push) ; 6
; [eval] diz != null
(assert (Wand_list_for_list__get_out_1_0%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) diz@2@01))
(pop) ; 6
; Joined path conditions
(assert (Wand_list_for_list__get_out_1_0%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) diz@2@01))
(push) ; 6
(assert (not (Seq_equal
  (List__contents ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))) (Wand_list_for_list__get_out_1 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) diz@2@01))
  (Wand_list_for_list__get_out_1_0 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) diz@2@01))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (Seq_equal
  (List__contents ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))) (Wand_list_for_list__get_out_1 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) diz@2@01))
  (Wand_list_for_list__get_out_1_0 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) diz@2@01)))
; [exec]
; inhale false
(pop) ; 5
; [eval] !(diz.Wand_list_for_list__lemma == 2)
; [eval] diz.Wand_list_for_list__lemma == 2
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@6@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))
  2)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [then-branch: 13 | First:(First:(Second:(Second:($t@4@01)))) != 2 | dead]
; [else-branch: 13 | First:(First:(Second:(Second:($t@4@01)))) == 2 | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 13 | First:(First:(Second:(Second:($t@4@01)))) == 2]
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@4@01)))))
  2))
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- Wand_list_for_list__Wand_list_for_list ----------
(declare-const current_thread_id@26@01 Int)
(declare-const sys__result@27@01 $Ref)
(declare-const current_thread_id@28@01 Int)
(declare-const sys__result@29@01 $Ref)
(push) ; 1
(declare-const $t@30@01 $Snap)
(assert (= $t@30@01 $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@28@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@31@01 $Snap)
(assert (= $t@31@01 ($Snap.combine ($Snap.first $t@31@01) ($Snap.second $t@31@01))))
(assert (= ($Snap.first $t@31@01) $Snap.unit))
; [eval] sys__result != null
(assert (not (= sys__result@29@01 $Ref.null)))
(assert (=
  ($Snap.second $t@31@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@31@01))
    ($Snap.second ($Snap.second $t@31@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@31@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@31@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@31@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@31@01))) $Snap.unit))
; [eval] sys__result.Wand_list_for_list__lemma == 0
(assert (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@31@01))) 0))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@31@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@31@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))
  $Snap.unit))
; [eval] sys__result.Wand_list_for_list__in_1 == null
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))))
  $Snap.unit))
; [eval] sys__result.Wand_list_for_list__in_1_0 == Seq[Int]()
; [eval] Seq[Int]()
(assert (Seq_equal
  ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))))
  (as Seq_empty  Seq<Int>)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))))))
  $Snap.unit))
; [eval] sys__result.Wand_list_for_list__out_1 == null
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))))))))
  $Snap.unit))
; [eval] sys__result.Wand_list_for_list__out_1_0 == Seq[Int]()
; [eval] Seq[Int]()
(assert (Seq_equal
  ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))))))))
  (as Seq_empty  Seq<Int>)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))))))))))
  $Snap.unit))
; [eval] sys__result.Wand_list_for_list__this_1 == null
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))))))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))))))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01))))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))))))))))))
  $Snap.unit))
; [eval] sys__result.Wand_list_for_list__L2_1 == Seq[Int]()
; [eval] Seq[Int]()
(assert (Seq_equal
  ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))))))))))))
  (as Seq_empty  Seq<Int>)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))))))))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01))))))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))))))))))))))
  $Snap.unit))
; [eval] sys__result.Wand_list_for_list__tmp_suffix_1 == Seq[Int]()
; [eval] Seq[Int]()
(assert (Seq_equal
  ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))))))))))))))
  (as Seq_empty  Seq<Int>)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01))))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))))))))))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01))))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01))))))))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))))))))))))))))
  $Snap.unit))
; [eval] sys__result.Wand_list_for_list__L1_1 == Seq[Int]()
; [eval] Seq[Int]()
(assert (Seq_equal
  ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))))))))))))))))
  (as Seq_empty  Seq<Int>)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01))))))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))))))))))))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01))))))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01))))))))))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))))))))))))))))))
  $Snap.unit))
; [eval] sys__result.Wand_list_for_list__tmp_1 == null
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))))))))))))))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01))))))))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))))))))))))))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01))))))))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))))))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01))))))))))))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))))))))))))))))))))
  $Snap.unit))
; [eval] sys__result.Wand_list_for_list__suffix_1 == Seq[Int]()
; [eval] Seq[Int]()
(assert (Seq_equal
  ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))))))))))))))))))))
  (as Seq_empty  Seq<Int>)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))))))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01))))))))))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))))))))))))))))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01))))))))))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))))))))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01))))))))))))))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))))))))))))))))))))))
  $Snap.unit))
; [eval] sys__result.Wand_list_for_list__cursor_1 == null
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))))))))))))))))))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))))))))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01))))))))))))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))))))))))))))))))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01))))))))))))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))))))))))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01))))))))))))))))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))))))))))))))))))))))))
  $Snap.unit))
; [eval] sys__result.Wand_list_for_list__wand_1 == null
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))))))))))))))))))))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))))))))))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01))))))))))))))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))))))))))))))))))))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01))))))))))))))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))))))))))))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01))))))))))))))))))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))))))))))))))))))))))))))
  $Snap.unit))
; [eval] sys__result.Wand_list_for_list__this_2 == null
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))))))))))))))))))))))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))))))))))))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01))))))))))))))))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))))))))))))))))))))))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01))))))))))))))))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))))))))))))))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01))))))))))))))))))))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))))))))))))))))))))))))))))
  $Snap.unit))
; [eval] sys__result.Wand_list_for_list__L2_2 == Seq[Int]()
; [eval] Seq[Int]()
(assert (Seq_equal
  ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))))))))))))))))))))))))))))
  (as Seq_empty  Seq<Int>)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))))))))))))))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01))))))))))))))))))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))))))))))))))))))))))))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01))))))))))))))))))))))))))))))))
  $Snap.unit))
; [eval] sys__result.Wand_list_for_list__L1_2 == Seq[Int]()
; [eval] Seq[Int]()
(assert (Seq_equal
  ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@31@01)))))))))))))))))))))))))))))))))
  (as Seq_empty  Seq<Int>)))
(pop) ; 2
(push) ; 2
; [exec]
; var diz: Ref
(declare-const diz@32@01 $Ref)
; [exec]
; var __flatten_2: Int
(declare-const __flatten_2@33@01 Int)
; [exec]
; var __flatten_3: Seq[Int]
(declare-const __flatten_3@34@01 Seq<Int>)
; [exec]
; var __flatten_4: Seq[Int]
(declare-const __flatten_4@35@01 Seq<Int>)
; [exec]
; var __flatten_5: Seq[Int]
(declare-const __flatten_5@36@01 Seq<Int>)
; [exec]
; var __flatten_6: Seq[Int]
(declare-const __flatten_6@37@01 Seq<Int>)
; [exec]
; var __flatten_7: Seq[Int]
(declare-const __flatten_7@38@01 Seq<Int>)
; [exec]
; var __flatten_8: Seq[Int]
(declare-const __flatten_8@39@01 Seq<Int>)
; [exec]
; var __flatten_9: Seq[Int]
(declare-const __flatten_9@40@01 Seq<Int>)
; [exec]
; var __flatten_10: Seq[Int]
(declare-const __flatten_10@41@01 Seq<Int>)
; [exec]
; var __flatten_45: Int
(declare-const __flatten_45@42@01 Int)
; [exec]
; var __flatten_46: Seq[Int]
(declare-const __flatten_46@43@01 Seq<Int>)
; [exec]
; var __flatten_47: Seq[Int]
(declare-const __flatten_47@44@01 Seq<Int>)
; [exec]
; var __flatten_48: Seq[Int]
(declare-const __flatten_48@45@01 Seq<Int>)
; [exec]
; var __flatten_49: Seq[Int]
(declare-const __flatten_49@46@01 Seq<Int>)
; [exec]
; var __flatten_50: Seq[Int]
(declare-const __flatten_50@47@01 Seq<Int>)
; [exec]
; var __flatten_51: Seq[Int]
(declare-const __flatten_51@48@01 Seq<Int>)
; [exec]
; var __flatten_52: Seq[Int]
(declare-const __flatten_52@49@01 Seq<Int>)
; [exec]
; var __flatten_53: Seq[Int]
(declare-const __flatten_53@50@01 Seq<Int>)
; [exec]
; diz := new(Wand_list_for_list__lemma, Wand_list_for_list__in_1, Wand_list_for_list__in_1_0, Wand_list_for_list__out_1, Wand_list_for_list__out_1_0, Wand_list_for_list__this_1, Wand_list_for_list__L2_1, Wand_list_for_list__tmp_suffix_1, Wand_list_for_list__L1_1, Wand_list_for_list__tmp_1, Wand_list_for_list__suffix_1, Wand_list_for_list__cursor_1, Wand_list_for_list__wand_1, Wand_list_for_list__this_2, Wand_list_for_list__L2_2, Wand_list_for_list__L1_2)
(declare-const diz@51@01 $Ref)
(assert (not (= diz@51@01 $Ref.null)))
(declare-const Wand_list_for_list__lemma@52@01 Int)
(declare-const Wand_list_for_list__in_1@53@01 $Ref)
(declare-const Wand_list_for_list__in_1_0@54@01 Seq<Int>)
(declare-const Wand_list_for_list__out_1@55@01 $Ref)
(declare-const Wand_list_for_list__out_1_0@56@01 Seq<Int>)
(declare-const Wand_list_for_list__this_1@57@01 $Ref)
(declare-const Wand_list_for_list__L2_1@58@01 Seq<Int>)
(declare-const Wand_list_for_list__tmp_suffix_1@59@01 Seq<Int>)
(declare-const Wand_list_for_list__L1_1@60@01 Seq<Int>)
(declare-const Wand_list_for_list__tmp_1@61@01 $Ref)
(declare-const Wand_list_for_list__suffix_1@62@01 Seq<Int>)
(declare-const Wand_list_for_list__cursor_1@63@01 $Ref)
(declare-const Wand_list_for_list__wand_1@64@01 $Ref)
(declare-const Wand_list_for_list__this_2@65@01 $Ref)
(declare-const Wand_list_for_list__L2_2@66@01 Seq<Int>)
(declare-const Wand_list_for_list__L1_2@67@01 Seq<Int>)
(assert (not (= diz@51@01 diz@32@01)))
(assert (not (= diz@51@01 sys__result@29@01)))
; [exec]
; __flatten_2 := 0
; [exec]
; __flatten_45 := __flatten_2
; [exec]
; diz.Wand_list_for_list__lemma := __flatten_45
; [exec]
; diz.Wand_list_for_list__in_1 := null
; [exec]
; __flatten_3 := Seq[Int]()
; [eval] Seq[Int]()
; [exec]
; __flatten_46 := __flatten_3
; [exec]
; diz.Wand_list_for_list__in_1_0 := __flatten_46
; [exec]
; diz.Wand_list_for_list__out_1 := null
; [exec]
; __flatten_4 := Seq[Int]()
; [eval] Seq[Int]()
; [exec]
; __flatten_47 := __flatten_4
; [exec]
; diz.Wand_list_for_list__out_1_0 := __flatten_47
; [exec]
; diz.Wand_list_for_list__this_1 := null
; [exec]
; __flatten_5 := Seq[Int]()
; [eval] Seq[Int]()
; [exec]
; __flatten_48 := __flatten_5
; [exec]
; diz.Wand_list_for_list__L2_1 := __flatten_48
; [exec]
; __flatten_6 := Seq[Int]()
; [eval] Seq[Int]()
; [exec]
; __flatten_49 := __flatten_6
; [exec]
; diz.Wand_list_for_list__tmp_suffix_1 := __flatten_49
; [exec]
; __flatten_7 := Seq[Int]()
; [eval] Seq[Int]()
; [exec]
; __flatten_50 := __flatten_7
; [exec]
; diz.Wand_list_for_list__L1_1 := __flatten_50
; [exec]
; diz.Wand_list_for_list__tmp_1 := null
; [exec]
; __flatten_8 := Seq[Int]()
; [eval] Seq[Int]()
; [exec]
; __flatten_51 := __flatten_8
; [exec]
; diz.Wand_list_for_list__suffix_1 := __flatten_51
; [exec]
; diz.Wand_list_for_list__cursor_1 := null
; [exec]
; diz.Wand_list_for_list__wand_1 := null
; [exec]
; diz.Wand_list_for_list__this_2 := null
; [exec]
; __flatten_9 := Seq[Int]()
; [eval] Seq[Int]()
; [exec]
; __flatten_52 := __flatten_9
; [exec]
; diz.Wand_list_for_list__L2_2 := __flatten_52
; [exec]
; __flatten_10 := Seq[Int]()
; [eval] Seq[Int]()
; [exec]
; __flatten_53 := __flatten_10
; [exec]
; diz.Wand_list_for_list__L1_2 := __flatten_53
; [exec]
; sys__result := diz
; [exec]
; assert sys__result != null &&
;   (acc(sys__result.Wand_list_for_list__lemma, write) &&
;   sys__result.Wand_list_for_list__lemma == 0 &&
;   (acc(sys__result.Wand_list_for_list__in_1, write) &&
;   sys__result.Wand_list_for_list__in_1 == null &&
;   (acc(sys__result.Wand_list_for_list__in_1_0, write) &&
;   sys__result.Wand_list_for_list__in_1_0 == Seq[Int]() &&
;   (acc(sys__result.Wand_list_for_list__out_1, write) &&
;   sys__result.Wand_list_for_list__out_1 == null &&
;   (acc(sys__result.Wand_list_for_list__out_1_0, write) &&
;   sys__result.Wand_list_for_list__out_1_0 == Seq[Int]() &&
;   (acc(sys__result.Wand_list_for_list__this_1, write) &&
;   sys__result.Wand_list_for_list__this_1 == null &&
;   (acc(sys__result.Wand_list_for_list__L2_1, write) &&
;   sys__result.Wand_list_for_list__L2_1 == Seq[Int]() &&
;   (acc(sys__result.Wand_list_for_list__tmp_suffix_1, write) &&
;   sys__result.Wand_list_for_list__tmp_suffix_1 == Seq[Int]() &&
;   (acc(sys__result.Wand_list_for_list__L1_1, write) &&
;   sys__result.Wand_list_for_list__L1_1 == Seq[Int]() &&
;   (acc(sys__result.Wand_list_for_list__tmp_1, write) &&
;   sys__result.Wand_list_for_list__tmp_1 == null &&
;   (acc(sys__result.Wand_list_for_list__suffix_1, write) &&
;   sys__result.Wand_list_for_list__suffix_1 == Seq[Int]() &&
;   (acc(sys__result.Wand_list_for_list__cursor_1, write) &&
;   sys__result.Wand_list_for_list__cursor_1 == null &&
;   (acc(sys__result.Wand_list_for_list__wand_1, write) &&
;   sys__result.Wand_list_for_list__wand_1 == null &&
;   (acc(sys__result.Wand_list_for_list__this_2, write) &&
;   sys__result.Wand_list_for_list__this_2 == null &&
;   (acc(sys__result.Wand_list_for_list__L2_2, write) &&
;   sys__result.Wand_list_for_list__L2_2 == Seq[Int]() &&
;   (acc(sys__result.Wand_list_for_list__L1_2, write) &&
;   sys__result.Wand_list_for_list__L1_2 == Seq[Int]()))))))))))))))))
; [eval] sys__result != null
; [eval] sys__result.Wand_list_for_list__lemma == 0
; [eval] sys__result.Wand_list_for_list__in_1 == null
; [eval] sys__result.Wand_list_for_list__in_1_0 == Seq[Int]()
; [eval] Seq[Int]()
; [eval] sys__result.Wand_list_for_list__out_1 == null
; [eval] sys__result.Wand_list_for_list__out_1_0 == Seq[Int]()
; [eval] Seq[Int]()
; [eval] sys__result.Wand_list_for_list__this_1 == null
; [eval] sys__result.Wand_list_for_list__L2_1 == Seq[Int]()
; [eval] Seq[Int]()
; [eval] sys__result.Wand_list_for_list__tmp_suffix_1 == Seq[Int]()
; [eval] Seq[Int]()
; [eval] sys__result.Wand_list_for_list__L1_1 == Seq[Int]()
; [eval] Seq[Int]()
; [eval] sys__result.Wand_list_for_list__tmp_1 == null
; [eval] sys__result.Wand_list_for_list__suffix_1 == Seq[Int]()
; [eval] Seq[Int]()
; [eval] sys__result.Wand_list_for_list__cursor_1 == null
; [eval] sys__result.Wand_list_for_list__wand_1 == null
; [eval] sys__result.Wand_list_for_list__this_2 == null
; [eval] sys__result.Wand_list_for_list__L2_2 == Seq[Int]()
; [eval] Seq[Int]()
; [eval] sys__result.Wand_list_for_list__L1_2 == Seq[Int]()
; [eval] Seq[Int]()
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- List__List ----------
(declare-const current_thread_id@68@01 Int)
(declare-const v@69@01 Int)
(declare-const sys__result@70@01 $Ref)
(declare-const current_thread_id@71@01 Int)
(declare-const v@72@01 Int)
(declare-const sys__result@73@01 $Ref)
(push) ; 1
(declare-const $t@74@01 $Snap)
(assert (= $t@74@01 $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@71@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@75@01 $Snap)
(assert (= $t@75@01 ($Snap.combine ($Snap.first $t@75@01) ($Snap.second $t@75@01))))
(assert (= ($Snap.first $t@75@01) $Snap.unit))
; [eval] sys__result != null
(assert (not (= sys__result@73@01 $Ref.null)))
(assert (=
  ($Snap.second $t@75@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@75@01))
    ($Snap.second ($Snap.second $t@75@01)))))
(assert (= ($Snap.second ($Snap.second $t@75@01)) $Snap.unit))
; [eval] List__contents(sys__result) == Seq(v)
; [eval] List__contents(sys__result)
(push) ; 3
; [eval] diz != null
(assert (List__contents%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second $t@75@01))) sys__result@73@01))
(pop) ; 3
; Joined path conditions
(assert (List__contents%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second $t@75@01))) sys__result@73@01))
; [eval] Seq(v)
(assert (= (Seq_length (Seq_singleton v@72@01)) 1))
(assert (Seq_equal
  (List__contents ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second $t@75@01))) sys__result@73@01)
  (Seq_singleton v@72@01)))
(pop) ; 2
(push) ; 2
; [exec]
; var diz: Ref
(declare-const diz@76@01 $Ref)
; [exec]
; var __flatten_11: Int
(declare-const __flatten_11@77@01 Int)
; [exec]
; var __flatten_54: Int
(declare-const __flatten_54@78@01 Int)
; [exec]
; diz := new(List__val, List__next)
(declare-const diz@79@01 $Ref)
(assert (not (= diz@79@01 $Ref.null)))
(declare-const List__val@80@01 Int)
(declare-const List__next@81@01 $Ref)
(assert (not (= diz@79@01 diz@76@01)))
(assert (not (= diz@79@01 sys__result@73@01)))
; [exec]
; __flatten_11 := v
; [exec]
; __flatten_54 := __flatten_11
; [exec]
; diz.List__val := __flatten_54
; [exec]
; diz.List__next := null
; [exec]
; fold acc(List__state(diz), write)
; [eval] diz.List__next != null
; [then-branch: 14 | False | dead]
; [else-branch: 14 | True | live]
(push) ; 3
; [else-branch: 14 | True]
(assert (List__state%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap v@72@01)
  ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit)) diz@79@01))
; [exec]
; sys__result := diz
; [exec]
; assert sys__result != null &&
;   (acc(List__state(sys__result), write) &&
;   List__contents(sys__result) == Seq(v))
; [eval] sys__result != null
; [eval] List__contents(sys__result) == Seq(v)
; [eval] List__contents(sys__result)
(push) ; 4
; [eval] diz != null
(assert (List__contents%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.IntTo$Snap v@72@01)
    ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit))) diz@79@01))
(pop) ; 4
; Joined path conditions
(assert (List__contents%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.IntTo$Snap v@72@01)
    ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit))) diz@79@01))
; [eval] Seq(v)
(assert (= (Seq_length (Seq_singleton v@72@01)) 1))
(push) ; 4
(assert (not (Seq_equal
  (List__contents ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.IntTo$Snap v@72@01)
      ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit))) diz@79@01)
  (Seq_singleton v@72@01))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (Seq_equal
  (List__contents ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.IntTo$Snap v@72@01)
      ($Snap.combine ($SortWrappers.$RefTo$Snap $Ref.null) $Snap.unit))) diz@79@01)
  (Seq_singleton v@72@01)))
; [exec]
; inhale false
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- List__append_rec ----------
(declare-const diz@82@01 $Ref)
(declare-const current_thread_id@83@01 Int)
(declare-const l@84@01 $Ref)
(declare-const L1@85@01 Seq<Int>)
(declare-const L2@86@01 Seq<Int>)
(declare-const diz@87@01 $Ref)
(declare-const current_thread_id@88@01 Int)
(declare-const l@89@01 $Ref)
(declare-const L1@90@01 Seq<Int>)
(declare-const L2@91@01 Seq<Int>)
(push) ; 1
(declare-const $t@92@01 $Snap)
(assert (= $t@92@01 ($Snap.combine ($Snap.first $t@92@01) ($Snap.second $t@92@01))))
(assert (= ($Snap.first $t@92@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@87@01 $Ref.null)))
(assert (=
  ($Snap.second $t@92@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@92@01))
    ($Snap.second ($Snap.second $t@92@01)))))
(assert (= ($Snap.first ($Snap.second $t@92@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@88@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@92@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@92@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@92@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@92@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@92@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@92@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@92@01))))
  $Snap.unit))
; [eval] List__contents(diz) == L1
; [eval] List__contents(diz)
(push) ; 2
; [eval] diz != null
(assert (List__contents%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second $t@92@01)))) diz@87@01))
(pop) ; 2
; Joined path conditions
(assert (List__contents%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second $t@92@01)))) diz@87@01))
(assert (Seq_equal
  (List__contents ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second $t@92@01)))) diz@87@01)
  L1@90@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@92@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@92@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@92@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@92@01)))))
  $Snap.unit))
; [eval] l != null
(assert (not (= l@89@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@92@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@92@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@92@01)))))))))
(push) ; 2
(set-option :timeout 10)
(assert (not (= diz@87@01 l@89@01)))
(check-sat)
; unknown
(pop) ; 2
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@92@01))))))
  $Snap.unit))
; [eval] List__contents(l) == L2
; [eval] List__contents(l)
(set-option :timeout 0)
(push) ; 2
; [eval] diz != null
(assert (List__contents%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@92@01))))))) l@89@01))
(pop) ; 2
; Joined path conditions
(assert (List__contents%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@92@01))))))) l@89@01))
(assert (Seq_equal
  (List__contents ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@92@01))))))) l@89@01)
  L2@91@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@93@01 $Snap)
(assert (= $t@93@01 ($Snap.combine ($Snap.first $t@93@01) ($Snap.second $t@93@01))))
(assert (= ($Snap.second $t@93@01) $Snap.unit))
; [eval] List__contents(diz) == L1 ++ L2
; [eval] List__contents(diz)
(push) ; 3
; [eval] diz != null
(assert (List__contents%precondition ($Snap.combine $Snap.unit ($Snap.first $t@93@01)) diz@87@01))
(pop) ; 3
; Joined path conditions
(assert (List__contents%precondition ($Snap.combine $Snap.unit ($Snap.first $t@93@01)) diz@87@01))
; [eval] L1 ++ L2
(assert (Seq_equal
  (List__contents ($Snap.combine $Snap.unit ($Snap.first $t@93@01)) diz@87@01)
  (Seq_append L1@90@01 L2@91@01)))
(pop) ; 2
(push) ; 2
; [exec]
; var __flatten_12: Ref
(declare-const __flatten_12@94@01 $Ref)
; [exec]
; var __flatten_55: Ref
(declare-const __flatten_55@95@01 $Ref)
; [exec]
; var __flatten_56: Seq[Int]
(declare-const __flatten_56@96@01 Seq<Int>)
; [exec]
; unfold acc(List__state(diz), write)
(assert (=
  ($Snap.first ($Snap.second ($Snap.second $t@92@01)))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@92@01))))
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@92@01)))))))
(assert (=
  ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@92@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@92@01)))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@92@01))))))))
; [eval] diz.List__next != null
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@92@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@92@01))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [then-branch: 15 | First:(Second:(First:(Second:(Second:($t@92@01))))) != Null | live]
; [else-branch: 15 | First:(Second:(First:(Second:(Second:($t@92@01))))) == Null | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 15 | First:(Second:(First:(Second:(Second:($t@92@01))))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@92@01))))))
    $Ref.null)))
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  l@89@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@92@01)))))))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (List__state%trigger ($Snap.first ($Snap.second ($Snap.second $t@92@01))) diz@87@01))
; [eval] diz.List__next == null
; [then-branch: 16 | First:(Second:(First:(Second:(Second:($t@92@01))))) == Null | dead]
; [else-branch: 16 | First:(Second:(First:(Second:(Second:($t@92@01))))) != Null | live]
(set-option :timeout 0)
(push) ; 4
; [else-branch: 16 | First:(Second:(First:(Second:(Second:($t@92@01))))) != Null]
(pop) ; 4
; [eval] !(diz.List__next == null)
; [eval] diz.List__next == null
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@92@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [then-branch: 17 | First:(Second:(First:(Second:(Second:($t@92@01))))) != Null | live]
; [else-branch: 17 | First:(Second:(First:(Second:(Second:($t@92@01))))) == Null | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 17 | First:(Second:(First:(Second:(Second:($t@92@01))))) != Null]
; [exec]
; __flatten_56 := List__contents(diz.List__next)
; [eval] List__contents(diz.List__next)
(push) ; 5
; [eval] diz != null
(assert (List__contents%precondition ($Snap.combine
  $Snap.unit
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@92@01)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@92@01))))))))
(pop) ; 5
; Joined path conditions
(assert (List__contents%precondition ($Snap.combine
  $Snap.unit
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@92@01)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@92@01))))))))
(declare-const __flatten_56@97@01 Seq<Int>)
(assert (Seq_equal
  __flatten_56@97@01
  (List__contents ($Snap.combine
    $Snap.unit
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@92@01)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@92@01)))))))))
; [exec]
; List__append_rec(diz.List__next, current_thread_id, l, __flatten_56, L2)
; [eval] diz != null
; [eval] current_thread_id >= 0
; [eval] List__contents(diz) == L1
; [eval] List__contents(diz)
(push) ; 5
; [eval] diz != null
(pop) ; 5
; Joined path conditions
(push) ; 5
(assert (not (Seq_equal
  (List__contents ($Snap.combine
    $Snap.unit
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@92@01)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@92@01)))))))
  __flatten_56@97@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(assert (Seq_equal
  (List__contents ($Snap.combine
    $Snap.unit
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@92@01)))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@92@01)))))))
  __flatten_56@97@01))
; [eval] l != null
; [eval] List__contents(l) == L2
; [eval] List__contents(l)
(push) ; 5
; [eval] diz != null
(pop) ; 5
; Joined path conditions
(declare-const $t@98@01 $Snap)
(assert (= $t@98@01 ($Snap.combine ($Snap.first $t@98@01) ($Snap.second $t@98@01))))
(assert (= ($Snap.second $t@98@01) $Snap.unit))
; [eval] List__contents(diz) == L1 ++ L2
; [eval] List__contents(diz)
(push) ; 5
; [eval] diz != null
(assert (List__contents%precondition ($Snap.combine $Snap.unit ($Snap.first $t@98@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@92@01))))))))
(pop) ; 5
; Joined path conditions
(assert (List__contents%precondition ($Snap.combine $Snap.unit ($Snap.first $t@98@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@92@01))))))))
; [eval] L1 ++ L2
(assert (Seq_equal
  (List__contents ($Snap.combine $Snap.unit ($Snap.first $t@98@01)) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@92@01)))))))
  (Seq_append __flatten_56@97@01 L2@91@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; fold acc(List__state(diz), write)
; [eval] diz.List__next != null
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@92@01))))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [then-branch: 18 | First:(Second:(First:(Second:(Second:($t@92@01))))) != Null | live]
; [else-branch: 18 | First:(Second:(First:(Second:(Second:($t@92@01))))) == Null | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 18 | First:(Second:(First:(Second:(Second:($t@92@01))))) != Null]
(assert (List__state%trigger ($Snap.combine
  ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@92@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@92@01)))))
    ($Snap.first $t@98@01))) diz@87@01))
; [eval] List__contents(diz) == L1 ++ L2
; [eval] List__contents(diz)
(push) ; 6
; [eval] diz != null
(assert (List__contents%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@92@01))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@92@01)))))
      ($Snap.first $t@98@01)))) diz@87@01))
(pop) ; 6
; Joined path conditions
(assert (List__contents%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@92@01))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@92@01)))))
      ($Snap.first $t@98@01)))) diz@87@01))
; [eval] L1 ++ L2
(push) ; 6
(assert (not (Seq_equal
  (List__contents ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@92@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@92@01)))))
        ($Snap.first $t@98@01)))) diz@87@01)
  (Seq_append L1@90@01 L2@91@01))))
(check-sat)
; unsat
(pop) ; 6
; 0.01s
; (get-info :all-statistics)
(assert (Seq_equal
  (List__contents ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@92@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@92@01)))))
        ($Snap.first $t@98@01)))) diz@87@01)
  (Seq_append L1@90@01 L2@91@01)))
(pop) ; 5
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 15 | First:(Second:(First:(Second:(Second:($t@92@01))))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@92@01))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@92@01)))))
  $Snap.unit))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (List__state%trigger ($Snap.first ($Snap.second ($Snap.second $t@92@01))) diz@87@01))
; [eval] diz.List__next == null
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@92@01))))))
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [then-branch: 19 | First:(Second:(First:(Second:(Second:($t@92@01))))) == Null | live]
; [else-branch: 19 | First:(Second:(First:(Second:(Second:($t@92@01))))) != Null | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 19 | First:(Second:(First:(Second:(Second:($t@92@01))))) == Null]
; [exec]
; __flatten_12 := l
; [exec]
; __flatten_55 := __flatten_12
; [exec]
; diz.List__next := __flatten_55
; [exec]
; fold acc(List__state(diz), write)
; [eval] diz.List__next != null
(push) ; 5
(set-option :timeout 10)
(assert (not (= l@89@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [then-branch: 20 | l@89@01 != Null | live]
; [else-branch: 20 | l@89@01 == Null | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 20 | l@89@01 != Null]
(assert (List__state%trigger ($Snap.combine
  ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@92@01))))
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@89@01)
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@92@01)))))))) diz@87@01))
; [eval] List__contents(diz) == L1 ++ L2
; [eval] List__contents(diz)
(push) ; 6
; [eval] diz != null
(assert (List__contents%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@92@01))))
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@89@01)
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@92@01))))))))) diz@87@01))
(pop) ; 6
; Joined path conditions
(assert (List__contents%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@92@01))))
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@89@01)
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@92@01))))))))) diz@87@01))
; [eval] L1 ++ L2
(push) ; 6
(assert (not (Seq_equal
  (List__contents ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@92@01))))
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@89@01)
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@92@01))))))))) diz@87@01)
  (Seq_append L1@90@01 L2@91@01))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (Seq_equal
  (List__contents ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@92@01))))
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@89@01)
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@92@01))))))))) diz@87@01)
  (Seq_append L1@90@01 L2@91@01)))
(pop) ; 5
(pop) ; 4
; [eval] !(diz.List__next == null)
; [eval] diz.List__next == null
; [then-branch: 21 | First:(Second:(First:(Second:(Second:($t@92@01))))) != Null | dead]
; [else-branch: 21 | First:(Second:(First:(Second:(Second:($t@92@01))))) == Null | live]
(push) ; 4
; [else-branch: 21 | First:(Second:(First:(Second:(Second:($t@92@01))))) == Null]
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- List__Wand_list_for_list_lemma_1 ----------
(declare-const diz@99@01 $Ref)
(declare-const current_thread_id@100@01 Int)
(declare-const this_1@101@01 $Ref)
(declare-const L2_1@102@01 Seq<Int>)
(declare-const tmp_suffix_1@103@01 Seq<Int>)
(declare-const L1_1@104@01 Seq<Int>)
(declare-const tmp_1@105@01 $Ref)
(declare-const suffix_1@106@01 Seq<Int>)
(declare-const cursor_1@107@01 $Ref)
(declare-const wand_1@108@01 $Ref)
(declare-const in_1@109@01 $Ref)
(declare-const in_1_0@110@01 Seq<Int>)
(declare-const out_1@111@01 $Ref)
(declare-const out_1_0@112@01 Seq<Int>)
(declare-const sys__result@113@01 $Ref)
(declare-const diz@114@01 $Ref)
(declare-const current_thread_id@115@01 Int)
(declare-const this_1@116@01 $Ref)
(declare-const L2_1@117@01 Seq<Int>)
(declare-const tmp_suffix_1@118@01 Seq<Int>)
(declare-const L1_1@119@01 Seq<Int>)
(declare-const tmp_1@120@01 $Ref)
(declare-const suffix_1@121@01 Seq<Int>)
(declare-const cursor_1@122@01 $Ref)
(declare-const wand_1@123@01 $Ref)
(declare-const in_1@124@01 $Ref)
(declare-const in_1_0@125@01 Seq<Int>)
(declare-const out_1@126@01 $Ref)
(declare-const out_1_0@127@01 Seq<Int>)
(declare-const sys__result@128@01 $Ref)
(push) ; 1
(declare-const $t@129@01 $Snap)
(assert (= $t@129@01 ($Snap.combine ($Snap.first $t@129@01) ($Snap.second $t@129@01))))
(assert (= ($Snap.first $t@129@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@114@01 $Ref.null)))
(assert (=
  ($Snap.second $t@129@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@129@01))
    ($Snap.second ($Snap.second $t@129@01)))))
(assert (= ($Snap.first ($Snap.second $t@129@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@115@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@129@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@129@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@129@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@129@01))) $Snap.unit))
; [eval] this_1 != null
(assert (not (= this_1@116@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@129@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@129@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01)))))))
(assert (not (= tmp_1@120@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01))))))
  $Snap.unit))
; [eval] tmp_1.List__next == cursor_1
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01))))))
  cursor_1@122@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01)))))))
  $Snap.unit))
; [eval] tmp_suffix_1 == Seq(tmp_1.List__val) ++ suffix_1
; [eval] Seq(tmp_1.List__val) ++ suffix_1
; [eval] Seq(tmp_1.List__val)
(assert (=
  (Seq_length
    (Seq_singleton ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@129@01)))))))
  1))
(assert (Seq_equal
  tmp_suffix_1@118@01
  (Seq_append
    (Seq_singleton ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@129@01))))))
    suffix_1@121@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01)))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01))))))))
  $Snap.unit))
; [eval] wand_1 != null
(assert (not (= wand_1@123@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01))))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01)))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01)))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01))))))))))
  $Snap.unit))
; [eval] Wand_list_for_list__get_in_1(wand_1) == tmp_1
; [eval] Wand_list_for_list__get_in_1(wand_1)
(push) ; 2
; [eval] diz != null
(assert (Wand_list_for_list__get_in_1%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01)))))))))) wand_1@123@01))
(pop) ; 2
; Joined path conditions
(assert (Wand_list_for_list__get_in_1%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01)))))))))) wand_1@123@01))
(assert (=
  (Wand_list_for_list__get_in_1 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01)))))))))) wand_1@123@01)
  tmp_1@120@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01)))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01)))))))))))
  $Snap.unit))
; [eval] Wand_list_for_list__get_in_1_0(wand_1) == tmp_suffix_1 ++ L2_1
; [eval] Wand_list_for_list__get_in_1_0(wand_1)
(push) ; 2
; [eval] diz != null
(assert (Wand_list_for_list__get_in_1_0%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01)))))))))) wand_1@123@01))
(pop) ; 2
; Joined path conditions
(assert (Wand_list_for_list__get_in_1_0%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01)))))))))) wand_1@123@01))
; [eval] tmp_suffix_1 ++ L2_1
(assert (Seq_equal
  (Wand_list_for_list__get_in_1_0 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01)))))))))) wand_1@123@01)
  (Seq_append tmp_suffix_1@118@01 L2_1@117@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01)))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01)))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01))))))))))))
  $Snap.unit))
; [eval] Wand_list_for_list__get_out_1(wand_1) == this_1
; [eval] Wand_list_for_list__get_out_1(wand_1)
(push) ; 2
; [eval] diz != null
(assert (Wand_list_for_list__get_out_1%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01)))))))))) wand_1@123@01))
(pop) ; 2
; Joined path conditions
(assert (Wand_list_for_list__get_out_1%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01)))))))))) wand_1@123@01))
(assert (=
  (Wand_list_for_list__get_out_1 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01)))))))))) wand_1@123@01)
  this_1@116@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01)))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01)))))))))))))
  $Snap.unit))
; [eval] Wand_list_for_list__get_out_1_0(wand_1) == L1_1 ++ L2_1
; [eval] Wand_list_for_list__get_out_1_0(wand_1)
(push) ; 2
; [eval] diz != null
(assert (Wand_list_for_list__get_out_1_0%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01)))))))))) wand_1@123@01))
(pop) ; 2
; Joined path conditions
(assert (Wand_list_for_list__get_out_1_0%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01)))))))))) wand_1@123@01))
; [eval] L1_1 ++ L2_1
(assert (Seq_equal
  (Wand_list_for_list__get_out_1_0 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01)))))))))) wand_1@123@01)
  (Seq_append L1_1@119@01 L2_1@117@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01)))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01)))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01))))))))))))))
  $Snap.unit))
; [eval] in_1 != null
(assert (not (= in_1@124@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01)))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01))))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01)))))))))))))))
  $Snap.unit))
; [eval] in_1 == cursor_1
(assert (= in_1@124@01 cursor_1@122@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01)))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01)))))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01))))))))))))))))
  $Snap.unit))
; [eval] in_1_0 == suffix_1 ++ L2_1
; [eval] suffix_1 ++ L2_1
(assert (Seq_equal in_1_0@125@01 (Seq_append suffix_1@121@01 L2_1@117@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01)))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01))))))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01)))))))))))))))))
  $Snap.unit))
; [eval] out_1 != null
(assert (not (= out_1@126@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01)))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01))))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01)))))))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01))))))))))))))))))
  $Snap.unit))
; [eval] out_1 == this_1
(assert (= out_1@126@01 this_1@116@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01))))))))))))))))))
  $Snap.unit))
; [eval] out_1_0 == L1_1 ++ L2_1
; [eval] L1_1 ++ L2_1
(assert (Seq_equal out_1_0@127@01 (Seq_append L1_1@119@01 L2_1@117@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@130@01 $Snap)
(assert (= $t@130@01 ($Snap.combine ($Snap.first $t@130@01) ($Snap.second $t@130@01))))
(assert (= ($Snap.first $t@130@01) $Snap.unit))
; [eval] sys__result != null
(assert (not (= sys__result@128@01 $Ref.null)))
(assert (=
  ($Snap.second $t@130@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@130@01))
    ($Snap.second ($Snap.second $t@130@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@130@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@130@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@130@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@130@01))) $Snap.unit))
; [eval] Wand_list_for_list__get_in_1(sys__result) == in_1
; [eval] Wand_list_for_list__get_in_1(sys__result)
(push) ; 3
; [eval] diz != null
(assert (Wand_list_for_list__get_in_1%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second $t@130@01))) sys__result@128@01))
(pop) ; 3
; Joined path conditions
(assert (Wand_list_for_list__get_in_1%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second $t@130@01))) sys__result@128@01))
(assert (=
  (Wand_list_for_list__get_in_1 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second $t@130@01))) sys__result@128@01)
  in_1@124@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@130@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@130@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@130@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@130@01))))
  $Snap.unit))
; [eval] Wand_list_for_list__get_in_1_0(sys__result) == in_1_0
; [eval] Wand_list_for_list__get_in_1_0(sys__result)
(push) ; 3
; [eval] diz != null
(assert (Wand_list_for_list__get_in_1_0%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second $t@130@01))) sys__result@128@01))
(pop) ; 3
; Joined path conditions
(assert (Wand_list_for_list__get_in_1_0%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second $t@130@01))) sys__result@128@01))
(assert (Seq_equal
  (Wand_list_for_list__get_in_1_0 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second $t@130@01))) sys__result@128@01)
  in_1_0@125@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@130@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@130@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@130@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@130@01)))))
  $Snap.unit))
; [eval] Wand_list_for_list__get_out_1(sys__result) == out_1
; [eval] Wand_list_for_list__get_out_1(sys__result)
(push) ; 3
; [eval] diz != null
(assert (Wand_list_for_list__get_out_1%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second $t@130@01))) sys__result@128@01))
(pop) ; 3
; Joined path conditions
(assert (Wand_list_for_list__get_out_1%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second $t@130@01))) sys__result@128@01))
(assert (=
  (Wand_list_for_list__get_out_1 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second $t@130@01))) sys__result@128@01)
  out_1@126@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@130@01)))))
  $Snap.unit))
; [eval] Wand_list_for_list__get_out_1_0(sys__result) == out_1_0
; [eval] Wand_list_for_list__get_out_1_0(sys__result)
(push) ; 3
; [eval] diz != null
(assert (Wand_list_for_list__get_out_1_0%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second $t@130@01))) sys__result@128@01))
(pop) ; 3
; Joined path conditions
(assert (Wand_list_for_list__get_out_1_0%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second $t@130@01))) sys__result@128@01))
(assert (Seq_equal
  (Wand_list_for_list__get_out_1_0 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second $t@130@01))) sys__result@128@01)
  out_1_0@127@01))
(pop) ; 2
(push) ; 2
; [exec]
; var vwand: Ref
(declare-const vwand@131@01 $Ref)
; [exec]
; var __flatten_14: Ref
(declare-const __flatten_14@132@01 $Ref)
; [exec]
; var __flatten_15: Int
(declare-const __flatten_15@133@01 Int)
; [exec]
; var __flatten_16: Ref
(declare-const __flatten_16@134@01 $Ref)
; [exec]
; var __flatten_17: Seq[Int]
(declare-const __flatten_17@135@01 Seq<Int>)
; [exec]
; var __flatten_18: Seq[Int]
(declare-const __flatten_18@136@01 Seq<Int>)
; [exec]
; var __flatten_19: Seq[Int]
(declare-const __flatten_19@137@01 Seq<Int>)
; [exec]
; var __flatten_20: Ref
(declare-const __flatten_20@138@01 $Ref)
; [exec]
; var __flatten_21: Seq[Int]
(declare-const __flatten_21@139@01 Seq<Int>)
; [exec]
; var __flatten_22: Ref
(declare-const __flatten_22@140@01 $Ref)
; [exec]
; var __flatten_23: Ref
(declare-const __flatten_23@141@01 $Ref)
; [exec]
; var __flatten_24: Ref
(declare-const __flatten_24@142@01 $Ref)
; [exec]
; var __flatten_25: Seq[Int]
(declare-const __flatten_25@143@01 Seq<Int>)
; [exec]
; var __flatten_26: Ref
(declare-const __flatten_26@144@01 $Ref)
; [exec]
; var __flatten_27: Seq[Int]
(declare-const __flatten_27@145@01 Seq<Int>)
; [exec]
; var __flatten_28: Ref
(declare-const __flatten_28@146@01 $Ref)
; [exec]
; var __flatten_59: Int
(declare-const __flatten_59@147@01 Int)
; [exec]
; var __flatten_60: Ref
(declare-const __flatten_60@148@01 $Ref)
; [exec]
; var __flatten_61: Seq[Int]
(declare-const __flatten_61@149@01 Seq<Int>)
; [exec]
; var __flatten_62: Seq[Int]
(declare-const __flatten_62@150@01 Seq<Int>)
; [exec]
; var __flatten_63: Seq[Int]
(declare-const __flatten_63@151@01 Seq<Int>)
; [exec]
; var __flatten_64: Ref
(declare-const __flatten_64@152@01 $Ref)
; [exec]
; var __flatten_65: Seq[Int]
(declare-const __flatten_65@153@01 Seq<Int>)
; [exec]
; var __flatten_66: Ref
(declare-const __flatten_66@154@01 $Ref)
; [exec]
; var __flatten_67: Ref
(declare-const __flatten_67@155@01 $Ref)
; [exec]
; var __flatten_68: Ref
(declare-const __flatten_68@156@01 $Ref)
; [exec]
; var __flatten_69: Seq[Int]
(declare-const __flatten_69@157@01 Seq<Int>)
; [exec]
; var __flatten_70: Ref
(declare-const __flatten_70@158@01 $Ref)
; [exec]
; var __flatten_71: Seq[Int]
(declare-const __flatten_71@159@01 Seq<Int>)
; [exec]
; __flatten_14 := Wand_list_for_list__Wand_list_for_list(current_thread_id)
; [eval] current_thread_id >= 0
(declare-const sys__result@160@01 $Ref)
(declare-const $t@161@01 $Snap)
(assert (= $t@161@01 ($Snap.combine ($Snap.first $t@161@01) ($Snap.second $t@161@01))))
(assert (= ($Snap.first $t@161@01) $Snap.unit))
; [eval] sys__result != null
(assert (not (= sys__result@160@01 $Ref.null)))
(assert (=
  ($Snap.second $t@161@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@161@01))
    ($Snap.second ($Snap.second $t@161@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@161@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@161@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@161@01))) $Snap.unit))
; [eval] sys__result.Wand_list_for_list__lemma == 0
(assert (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@161@01))) 0))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@161@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@161@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))
  $Snap.unit))
; [eval] sys__result.Wand_list_for_list__in_1 == null
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))
  $Snap.unit))
; [eval] sys__result.Wand_list_for_list__in_1_0 == Seq[Int]()
; [eval] Seq[Int]()
(assert (Seq_equal
  ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))
  (as Seq_empty  Seq<Int>)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))
  $Snap.unit))
; [eval] sys__result.Wand_list_for_list__out_1 == null
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))))
  $Snap.unit))
; [eval] sys__result.Wand_list_for_list__out_1_0 == Seq[Int]()
; [eval] Seq[Int]()
(assert (Seq_equal
  ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))))
  (as Seq_empty  Seq<Int>)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))))))
  $Snap.unit))
; [eval] sys__result.Wand_list_for_list__this_1 == null
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))))))))
  $Snap.unit))
; [eval] sys__result.Wand_list_for_list__L2_1 == Seq[Int]()
; [eval] Seq[Int]()
(assert (Seq_equal
  ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))))))))
  (as Seq_empty  Seq<Int>)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))))))))))
  $Snap.unit))
; [eval] sys__result.Wand_list_for_list__tmp_suffix_1 == Seq[Int]()
; [eval] Seq[Int]()
(assert (Seq_equal
  ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))))))))))
  (as Seq_empty  Seq<Int>)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))))))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))))))))))))
  $Snap.unit))
; [eval] sys__result.Wand_list_for_list__L1_1 == Seq[Int]()
; [eval] Seq[Int]()
(assert (Seq_equal
  ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))))))))))))
  (as Seq_empty  Seq<Int>)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))))))))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))))))))))))))
  $Snap.unit))
; [eval] sys__result.Wand_list_for_list__tmp_1 == null
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))))))))))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))))))))))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))))))))))))))))
  $Snap.unit))
; [eval] sys__result.Wand_list_for_list__suffix_1 == Seq[Int]()
; [eval] Seq[Int]()
(assert (Seq_equal
  ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))))))))))))))))
  (as Seq_empty  Seq<Int>)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))))))))))))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))))))))))))))))))
  $Snap.unit))
; [eval] sys__result.Wand_list_for_list__cursor_1 == null
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))))))))))))))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))))))))))))))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))))))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))))))))))))))))))))
  $Snap.unit))
; [eval] sys__result.Wand_list_for_list__wand_1 == null
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))))))))))))))))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))))))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))))))))))))))))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))))))))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))))))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))))))))))))))))))))))
  $Snap.unit))
; [eval] sys__result.Wand_list_for_list__this_2 == null
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))))))))))))))))))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))))))))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))))))))))))))))))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))))))))))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))))))))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))))))))))))))))))))))))
  $Snap.unit))
; [eval] sys__result.Wand_list_for_list__L2_2 == Seq[Int]()
; [eval] Seq[Int]()
(assert (Seq_equal
  ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))))))))))))))))))))))))
  (as Seq_empty  Seq<Int>)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))))))))))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))))))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))))))))))))))))))))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))))))))))))))))))))
  $Snap.unit))
; [eval] sys__result.Wand_list_for_list__L1_2 == Seq[Int]()
; [eval] Seq[Int]()
(assert (Seq_equal
  ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01)))))))))))))))))))))))))))))))))
  (as Seq_empty  Seq<Int>)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; vwand := __flatten_14
; [exec]
; __flatten_15 := 1
; [exec]
; __flatten_59 := __flatten_15
; [exec]
; vwand.Wand_list_for_list__lemma := __flatten_59
; [exec]
; __flatten_16 := this_1
; [exec]
; __flatten_60 := __flatten_16
; [exec]
; vwand.Wand_list_for_list__this_1 := __flatten_60
; [exec]
; __flatten_17 := L2_1
; [exec]
; __flatten_61 := __flatten_17
; [exec]
; vwand.Wand_list_for_list__L2_1 := __flatten_61
; [exec]
; __flatten_18 := tmp_suffix_1
; [exec]
; __flatten_62 := __flatten_18
; [exec]
; vwand.Wand_list_for_list__tmp_suffix_1 := __flatten_62
; [exec]
; __flatten_19 := L1_1
; [exec]
; __flatten_63 := __flatten_19
; [exec]
; vwand.Wand_list_for_list__L1_1 := __flatten_63
; [exec]
; __flatten_20 := tmp_1
; [exec]
; __flatten_64 := __flatten_20
; [exec]
; vwand.Wand_list_for_list__tmp_1 := __flatten_64
; [exec]
; __flatten_21 := suffix_1
; [exec]
; __flatten_65 := __flatten_21
; [exec]
; vwand.Wand_list_for_list__suffix_1 := __flatten_65
; [exec]
; __flatten_22 := cursor_1
; [exec]
; __flatten_66 := __flatten_22
; [exec]
; vwand.Wand_list_for_list__cursor_1 := __flatten_66
; [exec]
; __flatten_23 := wand_1
; [exec]
; __flatten_67 := __flatten_23
; [exec]
; vwand.Wand_list_for_list__wand_1 := __flatten_67
; [exec]
; __flatten_24 := in_1
; [exec]
; __flatten_68 := __flatten_24
; [exec]
; vwand.Wand_list_for_list__in_1 := __flatten_68
; [exec]
; __flatten_25 := in_1_0
; [exec]
; __flatten_69 := __flatten_25
; [exec]
; vwand.Wand_list_for_list__in_1_0 := __flatten_69
; [exec]
; __flatten_26 := out_1
; [exec]
; __flatten_70 := __flatten_26
; [exec]
; vwand.Wand_list_for_list__out_1 := __flatten_70
; [exec]
; __flatten_27 := out_1_0
; [exec]
; __flatten_71 := __flatten_27
; [exec]
; vwand.Wand_list_for_list__out_1_0 := __flatten_71
; [exec]
; fold acc(Wand_list_for_list__valid_wand(vwand), write)
(declare-const $k@162@01 $Perm)
(assert ($Perm.isReadVar $k@162@01))
(assert (< $k@162@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@162@01)))
(assert (<= (- $Perm.Write $k@162@01) $Perm.Write))
(assert (=>
  (< $Perm.No (- $Perm.Write $k@162@01))
  (not (= sys__result@160@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@162@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [eval] 1 <= diz.Wand_list_for_list__lemma
(declare-const $k@163@01 $Perm)
(assert ($Perm.isReadVar $k@163@01))
(assert (< $k@163@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@163@01)))
(assert (<= (- $Perm.Write $k@163@01) $Perm.Write))
(assert (=>
  (< $Perm.No (- $Perm.Write $k@163@01))
  (not (= sys__result@160@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@163@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [eval] diz.Wand_list_for_list__in_1 != null
(declare-const $k@164@01 $Perm)
(assert ($Perm.isReadVar $k@164@01))
(assert (< $k@164@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@164@01)))
(assert (<= (- $Perm.Write $k@164@01) $Perm.Write))
(assert (=>
  (< $Perm.No (- $Perm.Write $k@164@01))
  (not (= sys__result@160@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@164@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const $k@165@01 $Perm)
(assert ($Perm.isReadVar $k@165@01))
(assert (< $k@165@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@165@01)))
(assert (<= (- $Perm.Write $k@165@01) $Perm.Write))
(assert (=>
  (< $Perm.No (- $Perm.Write $k@165@01))
  (not (= sys__result@160@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@165@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [eval] diz.Wand_list_for_list__out_1 != null
(declare-const $k@166@01 $Perm)
(assert ($Perm.isReadVar $k@166@01))
(assert (< $k@166@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@166@01)))
(assert (<= (- $Perm.Write $k@166@01) $Perm.Write))
(assert (=>
  (< $Perm.No (- $Perm.Write $k@166@01))
  (not (= sys__result@160@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@166@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const $k@167@01 $Perm)
(assert ($Perm.isReadVar $k@167@01))
(assert (< $k@167@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@167@01)))
(assert (<= (- $Perm.Write $k@167@01) $Perm.Write))
(assert (=>
  (< $Perm.No (- $Perm.Write $k@167@01))
  (not (= sys__result@160@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@167@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const $k@168@01 $Perm)
(assert ($Perm.isReadVar $k@168@01))
(assert (< $k@168@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@168@01)))
(assert (<= (- $Perm.Write $k@168@01) $Perm.Write))
(assert (=>
  (< $Perm.No (- $Perm.Write $k@168@01))
  (not (= sys__result@160@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@168@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const $k@169@01 $Perm)
(assert ($Perm.isReadVar $k@169@01))
(assert (< $k@169@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@169@01)))
(assert (<= (- $Perm.Write $k@169@01) $Perm.Write))
(assert (=>
  (< $Perm.No (- $Perm.Write $k@169@01))
  (not (= sys__result@160@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@169@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const $k@170@01 $Perm)
(assert ($Perm.isReadVar $k@170@01))
(assert (< $k@170@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@170@01)))
(assert (<= (- $Perm.Write $k@170@01) $Perm.Write))
(assert (=>
  (< $Perm.No (- $Perm.Write $k@170@01))
  (not (= sys__result@160@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@170@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const $k@171@01 $Perm)
(assert ($Perm.isReadVar $k@171@01))
(assert (< $k@171@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@171@01)))
(assert (<= (- $Perm.Write $k@171@01) $Perm.Write))
(assert (=>
  (< $Perm.No (- $Perm.Write $k@171@01))
  (not (= sys__result@160@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@171@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const $k@172@01 $Perm)
(assert ($Perm.isReadVar $k@172@01))
(assert (< $k@172@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@172@01)))
(assert (<= (- $Perm.Write $k@172@01) $Perm.Write))
(assert (=>
  (< $Perm.No (- $Perm.Write $k@172@01))
  (not (= sys__result@160@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@172@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const $k@173@01 $Perm)
(assert ($Perm.isReadVar $k@173@01))
(assert (< $k@173@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@173@01)))
(assert (<= (- $Perm.Write $k@173@01) $Perm.Write))
(assert (=>
  (< $Perm.No (- $Perm.Write $k@173@01))
  (not (= sys__result@160@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@173@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const $k@174@01 $Perm)
(assert ($Perm.isReadVar $k@174@01))
(assert (< $k@174@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@174@01)))
(assert (<= (- $Perm.Write $k@174@01) $Perm.Write))
(assert (=>
  (< $Perm.No (- $Perm.Write $k@174@01))
  (not (= sys__result@160@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@174@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [eval] diz.Wand_list_for_list__lemma == 1
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [then-branch: 22 | True | live]
; [else-branch: 22 | False | dead]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 22 | True]
; [eval] diz.Wand_list_for_list__this_1 != null
; [eval] diz.Wand_list_for_list__tmp_1.List__next == diz.Wand_list_for_list__cursor_1
; [eval] diz.Wand_list_for_list__tmp_suffix_1 == Seq(diz.Wand_list_for_list__tmp_1.List__val) ++ diz.Wand_list_for_list__suffix_1
; [eval] Seq(diz.Wand_list_for_list__tmp_1.List__val) ++ diz.Wand_list_for_list__suffix_1
; [eval] Seq(diz.Wand_list_for_list__tmp_1.List__val)
; [eval] diz.Wand_list_for_list__wand_1 != null
; [eval] Wand_list_for_list__get_in_1(diz.Wand_list_for_list__wand_1) == diz.Wand_list_for_list__tmp_1
; [eval] Wand_list_for_list__get_in_1(diz.Wand_list_for_list__wand_1)
(push) ; 4
; [eval] diz != null
(pop) ; 4
; Joined path conditions
; [eval] Wand_list_for_list__get_in_1_0(diz.Wand_list_for_list__wand_1) == diz.Wand_list_for_list__tmp_suffix_1 ++ diz.Wand_list_for_list__L2_1
; [eval] Wand_list_for_list__get_in_1_0(diz.Wand_list_for_list__wand_1)
(push) ; 4
; [eval] diz != null
(pop) ; 4
; Joined path conditions
; [eval] diz.Wand_list_for_list__tmp_suffix_1 ++ diz.Wand_list_for_list__L2_1
; [eval] Wand_list_for_list__get_out_1(diz.Wand_list_for_list__wand_1) == diz.Wand_list_for_list__this_1
; [eval] Wand_list_for_list__get_out_1(diz.Wand_list_for_list__wand_1)
(push) ; 4
; [eval] diz != null
(pop) ; 4
; Joined path conditions
; [eval] Wand_list_for_list__get_out_1_0(diz.Wand_list_for_list__wand_1) == diz.Wand_list_for_list__L1_1 ++ diz.Wand_list_for_list__L2_1
; [eval] Wand_list_for_list__get_out_1_0(diz.Wand_list_for_list__wand_1)
(push) ; 4
; [eval] diz != null
(pop) ; 4
; Joined path conditions
; [eval] diz.Wand_list_for_list__L1_1 ++ diz.Wand_list_for_list__L2_1
; [eval] diz.Wand_list_for_list__in_1 == diz.Wand_list_for_list__cursor_1
; [eval] diz.Wand_list_for_list__in_1_0 == diz.Wand_list_for_list__suffix_1 ++ diz.Wand_list_for_list__L2_1
; [eval] diz.Wand_list_for_list__suffix_1 ++ diz.Wand_list_for_list__L2_1
; [eval] diz.Wand_list_for_list__out_1 == diz.Wand_list_for_list__this_1
; [eval] diz.Wand_list_for_list__out_1_0 == diz.Wand_list_for_list__L1_1 ++ diz.Wand_list_for_list__L2_1
; [eval] diz.Wand_list_for_list__L1_1 ++ diz.Wand_list_for_list__L2_1
(declare-const $k@175@01 $Perm)
(assert ($Perm.isReadVar $k@175@01))
(assert (< $k@175@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@175@01)))
(assert (<= (- $Perm.Write $k@175@01) $Perm.Write))
(assert (=>
  (< $Perm.No (- $Perm.Write $k@175@01))
  (not (= sys__result@160@01 $Ref.null))))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@175@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(declare-const $k@176@01 $Perm)
(assert ($Perm.isReadVar $k@176@01))
(assert (< $k@176@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@176@01)))
(assert (<= (- $Perm.Write $k@176@01) $Perm.Write))
(assert (=>
  (< $Perm.No (- $Perm.Write $k@176@01))
  (not (= sys__result@160@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@176@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(declare-const $k@177@01 $Perm)
(assert ($Perm.isReadVar $k@177@01))
(assert (< $k@177@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@177@01)))
(assert (<= (- $Perm.Write $k@177@01) $Perm.Write))
(assert (=>
  (< $Perm.No (- $Perm.Write $k@177@01))
  (not (= sys__result@160@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@177@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [eval] diz.Wand_list_for_list__lemma == 2 ==> diz.Wand_list_for_list__this_2 != null && (diz.Wand_list_for_list__in_1 == diz.Wand_list_for_list__this_2 && (diz.Wand_list_for_list__in_1_0 == diz.Wand_list_for_list__L1_2 ++ diz.Wand_list_for_list__L2_2 && (diz.Wand_list_for_list__out_1 == diz.Wand_list_for_list__this_2 && diz.Wand_list_for_list__out_1_0 == diz.Wand_list_for_list__L1_2 ++ diz.Wand_list_for_list__L2_2)))
; [eval] diz.Wand_list_for_list__lemma == 2
(set-option :timeout 0)
(push) ; 4
; [then-branch: 23 | False | dead]
; [else-branch: 23 | True | live]
(push) ; 5
; [else-branch: 23 | True]
(pop) ; 5
(pop) ; 4
; Joined path conditions
; [eval] diz.Wand_list_for_list__lemma <= 2
(assert (Wand_list_for_list__valid_wand%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap 1)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap in_1@124@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.Seq<Int>To$Snap in_1_0@125@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap out_1@126@01)
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                ($SortWrappers.Seq<Int>To$Snap out_1_0@127@01)
                ($Snap.combine
                  ($SortWrappers.$RefTo$Snap this_1@116@01)
                  ($Snap.combine
                    ($SortWrappers.Seq<Int>To$Snap L2_1@117@01)
                    ($Snap.combine
                      ($SortWrappers.Seq<Int>To$Snap tmp_suffix_1@118@01)
                      ($Snap.combine
                        ($SortWrappers.Seq<Int>To$Snap L1_1@119@01)
                        ($Snap.combine
                          ($SortWrappers.$RefTo$Snap tmp_1@120@01)
                          ($Snap.combine
                            ($SortWrappers.Seq<Int>To$Snap suffix_1@121@01)
                            ($Snap.combine
                              ($SortWrappers.$RefTo$Snap cursor_1@122@01)
                              ($Snap.combine
                                ($SortWrappers.$RefTo$Snap wand_1@123@01)
                                ($Snap.combine
                                  ($Snap.combine
                                    $Snap.unit
                                    ($Snap.combine
                                      ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@129@01))))
                                      ($Snap.combine
                                        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01)))))
                                        ($Snap.combine
                                          $Snap.unit
                                          ($Snap.combine
                                            $Snap.unit
                                            ($Snap.combine
                                              $Snap.unit
                                              ($Snap.combine
                                                ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01)))))))))
                                                ($Snap.combine
                                                  $Snap.unit
                                                  ($Snap.combine
                                                    $Snap.unit
                                                    ($Snap.combine
                                                      $Snap.unit
                                                      ($Snap.combine
                                                        $Snap.unit
                                                        ($Snap.combine
                                                          $Snap.unit
                                                          ($Snap.combine
                                                            $Snap.unit
                                                            ($Snap.combine
                                                              $Snap.unit
                                                              $Snap.unit))))))))))))))
                                  ($Snap.combine
                                    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))))))))))))))))
                                    ($Snap.combine
                                      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))))))))))))))))))
                                      ($Snap.combine
                                        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))))))))))))))))))))
                                        ($Snap.combine $Snap.unit $Snap.unit))))))))))))))))))))) sys__result@160@01))
; [exec]
; __flatten_28 := vwand
; [exec]
; sys__result := __flatten_28
; [exec]
; assert sys__result != null &&
;   (acc(Wand_list_for_list__valid_wand(sys__result), write) &&
;   (Wand_list_for_list__get_in_1(sys__result) == in_1 &&
;   (Wand_list_for_list__get_in_1_0(sys__result) == in_1_0 &&
;   (Wand_list_for_list__get_out_1(sys__result) == out_1 &&
;   Wand_list_for_list__get_out_1_0(sys__result) == out_1_0))))
; [eval] sys__result != null
; [eval] Wand_list_for_list__get_in_1(sys__result) == in_1
; [eval] Wand_list_for_list__get_in_1(sys__result)
(push) ; 4
; [eval] diz != null
(assert (Wand_list_for_list__get_in_1%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.IntTo$Snap 1)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap in_1@124@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.Seq<Int>To$Snap in_1_0@125@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap out_1@126@01)
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  ($SortWrappers.Seq<Int>To$Snap out_1_0@127@01)
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap this_1@116@01)
                    ($Snap.combine
                      ($SortWrappers.Seq<Int>To$Snap L2_1@117@01)
                      ($Snap.combine
                        ($SortWrappers.Seq<Int>To$Snap tmp_suffix_1@118@01)
                        ($Snap.combine
                          ($SortWrappers.Seq<Int>To$Snap L1_1@119@01)
                          ($Snap.combine
                            ($SortWrappers.$RefTo$Snap tmp_1@120@01)
                            ($Snap.combine
                              ($SortWrappers.Seq<Int>To$Snap suffix_1@121@01)
                              ($Snap.combine
                                ($SortWrappers.$RefTo$Snap cursor_1@122@01)
                                ($Snap.combine
                                  ($SortWrappers.$RefTo$Snap wand_1@123@01)
                                  ($Snap.combine
                                    ($Snap.combine
                                      $Snap.unit
                                      ($Snap.combine
                                        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@129@01))))
                                        ($Snap.combine
                                          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01)))))
                                          ($Snap.combine
                                            $Snap.unit
                                            ($Snap.combine
                                              $Snap.unit
                                              ($Snap.combine
                                                $Snap.unit
                                                ($Snap.combine
                                                  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01)))))))))
                                                  ($Snap.combine
                                                    $Snap.unit
                                                    ($Snap.combine
                                                      $Snap.unit
                                                      ($Snap.combine
                                                        $Snap.unit
                                                        ($Snap.combine
                                                          $Snap.unit
                                                          ($Snap.combine
                                                            $Snap.unit
                                                            ($Snap.combine
                                                              $Snap.unit
                                                              ($Snap.combine
                                                                $Snap.unit
                                                                $Snap.unit))))))))))))))
                                    ($Snap.combine
                                      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))))))))))))))))
                                      ($Snap.combine
                                        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))))))))))))))))))
                                        ($Snap.combine
                                          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))))))))))))))))))))
                                          ($Snap.combine $Snap.unit $Snap.unit)))))))))))))))))))))) sys__result@160@01))
(pop) ; 4
; Joined path conditions
(assert (Wand_list_for_list__get_in_1%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.IntTo$Snap 1)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap in_1@124@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.Seq<Int>To$Snap in_1_0@125@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap out_1@126@01)
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  ($SortWrappers.Seq<Int>To$Snap out_1_0@127@01)
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap this_1@116@01)
                    ($Snap.combine
                      ($SortWrappers.Seq<Int>To$Snap L2_1@117@01)
                      ($Snap.combine
                        ($SortWrappers.Seq<Int>To$Snap tmp_suffix_1@118@01)
                        ($Snap.combine
                          ($SortWrappers.Seq<Int>To$Snap L1_1@119@01)
                          ($Snap.combine
                            ($SortWrappers.$RefTo$Snap tmp_1@120@01)
                            ($Snap.combine
                              ($SortWrappers.Seq<Int>To$Snap suffix_1@121@01)
                              ($Snap.combine
                                ($SortWrappers.$RefTo$Snap cursor_1@122@01)
                                ($Snap.combine
                                  ($SortWrappers.$RefTo$Snap wand_1@123@01)
                                  ($Snap.combine
                                    ($Snap.combine
                                      $Snap.unit
                                      ($Snap.combine
                                        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@129@01))))
                                        ($Snap.combine
                                          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01)))))
                                          ($Snap.combine
                                            $Snap.unit
                                            ($Snap.combine
                                              $Snap.unit
                                              ($Snap.combine
                                                $Snap.unit
                                                ($Snap.combine
                                                  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01)))))))))
                                                  ($Snap.combine
                                                    $Snap.unit
                                                    ($Snap.combine
                                                      $Snap.unit
                                                      ($Snap.combine
                                                        $Snap.unit
                                                        ($Snap.combine
                                                          $Snap.unit
                                                          ($Snap.combine
                                                            $Snap.unit
                                                            ($Snap.combine
                                                              $Snap.unit
                                                              ($Snap.combine
                                                                $Snap.unit
                                                                $Snap.unit))))))))))))))
                                    ($Snap.combine
                                      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))))))))))))))))
                                      ($Snap.combine
                                        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))))))))))))))))))
                                        ($Snap.combine
                                          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))))))))))))))))))))
                                          ($Snap.combine $Snap.unit $Snap.unit)))))))))))))))))))))) sys__result@160@01))
(push) ; 4
(assert (not (=
  (Wand_list_for_list__get_in_1 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 1)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap in_1@124@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($SortWrappers.Seq<Int>To$Snap in_1_0@125@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap out_1@126@01)
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    ($SortWrappers.Seq<Int>To$Snap out_1_0@127@01)
                    ($Snap.combine
                      ($SortWrappers.$RefTo$Snap this_1@116@01)
                      ($Snap.combine
                        ($SortWrappers.Seq<Int>To$Snap L2_1@117@01)
                        ($Snap.combine
                          ($SortWrappers.Seq<Int>To$Snap tmp_suffix_1@118@01)
                          ($Snap.combine
                            ($SortWrappers.Seq<Int>To$Snap L1_1@119@01)
                            ($Snap.combine
                              ($SortWrappers.$RefTo$Snap tmp_1@120@01)
                              ($Snap.combine
                                ($SortWrappers.Seq<Int>To$Snap suffix_1@121@01)
                                ($Snap.combine
                                  ($SortWrappers.$RefTo$Snap cursor_1@122@01)
                                  ($Snap.combine
                                    ($SortWrappers.$RefTo$Snap wand_1@123@01)
                                    ($Snap.combine
                                      ($Snap.combine
                                        $Snap.unit
                                        ($Snap.combine
                                          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@129@01))))
                                          ($Snap.combine
                                            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01)))))
                                            ($Snap.combine
                                              $Snap.unit
                                              ($Snap.combine
                                                $Snap.unit
                                                ($Snap.combine
                                                  $Snap.unit
                                                  ($Snap.combine
                                                    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01)))))))))
                                                    ($Snap.combine
                                                      $Snap.unit
                                                      ($Snap.combine
                                                        $Snap.unit
                                                        ($Snap.combine
                                                          $Snap.unit
                                                          ($Snap.combine
                                                            $Snap.unit
                                                            ($Snap.combine
                                                              $Snap.unit
                                                              ($Snap.combine
                                                                $Snap.unit
                                                                ($Snap.combine
                                                                  $Snap.unit
                                                                  $Snap.unit))))))))))))))
                                      ($Snap.combine
                                        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))))))))))))))))
                                        ($Snap.combine
                                          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))))))))))))))))))
                                          ($Snap.combine
                                            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))))))))))))))))))))
                                            ($Snap.combine $Snap.unit $Snap.unit)))))))))))))))))))))) sys__result@160@01)
  in_1@124@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (=
  (Wand_list_for_list__get_in_1 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 1)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap in_1@124@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($SortWrappers.Seq<Int>To$Snap in_1_0@125@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap out_1@126@01)
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    ($SortWrappers.Seq<Int>To$Snap out_1_0@127@01)
                    ($Snap.combine
                      ($SortWrappers.$RefTo$Snap this_1@116@01)
                      ($Snap.combine
                        ($SortWrappers.Seq<Int>To$Snap L2_1@117@01)
                        ($Snap.combine
                          ($SortWrappers.Seq<Int>To$Snap tmp_suffix_1@118@01)
                          ($Snap.combine
                            ($SortWrappers.Seq<Int>To$Snap L1_1@119@01)
                            ($Snap.combine
                              ($SortWrappers.$RefTo$Snap tmp_1@120@01)
                              ($Snap.combine
                                ($SortWrappers.Seq<Int>To$Snap suffix_1@121@01)
                                ($Snap.combine
                                  ($SortWrappers.$RefTo$Snap cursor_1@122@01)
                                  ($Snap.combine
                                    ($SortWrappers.$RefTo$Snap wand_1@123@01)
                                    ($Snap.combine
                                      ($Snap.combine
                                        $Snap.unit
                                        ($Snap.combine
                                          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@129@01))))
                                          ($Snap.combine
                                            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01)))))
                                            ($Snap.combine
                                              $Snap.unit
                                              ($Snap.combine
                                                $Snap.unit
                                                ($Snap.combine
                                                  $Snap.unit
                                                  ($Snap.combine
                                                    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01)))))))))
                                                    ($Snap.combine
                                                      $Snap.unit
                                                      ($Snap.combine
                                                        $Snap.unit
                                                        ($Snap.combine
                                                          $Snap.unit
                                                          ($Snap.combine
                                                            $Snap.unit
                                                            ($Snap.combine
                                                              $Snap.unit
                                                              ($Snap.combine
                                                                $Snap.unit
                                                                ($Snap.combine
                                                                  $Snap.unit
                                                                  $Snap.unit))))))))))))))
                                      ($Snap.combine
                                        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))))))))))))))))
                                        ($Snap.combine
                                          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))))))))))))))))))
                                          ($Snap.combine
                                            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))))))))))))))))))))
                                            ($Snap.combine $Snap.unit $Snap.unit)))))))))))))))))))))) sys__result@160@01)
  in_1@124@01))
; [eval] Wand_list_for_list__get_in_1_0(sys__result) == in_1_0
; [eval] Wand_list_for_list__get_in_1_0(sys__result)
(push) ; 4
; [eval] diz != null
(assert (Wand_list_for_list__get_in_1_0%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.IntTo$Snap 1)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap in_1@124@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.Seq<Int>To$Snap in_1_0@125@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap out_1@126@01)
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  ($SortWrappers.Seq<Int>To$Snap out_1_0@127@01)
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap this_1@116@01)
                    ($Snap.combine
                      ($SortWrappers.Seq<Int>To$Snap L2_1@117@01)
                      ($Snap.combine
                        ($SortWrappers.Seq<Int>To$Snap tmp_suffix_1@118@01)
                        ($Snap.combine
                          ($SortWrappers.Seq<Int>To$Snap L1_1@119@01)
                          ($Snap.combine
                            ($SortWrappers.$RefTo$Snap tmp_1@120@01)
                            ($Snap.combine
                              ($SortWrappers.Seq<Int>To$Snap suffix_1@121@01)
                              ($Snap.combine
                                ($SortWrappers.$RefTo$Snap cursor_1@122@01)
                                ($Snap.combine
                                  ($SortWrappers.$RefTo$Snap wand_1@123@01)
                                  ($Snap.combine
                                    ($Snap.combine
                                      $Snap.unit
                                      ($Snap.combine
                                        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@129@01))))
                                        ($Snap.combine
                                          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01)))))
                                          ($Snap.combine
                                            $Snap.unit
                                            ($Snap.combine
                                              $Snap.unit
                                              ($Snap.combine
                                                $Snap.unit
                                                ($Snap.combine
                                                  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01)))))))))
                                                  ($Snap.combine
                                                    $Snap.unit
                                                    ($Snap.combine
                                                      $Snap.unit
                                                      ($Snap.combine
                                                        $Snap.unit
                                                        ($Snap.combine
                                                          $Snap.unit
                                                          ($Snap.combine
                                                            $Snap.unit
                                                            ($Snap.combine
                                                              $Snap.unit
                                                              ($Snap.combine
                                                                $Snap.unit
                                                                $Snap.unit))))))))))))))
                                    ($Snap.combine
                                      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))))))))))))))))
                                      ($Snap.combine
                                        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))))))))))))))))))
                                        ($Snap.combine
                                          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))))))))))))))))))))
                                          ($Snap.combine $Snap.unit $Snap.unit)))))))))))))))))))))) sys__result@160@01))
(pop) ; 4
; Joined path conditions
(assert (Wand_list_for_list__get_in_1_0%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.IntTo$Snap 1)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap in_1@124@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.Seq<Int>To$Snap in_1_0@125@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap out_1@126@01)
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  ($SortWrappers.Seq<Int>To$Snap out_1_0@127@01)
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap this_1@116@01)
                    ($Snap.combine
                      ($SortWrappers.Seq<Int>To$Snap L2_1@117@01)
                      ($Snap.combine
                        ($SortWrappers.Seq<Int>To$Snap tmp_suffix_1@118@01)
                        ($Snap.combine
                          ($SortWrappers.Seq<Int>To$Snap L1_1@119@01)
                          ($Snap.combine
                            ($SortWrappers.$RefTo$Snap tmp_1@120@01)
                            ($Snap.combine
                              ($SortWrappers.Seq<Int>To$Snap suffix_1@121@01)
                              ($Snap.combine
                                ($SortWrappers.$RefTo$Snap cursor_1@122@01)
                                ($Snap.combine
                                  ($SortWrappers.$RefTo$Snap wand_1@123@01)
                                  ($Snap.combine
                                    ($Snap.combine
                                      $Snap.unit
                                      ($Snap.combine
                                        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@129@01))))
                                        ($Snap.combine
                                          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01)))))
                                          ($Snap.combine
                                            $Snap.unit
                                            ($Snap.combine
                                              $Snap.unit
                                              ($Snap.combine
                                                $Snap.unit
                                                ($Snap.combine
                                                  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01)))))))))
                                                  ($Snap.combine
                                                    $Snap.unit
                                                    ($Snap.combine
                                                      $Snap.unit
                                                      ($Snap.combine
                                                        $Snap.unit
                                                        ($Snap.combine
                                                          $Snap.unit
                                                          ($Snap.combine
                                                            $Snap.unit
                                                            ($Snap.combine
                                                              $Snap.unit
                                                              ($Snap.combine
                                                                $Snap.unit
                                                                $Snap.unit))))))))))))))
                                    ($Snap.combine
                                      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))))))))))))))))
                                      ($Snap.combine
                                        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))))))))))))))))))
                                        ($Snap.combine
                                          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))))))))))))))))))))
                                          ($Snap.combine $Snap.unit $Snap.unit)))))))))))))))))))))) sys__result@160@01))
(push) ; 4
(assert (not (Seq_equal
  (Wand_list_for_list__get_in_1_0 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 1)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap in_1@124@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($SortWrappers.Seq<Int>To$Snap in_1_0@125@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap out_1@126@01)
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    ($SortWrappers.Seq<Int>To$Snap out_1_0@127@01)
                    ($Snap.combine
                      ($SortWrappers.$RefTo$Snap this_1@116@01)
                      ($Snap.combine
                        ($SortWrappers.Seq<Int>To$Snap L2_1@117@01)
                        ($Snap.combine
                          ($SortWrappers.Seq<Int>To$Snap tmp_suffix_1@118@01)
                          ($Snap.combine
                            ($SortWrappers.Seq<Int>To$Snap L1_1@119@01)
                            ($Snap.combine
                              ($SortWrappers.$RefTo$Snap tmp_1@120@01)
                              ($Snap.combine
                                ($SortWrappers.Seq<Int>To$Snap suffix_1@121@01)
                                ($Snap.combine
                                  ($SortWrappers.$RefTo$Snap cursor_1@122@01)
                                  ($Snap.combine
                                    ($SortWrappers.$RefTo$Snap wand_1@123@01)
                                    ($Snap.combine
                                      ($Snap.combine
                                        $Snap.unit
                                        ($Snap.combine
                                          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@129@01))))
                                          ($Snap.combine
                                            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01)))))
                                            ($Snap.combine
                                              $Snap.unit
                                              ($Snap.combine
                                                $Snap.unit
                                                ($Snap.combine
                                                  $Snap.unit
                                                  ($Snap.combine
                                                    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01)))))))))
                                                    ($Snap.combine
                                                      $Snap.unit
                                                      ($Snap.combine
                                                        $Snap.unit
                                                        ($Snap.combine
                                                          $Snap.unit
                                                          ($Snap.combine
                                                            $Snap.unit
                                                            ($Snap.combine
                                                              $Snap.unit
                                                              ($Snap.combine
                                                                $Snap.unit
                                                                ($Snap.combine
                                                                  $Snap.unit
                                                                  $Snap.unit))))))))))))))
                                      ($Snap.combine
                                        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))))))))))))))))
                                        ($Snap.combine
                                          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))))))))))))))))))
                                          ($Snap.combine
                                            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))))))))))))))))))))
                                            ($Snap.combine $Snap.unit $Snap.unit)))))))))))))))))))))) sys__result@160@01)
  in_1_0@125@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (Seq_equal
  (Wand_list_for_list__get_in_1_0 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 1)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap in_1@124@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($SortWrappers.Seq<Int>To$Snap in_1_0@125@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap out_1@126@01)
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    ($SortWrappers.Seq<Int>To$Snap out_1_0@127@01)
                    ($Snap.combine
                      ($SortWrappers.$RefTo$Snap this_1@116@01)
                      ($Snap.combine
                        ($SortWrappers.Seq<Int>To$Snap L2_1@117@01)
                        ($Snap.combine
                          ($SortWrappers.Seq<Int>To$Snap tmp_suffix_1@118@01)
                          ($Snap.combine
                            ($SortWrappers.Seq<Int>To$Snap L1_1@119@01)
                            ($Snap.combine
                              ($SortWrappers.$RefTo$Snap tmp_1@120@01)
                              ($Snap.combine
                                ($SortWrappers.Seq<Int>To$Snap suffix_1@121@01)
                                ($Snap.combine
                                  ($SortWrappers.$RefTo$Snap cursor_1@122@01)
                                  ($Snap.combine
                                    ($SortWrappers.$RefTo$Snap wand_1@123@01)
                                    ($Snap.combine
                                      ($Snap.combine
                                        $Snap.unit
                                        ($Snap.combine
                                          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@129@01))))
                                          ($Snap.combine
                                            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01)))))
                                            ($Snap.combine
                                              $Snap.unit
                                              ($Snap.combine
                                                $Snap.unit
                                                ($Snap.combine
                                                  $Snap.unit
                                                  ($Snap.combine
                                                    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01)))))))))
                                                    ($Snap.combine
                                                      $Snap.unit
                                                      ($Snap.combine
                                                        $Snap.unit
                                                        ($Snap.combine
                                                          $Snap.unit
                                                          ($Snap.combine
                                                            $Snap.unit
                                                            ($Snap.combine
                                                              $Snap.unit
                                                              ($Snap.combine
                                                                $Snap.unit
                                                                ($Snap.combine
                                                                  $Snap.unit
                                                                  $Snap.unit))))))))))))))
                                      ($Snap.combine
                                        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))))))))))))))))
                                        ($Snap.combine
                                          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))))))))))))))))))
                                          ($Snap.combine
                                            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))))))))))))))))))))
                                            ($Snap.combine $Snap.unit $Snap.unit)))))))))))))))))))))) sys__result@160@01)
  in_1_0@125@01))
; [eval] Wand_list_for_list__get_out_1(sys__result) == out_1
; [eval] Wand_list_for_list__get_out_1(sys__result)
(push) ; 4
; [eval] diz != null
(assert (Wand_list_for_list__get_out_1%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.IntTo$Snap 1)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap in_1@124@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.Seq<Int>To$Snap in_1_0@125@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap out_1@126@01)
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  ($SortWrappers.Seq<Int>To$Snap out_1_0@127@01)
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap this_1@116@01)
                    ($Snap.combine
                      ($SortWrappers.Seq<Int>To$Snap L2_1@117@01)
                      ($Snap.combine
                        ($SortWrappers.Seq<Int>To$Snap tmp_suffix_1@118@01)
                        ($Snap.combine
                          ($SortWrappers.Seq<Int>To$Snap L1_1@119@01)
                          ($Snap.combine
                            ($SortWrappers.$RefTo$Snap tmp_1@120@01)
                            ($Snap.combine
                              ($SortWrappers.Seq<Int>To$Snap suffix_1@121@01)
                              ($Snap.combine
                                ($SortWrappers.$RefTo$Snap cursor_1@122@01)
                                ($Snap.combine
                                  ($SortWrappers.$RefTo$Snap wand_1@123@01)
                                  ($Snap.combine
                                    ($Snap.combine
                                      $Snap.unit
                                      ($Snap.combine
                                        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@129@01))))
                                        ($Snap.combine
                                          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01)))))
                                          ($Snap.combine
                                            $Snap.unit
                                            ($Snap.combine
                                              $Snap.unit
                                              ($Snap.combine
                                                $Snap.unit
                                                ($Snap.combine
                                                  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01)))))))))
                                                  ($Snap.combine
                                                    $Snap.unit
                                                    ($Snap.combine
                                                      $Snap.unit
                                                      ($Snap.combine
                                                        $Snap.unit
                                                        ($Snap.combine
                                                          $Snap.unit
                                                          ($Snap.combine
                                                            $Snap.unit
                                                            ($Snap.combine
                                                              $Snap.unit
                                                              ($Snap.combine
                                                                $Snap.unit
                                                                $Snap.unit))))))))))))))
                                    ($Snap.combine
                                      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))))))))))))))))
                                      ($Snap.combine
                                        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))))))))))))))))))
                                        ($Snap.combine
                                          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))))))))))))))))))))
                                          ($Snap.combine $Snap.unit $Snap.unit)))))))))))))))))))))) sys__result@160@01))
(pop) ; 4
; Joined path conditions
(assert (Wand_list_for_list__get_out_1%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.IntTo$Snap 1)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap in_1@124@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.Seq<Int>To$Snap in_1_0@125@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap out_1@126@01)
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  ($SortWrappers.Seq<Int>To$Snap out_1_0@127@01)
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap this_1@116@01)
                    ($Snap.combine
                      ($SortWrappers.Seq<Int>To$Snap L2_1@117@01)
                      ($Snap.combine
                        ($SortWrappers.Seq<Int>To$Snap tmp_suffix_1@118@01)
                        ($Snap.combine
                          ($SortWrappers.Seq<Int>To$Snap L1_1@119@01)
                          ($Snap.combine
                            ($SortWrappers.$RefTo$Snap tmp_1@120@01)
                            ($Snap.combine
                              ($SortWrappers.Seq<Int>To$Snap suffix_1@121@01)
                              ($Snap.combine
                                ($SortWrappers.$RefTo$Snap cursor_1@122@01)
                                ($Snap.combine
                                  ($SortWrappers.$RefTo$Snap wand_1@123@01)
                                  ($Snap.combine
                                    ($Snap.combine
                                      $Snap.unit
                                      ($Snap.combine
                                        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@129@01))))
                                        ($Snap.combine
                                          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01)))))
                                          ($Snap.combine
                                            $Snap.unit
                                            ($Snap.combine
                                              $Snap.unit
                                              ($Snap.combine
                                                $Snap.unit
                                                ($Snap.combine
                                                  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01)))))))))
                                                  ($Snap.combine
                                                    $Snap.unit
                                                    ($Snap.combine
                                                      $Snap.unit
                                                      ($Snap.combine
                                                        $Snap.unit
                                                        ($Snap.combine
                                                          $Snap.unit
                                                          ($Snap.combine
                                                            $Snap.unit
                                                            ($Snap.combine
                                                              $Snap.unit
                                                              ($Snap.combine
                                                                $Snap.unit
                                                                $Snap.unit))))))))))))))
                                    ($Snap.combine
                                      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))))))))))))))))
                                      ($Snap.combine
                                        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))))))))))))))))))
                                        ($Snap.combine
                                          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))))))))))))))))))))
                                          ($Snap.combine $Snap.unit $Snap.unit)))))))))))))))))))))) sys__result@160@01))
(push) ; 4
(assert (not (=
  (Wand_list_for_list__get_out_1 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 1)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap in_1@124@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($SortWrappers.Seq<Int>To$Snap in_1_0@125@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap out_1@126@01)
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    ($SortWrappers.Seq<Int>To$Snap out_1_0@127@01)
                    ($Snap.combine
                      ($SortWrappers.$RefTo$Snap this_1@116@01)
                      ($Snap.combine
                        ($SortWrappers.Seq<Int>To$Snap L2_1@117@01)
                        ($Snap.combine
                          ($SortWrappers.Seq<Int>To$Snap tmp_suffix_1@118@01)
                          ($Snap.combine
                            ($SortWrappers.Seq<Int>To$Snap L1_1@119@01)
                            ($Snap.combine
                              ($SortWrappers.$RefTo$Snap tmp_1@120@01)
                              ($Snap.combine
                                ($SortWrappers.Seq<Int>To$Snap suffix_1@121@01)
                                ($Snap.combine
                                  ($SortWrappers.$RefTo$Snap cursor_1@122@01)
                                  ($Snap.combine
                                    ($SortWrappers.$RefTo$Snap wand_1@123@01)
                                    ($Snap.combine
                                      ($Snap.combine
                                        $Snap.unit
                                        ($Snap.combine
                                          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@129@01))))
                                          ($Snap.combine
                                            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01)))))
                                            ($Snap.combine
                                              $Snap.unit
                                              ($Snap.combine
                                                $Snap.unit
                                                ($Snap.combine
                                                  $Snap.unit
                                                  ($Snap.combine
                                                    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01)))))))))
                                                    ($Snap.combine
                                                      $Snap.unit
                                                      ($Snap.combine
                                                        $Snap.unit
                                                        ($Snap.combine
                                                          $Snap.unit
                                                          ($Snap.combine
                                                            $Snap.unit
                                                            ($Snap.combine
                                                              $Snap.unit
                                                              ($Snap.combine
                                                                $Snap.unit
                                                                ($Snap.combine
                                                                  $Snap.unit
                                                                  $Snap.unit))))))))))))))
                                      ($Snap.combine
                                        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))))))))))))))))
                                        ($Snap.combine
                                          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))))))))))))))))))
                                          ($Snap.combine
                                            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))))))))))))))))))))
                                            ($Snap.combine $Snap.unit $Snap.unit)))))))))))))))))))))) sys__result@160@01)
  out_1@126@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (=
  (Wand_list_for_list__get_out_1 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 1)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap in_1@124@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($SortWrappers.Seq<Int>To$Snap in_1_0@125@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap out_1@126@01)
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    ($SortWrappers.Seq<Int>To$Snap out_1_0@127@01)
                    ($Snap.combine
                      ($SortWrappers.$RefTo$Snap this_1@116@01)
                      ($Snap.combine
                        ($SortWrappers.Seq<Int>To$Snap L2_1@117@01)
                        ($Snap.combine
                          ($SortWrappers.Seq<Int>To$Snap tmp_suffix_1@118@01)
                          ($Snap.combine
                            ($SortWrappers.Seq<Int>To$Snap L1_1@119@01)
                            ($Snap.combine
                              ($SortWrappers.$RefTo$Snap tmp_1@120@01)
                              ($Snap.combine
                                ($SortWrappers.Seq<Int>To$Snap suffix_1@121@01)
                                ($Snap.combine
                                  ($SortWrappers.$RefTo$Snap cursor_1@122@01)
                                  ($Snap.combine
                                    ($SortWrappers.$RefTo$Snap wand_1@123@01)
                                    ($Snap.combine
                                      ($Snap.combine
                                        $Snap.unit
                                        ($Snap.combine
                                          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@129@01))))
                                          ($Snap.combine
                                            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01)))))
                                            ($Snap.combine
                                              $Snap.unit
                                              ($Snap.combine
                                                $Snap.unit
                                                ($Snap.combine
                                                  $Snap.unit
                                                  ($Snap.combine
                                                    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01)))))))))
                                                    ($Snap.combine
                                                      $Snap.unit
                                                      ($Snap.combine
                                                        $Snap.unit
                                                        ($Snap.combine
                                                          $Snap.unit
                                                          ($Snap.combine
                                                            $Snap.unit
                                                            ($Snap.combine
                                                              $Snap.unit
                                                              ($Snap.combine
                                                                $Snap.unit
                                                                ($Snap.combine
                                                                  $Snap.unit
                                                                  $Snap.unit))))))))))))))
                                      ($Snap.combine
                                        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))))))))))))))))
                                        ($Snap.combine
                                          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))))))))))))))))))
                                          ($Snap.combine
                                            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))))))))))))))))))))
                                            ($Snap.combine $Snap.unit $Snap.unit)))))))))))))))))))))) sys__result@160@01)
  out_1@126@01))
; [eval] Wand_list_for_list__get_out_1_0(sys__result) == out_1_0
; [eval] Wand_list_for_list__get_out_1_0(sys__result)
(push) ; 4
; [eval] diz != null
(assert (Wand_list_for_list__get_out_1_0%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.IntTo$Snap 1)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap in_1@124@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.Seq<Int>To$Snap in_1_0@125@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap out_1@126@01)
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  ($SortWrappers.Seq<Int>To$Snap out_1_0@127@01)
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap this_1@116@01)
                    ($Snap.combine
                      ($SortWrappers.Seq<Int>To$Snap L2_1@117@01)
                      ($Snap.combine
                        ($SortWrappers.Seq<Int>To$Snap tmp_suffix_1@118@01)
                        ($Snap.combine
                          ($SortWrappers.Seq<Int>To$Snap L1_1@119@01)
                          ($Snap.combine
                            ($SortWrappers.$RefTo$Snap tmp_1@120@01)
                            ($Snap.combine
                              ($SortWrappers.Seq<Int>To$Snap suffix_1@121@01)
                              ($Snap.combine
                                ($SortWrappers.$RefTo$Snap cursor_1@122@01)
                                ($Snap.combine
                                  ($SortWrappers.$RefTo$Snap wand_1@123@01)
                                  ($Snap.combine
                                    ($Snap.combine
                                      $Snap.unit
                                      ($Snap.combine
                                        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@129@01))))
                                        ($Snap.combine
                                          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01)))))
                                          ($Snap.combine
                                            $Snap.unit
                                            ($Snap.combine
                                              $Snap.unit
                                              ($Snap.combine
                                                $Snap.unit
                                                ($Snap.combine
                                                  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01)))))))))
                                                  ($Snap.combine
                                                    $Snap.unit
                                                    ($Snap.combine
                                                      $Snap.unit
                                                      ($Snap.combine
                                                        $Snap.unit
                                                        ($Snap.combine
                                                          $Snap.unit
                                                          ($Snap.combine
                                                            $Snap.unit
                                                            ($Snap.combine
                                                              $Snap.unit
                                                              ($Snap.combine
                                                                $Snap.unit
                                                                $Snap.unit))))))))))))))
                                    ($Snap.combine
                                      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))))))))))))))))
                                      ($Snap.combine
                                        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))))))))))))))))))
                                        ($Snap.combine
                                          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))))))))))))))))))))
                                          ($Snap.combine $Snap.unit $Snap.unit)))))))))))))))))))))) sys__result@160@01))
(pop) ; 4
; Joined path conditions
(assert (Wand_list_for_list__get_out_1_0%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.IntTo$Snap 1)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap in_1@124@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.Seq<Int>To$Snap in_1_0@125@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap out_1@126@01)
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  ($SortWrappers.Seq<Int>To$Snap out_1_0@127@01)
                  ($Snap.combine
                    ($SortWrappers.$RefTo$Snap this_1@116@01)
                    ($Snap.combine
                      ($SortWrappers.Seq<Int>To$Snap L2_1@117@01)
                      ($Snap.combine
                        ($SortWrappers.Seq<Int>To$Snap tmp_suffix_1@118@01)
                        ($Snap.combine
                          ($SortWrappers.Seq<Int>To$Snap L1_1@119@01)
                          ($Snap.combine
                            ($SortWrappers.$RefTo$Snap tmp_1@120@01)
                            ($Snap.combine
                              ($SortWrappers.Seq<Int>To$Snap suffix_1@121@01)
                              ($Snap.combine
                                ($SortWrappers.$RefTo$Snap cursor_1@122@01)
                                ($Snap.combine
                                  ($SortWrappers.$RefTo$Snap wand_1@123@01)
                                  ($Snap.combine
                                    ($Snap.combine
                                      $Snap.unit
                                      ($Snap.combine
                                        ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@129@01))))
                                        ($Snap.combine
                                          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01)))))
                                          ($Snap.combine
                                            $Snap.unit
                                            ($Snap.combine
                                              $Snap.unit
                                              ($Snap.combine
                                                $Snap.unit
                                                ($Snap.combine
                                                  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01)))))))))
                                                  ($Snap.combine
                                                    $Snap.unit
                                                    ($Snap.combine
                                                      $Snap.unit
                                                      ($Snap.combine
                                                        $Snap.unit
                                                        ($Snap.combine
                                                          $Snap.unit
                                                          ($Snap.combine
                                                            $Snap.unit
                                                            ($Snap.combine
                                                              $Snap.unit
                                                              ($Snap.combine
                                                                $Snap.unit
                                                                $Snap.unit))))))))))))))
                                    ($Snap.combine
                                      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))))))))))))))))
                                      ($Snap.combine
                                        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))))))))))))))))))
                                        ($Snap.combine
                                          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))))))))))))))))))))
                                          ($Snap.combine $Snap.unit $Snap.unit)))))))))))))))))))))) sys__result@160@01))
(push) ; 4
(assert (not (Seq_equal
  (Wand_list_for_list__get_out_1_0 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 1)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap in_1@124@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($SortWrappers.Seq<Int>To$Snap in_1_0@125@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap out_1@126@01)
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    ($SortWrappers.Seq<Int>To$Snap out_1_0@127@01)
                    ($Snap.combine
                      ($SortWrappers.$RefTo$Snap this_1@116@01)
                      ($Snap.combine
                        ($SortWrappers.Seq<Int>To$Snap L2_1@117@01)
                        ($Snap.combine
                          ($SortWrappers.Seq<Int>To$Snap tmp_suffix_1@118@01)
                          ($Snap.combine
                            ($SortWrappers.Seq<Int>To$Snap L1_1@119@01)
                            ($Snap.combine
                              ($SortWrappers.$RefTo$Snap tmp_1@120@01)
                              ($Snap.combine
                                ($SortWrappers.Seq<Int>To$Snap suffix_1@121@01)
                                ($Snap.combine
                                  ($SortWrappers.$RefTo$Snap cursor_1@122@01)
                                  ($Snap.combine
                                    ($SortWrappers.$RefTo$Snap wand_1@123@01)
                                    ($Snap.combine
                                      ($Snap.combine
                                        $Snap.unit
                                        ($Snap.combine
                                          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@129@01))))
                                          ($Snap.combine
                                            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01)))))
                                            ($Snap.combine
                                              $Snap.unit
                                              ($Snap.combine
                                                $Snap.unit
                                                ($Snap.combine
                                                  $Snap.unit
                                                  ($Snap.combine
                                                    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01)))))))))
                                                    ($Snap.combine
                                                      $Snap.unit
                                                      ($Snap.combine
                                                        $Snap.unit
                                                        ($Snap.combine
                                                          $Snap.unit
                                                          ($Snap.combine
                                                            $Snap.unit
                                                            ($Snap.combine
                                                              $Snap.unit
                                                              ($Snap.combine
                                                                $Snap.unit
                                                                ($Snap.combine
                                                                  $Snap.unit
                                                                  $Snap.unit))))))))))))))
                                      ($Snap.combine
                                        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))))))))))))))))
                                        ($Snap.combine
                                          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))))))))))))))))))
                                          ($Snap.combine
                                            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))))))))))))))))))))
                                            ($Snap.combine $Snap.unit $Snap.unit)))))))))))))))))))))) sys__result@160@01)
  out_1_0@127@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (Seq_equal
  (Wand_list_for_list__get_out_1_0 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 1)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap in_1@124@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($SortWrappers.Seq<Int>To$Snap in_1_0@125@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap out_1@126@01)
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    ($SortWrappers.Seq<Int>To$Snap out_1_0@127@01)
                    ($Snap.combine
                      ($SortWrappers.$RefTo$Snap this_1@116@01)
                      ($Snap.combine
                        ($SortWrappers.Seq<Int>To$Snap L2_1@117@01)
                        ($Snap.combine
                          ($SortWrappers.Seq<Int>To$Snap tmp_suffix_1@118@01)
                          ($Snap.combine
                            ($SortWrappers.Seq<Int>To$Snap L1_1@119@01)
                            ($Snap.combine
                              ($SortWrappers.$RefTo$Snap tmp_1@120@01)
                              ($Snap.combine
                                ($SortWrappers.Seq<Int>To$Snap suffix_1@121@01)
                                ($Snap.combine
                                  ($SortWrappers.$RefTo$Snap cursor_1@122@01)
                                  ($Snap.combine
                                    ($SortWrappers.$RefTo$Snap wand_1@123@01)
                                    ($Snap.combine
                                      ($Snap.combine
                                        $Snap.unit
                                        ($Snap.combine
                                          ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@129@01))))
                                          ($Snap.combine
                                            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01)))))
                                            ($Snap.combine
                                              $Snap.unit
                                              ($Snap.combine
                                                $Snap.unit
                                                ($Snap.combine
                                                  $Snap.unit
                                                  ($Snap.combine
                                                    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@129@01)))))))))
                                                    ($Snap.combine
                                                      $Snap.unit
                                                      ($Snap.combine
                                                        $Snap.unit
                                                        ($Snap.combine
                                                          $Snap.unit
                                                          ($Snap.combine
                                                            $Snap.unit
                                                            ($Snap.combine
                                                              $Snap.unit
                                                              ($Snap.combine
                                                                $Snap.unit
                                                                ($Snap.combine
                                                                  $Snap.unit
                                                                  $Snap.unit))))))))))))))
                                      ($Snap.combine
                                        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))))))))))))))))
                                        ($Snap.combine
                                          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))))))))))))))))))
                                          ($Snap.combine
                                            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@161@01))))))))))))))))))))))))))))))))
                                            ($Snap.combine $Snap.unit $Snap.unit)))))))))))))))))))))) sys__result@160@01)
  out_1_0@127@01))
; [exec]
; inhale false
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- List__Wand_list_for_list_lemma_2 ----------
(declare-const diz@178@01 $Ref)
(declare-const current_thread_id@179@01 Int)
(declare-const this_2@180@01 $Ref)
(declare-const L2_2@181@01 Seq<Int>)
(declare-const L1_2@182@01 Seq<Int>)
(declare-const in_1@183@01 $Ref)
(declare-const in_1_0@184@01 Seq<Int>)
(declare-const out_1@185@01 $Ref)
(declare-const out_1_0@186@01 Seq<Int>)
(declare-const sys__result@187@01 $Ref)
(declare-const diz@188@01 $Ref)
(declare-const current_thread_id@189@01 Int)
(declare-const this_2@190@01 $Ref)
(declare-const L2_2@191@01 Seq<Int>)
(declare-const L1_2@192@01 Seq<Int>)
(declare-const in_1@193@01 $Ref)
(declare-const in_1_0@194@01 Seq<Int>)
(declare-const out_1@195@01 $Ref)
(declare-const out_1_0@196@01 Seq<Int>)
(declare-const sys__result@197@01 $Ref)
(push) ; 1
(declare-const $t@198@01 $Snap)
(assert (= $t@198@01 ($Snap.combine ($Snap.first $t@198@01) ($Snap.second $t@198@01))))
(assert (= ($Snap.first $t@198@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@188@01 $Ref.null)))
(assert (=
  ($Snap.second $t@198@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@198@01))
    ($Snap.second ($Snap.second $t@198@01)))))
(assert (= ($Snap.first ($Snap.second $t@198@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@189@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@198@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@198@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@198@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@198@01))) $Snap.unit))
; [eval] this_2 != null
(assert (not (= this_2@190@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@198@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@198@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@198@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@198@01))))
  $Snap.unit))
; [eval] in_1 != null
(assert (not (= in_1@193@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@198@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@198@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@198@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@198@01)))))
  $Snap.unit))
; [eval] in_1 == this_2
(assert (= in_1@193@01 this_2@190@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@198@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@198@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@198@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@198@01))))))
  $Snap.unit))
; [eval] in_1_0 == L1_2 ++ L2_2
; [eval] L1_2 ++ L2_2
(assert (Seq_equal in_1_0@194@01 (Seq_append L1_2@192@01 L2_2@191@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@198@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@198@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@198@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@198@01)))))))
  $Snap.unit))
; [eval] out_1 != null
(assert (not (= out_1@195@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@198@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@198@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@198@01)))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@198@01))))))))
  $Snap.unit))
; [eval] out_1 == this_2
(assert (= out_1@195@01 this_2@190@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@198@01))))))))
  $Snap.unit))
; [eval] out_1_0 == L1_2 ++ L2_2
; [eval] L1_2 ++ L2_2
(assert (Seq_equal out_1_0@196@01 (Seq_append L1_2@192@01 L2_2@191@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@199@01 $Snap)
(assert (= $t@199@01 ($Snap.combine ($Snap.first $t@199@01) ($Snap.second $t@199@01))))
(assert (= ($Snap.first $t@199@01) $Snap.unit))
; [eval] sys__result != null
(assert (not (= sys__result@197@01 $Ref.null)))
(assert (=
  ($Snap.second $t@199@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@199@01))
    ($Snap.second ($Snap.second $t@199@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@199@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@199@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@199@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@199@01))) $Snap.unit))
; [eval] Wand_list_for_list__get_in_1(sys__result) == in_1
; [eval] Wand_list_for_list__get_in_1(sys__result)
(push) ; 3
; [eval] diz != null
(assert (Wand_list_for_list__get_in_1%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second $t@199@01))) sys__result@197@01))
(pop) ; 3
; Joined path conditions
(assert (Wand_list_for_list__get_in_1%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second $t@199@01))) sys__result@197@01))
(assert (=
  (Wand_list_for_list__get_in_1 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second $t@199@01))) sys__result@197@01)
  in_1@193@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@199@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@199@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@199@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@199@01))))
  $Snap.unit))
; [eval] Wand_list_for_list__get_in_1_0(sys__result) == in_1_0
; [eval] Wand_list_for_list__get_in_1_0(sys__result)
(push) ; 3
; [eval] diz != null
(assert (Wand_list_for_list__get_in_1_0%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second $t@199@01))) sys__result@197@01))
(pop) ; 3
; Joined path conditions
(assert (Wand_list_for_list__get_in_1_0%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second $t@199@01))) sys__result@197@01))
(assert (Seq_equal
  (Wand_list_for_list__get_in_1_0 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second $t@199@01))) sys__result@197@01)
  in_1_0@194@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@199@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@199@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@199@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@199@01)))))
  $Snap.unit))
; [eval] Wand_list_for_list__get_out_1(sys__result) == out_1
; [eval] Wand_list_for_list__get_out_1(sys__result)
(push) ; 3
; [eval] diz != null
(assert (Wand_list_for_list__get_out_1%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second $t@199@01))) sys__result@197@01))
(pop) ; 3
; Joined path conditions
(assert (Wand_list_for_list__get_out_1%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second $t@199@01))) sys__result@197@01))
(assert (=
  (Wand_list_for_list__get_out_1 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second $t@199@01))) sys__result@197@01)
  out_1@195@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@199@01)))))
  $Snap.unit))
; [eval] Wand_list_for_list__get_out_1_0(sys__result) == out_1_0
; [eval] Wand_list_for_list__get_out_1_0(sys__result)
(push) ; 3
; [eval] diz != null
(assert (Wand_list_for_list__get_out_1_0%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second $t@199@01))) sys__result@197@01))
(pop) ; 3
; Joined path conditions
(assert (Wand_list_for_list__get_out_1_0%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second $t@199@01))) sys__result@197@01))
(assert (Seq_equal
  (Wand_list_for_list__get_out_1_0 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second $t@199@01))) sys__result@197@01)
  out_1_0@196@01))
(pop) ; 2
(push) ; 2
; [exec]
; var vwand: Ref
(declare-const vwand@200@01 $Ref)
; [exec]
; var __flatten_29: Ref
(declare-const __flatten_29@201@01 $Ref)
; [exec]
; var __flatten_30: Int
(declare-const __flatten_30@202@01 Int)
; [exec]
; var __flatten_31: Ref
(declare-const __flatten_31@203@01 $Ref)
; [exec]
; var __flatten_32: Seq[Int]
(declare-const __flatten_32@204@01 Seq<Int>)
; [exec]
; var __flatten_33: Seq[Int]
(declare-const __flatten_33@205@01 Seq<Int>)
; [exec]
; var __flatten_34: Ref
(declare-const __flatten_34@206@01 $Ref)
; [exec]
; var __flatten_35: Seq[Int]
(declare-const __flatten_35@207@01 Seq<Int>)
; [exec]
; var __flatten_36: Ref
(declare-const __flatten_36@208@01 $Ref)
; [exec]
; var __flatten_37: Seq[Int]
(declare-const __flatten_37@209@01 Seq<Int>)
; [exec]
; var __flatten_38: Ref
(declare-const __flatten_38@210@01 $Ref)
; [exec]
; var __flatten_73: Int
(declare-const __flatten_73@211@01 Int)
; [exec]
; var __flatten_74: Ref
(declare-const __flatten_74@212@01 $Ref)
; [exec]
; var __flatten_75: Seq[Int]
(declare-const __flatten_75@213@01 Seq<Int>)
; [exec]
; var __flatten_76: Seq[Int]
(declare-const __flatten_76@214@01 Seq<Int>)
; [exec]
; var __flatten_77: Ref
(declare-const __flatten_77@215@01 $Ref)
; [exec]
; var __flatten_78: Seq[Int]
(declare-const __flatten_78@216@01 Seq<Int>)
; [exec]
; var __flatten_79: Ref
(declare-const __flatten_79@217@01 $Ref)
; [exec]
; var __flatten_80: Seq[Int]
(declare-const __flatten_80@218@01 Seq<Int>)
; [exec]
; __flatten_29 := Wand_list_for_list__Wand_list_for_list(current_thread_id)
; [eval] current_thread_id >= 0
(declare-const sys__result@219@01 $Ref)
(declare-const $t@220@01 $Snap)
(assert (= $t@220@01 ($Snap.combine ($Snap.first $t@220@01) ($Snap.second $t@220@01))))
(assert (= ($Snap.first $t@220@01) $Snap.unit))
; [eval] sys__result != null
(assert (not (= sys__result@219@01 $Ref.null)))
(assert (=
  ($Snap.second $t@220@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@220@01))
    ($Snap.second ($Snap.second $t@220@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@220@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@220@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@220@01))) $Snap.unit))
; [eval] sys__result.Wand_list_for_list__lemma == 0
(assert (= ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second $t@220@01))) 0))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@220@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@220@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01)))))
  $Snap.unit))
; [eval] sys__result.Wand_list_for_list__in_1 == null
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@220@01)))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01)))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01)))))))
  $Snap.unit))
; [eval] sys__result.Wand_list_for_list__in_1_0 == Seq[Int]()
; [eval] Seq[Int]()
(assert (Seq_equal
  ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01)))))))
  (as Seq_empty  Seq<Int>)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01)))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01)))))))))
  $Snap.unit))
; [eval] sys__result.Wand_list_for_list__out_1 == null
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01)))))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01)))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01)))))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01)))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01)))))))))))
  $Snap.unit))
; [eval] sys__result.Wand_list_for_list__out_1_0 == Seq[Int]()
; [eval] Seq[Int]()
(assert (Seq_equal
  ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01)))))))))))
  (as Seq_empty  Seq<Int>)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01)))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01)))))))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01)))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01)))))))))))))
  $Snap.unit))
; [eval] sys__result.Wand_list_for_list__this_1 == null
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01)))))))))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01)))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01)))))))))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01)))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01)))))))))))))))
  $Snap.unit))
; [eval] sys__result.Wand_list_for_list__L2_1 == Seq[Int]()
; [eval] Seq[Int]()
(assert (Seq_equal
  ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01)))))))))))))))
  (as Seq_empty  Seq<Int>)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01)))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01)))))))))))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01)))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01)))))))))))))))))
  $Snap.unit))
; [eval] sys__result.Wand_list_for_list__tmp_suffix_1 == Seq[Int]()
; [eval] Seq[Int]()
(assert (Seq_equal
  ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01)))))))))))))))))
  (as Seq_empty  Seq<Int>)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01)))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01)))))))))))))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01)))))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01)))))))))))))))))))
  $Snap.unit))
; [eval] sys__result.Wand_list_for_list__L1_1 == Seq[Int]()
; [eval] Seq[Int]()
(assert (Seq_equal
  ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01)))))))))))))))))))
  (as Seq_empty  Seq<Int>)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01)))))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01)))))))))))))))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01)))))))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01)))))))))))))))))))))
  $Snap.unit))
; [eval] sys__result.Wand_list_for_list__tmp_1 == null
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01)))))))))))))))))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01)))))))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01)))))))))))))))))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01)))))))))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01)))))))))))))))))))))))
  $Snap.unit))
; [eval] sys__result.Wand_list_for_list__suffix_1 == Seq[Int]()
; [eval] Seq[Int]()
(assert (Seq_equal
  ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01)))))))))))))))))))))))
  (as Seq_empty  Seq<Int>)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01)))))))))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01)))))))))))))))))))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01)))))))))))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01)))))))))))))))))))))))))
  $Snap.unit))
; [eval] sys__result.Wand_list_for_list__cursor_1 == null
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01)))))))))))))))))))))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01)))))))))))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01)))))))))))))))))))))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01)))))))))))))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01)))))))))))))))))))))))))))
  $Snap.unit))
; [eval] sys__result.Wand_list_for_list__wand_1 == null
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01)))))))))))))))))))))))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01)))))))))))))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01)))))))))))))))))))))))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01)))))))))))))))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01)))))))))))))))))))))))))))))
  $Snap.unit))
; [eval] sys__result.Wand_list_for_list__this_2 == null
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01)))))))))))))))))))))))))))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01)))))))))))))))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01)))))))))))))))))))))))))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01)))))))))))))))))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01)))))))))))))))))))))))))))))))
  $Snap.unit))
; [eval] sys__result.Wand_list_for_list__L2_2 == Seq[Int]()
; [eval] Seq[Int]()
(assert (Seq_equal
  ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01)))))))))))))))))))))))))))))))
  (as Seq_empty  Seq<Int>)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01)))))))))))))))))))))))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01)))))))))))))))))))))))))))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))))))))))))))
  $Snap.unit))
; [eval] sys__result.Wand_list_for_list__L1_2 == Seq[Int]()
; [eval] Seq[Int]()
(assert (Seq_equal
  ($SortWrappers.$SnapToSeq<Int> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01)))))))))))))))))))))))))))))))))
  (as Seq_empty  Seq<Int>)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; vwand := __flatten_29
; [exec]
; __flatten_30 := 2
; [exec]
; __flatten_73 := __flatten_30
; [exec]
; vwand.Wand_list_for_list__lemma := __flatten_73
; [exec]
; __flatten_31 := this_2
; [exec]
; __flatten_74 := __flatten_31
; [exec]
; vwand.Wand_list_for_list__this_2 := __flatten_74
; [exec]
; __flatten_32 := L2_2
; [exec]
; __flatten_75 := __flatten_32
; [exec]
; vwand.Wand_list_for_list__L2_2 := __flatten_75
; [exec]
; __flatten_33 := L1_2
; [exec]
; __flatten_76 := __flatten_33
; [exec]
; vwand.Wand_list_for_list__L1_2 := __flatten_76
; [exec]
; __flatten_34 := in_1
; [exec]
; __flatten_77 := __flatten_34
; [exec]
; vwand.Wand_list_for_list__in_1 := __flatten_77
; [exec]
; __flatten_35 := in_1_0
; [exec]
; __flatten_78 := __flatten_35
; [exec]
; vwand.Wand_list_for_list__in_1_0 := __flatten_78
; [exec]
; __flatten_36 := out_1
; [exec]
; __flatten_79 := __flatten_36
; [exec]
; vwand.Wand_list_for_list__out_1 := __flatten_79
; [exec]
; __flatten_37 := out_1_0
; [exec]
; __flatten_80 := __flatten_37
; [exec]
; vwand.Wand_list_for_list__out_1_0 := __flatten_80
; [exec]
; fold acc(Wand_list_for_list__valid_wand(vwand), write)
(declare-const $k@221@01 $Perm)
(assert ($Perm.isReadVar $k@221@01))
(assert (< $k@221@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@221@01)))
(assert (<= (- $Perm.Write $k@221@01) $Perm.Write))
(assert (=>
  (< $Perm.No (- $Perm.Write $k@221@01))
  (not (= sys__result@219@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@221@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [eval] 1 <= diz.Wand_list_for_list__lemma
(declare-const $k@222@01 $Perm)
(assert ($Perm.isReadVar $k@222@01))
(assert (< $k@222@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@222@01)))
(assert (<= (- $Perm.Write $k@222@01) $Perm.Write))
(assert (=>
  (< $Perm.No (- $Perm.Write $k@222@01))
  (not (= sys__result@219@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@222@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [eval] diz.Wand_list_for_list__in_1 != null
(declare-const $k@223@01 $Perm)
(assert ($Perm.isReadVar $k@223@01))
(assert (< $k@223@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@223@01)))
(assert (<= (- $Perm.Write $k@223@01) $Perm.Write))
(assert (=>
  (< $Perm.No (- $Perm.Write $k@223@01))
  (not (= sys__result@219@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@223@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const $k@224@01 $Perm)
(assert ($Perm.isReadVar $k@224@01))
(assert (< $k@224@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@224@01)))
(assert (<= (- $Perm.Write $k@224@01) $Perm.Write))
(assert (=>
  (< $Perm.No (- $Perm.Write $k@224@01))
  (not (= sys__result@219@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@224@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [eval] diz.Wand_list_for_list__out_1 != null
(declare-const $k@225@01 $Perm)
(assert ($Perm.isReadVar $k@225@01))
(assert (< $k@225@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@225@01)))
(assert (<= (- $Perm.Write $k@225@01) $Perm.Write))
(assert (=>
  (< $Perm.No (- $Perm.Write $k@225@01))
  (not (= sys__result@219@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@225@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const $k@226@01 $Perm)
(assert ($Perm.isReadVar $k@226@01))
(assert (< $k@226@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@226@01)))
(assert (<= (- $Perm.Write $k@226@01) $Perm.Write))
(assert (=>
  (< $Perm.No (- $Perm.Write $k@226@01))
  (not (= sys__result@219@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@226@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const $k@227@01 $Perm)
(assert ($Perm.isReadVar $k@227@01))
(assert (< $k@227@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@227@01)))
(assert (<= (- $Perm.Write $k@227@01) $Perm.Write))
(assert (=>
  (< $Perm.No (- $Perm.Write $k@227@01))
  (not (= sys__result@219@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@227@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const $k@228@01 $Perm)
(assert ($Perm.isReadVar $k@228@01))
(assert (< $k@228@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@228@01)))
(assert (<= (- $Perm.Write $k@228@01) $Perm.Write))
(assert (=>
  (< $Perm.No (- $Perm.Write $k@228@01))
  (not (= sys__result@219@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@228@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const $k@229@01 $Perm)
(assert ($Perm.isReadVar $k@229@01))
(assert (< $k@229@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@229@01)))
(assert (<= (- $Perm.Write $k@229@01) $Perm.Write))
(assert (=>
  (< $Perm.No (- $Perm.Write $k@229@01))
  (not (= sys__result@219@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@229@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const $k@230@01 $Perm)
(assert ($Perm.isReadVar $k@230@01))
(assert (< $k@230@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@230@01)))
(assert (<= (- $Perm.Write $k@230@01) $Perm.Write))
(assert (=>
  (< $Perm.No (- $Perm.Write $k@230@01))
  (not (= sys__result@219@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@230@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const $k@231@01 $Perm)
(assert ($Perm.isReadVar $k@231@01))
(assert (< $k@231@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@231@01)))
(assert (<= (- $Perm.Write $k@231@01) $Perm.Write))
(assert (=>
  (< $Perm.No (- $Perm.Write $k@231@01))
  (not (= sys__result@219@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@231@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const $k@232@01 $Perm)
(assert ($Perm.isReadVar $k@232@01))
(assert (< $k@232@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@232@01)))
(assert (<= (- $Perm.Write $k@232@01) $Perm.Write))
(assert (=>
  (< $Perm.No (- $Perm.Write $k@232@01))
  (not (= sys__result@219@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@232@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const $k@233@01 $Perm)
(assert ($Perm.isReadVar $k@233@01))
(assert (< $k@233@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@233@01)))
(assert (<= (- $Perm.Write $k@233@01) $Perm.Write))
(assert (=>
  (< $Perm.No (- $Perm.Write $k@233@01))
  (not (= sys__result@219@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@233@01)))
(check-sat)
; unsat
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [eval] diz.Wand_list_for_list__lemma == 1
; [then-branch: 24 | False | dead]
; [else-branch: 24 | True | live]
(set-option :timeout 0)
(push) ; 3
; [else-branch: 24 | True]
(declare-const $k@234@01 $Perm)
(assert ($Perm.isReadVar $k@234@01))
(assert (< $k@234@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@234@01)))
(assert (<= (- $Perm.Write $k@234@01) $Perm.Write))
(assert (=>
  (< $Perm.No (- $Perm.Write $k@234@01))
  (not (= sys__result@219@01 $Ref.null))))
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@234@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(declare-const $k@235@01 $Perm)
(assert ($Perm.isReadVar $k@235@01))
(assert (< $k@235@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@235@01)))
(assert (<= (- $Perm.Write $k@235@01) $Perm.Write))
(assert (=>
  (< $Perm.No (- $Perm.Write $k@235@01))
  (not (= sys__result@219@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@235@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(declare-const $k@236@01 $Perm)
(assert ($Perm.isReadVar $k@236@01))
(assert (< $k@236@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@236@01)))
(assert (<= (- $Perm.Write $k@236@01) $Perm.Write))
(assert (=>
  (< $Perm.No (- $Perm.Write $k@236@01))
  (not (= sys__result@219@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@236@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [eval] diz.Wand_list_for_list__lemma == 2 ==> diz.Wand_list_for_list__this_2 != null && (diz.Wand_list_for_list__in_1 == diz.Wand_list_for_list__this_2 && (diz.Wand_list_for_list__in_1_0 == diz.Wand_list_for_list__L1_2 ++ diz.Wand_list_for_list__L2_2 && (diz.Wand_list_for_list__out_1 == diz.Wand_list_for_list__this_2 && diz.Wand_list_for_list__out_1_0 == diz.Wand_list_for_list__L1_2 ++ diz.Wand_list_for_list__L2_2)))
; [eval] diz.Wand_list_for_list__lemma == 2
(set-option :timeout 0)
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [then-branch: 25 | True | live]
; [else-branch: 25 | False | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 25 | True]
; [eval] diz.Wand_list_for_list__this_2 != null && (diz.Wand_list_for_list__in_1 == diz.Wand_list_for_list__this_2 && (diz.Wand_list_for_list__in_1_0 == diz.Wand_list_for_list__L1_2 ++ diz.Wand_list_for_list__L2_2 && (diz.Wand_list_for_list__out_1 == diz.Wand_list_for_list__this_2 && diz.Wand_list_for_list__out_1_0 == diz.Wand_list_for_list__L1_2 ++ diz.Wand_list_for_list__L2_2)))
; [eval] diz.Wand_list_for_list__this_2 != null
(push) ; 6
; [then-branch: 26 | this_2@190@01 != Null | live]
; [else-branch: 26 | this_2@190@01 == Null | live]
(push) ; 7
; [then-branch: 26 | this_2@190@01 != Null]
; [eval] diz.Wand_list_for_list__in_1 == diz.Wand_list_for_list__this_2
(push) ; 8
; [then-branch: 27 | in_1@193@01 == this_2@190@01 | live]
; [else-branch: 27 | in_1@193@01 != this_2@190@01 | live]
(push) ; 9
; [then-branch: 27 | in_1@193@01 == this_2@190@01]
; [eval] diz.Wand_list_for_list__in_1_0 == diz.Wand_list_for_list__L1_2 ++ diz.Wand_list_for_list__L2_2
; [eval] diz.Wand_list_for_list__L1_2 ++ diz.Wand_list_for_list__L2_2
(push) ; 10
; [then-branch: 28 | in_1_0@194@01 === L1_2@192@01 ++ L2_2@191@01 | live]
; [else-branch: 28 | !(in_1_0@194@01 === L1_2@192@01 ++ L2_2@191@01) | live]
(push) ; 11
; [then-branch: 28 | in_1_0@194@01 === L1_2@192@01 ++ L2_2@191@01]
; [eval] diz.Wand_list_for_list__out_1 == diz.Wand_list_for_list__this_2
(push) ; 12
; [then-branch: 29 | out_1@195@01 == this_2@190@01 | live]
; [else-branch: 29 | out_1@195@01 != this_2@190@01 | live]
(push) ; 13
; [then-branch: 29 | out_1@195@01 == this_2@190@01]
; [eval] diz.Wand_list_for_list__out_1_0 == diz.Wand_list_for_list__L1_2 ++ diz.Wand_list_for_list__L2_2
; [eval] diz.Wand_list_for_list__L1_2 ++ diz.Wand_list_for_list__L2_2
(pop) ; 13
(push) ; 13
; [else-branch: 29 | out_1@195@01 != this_2@190@01]
(assert (not (= out_1@195@01 this_2@190@01)))
(pop) ; 13
(pop) ; 12
; Joined path conditions
; Joined path conditions
(assert (or (not (= out_1@195@01 this_2@190@01)) (= out_1@195@01 this_2@190@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 28 | !(in_1_0@194@01 === L1_2@192@01 ++ L2_2@191@01)]
(assert (not (Seq_equal in_1_0@194@01 (Seq_append L1_2@192@01 L2_2@191@01))))
(pop) ; 11
(pop) ; 10
; Joined path conditions
(assert (=>
  (Seq_equal in_1_0@194@01 (Seq_append L1_2@192@01 L2_2@191@01))
  (or (not (= out_1@195@01 this_2@190@01)) (= out_1@195@01 this_2@190@01))))
; Joined path conditions
(assert (or
  (not (Seq_equal in_1_0@194@01 (Seq_append L1_2@192@01 L2_2@191@01)))
  (Seq_equal in_1_0@194@01 (Seq_append L1_2@192@01 L2_2@191@01))))
(pop) ; 9
(push) ; 9
; [else-branch: 27 | in_1@193@01 != this_2@190@01]
(assert (not (= in_1@193@01 this_2@190@01)))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (=>
  (= in_1@193@01 this_2@190@01)
  (and
    (=>
      (Seq_equal in_1_0@194@01 (Seq_append L1_2@192@01 L2_2@191@01))
      (or (not (= out_1@195@01 this_2@190@01)) (= out_1@195@01 this_2@190@01)))
    (or
      (not (Seq_equal in_1_0@194@01 (Seq_append L1_2@192@01 L2_2@191@01)))
      (Seq_equal in_1_0@194@01 (Seq_append L1_2@192@01 L2_2@191@01))))))
; Joined path conditions
(assert (or (not (= in_1@193@01 this_2@190@01)) (= in_1@193@01 this_2@190@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 26 | this_2@190@01 == Null]
(assert (= this_2@190@01 $Ref.null))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (not (= this_2@190@01 $Ref.null))
  (and
    (=>
      (= in_1@193@01 this_2@190@01)
      (and
        (=>
          (Seq_equal in_1_0@194@01 (Seq_append L1_2@192@01 L2_2@191@01))
          (or
            (not (= out_1@195@01 this_2@190@01))
            (= out_1@195@01 this_2@190@01)))
        (or
          (not (Seq_equal in_1_0@194@01 (Seq_append L1_2@192@01 L2_2@191@01)))
          (Seq_equal in_1_0@194@01 (Seq_append L1_2@192@01 L2_2@191@01)))))
    (or (not (= in_1@193@01 this_2@190@01)) (= in_1@193@01 this_2@190@01)))))
; Joined path conditions
(assert (or (= this_2@190@01 $Ref.null) (not (= this_2@190@01 $Ref.null))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (and
  (=>
    (not (= this_2@190@01 $Ref.null))
    (and
      (=>
        (= in_1@193@01 this_2@190@01)
        (and
          (=>
            (Seq_equal in_1_0@194@01 (Seq_append L1_2@192@01 L2_2@191@01))
            (or
              (not (= out_1@195@01 this_2@190@01))
              (= out_1@195@01 this_2@190@01)))
          (or
            (not (Seq_equal in_1_0@194@01 (Seq_append L1_2@192@01 L2_2@191@01)))
            (Seq_equal in_1_0@194@01 (Seq_append L1_2@192@01 L2_2@191@01)))))
      (or (not (= in_1@193@01 this_2@190@01)) (= in_1@193@01 this_2@190@01))))
  (or (= this_2@190@01 $Ref.null) (not (= this_2@190@01 $Ref.null)))))
(push) ; 4
(assert (not (and
  (and
    (and
      (and
        (Seq_equal out_1_0@196@01 (Seq_append L1_2@192@01 L2_2@191@01))
        (= out_1@195@01 this_2@190@01))
      (Seq_equal in_1_0@194@01 (Seq_append L1_2@192@01 L2_2@191@01)))
    (= in_1@193@01 this_2@190@01))
  (not (= this_2@190@01 $Ref.null)))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (and
  (and
    (and
      (and
        (Seq_equal out_1_0@196@01 (Seq_append L1_2@192@01 L2_2@191@01))
        (= out_1@195@01 this_2@190@01))
      (Seq_equal in_1_0@194@01 (Seq_append L1_2@192@01 L2_2@191@01)))
    (= in_1@193@01 this_2@190@01))
  (not (= this_2@190@01 $Ref.null))))
; [eval] diz.Wand_list_for_list__lemma <= 2
(assert (Wand_list_for_list__valid_wand%trigger ($Snap.combine
  ($SortWrappers.IntTo$Snap 2)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap in_1@193@01)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.Seq<Int>To$Snap in_1_0@194@01)
          ($Snap.combine
            ($SortWrappers.$RefTo$Snap out_1@195@01)
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                ($SortWrappers.Seq<Int>To$Snap out_1_0@196@01)
                ($Snap.combine
                  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))
                  ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))
                    ($Snap.combine
                      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))
                      ($Snap.combine
                        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))
                        ($Snap.combine
                          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))
                          ($Snap.combine
                            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))))
                            ($Snap.combine
                              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))))))
                              ($Snap.combine
                                ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))))))))
                                ($Snap.combine
                                  $Snap.unit
                                  ($Snap.combine
                                    ($SortWrappers.$RefTo$Snap this_2@190@01)
                                    ($Snap.combine
                                      ($SortWrappers.Seq<Int>To$Snap L2_2@191@01)
                                      ($Snap.combine
                                        ($SortWrappers.Seq<Int>To$Snap L1_2@192@01)
                                        ($Snap.combine $Snap.unit $Snap.unit))))))))))))))))))))) sys__result@219@01))
; [exec]
; __flatten_38 := vwand
; [exec]
; sys__result := __flatten_38
; [exec]
; assert sys__result != null &&
;   (acc(Wand_list_for_list__valid_wand(sys__result), write) &&
;   (Wand_list_for_list__get_in_1(sys__result) == in_1 &&
;   (Wand_list_for_list__get_in_1_0(sys__result) == in_1_0 &&
;   (Wand_list_for_list__get_out_1(sys__result) == out_1 &&
;   Wand_list_for_list__get_out_1_0(sys__result) == out_1_0))))
; [eval] sys__result != null
; [eval] Wand_list_for_list__get_in_1(sys__result) == in_1
; [eval] Wand_list_for_list__get_in_1(sys__result)
(push) ; 4
; [eval] diz != null
(assert (Wand_list_for_list__get_in_1%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.IntTo$Snap 2)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap in_1@193@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.Seq<Int>To$Snap in_1_0@194@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap out_1@195@01)
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  ($SortWrappers.Seq<Int>To$Snap out_1_0@196@01)
                  ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))
                    ($Snap.combine
                      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))
                      ($Snap.combine
                        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))
                        ($Snap.combine
                          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))
                          ($Snap.combine
                            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))
                            ($Snap.combine
                              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))))
                              ($Snap.combine
                                ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))))))
                                ($Snap.combine
                                  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))))))))
                                  ($Snap.combine
                                    $Snap.unit
                                    ($Snap.combine
                                      ($SortWrappers.$RefTo$Snap this_2@190@01)
                                      ($Snap.combine
                                        ($SortWrappers.Seq<Int>To$Snap L2_2@191@01)
                                        ($Snap.combine
                                          ($SortWrappers.Seq<Int>To$Snap L1_2@192@01)
                                          ($Snap.combine $Snap.unit $Snap.unit)))))))))))))))))))))) sys__result@219@01))
(pop) ; 4
; Joined path conditions
(assert (Wand_list_for_list__get_in_1%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.IntTo$Snap 2)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap in_1@193@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.Seq<Int>To$Snap in_1_0@194@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap out_1@195@01)
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  ($SortWrappers.Seq<Int>To$Snap out_1_0@196@01)
                  ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))
                    ($Snap.combine
                      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))
                      ($Snap.combine
                        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))
                        ($Snap.combine
                          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))
                          ($Snap.combine
                            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))
                            ($Snap.combine
                              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))))
                              ($Snap.combine
                                ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))))))
                                ($Snap.combine
                                  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))))))))
                                  ($Snap.combine
                                    $Snap.unit
                                    ($Snap.combine
                                      ($SortWrappers.$RefTo$Snap this_2@190@01)
                                      ($Snap.combine
                                        ($SortWrappers.Seq<Int>To$Snap L2_2@191@01)
                                        ($Snap.combine
                                          ($SortWrappers.Seq<Int>To$Snap L1_2@192@01)
                                          ($Snap.combine $Snap.unit $Snap.unit)))))))))))))))))))))) sys__result@219@01))
(push) ; 4
(assert (not (=
  (Wand_list_for_list__get_in_1 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 2)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap in_1@193@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($SortWrappers.Seq<Int>To$Snap in_1_0@194@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap out_1@195@01)
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    ($SortWrappers.Seq<Int>To$Snap out_1_0@196@01)
                    ($Snap.combine
                      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))
                      ($Snap.combine
                        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))
                        ($Snap.combine
                          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))
                          ($Snap.combine
                            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))
                            ($Snap.combine
                              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))
                              ($Snap.combine
                                ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))))
                                ($Snap.combine
                                  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))))))
                                  ($Snap.combine
                                    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))))))))
                                    ($Snap.combine
                                      $Snap.unit
                                      ($Snap.combine
                                        ($SortWrappers.$RefTo$Snap this_2@190@01)
                                        ($Snap.combine
                                          ($SortWrappers.Seq<Int>To$Snap L2_2@191@01)
                                          ($Snap.combine
                                            ($SortWrappers.Seq<Int>To$Snap L1_2@192@01)
                                            ($Snap.combine $Snap.unit $Snap.unit)))))))))))))))))))))) sys__result@219@01)
  in_1@193@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (=
  (Wand_list_for_list__get_in_1 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 2)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap in_1@193@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($SortWrappers.Seq<Int>To$Snap in_1_0@194@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap out_1@195@01)
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    ($SortWrappers.Seq<Int>To$Snap out_1_0@196@01)
                    ($Snap.combine
                      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))
                      ($Snap.combine
                        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))
                        ($Snap.combine
                          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))
                          ($Snap.combine
                            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))
                            ($Snap.combine
                              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))
                              ($Snap.combine
                                ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))))
                                ($Snap.combine
                                  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))))))
                                  ($Snap.combine
                                    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))))))))
                                    ($Snap.combine
                                      $Snap.unit
                                      ($Snap.combine
                                        ($SortWrappers.$RefTo$Snap this_2@190@01)
                                        ($Snap.combine
                                          ($SortWrappers.Seq<Int>To$Snap L2_2@191@01)
                                          ($Snap.combine
                                            ($SortWrappers.Seq<Int>To$Snap L1_2@192@01)
                                            ($Snap.combine $Snap.unit $Snap.unit)))))))))))))))))))))) sys__result@219@01)
  in_1@193@01))
; [eval] Wand_list_for_list__get_in_1_0(sys__result) == in_1_0
; [eval] Wand_list_for_list__get_in_1_0(sys__result)
(push) ; 4
; [eval] diz != null
(assert (Wand_list_for_list__get_in_1_0%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.IntTo$Snap 2)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap in_1@193@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.Seq<Int>To$Snap in_1_0@194@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap out_1@195@01)
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  ($SortWrappers.Seq<Int>To$Snap out_1_0@196@01)
                  ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))
                    ($Snap.combine
                      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))
                      ($Snap.combine
                        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))
                        ($Snap.combine
                          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))
                          ($Snap.combine
                            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))
                            ($Snap.combine
                              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))))
                              ($Snap.combine
                                ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))))))
                                ($Snap.combine
                                  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))))))))
                                  ($Snap.combine
                                    $Snap.unit
                                    ($Snap.combine
                                      ($SortWrappers.$RefTo$Snap this_2@190@01)
                                      ($Snap.combine
                                        ($SortWrappers.Seq<Int>To$Snap L2_2@191@01)
                                        ($Snap.combine
                                          ($SortWrappers.Seq<Int>To$Snap L1_2@192@01)
                                          ($Snap.combine $Snap.unit $Snap.unit)))))))))))))))))))))) sys__result@219@01))
(pop) ; 4
; Joined path conditions
(assert (Wand_list_for_list__get_in_1_0%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.IntTo$Snap 2)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap in_1@193@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.Seq<Int>To$Snap in_1_0@194@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap out_1@195@01)
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  ($SortWrappers.Seq<Int>To$Snap out_1_0@196@01)
                  ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))
                    ($Snap.combine
                      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))
                      ($Snap.combine
                        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))
                        ($Snap.combine
                          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))
                          ($Snap.combine
                            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))
                            ($Snap.combine
                              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))))
                              ($Snap.combine
                                ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))))))
                                ($Snap.combine
                                  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))))))))
                                  ($Snap.combine
                                    $Snap.unit
                                    ($Snap.combine
                                      ($SortWrappers.$RefTo$Snap this_2@190@01)
                                      ($Snap.combine
                                        ($SortWrappers.Seq<Int>To$Snap L2_2@191@01)
                                        ($Snap.combine
                                          ($SortWrappers.Seq<Int>To$Snap L1_2@192@01)
                                          ($Snap.combine $Snap.unit $Snap.unit)))))))))))))))))))))) sys__result@219@01))
(push) ; 4
(assert (not (Seq_equal
  (Wand_list_for_list__get_in_1_0 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 2)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap in_1@193@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($SortWrappers.Seq<Int>To$Snap in_1_0@194@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap out_1@195@01)
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    ($SortWrappers.Seq<Int>To$Snap out_1_0@196@01)
                    ($Snap.combine
                      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))
                      ($Snap.combine
                        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))
                        ($Snap.combine
                          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))
                          ($Snap.combine
                            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))
                            ($Snap.combine
                              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))
                              ($Snap.combine
                                ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))))
                                ($Snap.combine
                                  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))))))
                                  ($Snap.combine
                                    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))))))))
                                    ($Snap.combine
                                      $Snap.unit
                                      ($Snap.combine
                                        ($SortWrappers.$RefTo$Snap this_2@190@01)
                                        ($Snap.combine
                                          ($SortWrappers.Seq<Int>To$Snap L2_2@191@01)
                                          ($Snap.combine
                                            ($SortWrappers.Seq<Int>To$Snap L1_2@192@01)
                                            ($Snap.combine $Snap.unit $Snap.unit)))))))))))))))))))))) sys__result@219@01)
  in_1_0@194@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (Seq_equal
  (Wand_list_for_list__get_in_1_0 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 2)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap in_1@193@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($SortWrappers.Seq<Int>To$Snap in_1_0@194@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap out_1@195@01)
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    ($SortWrappers.Seq<Int>To$Snap out_1_0@196@01)
                    ($Snap.combine
                      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))
                      ($Snap.combine
                        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))
                        ($Snap.combine
                          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))
                          ($Snap.combine
                            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))
                            ($Snap.combine
                              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))
                              ($Snap.combine
                                ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))))
                                ($Snap.combine
                                  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))))))
                                  ($Snap.combine
                                    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))))))))
                                    ($Snap.combine
                                      $Snap.unit
                                      ($Snap.combine
                                        ($SortWrappers.$RefTo$Snap this_2@190@01)
                                        ($Snap.combine
                                          ($SortWrappers.Seq<Int>To$Snap L2_2@191@01)
                                          ($Snap.combine
                                            ($SortWrappers.Seq<Int>To$Snap L1_2@192@01)
                                            ($Snap.combine $Snap.unit $Snap.unit)))))))))))))))))))))) sys__result@219@01)
  in_1_0@194@01))
; [eval] Wand_list_for_list__get_out_1(sys__result) == out_1
; [eval] Wand_list_for_list__get_out_1(sys__result)
(push) ; 4
; [eval] diz != null
(assert (Wand_list_for_list__get_out_1%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.IntTo$Snap 2)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap in_1@193@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.Seq<Int>To$Snap in_1_0@194@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap out_1@195@01)
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  ($SortWrappers.Seq<Int>To$Snap out_1_0@196@01)
                  ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))
                    ($Snap.combine
                      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))
                      ($Snap.combine
                        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))
                        ($Snap.combine
                          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))
                          ($Snap.combine
                            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))
                            ($Snap.combine
                              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))))
                              ($Snap.combine
                                ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))))))
                                ($Snap.combine
                                  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))))))))
                                  ($Snap.combine
                                    $Snap.unit
                                    ($Snap.combine
                                      ($SortWrappers.$RefTo$Snap this_2@190@01)
                                      ($Snap.combine
                                        ($SortWrappers.Seq<Int>To$Snap L2_2@191@01)
                                        ($Snap.combine
                                          ($SortWrappers.Seq<Int>To$Snap L1_2@192@01)
                                          ($Snap.combine $Snap.unit $Snap.unit)))))))))))))))))))))) sys__result@219@01))
(pop) ; 4
; Joined path conditions
(assert (Wand_list_for_list__get_out_1%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.IntTo$Snap 2)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap in_1@193@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.Seq<Int>To$Snap in_1_0@194@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap out_1@195@01)
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  ($SortWrappers.Seq<Int>To$Snap out_1_0@196@01)
                  ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))
                    ($Snap.combine
                      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))
                      ($Snap.combine
                        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))
                        ($Snap.combine
                          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))
                          ($Snap.combine
                            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))
                            ($Snap.combine
                              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))))
                              ($Snap.combine
                                ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))))))
                                ($Snap.combine
                                  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))))))))
                                  ($Snap.combine
                                    $Snap.unit
                                    ($Snap.combine
                                      ($SortWrappers.$RefTo$Snap this_2@190@01)
                                      ($Snap.combine
                                        ($SortWrappers.Seq<Int>To$Snap L2_2@191@01)
                                        ($Snap.combine
                                          ($SortWrappers.Seq<Int>To$Snap L1_2@192@01)
                                          ($Snap.combine $Snap.unit $Snap.unit)))))))))))))))))))))) sys__result@219@01))
(push) ; 4
(assert (not (=
  (Wand_list_for_list__get_out_1 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 2)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap in_1@193@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($SortWrappers.Seq<Int>To$Snap in_1_0@194@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap out_1@195@01)
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    ($SortWrappers.Seq<Int>To$Snap out_1_0@196@01)
                    ($Snap.combine
                      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))
                      ($Snap.combine
                        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))
                        ($Snap.combine
                          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))
                          ($Snap.combine
                            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))
                            ($Snap.combine
                              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))
                              ($Snap.combine
                                ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))))
                                ($Snap.combine
                                  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))))))
                                  ($Snap.combine
                                    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))))))))
                                    ($Snap.combine
                                      $Snap.unit
                                      ($Snap.combine
                                        ($SortWrappers.$RefTo$Snap this_2@190@01)
                                        ($Snap.combine
                                          ($SortWrappers.Seq<Int>To$Snap L2_2@191@01)
                                          ($Snap.combine
                                            ($SortWrappers.Seq<Int>To$Snap L1_2@192@01)
                                            ($Snap.combine $Snap.unit $Snap.unit)))))))))))))))))))))) sys__result@219@01)
  out_1@195@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (=
  (Wand_list_for_list__get_out_1 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 2)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap in_1@193@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($SortWrappers.Seq<Int>To$Snap in_1_0@194@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap out_1@195@01)
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    ($SortWrappers.Seq<Int>To$Snap out_1_0@196@01)
                    ($Snap.combine
                      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))
                      ($Snap.combine
                        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))
                        ($Snap.combine
                          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))
                          ($Snap.combine
                            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))
                            ($Snap.combine
                              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))
                              ($Snap.combine
                                ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))))
                                ($Snap.combine
                                  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))))))
                                  ($Snap.combine
                                    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))))))))
                                    ($Snap.combine
                                      $Snap.unit
                                      ($Snap.combine
                                        ($SortWrappers.$RefTo$Snap this_2@190@01)
                                        ($Snap.combine
                                          ($SortWrappers.Seq<Int>To$Snap L2_2@191@01)
                                          ($Snap.combine
                                            ($SortWrappers.Seq<Int>To$Snap L1_2@192@01)
                                            ($Snap.combine $Snap.unit $Snap.unit)))))))))))))))))))))) sys__result@219@01)
  out_1@195@01))
; [eval] Wand_list_for_list__get_out_1_0(sys__result) == out_1_0
; [eval] Wand_list_for_list__get_out_1_0(sys__result)
(push) ; 4
; [eval] diz != null
(assert (Wand_list_for_list__get_out_1_0%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.IntTo$Snap 2)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap in_1@193@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.Seq<Int>To$Snap in_1_0@194@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap out_1@195@01)
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  ($SortWrappers.Seq<Int>To$Snap out_1_0@196@01)
                  ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))
                    ($Snap.combine
                      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))
                      ($Snap.combine
                        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))
                        ($Snap.combine
                          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))
                          ($Snap.combine
                            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))
                            ($Snap.combine
                              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))))
                              ($Snap.combine
                                ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))))))
                                ($Snap.combine
                                  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))))))))
                                  ($Snap.combine
                                    $Snap.unit
                                    ($Snap.combine
                                      ($SortWrappers.$RefTo$Snap this_2@190@01)
                                      ($Snap.combine
                                        ($SortWrappers.Seq<Int>To$Snap L2_2@191@01)
                                        ($Snap.combine
                                          ($SortWrappers.Seq<Int>To$Snap L1_2@192@01)
                                          ($Snap.combine $Snap.unit $Snap.unit)))))))))))))))))))))) sys__result@219@01))
(pop) ; 4
; Joined path conditions
(assert (Wand_list_for_list__get_out_1_0%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.IntTo$Snap 2)
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap in_1@193@01)
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            ($SortWrappers.Seq<Int>To$Snap in_1_0@194@01)
            ($Snap.combine
              ($SortWrappers.$RefTo$Snap out_1@195@01)
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  ($SortWrappers.Seq<Int>To$Snap out_1_0@196@01)
                  ($Snap.combine
                    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))
                    ($Snap.combine
                      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))
                      ($Snap.combine
                        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))
                        ($Snap.combine
                          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))
                          ($Snap.combine
                            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))
                            ($Snap.combine
                              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))))
                              ($Snap.combine
                                ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))))))
                                ($Snap.combine
                                  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))))))))
                                  ($Snap.combine
                                    $Snap.unit
                                    ($Snap.combine
                                      ($SortWrappers.$RefTo$Snap this_2@190@01)
                                      ($Snap.combine
                                        ($SortWrappers.Seq<Int>To$Snap L2_2@191@01)
                                        ($Snap.combine
                                          ($SortWrappers.Seq<Int>To$Snap L1_2@192@01)
                                          ($Snap.combine $Snap.unit $Snap.unit)))))))))))))))))))))) sys__result@219@01))
(push) ; 4
(assert (not (Seq_equal
  (Wand_list_for_list__get_out_1_0 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 2)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap in_1@193@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($SortWrappers.Seq<Int>To$Snap in_1_0@194@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap out_1@195@01)
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    ($SortWrappers.Seq<Int>To$Snap out_1_0@196@01)
                    ($Snap.combine
                      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))
                      ($Snap.combine
                        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))
                        ($Snap.combine
                          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))
                          ($Snap.combine
                            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))
                            ($Snap.combine
                              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))
                              ($Snap.combine
                                ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))))
                                ($Snap.combine
                                  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))))))
                                  ($Snap.combine
                                    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))))))))
                                    ($Snap.combine
                                      $Snap.unit
                                      ($Snap.combine
                                        ($SortWrappers.$RefTo$Snap this_2@190@01)
                                        ($Snap.combine
                                          ($SortWrappers.Seq<Int>To$Snap L2_2@191@01)
                                          ($Snap.combine
                                            ($SortWrappers.Seq<Int>To$Snap L1_2@192@01)
                                            ($Snap.combine $Snap.unit $Snap.unit)))))))))))))))))))))) sys__result@219@01)
  out_1_0@196@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (Seq_equal
  (Wand_list_for_list__get_out_1_0 ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.IntTo$Snap 2)
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$RefTo$Snap in_1@193@01)
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              ($SortWrappers.Seq<Int>To$Snap in_1_0@194@01)
              ($Snap.combine
                ($SortWrappers.$RefTo$Snap out_1@195@01)
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    ($SortWrappers.Seq<Int>To$Snap out_1_0@196@01)
                    ($Snap.combine
                      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))
                      ($Snap.combine
                        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))
                        ($Snap.combine
                          ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))
                          ($Snap.combine
                            ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))
                            ($Snap.combine
                              ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))
                              ($Snap.combine
                                ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))))
                                ($Snap.combine
                                  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))))))
                                  ($Snap.combine
                                    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@220@01))))))))))))))))))))))))))
                                    ($Snap.combine
                                      $Snap.unit
                                      ($Snap.combine
                                        ($SortWrappers.$RefTo$Snap this_2@190@01)
                                        ($Snap.combine
                                          ($SortWrappers.Seq<Int>To$Snap L2_2@191@01)
                                          ($Snap.combine
                                            ($SortWrappers.Seq<Int>To$Snap L1_2@192@01)
                                            ($Snap.combine $Snap.unit $Snap.unit)))))))))))))))))))))) sys__result@219@01)
  out_1_0@196@01))
; [exec]
; inhale false
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- List__append_iter ----------
(declare-const diz@237@01 $Ref)
(declare-const current_thread_id@238@01 Int)
(declare-const l@239@01 $Ref)
(declare-const L1@240@01 Seq<Int>)
(declare-const L2@241@01 Seq<Int>)
(declare-const diz@242@01 $Ref)
(declare-const current_thread_id@243@01 Int)
(declare-const l@244@01 $Ref)
(declare-const L1@245@01 Seq<Int>)
(declare-const L2@246@01 Seq<Int>)
(push) ; 1
(declare-const $t@247@01 $Snap)
(assert (= $t@247@01 ($Snap.combine ($Snap.first $t@247@01) ($Snap.second $t@247@01))))
(assert (= ($Snap.first $t@247@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@242@01 $Ref.null)))
(assert (=
  ($Snap.second $t@247@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@247@01))
    ($Snap.second ($Snap.second $t@247@01)))))
(assert (= ($Snap.first ($Snap.second $t@247@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@243@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@247@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@247@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@247@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@247@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@247@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@247@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@247@01))))
  $Snap.unit))
; [eval] List__contents(diz) == L1
; [eval] List__contents(diz)
(push) ; 2
; [eval] diz != null
(assert (List__contents%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second $t@247@01)))) diz@242@01))
(pop) ; 2
; Joined path conditions
(assert (List__contents%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second $t@247@01)))) diz@242@01))
(assert (Seq_equal
  (List__contents ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second $t@247@01)))) diz@242@01)
  L1@245@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@247@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@247@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@247@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@247@01)))))
  $Snap.unit))
; [eval] l != null
(assert (not (= l@244@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@247@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@247@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@247@01)))))))))
(push) ; 2
(set-option :timeout 10)
(assert (not (= diz@242@01 l@244@01)))
(check-sat)
; unknown
(pop) ; 2
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@247@01))))))
  $Snap.unit))
; [eval] List__contents(l) == L2
; [eval] List__contents(l)
(set-option :timeout 0)
(push) ; 2
; [eval] diz != null
(assert (List__contents%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@247@01))))))) l@244@01))
(pop) ; 2
; Joined path conditions
(assert (List__contents%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@247@01))))))) l@244@01))
(assert (Seq_equal
  (List__contents ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@247@01))))))) l@244@01)
  L2@246@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@248@01 $Snap)
(assert (= $t@248@01 ($Snap.combine ($Snap.first $t@248@01) ($Snap.second $t@248@01))))
(assert (= ($Snap.second $t@248@01) $Snap.unit))
; [eval] List__contents(diz) == L1 ++ L2
; [eval] List__contents(diz)
(push) ; 3
; [eval] diz != null
(assert (List__contents%precondition ($Snap.combine $Snap.unit ($Snap.first $t@248@01)) diz@242@01))
(pop) ; 3
; Joined path conditions
(assert (List__contents%precondition ($Snap.combine $Snap.unit ($Snap.first $t@248@01)) diz@242@01))
; [eval] L1 ++ L2
(assert (Seq_equal
  (List__contents ($Snap.combine $Snap.unit ($Snap.first $t@248@01)) diz@242@01)
  (Seq_append L1@245@01 L2@246@01)))
(pop) ; 2
(push) ; 2
; [exec]
; var cursor: Ref
(declare-const cursor@249@01 $Ref)
; [exec]
; var prefix: Seq[Int]
(declare-const prefix@250@01 Seq<Int>)
; [exec]
; var suffix: Seq[Int]
(declare-const suffix@251@01 Seq<Int>)
; [exec]
; var __flatten_39: Seq[Int]
(declare-const __flatten_39@252@01 Seq<Int>)
; [exec]
; var vwand: Ref
(declare-const vwand@253@01 $Ref)
; [exec]
; var __flatten_40: Seq[Int]
(declare-const __flatten_40@254@01 Seq<Int>)
; [exec]
; var __flatten_41: Ref
(declare-const __flatten_41@255@01 $Ref)
; [exec]
; var __flatten_42: Ref
(declare-const __flatten_42@256@01 $Ref)
; [exec]
; var __flatten_81: Seq[Int]
(declare-const __flatten_81@257@01 Seq<Int>)
; [exec]
; var __flatten_82: Seq[Int]
(declare-const __flatten_82@258@01 Seq<Int>)
; [exec]
; var __flatten_84: Ref
(declare-const __flatten_84@259@01 $Ref)
; [exec]
; var tmp: Ref
(declare-const tmp@260@01 $Ref)
; [exec]
; var tmp_suffix: Seq[Int]
(declare-const tmp_suffix@261@01 Seq<Int>)
; [exec]
; cursor := diz
; [exec]
; prefix := Seq[Int]()
; [eval] Seq[Int]()
; [exec]
; __flatten_81 := List__contents(cursor)
; [eval] List__contents(cursor)
(push) ; 3
; [eval] diz != null
(pop) ; 3
; Joined path conditions
(declare-const __flatten_81@262@01 Seq<Int>)
(assert (Seq_equal
  __flatten_81@262@01
  (List__contents ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second $t@247@01)))) diz@242@01)))
; [exec]
; __flatten_39 := __flatten_81
; [exec]
; suffix := __flatten_39
; [exec]
; vwand := List__Wand_list_for_list_lemma_2(diz, current_thread_id, diz, L2, L1,
;   diz, L1 ++ L2, diz, L1 ++ L2)
; [eval] L1 ++ L2
; [eval] L1 ++ L2
; [eval] diz != null
; [eval] current_thread_id >= 0
; [eval] this_2 != null
; [eval] in_1 != null
; [eval] in_1 == this_2
; [eval] in_1_0 == L1_2 ++ L2_2
; [eval] L1_2 ++ L2_2
; [eval] out_1 != null
; [eval] out_1 == this_2
; [eval] out_1_0 == L1_2 ++ L2_2
; [eval] L1_2 ++ L2_2
(declare-const sys__result@263@01 $Ref)
(declare-const $t@264@01 $Snap)
(assert (= $t@264@01 ($Snap.combine ($Snap.first $t@264@01) ($Snap.second $t@264@01))))
(assert (= ($Snap.first $t@264@01) $Snap.unit))
; [eval] sys__result != null
(assert (not (= sys__result@263@01 $Ref.null)))
(assert (=
  ($Snap.second $t@264@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@264@01))
    ($Snap.second ($Snap.second $t@264@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@264@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@264@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@264@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@264@01))) $Snap.unit))
; [eval] Wand_list_for_list__get_in_1(sys__result) == in_1
; [eval] Wand_list_for_list__get_in_1(sys__result)
(push) ; 3
; [eval] diz != null
(assert (Wand_list_for_list__get_in_1%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second $t@264@01))) sys__result@263@01))
(pop) ; 3
; Joined path conditions
(assert (Wand_list_for_list__get_in_1%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second $t@264@01))) sys__result@263@01))
(assert (=
  (Wand_list_for_list__get_in_1 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second $t@264@01))) sys__result@263@01)
  diz@242@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@264@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@264@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@264@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@264@01))))
  $Snap.unit))
; [eval] Wand_list_for_list__get_in_1_0(sys__result) == in_1_0
; [eval] Wand_list_for_list__get_in_1_0(sys__result)
(push) ; 3
; [eval] diz != null
(assert (Wand_list_for_list__get_in_1_0%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second $t@264@01))) sys__result@263@01))
(pop) ; 3
; Joined path conditions
(assert (Wand_list_for_list__get_in_1_0%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second $t@264@01))) sys__result@263@01))
(assert (Seq_equal
  (Wand_list_for_list__get_in_1_0 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second $t@264@01))) sys__result@263@01)
  (Seq_append L1@245@01 L2@246@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@264@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@264@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@264@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@264@01)))))
  $Snap.unit))
; [eval] Wand_list_for_list__get_out_1(sys__result) == out_1
; [eval] Wand_list_for_list__get_out_1(sys__result)
(push) ; 3
; [eval] diz != null
(assert (Wand_list_for_list__get_out_1%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second $t@264@01))) sys__result@263@01))
(pop) ; 3
; Joined path conditions
(assert (Wand_list_for_list__get_out_1%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second $t@264@01))) sys__result@263@01))
(assert (=
  (Wand_list_for_list__get_out_1 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second $t@264@01))) sys__result@263@01)
  diz@242@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@264@01)))))
  $Snap.unit))
; [eval] Wand_list_for_list__get_out_1_0(sys__result) == out_1_0
; [eval] Wand_list_for_list__get_out_1_0(sys__result)
(push) ; 3
; [eval] diz != null
(assert (Wand_list_for_list__get_out_1_0%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second $t@264@01))) sys__result@263@01))
(pop) ; 3
; Joined path conditions
(assert (Wand_list_for_list__get_out_1_0%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second $t@264@01))) sys__result@263@01))
(assert (Seq_equal
  (Wand_list_for_list__get_out_1_0 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second $t@264@01))) sys__result@263@01)
  (Seq_append L1@245@01 L2@246@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(declare-const tmp@265@01 $Ref)
(declare-const tmp_suffix@266@01 Seq<Int>)
(declare-const prefix@267@01 Seq<Int>)
(declare-const __flatten_82@268@01 Seq<Int>)
(declare-const __flatten_40@269@01 Seq<Int>)
(declare-const suffix@270@01 Seq<Int>)
(declare-const cursor@271@01 $Ref)
(declare-const __flatten_41@272@01 $Ref)
(declare-const vwand@273@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; Loop head block: Check well-definedness of invariant
(declare-const $t@274@01 $Snap)
(assert (= $t@274@01 ($Snap.combine ($Snap.first $t@274@01) ($Snap.second $t@274@01))))
(assert (= ($Snap.first $t@274@01) $Snap.unit))
; [eval] cursor != null
(assert (not (= cursor@271@01 $Ref.null)))
(assert (=
  ($Snap.second $t@274@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@274@01))
    ($Snap.second ($Snap.second $t@274@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@274@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@274@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@274@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@274@01))) $Snap.unit))
; [eval] suffix == List__contents(cursor)
; [eval] List__contents(cursor)
(push) ; 4
; [eval] diz != null
(assert (List__contents%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second $t@274@01))) cursor@271@01))
(pop) ; 4
; Joined path conditions
(assert (List__contents%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second $t@274@01))) cursor@271@01))
(assert (Seq_equal
  suffix@270@01
  (List__contents ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second $t@274@01))) cursor@271@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@274@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@274@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@274@01))))
  $Snap.unit))
; [eval] prefix ++ suffix == L1
; [eval] prefix ++ suffix
(assert (Seq_equal (Seq_append prefix@267@01 suffix@270@01) L1@245@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01)))))
  $Snap.unit))
; [eval] l != null
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01)))))))))
(push) ; 4
(set-option :timeout 10)
(assert (not (= cursor@271@01 l@244@01)))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01)))))))
  $Snap.unit))
; [eval] List__contents(l) == L2
; [eval] List__contents(l)
(set-option :timeout 0)
(push) ; 4
; [eval] diz != null
(assert (List__contents%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01))))))) l@244@01))
(pop) ; 4
; Joined path conditions
(assert (List__contents%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01))))))) l@244@01))
(assert (Seq_equal
  (List__contents ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01))))))) l@244@01)
  L2@246@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01)))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01))))))))
  $Snap.unit))
; [eval] vwand != null
(assert (not (= vwand@273@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01))))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01)))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01)))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01))))))))))
  $Snap.unit))
; [eval] Wand_list_for_list__get_in_1(vwand) == cursor
; [eval] Wand_list_for_list__get_in_1(vwand)
(push) ; 4
; [eval] diz != null
(assert (Wand_list_for_list__get_in_1%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01)))))))))) vwand@273@01))
(pop) ; 4
; Joined path conditions
(assert (Wand_list_for_list__get_in_1%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01)))))))))) vwand@273@01))
(assert (=
  (Wand_list_for_list__get_in_1 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01)))))))))) vwand@273@01)
  cursor@271@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01)))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01)))))))))))
  $Snap.unit))
; [eval] Wand_list_for_list__get_in_1_0(vwand) == suffix ++ L2
; [eval] Wand_list_for_list__get_in_1_0(vwand)
(push) ; 4
; [eval] diz != null
(assert (Wand_list_for_list__get_in_1_0%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01)))))))))) vwand@273@01))
(pop) ; 4
; Joined path conditions
(assert (Wand_list_for_list__get_in_1_0%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01)))))))))) vwand@273@01))
; [eval] suffix ++ L2
(assert (Seq_equal
  (Wand_list_for_list__get_in_1_0 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01)))))))))) vwand@273@01)
  (Seq_append suffix@270@01 L2@246@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01)))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01)))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01))))))))))))
  $Snap.unit))
; [eval] Wand_list_for_list__get_out_1(vwand) == diz
; [eval] Wand_list_for_list__get_out_1(vwand)
(push) ; 4
; [eval] diz != null
(assert (Wand_list_for_list__get_out_1%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01)))))))))) vwand@273@01))
(pop) ; 4
; Joined path conditions
(assert (Wand_list_for_list__get_out_1%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01)))))))))) vwand@273@01))
(assert (=
  (Wand_list_for_list__get_out_1 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01)))))))))) vwand@273@01)
  diz@242@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01))))))))))))
  $Snap.unit))
; [eval] Wand_list_for_list__get_out_1_0(vwand) == L1 ++ L2
; [eval] Wand_list_for_list__get_out_1_0(vwand)
(push) ; 4
; [eval] diz != null
(assert (Wand_list_for_list__get_out_1_0%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01)))))))))) vwand@273@01))
(pop) ; 4
; Joined path conditions
(assert (Wand_list_for_list__get_out_1_0%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01)))))))))) vwand@273@01))
; [eval] L1 ++ L2
(assert (Seq_equal
  (Wand_list_for_list__get_out_1_0 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01)))))))))) vwand@273@01)
  (Seq_append L1@245@01 L2@246@01)))
; Loop head block: Check well-definedness of edge conditions
(push) ; 4
; [eval] List__get_next(cursor) != null
; [eval] List__get_next(cursor)
(push) ; 5
; [eval] diz != null
(assert (List__get_next%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second $t@274@01))) cursor@271@01))
(pop) ; 5
; Joined path conditions
(assert (List__get_next%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second $t@274@01))) cursor@271@01))
(pop) ; 4
(push) ; 4
; [eval] !(List__get_next(cursor) != null)
; [eval] List__get_next(cursor) != null
; [eval] List__get_next(cursor)
(push) ; 5
; [eval] diz != null
(assert (List__get_next%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second $t@274@01))) cursor@271@01))
(pop) ; 5
; Joined path conditions
(assert (List__get_next%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second $t@274@01))) cursor@271@01))
(pop) ; 4
(pop) ; 3
(push) ; 3
; Loop head block: Establish invariant
; [eval] cursor != null
; [eval] suffix == List__contents(cursor)
; [eval] List__contents(cursor)
(push) ; 4
; [eval] diz != null
(pop) ; 4
; Joined path conditions
; [eval] prefix ++ suffix == L1
; [eval] prefix ++ suffix
(push) ; 4
(assert (not (Seq_equal (Seq_append (as Seq_empty  Seq<Int>) __flatten_81@262@01) L1@245@01)))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (Seq_equal (Seq_append (as Seq_empty  Seq<Int>) __flatten_81@262@01) L1@245@01))
; [eval] l != null
; [eval] List__contents(l) == L2
; [eval] List__contents(l)
(push) ; 4
; [eval] diz != null
(pop) ; 4
; Joined path conditions
; [eval] vwand != null
; [eval] Wand_list_for_list__get_in_1(vwand) == cursor
; [eval] Wand_list_for_list__get_in_1(vwand)
(push) ; 4
; [eval] diz != null
(pop) ; 4
; Joined path conditions
; [eval] Wand_list_for_list__get_in_1_0(vwand) == suffix ++ L2
; [eval] Wand_list_for_list__get_in_1_0(vwand)
(push) ; 4
; [eval] diz != null
(pop) ; 4
; Joined path conditions
; [eval] suffix ++ L2
(push) ; 4
(assert (not (Seq_equal
  (Wand_list_for_list__get_in_1_0 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second $t@264@01))) sys__result@263@01)
  (Seq_append __flatten_81@262@01 L2@246@01))))
(check-sat)
; unsat
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (Seq_equal
  (Wand_list_for_list__get_in_1_0 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second $t@264@01))) sys__result@263@01)
  (Seq_append __flatten_81@262@01 L2@246@01)))
; [eval] Wand_list_for_list__get_out_1(vwand) == diz
; [eval] Wand_list_for_list__get_out_1(vwand)
(push) ; 4
; [eval] diz != null
(pop) ; 4
; Joined path conditions
; [eval] Wand_list_for_list__get_out_1_0(vwand) == L1 ++ L2
; [eval] Wand_list_for_list__get_out_1_0(vwand)
(push) ; 4
; [eval] diz != null
(pop) ; 4
; Joined path conditions
; [eval] L1 ++ L2
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 4
(assert (= $t@274@01 ($Snap.combine ($Snap.first $t@274@01) ($Snap.second $t@274@01))))
(assert (= ($Snap.first $t@274@01) $Snap.unit))
(assert (not (= cursor@271@01 $Ref.null)))
(assert (=
  ($Snap.second $t@274@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@274@01))
    ($Snap.second ($Snap.second $t@274@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@274@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@274@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@274@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@274@01))) $Snap.unit))
(assert (List__contents%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second $t@274@01))) cursor@271@01))
(assert (Seq_equal
  suffix@270@01
  (List__contents ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second $t@274@01))) cursor@271@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@274@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@274@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@274@01))))
  $Snap.unit))
(assert (Seq_equal (Seq_append prefix@267@01 suffix@270@01) L1@245@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01)))))
  $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01)))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01)))))))
  $Snap.unit))
(assert (List__contents%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01))))))) l@244@01))
(assert (Seq_equal
  (List__contents ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01))))))) l@244@01)
  L2@246@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01)))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01))))))))
  $Snap.unit))
(assert (not (= vwand@273@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01))))))))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01)))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01)))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01))))))))))
  $Snap.unit))
(assert (Wand_list_for_list__get_in_1%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01)))))))))) vwand@273@01))
(assert (=
  (Wand_list_for_list__get_in_1 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01)))))))))) vwand@273@01)
  cursor@271@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01)))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01)))))))))))
  $Snap.unit))
(assert (Wand_list_for_list__get_in_1_0%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01)))))))))) vwand@273@01))
(assert (Seq_equal
  (Wand_list_for_list__get_in_1_0 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01)))))))))) vwand@273@01)
  (Seq_append suffix@270@01 L2@246@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01)))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01)))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01))))))))))))
  $Snap.unit))
(assert (Wand_list_for_list__get_out_1%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01)))))))))) vwand@273@01))
(assert (=
  (Wand_list_for_list__get_out_1 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01)))))))))) vwand@273@01)
  diz@242@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01))))))))))))
  $Snap.unit))
(assert (Wand_list_for_list__get_out_1_0%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01)))))))))) vwand@273@01))
(assert (Seq_equal
  (Wand_list_for_list__get_out_1_0 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01)))))))))) vwand@273@01)
  (Seq_append L1@245@01 L2@246@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 10)
(check-sat)
; unknown
; Loop head block: Follow loop-internal edges
; [eval] List__get_next(cursor) != null
; [eval] List__get_next(cursor)
(set-option :timeout 0)
(push) ; 5
; [eval] diz != null
(assert (List__get_next%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second $t@274@01))) cursor@271@01))
(pop) ; 5
; Joined path conditions
(assert (List__get_next%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second $t@274@01))) cursor@271@01))
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  (List__get_next ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second $t@274@01))) cursor@271@01)
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    (List__get_next ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second $t@274@01))) cursor@271@01)
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [then-branch: 30 | List__get_next((_, First:(Second:($t@274@01))), cursor@271@01) != Null | live]
; [else-branch: 30 | List__get_next((_, First:(Second:($t@274@01))), cursor@271@01) == Null | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 30 | List__get_next((_, First:(Second:($t@274@01))), cursor@271@01) != Null]
(assert (not
  (=
    (List__get_next ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second $t@274@01))) cursor@271@01)
    $Ref.null)))
; [exec]
; tmp := cursor
; [exec]
; tmp_suffix := suffix
; [exec]
; unfold acc(List__state(cursor), write)
(assert (=
  ($Snap.first ($Snap.second $t@274@01))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second $t@274@01)))
    ($Snap.second ($Snap.first ($Snap.second $t@274@01))))))
(assert (=
  ($Snap.second ($Snap.first ($Snap.second $t@274@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@274@01))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@274@01)))))))
; [eval] diz.List__next != null
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@274@01)))))
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@274@01)))))
    $Ref.null))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [then-branch: 31 | First:(Second:(First:(Second:($t@274@01)))) != Null | live]
; [else-branch: 31 | First:(Second:(First:(Second:($t@274@01)))) == Null | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 31 | First:(Second:(First:(Second:($t@274@01)))) != Null]
(assert (not
  (=
    ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@274@01)))))
    $Ref.null)))
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  l@244@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@274@01))))))))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (List__state%trigger ($Snap.first ($Snap.second $t@274@01)) cursor@271@01))
; [exec]
; prefix := prefix ++ Seq(cursor.List__val)
; [eval] prefix ++ Seq(cursor.List__val)
; [eval] Seq(cursor.List__val)
(assert (=
  (Seq_length
    (Seq_singleton ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second $t@274@01))))))
  1))
(declare-const prefix@275@01 Seq<Int>)
(assert (Seq_equal
  prefix@275@01
  (Seq_append
    prefix@267@01
    (Seq_singleton ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second $t@274@01))))))))
; [exec]
; __flatten_82 := List__contents(cursor.List__next)
; [eval] List__contents(cursor.List__next)
(set-option :timeout 0)
(push) ; 7
; [eval] diz != null
(assert (List__contents%precondition ($Snap.combine
  $Snap.unit
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@274@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@274@01)))))))
(pop) ; 7
; Joined path conditions
(assert (List__contents%precondition ($Snap.combine
  $Snap.unit
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@274@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@274@01)))))))
(declare-const __flatten_82@276@01 Seq<Int>)
(assert (Seq_equal
  __flatten_82@276@01
  (List__contents ($Snap.combine
    $Snap.unit
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@274@01))))) ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@274@01))))))))
; [exec]
; __flatten_40 := __flatten_82
; [exec]
; suffix := __flatten_40
; [exec]
; cursor := cursor.List__next
(declare-const cursor@277@01 $Ref)
(assert (=
  cursor@277@01
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@274@01)))))))
; [exec]
; __flatten_41 := List__Wand_list_for_list_lemma_1(diz, current_thread_id, diz,
;   L2, tmp_suffix, L1, tmp, suffix, cursor, vwand, cursor, suffix ++ L2, diz,
;   L1 ++ L2)
; [eval] suffix ++ L2
; [eval] L1 ++ L2
; [eval] diz != null
; [eval] current_thread_id >= 0
; [eval] this_1 != null
; [eval] tmp_1.List__next == cursor_1
(push) ; 7
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@274@01)))))
  cursor@277@01)))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@274@01)))))
  cursor@277@01))
; [eval] tmp_suffix_1 == Seq(tmp_1.List__val) ++ suffix_1
; [eval] Seq(tmp_1.List__val) ++ suffix_1
; [eval] Seq(tmp_1.List__val)
(push) ; 7
(assert (not (Seq_equal
  suffix@270@01
  (Seq_append
    (Seq_singleton ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second $t@274@01)))))
    __flatten_82@276@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (Seq_equal
  suffix@270@01
  (Seq_append
    (Seq_singleton ($SortWrappers.$SnapToInt ($Snap.first ($Snap.first ($Snap.second $t@274@01)))))
    __flatten_82@276@01)))
; [eval] wand_1 != null
; [eval] Wand_list_for_list__get_in_1(wand_1) == tmp_1
; [eval] Wand_list_for_list__get_in_1(wand_1)
(push) ; 7
; [eval] diz != null
(pop) ; 7
; Joined path conditions
; [eval] Wand_list_for_list__get_in_1_0(wand_1) == tmp_suffix_1 ++ L2_1
; [eval] Wand_list_for_list__get_in_1_0(wand_1)
(push) ; 7
; [eval] diz != null
(pop) ; 7
; Joined path conditions
; [eval] tmp_suffix_1 ++ L2_1
; [eval] Wand_list_for_list__get_out_1(wand_1) == this_1
; [eval] Wand_list_for_list__get_out_1(wand_1)
(push) ; 7
; [eval] diz != null
(pop) ; 7
; Joined path conditions
; [eval] Wand_list_for_list__get_out_1_0(wand_1) == L1_1 ++ L2_1
; [eval] Wand_list_for_list__get_out_1_0(wand_1)
(push) ; 7
; [eval] diz != null
(pop) ; 7
; Joined path conditions
; [eval] L1_1 ++ L2_1
; [eval] in_1 != null
(push) ; 7
(assert (not (not (= cursor@277@01 $Ref.null))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (not (= cursor@277@01 $Ref.null)))
; [eval] in_1 == cursor_1
; [eval] in_1_0 == suffix_1 ++ L2_1
; [eval] suffix_1 ++ L2_1
; [eval] out_1 != null
; [eval] out_1 == this_1
; [eval] out_1_0 == L1_1 ++ L2_1
; [eval] L1_1 ++ L2_1
(declare-const sys__result@278@01 $Ref)
(declare-const $t@279@01 $Snap)
(assert (= $t@279@01 ($Snap.combine ($Snap.first $t@279@01) ($Snap.second $t@279@01))))
(assert (= ($Snap.first $t@279@01) $Snap.unit))
; [eval] sys__result != null
(assert (not (= sys__result@278@01 $Ref.null)))
(assert (=
  ($Snap.second $t@279@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@279@01))
    ($Snap.second ($Snap.second $t@279@01)))))
(assert (=
  ($Snap.second ($Snap.second $t@279@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@279@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@279@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@279@01))) $Snap.unit))
; [eval] Wand_list_for_list__get_in_1(sys__result) == in_1
; [eval] Wand_list_for_list__get_in_1(sys__result)
(push) ; 7
; [eval] diz != null
(assert (Wand_list_for_list__get_in_1%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second $t@279@01))) sys__result@278@01))
(pop) ; 7
; Joined path conditions
(assert (Wand_list_for_list__get_in_1%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second $t@279@01))) sys__result@278@01))
(assert (=
  (Wand_list_for_list__get_in_1 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second $t@279@01))) sys__result@278@01)
  cursor@277@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@279@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@279@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@279@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@279@01))))
  $Snap.unit))
; [eval] Wand_list_for_list__get_in_1_0(sys__result) == in_1_0
; [eval] Wand_list_for_list__get_in_1_0(sys__result)
(push) ; 7
; [eval] diz != null
(assert (Wand_list_for_list__get_in_1_0%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second $t@279@01))) sys__result@278@01))
(pop) ; 7
; Joined path conditions
(assert (Wand_list_for_list__get_in_1_0%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second $t@279@01))) sys__result@278@01))
(assert (Seq_equal
  (Wand_list_for_list__get_in_1_0 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second $t@279@01))) sys__result@278@01)
  (Seq_append __flatten_82@276@01 L2@246@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@279@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@279@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@279@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@279@01)))))
  $Snap.unit))
; [eval] Wand_list_for_list__get_out_1(sys__result) == out_1
; [eval] Wand_list_for_list__get_out_1(sys__result)
(push) ; 7
; [eval] diz != null
(assert (Wand_list_for_list__get_out_1%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second $t@279@01))) sys__result@278@01))
(pop) ; 7
; Joined path conditions
(assert (Wand_list_for_list__get_out_1%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second $t@279@01))) sys__result@278@01))
(assert (=
  (Wand_list_for_list__get_out_1 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second $t@279@01))) sys__result@278@01)
  diz@242@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@279@01)))))
  $Snap.unit))
; [eval] Wand_list_for_list__get_out_1_0(sys__result) == out_1_0
; [eval] Wand_list_for_list__get_out_1_0(sys__result)
(push) ; 7
; [eval] diz != null
(assert (Wand_list_for_list__get_out_1_0%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second $t@279@01))) sys__result@278@01))
(pop) ; 7
; Joined path conditions
(assert (Wand_list_for_list__get_out_1_0%precondition ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second $t@279@01))) sys__result@278@01))
(assert (Seq_equal
  (Wand_list_for_list__get_out_1_0 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second $t@279@01))) sys__result@278@01)
  (Seq_append L1@245@01 L2@246@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; vwand := __flatten_41
; Loop head block: Re-establish invariant
; [eval] cursor != null
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= l@244@01 cursor@277@01)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [eval] suffix == List__contents(cursor)
; [eval] List__contents(cursor)
(set-option :timeout 0)
(push) ; 7
; [eval] diz != null
(push) ; 8
(set-option :timeout 10)
(assert (not (= l@244@01 cursor@277@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.01s
; (get-info :all-statistics)
(assert (List__contents%precondition ($Snap.combine
  $Snap.unit
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@274@01))))) cursor@277@01))
(pop) ; 7
; Joined path conditions
(assert (List__contents%precondition ($Snap.combine
  $Snap.unit
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@274@01))))) cursor@277@01))
(set-option :timeout 0)
(push) ; 7
(assert (not (Seq_equal
  __flatten_82@276@01
  (List__contents ($Snap.combine
    $Snap.unit
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@274@01))))) cursor@277@01))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (Seq_equal
  __flatten_82@276@01
  (List__contents ($Snap.combine
    $Snap.unit
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@274@01))))) cursor@277@01)))
; [eval] prefix ++ suffix == L1
; [eval] prefix ++ suffix
(push) ; 7
(assert (not (Seq_equal (Seq_append prefix@275@01 __flatten_82@276@01) L1@245@01)))
(check-sat)
; unsat
(pop) ; 7
; 0.02s
; (get-info :all-statistics)
(assert (Seq_equal (Seq_append prefix@275@01 __flatten_82@276@01) L1@245@01))
; [eval] l != null
; [eval] List__contents(l) == L2
; [eval] List__contents(l)
(push) ; 7
; [eval] diz != null
(pop) ; 7
; Joined path conditions
; [eval] vwand != null
; [eval] Wand_list_for_list__get_in_1(vwand) == cursor
; [eval] Wand_list_for_list__get_in_1(vwand)
(push) ; 7
; [eval] diz != null
(pop) ; 7
; Joined path conditions
; [eval] Wand_list_for_list__get_in_1_0(vwand) == suffix ++ L2
; [eval] Wand_list_for_list__get_in_1_0(vwand)
(push) ; 7
; [eval] diz != null
(pop) ; 7
; Joined path conditions
; [eval] suffix ++ L2
; [eval] Wand_list_for_list__get_out_1(vwand) == diz
; [eval] Wand_list_for_list__get_out_1(vwand)
(push) ; 7
; [eval] diz != null
(pop) ; 7
; Joined path conditions
; [eval] Wand_list_for_list__get_out_1_0(vwand) == L1 ++ L2
; [eval] Wand_list_for_list__get_out_1_0(vwand)
(push) ; 7
; [eval] diz != null
(pop) ; 7
; Joined path conditions
; [eval] L1 ++ L2
(pop) ; 6
(pop) ; 5
(push) ; 5
; [else-branch: 30 | List__get_next((_, First:(Second:($t@274@01))), cursor@271@01) == Null]
(assert (=
  (List__get_next ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second $t@274@01))) cursor@271@01)
  $Ref.null))
(pop) ; 5
; [eval] !(List__get_next(cursor) != null)
; [eval] List__get_next(cursor) != null
; [eval] List__get_next(cursor)
(push) ; 5
; [eval] diz != null
(pop) ; 5
; Joined path conditions
(push) ; 5
(set-option :timeout 10)
(assert (not (not
  (=
    (List__get_next ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second $t@274@01))) cursor@271@01)
    $Ref.null))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  (List__get_next ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second $t@274@01))) cursor@271@01)
  $Ref.null)))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [then-branch: 32 | List__get_next((_, First:(Second:($t@274@01))), cursor@271@01) == Null | live]
; [else-branch: 32 | List__get_next((_, First:(Second:($t@274@01))), cursor@271@01) != Null | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 32 | List__get_next((_, First:(Second:($t@274@01))), cursor@271@01) == Null]
(assert (=
  (List__get_next ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second $t@274@01))) cursor@271@01)
  $Ref.null))
; [exec]
; unfold acc(List__state(cursor), write)
(assert (=
  ($Snap.first ($Snap.second $t@274@01))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second $t@274@01)))
    ($Snap.second ($Snap.first ($Snap.second $t@274@01))))))
(assert (=
  ($Snap.second ($Snap.first ($Snap.second $t@274@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@274@01))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@274@01)))))))
; [eval] diz.List__next != null
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@274@01)))))
  $Ref.null)))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [then-branch: 33 | First:(Second:(First:(Second:($t@274@01)))) != Null | dead]
; [else-branch: 33 | First:(Second:(First:(Second:($t@274@01)))) == Null | live]
(set-option :timeout 0)
(push) ; 6
; [else-branch: 33 | First:(Second:(First:(Second:($t@274@01)))) == Null]
(assert (=
  ($SortWrappers.$SnapTo$Ref ($Snap.first ($Snap.second ($Snap.first ($Snap.second $t@274@01)))))
  $Ref.null))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second $t@274@01))))
  $Snap.unit))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (List__state%trigger ($Snap.first ($Snap.second $t@274@01)) cursor@271@01))
; [exec]
; __flatten_42 := l
; [exec]
; __flatten_84 := __flatten_42
; [exec]
; cursor.List__next := __flatten_84
; [exec]
; fold acc(List__state(cursor), write)
; [eval] diz.List__next != null
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= l@244@01 $Ref.null)))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [then-branch: 34 | l@244@01 != Null | live]
; [else-branch: 34 | l@244@01 == Null | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 34 | l@244@01 != Null]
(assert (List__state%trigger ($Snap.combine
  ($Snap.first ($Snap.first ($Snap.second $t@274@01)))
  ($Snap.combine
    ($SortWrappers.$RefTo$Snap l@244@01)
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01)))))))) cursor@271@01))
; [exec]
; Wand_list_for_list___apply(vwand, current_thread_id)
; [eval] diz != null
; [eval] current_thread_id >= 0
; [eval] Wand_list_for_list__get_in_1(diz)
(push) ; 8
; [eval] diz != null
(pop) ; 8
; Joined path conditions
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  cursor@271@01
  (Wand_list_for_list__get_in_1 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01)))))))))) vwand@273@01))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [eval] List__contents(Wand_list_for_list__get_in_1(diz)) == Wand_list_for_list__get_in_1_0(diz)
; [eval] List__contents(Wand_list_for_list__get_in_1(diz))
; [eval] Wand_list_for_list__get_in_1(diz)
(set-option :timeout 0)
(push) ; 8
; [eval] diz != null
(pop) ; 8
; Joined path conditions
(push) ; 8
; [eval] diz != null
(push) ; 9
(assert (not (not
  (=
    (Wand_list_for_list__get_in_1 ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01)))))))))) vwand@273@01)
    $Ref.null))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (not
  (=
    (Wand_list_for_list__get_in_1 ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01)))))))))) vwand@273@01)
    $Ref.null)))
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  cursor@271@01
  (Wand_list_for_list__get_in_1 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01)))))))))) vwand@273@01))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(assert (List__contents%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second $t@274@01)))
    ($Snap.combine
      ($SortWrappers.$RefTo$Snap l@244@01)
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01))))))))) (Wand_list_for_list__get_in_1 ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01)))))))))) vwand@273@01)))
(pop) ; 8
; Joined path conditions
(assert (and
  (not
    (=
      (Wand_list_for_list__get_in_1 ($Snap.combine
        $Snap.unit
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01)))))))))) vwand@273@01)
      $Ref.null))
  (List__contents%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second $t@274@01)))
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@244@01)
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01))))))))) (Wand_list_for_list__get_in_1 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01)))))))))) vwand@273@01))))
; [eval] Wand_list_for_list__get_in_1_0(diz)
(set-option :timeout 0)
(push) ; 8
; [eval] diz != null
(pop) ; 8
; Joined path conditions
(push) ; 8
(assert (not (Seq_equal
  (List__contents ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second $t@274@01)))
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@244@01)
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01))))))))) (Wand_list_for_list__get_in_1 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01)))))))))) vwand@273@01))
  (Wand_list_for_list__get_in_1_0 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01)))))))))) vwand@273@01))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (Seq_equal
  (List__contents ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second $t@274@01)))
      ($Snap.combine
        ($SortWrappers.$RefTo$Snap l@244@01)
        ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01))))))))) (Wand_list_for_list__get_in_1 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01)))))))))) vwand@273@01))
  (Wand_list_for_list__get_in_1_0 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01)))))))))) vwand@273@01)))
; [eval] Wand_list_for_list__get_out_1(diz) != null
; [eval] Wand_list_for_list__get_out_1(diz)
(push) ; 8
; [eval] diz != null
(pop) ; 8
; Joined path conditions
(push) ; 8
(assert (not (not
  (=
    (Wand_list_for_list__get_out_1 ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01)))))))))) vwand@273@01)
    $Ref.null))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (not
  (=
    (Wand_list_for_list__get_out_1 ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01)))))))))) vwand@273@01)
    $Ref.null)))
(declare-const $t@280@01 $Snap)
(assert (= $t@280@01 ($Snap.combine ($Snap.first $t@280@01) ($Snap.second $t@280@01))))
; [eval] old(Wand_list_for_list__get_out_1(diz))
; [eval] Wand_list_for_list__get_out_1(diz)
(push) ; 8
; [eval] diz != null
(pop) ; 8
; Joined path conditions
(assert (= ($Snap.second $t@280@01) $Snap.unit))
; [eval] List__contents(old(Wand_list_for_list__get_out_1(diz))) == old(Wand_list_for_list__get_out_1_0(diz))
; [eval] List__contents(old(Wand_list_for_list__get_out_1(diz)))
; [eval] old(Wand_list_for_list__get_out_1(diz))
; [eval] Wand_list_for_list__get_out_1(diz)
(push) ; 8
; [eval] diz != null
(pop) ; 8
; Joined path conditions
(push) ; 8
; [eval] diz != null
(assert (List__contents%precondition ($Snap.combine $Snap.unit ($Snap.first $t@280@01)) (Wand_list_for_list__get_out_1 ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01)))))))))) vwand@273@01)))
(pop) ; 8
; Joined path conditions
(assert (List__contents%precondition ($Snap.combine $Snap.unit ($Snap.first $t@280@01)) (Wand_list_for_list__get_out_1 ($Snap.combine
  $Snap.unit
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01)))))))))) vwand@273@01)))
; [eval] old(Wand_list_for_list__get_out_1_0(diz))
; [eval] Wand_list_for_list__get_out_1_0(diz)
(push) ; 8
; [eval] diz != null
(pop) ; 8
; Joined path conditions
(assert (Seq_equal
  (List__contents ($Snap.combine $Snap.unit ($Snap.first $t@280@01)) (Wand_list_for_list__get_out_1 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01)))))))))) vwand@273@01))
  (Wand_list_for_list__get_out_1_0 ($Snap.combine
    $Snap.unit
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@274@01)))))))))) vwand@273@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] List__contents(diz) == L1 ++ L2
; [eval] List__contents(diz)
(set-option :timeout 0)
(push) ; 8
; [eval] diz != null
(assert (List__contents%precondition ($Snap.combine $Snap.unit ($Snap.first $t@280@01)) diz@242@01))
(pop) ; 8
; Joined path conditions
(assert (List__contents%precondition ($Snap.combine $Snap.unit ($Snap.first $t@280@01)) diz@242@01))
; [eval] L1 ++ L2
(push) ; 8
(assert (not (Seq_equal
  (List__contents ($Snap.combine $Snap.unit ($Snap.first $t@280@01)) diz@242@01)
  (Seq_append L1@245@01 L2@246@01))))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (Seq_equal
  (List__contents ($Snap.combine $Snap.unit ($Snap.first $t@280@01)) diz@242@01)
  (Seq_append L1@245@01 L2@246@01)))
(pop) ; 7
(pop) ; 6
(pop) ; 5
(push) ; 5
; [else-branch: 32 | List__get_next((_, First:(Second:($t@274@01))), cursor@271@01) != Null]
(assert (not
  (=
    (List__get_next ($Snap.combine
      $Snap.unit
      ($Snap.first ($Snap.second $t@274@01))) cursor@271@01)
    $Ref.null)))
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
