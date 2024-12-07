(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:17:59
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0170.vpr
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
(declare-sort Set<$Ref> 0)
(declare-sort Set<Int> 0)
(declare-sort Set<Seq<$Ref>> 0)
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
(declare-fun Set_card (Set<$Ref>) Int)
(declare-const Set_empty Set<$Ref>)
(declare-fun Set_in ($Ref Set<$Ref>) Bool)
(declare-fun Set_singleton ($Ref) Set<$Ref>)
(declare-fun Set_unionone (Set<$Ref> $Ref) Set<$Ref>)
(declare-fun Set_union (Set<$Ref> Set<$Ref>) Set<$Ref>)
(declare-fun Set_intersection (Set<$Ref> Set<$Ref>) Set<$Ref>)
(declare-fun Set_difference (Set<$Ref> Set<$Ref>) Set<$Ref>)
(declare-fun Set_subset (Set<$Ref> Set<$Ref>) Bool)
(declare-fun Set_equal (Set<$Ref> Set<$Ref>) Bool)
(declare-fun Set_skolem_diff (Set<$Ref> Set<$Ref>) $Ref)
(declare-fun Set_card (Set<Int>) Int)
(declare-const Set_empty Set<Int>)
(declare-fun Set_in (Int Set<Int>) Bool)
(declare-fun Set_singleton (Int) Set<Int>)
(declare-fun Set_unionone (Set<Int> Int) Set<Int>)
(declare-fun Set_union (Set<Int> Set<Int>) Set<Int>)
(declare-fun Set_intersection (Set<Int> Set<Int>) Set<Int>)
(declare-fun Set_difference (Set<Int> Set<Int>) Set<Int>)
(declare-fun Set_subset (Set<Int> Set<Int>) Bool)
(declare-fun Set_equal (Set<Int> Set<Int>) Bool)
(declare-fun Set_skolem_diff (Set<Int> Set<Int>) Int)
(declare-fun Set_card (Set<Seq<$Ref>>) Int)
(declare-const Set_empty Set<Seq<$Ref>>)
(declare-fun Set_in (Seq<$Ref> Set<Seq<$Ref>>) Bool)
(declare-fun Set_singleton (Seq<$Ref>) Set<Seq<$Ref>>)
(declare-fun Set_unionone (Set<Seq<$Ref>> Seq<$Ref>) Set<Seq<$Ref>>)
(declare-fun Set_union (Set<Seq<$Ref>> Set<Seq<$Ref>>) Set<Seq<$Ref>>)
(declare-fun Set_intersection (Set<Seq<$Ref>> Set<Seq<$Ref>>) Set<Seq<$Ref>>)
(declare-fun Set_difference (Set<Seq<$Ref>> Set<Seq<$Ref>>) Set<Seq<$Ref>>)
(declare-fun Set_subset (Set<Seq<$Ref>> Set<Seq<$Ref>>) Bool)
(declare-fun Set_equal (Set<Seq<$Ref>> Set<Seq<$Ref>>) Bool)
(declare-fun Set_skolem_diff (Set<Seq<$Ref>> Set<Seq<$Ref>>) Seq<$Ref>)
(declare-fun Set_card (Set<$Snap>) Int)
(declare-const Set_empty Set<$Snap>)
(declare-fun Set_in ($Snap Set<$Snap>) Bool)
(declare-fun Set_singleton ($Snap) Set<$Snap>)
(declare-fun Set_unionone (Set<$Snap> $Snap) Set<$Snap>)
(declare-fun Set_union (Set<$Snap> Set<$Snap>) Set<$Snap>)
(declare-fun Set_intersection (Set<$Snap> Set<$Snap>) Set<$Snap>)
(declare-fun Set_difference (Set<$Snap> Set<$Snap>) Set<$Snap>)
(declare-fun Set_subset (Set<$Snap> Set<$Snap>) Bool)
(declare-fun Set_equal (Set<$Snap> Set<$Snap>) Bool)
(declare-fun Set_skolem_diff (Set<$Snap> Set<$Snap>) $Snap)
(declare-fun Seq_length (Seq<$Ref>) Int)
(declare-const Seq_empty Seq<$Ref>)
(declare-fun Seq_singleton ($Ref) Seq<$Ref>)
(declare-fun Seq_append (Seq<$Ref> Seq<$Ref>) Seq<$Ref>)
(declare-fun Seq_index (Seq<$Ref> Int) $Ref)
(declare-fun Seq_add (Int Int) Int)
(declare-fun Seq_sub (Int Int) Int)
(declare-fun Seq_update (Seq<$Ref> Int $Ref) Seq<$Ref>)
(declare-fun Seq_take (Seq<$Ref> Int) Seq<$Ref>)
(declare-fun Seq_drop (Seq<$Ref> Int) Seq<$Ref>)
(declare-fun Seq_contains (Seq<$Ref> $Ref) Bool)
(declare-fun Seq_contains_trigger (Seq<$Ref> $Ref) Bool)
(declare-fun Seq_skolem (Seq<$Ref> $Ref) Int)
(declare-fun Seq_equal (Seq<$Ref> Seq<$Ref>) Bool)
(declare-fun Seq_skolem_diff (Seq<$Ref> Seq<$Ref>) Int)
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
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun List%trigger ($Snap $Ref) Bool)
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
(assert (forall ((s Seq<$Ref>)) (!
  (<= 0 (Seq_length s))
  :pattern ((Seq_length s))
  )))
(assert (= (Seq_length (as Seq_empty  Seq<$Ref>)) 0))
(assert (forall ((s Seq<$Ref>)) (!
  (=> (= (Seq_length s) 0) (= s (as Seq_empty  Seq<$Ref>)))
  :pattern ((Seq_length s))
  )))
(assert (forall ((e $Ref)) (!
  (= (Seq_length (Seq_singleton e)) 1)
  :pattern ((Seq_singleton e))
  )))
(assert (forall ((s0 Seq<$Ref>) (s1 Seq<$Ref>)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<$Ref>)))
      (not (= s1 (as Seq_empty  Seq<$Ref>))))
    (= (Seq_length (Seq_append s0 s1)) (+ (Seq_length s0) (Seq_length s1))))
  :pattern ((Seq_length (Seq_append s0 s1)))
  )))
(assert (forall ((s0 Seq<$Ref>) (s1 Seq<$Ref>)) (!
  (and
    (=> (= s0 (as Seq_empty  Seq<$Ref>)) (= (Seq_append s0 s1) s1))
    (=> (= s1 (as Seq_empty  Seq<$Ref>)) (= (Seq_append s0 s1) s0)))
  :pattern ((Seq_append s0 s1))
  )))
(assert (forall ((e $Ref)) (!
  (= (Seq_index (Seq_singleton e) 0) e)
  :pattern ((Seq_singleton e))
  )))
(assert (forall ((i Int) (j Int)) (!
  (= (Seq_add i j) (+ i j))
  :pattern ((Seq_add i j))
  )))
(assert (forall ((i Int) (j Int)) (!
  (= (Seq_sub i j) (- i j))
  :pattern ((Seq_sub i j))
  )))
(assert (forall ((s0 Seq<$Ref>) (s1 Seq<$Ref>) (n Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<$Ref>)))
      (and
        (not (= s1 (as Seq_empty  Seq<$Ref>)))
        (and (<= 0 n) (< n (Seq_length s0)))))
    (= (Seq_index (Seq_append s0 s1) n) (Seq_index s0 n)))
  :pattern ((Seq_index (Seq_append s0 s1) n))
  :pattern ((Seq_index s0 n) (Seq_append s0 s1))
  )))
(assert (forall ((s0 Seq<$Ref>) (s1 Seq<$Ref>) (n Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<$Ref>)))
      (and
        (not (= s1 (as Seq_empty  Seq<$Ref>)))
        (and (<= (Seq_length s0) n) (< n (Seq_length (Seq_append s0 s1))))))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s0)) (Seq_length s0)) n)
      (=
        (Seq_index (Seq_append s0 s1) n)
        (Seq_index s1 (Seq_sub n (Seq_length s0))))))
  :pattern ((Seq_index (Seq_append s0 s1) n))
  )))
(assert (forall ((s0 Seq<$Ref>) (s1 Seq<$Ref>) (m Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<$Ref>)))
      (and
        (not (= s1 (as Seq_empty  Seq<$Ref>)))
        (and (<= 0 m) (< m (Seq_length s1)))))
    (and
      (= (Seq_sub (Seq_add m (Seq_length s0)) (Seq_length s0)) m)
      (=
        (Seq_index (Seq_append s0 s1) (Seq_add m (Seq_length s0)))
        (Seq_index s1 m))))
  :pattern ((Seq_index s1 m) (Seq_append s0 s1))
  )))
(assert (forall ((s Seq<$Ref>) (i Int) (v $Ref)) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (= (Seq_length (Seq_update s i v)) (Seq_length s)))
  :pattern ((Seq_length (Seq_update s i v)))
  :pattern ((Seq_length s) (Seq_update s i v))
  )))
(assert (forall ((s Seq<$Ref>) (i Int) (v $Ref) (n Int)) (!
  (=>
    (and (<= 0 n) (< n (Seq_length s)))
    (and
      (=> (= i n) (= (Seq_index (Seq_update s i v) n) v))
      (=> (not (= i n)) (= (Seq_index (Seq_update s i v) n) (Seq_index s n)))))
  :pattern ((Seq_index (Seq_update s i v) n))
  :pattern ((Seq_index s n) (Seq_update s i v))
  )))
(assert (forall ((s Seq<$Ref>) (n Int)) (!
  (and
    (=>
      (<= 0 n)
      (and
        (=> (<= n (Seq_length s)) (= (Seq_length (Seq_take s n)) n))
        (=> (< (Seq_length s) n) (= (Seq_length (Seq_take s n)) (Seq_length s)))))
    (=> (< n 0) (= (Seq_length (Seq_take s n)) 0)))
  :pattern ((Seq_length (Seq_take s n)))
  :pattern ((Seq_take s n) (Seq_length s))
  )))
(assert (forall ((s Seq<$Ref>) (n Int) (j Int)) (!
  (=>
    (and (<= 0 j) (and (< j n) (< j (Seq_length s))))
    (= (Seq_index (Seq_take s n) j) (Seq_index s j)))
  :pattern ((Seq_index (Seq_take s n) j))
  :pattern ((Seq_index s j) (Seq_take s n))
  )))
(assert (forall ((s Seq<$Ref>) (n Int)) (!
  (and
    (=>
      (<= 0 n)
      (and
        (=>
          (<= n (Seq_length s))
          (= (Seq_length (Seq_drop s n)) (- (Seq_length s) n)))
        (=> (< (Seq_length s) n) (= (Seq_length (Seq_drop s n)) 0))))
    (=> (< n 0) (= (Seq_length (Seq_drop s n)) (Seq_length s))))
  :pattern ((Seq_length (Seq_drop s n)))
  :pattern ((Seq_length s) (Seq_drop s n))
  )))
(assert (forall ((s Seq<$Ref>) (n Int) (j Int)) (!
  (=>
    (and (< 0 n) (and (<= 0 j) (< j (- (Seq_length s) n))))
    (and
      (= (Seq_sub (Seq_add j n) n) j)
      (= (Seq_index (Seq_drop s n) j) (Seq_index s (Seq_add j n)))))
  :pattern ((Seq_index (Seq_drop s n) j))
  )))
