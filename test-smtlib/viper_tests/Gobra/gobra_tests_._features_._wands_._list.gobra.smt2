(get-info :version)
; (:version "4.12.1")
; Started: 2023-10-31 14:09:52
; Silicon.version: 1.1-SNAPSHOT (46944a65@dspil_symbenchmarking)
; Input file: /home/pcorrect/repos/benchmarking_general/silicon_tests/gobra_tests_._features_._wands_._list.gobra.vpr
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
(declare-sort Equality<ShStruct2<Ref~_Ref>> 0)
(declare-sort ShStruct2<Ref~_Ref> 0)
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
(declare-fun $SortWrappers.Equality<ShStruct2<Ref~_Ref>>To$Snap (Equality<ShStruct2<Ref~_Ref>>) $Snap)
(declare-fun $SortWrappers.$SnapToEquality<ShStruct2<Ref~_Ref>> ($Snap) Equality<ShStruct2<Ref~_Ref>>)
(assert (forall ((x Equality<ShStruct2<Ref~_Ref>>)) (!
    (= x ($SortWrappers.$SnapToEquality<ShStruct2<Ref~_Ref>>($SortWrappers.Equality<ShStruct2<Ref~_Ref>>To$Snap x)))
    :pattern (($SortWrappers.Equality<ShStruct2<Ref~_Ref>>To$Snap x))
    :qid |$Snap.$SnapToEquality<ShStruct2<Ref~_Ref>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Equality<ShStruct2<Ref~_Ref>>To$Snap($SortWrappers.$SnapToEquality<ShStruct2<Ref~_Ref>> x)))
    :pattern (($SortWrappers.$SnapToEquality<ShStruct2<Ref~_Ref>> x))
    :qid |$Snap.Equality<ShStruct2<Ref~_Ref>>To$SnapToEquality<ShStruct2<Ref~_Ref>>|
    )))
(declare-fun $SortWrappers.ShStruct2<Ref~_Ref>To$Snap (ShStruct2<Ref~_Ref>) $Snap)
(declare-fun $SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap) ShStruct2<Ref~_Ref>)
(assert (forall ((x ShStruct2<Ref~_Ref>)) (!
    (= x ($SortWrappers.$SnapToShStruct2<Ref~_Ref>($SortWrappers.ShStruct2<Ref~_Ref>To$Snap x)))
    :pattern (($SortWrappers.ShStruct2<Ref~_Ref>To$Snap x))
    :qid |$Snap.$SnapToShStruct2<Ref~_Ref>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.ShStruct2<Ref~_Ref>To$Snap($SortWrappers.$SnapToShStruct2<Ref~_Ref> x)))
    :pattern (($SortWrappers.$SnapToShStruct2<Ref~_Ref> x))
    :qid |$Snap.ShStruct2<Ref~_Ref>To$SnapToShStruct2<Ref~_Ref>|
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
(declare-fun eq<Bool> (ShStruct2<Ref~_Ref> ShStruct2<Ref~_Ref>) Bool)
(declare-fun ShStructget0of2<Ref> (ShStruct2<Ref~_Ref>) $Ref)
(declare-fun ShStructget1of2<Ref> (ShStruct2<Ref~_Ref>) $Ref)
(declare-fun ShStructrev0of2<ShStruct2<Ref~_Ref>> ($Ref) ShStruct2<Ref~_Ref>)
(declare-fun ShStructrev1of2<ShStruct2<Ref~_Ref>> ($Ref) ShStruct2<Ref~_Ref>)
; Declaring symbols related to program functions (from program analysis)
(declare-fun shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ ($Snap) ShStruct2<Ref~_Ref>)
(declare-fun shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$%limited ($Snap) ShStruct2<Ref~_Ref>)
(declare-const shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$%stateless Bool)
(declare-fun shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$%precondition ($Snap) Bool)
(declare-fun elems_ec9c2e19_F ($Snap ShStruct2<Ref~_Ref>) Seq<Int>)
(declare-fun elems_ec9c2e19_F%limited ($Snap ShStruct2<Ref~_Ref>) Seq<Int>)
(declare-fun elems_ec9c2e19_F%stateless (ShStruct2<Ref~_Ref>) Bool)
(declare-fun elems_ec9c2e19_F%precondition ($Snap ShStruct2<Ref~_Ref>) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun Mem_ec9c2e19_PMList%trigger ($Snap ShStruct2<Ref~_Ref>) Bool)
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
(assert (forall ((l ShStruct2<Ref~_Ref>) (r ShStruct2<Ref~_Ref>)) (!
  (= (eq<Bool> l r) (= l r))
  :pattern ((eq<Bool> l r))
  )))
(assert (forall ((x ShStruct2<Ref~_Ref>)) (!
  (= (ShStructrev0of2<ShStruct2<Ref~_Ref>> (ShStructget0of2<Ref> x)) x)
  :pattern ((ShStructget0of2<Ref> x))
  )))
(assert (forall ((x ShStruct2<Ref~_Ref>)) (!
  (= (ShStructrev1of2<ShStruct2<Ref~_Ref>> (ShStructget1of2<Ref> x)) x)
  :pattern ((ShStructget1of2<Ref> x))
  )))
(assert (forall ((x ShStruct2<Ref~_Ref>) (y ShStruct2<Ref~_Ref>)) (!
  (=
    (eq<Bool> x y)
    (and
      (= (ShStructget0of2<Ref> x) (ShStructget0of2<Ref> y))
      (= (ShStructget1of2<Ref> x) (ShStructget1of2<Ref> y))))
  :pattern ((eq<Bool> x y))
  )))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
(declare-fun joined_unfolding@4@00 ($Snap ShStruct2<Ref~_Ref>) Seq<Int>)
(assert (forall ((s@$ $Snap)) (!
  (=
    (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$%limited s@$)
    (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ s@$))
  :pattern ((shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ s@$))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap)) (!
  (as shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$%stateless  Bool)
  :pattern ((shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$%limited s@$))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap)) (!
  (let ((result@0@00 (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$%limited s@$))) (=>
    (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$%precondition s@$)
    (and
      (= (ShStructget0of2<Ref> result@0@00) $Ref.null)
      (= (ShStructget1of2<Ref> result@0@00) $Ref.null))))
  :pattern ((shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$%limited s@$))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap)) (!
  (let ((result@0@00 (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$%limited s@$))) true)
  :pattern ((shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$%limited s@$))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (start_V0@1@00 ShStruct2<Ref~_Ref>)) (!
  (Seq_equal
    (elems_ec9c2e19_F%limited s@$ start_V0@1@00)
    (elems_ec9c2e19_F s@$ start_V0@1@00))
  :pattern ((elems_ec9c2e19_F s@$ start_V0@1@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (start_V0@1@00 ShStruct2<Ref~_Ref>)) (!
  (elems_ec9c2e19_F%stateless start_V0@1@00)
  :pattern ((elems_ec9c2e19_F%limited s@$ start_V0@1@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (start_V0@1@00 ShStruct2<Ref~_Ref>)) (!
  (=>
    (elems_ec9c2e19_F%precondition s@$ start_V0@1@00)
    (Seq_equal
      (elems_ec9c2e19_F s@$ start_V0@1@00)
      (ite
        (=
          ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second s@$)))
          (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
        (Seq_singleton ($SortWrappers.$SnapToInt ($Snap.first s@$)))
        (Seq_append
          (Seq_singleton ($SortWrappers.$SnapToInt ($Snap.first s@$)))
          (elems_ec9c2e19_F%limited ($Snap.second ($Snap.second s@$)) ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second s@$))))))))
  :pattern ((elems_ec9c2e19_F s@$ start_V0@1@00))
  :pattern ((elems_ec9c2e19_F%stateless start_V0@1@00) (Mem_ec9c2e19_PMList%trigger s@$ start_V0@1@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (start_V0@1@00 ShStruct2<Ref~_Ref>)) (!
  (=>
    (elems_ec9c2e19_F%precondition s@$ start_V0@1@00)
    (and
      (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$%precondition $Snap.unit)
      (ite
        (=
          ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second s@$)))
          (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
        true
        (elems_ec9c2e19_F%precondition ($Snap.second ($Snap.second s@$)) ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second s@$)))))))
  :pattern ((elems_ec9c2e19_F s@$ start_V0@1@00))
  :qid |quant-u-7|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- $IMPORTS_ec9c2e19_ec9c2e19 ----------
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
; label returnLabel
(pop) ; 2
(pop) ; 1
; ---------- $INIT_ec9c2e19_b50c5f21 ----------
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
; label returnLabel
(pop) ; 2
(pop) ; 1
; ---------- Append_ec9c2e19_PMList ----------
(declare-const l1_V0@0@01 ShStruct2<Ref~_Ref>)
(declare-const l2_V0@1@01 ShStruct2<Ref~_Ref>)
(declare-const l1_V0@2@01 ShStruct2<Ref~_Ref>)
(declare-const l2_V0@3@01 ShStruct2<Ref~_Ref>)
(push) ; 1
(declare-const $t@4@01 $Snap)
(assert (= $t@4@01 ($Snap.combine ($Snap.first $t@4@01) ($Snap.second $t@4@01))))
(assert (=
  ($Snap.second $t@4@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@4@01))
    ($Snap.second ($Snap.second $t@4@01)))))
