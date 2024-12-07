(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:17:34
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0102.vpr
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
(declare-sort $FVF<f> 0)
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
; /field_value_functions_declarations.smt2 [f: Int]
(declare-fun $FVF.domain_f ($FVF<f>) Set<$Ref>)
(declare-fun $FVF.lookup_f ($FVF<f> $Ref) Int)
(declare-fun $FVF.after_f ($FVF<f> $FVF<f>) Bool)
(declare-fun $FVF.loc_f (Int $Ref) Bool)
(declare-fun $FVF.perm_f ($FPM $Ref) $Perm)
(declare-const $fvfTOP_f $FVF<f>)
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
; ---------- test1 ----------
(declare-const xs@0@01 Seq<$Ref>)
(declare-const n@1@01 Int)
(declare-const b@2@01 Bool)
(declare-const xs@3@01 Seq<$Ref>)
(declare-const n@4@01 Int)
(declare-const b@5@01 Bool)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@6@01 $Snap)
(assert (= $t@6@01 ($Snap.combine ($Snap.first $t@6@01) ($Snap.second $t@6@01))))
(assert (= ($Snap.first $t@6@01) $Snap.unit))
; [eval] |xs| == n
; [eval] |xs|
(assert (= (Seq_length xs@3@01) n@4@01))
(assert (= ($Snap.second $t@6@01) $Snap.unit))
; [eval] n > 2
(assert (> n@4@01 2))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; inhale (forall i1: Int, i2: Int ::
;     { (i1 in [0..n)), (i2 in [0..n)) }
;     { (i1 in [0..n)), xs[i2] }
;     { (i2 in [0..n)), xs[i1] }
;     { xs[i1], xs[i2] }
;     (i1 in [0..n)) && ((i2 in [0..n)) && i1 != i2) ==> xs[i1] != xs[i2])
(declare-const $t@7@01 $Snap)
(assert (= $t@7@01 $Snap.unit))
; [eval] (forall i1: Int, i2: Int :: { (i1 in [0..n)), (i2 in [0..n)) } { (i1 in [0..n)), xs[i2] } { (i2 in [0..n)), xs[i1] } { xs[i1], xs[i2] } (i1 in [0..n)) && ((i2 in [0..n)) && i1 != i2) ==> xs[i1] != xs[i2])
(declare-const i1@8@01 Int)
(declare-const i2@9@01 Int)
(push) ; 3
; [eval] (i1 in [0..n)) && ((i2 in [0..n)) && i1 != i2) ==> xs[i1] != xs[i2]
; [eval] (i1 in [0..n)) && ((i2 in [0..n)) && i1 != i2)
; [eval] (i1 in [0..n))
; [eval] [0..n)
(push) ; 4
; [then-branch: 0 | !(i1@8@01 in [0..n@4@01]) | live]
; [else-branch: 0 | i1@8@01 in [0..n@4@01] | live]
(push) ; 5
; [then-branch: 0 | !(i1@8@01 in [0..n@4@01])]
(assert (not (Seq_contains (Seq_range 0 n@4@01) i1@8@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 0 | i1@8@01 in [0..n@4@01]]
(assert (Seq_contains (Seq_range 0 n@4@01) i1@8@01))
; [eval] (i2 in [0..n))
; [eval] [0..n)
(push) ; 6
; [then-branch: 1 | !(i2@9@01 in [0..n@4@01]) | live]
; [else-branch: 1 | i2@9@01 in [0..n@4@01] | live]
(push) ; 7
; [then-branch: 1 | !(i2@9@01 in [0..n@4@01])]
(assert (not (Seq_contains (Seq_range 0 n@4@01) i2@9@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 1 | i2@9@01 in [0..n@4@01]]
(assert (Seq_contains (Seq_range 0 n@4@01) i2@9@01))
; [eval] i1 != i2
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 n@4@01) i2@9@01)
  (not (Seq_contains (Seq_range 0 n@4@01) i2@9@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 n@4@01) i1@8@01)
  (and
    (Seq_contains (Seq_range 0 n@4@01) i1@8@01)
    (or
      (Seq_contains (Seq_range 0 n@4@01) i2@9@01)
      (not (Seq_contains (Seq_range 0 n@4@01) i2@9@01))))))
(assert (or
  (Seq_contains (Seq_range 0 n@4@01) i1@8@01)
  (not (Seq_contains (Seq_range 0 n@4@01) i1@8@01))))
(push) ; 4
; [then-branch: 2 | i1@8@01 in [0..n@4@01] && i2@9@01 in [0..n@4@01] && i1@8@01 != i2@9@01 | live]
; [else-branch: 2 | !(i1@8@01 in [0..n@4@01] && i2@9@01 in [0..n@4@01] && i1@8@01 != i2@9@01) | live]
(push) ; 5
; [then-branch: 2 | i1@8@01 in [0..n@4@01] && i2@9@01 in [0..n@4@01] && i1@8@01 != i2@9@01]
(assert (and
  (Seq_contains (Seq_range 0 n@4@01) i1@8@01)
  (and (Seq_contains (Seq_range 0 n@4@01) i2@9@01) (not (= i1@8@01 i2@9@01)))))
; [eval] xs[i1] != xs[i2]
; [eval] xs[i1]
(push) ; 6
(assert (not (>= i1@8@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i1@8@01 (Seq_length xs@3@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] xs[i2]
(push) ; 6
(assert (not (>= i2@9@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i2@9@01 (Seq_length xs@3@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 2 | !(i1@8@01 in [0..n@4@01] && i2@9@01 in [0..n@4@01] && i1@8@01 != i2@9@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 n@4@01) i1@8@01)
    (and (Seq_contains (Seq_range 0 n@4@01) i2@9@01) (not (= i1@8@01 i2@9@01))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 n@4@01) i1@8@01)
    (and (Seq_contains (Seq_range 0 n@4@01) i2@9@01) (not (= i1@8@01 i2@9@01))))
  (and
    (Seq_contains (Seq_range 0 n@4@01) i1@8@01)
    (Seq_contains (Seq_range 0 n@4@01) i2@9@01)
    (not (= i1@8@01 i2@9@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 n@4@01) i1@8@01)
      (and (Seq_contains (Seq_range 0 n@4@01) i2@9@01) (not (= i1@8@01 i2@9@01)))))
  (and
    (Seq_contains (Seq_range 0 n@4@01) i1@8@01)
    (and (Seq_contains (Seq_range 0 n@4@01) i2@9@01) (not (= i1@8@01 i2@9@01))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i1@8@01 Int) (i2@9@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 n@4@01) i1@8@01)
      (and
        (Seq_contains (Seq_range 0 n@4@01) i1@8@01)
        (or
          (Seq_contains (Seq_range 0 n@4@01) i2@9@01)
          (not (Seq_contains (Seq_range 0 n@4@01) i2@9@01)))))
    (or
      (Seq_contains (Seq_range 0 n@4@01) i1@8@01)
      (not (Seq_contains (Seq_range 0 n@4@01) i1@8@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 n@4@01) i1@8@01)
        (and
          (Seq_contains (Seq_range 0 n@4@01) i2@9@01)
          (not (= i1@8@01 i2@9@01))))
      (and
        (Seq_contains (Seq_range 0 n@4@01) i1@8@01)
        (Seq_contains (Seq_range 0 n@4@01) i2@9@01)
        (not (= i1@8@01 i2@9@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 n@4@01) i1@8@01)
          (and
            (Seq_contains (Seq_range 0 n@4@01) i2@9@01)
            (not (= i1@8@01 i2@9@01)))))
      (and
        (Seq_contains (Seq_range 0 n@4@01) i1@8@01)
        (and
          (Seq_contains (Seq_range 0 n@4@01) i2@9@01)
          (not (= i1@8@01 i2@9@01))))))
  :pattern ((Seq_contains (Seq_range 0 n@4@01) i1@8@01) (Seq_contains
    (Seq_range 0 n@4@01)
    i2@9@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@4@01) i1@8@01) (Seq_contains_trigger
    (Seq_range 0 n@4@01)
    i2@9@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0102.vpr@10@10@10@98-aux|)))
(assert (forall ((i1@8@01 Int) (i2@9@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 n@4@01) i1@8@01)
      (and
        (Seq_contains (Seq_range 0 n@4@01) i1@8@01)
        (or
          (Seq_contains (Seq_range 0 n@4@01) i2@9@01)
          (not (Seq_contains (Seq_range 0 n@4@01) i2@9@01)))))
    (or
      (Seq_contains (Seq_range 0 n@4@01) i1@8@01)
      (not (Seq_contains (Seq_range 0 n@4@01) i1@8@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 n@4@01) i1@8@01)
        (and
          (Seq_contains (Seq_range 0 n@4@01) i2@9@01)
          (not (= i1@8@01 i2@9@01))))
      (and
        (Seq_contains (Seq_range 0 n@4@01) i1@8@01)
        (Seq_contains (Seq_range 0 n@4@01) i2@9@01)
        (not (= i1@8@01 i2@9@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 n@4@01) i1@8@01)
          (and
            (Seq_contains (Seq_range 0 n@4@01) i2@9@01)
            (not (= i1@8@01 i2@9@01)))))
      (and
        (Seq_contains (Seq_range 0 n@4@01) i1@8@01)
        (and
          (Seq_contains (Seq_range 0 n@4@01) i2@9@01)
          (not (= i1@8@01 i2@9@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@4@01) i1@8@01) (Seq_contains_trigger
    (Seq_range 0 n@4@01)
    i2@9@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0102.vpr@10@10@10@98-aux|)))
(assert (forall ((i1@8@01 Int) (i2@9@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 n@4@01) i1@8@01)
      (and
        (Seq_contains (Seq_range 0 n@4@01) i1@8@01)
        (or
          (Seq_contains (Seq_range 0 n@4@01) i2@9@01)
          (not (Seq_contains (Seq_range 0 n@4@01) i2@9@01)))))
    (or
      (Seq_contains (Seq_range 0 n@4@01) i1@8@01)
      (not (Seq_contains (Seq_range 0 n@4@01) i1@8@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 n@4@01) i1@8@01)
        (and
          (Seq_contains (Seq_range 0 n@4@01) i2@9@01)
          (not (= i1@8@01 i2@9@01))))
      (and
        (Seq_contains (Seq_range 0 n@4@01) i1@8@01)
        (Seq_contains (Seq_range 0 n@4@01) i2@9@01)
        (not (= i1@8@01 i2@9@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 n@4@01) i1@8@01)
          (and
            (Seq_contains (Seq_range 0 n@4@01) i2@9@01)
            (not (= i1@8@01 i2@9@01)))))
      (and
        (Seq_contains (Seq_range 0 n@4@01) i1@8@01)
        (and
          (Seq_contains (Seq_range 0 n@4@01) i2@9@01)
          (not (= i1@8@01 i2@9@01))))))
  :pattern ((Seq_contains (Seq_range 0 n@4@01) i1@8@01) (Seq_index
    xs@3@01
    i2@9@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@4@01) i1@8@01) (Seq_index
    xs@3@01
    i2@9@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0102.vpr@10@10@10@98-aux|)))
(assert (forall ((i1@8@01 Int) (i2@9@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 n@4@01) i1@8@01)
      (and
        (Seq_contains (Seq_range 0 n@4@01) i1@8@01)
        (or
          (Seq_contains (Seq_range 0 n@4@01) i2@9@01)
          (not (Seq_contains (Seq_range 0 n@4@01) i2@9@01)))))
    (or
      (Seq_contains (Seq_range 0 n@4@01) i1@8@01)
      (not (Seq_contains (Seq_range 0 n@4@01) i1@8@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 n@4@01) i1@8@01)
        (and
          (Seq_contains (Seq_range 0 n@4@01) i2@9@01)
          (not (= i1@8@01 i2@9@01))))
      (and
        (Seq_contains (Seq_range 0 n@4@01) i1@8@01)
        (Seq_contains (Seq_range 0 n@4@01) i2@9@01)
        (not (= i1@8@01 i2@9@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 n@4@01) i1@8@01)
          (and
            (Seq_contains (Seq_range 0 n@4@01) i2@9@01)
            (not (= i1@8@01 i2@9@01)))))
      (and
        (Seq_contains (Seq_range 0 n@4@01) i1@8@01)
        (and
          (Seq_contains (Seq_range 0 n@4@01) i2@9@01)
          (not (= i1@8@01 i2@9@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@4@01) i1@8@01) (Seq_index
    xs@3@01
    i2@9@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0102.vpr@10@10@10@98-aux|)))
(assert (forall ((i1@8@01 Int) (i2@9@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 n@4@01) i1@8@01)
      (and
        (Seq_contains (Seq_range 0 n@4@01) i1@8@01)
        (or
          (Seq_contains (Seq_range 0 n@4@01) i2@9@01)
          (not (Seq_contains (Seq_range 0 n@4@01) i2@9@01)))))
    (or
      (Seq_contains (Seq_range 0 n@4@01) i1@8@01)
      (not (Seq_contains (Seq_range 0 n@4@01) i1@8@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 n@4@01) i1@8@01)
        (and
          (Seq_contains (Seq_range 0 n@4@01) i2@9@01)
          (not (= i1@8@01 i2@9@01))))
      (and
        (Seq_contains (Seq_range 0 n@4@01) i1@8@01)
        (Seq_contains (Seq_range 0 n@4@01) i2@9@01)
        (not (= i1@8@01 i2@9@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 n@4@01) i1@8@01)
          (and
            (Seq_contains (Seq_range 0 n@4@01) i2@9@01)
            (not (= i1@8@01 i2@9@01)))))
      (and
        (Seq_contains (Seq_range 0 n@4@01) i1@8@01)
        (and
          (Seq_contains (Seq_range 0 n@4@01) i2@9@01)
          (not (= i1@8@01 i2@9@01))))))
  :pattern ((Seq_contains (Seq_range 0 n@4@01) i2@9@01) (Seq_index
    xs@3@01
    i1@8@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@4@01) i2@9@01) (Seq_index
    xs@3@01
    i1@8@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0102.vpr@10@10@10@98-aux|)))
(assert (forall ((i1@8@01 Int) (i2@9@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 n@4@01) i1@8@01)
      (and
        (Seq_contains (Seq_range 0 n@4@01) i1@8@01)
        (or
          (Seq_contains (Seq_range 0 n@4@01) i2@9@01)
          (not (Seq_contains (Seq_range 0 n@4@01) i2@9@01)))))
    (or
      (Seq_contains (Seq_range 0 n@4@01) i1@8@01)
      (not (Seq_contains (Seq_range 0 n@4@01) i1@8@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 n@4@01) i1@8@01)
        (and
          (Seq_contains (Seq_range 0 n@4@01) i2@9@01)
          (not (= i1@8@01 i2@9@01))))
      (and
        (Seq_contains (Seq_range 0 n@4@01) i1@8@01)
        (Seq_contains (Seq_range 0 n@4@01) i2@9@01)
        (not (= i1@8@01 i2@9@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 n@4@01) i1@8@01)
          (and
            (Seq_contains (Seq_range 0 n@4@01) i2@9@01)
            (not (= i1@8@01 i2@9@01)))))
      (and
        (Seq_contains (Seq_range 0 n@4@01) i1@8@01)
        (and
          (Seq_contains (Seq_range 0 n@4@01) i2@9@01)
          (not (= i1@8@01 i2@9@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@4@01) i2@9@01) (Seq_index
    xs@3@01
    i1@8@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0102.vpr@10@10@10@98-aux|)))
(assert (forall ((i1@8@01 Int) (i2@9@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 n@4@01) i1@8@01)
      (and
        (Seq_contains (Seq_range 0 n@4@01) i1@8@01)
        (or
          (Seq_contains (Seq_range 0 n@4@01) i2@9@01)
          (not (Seq_contains (Seq_range 0 n@4@01) i2@9@01)))))
    (or
      (Seq_contains (Seq_range 0 n@4@01) i1@8@01)
      (not (Seq_contains (Seq_range 0 n@4@01) i1@8@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 n@4@01) i1@8@01)
        (and
          (Seq_contains (Seq_range 0 n@4@01) i2@9@01)
          (not (= i1@8@01 i2@9@01))))
      (and
        (Seq_contains (Seq_range 0 n@4@01) i1@8@01)
        (Seq_contains (Seq_range 0 n@4@01) i2@9@01)
        (not (= i1@8@01 i2@9@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 n@4@01) i1@8@01)
          (and
            (Seq_contains (Seq_range 0 n@4@01) i2@9@01)
            (not (= i1@8@01 i2@9@01)))))
      (and
        (Seq_contains (Seq_range 0 n@4@01) i1@8@01)
        (and
          (Seq_contains (Seq_range 0 n@4@01) i2@9@01)
          (not (= i1@8@01 i2@9@01))))))
  :pattern ((Seq_index xs@3@01 i1@8@01) (Seq_index xs@3@01 i2@9@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0102.vpr@10@10@10@98-aux|)))
(assert (forall ((i1@8@01 Int) (i2@9@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 n@4@01) i1@8@01)
      (and (Seq_contains (Seq_range 0 n@4@01) i2@9@01) (not (= i1@8@01 i2@9@01))))
    (not (= (Seq_index xs@3@01 i1@8@01) (Seq_index xs@3@01 i2@9@01))))
  :pattern ((Seq_contains (Seq_range 0 n@4@01) i1@8@01) (Seq_contains
    (Seq_range 0 n@4@01)
    i2@9@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@4@01) i1@8@01) (Seq_contains_trigger
    (Seq_range 0 n@4@01)
    i2@9@01))
  :pattern ((Seq_contains (Seq_range 0 n@4@01) i1@8@01) (Seq_index
    xs@3@01
    i2@9@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@4@01) i1@8@01) (Seq_index
    xs@3@01
    i2@9@01))
  :pattern ((Seq_contains (Seq_range 0 n@4@01) i2@9@01) (Seq_index
    xs@3@01
    i1@8@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@4@01) i2@9@01) (Seq_index
    xs@3@01
    i1@8@01))
  :pattern ((Seq_index xs@3@01 i1@8@01) (Seq_index xs@3@01 i2@9@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0102.vpr@10@10@10@98|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall i: Int ::(i in [0..n)) ==> acc(xs[i].f, write))
(declare-const i@10@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (i in [0..n))
; [eval] [0..n)
(assert (Seq_contains (Seq_range 0 n@4@01) i@10@01))
; [eval] xs[i]
(push) ; 4
(assert (not (>= i@10@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@10@01 (Seq_length xs@3@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-const $t@11@01 $FVF<f>)
(declare-fun inv@12@01 ($Ref) Int)
(declare-fun img@13@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@10@01 Int) (i2@10@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 n@4@01) i1@10@01)
      (Seq_contains (Seq_range 0 n@4@01) i2@10@01)
      (= (Seq_index xs@3@01 i1@10@01) (Seq_index xs@3@01 i2@10@01)))
    (= i1@10@01 i2@10@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@10@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 n@4@01) i@10@01)
    (and
      (= (inv@12@01 (Seq_index xs@3@01 i@10@01)) i@10@01)
      (img@13@01 (Seq_index xs@3@01 i@10@01))))
  :pattern ((Seq_index xs@3@01 i@10@01))
  :qid |quant-u-1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@13@01 r) (Seq_contains (Seq_range 0 n@4@01) (inv@12@01 r)))
    (= (Seq_index xs@3@01 (inv@12@01 r)) r))
  :pattern ((inv@12@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@10@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 n@4@01) i@10@01)
    (not (= (Seq_index xs@3@01 i@10@01) $Ref.null)))
  :pattern ((Seq_index xs@3@01 i@10@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale (forall i: Int ::(i in [0..n)) ==> acc(xs[i].f, write))
(declare-const i@14@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (i in [0..n))
; [eval] [0..n)
(assert (Seq_contains (Seq_range 0 n@4@01) i@14@01))
; [eval] xs[i]
(push) ; 4
(assert (not (>= i@14@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@14@01 (Seq_length xs@3@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@15@01 ($Ref) Int)
(declare-fun img@16@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@14@01 Int) (i2@14@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 n@4@01) i1@14@01)
      (Seq_contains (Seq_range 0 n@4@01) i2@14@01)
      (= (Seq_index xs@3@01 i1@14@01) (Seq_index xs@3@01 i2@14@01)))
    (= i1@14@01 i2@14@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@14@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 n@4@01) i@14@01)
    (and
      (= (inv@15@01 (Seq_index xs@3@01 i@14@01)) i@14@01)
      (img@16@01 (Seq_index xs@3@01 i@14@01))))
  :pattern ((Seq_index xs@3@01 i@14@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@16@01 r) (Seq_contains (Seq_range 0 n@4@01) (inv@15@01 r)))
    (= (Seq_index xs@3@01 (inv@15@01 r)) r))
  :pattern ((inv@15@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@17@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 n@4@01) (inv@15@01 r))
      (img@16@01 r)
      (= r (Seq_index xs@3@01 (inv@15@01 r))))
    ($Perm.min
      (ite
        (and (img@13@01 r) (Seq_contains (Seq_range 0 n@4@01) (inv@12@01 r)))
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
        (and (img@13@01 r) (Seq_contains (Seq_range 0 n@4@01) (inv@12@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@17@01 r))
    $Perm.No)
  
  :qid |quant-u-4|))))
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
      (Seq_contains (Seq_range 0 n@4@01) (inv@15@01 r))
      (img@16@01 r)
      (= r (Seq_index xs@3@01 (inv@15@01 r))))
    (= (- $Perm.Write (pTaken@17@01 r)) $Perm.No))
  
  :qid |quant-u-5|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@18@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@13@01 r) (Seq_contains (Seq_range 0 n@4@01) (inv@12@01 r)))
    (= ($FVF.lookup_f (as sm@18@01  $FVF<f>) r) ($FVF.lookup_f $t@11@01 r)))
  :pattern (($FVF.lookup_f (as sm@18@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@11@01 r))
  :qid |qp.fvfValDef0|)))
(pop) ; 2
(pop) ; 1
; ---------- test2 ----------
(declare-const xs@19@01 Seq<$Ref>)
(declare-const n@20@01 Int)
(declare-const b@21@01 Bool)
(declare-const xs@22@01 Seq<$Ref>)
(declare-const n@23@01 Int)
(declare-const b@24@01 Bool)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@25@01 $Snap)
(assert (= $t@25@01 ($Snap.combine ($Snap.first $t@25@01) ($Snap.second $t@25@01))))
(assert (= ($Snap.first $t@25@01) $Snap.unit))
; [eval] |xs| == n
; [eval] |xs|
(assert (= (Seq_length xs@22@01) n@23@01))
(assert (= ($Snap.second $t@25@01) $Snap.unit))
; [eval] n > 2
(assert (> n@23@01 2))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; inhale (forall i1: Int, i2: Int ::
;     { (i1 in [0..n)), (i2 in [0..n)) }
;     { (i1 in [0..n)), xs[i2] }
;     { (i2 in [0..n)), xs[i1] }
;     { xs[i1], xs[i2] }
;     (i1 in [0..n)) && ((i2 in [0..n)) && i1 != i2) ==> xs[i1] != xs[i2])
(declare-const $t@26@01 $Snap)
(assert (= $t@26@01 $Snap.unit))
; [eval] (forall i1: Int, i2: Int :: { (i1 in [0..n)), (i2 in [0..n)) } { (i1 in [0..n)), xs[i2] } { (i2 in [0..n)), xs[i1] } { xs[i1], xs[i2] } (i1 in [0..n)) && ((i2 in [0..n)) && i1 != i2) ==> xs[i1] != xs[i2])
(declare-const i1@27@01 Int)
(declare-const i2@28@01 Int)
(push) ; 3
; [eval] (i1 in [0..n)) && ((i2 in [0..n)) && i1 != i2) ==> xs[i1] != xs[i2]
; [eval] (i1 in [0..n)) && ((i2 in [0..n)) && i1 != i2)
; [eval] (i1 in [0..n))
; [eval] [0..n)
(push) ; 4
; [then-branch: 3 | !(i1@27@01 in [0..n@23@01]) | live]
; [else-branch: 3 | i1@27@01 in [0..n@23@01] | live]
(push) ; 5
; [then-branch: 3 | !(i1@27@01 in [0..n@23@01])]
(assert (not (Seq_contains (Seq_range 0 n@23@01) i1@27@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 3 | i1@27@01 in [0..n@23@01]]
(assert (Seq_contains (Seq_range 0 n@23@01) i1@27@01))
; [eval] (i2 in [0..n))
; [eval] [0..n)
(push) ; 6
; [then-branch: 4 | !(i2@28@01 in [0..n@23@01]) | live]
; [else-branch: 4 | i2@28@01 in [0..n@23@01] | live]
(push) ; 7
; [then-branch: 4 | !(i2@28@01 in [0..n@23@01])]
(assert (not (Seq_contains (Seq_range 0 n@23@01) i2@28@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 4 | i2@28@01 in [0..n@23@01]]
(assert (Seq_contains (Seq_range 0 n@23@01) i2@28@01))
; [eval] i1 != i2
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 n@23@01) i2@28@01)
  (not (Seq_contains (Seq_range 0 n@23@01) i2@28@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 n@23@01) i1@27@01)
  (and
    (Seq_contains (Seq_range 0 n@23@01) i1@27@01)
    (or
      (Seq_contains (Seq_range 0 n@23@01) i2@28@01)
      (not (Seq_contains (Seq_range 0 n@23@01) i2@28@01))))))
(assert (or
  (Seq_contains (Seq_range 0 n@23@01) i1@27@01)
  (not (Seq_contains (Seq_range 0 n@23@01) i1@27@01))))
(push) ; 4
; [then-branch: 5 | i1@27@01 in [0..n@23@01] && i2@28@01 in [0..n@23@01] && i1@27@01 != i2@28@01 | live]
; [else-branch: 5 | !(i1@27@01 in [0..n@23@01] && i2@28@01 in [0..n@23@01] && i1@27@01 != i2@28@01) | live]
(push) ; 5
; [then-branch: 5 | i1@27@01 in [0..n@23@01] && i2@28@01 in [0..n@23@01] && i1@27@01 != i2@28@01]
(assert (and
  (Seq_contains (Seq_range 0 n@23@01) i1@27@01)
  (and (Seq_contains (Seq_range 0 n@23@01) i2@28@01) (not (= i1@27@01 i2@28@01)))))