(assert (forall ((s Seq<$Ref>) (n Int) (i Int)) (!
  (=>
    (and (< 0 n) (and (<= n i) (< i (Seq_length s))))
    (and
      (= (Seq_add (Seq_sub i n) n) i)
      (= (Seq_index (Seq_drop s n) (Seq_sub i n)) (Seq_index s i))))
  :pattern ((Seq_drop s n) (Seq_index s i))
  )))
(assert (forall ((s Seq<$Ref>) (t Seq<$Ref>) (n Int)) (!
  (=>
    (and (< 0 n) (<= n (Seq_length s)))
    (= (Seq_take (Seq_append s t) n) (Seq_take s n)))
  :pattern ((Seq_take (Seq_append s t) n))
  )))
(assert (forall ((s Seq<$Ref>) (t Seq<$Ref>) (n Int)) (!
  (=>
    (and (> n 0) (> n (Seq_length s)))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s)) (Seq_length s)) n)
      (=
        (Seq_take (Seq_append s t) n)
        (Seq_append s (Seq_take t (Seq_sub n (Seq_length s)))))))
  :pattern ((Seq_take (Seq_append s t) n))
  )))
(assert (forall ((s Seq<$Ref>) (t Seq<$Ref>) (n Int)) (!
  (=>
    (and (< 0 n) (<= n (Seq_length s)))
    (= (Seq_drop (Seq_append s t) n) (Seq_append (Seq_drop s n) t)))
  :pattern ((Seq_drop (Seq_append s t) n))
  )))
(assert (forall ((s Seq<$Ref>) (t Seq<$Ref>) (n Int)) (!
  (=>
    (and (> n 0) (> n (Seq_length s)))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s)) (Seq_length s)) n)
      (= (Seq_drop (Seq_append s t) n) (Seq_drop t (Seq_sub n (Seq_length s))))))
  :pattern ((Seq_drop (Seq_append s t) n))
  )))
(assert (forall ((s Seq<$Ref>) (n Int)) (!
  (=> (<= n 0) (= (Seq_take s n) (as Seq_empty  Seq<$Ref>)))
  :pattern ((Seq_take s n))
  )))
(assert (forall ((s Seq<$Ref>) (n Int)) (!
  (=> (<= n 0) (= (Seq_drop s n) s))
  :pattern ((Seq_drop s n))
  )))
(assert (forall ((s Seq<$Ref>) (n Int)) (!
  (=> (>= n (Seq_length s)) (= (Seq_take s n) s))
  :pattern ((Seq_take s n))
  )))
(assert (forall ((s Seq<$Ref>) (n Int)) (!
  (=> (>= n (Seq_length s)) (= (Seq_drop s n) (as Seq_empty  Seq<$Ref>)))
  :pattern ((Seq_drop s n))
  )))
(assert (forall ((s Seq<$Ref>) (x $Ref)) (!
  (=>
    (Seq_contains s x)
    (and
      (<= 0 (Seq_skolem s x))
      (and
        (< (Seq_skolem s x) (Seq_length s))
        (= (Seq_index s (Seq_skolem s x)) x))))
  :pattern ((Seq_contains s x))
  )))
(assert (forall ((s Seq<$Ref>) (x $Ref) (i Int)) (!
  (=>
    (and (<= 0 i) (and (< i (Seq_length s)) (= (Seq_index s i) x)))
    (Seq_contains s x))
  :pattern ((Seq_contains s x) (Seq_index s i))
  )))
(assert (forall ((s Seq<$Ref>) (i Int)) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (Seq_contains_trigger s (Seq_index s i)))
  :pattern ((Seq_index s i))
  )))
(assert (forall ((s0 Seq<$Ref>) (s1 Seq<$Ref>)) (!
  (or
    (and (= s0 s1) (Seq_equal s0 s1))
    (or
      (and
        (not (= s0 s1))
        (and (not (Seq_equal s0 s1)) (not (= (Seq_length s0) (Seq_length s1)))))
      (and
        (not (= s0 s1))
        (and
          (not (Seq_equal s0 s1))
          (and
            (= (Seq_length s0) (Seq_length s1))
            (and
              (= (Seq_skolem_diff s0 s1) (Seq_skolem_diff s1 s0))
              (and
                (<= 0 (Seq_skolem_diff s0 s1))
                (and
                  (< (Seq_skolem_diff s0 s1) (Seq_length s0))
                  (not
                    (=
                      (Seq_index s0 (Seq_skolem_diff s0 s1))
                      (Seq_index s1 (Seq_skolem_diff s0 s1))))))))))))
  :pattern ((Seq_equal s0 s1))
  )))
(assert (forall ((a Seq<$Ref>) (b Seq<$Ref>)) (!
  (=> (Seq_equal a b) (= a b))
  :pattern ((Seq_equal a b))
  )))
(assert (forall ((x $Ref) (y $Ref)) (!
  (= (Seq_contains (Seq_singleton x) y) (= x y))
  :pattern ((Seq_contains (Seq_singleton x) y))
  )))
(assert (forall ((s Set<$Ref>)) (!
  (<= 0 (Set_card s))
  :pattern ((Set_card s))
  )))
(assert (forall ((o $Ref)) (!
  (not (Set_in o (as Set_empty  Set<$Ref>)))
  :pattern ((Set_in o (as Set_empty  Set<$Ref>)))
  )))
(assert (forall ((s Set<$Ref>)) (!
  (and
    (=> (= (Set_card s) 0) (= s (as Set_empty  Set<$Ref>)))
    (=> (not (= (Set_card s) 0)) (exists ((x $Ref))  (Set_in x s))))
  :pattern ((Set_card s))
  )))
(assert (forall ((r $Ref)) (!
  (Set_in r (Set_singleton r))
  :pattern ((Set_singleton r))
  )))
(assert (forall ((r $Ref) (o $Ref)) (!
  (= (Set_in o (Set_singleton r)) (= r o))
  :pattern ((Set_in o (Set_singleton r)))
  )))
(assert (forall ((r $Ref)) (!
  (= (Set_card (Set_singleton r)) 1)
  :pattern ((Set_card (Set_singleton r)))
  )))
(assert (forall ((a Set<$Ref>) (x $Ref) (o $Ref)) (!
  (= (Set_in o (Set_unionone a x)) (or (= o x) (Set_in o a)))
  :pattern ((Set_in o (Set_unionone a x)))
  )))
(assert (forall ((a Set<$Ref>) (x $Ref)) (!
  (Set_in x (Set_unionone a x))
  :pattern ((Set_unionone a x))
  )))
(assert (forall ((a Set<$Ref>) (x $Ref) (y $Ref)) (!
  (=> (Set_in y a) (Set_in y (Set_unionone a x)))
  :pattern ((Set_unionone a x) (Set_in y a))
  )))
(assert (forall ((a Set<$Ref>) (x $Ref)) (!
  (=> (Set_in x a) (= (Set_card (Set_unionone a x)) (Set_card a)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<$Ref>) (x $Ref)) (!
  (=> (not (Set_in x a)) (= (Set_card (Set_unionone a x)) (+ (Set_card a) 1)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>) (o $Ref)) (!
  (= (Set_in o (Set_union a b)) (or (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_union a b)))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>) (y $Ref)) (!
  (=> (Set_in y a) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y a))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>) (y $Ref)) (!
  (=> (Set_in y b) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y b))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>) (o $Ref)) (!
  (= (Set_in o (Set_intersection a b)) (and (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_intersection a b)))
  :pattern ((Set_intersection a b) (Set_in o a))
  :pattern ((Set_intersection a b) (Set_in o b))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>)) (!
  (= (Set_union (Set_union a b) b) (Set_union a b))
  :pattern ((Set_union (Set_union a b) b))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>)) (!
  (= (Set_union a (Set_union a b)) (Set_union a b))
  :pattern ((Set_union a (Set_union a b)))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>)) (!
  (= (Set_intersection (Set_intersection a b) b) (Set_intersection a b))
  :pattern ((Set_intersection (Set_intersection a b) b))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>)) (!
  (= (Set_intersection a (Set_intersection a b)) (Set_intersection a b))
  :pattern ((Set_intersection a (Set_intersection a b)))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>)) (!
  (=
    (+ (Set_card (Set_union a b)) (Set_card (Set_intersection a b)))
    (+ (Set_card a) (Set_card b)))
  :pattern ((Set_card (Set_union a b)))
  :pattern ((Set_card (Set_intersection a b)))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>) (o $Ref)) (!
  (= (Set_in o (Set_difference a b)) (and (Set_in o a) (not (Set_in o b))))
  :pattern ((Set_in o (Set_difference a b)))
  :pattern ((Set_difference a b) (Set_in o a))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>) (y $Ref)) (!
  (=> (Set_in y b) (not (Set_in y (Set_difference a b))))
  :pattern ((Set_difference a b) (Set_in y b))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>)) (!
  (and
    (=
      (+
        (+ (Set_card (Set_difference a b)) (Set_card (Set_difference b a)))
        (Set_card (Set_intersection a b)))
      (Set_card (Set_union a b)))
    (=
      (Set_card (Set_difference a b))
      (- (Set_card a) (Set_card (Set_intersection a b)))))
  :pattern ((Set_card (Set_difference a b)))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>)) (!
  (=
    (Set_subset a b)
    (forall ((o $Ref)) (!
      (=> (Set_in o a) (Set_in o b))
      :pattern ((Set_in o a))
      :pattern ((Set_in o b))
      )))
  :pattern ((Set_subset a b))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>)) (!
  (or
    (and (Set_equal a b) (= a b))
    (and
      (not (Set_equal a b))
      (and
        (not (= a b))
        (and
          (= (Set_skolem_diff a b) (Set_skolem_diff b a))
          (not
            (= (Set_in (Set_skolem_diff a b) a) (Set_in (Set_skolem_diff a b) b)))))))
  :pattern ((Set_equal a b))
  )))
(assert (forall ((a Set<$Ref>) (b Set<$Ref>)) (!
  (=> (Set_equal a b) (= a b))
  :pattern ((Set_equal a b))
  )))
(assert (forall ((s Set<Int>)) (!
  (<= 0 (Set_card s))
  :pattern ((Set_card s))
  )))
(assert (forall ((o Int)) (!
  (not (Set_in o (as Set_empty  Set<Int>)))
  :pattern ((Set_in o (as Set_empty  Set<Int>)))
  )))
(assert (forall ((s Set<Int>)) (!
  (and
    (=> (= (Set_card s) 0) (= s (as Set_empty  Set<Int>)))
    (=> (not (= (Set_card s) 0)) (exists ((x Int))  (Set_in x s))))
  :pattern ((Set_card s))
  )))
(assert (forall ((r Int)) (!
  (Set_in r (Set_singleton r))
  :pattern ((Set_singleton r))
  )))
(assert (forall ((r Int) (o Int)) (!
  (= (Set_in o (Set_singleton r)) (= r o))
  :pattern ((Set_in o (Set_singleton r)))
  )))
(assert (forall ((r Int)) (!
  (= (Set_card (Set_singleton r)) 1)
  :pattern ((Set_card (Set_singleton r)))
  )))
(assert (forall ((a Set<Int>) (x Int) (o Int)) (!
  (= (Set_in o (Set_unionone a x)) (or (= o x) (Set_in o a)))
  :pattern ((Set_in o (Set_unionone a x)))
  )))