(push) ; 2
(set-option :timeout 10)
(assert (not (= l1_V0@2@01 l2_V0@3@01)))
(check-sat)
; unknown
(pop) ; 2
; 0.00s
; (get-info :all-statistics)
(assert (= ($Snap.second ($Snap.second $t@4@01)) $Snap.unit))
; [eval] !(l2_V0 == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$())
; [eval] l2_V0 == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 2
(assert (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$%precondition $Snap.unit))
(pop) ; 2
; Joined path conditions
(assert (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$%precondition $Snap.unit))
(assert (not
  (=
    l2_V0@3@01
    (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@5@01 $Snap)
(assert (= $t@5@01 ($Snap.combine ($Snap.first $t@5@01) ($Snap.second $t@5@01))))
(assert (= ($Snap.second $t@5@01) $Snap.unit))
; [eval] elems_ec9c2e19_F(l1_V0) == old(elems_ec9c2e19_F(l1_V0) ++ elems_ec9c2e19_F(l2_V0))
; [eval] elems_ec9c2e19_F(l1_V0)
(push) ; 3
(assert (elems_ec9c2e19_F%precondition ($Snap.first $t@5@01) l1_V0@2@01))
(pop) ; 3
; Joined path conditions
(assert (elems_ec9c2e19_F%precondition ($Snap.first $t@5@01) l1_V0@2@01))
; [eval] old(elems_ec9c2e19_F(l1_V0) ++ elems_ec9c2e19_F(l2_V0))
; [eval] elems_ec9c2e19_F(l1_V0) ++ elems_ec9c2e19_F(l2_V0)
; [eval] elems_ec9c2e19_F(l1_V0)
(push) ; 3
(assert (elems_ec9c2e19_F%precondition ($Snap.first $t@4@01) l1_V0@2@01))
(pop) ; 3
; Joined path conditions
(assert (elems_ec9c2e19_F%precondition ($Snap.first $t@4@01) l1_V0@2@01))
; [eval] elems_ec9c2e19_F(l2_V0)
(push) ; 3
(assert (elems_ec9c2e19_F%precondition ($Snap.first ($Snap.second $t@4@01)) l2_V0@3@01))
(pop) ; 3
; Joined path conditions
(assert (elems_ec9c2e19_F%precondition ($Snap.first ($Snap.second $t@4@01)) l2_V0@3@01))
(assert (Seq_equal
  (elems_ec9c2e19_F ($Snap.first $t@5@01) l1_V0@2@01)
  (Seq_append
    (elems_ec9c2e19_F ($Snap.first $t@4@01) l1_V0@2@01)
    (elems_ec9c2e19_F ($Snap.first ($Snap.second $t@4@01)) l2_V0@3@01))))
(pop) ; 2
(push) ; 2
; [exec]
; var l2_V0_CN1: ShStruct2[Ref, Ref]
(declare-const l2_V0_CN1@6@01 ShStruct2<Ref~_Ref>)
; [exec]
; var l1_V0_CN0: ShStruct2[Ref, Ref]
(declare-const l1_V0_CN0@7@01 ShStruct2<Ref~_Ref>)
; [exec]
; inhale l1_V0_CN0 ==
;   shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()
(declare-const $t@8@01 $Snap)
(assert (= $t@8@01 $Snap.unit))
; [eval] l1_V0_CN0 == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()
(push) ; 3
(pop) ; 3
; Joined path conditions
(assert (=
  l1_V0_CN0@7@01
  (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale l2_V0_CN1 ==
;   shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()
(declare-const $t@9@01 $Snap)
(assert (= $t@9@01 $Snap.unit))
; [eval] l2_V0_CN1 == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(assert (=
  l2_V0_CN1@6@01
  (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; l1_V0_CN0 := l1_V0
; [exec]
; l2_V0_CN1 := l2_V0
; [exec]
; unfold acc(Mem_ec9c2e19_PMList(l1_V0_CN0), write)
(assert (=
  ($Snap.first $t@4@01)
  ($Snap.combine
    ($Snap.first ($Snap.first $t@4@01))
    ($Snap.second ($Snap.first $t@4@01)))))
; [eval] (ShStructget0of2(start_V0): Ref)
(assert (not (= (ShStructget0of2<Ref> l1_V0@2@01) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.first $t@4@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@4@01)))
    ($Snap.second ($Snap.second ($Snap.first $t@4@01))))))
; [eval] (ShStructget1of2(start_V0): Ref)
(assert (not (= (ShStructget1of2<Ref> l1_V0@2@01) $Ref.null)))
; [eval] !((ShStructget1of2(start_V0): Ref).PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget1of2(start_V0): Ref).PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget1of2(start_V0): Ref)
; [eval] shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 3
(pop) ; 3
; Joined path conditions
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.first $t@4@01))))
  (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
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
    ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.first $t@4@01))))
    (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unknown
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [then-branch: 0 | First:(Second:(First:($t@4@01))) != shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 0 | First:(Second:(First:($t@4@01))) == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$(_) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 0 | First:(Second:(First:($t@4@01))) != shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (not
  (=
    ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.first $t@4@01))))
    (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
; [eval] (ShStructget1of2(start_V0): Ref)
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  l2_V0@3@01
  ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.first $t@4@01)))))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (Mem_ec9c2e19_PMList%trigger ($Snap.first $t@4@01) l1_V0@2@01))
; [eval] (ShStructget1of2(l1_V0_CN0): Ref).PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget1of2(l1_V0_CN0): Ref)
; [eval] shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 4
(pop) ; 4
; Joined path conditions
; [then-branch: 1 | First:(Second:(First:($t@4@01))) == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 1 | First:(Second:(First:($t@4@01))) != shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 4
; [else-branch: 1 | First:(Second:(First:($t@4@01))) != shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$(_)]
(pop) ; 4
; [eval] !((ShStructget1of2(l1_V0_CN0): Ref).PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget1of2(l1_V0_CN0): Ref).PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget1of2(l1_V0_CN0): Ref)
; [eval] shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()
(push) ; 4
(pop) ; 4
; Joined path conditions
(push) ; 4
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.first $t@4@01))))
  (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [then-branch: 2 | First:(Second:(First:($t@4@01))) != shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 2 | First:(Second:(First:($t@4@01))) == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 2 | First:(Second:(First:($t@4@01))) != shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$(_)]
; [exec]
; var index_V1: Int
(declare-const index_V1@10@01 Int)
; [exec]
; var tmp_V1: ShStruct2[Ref, Ref]
(declare-const tmp_V1@11@01 ShStruct2<Ref~_Ref>)
; [exec]
; inhale tmp_V1 ==
;   shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()
(declare-const $t@12@01 $Snap)
(assert (= $t@12@01 $Snap.unit))
; [eval] tmp_V1 == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()
(push) ; 5
(pop) ; 5
; Joined path conditions
(assert (=
  tmp_V1@11@01
  (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; tmp_V1 := (ShStructget1of2(l1_V0_CN0): Ref).PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$$_E_$$$
; [eval] (ShStructget1of2(l1_V0_CN0): Ref)
(declare-const tmp_V1@13@01 ShStruct2<Ref~_Ref>)
(assert (=
  tmp_V1@13@01
  ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.first $t@4@01))))))
; [exec]
; inhale index_V1 == 0
(declare-const $t@14@01 $Snap)
(assert (= $t@14@01 $Snap.unit))
; [eval] index_V1 == 0
(assert (= index_V1@10@01 0))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; index_V1 := 1
; [exec]
; assert acc(Mem_ec9c2e19_PMList(tmp_V1), write)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.first $t@4@01))))
  tmp_V1@13@01)))