; [eval] xs[i1] != xs[i2]
; [eval] xs[i1]
(push) ; 6
(assert (not (>= i1@27@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i1@27@01 (Seq_length xs@22@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] xs[i2]
(push) ; 6
(assert (not (>= i2@28@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i2@28@01 (Seq_length xs@22@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 5 | !(i1@27@01 in [0..n@23@01] && i2@28@01 in [0..n@23@01] && i1@27@01 != i2@28@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 n@23@01) i1@27@01)
    (and
      (Seq_contains (Seq_range 0 n@23@01) i2@28@01)
      (not (= i1@27@01 i2@28@01))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 n@23@01) i1@27@01)
    (and
      (Seq_contains (Seq_range 0 n@23@01) i2@28@01)
      (not (= i1@27@01 i2@28@01))))
  (and
    (Seq_contains (Seq_range 0 n@23@01) i1@27@01)
    (Seq_contains (Seq_range 0 n@23@01) i2@28@01)
    (not (= i1@27@01 i2@28@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 n@23@01) i1@27@01)
      (and
        (Seq_contains (Seq_range 0 n@23@01) i2@28@01)
        (not (= i1@27@01 i2@28@01)))))
  (and
    (Seq_contains (Seq_range 0 n@23@01) i1@27@01)
    (and
      (Seq_contains (Seq_range 0 n@23@01) i2@28@01)
      (not (= i1@27@01 i2@28@01))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i1@27@01 Int) (i2@28@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 n@23@01) i1@27@01)
      (and
        (Seq_contains (Seq_range 0 n@23@01) i1@27@01)
        (or
          (Seq_contains (Seq_range 0 n@23@01) i2@28@01)
          (not (Seq_contains (Seq_range 0 n@23@01) i2@28@01)))))
    (or
      (Seq_contains (Seq_range 0 n@23@01) i1@27@01)
      (not (Seq_contains (Seq_range 0 n@23@01) i1@27@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 n@23@01) i1@27@01)
        (and
          (Seq_contains (Seq_range 0 n@23@01) i2@28@01)
          (not (= i1@27@01 i2@28@01))))
      (and
        (Seq_contains (Seq_range 0 n@23@01) i1@27@01)
        (Seq_contains (Seq_range 0 n@23@01) i2@28@01)
        (not (= i1@27@01 i2@28@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 n@23@01) i1@27@01)
          (and
            (Seq_contains (Seq_range 0 n@23@01) i2@28@01)
            (not (= i1@27@01 i2@28@01)))))
      (and
        (Seq_contains (Seq_range 0 n@23@01) i1@27@01)
        (and
          (Seq_contains (Seq_range 0 n@23@01) i2@28@01)
          (not (= i1@27@01 i2@28@01))))))
  :pattern ((Seq_contains (Seq_range 0 n@23@01) i1@27@01) (Seq_contains
    (Seq_range 0 n@23@01)
    i2@28@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@23@01) i1@27@01) (Seq_contains_trigger
    (Seq_range 0 n@23@01)
    i2@28@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0102.vpr@19@10@19@98-aux|)))
(assert (forall ((i1@27@01 Int) (i2@28@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 n@23@01) i1@27@01)
      (and
        (Seq_contains (Seq_range 0 n@23@01) i1@27@01)
        (or
          (Seq_contains (Seq_range 0 n@23@01) i2@28@01)
          (not (Seq_contains (Seq_range 0 n@23@01) i2@28@01)))))
    (or
      (Seq_contains (Seq_range 0 n@23@01) i1@27@01)
      (not (Seq_contains (Seq_range 0 n@23@01) i1@27@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 n@23@01) i1@27@01)
        (and
          (Seq_contains (Seq_range 0 n@23@01) i2@28@01)
          (not (= i1@27@01 i2@28@01))))
      (and
        (Seq_contains (Seq_range 0 n@23@01) i1@27@01)
        (Seq_contains (Seq_range 0 n@23@01) i2@28@01)
        (not (= i1@27@01 i2@28@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 n@23@01) i1@27@01)
          (and
            (Seq_contains (Seq_range 0 n@23@01) i2@28@01)
            (not (= i1@27@01 i2@28@01)))))
      (and
        (Seq_contains (Seq_range 0 n@23@01) i1@27@01)
        (and
          (Seq_contains (Seq_range 0 n@23@01) i2@28@01)
          (not (= i1@27@01 i2@28@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@23@01) i1@27@01) (Seq_contains_trigger
    (Seq_range 0 n@23@01)
    i2@28@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0102.vpr@19@10@19@98-aux|)))
(assert (forall ((i1@27@01 Int) (i2@28@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 n@23@01) i1@27@01)
      (and
        (Seq_contains (Seq_range 0 n@23@01) i1@27@01)
        (or
          (Seq_contains (Seq_range 0 n@23@01) i2@28@01)
          (not (Seq_contains (Seq_range 0 n@23@01) i2@28@01)))))
    (or
      (Seq_contains (Seq_range 0 n@23@01) i1@27@01)
      (not (Seq_contains (Seq_range 0 n@23@01) i1@27@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 n@23@01) i1@27@01)
        (and
          (Seq_contains (Seq_range 0 n@23@01) i2@28@01)
          (not (= i1@27@01 i2@28@01))))
      (and
        (Seq_contains (Seq_range 0 n@23@01) i1@27@01)
        (Seq_contains (Seq_range 0 n@23@01) i2@28@01)
        (not (= i1@27@01 i2@28@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 n@23@01) i1@27@01)
          (and
            (Seq_contains (Seq_range 0 n@23@01) i2@28@01)
            (not (= i1@27@01 i2@28@01)))))
      (and
        (Seq_contains (Seq_range 0 n@23@01) i1@27@01)
        (and
          (Seq_contains (Seq_range 0 n@23@01) i2@28@01)
          (not (= i1@27@01 i2@28@01))))))
  :pattern ((Seq_contains (Seq_range 0 n@23@01) i1@27@01) (Seq_index
    xs@22@01
    i2@28@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@23@01) i1@27@01) (Seq_index
    xs@22@01
    i2@28@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0102.vpr@19@10@19@98-aux|)))
(assert (forall ((i1@27@01 Int) (i2@28@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 n@23@01) i1@27@01)
      (and
        (Seq_contains (Seq_range 0 n@23@01) i1@27@01)
        (or
          (Seq_contains (Seq_range 0 n@23@01) i2@28@01)
          (not (Seq_contains (Seq_range 0 n@23@01) i2@28@01)))))
    (or
      (Seq_contains (Seq_range 0 n@23@01) i1@27@01)
      (not (Seq_contains (Seq_range 0 n@23@01) i1@27@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 n@23@01) i1@27@01)
        (and
          (Seq_contains (Seq_range 0 n@23@01) i2@28@01)
          (not (= i1@27@01 i2@28@01))))
      (and
        (Seq_contains (Seq_range 0 n@23@01) i1@27@01)
        (Seq_contains (Seq_range 0 n@23@01) i2@28@01)
        (not (= i1@27@01 i2@28@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 n@23@01) i1@27@01)
          (and
            (Seq_contains (Seq_range 0 n@23@01) i2@28@01)
            (not (= i1@27@01 i2@28@01)))))
      (and
        (Seq_contains (Seq_range 0 n@23@01) i1@27@01)
        (and
          (Seq_contains (Seq_range 0 n@23@01) i2@28@01)
          (not (= i1@27@01 i2@28@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@23@01) i1@27@01) (Seq_index
    xs@22@01
    i2@28@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0102.vpr@19@10@19@98-aux|)))
(assert (forall ((i1@27@01 Int) (i2@28@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 n@23@01) i1@27@01)
      (and
        (Seq_contains (Seq_range 0 n@23@01) i1@27@01)
        (or
          (Seq_contains (Seq_range 0 n@23@01) i2@28@01)
          (not (Seq_contains (Seq_range 0 n@23@01) i2@28@01)))))
    (or
      (Seq_contains (Seq_range 0 n@23@01) i1@27@01)
      (not (Seq_contains (Seq_range 0 n@23@01) i1@27@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 n@23@01) i1@27@01)
        (and
          (Seq_contains (Seq_range 0 n@23@01) i2@28@01)
          (not (= i1@27@01 i2@28@01))))
      (and
        (Seq_contains (Seq_range 0 n@23@01) i1@27@01)
        (Seq_contains (Seq_range 0 n@23@01) i2@28@01)
        (not (= i1@27@01 i2@28@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 n@23@01) i1@27@01)
          (and
            (Seq_contains (Seq_range 0 n@23@01) i2@28@01)
            (not (= i1@27@01 i2@28@01)))))
      (and
        (Seq_contains (Seq_range 0 n@23@01) i1@27@01)
        (and
          (Seq_contains (Seq_range 0 n@23@01) i2@28@01)
          (not (= i1@27@01 i2@28@01))))))
  :pattern ((Seq_contains (Seq_range 0 n@23@01) i2@28@01) (Seq_index
    xs@22@01
    i1@27@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@23@01) i2@28@01) (Seq_index
    xs@22@01
    i1@27@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0102.vpr@19@10@19@98-aux|)))
(assert (forall ((i1@27@01 Int) (i2@28@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 n@23@01) i1@27@01)
      (and
        (Seq_contains (Seq_range 0 n@23@01) i1@27@01)
        (or
          (Seq_contains (Seq_range 0 n@23@01) i2@28@01)
          (not (Seq_contains (Seq_range 0 n@23@01) i2@28@01)))))
    (or
      (Seq_contains (Seq_range 0 n@23@01) i1@27@01)
      (not (Seq_contains (Seq_range 0 n@23@01) i1@27@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 n@23@01) i1@27@01)
        (and
          (Seq_contains (Seq_range 0 n@23@01) i2@28@01)
          (not (= i1@27@01 i2@28@01))))
      (and
        (Seq_contains (Seq_range 0 n@23@01) i1@27@01)
        (Seq_contains (Seq_range 0 n@23@01) i2@28@01)
        (not (= i1@27@01 i2@28@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 n@23@01) i1@27@01)
          (and
            (Seq_contains (Seq_range 0 n@23@01) i2@28@01)
            (not (= i1@27@01 i2@28@01)))))
      (and
        (Seq_contains (Seq_range 0 n@23@01) i1@27@01)
        (and
          (Seq_contains (Seq_range 0 n@23@01) i2@28@01)
          (not (= i1@27@01 i2@28@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@23@01) i2@28@01) (Seq_index
    xs@22@01
    i1@27@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0102.vpr@19@10@19@98-aux|)))
(assert (forall ((i1@27@01 Int) (i2@28@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 n@23@01) i1@27@01)
      (and
        (Seq_contains (Seq_range 0 n@23@01) i1@27@01)
        (or
          (Seq_contains (Seq_range 0 n@23@01) i2@28@01)
          (not (Seq_contains (Seq_range 0 n@23@01) i2@28@01)))))
    (or
      (Seq_contains (Seq_range 0 n@23@01) i1@27@01)
      (not (Seq_contains (Seq_range 0 n@23@01) i1@27@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 n@23@01) i1@27@01)
        (and
          (Seq_contains (Seq_range 0 n@23@01) i2@28@01)
          (not (= i1@27@01 i2@28@01))))
      (and
        (Seq_contains (Seq_range 0 n@23@01) i1@27@01)
        (Seq_contains (Seq_range 0 n@23@01) i2@28@01)
        (not (= i1@27@01 i2@28@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 n@23@01) i1@27@01)
          (and
            (Seq_contains (Seq_range 0 n@23@01) i2@28@01)
            (not (= i1@27@01 i2@28@01)))))
      (and
        (Seq_contains (Seq_range 0 n@23@01) i1@27@01)
        (and
          (Seq_contains (Seq_range 0 n@23@01) i2@28@01)
          (not (= i1@27@01 i2@28@01))))))
  :pattern ((Seq_index xs@22@01 i1@27@01) (Seq_index xs@22@01 i2@28@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0102.vpr@19@10@19@98-aux|)))
(assert (forall ((i1@27@01 Int) (i2@28@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 n@23@01) i1@27@01)
      (and
        (Seq_contains (Seq_range 0 n@23@01) i2@28@01)
        (not (= i1@27@01 i2@28@01))))
    (not (= (Seq_index xs@22@01 i1@27@01) (Seq_index xs@22@01 i2@28@01))))
  :pattern ((Seq_contains (Seq_range 0 n@23@01) i1@27@01) (Seq_contains
    (Seq_range 0 n@23@01)
    i2@28@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@23@01) i1@27@01) (Seq_contains_trigger
    (Seq_range 0 n@23@01)
    i2@28@01))
  :pattern ((Seq_contains (Seq_range 0 n@23@01) i1@27@01) (Seq_index
    xs@22@01
    i2@28@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@23@01) i1@27@01) (Seq_index
    xs@22@01
    i2@28@01))
  :pattern ((Seq_contains (Seq_range 0 n@23@01) i2@28@01) (Seq_index
    xs@22@01
    i1@27@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@23@01) i2@28@01) (Seq_index
    xs@22@01
    i1@27@01))
  :pattern ((Seq_index xs@22@01 i1@27@01) (Seq_index xs@22@01 i2@28@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0102.vpr@19@10@19@98|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall i: Int ::(i in [0..n)) ==> acc(xs[i].f, write))
(declare-const i@29@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (i in [0..n))
; [eval] [0..n)
(assert (Seq_contains (Seq_range 0 n@23@01) i@29@01))
; [eval] xs[i]
(push) ; 4
(assert (not (>= i@29@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@29@01 (Seq_length xs@22@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-const $t@30@01 $FVF<f>)
(declare-fun inv@31@01 ($Ref) Int)
(declare-fun img@32@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@29@01 Int) (i2@29@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 n@23@01) i1@29@01)
      (Seq_contains (Seq_range 0 n@23@01) i2@29@01)
      (= (Seq_index xs@22@01 i1@29@01) (Seq_index xs@22@01 i2@29@01)))
    (= i1@29@01 i2@29@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@29@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 n@23@01) i@29@01)
    (and
      (= (inv@31@01 (Seq_index xs@22@01 i@29@01)) i@29@01)
      (img@32@01 (Seq_index xs@22@01 i@29@01))))
  :pattern ((Seq_index xs@22@01 i@29@01))
  :qid |quant-u-7|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@32@01 r) (Seq_contains (Seq_range 0 n@23@01) (inv@31@01 r)))
    (= (Seq_index xs@22@01 (inv@31@01 r)) r))
  :pattern ((inv@31@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@29@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 n@23@01) i@29@01)
    (not (= (Seq_index xs@22@01 i@29@01) $Ref.null)))
  :pattern ((Seq_index xs@22@01 i@29@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale (forall i: Int ::(i in [0..n)) ==> acc(xs[i].f, 1 / 2))
(declare-const i@33@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (i in [0..n))
; [eval] [0..n)
(assert (Seq_contains (Seq_range 0 n@23@01) i@33@01))
; [eval] xs[i]
(push) ; 4
(assert (not (>= i@33@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@33@01 (Seq_length xs@22@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@34@01 ($Ref) Int)
(declare-fun img@35@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@33@01 Int) (i2@33@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 n@23@01) i1@33@01)
      (Seq_contains (Seq_range 0 n@23@01) i2@33@01)
      (= (Seq_index xs@22@01 i1@33@01) (Seq_index xs@22@01 i2@33@01)))
    (= i1@33@01 i2@33@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@33@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 n@23@01) i@33@01)
    (and
      (= (inv@34@01 (Seq_index xs@22@01 i@33@01)) i@33@01)
      (img@35@01 (Seq_index xs@22@01 i@33@01))))
  :pattern ((Seq_index xs@22@01 i@33@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@35@01 r) (Seq_contains (Seq_range 0 n@23@01) (inv@34@01 r)))
    (= (Seq_index xs@22@01 (inv@34@01 r)) r))
  :pattern ((inv@34@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@36@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 n@23@01) (inv@34@01 r))
      (img@35@01 r)
      (= r (Seq_index xs@22@01 (inv@34@01 r))))
    ($Perm.min
      (ite
        (and (img@32@01 r) (Seq_contains (Seq_range 0 n@23@01) (inv@31@01 r)))
        $Perm.Write
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
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
        (and (img@32@01 r) (Seq_contains (Seq_range 0 n@23@01) (inv@31@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@36@01 r))
    $Perm.No)
  
  :qid |quant-u-10|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@36@01 r) $Perm.No)
  
  :qid |quant-u-11|))))
(check-sat)
; unknown
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
      (Seq_contains (Seq_range 0 n@23@01) (inv@34@01 r))
      (img@35@01 r)
      (= r (Seq_index xs@22@01 (inv@34@01 r))))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@36@01 r)) $Perm.No))
  
  :qid |quant-u-12|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@37@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@32@01 r) (Seq_contains (Seq_range 0 n@23@01) (inv@31@01 r)))
    (= ($FVF.lookup_f (as sm@37@01  $FVF<f>) r) ($FVF.lookup_f $t@30@01 r)))
  :pattern (($FVF.lookup_f (as sm@37@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@30@01 r))
  :qid |qp.fvfValDef1|)))
; [exec]
; exhale (forall i: Int ::(i in [0..n)) ==> acc(xs[i].f, 1 / 2))
(declare-const i@38@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (i in [0..n))
; [eval] [0..n)
(assert (Seq_contains (Seq_range 0 n@23@01) i@38@01))
; [eval] xs[i]
(push) ; 4
(assert (not (>= i@38@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@38@01 (Seq_length xs@22@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@39@01 ($Ref) Int)
(declare-fun img@40@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@38@01 Int) (i2@38@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 n@23@01) i1@38@01)
      (Seq_contains (Seq_range 0 n@23@01) i2@38@01)
      (= (Seq_index xs@22@01 i1@38@01) (Seq_index xs@22@01 i2@38@01)))
    (= i1@38@01 i2@38@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@38@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 n@23@01) i@38@01)
    (and
      (= (inv@39@01 (Seq_index xs@22@01 i@38@01)) i@38@01)
      (img@40@01 (Seq_index xs@22@01 i@38@01))))
  :pattern ((Seq_index xs@22@01 i@38@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@40@01 r) (Seq_contains (Seq_range 0 n@23@01) (inv@39@01 r)))
    (= (Seq_index xs@22@01 (inv@39@01 r)) r))
  :pattern ((inv@39@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@41@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 n@23@01) (inv@39@01 r))
      (img@40@01 r)
      (= r (Seq_index xs@22@01 (inv@39@01 r))))
    ($Perm.min
      (ite
        (and (img@32@01 r) (Seq_contains (Seq_range 0 n@23@01) (inv@31@01 r)))
        (- $Perm.Write (pTaken@36@01 r))
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
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
        (and (img@32@01 r) (Seq_contains (Seq_range 0 n@23@01) (inv@31@01 r)))
        (- $Perm.Write (pTaken@36@01 r))
        $Perm.No)
      (pTaken@41@01 r))
    $Perm.No)
  
  :qid |quant-u-15|))))
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
      (Seq_contains (Seq_range 0 n@23@01) (inv@39@01 r))
      (img@40@01 r)
      (= r (Seq_index xs@22@01 (inv@39@01 r))))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@41@01 r)) $Perm.No))
  
  :qid |quant-u-16|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@42@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@32@01 r) (Seq_contains (Seq_range 0 n@23@01) (inv@31@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@36@01 r)))
      false)
    (= ($FVF.lookup_f (as sm@42@01  $FVF<f>) r) ($FVF.lookup_f $t@30@01 r)))
  :pattern (($FVF.lookup_f (as sm@42@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@30@01 r))
  :qid |qp.fvfValDef2|)))
(pop) ; 2
(pop) ; 1
; ---------- test3 ----------
(declare-const xs@43@01 Seq<$Ref>)
(declare-const n@44@01 Int)
(declare-const xs@45@01 Seq<$Ref>)
(declare-const n@46@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@47@01 $Snap)
(assert (= $t@47@01 ($Snap.combine ($Snap.first $t@47@01) ($Snap.second $t@47@01))))
(assert (= ($Snap.first $t@47@01) $Snap.unit))
; [eval] |xs| == n
; [eval] |xs|
(assert (= (Seq_length xs@45@01) n@46@01))
(assert (= ($Snap.second $t@47@01) $Snap.unit))
; [eval] n > 2
(assert (> n@46@01 2))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; inhale (forall i1: Int, i2: Int ::
;     { (i1 in [0..n)), (i2 in [0..n)) }
;     { (i1 in [0..n)), xs[i2] }
;     { (i2 in [0..n)), xs[i1] }
;     { xs[i1], xs[i2] }
;     (i1 in [0..n)) && ((i2 in [0..n)) && i1 != i2) ==> xs[i1] != xs[i2])
(declare-const $t@48@01 $Snap)
(assert (= $t@48@01 $Snap.unit))
; [eval] (forall i1: Int, i2: Int :: { (i1 in [0..n)), (i2 in [0..n)) } { (i1 in [0..n)), xs[i2] } { (i2 in [0..n)), xs[i1] } { xs[i1], xs[i2] } (i1 in [0..n)) && ((i2 in [0..n)) && i1 != i2) ==> xs[i1] != xs[i2])
(declare-const i1@49@01 Int)
(declare-const i2@50@01 Int)
(push) ; 3
; [eval] (i1 in [0..n)) && ((i2 in [0..n)) && i1 != i2) ==> xs[i1] != xs[i2]
; [eval] (i1 in [0..n)) && ((i2 in [0..n)) && i1 != i2)
; [eval] (i1 in [0..n))
; [eval] [0..n)
(push) ; 4
; [then-branch: 6 | !(i1@49@01 in [0..n@46@01]) | live]
; [else-branch: 6 | i1@49@01 in [0..n@46@01] | live]
(push) ; 5
; [then-branch: 6 | !(i1@49@01 in [0..n@46@01])]
(assert (not (Seq_contains (Seq_range 0 n@46@01) i1@49@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 6 | i1@49@01 in [0..n@46@01]]
(assert (Seq_contains (Seq_range 0 n@46@01) i1@49@01))
; [eval] (i2 in [0..n))
; [eval] [0..n)
(push) ; 6
; [then-branch: 7 | !(i2@50@01 in [0..n@46@01]) | live]
; [else-branch: 7 | i2@50@01 in [0..n@46@01] | live]
(push) ; 7
; [then-branch: 7 | !(i2@50@01 in [0..n@46@01])]
(assert (not (Seq_contains (Seq_range 0 n@46@01) i2@50@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 7 | i2@50@01 in [0..n@46@01]]
(assert (Seq_contains (Seq_range 0 n@46@01) i2@50@01))
; [eval] i1 != i2
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 n@46@01) i2@50@01)
  (not (Seq_contains (Seq_range 0 n@46@01) i2@50@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 n@46@01) i1@49@01)
  (and
    (Seq_contains (Seq_range 0 n@46@01) i1@49@01)
    (or
      (Seq_contains (Seq_range 0 n@46@01) i2@50@01)
      (not (Seq_contains (Seq_range 0 n@46@01) i2@50@01))))))
(assert (or
  (Seq_contains (Seq_range 0 n@46@01) i1@49@01)
  (not (Seq_contains (Seq_range 0 n@46@01) i1@49@01))))
(push) ; 4
; [then-branch: 8 | i1@49@01 in [0..n@46@01] && i2@50@01 in [0..n@46@01] && i1@49@01 != i2@50@01 | live]
; [else-branch: 8 | !(i1@49@01 in [0..n@46@01] && i2@50@01 in [0..n@46@01] && i1@49@01 != i2@50@01) | live]
(push) ; 5
; [then-branch: 8 | i1@49@01 in [0..n@46@01] && i2@50@01 in [0..n@46@01] && i1@49@01 != i2@50@01]
(assert (and
  (Seq_contains (Seq_range 0 n@46@01) i1@49@01)
  (and (Seq_contains (Seq_range 0 n@46@01) i2@50@01) (not (= i1@49@01 i2@50@01)))))
; [eval] xs[i1] != xs[i2]
; [eval] xs[i1]
(push) ; 6
(assert (not (>= i1@49@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i1@49@01 (Seq_length xs@45@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] xs[i2]
(push) ; 6
(assert (not (>= i2@50@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i2@50@01 (Seq_length xs@45@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 8 | !(i1@49@01 in [0..n@46@01] && i2@50@01 in [0..n@46@01] && i1@49@01 != i2@50@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 n@46@01) i1@49@01)
    (and
      (Seq_contains (Seq_range 0 n@46@01) i2@50@01)
      (not (= i1@49@01 i2@50@01))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 n@46@01) i1@49@01)
    (and
      (Seq_contains (Seq_range 0 n@46@01) i2@50@01)
      (not (= i1@49@01 i2@50@01))))
  (and
    (Seq_contains (Seq_range 0 n@46@01) i1@49@01)
    (Seq_contains (Seq_range 0 n@46@01) i2@50@01)
    (not (= i1@49@01 i2@50@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 n@46@01) i1@49@01)
      (and
        (Seq_contains (Seq_range 0 n@46@01) i2@50@01)
        (not (= i1@49@01 i2@50@01)))))
  (and
    (Seq_contains (Seq_range 0 n@46@01) i1@49@01)
    (and
      (Seq_contains (Seq_range 0 n@46@01) i2@50@01)
      (not (= i1@49@01 i2@50@01))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i1@49@01 Int) (i2@50@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 n@46@01) i1@49@01)
      (and
        (Seq_contains (Seq_range 0 n@46@01) i1@49@01)
        (or
          (Seq_contains (Seq_range 0 n@46@01) i2@50@01)
          (not (Seq_contains (Seq_range 0 n@46@01) i2@50@01)))))
    (or
      (Seq_contains (Seq_range 0 n@46@01) i1@49@01)
      (not (Seq_contains (Seq_range 0 n@46@01) i1@49@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 n@46@01) i1@49@01)
        (and
          (Seq_contains (Seq_range 0 n@46@01) i2@50@01)
          (not (= i1@49@01 i2@50@01))))
      (and
        (Seq_contains (Seq_range 0 n@46@01) i1@49@01)
        (Seq_contains (Seq_range 0 n@46@01) i2@50@01)
        (not (= i1@49@01 i2@50@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 n@46@01) i1@49@01)
          (and
            (Seq_contains (Seq_range 0 n@46@01) i2@50@01)
            (not (= i1@49@01 i2@50@01)))))
      (and
        (Seq_contains (Seq_range 0 n@46@01) i1@49@01)
        (and
          (Seq_contains (Seq_range 0 n@46@01) i2@50@01)
          (not (= i1@49@01 i2@50@01))))))
  :pattern ((Seq_contains (Seq_range 0 n@46@01) i1@49@01) (Seq_contains
    (Seq_range 0 n@46@01)
    i2@50@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@46@01) i1@49@01) (Seq_contains_trigger
    (Seq_range 0 n@46@01)
    i2@50@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0102.vpr@29@10@29@98-aux|)))
(assert (forall ((i1@49@01 Int) (i2@50@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 n@46@01) i1@49@01)
      (and
        (Seq_contains (Seq_range 0 n@46@01) i1@49@01)
        (or
          (Seq_contains (Seq_range 0 n@46@01) i2@50@01)
          (not (Seq_contains (Seq_range 0 n@46@01) i2@50@01)))))
    (or
      (Seq_contains (Seq_range 0 n@46@01) i1@49@01)
      (not (Seq_contains (Seq_range 0 n@46@01) i1@49@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 n@46@01) i1@49@01)
        (and
          (Seq_contains (Seq_range 0 n@46@01) i2@50@01)
          (not (= i1@49@01 i2@50@01))))
      (and
        (Seq_contains (Seq_range 0 n@46@01) i1@49@01)
        (Seq_contains (Seq_range 0 n@46@01) i2@50@01)
        (not (= i1@49@01 i2@50@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 n@46@01) i1@49@01)
          (and
            (Seq_contains (Seq_range 0 n@46@01) i2@50@01)
            (not (= i1@49@01 i2@50@01)))))
      (and
        (Seq_contains (Seq_range 0 n@46@01) i1@49@01)
        (and
          (Seq_contains (Seq_range 0 n@46@01) i2@50@01)
          (not (= i1@49@01 i2@50@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@46@01) i1@49@01) (Seq_contains_trigger
    (Seq_range 0 n@46@01)
    i2@50@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0102.vpr@29@10@29@98-aux|)))
