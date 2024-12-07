(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:19:22
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/quantifiedpermissions/sequences/mergesort.vpr
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
(declare-sort Set<Int> 0)
(declare-sort Set<Seq<$Ref>> 0)
(declare-sort Set<$Ref> 0)
(declare-sort Set<$Snap> 0)
(declare-sort $FVF<array> 0)
(declare-sort $FVF<value> 0)
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
(declare-fun $SortWrappers.$FVF<array>To$Snap ($FVF<array>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<array> ($Snap) $FVF<array>)
(assert (forall ((x $FVF<array>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<array>($SortWrappers.$FVF<array>To$Snap x)))
    :pattern (($SortWrappers.$FVF<array>To$Snap x))
    :qid |$Snap.$SnapTo$FVF<array>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$FVF<array>To$Snap($SortWrappers.$SnapTo$FVF<array> x)))
    :pattern (($SortWrappers.$SnapTo$FVF<array> x))
    :qid |$Snap.$FVF<array>To$SnapTo$FVF<array>|
    )))
(declare-fun $SortWrappers.$FVF<value>To$Snap ($FVF<value>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<value> ($Snap) $FVF<value>)
(assert (forall ((x $FVF<value>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<value>($SortWrappers.$FVF<value>To$Snap x)))
    :pattern (($SortWrappers.$FVF<value>To$Snap x))
    :qid |$Snap.$SnapTo$FVF<value>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$FVF<value>To$Snap($SortWrappers.$SnapTo$FVF<value> x)))
    :pattern (($SortWrappers.$SnapTo$FVF<value> x))
    :qid |$Snap.$FVF<value>To$SnapTo$FVF<value>|
    )))
; ////////// Symbols
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
(declare-fun Seq_length (Seq<Int>) Int)
(declare-const Seq_empty Seq<Int>)
(declare-fun Seq_singleton (Int) Seq<Int>)
(declare-fun Seq_append (Seq<Int> Seq<Int>) Seq<Int>)
(declare-fun Seq_index (Seq<Int> Int) Int)
(declare-fun Seq_update (Seq<Int> Int Int) Seq<Int>)
(declare-fun Seq_take (Seq<Int> Int) Seq<Int>)
(declare-fun Seq_drop (Seq<Int> Int) Seq<Int>)
(declare-fun Seq_contains (Seq<Int> Int) Bool)
(declare-fun Seq_contains_trigger (Seq<Int> Int) Bool)
(declare-fun Seq_skolem (Seq<Int> Int) Int)
(declare-fun Seq_equal (Seq<Int> Seq<Int>) Bool)
(declare-fun Seq_skolem_diff (Seq<Int> Seq<Int>) Int)
(declare-fun Seq_range (Int Int) Seq<Int>)
; /field_value_functions_declarations.smt2 [array: Seq[Ref]]
(declare-fun $FVF.domain_array ($FVF<array>) Set<$Ref>)
(declare-fun $FVF.lookup_array ($FVF<array> $Ref) Seq<$Ref>)
(declare-fun $FVF.after_array ($FVF<array> $FVF<array>) Bool)
(declare-fun $FVF.loc_array (Seq<$Ref> $Ref) Bool)
(declare-fun $FVF.perm_array ($FPM $Ref) $Perm)
(declare-const $fvfTOP_array $FVF<array>)
; /field_value_functions_declarations.smt2 [value: Int]
(declare-fun $FVF.domain_value ($FVF<value>) Set<$Ref>)
(declare-fun $FVF.lookup_value ($FVF<value> $Ref) Int)
(declare-fun $FVF.after_value ($FVF<value> $FVF<value>) Bool)
(declare-fun $FVF.loc_value (Int $Ref) Bool)
(declare-fun $FVF.perm_value ($FPM $Ref) $Perm)
(declare-const $fvfTOP_value $FVF<value>)
; Declaring symbols related to program functions (from program analysis)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
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
(assert (forall ((s Seq<Int>)) (!
  (<= 0 (Seq_length s))
  :pattern ((Seq_length s))
  )))
(assert (= (Seq_length (as Seq_empty  Seq<Int>)) 0))
(assert (forall ((s Seq<Int>)) (!
  (=> (= (Seq_length s) 0) (= s (as Seq_empty  Seq<Int>)))
  :pattern ((Seq_length s))
  )))
(assert (forall ((e Int)) (!
  (= (Seq_length (Seq_singleton e)) 1)
  :pattern ((Seq_singleton e))
  )))
(assert (forall ((s0 Seq<Int>) (s1 Seq<Int>)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Int>)))
      (not (= s1 (as Seq_empty  Seq<Int>))))
    (= (Seq_length (Seq_append s0 s1)) (+ (Seq_length s0) (Seq_length s1))))
  :pattern ((Seq_length (Seq_append s0 s1)))
  )))
(assert (forall ((s0 Seq<Int>) (s1 Seq<Int>)) (!
  (and
    (=> (= s0 (as Seq_empty  Seq<Int>)) (= (Seq_append s0 s1) s1))
    (=> (= s1 (as Seq_empty  Seq<Int>)) (= (Seq_append s0 s1) s0)))
  :pattern ((Seq_append s0 s1))
  )))
(assert (forall ((e Int)) (!
  (= (Seq_index (Seq_singleton e) 0) e)
  :pattern ((Seq_singleton e))
  )))
(assert (forall ((s0 Seq<Int>) (s1 Seq<Int>) (n Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Int>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Int>)))
        (and (<= 0 n) (< n (Seq_length s0)))))
    (= (Seq_index (Seq_append s0 s1) n) (Seq_index s0 n)))
  :pattern ((Seq_index (Seq_append s0 s1) n))
  :pattern ((Seq_index s0 n) (Seq_append s0 s1))
  )))
(assert (forall ((s0 Seq<Int>) (s1 Seq<Int>) (n Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Int>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Int>)))
        (and (<= (Seq_length s0) n) (< n (Seq_length (Seq_append s0 s1))))))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s0)) (Seq_length s0)) n)
      (=
        (Seq_index (Seq_append s0 s1) n)
        (Seq_index s1 (Seq_sub n (Seq_length s0))))))
  :pattern ((Seq_index (Seq_append s0 s1) n))
  )))
(assert (forall ((s0 Seq<Int>) (s1 Seq<Int>) (m Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Int>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Int>)))
        (and (<= 0 m) (< m (Seq_length s1)))))
    (and
      (= (Seq_sub (Seq_add m (Seq_length s0)) (Seq_length s0)) m)
      (=
        (Seq_index (Seq_append s0 s1) (Seq_add m (Seq_length s0)))
        (Seq_index s1 m))))
  :pattern ((Seq_index s1 m) (Seq_append s0 s1))
  )))
(assert (forall ((s Seq<Int>) (i Int) (v Int)) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (= (Seq_length (Seq_update s i v)) (Seq_length s)))
  :pattern ((Seq_length (Seq_update s i v)))
  :pattern ((Seq_length s) (Seq_update s i v))
  )))
(assert (forall ((s Seq<Int>) (i Int) (v Int) (n Int)) (!
  (=>
    (and (<= 0 n) (< n (Seq_length s)))
    (and
      (=> (= i n) (= (Seq_index (Seq_update s i v) n) v))
      (=> (not (= i n)) (= (Seq_index (Seq_update s i v) n) (Seq_index s n)))))
  :pattern ((Seq_index (Seq_update s i v) n))
  :pattern ((Seq_index s n) (Seq_update s i v))
  )))
(assert (forall ((s Seq<Int>) (n Int)) (!
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
(assert (forall ((s Seq<Int>) (n Int) (j Int)) (!
  (=>
    (and (<= 0 j) (and (< j n) (< j (Seq_length s))))
    (= (Seq_index (Seq_take s n) j) (Seq_index s j)))
  :pattern ((Seq_index (Seq_take s n) j))
  :pattern ((Seq_index s j) (Seq_take s n))
  )))
(assert (forall ((s Seq<Int>) (n Int)) (!
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
(assert (forall ((s Seq<Int>) (n Int) (j Int)) (!
  (=>
    (and (< 0 n) (and (<= 0 j) (< j (- (Seq_length s) n))))
    (and
      (= (Seq_sub (Seq_add j n) n) j)
      (= (Seq_index (Seq_drop s n) j) (Seq_index s (Seq_add j n)))))
  :pattern ((Seq_index (Seq_drop s n) j))
  )))
(assert (forall ((s Seq<Int>) (n Int) (i Int)) (!
  (=>
    (and (< 0 n) (and (<= n i) (< i (Seq_length s))))
    (and
      (= (Seq_add (Seq_sub i n) n) i)
      (= (Seq_index (Seq_drop s n) (Seq_sub i n)) (Seq_index s i))))
  :pattern ((Seq_drop s n) (Seq_index s i))
  )))
(assert (forall ((s Seq<Int>) (t Seq<Int>) (n Int)) (!
  (=>
    (and (< 0 n) (<= n (Seq_length s)))
    (= (Seq_take (Seq_append s t) n) (Seq_take s n)))
  :pattern ((Seq_take (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Int>) (t Seq<Int>) (n Int)) (!
  (=>
    (and (> n 0) (> n (Seq_length s)))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s)) (Seq_length s)) n)
      (=
        (Seq_take (Seq_append s t) n)
        (Seq_append s (Seq_take t (Seq_sub n (Seq_length s)))))))
  :pattern ((Seq_take (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Int>) (t Seq<Int>) (n Int)) (!
  (=>
    (and (< 0 n) (<= n (Seq_length s)))
    (= (Seq_drop (Seq_append s t) n) (Seq_append (Seq_drop s n) t)))
  :pattern ((Seq_drop (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Int>) (t Seq<Int>) (n Int)) (!
  (=>
    (and (> n 0) (> n (Seq_length s)))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s)) (Seq_length s)) n)
      (= (Seq_drop (Seq_append s t) n) (Seq_drop t (Seq_sub n (Seq_length s))))))
  :pattern ((Seq_drop (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Int>) (n Int)) (!
  (=> (<= n 0) (= (Seq_take s n) (as Seq_empty  Seq<Int>)))
  :pattern ((Seq_take s n))
  )))
(assert (forall ((s Seq<Int>) (n Int)) (!
  (=> (<= n 0) (= (Seq_drop s n) s))
  :pattern ((Seq_drop s n))
  )))
(assert (forall ((s Seq<Int>) (n Int)) (!
  (=> (>= n (Seq_length s)) (= (Seq_take s n) s))
  :pattern ((Seq_take s n))
  )))
(assert (forall ((s Seq<Int>) (n Int)) (!
  (=> (>= n (Seq_length s)) (= (Seq_drop s n) (as Seq_empty  Seq<Int>)))
  :pattern ((Seq_drop s n))
  )))
(assert (forall ((s Seq<Int>) (x Int)) (!
  (=>
    (Seq_contains s x)
    (and
      (<= 0 (Seq_skolem s x))
      (and
        (< (Seq_skolem s x) (Seq_length s))
        (= (Seq_index s (Seq_skolem s x)) x))))
  :pattern ((Seq_contains s x))
  )))
(assert (forall ((s Seq<Int>) (x Int) (i Int)) (!
  (=>
    (and (<= 0 i) (and (< i (Seq_length s)) (= (Seq_index s i) x)))
    (Seq_contains s x))
  :pattern ((Seq_contains s x) (Seq_index s i))
  )))
(assert (forall ((s Seq<Int>) (i Int)) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (Seq_contains_trigger s (Seq_index s i)))
  :pattern ((Seq_index s i))
  )))
(assert (forall ((s0 Seq<Int>) (s1 Seq<Int>)) (!
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
(assert (forall ((a Seq<Int>) (b Seq<Int>)) (!
  (=> (Seq_equal a b) (= a b))
  :pattern ((Seq_equal a b))
  )))
(assert (forall ((x Int) (y Int)) (!
  (= (Seq_contains (Seq_singleton x) y) (= x y))
  :pattern ((Seq_contains (Seq_singleton x) y))
  )))
(assert (forall ((min_ Int) (max Int)) (!
  (and
    (=> (< min_ max) (= (Seq_length (Seq_range min_ max)) (- max min_)))
    (=> (<= max min_) (= (Seq_length (Seq_range min_ max)) 0)))
  :pattern ((Seq_length (Seq_range min_ max)))
  :qid |$Seq[Int]_prog.ranged_seq_length|)))
(assert (forall ((min_ Int) (max Int) (j Int)) (!
  (=>
    (and (<= 0 j) (< j (- max min_)))
    (= (Seq_index (Seq_range min_ max) j) (+ min_ j)))
  :pattern ((Seq_index (Seq_range min_ max) j))
  :qid |$Seq[Int]_prog.ranged_seq_index|)))
(assert (forall ((min_ Int) (max Int) (v Int)) (!
  (= (Seq_contains (Seq_range min_ max) v) (and (<= min_ v) (< v max)))
  :pattern ((Seq_contains (Seq_range min_ max) v))
  :qid |$Seq[Int]_prog.ranged_seq_contains|)))
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
; /field_value_functions_axioms.smt2 [array: Seq[Ref]]
(assert (forall ((vs $FVF<array>) (ws $FVF<array>)) (!
    (=>
      (and
        (Set_equal ($FVF.domain_array vs) ($FVF.domain_array ws))
        (forall ((x $Ref)) (!
          (=>
            (Set_in x ($FVF.domain_array vs))
            (= ($FVF.lookup_array vs x) ($FVF.lookup_array ws x)))
          :pattern (($FVF.lookup_array vs x) ($FVF.lookup_array ws x))
          :qid |qp.$FVF<array>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<array>To$Snap vs)
              ($SortWrappers.$FVF<array>To$Snap ws)
              )
    :qid |qp.$FVF<array>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_array pm r))
    :pattern (($FVF.perm_array pm r)))))
(assert (forall ((r $Ref) (f Seq<$Ref>)) (!
    (= ($FVF.loc_array f r) true)
    :pattern (($FVF.loc_array f r)))))
; /field_value_functions_axioms.smt2 [value: Int]
(assert (forall ((vs $FVF<value>) (ws $FVF<value>)) (!
    (=>
      (and
        (Set_equal ($FVF.domain_value vs) ($FVF.domain_value ws))
        (forall ((x $Ref)) (!
          (=>
            (Set_in x ($FVF.domain_value vs))
            (= ($FVF.lookup_value vs x) ($FVF.lookup_value ws x)))
          :pattern (($FVF.lookup_value vs x) ($FVF.lookup_value ws x))
          :qid |qp.$FVF<value>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<value>To$Snap vs)
              ($SortWrappers.$FVF<value>To$Snap ws)
              )
    :qid |qp.$FVF<value>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_value pm r))
    :pattern (($FVF.perm_value pm r)))))
(assert (forall ((r $Ref) (f Int)) (!
    (= ($FVF.loc_value f r) true)
    :pattern (($FVF.loc_value f r)))))
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
; ---------- parallel_mergesort ----------
(declare-const a@0@01 $Ref)
(declare-const b@1@01 $Ref)
(declare-const start@2@01 Int)
(declare-const end@3@01 Int)
(declare-const a@4@01 $Ref)
(declare-const b@5@01 $Ref)
(declare-const start@6@01 Int)
(declare-const end@7@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@8@01 $Snap)
(assert (= $t@8@01 ($Snap.combine ($Snap.first $t@8@01) ($Snap.second $t@8@01))))
(declare-const $k@9@01 $Perm)
(assert ($Perm.isReadVar $k@9@01))
(assert (<= $Perm.No $k@9@01))
(assert (<= $k@9@01 $Perm.Write))
(assert (=> (< $Perm.No $k@9@01) (not (= a@4@01 $Ref.null))))
(assert (=
  ($Snap.second $t@8@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@8@01))
    ($Snap.second ($Snap.second $t@8@01)))))
(declare-const $k@10@01 $Perm)
(assert ($Perm.isReadVar $k@10@01))
(push) ; 2
(set-option :timeout 10)
(assert (not (= a@4@01 b@5@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (<= $Perm.No $k@10@01))
(assert (<= $k@10@01 $Perm.Write))
(assert (=> (< $Perm.No $k@10@01) (not (= b@5@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second $t@8@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@8@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@8@01))) $Snap.unit))
; [eval] start >= 0
(assert (>= start@6@01 0))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@8@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01)))) $Snap.unit))
; [eval] end <= |a.array|
; [eval] |a.array|
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@9@01)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (<= end@7@01 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@8@01)))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))
  $Snap.unit))
; [eval] |a.array| == |b.array|
; [eval] |a.array|
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@9@01)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [eval] |b.array|
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (< $Perm.No $k@10@01)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (=
  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@8@01)))
  (Seq_length
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@8@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))
  $Snap.unit))
; [eval] (forall i: Int, j: Int :: { (i in [start..end)), (j in [start..end)) } { (i in [start..end)), a.array[j] } { (j in [start..end)), a.array[i] } { a.array[i], a.array[j] } (i in [start..end)) && ((j in [start..end)) && i != j) ==> a.array[i] != a.array[j])
(declare-const i@11@01 Int)
(declare-const j@12@01 Int)
(set-option :timeout 0)
(push) ; 2
; [eval] (i in [start..end)) && ((j in [start..end)) && i != j) ==> a.array[i] != a.array[j]
; [eval] (i in [start..end)) && ((j in [start..end)) && i != j)
; [eval] (i in [start..end))
; [eval] [start..end)
(push) ; 3
; [then-branch: 0 | !(i@11@01 in [start@6@01..end@7@01]) | live]
; [else-branch: 0 | i@11@01 in [start@6@01..end@7@01] | live]
(push) ; 4
; [then-branch: 0 | !(i@11@01 in [start@6@01..end@7@01])]
(assert (not (Seq_contains (Seq_range start@6@01 end@7@01) i@11@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | i@11@01 in [start@6@01..end@7@01]]
(assert (Seq_contains (Seq_range start@6@01 end@7@01) i@11@01))
; [eval] (j in [start..end))
; [eval] [start..end)
(push) ; 5
; [then-branch: 1 | !(j@12@01 in [start@6@01..end@7@01]) | live]
; [else-branch: 1 | j@12@01 in [start@6@01..end@7@01] | live]
(push) ; 6
; [then-branch: 1 | !(j@12@01 in [start@6@01..end@7@01])]
(assert (not (Seq_contains (Seq_range start@6@01 end@7@01) j@12@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 1 | j@12@01 in [start@6@01..end@7@01]]
(assert (Seq_contains (Seq_range start@6@01 end@7@01) j@12@01))
; [eval] i != j
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range start@6@01 end@7@01) j@12@01)
  (not (Seq_contains (Seq_range start@6@01 end@7@01) j@12@01))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range start@6@01 end@7@01) i@11@01)
  (and
    (Seq_contains (Seq_range start@6@01 end@7@01) i@11@01)
    (or
      (Seq_contains (Seq_range start@6@01 end@7@01) j@12@01)
      (not (Seq_contains (Seq_range start@6@01 end@7@01) j@12@01))))))
(assert (or
  (Seq_contains (Seq_range start@6@01 end@7@01) i@11@01)
  (not (Seq_contains (Seq_range start@6@01 end@7@01) i@11@01))))
(push) ; 3
; [then-branch: 2 | i@11@01 in [start@6@01..end@7@01] && j@12@01 in [start@6@01..end@7@01] && i@11@01 != j@12@01 | live]
; [else-branch: 2 | !(i@11@01 in [start@6@01..end@7@01] && j@12@01 in [start@6@01..end@7@01] && i@11@01 != j@12@01) | live]
(push) ; 4
; [then-branch: 2 | i@11@01 in [start@6@01..end@7@01] && j@12@01 in [start@6@01..end@7@01] && i@11@01 != j@12@01]
(assert (and
  (Seq_contains (Seq_range start@6@01 end@7@01) i@11@01)
  (and
    (Seq_contains (Seq_range start@6@01 end@7@01) j@12@01)
    (not (= i@11@01 j@12@01)))))
; [eval] a.array[i] != a.array[j]
; [eval] a.array[i]
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@9@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(assert (not (>= i@11@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@11@01 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@8@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] a.array[j]
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@9@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(assert (not (>= j@12@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< j@12@01 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@8@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 2 | !(i@11@01 in [start@6@01..end@7@01] && j@12@01 in [start@6@01..end@7@01] && i@11@01 != j@12@01)]
(assert (not
  (and
    (Seq_contains (Seq_range start@6@01 end@7@01) i@11@01)
    (and
      (Seq_contains (Seq_range start@6@01 end@7@01) j@12@01)
      (not (= i@11@01 j@12@01))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range start@6@01 end@7@01) i@11@01)
    (and
      (Seq_contains (Seq_range start@6@01 end@7@01) j@12@01)
      (not (= i@11@01 j@12@01))))
  (and
    (Seq_contains (Seq_range start@6@01 end@7@01) i@11@01)
    (Seq_contains (Seq_range start@6@01 end@7@01) j@12@01)
    (not (= i@11@01 j@12@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range start@6@01 end@7@01) i@11@01)
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) j@12@01)
        (not (= i@11@01 j@12@01)))))
  (and
    (Seq_contains (Seq_range start@6@01 end@7@01) i@11@01)
    (and
      (Seq_contains (Seq_range start@6@01 end@7@01) j@12@01)
      (not (= i@11@01 j@12@01))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@11@01 Int) (j@12@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range start@6@01 end@7@01) i@11@01)
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@11@01)
        (or
          (Seq_contains (Seq_range start@6@01 end@7@01) j@12@01)
          (not (Seq_contains (Seq_range start@6@01 end@7@01) j@12@01)))))
    (or
      (Seq_contains (Seq_range start@6@01 end@7@01) i@11@01)
      (not (Seq_contains (Seq_range start@6@01 end@7@01) i@11@01)))
    (=>
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@11@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@12@01)
          (not (= i@11@01 j@12@01))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@11@01)
        (Seq_contains (Seq_range start@6@01 end@7@01) j@12@01)
        (not (= i@11@01 j@12@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) i@11@01)
          (and
            (Seq_contains (Seq_range start@6@01 end@7@01) j@12@01)
            (not (= i@11@01 j@12@01)))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@11@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@12@01)
          (not (= i@11@01 j@12@01))))))
  :pattern ((Seq_contains (Seq_range start@6@01 end@7@01) i@11@01) (Seq_contains
    (Seq_range start@6@01 end@7@01)
    j@12@01))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) i@11@01) (Seq_contains_trigger
    (Seq_range start@6@01 end@7@01)
    j@12@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/mergesort.vpr@14@12@14@112-aux|)))
(assert (forall ((i@11@01 Int) (j@12@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range start@6@01 end@7@01) i@11@01)
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@11@01)
        (or
          (Seq_contains (Seq_range start@6@01 end@7@01) j@12@01)
          (not (Seq_contains (Seq_range start@6@01 end@7@01) j@12@01)))))
    (or
      (Seq_contains (Seq_range start@6@01 end@7@01) i@11@01)
      (not (Seq_contains (Seq_range start@6@01 end@7@01) i@11@01)))
    (=>
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@11@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@12@01)
          (not (= i@11@01 j@12@01))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@11@01)
        (Seq_contains (Seq_range start@6@01 end@7@01) j@12@01)
        (not (= i@11@01 j@12@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) i@11@01)
          (and
            (Seq_contains (Seq_range start@6@01 end@7@01) j@12@01)
            (not (= i@11@01 j@12@01)))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@11@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@12@01)
          (not (= i@11@01 j@12@01))))))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) i@11@01) (Seq_contains_trigger
    (Seq_range start@6@01 end@7@01)
    j@12@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/mergesort.vpr@14@12@14@112-aux|)))
(assert (forall ((i@11@01 Int) (j@12@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range start@6@01 end@7@01) i@11@01)
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@11@01)
        (or
          (Seq_contains (Seq_range start@6@01 end@7@01) j@12@01)
          (not (Seq_contains (Seq_range start@6@01 end@7@01) j@12@01)))))
    (or
      (Seq_contains (Seq_range start@6@01 end@7@01) i@11@01)
      (not (Seq_contains (Seq_range start@6@01 end@7@01) i@11@01)))
    (=>
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@11@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@12@01)
          (not (= i@11@01 j@12@01))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@11@01)
        (Seq_contains (Seq_range start@6@01 end@7@01) j@12@01)
        (not (= i@11@01 j@12@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) i@11@01)
          (and
            (Seq_contains (Seq_range start@6@01 end@7@01) j@12@01)
            (not (= i@11@01 j@12@01)))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@11@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@12@01)
          (not (= i@11@01 j@12@01))))))
  :pattern ((Seq_contains (Seq_range start@6@01 end@7@01) i@11@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@8@01))
    j@12@01))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) i@11@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@8@01))
    j@12@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/mergesort.vpr@14@12@14@112-aux|)))