(check-sat)
; unsat
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [exec]
; package acc(Mem_ec9c2e19_PMList(tmp_V1), write) --*
; acc(Mem_ec9c2e19_PMList(l1_V0_CN0), write) &&
; elems_ec9c2e19_F(l1_V0_CN0) ==
; old(elems_ec9c2e19_F(l1_V0_CN0)[..index_V1] ++
; old[lhs](elems_ec9c2e19_F(tmp_V1))) {
;   fold acc(Mem_ec9c2e19_PMList(l1_V0_CN0), write)
; }
(set-option :timeout 0)
(push) ; 5
(declare-const $t@15@01 $Snap)
; [exec]
; fold acc(Mem_ec9c2e19_PMList(l1_V0_CN0), write)
; [eval] (ShStructget0of2(start_V0): Ref)
(push) ; 6
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(check-sat)
; unknown
; [eval] (ShStructget1of2(start_V0): Ref)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(check-sat)
; unknown
; [eval] !((ShStructget1of2(start_V0): Ref).PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget1of2(start_V0): Ref).PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget1of2(start_V0): Ref)
; [eval] shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 6
(pop) ; 6
; Joined path conditions
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.first $t@4@01))))
  (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
; [then-branch: 3 | First:(Second:(First:($t@4@01))) != shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 3 | First:(Second:(First:($t@4@01))) == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 3 | First:(Second:(First:($t@4@01))) != shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] (ShStructget1of2(start_V0): Ref)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(assert (Mem_ec9c2e19_PMList%trigger ($Snap.combine
  ($Snap.first ($Snap.first $t@4@01))
  ($Snap.combine ($Snap.first ($Snap.second ($Snap.first $t@4@01))) $t@15@01)) l1_V0@2@01))
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(check-sat)
; unknown
; [eval] elems_ec9c2e19_F(l1_V0_CN0) == old(elems_ec9c2e19_F(l1_V0_CN0)[..index_V1] ++ old[lhs](elems_ec9c2e19_F(tmp_V1)))
; [eval] elems_ec9c2e19_F(l1_V0_CN0)
(set-option :timeout 0)
(push) ; 7
(assert (elems_ec9c2e19_F%precondition ($Snap.combine
  ($Snap.first ($Snap.first $t@4@01))
  ($Snap.combine ($Snap.first ($Snap.second ($Snap.first $t@4@01))) $t@15@01)) l1_V0@2@01))
(pop) ; 7
; Joined path conditions
(assert (elems_ec9c2e19_F%precondition ($Snap.combine
  ($Snap.first ($Snap.first $t@4@01))
  ($Snap.combine ($Snap.first ($Snap.second ($Snap.first $t@4@01))) $t@15@01)) l1_V0@2@01))
; [eval] old(elems_ec9c2e19_F(l1_V0_CN0)[..index_V1] ++ old[lhs](elems_ec9c2e19_F(tmp_V1)))
; [eval] elems_ec9c2e19_F(l1_V0_CN0)[..index_V1] ++ old[lhs](elems_ec9c2e19_F(tmp_V1))
; [eval] elems_ec9c2e19_F(l1_V0_CN0)[..index_V1]
; [eval] elems_ec9c2e19_F(l1_V0_CN0)
(push) ; 7
(assert (elems_ec9c2e19_F%precondition ($Snap.first $t@4@01) l1_V0@2@01))
(pop) ; 7
; Joined path conditions
(assert (elems_ec9c2e19_F%precondition ($Snap.first $t@4@01) l1_V0@2@01))
; [eval] old[lhs](elems_ec9c2e19_F(tmp_V1))
; [eval] elems_ec9c2e19_F(tmp_V1)
(push) ; 7
(assert (elems_ec9c2e19_F%precondition $t@15@01 tmp_V1@13@01))
(pop) ; 7
; Joined path conditions
(assert (elems_ec9c2e19_F%precondition $t@15@01 tmp_V1@13@01))
(push) ; 7
(assert (not (Seq_equal
  (elems_ec9c2e19_F ($Snap.combine
    ($Snap.first ($Snap.first $t@4@01))
    ($Snap.combine ($Snap.first ($Snap.second ($Snap.first $t@4@01))) $t@15@01)) l1_V0@2@01)
  (Seq_append
    (Seq_take (elems_ec9c2e19_F ($Snap.first $t@4@01) l1_V0@2@01) 1)
    (elems_ec9c2e19_F $t@15@01 tmp_V1@13@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (Seq_equal
  (elems_ec9c2e19_F ($Snap.combine
    ($Snap.first ($Snap.first $t@4@01))
    ($Snap.combine ($Snap.first ($Snap.second ($Snap.first $t@4@01))) $t@15@01)) l1_V0@2@01)
  (Seq_append
    (Seq_take (elems_ec9c2e19_F ($Snap.first $t@4@01) l1_V0@2@01) 1)
    (elems_ec9c2e19_F $t@15@01 tmp_V1@13@01))))
(pop) ; 6
(pop) ; 5
(push) ; 5
(declare-const prev_V2@16@01 ShStruct2<Ref~_Ref>)
(declare-const tmp_V1@17@01 ShStruct2<Ref~_Ref>)
(declare-const index_V1@18@01 Int)
(push) ; 6
; Loop head block: Check well-definedness of invariant
(declare-const $t@19@01 $Snap)
(assert (= $t@19@01 ($Snap.combine ($Snap.first $t@19@01) ($Snap.second $t@19@01))))
(assert (=
  ($Snap.second $t@19@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@19@01))
    ($Snap.second ($Snap.second $t@19@01)))))
(assert (= ($Snap.first ($Snap.second $t@19@01)) $Snap.unit))
; [eval] index_V1 >= 0
(assert (>= index_V1@18@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@19@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@19@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@19@01))) $Snap.unit))
; [eval] elems_ec9c2e19_F(tmp_V1) == old(elems_ec9c2e19_F(l1_V0_CN0))[index_V1..]
; [eval] elems_ec9c2e19_F(tmp_V1)
(push) ; 7
(assert (elems_ec9c2e19_F%precondition ($Snap.first ($Snap.second ($Snap.second $t@19@01))) tmp_V1@17@01))
(pop) ; 7
; Joined path conditions
(assert (elems_ec9c2e19_F%precondition ($Snap.first ($Snap.second ($Snap.second $t@19@01))) tmp_V1@17@01))
; [eval] old(elems_ec9c2e19_F(l1_V0_CN0))[index_V1..]
; [eval] old(elems_ec9c2e19_F(l1_V0_CN0))
; [eval] elems_ec9c2e19_F(l1_V0_CN0)
(push) ; 7
(assert (elems_ec9c2e19_F%precondition ($Snap.first $t@4@01) l1_V0@2@01))
(pop) ; 7
; Joined path conditions
(assert (elems_ec9c2e19_F%precondition ($Snap.first $t@4@01) l1_V0@2@01))
(assert (Seq_equal
  (elems_ec9c2e19_F ($Snap.first ($Snap.second ($Snap.second $t@19@01))) tmp_V1@17@01)
  (Seq_drop (elems_ec9c2e19_F ($Snap.first $t@4@01) l1_V0@2@01) index_V1@18@01)))
; Loop head block: Check well-definedness of edge conditions
(push) ; 7
; [eval] (unfolding acc(Mem_ec9c2e19_PMList(tmp_V1), write) in !((ShStructget1of2(tmp_V1): Ref).PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()))
(push) ; 8
(assert (Mem_ec9c2e19_PMList%trigger ($Snap.first ($Snap.second ($Snap.second $t@19@01))) tmp_V1@17@01))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second $t@19@01)))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@19@01))))
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01)))))))
; [eval] (ShStructget0of2(start_V0): Ref)
(assert (not (= (ShStructget0of2<Ref> tmp_V1@17@01) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01)))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))))
; [eval] (ShStructget1of2(start_V0): Ref)
(assert (not (= (ShStructget1of2<Ref> tmp_V1@17@01) $Ref.null)))
; [eval] !((ShStructget1of2(start_V0): Ref).PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget1of2(start_V0): Ref).PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget1of2(start_V0): Ref)
; [eval] shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()
(push) ; 9
(pop) ; 9
; Joined path conditions
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))
  (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))
    (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [then-branch: 4 | First:(Second:(First:(Second:(Second:($t@19@01))))) != shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 4 | First:(Second:(First:(Second:(Second:($t@19@01))))) == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$(_) | live]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 4 | First:(Second:(First:(Second:(Second:($t@19@01))))) != shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (not
  (=
    ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))
    (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
; [eval] (ShStructget1of2(start_V0): Ref)
; [eval] !((ShStructget1of2(tmp_V1): Ref).PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget1of2(tmp_V1): Ref).PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget1of2(tmp_V1): Ref)
; [eval] shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()
(push) ; 10
(pop) ; 10
; Joined path conditions
(pop) ; 9
(push) ; 9
; [else-branch: 4 | First:(Second:(First:(Second:(Second:($t@19@01))))) == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (=
  ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))
  (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01)))))
  $Snap.unit))
; [eval] !((ShStructget1of2(tmp_V1): Ref).PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget1of2(tmp_V1): Ref).PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget1of2(tmp_V1): Ref)
; [eval] shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()
(push) ; 10
(pop) ; 10
; Joined path conditions
(pop) ; 9
(pop) ; 8
(declare-const joined_unfolding@20@01 Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))
      (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (=
    (as joined_unfolding@20@01  Bool)
    (not
      (=
        ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))
        (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))))
(assert (=>
  (=
    ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))
    (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
  (=
    (as joined_unfolding@20@01  Bool)
    (not
      (=
        ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))
        (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))))
; Joined path conditions
(assert (and
  (Mem_ec9c2e19_PMList%trigger ($Snap.first ($Snap.second ($Snap.second $t@19@01))) tmp_V1@17@01)
  (=
    ($Snap.first ($Snap.second ($Snap.second $t@19@01)))
    ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@19@01))))
      ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))
  (not (= (ShStructget0of2<Ref> tmp_V1@17@01) $Ref.null))
  (=
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01)))))
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01)))))))
  (not (= (ShStructget1of2<Ref> tmp_V1@17@01) $Ref.null))))
; Joined path conditions
(assert (and
  (Mem_ec9c2e19_PMList%trigger ($Snap.first ($Snap.second ($Snap.second $t@19@01))) tmp_V1@17@01)
  (=
    ($Snap.first ($Snap.second ($Snap.second $t@19@01)))
    ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@19@01))))
      ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))
  (not (= (ShStructget0of2<Ref> tmp_V1@17@01) $Ref.null))
  (=
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01)))))
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01)))))))
  (not (= (ShStructget1of2<Ref> tmp_V1@17@01) $Ref.null))))
(assert (=>
  (=
    ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))
    (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
  (and
    (=
      ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))
      (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
    (=
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01)))))
      $Snap.unit))))
(assert (or
  (=
    ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))
    (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
  (not
    (=
      ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))
      (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(pop) ; 7
(push) ; 7
; [eval] !(unfolding acc(Mem_ec9c2e19_PMList(tmp_V1), write) in !((ShStructget1of2(tmp_V1): Ref).PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()))
; [eval] (unfolding acc(Mem_ec9c2e19_PMList(tmp_V1), write) in !((ShStructget1of2(tmp_V1): Ref).PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()))
(push) ; 8
(assert (Mem_ec9c2e19_PMList%trigger ($Snap.first ($Snap.second ($Snap.second $t@19@01))) tmp_V1@17@01))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second $t@19@01)))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@19@01))))
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01)))))))
; [eval] (ShStructget0of2(start_V0): Ref)
(assert (not (= (ShStructget0of2<Ref> tmp_V1@17@01) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01)))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))))
; [eval] (ShStructget1of2(start_V0): Ref)
(assert (not (= (ShStructget1of2<Ref> tmp_V1@17@01) $Ref.null)))
; [eval] !((ShStructget1of2(start_V0): Ref).PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget1of2(start_V0): Ref).PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget1of2(start_V0): Ref)
; [eval] shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()
(push) ; 9
(pop) ; 9
; Joined path conditions
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))
  (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))
    (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [then-branch: 5 | First:(Second:(First:(Second:(Second:($t@19@01))))) != shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 5 | First:(Second:(First:(Second:(Second:($t@19@01))))) == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$(_) | live]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 5 | First:(Second:(First:(Second:(Second:($t@19@01))))) != shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (not
  (=
    ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))
    (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
; [eval] (ShStructget1of2(start_V0): Ref)
; [eval] !((ShStructget1of2(tmp_V1): Ref).PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget1of2(tmp_V1): Ref).PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget1of2(tmp_V1): Ref)
; [eval] shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()
(push) ; 10
(pop) ; 10
; Joined path conditions
(pop) ; 9
(push) ; 9
; [else-branch: 5 | First:(Second:(First:(Second:(Second:($t@19@01))))) == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (=
  ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))
  (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01)))))
  $Snap.unit))