(assert (forall ((i1@49@01 Int) (i2@50@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 n@46@01) i1@49@01)
      (and
        (Seq_contains (Seq_range 0 n@46@01) i1@49@01)
        (or
          (Seq_contains (Seq_range 0 n@46@01) i2@50@01)
          (not (Seq_contains (Seq_range 0 n@46@01) i2@50@01)))))
    (or
      (Seq_contains (Seq_range 0 n@46@01) i1@49@01)
      (not (Seq_contains (Seq_range 0 n@46@01) i1@49@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 n@46@01) i1@49@01)
        (and
          (Seq_contains (Seq_range 0 n@46@01) i2@50@01)
          (not (= i1@49@01 i2@50@01))))
      (and
        (Seq_contains (Seq_range 0 n@46@01) i1@49@01)
        (Seq_contains (Seq_range 0 n@46@01) i2@50@01)
        (not (= i1@49@01 i2@50@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 n@46@01) i1@49@01)
          (and
            (Seq_contains (Seq_range 0 n@46@01) i2@50@01)
            (not (= i1@49@01 i2@50@01)))))
      (and
        (Seq_contains (Seq_range 0 n@46@01) i1@49@01)
        (and
          (Seq_contains (Seq_range 0 n@46@01) i2@50@01)
          (not (= i1@49@01 i2@50@01))))))
  :pattern ((Seq_contains (Seq_range 0 n@46@01) i1@49@01) (Seq_index
    xs@45@01
    i2@50@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@46@01) i1@49@01) (Seq_index
    xs@45@01
    i2@50@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0102.vpr@29@10@29@98-aux|)))
(assert (forall ((i1@49@01 Int) (i2@50@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 n@46@01) i1@49@01)
      (and
        (Seq_contains (Seq_range 0 n@46@01) i1@49@01)
        (or
          (Seq_contains (Seq_range 0 n@46@01) i2@50@01)
          (not (Seq_contains (Seq_range 0 n@46@01) i2@50@01)))))
    (or
      (Seq_contains (Seq_range 0 n@46@01) i1@49@01)
      (not (Seq_contains (Seq_range 0 n@46@01) i1@49@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 n@46@01) i1@49@01)
        (and
          (Seq_contains (Seq_range 0 n@46@01) i2@50@01)
          (not (= i1@49@01 i2@50@01))))
      (and
        (Seq_contains (Seq_range 0 n@46@01) i1@49@01)
        (Seq_contains (Seq_range 0 n@46@01) i2@50@01)
        (not (= i1@49@01 i2@50@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 n@46@01) i1@49@01)
          (and
            (Seq_contains (Seq_range 0 n@46@01) i2@50@01)
            (not (= i1@49@01 i2@50@01)))))
      (and
        (Seq_contains (Seq_range 0 n@46@01) i1@49@01)
        (and
          (Seq_contains (Seq_range 0 n@46@01) i2@50@01)
          (not (= i1@49@01 i2@50@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@46@01) i1@49@01) (Seq_index
    xs@45@01
    i2@50@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0102.vpr@29@10@29@98-aux|)))
(assert (forall ((i1@49@01 Int) (i2@50@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 n@46@01) i1@49@01)
      (and
        (Seq_contains (Seq_range 0 n@46@01) i1@49@01)
        (or
          (Seq_contains (Seq_range 0 n@46@01) i2@50@01)
          (not (Seq_contains (Seq_range 0 n@46@01) i2@50@01)))))
    (or
      (Seq_contains (Seq_range 0 n@46@01) i1@49@01)
      (not (Seq_contains (Seq_range 0 n@46@01) i1@49@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 n@46@01) i1@49@01)
        (and
          (Seq_contains (Seq_range 0 n@46@01) i2@50@01)
          (not (= i1@49@01 i2@50@01))))
      (and
        (Seq_contains (Seq_range 0 n@46@01) i1@49@01)
        (Seq_contains (Seq_range 0 n@46@01) i2@50@01)
        (not (= i1@49@01 i2@50@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 n@46@01) i1@49@01)
          (and
            (Seq_contains (Seq_range 0 n@46@01) i2@50@01)
            (not (= i1@49@01 i2@50@01)))))
      (and
        (Seq_contains (Seq_range 0 n@46@01) i1@49@01)
        (and
          (Seq_contains (Seq_range 0 n@46@01) i2@50@01)
          (not (= i1@49@01 i2@50@01))))))
  :pattern ((Seq_contains (Seq_range 0 n@46@01) i2@50@01) (Seq_index
    xs@45@01
    i1@49@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@46@01) i2@50@01) (Seq_index
    xs@45@01
    i1@49@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0102.vpr@29@10@29@98-aux|)))
(assert (forall ((i1@49@01 Int) (i2@50@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 n@46@01) i1@49@01)
      (and
        (Seq_contains (Seq_range 0 n@46@01) i1@49@01)
        (or
          (Seq_contains (Seq_range 0 n@46@01) i2@50@01)
          (not (Seq_contains (Seq_range 0 n@46@01) i2@50@01)))))
    (or
      (Seq_contains (Seq_range 0 n@46@01) i1@49@01)
      (not (Seq_contains (Seq_range 0 n@46@01) i1@49@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 n@46@01) i1@49@01)
        (and
          (Seq_contains (Seq_range 0 n@46@01) i2@50@01)
          (not (= i1@49@01 i2@50@01))))
      (and
        (Seq_contains (Seq_range 0 n@46@01) i1@49@01)
        (Seq_contains (Seq_range 0 n@46@01) i2@50@01)
        (not (= i1@49@01 i2@50@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 n@46@01) i1@49@01)
          (and
            (Seq_contains (Seq_range 0 n@46@01) i2@50@01)
            (not (= i1@49@01 i2@50@01)))))
      (and
        (Seq_contains (Seq_range 0 n@46@01) i1@49@01)
        (and
          (Seq_contains (Seq_range 0 n@46@01) i2@50@01)
          (not (= i1@49@01 i2@50@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@46@01) i2@50@01) (Seq_index
    xs@45@01
    i1@49@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0102.vpr@29@10@29@98-aux|)))
(assert (forall ((i1@49@01 Int) (i2@50@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 n@46@01) i1@49@01)
      (and
        (Seq_contains (Seq_range 0 n@46@01) i1@49@01)
        (or
          (Seq_contains (Seq_range 0 n@46@01) i2@50@01)
          (not (Seq_contains (Seq_range 0 n@46@01) i2@50@01)))))
    (or
      (Seq_contains (Seq_range 0 n@46@01) i1@49@01)
      (not (Seq_contains (Seq_range 0 n@46@01) i1@49@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 n@46@01) i1@49@01)
        (and
          (Seq_contains (Seq_range 0 n@46@01) i2@50@01)
          (not (= i1@49@01 i2@50@01))))
      (and
        (Seq_contains (Seq_range 0 n@46@01) i1@49@01)
        (Seq_contains (Seq_range 0 n@46@01) i2@50@01)
        (not (= i1@49@01 i2@50@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 n@46@01) i1@49@01)
          (and
            (Seq_contains (Seq_range 0 n@46@01) i2@50@01)
            (not (= i1@49@01 i2@50@01)))))
      (and
        (Seq_contains (Seq_range 0 n@46@01) i1@49@01)
        (and
          (Seq_contains (Seq_range 0 n@46@01) i2@50@01)
          (not (= i1@49@01 i2@50@01))))))
  :pattern ((Seq_index xs@45@01 i1@49@01) (Seq_index xs@45@01 i2@50@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0102.vpr@29@10@29@98-aux|)))
(assert (forall ((i1@49@01 Int) (i2@50@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 n@46@01) i1@49@01)
      (and
        (Seq_contains (Seq_range 0 n@46@01) i2@50@01)
        (not (= i1@49@01 i2@50@01))))
    (not (= (Seq_index xs@45@01 i1@49@01) (Seq_index xs@45@01 i2@50@01))))
  :pattern ((Seq_contains (Seq_range 0 n@46@01) i1@49@01) (Seq_contains
    (Seq_range 0 n@46@01)
    i2@50@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@46@01) i1@49@01) (Seq_contains_trigger
    (Seq_range 0 n@46@01)
    i2@50@01))
  :pattern ((Seq_contains (Seq_range 0 n@46@01) i1@49@01) (Seq_index
    xs@45@01
    i2@50@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@46@01) i1@49@01) (Seq_index
    xs@45@01
    i2@50@01))
  :pattern ((Seq_contains (Seq_range 0 n@46@01) i2@50@01) (Seq_index
    xs@45@01
    i1@49@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@46@01) i2@50@01) (Seq_index
    xs@45@01
    i1@49@01))
  :pattern ((Seq_index xs@45@01 i1@49@01) (Seq_index xs@45@01 i2@50@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0102.vpr@29@10@29@98|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall i: Int ::(i in [0..n)) ==>
;     acc(xs[i].f, (i < 2 ? write : 1 / 10)))
(declare-const i@51@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (i in [0..n))
; [eval] [0..n)
(assert (Seq_contains (Seq_range 0 n@46@01) i@51@01))
; [eval] xs[i]
(push) ; 4
(assert (not (>= i@51@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@51@01 (Seq_length xs@45@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] (i < 2 ? write : 1 / 10)
; [eval] i < 2
(push) ; 4
; [then-branch: 9 | i@51@01 < 2 | live]
; [else-branch: 9 | !(i@51@01 < 2) | live]
(push) ; 5
; [then-branch: 9 | i@51@01 < 2]
(assert (< i@51@01 2))
(pop) ; 5
(push) ; 5
; [else-branch: 9 | !(i@51@01 < 2)]
(assert (not (< i@51@01 2)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (< i@51@01 2)) (< i@51@01 2)))
(pop) ; 3
(declare-const $t@52@01 $FVF<f>)
(declare-fun inv@53@01 ($Ref) Int)
(declare-fun img@54@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@51@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 n@46@01) i@51@01)
    (or (not (< i@51@01 2)) (< i@51@01 2)))
  :pattern ((Seq_index xs@45@01 i@51@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@51@01 Int) (i2@51@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 n@46@01) i1@51@01)
      (Seq_contains (Seq_range 0 n@46@01) i2@51@01)
      (= (Seq_index xs@45@01 i1@51@01) (Seq_index xs@45@01 i2@51@01)))
    (= i1@51@01 i2@51@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@51@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 n@46@01) i@51@01)
    (and
      (= (inv@53@01 (Seq_index xs@45@01 i@51@01)) i@51@01)
      (img@54@01 (Seq_index xs@45@01 i@51@01))))
  :pattern ((Seq_index xs@45@01 i@51@01))
  :qid |quant-u-18|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@54@01 r) (Seq_contains (Seq_range 0 n@46@01) (inv@53@01 r)))
    (= (Seq_index xs@45@01 (inv@53@01 r)) r))
  :pattern ((inv@53@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((i@51@01 Int)) (!
  (<= $Perm.No (ite (< i@51@01 2) $Perm.Write (/ (to_real 1) (to_real 10))))
  :pattern ((Seq_index xs@45@01 i@51@01))
  :qid |f-permAtLeastZero|)))
; Field permissions are at most one
(assert (forall ((i@51@01 Int)) (!
  (<= (ite (< i@51@01 2) $Perm.Write (/ (to_real 1) (to_real 10))) $Perm.Write)
  :pattern ((Seq_index xs@45@01 i@51@01))
  :qid |f-permAtMostOne|)))
; Permission implies non-null receiver
(assert (forall ((i@51@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 n@46@01) i@51@01)
    (not (= (Seq_index xs@45@01 i@51@01) $Ref.null)))
  :pattern ((Seq_index xs@45@01 i@51@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; exhale (forall i: Int ::(i in [0..n)) ==>
;     acc(xs[i].f, (i < 2 ? write : 1 / 10)))
(declare-const i@55@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (i in [0..n))
; [eval] [0..n)
(assert (Seq_contains (Seq_range 0 n@46@01) i@55@01))
; [eval] (i < 2 ? write : 1 / 10)
; [eval] i < 2
(push) ; 4
; [then-branch: 10 | i@55@01 < 2 | live]
; [else-branch: 10 | !(i@55@01 < 2) | live]
(push) ; 5
; [then-branch: 10 | i@55@01 < 2]
(assert (< i@55@01 2))
(pop) ; 5
(push) ; 5
; [else-branch: 10 | !(i@55@01 < 2)]
(assert (not (< i@55@01 2)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (< i@55@01 2)) (< i@55@01 2)))
; [eval] xs[i]
(push) ; 4
(assert (not (>= i@55@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@55@01 (Seq_length xs@45@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@56@01 ($Ref) Int)
(declare-fun img@57@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@55@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 n@46@01) i@55@01)
    (or (not (< i@55@01 2)) (< i@55@01 2)))
  :pattern ((Seq_index xs@45@01 i@55@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@55@01 Int) (i2@55@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 n@46@01) i1@55@01)
      (Seq_contains (Seq_range 0 n@46@01) i2@55@01)
      (= (Seq_index xs@45@01 i1@55@01) (Seq_index xs@45@01 i2@55@01)))
    (= i1@55@01 i2@55@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@55@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 n@46@01) i@55@01)
    (and
      (= (inv@56@01 (Seq_index xs@45@01 i@55@01)) i@55@01)
      (img@57@01 (Seq_index xs@45@01 i@55@01))))
  :pattern ((Seq_index xs@45@01 i@55@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@57@01 r) (Seq_contains (Seq_range 0 n@46@01) (inv@56@01 r)))
    (= (Seq_index xs@45@01 (inv@56@01 r)) r))
  :pattern ((inv@56@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@58@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 n@46@01) (inv@56@01 r))
      (img@57@01 r)
      (= r (Seq_index xs@45@01 (inv@56@01 r))))
    ($Perm.min
      (ite
        (and (img@54@01 r) (Seq_contains (Seq_range 0 n@46@01) (inv@53@01 r)))
        (ite (< (inv@53@01 r) 2) $Perm.Write (/ (to_real 1) (to_real 10)))
        $Perm.No)
      (ite (< (inv@56@01 r) 2) $Perm.Write (/ (to_real 1) (to_real 10))))
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
        (and (img@54@01 r) (Seq_contains (Seq_range 0 n@46@01) (inv@53@01 r)))
        (ite (< (inv@53@01 r) 2) $Perm.Write (/ (to_real 1) (to_real 10)))
        $Perm.No)
      (pTaken@58@01 r))
    $Perm.No)
  
  :qid |quant-u-21|))))
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
      (Seq_contains (Seq_range 0 n@46@01) (inv@56@01 r))
      (img@57@01 r)
      (= r (Seq_index xs@45@01 (inv@56@01 r))))
    (=
      (-
        (ite (< (inv@56@01 r) 2) $Perm.Write (/ (to_real 1) (to_real 10)))
        (pTaken@58@01 r))
      $Perm.No))
  
  :qid |quant-u-22|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@59@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@54@01 r) (Seq_contains (Seq_range 0 n@46@01) (inv@53@01 r)))
    (= ($FVF.lookup_f (as sm@59@01  $FVF<f>) r) ($FVF.lookup_f $t@52@01 r)))
  :pattern (($FVF.lookup_f (as sm@59@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@52@01 r))
  :qid |qp.fvfValDef3|)))
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
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 2
(pop) ; 1
; ---------- test5 ----------
(declare-const xs@60@01 Seq<$Ref>)
(declare-const n@61@01 Int)
(declare-const x@62@01 $Ref)
(declare-const y@63@01 $Ref)
(declare-const xs@64@01 Seq<$Ref>)
(declare-const n@65@01 Int)
(declare-const x@66@01 $Ref)
(declare-const y@67@01 $Ref)
(push) ; 1
(declare-const $t@68@01 $Snap)
(assert (= $t@68@01 ($Snap.combine ($Snap.first $t@68@01) ($Snap.second $t@68@01))))
(assert (= ($Snap.first $t@68@01) $Snap.unit))
; [eval] |xs| == n
; [eval] |xs|
(assert (= (Seq_length xs@64@01) n@65@01))
(assert (=
  ($Snap.second $t@68@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@68@01))
    ($Snap.second ($Snap.second $t@68@01)))))
(assert (= ($Snap.first ($Snap.second $t@68@01)) $Snap.unit))
; [eval] n > 2
(assert (> n@65@01 2))
(assert (=
  ($Snap.second ($Snap.second $t@68@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@68@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@68@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@68@01))) $Snap.unit))
; [eval] xs[0] == x
; [eval] xs[0]
(push) ; 2
(assert (not (< 0 (Seq_length xs@64@01))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (= (Seq_index xs@64@01 0) x@66@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@68@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@68@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@68@01))))
  $Snap.unit))
; [eval] xs[1] == y
; [eval] xs[1]
(push) ; 2
(assert (not (< 1 (Seq_length xs@64@01))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (= (Seq_index xs@64@01 1) y@67@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01))))))))
(declare-const sm@69@01 $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (as sm@69@01  $FVF<f>) x@66@01)
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01))))))))
(assert (not (= x@66@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01)))))))))
(declare-const sm@70@01 $FVF<f>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_f (as sm@70@01  $FVF<f>) y@67@01)
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01)))))))))
(push) ; 2
(set-option :timeout 10)
(assert (not (= y@67@01 x@66@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= y@67@01 $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01)))))))
  $Snap.unit))
; [eval] (forall i1: Int, i2: Int :: { (i1 in [0..n)), (i2 in [0..n)) } { (i1 in [0..n)), xs[i2] } { (i2 in [0..n)), xs[i1] } { xs[i1], xs[i2] } (i1 in [0..n)) && ((i2 in [0..n)) && i1 != i2) ==> xs[i1] != xs[i2])
(declare-const i1@71@01 Int)
(declare-const i2@72@01 Int)
(set-option :timeout 0)
(push) ; 2
; [eval] (i1 in [0..n)) && ((i2 in [0..n)) && i1 != i2) ==> xs[i1] != xs[i2]
; [eval] (i1 in [0..n)) && ((i2 in [0..n)) && i1 != i2)
; [eval] (i1 in [0..n))
; [eval] [0..n)
(push) ; 3
; [then-branch: 11 | !(i1@71@01 in [0..n@65@01]) | live]
; [else-branch: 11 | i1@71@01 in [0..n@65@01] | live]
(push) ; 4
; [then-branch: 11 | !(i1@71@01 in [0..n@65@01])]
(assert (not (Seq_contains (Seq_range 0 n@65@01) i1@71@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 11 | i1@71@01 in [0..n@65@01]]
(assert (Seq_contains (Seq_range 0 n@65@01) i1@71@01))
; [eval] (i2 in [0..n))
; [eval] [0..n)
(push) ; 5
; [then-branch: 12 | !(i2@72@01 in [0..n@65@01]) | live]
; [else-branch: 12 | i2@72@01 in [0..n@65@01] | live]
(push) ; 6
; [then-branch: 12 | !(i2@72@01 in [0..n@65@01])]
(assert (not (Seq_contains (Seq_range 0 n@65@01) i2@72@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 12 | i2@72@01 in [0..n@65@01]]
(assert (Seq_contains (Seq_range 0 n@65@01) i2@72@01))
; [eval] i1 != i2
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 n@65@01) i2@72@01)
  (not (Seq_contains (Seq_range 0 n@65@01) i2@72@01))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 n@65@01) i1@71@01)
  (and
    (Seq_contains (Seq_range 0 n@65@01) i1@71@01)
    (or
      (Seq_contains (Seq_range 0 n@65@01) i2@72@01)
      (not (Seq_contains (Seq_range 0 n@65@01) i2@72@01))))))
(assert (or
  (Seq_contains (Seq_range 0 n@65@01) i1@71@01)
  (not (Seq_contains (Seq_range 0 n@65@01) i1@71@01))))
(push) ; 3
; [then-branch: 13 | i1@71@01 in [0..n@65@01] && i2@72@01 in [0..n@65@01] && i1@71@01 != i2@72@01 | live]
; [else-branch: 13 | !(i1@71@01 in [0..n@65@01] && i2@72@01 in [0..n@65@01] && i1@71@01 != i2@72@01) | live]
(push) ; 4
; [then-branch: 13 | i1@71@01 in [0..n@65@01] && i2@72@01 in [0..n@65@01] && i1@71@01 != i2@72@01]
(assert (and
  (Seq_contains (Seq_range 0 n@65@01) i1@71@01)
  (and (Seq_contains (Seq_range 0 n@65@01) i2@72@01) (not (= i1@71@01 i2@72@01)))))
; [eval] xs[i1] != xs[i2]
; [eval] xs[i1]
(push) ; 5
(assert (not (>= i1@71@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i1@71@01 (Seq_length xs@64@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] xs[i2]
(push) ; 5
(assert (not (>= i2@72@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i2@72@01 (Seq_length xs@64@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 13 | !(i1@71@01 in [0..n@65@01] && i2@72@01 in [0..n@65@01] && i1@71@01 != i2@72@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 n@65@01) i1@71@01)
    (and
      (Seq_contains (Seq_range 0 n@65@01) i2@72@01)
      (not (= i1@71@01 i2@72@01))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 n@65@01) i1@71@01)
    (and
      (Seq_contains (Seq_range 0 n@65@01) i2@72@01)
      (not (= i1@71@01 i2@72@01))))
  (and
    (Seq_contains (Seq_range 0 n@65@01) i1@71@01)
    (Seq_contains (Seq_range 0 n@65@01) i2@72@01)
    (not (= i1@71@01 i2@72@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 n@65@01) i1@71@01)
      (and
        (Seq_contains (Seq_range 0 n@65@01) i2@72@01)
        (not (= i1@71@01 i2@72@01)))))
  (and
    (Seq_contains (Seq_range 0 n@65@01) i1@71@01)
    (and
      (Seq_contains (Seq_range 0 n@65@01) i2@72@01)
      (not (= i1@71@01 i2@72@01))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i1@71@01 Int) (i2@72@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 n@65@01) i1@71@01)
      (and
        (Seq_contains (Seq_range 0 n@65@01) i1@71@01)
        (or
          (Seq_contains (Seq_range 0 n@65@01) i2@72@01)
          (not (Seq_contains (Seq_range 0 n@65@01) i2@72@01)))))
    (or
      (Seq_contains (Seq_range 0 n@65@01) i1@71@01)
      (not (Seq_contains (Seq_range 0 n@65@01) i1@71@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 n@65@01) i1@71@01)
        (and
          (Seq_contains (Seq_range 0 n@65@01) i2@72@01)
          (not (= i1@71@01 i2@72@01))))
      (and
        (Seq_contains (Seq_range 0 n@65@01) i1@71@01)
        (Seq_contains (Seq_range 0 n@65@01) i2@72@01)
        (not (= i1@71@01 i2@72@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 n@65@01) i1@71@01)
          (and
            (Seq_contains (Seq_range 0 n@65@01) i2@72@01)
            (not (= i1@71@01 i2@72@01)))))
      (and
        (Seq_contains (Seq_range 0 n@65@01) i1@71@01)
        (and
          (Seq_contains (Seq_range 0 n@65@01) i2@72@01)
          (not (= i1@71@01 i2@72@01))))))
  :pattern ((Seq_contains (Seq_range 0 n@65@01) i1@71@01) (Seq_contains
    (Seq_range 0 n@65@01)
    i2@72@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@65@01) i1@71@01) (Seq_contains_trigger
    (Seq_range 0 n@65@01)
    i2@72@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0102.vpr@41@12@41@100-aux|)))
(assert (forall ((i1@71@01 Int) (i2@72@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 n@65@01) i1@71@01)
      (and
        (Seq_contains (Seq_range 0 n@65@01) i1@71@01)
        (or
          (Seq_contains (Seq_range 0 n@65@01) i2@72@01)
          (not (Seq_contains (Seq_range 0 n@65@01) i2@72@01)))))
    (or
      (Seq_contains (Seq_range 0 n@65@01) i1@71@01)
      (not (Seq_contains (Seq_range 0 n@65@01) i1@71@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 n@65@01) i1@71@01)
        (and
          (Seq_contains (Seq_range 0 n@65@01) i2@72@01)
          (not (= i1@71@01 i2@72@01))))
      (and
        (Seq_contains (Seq_range 0 n@65@01) i1@71@01)
        (Seq_contains (Seq_range 0 n@65@01) i2@72@01)
        (not (= i1@71@01 i2@72@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 n@65@01) i1@71@01)
          (and
            (Seq_contains (Seq_range 0 n@65@01) i2@72@01)
            (not (= i1@71@01 i2@72@01)))))
      (and
        (Seq_contains (Seq_range 0 n@65@01) i1@71@01)
        (and
          (Seq_contains (Seq_range 0 n@65@01) i2@72@01)
          (not (= i1@71@01 i2@72@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@65@01) i1@71@01) (Seq_contains_trigger
    (Seq_range 0 n@65@01)
    i2@72@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0102.vpr@41@12@41@100-aux|)))
(assert (forall ((i1@71@01 Int) (i2@72@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 n@65@01) i1@71@01)
      (and
        (Seq_contains (Seq_range 0 n@65@01) i1@71@01)
        (or
          (Seq_contains (Seq_range 0 n@65@01) i2@72@01)
          (not (Seq_contains (Seq_range 0 n@65@01) i2@72@01)))))
    (or
      (Seq_contains (Seq_range 0 n@65@01) i1@71@01)
      (not (Seq_contains (Seq_range 0 n@65@01) i1@71@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 n@65@01) i1@71@01)
        (and
          (Seq_contains (Seq_range 0 n@65@01) i2@72@01)
          (not (= i1@71@01 i2@72@01))))
      (and
        (Seq_contains (Seq_range 0 n@65@01) i1@71@01)
        (Seq_contains (Seq_range 0 n@65@01) i2@72@01)
        (not (= i1@71@01 i2@72@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 n@65@01) i1@71@01)
          (and
            (Seq_contains (Seq_range 0 n@65@01) i2@72@01)
            (not (= i1@71@01 i2@72@01)))))
      (and
        (Seq_contains (Seq_range 0 n@65@01) i1@71@01)
        (and
          (Seq_contains (Seq_range 0 n@65@01) i2@72@01)
          (not (= i1@71@01 i2@72@01))))))
  :pattern ((Seq_contains (Seq_range 0 n@65@01) i1@71@01) (Seq_index
    xs@64@01
    i2@72@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@65@01) i1@71@01) (Seq_index
    xs@64@01
    i2@72@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0102.vpr@41@12@41@100-aux|)))
(assert (forall ((i1@71@01 Int) (i2@72@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 n@65@01) i1@71@01)
      (and
        (Seq_contains (Seq_range 0 n@65@01) i1@71@01)
        (or
          (Seq_contains (Seq_range 0 n@65@01) i2@72@01)
          (not (Seq_contains (Seq_range 0 n@65@01) i2@72@01)))))
    (or
      (Seq_contains (Seq_range 0 n@65@01) i1@71@01)
      (not (Seq_contains (Seq_range 0 n@65@01) i1@71@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 n@65@01) i1@71@01)
        (and
          (Seq_contains (Seq_range 0 n@65@01) i2@72@01)
          (not (= i1@71@01 i2@72@01))))
      (and
        (Seq_contains (Seq_range 0 n@65@01) i1@71@01)
        (Seq_contains (Seq_range 0 n@65@01) i2@72@01)
        (not (= i1@71@01 i2@72@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 n@65@01) i1@71@01)
          (and
            (Seq_contains (Seq_range 0 n@65@01) i2@72@01)
            (not (= i1@71@01 i2@72@01)))))
      (and
        (Seq_contains (Seq_range 0 n@65@01) i1@71@01)
        (and
          (Seq_contains (Seq_range 0 n@65@01) i2@72@01)
          (not (= i1@71@01 i2@72@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@65@01) i1@71@01) (Seq_index
    xs@64@01
    i2@72@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0102.vpr@41@12@41@100-aux|)))