(assert (forall ((a Set<Int>) (x Int)) (!
  (Set_in x (Set_unionone a x))
  :pattern ((Set_unionone a x))
  )))
(assert (forall ((a Set<Int>) (x Int) (y Int)) (!
  (=> (Set_in y a) (Set_in y (Set_unionone a x)))
  :pattern ((Set_unionone a x) (Set_in y a))
  )))
(assert (forall ((a Set<Int>) (x Int)) (!
  (=> (Set_in x a) (= (Set_card (Set_unionone a x)) (Set_card a)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Int>) (x Int)) (!
  (=> (not (Set_in x a)) (= (Set_card (Set_unionone a x)) (+ (Set_card a) 1)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Int>) (b Set<Int>) (o Int)) (!
  (= (Set_in o (Set_union a b)) (or (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_union a b)))
  )))
(assert (forall ((a Set<Int>) (b Set<Int>) (y Int)) (!
  (=> (Set_in y a) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y a))
  )))
(assert (forall ((a Set<Int>) (b Set<Int>) (y Int)) (!
  (=> (Set_in y b) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y b))
  )))
(assert (forall ((a Set<Int>) (b Set<Int>) (o Int)) (!
  (= (Set_in o (Set_intersection a b)) (and (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_intersection a b)))
  :pattern ((Set_intersection a b) (Set_in o a))
  :pattern ((Set_intersection a b) (Set_in o b))
  )))
(assert (forall ((a Set<Int>) (b Set<Int>)) (!
  (= (Set_union (Set_union a b) b) (Set_union a b))
  :pattern ((Set_union (Set_union a b) b))
  )))
(assert (forall ((a Set<Int>) (b Set<Int>)) (!
  (= (Set_union a (Set_union a b)) (Set_union a b))
  :pattern ((Set_union a (Set_union a b)))
  )))
(assert (forall ((a Set<Int>) (b Set<Int>)) (!
  (= (Set_intersection (Set_intersection a b) b) (Set_intersection a b))
  :pattern ((Set_intersection (Set_intersection a b) b))
  )))
(assert (forall ((a Set<Int>) (b Set<Int>)) (!
  (= (Set_intersection a (Set_intersection a b)) (Set_intersection a b))
  :pattern ((Set_intersection a (Set_intersection a b)))
  )))
(assert (forall ((a Set<Int>) (b Set<Int>)) (!
  (=
    (+ (Set_card (Set_union a b)) (Set_card (Set_intersection a b)))
    (+ (Set_card a) (Set_card b)))
  :pattern ((Set_card (Set_union a b)))
  :pattern ((Set_card (Set_intersection a b)))
  )))
(assert (forall ((a Set<Int>) (b Set<Int>) (o Int)) (!
  (= (Set_in o (Set_difference a b)) (and (Set_in o a) (not (Set_in o b))))
  :pattern ((Set_in o (Set_difference a b)))
  :pattern ((Set_difference a b) (Set_in o a))
  )))
(assert (forall ((a Set<Int>) (b Set<Int>) (y Int)) (!
  (=> (Set_in y b) (not (Set_in y (Set_difference a b))))
  :pattern ((Set_difference a b) (Set_in y b))
  )))
(assert (forall ((a Set<Int>) (b Set<Int>)) (!
  (and
    (=
      (+
        (+ (Set_card (Set_difference a b)) (Set_card (Set_difference b a)))
        (Set_card (Set_intersection a b)))
      (Set_card (Set_union a b)))
    (=
      (Set_card (Set_difference a b))
      (- (Set_card a) (Set_card (Set_intersection a b)))))
  :pattern ((Set_card (Set_difference a b)))
  )))
(assert (forall ((a Set<Int>) (b Set<Int>)) (!
  (=
    (Set_subset a b)
    (forall ((o Int)) (!
      (=> (Set_in o a) (Set_in o b))
      :pattern ((Set_in o a))
      :pattern ((Set_in o b))
      )))
  :pattern ((Set_subset a b))
  )))
(assert (forall ((a Set<Int>) (b Set<Int>)) (!
  (or
    (and (Set_equal a b) (= a b))
    (and
      (not (Set_equal a b))
      (and
        (not (= a b))
        (and
          (= (Set_skolem_diff a b) (Set_skolem_diff b a))
          (not
            (= (Set_in (Set_skolem_diff a b) a) (Set_in (Set_skolem_diff a b) b)))))))
  :pattern ((Set_equal a b))
  )))
(assert (forall ((a Set<Int>) (b Set<Int>)) (!
  (=> (Set_equal a b) (= a b))
  :pattern ((Set_equal a b))
  )))
(assert (forall ((s Set<Seq<$Ref>>)) (!
  (<= 0 (Set_card s))
  :pattern ((Set_card s))
  )))
(assert (forall ((o Seq<$Ref>)) (!
  (not (Set_in o (as Set_empty  Set<Seq<$Ref>>)))
  :pattern ((Set_in o (as Set_empty  Set<Seq<$Ref>>)))
  )))
(assert (forall ((s Set<Seq<$Ref>>)) (!
  (and
    (=> (= (Set_card s) 0) (= s (as Set_empty  Set<Seq<$Ref>>)))
    (=> (not (= (Set_card s) 0)) (exists ((x Seq<$Ref>))  (Set_in x s))))
  :pattern ((Set_card s))
  )))
(assert (forall ((r Seq<$Ref>)) (!
  (Set_in r (Set_singleton r))
  :pattern ((Set_singleton r))
  )))
(assert (forall ((r Seq<$Ref>) (o Seq<$Ref>)) (!
  (= (Set_in o (Set_singleton r)) (= r o))
  :pattern ((Set_in o (Set_singleton r)))
  )))
(assert (forall ((r Seq<$Ref>)) (!
  (= (Set_card (Set_singleton r)) 1)
  :pattern ((Set_card (Set_singleton r)))
  )))
(assert (forall ((a Set<Seq<$Ref>>) (x Seq<$Ref>) (o Seq<$Ref>)) (!
  (= (Set_in o (Set_unionone a x)) (or (= o x) (Set_in o a)))
  :pattern ((Set_in o (Set_unionone a x)))
  )))
(assert (forall ((a Set<Seq<$Ref>>) (x Seq<$Ref>)) (!
  (Set_in x (Set_unionone a x))
  :pattern ((Set_unionone a x))
  )))
(assert (forall ((a Set<Seq<$Ref>>) (x Seq<$Ref>) (y Seq<$Ref>)) (!
  (=> (Set_in y a) (Set_in y (Set_unionone a x)))
  :pattern ((Set_unionone a x) (Set_in y a))
  )))
(assert (forall ((a Set<Seq<$Ref>>) (x Seq<$Ref>)) (!
  (=> (Set_in x a) (= (Set_card (Set_unionone a x)) (Set_card a)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Seq<$Ref>>) (x Seq<$Ref>)) (!
  (=> (not (Set_in x a)) (= (Set_card (Set_unionone a x)) (+ (Set_card a) 1)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Seq<$Ref>>) (b Set<Seq<$Ref>>) (o Seq<$Ref>)) (!
  (= (Set_in o (Set_union a b)) (or (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_union a b)))
  )))
(assert (forall ((a Set<Seq<$Ref>>) (b Set<Seq<$Ref>>) (y Seq<$Ref>)) (!
  (=> (Set_in y a) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y a))
  )))
(assert (forall ((a Set<Seq<$Ref>>) (b Set<Seq<$Ref>>) (y Seq<$Ref>)) (!
  (=> (Set_in y b) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y b))
  )))
(assert (forall ((a Set<Seq<$Ref>>) (b Set<Seq<$Ref>>) (o Seq<$Ref>)) (!
  (= (Set_in o (Set_intersection a b)) (and (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_intersection a b)))
  :pattern ((Set_intersection a b) (Set_in o a))
  :pattern ((Set_intersection a b) (Set_in o b))
  )))
(assert (forall ((a Set<Seq<$Ref>>) (b Set<Seq<$Ref>>)) (!
  (= (Set_union (Set_union a b) b) (Set_union a b))
  :pattern ((Set_union (Set_union a b) b))
  )))
(assert (forall ((a Set<Seq<$Ref>>) (b Set<Seq<$Ref>>)) (!
  (= (Set_union a (Set_union a b)) (Set_union a b))
  :pattern ((Set_union a (Set_union a b)))
  )))
(assert (forall ((a Set<Seq<$Ref>>) (b Set<Seq<$Ref>>)) (!
  (= (Set_intersection (Set_intersection a b) b) (Set_intersection a b))
  :pattern ((Set_intersection (Set_intersection a b) b))
  )))
(assert (forall ((a Set<Seq<$Ref>>) (b Set<Seq<$Ref>>)) (!
  (= (Set_intersection a (Set_intersection a b)) (Set_intersection a b))
  :pattern ((Set_intersection a (Set_intersection a b)))
  )))
(assert (forall ((a Set<Seq<$Ref>>) (b Set<Seq<$Ref>>)) (!
  (=
    (+ (Set_card (Set_union a b)) (Set_card (Set_intersection a b)))
    (+ (Set_card a) (Set_card b)))
  :pattern ((Set_card (Set_union a b)))
  :pattern ((Set_card (Set_intersection a b)))
  )))
(assert (forall ((a Set<Seq<$Ref>>) (b Set<Seq<$Ref>>) (o Seq<$Ref>)) (!
  (= (Set_in o (Set_difference a b)) (and (Set_in o a) (not (Set_in o b))))
  :pattern ((Set_in o (Set_difference a b)))
  :pattern ((Set_difference a b) (Set_in o a))
  )))
(assert (forall ((a Set<Seq<$Ref>>) (b Set<Seq<$Ref>>) (y Seq<$Ref>)) (!
  (=> (Set_in y b) (not (Set_in y (Set_difference a b))))
  :pattern ((Set_difference a b) (Set_in y b))
  )))
(assert (forall ((a Set<Seq<$Ref>>) (b Set<Seq<$Ref>>)) (!
  (and
    (=
      (+
        (+ (Set_card (Set_difference a b)) (Set_card (Set_difference b a)))
        (Set_card (Set_intersection a b)))
      (Set_card (Set_union a b)))
    (=
      (Set_card (Set_difference a b))
      (- (Set_card a) (Set_card (Set_intersection a b)))))
  :pattern ((Set_card (Set_difference a b)))
  )))
(assert (forall ((a Set<Seq<$Ref>>) (b Set<Seq<$Ref>>)) (!
  (=
    (Set_subset a b)
    (forall ((o Seq<$Ref>)) (!
      (=> (Set_in o a) (Set_in o b))
      :pattern ((Set_in o a))
      :pattern ((Set_in o b))
      )))
  :pattern ((Set_subset a b))
  )))
(assert (forall ((a Set<Seq<$Ref>>) (b Set<Seq<$Ref>>)) (!
  (or
    (and (Set_equal a b) (= a b))
    (and
      (not (Set_equal a b))
      (and
        (not (= a b))
        (and
          (= (Set_skolem_diff a b) (Set_skolem_diff b a))
          (not
            (= (Set_in (Set_skolem_diff a b) a) (Set_in (Set_skolem_diff a b) b)))))))
  :pattern ((Set_equal a b))
  )))