(assert (forall ((i@11@01 Int) (j@12@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range start@6@01 end@7@01) i@11@01)
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@11@01)
        (or
          (Seq_contains (Seq_range start@6@01 end@7@01) j@12@01)
          (not (Seq_contains (Seq_range start@6@01 end@7@01) j@12@01)))))
    (or
      (Seq_contains (Seq_range start@6@01 end@7@01) i@11@01)
      (not (Seq_contains (Seq_range start@6@01 end@7@01) i@11@01)))
    (=>
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@11@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@12@01)
          (not (= i@11@01 j@12@01))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@11@01)
        (Seq_contains (Seq_range start@6@01 end@7@01) j@12@01)
        (not (= i@11@01 j@12@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) i@11@01)
          (and
            (Seq_contains (Seq_range start@6@01 end@7@01) j@12@01)
            (not (= i@11@01 j@12@01)))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@11@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@12@01)
          (not (= i@11@01 j@12@01))))))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) i@11@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@8@01))
    j@12@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/mergesort.vpr@14@12@14@112-aux|)))
(assert (forall ((i@11@01 Int) (j@12@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range start@6@01 end@7@01) i@11@01)
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@11@01)
        (or
          (Seq_contains (Seq_range start@6@01 end@7@01) j@12@01)
          (not (Seq_contains (Seq_range start@6@01 end@7@01) j@12@01)))))
    (or
      (Seq_contains (Seq_range start@6@01 end@7@01) i@11@01)
      (not (Seq_contains (Seq_range start@6@01 end@7@01) i@11@01)))
    (=>
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@11@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@12@01)
          (not (= i@11@01 j@12@01))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@11@01)
        (Seq_contains (Seq_range start@6@01 end@7@01) j@12@01)
        (not (= i@11@01 j@12@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) i@11@01)
          (and
            (Seq_contains (Seq_range start@6@01 end@7@01) j@12@01)
            (not (= i@11@01 j@12@01)))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@11@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@12@01)
          (not (= i@11@01 j@12@01))))))
  :pattern ((Seq_contains (Seq_range start@6@01 end@7@01) j@12@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@8@01))
    i@11@01))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) j@12@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@8@01))
    i@11@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/mergesort.vpr@14@12@14@112-aux|)))
(assert (forall ((i@11@01 Int) (j@12@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range start@6@01 end@7@01) i@11@01)
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@11@01)
        (or
          (Seq_contains (Seq_range start@6@01 end@7@01) j@12@01)
          (not (Seq_contains (Seq_range start@6@01 end@7@01) j@12@01)))))
    (or
      (Seq_contains (Seq_range start@6@01 end@7@01) i@11@01)
      (not (Seq_contains (Seq_range start@6@01 end@7@01) i@11@01)))
    (=>
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@11@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@12@01)
          (not (= i@11@01 j@12@01))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@11@01)
        (Seq_contains (Seq_range start@6@01 end@7@01) j@12@01)
        (not (= i@11@01 j@12@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) i@11@01)
          (and
            (Seq_contains (Seq_range start@6@01 end@7@01) j@12@01)
            (not (= i@11@01 j@12@01)))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@11@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@12@01)
          (not (= i@11@01 j@12@01))))))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) j@12@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@8@01))
    i@11@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/mergesort.vpr@14@12@14@112-aux|)))
(assert (forall ((i@11@01 Int) (j@12@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range start@6@01 end@7@01) i@11@01)
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@11@01)
        (or
          (Seq_contains (Seq_range start@6@01 end@7@01) j@12@01)
          (not (Seq_contains (Seq_range start@6@01 end@7@01) j@12@01)))))
    (or
      (Seq_contains (Seq_range start@6@01 end@7@01) i@11@01)
      (not (Seq_contains (Seq_range start@6@01 end@7@01) i@11@01)))
    (=>
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@11@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@12@01)
          (not (= i@11@01 j@12@01))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@11@01)
        (Seq_contains (Seq_range start@6@01 end@7@01) j@12@01)
        (not (= i@11@01 j@12@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) i@11@01)
          (and
            (Seq_contains (Seq_range start@6@01 end@7@01) j@12@01)
            (not (= i@11@01 j@12@01)))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@11@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@12@01)
          (not (= i@11@01 j@12@01))))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@8@01))
    i@11@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@8@01))
    j@12@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/mergesort.vpr@14@12@14@112-aux|)))
(assert (forall ((i@11@01 Int) (j@12@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range start@6@01 end@7@01) i@11@01)
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) j@12@01)
        (not (= i@11@01 j@12@01))))
    (not
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@8@01))
          i@11@01)
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@8@01))
          j@12@01))))
  :pattern ((Seq_contains (Seq_range start@6@01 end@7@01) i@11@01) (Seq_contains
    (Seq_range start@6@01 end@7@01)
    j@12@01))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) i@11@01) (Seq_contains_trigger
    (Seq_range start@6@01 end@7@01)
    j@12@01))
  :pattern ((Seq_contains (Seq_range start@6@01 end@7@01) i@11@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@8@01))
    j@12@01))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) i@11@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@8@01))
    j@12@01))
  :pattern ((Seq_contains (Seq_range start@6@01 end@7@01) j@12@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@8@01))
    i@11@01))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) j@12@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@8@01))
    i@11@01))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@8@01))
    i@11@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@8@01))
    j@12@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/mergesort.vpr@14@12@14@112|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))))
(declare-const i@13@01 Int)
(push) ; 2
; [eval] (i in [start..end))
; [eval] [start..end)
(assert (Seq_contains (Seq_range start@6@01 end@7@01) i@13@01))
; [eval] a.array[i]
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@9@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(assert (not (>= i@13@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@13@01 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@8@01))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@14@01 ($Ref) Int)
(declare-fun img@15@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@13@01 Int) (i2@13@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range start@6@01 end@7@01) i1@13@01)
      (Seq_contains (Seq_range start@6@01 end@7@01) i2@13@01)
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@8@01))
          i1@13@01)
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@8@01))
          i2@13@01)))
    (= i1@13@01 i2@13@01))
  
  :qid |value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@13@01 Int)) (!
  (=>
    (Seq_contains (Seq_range start@6@01 end@7@01) i@13@01)
    (and
      (=
        (inv@14@01 (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@8@01))
          i@13@01))
        i@13@01)
      (img@15@01 (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@8@01))
        i@13@01))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@8@01))
    i@13@01))
  :qid |quant-u-1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@15@01 r)
      (Seq_contains (Seq_range start@6@01 end@7@01) (inv@14@01 r)))
    (=
      (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@8@01))
        (inv@14@01 r))
      r))
  :pattern ((inv@14@01 r))
  :qid |value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@13@01 Int)) (!
  (=>
    (Seq_contains (Seq_range start@6@01 end@7@01) i@13@01)
    (not
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@8@01))
          i@13@01)
        $Ref.null)))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@8@01))
    i@13@01))
  :qid |value-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))
  $Snap.unit))
; [eval] (forall i: Int, j: Int :: { (i in [start..end)), (j in [start..end)) } { (i in [start..end)), b.array[j] } { (j in [start..end)), b.array[i] } { b.array[i], b.array[j] } (i in [start..end)) && ((j in [start..end)) && i != j) ==> b.array[i] != b.array[j])
(declare-const i@16@01 Int)
(declare-const j@17@01 Int)
(push) ; 2
; [eval] (i in [start..end)) && ((j in [start..end)) && i != j) ==> b.array[i] != b.array[j]
; [eval] (i in [start..end)) && ((j in [start..end)) && i != j)
; [eval] (i in [start..end))
; [eval] [start..end)
(push) ; 3
; [then-branch: 3 | !(i@16@01 in [start@6@01..end@7@01]) | live]
; [else-branch: 3 | i@16@01 in [start@6@01..end@7@01] | live]
(push) ; 4
; [then-branch: 3 | !(i@16@01 in [start@6@01..end@7@01])]
(assert (not (Seq_contains (Seq_range start@6@01 end@7@01) i@16@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 3 | i@16@01 in [start@6@01..end@7@01]]
(assert (Seq_contains (Seq_range start@6@01 end@7@01) i@16@01))
; [eval] (j in [start..end))
; [eval] [start..end)
(push) ; 5
; [then-branch: 4 | !(j@17@01 in [start@6@01..end@7@01]) | live]
; [else-branch: 4 | j@17@01 in [start@6@01..end@7@01] | live]
(push) ; 6
; [then-branch: 4 | !(j@17@01 in [start@6@01..end@7@01])]
(assert (not (Seq_contains (Seq_range start@6@01 end@7@01) j@17@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 4 | j@17@01 in [start@6@01..end@7@01]]
(assert (Seq_contains (Seq_range start@6@01 end@7@01) j@17@01))
; [eval] i != j
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range start@6@01 end@7@01) j@17@01)
  (not (Seq_contains (Seq_range start@6@01 end@7@01) j@17@01))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range start@6@01 end@7@01) i@16@01)
  (and
    (Seq_contains (Seq_range start@6@01 end@7@01) i@16@01)
    (or
      (Seq_contains (Seq_range start@6@01 end@7@01) j@17@01)
      (not (Seq_contains (Seq_range start@6@01 end@7@01) j@17@01))))))
(assert (or
  (Seq_contains (Seq_range start@6@01 end@7@01) i@16@01)
  (not (Seq_contains (Seq_range start@6@01 end@7@01) i@16@01))))
(push) ; 3
; [then-branch: 5 | i@16@01 in [start@6@01..end@7@01] && j@17@01 in [start@6@01..end@7@01] && i@16@01 != j@17@01 | live]
; [else-branch: 5 | !(i@16@01 in [start@6@01..end@7@01] && j@17@01 in [start@6@01..end@7@01] && i@16@01 != j@17@01) | live]
(push) ; 4
; [then-branch: 5 | i@16@01 in [start@6@01..end@7@01] && j@17@01 in [start@6@01..end@7@01] && i@16@01 != j@17@01]
(assert (and
  (Seq_contains (Seq_range start@6@01 end@7@01) i@16@01)
  (and
    (Seq_contains (Seq_range start@6@01 end@7@01) j@17@01)
    (not (= i@16@01 j@17@01)))))
; [eval] b.array[i] != b.array[j]
; [eval] b.array[i]
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@10@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(assert (not (>= i@16@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (<
  i@16@01
  (Seq_length
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@8@01)))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] b.array[j]
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No $k@10@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(assert (not (>= j@17@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (<
  j@17@01
  (Seq_length
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@8@01)))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 5 | !(i@16@01 in [start@6@01..end@7@01] && j@17@01 in [start@6@01..end@7@01] && i@16@01 != j@17@01)]
(assert (not
  (and
    (Seq_contains (Seq_range start@6@01 end@7@01) i@16@01)
    (and
      (Seq_contains (Seq_range start@6@01 end@7@01) j@17@01)
      (not (= i@16@01 j@17@01))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range start@6@01 end@7@01) i@16@01)
    (and
      (Seq_contains (Seq_range start@6@01 end@7@01) j@17@01)
      (not (= i@16@01 j@17@01))))
  (and
    (Seq_contains (Seq_range start@6@01 end@7@01) i@16@01)
    (Seq_contains (Seq_range start@6@01 end@7@01) j@17@01)
    (not (= i@16@01 j@17@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range start@6@01 end@7@01) i@16@01)
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) j@17@01)
        (not (= i@16@01 j@17@01)))))
  (and
    (Seq_contains (Seq_range start@6@01 end@7@01) i@16@01)
    (and
      (Seq_contains (Seq_range start@6@01 end@7@01) j@17@01)
      (not (= i@16@01 j@17@01))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@16@01 Int) (j@17@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range start@6@01 end@7@01) i@16@01)
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@16@01)
        (or
          (Seq_contains (Seq_range start@6@01 end@7@01) j@17@01)
          (not (Seq_contains (Seq_range start@6@01 end@7@01) j@17@01)))))
    (or
      (Seq_contains (Seq_range start@6@01 end@7@01) i@16@01)
      (not (Seq_contains (Seq_range start@6@01 end@7@01) i@16@01)))
    (=>
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@16@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@17@01)
          (not (= i@16@01 j@17@01))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@16@01)
        (Seq_contains (Seq_range start@6@01 end@7@01) j@17@01)
        (not (= i@16@01 j@17@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) i@16@01)
          (and
            (Seq_contains (Seq_range start@6@01 end@7@01) j@17@01)
            (not (= i@16@01 j@17@01)))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@16@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@17@01)
          (not (= i@16@01 j@17@01))))))
  :pattern ((Seq_contains (Seq_range start@6@01 end@7@01) i@16@01) (Seq_contains
    (Seq_range start@6@01 end@7@01)
    j@17@01))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) i@16@01) (Seq_contains_trigger
    (Seq_range start@6@01 end@7@01)
    j@17@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/mergesort.vpr@16@12@16@112-aux|)))
(assert (forall ((i@16@01 Int) (j@17@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range start@6@01 end@7@01) i@16@01)
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@16@01)
        (or
          (Seq_contains (Seq_range start@6@01 end@7@01) j@17@01)
          (not (Seq_contains (Seq_range start@6@01 end@7@01) j@17@01)))))
    (or
      (Seq_contains (Seq_range start@6@01 end@7@01) i@16@01)
      (not (Seq_contains (Seq_range start@6@01 end@7@01) i@16@01)))
    (=>
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@16@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@17@01)
          (not (= i@16@01 j@17@01))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@16@01)
        (Seq_contains (Seq_range start@6@01 end@7@01) j@17@01)
        (not (= i@16@01 j@17@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) i@16@01)
          (and
            (Seq_contains (Seq_range start@6@01 end@7@01) j@17@01)
            (not (= i@16@01 j@17@01)))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@16@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@17@01)
          (not (= i@16@01 j@17@01))))))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) i@16@01) (Seq_contains_trigger
    (Seq_range start@6@01 end@7@01)
    j@17@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/mergesort.vpr@16@12@16@112-aux|)))
(assert (forall ((i@16@01 Int) (j@17@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range start@6@01 end@7@01) i@16@01)
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@16@01)
        (or
          (Seq_contains (Seq_range start@6@01 end@7@01) j@17@01)
          (not (Seq_contains (Seq_range start@6@01 end@7@01) j@17@01)))))
    (or
      (Seq_contains (Seq_range start@6@01 end@7@01) i@16@01)
      (not (Seq_contains (Seq_range start@6@01 end@7@01) i@16@01)))
    (=>
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@16@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@17@01)
          (not (= i@16@01 j@17@01))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@16@01)
        (Seq_contains (Seq_range start@6@01 end@7@01) j@17@01)
        (not (= i@16@01 j@17@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) i@16@01)
          (and
            (Seq_contains (Seq_range start@6@01 end@7@01) j@17@01)
            (not (= i@16@01 j@17@01)))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@16@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@17@01)
          (not (= i@16@01 j@17@01))))))
  :pattern ((Seq_contains (Seq_range start@6@01 end@7@01) i@16@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@8@01)))
    j@17@01))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) i@16@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@8@01)))
    j@17@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/mergesort.vpr@16@12@16@112-aux|)))
(assert (forall ((i@16@01 Int) (j@17@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range start@6@01 end@7@01) i@16@01)
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@16@01)
        (or
          (Seq_contains (Seq_range start@6@01 end@7@01) j@17@01)
          (not (Seq_contains (Seq_range start@6@01 end@7@01) j@17@01)))))
    (or
      (Seq_contains (Seq_range start@6@01 end@7@01) i@16@01)
      (not (Seq_contains (Seq_range start@6@01 end@7@01) i@16@01)))
    (=>
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@16@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@17@01)
          (not (= i@16@01 j@17@01))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@16@01)
        (Seq_contains (Seq_range start@6@01 end@7@01) j@17@01)
        (not (= i@16@01 j@17@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) i@16@01)
          (and
            (Seq_contains (Seq_range start@6@01 end@7@01) j@17@01)
            (not (= i@16@01 j@17@01)))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@16@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@17@01)
          (not (= i@16@01 j@17@01))))))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) i@16@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@8@01)))
    j@17@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/mergesort.vpr@16@12@16@112-aux|)))
(assert (forall ((i@16@01 Int) (j@17@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range start@6@01 end@7@01) i@16@01)
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@16@01)
        (or
          (Seq_contains (Seq_range start@6@01 end@7@01) j@17@01)
          (not (Seq_contains (Seq_range start@6@01 end@7@01) j@17@01)))))
    (or
      (Seq_contains (Seq_range start@6@01 end@7@01) i@16@01)
      (not (Seq_contains (Seq_range start@6@01 end@7@01) i@16@01)))
    (=>
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@16@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@17@01)
          (not (= i@16@01 j@17@01))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@16@01)
        (Seq_contains (Seq_range start@6@01 end@7@01) j@17@01)
        (not (= i@16@01 j@17@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) i@16@01)
          (and
            (Seq_contains (Seq_range start@6@01 end@7@01) j@17@01)
            (not (= i@16@01 j@17@01)))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@16@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@17@01)
          (not (= i@16@01 j@17@01))))))
  :pattern ((Seq_contains (Seq_range start@6@01 end@7@01) j@17@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@8@01)))
    i@16@01))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) j@17@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@8@01)))
    i@16@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/mergesort.vpr@16@12@16@112-aux|)))
(assert (forall ((i@16@01 Int) (j@17@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range start@6@01 end@7@01) i@16@01)
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@16@01)
        (or
          (Seq_contains (Seq_range start@6@01 end@7@01) j@17@01)
          (not (Seq_contains (Seq_range start@6@01 end@7@01) j@17@01)))))
    (or
      (Seq_contains (Seq_range start@6@01 end@7@01) i@16@01)
      (not (Seq_contains (Seq_range start@6@01 end@7@01) i@16@01)))
    (=>
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@16@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@17@01)
          (not (= i@16@01 j@17@01))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@16@01)
        (Seq_contains (Seq_range start@6@01 end@7@01) j@17@01)
        (not (= i@16@01 j@17@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) i@16@01)
          (and
            (Seq_contains (Seq_range start@6@01 end@7@01) j@17@01)
            (not (= i@16@01 j@17@01)))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@16@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@17@01)
          (not (= i@16@01 j@17@01))))))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) j@17@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@8@01)))
    i@16@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/mergesort.vpr@16@12@16@112-aux|)))
(assert (forall ((i@16@01 Int) (j@17@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range start@6@01 end@7@01) i@16@01)
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@16@01)
        (or
          (Seq_contains (Seq_range start@6@01 end@7@01) j@17@01)
          (not (Seq_contains (Seq_range start@6@01 end@7@01) j@17@01)))))
    (or
      (Seq_contains (Seq_range start@6@01 end@7@01) i@16@01)
      (not (Seq_contains (Seq_range start@6@01 end@7@01) i@16@01)))
    (=>
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@16@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@17@01)
          (not (= i@16@01 j@17@01))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@16@01)
        (Seq_contains (Seq_range start@6@01 end@7@01) j@17@01)
        (not (= i@16@01 j@17@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) i@16@01)
          (and
            (Seq_contains (Seq_range start@6@01 end@7@01) j@17@01)
            (not (= i@16@01 j@17@01)))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@16@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@17@01)
          (not (= i@16@01 j@17@01))))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@8@01)))
    i@16@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@8@01)))
    j@17@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/mergesort.vpr@16@12@16@112-aux|)))
(assert (forall ((i@16@01 Int) (j@17@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range start@6@01 end@7@01) i@16@01)
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) j@17@01)
        (not (= i@16@01 j@17@01))))
    (not
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@8@01)))
          i@16@01)
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@8@01)))
          j@17@01))))
  :pattern ((Seq_contains (Seq_range start@6@01 end@7@01) i@16@01) (Seq_contains
    (Seq_range start@6@01 end@7@01)
    j@17@01))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) i@16@01) (Seq_contains_trigger
    (Seq_range start@6@01 end@7@01)
    j@17@01))
  :pattern ((Seq_contains (Seq_range start@6@01 end@7@01) i@16@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@8@01)))
    j@17@01))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) i@16@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@8@01)))
    j@17@01))
  :pattern ((Seq_contains (Seq_range start@6@01 end@7@01) j@17@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@8@01)))
    i@16@01))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) j@17@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@8@01)))
    i@16@01))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@8@01)))
    i@16@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@8@01)))
    j@17@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/mergesort.vpr@16@12@16@112|)))
(declare-const i@18@01 Int)
(push) ; 2
; [eval] (i in [start..end))
; [eval] [start..end)
(assert (Seq_contains (Seq_range start@6@01 end@7@01) i@18@01))
; [eval] b.array[i]
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@10@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(assert (not (>= i@18@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (<
  i@18@01
  (Seq_length
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@8@01)))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@19@01 ($Ref) Int)
(declare-fun img@20@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@18@01 Int) (i2@18@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range start@6@01 end@7@01) i1@18@01)
      (Seq_contains (Seq_range start@6@01 end@7@01) i2@18@01)
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@8@01)))
          i1@18@01)
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@8@01)))
          i2@18@01)))
    (= i1@18@01 i2@18@01))
  
  :qid |value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@18@01 Int)) (!
  (=>
    (Seq_contains (Seq_range start@6@01 end@7@01) i@18@01)
    (and
      (=
        (inv@19@01 (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@8@01)))
          i@18@01))
        i@18@01)
      (img@20@01 (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@8@01)))
        i@18@01))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@8@01)))
    i@18@01))
  :qid |quant-u-3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@20@01 r)
      (Seq_contains (Seq_range start@6@01 end@7@01) (inv@19@01 r)))
    (=
      (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@8@01)))
        (inv@19@01 r))
      r))
  :pattern ((inv@19@01 r))
  :qid |value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@18@01 Int)) (!
  (=>
    (Seq_contains (Seq_range start@6@01 end@7@01) i@18@01)
    (not
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@8@01)))
          i@18@01)
        $Ref.null)))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@8@01)))
    i@18@01))
  :qid |value-permImpliesNonNull|)))
(push) ; 2
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (=
      (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@8@01)))
        i@18@01)
      (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@8@01)) i@13@01))
    (=
      (and
        (img@20@01 r)
        (Seq_contains (Seq_range start@6@01 end@7@01) (inv@19@01 r)))
      (and
        (img@15@01 r)
        (Seq_contains (Seq_range start@6@01 end@7@01) (inv@14@01 r)))))
  
  :qid |quant-u-4|))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@21@01 $Snap)
(assert (= $t@21@01 ($Snap.combine ($Snap.first $t@21@01) ($Snap.second $t@21@01))))
(declare-const $k@22@01 $Perm)
(assert ($Perm.isReadVar $k@22@01))
(assert (<= $Perm.No $k@22@01))
(assert (<= $k@22@01 $Perm.Write))
(assert (=> (< $Perm.No $k@22@01) (not (= a@4@01 $Ref.null))))
(assert (=
  ($Snap.second $t@21@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@21@01))
    ($Snap.second ($Snap.second $t@21@01)))))
(declare-const $k@23@01 $Perm)
(assert ($Perm.isReadVar $k@23@01))
(push) ; 3
(set-option :timeout 10)
(assert (not (= a@4@01 b@5@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (<= $Perm.No $k@23@01))
(assert (<= $k@23@01 $Perm.Write))
(assert (=> (< $Perm.No $k@23@01) (not (= b@5@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second $t@21@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@21@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@21@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@21@01))) $Snap.unit))
; [eval] start >= 0
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@21@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@21@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@21@01))))
  $Snap.unit))
; [eval] end <= |a.array|
; [eval] |a.array|
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@22@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (<=
  end@7@01
  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@21@01)))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01)))))
  $Snap.unit))
; [eval] |a.array| == |b.array|
; [eval] |a.array|
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@22@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] |b.array|
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@23@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@21@01)))
  (Seq_length
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@21@01))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01))))))
  $Snap.unit))