; [eval] !((ShStructget1of2(tmp_V1): Ref).PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget1of2(tmp_V1): Ref).PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget1of2(tmp_V1): Ref)
; [eval] shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()
(push) ; 10
(pop) ; 10
; Joined path conditions
(pop) ; 9
(pop) ; 8
(declare-const joined_unfolding@21@01 Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))
      (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (=
    (as joined_unfolding@21@01  Bool)
    (not
      (=
        ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))
        (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))))
(assert (=>
  (=
    ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))
    (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
  (=
    (as joined_unfolding@21@01  Bool)
    (not
      (=
        ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))
        (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))))
; Joined path conditions
(assert (and
  (Mem_ec9c2e19_PMList%trigger ($Snap.first ($Snap.second ($Snap.second $t@19@01))) tmp_V1@17@01)
  (=
    ($Snap.first ($Snap.second ($Snap.second $t@19@01)))
    ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@19@01))))
      ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))
  (not (= (ShStructget0of2<Ref> tmp_V1@17@01) $Ref.null))
  (=
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01)))))
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01)))))))
  (not (= (ShStructget1of2<Ref> tmp_V1@17@01) $Ref.null))))
; Joined path conditions
(assert (and
  (Mem_ec9c2e19_PMList%trigger ($Snap.first ($Snap.second ($Snap.second $t@19@01))) tmp_V1@17@01)
  (=
    ($Snap.first ($Snap.second ($Snap.second $t@19@01)))
    ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@19@01))))
      ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))
  (not (= (ShStructget0of2<Ref> tmp_V1@17@01) $Ref.null))
  (=
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01)))))
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01)))))))
  (not (= (ShStructget1of2<Ref> tmp_V1@17@01) $Ref.null))))
(assert (=>
  (=
    ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))
    (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
  (and
    (=
      ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))
      (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
    (=
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01)))))
      $Snap.unit))))
(assert (or
  (=
    ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))
    (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
  (not
    (=
      ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))
      (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(pop) ; 7
(pop) ; 6
(push) ; 6
; Loop head block: Establish invariant
; [eval] index_V1 >= 0
(push) ; 7
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.first $t@4@01))))
  tmp_V1@13@01)))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
; [eval] elems_ec9c2e19_F(tmp_V1) == old(elems_ec9c2e19_F(l1_V0_CN0))[index_V1..]
; [eval] elems_ec9c2e19_F(tmp_V1)
(set-option :timeout 0)
(push) ; 7
(push) ; 8
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.first $t@4@01))))
  tmp_V1@13@01)))
(check-sat)
; unsat
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(assert (elems_ec9c2e19_F%precondition ($Snap.second ($Snap.second ($Snap.first $t@4@01))) tmp_V1@13@01))
(pop) ; 7
; Joined path conditions
(assert (elems_ec9c2e19_F%precondition ($Snap.second ($Snap.second ($Snap.first $t@4@01))) tmp_V1@13@01))
; [eval] old(elems_ec9c2e19_F(l1_V0_CN0))[index_V1..]
; [eval] old(elems_ec9c2e19_F(l1_V0_CN0))
; [eval] elems_ec9c2e19_F(l1_V0_CN0)
(set-option :timeout 0)
(push) ; 7
(assert (elems_ec9c2e19_F%precondition ($Snap.first $t@4@01) l1_V0@2@01))
(pop) ; 7
; Joined path conditions
(assert (elems_ec9c2e19_F%precondition ($Snap.first $t@4@01) l1_V0@2@01))
(push) ; 7
(assert (not (Seq_equal
  (elems_ec9c2e19_F ($Snap.second ($Snap.second ($Snap.first $t@4@01))) tmp_V1@13@01)
  (Seq_drop (elems_ec9c2e19_F ($Snap.first $t@4@01) l1_V0@2@01) 1))))
(check-sat)
; unsat
(pop) ; 7
; 0.00s
; (get-info :all-statistics)
(assert (Seq_equal
  (elems_ec9c2e19_F ($Snap.second ($Snap.second ($Snap.first $t@4@01))) tmp_V1@13@01)
  (Seq_drop (elems_ec9c2e19_F ($Snap.first $t@4@01) l1_V0@2@01) 1)))
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 7
(assert (= $t@19@01 ($Snap.combine ($Snap.first $t@19@01) ($Snap.second $t@19@01))))
(assert (=
  ($Snap.second $t@19@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@19@01))
    ($Snap.second ($Snap.second $t@19@01)))))
(assert (= ($Snap.first ($Snap.second $t@19@01)) $Snap.unit))
(assert (>= index_V1@18@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@19@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@19@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@19@01))) $Snap.unit))
(assert (elems_ec9c2e19_F%precondition ($Snap.first ($Snap.second ($Snap.second $t@19@01))) tmp_V1@17@01))
(assert (Seq_equal
  (elems_ec9c2e19_F ($Snap.first ($Snap.second ($Snap.second $t@19@01))) tmp_V1@17@01)
  (Seq_drop (elems_ec9c2e19_F ($Snap.first $t@4@01) l1_V0@2@01) index_V1@18@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 10)
(check-sat)
; unknown
; Loop head block: Follow loop-internal edges
; [eval] (unfolding acc(Mem_ec9c2e19_PMList(tmp_V1), write) in !((ShStructget1of2(tmp_V1): Ref).PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()))
(set-option :timeout 0)
(push) ; 8
(assert (Mem_ec9c2e19_PMList%trigger ($Snap.first ($Snap.second ($Snap.second $t@19@01))) tmp_V1@17@01))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second $t@19@01)))
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@19@01))))
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01)))))))
; [eval] (ShStructget0of2(start_V0): Ref)
(assert (not (= (ShStructget0of2<Ref> tmp_V1@17@01) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01)))))
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))))
; [eval] (ShStructget1of2(start_V0): Ref)
(assert (not (= (ShStructget1of2<Ref> tmp_V1@17@01) $Ref.null)))
; [eval] !((ShStructget1of2(start_V0): Ref).PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget1of2(start_V0): Ref).PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget1of2(start_V0): Ref)
; [eval] shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()
(push) ; 9
(pop) ; 9
; Joined path conditions
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))
  (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))
    (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [then-branch: 6 | First:(Second:(First:(Second:(Second:($t@19@01))))) != shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 6 | First:(Second:(First:(Second:(Second:($t@19@01))))) == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$(_) | live]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 6 | First:(Second:(First:(Second:(Second:($t@19@01))))) != shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (not
  (=
    ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))
    (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
; [eval] (ShStructget1of2(start_V0): Ref)
; [eval] !((ShStructget1of2(tmp_V1): Ref).PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget1of2(tmp_V1): Ref).PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget1of2(tmp_V1): Ref)
; [eval] shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()
(push) ; 10
(pop) ; 10
; Joined path conditions
(pop) ; 9
(push) ; 9
; [else-branch: 6 | First:(Second:(First:(Second:(Second:($t@19@01))))) == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (=
  ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))
  (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01)))))
  $Snap.unit))
; [eval] !((ShStructget1of2(tmp_V1): Ref).PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget1of2(tmp_V1): Ref).PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget1of2(tmp_V1): Ref)
; [eval] shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()
(push) ; 10
(pop) ; 10
; Joined path conditions
(pop) ; 9
(pop) ; 8
(declare-const joined_unfolding@22@01 Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))
      (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (=
    (as joined_unfolding@22@01  Bool)
    (not
      (=
        ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))
        (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))))
(assert (=>
  (=
    ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))
    (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
  (=
    (as joined_unfolding@22@01  Bool)
    (not
      (=
        ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))
        (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))))
; Joined path conditions
(assert (and
  (Mem_ec9c2e19_PMList%trigger ($Snap.first ($Snap.second ($Snap.second $t@19@01))) tmp_V1@17@01)
  (=
    ($Snap.first ($Snap.second ($Snap.second $t@19@01)))
    ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@19@01))))
      ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))
  (not (= (ShStructget0of2<Ref> tmp_V1@17@01) $Ref.null))
  (=
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01)))))
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01)))))))
  (not (= (ShStructget1of2<Ref> tmp_V1@17@01) $Ref.null))))
; Joined path conditions
(assert (and
  (Mem_ec9c2e19_PMList%trigger ($Snap.first ($Snap.second ($Snap.second $t@19@01))) tmp_V1@17@01)
  (=
    ($Snap.first ($Snap.second ($Snap.second $t@19@01)))
    ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@19@01))))
      ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))
  (not (= (ShStructget0of2<Ref> tmp_V1@17@01) $Ref.null))
  (=
    ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01)))))
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01)))))))
  (not (= (ShStructget1of2<Ref> tmp_V1@17@01) $Ref.null))))
(assert (=>
  (=
    ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))
    (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
  (and
    (=
      ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))
      (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
    (=
      ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01)))))
      $Snap.unit))))