(assert (forall ((a Set<Seq<$Ref>>) (b Set<Seq<$Ref>>)) (!
  (=> (Set_equal a b) (= a b))
  :pattern ((Set_equal a b))
  )))
(assert (forall ((s Set<$Snap>)) (!
  (<= 0 (Set_card s))
  :pattern ((Set_card s))
  )))
(assert (forall ((o $Snap)) (!
  (not (Set_in o (as Set_empty  Set<$Snap>)))
  :pattern ((Set_in o (as Set_empty  Set<$Snap>)))
  )))
(assert (forall ((s Set<$Snap>)) (!
  (and
    (=> (= (Set_card s) 0) (= s (as Set_empty  Set<$Snap>)))
    (=> (not (= (Set_card s) 0)) (exists ((x $Snap))  (Set_in x s))))
  :pattern ((Set_card s))
  )))
(assert (forall ((r $Snap)) (!
  (Set_in r (Set_singleton r))
  :pattern ((Set_singleton r))
  )))
(assert (forall ((r $Snap) (o $Snap)) (!
  (= (Set_in o (Set_singleton r)) (= r o))
  :pattern ((Set_in o (Set_singleton r)))
  )))
(assert (forall ((r $Snap)) (!
  (= (Set_card (Set_singleton r)) 1)
  :pattern ((Set_card (Set_singleton r)))
  )))
(assert (forall ((a Set<$Snap>) (x $Snap) (o $Snap)) (!
  (= (Set_in o (Set_unionone a x)) (or (= o x) (Set_in o a)))
  :pattern ((Set_in o (Set_unionone a x)))
  )))
(assert (forall ((a Set<$Snap>) (x $Snap)) (!
  (Set_in x (Set_unionone a x))
  :pattern ((Set_unionone a x))
  )))
(assert (forall ((a Set<$Snap>) (x $Snap) (y $Snap)) (!
  (=> (Set_in y a) (Set_in y (Set_unionone a x)))
  :pattern ((Set_unionone a x) (Set_in y a))
  )))
(assert (forall ((a Set<$Snap>) (x $Snap)) (!
  (=> (Set_in x a) (= (Set_card (Set_unionone a x)) (Set_card a)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<$Snap>) (x $Snap)) (!
  (=> (not (Set_in x a)) (= (Set_card (Set_unionone a x)) (+ (Set_card a) 1)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<$Snap>) (b Set<$Snap>) (o $Snap)) (!
  (= (Set_in o (Set_union a b)) (or (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_union a b)))
  )))
(assert (forall ((a Set<$Snap>) (b Set<$Snap>) (y $Snap)) (!
  (=> (Set_in y a) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y a))
  )))
(assert (forall ((a Set<$Snap>) (b Set<$Snap>) (y $Snap)) (!
  (=> (Set_in y b) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y b))
  )))
(assert (forall ((a Set<$Snap>) (b Set<$Snap>) (o $Snap)) (!
  (= (Set_in o (Set_intersection a b)) (and (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_intersection a b)))
  :pattern ((Set_intersection a b) (Set_in o a))
  :pattern ((Set_intersection a b) (Set_in o b))
  )))
(assert (forall ((a Set<$Snap>) (b Set<$Snap>)) (!
  (= (Set_union (Set_union a b) b) (Set_union a b))
  :pattern ((Set_union (Set_union a b) b))
  )))
(assert (forall ((a Set<$Snap>) (b Set<$Snap>)) (!
  (= (Set_union a (Set_union a b)) (Set_union a b))
  :pattern ((Set_union a (Set_union a b)))
  )))
(assert (forall ((a Set<$Snap>) (b Set<$Snap>)) (!
  (= (Set_intersection (Set_intersection a b) b) (Set_intersection a b))
  :pattern ((Set_intersection (Set_intersection a b) b))
  )))
(assert (forall ((a Set<$Snap>) (b Set<$Snap>)) (!
  (= (Set_intersection a (Set_intersection a b)) (Set_intersection a b))
  :pattern ((Set_intersection a (Set_intersection a b)))
  )))
(assert (forall ((a Set<$Snap>) (b Set<$Snap>)) (!
  (=
    (+ (Set_card (Set_union a b)) (Set_card (Set_intersection a b)))
    (+ (Set_card a) (Set_card b)))
  :pattern ((Set_card (Set_union a b)))
  :pattern ((Set_card (Set_intersection a b)))
  )))
(assert (forall ((a Set<$Snap>) (b Set<$Snap>) (o $Snap)) (!
  (= (Set_in o (Set_difference a b)) (and (Set_in o a) (not (Set_in o b))))
  :pattern ((Set_in o (Set_difference a b)))
  :pattern ((Set_difference a b) (Set_in o a))
  )))
(assert (forall ((a Set<$Snap>) (b Set<$Snap>) (y $Snap)) (!
  (=> (Set_in y b) (not (Set_in y (Set_difference a b))))
  :pattern ((Set_difference a b) (Set_in y b))
  )))
(assert (forall ((a Set<$Snap>) (b Set<$Snap>)) (!
  (and
    (=
      (+
        (+ (Set_card (Set_difference a b)) (Set_card (Set_difference b a)))
        (Set_card (Set_intersection a b)))
      (Set_card (Set_union a b)))
    (=
      (Set_card (Set_difference a b))
      (- (Set_card a) (Set_card (Set_intersection a b)))))
  :pattern ((Set_card (Set_difference a b)))
  )))
(assert (forall ((a Set<$Snap>) (b Set<$Snap>)) (!
  (=
    (Set_subset a b)
    (forall ((o $Snap)) (!
      (=> (Set_in o a) (Set_in o b))
      :pattern ((Set_in o a))
      :pattern ((Set_in o b))
      )))
  :pattern ((Set_subset a b))
  )))
(assert (forall ((a Set<$Snap>) (b Set<$Snap>)) (!
  (or
    (and (Set_equal a b) (= a b))
    (and
      (not (Set_equal a b))
      (and
        (not (= a b))
        (and
          (= (Set_skolem_diff a b) (Set_skolem_diff b a))
          (not
            (= (Set_in (Set_skolem_diff a b) a) (Set_in (Set_skolem_diff a b) b)))))))
  :pattern ((Set_equal a b))
  )))
(assert (forall ((a Set<$Snap>) (b Set<$Snap>)) (!
  (=> (Set_equal a b) (= a b))
  :pattern ((Set_equal a b))
  )))
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
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- repro ----------
(declare-const this@0@01 $Ref)
(declare-const this@1@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@2@01 $Snap)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var n: Ref
(declare-const n@3@01 $Ref)
; [exec]
; unfold acc(List(this), write)
(assert (= $t@2@01 ($Snap.combine ($Snap.first $t@2@01) ($Snap.second $t@2@01))))
(assert (not (= this@1@01 $Ref.null)))
(assert (=
  ($Snap.second $t@2@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@2@01))
    ($Snap.second ($Snap.second $t@2@01)))))
(assert (= ($Snap.first ($Snap.second $t@2@01)) $Snap.unit))
; [eval] (forall i: Int, j: Int :: { this.nodes[i], this.nodes[j] } i >= 0 && (i < |this.nodes| && (j >= 0 && (j < |this.nodes| && i != j))) ==> this.nodes[i] != this.nodes[j])
(declare-const i@4@01 Int)
(declare-const j@5@01 Int)
(push) ; 3
; [eval] i >= 0 && (i < |this.nodes| && (j >= 0 && (j < |this.nodes| && i != j))) ==> this.nodes[i] != this.nodes[j]
; [eval] i >= 0 && (i < |this.nodes| && (j >= 0 && (j < |this.nodes| && i != j)))
; [eval] i >= 0
(push) ; 4
; [then-branch: 0 | !(i@4@01 >= 0) | live]
; [else-branch: 0 | i@4@01 >= 0 | live]
(push) ; 5
; [then-branch: 0 | !(i@4@01 >= 0)]
(assert (not (>= i@4@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 0 | i@4@01 >= 0]
(assert (>= i@4@01 0))
; [eval] i < |this.nodes|
; [eval] |this.nodes|
(push) ; 6
; [then-branch: 1 | !(i@4@01 < |First:($t@2@01)|) | live]
; [else-branch: 1 | i@4@01 < |First:($t@2@01)| | live]
(push) ; 7
; [then-branch: 1 | !(i@4@01 < |First:($t@2@01)|)]
(assert (not
  (< i@4@01 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))))
(pop) ; 7
(push) ; 7
; [else-branch: 1 | i@4@01 < |First:($t@2@01)|]
(assert (< i@4@01 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01)))))
; [eval] j >= 0
(push) ; 8
; [then-branch: 2 | !(j@5@01 >= 0) | live]
; [else-branch: 2 | j@5@01 >= 0 | live]
(push) ; 9
; [then-branch: 2 | !(j@5@01 >= 0)]
(assert (not (>= j@5@01 0)))
(pop) ; 9
(push) ; 9
; [else-branch: 2 | j@5@01 >= 0]
(assert (>= j@5@01 0))
; [eval] j < |this.nodes|
; [eval] |this.nodes|
(push) ; 10
; [then-branch: 3 | !(j@5@01 < |First:($t@2@01)|) | live]
; [else-branch: 3 | j@5@01 < |First:($t@2@01)| | live]
(push) ; 11
; [then-branch: 3 | !(j@5@01 < |First:($t@2@01)|)]
(assert (not
  (< j@5@01 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))))
(pop) ; 11
(push) ; 11
; [else-branch: 3 | j@5@01 < |First:($t@2@01)|]
(assert (< j@5@01 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01)))))
; [eval] i != j
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (< j@5@01 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))
  (not
    (<
      j@5@01
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01)))))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@5@01 0)
  (and
    (>= j@5@01 0)
    (or
      (<
        j@5@01
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))
      (not
        (<
          j@5@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01)))))))))
(assert (or (>= j@5@01 0) (not (>= j@5@01 0))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i@4@01 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))
  (and
    (<
      i@4@01
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))
    (=>
      (>= j@5@01 0)
      (and
        (>= j@5@01 0)
        (or
          (<
            j@5@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))
          (not
            (<
              j@5@01
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))))))
    (or (>= j@5@01 0) (not (>= j@5@01 0))))))
(assert (or
  (< i@4@01 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))
  (not
    (<
      i@4@01
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01)))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= i@4@01 0)
  (and
    (>= i@4@01 0)
    (=>
      (<
        i@4@01
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))
      (and
        (<
          i@4@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))
        (=>
          (>= j@5@01 0)
          (and
            (>= j@5@01 0)
            (or
              (<
                j@5@01
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))
              (not
                (<
                  j@5@01
                  (Seq_length
                    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))))))
        (or (>= j@5@01 0) (not (>= j@5@01 0)))))
    (or
      (<
        i@4@01
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))
      (not
        (<
          i@4@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01)))))))))
(assert (or (>= i@4@01 0) (not (>= i@4@01 0))))
(push) ; 4
; [then-branch: 4 | i@4@01 >= 0 && i@4@01 < |First:($t@2@01)| && j@5@01 >= 0 && j@5@01 < |First:($t@2@01)| && i@4@01 != j@5@01 | live]
; [else-branch: 4 | !(i@4@01 >= 0 && i@4@01 < |First:($t@2@01)| && j@5@01 >= 0 && j@5@01 < |First:($t@2@01)| && i@4@01 != j@5@01) | live]
(push) ; 5
; [then-branch: 4 | i@4@01 >= 0 && i@4@01 < |First:($t@2@01)| && j@5@01 >= 0 && j@5@01 < |First:($t@2@01)| && i@4@01 != j@5@01]
(assert (and
  (>= i@4@01 0)
  (and
    (<
      i@4@01
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))
    (and
      (>= j@5@01 0)
      (and
        (<
          j@5@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))
        (not (= i@4@01 j@5@01)))))))