; [eval] (forall i: Int, j: Int :: { (i in [start..end)), (j in [start..end)) } { (i in [start..end)), a.array[j] } { (j in [start..end)), a.array[i] } { a.array[i], a.array[j] } (i in [start..end)) && ((j in [start..end)) && i != j) ==> a.array[i] != a.array[j])
(declare-const i@24@01 Int)
(declare-const j@25@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (i in [start..end)) && ((j in [start..end)) && i != j) ==> a.array[i] != a.array[j]
; [eval] (i in [start..end)) && ((j in [start..end)) && i != j)
; [eval] (i in [start..end))
; [eval] [start..end)
(push) ; 4
; [then-branch: 6 | !(i@24@01 in [start@6@01..end@7@01]) | live]
; [else-branch: 6 | i@24@01 in [start@6@01..end@7@01] | live]
(push) ; 5
; [then-branch: 6 | !(i@24@01 in [start@6@01..end@7@01])]
(assert (not (Seq_contains (Seq_range start@6@01 end@7@01) i@24@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 6 | i@24@01 in [start@6@01..end@7@01]]
(assert (Seq_contains (Seq_range start@6@01 end@7@01) i@24@01))
; [eval] (j in [start..end))
; [eval] [start..end)
(push) ; 6
; [then-branch: 7 | !(j@25@01 in [start@6@01..end@7@01]) | live]
; [else-branch: 7 | j@25@01 in [start@6@01..end@7@01] | live]
(push) ; 7
; [then-branch: 7 | !(j@25@01 in [start@6@01..end@7@01])]
(assert (not (Seq_contains (Seq_range start@6@01 end@7@01) j@25@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 7 | j@25@01 in [start@6@01..end@7@01]]
(assert (Seq_contains (Seq_range start@6@01 end@7@01) j@25@01))
; [eval] i != j
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range start@6@01 end@7@01) j@25@01)
  (not (Seq_contains (Seq_range start@6@01 end@7@01) j@25@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range start@6@01 end@7@01) i@24@01)
  (and
    (Seq_contains (Seq_range start@6@01 end@7@01) i@24@01)
    (or
      (Seq_contains (Seq_range start@6@01 end@7@01) j@25@01)
      (not (Seq_contains (Seq_range start@6@01 end@7@01) j@25@01))))))
(assert (or
  (Seq_contains (Seq_range start@6@01 end@7@01) i@24@01)
  (not (Seq_contains (Seq_range start@6@01 end@7@01) i@24@01))))
(push) ; 4
; [then-branch: 8 | i@24@01 in [start@6@01..end@7@01] && j@25@01 in [start@6@01..end@7@01] && i@24@01 != j@25@01 | live]
; [else-branch: 8 | !(i@24@01 in [start@6@01..end@7@01] && j@25@01 in [start@6@01..end@7@01] && i@24@01 != j@25@01) | live]
(push) ; 5
; [then-branch: 8 | i@24@01 in [start@6@01..end@7@01] && j@25@01 in [start@6@01..end@7@01] && i@24@01 != j@25@01]
(assert (and
  (Seq_contains (Seq_range start@6@01 end@7@01) i@24@01)
  (and
    (Seq_contains (Seq_range start@6@01 end@7@01) j@25@01)
    (not (= i@24@01 j@25@01)))))
; [eval] a.array[i] != a.array[j]
; [eval] a.array[i]
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No $k@22@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(assert (not (>= i@24@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@24@01 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@21@01))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] a.array[j]
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No $k@22@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(assert (not (>= j@25@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< j@25@01 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@21@01))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 8 | !(i@24@01 in [start@6@01..end@7@01] && j@25@01 in [start@6@01..end@7@01] && i@24@01 != j@25@01)]
(assert (not
  (and
    (Seq_contains (Seq_range start@6@01 end@7@01) i@24@01)
    (and
      (Seq_contains (Seq_range start@6@01 end@7@01) j@25@01)
      (not (= i@24@01 j@25@01))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range start@6@01 end@7@01) i@24@01)
    (and
      (Seq_contains (Seq_range start@6@01 end@7@01) j@25@01)
      (not (= i@24@01 j@25@01))))
  (and
    (Seq_contains (Seq_range start@6@01 end@7@01) i@24@01)
    (Seq_contains (Seq_range start@6@01 end@7@01) j@25@01)
    (not (= i@24@01 j@25@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range start@6@01 end@7@01) i@24@01)
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) j@25@01)
        (not (= i@24@01 j@25@01)))))
  (and
    (Seq_contains (Seq_range start@6@01 end@7@01) i@24@01)
    (and
      (Seq_contains (Seq_range start@6@01 end@7@01) j@25@01)
      (not (= i@24@01 j@25@01))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@24@01 Int) (j@25@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range start@6@01 end@7@01) i@24@01)
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@24@01)
        (or
          (Seq_contains (Seq_range start@6@01 end@7@01) j@25@01)
          (not (Seq_contains (Seq_range start@6@01 end@7@01) j@25@01)))))
    (or
      (Seq_contains (Seq_range start@6@01 end@7@01) i@24@01)
      (not (Seq_contains (Seq_range start@6@01 end@7@01) i@24@01)))
    (=>
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@24@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@25@01)
          (not (= i@24@01 j@25@01))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@24@01)
        (Seq_contains (Seq_range start@6@01 end@7@01) j@25@01)
        (not (= i@24@01 j@25@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) i@24@01)
          (and
            (Seq_contains (Seq_range start@6@01 end@7@01) j@25@01)
            (not (= i@24@01 j@25@01)))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@24@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@25@01)
          (not (= i@24@01 j@25@01))))))
  :pattern ((Seq_contains (Seq_range start@6@01 end@7@01) i@24@01) (Seq_contains
    (Seq_range start@6@01 end@7@01)
    j@25@01))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) i@24@01) (Seq_contains_trigger
    (Seq_range start@6@01 end@7@01)
    j@25@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/mergesort.vpr@21@11@21@111-aux|)))
(assert (forall ((i@24@01 Int) (j@25@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range start@6@01 end@7@01) i@24@01)
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@24@01)
        (or
          (Seq_contains (Seq_range start@6@01 end@7@01) j@25@01)
          (not (Seq_contains (Seq_range start@6@01 end@7@01) j@25@01)))))
    (or
      (Seq_contains (Seq_range start@6@01 end@7@01) i@24@01)
      (not (Seq_contains (Seq_range start@6@01 end@7@01) i@24@01)))
    (=>
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@24@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@25@01)
          (not (= i@24@01 j@25@01))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@24@01)
        (Seq_contains (Seq_range start@6@01 end@7@01) j@25@01)
        (not (= i@24@01 j@25@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) i@24@01)
          (and
            (Seq_contains (Seq_range start@6@01 end@7@01) j@25@01)
            (not (= i@24@01 j@25@01)))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@24@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@25@01)
          (not (= i@24@01 j@25@01))))))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) i@24@01) (Seq_contains_trigger
    (Seq_range start@6@01 end@7@01)
    j@25@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/mergesort.vpr@21@11@21@111-aux|)))
(assert (forall ((i@24@01 Int) (j@25@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range start@6@01 end@7@01) i@24@01)
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@24@01)
        (or
          (Seq_contains (Seq_range start@6@01 end@7@01) j@25@01)
          (not (Seq_contains (Seq_range start@6@01 end@7@01) j@25@01)))))
    (or
      (Seq_contains (Seq_range start@6@01 end@7@01) i@24@01)
      (not (Seq_contains (Seq_range start@6@01 end@7@01) i@24@01)))
    (=>
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@24@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@25@01)
          (not (= i@24@01 j@25@01))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@24@01)
        (Seq_contains (Seq_range start@6@01 end@7@01) j@25@01)
        (not (= i@24@01 j@25@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) i@24@01)
          (and
            (Seq_contains (Seq_range start@6@01 end@7@01) j@25@01)
            (not (= i@24@01 j@25@01)))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@24@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@25@01)
          (not (= i@24@01 j@25@01))))))
  :pattern ((Seq_contains (Seq_range start@6@01 end@7@01) i@24@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@21@01))
    j@25@01))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) i@24@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@21@01))
    j@25@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/mergesort.vpr@21@11@21@111-aux|)))
(assert (forall ((i@24@01 Int) (j@25@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range start@6@01 end@7@01) i@24@01)
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@24@01)
        (or
          (Seq_contains (Seq_range start@6@01 end@7@01) j@25@01)
          (not (Seq_contains (Seq_range start@6@01 end@7@01) j@25@01)))))
    (or
      (Seq_contains (Seq_range start@6@01 end@7@01) i@24@01)
      (not (Seq_contains (Seq_range start@6@01 end@7@01) i@24@01)))
    (=>
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@24@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@25@01)
          (not (= i@24@01 j@25@01))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@24@01)
        (Seq_contains (Seq_range start@6@01 end@7@01) j@25@01)
        (not (= i@24@01 j@25@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) i@24@01)
          (and
            (Seq_contains (Seq_range start@6@01 end@7@01) j@25@01)
            (not (= i@24@01 j@25@01)))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@24@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@25@01)
          (not (= i@24@01 j@25@01))))))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) i@24@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@21@01))
    j@25@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/mergesort.vpr@21@11@21@111-aux|)))
(assert (forall ((i@24@01 Int) (j@25@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range start@6@01 end@7@01) i@24@01)
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@24@01)
        (or
          (Seq_contains (Seq_range start@6@01 end@7@01) j@25@01)
          (not (Seq_contains (Seq_range start@6@01 end@7@01) j@25@01)))))
    (or
      (Seq_contains (Seq_range start@6@01 end@7@01) i@24@01)
      (not (Seq_contains (Seq_range start@6@01 end@7@01) i@24@01)))
    (=>
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@24@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@25@01)
          (not (= i@24@01 j@25@01))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@24@01)
        (Seq_contains (Seq_range start@6@01 end@7@01) j@25@01)
        (not (= i@24@01 j@25@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) i@24@01)
          (and
            (Seq_contains (Seq_range start@6@01 end@7@01) j@25@01)
            (not (= i@24@01 j@25@01)))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@24@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@25@01)
          (not (= i@24@01 j@25@01))))))
  :pattern ((Seq_contains (Seq_range start@6@01 end@7@01) j@25@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@21@01))
    i@24@01))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) j@25@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@21@01))
    i@24@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/mergesort.vpr@21@11@21@111-aux|)))
(assert (forall ((i@24@01 Int) (j@25@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range start@6@01 end@7@01) i@24@01)
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@24@01)
        (or
          (Seq_contains (Seq_range start@6@01 end@7@01) j@25@01)
          (not (Seq_contains (Seq_range start@6@01 end@7@01) j@25@01)))))
    (or
      (Seq_contains (Seq_range start@6@01 end@7@01) i@24@01)
      (not (Seq_contains (Seq_range start@6@01 end@7@01) i@24@01)))
    (=>
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@24@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@25@01)
          (not (= i@24@01 j@25@01))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@24@01)
        (Seq_contains (Seq_range start@6@01 end@7@01) j@25@01)
        (not (= i@24@01 j@25@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) i@24@01)
          (and
            (Seq_contains (Seq_range start@6@01 end@7@01) j@25@01)
            (not (= i@24@01 j@25@01)))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@24@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@25@01)
          (not (= i@24@01 j@25@01))))))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) j@25@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@21@01))
    i@24@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/mergesort.vpr@21@11@21@111-aux|)))
(assert (forall ((i@24@01 Int) (j@25@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range start@6@01 end@7@01) i@24@01)
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@24@01)
        (or
          (Seq_contains (Seq_range start@6@01 end@7@01) j@25@01)
          (not (Seq_contains (Seq_range start@6@01 end@7@01) j@25@01)))))
    (or
      (Seq_contains (Seq_range start@6@01 end@7@01) i@24@01)
      (not (Seq_contains (Seq_range start@6@01 end@7@01) i@24@01)))
    (=>
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@24@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@25@01)
          (not (= i@24@01 j@25@01))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@24@01)
        (Seq_contains (Seq_range start@6@01 end@7@01) j@25@01)
        (not (= i@24@01 j@25@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) i@24@01)
          (and
            (Seq_contains (Seq_range start@6@01 end@7@01) j@25@01)
            (not (= i@24@01 j@25@01)))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@24@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@25@01)
          (not (= i@24@01 j@25@01))))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@21@01))
    i@24@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@21@01))
    j@25@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/mergesort.vpr@21@11@21@111-aux|)))
(assert (forall ((i@24@01 Int) (j@25@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range start@6@01 end@7@01) i@24@01)
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) j@25@01)
        (not (= i@24@01 j@25@01))))
    (not
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@21@01))
          i@24@01)
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@21@01))
          j@25@01))))
  :pattern ((Seq_contains (Seq_range start@6@01 end@7@01) i@24@01) (Seq_contains
    (Seq_range start@6@01 end@7@01)
    j@25@01))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) i@24@01) (Seq_contains_trigger
    (Seq_range start@6@01 end@7@01)
    j@25@01))
  :pattern ((Seq_contains (Seq_range start@6@01 end@7@01) i@24@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@21@01))
    j@25@01))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) i@24@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@21@01))
    j@25@01))
  :pattern ((Seq_contains (Seq_range start@6@01 end@7@01) j@25@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@21@01))
    i@24@01))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) j@25@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@21@01))
    i@24@01))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@21@01))
    i@24@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@21@01))
    j@25@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/mergesort.vpr@21@11@21@111|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01))))))))))
(declare-const i@26@01 Int)
(push) ; 3
; [eval] (i in [start..end))
; [eval] [start..end)
(assert (Seq_contains (Seq_range start@6@01 end@7@01) i@26@01))
; [eval] a.array[i]
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@22@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(assert (not (>= i@26@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@26@01 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@21@01))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@27@01 ($Ref) Int)
(declare-fun img@28@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@26@01 Int) (i2@26@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range start@6@01 end@7@01) i1@26@01)
      (Seq_contains (Seq_range start@6@01 end@7@01) i2@26@01)
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@21@01))
          i1@26@01)
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@21@01))
          i2@26@01)))
    (= i1@26@01 i2@26@01))
  
  :qid |value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@26@01 Int)) (!
  (=>
    (Seq_contains (Seq_range start@6@01 end@7@01) i@26@01)
    (and
      (=
        (inv@27@01 (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@21@01))
          i@26@01))
        i@26@01)
      (img@28@01 (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@21@01))
        i@26@01))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@21@01))
    i@26@01))
  :qid |quant-u-6|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@28@01 r)
      (Seq_contains (Seq_range start@6@01 end@7@01) (inv@27@01 r)))
    (=
      (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@21@01))
        (inv@27@01 r))
      r))
  :pattern ((inv@27@01 r))
  :qid |value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@26@01 Int)) (!
  (=>
    (Seq_contains (Seq_range start@6@01 end@7@01) i@26@01)
    (not
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@21@01))
          i@26@01)
        $Ref.null)))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@21@01))
    i@26@01))
  :qid |value-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01)))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01))))))))
  $Snap.unit))
; [eval] (forall i: Int, j: Int :: { (i in [start..end)), (j in [start..end)) } { (i in [start..end)), b.array[j] } { (j in [start..end)), b.array[i] } { b.array[i], b.array[j] } (i in [start..end)) && ((j in [start..end)) && i != j) ==> b.array[i] != b.array[j])
(declare-const i@29@01 Int)
(declare-const j@30@01 Int)
(push) ; 3
; [eval] (i in [start..end)) && ((j in [start..end)) && i != j) ==> b.array[i] != b.array[j]
; [eval] (i in [start..end)) && ((j in [start..end)) && i != j)
; [eval] (i in [start..end))
; [eval] [start..end)
(push) ; 4
; [then-branch: 9 | !(i@29@01 in [start@6@01..end@7@01]) | live]
; [else-branch: 9 | i@29@01 in [start@6@01..end@7@01] | live]
(push) ; 5
; [then-branch: 9 | !(i@29@01 in [start@6@01..end@7@01])]
(assert (not (Seq_contains (Seq_range start@6@01 end@7@01) i@29@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 9 | i@29@01 in [start@6@01..end@7@01]]
(assert (Seq_contains (Seq_range start@6@01 end@7@01) i@29@01))
; [eval] (j in [start..end))
; [eval] [start..end)
(push) ; 6
; [then-branch: 10 | !(j@30@01 in [start@6@01..end@7@01]) | live]
; [else-branch: 10 | j@30@01 in [start@6@01..end@7@01] | live]
(push) ; 7
; [then-branch: 10 | !(j@30@01 in [start@6@01..end@7@01])]
(assert (not (Seq_contains (Seq_range start@6@01 end@7@01) j@30@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 10 | j@30@01 in [start@6@01..end@7@01]]
(assert (Seq_contains (Seq_range start@6@01 end@7@01) j@30@01))
; [eval] i != j
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range start@6@01 end@7@01) j@30@01)
  (not (Seq_contains (Seq_range start@6@01 end@7@01) j@30@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range start@6@01 end@7@01) i@29@01)
  (and
    (Seq_contains (Seq_range start@6@01 end@7@01) i@29@01)
    (or
      (Seq_contains (Seq_range start@6@01 end@7@01) j@30@01)
      (not (Seq_contains (Seq_range start@6@01 end@7@01) j@30@01))))))
(assert (or
  (Seq_contains (Seq_range start@6@01 end@7@01) i@29@01)
  (not (Seq_contains (Seq_range start@6@01 end@7@01) i@29@01))))
(push) ; 4
; [then-branch: 11 | i@29@01 in [start@6@01..end@7@01] && j@30@01 in [start@6@01..end@7@01] && i@29@01 != j@30@01 | live]
; [else-branch: 11 | !(i@29@01 in [start@6@01..end@7@01] && j@30@01 in [start@6@01..end@7@01] && i@29@01 != j@30@01) | live]
(push) ; 5
; [then-branch: 11 | i@29@01 in [start@6@01..end@7@01] && j@30@01 in [start@6@01..end@7@01] && i@29@01 != j@30@01]
(assert (and
  (Seq_contains (Seq_range start@6@01 end@7@01) i@29@01)
  (and
    (Seq_contains (Seq_range start@6@01 end@7@01) j@30@01)
    (not (= i@29@01 j@30@01)))))
; [eval] b.array[i] != b.array[j]
; [eval] b.array[i]
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No $k@23@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(assert (not (>= i@29@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (<
  i@29@01
  (Seq_length
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@21@01)))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] b.array[j]
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No $k@23@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(assert (not (>= j@30@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (<
  j@30@01
  (Seq_length
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@21@01)))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 11 | !(i@29@01 in [start@6@01..end@7@01] && j@30@01 in [start@6@01..end@7@01] && i@29@01 != j@30@01)]
(assert (not
  (and
    (Seq_contains (Seq_range start@6@01 end@7@01) i@29@01)
    (and
      (Seq_contains (Seq_range start@6@01 end@7@01) j@30@01)
      (not (= i@29@01 j@30@01))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range start@6@01 end@7@01) i@29@01)
    (and
      (Seq_contains (Seq_range start@6@01 end@7@01) j@30@01)
      (not (= i@29@01 j@30@01))))
  (and
    (Seq_contains (Seq_range start@6@01 end@7@01) i@29@01)
    (Seq_contains (Seq_range start@6@01 end@7@01) j@30@01)
    (not (= i@29@01 j@30@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range start@6@01 end@7@01) i@29@01)
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) j@30@01)
        (not (= i@29@01 j@30@01)))))
  (and
    (Seq_contains (Seq_range start@6@01 end@7@01) i@29@01)
    (and
      (Seq_contains (Seq_range start@6@01 end@7@01) j@30@01)
      (not (= i@29@01 j@30@01))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@29@01 Int) (j@30@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range start@6@01 end@7@01) i@29@01)
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@29@01)
        (or
          (Seq_contains (Seq_range start@6@01 end@7@01) j@30@01)
          (not (Seq_contains (Seq_range start@6@01 end@7@01) j@30@01)))))
    (or
      (Seq_contains (Seq_range start@6@01 end@7@01) i@29@01)
      (not (Seq_contains (Seq_range start@6@01 end@7@01) i@29@01)))
    (=>
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@29@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@30@01)
          (not (= i@29@01 j@30@01))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@29@01)
        (Seq_contains (Seq_range start@6@01 end@7@01) j@30@01)
        (not (= i@29@01 j@30@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) i@29@01)
          (and
            (Seq_contains (Seq_range start@6@01 end@7@01) j@30@01)
            (not (= i@29@01 j@30@01)))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@29@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@30@01)
          (not (= i@29@01 j@30@01))))))
  :pattern ((Seq_contains (Seq_range start@6@01 end@7@01) i@29@01) (Seq_contains
    (Seq_range start@6@01 end@7@01)
    j@30@01))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) i@29@01) (Seq_contains_trigger
    (Seq_range start@6@01 end@7@01)
    j@30@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/mergesort.vpr@23@11@23@111-aux|)))
(assert (forall ((i@29@01 Int) (j@30@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range start@6@01 end@7@01) i@29@01)
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@29@01)
        (or
          (Seq_contains (Seq_range start@6@01 end@7@01) j@30@01)
          (not (Seq_contains (Seq_range start@6@01 end@7@01) j@30@01)))))
    (or
      (Seq_contains (Seq_range start@6@01 end@7@01) i@29@01)
      (not (Seq_contains (Seq_range start@6@01 end@7@01) i@29@01)))
    (=>
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@29@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@30@01)
          (not (= i@29@01 j@30@01))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@29@01)
        (Seq_contains (Seq_range start@6@01 end@7@01) j@30@01)
        (not (= i@29@01 j@30@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) i@29@01)
          (and
            (Seq_contains (Seq_range start@6@01 end@7@01) j@30@01)
            (not (= i@29@01 j@30@01)))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@29@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@30@01)
          (not (= i@29@01 j@30@01))))))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) i@29@01) (Seq_contains_trigger
    (Seq_range start@6@01 end@7@01)
    j@30@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/mergesort.vpr@23@11@23@111-aux|)))
(assert (forall ((i@29@01 Int) (j@30@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range start@6@01 end@7@01) i@29@01)
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@29@01)
        (or
          (Seq_contains (Seq_range start@6@01 end@7@01) j@30@01)
          (not (Seq_contains (Seq_range start@6@01 end@7@01) j@30@01)))))
    (or
      (Seq_contains (Seq_range start@6@01 end@7@01) i@29@01)
      (not (Seq_contains (Seq_range start@6@01 end@7@01) i@29@01)))
    (=>
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@29@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@30@01)
          (not (= i@29@01 j@30@01))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@29@01)
        (Seq_contains (Seq_range start@6@01 end@7@01) j@30@01)
        (not (= i@29@01 j@30@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) i@29@01)
          (and
            (Seq_contains (Seq_range start@6@01 end@7@01) j@30@01)
            (not (= i@29@01 j@30@01)))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@29@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@30@01)
          (not (= i@29@01 j@30@01))))))
  :pattern ((Seq_contains (Seq_range start@6@01 end@7@01) i@29@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@21@01)))
    j@30@01))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) i@29@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@21@01)))
    j@30@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/mergesort.vpr@23@11@23@111-aux|)))
(assert (forall ((i@29@01 Int) (j@30@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range start@6@01 end@7@01) i@29@01)
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@29@01)
        (or
          (Seq_contains (Seq_range start@6@01 end@7@01) j@30@01)
          (not (Seq_contains (Seq_range start@6@01 end@7@01) j@30@01)))))
    (or
      (Seq_contains (Seq_range start@6@01 end@7@01) i@29@01)
      (not (Seq_contains (Seq_range start@6@01 end@7@01) i@29@01)))
    (=>
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@29@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@30@01)
          (not (= i@29@01 j@30@01))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@29@01)
        (Seq_contains (Seq_range start@6@01 end@7@01) j@30@01)
        (not (= i@29@01 j@30@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) i@29@01)
          (and
            (Seq_contains (Seq_range start@6@01 end@7@01) j@30@01)
            (not (= i@29@01 j@30@01)))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@29@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@30@01)
          (not (= i@29@01 j@30@01))))))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) i@29@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@21@01)))
    j@30@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/mergesort.vpr@23@11@23@111-aux|)))
(assert (forall ((i@29@01 Int) (j@30@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range start@6@01 end@7@01) i@29@01)
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@29@01)
        (or
          (Seq_contains (Seq_range start@6@01 end@7@01) j@30@01)
          (not (Seq_contains (Seq_range start@6@01 end@7@01) j@30@01)))))
    (or
      (Seq_contains (Seq_range start@6@01 end@7@01) i@29@01)
      (not (Seq_contains (Seq_range start@6@01 end@7@01) i@29@01)))
    (=>
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@29@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@30@01)
          (not (= i@29@01 j@30@01))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@29@01)
        (Seq_contains (Seq_range start@6@01 end@7@01) j@30@01)
        (not (= i@29@01 j@30@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) i@29@01)
          (and
            (Seq_contains (Seq_range start@6@01 end@7@01) j@30@01)
            (not (= i@29@01 j@30@01)))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@29@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@30@01)
          (not (= i@29@01 j@30@01))))))
  :pattern ((Seq_contains (Seq_range start@6@01 end@7@01) j@30@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@21@01)))
    i@29@01))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) j@30@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@21@01)))
    i@29@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/mergesort.vpr@23@11@23@111-aux|)))
(assert (forall ((i@29@01 Int) (j@30@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range start@6@01 end@7@01) i@29@01)
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@29@01)
        (or
          (Seq_contains (Seq_range start@6@01 end@7@01) j@30@01)
          (not (Seq_contains (Seq_range start@6@01 end@7@01) j@30@01)))))
    (or
      (Seq_contains (Seq_range start@6@01 end@7@01) i@29@01)
      (not (Seq_contains (Seq_range start@6@01 end@7@01) i@29@01)))
    (=>
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@29@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@30@01)
          (not (= i@29@01 j@30@01))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@29@01)
        (Seq_contains (Seq_range start@6@01 end@7@01) j@30@01)
        (not (= i@29@01 j@30@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) i@29@01)
          (and
            (Seq_contains (Seq_range start@6@01 end@7@01) j@30@01)
            (not (= i@29@01 j@30@01)))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@29@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@30@01)
          (not (= i@29@01 j@30@01))))))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) j@30@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@21@01)))
    i@29@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/mergesort.vpr@23@11@23@111-aux|)))