(assert (forall ((i1@71@01 Int) (i2@72@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 n@65@01) i1@71@01)
      (and
        (Seq_contains (Seq_range 0 n@65@01) i1@71@01)
        (or
          (Seq_contains (Seq_range 0 n@65@01) i2@72@01)
          (not (Seq_contains (Seq_range 0 n@65@01) i2@72@01)))))
    (or
      (Seq_contains (Seq_range 0 n@65@01) i1@71@01)
      (not (Seq_contains (Seq_range 0 n@65@01) i1@71@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 n@65@01) i1@71@01)
        (and
          (Seq_contains (Seq_range 0 n@65@01) i2@72@01)
          (not (= i1@71@01 i2@72@01))))
      (and
        (Seq_contains (Seq_range 0 n@65@01) i1@71@01)
        (Seq_contains (Seq_range 0 n@65@01) i2@72@01)
        (not (= i1@71@01 i2@72@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 n@65@01) i1@71@01)
          (and
            (Seq_contains (Seq_range 0 n@65@01) i2@72@01)
            (not (= i1@71@01 i2@72@01)))))
      (and
        (Seq_contains (Seq_range 0 n@65@01) i1@71@01)
        (and
          (Seq_contains (Seq_range 0 n@65@01) i2@72@01)
          (not (= i1@71@01 i2@72@01))))))
  :pattern ((Seq_contains (Seq_range 0 n@65@01) i2@72@01) (Seq_index
    xs@64@01
    i1@71@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@65@01) i2@72@01) (Seq_index
    xs@64@01
    i1@71@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0102.vpr@41@12@41@100-aux|)))
(assert (forall ((i1@71@01 Int) (i2@72@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 n@65@01) i1@71@01)
      (and
        (Seq_contains (Seq_range 0 n@65@01) i1@71@01)
        (or
          (Seq_contains (Seq_range 0 n@65@01) i2@72@01)
          (not (Seq_contains (Seq_range 0 n@65@01) i2@72@01)))))
    (or
      (Seq_contains (Seq_range 0 n@65@01) i1@71@01)
      (not (Seq_contains (Seq_range 0 n@65@01) i1@71@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 n@65@01) i1@71@01)
        (and
          (Seq_contains (Seq_range 0 n@65@01) i2@72@01)
          (not (= i1@71@01 i2@72@01))))
      (and
        (Seq_contains (Seq_range 0 n@65@01) i1@71@01)
        (Seq_contains (Seq_range 0 n@65@01) i2@72@01)
        (not (= i1@71@01 i2@72@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 n@65@01) i1@71@01)
          (and
            (Seq_contains (Seq_range 0 n@65@01) i2@72@01)
            (not (= i1@71@01 i2@72@01)))))
      (and
        (Seq_contains (Seq_range 0 n@65@01) i1@71@01)
        (and
          (Seq_contains (Seq_range 0 n@65@01) i2@72@01)
          (not (= i1@71@01 i2@72@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@65@01) i2@72@01) (Seq_index
    xs@64@01
    i1@71@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0102.vpr@41@12@41@100-aux|)))
(assert (forall ((i1@71@01 Int) (i2@72@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 n@65@01) i1@71@01)
      (and
        (Seq_contains (Seq_range 0 n@65@01) i1@71@01)
        (or
          (Seq_contains (Seq_range 0 n@65@01) i2@72@01)
          (not (Seq_contains (Seq_range 0 n@65@01) i2@72@01)))))
    (or
      (Seq_contains (Seq_range 0 n@65@01) i1@71@01)
      (not (Seq_contains (Seq_range 0 n@65@01) i1@71@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 n@65@01) i1@71@01)
        (and
          (Seq_contains (Seq_range 0 n@65@01) i2@72@01)
          (not (= i1@71@01 i2@72@01))))
      (and
        (Seq_contains (Seq_range 0 n@65@01) i1@71@01)
        (Seq_contains (Seq_range 0 n@65@01) i2@72@01)
        (not (= i1@71@01 i2@72@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 n@65@01) i1@71@01)
          (and
            (Seq_contains (Seq_range 0 n@65@01) i2@72@01)
            (not (= i1@71@01 i2@72@01)))))
      (and
        (Seq_contains (Seq_range 0 n@65@01) i1@71@01)
        (and
          (Seq_contains (Seq_range 0 n@65@01) i2@72@01)
          (not (= i1@71@01 i2@72@01))))))
  :pattern ((Seq_index xs@64@01 i1@71@01) (Seq_index xs@64@01 i2@72@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0102.vpr@41@12@41@100-aux|)))
(assert (forall ((i1@71@01 Int) (i2@72@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 n@65@01) i1@71@01)
      (and
        (Seq_contains (Seq_range 0 n@65@01) i2@72@01)
        (not (= i1@71@01 i2@72@01))))
    (not (= (Seq_index xs@64@01 i1@71@01) (Seq_index xs@64@01 i2@72@01))))
  :pattern ((Seq_contains (Seq_range 0 n@65@01) i1@71@01) (Seq_contains
    (Seq_range 0 n@65@01)
    i2@72@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@65@01) i1@71@01) (Seq_contains_trigger
    (Seq_range 0 n@65@01)
    i2@72@01))
  :pattern ((Seq_contains (Seq_range 0 n@65@01) i1@71@01) (Seq_index
    xs@64@01
    i2@72@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@65@01) i1@71@01) (Seq_index
    xs@64@01
    i2@72@01))
  :pattern ((Seq_contains (Seq_range 0 n@65@01) i2@72@01) (Seq_index
    xs@64@01
    i1@71@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@65@01) i2@72@01) (Seq_index
    xs@64@01
    i1@71@01))
  :pattern ((Seq_index xs@64@01 i1@71@01) (Seq_index xs@64@01 i2@72@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0102.vpr@41@12@41@100|)))
(declare-const i@73@01 Int)
(push) ; 2
; [eval] (i in [0..n))
; [eval] [0..n)
(assert (Seq_contains (Seq_range 0 n@65@01) i@73@01))
; [eval] xs[i]
(push) ; 3
(assert (not (>= i@73@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@73@01 (Seq_length xs@64@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@74@01 ($Ref) Int)
(declare-fun img@75@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@73@01 Int) (i2@73@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 n@65@01) i1@73@01)
      (Seq_contains (Seq_range 0 n@65@01) i2@73@01)
      (= (Seq_index xs@64@01 i1@73@01) (Seq_index xs@64@01 i2@73@01)))
    (= i1@73@01 i2@73@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@73@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 n@65@01) i@73@01)
    (and
      (= (inv@74@01 (Seq_index xs@64@01 i@73@01)) i@73@01)
      (img@75@01 (Seq_index xs@64@01 i@73@01))))
  :pattern ((Seq_index xs@64@01 i@73@01))
  :qid |quant-u-24|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@75@01 r) (Seq_contains (Seq_range 0 n@65@01) (inv@74@01 r)))
    (= (Seq_index xs@64@01 (inv@74@01 r)) r))
  :pattern ((inv@74@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@73@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 n@65@01) i@73@01)
    (not (= (Seq_index xs@64@01 i@73@01) $Ref.null)))
  :pattern ((Seq_index xs@64@01 i@73@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@76@01 $Snap)
(assert (= $t@76@01 ($Snap.combine ($Snap.first $t@76@01) ($Snap.second $t@76@01))))
(declare-const i@77@01 Int)
(push) ; 3
; [eval] (i in [0..n))
; [eval] [0..n)
(assert (Seq_contains (Seq_range 0 n@65@01) i@77@01))
; [eval] xs[i]
(push) ; 4
(assert (not (>= i@77@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@77@01 (Seq_length xs@64@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [eval] (i < 2 ? write : 1 / 10)
; [eval] i < 2
(push) ; 4
; [then-branch: 14 | i@77@01 < 2 | live]
; [else-branch: 14 | !(i@77@01 < 2) | live]
(push) ; 5
; [then-branch: 14 | i@77@01 < 2]
(assert (< i@77@01 2))
(pop) ; 5
(push) ; 5
; [else-branch: 14 | !(i@77@01 < 2)]
(assert (not (< i@77@01 2)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (< i@77@01 2)) (< i@77@01 2)))
(pop) ; 3
(declare-fun inv@78@01 ($Ref) Int)
(declare-fun img@79@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@77@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 n@65@01) i@77@01)
    (or (not (< i@77@01 2)) (< i@77@01 2)))
  :pattern ((Seq_index xs@64@01 i@77@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@77@01 Int) (i2@77@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 n@65@01) i1@77@01)
      (Seq_contains (Seq_range 0 n@65@01) i2@77@01)
      (= (Seq_index xs@64@01 i1@77@01) (Seq_index xs@64@01 i2@77@01)))
    (= i1@77@01 i2@77@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@77@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 n@65@01) i@77@01)
    (and
      (= (inv@78@01 (Seq_index xs@64@01 i@77@01)) i@77@01)
      (img@79@01 (Seq_index xs@64@01 i@77@01))))
  :pattern ((Seq_index xs@64@01 i@77@01))
  :qid |quant-u-26|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@79@01 r) (Seq_contains (Seq_range 0 n@65@01) (inv@78@01 r)))
    (= (Seq_index xs@64@01 (inv@78@01 r)) r))
  :pattern ((inv@78@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((i@77@01 Int)) (!
  (<= $Perm.No (ite (< i@77@01 2) $Perm.Write (/ (to_real 1) (to_real 10))))
  :pattern ((Seq_index xs@64@01 i@77@01))
  :qid |f-permAtLeastZero|)))
; Field permissions are at most one
(assert (forall ((i@77@01 Int)) (!
  (<= (ite (< i@77@01 2) $Perm.Write (/ (to_real 1) (to_real 10))) $Perm.Write)
  :pattern ((Seq_index xs@64@01 i@77@01))
  :qid |f-permAtMostOne|)))
; Permission implies non-null receiver
(assert (forall ((i@77@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 n@65@01) i@77@01)
    (not (= (Seq_index xs@64@01 i@77@01) $Ref.null)))
  :pattern ((Seq_index xs@64@01 i@77@01))
  :qid |f-permImpliesNonNull|)))
(assert (=
  ($Snap.second $t@76@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@76@01))
    ($Snap.second ($Snap.second $t@76@01)))))
(assert (= ($Snap.first ($Snap.second $t@76@01)) $Snap.unit))
; [eval] (forall i: Int :: { (i in [2..n)) } { old(xs[i]) } (i in [2..n)) ==> xs[i].f == old(xs[i].f))
(declare-const i@80@01 Int)
(push) ; 3
; [eval] (i in [2..n)) ==> xs[i].f == old(xs[i].f)
; [eval] (i in [2..n))
; [eval] [2..n)
(push) ; 4
; [then-branch: 15 | i@80@01 in [2..n@65@01] | live]
; [else-branch: 15 | !(i@80@01 in [2..n@65@01]) | live]
(push) ; 5
; [then-branch: 15 | i@80@01 in [2..n@65@01]]
(assert (Seq_contains (Seq_range 2 n@65@01) i@80@01))
; [eval] xs[i].f == old(xs[i].f)
; [eval] xs[i]
(push) ; 6
(assert (not (>= i@80@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@80@01 (Seq_length xs@64@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (and
  (img@79@01 (Seq_index xs@64@01 i@80@01))
  (Seq_contains (Seq_range 0 n@65@01) (inv@78@01 (Seq_index xs@64@01 i@80@01))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] old(xs[i].f)
; [eval] xs[i]
(push) ; 6
(assert (not (>= i@80@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@80@01 (Seq_length xs@64@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(declare-const sm@81@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@66@01)
    (=
      ($FVF.lookup_f (as sm@81@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@81@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@69@01  $FVF<f>) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@67@01)
    (=
      ($FVF.lookup_f (as sm@81@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@70@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@81@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@70@01  $FVF<f>) r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@75@01 r) (Seq_contains (Seq_range 0 n@65@01) (inv@74@01 r)))
    (=
      ($FVF.lookup_f (as sm@81@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01)))))))) r)))
  :pattern (($FVF.lookup_f (as sm@81@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01)))))))) r))
  :qid |qp.fvfValDef6|)))
(declare-const pm@82@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@82@01  $FPM) r)
    (+
      (+
        (ite (= r x@66@01) (/ (to_real 9) (to_real 10)) $Perm.No)
        (ite (= r y@67@01) (/ (to_real 9) (to_real 10)) $Perm.No))
      (ite
        (and (img@75@01 r) (Seq_contains (Seq_range 0 n@65@01) (inv@74@01 r)))
        (/ (to_real 1) (to_real 10))
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@82@01  $FPM) r))
  :qid |qp.resPrmSumDef7|)))
(push) ; 6
(assert (not (< $Perm.No ($FVF.perm_f (as pm@82@01  $FPM) (Seq_index xs@64@01 i@80@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 15 | !(i@80@01 in [2..n@65@01])]
(assert (not (Seq_contains (Seq_range 2 n@65@01) i@80@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@66@01)
    (=
      ($FVF.lookup_f (as sm@81@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@81@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@69@01  $FVF<f>) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@67@01)
    (=
      ($FVF.lookup_f (as sm@81@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@70@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@81@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@70@01  $FVF<f>) r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@75@01 r) (Seq_contains (Seq_range 0 n@65@01) (inv@74@01 r)))
    (=
      ($FVF.lookup_f (as sm@81@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01)))))))) r)))
  :pattern (($FVF.lookup_f (as sm@81@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01)))))))) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@82@01  $FPM) r)
    (+
      (+
        (ite (= r x@66@01) (/ (to_real 9) (to_real 10)) $Perm.No)
        (ite (= r y@67@01) (/ (to_real 9) (to_real 10)) $Perm.No))
      (ite
        (and (img@75@01 r) (Seq_contains (Seq_range 0 n@65@01) (inv@74@01 r)))
        (/ (to_real 1) (to_real 10))
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@82@01  $FPM) r))
  :qid |qp.resPrmSumDef7|)))
; Joined path conditions
(assert (or
  (not (Seq_contains (Seq_range 2 n@65@01) i@80@01))
  (Seq_contains (Seq_range 2 n@65@01) i@80@01)))
; [eval] old(xs[i])
; [eval] xs[i]
(push) ; 4
(assert (not (>= i@80@01 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@66@01)
    (=
      ($FVF.lookup_f (as sm@81@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@81@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@69@01  $FVF<f>) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@67@01)
    (=
      ($FVF.lookup_f (as sm@81@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@70@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@81@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@70@01  $FVF<f>) r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@75@01 r) (Seq_contains (Seq_range 0 n@65@01) (inv@74@01 r)))
    (=
      ($FVF.lookup_f (as sm@81@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01)))))))) r)))
  :pattern (($FVF.lookup_f (as sm@81@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01)))))))) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@82@01  $FPM) r)
    (+
      (+
        (ite (= r x@66@01) (/ (to_real 9) (to_real 10)) $Perm.No)
        (ite (= r y@67@01) (/ (to_real 9) (to_real 10)) $Perm.No))
      (ite
        (and (img@75@01 r) (Seq_contains (Seq_range 0 n@65@01) (inv@74@01 r)))
        (/ (to_real 1) (to_real 10))
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@82@01  $FPM) r))
  :qid |qp.resPrmSumDef7|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@80@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 2 n@65@01) i@80@01))
    (Seq_contains (Seq_range 2 n@65@01) i@80@01))
  :pattern ((Seq_contains (Seq_range 2 n@65@01) i@80@01))
  :pattern ((Seq_contains_trigger (Seq_range 2 n@65@01) i@80@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0102.vpr@45@12@45@68-aux|)))
(assert (forall ((i@80@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 2 n@65@01) i@80@01))
    (Seq_contains (Seq_range 2 n@65@01) i@80@01))
  :pattern ((Seq_contains_trigger (Seq_range 2 n@65@01) i@80@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0102.vpr@45@12@45@68-aux|)))
(assert (forall ((i@80@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 2 n@65@01) i@80@01))
    (Seq_contains (Seq_range 2 n@65@01) i@80@01))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0102.vpr@45@12@45@68-aux|)))
(assert (forall ((i@80@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 2 n@65@01) i@80@01)
    (=
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@76@01)) (Seq_index
        xs@64@01
        i@80@01))
      ($FVF.lookup_f (as sm@81@01  $FVF<f>) (Seq_index xs@64@01 i@80@01))))
  :pattern ((Seq_contains (Seq_range 2 n@65@01) i@80@01))
  :pattern ((Seq_contains_trigger (Seq_range 2 n@65@01) i@80@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0102.vpr@45@12@45@68|)))
(assert (=
  ($Snap.second ($Snap.second $t@76@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@76@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@76@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@76@01))) $Snap.unit))
; [eval] xs[0].f == old(xs[1].f) + 1
; [eval] xs[0]
(push) ; 3
(assert (not (< 0 (Seq_length xs@64@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (and
  (img@79@01 (Seq_index xs@64@01 0))
  (Seq_contains (Seq_range 0 n@65@01) (inv@78@01 (Seq_index xs@64@01 0))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] old(xs[1].f) + 1
; [eval] old(xs[1].f)
; [eval] xs[1]
(push) ; 3
(assert (not (< 1 (Seq_length xs@64@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r x@66@01)
      (=
        ($FVF.lookup_f (as sm@81@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@69@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@81@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@69@01  $FVF<f>) r))
    :qid |qp.fvfValDef4|))
  (forall ((r $Ref)) (!
    (=>
      (= r y@67@01)
      (=
        ($FVF.lookup_f (as sm@81@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@70@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@81@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@70@01  $FVF<f>) r))
    :qid |qp.fvfValDef5|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@75@01 r) (Seq_contains (Seq_range 0 n@65@01) (inv@74@01 r)))
      (=
        ($FVF.lookup_f (as sm@81@01  $FVF<f>) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01)))))))) r)))
    :pattern (($FVF.lookup_f (as sm@81@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01)))))))) r))
    :qid |qp.fvfValDef6|))))
(push) ; 3
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (= (Seq_index xs@64@01 1) x@66@01)
        (/ (to_real 9) (to_real 10))
        $Perm.No)
      (ite
        (= (Seq_index xs@64@01 1) y@67@01)
        (/ (to_real 9) (to_real 10))
        $Perm.No))
    (ite
      (and
        (img@75@01 (Seq_index xs@64@01 1))
        (Seq_contains (Seq_range 0 n@65@01) (inv@74@01 (Seq_index xs@64@01 1))))
      (/ (to_real 1) (to_real 10))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@76@01)) (Seq_index
    xs@64@01
    0))
  (+ ($FVF.lookup_f (as sm@81@01  $FVF<f>) (Seq_index xs@64@01 1)) 1)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@76@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@76@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@76@01))))
  $Snap.unit))
; [eval] xs[1].f == old(xs[1].f) + 2
; [eval] xs[1]
(push) ; 3
(assert (not (< 1 (Seq_length xs@64@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (and
  (img@79@01 (Seq_index xs@64@01 1))
  (Seq_contains (Seq_range 0 n@65@01) (inv@78@01 (Seq_index xs@64@01 1))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] old(xs[1].f) + 2
; [eval] old(xs[1].f)
; [eval] xs[1]
(push) ; 3
(assert (not (< 1 (Seq_length xs@64@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r x@66@01)
      (=
        ($FVF.lookup_f (as sm@81@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@69@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@81@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@69@01  $FVF<f>) r))
    :qid |qp.fvfValDef4|))
  (forall ((r $Ref)) (!
    (=>
      (= r y@67@01)
      (=
        ($FVF.lookup_f (as sm@81@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@70@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@81@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@70@01  $FVF<f>) r))
    :qid |qp.fvfValDef5|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@75@01 r) (Seq_contains (Seq_range 0 n@65@01) (inv@74@01 r)))
      (=
        ($FVF.lookup_f (as sm@81@01  $FVF<f>) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01)))))))) r)))
    :pattern (($FVF.lookup_f (as sm@81@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01)))))))) r))
    :qid |qp.fvfValDef6|))))
(push) ; 3
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (= (Seq_index xs@64@01 1) x@66@01)
        (/ (to_real 9) (to_real 10))
        $Perm.No)
      (ite
        (= (Seq_index xs@64@01 1) y@67@01)
        (/ (to_real 9) (to_real 10))
        $Perm.No))
    (ite
      (and
        (img@75@01 (Seq_index xs@64@01 1))
        (Seq_contains (Seq_range 0 n@65@01) (inv@74@01 (Seq_index xs@64@01 1))))
      (/ (to_real 1) (to_real 10))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@76@01)) (Seq_index
    xs@64@01
    1))
  (+ ($FVF.lookup_f (as sm@81@01  $FVF<f>) (Seq_index xs@64@01 1)) 2)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@76@01))))
  $Snap.unit))
(assert false)
(pop) ; 2
(push) ; 2
; [exec]
; xs[0].f := y.f + 1
; [eval] xs[0]
(push) ; 3
(assert (not (< 0 (Seq_length xs@64@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] y.f + 1
(declare-const sm@83@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@66@01)
    (=
      ($FVF.lookup_f (as sm@83@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@83@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@69@01  $FVF<f>) r))
  :qid |qp.fvfValDef8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@67@01)
    (=
      ($FVF.lookup_f (as sm@83@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@70@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@83@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@70@01  $FVF<f>) r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@75@01 r) (Seq_contains (Seq_range 0 n@65@01) (inv@74@01 r)))
    (=
      ($FVF.lookup_f (as sm@83@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01)))))))) r)))
  :pattern (($FVF.lookup_f (as sm@83@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01)))))))) r))
  :qid |qp.fvfValDef10|)))
(declare-const pm@84@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@84@01  $FPM) r)
    (+
      (+
        (ite (= r x@66@01) (/ (to_real 9) (to_real 10)) $Perm.No)
        (ite (= r y@67@01) (/ (to_real 9) (to_real 10)) $Perm.No))
      (ite
        (and (img@75@01 r) (Seq_contains (Seq_range 0 n@65@01) (inv@74@01 r)))
        (/ (to_real 1) (to_real 10))
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@84@01  $FPM) r))
  :qid |qp.resPrmSumDef11|)))
(push) ; 3
(assert (not (< $Perm.No ($FVF.perm_f (as pm@84@01  $FPM) y@67@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (= x@66@01 (Seq_index xs@64@01 0))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@85@01 ((r $Ref)) $Perm
  (ite
    (= r (Seq_index xs@64@01 0))
    ($Perm.min
      (ite (= r x@66@01) (/ (to_real 9) (to_real 10)) $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@86@01 ((r $Ref)) $Perm
  (ite
    (= r (Seq_index xs@64@01 0))
    ($Perm.min
      (ite (= r y@67@01) (/ (to_real 9) (to_real 10)) $Perm.No)
      (- $Perm.Write (pTaken@85@01 r)))
    $Perm.No))
(define-fun pTaken@87@01 ((r $Ref)) $Perm
  (ite
    (= r (Seq_index xs@64@01 0))
    ($Perm.min
      (ite
        (and (img@75@01 r) (Seq_contains (Seq_range 0 n@65@01) (inv@74@01 r)))
        (/ (to_real 1) (to_real 10))
        $Perm.No)
      (- (- $Perm.Write (pTaken@85@01 r)) (pTaken@86@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (= (- (/ (to_real 9) (to_real 10)) (pTaken@85@01 x@66@01)) $Perm.No)))
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
  (=> (= r (Seq_index xs@64@01 0)) (= (- $Perm.Write (pTaken@85@01 r)) $Perm.No))
  
  :qid |quant-u-29|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (= (- (/ (to_real 9) (to_real 10)) (pTaken@86@01 y@67@01)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@86@01 r) $Perm.No)
  
  :qid |quant-u-31|))))
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
    (= r (Seq_index xs@64@01 0))
    (= (- (- $Perm.Write (pTaken@85@01 r)) (pTaken@86@01 r)) $Perm.No))
  
  :qid |quant-u-32|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@75@01 r) (Seq_contains (Seq_range 0 n@65@01) (inv@74@01 r)))
        (/ (to_real 1) (to_real 10))
        $Perm.No)
      (pTaken@87@01 r))
    $Perm.No)
  
  :qid |quant-u-33|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@87@01 r) $Perm.No)
  
  :qid |quant-u-34|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@64@01 0))
    (=
      (- (- (- $Perm.Write (pTaken@85@01 r)) (pTaken@86@01 r)) (pTaken@87@01 r))
      $Perm.No))
  
  :qid |quant-u-35|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@88@01 $FVF<f>)
; Definitional axioms for singleton-FVF's value
(assert (=
  ($FVF.lookup_f (as sm@88@01  $FVF<f>) (Seq_index xs@64@01 0))
  (+ ($FVF.lookup_f (as sm@83@01  $FVF<f>) y@67@01) 1)))
; [exec]
; xs[1].f := x.f + 1
; [eval] xs[1]
(set-option :timeout 0)
(push) ; 3
(assert (not (< 1 (Seq_length xs@64@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] x.f + 1
(declare-const sm@89@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@64@01 0))
    (=
      ($FVF.lookup_f (as sm@89@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@88@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@89@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@88@01  $FVF<f>) r))
  :qid |qp.fvfValDef12|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@75@01 r) (Seq_contains (Seq_range 0 n@65@01) (inv@74@01 r)))
      (< $Perm.No (- (/ (to_real 1) (to_real 10)) (pTaken@87@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@89@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01)))))))) r)))
  :pattern (($FVF.lookup_f (as sm@89@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01)))))))) r))
  :qid |qp.fvfValDef13|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@67@01)
    (=
      ($FVF.lookup_f (as sm@89@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@70@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@89@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@70@01  $FVF<f>) r))
  :qid |qp.fvfValDef14|)))
(declare-const pm@90@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@90@01  $FPM) r)
    (+
      (+
        (ite (= r (Seq_index xs@64@01 0)) $Perm.Write $Perm.No)
        (ite
          (and (img@75@01 r) (Seq_contains (Seq_range 0 n@65@01) (inv@74@01 r)))
          (- (/ (to_real 1) (to_real 10)) (pTaken@87@01 r))
          $Perm.No))
      (ite (= r y@67@01) (/ (to_real 9) (to_real 10)) $Perm.No)))
  :pattern (($FVF.perm_f (as pm@90@01  $FPM) r))
  :qid |qp.resPrmSumDef15|)))
(push) ; 3
(assert (not (< $Perm.No ($FVF.perm_f (as pm@90@01  $FPM) x@66@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (Seq_index xs@64@01 0) (Seq_index xs@64@01 1))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= y@67@01 (Seq_index xs@64@01 1))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@91@01 ((r $Ref)) $Perm
  (ite
    (= r (Seq_index xs@64@01 1))
    ($Perm.min
      (ite (= r y@67@01) (/ (to_real 9) (to_real 10)) $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@92@01 ((r $Ref)) $Perm
  (ite
    (= r (Seq_index xs@64@01 1))
    ($Perm.min
      (ite (= r (Seq_index xs@64@01 0)) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@91@01 r)))
    $Perm.No))
(define-fun pTaken@93@01 ((r $Ref)) $Perm
  (ite
    (= r (Seq_index xs@64@01 1))
    ($Perm.min
      (ite
        (and (img@75@01 r) (Seq_contains (Seq_range 0 n@65@01) (inv@74@01 r)))
        (- (/ (to_real 1) (to_real 10)) (pTaken@87@01 r))
        $Perm.No)
      (- (- $Perm.Write (pTaken@91@01 r)) (pTaken@92@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (= (- (/ (to_real 9) (to_real 10)) (pTaken@91@01 y@67@01)) $Perm.No)))
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
  (=> (= r (Seq_index xs@64@01 1)) (= (- $Perm.Write (pTaken@91@01 r)) $Perm.No))
  
  :qid |quant-u-38|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (=
  (-
    (ite (= (Seq_index xs@64@01 0) (Seq_index xs@64@01 0)) $Perm.Write $Perm.No)
    (pTaken@92@01 (Seq_index xs@64@01 0)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@92@01 r) $Perm.No)
  
  :qid |quant-u-40|))))
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
    (= r (Seq_index xs@64@01 1))
    (= (- (- $Perm.Write (pTaken@91@01 r)) (pTaken@92@01 r)) $Perm.No))
  
  :qid |quant-u-41|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and (img@75@01 r) (Seq_contains (Seq_range 0 n@65@01) (inv@74@01 r)))
        (- (/ (to_real 1) (to_real 10)) (pTaken@87@01 r))
        $Perm.No)
      (pTaken@93@01 r))
    $Perm.No)
  
  :qid |quant-u-42|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@93@01 r) $Perm.No)
  
  :qid |quant-u-43|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@64@01 1))
    (=
      (- (- (- $Perm.Write (pTaken@91@01 r)) (pTaken@92@01 r)) (pTaken@93@01 r))
      $Perm.No))
  
  :qid |quant-u-44|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@94@01 $FVF<f>)