(assert (or
  (=
    ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))
    (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
  (not
    (=
      ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))
      (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(push) ; 8
(set-option :timeout 10)
(assert (not (not (as joined_unfolding@22@01  Bool))))
(check-sat)
; unknown
(pop) ; 8
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (as joined_unfolding@22@01  Bool)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [then-branch: 7 | joined_unfolding@22@01 | live]
; [else-branch: 7 | !(joined_unfolding@22@01) | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 7 | joined_unfolding@22@01]
(assert (as joined_unfolding@22@01  Bool))
; [exec]
; var prev_V2: ShStruct2[Ref, Ref]
(declare-const prev_V2@23@01 ShStruct2<Ref~_Ref>)
; [exec]
; unfold acc(Mem_ec9c2e19_PMList(tmp_V1), write)
; [eval] (ShStructget0of2(start_V0): Ref)
; [eval] (ShStructget1of2(start_V0): Ref)
; [eval] !((ShStructget1of2(start_V0): Ref).PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget1of2(start_V0): Ref).PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget1of2(start_V0): Ref)
; [eval] shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()
(push) ; 9
(pop) ; 9
; Joined path conditions
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))
  (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 9
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))
    (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [then-branch: 8 | First:(Second:(First:(Second:(Second:($t@19@01))))) != shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 8 | First:(Second:(First:(Second:(Second:($t@19@01))))) == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 8 | First:(Second:(First:(Second:(Second:($t@19@01))))) != shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (not
  (=
    ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))
    (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
; [eval] (ShStructget1of2(start_V0): Ref)
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
; [exec]
; inhale prev_V2 ==
;   shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()
(declare-const $t@24@01 $Snap)
(assert (= $t@24@01 $Snap.unit))
; [eval] prev_V2 == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()
; [eval] shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 10
(pop) ; 10
; Joined path conditions
(assert (=
  prev_V2@23@01
  (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; prev_V2 := tmp_V1
; [exec]
; tmp_V1 := (ShStructget1of2(tmp_V1): Ref).PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$$_E_$$$
; [eval] (ShStructget1of2(tmp_V1): Ref)
(declare-const tmp_V1@25@01 ShStruct2<Ref~_Ref>)
(assert (=
  tmp_V1@25@01
  ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))))
; [exec]
; index_V1 := index_V1 + 1
; [eval] index_V1 + 1
(declare-const index_V1@26@01 Int)
(assert (= index_V1@26@01 (+ index_V1@18@01 1)))
; [exec]
; package acc(Mem_ec9c2e19_PMList(tmp_V1), write) --*
; acc(Mem_ec9c2e19_PMList(l1_V0_CN0), write) &&
; elems_ec9c2e19_F(l1_V0_CN0) ==
; old(elems_ec9c2e19_F(l1_V0_CN0)[..index_V1] ++
; old[lhs](elems_ec9c2e19_F(tmp_V1))) {
;   fold acc(Mem_ec9c2e19_PMList(prev_V2), write)
;   apply acc(Mem_ec9c2e19_PMList(prev_V2), write) --*
;     acc(Mem_ec9c2e19_PMList(l1_V0_CN0), write) &&
;     elems_ec9c2e19_F(l1_V0_CN0) ==
;     old(elems_ec9c2e19_F(l1_V0_CN0)[..index_V1 - 1] ++
;     old[lhs](elems_ec9c2e19_F(prev_V2)))
; }
(set-option :timeout 0)
(push) ; 10
(declare-const $t@27@01 $Snap)
; [exec]
; fold acc(Mem_ec9c2e19_PMList(prev_V2), write)
; [eval] (ShStructget0of2(start_V0): Ref)
(push) ; 11
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 11
; 0.01s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(check-sat)
; unknown
; [eval] (ShStructget1of2(start_V0): Ref)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 11
; 0.01s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(check-sat)
; unknown
; [eval] !((ShStructget1of2(start_V0): Ref).PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget1of2(start_V0): Ref).PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget1of2(start_V0): Ref)
; [eval] shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 11
(pop) ; 11
; Joined path conditions
(push) ; 11
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))
  (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 11
; 0.01s
; (get-info :all-statistics)
; [then-branch: 9 | First:(Second:(First:(Second:(Second:($t@19@01))))) != shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 9 | First:(Second:(First:(Second:(Second:($t@19@01))))) == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 9 | First:(Second:(First:(Second:(Second:($t@19@01))))) != shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] (ShStructget1of2(start_V0): Ref)
(push) ; 12
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 12
; 0.01s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(assert (Mem_ec9c2e19_PMList%trigger ($Snap.combine
  ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@19@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01)))))
    $t@27@01)) tmp_V1@17@01))
; [exec]
; apply acc(Mem_ec9c2e19_PMList(prev_V2), write) --*
;   acc(Mem_ec9c2e19_PMList(l1_V0_CN0), write) &&
;   elems_ec9c2e19_F(l1_V0_CN0) ==
;   old(elems_ec9c2e19_F(l1_V0_CN0)[..index_V1 - 1] ++
;   old[lhs](elems_ec9c2e19_F(prev_V2)))
; [eval] index_V1 - 1
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 12
; 0.01s
; (get-info :all-statistics)
(check-sat)
; unknown
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (= index_V1@18@01 (- index_V1@26@01 1))))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 12
; 0.01s
; (get-info :all-statistics)
(check-sat)
; unknown
(assert (=
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@19@01))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01)))))
      $t@27@01))
  ($Snap.first ($Snap.first $t@19@01))))
(assert (=
  ($Snap.second ($Snap.first $t@19@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@19@01)))
    ($Snap.second ($Snap.second ($Snap.first $t@19@01))))))
(assert (= ($Snap.second ($Snap.second ($Snap.first $t@19@01))) $Snap.unit))
; [eval] elems_ec9c2e19_F(l1_V0_CN0) == old(elems_ec9c2e19_F(l1_V0_CN0)[..index_V1 - 1] ++ old[lhs](elems_ec9c2e19_F(prev_V2)))
; [eval] elems_ec9c2e19_F(l1_V0_CN0)
(set-option :timeout 0)
(push) ; 12
(assert (elems_ec9c2e19_F%precondition ($Snap.first ($Snap.second ($Snap.first $t@19@01))) l1_V0@2@01))
(pop) ; 12
; Joined path conditions
(assert (elems_ec9c2e19_F%precondition ($Snap.first ($Snap.second ($Snap.first $t@19@01))) l1_V0@2@01))
; [eval] old(elems_ec9c2e19_F(l1_V0_CN0)[..index_V1 - 1] ++ old[lhs](elems_ec9c2e19_F(prev_V2)))
; [eval] elems_ec9c2e19_F(l1_V0_CN0)[..index_V1 - 1] ++ old[lhs](elems_ec9c2e19_F(prev_V2))
; [eval] elems_ec9c2e19_F(l1_V0_CN0)[..index_V1 - 1]
; [eval] elems_ec9c2e19_F(l1_V0_CN0)
(push) ; 12
(pop) ; 12
; Joined path conditions
; [eval] index_V1 - 1
; [eval] old[lhs](elems_ec9c2e19_F(prev_V2))
; [eval] elems_ec9c2e19_F(prev_V2)
(push) ; 12
(assert (elems_ec9c2e19_F%precondition ($Snap.combine
  ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@19@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01)))))
    $t@27@01)) tmp_V1@17@01))
(pop) ; 12
; Joined path conditions
(assert (elems_ec9c2e19_F%precondition ($Snap.combine
  ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@19@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01)))))
    $t@27@01)) tmp_V1@17@01))
(assert (Seq_equal
  (elems_ec9c2e19_F ($Snap.first ($Snap.second ($Snap.first $t@19@01))) l1_V0@2@01)
  (Seq_append
    (Seq_take
      (elems_ec9c2e19_F ($Snap.first $t@4@01) l1_V0@2@01)
      (- index_V1@26@01 1))
    (elems_ec9c2e19_F ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@19@01))))
      ($Snap.combine
        ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01)))))
        $t@27@01)) tmp_V1@17@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 12
; 0.01s
; (get-info :all-statistics)
(check-sat)
; unknown
; [eval] elems_ec9c2e19_F(l1_V0_CN0) == old(elems_ec9c2e19_F(l1_V0_CN0)[..index_V1] ++ old[lhs](elems_ec9c2e19_F(tmp_V1)))
; [eval] elems_ec9c2e19_F(l1_V0_CN0)
(set-option :timeout 0)
(push) ; 12
(pop) ; 12
; Joined path conditions
; [eval] old(elems_ec9c2e19_F(l1_V0_CN0)[..index_V1] ++ old[lhs](elems_ec9c2e19_F(tmp_V1)))
; [eval] elems_ec9c2e19_F(l1_V0_CN0)[..index_V1] ++ old[lhs](elems_ec9c2e19_F(tmp_V1))
; [eval] elems_ec9c2e19_F(l1_V0_CN0)[..index_V1]
; [eval] elems_ec9c2e19_F(l1_V0_CN0)
(push) ; 12
(pop) ; 12
; Joined path conditions
; [eval] old[lhs](elems_ec9c2e19_F(tmp_V1))
; [eval] elems_ec9c2e19_F(tmp_V1)
(push) ; 12
(assert (elems_ec9c2e19_F%precondition $t@27@01 tmp_V1@25@01))
(pop) ; 12
; Joined path conditions
(assert (elems_ec9c2e19_F%precondition $t@27@01 tmp_V1@25@01))
(push) ; 12
(assert (not (Seq_equal
  (elems_ec9c2e19_F ($Snap.first ($Snap.second ($Snap.first $t@19@01))) l1_V0@2@01)
  (Seq_append
    (Seq_take (elems_ec9c2e19_F ($Snap.first $t@4@01) l1_V0@2@01) index_V1@26@01)
    (elems_ec9c2e19_F $t@27@01 tmp_V1@25@01)))))
(check-sat)
; unsat
(pop) ; 12
; 0.48s
; (get-info :all-statistics)
(assert (Seq_equal
  (elems_ec9c2e19_F ($Snap.first ($Snap.second ($Snap.first $t@19@01))) l1_V0@2@01)
  (Seq_append
    (Seq_take (elems_ec9c2e19_F ($Snap.first $t@4@01) l1_V0@2@01) index_V1@26@01)
    (elems_ec9c2e19_F $t@27@01 tmp_V1@25@01))))