(assert (forall ((i@29@01 Int) (j@30@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range start@6@01 end@7@01) i@29@01)
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@29@01)
        (or
          (Seq_contains (Seq_range start@6@01 end@7@01) j@30@01)
          (not (Seq_contains (Seq_range start@6@01 end@7@01) j@30@01)))))
    (or
      (Seq_contains (Seq_range start@6@01 end@7@01) i@29@01)
      (not (Seq_contains (Seq_range start@6@01 end@7@01) i@29@01)))
    (=>
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@29@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@30@01)
          (not (= i@29@01 j@30@01))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@29@01)
        (Seq_contains (Seq_range start@6@01 end@7@01) j@30@01)
        (not (= i@29@01 j@30@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) i@29@01)
          (and
            (Seq_contains (Seq_range start@6@01 end@7@01) j@30@01)
            (not (= i@29@01 j@30@01)))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@29@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@30@01)
          (not (= i@29@01 j@30@01))))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@21@01)))
    i@29@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@21@01)))
    j@30@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/mergesort.vpr@23@11@23@111-aux|)))
(assert (forall ((i@29@01 Int) (j@30@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range start@6@01 end@7@01) i@29@01)
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) j@30@01)
        (not (= i@29@01 j@30@01))))
    (not
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@21@01)))
          i@29@01)
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@21@01)))
          j@30@01))))
  :pattern ((Seq_contains (Seq_range start@6@01 end@7@01) i@29@01) (Seq_contains
    (Seq_range start@6@01 end@7@01)
    j@30@01))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) i@29@01) (Seq_contains_trigger
    (Seq_range start@6@01 end@7@01)
    j@30@01))
  :pattern ((Seq_contains (Seq_range start@6@01 end@7@01) i@29@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@21@01)))
    j@30@01))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) i@29@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@21@01)))
    j@30@01))
  :pattern ((Seq_contains (Seq_range start@6@01 end@7@01) j@30@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@21@01)))
    i@29@01))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) j@30@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@21@01)))
    i@29@01))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@21@01)))
    i@29@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@21@01)))
    j@30@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/mergesort.vpr@23@11@23@111|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01))))))))))))
(declare-const i@31@01 Int)
(push) ; 3
; [eval] (i in [start..end))
; [eval] [start..end)
(assert (Seq_contains (Seq_range start@6@01 end@7@01) i@31@01))
; [eval] b.array[i]
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@23@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(assert (not (>= i@31@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (<
  i@31@01
  (Seq_length
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@21@01)))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@32@01 ($Ref) Int)
(declare-fun img@33@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@31@01 Int) (i2@31@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range start@6@01 end@7@01) i1@31@01)
      (Seq_contains (Seq_range start@6@01 end@7@01) i2@31@01)
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@21@01)))
          i1@31@01)
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@21@01)))
          i2@31@01)))
    (= i1@31@01 i2@31@01))
  
  :qid |value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@31@01 Int)) (!
  (=>
    (Seq_contains (Seq_range start@6@01 end@7@01) i@31@01)
    (and
      (=
        (inv@32@01 (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@21@01)))
          i@31@01))
        i@31@01)
      (img@33@01 (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@21@01)))
        i@31@01))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@21@01)))
    i@31@01))
  :qid |quant-u-8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@33@01 r)
      (Seq_contains (Seq_range start@6@01 end@7@01) (inv@32@01 r)))
    (=
      (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@21@01)))
        (inv@32@01 r))
      r))
  :pattern ((inv@32@01 r))
  :qid |value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@31@01 Int)) (!
  (=>
    (Seq_contains (Seq_range start@6@01 end@7@01) i@31@01)
    (not
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@21@01)))
          i@31@01)
        $Ref.null)))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@21@01)))
    i@31@01))
  :qid |value-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (=
      (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@21@01)))
        i@31@01)
      (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@21@01)) i@26@01))
    (=
      (and
        (img@33@01 r)
        (Seq_contains (Seq_range start@6@01 end@7@01) (inv@32@01 r)))
      (and
        (img@28@01 r)
        (Seq_contains (Seq_range start@6@01 end@7@01) (inv@27@01 r)))))
  
  :qid |quant-u-9|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01)))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01)))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01))))))))))
  $Snap.unit))
; [eval] a.array == old(a.array)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@22@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] old(a.array)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@9@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal
  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@21@01))
  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@8@01))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@21@01))))))))))
  $Snap.unit))
; [eval] b.array == old(b.array)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@23@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] old(b.array)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@10@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal
  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@21@01)))
  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@8@01)))))
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
; [exec]
; var middle: Int
(declare-const middle@34@01 Int)
; [exec]
; var t1A: Seq[Ref]
(declare-const t1A@35@01 Seq<$Ref>)
; [exec]
; var t1B: Seq[Ref]
(declare-const t1B@36@01 Seq<$Ref>)
; [exec]
; var t2A: Seq[Ref]
(declare-const t2A@37@01 Seq<$Ref>)
; [exec]
; var t2B: Seq[Ref]
(declare-const t2B@38@01 Seq<$Ref>)
; [eval] end - start > 1
; [eval] end - start
(push) ; 3
(set-option :timeout 10)
(assert (not (not (> (- end@7@01 start@6@01) 1))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (> (- end@7@01 start@6@01) 1)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 12 | end@7@01 - start@6@01 > 1 | live]
; [else-branch: 12 | !(end@7@01 - start@6@01 > 1) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 12 | end@7@01 - start@6@01 > 1]
(assert (> (- end@7@01 start@6@01) 1))
; [exec]
; middle := start + (end - start) / 2
; [eval] start + (end - start) / 2
; [eval] (end - start) / 2
; [eval] end - start
(declare-const middle@39@01 Int)
(assert (= middle@39@01 (+ start@6@01 (div (- end@7@01 start@6@01) 2))))
; [exec]
; t1A := a.array
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@9@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(declare-const t1A@40@01 Seq<$Ref>)
(assert (= t1A@40@01 ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@8@01))))
; [exec]
; t1B := b.array
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@10@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(declare-const t1B@41@01 Seq<$Ref>)
(assert (=
  t1B@41@01
  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@8@01)))))
; [exec]
; exhale acc(a.array, wildcard)
(declare-const $k@42@01 $Perm)
(assert ($Perm.isReadVar $k@42@01))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= $k@9@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (< $k@42@01 $k@9@01))
(assert (<= $Perm.No (- $k@9@01 $k@42@01)))
(assert (<= (- $k@9@01 $k@42@01) $Perm.Write))
(assert (=> (< $Perm.No (- $k@9@01 $k@42@01)) (not (= a@4@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@42@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [exec]
; exhale acc(b.array, wildcard)
(declare-const $k@43@01 $Perm)
(assert ($Perm.isReadVar $k@43@01))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= $k@10@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (< $k@43@01 $k@10@01))
(assert (<= $Perm.No (- $k@10@01 $k@43@01)))
(assert (<= (- $k@10@01 $k@43@01) $Perm.Write))
(assert (=> (< $Perm.No (- $k@10@01 $k@43@01)) (not (= b@5@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@43@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [exec]
; exhale start >= 0 && (middle <= |a.array| && |a.array| == |b.array|)
; [eval] start >= 0
; [eval] middle <= |a.array|
; [eval] |a.array|
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (- $k@9@01 $k@42@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(assert (not (<=
  middle@39@01
  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@8@01))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (<=
  middle@39@01
  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@8@01)))))
; [eval] |a.array| == |b.array|
; [eval] |a.array|
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (- $k@9@01 $k@42@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] |b.array|
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (- $k@10@01 $k@43@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [exec]
; exhale (forall i: Int ::(i in [start..middle)) ==>
;     acc(a.array[i].value, write))
(declare-const i@44@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] (i in [start..middle))
; [eval] [start..middle)
(assert (Seq_contains (Seq_range start@6@01 middle@39@01) i@44@01))
; [eval] a.array[i]
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (- $k@9@01 $k@42@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(assert (not (>= i@44@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@44@01 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@8@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@45@01 ($Ref) Int)
(declare-fun img@46@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@44@01 Int) (i2@44@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range start@6@01 middle@39@01) i1@44@01)
      (Seq_contains (Seq_range start@6@01 middle@39@01) i2@44@01)
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@8@01))
          i1@44@01)
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@8@01))
          i2@44@01)))
    (= i1@44@01 i2@44@01))
  
  :qid |value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@44@01 Int)) (!
  (=>
    (Seq_contains (Seq_range start@6@01 middle@39@01) i@44@01)
    (and
      (=
        (inv@45@01 (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@8@01))
          i@44@01))
        i@44@01)
      (img@46@01 (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@8@01))
        i@44@01))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@8@01))
    i@44@01))
  :qid |value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@46@01 r)
      (Seq_contains (Seq_range start@6@01 middle@39@01) (inv@45@01 r)))
    (=
      (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@8@01))
        (inv@45@01 r))
      r))
  :pattern ((inv@45@01 r))
  :qid |value-fctOfInv|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((i@44@01 Int)) (!
  (=
    (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@8@01)) i@44@01)
    (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@8@01)))
      i@44@01))
  
  :qid |quant-u-11|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@47@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range start@6@01 middle@39@01) (inv@45@01 r))
      (img@46@01 r)
      (=
        r
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@8@01))
          (inv@45@01 r))))
    ($Perm.min
      (ite
        (and
          (img@15@01 r)
          (Seq_contains (Seq_range start@6@01 end@7@01) (inv@14@01 r)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@48@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range start@6@01 middle@39@01) (inv@45@01 r))
      (img@46@01 r)
      (=
        r
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@8@01))
          (inv@45@01 r))))
    ($Perm.min
      (ite
        (and
          (img@20@01 r)
          (Seq_contains (Seq_range start@6@01 end@7@01) (inv@19@01 r)))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@47@01 r)))
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
          (img@15@01 r)
          (Seq_contains (Seq_range start@6@01 end@7@01) (inv@14@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@47@01 r))
    $Perm.No)
  
  :qid |quant-u-13|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@47@01 r) $Perm.No)
  
  :qid |quant-u-14|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (Seq_contains (Seq_range start@6@01 middle@39@01) (inv@45@01 r))
      (img@46@01 r)
      (=
        r
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@8@01))
          (inv@45@01 r))))
    (= (- $Perm.Write (pTaken@47@01 r)) $Perm.No))
  
  :qid |quant-u-15|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@49@01 $FVF<value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@15@01 r)
      (Seq_contains (Seq_range start@6@01 end@7@01) (inv@14@01 r)))
    (=
      ($FVF.lookup_value (as sm@49@01  $FVF<value>) r)
      ($FVF.lookup_value ($SortWrappers.$SnapTo$FVF<value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))) r)))
  :pattern (($FVF.lookup_value (as sm@49@01  $FVF<value>) r))
  :pattern (($FVF.lookup_value ($SortWrappers.$SnapTo$FVF<value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@20@01 r)
      (Seq_contains (Seq_range start@6@01 end@7@01) (inv@19@01 r)))
    (=
      ($FVF.lookup_value (as sm@49@01  $FVF<value>) r)
      ($FVF.lookup_value ($SortWrappers.$SnapTo$FVF<value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))) r)))
  :pattern (($FVF.lookup_value (as sm@49@01  $FVF<value>) r))
  :pattern (($FVF.lookup_value ($SortWrappers.$SnapTo$FVF<value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))) r))
  :qid |qp.fvfValDef1|)))
; [exec]
; exhale (forall i: Int ::(i in [start..middle)) ==>
;     acc(b.array[i].value, write))
(declare-const i@50@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] (i in [start..middle))
; [eval] [start..middle)
(assert (Seq_contains (Seq_range start@6@01 middle@39@01) i@50@01))
; [eval] b.array[i]
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (- $k@10@01 $k@43@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(assert (not (>= i@50@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (<
  i@50@01
  (Seq_length
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@8@01)))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@51@01 ($Ref) Int)
(declare-fun img@52@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@50@01 Int) (i2@50@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range start@6@01 middle@39@01) i1@50@01)
      (Seq_contains (Seq_range start@6@01 middle@39@01) i2@50@01)
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@8@01)))
          i1@50@01)
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@8@01)))
          i2@50@01)))
    (= i1@50@01 i2@50@01))
  
  :qid |value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@50@01 Int)) (!
  (=>
    (Seq_contains (Seq_range start@6@01 middle@39@01) i@50@01)
    (and
      (=
        (inv@51@01 (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@8@01)))
          i@50@01))
        i@50@01)
      (img@52@01 (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@8@01)))
        i@50@01))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@8@01)))
    i@50@01))
  :qid |value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@52@01 r)
      (Seq_contains (Seq_range start@6@01 middle@39@01) (inv@51@01 r)))
    (=
      (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@8@01)))
        (inv@51@01 r))
      r))
  :pattern ((inv@51@01 r))
  :qid |value-fctOfInv|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((i@50@01 Int)) (!
  (=
    (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@8@01)))
      i@50@01)
    (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@8@01)) i@50@01))
  
  :qid |quant-u-17|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@53@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range start@6@01 middle@39@01) (inv@51@01 r))
      (img@52@01 r)
      (=
        r
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@8@01)))
          (inv@51@01 r))))
    ($Perm.min
      (ite
        (and
          (img@20@01 r)
          (Seq_contains (Seq_range start@6@01 end@7@01) (inv@19@01 r)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@54@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range start@6@01 middle@39@01) (inv@51@01 r))
      (img@52@01 r)
      (=
        r
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@8@01)))
          (inv@51@01 r))))
    ($Perm.min
      (ite
        (and
          (img@15@01 r)
          (Seq_contains (Seq_range start@6@01 end@7@01) (inv@14@01 r)))
        (- $Perm.Write (pTaken@47@01 r))
        $Perm.No)
      (- $Perm.Write (pTaken@53@01 r)))
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
          (img@20@01 r)
          (Seq_contains (Seq_range start@6@01 end@7@01) (inv@19@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@53@01 r))
    $Perm.No)
  
  :qid |quant-u-19|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@53@01 r) $Perm.No)
  
  :qid |quant-u-20|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (Seq_contains (Seq_range start@6@01 middle@39@01) (inv@51@01 r))
      (img@52@01 r)
      (=
        r
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@8@01)))
          (inv@51@01 r))))
    (= (- $Perm.Write (pTaken@53@01 r)) $Perm.No))
  
  :qid |quant-u-21|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@55@01 $FVF<value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@20@01 r)
      (Seq_contains (Seq_range start@6@01 end@7@01) (inv@19@01 r)))
    (=
      ($FVF.lookup_value (as sm@55@01  $FVF<value>) r)
      ($FVF.lookup_value ($SortWrappers.$SnapTo$FVF<value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))) r)))
  :pattern (($FVF.lookup_value (as sm@55@01  $FVF<value>) r))
  :pattern (($FVF.lookup_value ($SortWrappers.$SnapTo$FVF<value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@15@01 r)
        (Seq_contains (Seq_range start@6@01 end@7@01) (inv@14@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@47@01 r)))
      false)
    (=
      ($FVF.lookup_value (as sm@55@01  $FVF<value>) r)
      ($FVF.lookup_value ($SortWrappers.$SnapTo$FVF<value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))) r)))
  :pattern (($FVF.lookup_value (as sm@55@01  $FVF<value>) r))
  :pattern (($FVF.lookup_value ($SortWrappers.$SnapTo$FVF<value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))) r))
  :qid |qp.fvfValDef3|)))
; [exec]
; t2A := a.array
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (- $k@9@01 $k@42@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(declare-const t2A@56@01 Seq<$Ref>)
(assert (= t2A@56@01 ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@8@01))))
; [exec]
; t2B := b.array
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (- $k@10@01 $k@43@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(declare-const t2B@57@01 Seq<$Ref>)
(assert (=
  t2B@57@01
  ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@8@01)))))
; [exec]
; exhale acc(a.array, wildcard)
(declare-const $k@58@01 $Perm)
(assert ($Perm.isReadVar $k@58@01))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= (- $k@9@01 $k@42@01) $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (< $k@58@01 (- $k@9@01 $k@42@01)))
(assert (<= $Perm.No (- (- $k@9@01 $k@42@01) $k@58@01)))
(assert (<= (- (- $k@9@01 $k@42@01) $k@58@01) $Perm.Write))
(assert (=> (< $Perm.No (- (- $k@9@01 $k@42@01) $k@58@01)) (not (= a@4@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@58@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [exec]
; exhale acc(b.array, wildcard)
(declare-const $k@59@01 $Perm)
(assert ($Perm.isReadVar $k@59@01))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= (- $k@10@01 $k@43@01) $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (< $k@59@01 (- $k@10@01 $k@43@01)))
(assert (<= $Perm.No (- (- $k@10@01 $k@43@01) $k@59@01)))
(assert (<= (- (- $k@10@01 $k@43@01) $k@59@01) $Perm.Write))
(assert (=> (< $Perm.No (- (- $k@10@01 $k@43@01) $k@59@01)) (not (= b@5@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@59@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [exec]
; exhale middle >= 0 && (end <= |a.array| && |a.array| == |b.array|)
; [eval] middle >= 0
(set-option :timeout 0)
(push) ; 4
(assert (not (>= middle@39@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (>= middle@39@01 0))
; [eval] end <= |a.array|
; [eval] |a.array|
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (- (- $k@9@01 $k@42@01) $k@58@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] |a.array| == |b.array|
; [eval] |a.array|
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (- (- $k@9@01 $k@42@01) $k@58@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] |b.array|
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (- (- $k@10@01 $k@43@01) $k@59@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [exec]
; exhale (forall i: Int ::(i in [middle..end)) ==>
;     acc(a.array[i].value, write))
(declare-const i@60@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] (i in [middle..end))
; [eval] [middle..end)
(assert (Seq_contains (Seq_range middle@39@01 end@7@01) i@60@01))
; [eval] a.array[i]
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (- (- $k@9@01 $k@42@01) $k@58@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(assert (not (>= i@60@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@60@01 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@8@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@61@01 ($Ref) Int)
(declare-fun img@62@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@60@01 Int) (i2@60@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range middle@39@01 end@7@01) i1@60@01)
      (Seq_contains (Seq_range middle@39@01 end@7@01) i2@60@01)
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@8@01))
          i1@60@01)
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@8@01))
          i2@60@01)))
    (= i1@60@01 i2@60@01))
  
  :qid |value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@60@01 Int)) (!
  (=>
    (Seq_contains (Seq_range middle@39@01 end@7@01) i@60@01)
    (and
      (=
        (inv@61@01 (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@8@01))
          i@60@01))
        i@60@01)
      (img@62@01 (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@8@01))
        i@60@01))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@8@01))
    i@60@01))
  :qid |value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@62@01 r)
      (Seq_contains (Seq_range middle@39@01 end@7@01) (inv@61@01 r)))
    (=
      (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@8@01))
        (inv@61@01 r))
      r))
  :pattern ((inv@61@01 r))
  :qid |value-fctOfInv|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((i@60@01 Int)) (!
  (=
    (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@8@01)) i@60@01)
    (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@8@01)))
      i@60@01))
  
  :qid |quant-u-23|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@63@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range middle@39@01 end@7@01) (inv@61@01 r))
      (img@62@01 r)
      (=
        r
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@8@01))
          (inv@61@01 r))))
    ($Perm.min
      (ite
        (and
          (img@15@01 r)
          (Seq_contains (Seq_range start@6@01 end@7@01) (inv@14@01 r)))
        (- $Perm.Write (pTaken@47@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@64@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range middle@39@01 end@7@01) (inv@61@01 r))
      (img@62@01 r)
      (=
        r
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@8@01))
          (inv@61@01 r))))
    ($Perm.min
      (ite
        (and
          (img@20@01 r)
          (Seq_contains (Seq_range start@6@01 end@7@01) (inv@19@01 r)))
        (- $Perm.Write (pTaken@53@01 r))
        $Perm.No)
      (- $Perm.Write (pTaken@63@01 r)))
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
          (img@15@01 r)
          (Seq_contains (Seq_range start@6@01 end@7@01) (inv@14@01 r)))
        (- $Perm.Write (pTaken@47@01 r))
        $Perm.No)
      (pTaken@63@01 r))
    $Perm.No)
  
  :qid |quant-u-25|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (Seq_contains (Seq_range middle@39@01 end@7@01) (inv@61@01 r))
      (img@62@01 r)
      (=
        r
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@8@01))
          (inv@61@01 r))))
    (= (- $Perm.Write (pTaken@63@01 r)) $Perm.No))
  
  :qid |quant-u-26|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@65@01 $FVF<value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@15@01 r)
        (Seq_contains (Seq_range start@6@01 end@7@01) (inv@14@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@47@01 r)))
      false)
    (=
      ($FVF.lookup_value (as sm@65@01  $FVF<value>) r)
      ($FVF.lookup_value ($SortWrappers.$SnapTo$FVF<value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))) r)))
  :pattern (($FVF.lookup_value (as sm@65@01  $FVF<value>) r))
  :pattern (($FVF.lookup_value ($SortWrappers.$SnapTo$FVF<value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@20@01 r)
        (Seq_contains (Seq_range start@6@01 end@7@01) (inv@19@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@53@01 r)))
      false)
    (=
      ($FVF.lookup_value (as sm@65@01  $FVF<value>) r)
      ($FVF.lookup_value ($SortWrappers.$SnapTo$FVF<value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))) r)))
  :pattern (($FVF.lookup_value (as sm@65@01  $FVF<value>) r))
  :pattern (($FVF.lookup_value ($SortWrappers.$SnapTo$FVF<value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))) r))
  :qid |qp.fvfValDef5|)))
; [exec]
; exhale (forall i: Int ::(i in [middle..end)) ==>
;     acc(b.array[i].value, write))
(declare-const i@66@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] (i in [middle..end))
; [eval] [middle..end)
(assert (Seq_contains (Seq_range middle@39@01 end@7@01) i@66@01))
; [eval] b.array[i]
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (- (- $k@10@01 $k@43@01) $k@59@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(assert (not (>= i@66@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (<
  i@66@01
  (Seq_length
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@8@01)))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@67@01 ($Ref) Int)
(declare-fun img@68@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@66@01 Int) (i2@66@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range middle@39@01 end@7@01) i1@66@01)
      (Seq_contains (Seq_range middle@39@01 end@7@01) i2@66@01)
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@8@01)))
          i1@66@01)
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@8@01)))
          i2@66@01)))
    (= i1@66@01 i2@66@01))
  
  :qid |value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@66@01 Int)) (!
  (=>
    (Seq_contains (Seq_range middle@39@01 end@7@01) i@66@01)
    (and
      (=
        (inv@67@01 (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@8@01)))
          i@66@01))
        i@66@01)
      (img@68@01 (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@8@01)))
        i@66@01))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@8@01)))
    i@66@01))
  :qid |value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@68@01 r)
      (Seq_contains (Seq_range middle@39@01 end@7@01) (inv@67@01 r)))
    (=
      (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@8@01)))
        (inv@67@01 r))
      r))
  :pattern ((inv@67@01 r))
  :qid |value-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@69@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range middle@39@01 end@7@01) (inv@67@01 r))
      (img@68@01 r)
      (=
        r
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@8@01)))
          (inv@67@01 r))))
    ($Perm.min
      (ite
        (and
          (img@20@01 r)
          (Seq_contains (Seq_range start@6@01 end@7@01) (inv@19@01 r)))
        (- $Perm.Write (pTaken@53@01 r))
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
        (and
          (img@20@01 r)
          (Seq_contains (Seq_range start@6@01 end@7@01) (inv@19@01 r)))
        (- $Perm.Write (pTaken@53@01 r))
        $Perm.No)
      (pTaken@69@01 r))
    $Perm.No)
  
  :qid |quant-u-29|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (Seq_contains (Seq_range middle@39@01 end@7@01) (inv@67@01 r))
      (img@68@01 r)
      (=
        r
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@8@01)))
          (inv@67@01 r))))
    (= (- $Perm.Write (pTaken@69@01 r)) $Perm.No))
  
  :qid |quant-u-30|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@70@01 $FVF<value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@20@01 r)
        (Seq_contains (Seq_range start@6@01 end@7@01) (inv@19@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@53@01 r)))
      false)
    (=
      ($FVF.lookup_value (as sm@70@01  $FVF<value>) r)
      ($FVF.lookup_value ($SortWrappers.$SnapTo$FVF<value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))) r)))
  :pattern (($FVF.lookup_value (as sm@70@01  $FVF<value>) r))
  :pattern (($FVF.lookup_value ($SortWrappers.$SnapTo$FVF<value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))) r))
  :qid |qp.fvfValDef6|)))
; [exec]
; inhale acc(a.array, wildcard)
(declare-const $k@71@01 $Perm)
(assert ($Perm.isReadVar $k@71@01))
(declare-const $t@72@01 Seq<$Ref>)
(declare-const $t@73@01 Seq<$Ref>)
(assert (and
  (=>
    (< $Perm.No (- (- $k@9@01 $k@42@01) $k@58@01))
    (Seq_equal $t@73@01 ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@8@01))))
  (=> (< $Perm.No $k@71@01) (Seq_equal $t@73@01 $t@72@01))))