; Definitional axioms for singleton-FVF's value
(assert (=
  ($FVF.lookup_f (as sm@94@01  $FVF<f>) (Seq_index xs@64@01 1))
  (+ ($FVF.lookup_f (as sm@89@01  $FVF<f>) x@66@01) 1)))
(declare-const i@95@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (i in [0..n))
; [eval] [0..n)
(assert (Seq_contains (Seq_range 0 n@65@01) i@95@01))
; [eval] (i < 2 ? write : 1 / 10)
; [eval] i < 2
(push) ; 4
; [then-branch: 16 | i@95@01 < 2 | live]
; [else-branch: 16 | !(i@95@01 < 2) | live]
(push) ; 5
; [then-branch: 16 | i@95@01 < 2]
(assert (< i@95@01 2))
(pop) ; 5
(push) ; 5
; [else-branch: 16 | !(i@95@01 < 2)]
(assert (not (< i@95@01 2)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (< i@95@01 2)) (< i@95@01 2)))
; [eval] xs[i]
(push) ; 4
(assert (not (>= i@95@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@95@01 (Seq_length xs@64@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@96@01 ($Ref) Int)
(declare-fun img@97@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@95@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 n@65@01) i@95@01)
    (or (not (< i@95@01 2)) (< i@95@01 2)))
  :pattern ((Seq_index xs@64@01 i@95@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@95@01 Int) (i2@95@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 n@65@01) i1@95@01)
      (Seq_contains (Seq_range 0 n@65@01) i2@95@01)
      (= (Seq_index xs@64@01 i1@95@01) (Seq_index xs@64@01 i2@95@01)))
    (= i1@95@01 i2@95@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@95@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 n@65@01) i@95@01)
    (and
      (= (inv@96@01 (Seq_index xs@64@01 i@95@01)) i@95@01)
      (img@97@01 (Seq_index xs@64@01 i@95@01))))
  :pattern ((Seq_index xs@64@01 i@95@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@97@01 r) (Seq_contains (Seq_range 0 n@65@01) (inv@96@01 r)))
    (= (Seq_index xs@64@01 (inv@96@01 r)) r))
  :pattern ((inv@96@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@98@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 n@65@01) (inv@96@01 r))
      (img@97@01 r)
      (= r (Seq_index xs@64@01 (inv@96@01 r))))
    ($Perm.min
      (ite
        (and (img@75@01 r) (Seq_contains (Seq_range 0 n@65@01) (inv@74@01 r)))
        (- (- (/ (to_real 1) (to_real 10)) (pTaken@87@01 r)) (pTaken@93@01 r))
        $Perm.No)
      (ite (< (inv@96@01 r) 2) $Perm.Write (/ (to_real 1) (to_real 10))))
    $Perm.No))
(define-fun pTaken@99@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 n@65@01) (inv@96@01 r))
      (img@97@01 r)
      (= r (Seq_index xs@64@01 (inv@96@01 r))))
    ($Perm.min
      (ite (= r (Seq_index xs@64@01 1)) $Perm.Write $Perm.No)
      (-
        (ite (< (inv@96@01 r) 2) $Perm.Write (/ (to_real 1) (to_real 10)))
        (pTaken@98@01 r)))
    $Perm.No))
(define-fun pTaken@100@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 n@65@01) (inv@96@01 r))
      (img@97@01 r)
      (= r (Seq_index xs@64@01 (inv@96@01 r))))
    ($Perm.min
      (ite (= r (Seq_index xs@64@01 0)) $Perm.Write $Perm.No)
      (-
        (-
          (ite (< (inv@96@01 r) 2) $Perm.Write (/ (to_real 1) (to_real 10)))
          (pTaken@98@01 r))
        (pTaken@99@01 r)))
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
        (and (img@75@01 r) (Seq_contains (Seq_range 0 n@65@01) (inv@74@01 r)))
        (- (- (/ (to_real 1) (to_real 10)) (pTaken@87@01 r)) (pTaken@93@01 r))
        $Perm.No)
      (pTaken@98@01 r))
    $Perm.No)
  
  :qid |quant-u-47|))))
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
      (Seq_contains (Seq_range 0 n@65@01) (inv@96@01 r))
      (img@97@01 r)
      (= r (Seq_index xs@64@01 (inv@96@01 r))))
    (=
      (-
        (ite (< (inv@96@01 r) 2) $Perm.Write (/ (to_real 1) (to_real 10)))
        (pTaken@98@01 r))
      $Perm.No))
  
  :qid |quant-u-48|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (=
  (-
    (ite (= (Seq_index xs@64@01 1) (Seq_index xs@64@01 1)) $Perm.Write $Perm.No)
    (pTaken@99@01 (Seq_index xs@64@01 1)))
  $Perm.No)))
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
      (Seq_contains (Seq_range 0 n@65@01) (inv@96@01 r))
      (img@97@01 r)
      (= r (Seq_index xs@64@01 (inv@96@01 r))))
    (=
      (-
        (-
          (ite (< (inv@96@01 r) 2) $Perm.Write (/ (to_real 1) (to_real 10)))
          (pTaken@98@01 r))
        (pTaken@99@01 r))
      $Perm.No))
  
  :qid |quant-u-50|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (=
  (-
    (ite (= (Seq_index xs@64@01 0) (Seq_index xs@64@01 0)) $Perm.Write $Perm.No)
    (pTaken@100@01 (Seq_index xs@64@01 0)))
  $Perm.No)))
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
      (Seq_contains (Seq_range 0 n@65@01) (inv@96@01 r))
      (img@97@01 r)
      (= r (Seq_index xs@64@01 (inv@96@01 r))))
    (=
      (-
        (-
          (-
            (ite (< (inv@96@01 r) 2) $Perm.Write (/ (to_real 1) (to_real 10)))
            (pTaken@98@01 r))
          (pTaken@99@01 r))
        (pTaken@100@01 r))
      $Perm.No))
  
  :qid |quant-u-52|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@101@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@64@01 1))
    (=
      ($FVF.lookup_f (as sm@101@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@94@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@101@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@94@01  $FVF<f>) r))
  :qid |qp.fvfValDef16|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@75@01 r) (Seq_contains (Seq_range 0 n@65@01) (inv@74@01 r)))
      (<
        $Perm.No
        (- (- (/ (to_real 1) (to_real 10)) (pTaken@87@01 r)) (pTaken@93@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@101@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01)))))))) r)))
  :pattern (($FVF.lookup_f (as sm@101@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01)))))))) r))
  :qid |qp.fvfValDef17|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@64@01 0))
    (=
      ($FVF.lookup_f (as sm@101@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@88@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@101@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@88@01  $FVF<f>) r))
  :qid |qp.fvfValDef18|)))
; [eval] (forall i: Int :: { (i in [2..n)) } { old(xs[i]) } (i in [2..n)) ==> xs[i].f == old(xs[i].f))
(declare-const i@102@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (i in [2..n)) ==> xs[i].f == old(xs[i].f)
; [eval] (i in [2..n))
; [eval] [2..n)
(push) ; 4
; [then-branch: 17 | i@102@01 in [2..n@65@01] | live]
; [else-branch: 17 | !(i@102@01 in [2..n@65@01]) | live]
(push) ; 5
; [then-branch: 17 | i@102@01 in [2..n@65@01]]
(assert (Seq_contains (Seq_range 2 n@65@01) i@102@01))
; [eval] xs[i].f == old(xs[i].f)
; [eval] xs[i]
(push) ; 6
(assert (not (>= i@102@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@102@01 (Seq_length xs@64@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r (Seq_index xs@64@01 1))
      (=
        ($FVF.lookup_f (as sm@101@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@94@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@101@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@94@01  $FVF<f>) r))
    :qid |qp.fvfValDef16|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and (img@75@01 r) (Seq_contains (Seq_range 0 n@65@01) (inv@74@01 r)))
        (<
          $Perm.No
          (- (- (/ (to_real 1) (to_real 10)) (pTaken@87@01 r)) (pTaken@93@01 r)))
        false)
      (=
        ($FVF.lookup_f (as sm@101@01  $FVF<f>) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01)))))))) r)))
    :pattern (($FVF.lookup_f (as sm@101@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01)))))))) r))
    :qid |qp.fvfValDef17|))
  (forall ((r $Ref)) (!
    (=>
      (= r (Seq_index xs@64@01 0))
      (=
        ($FVF.lookup_f (as sm@101@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@88@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@101@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@88@01  $FVF<f>) r))
    :qid |qp.fvfValDef18|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (= (Seq_index xs@64@01 i@102@01) (Seq_index xs@64@01 1))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@75@01 (Seq_index xs@64@01 i@102@01))
          (Seq_contains
            (Seq_range 0 n@65@01)
            (inv@74@01 (Seq_index xs@64@01 i@102@01))))
        (-
          (-
            (/ (to_real 1) (to_real 10))
            (pTaken@87@01 (Seq_index xs@64@01 i@102@01)))
          (pTaken@93@01 (Seq_index xs@64@01 i@102@01)))
        $Perm.No))
    (ite
      (= (Seq_index xs@64@01 i@102@01) (Seq_index xs@64@01 0))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] old(xs[i].f)
; [eval] xs[i]
(push) ; 6
(assert (not (>= i@102@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@102@01 (Seq_length xs@64@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r x@66@01)
      (=
        ($FVF.lookup_f (as sm@83@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@69@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@83@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@69@01  $FVF<f>) r))
    :qid |qp.fvfValDef8|))
  (forall ((r $Ref)) (!
    (=>
      (= r y@67@01)
      (=
        ($FVF.lookup_f (as sm@83@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@70@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@83@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@70@01  $FVF<f>) r))
    :qid |qp.fvfValDef9|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@75@01 r) (Seq_contains (Seq_range 0 n@65@01) (inv@74@01 r)))
      (=
        ($FVF.lookup_f (as sm@83@01  $FVF<f>) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01)))))))) r)))
    :pattern (($FVF.lookup_f (as sm@83@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01)))))))) r))
    :qid |qp.fvfValDef10|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (= (Seq_index xs@64@01 i@102@01) x@66@01)
        (/ (to_real 9) (to_real 10))
        $Perm.No)
      (ite
        (= (Seq_index xs@64@01 i@102@01) y@67@01)
        (/ (to_real 9) (to_real 10))
        $Perm.No))
    (ite
      (and
        (img@75@01 (Seq_index xs@64@01 i@102@01))
        (Seq_contains
          (Seq_range 0 n@65@01)
          (inv@74@01 (Seq_index xs@64@01 i@102@01))))
      (/ (to_real 1) (to_real 10))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 17 | !(i@102@01 in [2..n@65@01])]
(assert (not (Seq_contains (Seq_range 2 n@65@01) i@102@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@64@01 1))
    (=
      ($FVF.lookup_f (as sm@101@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@94@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@101@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@94@01  $FVF<f>) r))
  :qid |qp.fvfValDef16|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@75@01 r) (Seq_contains (Seq_range 0 n@65@01) (inv@74@01 r)))
      (<
        $Perm.No
        (- (- (/ (to_real 1) (to_real 10)) (pTaken@87@01 r)) (pTaken@93@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@101@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01)))))))) r)))
  :pattern (($FVF.lookup_f (as sm@101@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01)))))))) r))
  :qid |qp.fvfValDef17|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@64@01 0))
    (=
      ($FVF.lookup_f (as sm@101@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@88@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@101@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@88@01  $FVF<f>) r))
  :qid |qp.fvfValDef18|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@66@01)
    (=
      ($FVF.lookup_f (as sm@83@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@83@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@69@01  $FVF<f>) r))
  :qid |qp.fvfValDef8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@67@01)
    (=
      ($FVF.lookup_f (as sm@83@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@70@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@83@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@70@01  $FVF<f>) r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@75@01 r) (Seq_contains (Seq_range 0 n@65@01) (inv@74@01 r)))
    (=
      ($FVF.lookup_f (as sm@83@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01)))))))) r)))
  :pattern (($FVF.lookup_f (as sm@83@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01)))))))) r))
  :qid |qp.fvfValDef10|)))
; Joined path conditions
(assert (or
  (not (Seq_contains (Seq_range 2 n@65@01) i@102@01))
  (Seq_contains (Seq_range 2 n@65@01) i@102@01)))
; [eval] old(xs[i])
; [eval] xs[i]
(push) ; 4
(assert (not (>= i@102@01 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@64@01 1))
    (=
      ($FVF.lookup_f (as sm@101@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@94@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@101@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@94@01  $FVF<f>) r))
  :qid |qp.fvfValDef16|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@75@01 r) (Seq_contains (Seq_range 0 n@65@01) (inv@74@01 r)))
      (<
        $Perm.No
        (- (- (/ (to_real 1) (to_real 10)) (pTaken@87@01 r)) (pTaken@93@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@101@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01)))))))) r)))
  :pattern (($FVF.lookup_f (as sm@101@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01)))))))) r))
  :qid |qp.fvfValDef17|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index xs@64@01 0))
    (=
      ($FVF.lookup_f (as sm@101@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@88@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@101@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@88@01  $FVF<f>) r))
  :qid |qp.fvfValDef18|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r x@66@01)
    (=
      ($FVF.lookup_f (as sm@83@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@69@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@83@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@69@01  $FVF<f>) r))
  :qid |qp.fvfValDef8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r y@67@01)
    (=
      ($FVF.lookup_f (as sm@83@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@70@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@83@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@70@01  $FVF<f>) r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@75@01 r) (Seq_contains (Seq_range 0 n@65@01) (inv@74@01 r)))
    (=
      ($FVF.lookup_f (as sm@83@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01)))))))) r)))
  :pattern (($FVF.lookup_f (as sm@83@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01)))))))) r))
  :qid |qp.fvfValDef10|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@102@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 2 n@65@01) i@102@01))
    (Seq_contains (Seq_range 2 n@65@01) i@102@01))
  :pattern ((Seq_contains (Seq_range 2 n@65@01) i@102@01))
  :pattern ((Seq_contains_trigger (Seq_range 2 n@65@01) i@102@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0102.vpr@45@12@45@68-aux|)))
(assert (forall ((i@102@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 2 n@65@01) i@102@01))
    (Seq_contains (Seq_range 2 n@65@01) i@102@01))
  :pattern ((Seq_contains_trigger (Seq_range 2 n@65@01) i@102@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0102.vpr@45@12@45@68-aux|)))
(assert (forall ((i@102@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 2 n@65@01) i@102@01))
    (Seq_contains (Seq_range 2 n@65@01) i@102@01))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0102.vpr@45@12@45@68-aux|)))
(push) ; 3
(assert (not (forall ((i@102@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 2 n@65@01) i@102@01)
    (=
      ($FVF.lookup_f (as sm@101@01  $FVF<f>) (Seq_index xs@64@01 i@102@01))
      ($FVF.lookup_f (as sm@83@01  $FVF<f>) (Seq_index xs@64@01 i@102@01))))
  :pattern ((Seq_contains (Seq_range 2 n@65@01) i@102@01))
  :pattern ((Seq_contains_trigger (Seq_range 2 n@65@01) i@102@01))
  :pattern ((Seq_contains_trigger (Seq_range 2 n@65@01) i@102@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0102.vpr@45@12@45@68|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@102@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 2 n@65@01) i@102@01)
    (=
      ($FVF.lookup_f (as sm@101@01  $FVF<f>) (Seq_index xs@64@01 i@102@01))
      ($FVF.lookup_f (as sm@83@01  $FVF<f>) (Seq_index xs@64@01 i@102@01))))
  :pattern ((Seq_contains (Seq_range 2 n@65@01) i@102@01))
  :pattern ((Seq_contains_trigger (Seq_range 2 n@65@01) i@102@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0102.vpr@45@12@45@68|)))
; [eval] xs[0].f == old(xs[1].f) + 1
; [eval] xs[0]
(push) ; 3
(assert (not (< 0 (Seq_length xs@64@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r (Seq_index xs@64@01 1))
      (=
        ($FVF.lookup_f (as sm@101@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@94@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@101@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@94@01  $FVF<f>) r))
    :qid |qp.fvfValDef16|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and (img@75@01 r) (Seq_contains (Seq_range 0 n@65@01) (inv@74@01 r)))
        (<
          $Perm.No
          (- (- (/ (to_real 1) (to_real 10)) (pTaken@87@01 r)) (pTaken@93@01 r)))
        false)
      (=
        ($FVF.lookup_f (as sm@101@01  $FVF<f>) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01)))))))) r)))
    :pattern (($FVF.lookup_f (as sm@101@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01)))))))) r))
    :qid |qp.fvfValDef17|))
  (forall ((r $Ref)) (!
    (=>
      (= r (Seq_index xs@64@01 0))
      (=
        ($FVF.lookup_f (as sm@101@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@88@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@101@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@88@01  $FVF<f>) r))
    :qid |qp.fvfValDef18|))))
(push) ; 3
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (= (Seq_index xs@64@01 0) (Seq_index xs@64@01 1))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@75@01 (Seq_index xs@64@01 0))
          (Seq_contains (Seq_range 0 n@65@01) (inv@74@01 (Seq_index xs@64@01 0))))
        (-
          (- (/ (to_real 1) (to_real 10)) (pTaken@87@01 (Seq_index xs@64@01 0)))
          (pTaken@93@01 (Seq_index xs@64@01 0)))
        $Perm.No))
    (ite (= (Seq_index xs@64@01 0) (Seq_index xs@64@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] old(xs[1].f) + 1
; [eval] old(xs[1].f)
; [eval] xs[1]
(push) ; 3
(assert (not (< 1 (Seq_length xs@64@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r x@66@01)
      (=
        ($FVF.lookup_f (as sm@83@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@69@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@83@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@69@01  $FVF<f>) r))
    :qid |qp.fvfValDef8|))
  (forall ((r $Ref)) (!
    (=>
      (= r y@67@01)
      (=
        ($FVF.lookup_f (as sm@83@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@70@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@83@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@70@01  $FVF<f>) r))
    :qid |qp.fvfValDef9|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@75@01 r) (Seq_contains (Seq_range 0 n@65@01) (inv@74@01 r)))
      (=
        ($FVF.lookup_f (as sm@83@01  $FVF<f>) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01)))))))) r)))
    :pattern (($FVF.lookup_f (as sm@83@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01)))))))) r))
    :qid |qp.fvfValDef10|))))
(push) ; 3
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (= (Seq_index xs@64@01 1) x@66@01)
        (/ (to_real 9) (to_real 10))
        $Perm.No)
      (ite
        (= (Seq_index xs@64@01 1) y@67@01)
        (/ (to_real 9) (to_real 10))
        $Perm.No))
    (ite
      (and
        (img@75@01 (Seq_index xs@64@01 1))
        (Seq_contains (Seq_range 0 n@65@01) (inv@74@01 (Seq_index xs@64@01 1))))
      (/ (to_real 1) (to_real 10))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (=
  ($FVF.lookup_f (as sm@101@01  $FVF<f>) (Seq_index xs@64@01 0))
  (+ ($FVF.lookup_f (as sm@83@01  $FVF<f>) (Seq_index xs@64@01 1)) 1))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($FVF.lookup_f (as sm@101@01  $FVF<f>) (Seq_index xs@64@01 0))
  (+ ($FVF.lookup_f (as sm@83@01  $FVF<f>) (Seq_index xs@64@01 1)) 1)))
; [eval] xs[1].f == old(xs[1].f) + 2
; [eval] xs[1]
(push) ; 3
(assert (not (< 1 (Seq_length xs@64@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r (Seq_index xs@64@01 1))
      (=
        ($FVF.lookup_f (as sm@101@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@94@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@101@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@94@01  $FVF<f>) r))
    :qid |qp.fvfValDef16|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and (img@75@01 r) (Seq_contains (Seq_range 0 n@65@01) (inv@74@01 r)))
        (<
          $Perm.No
          (- (- (/ (to_real 1) (to_real 10)) (pTaken@87@01 r)) (pTaken@93@01 r)))
        false)
      (=
        ($FVF.lookup_f (as sm@101@01  $FVF<f>) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01)))))))) r)))
    :pattern (($FVF.lookup_f (as sm@101@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01)))))))) r))
    :qid |qp.fvfValDef17|))
  (forall ((r $Ref)) (!
    (=>
      (= r (Seq_index xs@64@01 0))
      (=
        ($FVF.lookup_f (as sm@101@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@88@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@101@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@88@01  $FVF<f>) r))
    :qid |qp.fvfValDef18|))))
(push) ; 3
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (= (Seq_index xs@64@01 1) (Seq_index xs@64@01 1))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@75@01 (Seq_index xs@64@01 1))
          (Seq_contains (Seq_range 0 n@65@01) (inv@74@01 (Seq_index xs@64@01 1))))
        (-
          (- (/ (to_real 1) (to_real 10)) (pTaken@87@01 (Seq_index xs@64@01 1)))
          (pTaken@93@01 (Seq_index xs@64@01 1)))
        $Perm.No))
    (ite (= (Seq_index xs@64@01 1) (Seq_index xs@64@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] old(xs[1].f) + 2
; [eval] old(xs[1].f)
; [eval] xs[1]
(push) ; 3
(assert (not (< 1 (Seq_length xs@64@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r x@66@01)
      (=
        ($FVF.lookup_f (as sm@83@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@69@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@83@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@69@01  $FVF<f>) r))
    :qid |qp.fvfValDef8|))
  (forall ((r $Ref)) (!
    (=>
      (= r y@67@01)
      (=
        ($FVF.lookup_f (as sm@83@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@70@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@83@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@70@01  $FVF<f>) r))
    :qid |qp.fvfValDef9|))
  (forall ((r $Ref)) (!
    (=>
      (and (img@75@01 r) (Seq_contains (Seq_range 0 n@65@01) (inv@74@01 r)))
      (=
        ($FVF.lookup_f (as sm@83@01  $FVF<f>) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01)))))))) r)))
    :pattern (($FVF.lookup_f (as sm@83@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@68@01)))))))) r))
    :qid |qp.fvfValDef10|))))
(push) ; 3
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (= (Seq_index xs@64@01 1) x@66@01)
        (/ (to_real 9) (to_real 10))
        $Perm.No)
      (ite
        (= (Seq_index xs@64@01 1) y@67@01)
        (/ (to_real 9) (to_real 10))
        $Perm.No))
    (ite
      (and
        (img@75@01 (Seq_index xs@64@01 1))
        (Seq_contains (Seq_range 0 n@65@01) (inv@74@01 (Seq_index xs@64@01 1))))
      (/ (to_real 1) (to_real 10))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (=
  ($FVF.lookup_f (as sm@101@01  $FVF<f>) (Seq_index xs@64@01 1))
  (+ ($FVF.lookup_f (as sm@83@01  $FVF<f>) (Seq_index xs@64@01 1)) 2))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($FVF.lookup_f (as sm@101@01  $FVF<f>) (Seq_index xs@64@01 1))
  (+ ($FVF.lookup_f (as sm@83@01  $FVF<f>) (Seq_index xs@64@01 1)) 2)))
(push) ; 3
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (Seq_index xs@64@01 1) (Seq_index xs@64@01 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@64@01 1) (Seq_index xs@64@01 1)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@64@01 0) (Seq_index xs@64@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@64@01 0) (Seq_index xs@64@01 0)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@64@01 1) (Seq_index xs@64@01 1)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@64@01 1) (Seq_index xs@64@01 1))
    (= (Seq_index xs@64@01 0) (Seq_index xs@64@01 0)))
  (not
    (=
      ($FVF.lookup_f (as sm@94@01  $FVF<f>) (Seq_index xs@64@01 1))
      ($FVF.lookup_f (as sm@88@01  $FVF<f>) (Seq_index xs@64@01 0)))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@64@01 0) (Seq_index xs@64@01 0))
    (= (Seq_index xs@64@01 1) (Seq_index xs@64@01 1)))
  (not
    (=
      ($FVF.lookup_f (as sm@88@01  $FVF<f>) (Seq_index xs@64@01 0))
      ($FVF.lookup_f (as sm@94@01  $FVF<f>) (Seq_index xs@64@01 1)))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@64@01 1) (Seq_index xs@64@01 0)))
  (not (= (Seq_index xs@64@01 0) (Seq_index xs@64@01 1)))))
(assert (and
  (not (= (Seq_index xs@64@01 1) (Seq_index xs@64@01 0)))
  (not (= (Seq_index xs@64@01 0) (Seq_index xs@64@01 1)))))
; Definitional axioms for snapshot map values
(declare-const pm@103@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@103@01  $FPM) r)
    (+
      (+
        (ite (= r (Seq_index xs@64@01 1)) $Perm.Write $Perm.No)
        (ite
          (and (img@75@01 r) (Seq_contains (Seq_range 0 n@65@01) (inv@74@01 r)))
          (- (- (/ (to_real 1) (to_real 10)) (pTaken@87@01 r)) (pTaken@93@01 r))
          $Perm.No))
      (ite (= r (Seq_index xs@64@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@103@01  $FPM) r))
  :qid |qp.resPrmSumDef19|)))
(assert (<= ($FVF.perm_f (as pm@103@01  $FPM) (Seq_index xs@64@01 1)) $Perm.Write))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@103@01  $FPM) r) $Perm.Write)
  :pattern ((inv@74@01 r))
  :qid |qp-fld-prm-bnd|)))
(assert (<= ($FVF.perm_f (as pm@103@01  $FPM) (Seq_index xs@64@01 0)) $Perm.Write))
(set-option :timeout 0)
(push) ; 3
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (Seq_index xs@64@01 1) (Seq_index xs@64@01 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@64@01 1) (Seq_index xs@64@01 1)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@64@01 0) (Seq_index xs@64@01 0)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite (= (Seq_index xs@64@01 0) (Seq_index xs@64@01 0)) $Perm.Write $Perm.No)
    (ite (= (Seq_index xs@64@01 1) (Seq_index xs@64@01 1)) $Perm.Write $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@64@01 1) (Seq_index xs@64@01 1))
    (= (Seq_index xs@64@01 0) (Seq_index xs@64@01 0)))
  (not
    (=
      ($FVF.lookup_f (as sm@94@01  $FVF<f>) (Seq_index xs@64@01 1))
      ($FVF.lookup_f (as sm@88@01  $FVF<f>) (Seq_index xs@64@01 0)))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (and
    (= (Seq_index xs@64@01 0) (Seq_index xs@64@01 0))
    (= (Seq_index xs@64@01 1) (Seq_index xs@64@01 1)))
  (not
    (=
      ($FVF.lookup_f (as sm@88@01  $FVF<f>) (Seq_index xs@64@01 0))
      ($FVF.lookup_f (as sm@94@01  $FVF<f>) (Seq_index xs@64@01 1)))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and
  (not (= (Seq_index xs@64@01 1) (Seq_index xs@64@01 0)))
  (not (= (Seq_index xs@64@01 0) (Seq_index xs@64@01 1)))))