(pop) ; 11
(pop) ; 10
(push) ; 10
(assert (and
  (not
    (=
      ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))
      (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (as joined_unfolding@22@01  Bool)
  (not
    (=
      ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.first $t@4@01))))
      (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
; [exec]
; label L$16$2$Continue
; [eval] !(unfolding acc(Mem_ec9c2e19_PMList(tmp_V1), write) in !((ShStructget1of2(tmp_V1): Ref).PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()))
; [eval] (unfolding acc(Mem_ec9c2e19_PMList(tmp_V1), write) in !((ShStructget1of2(tmp_V1): Ref).PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()))
(push) ; 11
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))
  tmp_V1@25@01)))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(assert (Mem_ec9c2e19_PMList%trigger ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))) tmp_V1@25@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01)))))))))
; [eval] (ShStructget0of2(start_V0): Ref)
(assert (not (= (ShStructget0of2<Ref> tmp_V1@25@01) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))))))
; [eval] (ShStructget1of2(start_V0): Ref)
(assert (not (= (ShStructget1of2<Ref> tmp_V1@25@01) $Ref.null)))
; [eval] !((ShStructget1of2(start_V0): Ref).PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget1of2(start_V0): Ref).PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget1of2(start_V0): Ref)
; [eval] shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 12
(pop) ; 12
; Joined path conditions
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))))
  (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 12
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))))
    (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [then-branch: 10 | First:(Second:(Second:(Second:(First:(Second:(Second:($t@19@01))))))) != shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 10 | First:(Second:(Second:(Second:(First:(Second:(Second:($t@19@01))))))) == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$(_) | live]
(set-option :timeout 0)
(push) ; 12
; [then-branch: 10 | First:(Second:(Second:(Second:(First:(Second:(Second:($t@19@01))))))) != shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (not
  (=
    ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))))
    (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
; [eval] (ShStructget1of2(start_V0): Ref)
; [eval] !((ShStructget1of2(tmp_V1): Ref).PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget1of2(tmp_V1): Ref).PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget1of2(tmp_V1): Ref)
; [eval] shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()
(push) ; 13
(pop) ; 13
; Joined path conditions
(pop) ; 12
(push) ; 12
; [else-branch: 10 | First:(Second:(Second:(Second:(First:(Second:(Second:($t@19@01))))))) == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (=
  ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))))
  (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01)))))))
  $Snap.unit))
; [eval] !((ShStructget1of2(tmp_V1): Ref).PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget1of2(tmp_V1): Ref).PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget1of2(tmp_V1): Ref)
; [eval] shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()
(push) ; 13
(pop) ; 13
; Joined path conditions
(pop) ; 12
(pop) ; 11
(declare-const joined_unfolding@28@01 Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))))
      (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (=
    (as joined_unfolding@28@01  Bool)
    (not
      (=
        ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))))
        (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))))
(assert (=>
  (=
    ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))))
    (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
  (=
    (as joined_unfolding@28@01  Bool)
    (not
      (=
        ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))))
        (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))))
; Joined path conditions
(assert (and
  (Mem_ec9c2e19_PMList%trigger ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))) tmp_V1@25@01)
  (=
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))))
  (not (= (ShStructget0of2<Ref> tmp_V1@25@01) $Ref.null))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01)))))))))
  (not (= (ShStructget1of2<Ref> tmp_V1@25@01) $Ref.null))))
; Joined path conditions
(assert (and
  (Mem_ec9c2e19_PMList%trigger ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))) tmp_V1@25@01)
  (=
    ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01)))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))))
  (not (= (ShStructget0of2<Ref> tmp_V1@25@01) $Ref.null))
  (=
    ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))
    ($Snap.combine
      ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01)))))))
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01)))))))))
  (not (= (ShStructget1of2<Ref> tmp_V1@25@01) $Ref.null))))
(assert (=>
  (=
    ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))))
    (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
  (and
    (=
      ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))))
      (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
    (=
      ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01)))))))
      $Snap.unit))))
(assert (or
  (=
    ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))))
    (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
  (not
    (=
      ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))))
      (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(push) ; 11
(set-option :timeout 10)
(assert (not (as joined_unfolding@28@01  Bool)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (not (as joined_unfolding@28@01  Bool))))
(check-sat)
; unknown
(pop) ; 11
; 0.01s
; (get-info :all-statistics)
; [then-branch: 11 | !(joined_unfolding@28@01) | live]
; [else-branch: 11 | joined_unfolding@28@01 | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 11 | !(joined_unfolding@28@01)]
(assert (not (as joined_unfolding@28@01  Bool)))
; Loop head block: Re-establish invariant
; [eval] index_V1 >= 0
(push) ; 12
(assert (not (>= index_V1@26@01 0)))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(assert (>= index_V1@26@01 0))
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))
  tmp_V1@25@01)))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [eval] elems_ec9c2e19_F(tmp_V1) == old(elems_ec9c2e19_F(l1_V0_CN0))[index_V1..]
; [eval] elems_ec9c2e19_F(tmp_V1)
(set-option :timeout 0)
(push) ; 12
(push) ; 13
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))
  tmp_V1@25@01)))
(check-sat)
; unsat
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(assert (elems_ec9c2e19_F%precondition ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))) tmp_V1@25@01))
(pop) ; 12
; Joined path conditions
(assert (elems_ec9c2e19_F%precondition ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))) tmp_V1@25@01))
; [eval] old(elems_ec9c2e19_F(l1_V0_CN0))[index_V1..]
; [eval] old(elems_ec9c2e19_F(l1_V0_CN0))
; [eval] elems_ec9c2e19_F(l1_V0_CN0)
(set-option :timeout 0)
(push) ; 12
(pop) ; 12
; Joined path conditions
(push) ; 12
(assert (not (Seq_equal
  (elems_ec9c2e19_F ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))) tmp_V1@25@01)
  (Seq_drop (elems_ec9c2e19_F ($Snap.first $t@4@01) l1_V0@2@01) index_V1@26@01))))
(check-sat)
; unsat
(pop) ; 12
; 0.01s
; (get-info :all-statistics)
(assert (Seq_equal
  (elems_ec9c2e19_F ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))) tmp_V1@25@01)
  (Seq_drop (elems_ec9c2e19_F ($Snap.first $t@4@01) l1_V0@2@01) index_V1@26@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 11 | joined_unfolding@28@01]
(assert (as joined_unfolding@28@01  Bool))
(pop) ; 11
; [eval] (unfolding acc(Mem_ec9c2e19_PMList(tmp_V1), write) in !((ShStructget1of2(tmp_V1): Ref).PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()))
(push) ; 11
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))
  tmp_V1@25@01)))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [eval] (ShStructget0of2(start_V0): Ref)
; [eval] (ShStructget1of2(start_V0): Ref)
; [eval] !((ShStructget1of2(start_V0): Ref).PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget1of2(start_V0): Ref).PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget1of2(start_V0): Ref)
; [eval] shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 12
(pop) ; 12
; Joined path conditions
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))))
  (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 12
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))))
    (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unknown
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [then-branch: 12 | First:(Second:(Second:(Second:(First:(Second:(Second:($t@19@01))))))) != shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 12 | First:(Second:(Second:(Second:(First:(Second:(Second:($t@19@01))))))) == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$(_) | live]
(set-option :timeout 0)
(push) ; 12
; [then-branch: 12 | First:(Second:(Second:(Second:(First:(Second:(Second:($t@19@01))))))) != shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (not
  (=
    ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))))
    (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
; [eval] (ShStructget1of2(start_V0): Ref)
; [eval] !((ShStructget1of2(tmp_V1): Ref).PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget1of2(tmp_V1): Ref).PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget1of2(tmp_V1): Ref)
; [eval] shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()
(push) ; 13
(pop) ; 13
; Joined path conditions
(pop) ; 12
(push) ; 12
; [else-branch: 12 | First:(Second:(Second:(Second:(First:(Second:(Second:($t@19@01))))))) == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (=
  ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))))
  (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01)))))))
  $Snap.unit))
; [eval] !((ShStructget1of2(tmp_V1): Ref).PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget1of2(tmp_V1): Ref).PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget1of2(tmp_V1): Ref)
; [eval] shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()
(push) ; 13
(pop) ; 13
; Joined path conditions
(pop) ; 12
(pop) ; 11
(declare-const joined_unfolding@29@01 Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))))
      (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (=
    (as joined_unfolding@29@01  Bool)
    (not
      (=
        ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))))
        (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))))
(assert (=>
  (=
    ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))))
    (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
  (=
    (as joined_unfolding@29@01  Bool)
    (not
      (=
        ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))))
        (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))))
; Joined path conditions
; Joined path conditions
(push) ; 11
(set-option :timeout 10)
(assert (not (not (as joined_unfolding@29@01  Bool))))
(check-sat)
; unknown
(pop) ; 11
; 0.01s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (as joined_unfolding@29@01  Bool)))
(check-sat)
; unknown
(pop) ; 11
; 0.00s
; (get-info :all-statistics)
; [then-branch: 13 | joined_unfolding@29@01 | live]
; [else-branch: 13 | !(joined_unfolding@29@01) | live]
(set-option :timeout 0)
(push) ; 11
; [then-branch: 13 | joined_unfolding@29@01]
(assert (as joined_unfolding@29@01  Bool))
; Loop head block: Re-establish invariant
; [eval] index_V1 >= 0
(push) ; 12
(assert (not (>= index_V1@26@01 0)))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
(assert (>= index_V1@26@01 0))
(push) ; 12
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))
  tmp_V1@25@01)))
(check-sat)
; unsat
(pop) ; 12
; 0.00s
; (get-info :all-statistics)
; [eval] elems_ec9c2e19_F(tmp_V1) == old(elems_ec9c2e19_F(l1_V0_CN0))[index_V1..]
; [eval] elems_ec9c2e19_F(tmp_V1)
(set-option :timeout 0)
(push) ; 12
(push) ; 13
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))
  tmp_V1@25@01)))