(assert (<= $Perm.No (+ (- (- $k@9@01 $k@42@01) $k@58@01) $k@71@01)))
(assert (<= (+ (- (- $k@9@01 $k@42@01) $k@58@01) $k@71@01) $Perm.Write))
(assert (=>
  (< $Perm.No (+ (- (- $k@9@01 $k@42@01) $k@58@01) $k@71@01))
  (not (= a@4@01 $Ref.null))))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(b.array, wildcard)
(declare-const $k@74@01 $Perm)
(assert ($Perm.isReadVar $k@74@01))
(declare-const $t@75@01 Seq<$Ref>)
(declare-const $t@76@01 Seq<$Ref>)
(assert (and
  (=>
    (< $Perm.No (- (- $k@10@01 $k@43@01) $k@59@01))
    (Seq_equal
      $t@76@01
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@8@01)))))
  (=> (< $Perm.No $k@74@01) (Seq_equal $t@76@01 $t@75@01))))
(assert (<= $Perm.No (+ (- (- $k@10@01 $k@43@01) $k@59@01) $k@74@01)))
(assert (<= (+ (- (- $k@10@01 $k@43@01) $k@59@01) $k@74@01) $Perm.Write))
(assert (=>
  (< $Perm.No (+ (- (- $k@10@01 $k@43@01) $k@59@01) $k@74@01))
  (not (= b@5@01 $Ref.null))))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale (forall i: Int ::(i in [start..middle)) ==>
;     acc(a.array[i].value, write))
(declare-const i@77@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] (i in [start..middle))
; [eval] [start..middle)
(assert (Seq_contains (Seq_range start@6@01 middle@39@01) i@77@01))
; [eval] a.array[i]
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (+ (- (- $k@9@01 $k@42@01) $k@58@01) $k@71@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(assert (not (>= i@77@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@77@01 (Seq_length $t@73@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-const $t@78@01 $FVF<value>)
(declare-fun inv@79@01 ($Ref) Int)
(declare-fun img@80@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@77@01 Int) (i2@77@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range start@6@01 middle@39@01) i1@77@01)
      (Seq_contains (Seq_range start@6@01 middle@39@01) i2@77@01)
      (= (Seq_index $t@73@01 i1@77@01) (Seq_index $t@73@01 i2@77@01)))
    (= i1@77@01 i2@77@01))
  
  :qid |value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@77@01 Int)) (!
  (=>
    (Seq_contains (Seq_range start@6@01 middle@39@01) i@77@01)
    (and
      (= (inv@79@01 (Seq_index $t@73@01 i@77@01)) i@77@01)
      (img@80@01 (Seq_index $t@73@01 i@77@01))))
  :pattern ((Seq_index $t@73@01 i@77@01))
  :qid |quant-u-32|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@80@01 r)
      (Seq_contains (Seq_range start@6@01 middle@39@01) (inv@79@01 r)))
    (= (Seq_index $t@73@01 (inv@79@01 r)) r))
  :pattern ((inv@79@01 r))
  :qid |value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@77@01 Int)) (!
  (=>
    (Seq_contains (Seq_range start@6@01 middle@39@01) i@77@01)
    (not (= (Seq_index $t@73@01 i@77@01) $Ref.null)))
  :pattern ((Seq_index $t@73@01 i@77@01))
  :qid |value-permImpliesNonNull|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall i: Int ::(i in [start..middle)) ==>
;     acc(b.array[i].value, write))
(declare-const i@81@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] (i in [start..middle))
; [eval] [start..middle)
(assert (Seq_contains (Seq_range start@6@01 middle@39@01) i@81@01))
; [eval] b.array[i]
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (+ (- (- $k@10@01 $k@43@01) $k@59@01) $k@74@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(assert (not (>= i@81@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@81@01 (Seq_length $t@76@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-const $t@82@01 $FVF<value>)
(declare-fun inv@83@01 ($Ref) Int)
(declare-fun img@84@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@81@01 Int) (i2@81@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range start@6@01 middle@39@01) i1@81@01)
      (Seq_contains (Seq_range start@6@01 middle@39@01) i2@81@01)
      (= (Seq_index $t@76@01 i1@81@01) (Seq_index $t@76@01 i2@81@01)))
    (= i1@81@01 i2@81@01))
  
  :qid |value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@81@01 Int)) (!
  (=>
    (Seq_contains (Seq_range start@6@01 middle@39@01) i@81@01)
    (and
      (= (inv@83@01 (Seq_index $t@76@01 i@81@01)) i@81@01)
      (img@84@01 (Seq_index $t@76@01 i@81@01))))
  :pattern ((Seq_index $t@76@01 i@81@01))
  :qid |quant-u-34|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@84@01 r)
      (Seq_contains (Seq_range start@6@01 middle@39@01) (inv@83@01 r)))
    (= (Seq_index $t@76@01 (inv@83@01 r)) r))
  :pattern ((inv@83@01 r))
  :qid |value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@81@01 Int)) (!
  (=>
    (Seq_contains (Seq_range start@6@01 middle@39@01) i@81@01)
    (not (= (Seq_index $t@76@01 i@81@01) $Ref.null)))
  :pattern ((Seq_index $t@76@01 i@81@01))
  :qid |value-permImpliesNonNull|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index $t@76@01 i@81@01) (Seq_index $t@73@01 i@77@01))
    (=
      (and
        (img@84@01 r)
        (Seq_contains (Seq_range start@6@01 middle@39@01) (inv@83@01 r)))
      (and
        (img@80@01 r)
        (Seq_contains (Seq_range start@6@01 middle@39@01) (inv@79@01 r)))))
  
  :qid |quant-u-35|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale a.array == t1A
(declare-const $t@85@01 $Snap)
(assert (= $t@85@01 $Snap.unit))
; [eval] a.array == t1A
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (+ (- (- $k@9@01 $k@42@01) $k@58@01) $k@71@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal $t@73@01 t1A@40@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale b.array == t1B
(declare-const $t@86@01 $Snap)
(assert (= $t@86@01 $Snap.unit))
; [eval] b.array == t1B
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (+ (- (- $k@10@01 $k@43@01) $k@59@01) $k@74@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal $t@76@01 t1B@41@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale acc(a.array, wildcard)
(declare-const $k@87@01 $Perm)
(assert ($Perm.isReadVar $k@87@01))
(declare-const $t@88@01 Seq<$Ref>)
(declare-const $t@89@01 Seq<$Ref>)
(assert (and
  (=>
    (< $Perm.No (+ (- (- $k@9@01 $k@42@01) $k@58@01) $k@71@01))
    (Seq_equal $t@89@01 $t@73@01))
  (=> (< $Perm.No $k@87@01) (Seq_equal $t@89@01 $t@88@01))))
(assert (<= $Perm.No (+ (+ (- (- $k@9@01 $k@42@01) $k@58@01) $k@71@01) $k@87@01)))
(assert (<= (+ (+ (- (- $k@9@01 $k@42@01) $k@58@01) $k@71@01) $k@87@01) $Perm.Write))
(assert (=>
  (< $Perm.No (+ (+ (- (- $k@9@01 $k@42@01) $k@58@01) $k@71@01) $k@87@01))
  (not (= a@4@01 $Ref.null))))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale acc(b.array, wildcard)
(declare-const $k@90@01 $Perm)
(assert ($Perm.isReadVar $k@90@01))
(declare-const $t@91@01 Seq<$Ref>)
(declare-const $t@92@01 Seq<$Ref>)
(assert (and
  (=>
    (< $Perm.No (+ (- (- $k@10@01 $k@43@01) $k@59@01) $k@74@01))
    (Seq_equal $t@92@01 $t@76@01))
  (=> (< $Perm.No $k@90@01) (Seq_equal $t@92@01 $t@91@01))))
(assert (<= $Perm.No (+ (+ (- (- $k@10@01 $k@43@01) $k@59@01) $k@74@01) $k@90@01)))
(assert (<= (+ (+ (- (- $k@10@01 $k@43@01) $k@59@01) $k@74@01) $k@90@01) $Perm.Write))
(assert (=>
  (< $Perm.No (+ (+ (- (- $k@10@01 $k@43@01) $k@59@01) $k@74@01) $k@90@01))
  (not (= b@5@01 $Ref.null))))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale (forall i: Int ::(i in [middle..end)) ==>
;     acc(a.array[i].value, write))
(declare-const i@93@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] (i in [middle..end))
; [eval] [middle..end)
(assert (Seq_contains (Seq_range middle@39@01 end@7@01) i@93@01))
; [eval] a.array[i]
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (+ (+ (- (- $k@9@01 $k@42@01) $k@58@01) $k@71@01) $k@87@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(assert (not (>= i@93@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@93@01 (Seq_length $t@89@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-const $t@94@01 $FVF<value>)
(declare-fun inv@95@01 ($Ref) Int)
(declare-fun img@96@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@93@01 Int) (i2@93@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range middle@39@01 end@7@01) i1@93@01)
      (Seq_contains (Seq_range middle@39@01 end@7@01) i2@93@01)
      (= (Seq_index $t@89@01 i1@93@01) (Seq_index $t@89@01 i2@93@01)))
    (= i1@93@01 i2@93@01))
  
  :qid |value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@93@01 Int)) (!
  (=>
    (Seq_contains (Seq_range middle@39@01 end@7@01) i@93@01)
    (and
      (= (inv@95@01 (Seq_index $t@89@01 i@93@01)) i@93@01)
      (img@96@01 (Seq_index $t@89@01 i@93@01))))
  :pattern ((Seq_index $t@89@01 i@93@01))
  :qid |quant-u-37|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@96@01 r)
      (Seq_contains (Seq_range middle@39@01 end@7@01) (inv@95@01 r)))
    (= (Seq_index $t@89@01 (inv@95@01 r)) r))
  :pattern ((inv@95@01 r))
  :qid |value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@93@01 Int)) (!
  (=>
    (Seq_contains (Seq_range middle@39@01 end@7@01) i@93@01)
    (not (= (Seq_index $t@89@01 i@93@01) $Ref.null)))
  :pattern ((Seq_index $t@89@01 i@93@01))
  :qid |value-permImpliesNonNull|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index $t@89@01 i@93@01) (Seq_index $t@76@01 i@81@01))
    (=
      (and
        (img@96@01 r)
        (Seq_contains (Seq_range middle@39@01 end@7@01) (inv@95@01 r)))
      (and
        (img@84@01 r)
        (Seq_contains (Seq_range start@6@01 middle@39@01) (inv@83@01 r)))))
  
  :qid |quant-u-38|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index $t@89@01 i@93@01) (Seq_index $t@73@01 i@77@01))
    (=
      (and
        (img@96@01 r)
        (Seq_contains (Seq_range middle@39@01 end@7@01) (inv@95@01 r)))
      (and
        (img@80@01 r)
        (Seq_contains (Seq_range start@6@01 middle@39@01) (inv@79@01 r)))))
  
  :qid |quant-u-39|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall i: Int ::(i in [middle..end)) ==>
;     acc(b.array[i].value, write))
(declare-const i@97@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] (i in [middle..end))
; [eval] [middle..end)
(assert (Seq_contains (Seq_range middle@39@01 end@7@01) i@97@01))
; [eval] b.array[i]
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (+ (+ (- (- $k@10@01 $k@43@01) $k@59@01) $k@74@01) $k@90@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(assert (not (>= i@97@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@97@01 (Seq_length $t@92@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-const $t@98@01 $FVF<value>)
(declare-fun inv@99@01 ($Ref) Int)
(declare-fun img@100@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@97@01 Int) (i2@97@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range middle@39@01 end@7@01) i1@97@01)
      (Seq_contains (Seq_range middle@39@01 end@7@01) i2@97@01)
      (= (Seq_index $t@92@01 i1@97@01) (Seq_index $t@92@01 i2@97@01)))
    (= i1@97@01 i2@97@01))
  
  :qid |value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@97@01 Int)) (!
  (=>
    (Seq_contains (Seq_range middle@39@01 end@7@01) i@97@01)
    (and
      (= (inv@99@01 (Seq_index $t@92@01 i@97@01)) i@97@01)
      (img@100@01 (Seq_index $t@92@01 i@97@01))))
  :pattern ((Seq_index $t@92@01 i@97@01))
  :qid |quant-u-41|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@100@01 r)
      (Seq_contains (Seq_range middle@39@01 end@7@01) (inv@99@01 r)))
    (= (Seq_index $t@92@01 (inv@99@01 r)) r))
  :pattern ((inv@99@01 r))
  :qid |value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@97@01 Int)) (!
  (=>
    (Seq_contains (Seq_range middle@39@01 end@7@01) i@97@01)
    (not (= (Seq_index $t@92@01 i@97@01) $Ref.null)))
  :pattern ((Seq_index $t@92@01 i@97@01))
  :qid |value-permImpliesNonNull|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index $t@92@01 i@97@01) (Seq_index $t@89@01 i@93@01))
    (=
      (and
        (img@100@01 r)
        (Seq_contains (Seq_range middle@39@01 end@7@01) (inv@99@01 r)))
      (and
        (img@96@01 r)
        (Seq_contains (Seq_range middle@39@01 end@7@01) (inv@95@01 r)))))
  
  :qid |quant-u-42|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index $t@92@01 i@97@01) (Seq_index $t@76@01 i@81@01))
    (=
      (and
        (img@100@01 r)
        (Seq_contains (Seq_range middle@39@01 end@7@01) (inv@99@01 r)))
      (and
        (img@84@01 r)
        (Seq_contains (Seq_range start@6@01 middle@39@01) (inv@83@01 r)))))
  
  :qid |quant-u-43|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index $t@92@01 i@97@01) (Seq_index $t@73@01 i@77@01))
    (=
      (and
        (img@100@01 r)
        (Seq_contains (Seq_range middle@39@01 end@7@01) (inv@99@01 r)))
      (and
        (img@80@01 r)
        (Seq_contains (Seq_range start@6@01 middle@39@01) (inv@79@01 r)))))
  
  :qid |quant-u-44|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale a.array == t2A
(declare-const $t@101@01 $Snap)
(assert (= $t@101@01 $Snap.unit))
; [eval] a.array == t2A
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (+ (+ (- (- $k@9@01 $k@42@01) $k@58@01) $k@71@01) $k@87@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal $t@89@01 t2A@56@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale b.array == t2B
(declare-const $t@102@01 $Snap)
(assert (= $t@102@01 $Snap.unit))
; [eval] b.array == t2B
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (+ (+ (- (- $k@10@01 $k@43@01) $k@59@01) $k@74@01) $k@90@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal $t@92@01 t2B@57@01))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; merge(a, b, start, middle, end)
(declare-const $k@103@01 $Perm)
(assert ($Perm.isReadVar $k@103@01))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= (+ (+ (- (- $k@9@01 $k@42@01) $k@58@01) $k@71@01) $k@87@01) $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (< $k@103@01 (+ (+ (- (- $k@9@01 $k@42@01) $k@58@01) $k@71@01) $k@87@01)))
(assert (<=
  $Perm.No
  (- (+ (+ (- (- $k@9@01 $k@42@01) $k@58@01) $k@71@01) $k@87@01) $k@103@01)))
(assert (<=
  (- (+ (+ (- (- $k@9@01 $k@42@01) $k@58@01) $k@71@01) $k@87@01) $k@103@01)
  $Perm.Write))
(assert (=>
  (<
    $Perm.No
    (- (+ (+ (- (- $k@9@01 $k@42@01) $k@58@01) $k@71@01) $k@87@01) $k@103@01))
  (not (= a@4@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@103@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(declare-const $k@104@01 $Perm)
(assert ($Perm.isReadVar $k@104@01))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= (+ (+ (- (- $k@10@01 $k@43@01) $k@59@01) $k@74@01) $k@90@01) $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (< $k@104@01 (+ (+ (- (- $k@10@01 $k@43@01) $k@59@01) $k@74@01) $k@90@01)))
(assert (<=
  $Perm.No
  (- (+ (+ (- (- $k@10@01 $k@43@01) $k@59@01) $k@74@01) $k@90@01) $k@104@01)))
(assert (<=
  (- (+ (+ (- (- $k@10@01 $k@43@01) $k@59@01) $k@74@01) $k@90@01) $k@104@01)
  $Perm.Write))
(assert (=>
  (<
    $Perm.No
    (- (+ (+ (- (- $k@10@01 $k@43@01) $k@59@01) $k@74@01) $k@90@01) $k@104@01))
  (not (= b@5@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@104@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] 0 <= start
(set-option :timeout 0)
(push) ; 4
(assert (not (<= 0 start@6@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 start@6@01))
; [eval] end <= |a.array|
; [eval] |a.array|
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (+ (+ (- (- $k@9@01 $k@42@01) $k@58@01) $k@71@01) $k@87@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(assert (not (<= end@7@01 (Seq_length $t@89@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (<= end@7@01 (Seq_length $t@89@01)))
; [eval] |b.array| == |a.array|
; [eval] |b.array|
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (+ (+ (- (- $k@10@01 $k@43@01) $k@59@01) $k@74@01) $k@90@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] |a.array|
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (+ (+ (- (- $k@9@01 $k@42@01) $k@58@01) $k@71@01) $k@87@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(assert (not (= (Seq_length $t@92@01) (Seq_length $t@89@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (= (Seq_length $t@92@01) (Seq_length $t@89@01)))
; [eval] start < middle
(push) ; 4
(assert (not (< start@6@01 middle@39@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (< start@6@01 middle@39@01))
; [eval] middle < end
(push) ; 4
(assert (not (< middle@39@01 end@7@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (< middle@39@01 end@7@01))
; [eval] (forall i: Int, j: Int :: { (i in [start..end)), (j in [start..end)) } { (i in [start..end)), a.array[j] } { (j in [start..end)), a.array[i] } { a.array[i], a.array[j] } (i in [start..end)) && ((j in [start..end)) && i != j) ==> a.array[i] != a.array[j])
(declare-const i@105@01 Int)
(declare-const j@106@01 Int)
(push) ; 4
; [eval] (i in [start..end)) && ((j in [start..end)) && i != j) ==> a.array[i] != a.array[j]
; [eval] (i in [start..end)) && ((j in [start..end)) && i != j)
; [eval] (i in [start..end))
; [eval] [start..end)
(push) ; 5
; [then-branch: 13 | !(i@105@01 in [start@6@01..end@7@01]) | live]
; [else-branch: 13 | i@105@01 in [start@6@01..end@7@01] | live]
(push) ; 6
; [then-branch: 13 | !(i@105@01 in [start@6@01..end@7@01])]
(assert (not (Seq_contains (Seq_range start@6@01 end@7@01) i@105@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 13 | i@105@01 in [start@6@01..end@7@01]]
(assert (Seq_contains (Seq_range start@6@01 end@7@01) i@105@01))
; [eval] (j in [start..end))
; [eval] [start..end)
(push) ; 7
; [then-branch: 14 | !(j@106@01 in [start@6@01..end@7@01]) | live]
; [else-branch: 14 | j@106@01 in [start@6@01..end@7@01] | live]
(push) ; 8
; [then-branch: 14 | !(j@106@01 in [start@6@01..end@7@01])]
(assert (not (Seq_contains (Seq_range start@6@01 end@7@01) j@106@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 14 | j@106@01 in [start@6@01..end@7@01]]
(assert (Seq_contains (Seq_range start@6@01 end@7@01) j@106@01))
; [eval] i != j
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range start@6@01 end@7@01) j@106@01)
  (not (Seq_contains (Seq_range start@6@01 end@7@01) j@106@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range start@6@01 end@7@01) i@105@01)
  (and
    (Seq_contains (Seq_range start@6@01 end@7@01) i@105@01)
    (or
      (Seq_contains (Seq_range start@6@01 end@7@01) j@106@01)
      (not (Seq_contains (Seq_range start@6@01 end@7@01) j@106@01))))))
(assert (or
  (Seq_contains (Seq_range start@6@01 end@7@01) i@105@01)
  (not (Seq_contains (Seq_range start@6@01 end@7@01) i@105@01))))
(push) ; 5
; [then-branch: 15 | i@105@01 in [start@6@01..end@7@01] && j@106@01 in [start@6@01..end@7@01] && i@105@01 != j@106@01 | live]
; [else-branch: 15 | !(i@105@01 in [start@6@01..end@7@01] && j@106@01 in [start@6@01..end@7@01] && i@105@01 != j@106@01) | live]
(push) ; 6
; [then-branch: 15 | i@105@01 in [start@6@01..end@7@01] && j@106@01 in [start@6@01..end@7@01] && i@105@01 != j@106@01]
(assert (and
  (Seq_contains (Seq_range start@6@01 end@7@01) i@105@01)
  (and
    (Seq_contains (Seq_range start@6@01 end@7@01) j@106@01)
    (not (= i@105@01 j@106@01)))))
; [eval] a.array[i] != a.array[j]
; [eval] a.array[i]
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No (+ (+ (- (- $k@9@01 $k@42@01) $k@58@01) $k@71@01) $k@87@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(assert (not (>= i@105@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@105@01 (Seq_length $t@89@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] a.array[j]
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No (+ (+ (- (- $k@9@01 $k@42@01) $k@58@01) $k@71@01) $k@87@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(assert (not (>= j@106@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< j@106@01 (Seq_length $t@89@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 15 | !(i@105@01 in [start@6@01..end@7@01] && j@106@01 in [start@6@01..end@7@01] && i@105@01 != j@106@01)]
(assert (not
  (and
    (Seq_contains (Seq_range start@6@01 end@7@01) i@105@01)
    (and
      (Seq_contains (Seq_range start@6@01 end@7@01) j@106@01)
      (not (= i@105@01 j@106@01))))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range start@6@01 end@7@01) i@105@01)
    (and
      (Seq_contains (Seq_range start@6@01 end@7@01) j@106@01)
      (not (= i@105@01 j@106@01))))
  (and
    (Seq_contains (Seq_range start@6@01 end@7@01) i@105@01)
    (Seq_contains (Seq_range start@6@01 end@7@01) j@106@01)
    (not (= i@105@01 j@106@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range start@6@01 end@7@01) i@105@01)
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) j@106@01)
        (not (= i@105@01 j@106@01)))))
  (and
    (Seq_contains (Seq_range start@6@01 end@7@01) i@105@01)
    (and
      (Seq_contains (Seq_range start@6@01 end@7@01) j@106@01)
      (not (= i@105@01 j@106@01))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@105@01 Int) (j@106@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range start@6@01 end@7@01) i@105@01)
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@105@01)
        (or
          (Seq_contains (Seq_range start@6@01 end@7@01) j@106@01)
          (not (Seq_contains (Seq_range start@6@01 end@7@01) j@106@01)))))
    (or
      (Seq_contains (Seq_range start@6@01 end@7@01) i@105@01)
      (not (Seq_contains (Seq_range start@6@01 end@7@01) i@105@01)))
    (=>
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@105@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@106@01)
          (not (= i@105@01 j@106@01))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@105@01)
        (Seq_contains (Seq_range start@6@01 end@7@01) j@106@01)
        (not (= i@105@01 j@106@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) i@105@01)
          (and
            (Seq_contains (Seq_range start@6@01 end@7@01) j@106@01)
            (not (= i@105@01 j@106@01)))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@105@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@106@01)
          (not (= i@105@01 j@106@01))))))
  :pattern ((Seq_contains (Seq_range start@6@01 end@7@01) i@105@01) (Seq_contains
    (Seq_range start@6@01 end@7@01)
    j@106@01))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) i@105@01) (Seq_contains_trigger
    (Seq_range start@6@01 end@7@01)
    j@106@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/mergesort.vpr@80@12@80@112-aux|)))
(assert (forall ((i@105@01 Int) (j@106@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range start@6@01 end@7@01) i@105@01)
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@105@01)
        (or
          (Seq_contains (Seq_range start@6@01 end@7@01) j@106@01)
          (not (Seq_contains (Seq_range start@6@01 end@7@01) j@106@01)))))
    (or
      (Seq_contains (Seq_range start@6@01 end@7@01) i@105@01)
      (not (Seq_contains (Seq_range start@6@01 end@7@01) i@105@01)))
    (=>
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@105@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@106@01)
          (not (= i@105@01 j@106@01))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@105@01)
        (Seq_contains (Seq_range start@6@01 end@7@01) j@106@01)
        (not (= i@105@01 j@106@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) i@105@01)
          (and
            (Seq_contains (Seq_range start@6@01 end@7@01) j@106@01)
            (not (= i@105@01 j@106@01)))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@105@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@106@01)
          (not (= i@105@01 j@106@01))))))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) i@105@01) (Seq_contains_trigger
    (Seq_range start@6@01 end@7@01)
    j@106@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/mergesort.vpr@80@12@80@112-aux|)))