; [eval] this.nodes[i] != this.nodes[j]
; [eval] this.nodes[i]
; [eval] this.nodes[j]
(pop) ; 5
(push) ; 5
; [else-branch: 4 | !(i@4@01 >= 0 && i@4@01 < |First:($t@2@01)| && j@5@01 >= 0 && j@5@01 < |First:($t@2@01)| && i@4@01 != j@5@01)]
(assert (not
  (and
    (>= i@4@01 0)
    (and
      (<
        i@4@01
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))
      (and
        (>= j@5@01 0)
        (and
          (<
            j@5@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))
          (not (= i@4@01 j@5@01))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (>= i@4@01 0)
    (and
      (<
        i@4@01
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))
      (and
        (>= j@5@01 0)
        (and
          (<
            j@5@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))
          (not (= i@4@01 j@5@01))))))
  (and
    (>= i@4@01 0)
    (<
      i@4@01
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))
    (>= j@5@01 0)
    (<
      j@5@01
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))
    (not (= i@4@01 j@5@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= i@4@01 0)
      (and
        (<
          i@4@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))
        (and
          (>= j@5@01 0)
          (and
            (<
              j@5@01
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))
            (not (= i@4@01 j@5@01)))))))
  (and
    (>= i@4@01 0)
    (and
      (<
        i@4@01
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))
      (and
        (>= j@5@01 0)
        (and
          (<
            j@5@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))
          (not (= i@4@01 j@5@01))))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@4@01 Int) (j@5@01 Int)) (!
  (and
    (=>
      (>= i@4@01 0)
      (and
        (>= i@4@01 0)
        (=>
          (<
            i@4@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))
          (and
            (<
              i@4@01
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))
            (=>
              (>= j@5@01 0)
              (and
                (>= j@5@01 0)
                (or
                  (<
                    j@5@01
                    (Seq_length
                      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))
                  (not
                    (<
                      j@5@01
                      (Seq_length
                        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))))))
            (or (>= j@5@01 0) (not (>= j@5@01 0)))))
        (or
          (<
            i@4@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))
          (not
            (<
              i@4@01
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))))))
    (or (>= i@4@01 0) (not (>= i@4@01 0)))
    (=>
      (and
        (>= i@4@01 0)
        (and
          (<
            i@4@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))
          (and
            (>= j@5@01 0)
            (and
              (<
                j@5@01
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))
              (not (= i@4@01 j@5@01))))))
      (and
        (>= i@4@01 0)
        (<
          i@4@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))
        (>= j@5@01 0)
        (<
          j@5@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))
        (not (= i@4@01 j@5@01))))
    (or
      (not
        (and
          (>= i@4@01 0)
          (and
            (<
              i@4@01
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))
            (and
              (>= j@5@01 0)
              (and
                (<
                  j@5@01
                  (Seq_length
                    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))
                (not (= i@4@01 j@5@01)))))))
      (and
        (>= i@4@01 0)
        (and
          (<
            i@4@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))
          (and
            (>= j@5@01 0)
            (and
              (<
                j@5@01
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))
              (not (= i@4@01 j@5@01))))))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))
    i@4@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))
    j@5@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0170.vpr@11@6@11@132-aux|)))
(assert (forall ((i@4@01 Int) (j@5@01 Int)) (!
  (=>
    (and
      (>= i@4@01 0)
      (and
        (<
          i@4@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))
        (and
          (>= j@5@01 0)
          (and
            (<
              j@5@01
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))
            (not (= i@4@01 j@5@01))))))
    (not
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01)) i@4@01)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01)) j@5@01))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))
    i@4@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))
    j@5@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0170.vpr@11@6@11@132|)))
(assert (=
  ($Snap.second ($Snap.second $t@2@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@2@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@2@01))))))
(declare-const i@6@01 Int)
(push) ; 3
; [eval] 0 <= i && i < |this.nodes|
; [eval] 0 <= i
(push) ; 4
; [then-branch: 5 | !(0 <= i@6@01) | live]
; [else-branch: 5 | 0 <= i@6@01 | live]
(push) ; 5
; [then-branch: 5 | !(0 <= i@6@01)]
(assert (not (<= 0 i@6@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 5 | 0 <= i@6@01]
(assert (<= 0 i@6@01))
; [eval] i < |this.nodes|
; [eval] |this.nodes|
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@6@01) (not (<= 0 i@6@01))))
(assert (and
  (<= 0 i@6@01)
  (< i@6@01 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))))
; [eval] this.nodes[i]
(push) ; 4
(assert (not (>= i@6@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@7@01 ($Ref) Int)
(declare-fun img@8@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@6@01 Int)) (!
  (=>
    (and
      (<= 0 i@6@01)
      (<
        i@6@01
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01)))))
    (or (<= 0 i@6@01) (not (<= 0 i@6@01))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))
    i@6@01))
  :qid |val-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@6@01 Int) (i2@6@01 Int)) (!
  (=>
    (and
      (and
        (<= 0 i1@6@01)
        (<
          i1@6@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01)))))
      (and
        (<= 0 i2@6@01)
        (<
          i2@6@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01)))))
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))
          i1@6@01)
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))
          i2@6@01)))
    (= i1@6@01 i2@6@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@6@01 Int)) (!
  (=>
    (and
      (<= 0 i@6@01)
      (<
        i@6@01
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01)))))
    (and
      (=
        (inv@7@01 (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))
          i@6@01))
        i@6@01)
      (img@8@01 (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))
        i@6@01))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))
    i@6@01))
  :qid |quant-u-5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@8@01 r)
      (and
        (<= 0 (inv@7@01 r))
        (<
          (inv@7@01 r)
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))))
    (=
      (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))
        (inv@7@01 r))
      r))
  :pattern ((inv@7@01 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@6@01 Int)) (!
  (=>
    (and
      (<= 0 i@6@01)
      (<
        i@6@01
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01)))))
    (not
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01)) i@6@01)
        $Ref.null)))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))
    i@6@01))
  :qid |val-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@2@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@2@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@2@01)))))))
(declare-const i@9@01 Int)
(push) ; 3
; [eval] 0 <= i && i < |this.nodes|
; [eval] 0 <= i
(push) ; 4
; [then-branch: 6 | !(0 <= i@9@01) | live]
; [else-branch: 6 | 0 <= i@9@01 | live]
(push) ; 5
; [then-branch: 6 | !(0 <= i@9@01)]
(assert (not (<= 0 i@9@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 6 | 0 <= i@9@01]
(assert (<= 0 i@9@01))
; [eval] i < |this.nodes|
; [eval] |this.nodes|
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@9@01) (not (<= 0 i@9@01))))
(assert (and
  (<= 0 i@9@01)
  (< i@9@01 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))))
; [eval] this.nodes[i]
(push) ; 4
(assert (not (>= i@9@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@10@01 ($Ref) Int)
(declare-fun img@11@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@9@01 Int)) (!
  (=>
    (and
      (<= 0 i@9@01)
      (<
        i@9@01
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01)))))
    (or (<= 0 i@9@01) (not (<= 0 i@9@01))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))
    i@9@01))
  :qid |next-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@9@01 Int) (i2@9@01 Int)) (!
  (=>
    (and
      (and
        (<= 0 i1@9@01)
        (<
          i1@9@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01)))))
      (and
        (<= 0 i2@9@01)
        (<
          i2@9@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01)))))
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))
          i1@9@01)
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))
          i2@9@01)))
    (= i1@9@01 i2@9@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@9@01 Int)) (!
  (=>
    (and
      (<= 0 i@9@01)
      (<
        i@9@01
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01)))))
    (and
      (=
        (inv@10@01 (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))
          i@9@01))
        i@9@01)
      (img@11@01 (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))
        i@9@01))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))
    i@9@01))
  :qid |quant-u-7|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@11@01 r)
      (and
        (<= 0 (inv@10@01 r))
        (<
          (inv@10@01 r)
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))))
    (=
      (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))
        (inv@10@01 r))
      r))
  :pattern ((inv@10@01 r))
  :qid |next-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@9@01 Int)) (!
  (=>
    (and
      (<= 0 i@9@01)
      (<
        i@9@01
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01)))))
    (not
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01)) i@9@01)
        $Ref.null)))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))
    i@9@01))
  :qid |next-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@2@01))))
  $Snap.unit))
; [eval] (forall i: Int :: { this.nodes[i] } 0 <= i && i < |this.nodes| ==> (i < |this.nodes| - 1 ? this.nodes[i].next == this.nodes[i + 1] : this.nodes[i].next == null))
(declare-const i@12@01 Int)
(push) ; 3
; [eval] 0 <= i && i < |this.nodes| ==> (i < |this.nodes| - 1 ? this.nodes[i].next == this.nodes[i + 1] : this.nodes[i].next == null)
; [eval] 0 <= i && i < |this.nodes|
; [eval] 0 <= i
(push) ; 4
; [then-branch: 7 | !(0 <= i@12@01) | live]
; [else-branch: 7 | 0 <= i@12@01 | live]
(push) ; 5
; [then-branch: 7 | !(0 <= i@12@01)]
(assert (not (<= 0 i@12@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 7 | 0 <= i@12@01]
(assert (<= 0 i@12@01))
; [eval] i < |this.nodes|
; [eval] |this.nodes|
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@12@01) (not (<= 0 i@12@01))))
(push) ; 4
; [then-branch: 8 | 0 <= i@12@01 && i@12@01 < |First:($t@2@01)| | live]
; [else-branch: 8 | !(0 <= i@12@01 && i@12@01 < |First:($t@2@01)|) | live]
(push) ; 5
; [then-branch: 8 | 0 <= i@12@01 && i@12@01 < |First:($t@2@01)|]
(assert (and
  (<= 0 i@12@01)
  (< i@12@01 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))))
; [eval] (i < |this.nodes| - 1 ? this.nodes[i].next == this.nodes[i + 1] : this.nodes[i].next == null)
; [eval] i < |this.nodes| - 1
; [eval] |this.nodes| - 1
; [eval] |this.nodes|
(push) ; 6
; [then-branch: 9 | i@12@01 < |First:($t@2@01)| - 1 | live]
; [else-branch: 9 | !(i@12@01 < |First:($t@2@01)| - 1) | live]
(push) ; 7
; [then-branch: 9 | i@12@01 < |First:($t@2@01)| - 1]
(assert (<
  i@12@01
  (- (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))) 1)))