(check-sat)
; unsat
(pop) ; 13
; 0.00s
; (get-info :all-statistics)
(assert (elems_ec9c2e19_F%precondition ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))) tmp_V1@25@01))
(pop) ; 12
; Joined path conditions
(assert (elems_ec9c2e19_F%precondition ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))) tmp_V1@25@01))
; [eval] old(elems_ec9c2e19_F(l1_V0_CN0))[index_V1..]
; [eval] old(elems_ec9c2e19_F(l1_V0_CN0))
; [eval] elems_ec9c2e19_F(l1_V0_CN0)
(set-option :timeout 0)
(push) ; 12
(pop) ; 12
; Joined path conditions
(push) ; 12
(assert (not (Seq_equal
  (elems_ec9c2e19_F ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))) tmp_V1@25@01)
  (Seq_drop (elems_ec9c2e19_F ($Snap.first $t@4@01) l1_V0@2@01) index_V1@26@01))))
(check-sat)
; unsat
(pop) ; 12
; 0.02s
; (get-info :all-statistics)
(assert (Seq_equal
  (elems_ec9c2e19_F ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))) tmp_V1@25@01)
  (Seq_drop (elems_ec9c2e19_F ($Snap.first $t@4@01) l1_V0@2@01) index_V1@26@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 13 | !(joined_unfolding@29@01)]
(assert (not (as joined_unfolding@29@01  Bool)))
(pop) ; 11
(pop) ; 10
(pop) ; 9
(pop) ; 8
(push) ; 8
; [else-branch: 7 | !(joined_unfolding@22@01)]
(assert (not (as joined_unfolding@22@01  Bool)))
(pop) ; 8
(push) ; 8
(set-option :timeout 10)
(assert (not (= tmp_V1@17@01 l2_V0@3@01)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
; [eval] !(unfolding acc(Mem_ec9c2e19_PMList(tmp_V1), write) in !((ShStructget1of2(tmp_V1): Ref).PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()))
; [eval] (unfolding acc(Mem_ec9c2e19_PMList(tmp_V1), write) in !((ShStructget1of2(tmp_V1): Ref).PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()))
(set-option :timeout 0)
(push) ; 8
; [eval] (ShStructget0of2(start_V0): Ref)
; [eval] (ShStructget1of2(start_V0): Ref)
; [eval] !((ShStructget1of2(start_V0): Ref).PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget1of2(start_V0): Ref).PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget1of2(start_V0): Ref)
; [eval] shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()
(push) ; 9
(pop) ; 9
; Joined path conditions
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))
  (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))
    (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unknown
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [then-branch: 14 | First:(Second:(First:(Second:(Second:($t@19@01))))) != shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 14 | First:(Second:(First:(Second:(Second:($t@19@01))))) == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$(_) | live]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 14 | First:(Second:(First:(Second:(Second:($t@19@01))))) != shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (not
  (=
    ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))
    (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
; [eval] (ShStructget1of2(start_V0): Ref)
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  l2_V0@3@01
  ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01)))))))))
(check-sat)
; unknown
(pop) ; 10
; 0.00s
; (get-info :all-statistics)
; [eval] !((ShStructget1of2(tmp_V1): Ref).PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget1of2(tmp_V1): Ref).PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget1of2(tmp_V1): Ref)
; [eval] shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 10
(pop) ; 10
; Joined path conditions
(pop) ; 9
(push) ; 9
; [else-branch: 14 | First:(Second:(First:(Second:(Second:($t@19@01))))) == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (=
  ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))
  (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01)))))
  $Snap.unit))
; [eval] !((ShStructget1of2(tmp_V1): Ref).PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget1of2(tmp_V1): Ref).PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget1of2(tmp_V1): Ref)
; [eval] shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()
(push) ; 10
(pop) ; 10
; Joined path conditions
(pop) ; 9
(pop) ; 8
(declare-const joined_unfolding@30@01 Bool)
(assert (=>
  (not
    (=
      ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))
      (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
  (=
    (as joined_unfolding@30@01  Bool)
    (not
      (=
        ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))
        (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))))
(assert (=>
  (=
    ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))
    (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))
  (=
    (as joined_unfolding@30@01  Bool)
    (not
      (=
        ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))
        (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))))
; Joined path conditions
; Joined path conditions
(push) ; 8
(set-option :timeout 10)
(assert (not (as joined_unfolding@30@01  Bool)))
(check-sat)
; unknown
(pop) ; 8
; 0.00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (not (as joined_unfolding@30@01  Bool))))
(check-sat)
; unknown
(pop) ; 8
; 0.01s
; (get-info :all-statistics)
; [then-branch: 15 | !(joined_unfolding@30@01) | live]
; [else-branch: 15 | joined_unfolding@30@01 | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 15 | !(joined_unfolding@30@01)]
(assert (not (as joined_unfolding@30@01  Bool)))
; [exec]
; label L$16$2$Break
; [exec]
; unfold acc(Mem_ec9c2e19_PMList(tmp_V1), write)
; [eval] (ShStructget0of2(start_V0): Ref)
; [eval] (ShStructget1of2(start_V0): Ref)
; [eval] !((ShStructget1of2(start_V0): Ref).PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget1of2(start_V0): Ref).PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget1of2(start_V0): Ref)
; [eval] shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()
(push) ; 9
(pop) ; 9
; Joined path conditions
(push) ; 9
(set-option :timeout 10)
(assert (not (=
  ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))
  (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unsat
(pop) ; 9
; 0.00s
; (get-info :all-statistics)
; [then-branch: 16 | First:(Second:(First:(Second:(Second:($t@19@01))))) != shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 16 | First:(Second:(First:(Second:(Second:($t@19@01))))) == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$(_) | live]
(set-option :timeout 0)
(push) ; 9
; [else-branch: 16 | First:(Second:(First:(Second:(Second:($t@19@01))))) == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (=
  ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01))))))
  (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.first ($Snap.second ($Snap.second $t@19@01)))))
  $Snap.unit))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
; [exec]
; (ShStructget1of2(tmp_V1): Ref).PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$$_E_$$$ := l2_V0_CN1
; [eval] (ShStructget1of2(tmp_V1): Ref)
; [exec]
; fold acc(Mem_ec9c2e19_PMList(tmp_V1), write)
; [eval] (ShStructget0of2(start_V0): Ref)
; [eval] (ShStructget1of2(start_V0): Ref)
; [eval] !((ShStructget1of2(start_V0): Ref).PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget1of2(start_V0): Ref).PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget1of2(start_V0): Ref)
; [eval] shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 10
(pop) ; 10
; Joined path conditions
(push) ; 10
(set-option :timeout 10)
(assert (not (=
  l2_V0@3@01
  (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 10
; 0.01s
; (get-info :all-statistics)
; [then-branch: 17 | l2_V0@3@01 != shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 17 | l2_V0@3@01 == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 10
; [then-branch: 17 | l2_V0@3@01 != shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] (ShStructget1of2(start_V0): Ref)
(assert (Mem_ec9c2e19_PMList%trigger ($Snap.combine
  ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@19@01))))
  ($Snap.combine
    ($SortWrappers.ShStruct2<Ref~_Ref>To$Snap l2_V0@3@01)
    ($Snap.first ($Snap.second $t@4@01)))) tmp_V1@17@01))
; [exec]
; apply acc(Mem_ec9c2e19_PMList(tmp_V1), write) --*
;   acc(Mem_ec9c2e19_PMList(l1_V0_CN0), write) &&
;   elems_ec9c2e19_F(l1_V0_CN0) ==
;   old(elems_ec9c2e19_F(l1_V0_CN0)[..index_V1] ++
;   old[lhs](elems_ec9c2e19_F(tmp_V1)))
(assert (=
  ($Snap.combine
    ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@19@01))))
    ($Snap.combine
      ($SortWrappers.ShStruct2<Ref~_Ref>To$Snap l2_V0@3@01)
      ($Snap.first ($Snap.second $t@4@01))))
  ($Snap.first ($Snap.first $t@19@01))))
(assert (=
  ($Snap.second ($Snap.first $t@19@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.first $t@19@01)))
    ($Snap.second ($Snap.second ($Snap.first $t@19@01))))))
(assert (= ($Snap.second ($Snap.second ($Snap.first $t@19@01))) $Snap.unit))
; [eval] elems_ec9c2e19_F(l1_V0_CN0) == old(elems_ec9c2e19_F(l1_V0_CN0)[..index_V1] ++ old[lhs](elems_ec9c2e19_F(tmp_V1)))
; [eval] elems_ec9c2e19_F(l1_V0_CN0)
(push) ; 11
(assert (elems_ec9c2e19_F%precondition ($Snap.first ($Snap.second ($Snap.first $t@19@01))) l1_V0@2@01))
(pop) ; 11
; Joined path conditions
(assert (elems_ec9c2e19_F%precondition ($Snap.first ($Snap.second ($Snap.first $t@19@01))) l1_V0@2@01))
; [eval] old(elems_ec9c2e19_F(l1_V0_CN0)[..index_V1] ++ old[lhs](elems_ec9c2e19_F(tmp_V1)))
; [eval] elems_ec9c2e19_F(l1_V0_CN0)[..index_V1] ++ old[lhs](elems_ec9c2e19_F(tmp_V1))
; [eval] elems_ec9c2e19_F(l1_V0_CN0)[..index_V1]
; [eval] elems_ec9c2e19_F(l1_V0_CN0)
(push) ; 11
(pop) ; 11
; Joined path conditions
; [eval] old[lhs](elems_ec9c2e19_F(tmp_V1))
; [eval] elems_ec9c2e19_F(tmp_V1)
(push) ; 11
(assert (elems_ec9c2e19_F%precondition ($Snap.combine
  ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@19@01))))
  ($Snap.combine
    ($SortWrappers.ShStruct2<Ref~_Ref>To$Snap l2_V0@3@01)
    ($Snap.first ($Snap.second $t@4@01)))) tmp_V1@17@01))