(assert (forall ((i@105@01 Int) (j@106@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range start@6@01 end@7@01) i@105@01)
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@105@01)
        (or
          (Seq_contains (Seq_range start@6@01 end@7@01) j@106@01)
          (not (Seq_contains (Seq_range start@6@01 end@7@01) j@106@01)))))
    (or
      (Seq_contains (Seq_range start@6@01 end@7@01) i@105@01)
      (not (Seq_contains (Seq_range start@6@01 end@7@01) i@105@01)))
    (=>
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@105@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@106@01)
          (not (= i@105@01 j@106@01))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@105@01)
        (Seq_contains (Seq_range start@6@01 end@7@01) j@106@01)
        (not (= i@105@01 j@106@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) i@105@01)
          (and
            (Seq_contains (Seq_range start@6@01 end@7@01) j@106@01)
            (not (= i@105@01 j@106@01)))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@105@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@106@01)
          (not (= i@105@01 j@106@01))))))
  :pattern ((Seq_contains (Seq_range start@6@01 end@7@01) i@105@01) (Seq_index
    $t@89@01
    j@106@01))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) i@105@01) (Seq_index
    $t@89@01
    j@106@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/mergesort.vpr@80@12@80@112-aux|)))
(assert (forall ((i@105@01 Int) (j@106@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range start@6@01 end@7@01) i@105@01)
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@105@01)
        (or
          (Seq_contains (Seq_range start@6@01 end@7@01) j@106@01)
          (not (Seq_contains (Seq_range start@6@01 end@7@01) j@106@01)))))
    (or
      (Seq_contains (Seq_range start@6@01 end@7@01) i@105@01)
      (not (Seq_contains (Seq_range start@6@01 end@7@01) i@105@01)))
    (=>
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@105@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@106@01)
          (not (= i@105@01 j@106@01))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@105@01)
        (Seq_contains (Seq_range start@6@01 end@7@01) j@106@01)
        (not (= i@105@01 j@106@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) i@105@01)
          (and
            (Seq_contains (Seq_range start@6@01 end@7@01) j@106@01)
            (not (= i@105@01 j@106@01)))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@105@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@106@01)
          (not (= i@105@01 j@106@01))))))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) i@105@01) (Seq_index
    $t@89@01
    j@106@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/mergesort.vpr@80@12@80@112-aux|)))
(assert (forall ((i@105@01 Int) (j@106@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range start@6@01 end@7@01) i@105@01)
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@105@01)
        (or
          (Seq_contains (Seq_range start@6@01 end@7@01) j@106@01)
          (not (Seq_contains (Seq_range start@6@01 end@7@01) j@106@01)))))
    (or
      (Seq_contains (Seq_range start@6@01 end@7@01) i@105@01)
      (not (Seq_contains (Seq_range start@6@01 end@7@01) i@105@01)))
    (=>
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@105@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@106@01)
          (not (= i@105@01 j@106@01))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@105@01)
        (Seq_contains (Seq_range start@6@01 end@7@01) j@106@01)
        (not (= i@105@01 j@106@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) i@105@01)
          (and
            (Seq_contains (Seq_range start@6@01 end@7@01) j@106@01)
            (not (= i@105@01 j@106@01)))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@105@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@106@01)
          (not (= i@105@01 j@106@01))))))
  :pattern ((Seq_contains (Seq_range start@6@01 end@7@01) j@106@01) (Seq_index
    $t@89@01
    i@105@01))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) j@106@01) (Seq_index
    $t@89@01
    i@105@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/mergesort.vpr@80@12@80@112-aux|)))
(assert (forall ((i@105@01 Int) (j@106@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range start@6@01 end@7@01) i@105@01)
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@105@01)
        (or
          (Seq_contains (Seq_range start@6@01 end@7@01) j@106@01)
          (not (Seq_contains (Seq_range start@6@01 end@7@01) j@106@01)))))
    (or
      (Seq_contains (Seq_range start@6@01 end@7@01) i@105@01)
      (not (Seq_contains (Seq_range start@6@01 end@7@01) i@105@01)))
    (=>
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@105@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@106@01)
          (not (= i@105@01 j@106@01))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@105@01)
        (Seq_contains (Seq_range start@6@01 end@7@01) j@106@01)
        (not (= i@105@01 j@106@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) i@105@01)
          (and
            (Seq_contains (Seq_range start@6@01 end@7@01) j@106@01)
            (not (= i@105@01 j@106@01)))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@105@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@106@01)
          (not (= i@105@01 j@106@01))))))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) j@106@01) (Seq_index
    $t@89@01
    i@105@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/mergesort.vpr@80@12@80@112-aux|)))
(assert (forall ((i@105@01 Int) (j@106@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range start@6@01 end@7@01) i@105@01)
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@105@01)
        (or
          (Seq_contains (Seq_range start@6@01 end@7@01) j@106@01)
          (not (Seq_contains (Seq_range start@6@01 end@7@01) j@106@01)))))
    (or
      (Seq_contains (Seq_range start@6@01 end@7@01) i@105@01)
      (not (Seq_contains (Seq_range start@6@01 end@7@01) i@105@01)))
    (=>
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@105@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@106@01)
          (not (= i@105@01 j@106@01))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@105@01)
        (Seq_contains (Seq_range start@6@01 end@7@01) j@106@01)
        (not (= i@105@01 j@106@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) i@105@01)
          (and
            (Seq_contains (Seq_range start@6@01 end@7@01) j@106@01)
            (not (= i@105@01 j@106@01)))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@105@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@106@01)
          (not (= i@105@01 j@106@01))))))
  :pattern ((Seq_index $t@89@01 i@105@01) (Seq_index $t@89@01 j@106@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/mergesort.vpr@80@12@80@112-aux|)))
(push) ; 4
(assert (not (forall ((i@105@01 Int) (j@106@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range start@6@01 end@7@01) i@105@01)
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) j@106@01)
        (not (= i@105@01 j@106@01))))
    (not (= (Seq_index $t@89@01 i@105@01) (Seq_index $t@89@01 j@106@01))))
  :pattern ((Seq_contains (Seq_range start@6@01 end@7@01) i@105@01) (Seq_contains
    (Seq_range start@6@01 end@7@01)
    j@106@01))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) i@105@01) (Seq_contains_trigger
    (Seq_range start@6@01 end@7@01)
    j@106@01))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) i@105@01) (Seq_contains_trigger
    (Seq_range start@6@01 end@7@01)
    j@106@01))
  :pattern ((Seq_contains (Seq_range start@6@01 end@7@01) i@105@01) (Seq_index
    $t@89@01
    j@106@01))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) i@105@01) (Seq_index
    $t@89@01
    j@106@01))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) i@105@01) (Seq_index
    $t@89@01
    j@106@01))
  :pattern ((Seq_contains (Seq_range start@6@01 end@7@01) j@106@01) (Seq_index
    $t@89@01
    i@105@01))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) j@106@01) (Seq_index
    $t@89@01
    i@105@01))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) j@106@01) (Seq_index
    $t@89@01
    i@105@01))
  :pattern ((Seq_index $t@89@01 i@105@01) (Seq_index $t@89@01 j@106@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/mergesort.vpr@80@12@80@112|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@105@01 Int) (j@106@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range start@6@01 end@7@01) i@105@01)
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) j@106@01)
        (not (= i@105@01 j@106@01))))
    (not (= (Seq_index $t@89@01 i@105@01) (Seq_index $t@89@01 j@106@01))))
  :pattern ((Seq_contains (Seq_range start@6@01 end@7@01) i@105@01) (Seq_contains
    (Seq_range start@6@01 end@7@01)
    j@106@01))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) i@105@01) (Seq_contains_trigger
    (Seq_range start@6@01 end@7@01)
    j@106@01))
  :pattern ((Seq_contains (Seq_range start@6@01 end@7@01) i@105@01) (Seq_index
    $t@89@01
    j@106@01))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) i@105@01) (Seq_index
    $t@89@01
    j@106@01))
  :pattern ((Seq_contains (Seq_range start@6@01 end@7@01) j@106@01) (Seq_index
    $t@89@01
    i@105@01))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) j@106@01) (Seq_index
    $t@89@01
    i@105@01))
  :pattern ((Seq_index $t@89@01 i@105@01) (Seq_index $t@89@01 j@106@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/mergesort.vpr@80@12@80@112|)))
(declare-const k@107@01 Int)
(push) ; 4
; [eval] (k in [start..end))
; [eval] [start..end)
(assert (Seq_contains (Seq_range start@6@01 end@7@01) k@107@01))
; [eval] a.array[k]
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (+ (+ (- (- $k@9@01 $k@42@01) $k@58@01) $k@71@01) $k@87@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(assert (not (>= k@107@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< k@107@01 (Seq_length $t@89@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@108@01 ($Ref) Int)
(declare-fun img@109@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((k1@107@01 Int) (k2@107@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range start@6@01 end@7@01) k1@107@01)
      (Seq_contains (Seq_range start@6@01 end@7@01) k2@107@01)
      (= (Seq_index $t@89@01 k1@107@01) (Seq_index $t@89@01 k2@107@01)))
    (= k1@107@01 k2@107@01))
  
  :qid |value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@107@01 Int)) (!
  (=>
    (Seq_contains (Seq_range start@6@01 end@7@01) k@107@01)
    (and
      (= (inv@108@01 (Seq_index $t@89@01 k@107@01)) k@107@01)
      (img@109@01 (Seq_index $t@89@01 k@107@01))))
  :pattern ((Seq_index $t@89@01 k@107@01))
  :qid |value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@109@01 r)
      (Seq_contains (Seq_range start@6@01 end@7@01) (inv@108@01 r)))
    (= (Seq_index $t@89@01 (inv@108@01 r)) r))
  :pattern ((inv@108@01 r))
  :qid |value-fctOfInv|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((k@107@01 Int)) (!
  (= (Seq_index $t@89@01 k@107@01) (Seq_index $t@73@01 k@107@01))
  
  :qid |quant-u-46|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((k@107@01 Int)) (!
  (= (Seq_index $t@89@01 k@107@01) (Seq_index $t@76@01 k@107@01))
  
  :qid |quant-u-47|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((k@107@01 Int)) (!
  (= (Seq_index $t@89@01 k@107@01) (Seq_index $t@92@01 k@107@01))
  
  :qid |quant-u-48|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@110@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range start@6@01 end@7@01) (inv@108@01 r))
      (img@109@01 r)
      (= r (Seq_index $t@89@01 (inv@108@01 r))))
    ($Perm.min
      (ite
        (and
          (img@80@01 r)
          (Seq_contains (Seq_range start@6@01 middle@39@01) (inv@79@01 r)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@111@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range start@6@01 end@7@01) (inv@108@01 r))
      (img@109@01 r)
      (= r (Seq_index $t@89@01 (inv@108@01 r))))
    ($Perm.min
      (ite
        (and
          (img@96@01 r)
          (Seq_contains (Seq_range middle@39@01 end@7@01) (inv@95@01 r)))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@110@01 r)))
    $Perm.No))
(define-fun pTaken@112@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range start@6@01 end@7@01) (inv@108@01 r))
      (img@109@01 r)
      (= r (Seq_index $t@89@01 (inv@108@01 r))))
    ($Perm.min
      (ite
        (and
          (img@84@01 r)
          (Seq_contains (Seq_range start@6@01 middle@39@01) (inv@83@01 r)))
        $Perm.Write
        $Perm.No)
      (- (- $Perm.Write (pTaken@110@01 r)) (pTaken@111@01 r)))
    $Perm.No))
(define-fun pTaken@113@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range start@6@01 end@7@01) (inv@108@01 r))
      (img@109@01 r)
      (= r (Seq_index $t@89@01 (inv@108@01 r))))
    ($Perm.min
      (ite
        (and
          (img@100@01 r)
          (Seq_contains (Seq_range middle@39@01 end@7@01) (inv@99@01 r)))
        $Perm.Write
        $Perm.No)
      (-
        (- (- $Perm.Write (pTaken@110@01 r)) (pTaken@111@01 r))
        (pTaken@112@01 r)))
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
          (img@80@01 r)
          (Seq_contains (Seq_range start@6@01 middle@39@01) (inv@79@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@110@01 r))
    $Perm.No)
  
  :qid |quant-u-50|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (Seq_contains (Seq_range start@6@01 end@7@01) (inv@108@01 r))
      (img@109@01 r)
      (= r (Seq_index $t@89@01 (inv@108@01 r))))
    (= (- $Perm.Write (pTaken@110@01 r)) $Perm.No))
  
  :qid |quant-u-51|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
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
          (img@96@01 r)
          (Seq_contains (Seq_range middle@39@01 end@7@01) (inv@95@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@111@01 r))
    $Perm.No)
  
  :qid |quant-u-52|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (Seq_contains (Seq_range start@6@01 end@7@01) (inv@108@01 r))
      (img@109@01 r)
      (= r (Seq_index $t@89@01 (inv@108@01 r))))
    (= (- (- $Perm.Write (pTaken@110@01 r)) (pTaken@111@01 r)) $Perm.No))
  
  :qid |quant-u-53|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@114@01 $FVF<value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@80@01 r)
      (Seq_contains (Seq_range start@6@01 middle@39@01) (inv@79@01 r)))
    (=
      ($FVF.lookup_value (as sm@114@01  $FVF<value>) r)
      ($FVF.lookup_value $t@78@01 r)))
  :pattern (($FVF.lookup_value (as sm@114@01  $FVF<value>) r))
  :pattern (($FVF.lookup_value $t@78@01 r))
  :qid |qp.fvfValDef7|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@84@01 r)
      (Seq_contains (Seq_range start@6@01 middle@39@01) (inv@83@01 r)))
    (=
      ($FVF.lookup_value (as sm@114@01  $FVF<value>) r)
      ($FVF.lookup_value $t@82@01 r)))
  :pattern (($FVF.lookup_value (as sm@114@01  $FVF<value>) r))
  :pattern (($FVF.lookup_value $t@82@01 r))
  :qid |qp.fvfValDef8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@96@01 r)
      (Seq_contains (Seq_range middle@39@01 end@7@01) (inv@95@01 r)))
    (=
      ($FVF.lookup_value (as sm@114@01  $FVF<value>) r)
      ($FVF.lookup_value $t@94@01 r)))
  :pattern (($FVF.lookup_value (as sm@114@01  $FVF<value>) r))
  :pattern (($FVF.lookup_value $t@94@01 r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@100@01 r)
      (Seq_contains (Seq_range middle@39@01 end@7@01) (inv@99@01 r)))
    (=
      ($FVF.lookup_value (as sm@114@01  $FVF<value>) r)
      ($FVF.lookup_value $t@98@01 r)))
  :pattern (($FVF.lookup_value (as sm@114@01  $FVF<value>) r))
  :pattern (($FVF.lookup_value $t@98@01 r))
  :qid |qp.fvfValDef10|)))
; [eval] (forall i: Int, j: Int :: { (i in [start..end)), (j in [start..end)) } { (i in [start..end)), b.array[j] } { (j in [start..end)), b.array[i] } { b.array[i], b.array[j] } (i in [start..end)) && ((j in [start..end)) && i != j) ==> b.array[i] != b.array[j])
(declare-const i@115@01 Int)
(declare-const j@116@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] (i in [start..end)) && ((j in [start..end)) && i != j) ==> b.array[i] != b.array[j]
; [eval] (i in [start..end)) && ((j in [start..end)) && i != j)
; [eval] (i in [start..end))
; [eval] [start..end)
(push) ; 5
; [then-branch: 16 | !(i@115@01 in [start@6@01..end@7@01]) | live]
; [else-branch: 16 | i@115@01 in [start@6@01..end@7@01] | live]
(push) ; 6
; [then-branch: 16 | !(i@115@01 in [start@6@01..end@7@01])]
(assert (not (Seq_contains (Seq_range start@6@01 end@7@01) i@115@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 16 | i@115@01 in [start@6@01..end@7@01]]
(assert (Seq_contains (Seq_range start@6@01 end@7@01) i@115@01))
; [eval] (j in [start..end))
; [eval] [start..end)
(push) ; 7
; [then-branch: 17 | !(j@116@01 in [start@6@01..end@7@01]) | live]
; [else-branch: 17 | j@116@01 in [start@6@01..end@7@01] | live]
(push) ; 8
; [then-branch: 17 | !(j@116@01 in [start@6@01..end@7@01])]
(assert (not (Seq_contains (Seq_range start@6@01 end@7@01) j@116@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 17 | j@116@01 in [start@6@01..end@7@01]]
(assert (Seq_contains (Seq_range start@6@01 end@7@01) j@116@01))
; [eval] i != j
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range start@6@01 end@7@01) j@116@01)
  (not (Seq_contains (Seq_range start@6@01 end@7@01) j@116@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range start@6@01 end@7@01) i@115@01)
  (and
    (Seq_contains (Seq_range start@6@01 end@7@01) i@115@01)
    (or
      (Seq_contains (Seq_range start@6@01 end@7@01) j@116@01)
      (not (Seq_contains (Seq_range start@6@01 end@7@01) j@116@01))))))
(assert (or
  (Seq_contains (Seq_range start@6@01 end@7@01) i@115@01)
  (not (Seq_contains (Seq_range start@6@01 end@7@01) i@115@01))))
(push) ; 5
; [then-branch: 18 | i@115@01 in [start@6@01..end@7@01] && j@116@01 in [start@6@01..end@7@01] && i@115@01 != j@116@01 | live]
; [else-branch: 18 | !(i@115@01 in [start@6@01..end@7@01] && j@116@01 in [start@6@01..end@7@01] && i@115@01 != j@116@01) | live]
(push) ; 6
; [then-branch: 18 | i@115@01 in [start@6@01..end@7@01] && j@116@01 in [start@6@01..end@7@01] && i@115@01 != j@116@01]
(assert (and
  (Seq_contains (Seq_range start@6@01 end@7@01) i@115@01)
  (and
    (Seq_contains (Seq_range start@6@01 end@7@01) j@116@01)
    (not (= i@115@01 j@116@01)))))
; [eval] b.array[i] != b.array[j]
; [eval] b.array[i]
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No (+ (+ (- (- $k@10@01 $k@43@01) $k@59@01) $k@74@01) $k@90@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(assert (not (>= i@115@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@115@01 (Seq_length $t@92@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] b.array[j]
(push) ; 7
(set-option :timeout 10)
(assert (not (< $Perm.No (+ (+ (- (- $k@10@01 $k@43@01) $k@59@01) $k@74@01) $k@90@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(assert (not (>= j@116@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< j@116@01 (Seq_length $t@92@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 18 | !(i@115@01 in [start@6@01..end@7@01] && j@116@01 in [start@6@01..end@7@01] && i@115@01 != j@116@01)]
(assert (not
  (and
    (Seq_contains (Seq_range start@6@01 end@7@01) i@115@01)
    (and
      (Seq_contains (Seq_range start@6@01 end@7@01) j@116@01)
      (not (= i@115@01 j@116@01))))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range start@6@01 end@7@01) i@115@01)
    (and
      (Seq_contains (Seq_range start@6@01 end@7@01) j@116@01)
      (not (= i@115@01 j@116@01))))
  (and
    (Seq_contains (Seq_range start@6@01 end@7@01) i@115@01)
    (Seq_contains (Seq_range start@6@01 end@7@01) j@116@01)
    (not (= i@115@01 j@116@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range start@6@01 end@7@01) i@115@01)
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) j@116@01)
        (not (= i@115@01 j@116@01)))))
  (and
    (Seq_contains (Seq_range start@6@01 end@7@01) i@115@01)
    (and
      (Seq_contains (Seq_range start@6@01 end@7@01) j@116@01)
      (not (= i@115@01 j@116@01))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@115@01 Int) (j@116@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range start@6@01 end@7@01) i@115@01)
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@115@01)
        (or
          (Seq_contains (Seq_range start@6@01 end@7@01) j@116@01)
          (not (Seq_contains (Seq_range start@6@01 end@7@01) j@116@01)))))
    (or
      (Seq_contains (Seq_range start@6@01 end@7@01) i@115@01)
      (not (Seq_contains (Seq_range start@6@01 end@7@01) i@115@01)))
    (=>
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@115@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@116@01)
          (not (= i@115@01 j@116@01))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@115@01)
        (Seq_contains (Seq_range start@6@01 end@7@01) j@116@01)
        (not (= i@115@01 j@116@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) i@115@01)
          (and
            (Seq_contains (Seq_range start@6@01 end@7@01) j@116@01)
            (not (= i@115@01 j@116@01)))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@115@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@116@01)
          (not (= i@115@01 j@116@01))))))
  :pattern ((Seq_contains (Seq_range start@6@01 end@7@01) i@115@01) (Seq_contains
    (Seq_range start@6@01 end@7@01)
    j@116@01))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) i@115@01) (Seq_contains_trigger
    (Seq_range start@6@01 end@7@01)
    j@116@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/mergesort.vpr@82@12@82@112-aux|)))
(assert (forall ((i@115@01 Int) (j@116@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range start@6@01 end@7@01) i@115@01)
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@115@01)
        (or
          (Seq_contains (Seq_range start@6@01 end@7@01) j@116@01)
          (not (Seq_contains (Seq_range start@6@01 end@7@01) j@116@01)))))
    (or
      (Seq_contains (Seq_range start@6@01 end@7@01) i@115@01)
      (not (Seq_contains (Seq_range start@6@01 end@7@01) i@115@01)))
    (=>
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@115@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@116@01)
          (not (= i@115@01 j@116@01))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@115@01)
        (Seq_contains (Seq_range start@6@01 end@7@01) j@116@01)
        (not (= i@115@01 j@116@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) i@115@01)
          (and
            (Seq_contains (Seq_range start@6@01 end@7@01) j@116@01)
            (not (= i@115@01 j@116@01)))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@115@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@116@01)
          (not (= i@115@01 j@116@01))))))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) i@115@01) (Seq_contains_trigger
    (Seq_range start@6@01 end@7@01)
    j@116@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/mergesort.vpr@82@12@82@112-aux|)))
(assert (forall ((i@115@01 Int) (j@116@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range start@6@01 end@7@01) i@115@01)
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@115@01)
        (or
          (Seq_contains (Seq_range start@6@01 end@7@01) j@116@01)
          (not (Seq_contains (Seq_range start@6@01 end@7@01) j@116@01)))))
    (or
      (Seq_contains (Seq_range start@6@01 end@7@01) i@115@01)
      (not (Seq_contains (Seq_range start@6@01 end@7@01) i@115@01)))
    (=>
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@115@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@116@01)
          (not (= i@115@01 j@116@01))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@115@01)
        (Seq_contains (Seq_range start@6@01 end@7@01) j@116@01)
        (not (= i@115@01 j@116@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) i@115@01)
          (and
            (Seq_contains (Seq_range start@6@01 end@7@01) j@116@01)
            (not (= i@115@01 j@116@01)))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@115@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@116@01)
          (not (= i@115@01 j@116@01))))))
  :pattern ((Seq_contains (Seq_range start@6@01 end@7@01) i@115@01) (Seq_index
    $t@92@01
    j@116@01))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) i@115@01) (Seq_index
    $t@92@01
    j@116@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/mergesort.vpr@82@12@82@112-aux|)))
(assert (forall ((i@115@01 Int) (j@116@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range start@6@01 end@7@01) i@115@01)
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@115@01)
        (or
          (Seq_contains (Seq_range start@6@01 end@7@01) j@116@01)
          (not (Seq_contains (Seq_range start@6@01 end@7@01) j@116@01)))))
    (or
      (Seq_contains (Seq_range start@6@01 end@7@01) i@115@01)
      (not (Seq_contains (Seq_range start@6@01 end@7@01) i@115@01)))
    (=>
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@115@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@116@01)
          (not (= i@115@01 j@116@01))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@115@01)
        (Seq_contains (Seq_range start@6@01 end@7@01) j@116@01)
        (not (= i@115@01 j@116@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) i@115@01)
          (and
            (Seq_contains (Seq_range start@6@01 end@7@01) j@116@01)
            (not (= i@115@01 j@116@01)))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@115@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@116@01)
          (not (= i@115@01 j@116@01))))))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) i@115@01) (Seq_index
    $t@92@01
    j@116@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/mergesort.vpr@82@12@82@112-aux|)))
(assert (forall ((i@115@01 Int) (j@116@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range start@6@01 end@7@01) i@115@01)
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@115@01)
        (or
          (Seq_contains (Seq_range start@6@01 end@7@01) j@116@01)
          (not (Seq_contains (Seq_range start@6@01 end@7@01) j@116@01)))))
    (or
      (Seq_contains (Seq_range start@6@01 end@7@01) i@115@01)
      (not (Seq_contains (Seq_range start@6@01 end@7@01) i@115@01)))
    (=>
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@115@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@116@01)
          (not (= i@115@01 j@116@01))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@115@01)
        (Seq_contains (Seq_range start@6@01 end@7@01) j@116@01)
        (not (= i@115@01 j@116@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) i@115@01)
          (and
            (Seq_contains (Seq_range start@6@01 end@7@01) j@116@01)
            (not (= i@115@01 j@116@01)))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@115@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@116@01)
          (not (= i@115@01 j@116@01))))))
  :pattern ((Seq_contains (Seq_range start@6@01 end@7@01) j@116@01) (Seq_index
    $t@92@01
    i@115@01))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) j@116@01) (Seq_index
    $t@92@01
    i@115@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/mergesort.vpr@82@12@82@112-aux|)))