; [eval] this.nodes[i].next == this.nodes[i + 1]
; [eval] this.nodes[i]
(push) ; 8
(assert (not (>= i@12@01 0)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(push) ; 8
(assert (not (and
  (img@11@01 (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))
    i@12@01))
  (and
    (<=
      0
      (inv@10@01 (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))
        i@12@01)))
    (<
      (inv@10@01 (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))
        i@12@01))
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [eval] this.nodes[i + 1]
; [eval] i + 1
(push) ; 8
(assert (not (>= (+ i@12@01 1) 0)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(push) ; 8
(assert (not (<
  (+ i@12@01 1)
  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
(push) ; 7
; [else-branch: 9 | !(i@12@01 < |First:($t@2@01)| - 1)]
(assert (not
  (<
    i@12@01
    (- (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))) 1))))
; [eval] this.nodes[i].next == null
; [eval] this.nodes[i]
(push) ; 8
(assert (not (>= i@12@01 0)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(push) ; 8
(assert (not (and
  (img@11@01 (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))
    i@12@01))
  (and
    (<=
      0
      (inv@10@01 (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))
        i@12@01)))
    (<
      (inv@10@01 (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))
        i@12@01))
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (<
      i@12@01
      (- (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))) 1)))
  (<
    i@12@01
    (- (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))) 1))))
(pop) ; 5
(push) ; 5
; [else-branch: 8 | !(0 <= i@12@01 && i@12@01 < |First:($t@2@01)|)]
(assert (not
  (and
    (<= 0 i@12@01)
    (<
      i@12@01
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01)))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (<= 0 i@12@01)
    (<
      i@12@01
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01)))))
  (and
    (<= 0 i@12@01)
    (<
      i@12@01
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))
    (or
      (not
        (<
          i@12@01
          (-
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01)))
            1)))
      (<
        i@12@01
        (- (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))) 1))))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i@12@01)
      (<
        i@12@01
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))))
  (and
    (<= 0 i@12@01)
    (<
      i@12@01
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01)))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@12@01 Int)) (!
  (and
    (or (<= 0 i@12@01) (not (<= 0 i@12@01)))
    (=>
      (and
        (<= 0 i@12@01)
        (<
          i@12@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01)))))
      (and
        (<= 0 i@12@01)
        (<
          i@12@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))
        (or
          (not
            (<
              i@12@01
              (-
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01)))
                1)))
          (<
            i@12@01
            (-
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01)))
              1)))))
    (or
      (not
        (and
          (<= 0 i@12@01)
          (<
            i@12@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))))
      (and
        (<= 0 i@12@01)
        (<
          i@12@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01)))))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))
    i@12@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0170.vpr@14@7@15@99-aux|)))
(assert (forall ((i@12@01 Int)) (!
  (=>
    (and
      (<= 0 i@12@01)
      (<
        i@12@01
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01)))))
    (ite
      (<
        i@12@01
        (- (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))) 1))
      (=
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@2@01))))) (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))
          i@12@01))
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))
          (+ i@12@01 1)))
      (=
        ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@2@01))))) (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))
          i@12@01))
        $Ref.null)))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))
    i@12@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0170.vpr@14@7@15@99|)))
; State saturation: after unfold
(set-option :timeout 40)
(check-sat)
; unknown
(assert (List%trigger $t@2@01 this@1@01))
; [exec]
; n := new(next)
(declare-const n@13@01 $Ref)
(assert (not (= n@13@01 $Ref.null)))
(declare-const next@14@01 $Ref)
(declare-const sm@15@01 $FVF<next>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_next (as sm@15@01  $FVF<next>) n@13@01) next@14@01))
(assert (not (= n@13@01 n@3@01)))
(assert (not (= n@13@01 this@1@01)))
(assert (not
  (Seq_contains ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01)) n@13@01)))
; [exec]
; fold acc(List(this), write)
; [eval] (forall i: Int, j: Int :: { this.nodes[i], this.nodes[j] } i >= 0 && (i < |this.nodes| && (j >= 0 && (j < |this.nodes| && i != j))) ==> this.nodes[i] != this.nodes[j])
(declare-const i@16@01 Int)
(declare-const j@17@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] i >= 0 && (i < |this.nodes| && (j >= 0 && (j < |this.nodes| && i != j))) ==> this.nodes[i] != this.nodes[j]
; [eval] i >= 0 && (i < |this.nodes| && (j >= 0 && (j < |this.nodes| && i != j)))
; [eval] i >= 0
(push) ; 4
; [then-branch: 10 | !(i@16@01 >= 0) | live]
; [else-branch: 10 | i@16@01 >= 0 | live]
(push) ; 5
; [then-branch: 10 | !(i@16@01 >= 0)]
(assert (not (>= i@16@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 10 | i@16@01 >= 0]
(assert (>= i@16@01 0))
; [eval] i < |this.nodes|
; [eval] |this.nodes|
(push) ; 6
; [then-branch: 11 | !(i@16@01 < |First:($t@2@01)|) | live]
; [else-branch: 11 | i@16@01 < |First:($t@2@01)| | live]
(push) ; 7
; [then-branch: 11 | !(i@16@01 < |First:($t@2@01)|)]
(assert (not
  (< i@16@01 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))))
(pop) ; 7
(push) ; 7
; [else-branch: 11 | i@16@01 < |First:($t@2@01)|]
(assert (< i@16@01 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01)))))
; [eval] j >= 0
(push) ; 8
; [then-branch: 12 | !(j@17@01 >= 0) | live]
; [else-branch: 12 | j@17@01 >= 0 | live]
(push) ; 9
; [then-branch: 12 | !(j@17@01 >= 0)]
(assert (not (>= j@17@01 0)))
(pop) ; 9
(push) ; 9
; [else-branch: 12 | j@17@01 >= 0]
(assert (>= j@17@01 0))
; [eval] j < |this.nodes|
; [eval] |this.nodes|
(push) ; 10
; [then-branch: 13 | !(j@17@01 < |First:($t@2@01)|) | live]
; [else-branch: 13 | j@17@01 < |First:($t@2@01)| | live]
(push) ; 11
; [then-branch: 13 | !(j@17@01 < |First:($t@2@01)|)]
(assert (not
  (< j@17@01 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))))
(pop) ; 11
(push) ; 11
; [else-branch: 13 | j@17@01 < |First:($t@2@01)|]
(assert (< j@17@01 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01)))))
; [eval] i != j
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or
  (< j@17@01 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))
  (not
    (<
      j@17@01
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01)))))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@17@01 0)
  (and
    (>= j@17@01 0)
    (or
      (<
        j@17@01
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))
      (not
        (<
          j@17@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01)))))))))
(assert (or (>= j@17@01 0) (not (>= j@17@01 0))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i@16@01 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))
  (and
    (<
      i@16@01
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))
    (=>
      (>= j@17@01 0)
      (and
        (>= j@17@01 0)
        (or
          (<
            j@17@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))
          (not
            (<
              j@17@01
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))))))
    (or (>= j@17@01 0) (not (>= j@17@01 0))))))
(assert (or
  (< i@16@01 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))
  (not
    (<
      i@16@01
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01)))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= i@16@01 0)
  (and
    (>= i@16@01 0)
    (=>
      (<
        i@16@01
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))
      (and
        (<
          i@16@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))
        (=>
          (>= j@17@01 0)
          (and
            (>= j@17@01 0)
            (or
              (<
                j@17@01
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))
              (not
                (<
                  j@17@01
                  (Seq_length
                    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))))))
        (or (>= j@17@01 0) (not (>= j@17@01 0)))))
    (or
      (<
        i@16@01
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))
      (not
        (<
          i@16@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01)))))))))
(assert (or (>= i@16@01 0) (not (>= i@16@01 0))))
(push) ; 4
; [then-branch: 14 | i@16@01 >= 0 && i@16@01 < |First:($t@2@01)| && j@17@01 >= 0 && j@17@01 < |First:($t@2@01)| && i@16@01 != j@17@01 | live]
; [else-branch: 14 | !(i@16@01 >= 0 && i@16@01 < |First:($t@2@01)| && j@17@01 >= 0 && j@17@01 < |First:($t@2@01)| && i@16@01 != j@17@01) | live]
(push) ; 5
; [then-branch: 14 | i@16@01 >= 0 && i@16@01 < |First:($t@2@01)| && j@17@01 >= 0 && j@17@01 < |First:($t@2@01)| && i@16@01 != j@17@01]
(assert (and
  (>= i@16@01 0)
  (and
    (<
      i@16@01
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))
    (and
      (>= j@17@01 0)
      (and
        (<
          j@17@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))
        (not (= i@16@01 j@17@01)))))))
; [eval] this.nodes[i] != this.nodes[j]
; [eval] this.nodes[i]
; [eval] this.nodes[j]
(pop) ; 5
(push) ; 5
; [else-branch: 14 | !(i@16@01 >= 0 && i@16@01 < |First:($t@2@01)| && j@17@01 >= 0 && j@17@01 < |First:($t@2@01)| && i@16@01 != j@17@01)]
(assert (not
  (and
    (>= i@16@01 0)
    (and
      (<
        i@16@01
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))
      (and
        (>= j@17@01 0)
        (and
          (<
            j@17@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))
          (not (= i@16@01 j@17@01))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (>= i@16@01 0)
    (and
      (<
        i@16@01
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))
      (and
        (>= j@17@01 0)
        (and
          (<
            j@17@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))
          (not (= i@16@01 j@17@01))))))
  (and
    (>= i@16@01 0)
    (<
      i@16@01
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))
    (>= j@17@01 0)
    (<
      j@17@01
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))
    (not (= i@16@01 j@17@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= i@16@01 0)
      (and
        (<
          i@16@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))
        (and
          (>= j@17@01 0)
          (and
            (<
              j@17@01
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))
            (not (= i@16@01 j@17@01)))))))
  (and
    (>= i@16@01 0)
    (and
      (<
        i@16@01
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))
      (and
        (>= j@17@01 0)
        (and
          (<
            j@17@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))
          (not (= i@16@01 j@17@01))))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@16@01 Int) (j@17@01 Int)) (!
  (and
    (=>
      (>= i@16@01 0)
      (and
        (>= i@16@01 0)
        (=>
          (<
            i@16@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))
          (and
            (<
              i@16@01
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))
            (=>
              (>= j@17@01 0)
              (and
                (>= j@17@01 0)
                (or
                  (<
                    j@17@01
                    (Seq_length
                      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))
                  (not
                    (<
                      j@17@01
                      (Seq_length
                        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))))))
            (or (>= j@17@01 0) (not (>= j@17@01 0)))))
        (or
          (<
            i@16@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))
          (not
            (<
              i@16@01
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))))))
    (or (>= i@16@01 0) (not (>= i@16@01 0)))
    (=>
      (and
        (>= i@16@01 0)
        (and
          (<
            i@16@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))
          (and
            (>= j@17@01 0)
            (and
              (<
                j@17@01
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))
              (not (= i@16@01 j@17@01))))))
      (and
        (>= i@16@01 0)
        (<
          i@16@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))
        (>= j@17@01 0)
        (<
          j@17@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))
        (not (= i@16@01 j@17@01))))
    (or
      (not
        (and
          (>= i@16@01 0)
          (and
            (<
              i@16@01
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))
            (and
              (>= j@17@01 0)
              (and
                (<
                  j@17@01
                  (Seq_length
                    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))
                (not (= i@16@01 j@17@01)))))))
      (and
        (>= i@16@01 0)
        (and
          (<
            i@16@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))
          (and
            (>= j@17@01 0)
            (and
              (<
                j@17@01
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))
              (not (= i@16@01 j@17@01))))))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))
    i@16@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))
    j@17@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0170.vpr@11@6@11@132-aux|)))