(assert (and
  (not (= (Seq_index xs@64@01 1) (Seq_index xs@64@01 0)))
  (not (= (Seq_index xs@64@01 0) (Seq_index xs@64@01 1)))))
; Definitional axioms for snapshot map values
(declare-const pm@104@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@104@01  $FPM) r)
    (+
      (+
        (ite (= r (Seq_index xs@64@01 1)) $Perm.Write $Perm.No)
        (ite
          (and (img@75@01 r) (Seq_contains (Seq_range 0 n@65@01) (inv@74@01 r)))
          (- (- (/ (to_real 1) (to_real 10)) (pTaken@87@01 r)) (pTaken@93@01 r))
          $Perm.No))
      (ite (= r (Seq_index xs@64@01 0)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@104@01  $FPM) r))
  :qid |qp.resPrmSumDef20|)))
(assert (<= ($FVF.perm_f (as pm@104@01  $FPM) (Seq_index xs@64@01 1)) $Perm.Write))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@104@01  $FPM) r) $Perm.Write)
  :pattern ((inv@74@01 r))
  :qid |qp-fld-prm-bnd|)))
(assert (<= ($FVF.perm_f (as pm@104@01  $FPM) (Seq_index xs@64@01 0)) $Perm.Write))
(set-option :timeout 0)
(push) ; 3
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test4 ----------
(declare-const this@105@01 $Ref)
(declare-const n@106@01 Int)
(declare-const this@107@01 $Ref)
(declare-const n@108@01 Int)
(push) ; 1
(declare-const $t@109@01 $Snap)
(assert (= $t@109@01 ($Snap.combine ($Snap.first $t@109@01) ($Snap.second $t@109@01))))
(assert (not (= this@107@01 $Ref.null)))
(assert (=
  ($Snap.second $t@109@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@109@01))
    ($Snap.second ($Snap.second $t@109@01)))))
(assert (= ($Snap.first ($Snap.second $t@109@01)) $Snap.unit))
; [eval] n > 2
(assert (> n@108@01 2))
(assert (= ($Snap.second ($Snap.second $t@109@01)) $Snap.unit))
; [eval] |this.array| == n
; [eval] |this.array|
(assert (=
  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)))
  n@108@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@110@01 $Snap)
(assert (= $t@110@01 ($Snap.combine ($Snap.first $t@110@01) ($Snap.second $t@110@01))))
(declare-const $k@111@01 $Perm)
(assert ($Perm.isReadVar $k@111@01))
(assert (<= $Perm.No $k@111@01))
(assert (<= $k@111@01 $Perm.Write))
(assert (=> (< $Perm.No $k@111@01) (not (= this@107@01 $Ref.null))))
(assert (=
  ($Snap.second $t@110@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@110@01))
    ($Snap.second ($Snap.second $t@110@01)))))
(assert (= ($Snap.first ($Snap.second $t@110@01)) $Snap.unit))
; [eval] |this.array| == n
; [eval] |this.array|
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@111@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@110@01)))
  n@108@01))
(assert (=
  ($Snap.second ($Snap.second $t@110@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@110@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@110@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@110@01))) $Snap.unit))
; [eval] (forall i1: Int, i2: Int :: { (i1 in [0..n)), (i2 in [0..n)) } { (i1 in [0..n)), this.array[i2] } { (i2 in [0..n)), this.array[i1] } { this.array[i1], this.array[i2] } (i1 in [0..n)) && ((i2 in [0..n)) && i1 != i2) ==> this.array[i1] != this.array[i2])
(declare-const i1@112@01 Int)
(declare-const i2@113@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (i1 in [0..n)) && ((i2 in [0..n)) && i1 != i2) ==> this.array[i1] != this.array[i2]
; [eval] (i1 in [0..n)) && ((i2 in [0..n)) && i1 != i2)
; [eval] (i1 in [0..n))
; [eval] [0..n)
(push) ; 4
; [then-branch: 18 | !(i1@112@01 in [0..n@108@01]) | live]
; [else-branch: 18 | i1@112@01 in [0..n@108@01] | live]
(push) ; 5
; [then-branch: 18 | !(i1@112@01 in [0..n@108@01])]
(assert (not (Seq_contains (Seq_range 0 n@108@01) i1@112@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 18 | i1@112@01 in [0..n@108@01]]
(assert (Seq_contains (Seq_range 0 n@108@01) i1@112@01))
; [eval] (i2 in [0..n))
; [eval] [0..n)
(push) ; 6
; [then-branch: 19 | !(i2@113@01 in [0..n@108@01]) | live]
; [else-branch: 19 | i2@113@01 in [0..n@108@01] | live]
(push) ; 7
; [then-branch: 19 | !(i2@113@01 in [0..n@108@01])]
(assert (not (Seq_contains (Seq_range 0 n@108@01) i2@113@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 19 | i2@113@01 in [0..n@108@01]]
(assert (Seq_contains (Seq_range 0 n@108@01) i2@113@01))
; [eval] i1 != i2
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 n@108@01) i2@113@01)
  (not (Seq_contains (Seq_range 0 n@108@01) i2@113@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 n@108@01) i1@112@01)
  (and
    (Seq_contains (Seq_range 0 n@108@01) i1@112@01)
    (or
      (Seq_contains (Seq_range 0 n@108@01) i2@113@01)
      (not (Seq_contains (Seq_range 0 n@108@01) i2@113@01))))))
(assert (or
  (Seq_contains (Seq_range 0 n@108@01) i1@112@01)
  (not (Seq_contains (Seq_range 0 n@108@01) i1@112@01))))
(push) ; 4
; [then-branch: 20 | i1@112@01 in [0..n@108@01] && i2@113@01 in [0..n@108@01] && i1@112@01 != i2@113@01 | live]
; [else-branch: 20 | !(i1@112@01 in [0..n@108@01] && i2@113@01 in [0..n@108@01] && i1@112@01 != i2@113@01) | live]
(push) ; 5
; [then-branch: 20 | i1@112@01 in [0..n@108@01] && i2@113@01 in [0..n@108@01] && i1@112@01 != i2@113@01]
(assert (and
  (Seq_contains (Seq_range 0 n@108@01) i1@112@01)
  (and
    (Seq_contains (Seq_range 0 n@108@01) i2@113@01)
    (not (= i1@112@01 i2@113@01)))))
; [eval] this.array[i1] != this.array[i2]
; [eval] this.array[i1]
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No $k@111@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(assert (not (>= i1@112@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (<
  i1@112@01
  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@110@01))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] this.array[i2]
(push) ; 6
(set-option :timeout 10)
(assert (not (< $Perm.No $k@111@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(assert (not (>= i2@113@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (<
  i2@113@01
  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@110@01))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 20 | !(i1@112@01 in [0..n@108@01] && i2@113@01 in [0..n@108@01] && i1@112@01 != i2@113@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 n@108@01) i1@112@01)
    (and
      (Seq_contains (Seq_range 0 n@108@01) i2@113@01)
      (not (= i1@112@01 i2@113@01))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 n@108@01) i1@112@01)
    (and
      (Seq_contains (Seq_range 0 n@108@01) i2@113@01)
      (not (= i1@112@01 i2@113@01))))
  (and
    (Seq_contains (Seq_range 0 n@108@01) i1@112@01)
    (Seq_contains (Seq_range 0 n@108@01) i2@113@01)
    (not (= i1@112@01 i2@113@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 n@108@01) i1@112@01)
      (and
        (Seq_contains (Seq_range 0 n@108@01) i2@113@01)
        (not (= i1@112@01 i2@113@01)))))
  (and
    (Seq_contains (Seq_range 0 n@108@01) i1@112@01)
    (and
      (Seq_contains (Seq_range 0 n@108@01) i2@113@01)
      (not (= i1@112@01 i2@113@01))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i1@112@01 Int) (i2@113@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 n@108@01) i1@112@01)
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@112@01)
        (or
          (Seq_contains (Seq_range 0 n@108@01) i2@113@01)
          (not (Seq_contains (Seq_range 0 n@108@01) i2@113@01)))))
    (or
      (Seq_contains (Seq_range 0 n@108@01) i1@112@01)
      (not (Seq_contains (Seq_range 0 n@108@01) i1@112@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@112@01)
        (and
          (Seq_contains (Seq_range 0 n@108@01) i2@113@01)
          (not (= i1@112@01 i2@113@01))))
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@112@01)
        (Seq_contains (Seq_range 0 n@108@01) i2@113@01)
        (not (= i1@112@01 i2@113@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 n@108@01) i1@112@01)
          (and
            (Seq_contains (Seq_range 0 n@108@01) i2@113@01)
            (not (= i1@112@01 i2@113@01)))))
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@112@01)
        (and
          (Seq_contains (Seq_range 0 n@108@01) i2@113@01)
          (not (= i1@112@01 i2@113@01))))))
  :pattern ((Seq_contains (Seq_range 0 n@108@01) i1@112@01) (Seq_contains
    (Seq_range 0 n@108@01)
    i2@113@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@108@01) i1@112@01) (Seq_contains_trigger
    (Seq_range 0 n@108@01)
    i2@113@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0102.vpr@64@11@64@115-aux|)))
(assert (forall ((i1@112@01 Int) (i2@113@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 n@108@01) i1@112@01)
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@112@01)
        (or
          (Seq_contains (Seq_range 0 n@108@01) i2@113@01)
          (not (Seq_contains (Seq_range 0 n@108@01) i2@113@01)))))
    (or
      (Seq_contains (Seq_range 0 n@108@01) i1@112@01)
      (not (Seq_contains (Seq_range 0 n@108@01) i1@112@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@112@01)
        (and
          (Seq_contains (Seq_range 0 n@108@01) i2@113@01)
          (not (= i1@112@01 i2@113@01))))
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@112@01)
        (Seq_contains (Seq_range 0 n@108@01) i2@113@01)
        (not (= i1@112@01 i2@113@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 n@108@01) i1@112@01)
          (and
            (Seq_contains (Seq_range 0 n@108@01) i2@113@01)
            (not (= i1@112@01 i2@113@01)))))
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@112@01)
        (and
          (Seq_contains (Seq_range 0 n@108@01) i2@113@01)
          (not (= i1@112@01 i2@113@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@108@01) i1@112@01) (Seq_contains_trigger
    (Seq_range 0 n@108@01)
    i2@113@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0102.vpr@64@11@64@115-aux|)))
(assert (forall ((i1@112@01 Int) (i2@113@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 n@108@01) i1@112@01)
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@112@01)
        (or
          (Seq_contains (Seq_range 0 n@108@01) i2@113@01)
          (not (Seq_contains (Seq_range 0 n@108@01) i2@113@01)))))
    (or
      (Seq_contains (Seq_range 0 n@108@01) i1@112@01)
      (not (Seq_contains (Seq_range 0 n@108@01) i1@112@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@112@01)
        (and
          (Seq_contains (Seq_range 0 n@108@01) i2@113@01)
          (not (= i1@112@01 i2@113@01))))
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@112@01)
        (Seq_contains (Seq_range 0 n@108@01) i2@113@01)
        (not (= i1@112@01 i2@113@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 n@108@01) i1@112@01)
          (and
            (Seq_contains (Seq_range 0 n@108@01) i2@113@01)
            (not (= i1@112@01 i2@113@01)))))
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@112@01)
        (and
          (Seq_contains (Seq_range 0 n@108@01) i2@113@01)
          (not (= i1@112@01 i2@113@01))))))
  :pattern ((Seq_contains (Seq_range 0 n@108@01) i1@112@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@110@01))
    i2@113@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@108@01) i1@112@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@110@01))
    i2@113@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0102.vpr@64@11@64@115-aux|)))
(assert (forall ((i1@112@01 Int) (i2@113@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 n@108@01) i1@112@01)
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@112@01)
        (or
          (Seq_contains (Seq_range 0 n@108@01) i2@113@01)
          (not (Seq_contains (Seq_range 0 n@108@01) i2@113@01)))))
    (or
      (Seq_contains (Seq_range 0 n@108@01) i1@112@01)
      (not (Seq_contains (Seq_range 0 n@108@01) i1@112@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@112@01)
        (and
          (Seq_contains (Seq_range 0 n@108@01) i2@113@01)
          (not (= i1@112@01 i2@113@01))))
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@112@01)
        (Seq_contains (Seq_range 0 n@108@01) i2@113@01)
        (not (= i1@112@01 i2@113@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 n@108@01) i1@112@01)
          (and
            (Seq_contains (Seq_range 0 n@108@01) i2@113@01)
            (not (= i1@112@01 i2@113@01)))))
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@112@01)
        (and
          (Seq_contains (Seq_range 0 n@108@01) i2@113@01)
          (not (= i1@112@01 i2@113@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@108@01) i1@112@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@110@01))
    i2@113@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0102.vpr@64@11@64@115-aux|)))
(assert (forall ((i1@112@01 Int) (i2@113@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 n@108@01) i1@112@01)
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@112@01)
        (or
          (Seq_contains (Seq_range 0 n@108@01) i2@113@01)
          (not (Seq_contains (Seq_range 0 n@108@01) i2@113@01)))))
    (or
      (Seq_contains (Seq_range 0 n@108@01) i1@112@01)
      (not (Seq_contains (Seq_range 0 n@108@01) i1@112@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@112@01)
        (and
          (Seq_contains (Seq_range 0 n@108@01) i2@113@01)
          (not (= i1@112@01 i2@113@01))))
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@112@01)
        (Seq_contains (Seq_range 0 n@108@01) i2@113@01)
        (not (= i1@112@01 i2@113@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 n@108@01) i1@112@01)
          (and
            (Seq_contains (Seq_range 0 n@108@01) i2@113@01)
            (not (= i1@112@01 i2@113@01)))))
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@112@01)
        (and
          (Seq_contains (Seq_range 0 n@108@01) i2@113@01)
          (not (= i1@112@01 i2@113@01))))))
  :pattern ((Seq_contains (Seq_range 0 n@108@01) i2@113@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@110@01))
    i1@112@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@108@01) i2@113@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@110@01))
    i1@112@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0102.vpr@64@11@64@115-aux|)))
(assert (forall ((i1@112@01 Int) (i2@113@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 n@108@01) i1@112@01)
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@112@01)
        (or
          (Seq_contains (Seq_range 0 n@108@01) i2@113@01)
          (not (Seq_contains (Seq_range 0 n@108@01) i2@113@01)))))
    (or
      (Seq_contains (Seq_range 0 n@108@01) i1@112@01)
      (not (Seq_contains (Seq_range 0 n@108@01) i1@112@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@112@01)
        (and
          (Seq_contains (Seq_range 0 n@108@01) i2@113@01)
          (not (= i1@112@01 i2@113@01))))
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@112@01)
        (Seq_contains (Seq_range 0 n@108@01) i2@113@01)
        (not (= i1@112@01 i2@113@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 n@108@01) i1@112@01)
          (and
            (Seq_contains (Seq_range 0 n@108@01) i2@113@01)
            (not (= i1@112@01 i2@113@01)))))
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@112@01)
        (and
          (Seq_contains (Seq_range 0 n@108@01) i2@113@01)
          (not (= i1@112@01 i2@113@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@108@01) i2@113@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@110@01))
    i1@112@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0102.vpr@64@11@64@115-aux|)))
(assert (forall ((i1@112@01 Int) (i2@113@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 n@108@01) i1@112@01)
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@112@01)
        (or
          (Seq_contains (Seq_range 0 n@108@01) i2@113@01)
          (not (Seq_contains (Seq_range 0 n@108@01) i2@113@01)))))
    (or
      (Seq_contains (Seq_range 0 n@108@01) i1@112@01)
      (not (Seq_contains (Seq_range 0 n@108@01) i1@112@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@112@01)
        (and
          (Seq_contains (Seq_range 0 n@108@01) i2@113@01)
          (not (= i1@112@01 i2@113@01))))
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@112@01)
        (Seq_contains (Seq_range 0 n@108@01) i2@113@01)
        (not (= i1@112@01 i2@113@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 n@108@01) i1@112@01)
          (and
            (Seq_contains (Seq_range 0 n@108@01) i2@113@01)
            (not (= i1@112@01 i2@113@01)))))
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@112@01)
        (and
          (Seq_contains (Seq_range 0 n@108@01) i2@113@01)
          (not (= i1@112@01 i2@113@01))))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@110@01))
    i1@112@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@110@01))
    i2@113@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0102.vpr@64@11@64@115-aux|)))
(assert (forall ((i1@112@01 Int) (i2@113@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 n@108@01) i1@112@01)
      (and
        (Seq_contains (Seq_range 0 n@108@01) i2@113@01)
        (not (= i1@112@01 i2@113@01))))
    (not
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@110@01))
          i1@112@01)
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@110@01))
          i2@113@01))))
  :pattern ((Seq_contains (Seq_range 0 n@108@01) i1@112@01) (Seq_contains
    (Seq_range 0 n@108@01)
    i2@113@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@108@01) i1@112@01) (Seq_contains_trigger
    (Seq_range 0 n@108@01)
    i2@113@01))
  :pattern ((Seq_contains (Seq_range 0 n@108@01) i1@112@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@110@01))
    i2@113@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@108@01) i1@112@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@110@01))
    i2@113@01))
  :pattern ((Seq_contains (Seq_range 0 n@108@01) i2@113@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@110@01))
    i1@112@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@108@01) i2@113@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@110@01))
    i1@112@01))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@110@01))
    i1@112@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@110@01))
    i2@113@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0102.vpr@64@11@64@115|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@110@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@110@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@110@01)))))))
(declare-const i@114@01 Int)
(push) ; 3
; [eval] (i in [0..n))
; [eval] [0..n)
(assert (Seq_contains (Seq_range 0 n@108@01) i@114@01))
; [eval] this.array[i]
(push) ; 4
(set-option :timeout 10)
(assert (not (< $Perm.No $k@111@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(assert (not (>= i@114@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (<
  i@114@01
  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@110@01))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@115@01 ($Ref) Int)
(declare-fun img@116@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@114@01 Int) (i2@114@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 n@108@01) i1@114@01)
      (Seq_contains (Seq_range 0 n@108@01) i2@114@01)
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@110@01))
          i1@114@01)
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@110@01))
          i2@114@01)))
    (= i1@114@01 i2@114@01))
  
  :qid |value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@114@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 n@108@01) i@114@01)
    (and
      (=
        (inv@115@01 (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@110@01))
          i@114@01))
        i@114@01)
      (img@116@01 (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@110@01))
        i@114@01))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@110@01))
    i@114@01))
  :qid |quant-u-54|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@116@01 r) (Seq_contains (Seq_range 0 n@108@01) (inv@115@01 r)))
    (=
      (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@110@01))
        (inv@115@01 r))
      r))
  :pattern ((inv@115@01 r))
  :qid |value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@114@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 n@108@01) i@114@01)
    (not
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@110@01))
          i@114@01)
        $Ref.null)))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@110@01))
    i@114@01))
  :qid |value-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@110@01))))
  $Snap.unit))
(assert false)
(pop) ; 2
(push) ; 2
; [exec]
; var x: Int
(declare-const x@117@01 Int)
; [exec]
; var r: Ref
(declare-const r@118@01 $Ref)
; [exec]
; inhale (forall i1: Int, i2: Int ::
;     { (i1 in [0..n)), (i2 in [0..n)) }
;     { (i1 in [0..n)), this.array[i2] }
;     { (i2 in [0..n)), this.array[i1] }
;     { this.array[i1], this.array[i2] }
;     (i1 in [0..n)) && ((i2 in [0..n)) && i1 != i2) ==>
;     this.array[i1] != this.array[i2])
(declare-const $t@119@01 $Snap)
(assert (= $t@119@01 $Snap.unit))
; [eval] (forall i1: Int, i2: Int :: { (i1 in [0..n)), (i2 in [0..n)) } { (i1 in [0..n)), this.array[i2] } { (i2 in [0..n)), this.array[i1] } { this.array[i1], this.array[i2] } (i1 in [0..n)) && ((i2 in [0..n)) && i1 != i2) ==> this.array[i1] != this.array[i2])
(declare-const i1@120@01 Int)
(declare-const i2@121@01 Int)
(push) ; 3
; [eval] (i1 in [0..n)) && ((i2 in [0..n)) && i1 != i2) ==> this.array[i1] != this.array[i2]
; [eval] (i1 in [0..n)) && ((i2 in [0..n)) && i1 != i2)
; [eval] (i1 in [0..n))
; [eval] [0..n)
(push) ; 4
; [then-branch: 21 | !(i1@120@01 in [0..n@108@01]) | live]
; [else-branch: 21 | i1@120@01 in [0..n@108@01] | live]
(push) ; 5
; [then-branch: 21 | !(i1@120@01 in [0..n@108@01])]
(assert (not (Seq_contains (Seq_range 0 n@108@01) i1@120@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 21 | i1@120@01 in [0..n@108@01]]
(assert (Seq_contains (Seq_range 0 n@108@01) i1@120@01))
; [eval] (i2 in [0..n))
; [eval] [0..n)
(push) ; 6
; [then-branch: 22 | !(i2@121@01 in [0..n@108@01]) | live]
; [else-branch: 22 | i2@121@01 in [0..n@108@01] | live]
(push) ; 7
; [then-branch: 22 | !(i2@121@01 in [0..n@108@01])]
(assert (not (Seq_contains (Seq_range 0 n@108@01) i2@121@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 22 | i2@121@01 in [0..n@108@01]]
(assert (Seq_contains (Seq_range 0 n@108@01) i2@121@01))
; [eval] i1 != i2
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 n@108@01) i2@121@01)
  (not (Seq_contains (Seq_range 0 n@108@01) i2@121@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 n@108@01) i1@120@01)
  (and
    (Seq_contains (Seq_range 0 n@108@01) i1@120@01)
    (or
      (Seq_contains (Seq_range 0 n@108@01) i2@121@01)
      (not (Seq_contains (Seq_range 0 n@108@01) i2@121@01))))))
(assert (or
  (Seq_contains (Seq_range 0 n@108@01) i1@120@01)
  (not (Seq_contains (Seq_range 0 n@108@01) i1@120@01))))
(push) ; 4
; [then-branch: 23 | i1@120@01 in [0..n@108@01] && i2@121@01 in [0..n@108@01] && i1@120@01 != i2@121@01 | live]
; [else-branch: 23 | !(i1@120@01 in [0..n@108@01] && i2@121@01 in [0..n@108@01] && i1@120@01 != i2@121@01) | live]
(push) ; 5
; [then-branch: 23 | i1@120@01 in [0..n@108@01] && i2@121@01 in [0..n@108@01] && i1@120@01 != i2@121@01]
(assert (and
  (Seq_contains (Seq_range 0 n@108@01) i1@120@01)
  (and
    (Seq_contains (Seq_range 0 n@108@01) i2@121@01)
    (not (= i1@120@01 i2@121@01)))))
; [eval] this.array[i1] != this.array[i2]
; [eval] this.array[i1]
(push) ; 6
(assert (not (>= i1@120@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (<
  i1@120@01
  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] this.array[i2]
(push) ; 6
(assert (not (>= i2@121@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (<
  i2@121@01
  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 23 | !(i1@120@01 in [0..n@108@01] && i2@121@01 in [0..n@108@01] && i1@120@01 != i2@121@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 n@108@01) i1@120@01)
    (and
      (Seq_contains (Seq_range 0 n@108@01) i2@121@01)
      (not (= i1@120@01 i2@121@01))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 n@108@01) i1@120@01)
    (and
      (Seq_contains (Seq_range 0 n@108@01) i2@121@01)
      (not (= i1@120@01 i2@121@01))))
  (and
    (Seq_contains (Seq_range 0 n@108@01) i1@120@01)
    (Seq_contains (Seq_range 0 n@108@01) i2@121@01)
    (not (= i1@120@01 i2@121@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 n@108@01) i1@120@01)
      (and
        (Seq_contains (Seq_range 0 n@108@01) i2@121@01)
        (not (= i1@120@01 i2@121@01)))))
  (and
    (Seq_contains (Seq_range 0 n@108@01) i1@120@01)
    (and
      (Seq_contains (Seq_range 0 n@108@01) i2@121@01)
      (not (= i1@120@01 i2@121@01))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i1@120@01 Int) (i2@121@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 n@108@01) i1@120@01)
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@120@01)
        (or
          (Seq_contains (Seq_range 0 n@108@01) i2@121@01)
          (not (Seq_contains (Seq_range 0 n@108@01) i2@121@01)))))
    (or
      (Seq_contains (Seq_range 0 n@108@01) i1@120@01)
      (not (Seq_contains (Seq_range 0 n@108@01) i1@120@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@120@01)
        (and
          (Seq_contains (Seq_range 0 n@108@01) i2@121@01)
          (not (= i1@120@01 i2@121@01))))
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@120@01)
        (Seq_contains (Seq_range 0 n@108@01) i2@121@01)
        (not (= i1@120@01 i2@121@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 n@108@01) i1@120@01)
          (and
            (Seq_contains (Seq_range 0 n@108@01) i2@121@01)
            (not (= i1@120@01 i2@121@01)))))
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@120@01)
        (and
          (Seq_contains (Seq_range 0 n@108@01) i2@121@01)
          (not (= i1@120@01 i2@121@01))))))
  :pattern ((Seq_contains (Seq_range 0 n@108@01) i1@120@01) (Seq_contains
    (Seq_range 0 n@108@01)
    i2@121@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@108@01) i1@120@01) (Seq_contains_trigger
    (Seq_range 0 n@108@01)
    i2@121@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0102.vpr@71@10@71@114-aux|)))
(assert (forall ((i1@120@01 Int) (i2@121@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 n@108@01) i1@120@01)
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@120@01)
        (or
          (Seq_contains (Seq_range 0 n@108@01) i2@121@01)
          (not (Seq_contains (Seq_range 0 n@108@01) i2@121@01)))))
    (or
      (Seq_contains (Seq_range 0 n@108@01) i1@120@01)
      (not (Seq_contains (Seq_range 0 n@108@01) i1@120@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@120@01)
        (and
          (Seq_contains (Seq_range 0 n@108@01) i2@121@01)
          (not (= i1@120@01 i2@121@01))))
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@120@01)
        (Seq_contains (Seq_range 0 n@108@01) i2@121@01)
        (not (= i1@120@01 i2@121@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 n@108@01) i1@120@01)
          (and
            (Seq_contains (Seq_range 0 n@108@01) i2@121@01)
            (not (= i1@120@01 i2@121@01)))))
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@120@01)
        (and
          (Seq_contains (Seq_range 0 n@108@01) i2@121@01)
          (not (= i1@120@01 i2@121@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@108@01) i1@120@01) (Seq_contains_trigger
    (Seq_range 0 n@108@01)
    i2@121@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0102.vpr@71@10@71@114-aux|)))