(assert (forall ((i@115@01 Int) (j@116@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range start@6@01 end@7@01) i@115@01)
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@115@01)
        (or
          (Seq_contains (Seq_range start@6@01 end@7@01) j@116@01)
          (not (Seq_contains (Seq_range start@6@01 end@7@01) j@116@01)))))
    (or
      (Seq_contains (Seq_range start@6@01 end@7@01) i@115@01)
      (not (Seq_contains (Seq_range start@6@01 end@7@01) i@115@01)))
    (=>
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@115@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@116@01)
          (not (= i@115@01 j@116@01))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@115@01)
        (Seq_contains (Seq_range start@6@01 end@7@01) j@116@01)
        (not (= i@115@01 j@116@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) i@115@01)
          (and
            (Seq_contains (Seq_range start@6@01 end@7@01) j@116@01)
            (not (= i@115@01 j@116@01)))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@115@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@116@01)
          (not (= i@115@01 j@116@01))))))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) j@116@01) (Seq_index
    $t@92@01
    i@115@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/mergesort.vpr@82@12@82@112-aux|)))
(assert (forall ((i@115@01 Int) (j@116@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range start@6@01 end@7@01) i@115@01)
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@115@01)
        (or
          (Seq_contains (Seq_range start@6@01 end@7@01) j@116@01)
          (not (Seq_contains (Seq_range start@6@01 end@7@01) j@116@01)))))
    (or
      (Seq_contains (Seq_range start@6@01 end@7@01) i@115@01)
      (not (Seq_contains (Seq_range start@6@01 end@7@01) i@115@01)))
    (=>
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@115@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@116@01)
          (not (= i@115@01 j@116@01))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@115@01)
        (Seq_contains (Seq_range start@6@01 end@7@01) j@116@01)
        (not (= i@115@01 j@116@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) i@115@01)
          (and
            (Seq_contains (Seq_range start@6@01 end@7@01) j@116@01)
            (not (= i@115@01 j@116@01)))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@115@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@116@01)
          (not (= i@115@01 j@116@01))))))
  :pattern ((Seq_index $t@92@01 i@115@01) (Seq_index $t@92@01 j@116@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/mergesort.vpr@82@12@82@112-aux|)))
(push) ; 4
(assert (not (forall ((i@115@01 Int) (j@116@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range start@6@01 end@7@01) i@115@01)
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) j@116@01)
        (not (= i@115@01 j@116@01))))
    (not (= (Seq_index $t@92@01 i@115@01) (Seq_index $t@92@01 j@116@01))))
  :pattern ((Seq_contains (Seq_range start@6@01 end@7@01) i@115@01) (Seq_contains
    (Seq_range start@6@01 end@7@01)
    j@116@01))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) i@115@01) (Seq_contains_trigger
    (Seq_range start@6@01 end@7@01)
    j@116@01))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) i@115@01) (Seq_contains_trigger
    (Seq_range start@6@01 end@7@01)
    j@116@01))
  :pattern ((Seq_contains (Seq_range start@6@01 end@7@01) i@115@01) (Seq_index
    $t@92@01
    j@116@01))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) i@115@01) (Seq_index
    $t@92@01
    j@116@01))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) i@115@01) (Seq_index
    $t@92@01
    j@116@01))
  :pattern ((Seq_contains (Seq_range start@6@01 end@7@01) j@116@01) (Seq_index
    $t@92@01
    i@115@01))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) j@116@01) (Seq_index
    $t@92@01
    i@115@01))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) j@116@01) (Seq_index
    $t@92@01
    i@115@01))
  :pattern ((Seq_index $t@92@01 i@115@01) (Seq_index $t@92@01 j@116@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/mergesort.vpr@82@12@82@112|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@115@01 Int) (j@116@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range start@6@01 end@7@01) i@115@01)
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) j@116@01)
        (not (= i@115@01 j@116@01))))
    (not (= (Seq_index $t@92@01 i@115@01) (Seq_index $t@92@01 j@116@01))))
  :pattern ((Seq_contains (Seq_range start@6@01 end@7@01) i@115@01) (Seq_contains
    (Seq_range start@6@01 end@7@01)
    j@116@01))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) i@115@01) (Seq_contains_trigger
    (Seq_range start@6@01 end@7@01)
    j@116@01))
  :pattern ((Seq_contains (Seq_range start@6@01 end@7@01) i@115@01) (Seq_index
    $t@92@01
    j@116@01))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) i@115@01) (Seq_index
    $t@92@01
    j@116@01))
  :pattern ((Seq_contains (Seq_range start@6@01 end@7@01) j@116@01) (Seq_index
    $t@92@01
    i@115@01))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) j@116@01) (Seq_index
    $t@92@01
    i@115@01))
  :pattern ((Seq_index $t@92@01 i@115@01) (Seq_index $t@92@01 j@116@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/mergesort.vpr@82@12@82@112|)))
(declare-const l@117@01 Int)
(push) ; 4
; [eval] (l in [start..end))
; [eval] [start..end)
(assert (Seq_contains (Seq_range start@6@01 end@7@01) l@117@01))
; [eval] b.array[l]
(push) ; 5
(set-option :timeout 10)
(assert (not (< $Perm.No (+ (+ (- (- $k@10@01 $k@43@01) $k@59@01) $k@74@01) $k@90@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(assert (not (>= l@117@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< l@117@01 (Seq_length $t@92@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@118@01 ($Ref) Int)
(declare-fun img@119@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((l1@117@01 Int) (l2@117@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range start@6@01 end@7@01) l1@117@01)
      (Seq_contains (Seq_range start@6@01 end@7@01) l2@117@01)
      (= (Seq_index $t@92@01 l1@117@01) (Seq_index $t@92@01 l2@117@01)))
    (= l1@117@01 l2@117@01))
  
  :qid |value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((l@117@01 Int)) (!
  (=>
    (Seq_contains (Seq_range start@6@01 end@7@01) l@117@01)
    (and
      (= (inv@118@01 (Seq_index $t@92@01 l@117@01)) l@117@01)
      (img@119@01 (Seq_index $t@92@01 l@117@01))))
  :pattern ((Seq_index $t@92@01 l@117@01))
  :qid |value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@119@01 r)
      (Seq_contains (Seq_range start@6@01 end@7@01) (inv@118@01 r)))
    (= (Seq_index $t@92@01 (inv@118@01 r)) r))
  :pattern ((inv@118@01 r))
  :qid |value-fctOfInv|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((l@117@01 Int)) (!
  (= (Seq_index $t@92@01 l@117@01) (Seq_index $t@76@01 l@117@01))
  
  :qid |quant-u-55|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@120@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range start@6@01 end@7@01) (inv@118@01 r))
      (img@119@01 r)
      (= r (Seq_index $t@92@01 (inv@118@01 r))))
    ($Perm.min
      (ite
        (and
          (img@100@01 r)
          (Seq_contains (Seq_range middle@39@01 end@7@01) (inv@99@01 r)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@121@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range start@6@01 end@7@01) (inv@118@01 r))
      (img@119@01 r)
      (= r (Seq_index $t@92@01 (inv@118@01 r))))
    ($Perm.min
      (ite
        (and
          (img@84@01 r)
          (Seq_contains (Seq_range start@6@01 middle@39@01) (inv@83@01 r)))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@120@01 r)))
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
          (img@100@01 r)
          (Seq_contains (Seq_range middle@39@01 end@7@01) (inv@99@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@120@01 r))
    $Perm.No)
  
  :qid |quant-u-57|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (Seq_contains (Seq_range start@6@01 end@7@01) (inv@118@01 r))
      (img@119@01 r)
      (= r (Seq_index $t@92@01 (inv@118@01 r))))
    (= (- $Perm.Write (pTaken@120@01 r)) $Perm.No))
  
  :qid |quant-u-58|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
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
          (img@84@01 r)
          (Seq_contains (Seq_range start@6@01 middle@39@01) (inv@83@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@121@01 r))
    $Perm.No)
  
  :qid |quant-u-59|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (Seq_contains (Seq_range start@6@01 end@7@01) (inv@118@01 r))
      (img@119@01 r)
      (= r (Seq_index $t@92@01 (inv@118@01 r))))
    (= (- (- $Perm.Write (pTaken@120@01 r)) (pTaken@121@01 r)) $Perm.No))
  
  :qid |quant-u-60|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@122@01 $FVF<value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@100@01 r)
      (Seq_contains (Seq_range middle@39@01 end@7@01) (inv@99@01 r)))
    (=
      ($FVF.lookup_value (as sm@122@01  $FVF<value>) r)
      ($FVF.lookup_value $t@98@01 r)))
  :pattern (($FVF.lookup_value (as sm@122@01  $FVF<value>) r))
  :pattern (($FVF.lookup_value $t@98@01 r))
  :qid |qp.fvfValDef11|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@84@01 r)
      (Seq_contains (Seq_range start@6@01 middle@39@01) (inv@83@01 r)))
    (=
      ($FVF.lookup_value (as sm@122@01  $FVF<value>) r)
      ($FVF.lookup_value $t@82@01 r)))
  :pattern (($FVF.lookup_value (as sm@122@01  $FVF<value>) r))
  :pattern (($FVF.lookup_value $t@82@01 r))
  :qid |qp.fvfValDef12|)))
(declare-const $t@123@01 $Snap)
(assert (= $t@123@01 ($Snap.combine ($Snap.first $t@123@01) ($Snap.second $t@123@01))))
(declare-const $k@124@01 $Perm)
(assert ($Perm.isReadVar $k@124@01))
(declare-const $t@125@01 Seq<$Ref>)
(assert (and
  (=>
    (<
      $Perm.No
      (- (+ (+ (- (- $k@9@01 $k@42@01) $k@58@01) $k@71@01) $k@87@01) $k@103@01))
    (Seq_equal $t@125@01 $t@89@01))
  (=>
    (< $Perm.No $k@124@01)
    (Seq_equal
      $t@125@01
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@123@01))))))
(assert (<=
  $Perm.No
  (+
    (- (+ (+ (- (- $k@9@01 $k@42@01) $k@58@01) $k@71@01) $k@87@01) $k@103@01)
    $k@124@01)))
(assert (<=
  (+
    (- (+ (+ (- (- $k@9@01 $k@42@01) $k@58@01) $k@71@01) $k@87@01) $k@103@01)
    $k@124@01)
  $Perm.Write))
(assert (=>
  (<
    $Perm.No
    (+
      (- (+ (+ (- (- $k@9@01 $k@42@01) $k@58@01) $k@71@01) $k@87@01) $k@103@01)
      $k@124@01))
  (not (= a@4@01 $Ref.null))))
(assert (=
  ($Snap.second $t@123@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@123@01))
    ($Snap.second ($Snap.second $t@123@01)))))
(declare-const $k@126@01 $Perm)
(assert ($Perm.isReadVar $k@126@01))
(declare-const $t@127@01 Seq<$Ref>)
(assert (and
  (=>
    (<
      $Perm.No
      (- (+ (+ (- (- $k@10@01 $k@43@01) $k@59@01) $k@74@01) $k@90@01) $k@104@01))
    (Seq_equal $t@127@01 $t@92@01))
  (=>
    (< $Perm.No $k@126@01)
    (Seq_equal
      $t@127@01
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first ($Snap.second $t@123@01)))))))
(assert (<=
  $Perm.No
  (+
    (- (+ (+ (- (- $k@10@01 $k@43@01) $k@59@01) $k@74@01) $k@90@01) $k@104@01)
    $k@126@01)))
(assert (<=
  (+
    (- (+ (+ (- (- $k@10@01 $k@43@01) $k@59@01) $k@74@01) $k@90@01) $k@104@01)
    $k@126@01)
  $Perm.Write))
(assert (=>
  (<
    $Perm.No
    (+
      (- (+ (+ (- (- $k@10@01 $k@43@01) $k@59@01) $k@74@01) $k@90@01) $k@104@01)
      $k@126@01))
  (not (= b@5@01 $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second $t@123@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@123@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@123@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@123@01))) $Snap.unit))
; [eval] a.array == old(a.array)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- (+ (+ (- (- $k@9@01 $k@42@01) $k@58@01) $k@71@01) $k@87@01) $k@103@01)
    $k@124@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] old(a.array)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (+ (+ (- (- $k@9@01 $k@42@01) $k@58@01) $k@71@01) $k@87@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal $t@125@01 $t@89@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@123@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@123@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@123@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@123@01))))
  $Snap.unit))
; [eval] b.array == old(b.array)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- (+ (+ (- (- $k@10@01 $k@43@01) $k@59@01) $k@74@01) $k@90@01) $k@104@01)
    $k@126@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] old(b.array)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No (+ (+ (- (- $k@10@01 $k@43@01) $k@59@01) $k@74@01) $k@90@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal $t@127@01 $t@92@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@123@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@123@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@123@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@123@01)))))
  $Snap.unit))
; [eval] (forall i: Int, j: Int :: { (i in [start..end)), (j in [start..end)) } { (i in [start..end)), a.array[j] } { (j in [start..end)), a.array[i] } { a.array[i], a.array[j] } (i in [start..end)) && ((j in [start..end)) && i != j) ==> a.array[i] != a.array[j])
(declare-const i@128@01 Int)
(declare-const j@129@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] (i in [start..end)) && ((j in [start..end)) && i != j) ==> a.array[i] != a.array[j]
; [eval] (i in [start..end)) && ((j in [start..end)) && i != j)
; [eval] (i in [start..end))
; [eval] [start..end)
(push) ; 5
; [then-branch: 19 | !(i@128@01 in [start@6@01..end@7@01]) | live]
; [else-branch: 19 | i@128@01 in [start@6@01..end@7@01] | live]
(push) ; 6
; [then-branch: 19 | !(i@128@01 in [start@6@01..end@7@01])]
(assert (not (Seq_contains (Seq_range start@6@01 end@7@01) i@128@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 19 | i@128@01 in [start@6@01..end@7@01]]
(assert (Seq_contains (Seq_range start@6@01 end@7@01) i@128@01))
; [eval] (j in [start..end))
; [eval] [start..end)
(push) ; 7
; [then-branch: 20 | !(j@129@01 in [start@6@01..end@7@01]) | live]
; [else-branch: 20 | j@129@01 in [start@6@01..end@7@01] | live]
(push) ; 8
; [then-branch: 20 | !(j@129@01 in [start@6@01..end@7@01])]
(assert (not (Seq_contains (Seq_range start@6@01 end@7@01) j@129@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 20 | j@129@01 in [start@6@01..end@7@01]]
(assert (Seq_contains (Seq_range start@6@01 end@7@01) j@129@01))
; [eval] i != j
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range start@6@01 end@7@01) j@129@01)
  (not (Seq_contains (Seq_range start@6@01 end@7@01) j@129@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range start@6@01 end@7@01) i@128@01)
  (and
    (Seq_contains (Seq_range start@6@01 end@7@01) i@128@01)
    (or
      (Seq_contains (Seq_range start@6@01 end@7@01) j@129@01)
      (not (Seq_contains (Seq_range start@6@01 end@7@01) j@129@01))))))
(assert (or
  (Seq_contains (Seq_range start@6@01 end@7@01) i@128@01)
  (not (Seq_contains (Seq_range start@6@01 end@7@01) i@128@01))))
(push) ; 5
; [then-branch: 21 | i@128@01 in [start@6@01..end@7@01] && j@129@01 in [start@6@01..end@7@01] && i@128@01 != j@129@01 | live]
; [else-branch: 21 | !(i@128@01 in [start@6@01..end@7@01] && j@129@01 in [start@6@01..end@7@01] && i@128@01 != j@129@01) | live]
(push) ; 6
; [then-branch: 21 | i@128@01 in [start@6@01..end@7@01] && j@129@01 in [start@6@01..end@7@01] && i@128@01 != j@129@01]
(assert (and
  (Seq_contains (Seq_range start@6@01 end@7@01) i@128@01)
  (and
    (Seq_contains (Seq_range start@6@01 end@7@01) j@129@01)
    (not (= i@128@01 j@129@01)))))
; [eval] a.array[i] != a.array[j]
; [eval] a.array[i]
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- (+ (+ (- (- $k@9@01 $k@42@01) $k@58@01) $k@71@01) $k@87@01) $k@103@01)
    $k@124@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(assert (not (>= i@128@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@128@01 (Seq_length $t@125@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] a.array[j]
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- (+ (+ (- (- $k@9@01 $k@42@01) $k@58@01) $k@71@01) $k@87@01) $k@103@01)
    $k@124@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(assert (not (>= j@129@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< j@129@01 (Seq_length $t@125@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 21 | !(i@128@01 in [start@6@01..end@7@01] && j@129@01 in [start@6@01..end@7@01] && i@128@01 != j@129@01)]
(assert (not
  (and
    (Seq_contains (Seq_range start@6@01 end@7@01) i@128@01)
    (and
      (Seq_contains (Seq_range start@6@01 end@7@01) j@129@01)
      (not (= i@128@01 j@129@01))))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range start@6@01 end@7@01) i@128@01)
    (and
      (Seq_contains (Seq_range start@6@01 end@7@01) j@129@01)
      (not (= i@128@01 j@129@01))))
  (and
    (Seq_contains (Seq_range start@6@01 end@7@01) i@128@01)
    (Seq_contains (Seq_range start@6@01 end@7@01) j@129@01)
    (not (= i@128@01 j@129@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range start@6@01 end@7@01) i@128@01)
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) j@129@01)
        (not (= i@128@01 j@129@01)))))
  (and
    (Seq_contains (Seq_range start@6@01 end@7@01) i@128@01)
    (and
      (Seq_contains (Seq_range start@6@01 end@7@01) j@129@01)
      (not (= i@128@01 j@129@01))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@128@01 Int) (j@129@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range start@6@01 end@7@01) i@128@01)
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@128@01)
        (or
          (Seq_contains (Seq_range start@6@01 end@7@01) j@129@01)
          (not (Seq_contains (Seq_range start@6@01 end@7@01) j@129@01)))))
    (or
      (Seq_contains (Seq_range start@6@01 end@7@01) i@128@01)
      (not (Seq_contains (Seq_range start@6@01 end@7@01) i@128@01)))
    (=>
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@128@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@129@01)
          (not (= i@128@01 j@129@01))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@128@01)
        (Seq_contains (Seq_range start@6@01 end@7@01) j@129@01)
        (not (= i@128@01 j@129@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) i@128@01)
          (and
            (Seq_contains (Seq_range start@6@01 end@7@01) j@129@01)
            (not (= i@128@01 j@129@01)))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@128@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@129@01)
          (not (= i@128@01 j@129@01))))))
  :pattern ((Seq_contains (Seq_range start@6@01 end@7@01) i@128@01) (Seq_contains
    (Seq_range start@6@01 end@7@01)
    j@129@01))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) i@128@01) (Seq_contains_trigger
    (Seq_range start@6@01 end@7@01)
    j@129@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/mergesort.vpr@88@11@88@111-aux|)))
(assert (forall ((i@128@01 Int) (j@129@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range start@6@01 end@7@01) i@128@01)
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@128@01)
        (or
          (Seq_contains (Seq_range start@6@01 end@7@01) j@129@01)
          (not (Seq_contains (Seq_range start@6@01 end@7@01) j@129@01)))))
    (or
      (Seq_contains (Seq_range start@6@01 end@7@01) i@128@01)
      (not (Seq_contains (Seq_range start@6@01 end@7@01) i@128@01)))
    (=>
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@128@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@129@01)
          (not (= i@128@01 j@129@01))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@128@01)
        (Seq_contains (Seq_range start@6@01 end@7@01) j@129@01)
        (not (= i@128@01 j@129@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) i@128@01)
          (and
            (Seq_contains (Seq_range start@6@01 end@7@01) j@129@01)
            (not (= i@128@01 j@129@01)))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@128@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@129@01)
          (not (= i@128@01 j@129@01))))))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) i@128@01) (Seq_contains_trigger
    (Seq_range start@6@01 end@7@01)
    j@129@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/mergesort.vpr@88@11@88@111-aux|)))
(assert (forall ((i@128@01 Int) (j@129@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range start@6@01 end@7@01) i@128@01)
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@128@01)
        (or
          (Seq_contains (Seq_range start@6@01 end@7@01) j@129@01)
          (not (Seq_contains (Seq_range start@6@01 end@7@01) j@129@01)))))
    (or
      (Seq_contains (Seq_range start@6@01 end@7@01) i@128@01)
      (not (Seq_contains (Seq_range start@6@01 end@7@01) i@128@01)))
    (=>
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@128@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@129@01)
          (not (= i@128@01 j@129@01))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@128@01)
        (Seq_contains (Seq_range start@6@01 end@7@01) j@129@01)
        (not (= i@128@01 j@129@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) i@128@01)
          (and
            (Seq_contains (Seq_range start@6@01 end@7@01) j@129@01)
            (not (= i@128@01 j@129@01)))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@128@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@129@01)
          (not (= i@128@01 j@129@01))))))
  :pattern ((Seq_contains (Seq_range start@6@01 end@7@01) i@128@01) (Seq_index
    $t@125@01
    j@129@01))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) i@128@01) (Seq_index
    $t@125@01
    j@129@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/mergesort.vpr@88@11@88@111-aux|)))
(assert (forall ((i@128@01 Int) (j@129@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range start@6@01 end@7@01) i@128@01)
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@128@01)
        (or
          (Seq_contains (Seq_range start@6@01 end@7@01) j@129@01)
          (not (Seq_contains (Seq_range start@6@01 end@7@01) j@129@01)))))
    (or
      (Seq_contains (Seq_range start@6@01 end@7@01) i@128@01)
      (not (Seq_contains (Seq_range start@6@01 end@7@01) i@128@01)))
    (=>
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@128@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@129@01)
          (not (= i@128@01 j@129@01))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@128@01)
        (Seq_contains (Seq_range start@6@01 end@7@01) j@129@01)
        (not (= i@128@01 j@129@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) i@128@01)
          (and
            (Seq_contains (Seq_range start@6@01 end@7@01) j@129@01)
            (not (= i@128@01 j@129@01)))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@128@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@129@01)
          (not (= i@128@01 j@129@01))))))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) i@128@01) (Seq_index
    $t@125@01
    j@129@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/mergesort.vpr@88@11@88@111-aux|)))
(assert (forall ((i@128@01 Int) (j@129@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range start@6@01 end@7@01) i@128@01)
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@128@01)
        (or
          (Seq_contains (Seq_range start@6@01 end@7@01) j@129@01)
          (not (Seq_contains (Seq_range start@6@01 end@7@01) j@129@01)))))
    (or
      (Seq_contains (Seq_range start@6@01 end@7@01) i@128@01)
      (not (Seq_contains (Seq_range start@6@01 end@7@01) i@128@01)))
    (=>
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@128@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@129@01)
          (not (= i@128@01 j@129@01))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@128@01)
        (Seq_contains (Seq_range start@6@01 end@7@01) j@129@01)
        (not (= i@128@01 j@129@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) i@128@01)
          (and
            (Seq_contains (Seq_range start@6@01 end@7@01) j@129@01)
            (not (= i@128@01 j@129@01)))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@128@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@129@01)
          (not (= i@128@01 j@129@01))))))
  :pattern ((Seq_contains (Seq_range start@6@01 end@7@01) j@129@01) (Seq_index
    $t@125@01
    i@128@01))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) j@129@01) (Seq_index
    $t@125@01
    i@128@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/mergesort.vpr@88@11@88@111-aux|)))
(assert (forall ((i@128@01 Int) (j@129@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range start@6@01 end@7@01) i@128@01)
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@128@01)
        (or
          (Seq_contains (Seq_range start@6@01 end@7@01) j@129@01)
          (not (Seq_contains (Seq_range start@6@01 end@7@01) j@129@01)))))
    (or
      (Seq_contains (Seq_range start@6@01 end@7@01) i@128@01)
      (not (Seq_contains (Seq_range start@6@01 end@7@01) i@128@01)))
    (=>
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@128@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@129@01)
          (not (= i@128@01 j@129@01))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@128@01)
        (Seq_contains (Seq_range start@6@01 end@7@01) j@129@01)
        (not (= i@128@01 j@129@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) i@128@01)
          (and
            (Seq_contains (Seq_range start@6@01 end@7@01) j@129@01)
            (not (= i@128@01 j@129@01)))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@128@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@129@01)
          (not (= i@128@01 j@129@01))))))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) j@129@01) (Seq_index
    $t@125@01
    i@128@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/mergesort.vpr@88@11@88@111-aux|)))