(push) ; 3
(assert (not (forall ((i@16@01 Int) (j@17@01 Int)) (!
  (=>
    (and
      (>= i@16@01 0)
      (and
        (<
          i@16@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))
        (and
          (>= j@17@01 0)
          (and
            (<
              j@17@01
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))
            (not (= i@16@01 j@17@01))))))
    (not
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))
          i@16@01)
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))
          j@17@01))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))
    i@16@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))
    j@17@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0170.vpr@11@6@11@132|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@16@01 Int) (j@17@01 Int)) (!
  (=>
    (and
      (>= i@16@01 0)
      (and
        (<
          i@16@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))
        (and
          (>= j@17@01 0)
          (and
            (<
              j@17@01
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))
            (not (= i@16@01 j@17@01))))))
    (not
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))
          i@16@01)
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))
          j@17@01))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))
    i@16@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))
    j@17@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0170.vpr@11@6@11@132|)))
(declare-const i@18@01 Int)
(push) ; 3
; [eval] 0 <= i && i < |this.nodes|
; [eval] 0 <= i
(push) ; 4
; [then-branch: 15 | !(0 <= i@18@01) | live]
; [else-branch: 15 | 0 <= i@18@01 | live]
(push) ; 5
; [then-branch: 15 | !(0 <= i@18@01)]
(assert (not (<= 0 i@18@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 15 | 0 <= i@18@01]
(assert (<= 0 i@18@01))
; [eval] i < |this.nodes|
; [eval] |this.nodes|
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@18@01) (not (<= 0 i@18@01))))
(assert (and
  (<= 0 i@18@01)
  (< i@18@01 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))))
; [eval] this.nodes[i]
(push) ; 4
(assert (not (>= i@18@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@19@01 ($Ref) Int)
(declare-fun img@20@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@18@01 Int)) (!
  (=>
    (and
      (<= 0 i@18@01)
      (<
        i@18@01
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01)))))
    (or (<= 0 i@18@01) (not (<= 0 i@18@01))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))
    i@18@01))
  :qid |val-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@18@01 Int) (i2@18@01 Int)) (!
  (=>
    (and
      (and
        (<= 0 i1@18@01)
        (<
          i1@18@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01)))))
      (and
        (<= 0 i2@18@01)
        (<
          i2@18@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01)))))
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))
          i1@18@01)
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))
          i2@18@01)))
    (= i1@18@01 i2@18@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@18@01 Int)) (!
  (=>
    (and
      (<= 0 i@18@01)
      (<
        i@18@01
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01)))))
    (and
      (=
        (inv@19@01 (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))
          i@18@01))
        i@18@01)
      (img@20@01 (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))
        i@18@01))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))
    i@18@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@20@01 r)
      (and
        (<= 0 (inv@19@01 r))
        (<
          (inv@19@01 r)
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))))
    (=
      (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))
        (inv@19@01 r))
      r))
  :pattern ((inv@19@01 r))
  :qid |val-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@21@01 ((r $Ref)) $Perm
  (ite
    (and
      (and
        (<= 0 (inv@19@01 r))
        (<
          (inv@19@01 r)
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01)))))
      (img@20@01 r)
      (=
        r
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))
          (inv@19@01 r))))
    ($Perm.min
      (ite
        (and
          (img@8@01 r)
          (and
            (<= 0 (inv@7@01 r))
            (<
              (inv@7@01 r)
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))))
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
        (and
          (img@8@01 r)
          (and
            (<= 0 (inv@7@01 r))
            (<
              (inv@7@01 r)
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))))
        $Perm.Write
        $Perm.No)
      (pTaken@21@01 r))
    $Perm.No)
  
  :qid |quant-u-10|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (<= 0 (inv@19@01 r))
        (<
          (inv@19@01 r)
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01)))))
      (img@20@01 r)
      (=
        r
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))
          (inv@19@01 r))))
    (= (- $Perm.Write (pTaken@21@01 r)) $Perm.No))
  
  :qid |quant-u-11|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@22@01 $FVF<val>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@22@01  $FVF<val>)))
      (and
        (and
          (<= 0 (inv@19@01 r))
          (<
            (inv@19@01 r)
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01)))))
        (img@20@01 r)))
    (=>
      (and
        (and
          (<= 0 (inv@19@01 r))
          (<
            (inv@19@01 r)
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01)))))
        (img@20@01 r))
      (Set_in r ($FVF.domain_val (as sm@22@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@22@01  $FVF<val>))))
  :qid |qp.fvfDomDef1|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and
          (<= 0 (inv@19@01 r))
          (<
            (inv@19@01 r)
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01)))))
        (img@20@01 r))
      (and
        (img@8@01 r)
        (and
          (<= 0 (inv@7@01 r))
          (<
            (inv@7@01 r)
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01)))))))
    (=
      ($FVF.lookup_val (as sm@22@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second $t@2@01)))) r)))
  :pattern (($FVF.lookup_val (as sm@22@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second $t@2@01)))) r))
  :qid |qp.fvfValDef0|)))
(declare-const i@23@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i && i < |this.nodes|
; [eval] 0 <= i
(push) ; 4
; [then-branch: 16 | !(0 <= i@23@01) | live]
; [else-branch: 16 | 0 <= i@23@01 | live]
(push) ; 5
; [then-branch: 16 | !(0 <= i@23@01)]
(assert (not (<= 0 i@23@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 16 | 0 <= i@23@01]
(assert (<= 0 i@23@01))
; [eval] i < |this.nodes|
; [eval] |this.nodes|
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@23@01) (not (<= 0 i@23@01))))
(assert (and
  (<= 0 i@23@01)
  (< i@23@01 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))))
; [eval] this.nodes[i]
(push) ; 4
(assert (not (>= i@23@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@24@01 ($Ref) Int)
(declare-fun img@25@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@23@01 Int)) (!
  (=>
    (and
      (<= 0 i@23@01)
      (<
        i@23@01
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01)))))
    (or (<= 0 i@23@01) (not (<= 0 i@23@01))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))
    i@23@01))
  :qid |next-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@23@01 Int) (i2@23@01 Int)) (!
  (=>
    (and
      (and
        (<= 0 i1@23@01)
        (<
          i1@23@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01)))))
      (and
        (<= 0 i2@23@01)
        (<
          i2@23@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01)))))
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))
          i1@23@01)
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))
          i2@23@01)))
    (= i1@23@01 i2@23@01))
  
  :qid |next-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@23@01 Int)) (!
  (=>
    (and
      (<= 0 i@23@01)
      (<
        i@23@01
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01)))))
    (and
      (=
        (inv@24@01 (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))
          i@23@01))
        i@23@01)
      (img@25@01 (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))
        i@23@01))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))
    i@23@01))
  :qid |next-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@25@01 r)
      (and
        (<= 0 (inv@24@01 r))
        (<
          (inv@24@01 r)
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))))
    (=
      (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))
        (inv@24@01 r))
      r))
  :pattern ((inv@24@01 r))
  :qid |next-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@26@01 ((r $Ref)) $Perm
  (ite
    (and
      (and
        (<= 0 (inv@24@01 r))
        (<
          (inv@24@01 r)
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01)))))
      (img@25@01 r)
      (=
        r
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))
          (inv@24@01 r))))
    ($Perm.min
      (ite
        (and
          (img@11@01 r)
          (and
            (<= 0 (inv@10@01 r))
            (<
              (inv@10@01 r)
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@27@01 ((r $Ref)) $Perm
  (ite
    (and
      (and
        (<= 0 (inv@24@01 r))
        (<
          (inv@24@01 r)
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01)))))
      (img@25@01 r)
      (=
        r
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))
          (inv@24@01 r))))
    ($Perm.min
      (ite (= r n@13@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@26@01 r)))
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
        (and
          (img@11@01 r)
          (and
            (<= 0 (inv@10@01 r))
            (<
              (inv@10@01 r)
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))))
        $Perm.Write
        $Perm.No)
      (pTaken@26@01 r))
    $Perm.No)
  
  :qid |quant-u-14|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (<= 0 (inv@24@01 r))
        (<
          (inv@24@01 r)
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01)))))
      (img@25@01 r)
      (=
        r
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))
          (inv@24@01 r))))
    (= (- $Perm.Write (pTaken@26@01 r)) $Perm.No))
  
  :qid |quant-u-15|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@28@01 $FVF<next>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_next (as sm@28@01  $FVF<next>)))
      (and
        (and
          (<= 0 (inv@24@01 r))
          (<
            (inv@24@01 r)
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01)))))
        (img@25@01 r)))
    (=>
      (and
        (and
          (<= 0 (inv@24@01 r))
          (<
            (inv@24@01 r)
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01)))))
        (img@25@01 r))
      (Set_in r ($FVF.domain_next (as sm@28@01  $FVF<next>)))))
  :pattern ((Set_in r ($FVF.domain_next (as sm@28@01  $FVF<next>))))
  :qid |qp.fvfDomDef4|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and
          (<= 0 (inv@24@01 r))
          (<
            (inv@24@01 r)
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01)))))
        (img@25@01 r))
      (and
        (img@11@01 r)
        (and
          (<= 0 (inv@10@01 r))
          (<
            (inv@10@01 r)
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01)))))))
    (=
      ($FVF.lookup_next (as sm@28@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@2@01))))) r)))
  :pattern (($FVF.lookup_next (as sm@28@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@2@01))))) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and
          (<= 0 (inv@24@01 r))
          (<
            (inv@24@01 r)
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01)))))
        (img@25@01 r))
      (= r n@13@01))
    (=
      ($FVF.lookup_next (as sm@28@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@15@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@28@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@15@01  $FVF<next>) r))
  :qid |qp.fvfValDef3|)))
; [eval] (forall i: Int :: { this.nodes[i] } 0 <= i && i < |this.nodes| ==> (i < |this.nodes| - 1 ? this.nodes[i].next == this.nodes[i + 1] : this.nodes[i].next == null))
(declare-const i@29@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i && i < |this.nodes| ==> (i < |this.nodes| - 1 ? this.nodes[i].next == this.nodes[i + 1] : this.nodes[i].next == null)
; [eval] 0 <= i && i < |this.nodes|
; [eval] 0 <= i
(push) ; 4
; [then-branch: 17 | !(0 <= i@29@01) | live]
; [else-branch: 17 | 0 <= i@29@01 | live]
(push) ; 5
; [then-branch: 17 | !(0 <= i@29@01)]
(assert (not (<= 0 i@29@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 17 | 0 <= i@29@01]
(assert (<= 0 i@29@01))
; [eval] i < |this.nodes|
; [eval] |this.nodes|
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@29@01) (not (<= 0 i@29@01))))
(push) ; 4
; [then-branch: 18 | 0 <= i@29@01 && i@29@01 < |First:($t@2@01)| | live]
; [else-branch: 18 | !(0 <= i@29@01 && i@29@01 < |First:($t@2@01)|) | live]
(push) ; 5
; [then-branch: 18 | 0 <= i@29@01 && i@29@01 < |First:($t@2@01)|]
(assert (and
  (<= 0 i@29@01)
  (< i@29@01 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))))
; [eval] (i < |this.nodes| - 1 ? this.nodes[i].next == this.nodes[i + 1] : this.nodes[i].next == null)
; [eval] i < |this.nodes| - 1
; [eval] |this.nodes| - 1
; [eval] |this.nodes|
(push) ; 6
; [then-branch: 19 | i@29@01 < |First:($t@2@01)| - 1 | live]
; [else-branch: 19 | !(i@29@01 < |First:($t@2@01)| - 1) | live]
(push) ; 7
; [then-branch: 19 | i@29@01 < |First:($t@2@01)| - 1]
(assert (<
  i@29@01
  (- (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))) 1)))