(assert (forall ((i1@120@01 Int) (i2@121@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 n@108@01) i1@120@01)
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@120@01)
        (or
          (Seq_contains (Seq_range 0 n@108@01) i2@121@01)
          (not (Seq_contains (Seq_range 0 n@108@01) i2@121@01)))))
    (or
      (Seq_contains (Seq_range 0 n@108@01) i1@120@01)
      (not (Seq_contains (Seq_range 0 n@108@01) i1@120@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@120@01)
        (and
          (Seq_contains (Seq_range 0 n@108@01) i2@121@01)
          (not (= i1@120@01 i2@121@01))))
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@120@01)
        (Seq_contains (Seq_range 0 n@108@01) i2@121@01)
        (not (= i1@120@01 i2@121@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 n@108@01) i1@120@01)
          (and
            (Seq_contains (Seq_range 0 n@108@01) i2@121@01)
            (not (= i1@120@01 i2@121@01)))))
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@120@01)
        (and
          (Seq_contains (Seq_range 0 n@108@01) i2@121@01)
          (not (= i1@120@01 i2@121@01))))))
  :pattern ((Seq_contains (Seq_range 0 n@108@01) i1@120@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
    i2@121@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@108@01) i1@120@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
    i2@121@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0102.vpr@71@10@71@114-aux|)))
(assert (forall ((i1@120@01 Int) (i2@121@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 n@108@01) i1@120@01)
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@120@01)
        (or
          (Seq_contains (Seq_range 0 n@108@01) i2@121@01)
          (not (Seq_contains (Seq_range 0 n@108@01) i2@121@01)))))
    (or
      (Seq_contains (Seq_range 0 n@108@01) i1@120@01)
      (not (Seq_contains (Seq_range 0 n@108@01) i1@120@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@120@01)
        (and
          (Seq_contains (Seq_range 0 n@108@01) i2@121@01)
          (not (= i1@120@01 i2@121@01))))
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@120@01)
        (Seq_contains (Seq_range 0 n@108@01) i2@121@01)
        (not (= i1@120@01 i2@121@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 n@108@01) i1@120@01)
          (and
            (Seq_contains (Seq_range 0 n@108@01) i2@121@01)
            (not (= i1@120@01 i2@121@01)))))
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@120@01)
        (and
          (Seq_contains (Seq_range 0 n@108@01) i2@121@01)
          (not (= i1@120@01 i2@121@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@108@01) i1@120@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
    i2@121@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0102.vpr@71@10@71@114-aux|)))
(assert (forall ((i1@120@01 Int) (i2@121@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 n@108@01) i1@120@01)
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@120@01)
        (or
          (Seq_contains (Seq_range 0 n@108@01) i2@121@01)
          (not (Seq_contains (Seq_range 0 n@108@01) i2@121@01)))))
    (or
      (Seq_contains (Seq_range 0 n@108@01) i1@120@01)
      (not (Seq_contains (Seq_range 0 n@108@01) i1@120@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@120@01)
        (and
          (Seq_contains (Seq_range 0 n@108@01) i2@121@01)
          (not (= i1@120@01 i2@121@01))))
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@120@01)
        (Seq_contains (Seq_range 0 n@108@01) i2@121@01)
        (not (= i1@120@01 i2@121@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 n@108@01) i1@120@01)
          (and
            (Seq_contains (Seq_range 0 n@108@01) i2@121@01)
            (not (= i1@120@01 i2@121@01)))))
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@120@01)
        (and
          (Seq_contains (Seq_range 0 n@108@01) i2@121@01)
          (not (= i1@120@01 i2@121@01))))))
  :pattern ((Seq_contains (Seq_range 0 n@108@01) i2@121@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
    i1@120@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@108@01) i2@121@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
    i1@120@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0102.vpr@71@10@71@114-aux|)))
(assert (forall ((i1@120@01 Int) (i2@121@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 n@108@01) i1@120@01)
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@120@01)
        (or
          (Seq_contains (Seq_range 0 n@108@01) i2@121@01)
          (not (Seq_contains (Seq_range 0 n@108@01) i2@121@01)))))
    (or
      (Seq_contains (Seq_range 0 n@108@01) i1@120@01)
      (not (Seq_contains (Seq_range 0 n@108@01) i1@120@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@120@01)
        (and
          (Seq_contains (Seq_range 0 n@108@01) i2@121@01)
          (not (= i1@120@01 i2@121@01))))
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@120@01)
        (Seq_contains (Seq_range 0 n@108@01) i2@121@01)
        (not (= i1@120@01 i2@121@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 n@108@01) i1@120@01)
          (and
            (Seq_contains (Seq_range 0 n@108@01) i2@121@01)
            (not (= i1@120@01 i2@121@01)))))
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@120@01)
        (and
          (Seq_contains (Seq_range 0 n@108@01) i2@121@01)
          (not (= i1@120@01 i2@121@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@108@01) i2@121@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
    i1@120@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0102.vpr@71@10@71@114-aux|)))
(assert (forall ((i1@120@01 Int) (i2@121@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 n@108@01) i1@120@01)
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@120@01)
        (or
          (Seq_contains (Seq_range 0 n@108@01) i2@121@01)
          (not (Seq_contains (Seq_range 0 n@108@01) i2@121@01)))))
    (or
      (Seq_contains (Seq_range 0 n@108@01) i1@120@01)
      (not (Seq_contains (Seq_range 0 n@108@01) i1@120@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@120@01)
        (and
          (Seq_contains (Seq_range 0 n@108@01) i2@121@01)
          (not (= i1@120@01 i2@121@01))))
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@120@01)
        (Seq_contains (Seq_range 0 n@108@01) i2@121@01)
        (not (= i1@120@01 i2@121@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 n@108@01) i1@120@01)
          (and
            (Seq_contains (Seq_range 0 n@108@01) i2@121@01)
            (not (= i1@120@01 i2@121@01)))))
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@120@01)
        (and
          (Seq_contains (Seq_range 0 n@108@01) i2@121@01)
          (not (= i1@120@01 i2@121@01))))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
    i1@120@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
    i2@121@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0102.vpr@71@10@71@114-aux|)))
(assert (forall ((i1@120@01 Int) (i2@121@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 n@108@01) i1@120@01)
      (and
        (Seq_contains (Seq_range 0 n@108@01) i2@121@01)
        (not (= i1@120@01 i2@121@01))))
    (not
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
          i1@120@01)
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
          i2@121@01))))
  :pattern ((Seq_contains (Seq_range 0 n@108@01) i1@120@01) (Seq_contains
    (Seq_range 0 n@108@01)
    i2@121@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@108@01) i1@120@01) (Seq_contains_trigger
    (Seq_range 0 n@108@01)
    i2@121@01))
  :pattern ((Seq_contains (Seq_range 0 n@108@01) i1@120@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
    i2@121@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@108@01) i1@120@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
    i2@121@01))
  :pattern ((Seq_contains (Seq_range 0 n@108@01) i2@121@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
    i1@120@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@108@01) i2@121@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
    i1@120@01))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
    i1@120@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
    i2@121@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0102.vpr@71@10@71@114|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall i: Int ::(i in [0..n)) ==> acc(this.array[i].value, write))
(declare-const i@122@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (i in [0..n))
; [eval] [0..n)
(assert (Seq_contains (Seq_range 0 n@108@01) i@122@01))
; [eval] this.array[i]
(push) ; 4
(assert (not (>= i@122@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (<
  i@122@01
  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-const $t@123@01 $FVF<value>)
(declare-fun inv@124@01 ($Ref) Int)
(declare-fun img@125@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@122@01 Int) (i2@122@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 n@108@01) i1@122@01)
      (Seq_contains (Seq_range 0 n@108@01) i2@122@01)
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
          i1@122@01)
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
          i2@122@01)))
    (= i1@122@01 i2@122@01))
  
  :qid |value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@122@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 n@108@01) i@122@01)
    (and
      (=
        (inv@124@01 (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
          i@122@01))
        i@122@01)
      (img@125@01 (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
        i@122@01))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
    i@122@01))
  :qid |quant-u-56|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@125@01 r) (Seq_contains (Seq_range 0 n@108@01) (inv@124@01 r)))
    (=
      (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
        (inv@124@01 r))
      r))
  :pattern ((inv@124@01 r))
  :qid |value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@122@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 n@108@01) i@122@01)
    (not
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
          i@122@01)
        $Ref.null)))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
    i@122@01))
  :qid |value-permImpliesNonNull|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; x := this.array[0].value
; [eval] this.array[0]
(set-option :timeout 0)
(push) ; 3
(assert (not (< 0 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (and
  (img@125@01 (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
    0))
  (Seq_contains
    (Seq_range 0 n@108@01)
    (inv@124@01 (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
      0))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const x@126@01 Int)
(assert (=
  x@126@01
  ($FVF.lookup_value $t@123@01 (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
    0))))
; [exec]
; this.array[0].value := 1
; [eval] this.array[0]
(push) ; 3
(assert (not (< 0 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@127@01 ((r $Ref)) $Perm
  (ite
    (= r (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0))
    ($Perm.min
      (ite
        (and (img@125@01 r) (Seq_contains (Seq_range 0 n@108@01) (inv@124@01 r)))
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
        (and (img@125@01 r) (Seq_contains (Seq_range 0 n@108@01) (inv@124@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@127@01 r))
    $Perm.No)
  
  :qid |quant-u-58|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@127@01 r) $Perm.No)
  
  :qid |quant-u-59|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0))
    (= (- $Perm.Write (pTaken@127@01 r)) $Perm.No))
  
  :qid |quant-u-60|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@128@01 $FVF<value>)
; Definitional axioms for singleton-FVF's value
(assert (=
  ($FVF.lookup_value (as sm@128@01  $FVF<value>) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
    0))
  1))
; [exec]
; inhale r == this.array[1]
(declare-const $t@129@01 $Snap)
(assert (= $t@129@01 $Snap.unit))
; [eval] r == this.array[1]
; [eval] this.array[1]
(set-option :timeout 0)
(push) ; 3
(assert (not (< 1 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  r@118@01
  (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; r.value := 2
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0)
  r@118@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@130@01 ((r $Ref)) $Perm
  (ite
    (= r r@118@01)
    ($Perm.min
      (ite
        (and (img@125@01 r) (Seq_contains (Seq_range 0 n@108@01) (inv@124@01 r)))
        (- $Perm.Write (pTaken@127@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@131@01 ((r $Ref)) $Perm
  (ite
    (= r r@118@01)
    ($Perm.min
      (ite
        (=
          r
          (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@130@01 r)))
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
      (ite
        (and (img@125@01 r) (Seq_contains (Seq_range 0 n@108@01) (inv@124@01 r)))
        (- $Perm.Write (pTaken@127@01 r))
        $Perm.No)
      (pTaken@130@01 r))
    $Perm.No)
  
  :qid |quant-u-62|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@130@01 r) $Perm.No)
  
  :qid |quant-u-63|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=> (= r r@118@01) (= (- $Perm.Write (pTaken@130@01 r)) $Perm.No))
  
  :qid |quant-u-64|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@132@01 $FVF<value>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_value (as sm@132@01  $FVF<value>) r@118@01) 2))
; [exec]
; this.array[0].value := -1
; [eval] this.array[0]
(set-option :timeout 0)
(push) ; 3
(assert (not (< 0 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] -1
; Precomputing data for removing quantified permissions
(define-fun pTaken@133@01 ((r $Ref)) $Perm
  (ite
    (= r (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0))
    ($Perm.min
      (ite
        (=
          r
          (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@134@01 ((r $Ref)) $Perm
  (ite
    (= r (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0))
    ($Perm.min
      (ite (= r r@118@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@133@01 r)))
    $Perm.No))
(define-fun pTaken@135@01 ((r $Ref)) $Perm
  (ite
    (= r (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0))
    ($Perm.min
      (ite
        (and (img@125@01 r) (Seq_contains (Seq_range 0 n@108@01) (inv@124@01 r)))
        (- (- $Perm.Write (pTaken@127@01 r)) (pTaken@130@01 r))
        $Perm.No)
      (- (- $Perm.Write (pTaken@133@01 r)) (pTaken@134@01 r)))
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
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0))
      $Perm.Write
      $Perm.No)
    (pTaken@133@01 (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
      0)))
  $Perm.No)))
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
    (= r (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0))
    (= (- $Perm.Write (pTaken@133@01 r)) $Perm.No))
  
  :qid |quant-u-67|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@136@01 $FVF<value>)
; Definitional axioms for singleton-FVF's value
(assert (=
  ($FVF.lookup_value (as sm@136@01  $FVF<value>) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
    0))
  (- 0 1)))
; [exec]
; this.array[1].value := -2
; [eval] this.array[1]
(set-option :timeout 0)
(push) ; 3
(assert (not (< 1 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] -2
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0)
  (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@137@01 ((r $Ref)) $Perm
  (ite
    (= r (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1))
    ($Perm.min (ite (= r r@118@01) $Perm.Write $Perm.No) $Perm.Write)
    $Perm.No))
(define-fun pTaken@138@01 ((r $Ref)) $Perm
  (ite
    (= r (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1))
    ($Perm.min
      (ite
        (=
          r
          (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@137@01 r)))
    $Perm.No))
(define-fun pTaken@139@01 ((r $Ref)) $Perm
  (ite
    (= r (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1))
    ($Perm.min
      (ite
        (and (img@125@01 r) (Seq_contains (Seq_range 0 n@108@01) (inv@124@01 r)))
        (- (- $Perm.Write (pTaken@127@01 r)) (pTaken@130@01 r))
        $Perm.No)
      (- (- $Perm.Write (pTaken@137@01 r)) (pTaken@138@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@137@01 r@118@01)) $Perm.No)))
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
    (= r (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1))
    (= (- $Perm.Write (pTaken@137@01 r)) $Perm.No))
  
  :qid |quant-u-70|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@140@01 $FVF<value>)
; Definitional axioms for singleton-FVF's value
(assert (=
  ($FVF.lookup_value (as sm@140@01  $FVF<value>) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
    1))
  (- 0 2)))
; [exec]
; this.array[2].value := 3
; [eval] this.array[2]
(set-option :timeout 0)
(push) ; 3
(assert (not (< 2 (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1)
  (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0)
  (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@141@01 ((r $Ref)) $Perm
  (ite
    (= r (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2))
    ($Perm.min
      (ite
        (and (img@125@01 r) (Seq_contains (Seq_range 0 n@108@01) (inv@124@01 r)))
        (- (- $Perm.Write (pTaken@127@01 r)) (pTaken@130@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@142@01 ((r $Ref)) $Perm
  (ite
    (= r (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2))
    ($Perm.min
      (ite
        (=
          r
          (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@141@01 r)))
    $Perm.No))
(define-fun pTaken@143@01 ((r $Ref)) $Perm
  (ite
    (= r (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2))
    ($Perm.min
      (ite
        (=
          r
          (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0))
        $Perm.Write
        $Perm.No)
      (- (- $Perm.Write (pTaken@141@01 r)) (pTaken@142@01 r)))
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
      (ite
        (and (img@125@01 r) (Seq_contains (Seq_range 0 n@108@01) (inv@124@01 r)))
        (- (- $Perm.Write (pTaken@127@01 r)) (pTaken@130@01 r))
        $Perm.No)
      (pTaken@141@01 r))
    $Perm.No)
  
  :qid |quant-u-72|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@141@01 r) $Perm.No)
  
  :qid |quant-u-73|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2))
    (= (- $Perm.Write (pTaken@141@01 r)) $Perm.No))
  
  :qid |quant-u-74|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@144@01 $FVF<value>)
; Definitional axioms for singleton-FVF's value
(assert (=
  ($FVF.lookup_value (as sm@144@01  $FVF<value>) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
    2))
  3))
(declare-const $k@145@01 $Perm)
(assert ($Perm.isReadVar $k@145@01))
(assert (< $k@145@01 $Perm.Write))
(assert (<= $Perm.No (- $Perm.Write $k@145@01)))
(assert (<= (- $Perm.Write $k@145@01) $Perm.Write))
(assert (=> (< $Perm.No (- $Perm.Write $k@145@01)) (not (= this@107@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@145@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] |this.array| == n
; [eval] |this.array|
; [eval] (forall i1: Int, i2: Int :: { (i1 in [0..n)), (i2 in [0..n)) } { (i1 in [0..n)), this.array[i2] } { (i2 in [0..n)), this.array[i1] } { this.array[i1], this.array[i2] } (i1 in [0..n)) && ((i2 in [0..n)) && i1 != i2) ==> this.array[i1] != this.array[i2])
(declare-const i1@146@01 Int)
(declare-const i2@147@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (i1 in [0..n)) && ((i2 in [0..n)) && i1 != i2) ==> this.array[i1] != this.array[i2]
; [eval] (i1 in [0..n)) && ((i2 in [0..n)) && i1 != i2)
; [eval] (i1 in [0..n))
; [eval] [0..n)
(push) ; 4
; [then-branch: 24 | !(i1@146@01 in [0..n@108@01]) | live]
; [else-branch: 24 | i1@146@01 in [0..n@108@01] | live]
(push) ; 5
; [then-branch: 24 | !(i1@146@01 in [0..n@108@01])]
(assert (not (Seq_contains (Seq_range 0 n@108@01) i1@146@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 24 | i1@146@01 in [0..n@108@01]]
(assert (Seq_contains (Seq_range 0 n@108@01) i1@146@01))
; [eval] (i2 in [0..n))
; [eval] [0..n)
(push) ; 6
; [then-branch: 25 | !(i2@147@01 in [0..n@108@01]) | live]
; [else-branch: 25 | i2@147@01 in [0..n@108@01] | live]
(push) ; 7
; [then-branch: 25 | !(i2@147@01 in [0..n@108@01])]
(assert (not (Seq_contains (Seq_range 0 n@108@01) i2@147@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 25 | i2@147@01 in [0..n@108@01]]
(assert (Seq_contains (Seq_range 0 n@108@01) i2@147@01))
; [eval] i1 != i2
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 n@108@01) i2@147@01)
  (not (Seq_contains (Seq_range 0 n@108@01) i2@147@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 n@108@01) i1@146@01)
  (and
    (Seq_contains (Seq_range 0 n@108@01) i1@146@01)
    (or
      (Seq_contains (Seq_range 0 n@108@01) i2@147@01)
      (not (Seq_contains (Seq_range 0 n@108@01) i2@147@01))))))
(assert (or
  (Seq_contains (Seq_range 0 n@108@01) i1@146@01)
  (not (Seq_contains (Seq_range 0 n@108@01) i1@146@01))))
(push) ; 4
; [then-branch: 26 | i1@146@01 in [0..n@108@01] && i2@147@01 in [0..n@108@01] && i1@146@01 != i2@147@01 | live]
; [else-branch: 26 | !(i1@146@01 in [0..n@108@01] && i2@147@01 in [0..n@108@01] && i1@146@01 != i2@147@01) | live]
(push) ; 5
; [then-branch: 26 | i1@146@01 in [0..n@108@01] && i2@147@01 in [0..n@108@01] && i1@146@01 != i2@147@01]
(assert (and
  (Seq_contains (Seq_range 0 n@108@01) i1@146@01)
  (and
    (Seq_contains (Seq_range 0 n@108@01) i2@147@01)
    (not (= i1@146@01 i2@147@01)))))
; [eval] this.array[i1] != this.array[i2]
; [eval] this.array[i1]
(push) ; 6
(assert (not (>= i1@146@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (<
  i1@146@01
  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] this.array[i2]
(push) ; 6
(assert (not (>= i2@147@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (<
  i2@147@01
  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 26 | !(i1@146@01 in [0..n@108@01] && i2@147@01 in [0..n@108@01] && i1@146@01 != i2@147@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 n@108@01) i1@146@01)
    (and
      (Seq_contains (Seq_range 0 n@108@01) i2@147@01)
      (not (= i1@146@01 i2@147@01))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 n@108@01) i1@146@01)
    (and
      (Seq_contains (Seq_range 0 n@108@01) i2@147@01)
      (not (= i1@146@01 i2@147@01))))
  (and
    (Seq_contains (Seq_range 0 n@108@01) i1@146@01)
    (Seq_contains (Seq_range 0 n@108@01) i2@147@01)
    (not (= i1@146@01 i2@147@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 n@108@01) i1@146@01)
      (and
        (Seq_contains (Seq_range 0 n@108@01) i2@147@01)
        (not (= i1@146@01 i2@147@01)))))
  (and
    (Seq_contains (Seq_range 0 n@108@01) i1@146@01)
    (and
      (Seq_contains (Seq_range 0 n@108@01) i2@147@01)
      (not (= i1@146@01 i2@147@01))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i1@146@01 Int) (i2@147@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 n@108@01) i1@146@01)
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@146@01)
        (or
          (Seq_contains (Seq_range 0 n@108@01) i2@147@01)
          (not (Seq_contains (Seq_range 0 n@108@01) i2@147@01)))))
    (or
      (Seq_contains (Seq_range 0 n@108@01) i1@146@01)
      (not (Seq_contains (Seq_range 0 n@108@01) i1@146@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@146@01)
        (and
          (Seq_contains (Seq_range 0 n@108@01) i2@147@01)
          (not (= i1@146@01 i2@147@01))))
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@146@01)
        (Seq_contains (Seq_range 0 n@108@01) i2@147@01)
        (not (= i1@146@01 i2@147@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 n@108@01) i1@146@01)
          (and
            (Seq_contains (Seq_range 0 n@108@01) i2@147@01)
            (not (= i1@146@01 i2@147@01)))))
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@146@01)
        (and
          (Seq_contains (Seq_range 0 n@108@01) i2@147@01)
          (not (= i1@146@01 i2@147@01))))))
  :pattern ((Seq_contains (Seq_range 0 n@108@01) i1@146@01) (Seq_contains
    (Seq_range 0 n@108@01)
    i2@147@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@108@01) i1@146@01) (Seq_contains_trigger
    (Seq_range 0 n@108@01)
    i2@147@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0102.vpr@64@11@64@115-aux|)))
(assert (forall ((i1@146@01 Int) (i2@147@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 n@108@01) i1@146@01)
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@146@01)
        (or
          (Seq_contains (Seq_range 0 n@108@01) i2@147@01)
          (not (Seq_contains (Seq_range 0 n@108@01) i2@147@01)))))
    (or
      (Seq_contains (Seq_range 0 n@108@01) i1@146@01)
      (not (Seq_contains (Seq_range 0 n@108@01) i1@146@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@146@01)
        (and
          (Seq_contains (Seq_range 0 n@108@01) i2@147@01)
          (not (= i1@146@01 i2@147@01))))
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@146@01)
        (Seq_contains (Seq_range 0 n@108@01) i2@147@01)
        (not (= i1@146@01 i2@147@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 n@108@01) i1@146@01)
          (and
            (Seq_contains (Seq_range 0 n@108@01) i2@147@01)
            (not (= i1@146@01 i2@147@01)))))
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@146@01)
        (and
          (Seq_contains (Seq_range 0 n@108@01) i2@147@01)
          (not (= i1@146@01 i2@147@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@108@01) i1@146@01) (Seq_contains_trigger
    (Seq_range 0 n@108@01)
    i2@147@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0102.vpr@64@11@64@115-aux|)))
(assert (forall ((i1@146@01 Int) (i2@147@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 n@108@01) i1@146@01)
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@146@01)
        (or
          (Seq_contains (Seq_range 0 n@108@01) i2@147@01)
          (not (Seq_contains (Seq_range 0 n@108@01) i2@147@01)))))
    (or
      (Seq_contains (Seq_range 0 n@108@01) i1@146@01)
      (not (Seq_contains (Seq_range 0 n@108@01) i1@146@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@146@01)
        (and
          (Seq_contains (Seq_range 0 n@108@01) i2@147@01)
          (not (= i1@146@01 i2@147@01))))
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@146@01)
        (Seq_contains (Seq_range 0 n@108@01) i2@147@01)
        (not (= i1@146@01 i2@147@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 n@108@01) i1@146@01)
          (and
            (Seq_contains (Seq_range 0 n@108@01) i2@147@01)
            (not (= i1@146@01 i2@147@01)))))
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@146@01)
        (and
          (Seq_contains (Seq_range 0 n@108@01) i2@147@01)
          (not (= i1@146@01 i2@147@01))))))
  :pattern ((Seq_contains (Seq_range 0 n@108@01) i1@146@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
    i2@147@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@108@01) i1@146@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
    i2@147@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0102.vpr@64@11@64@115-aux|)))
(assert (forall ((i1@146@01 Int) (i2@147@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 n@108@01) i1@146@01)
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@146@01)
        (or
          (Seq_contains (Seq_range 0 n@108@01) i2@147@01)
          (not (Seq_contains (Seq_range 0 n@108@01) i2@147@01)))))
    (or
      (Seq_contains (Seq_range 0 n@108@01) i1@146@01)
      (not (Seq_contains (Seq_range 0 n@108@01) i1@146@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@146@01)
        (and
          (Seq_contains (Seq_range 0 n@108@01) i2@147@01)
          (not (= i1@146@01 i2@147@01))))
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@146@01)
        (Seq_contains (Seq_range 0 n@108@01) i2@147@01)
        (not (= i1@146@01 i2@147@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 n@108@01) i1@146@01)
          (and
            (Seq_contains (Seq_range 0 n@108@01) i2@147@01)
            (not (= i1@146@01 i2@147@01)))))
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@146@01)
        (and
          (Seq_contains (Seq_range 0 n@108@01) i2@147@01)
          (not (= i1@146@01 i2@147@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@108@01) i1@146@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
    i2@147@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0102.vpr@64@11@64@115-aux|)))
(assert (forall ((i1@146@01 Int) (i2@147@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 n@108@01) i1@146@01)
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@146@01)
        (or
          (Seq_contains (Seq_range 0 n@108@01) i2@147@01)
          (not (Seq_contains (Seq_range 0 n@108@01) i2@147@01)))))
    (or
      (Seq_contains (Seq_range 0 n@108@01) i1@146@01)
      (not (Seq_contains (Seq_range 0 n@108@01) i1@146@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@146@01)
        (and
          (Seq_contains (Seq_range 0 n@108@01) i2@147@01)
          (not (= i1@146@01 i2@147@01))))
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@146@01)
        (Seq_contains (Seq_range 0 n@108@01) i2@147@01)
        (not (= i1@146@01 i2@147@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 n@108@01) i1@146@01)
          (and
            (Seq_contains (Seq_range 0 n@108@01) i2@147@01)
            (not (= i1@146@01 i2@147@01)))))
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@146@01)
        (and
          (Seq_contains (Seq_range 0 n@108@01) i2@147@01)
          (not (= i1@146@01 i2@147@01))))))
  :pattern ((Seq_contains (Seq_range 0 n@108@01) i2@147@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
    i1@146@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@108@01) i2@147@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
    i1@146@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0102.vpr@64@11@64@115-aux|)))
(assert (forall ((i1@146@01 Int) (i2@147@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 n@108@01) i1@146@01)
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@146@01)
        (or
          (Seq_contains (Seq_range 0 n@108@01) i2@147@01)
          (not (Seq_contains (Seq_range 0 n@108@01) i2@147@01)))))
    (or
      (Seq_contains (Seq_range 0 n@108@01) i1@146@01)
      (not (Seq_contains (Seq_range 0 n@108@01) i1@146@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@146@01)
        (and
          (Seq_contains (Seq_range 0 n@108@01) i2@147@01)
          (not (= i1@146@01 i2@147@01))))
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@146@01)
        (Seq_contains (Seq_range 0 n@108@01) i2@147@01)
        (not (= i1@146@01 i2@147@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 n@108@01) i1@146@01)
          (and
            (Seq_contains (Seq_range 0 n@108@01) i2@147@01)
            (not (= i1@146@01 i2@147@01)))))
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@146@01)
        (and
          (Seq_contains (Seq_range 0 n@108@01) i2@147@01)
          (not (= i1@146@01 i2@147@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@108@01) i2@147@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
    i1@146@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0102.vpr@64@11@64@115-aux|)))