(assert (forall ((i@128@01 Int) (j@129@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range start@6@01 end@7@01) i@128@01)
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@128@01)
        (or
          (Seq_contains (Seq_range start@6@01 end@7@01) j@129@01)
          (not (Seq_contains (Seq_range start@6@01 end@7@01) j@129@01)))))
    (or
      (Seq_contains (Seq_range start@6@01 end@7@01) i@128@01)
      (not (Seq_contains (Seq_range start@6@01 end@7@01) i@128@01)))
    (=>
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@128@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@129@01)
          (not (= i@128@01 j@129@01))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@128@01)
        (Seq_contains (Seq_range start@6@01 end@7@01) j@129@01)
        (not (= i@128@01 j@129@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) i@128@01)
          (and
            (Seq_contains (Seq_range start@6@01 end@7@01) j@129@01)
            (not (= i@128@01 j@129@01)))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@128@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@129@01)
          (not (= i@128@01 j@129@01))))))
  :pattern ((Seq_index $t@125@01 i@128@01) (Seq_index $t@125@01 j@129@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/mergesort.vpr@88@11@88@111-aux|)))
(assert (forall ((i@128@01 Int) (j@129@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range start@6@01 end@7@01) i@128@01)
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) j@129@01)
        (not (= i@128@01 j@129@01))))
    (not (= (Seq_index $t@125@01 i@128@01) (Seq_index $t@125@01 j@129@01))))
  :pattern ((Seq_contains (Seq_range start@6@01 end@7@01) i@128@01) (Seq_contains
    (Seq_range start@6@01 end@7@01)
    j@129@01))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) i@128@01) (Seq_contains_trigger
    (Seq_range start@6@01 end@7@01)
    j@129@01))
  :pattern ((Seq_contains (Seq_range start@6@01 end@7@01) i@128@01) (Seq_index
    $t@125@01
    j@129@01))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) i@128@01) (Seq_index
    $t@125@01
    j@129@01))
  :pattern ((Seq_contains (Seq_range start@6@01 end@7@01) j@129@01) (Seq_index
    $t@125@01
    i@128@01))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) j@129@01) (Seq_index
    $t@125@01
    i@128@01))
  :pattern ((Seq_index $t@125@01 i@128@01) (Seq_index $t@125@01 j@129@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/mergesort.vpr@88@11@88@111|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@123@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@123@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@123@01)))))))))
(declare-const i@130@01 Int)
(push) ; 4
; [eval] (i in [start..end))
; [eval] [start..end)
(assert (Seq_contains (Seq_range start@6@01 end@7@01) i@130@01))
; [eval] a.array[i]
(push) ; 5
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- (+ (+ (- (- $k@9@01 $k@42@01) $k@58@01) $k@71@01) $k@87@01) $k@103@01)
    $k@124@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(assert (not (>= i@130@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@130@01 (Seq_length $t@125@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@131@01 ($Ref) Int)
(declare-fun img@132@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@130@01 Int) (i2@130@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range start@6@01 end@7@01) i1@130@01)
      (Seq_contains (Seq_range start@6@01 end@7@01) i2@130@01)
      (= (Seq_index $t@125@01 i1@130@01) (Seq_index $t@125@01 i2@130@01)))
    (= i1@130@01 i2@130@01))
  
  :qid |value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@130@01 Int)) (!
  (=>
    (Seq_contains (Seq_range start@6@01 end@7@01) i@130@01)
    (and
      (= (inv@131@01 (Seq_index $t@125@01 i@130@01)) i@130@01)
      (img@132@01 (Seq_index $t@125@01 i@130@01))))
  :pattern ((Seq_index $t@125@01 i@130@01))
  :qid |quant-u-62|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@132@01 r)
      (Seq_contains (Seq_range start@6@01 end@7@01) (inv@131@01 r)))
    (= (Seq_index $t@125@01 (inv@131@01 r)) r))
  :pattern ((inv@131@01 r))
  :qid |value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@130@01 Int)) (!
  (=>
    (Seq_contains (Seq_range start@6@01 end@7@01) i@130@01)
    (not (= (Seq_index $t@125@01 i@130@01) $Ref.null)))
  :pattern ((Seq_index $t@125@01 i@130@01))
  :qid |value-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@123@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@123@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@123@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@123@01)))))))
  $Snap.unit))
; [eval] (forall i: Int, j: Int :: { (i in [start..end)), (j in [start..end)) } { (i in [start..end)), b.array[j] } { (j in [start..end)), b.array[i] } { b.array[i], b.array[j] } (i in [start..end)) && ((j in [start..end)) && i != j) ==> b.array[i] != b.array[j])
(declare-const i@133@01 Int)
(declare-const j@134@01 Int)
(push) ; 4
; [eval] (i in [start..end)) && ((j in [start..end)) && i != j) ==> b.array[i] != b.array[j]
; [eval] (i in [start..end)) && ((j in [start..end)) && i != j)
; [eval] (i in [start..end))
; [eval] [start..end)
(push) ; 5
; [then-branch: 22 | !(i@133@01 in [start@6@01..end@7@01]) | live]
; [else-branch: 22 | i@133@01 in [start@6@01..end@7@01] | live]
(push) ; 6
; [then-branch: 22 | !(i@133@01 in [start@6@01..end@7@01])]
(assert (not (Seq_contains (Seq_range start@6@01 end@7@01) i@133@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 22 | i@133@01 in [start@6@01..end@7@01]]
(assert (Seq_contains (Seq_range start@6@01 end@7@01) i@133@01))
; [eval] (j in [start..end))
; [eval] [start..end)
(push) ; 7
; [then-branch: 23 | !(j@134@01 in [start@6@01..end@7@01]) | live]
; [else-branch: 23 | j@134@01 in [start@6@01..end@7@01] | live]
(push) ; 8
; [then-branch: 23 | !(j@134@01 in [start@6@01..end@7@01])]
(assert (not (Seq_contains (Seq_range start@6@01 end@7@01) j@134@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 23 | j@134@01 in [start@6@01..end@7@01]]
(assert (Seq_contains (Seq_range start@6@01 end@7@01) j@134@01))
; [eval] i != j
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range start@6@01 end@7@01) j@134@01)
  (not (Seq_contains (Seq_range start@6@01 end@7@01) j@134@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range start@6@01 end@7@01) i@133@01)
  (and
    (Seq_contains (Seq_range start@6@01 end@7@01) i@133@01)
    (or
      (Seq_contains (Seq_range start@6@01 end@7@01) j@134@01)
      (not (Seq_contains (Seq_range start@6@01 end@7@01) j@134@01))))))
(assert (or
  (Seq_contains (Seq_range start@6@01 end@7@01) i@133@01)
  (not (Seq_contains (Seq_range start@6@01 end@7@01) i@133@01))))
(push) ; 5
; [then-branch: 24 | i@133@01 in [start@6@01..end@7@01] && j@134@01 in [start@6@01..end@7@01] && i@133@01 != j@134@01 | live]
; [else-branch: 24 | !(i@133@01 in [start@6@01..end@7@01] && j@134@01 in [start@6@01..end@7@01] && i@133@01 != j@134@01) | live]
(push) ; 6
; [then-branch: 24 | i@133@01 in [start@6@01..end@7@01] && j@134@01 in [start@6@01..end@7@01] && i@133@01 != j@134@01]
(assert (and
  (Seq_contains (Seq_range start@6@01 end@7@01) i@133@01)
  (and
    (Seq_contains (Seq_range start@6@01 end@7@01) j@134@01)
    (not (= i@133@01 j@134@01)))))
; [eval] b.array[i] != b.array[j]
; [eval] b.array[i]
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- (+ (+ (- (- $k@10@01 $k@43@01) $k@59@01) $k@74@01) $k@90@01) $k@104@01)
    $k@126@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(assert (not (>= i@133@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@133@01 (Seq_length $t@127@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] b.array[j]
(push) ; 7
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- (+ (+ (- (- $k@10@01 $k@43@01) $k@59@01) $k@74@01) $k@90@01) $k@104@01)
    $k@126@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(assert (not (>= j@134@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< j@134@01 (Seq_length $t@127@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 24 | !(i@133@01 in [start@6@01..end@7@01] && j@134@01 in [start@6@01..end@7@01] && i@133@01 != j@134@01)]
(assert (not
  (and
    (Seq_contains (Seq_range start@6@01 end@7@01) i@133@01)
    (and
      (Seq_contains (Seq_range start@6@01 end@7@01) j@134@01)
      (not (= i@133@01 j@134@01))))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range start@6@01 end@7@01) i@133@01)
    (and
      (Seq_contains (Seq_range start@6@01 end@7@01) j@134@01)
      (not (= i@133@01 j@134@01))))
  (and
    (Seq_contains (Seq_range start@6@01 end@7@01) i@133@01)
    (Seq_contains (Seq_range start@6@01 end@7@01) j@134@01)
    (not (= i@133@01 j@134@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range start@6@01 end@7@01) i@133@01)
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) j@134@01)
        (not (= i@133@01 j@134@01)))))
  (and
    (Seq_contains (Seq_range start@6@01 end@7@01) i@133@01)
    (and
      (Seq_contains (Seq_range start@6@01 end@7@01) j@134@01)
      (not (= i@133@01 j@134@01))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@133@01 Int) (j@134@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range start@6@01 end@7@01) i@133@01)
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@133@01)
        (or
          (Seq_contains (Seq_range start@6@01 end@7@01) j@134@01)
          (not (Seq_contains (Seq_range start@6@01 end@7@01) j@134@01)))))
    (or
      (Seq_contains (Seq_range start@6@01 end@7@01) i@133@01)
      (not (Seq_contains (Seq_range start@6@01 end@7@01) i@133@01)))
    (=>
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@133@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@134@01)
          (not (= i@133@01 j@134@01))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@133@01)
        (Seq_contains (Seq_range start@6@01 end@7@01) j@134@01)
        (not (= i@133@01 j@134@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) i@133@01)
          (and
            (Seq_contains (Seq_range start@6@01 end@7@01) j@134@01)
            (not (= i@133@01 j@134@01)))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@133@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@134@01)
          (not (= i@133@01 j@134@01))))))
  :pattern ((Seq_contains (Seq_range start@6@01 end@7@01) i@133@01) (Seq_contains
    (Seq_range start@6@01 end@7@01)
    j@134@01))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) i@133@01) (Seq_contains_trigger
    (Seq_range start@6@01 end@7@01)
    j@134@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/mergesort.vpr@90@11@90@111-aux|)))
(assert (forall ((i@133@01 Int) (j@134@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range start@6@01 end@7@01) i@133@01)
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@133@01)
        (or
          (Seq_contains (Seq_range start@6@01 end@7@01) j@134@01)
          (not (Seq_contains (Seq_range start@6@01 end@7@01) j@134@01)))))
    (or
      (Seq_contains (Seq_range start@6@01 end@7@01) i@133@01)
      (not (Seq_contains (Seq_range start@6@01 end@7@01) i@133@01)))
    (=>
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@133@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@134@01)
          (not (= i@133@01 j@134@01))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@133@01)
        (Seq_contains (Seq_range start@6@01 end@7@01) j@134@01)
        (not (= i@133@01 j@134@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) i@133@01)
          (and
            (Seq_contains (Seq_range start@6@01 end@7@01) j@134@01)
            (not (= i@133@01 j@134@01)))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@133@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@134@01)
          (not (= i@133@01 j@134@01))))))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) i@133@01) (Seq_contains_trigger
    (Seq_range start@6@01 end@7@01)
    j@134@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/mergesort.vpr@90@11@90@111-aux|)))
(assert (forall ((i@133@01 Int) (j@134@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range start@6@01 end@7@01) i@133@01)
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@133@01)
        (or
          (Seq_contains (Seq_range start@6@01 end@7@01) j@134@01)
          (not (Seq_contains (Seq_range start@6@01 end@7@01) j@134@01)))))
    (or
      (Seq_contains (Seq_range start@6@01 end@7@01) i@133@01)
      (not (Seq_contains (Seq_range start@6@01 end@7@01) i@133@01)))
    (=>
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@133@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@134@01)
          (not (= i@133@01 j@134@01))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@133@01)
        (Seq_contains (Seq_range start@6@01 end@7@01) j@134@01)
        (not (= i@133@01 j@134@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) i@133@01)
          (and
            (Seq_contains (Seq_range start@6@01 end@7@01) j@134@01)
            (not (= i@133@01 j@134@01)))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@133@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@134@01)
          (not (= i@133@01 j@134@01))))))
  :pattern ((Seq_contains (Seq_range start@6@01 end@7@01) i@133@01) (Seq_index
    $t@127@01
    j@134@01))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) i@133@01) (Seq_index
    $t@127@01
    j@134@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/mergesort.vpr@90@11@90@111-aux|)))
(assert (forall ((i@133@01 Int) (j@134@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range start@6@01 end@7@01) i@133@01)
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@133@01)
        (or
          (Seq_contains (Seq_range start@6@01 end@7@01) j@134@01)
          (not (Seq_contains (Seq_range start@6@01 end@7@01) j@134@01)))))
    (or
      (Seq_contains (Seq_range start@6@01 end@7@01) i@133@01)
      (not (Seq_contains (Seq_range start@6@01 end@7@01) i@133@01)))
    (=>
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@133@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@134@01)
          (not (= i@133@01 j@134@01))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@133@01)
        (Seq_contains (Seq_range start@6@01 end@7@01) j@134@01)
        (not (= i@133@01 j@134@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) i@133@01)
          (and
            (Seq_contains (Seq_range start@6@01 end@7@01) j@134@01)
            (not (= i@133@01 j@134@01)))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@133@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@134@01)
          (not (= i@133@01 j@134@01))))))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) i@133@01) (Seq_index
    $t@127@01
    j@134@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/mergesort.vpr@90@11@90@111-aux|)))
(assert (forall ((i@133@01 Int) (j@134@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range start@6@01 end@7@01) i@133@01)
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@133@01)
        (or
          (Seq_contains (Seq_range start@6@01 end@7@01) j@134@01)
          (not (Seq_contains (Seq_range start@6@01 end@7@01) j@134@01)))))
    (or
      (Seq_contains (Seq_range start@6@01 end@7@01) i@133@01)
      (not (Seq_contains (Seq_range start@6@01 end@7@01) i@133@01)))
    (=>
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@133@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@134@01)
          (not (= i@133@01 j@134@01))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@133@01)
        (Seq_contains (Seq_range start@6@01 end@7@01) j@134@01)
        (not (= i@133@01 j@134@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) i@133@01)
          (and
            (Seq_contains (Seq_range start@6@01 end@7@01) j@134@01)
            (not (= i@133@01 j@134@01)))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@133@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@134@01)
          (not (= i@133@01 j@134@01))))))
  :pattern ((Seq_contains (Seq_range start@6@01 end@7@01) j@134@01) (Seq_index
    $t@127@01
    i@133@01))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) j@134@01) (Seq_index
    $t@127@01
    i@133@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/mergesort.vpr@90@11@90@111-aux|)))
(assert (forall ((i@133@01 Int) (j@134@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range start@6@01 end@7@01) i@133@01)
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@133@01)
        (or
          (Seq_contains (Seq_range start@6@01 end@7@01) j@134@01)
          (not (Seq_contains (Seq_range start@6@01 end@7@01) j@134@01)))))
    (or
      (Seq_contains (Seq_range start@6@01 end@7@01) i@133@01)
      (not (Seq_contains (Seq_range start@6@01 end@7@01) i@133@01)))
    (=>
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@133@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@134@01)
          (not (= i@133@01 j@134@01))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@133@01)
        (Seq_contains (Seq_range start@6@01 end@7@01) j@134@01)
        (not (= i@133@01 j@134@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) i@133@01)
          (and
            (Seq_contains (Seq_range start@6@01 end@7@01) j@134@01)
            (not (= i@133@01 j@134@01)))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@133@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@134@01)
          (not (= i@133@01 j@134@01))))))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) j@134@01) (Seq_index
    $t@127@01
    i@133@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/mergesort.vpr@90@11@90@111-aux|)))
(assert (forall ((i@133@01 Int) (j@134@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range start@6@01 end@7@01) i@133@01)
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@133@01)
        (or
          (Seq_contains (Seq_range start@6@01 end@7@01) j@134@01)
          (not (Seq_contains (Seq_range start@6@01 end@7@01) j@134@01)))))
    (or
      (Seq_contains (Seq_range start@6@01 end@7@01) i@133@01)
      (not (Seq_contains (Seq_range start@6@01 end@7@01) i@133@01)))
    (=>
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@133@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@134@01)
          (not (= i@133@01 j@134@01))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@133@01)
        (Seq_contains (Seq_range start@6@01 end@7@01) j@134@01)
        (not (= i@133@01 j@134@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) i@133@01)
          (and
            (Seq_contains (Seq_range start@6@01 end@7@01) j@134@01)
            (not (= i@133@01 j@134@01)))))
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) i@133@01)
        (and
          (Seq_contains (Seq_range start@6@01 end@7@01) j@134@01)
          (not (= i@133@01 j@134@01))))))
  :pattern ((Seq_index $t@127@01 i@133@01) (Seq_index $t@127@01 j@134@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/mergesort.vpr@90@11@90@111-aux|)))
(assert (forall ((i@133@01 Int) (j@134@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range start@6@01 end@7@01) i@133@01)
      (and
        (Seq_contains (Seq_range start@6@01 end@7@01) j@134@01)
        (not (= i@133@01 j@134@01))))
    (not (= (Seq_index $t@127@01 i@133@01) (Seq_index $t@127@01 j@134@01))))
  :pattern ((Seq_contains (Seq_range start@6@01 end@7@01) i@133@01) (Seq_contains
    (Seq_range start@6@01 end@7@01)
    j@134@01))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) i@133@01) (Seq_contains_trigger
    (Seq_range start@6@01 end@7@01)
    j@134@01))
  :pattern ((Seq_contains (Seq_range start@6@01 end@7@01) i@133@01) (Seq_index
    $t@127@01
    j@134@01))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) i@133@01) (Seq_index
    $t@127@01
    j@134@01))
  :pattern ((Seq_contains (Seq_range start@6@01 end@7@01) j@134@01) (Seq_index
    $t@127@01
    i@133@01))
  :pattern ((Seq_contains_trigger (Seq_range start@6@01 end@7@01) j@134@01) (Seq_index
    $t@127@01
    i@133@01))
  :pattern ((Seq_index $t@127@01 i@133@01) (Seq_index $t@127@01 j@134@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/mergesort.vpr@90@11@90@111|)))
(declare-const i@135@01 Int)
(push) ; 4
; [eval] (i in [start..end))
; [eval] [start..end)
(assert (Seq_contains (Seq_range start@6@01 end@7@01) i@135@01))
; [eval] b.array[i]
(push) ; 5
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- (+ (+ (- (- $k@10@01 $k@43@01) $k@59@01) $k@74@01) $k@90@01) $k@104@01)
    $k@126@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(assert (not (>= i@135@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@135@01 (Seq_length $t@127@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@136@01 ($Ref) Int)
(declare-fun img@137@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@135@01 Int) (i2@135@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range start@6@01 end@7@01) i1@135@01)
      (Seq_contains (Seq_range start@6@01 end@7@01) i2@135@01)
      (= (Seq_index $t@127@01 i1@135@01) (Seq_index $t@127@01 i2@135@01)))
    (= i1@135@01 i2@135@01))
  
  :qid |value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@135@01 Int)) (!
  (=>
    (Seq_contains (Seq_range start@6@01 end@7@01) i@135@01)
    (and
      (= (inv@136@01 (Seq_index $t@127@01 i@135@01)) i@135@01)
      (img@137@01 (Seq_index $t@127@01 i@135@01))))
  :pattern ((Seq_index $t@127@01 i@135@01))
  :qid |quant-u-64|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@137@01 r)
      (Seq_contains (Seq_range start@6@01 end@7@01) (inv@136@01 r)))
    (= (Seq_index $t@127@01 (inv@136@01 r)) r))
  :pattern ((inv@136@01 r))
  :qid |value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@135@01 Int)) (!
  (=>
    (Seq_contains (Seq_range start@6@01 end@7@01) i@135@01)
    (not (= (Seq_index $t@127@01 i@135@01) $Ref.null)))
  :pattern ((Seq_index $t@127@01 i@135@01))
  :qid |value-permImpliesNonNull|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index $t@127@01 i@135@01) (Seq_index $t@125@01 i@130@01))
    (=
      (and
        (img@137@01 r)
        (Seq_contains (Seq_range start@6@01 end@7@01) (inv@136@01 r)))
      (and
        (img@132@01 r)
        (Seq_contains (Seq_range start@6@01 end@7@01) (inv@131@01 r)))))
  
  :qid |quant-u-65|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(declare-const $k@138@01 $Perm)
(assert ($Perm.isReadVar $k@138@01))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (=
    (+
      (- (+ (+ (- (- $k@9@01 $k@42@01) $k@58@01) $k@71@01) $k@87@01) $k@103@01)
      $k@124@01)
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (<
  $k@138@01
  (+
    (- (+ (+ (- (- $k@9@01 $k@42@01) $k@58@01) $k@71@01) $k@87@01) $k@103@01)
    $k@124@01)))
(assert (<=
  $Perm.No
  (-
    (+
      (- (+ (+ (- (- $k@9@01 $k@42@01) $k@58@01) $k@71@01) $k@87@01) $k@103@01)
      $k@124@01)
    $k@138@01)))
(assert (<=
  (-
    (+
      (- (+ (+ (- (- $k@9@01 $k@42@01) $k@58@01) $k@71@01) $k@87@01) $k@103@01)
      $k@124@01)
    $k@138@01)
  $Perm.Write))
(assert (=>
  (<
    $Perm.No
    (-
      (+
        (- (+ (+ (- (- $k@9@01 $k@42@01) $k@58@01) $k@71@01) $k@87@01) $k@103@01)
        $k@124@01)
      $k@138@01))
  (not (= a@4@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@138@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(declare-const $k@139@01 $Perm)
(assert ($Perm.isReadVar $k@139@01))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not
  (=
    (+
      (- (+ (+ (- (- $k@10@01 $k@43@01) $k@59@01) $k@74@01) $k@90@01) $k@104@01)
      $k@126@01)
    $Perm.No))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (<
  $k@139@01
  (+
    (- (+ (+ (- (- $k@10@01 $k@43@01) $k@59@01) $k@74@01) $k@90@01) $k@104@01)
    $k@126@01)))
(assert (<=
  $Perm.No
  (-
    (+
      (- (+ (+ (- (- $k@10@01 $k@43@01) $k@59@01) $k@74@01) $k@90@01) $k@104@01)
      $k@126@01)
    $k@139@01)))
(assert (<=
  (-
    (+
      (- (+ (+ (- (- $k@10@01 $k@43@01) $k@59@01) $k@74@01) $k@90@01) $k@104@01)
      $k@126@01)
    $k@139@01)
  $Perm.Write))
(assert (=>
  (<
    $Perm.No
    (-
      (+
        (-
          (+ (+ (- (- $k@10@01 $k@43@01) $k@59@01) $k@74@01) $k@90@01)
          $k@104@01)
        $k@126@01)
      $k@139@01))
  (not (= b@5@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@139@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] start >= 0
; [eval] end <= |a.array|
; [eval] |a.array|
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- (+ (+ (- (- $k@9@01 $k@42@01) $k@58@01) $k@71@01) $k@87@01) $k@103@01)
    $k@124@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(assert (not (<= end@7@01 (Seq_length $t@125@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (<= end@7@01 (Seq_length $t@125@01)))
; [eval] |a.array| == |b.array|
; [eval] |a.array|
(push) ; 4
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- (+ (+ (- (- $k@9@01 $k@42@01) $k@58@01) $k@71@01) $k@87@01) $k@103@01)
    $k@124@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] |b.array|
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (<
  $Perm.No
  (+
    (- (+ (+ (- (- $k@10@01 $k@43@01) $k@59@01) $k@74@01) $k@90@01) $k@104@01)
    $k@126@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(assert (not (= (Seq_length $t@125@01) (Seq_length $t@127@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (= (Seq_length $t@125@01) (Seq_length $t@127@01)))
; [eval] (forall i: Int, j: Int :: { (i in [start..end)), (j in [start..end)) } { (i in [start..end)), a.array[j] } { (j in [start..end)), a.array[i] } { a.array[i], a.array[j] } (i in [start..end)) && ((j in [start..end)) && i != j) ==> a.array[i] != a.array[j])
(declare-const i@140@01 Int)
(declare-const j@141@01 Int)
(push) ; 4
; [eval] (i in [start..end)) && ((j in [start..end)) && i != j) ==> a.array[i] != a.array[j]
; [eval] (i in [start..end)) && ((j in [start..end)) && i != j)
; [eval] (i in [start..end))
; [eval] [start..end)
; ---------- merge ----------