(pop) ; 11
; Joined path conditions
(assert (elems_ec9c2e19_F%precondition ($Snap.combine
  ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@19@01))))
  ($Snap.combine
    ($SortWrappers.ShStruct2<Ref~_Ref>To$Snap l2_V0@3@01)
    ($Snap.first ($Snap.second $t@4@01)))) tmp_V1@17@01))
(assert (Seq_equal
  (elems_ec9c2e19_F ($Snap.first ($Snap.second ($Snap.first $t@19@01))) l1_V0@2@01)
  (Seq_append
    (Seq_take (elems_ec9c2e19_F ($Snap.first $t@4@01) l1_V0@2@01) index_V1@18@01)
    (elems_ec9c2e19_F ($Snap.combine
      ($Snap.first ($Snap.first ($Snap.second ($Snap.second $t@19@01))))
      ($Snap.combine
        ($SortWrappers.ShStruct2<Ref~_Ref>To$Snap l2_V0@3@01)
        ($Snap.first ($Snap.second $t@4@01)))) tmp_V1@17@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; [exec]
; label returnLabel
; [eval] elems_ec9c2e19_F(l1_V0) == old(elems_ec9c2e19_F(l1_V0) ++ elems_ec9c2e19_F(l2_V0))
; [eval] elems_ec9c2e19_F(l1_V0)
(set-option :timeout 0)
(push) ; 11
(pop) ; 11
; Joined path conditions
; [eval] old(elems_ec9c2e19_F(l1_V0) ++ elems_ec9c2e19_F(l2_V0))
; [eval] elems_ec9c2e19_F(l1_V0) ++ elems_ec9c2e19_F(l2_V0)
; [eval] elems_ec9c2e19_F(l1_V0)
(push) ; 11
(pop) ; 11
; Joined path conditions
; [eval] elems_ec9c2e19_F(l2_V0)
(push) ; 11
(assert (elems_ec9c2e19_F%precondition ($Snap.first ($Snap.second $t@4@01)) l2_V0@3@01))
(pop) ; 11
; Joined path conditions
(assert (elems_ec9c2e19_F%precondition ($Snap.first ($Snap.second $t@4@01)) l2_V0@3@01))
(push) ; 11
(assert (not (Seq_equal
  (elems_ec9c2e19_F ($Snap.first ($Snap.second ($Snap.first $t@19@01))) l1_V0@2@01)
  (Seq_append
    (elems_ec9c2e19_F ($Snap.first $t@4@01) l1_V0@2@01)
    (elems_ec9c2e19_F ($Snap.first ($Snap.second $t@4@01)) l2_V0@3@01)))))
(check-sat)
; unsat
(pop) ; 11
; 0.37s
; (get-info :all-statistics)
(assert (Seq_equal
  (elems_ec9c2e19_F ($Snap.first ($Snap.second ($Snap.first $t@19@01))) l1_V0@2@01)
  (Seq_append
    (elems_ec9c2e19_F ($Snap.first $t@4@01) l1_V0@2@01)
    (elems_ec9c2e19_F ($Snap.first ($Snap.second $t@4@01)) l2_V0@3@01))))
(pop) ; 10
(pop) ; 9
(pop) ; 8
(push) ; 8
; [else-branch: 15 | joined_unfolding@30@01]
(assert (as joined_unfolding@30@01  Bool))
(pop) ; 8
(pop) ; 7
(pop) ; 6
(pop) ; 5
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 0 | First:(Second:(First:($t@4@01))) == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$(_)]
(assert (=
  ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.first $t@4@01))))
  (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))
(assert (= ($Snap.second ($Snap.second ($Snap.first $t@4@01))) $Snap.unit))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (Mem_ec9c2e19_PMList%trigger ($Snap.first $t@4@01) l1_V0@2@01))
; [eval] (ShStructget1of2(l1_V0_CN0): Ref).PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget1of2(l1_V0_CN0): Ref)
; [eval] shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()
(set-option :timeout 0)
(push) ; 4
(pop) ; 4
; Joined path conditions
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (=
    ($SortWrappers.$SnapToShStruct2<Ref~_Ref> ($Snap.first ($Snap.second ($Snap.first $t@4@01))))
    (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit)))))
(check-sat)
; unknown
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
; [then-branch: 18 | First:(Second:(First:($t@4@01))) == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 18 | First:(Second:(First:($t@4@01))) != shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 18 | First:(Second:(First:($t@4@01))) == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$(_)]
; [exec]
; (ShStructget1of2(l1_V0_CN0): Ref).PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$$_E_$$$ := l2_V0_CN1
; [eval] (ShStructget1of2(l1_V0_CN0): Ref)
; [exec]
; fold acc(Mem_ec9c2e19_PMList(l1_V0_CN0), write)
; [eval] (ShStructget0of2(start_V0): Ref)
; [eval] (ShStructget1of2(start_V0): Ref)
; [eval] !((ShStructget1of2(start_V0): Ref).PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget1of2(start_V0): Ref).PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget1of2(start_V0): Ref)
; [eval] shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()
(push) ; 5
(pop) ; 5
; Joined path conditions
(push) ; 5
(set-option :timeout 10)
(assert (not (=
  l2_V0@3@01
  (shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$ $Snap.unit))))
(check-sat)
; unknown
(pop) ; 5
; 0.00s
; (get-info :all-statistics)
; [then-branch: 19 | l2_V0@3@01 != shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$(_) | live]
; [else-branch: 19 | l2_V0@3@01 == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$(_) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 19 | l2_V0@3@01 != shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$(_)]
; [eval] (ShStructget1of2(start_V0): Ref)
(assert (Mem_ec9c2e19_PMList%trigger ($Snap.combine
  ($Snap.first ($Snap.first $t@4@01))
  ($Snap.combine
    ($SortWrappers.ShStruct2<Ref~_Ref>To$Snap l2_V0@3@01)
    ($Snap.first ($Snap.second $t@4@01)))) l1_V0@2@01))
; [exec]
; label returnLabel
; [eval] elems_ec9c2e19_F(l1_V0) == old(elems_ec9c2e19_F(l1_V0) ++ elems_ec9c2e19_F(l2_V0))
; [eval] elems_ec9c2e19_F(l1_V0)
(push) ; 6
(assert (elems_ec9c2e19_F%precondition ($Snap.combine
  ($Snap.first ($Snap.first $t@4@01))
  ($Snap.combine
    ($SortWrappers.ShStruct2<Ref~_Ref>To$Snap l2_V0@3@01)
    ($Snap.first ($Snap.second $t@4@01)))) l1_V0@2@01))
(pop) ; 6
; Joined path conditions
(assert (elems_ec9c2e19_F%precondition ($Snap.combine
  ($Snap.first ($Snap.first $t@4@01))
  ($Snap.combine
    ($SortWrappers.ShStruct2<Ref~_Ref>To$Snap l2_V0@3@01)
    ($Snap.first ($Snap.second $t@4@01)))) l1_V0@2@01))
; [eval] old(elems_ec9c2e19_F(l1_V0) ++ elems_ec9c2e19_F(l2_V0))
; [eval] elems_ec9c2e19_F(l1_V0) ++ elems_ec9c2e19_F(l2_V0)
; [eval] elems_ec9c2e19_F(l1_V0)
(push) ; 6
(assert (elems_ec9c2e19_F%precondition ($Snap.first $t@4@01) l1_V0@2@01))
(pop) ; 6
; Joined path conditions
(assert (elems_ec9c2e19_F%precondition ($Snap.first $t@4@01) l1_V0@2@01))
; [eval] elems_ec9c2e19_F(l2_V0)
(push) ; 6
(assert (elems_ec9c2e19_F%precondition ($Snap.first ($Snap.second $t@4@01)) l2_V0@3@01))
(pop) ; 6
; Joined path conditions
(assert (elems_ec9c2e19_F%precondition ($Snap.first ($Snap.second $t@4@01)) l2_V0@3@01))
(push) ; 6
(assert (not (Seq_equal
  (elems_ec9c2e19_F ($Snap.combine
    ($Snap.first ($Snap.first $t@4@01))
    ($Snap.combine
      ($SortWrappers.ShStruct2<Ref~_Ref>To$Snap l2_V0@3@01)
      ($Snap.first ($Snap.second $t@4@01)))) l1_V0@2@01)
  (Seq_append
    (elems_ec9c2e19_F ($Snap.first $t@4@01) l1_V0@2@01)
    (elems_ec9c2e19_F ($Snap.first ($Snap.second $t@4@01)) l2_V0@3@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0.00s
; (get-info :all-statistics)
(assert (Seq_equal
  (elems_ec9c2e19_F ($Snap.combine
    ($Snap.first ($Snap.first $t@4@01))
    ($Snap.combine
      ($SortWrappers.ShStruct2<Ref~_Ref>To$Snap l2_V0@3@01)
      ($Snap.first ($Snap.second $t@4@01)))) l1_V0@2@01)
  (Seq_append
    (elems_ec9c2e19_F ($Snap.first $t@4@01) l1_V0@2@01)
    (elems_ec9c2e19_F ($Snap.first ($Snap.second $t@4@01)) l2_V0@3@01))))
(pop) ; 5
(pop) ; 4
; [eval] !((ShStructget1of2(l1_V0_CN0): Ref).PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$())
; [eval] (ShStructget1of2(l1_V0_CN0): Ref).PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$$_E_$$$ == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()
; [eval] (ShStructget1of2(l1_V0_CN0): Ref)
; [eval] shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$()
(push) ; 4
(pop) ; 4
; Joined path conditions
; [then-branch: 20 | First:(Second:(First:($t@4@01))) != shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$(_) | dead]
; [else-branch: 20 | First:(Second:(First:($t@4@01))) == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$(_) | live]
(push) ; 4
; [else-branch: 20 | First:(Second:(First:($t@4@01))) == shStructDefault_$valA_Intint$$$_S_$$$_nextA_PointerDefinedList_ec9c2e19_T$$$_S_$$$$$$_S_$$$$(_)]
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