; [eval] this.nodes[i].next == this.nodes[i + 1]
; [eval] this.nodes[i]
(push) ; 8
(assert (not (>= i@29@01 0)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(declare-const sm@30@01 $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r n@13@01)
    (=
      ($FVF.lookup_next (as sm@30@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@15@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@30@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@15@01  $FVF<next>) r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@11@01 r)
      (and
        (<= 0 (inv@10@01 r))
        (<
          (inv@10@01 r)
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))))
    (=
      ($FVF.lookup_next (as sm@30@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@2@01))))) r)))
  :pattern (($FVF.lookup_next (as sm@30@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@2@01))))) r))
  :qid |qp.fvfValDef6|)))
(declare-const pm@31@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@31@01  $FPM) r)
    (+
      (ite (= r n@13@01) $Perm.Write $Perm.No)
      (ite
        (and
          (img@11@01 r)
          (and
            (<= 0 (inv@10@01 r))
            (<
              (inv@10@01 r)
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_next (as pm@31@01  $FPM) r))
  :qid |qp.resPrmSumDef7|)))
(push) ; 8
(assert (not (<
  $Perm.No
  ($FVF.perm_next (as pm@31@01  $FPM) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))
    i@29@01)))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [eval] this.nodes[i + 1]
; [eval] i + 1
(push) ; 8
(assert (not (>= (+ i@29@01 1) 0)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(push) ; 8
(assert (not (<
  (+ i@29@01 1)
  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
(push) ; 7
; [else-branch: 19 | !(i@29@01 < |First:($t@2@01)| - 1)]
(assert (not
  (<
    i@29@01
    (- (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))) 1))))
; [eval] this.nodes[i].next == null
; [eval] this.nodes[i]
(push) ; 8
(assert (not (>= i@29@01 0)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(declare-const sm@32@01 $FVF<next>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r n@13@01)
    (=
      ($FVF.lookup_next (as sm@32@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@15@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@32@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@15@01  $FVF<next>) r))
  :qid |qp.fvfValDef8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@11@01 r)
      (and
        (<= 0 (inv@10@01 r))
        (<
          (inv@10@01 r)
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))))
    (=
      ($FVF.lookup_next (as sm@32@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@2@01))))) r)))
  :pattern (($FVF.lookup_next (as sm@32@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@2@01))))) r))
  :qid |qp.fvfValDef9|)))
(declare-const pm@33@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@33@01  $FPM) r)
    (+
      (ite (= r n@13@01) $Perm.Write $Perm.No)
      (ite
        (and
          (img@11@01 r)
          (and
            (<= 0 (inv@10@01 r))
            (<
              (inv@10@01 r)
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_next (as pm@33@01  $FPM) r))
  :qid |qp.resPrmSumDef10|)))
(push) ; 8
(assert (not (<
  $Perm.No
  ($FVF.perm_next (as pm@33@01  $FPM) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))
    i@29@01)))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r n@13@01)
    (=
      ($FVF.lookup_next (as sm@30@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@15@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@30@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@15@01  $FVF<next>) r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@11@01 r)
      (and
        (<= 0 (inv@10@01 r))
        (<
          (inv@10@01 r)
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))))
    (=
      ($FVF.lookup_next (as sm@30@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@2@01))))) r)))
  :pattern (($FVF.lookup_next (as sm@30@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@2@01))))) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@31@01  $FPM) r)
    (+
      (ite (= r n@13@01) $Perm.Write $Perm.No)
      (ite
        (and
          (img@11@01 r)
          (and
            (<= 0 (inv@10@01 r))
            (<
              (inv@10@01 r)
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_next (as pm@31@01  $FPM) r))
  :qid |qp.resPrmSumDef7|)))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r n@13@01)
    (=
      ($FVF.lookup_next (as sm@32@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@15@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@32@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@15@01  $FVF<next>) r))
  :qid |qp.fvfValDef8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@11@01 r)
      (and
        (<= 0 (inv@10@01 r))
        (<
          (inv@10@01 r)
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))))
    (=
      ($FVF.lookup_next (as sm@32@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@2@01))))) r)))
  :pattern (($FVF.lookup_next (as sm@32@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@2@01))))) r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@33@01  $FPM) r)
    (+
      (ite (= r n@13@01) $Perm.Write $Perm.No)
      (ite
        (and
          (img@11@01 r)
          (and
            (<= 0 (inv@10@01 r))
            (<
              (inv@10@01 r)
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_next (as pm@33@01  $FPM) r))
  :qid |qp.resPrmSumDef10|)))
(assert (or
  (not
    (<
      i@29@01
      (- (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))) 1)))
  (<
    i@29@01
    (- (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))) 1))))
(pop) ; 5
(push) ; 5
; [else-branch: 18 | !(0 <= i@29@01 && i@29@01 < |First:($t@2@01)|)]
(assert (not
  (and
    (<= 0 i@29@01)
    (<
      i@29@01
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01)))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r n@13@01)
    (=
      ($FVF.lookup_next (as sm@30@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@15@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@30@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@15@01  $FVF<next>) r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@11@01 r)
      (and
        (<= 0 (inv@10@01 r))
        (<
          (inv@10@01 r)
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))))
    (=
      ($FVF.lookup_next (as sm@30@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@2@01))))) r)))
  :pattern (($FVF.lookup_next (as sm@30@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@2@01))))) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@31@01  $FPM) r)
    (+
      (ite (= r n@13@01) $Perm.Write $Perm.No)
      (ite
        (and
          (img@11@01 r)
          (and
            (<= 0 (inv@10@01 r))
            (<
              (inv@10@01 r)
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_next (as pm@31@01  $FPM) r))
  :qid |qp.resPrmSumDef7|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r n@13@01)
    (=
      ($FVF.lookup_next (as sm@32@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@15@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@32@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@15@01  $FVF<next>) r))
  :qid |qp.fvfValDef8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@11@01 r)
      (and
        (<= 0 (inv@10@01 r))
        (<
          (inv@10@01 r)
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))))
    (=
      ($FVF.lookup_next (as sm@32@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@2@01))))) r)))
  :pattern (($FVF.lookup_next (as sm@32@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@2@01))))) r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@33@01  $FPM) r)
    (+
      (ite (= r n@13@01) $Perm.Write $Perm.No)
      (ite
        (and
          (img@11@01 r)
          (and
            (<= 0 (inv@10@01 r))
            (<
              (inv@10@01 r)
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_next (as pm@33@01  $FPM) r))
  :qid |qp.resPrmSumDef10|)))
(assert (=>
  (and
    (<= 0 i@29@01)
    (<
      i@29@01
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01)))))
  (and
    (<= 0 i@29@01)
    (<
      i@29@01
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))
    (or
      (not
        (<
          i@29@01
          (-
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01)))
            1)))
      (<
        i@29@01
        (- (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))) 1))))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i@29@01)
      (<
        i@29@01
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))))
  (and
    (<= 0 i@29@01)
    (<
      i@29@01
      (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01)))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (= r n@13@01)
    (=
      ($FVF.lookup_next (as sm@30@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@15@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@30@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@15@01  $FVF<next>) r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@11@01 r)
      (and
        (<= 0 (inv@10@01 r))
        (<
          (inv@10@01 r)
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))))
    (=
      ($FVF.lookup_next (as sm@30@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@2@01))))) r)))
  :pattern (($FVF.lookup_next (as sm@30@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@2@01))))) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@31@01  $FPM) r)
    (+
      (ite (= r n@13@01) $Perm.Write $Perm.No)
      (ite
        (and
          (img@11@01 r)
          (and
            (<= 0 (inv@10@01 r))
            (<
              (inv@10@01 r)
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_next (as pm@31@01  $FPM) r))
  :qid |qp.resPrmSumDef7|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r n@13@01)
    (=
      ($FVF.lookup_next (as sm@32@01  $FVF<next>) r)
      ($FVF.lookup_next (as sm@15@01  $FVF<next>) r)))
  :pattern (($FVF.lookup_next (as sm@32@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next (as sm@15@01  $FVF<next>) r))
  :qid |qp.fvfValDef8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@11@01 r)
      (and
        (<= 0 (inv@10@01 r))
        (<
          (inv@10@01 r)
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))))
    (=
      ($FVF.lookup_next (as sm@32@01  $FVF<next>) r)
      ($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@2@01))))) r)))
  :pattern (($FVF.lookup_next (as sm@32@01  $FVF<next>) r))
  :pattern (($FVF.lookup_next ($SortWrappers.$SnapTo$FVF<next> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@2@01))))) r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_next (as pm@33@01  $FPM) r)
    (+
      (ite (= r n@13@01) $Perm.Write $Perm.No)
      (ite
        (and
          (img@11@01 r)
          (and
            (<= 0 (inv@10@01 r))
            (<
              (inv@10@01 r)
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_next (as pm@33@01  $FPM) r))
  :qid |qp.resPrmSumDef10|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@29@01 Int)) (!
  (and
    (or (<= 0 i@29@01) (not (<= 0 i@29@01)))
    (=>
      (and
        (<= 0 i@29@01)
        (<
          i@29@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01)))))
      (and
        (<= 0 i@29@01)
        (<
          i@29@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))
        (or
          (not
            (<
              i@29@01
              (-
                (Seq_length
                  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01)))
                1)))
          (<
            i@29@01
            (-
              (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01)))
              1)))))
    (or
      (not
        (and
          (<= 0 i@29@01)
          (<
            i@29@01
            (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))))))
      (and
        (<= 0 i@29@01)
        (<
          i@29@01
          (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01)))))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))
    i@29@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0170.vpr@14@7@15@99-aux|)))
(push) ; 3
(assert (not (forall ((i@29@01 Int)) (!
  (=>
    (and
      (<= 0 i@29@01)
      (<
        i@29@01
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01)))))
    (ite
      (<
        i@29@01
        (- (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))) 1))
      (=
        ($FVF.lookup_next (as sm@30@01  $FVF<next>) (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))
          i@29@01))
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))
          (+ i@29@01 1)))
      (=
        ($FVF.lookup_next (as sm@32@01  $FVF<next>) (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))
          i@29@01))
        $Ref.null)))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))
    i@29@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0170.vpr@14@7@15@99|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@29@01 Int)) (!
  (=>
    (and
      (<= 0 i@29@01)
      (<
        i@29@01
        (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01)))))
    (ite
      (<
        i@29@01
        (- (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))) 1))
      (=
        ($FVF.lookup_next (as sm@30@01  $FVF<next>) (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))
          i@29@01))
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))
          (+ i@29@01 1)))
      (=
        ($FVF.lookup_next (as sm@32@01  $FVF<next>) (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))
          i@29@01))
        $Ref.null)))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@2@01))
    i@29@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0170.vpr@14@7@15@99|)))
(assert (List%trigger ($Snap.combine
  ($Snap.first $t@2@01)
  ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<val>To$Snap (as sm@22@01  $FVF<val>))
      ($Snap.combine
        ($SortWrappers.$FVF<next>To$Snap (as sm@28@01  $FVF<next>))
        $Snap.unit)))) this@1@01))
(pop) ; 2
(pop) ; 1