(assert (forall ((i1@146@01 Int) (i2@147@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 n@108@01) i1@146@01)
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@146@01)
        (or
          (Seq_contains (Seq_range 0 n@108@01) i2@147@01)
          (not (Seq_contains (Seq_range 0 n@108@01) i2@147@01)))))
    (or
      (Seq_contains (Seq_range 0 n@108@01) i1@146@01)
      (not (Seq_contains (Seq_range 0 n@108@01) i1@146@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@146@01)
        (and
          (Seq_contains (Seq_range 0 n@108@01) i2@147@01)
          (not (= i1@146@01 i2@147@01))))
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@146@01)
        (Seq_contains (Seq_range 0 n@108@01) i2@147@01)
        (not (= i1@146@01 i2@147@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 n@108@01) i1@146@01)
          (and
            (Seq_contains (Seq_range 0 n@108@01) i2@147@01)
            (not (= i1@146@01 i2@147@01)))))
      (and
        (Seq_contains (Seq_range 0 n@108@01) i1@146@01)
        (and
          (Seq_contains (Seq_range 0 n@108@01) i2@147@01)
          (not (= i1@146@01 i2@147@01))))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
    i1@146@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
    i2@147@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0102.vpr@64@11@64@115-aux|)))
(push) ; 3
(assert (not (forall ((i1@146@01 Int) (i2@147@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 n@108@01) i1@146@01)
      (and
        (Seq_contains (Seq_range 0 n@108@01) i2@147@01)
        (not (= i1@146@01 i2@147@01))))
    (not
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
          i1@146@01)
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
          i2@147@01))))
  :pattern ((Seq_contains (Seq_range 0 n@108@01) i1@146@01) (Seq_contains
    (Seq_range 0 n@108@01)
    i2@147@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@108@01) i1@146@01) (Seq_contains_trigger
    (Seq_range 0 n@108@01)
    i2@147@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@108@01) i1@146@01) (Seq_contains_trigger
    (Seq_range 0 n@108@01)
    i2@147@01))
  :pattern ((Seq_contains (Seq_range 0 n@108@01) i1@146@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
    i2@147@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@108@01) i1@146@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
    i2@147@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@108@01) i1@146@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
    i2@147@01))
  :pattern ((Seq_contains (Seq_range 0 n@108@01) i2@147@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
    i1@146@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@108@01) i2@147@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
    i1@146@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@108@01) i2@147@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
    i1@146@01))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
    i1@146@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
    i2@147@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0102.vpr@64@11@64@115|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i1@146@01 Int) (i2@147@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 n@108@01) i1@146@01)
      (and
        (Seq_contains (Seq_range 0 n@108@01) i2@147@01)
        (not (= i1@146@01 i2@147@01))))
    (not
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
          i1@146@01)
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
          i2@147@01))))
  :pattern ((Seq_contains (Seq_range 0 n@108@01) i1@146@01) (Seq_contains
    (Seq_range 0 n@108@01)
    i2@147@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@108@01) i1@146@01) (Seq_contains_trigger
    (Seq_range 0 n@108@01)
    i2@147@01))
  :pattern ((Seq_contains (Seq_range 0 n@108@01) i1@146@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
    i2@147@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@108@01) i1@146@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
    i2@147@01))
  :pattern ((Seq_contains (Seq_range 0 n@108@01) i2@147@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
    i1@146@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 n@108@01) i2@147@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
    i1@146@01))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
    i1@146@01) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
    i2@147@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0102.vpr@64@11@64@115|)))
(declare-const i@148@01 Int)
(push) ; 3
; [eval] (i in [0..n))
; [eval] [0..n)
(assert (Seq_contains (Seq_range 0 n@108@01) i@148@01))
; [eval] this.array[i]
(push) ; 4
(assert (not (>= i@148@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (<
  i@148@01
  (Seq_length ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@149@01 ($Ref) Int)
(declare-fun img@150@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@148@01 Int) (i2@148@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 n@108@01) i1@148@01)
      (Seq_contains (Seq_range 0 n@108@01) i2@148@01)
      (=
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
          i1@148@01)
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
          i2@148@01)))
    (= i1@148@01 i2@148@01))
  
  :qid |value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@148@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 n@108@01) i@148@01)
    (and
      (=
        (inv@149@01 (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
          i@148@01))
        i@148@01)
      (img@150@01 (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
        i@148@01))))
  :pattern ((Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
    i@148@01))
  :qid |value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@150@01 r) (Seq_contains (Seq_range 0 n@108@01) (inv@149@01 r)))
    (=
      (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
        (inv@149@01 r))
      r))
  :pattern ((inv@149@01 r))
  :qid |value-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@151@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 n@108@01) (inv@149@01 r))
      (img@150@01 r)
      (=
        r
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
          (inv@149@01 r))))
    ($Perm.min
      (ite
        (and (img@125@01 r) (Seq_contains (Seq_range 0 n@108@01) (inv@124@01 r)))
        (-
          (- (- $Perm.Write (pTaken@127@01 r)) (pTaken@130@01 r))
          (pTaken@141@01 r))
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
(define-fun pTaken@152@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 n@108@01) (inv@149@01 r))
      (img@150@01 r)
      (=
        r
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
          (inv@149@01 r))))
    ($Perm.min
      (ite
        (=
          r
          (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2))
        $Perm.Write
        $Perm.No)
      (- (/ (to_real 1) (to_real 2)) (pTaken@151@01 r)))
    $Perm.No))
(define-fun pTaken@153@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 n@108@01) (inv@149@01 r))
      (img@150@01 r)
      (=
        r
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
          (inv@149@01 r))))
    ($Perm.min
      (ite
        (=
          r
          (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0))
        $Perm.Write
        $Perm.No)
      (- (- (/ (to_real 1) (to_real 2)) (pTaken@151@01 r)) (pTaken@152@01 r)))
    $Perm.No))
(define-fun pTaken@154@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 n@108@01) (inv@149@01 r))
      (img@150@01 r)
      (=
        r
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
          (inv@149@01 r))))
    ($Perm.min
      (ite
        (=
          r
          (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1))
        $Perm.Write
        $Perm.No)
      (-
        (- (- (/ (to_real 1) (to_real 2)) (pTaken@151@01 r)) (pTaken@152@01 r))
        (pTaken@153@01 r)))
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
        (and (img@125@01 r) (Seq_contains (Seq_range 0 n@108@01) (inv@124@01 r)))
        (-
          (- (- $Perm.Write (pTaken@127@01 r)) (pTaken@130@01 r))
          (pTaken@141@01 r))
        $Perm.No)
      (pTaken@151@01 r))
    $Perm.No)
  
  :qid |quant-u-77|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@151@01 r) $Perm.No)
  
  :qid |quant-u-78|))))
(check-sat)
; unknown
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
      (Seq_contains (Seq_range 0 n@108@01) (inv@149@01 r))
      (img@150@01 r)
      (=
        r
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
          (inv@149@01 r))))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@151@01 r)) $Perm.No))
  
  :qid |quant-u-79|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (=
  (-
    (ite
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2))
      $Perm.Write
      $Perm.No)
    (pTaken@152@01 (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
      2)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@152@01 r) $Perm.No)
  
  :qid |quant-u-81|))))
(check-sat)
; unknown
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
      (Seq_contains (Seq_range 0 n@108@01) (inv@149@01 r))
      (img@150@01 r)
      (=
        r
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
          (inv@149@01 r))))
    (=
      (- (- (/ (to_real 1) (to_real 2)) (pTaken@151@01 r)) (pTaken@152@01 r))
      $Perm.No))
  
  :qid |quant-u-82|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (=
  (-
    (ite
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0))
      $Perm.Write
      $Perm.No)
    (pTaken@153@01 (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
      0)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@153@01 r) $Perm.No)
  
  :qid |quant-u-84|))))
(check-sat)
; unknown
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
      (Seq_contains (Seq_range 0 n@108@01) (inv@149@01 r))
      (img@150@01 r)
      (=
        r
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
          (inv@149@01 r))))
    (=
      (-
        (- (- (/ (to_real 1) (to_real 2)) (pTaken@151@01 r)) (pTaken@152@01 r))
        (pTaken@153@01 r))
      $Perm.No))
  
  :qid |quant-u-85|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (=
  (-
    (ite
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1))
      $Perm.Write
      $Perm.No)
    (pTaken@154@01 (Seq_index
      ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
      1)))
  $Perm.No)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@154@01 r) $Perm.No)
  
  :qid |quant-u-87|))))
(check-sat)
; unknown
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
      (Seq_contains (Seq_range 0 n@108@01) (inv@149@01 r))
      (img@150@01 r)
      (=
        r
        (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
          (inv@149@01 r))))
    (=
      (-
        (-
          (- (- (/ (to_real 1) (to_real 2)) (pTaken@151@01 r)) (pTaken@152@01 r))
          (pTaken@153@01 r))
        (pTaken@154@01 r))
      $Perm.No))
  
  :qid |quant-u-88|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@155@01 $FVF<value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2))
    (=
      ($FVF.lookup_value (as sm@155@01  $FVF<value>) r)
      ($FVF.lookup_value (as sm@144@01  $FVF<value>) r)))
  :pattern (($FVF.lookup_value (as sm@155@01  $FVF<value>) r))
  :pattern (($FVF.lookup_value (as sm@144@01  $FVF<value>) r))
  :qid |qp.fvfValDef21|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0))
    (=
      ($FVF.lookup_value (as sm@155@01  $FVF<value>) r)
      ($FVF.lookup_value (as sm@136@01  $FVF<value>) r)))
  :pattern (($FVF.lookup_value (as sm@155@01  $FVF<value>) r))
  :pattern (($FVF.lookup_value (as sm@136@01  $FVF<value>) r))
  :qid |qp.fvfValDef22|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1))
    (=
      ($FVF.lookup_value (as sm@155@01  $FVF<value>) r)
      ($FVF.lookup_value (as sm@140@01  $FVF<value>) r)))
  :pattern (($FVF.lookup_value (as sm@155@01  $FVF<value>) r))
  :pattern (($FVF.lookup_value (as sm@140@01  $FVF<value>) r))
  :qid |qp.fvfValDef23|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@125@01 r) (Seq_contains (Seq_range 0 n@108@01) (inv@124@01 r)))
      (<
        $Perm.No
        (-
          (- (- $Perm.Write (pTaken@127@01 r)) (pTaken@130@01 r))
          (pTaken@141@01 r)))
      false)
    (=
      ($FVF.lookup_value (as sm@155@01  $FVF<value>) r)
      ($FVF.lookup_value $t@123@01 r)))
  :pattern (($FVF.lookup_value (as sm@155@01  $FVF<value>) r))
  :pattern (($FVF.lookup_value $t@123@01 r))
  :qid |qp.fvfValDef24|)))
(set-option :timeout 0)
(push) ; 3
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0)
  (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2)
  (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2)
  (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2))
      $Perm.Write
      $Perm.No)
    (ite
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2))
      $Perm.Write
      $Perm.No)
    (ite
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0))
      $Perm.Write
      $Perm.No)
    (ite
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0))
      $Perm.Write
      $Perm.No)
    (ite
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1))
      $Perm.Write
      $Perm.No)
    (ite
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1))
      $Perm.Write
      $Perm.No)
    (ite
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (and
    (=
      (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2)
      (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2))
    (=
      (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0)
      (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0)))
  (not
    (=
      ($FVF.lookup_value (as sm@144@01  $FVF<value>) (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
        2))
      ($FVF.lookup_value (as sm@136@01  $FVF<value>) (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
        0)))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (and
    (=
      (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2)
      (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2))
    (=
      (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1)
      (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1)))
  (not
    (=
      ($FVF.lookup_value (as sm@144@01  $FVF<value>) (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
        2))
      ($FVF.lookup_value (as sm@140@01  $FVF<value>) (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
        1)))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (and
    (=
      (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0)
      (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0))
    (=
      (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2)
      (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2)))
  (not
    (=
      ($FVF.lookup_value (as sm@136@01  $FVF<value>) (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
        0))
      ($FVF.lookup_value (as sm@144@01  $FVF<value>) (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
        2)))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (and
    (=
      (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0)
      (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0))
    (=
      (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1)
      (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1)))
  (not
    (=
      ($FVF.lookup_value (as sm@136@01  $FVF<value>) (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
        0))
      ($FVF.lookup_value (as sm@140@01  $FVF<value>) (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
        1)))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (and
    (=
      (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1)
      (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1))
    (=
      (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2)
      (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2)))
  (not
    (=
      ($FVF.lookup_value (as sm@140@01  $FVF<value>) (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
        1))
      ($FVF.lookup_value (as sm@144@01  $FVF<value>) (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
        2)))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (and
    (=
      (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1)
      (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1))
    (=
      (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0)
      (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0)))
  (not
    (=
      ($FVF.lookup_value (as sm@140@01  $FVF<value>) (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
        1))
      ($FVF.lookup_value (as sm@136@01  $FVF<value>) (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
        0)))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and
  (and
    (not
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0)))
    (not
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1))))
  (and
    (not
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2)))
    (not
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1))))
  (and
    (not
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2)))
    (not
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0))))))
(assert (and
  (and
    (not
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0)))
    (not
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1))))
  (and
    (not
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2)))
    (not
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1))))
  (and
    (not
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2)))
    (not
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0))))))
; Definitional axioms for snapshot map values
(declare-const pm@156@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_value (as pm@156@01  $FPM) r)
    (+
      (+
        (+
          (ite
            (=
              r
              (Seq_index
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
                2))
            $Perm.Write
            $Perm.No)
          (ite
            (=
              r
              (Seq_index
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
                0))
            $Perm.Write
            $Perm.No))
        (ite
          (=
            r
            (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
              1))
          $Perm.Write
          $Perm.No))
      (ite
        (and (img@125@01 r) (Seq_contains (Seq_range 0 n@108@01) (inv@124@01 r)))
        (-
          (- (- $Perm.Write (pTaken@127@01 r)) (pTaken@130@01 r))
          (pTaken@141@01 r))
        $Perm.No)))
  :pattern (($FVF.perm_value (as pm@156@01  $FPM) r))
  :qid |qp.resPrmSumDef25|)))
(assert (<=
  ($FVF.perm_value (as pm@156@01  $FPM) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
    2))
  $Perm.Write))
(assert (<=
  ($FVF.perm_value (as pm@156@01  $FPM) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
    0))
  $Perm.Write))
(assert (<=
  ($FVF.perm_value (as pm@156@01  $FPM) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
    1))
  $Perm.Write))
; Assume upper permission bound for field value
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_value (as pm@156@01  $FPM) r) $Perm.Write)
  :pattern ((inv@124@01 r))
  :qid |qp-fld-prm-bnd|)))
(set-option :timeout 0)
(push) ; 3
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0)
  (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1)
  (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1)
  (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1))
      (-
        $Perm.Write
        (pTaken@154@01 (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
          1)))
      $Perm.No)
    (ite
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0))
      (-
        $Perm.Write
        (pTaken@153@01 (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
          0)))
      $Perm.No)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1))
      (-
        $Perm.Write
        (pTaken@154@01 (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
          1)))
      $Perm.No)
    (ite
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2))
      (-
        $Perm.Write
        (pTaken@152@01 (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
          2)))
      $Perm.No)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0))
      (-
        $Perm.Write
        (pTaken@153@01 (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
          0)))
      $Perm.No)
    (ite
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1))
      (-
        $Perm.Write
        (pTaken@154@01 (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
          1)))
      $Perm.No)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0))
      (-
        $Perm.Write
        (pTaken@153@01 (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
          0)))
      $Perm.No)
    (ite
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2))
      (-
        $Perm.Write
        (pTaken@152@01 (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
          2)))
      $Perm.No)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2))
      (-
        $Perm.Write
        (pTaken@152@01 (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
          2)))
      $Perm.No)
    (ite
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1))
      (-
        $Perm.Write
        (pTaken@154@01 (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
          1)))
      $Perm.No)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2))
      (-
        $Perm.Write
        (pTaken@152@01 (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
          2)))
      $Perm.No)
    (ite
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0))
      (-
        $Perm.Write
        (pTaken@153@01 (Seq_index
          ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
          0)))
      $Perm.No)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (and
    (ite
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1))
      (<
        $Perm.No
        (-
          $Perm.Write
          (pTaken@154@01 (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
            1))))
      false)
    (ite
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0))
      (<
        $Perm.No
        (-
          $Perm.Write
          (pTaken@153@01 (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
            0))))
      false))
  (not
    (=
      ($FVF.lookup_value (as sm@140@01  $FVF<value>) (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
        1))
      ($FVF.lookup_value (as sm@136@01  $FVF<value>) (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
        0)))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (and
    (ite
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1))
      (<
        $Perm.No
        (-
          $Perm.Write
          (pTaken@154@01 (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
            1))))
      false)
    (ite
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2))
      (<
        $Perm.No
        (-
          $Perm.Write
          (pTaken@152@01 (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
            2))))
      false))
  (not
    (=
      ($FVF.lookup_value (as sm@140@01  $FVF<value>) (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
        1))
      ($FVF.lookup_value (as sm@144@01  $FVF<value>) (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
        2)))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (and
    (ite
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0))
      (<
        $Perm.No
        (-
          $Perm.Write
          (pTaken@153@01 (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
            0))))
      false)
    (ite
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1))
      (<
        $Perm.No
        (-
          $Perm.Write
          (pTaken@154@01 (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
            1))))
      false))
  (not
    (=
      ($FVF.lookup_value (as sm@136@01  $FVF<value>) (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
        0))
      ($FVF.lookup_value (as sm@140@01  $FVF<value>) (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
        1)))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (and
    (ite
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0))
      (<
        $Perm.No
        (-
          $Perm.Write
          (pTaken@153@01 (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
            0))))
      false)
    (ite
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2))
      (<
        $Perm.No
        (-
          $Perm.Write
          (pTaken@152@01 (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
            2))))
      false))
  (not
    (=
      ($FVF.lookup_value (as sm@136@01  $FVF<value>) (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
        0))
      ($FVF.lookup_value (as sm@144@01  $FVF<value>) (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
        2)))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (and
    (ite
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2))
      (<
        $Perm.No
        (-
          $Perm.Write
          (pTaken@152@01 (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
            2))))
      false)
    (ite
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1))
      (<
        $Perm.No
        (-
          $Perm.Write
          (pTaken@154@01 (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
            1))))
      false))
  (not
    (=
      ($FVF.lookup_value (as sm@144@01  $FVF<value>) (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
        2))
      ($FVF.lookup_value (as sm@140@01  $FVF<value>) (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
        1)))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (and
    (ite
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2))
      (<
        $Perm.No
        (-
          $Perm.Write
          (pTaken@152@01 (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
            2))))
      false)
    (ite
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0))
      (<
        $Perm.No
        (-
          $Perm.Write
          (pTaken@153@01 (Seq_index
            ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
            0))))
      false))
  (not
    (=
      ($FVF.lookup_value (as sm@144@01  $FVF<value>) (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
        2))
      ($FVF.lookup_value (as sm@136@01  $FVF<value>) (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
        0)))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and
  (and
    (not
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0)))
    (not
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2))))
  (and
    (not
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1)))
    (not
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2))))
  (and
    (not
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1)))
    (not
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0))))))
(declare-const sm@157@01 $FVF<value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (=
        r
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1))
      (< $Perm.No (- $Perm.Write (pTaken@154@01 r)))
      false)
    (=
      ($FVF.lookup_value (as sm@157@01  $FVF<value>) r)
      ($FVF.lookup_value (as sm@140@01  $FVF<value>) r)))
  :pattern (($FVF.lookup_value (as sm@157@01  $FVF<value>) r))
  :pattern (($FVF.lookup_value (as sm@140@01  $FVF<value>) r))
  :qid |qp.fvfValDef26|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (=
        r
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0))
      (< $Perm.No (- $Perm.Write (pTaken@153@01 r)))
      false)
    (=
      ($FVF.lookup_value (as sm@157@01  $FVF<value>) r)
      ($FVF.lookup_value (as sm@136@01  $FVF<value>) r)))
  :pattern (($FVF.lookup_value (as sm@157@01  $FVF<value>) r))
  :pattern (($FVF.lookup_value (as sm@136@01  $FVF<value>) r))
  :qid |qp.fvfValDef27|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (=
        r
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2))
      (< $Perm.No (- $Perm.Write (pTaken@152@01 r)))
      false)
    (=
      ($FVF.lookup_value (as sm@157@01  $FVF<value>) r)
      ($FVF.lookup_value (as sm@144@01  $FVF<value>) r)))
  :pattern (($FVF.lookup_value (as sm@157@01  $FVF<value>) r))
  :pattern (($FVF.lookup_value (as sm@144@01  $FVF<value>) r))
  :qid |qp.fvfValDef28|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and (img@125@01 r) (Seq_contains (Seq_range 0 n@108@01) (inv@124@01 r)))
      (<
        $Perm.No
        (-
          (-
            (- (- $Perm.Write (pTaken@127@01 r)) (pTaken@130@01 r))
            (pTaken@141@01 r))
          (pTaken@151@01 r)))
      false)
    (=
      ($FVF.lookup_value (as sm@157@01  $FVF<value>) r)
      ($FVF.lookup_value $t@123@01 r)))
  :pattern (($FVF.lookup_value (as sm@157@01  $FVF<value>) r))
  :pattern (($FVF.lookup_value $t@123@01 r))
  :qid |qp.fvfValDef29|)))
(declare-const pm@158@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_value (as pm@158@01  $FPM) r)
    (+
      (+
        (+
          (ite
            (=
              r
              (Seq_index
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
                1))
            (- $Perm.Write (pTaken@154@01 r))
            $Perm.No)
          (ite
            (=
              r
              (Seq_index
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
                0))
            (- $Perm.Write (pTaken@153@01 r))
            $Perm.No))
        (ite
          (=
            r
            (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
              2))
          (- $Perm.Write (pTaken@152@01 r))
          $Perm.No))
      (ite
        (and (img@125@01 r) (Seq_contains (Seq_range 0 n@108@01) (inv@124@01 r)))
        (-
          (-
            (- (- $Perm.Write (pTaken@127@01 r)) (pTaken@130@01 r))
            (pTaken@141@01 r))
          (pTaken@151@01 r))
        $Perm.No)))
  :pattern (($FVF.perm_value (as pm@158@01  $FPM) r))
  :qid |qp.resPrmSumDef30|)))
(assert (<=
  ($FVF.perm_value (as pm@158@01  $FPM) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
    1))
  $Perm.Write))
(assert (<=
  ($FVF.perm_value (as pm@158@01  $FPM) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
    0))
  $Perm.Write))
(assert (<=
  ($FVF.perm_value (as pm@158@01  $FPM) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
    2))
  $Perm.Write))
; Assume upper permission bound for field value
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_value (as pm@158@01  $FPM) r) $Perm.Write)
  :pattern ((inv@124@01 r))
  :qid |qp-fld-prm-bnd|)))
(set-option :timeout 0)
(push) ; 3
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0)
  (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2)
  (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (=
  (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2)
  (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2))
      $Perm.Write
      $Perm.No)
    (ite
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2))
      $Perm.Write
      $Perm.No)
    (ite
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0))
      $Perm.Write
      $Perm.No)
    (ite
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0))
      $Perm.Write
      $Perm.No)
    (ite
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1))
      $Perm.Write
      $Perm.No)
    (ite
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (<
  $Perm.Write
  (+
    (ite
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1))
      $Perm.Write
      $Perm.No)
    (ite
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (and
    (=
      (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2)
      (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2))
    (=
      (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0)
      (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0)))
  (not
    (=
      ($FVF.lookup_value (as sm@144@01  $FVF<value>) (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
        2))
      ($FVF.lookup_value (as sm@136@01  $FVF<value>) (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
        0)))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (and
    (=
      (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2)
      (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2))
    (=
      (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1)
      (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1)))
  (not
    (=
      ($FVF.lookup_value (as sm@144@01  $FVF<value>) (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
        2))
      ($FVF.lookup_value (as sm@140@01  $FVF<value>) (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
        1)))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (and
    (=
      (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0)
      (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0))
    (=
      (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2)
      (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2)))
  (not
    (=
      ($FVF.lookup_value (as sm@136@01  $FVF<value>) (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
        0))
      ($FVF.lookup_value (as sm@144@01  $FVF<value>) (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
        2)))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (and
    (=
      (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0)
      (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0))
    (=
      (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1)
      (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1)))
  (not
    (=
      ($FVF.lookup_value (as sm@136@01  $FVF<value>) (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
        0))
      ($FVF.lookup_value (as sm@140@01  $FVF<value>) (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
        1)))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (and
    (=
      (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1)
      (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1))
    (=
      (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2)
      (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2)))
  (not
    (=
      ($FVF.lookup_value (as sm@140@01  $FVF<value>) (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
        1))
      ($FVF.lookup_value (as sm@144@01  $FVF<value>) (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
        2)))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (and
  (and
    (=
      (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1)
      (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1))
    (=
      (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0)
      (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0)))
  (not
    (=
      ($FVF.lookup_value (as sm@140@01  $FVF<value>) (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
        1))
      ($FVF.lookup_value (as sm@136@01  $FVF<value>) (Seq_index
        ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
        0)))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and
  (and
    (not
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0)))
    (not
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1))))
  (and
    (not
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2)))
    (not
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1))))
  (and
    (not
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2)))
    (not
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0))))))
(assert (and
  (and
    (not
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0)))
    (not
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1))))
  (and
    (not
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2)))
    (not
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1))))
  (and
    (not
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 2)))
    (not
      (=
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 1)
        (Seq_index ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01)) 0))))))
; Definitional axioms for snapshot map values
(declare-const pm@159@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_value (as pm@159@01  $FPM) r)
    (+
      (+
        (+
          (ite
            (=
              r
              (Seq_index
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
                2))
            $Perm.Write
            $Perm.No)
          (ite
            (=
              r
              (Seq_index
                ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
                0))
            $Perm.Write
            $Perm.No))
        (ite
          (=
            r
            (Seq_index
              ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
              1))
          $Perm.Write
          $Perm.No))
      (ite
        (and (img@125@01 r) (Seq_contains (Seq_range 0 n@108@01) (inv@124@01 r)))
        (-
          (- (- $Perm.Write (pTaken@127@01 r)) (pTaken@130@01 r))
          (pTaken@141@01 r))
        $Perm.No)))
  :pattern (($FVF.perm_value (as pm@159@01  $FPM) r))
  :qid |qp.resPrmSumDef31|)))
(assert (<=
  ($FVF.perm_value (as pm@159@01  $FPM) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
    2))
  $Perm.Write))
(assert (<=
  ($FVF.perm_value (as pm@159@01  $FPM) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
    0))
  $Perm.Write))
(assert (<=
  ($FVF.perm_value (as pm@159@01  $FPM) (Seq_index
    ($SortWrappers.$SnapToSeq<$Ref> ($Snap.first $t@109@01))
    1))
  $Perm.Write))
; Assume upper permission bound for field value
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_value (as pm@159@01  $FPM) r) $Perm.Write)
  :pattern ((inv@124@01 r))
  :qid |qp-fld-prm-bnd|)))
(set-option :timeout 0)
(push) ; 3
(assert (not false))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
