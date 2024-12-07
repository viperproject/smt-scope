(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:07:28
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/sequences/sequence_incompletenesses.vpr
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
(declare-sort Seq<Seq<Int>> 0)
(declare-sort Seq<Int> 0)
(declare-sort Set<Seq<Seq<Int>>> 0)
(declare-sort Set<$Ref> 0)
(declare-sort Set<$Snap> 0)
(declare-sort Array_ 0)
(declare-sort $FVF<val> 0)
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
(declare-fun $SortWrappers.Seq<Seq<Int>>To$Snap (Seq<Seq<Int>>) $Snap)
(declare-fun $SortWrappers.$SnapToSeq<Seq<Int>> ($Snap) Seq<Seq<Int>>)
(assert (forall ((x Seq<Seq<Int>>)) (!
    (= x ($SortWrappers.$SnapToSeq<Seq<Int>>($SortWrappers.Seq<Seq<Int>>To$Snap x)))
    :pattern (($SortWrappers.Seq<Seq<Int>>To$Snap x))
    :qid |$Snap.$SnapToSeq<Seq<Int>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Seq<Seq<Int>>To$Snap($SortWrappers.$SnapToSeq<Seq<Int>> x)))
    :pattern (($SortWrappers.$SnapToSeq<Seq<Int>> x))
    :qid |$Snap.Seq<Seq<Int>>To$SnapToSeq<Seq<Int>>|
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
(declare-fun $SortWrappers.Set<Seq<Seq<Int>>>To$Snap (Set<Seq<Seq<Int>>>) $Snap)
(declare-fun $SortWrappers.$SnapToSet<Seq<Seq<Int>>> ($Snap) Set<Seq<Seq<Int>>>)
(assert (forall ((x Set<Seq<Seq<Int>>>)) (!
    (= x ($SortWrappers.$SnapToSet<Seq<Seq<Int>>>($SortWrappers.Set<Seq<Seq<Int>>>To$Snap x)))
    :pattern (($SortWrappers.Set<Seq<Seq<Int>>>To$Snap x))
    :qid |$Snap.$SnapToSet<Seq<Seq<Int>>>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Set<Seq<Seq<Int>>>To$Snap($SortWrappers.$SnapToSet<Seq<Seq<Int>>> x)))
    :pattern (($SortWrappers.$SnapToSet<Seq<Seq<Int>>> x))
    :qid |$Snap.Set<Seq<Seq<Int>>>To$SnapToSet<Seq<Seq<Int>>>|
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
(declare-fun $SortWrappers.Array_To$Snap (Array_) $Snap)
(declare-fun $SortWrappers.$SnapToArray_ ($Snap) Array_)
(assert (forall ((x Array_)) (!
    (= x ($SortWrappers.$SnapToArray_($SortWrappers.Array_To$Snap x)))
    :pattern (($SortWrappers.Array_To$Snap x))
    :qid |$Snap.$SnapToArray_To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Array_To$Snap($SortWrappers.$SnapToArray_ x)))
    :pattern (($SortWrappers.$SnapToArray_ x))
    :qid |$Snap.Array_To$SnapToArray_|
    )))
; Declaring additional sort wrappers
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
; ////////// Symbols
(declare-fun Set_card (Set<Seq<Seq<Int>>>) Int)
(declare-const Set_empty Set<Seq<Seq<Int>>>)
(declare-fun Set_in (Seq<Seq<Int>> Set<Seq<Seq<Int>>>) Bool)
(declare-fun Set_singleton (Seq<Seq<Int>>) Set<Seq<Seq<Int>>>)
(declare-fun Set_unionone (Set<Seq<Seq<Int>>> Seq<Seq<Int>>) Set<Seq<Seq<Int>>>)
(declare-fun Set_union (Set<Seq<Seq<Int>>> Set<Seq<Seq<Int>>>) Set<Seq<Seq<Int>>>)
(declare-fun Set_intersection (Set<Seq<Seq<Int>>> Set<Seq<Seq<Int>>>) Set<Seq<Seq<Int>>>)
(declare-fun Set_difference (Set<Seq<Seq<Int>>> Set<Seq<Seq<Int>>>) Set<Seq<Seq<Int>>>)
(declare-fun Set_subset (Set<Seq<Seq<Int>>> Set<Seq<Seq<Int>>>) Bool)
(declare-fun Set_equal (Set<Seq<Seq<Int>>> Set<Seq<Seq<Int>>>) Bool)
(declare-fun Set_skolem_diff (Set<Seq<Seq<Int>>> Set<Seq<Seq<Int>>>) Seq<Seq<Int>>)
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
(declare-fun Seq_length (Seq<Seq<Int>>) Int)
(declare-const Seq_empty Seq<Seq<Int>>)
(declare-fun Seq_singleton (Seq<Int>) Seq<Seq<Int>>)
(declare-fun Seq_append (Seq<Seq<Int>> Seq<Seq<Int>>) Seq<Seq<Int>>)
(declare-fun Seq_index (Seq<Seq<Int>> Int) Seq<Int>)
(declare-fun Seq_add (Int Int) Int)
(declare-fun Seq_sub (Int Int) Int)
(declare-fun Seq_update (Seq<Seq<Int>> Int Seq<Int>) Seq<Seq<Int>>)
(declare-fun Seq_take (Seq<Seq<Int>> Int) Seq<Seq<Int>>)
(declare-fun Seq_drop (Seq<Seq<Int>> Int) Seq<Seq<Int>>)
(declare-fun Seq_contains (Seq<Seq<Int>> Seq<Int>) Bool)
(declare-fun Seq_contains_trigger (Seq<Seq<Int>> Seq<Int>) Bool)
(declare-fun Seq_skolem (Seq<Seq<Int>> Seq<Int>) Int)
(declare-fun Seq_equal (Seq<Seq<Int>> Seq<Seq<Int>>) Bool)
(declare-fun Seq_skolem_diff (Seq<Seq<Int>> Seq<Seq<Int>>) Int)
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
(declare-fun len<Int> (Array_) Int)
(declare-fun slot<Ref> (Array_ Int) $Ref)
(declare-fun slotToArray<Array> ($Ref) Array_)
(declare-fun slotToIndex<Int> ($Ref) Int)
; /field_value_functions_declarations.smt2 [val: Seq[Seq[Int]]]
(declare-fun $FVF.domain_val ($FVF<val>) Set<$Ref>)
(declare-fun $FVF.lookup_val ($FVF<val> $Ref) Seq<Seq<Int>>)
(declare-fun $FVF.after_val ($FVF<val> $FVF<val>) Bool)
(declare-fun $FVF.loc_val (Seq<Seq<Int>> $Ref) Bool)
(declare-fun $FVF.perm_val ($FPM $Ref) $Perm)
(declare-const $fvfTOP_val $FVF<val>)
; Declaring symbols related to program functions (from program analysis)
(declare-fun valid ($Snap Seq<Int> Int Bool) Bool)
(declare-fun valid%limited ($Snap Seq<Int> Int Bool) Bool)
(declare-fun valid%stateless (Seq<Int> Int Bool) Bool)
(declare-fun valid%precondition ($Snap Seq<Int> Int Bool) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
(assert (forall ((s Seq<Seq<Int>>)) (!
  (<= 0 (Seq_length s))
  :pattern ((Seq_length s))
  )))
(assert (= (Seq_length (as Seq_empty  Seq<Seq<Int>>)) 0))
(assert (forall ((s Seq<Seq<Int>>)) (!
  (=> (= (Seq_length s) 0) (= s (as Seq_empty  Seq<Seq<Int>>)))
  :pattern ((Seq_length s))
  )))
(assert (forall ((e Seq<Int>)) (!
  (= (Seq_length (Seq_singleton e)) 1)
  :pattern ((Seq_singleton e))
  )))
(assert (forall ((s0 Seq<Seq<Int>>) (s1 Seq<Seq<Int>>)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Seq<Int>>)))
      (not (= s1 (as Seq_empty  Seq<Seq<Int>>))))
    (= (Seq_length (Seq_append s0 s1)) (+ (Seq_length s0) (Seq_length s1))))
  :pattern ((Seq_length (Seq_append s0 s1)))
  )))
(assert (forall ((s0 Seq<Seq<Int>>) (s1 Seq<Seq<Int>>)) (!
  (and
    (=> (= s0 (as Seq_empty  Seq<Seq<Int>>)) (= (Seq_append s0 s1) s1))
    (=> (= s1 (as Seq_empty  Seq<Seq<Int>>)) (= (Seq_append s0 s1) s0)))
  :pattern ((Seq_append s0 s1))
  )))
(assert (forall ((e Seq<Int>)) (!
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
(assert (forall ((s0 Seq<Seq<Int>>) (s1 Seq<Seq<Int>>) (n Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Seq<Int>>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Seq<Int>>)))
        (and (<= 0 n) (< n (Seq_length s0)))))
    (= (Seq_index (Seq_append s0 s1) n) (Seq_index s0 n)))
  :pattern ((Seq_index (Seq_append s0 s1) n))
  :pattern ((Seq_index s0 n) (Seq_append s0 s1))
  )))
(assert (forall ((s0 Seq<Seq<Int>>) (s1 Seq<Seq<Int>>) (n Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Seq<Int>>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Seq<Int>>)))
        (and (<= (Seq_length s0) n) (< n (Seq_length (Seq_append s0 s1))))))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s0)) (Seq_length s0)) n)
      (=
        (Seq_index (Seq_append s0 s1) n)
        (Seq_index s1 (Seq_sub n (Seq_length s0))))))
  :pattern ((Seq_index (Seq_append s0 s1) n))
  )))
(assert (forall ((s0 Seq<Seq<Int>>) (s1 Seq<Seq<Int>>) (m Int)) (!
  (=>
    (and
      (not (= s0 (as Seq_empty  Seq<Seq<Int>>)))
      (and
        (not (= s1 (as Seq_empty  Seq<Seq<Int>>)))
        (and (<= 0 m) (< m (Seq_length s1)))))
    (and
      (= (Seq_sub (Seq_add m (Seq_length s0)) (Seq_length s0)) m)
      (=
        (Seq_index (Seq_append s0 s1) (Seq_add m (Seq_length s0)))
        (Seq_index s1 m))))
  :pattern ((Seq_index s1 m) (Seq_append s0 s1))
  )))
(assert (forall ((s Seq<Seq<Int>>) (i Int) (v Seq<Int>)) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (= (Seq_length (Seq_update s i v)) (Seq_length s)))
  :pattern ((Seq_length (Seq_update s i v)))
  :pattern ((Seq_length s) (Seq_update s i v))
  )))
(assert (forall ((s Seq<Seq<Int>>) (i Int) (v Seq<Int>) (n Int)) (!
  (=>
    (and (<= 0 n) (< n (Seq_length s)))
    (and
      (=> (= i n) (= (Seq_index (Seq_update s i v) n) v))
      (=> (not (= i n)) (= (Seq_index (Seq_update s i v) n) (Seq_index s n)))))
  :pattern ((Seq_index (Seq_update s i v) n))
  :pattern ((Seq_index s n) (Seq_update s i v))
  )))
(assert (forall ((s Seq<Seq<Int>>) (n Int)) (!
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
(assert (forall ((s Seq<Seq<Int>>) (n Int) (j Int)) (!
  (=>
    (and (<= 0 j) (and (< j n) (< j (Seq_length s))))
    (= (Seq_index (Seq_take s n) j) (Seq_index s j)))
  :pattern ((Seq_index (Seq_take s n) j))
  :pattern ((Seq_index s j) (Seq_take s n))
  )))
(assert (forall ((s Seq<Seq<Int>>) (n Int)) (!
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
(assert (forall ((s Seq<Seq<Int>>) (n Int) (j Int)) (!
  (=>
    (and (< 0 n) (and (<= 0 j) (< j (- (Seq_length s) n))))
    (and
      (= (Seq_sub (Seq_add j n) n) j)
      (= (Seq_index (Seq_drop s n) j) (Seq_index s (Seq_add j n)))))
  :pattern ((Seq_index (Seq_drop s n) j))
  )))
(assert (forall ((s Seq<Seq<Int>>) (n Int) (i Int)) (!
  (=>
    (and (< 0 n) (and (<= n i) (< i (Seq_length s))))
    (and
      (= (Seq_add (Seq_sub i n) n) i)
      (= (Seq_index (Seq_drop s n) (Seq_sub i n)) (Seq_index s i))))
  :pattern ((Seq_drop s n) (Seq_index s i))
  )))
(assert (forall ((s Seq<Seq<Int>>) (t Seq<Seq<Int>>) (n Int)) (!
  (=>
    (and (< 0 n) (<= n (Seq_length s)))
    (= (Seq_take (Seq_append s t) n) (Seq_take s n)))
  :pattern ((Seq_take (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Seq<Int>>) (t Seq<Seq<Int>>) (n Int)) (!
  (=>
    (and (> n 0) (> n (Seq_length s)))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s)) (Seq_length s)) n)
      (=
        (Seq_take (Seq_append s t) n)
        (Seq_append s (Seq_take t (Seq_sub n (Seq_length s)))))))
  :pattern ((Seq_take (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Seq<Int>>) (t Seq<Seq<Int>>) (n Int)) (!
  (=>
    (and (< 0 n) (<= n (Seq_length s)))
    (= (Seq_drop (Seq_append s t) n) (Seq_append (Seq_drop s n) t)))
  :pattern ((Seq_drop (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Seq<Int>>) (t Seq<Seq<Int>>) (n Int)) (!
  (=>
    (and (> n 0) (> n (Seq_length s)))
    (and
      (= (Seq_add (Seq_sub n (Seq_length s)) (Seq_length s)) n)
      (= (Seq_drop (Seq_append s t) n) (Seq_drop t (Seq_sub n (Seq_length s))))))
  :pattern ((Seq_drop (Seq_append s t) n))
  )))
(assert (forall ((s Seq<Seq<Int>>) (n Int)) (!
  (=> (<= n 0) (= (Seq_take s n) (as Seq_empty  Seq<Seq<Int>>)))
  :pattern ((Seq_take s n))
  )))
(assert (forall ((s Seq<Seq<Int>>) (n Int)) (!
  (=> (<= n 0) (= (Seq_drop s n) s))
  :pattern ((Seq_drop s n))
  )))
(assert (forall ((s Seq<Seq<Int>>) (n Int)) (!
  (=> (>= n (Seq_length s)) (= (Seq_take s n) s))
  :pattern ((Seq_take s n))
  )))
(assert (forall ((s Seq<Seq<Int>>) (n Int)) (!
  (=> (>= n (Seq_length s)) (= (Seq_drop s n) (as Seq_empty  Seq<Seq<Int>>)))
  :pattern ((Seq_drop s n))
  )))
(assert (forall ((s Seq<Seq<Int>>) (x Seq<Int>)) (!
  (=>
    (Seq_contains s x)
    (and
      (<= 0 (Seq_skolem s x))
      (and
        (< (Seq_skolem s x) (Seq_length s))
        (= (Seq_index s (Seq_skolem s x)) x))))
  :pattern ((Seq_contains s x))
  )))
(assert (forall ((s Seq<Seq<Int>>) (x Seq<Int>) (i Int)) (!
  (=>
    (and (<= 0 i) (and (< i (Seq_length s)) (= (Seq_index s i) x)))
    (Seq_contains s x))
  :pattern ((Seq_contains s x) (Seq_index s i))
  )))
(assert (forall ((s Seq<Seq<Int>>) (i Int)) (!
  (=>
    (and (<= 0 i) (< i (Seq_length s)))
    (Seq_contains_trigger s (Seq_index s i)))
  :pattern ((Seq_index s i))
  )))
(assert (forall ((s0 Seq<Seq<Int>>) (s1 Seq<Seq<Int>>)) (!
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
(assert (forall ((a Seq<Seq<Int>>) (b Seq<Seq<Int>>)) (!
  (=> (Seq_equal a b) (= a b))
  :pattern ((Seq_equal a b))
  )))
(assert (forall ((x Seq<Int>) (y Seq<Int>)) (!
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
(assert (forall ((s Set<Seq<Seq<Int>>>)) (!
  (<= 0 (Set_card s))
  :pattern ((Set_card s))
  )))
(assert (forall ((o Seq<Seq<Int>>)) (!
  (not (Set_in o (as Set_empty  Set<Seq<Seq<Int>>>)))
  :pattern ((Set_in o (as Set_empty  Set<Seq<Seq<Int>>>)))
  )))
(assert (forall ((s Set<Seq<Seq<Int>>>)) (!
  (and
    (=> (= (Set_card s) 0) (= s (as Set_empty  Set<Seq<Seq<Int>>>)))
    (=> (not (= (Set_card s) 0)) (exists ((x Seq<Seq<Int>>))  (Set_in x s))))
  :pattern ((Set_card s))
  )))
(assert (forall ((r Seq<Seq<Int>>)) (!
  (Set_in r (Set_singleton r))
  :pattern ((Set_singleton r))
  )))
(assert (forall ((r Seq<Seq<Int>>) (o Seq<Seq<Int>>)) (!
  (= (Set_in o (Set_singleton r)) (= r o))
  :pattern ((Set_in o (Set_singleton r)))
  )))
(assert (forall ((r Seq<Seq<Int>>)) (!
  (= (Set_card (Set_singleton r)) 1)
  :pattern ((Set_card (Set_singleton r)))
  )))
(assert (forall ((a Set<Seq<Seq<Int>>>) (x Seq<Seq<Int>>) (o Seq<Seq<Int>>)) (!
  (= (Set_in o (Set_unionone a x)) (or (= o x) (Set_in o a)))
  :pattern ((Set_in o (Set_unionone a x)))
  )))
(assert (forall ((a Set<Seq<Seq<Int>>>) (x Seq<Seq<Int>>)) (!
  (Set_in x (Set_unionone a x))
  :pattern ((Set_unionone a x))
  )))
(assert (forall ((a Set<Seq<Seq<Int>>>) (x Seq<Seq<Int>>) (y Seq<Seq<Int>>)) (!
  (=> (Set_in y a) (Set_in y (Set_unionone a x)))
  :pattern ((Set_unionone a x) (Set_in y a))
  )))
(assert (forall ((a Set<Seq<Seq<Int>>>) (x Seq<Seq<Int>>)) (!
  (=> (Set_in x a) (= (Set_card (Set_unionone a x)) (Set_card a)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Seq<Seq<Int>>>) (x Seq<Seq<Int>>)) (!
  (=> (not (Set_in x a)) (= (Set_card (Set_unionone a x)) (+ (Set_card a) 1)))
  :pattern ((Set_card (Set_unionone a x)))
  )))
(assert (forall ((a Set<Seq<Seq<Int>>>) (b Set<Seq<Seq<Int>>>) (o Seq<Seq<Int>>)) (!
  (= (Set_in o (Set_union a b)) (or (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_union a b)))
  )))
(assert (forall ((a Set<Seq<Seq<Int>>>) (b Set<Seq<Seq<Int>>>) (y Seq<Seq<Int>>)) (!
  (=> (Set_in y a) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y a))
  )))
(assert (forall ((a Set<Seq<Seq<Int>>>) (b Set<Seq<Seq<Int>>>) (y Seq<Seq<Int>>)) (!
  (=> (Set_in y b) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y b))
  )))
(assert (forall ((a Set<Seq<Seq<Int>>>) (b Set<Seq<Seq<Int>>>) (o Seq<Seq<Int>>)) (!
  (= (Set_in o (Set_intersection a b)) (and (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_intersection a b)))
  :pattern ((Set_intersection a b) (Set_in o a))
  :pattern ((Set_intersection a b) (Set_in o b))
  )))
(assert (forall ((a Set<Seq<Seq<Int>>>) (b Set<Seq<Seq<Int>>>)) (!
  (= (Set_union (Set_union a b) b) (Set_union a b))
  :pattern ((Set_union (Set_union a b) b))
  )))
(assert (forall ((a Set<Seq<Seq<Int>>>) (b Set<Seq<Seq<Int>>>)) (!
  (= (Set_union a (Set_union a b)) (Set_union a b))
  :pattern ((Set_union a (Set_union a b)))
  )))
(assert (forall ((a Set<Seq<Seq<Int>>>) (b Set<Seq<Seq<Int>>>)) (!
  (= (Set_intersection (Set_intersection a b) b) (Set_intersection a b))
  :pattern ((Set_intersection (Set_intersection a b) b))
  )))
(assert (forall ((a Set<Seq<Seq<Int>>>) (b Set<Seq<Seq<Int>>>)) (!
  (= (Set_intersection a (Set_intersection a b)) (Set_intersection a b))
  :pattern ((Set_intersection a (Set_intersection a b)))
  )))
(assert (forall ((a Set<Seq<Seq<Int>>>) (b Set<Seq<Seq<Int>>>)) (!
  (=
    (+ (Set_card (Set_union a b)) (Set_card (Set_intersection a b)))
    (+ (Set_card a) (Set_card b)))
  :pattern ((Set_card (Set_union a b)))
  :pattern ((Set_card (Set_intersection a b)))
  )))
(assert (forall ((a Set<Seq<Seq<Int>>>) (b Set<Seq<Seq<Int>>>) (o Seq<Seq<Int>>)) (!
  (= (Set_in o (Set_difference a b)) (and (Set_in o a) (not (Set_in o b))))
  :pattern ((Set_in o (Set_difference a b)))
  :pattern ((Set_difference a b) (Set_in o a))
  )))
(assert (forall ((a Set<Seq<Seq<Int>>>) (b Set<Seq<Seq<Int>>>) (y Seq<Seq<Int>>)) (!
  (=> (Set_in y b) (not (Set_in y (Set_difference a b))))
  :pattern ((Set_difference a b) (Set_in y b))
  )))
(assert (forall ((a Set<Seq<Seq<Int>>>) (b Set<Seq<Seq<Int>>>)) (!
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
(assert (forall ((a Set<Seq<Seq<Int>>>) (b Set<Seq<Seq<Int>>>)) (!
  (=
    (Set_subset a b)
    (forall ((o Seq<Seq<Int>>)) (!
      (=> (Set_in o a) (Set_in o b))
      :pattern ((Set_in o a))
      :pattern ((Set_in o b))
      )))
  :pattern ((Set_subset a b))
  )))
(assert (forall ((a Set<Seq<Seq<Int>>>) (b Set<Seq<Seq<Int>>>)) (!
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
(assert (forall ((a Set<Seq<Seq<Int>>>) (b Set<Seq<Seq<Int>>>)) (!
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
(assert (forall ((_a Array_) (i Int)) (!
  (=>
    (and (<= 0 i) (< i (len<Int> _a)))
    (and
      (= (slotToArray<Array> (slot<Ref> _a i)) _a)
      (= (slotToIndex<Int> (slot<Ref> _a i)) i)))
  :pattern ((len<Int> _a) (slot<Ref> _a i))
  :pattern ((len<Int> _a) (slotToArray<Array> (slot<Ref> _a i)))
  :pattern ((len<Int> _a) (slotToIndex<Int> (slot<Ref> _a i)))
  :pattern ((slotToArray<Array> (slot<Ref> _a i)))
  :pattern ((slotToIndex<Int> (slot<Ref> _a i)))
  :qid |prog.injectivity|)))
(assert (forall ((_a Array_)) (!
  (>= (len<Int> _a) 0)
  :pattern ((len<Int> _a))
  :qid |prog.lenPositive|)))
; /field_value_functions_axioms.smt2 [val: Seq[Seq[Int]]]
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
(assert (forall ((r $Ref) (f Seq<Seq<Int>>)) (!
    (= ($FVF.loc_val f r) true)
    :pattern (($FVF.loc_val f r)))))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
(assert (forall ((s@$ $Snap) (s@0@00 Seq<Int>) (lenTiles@1@00 Int) (isStart@2@00 Bool)) (!
  (=
    (valid%limited s@$ s@0@00 lenTiles@1@00 isStart@2@00)
    (valid s@$ s@0@00 lenTiles@1@00 isStart@2@00))
  :pattern ((valid s@$ s@0@00 lenTiles@1@00 isStart@2@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (s@0@00 Seq<Int>) (lenTiles@1@00 Int) (isStart@2@00 Bool)) (!
  (valid%stateless s@0@00 lenTiles@1@00 isStart@2@00)
  :pattern ((valid%limited s@$ s@0@00 lenTiles@1@00 isStart@2@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (s@0@00 Seq<Int>) (lenTiles@1@00 Int) (isStart@2@00 Bool)) (!
  (=>
    (valid%precondition s@$ s@0@00 lenTiles@1@00 isStart@2@00)
    (=
      (valid s@$ s@0@00 lenTiles@1@00 isStart@2@00)
      (ite
        (= (Seq_length s@0@00) 0)
        (= lenTiles@1@00 0)
        (ite
          (= (Seq_length s@0@00) 1)
          (and
            (= lenTiles@1@00 (Seq_index s@0@00 0))
            (ite
              isStart@2@00
              (or (= (Seq_index s@0@00 0) 0) (>= (Seq_index s@0@00 0) 3))
              (>= (Seq_index s@0@00 0) 3)))
          (and
            (ite
              isStart@2@00
              (or (= (Seq_index s@0@00 0) 0) (>= (Seq_index s@0@00 0) 3))
              (>= (Seq_index s@0@00 0) 3))
            (and
              (> (Seq_index s@0@00 1) 0)
              (valid%limited $Snap.unit (Seq_drop s@0@00 2) (-
                (- lenTiles@1@00 (Seq_index s@0@00 1))
                (Seq_index s@0@00 0)) false)))))))
  :pattern ((valid s@$ s@0@00 lenTiles@1@00 isStart@2@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (s@0@00 Seq<Int>) (lenTiles@1@00 Int) (isStart@2@00 Bool)) (!
  (=>
    (valid%precondition s@$ s@0@00 lenTiles@1@00 isStart@2@00)
    (ite
      (= (Seq_length s@0@00) 0)
      true
      (ite
        (= (Seq_length s@0@00) 1)
        true
        (=>
          (and
            (ite
              isStart@2@00
              (or (= (Seq_index s@0@00 0) 0) (>= (Seq_index s@0@00 0) 3))
              (>= (Seq_index s@0@00 0) 3))
            (> (Seq_index s@0@00 1) 0))
          (valid%precondition $Snap.unit (Seq_drop s@0@00 2) (-
            (- lenTiles@1@00 (Seq_index s@0@00 1))
            (Seq_index s@0@00 0)) false)))))
  :pattern ((valid s@$ s@0@00 lenTiles@1@00 isStart@2@00))
  :qid |quant-u-3|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- colourings0 ----------
(declare-const a@0@01 Array_)
(declare-const a@1@01 Array_)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@2@01 $Snap)
(assert (= $t@2@01 ($Snap.combine ($Snap.first $t@2@01) ($Snap.second $t@2@01))))
(assert (= ($Snap.first $t@2@01) $Snap.unit))
; [eval] len(a) == 51
; [eval] len(a)
(assert (= (len<Int> a@1@01) 51))
(declare-const i@3@01 Int)
(push) ; 2
; [eval] 0 <= i && i < len(a)
; [eval] 0 <= i
(push) ; 3
; [then-branch: 0 | !(0 <= i@3@01) | live]
; [else-branch: 0 | 0 <= i@3@01 | live]
(push) ; 4
; [then-branch: 0 | !(0 <= i@3@01)]
(assert (not (<= 0 i@3@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | 0 <= i@3@01]
(assert (<= 0 i@3@01))
; [eval] i < len(a)
; [eval] len(a)
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@3@01) (not (<= 0 i@3@01))))
(assert (and (<= 0 i@3@01) (< i@3@01 (len<Int> a@1@01))))
; [eval] slot(a, i)
(pop) ; 2
(declare-fun inv@4@01 ($Ref) Int)
(declare-fun img@5@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@3@01 Int)) (!
  (=>
    (and (<= 0 i@3@01) (< i@3@01 (len<Int> a@1@01)))
    (or (<= 0 i@3@01) (not (<= 0 i@3@01))))
  :pattern ((slot<Ref> a@1@01 i@3@01))
  :qid |val-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@3@01 Int) (i2@3@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@3@01) (< i1@3@01 (len<Int> a@1@01)))
      (and (<= 0 i2@3@01) (< i2@3@01 (len<Int> a@1@01)))
      (= (slot<Ref> a@1@01 i1@3@01) (slot<Ref> a@1@01 i2@3@01)))
    (= i1@3@01 i2@3@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@3@01 Int)) (!
  (=>
    (and (<= 0 i@3@01) (< i@3@01 (len<Int> a@1@01)))
    (and
      (= (inv@4@01 (slot<Ref> a@1@01 i@3@01)) i@3@01)
      (img@5@01 (slot<Ref> a@1@01 i@3@01))))
  :pattern ((slot<Ref> a@1@01 i@3@01))
  :qid |quant-u-5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@5@01 r)
      (and (<= 0 (inv@4@01 r)) (< (inv@4@01 r) (len<Int> a@1@01))))
    (= (slot<Ref> a@1@01 (inv@4@01 r)) r))
  :pattern ((inv@4@01 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@3@01 Int)) (!
  (=>
    (and (<= 0 i@3@01) (< i@3@01 (len<Int> a@1@01)))
    (not (= (slot<Ref> a@1@01 i@3@01) $Ref.null)))
  :pattern ((slot<Ref> a@1@01 i@3@01))
  :qid |val-permImpliesNonNull|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; slot(a, 0).val := Seq(Seq[Int]())
; [eval] slot(a, 0)
; [eval] Seq(Seq[Int]())
; [eval] Seq[Int]()
(assert (= (Seq_length (Seq_singleton (as Seq_empty  Seq<Int>))) 1))
; Precomputing data for removing quantified permissions
(define-fun pTaken@6@01 ((r $Ref)) $Perm
  (ite
    (= r (slot<Ref> a@1@01 0))
    ($Perm.min
      (ite
        (and
          (img@5@01 r)
          (and (<= 0 (inv@4@01 r)) (< (inv@4@01 r) (len<Int> a@1@01))))
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
          (img@5@01 r)
          (and (<= 0 (inv@4@01 r)) (< (inv@4@01 r) (len<Int> a@1@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@6@01 r))
    $Perm.No)
  
  :qid |quant-u-7|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@6@01 r) $Perm.No)
  
  :qid |quant-u-8|))))
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
  (=> (= r (slot<Ref> a@1@01 0)) (= (- $Perm.Write (pTaken@6@01 r)) $Perm.No))
  
  :qid |quant-u-9|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@7@01 $FVF<val>)
; Definitional axioms for singleton-FVF's value
(assert (=
  ($FVF.lookup_val (as sm@7@01  $FVF<val>) (slot<Ref> a@1@01 0))
  (Seq_singleton (as Seq_empty  Seq<Int>))))
; [exec]
; slot(a, 1).val := Seq(Seq(0, 1))
; [eval] slot(a, 1)
; [eval] Seq(Seq(0, 1))
; [eval] Seq(0, 1)
(assert (= (Seq_length (Seq_append (Seq_singleton 0) (Seq_singleton 1))) 2))
(assert (=
  (Seq_length (Seq_singleton (Seq_append (Seq_singleton 0) (Seq_singleton 1))))
  1))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (slot<Ref> a@1@01 0) (slot<Ref> a@1@01 1))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@8@01 ((r $Ref)) $Perm
  (ite
    (= r (slot<Ref> a@1@01 1))
    ($Perm.min
      (ite
        (and
          (img@5@01 r)
          (and (<= 0 (inv@4@01 r)) (< (inv@4@01 r) (len<Int> a@1@01))))
        (- $Perm.Write (pTaken@6@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@9@01 ((r $Ref)) $Perm
  (ite
    (= r (slot<Ref> a@1@01 1))
    ($Perm.min
      (ite (= r (slot<Ref> a@1@01 0)) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@8@01 r)))
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
        (and
          (img@5@01 r)
          (and (<= 0 (inv@4@01 r)) (< (inv@4@01 r) (len<Int> a@1@01))))
        (- $Perm.Write (pTaken@6@01 r))
        $Perm.No)
      (pTaken@8@01 r))
    $Perm.No)
  
  :qid |quant-u-11|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@8@01 r) $Perm.No)
  
  :qid |quant-u-12|))))
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
  (=> (= r (slot<Ref> a@1@01 1)) (= (- $Perm.Write (pTaken@8@01 r)) $Perm.No))
  
  :qid |quant-u-13|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@10@01 $FVF<val>)
; Definitional axioms for singleton-FVF's value
(assert (=
  ($FVF.lookup_val (as sm@10@01  $FVF<val>) (slot<Ref> a@1@01 1))
  (Seq_singleton (Seq_append (Seq_singleton 0) (Seq_singleton 1)))))
; [exec]
; assert valid(Seq[Int](), 0, false)
; [eval] valid(Seq[Int](), 0, false)
; [eval] Seq[Int]()
(set-option :timeout 0)
(push) ; 3
(assert (valid%precondition $Snap.unit (as Seq_empty  Seq<Int>) 0 false))
(pop) ; 3
; Joined path conditions
(assert (valid%precondition $Snap.unit (as Seq_empty  Seq<Int>) 0 false))
(push) ; 3
(assert (not (valid $Snap.unit (as Seq_empty  Seq<Int>) 0 false)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (valid $Snap.unit (as Seq_empty  Seq<Int>) 0 false))
; [exec]
; assert (forall j: Int ::
;     { valid(slot(a, 1).val[j], 1, true) }
;     0 <= j && j < |slot(a, 1).val| ==>
;     slot(a, 1).val[j] == Seq(0, 1) && valid(slot(a, 1).val[j], 1, true))
; [eval] (forall j: Int :: { valid(slot(a, 1).val[j], 1, true) } 0 <= j && j < |slot(a, 1).val| ==> slot(a, 1).val[j] == Seq(0, 1) && valid(slot(a, 1).val[j], 1, true))
(declare-const j@11@01 Int)
(push) ; 3
; [eval] 0 <= j && j < |slot(a, 1).val| ==> slot(a, 1).val[j] == Seq(0, 1) && valid(slot(a, 1).val[j], 1, true)
; [eval] 0 <= j && j < |slot(a, 1).val|
; [eval] 0 <= j
(push) ; 4
; [then-branch: 1 | !(0 <= j@11@01) | live]
; [else-branch: 1 | 0 <= j@11@01 | live]
(push) ; 5
; [then-branch: 1 | !(0 <= j@11@01)]
(assert (not (<= 0 j@11@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 1 | 0 <= j@11@01]
(assert (<= 0 j@11@01))
; [eval] j < |slot(a, 1).val|
; [eval] |slot(a, 1).val|
; [eval] slot(a, 1)
(declare-const sm@12@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@1@01 1))
    (=
      ($FVF.lookup_val (as sm@12@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@10@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@12@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@10@01  $FVF<val>) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@1@01 0))
    (=
      ($FVF.lookup_val (as sm@12@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@7@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@12@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@7@01  $FVF<val>) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@5@01 r)
        (and (<= 0 (inv@4@01 r)) (< (inv@4@01 r) (len<Int> a@1@01))))
      (< $Perm.No (- (- $Perm.Write (pTaken@6@01 r)) (pTaken@8@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@12@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@2@01)) r)))
  :pattern (($FVF.lookup_val (as sm@12@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@2@01)) r))
  :qid |qp.fvfValDef2|)))
(declare-const pm@13@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@13@01  $FPM) r)
    (+
      (+
        (ite (= r (slot<Ref> a@1@01 1)) $Perm.Write $Perm.No)
        (ite (= r (slot<Ref> a@1@01 0)) $Perm.Write $Perm.No))
      (ite
        (and
          (img@5@01 r)
          (and (<= 0 (inv@4@01 r)) (< (inv@4@01 r) (len<Int> a@1@01))))
        (- (- $Perm.Write (pTaken@6@01 r)) (pTaken@8@01 r))
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@13@01  $FPM) r))
  :qid |qp.resPrmSumDef3|)))
(push) ; 6
(assert (not (< $Perm.No ($FVF.perm_val (as pm@13@01  $FPM) (slot<Ref> a@1@01 1)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@1@01 1))
    (=
      ($FVF.lookup_val (as sm@12@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@10@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@12@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@10@01  $FVF<val>) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@1@01 0))
    (=
      ($FVF.lookup_val (as sm@12@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@7@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@12@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@7@01  $FVF<val>) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@5@01 r)
        (and (<= 0 (inv@4@01 r)) (< (inv@4@01 r) (len<Int> a@1@01))))
      (< $Perm.No (- (- $Perm.Write (pTaken@6@01 r)) (pTaken@8@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@12@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@2@01)) r)))
  :pattern (($FVF.lookup_val (as sm@12@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@2@01)) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@13@01  $FPM) r)
    (+
      (+
        (ite (= r (slot<Ref> a@1@01 1)) $Perm.Write $Perm.No)
        (ite (= r (slot<Ref> a@1@01 0)) $Perm.Write $Perm.No))
      (ite
        (and
          (img@5@01 r)
          (and (<= 0 (inv@4@01 r)) (< (inv@4@01 r) (len<Int> a@1@01))))
        (- (- $Perm.Write (pTaken@6@01 r)) (pTaken@8@01 r))
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@13@01  $FPM) r))
  :qid |qp.resPrmSumDef3|)))
(assert (or (<= 0 j@11@01) (not (<= 0 j@11@01))))
(push) ; 4
; [then-branch: 2 | 0 <= j@11@01 && j@11@01 < |Lookup(val, sm@12@01, slot[Ref](a@1@01, 1))| | live]
; [else-branch: 2 | !(0 <= j@11@01 && j@11@01 < |Lookup(val, sm@12@01, slot[Ref](a@1@01, 1))|) | live]
(push) ; 5
; [then-branch: 2 | 0 <= j@11@01 && j@11@01 < |Lookup(val, sm@12@01, slot[Ref](a@1@01, 1))|]
(assert (and
  (<= 0 j@11@01)
  (<
    j@11@01
    (Seq_length ($FVF.lookup_val (as sm@12@01  $FVF<val>) (slot<Ref> a@1@01 1))))))
; [eval] slot(a, 1).val[j] == Seq(0, 1) && valid(slot(a, 1).val[j], 1, true)
; [eval] slot(a, 1).val[j] == Seq(0, 1)
; [eval] slot(a, 1).val[j]
; [eval] slot(a, 1)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r (slot<Ref> a@1@01 1))
      (=
        ($FVF.lookup_val (as sm@12@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@10@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@12@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@10@01  $FVF<val>) r))
    :qid |qp.fvfValDef0|))
  (forall ((r $Ref)) (!
    (=>
      (= r (slot<Ref> a@1@01 0))
      (=
        ($FVF.lookup_val (as sm@12@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@7@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@12@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@7@01  $FVF<val>) r))
    :qid |qp.fvfValDef1|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and
          (img@5@01 r)
          (and (<= 0 (inv@4@01 r)) (< (inv@4@01 r) (len<Int> a@1@01))))
        (< $Perm.No (- (- $Perm.Write (pTaken@6@01 r)) (pTaken@8@01 r)))
        false)
      (=
        ($FVF.lookup_val (as sm@12@01  $FVF<val>) r)
        ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@2@01)) r)))
    :pattern (($FVF.lookup_val (as sm@12@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@2@01)) r))
    :qid |qp.fvfValDef2|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (+
      (ite (= (slot<Ref> a@1@01 1) (slot<Ref> a@1@01 1)) $Perm.Write $Perm.No)
      (ite (= (slot<Ref> a@1@01 1) (slot<Ref> a@1@01 0)) $Perm.Write $Perm.No))
    (ite
      (and
        (img@5@01 (slot<Ref> a@1@01 1))
        (and
          (<= 0 (inv@4@01 (slot<Ref> a@1@01 1)))
          (< (inv@4@01 (slot<Ref> a@1@01 1)) (len<Int> a@1@01))))
      (-
        (- $Perm.Write (pTaken@6@01 (slot<Ref> a@1@01 1)))
        (pTaken@8@01 (slot<Ref> a@1@01 1)))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (>= j@11@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] Seq(0, 1)
(push) ; 6
; [then-branch: 3 | !(Lookup(val, sm@12@01, slot[Ref](a@1@01, 1))[j@11@01] === [0] ++ [1]) | live]
; [else-branch: 3 | Lookup(val, sm@12@01, slot[Ref](a@1@01, 1))[j@11@01] === [0] ++ [1] | live]
(push) ; 7
; [then-branch: 3 | !(Lookup(val, sm@12@01, slot[Ref](a@1@01, 1))[j@11@01] === [0] ++ [1])]
(assert (not
  (Seq_equal
    (Seq_index
      ($FVF.lookup_val (as sm@12@01  $FVF<val>) (slot<Ref> a@1@01 1))
      j@11@01)
    (Seq_append (Seq_singleton 0) (Seq_singleton 1)))))
(pop) ; 7
(push) ; 7
; [else-branch: 3 | Lookup(val, sm@12@01, slot[Ref](a@1@01, 1))[j@11@01] === [0] ++ [1]]
(assert (Seq_equal
  (Seq_index
    ($FVF.lookup_val (as sm@12@01  $FVF<val>) (slot<Ref> a@1@01 1))
    j@11@01)
  (Seq_append (Seq_singleton 0) (Seq_singleton 1))))
; [eval] valid(slot(a, 1).val[j], 1, true)
; [eval] slot(a, 1).val[j]
; [eval] slot(a, 1)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r (slot<Ref> a@1@01 1))
      (=
        ($FVF.lookup_val (as sm@12@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@10@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@12@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@10@01  $FVF<val>) r))
    :qid |qp.fvfValDef0|))
  (forall ((r $Ref)) (!
    (=>
      (= r (slot<Ref> a@1@01 0))
      (=
        ($FVF.lookup_val (as sm@12@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@7@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@12@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@7@01  $FVF<val>) r))
    :qid |qp.fvfValDef1|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and
          (img@5@01 r)
          (and (<= 0 (inv@4@01 r)) (< (inv@4@01 r) (len<Int> a@1@01))))
        (< $Perm.No (- (- $Perm.Write (pTaken@6@01 r)) (pTaken@8@01 r)))
        false)
      (=
        ($FVF.lookup_val (as sm@12@01  $FVF<val>) r)
        ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@2@01)) r)))
    :pattern (($FVF.lookup_val (as sm@12@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@2@01)) r))
    :qid |qp.fvfValDef2|))))
(push) ; 8
(assert (not (<
  $Perm.No
  (+
    (+
      (ite (= (slot<Ref> a@1@01 1) (slot<Ref> a@1@01 1)) $Perm.Write $Perm.No)
      (ite (= (slot<Ref> a@1@01 1) (slot<Ref> a@1@01 0)) $Perm.Write $Perm.No))
    (ite
      (and
        (img@5@01 (slot<Ref> a@1@01 1))
        (and
          (<= 0 (inv@4@01 (slot<Ref> a@1@01 1)))
          (< (inv@4@01 (slot<Ref> a@1@01 1)) (len<Int> a@1@01))))
      (-
        (- $Perm.Write (pTaken@6@01 (slot<Ref> a@1@01 1)))
        (pTaken@8@01 (slot<Ref> a@1@01 1)))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(push) ; 8
(assert (not (>= j@11@01 0)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(push) ; 8
(assert (valid%precondition $Snap.unit (Seq_index
  ($FVF.lookup_val (as sm@12@01  $FVF<val>) (slot<Ref> a@1@01 1))
  j@11@01) 1 true))
(pop) ; 8
; Joined path conditions
(assert (valid%precondition $Snap.unit (Seq_index
  ($FVF.lookup_val (as sm@12@01  $FVF<val>) (slot<Ref> a@1@01 1))
  j@11@01) 1 true))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@1@01 1))
    (=
      ($FVF.lookup_val (as sm@12@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@10@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@12@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@10@01  $FVF<val>) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@1@01 0))
    (=
      ($FVF.lookup_val (as sm@12@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@7@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@12@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@7@01  $FVF<val>) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@5@01 r)
        (and (<= 0 (inv@4@01 r)) (< (inv@4@01 r) (len<Int> a@1@01))))
      (< $Perm.No (- (- $Perm.Write (pTaken@6@01 r)) (pTaken@8@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@12@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@2@01)) r)))
  :pattern (($FVF.lookup_val (as sm@12@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@2@01)) r))
  :qid |qp.fvfValDef2|)))
(assert (=>
  (Seq_equal
    (Seq_index
      ($FVF.lookup_val (as sm@12@01  $FVF<val>) (slot<Ref> a@1@01 1))
      j@11@01)
    (Seq_append (Seq_singleton 0) (Seq_singleton 1)))
  (and
    (Seq_equal
      (Seq_index
        ($FVF.lookup_val (as sm@12@01  $FVF<val>) (slot<Ref> a@1@01 1))
        j@11@01)
      (Seq_append (Seq_singleton 0) (Seq_singleton 1)))
    (valid%precondition $Snap.unit (Seq_index
      ($FVF.lookup_val (as sm@12@01  $FVF<val>) (slot<Ref> a@1@01 1))
      j@11@01) 1 true))))
(assert (or
  (Seq_equal
    (Seq_index
      ($FVF.lookup_val (as sm@12@01  $FVF<val>) (slot<Ref> a@1@01 1))
      j@11@01)
    (Seq_append (Seq_singleton 0) (Seq_singleton 1)))
  (not
    (Seq_equal
      (Seq_index
        ($FVF.lookup_val (as sm@12@01  $FVF<val>) (slot<Ref> a@1@01 1))
        j@11@01)
      (Seq_append (Seq_singleton 0) (Seq_singleton 1))))))
(pop) ; 5
(push) ; 5
; [else-branch: 2 | !(0 <= j@11@01 && j@11@01 < |Lookup(val, sm@12@01, slot[Ref](a@1@01, 1))|)]
(assert (not
  (and
    (<= 0 j@11@01)
    (<
      j@11@01
      (Seq_length
        ($FVF.lookup_val (as sm@12@01  $FVF<val>) (slot<Ref> a@1@01 1)))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@1@01 1))
    (=
      ($FVF.lookup_val (as sm@12@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@10@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@12@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@10@01  $FVF<val>) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@1@01 0))
    (=
      ($FVF.lookup_val (as sm@12@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@7@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@12@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@7@01  $FVF<val>) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@5@01 r)
        (and (<= 0 (inv@4@01 r)) (< (inv@4@01 r) (len<Int> a@1@01))))
      (< $Perm.No (- (- $Perm.Write (pTaken@6@01 r)) (pTaken@8@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@12@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@2@01)) r)))
  :pattern (($FVF.lookup_val (as sm@12@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@2@01)) r))
  :qid |qp.fvfValDef2|)))
(assert (=>
  (and
    (<= 0 j@11@01)
    (<
      j@11@01
      (Seq_length
        ($FVF.lookup_val (as sm@12@01  $FVF<val>) (slot<Ref> a@1@01 1)))))
  (and
    (<= 0 j@11@01)
    (<
      j@11@01
      (Seq_length
        ($FVF.lookup_val (as sm@12@01  $FVF<val>) (slot<Ref> a@1@01 1))))
    (=>
      (Seq_equal
        (Seq_index
          ($FVF.lookup_val (as sm@12@01  $FVF<val>) (slot<Ref> a@1@01 1))
          j@11@01)
        (Seq_append (Seq_singleton 0) (Seq_singleton 1)))
      (and
        (Seq_equal
          (Seq_index
            ($FVF.lookup_val (as sm@12@01  $FVF<val>) (slot<Ref> a@1@01 1))
            j@11@01)
          (Seq_append (Seq_singleton 0) (Seq_singleton 1)))
        (valid%precondition $Snap.unit (Seq_index
          ($FVF.lookup_val (as sm@12@01  $FVF<val>) (slot<Ref> a@1@01 1))
          j@11@01) 1 true)))
    (or
      (Seq_equal
        (Seq_index
          ($FVF.lookup_val (as sm@12@01  $FVF<val>) (slot<Ref> a@1@01 1))
          j@11@01)
        (Seq_append (Seq_singleton 0) (Seq_singleton 1)))
      (not
        (Seq_equal
          (Seq_index
            ($FVF.lookup_val (as sm@12@01  $FVF<val>) (slot<Ref> a@1@01 1))
            j@11@01)
          (Seq_append (Seq_singleton 0) (Seq_singleton 1))))))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 j@11@01)
      (<
        j@11@01
        (Seq_length
          ($FVF.lookup_val (as sm@12@01  $FVF<val>) (slot<Ref> a@1@01 1))))))
  (and
    (<= 0 j@11@01)
    (<
      j@11@01
      (Seq_length
        ($FVF.lookup_val (as sm@12@01  $FVF<val>) (slot<Ref> a@1@01 1)))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@1@01 1))
    (=
      ($FVF.lookup_val (as sm@12@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@10@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@12@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@10@01  $FVF<val>) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@1@01 0))
    (=
      ($FVF.lookup_val (as sm@12@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@7@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@12@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@7@01  $FVF<val>) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@5@01 r)
        (and (<= 0 (inv@4@01 r)) (< (inv@4@01 r) (len<Int> a@1@01))))
      (< $Perm.No (- (- $Perm.Write (pTaken@6@01 r)) (pTaken@8@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@12@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@2@01)) r)))
  :pattern (($FVF.lookup_val (as sm@12@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@2@01)) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@13@01  $FPM) r)
    (+
      (+
        (ite (= r (slot<Ref> a@1@01 1)) $Perm.Write $Perm.No)
        (ite (= r (slot<Ref> a@1@01 0)) $Perm.Write $Perm.No))
      (ite
        (and
          (img@5@01 r)
          (and (<= 0 (inv@4@01 r)) (< (inv@4@01 r) (len<Int> a@1@01))))
        (- (- $Perm.Write (pTaken@6@01 r)) (pTaken@8@01 r))
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@13@01  $FPM) r))
  :qid |qp.resPrmSumDef3|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@11@01 Int)) (!
  (and
    (or (<= 0 j@11@01) (not (<= 0 j@11@01)))
    (=>
      (and
        (<= 0 j@11@01)
        (<
          j@11@01
          (Seq_length
            ($FVF.lookup_val (as sm@12@01  $FVF<val>) (slot<Ref> a@1@01 1)))))
      (and
        (<= 0 j@11@01)
        (<
          j@11@01
          (Seq_length
            ($FVF.lookup_val (as sm@12@01  $FVF<val>) (slot<Ref> a@1@01 1))))
        (=>
          (Seq_equal
            (Seq_index
              ($FVF.lookup_val (as sm@12@01  $FVF<val>) (slot<Ref> a@1@01 1))
              j@11@01)
            (Seq_append (Seq_singleton 0) (Seq_singleton 1)))
          (and
            (Seq_equal
              (Seq_index
                ($FVF.lookup_val (as sm@12@01  $FVF<val>) (slot<Ref> a@1@01 1))
                j@11@01)
              (Seq_append (Seq_singleton 0) (Seq_singleton 1)))
            (valid%precondition $Snap.unit (Seq_index
              ($FVF.lookup_val (as sm@12@01  $FVF<val>) (slot<Ref> a@1@01 1))
              j@11@01) 1 true)))
        (or
          (Seq_equal
            (Seq_index
              ($FVF.lookup_val (as sm@12@01  $FVF<val>) (slot<Ref> a@1@01 1))
              j@11@01)
            (Seq_append (Seq_singleton 0) (Seq_singleton 1)))
          (not
            (Seq_equal
              (Seq_index
                ($FVF.lookup_val (as sm@12@01  $FVF<val>) (slot<Ref> a@1@01 1))
                j@11@01)
              (Seq_append (Seq_singleton 0) (Seq_singleton 1)))))))
    (or
      (not
        (and
          (<= 0 j@11@01)
          (<
            j@11@01
            (Seq_length
              ($FVF.lookup_val (as sm@12@01  $FVF<val>) (slot<Ref> a@1@01 1))))))
      (and
        (<= 0 j@11@01)
        (<
          j@11@01
          (Seq_length
            ($FVF.lookup_val (as sm@12@01  $FVF<val>) (slot<Ref> a@1@01 1)))))))
  :pattern ((valid%limited $Snap.unit (Seq_index
    ($FVF.lookup_val (as sm@12@01  $FVF<val>) (slot<Ref> a@1@01 1))
    j@11@01) 1 true))
  :qid |prog./silicon/silver/src/test/resources/all/sequences/sequence_incompletenesses.vpr@49@10@50@71-aux|)))
(assert (forall ((j@11@01 Int)) (!
  (=>
    (and
      (and
        (<= 0 j@11@01)
        (<
          j@11@01
          (Seq_length
            ($FVF.lookup_val (as sm@12@01  $FVF<val>) (slot<Ref> a@1@01 1)))))
      (Seq_equal
        (Seq_index
          ($FVF.lookup_val (as sm@12@01  $FVF<val>) (slot<Ref> a@1@01 1))
          j@11@01)
        (Seq_append (Seq_singleton 0) (Seq_singleton 1))))
    (valid%precondition $Snap.unit (Seq_index
      ($FVF.lookup_val (as sm@12@01  $FVF<val>) (slot<Ref> a@1@01 1))
      j@11@01) 1 true))
  :pattern ((valid%limited $Snap.unit (Seq_index
    ($FVF.lookup_val (as sm@12@01  $FVF<val>) (slot<Ref> a@1@01 1))
    j@11@01) 1 true))
  :qid |prog./silicon/silver/src/test/resources/all/sequences/sequence_incompletenesses.vpr@49@10@50@71_precondition|)))
(push) ; 3
(assert (not (forall ((j@11@01 Int)) (!
  (=>
    (and
      (=>
        (and
          (and
            (<= 0 j@11@01)
            (<
              j@11@01
              (Seq_length
                ($FVF.lookup_val (as sm@12@01  $FVF<val>) (slot<Ref> a@1@01 1)))))
          (Seq_equal
            (Seq_index
              ($FVF.lookup_val (as sm@12@01  $FVF<val>) (slot<Ref> a@1@01 1))
              j@11@01)
            (Seq_append (Seq_singleton 0) (Seq_singleton 1))))
        (valid%precondition $Snap.unit (Seq_index
          ($FVF.lookup_val (as sm@12@01  $FVF<val>) (slot<Ref> a@1@01 1))
          j@11@01) 1 true))
      (and
        (<= 0 j@11@01)
        (<
          j@11@01
          (Seq_length
            ($FVF.lookup_val (as sm@12@01  $FVF<val>) (slot<Ref> a@1@01 1))))))
    (and
      (Seq_equal
        (Seq_index
          ($FVF.lookup_val (as sm@12@01  $FVF<val>) (slot<Ref> a@1@01 1))
          j@11@01)
        (Seq_append (Seq_singleton 0) (Seq_singleton 1)))
      (valid $Snap.unit (Seq_index
        ($FVF.lookup_val (as sm@12@01  $FVF<val>) (slot<Ref> a@1@01 1))
        j@11@01) 1 true)))
  :pattern ((valid%limited $Snap.unit (Seq_index
    ($FVF.lookup_val (as sm@12@01  $FVF<val>) (slot<Ref> a@1@01 1))
    j@11@01) 1 true))
  :qid |prog./silicon/silver/src/test/resources/all/sequences/sequence_incompletenesses.vpr@49@10@50@71|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((j@11@01 Int)) (!
  (=>
    (and
      (<= 0 j@11@01)
      (<
        j@11@01
        (Seq_length
          ($FVF.lookup_val (as sm@12@01  $FVF<val>) (slot<Ref> a@1@01 1)))))
    (and
      (Seq_equal
        (Seq_index
          ($FVF.lookup_val (as sm@12@01  $FVF<val>) (slot<Ref> a@1@01 1))
          j@11@01)
        (Seq_append (Seq_singleton 0) (Seq_singleton 1)))
      (valid $Snap.unit (Seq_index
        ($FVF.lookup_val (as sm@12@01  $FVF<val>) (slot<Ref> a@1@01 1))
        j@11@01) 1 true)))
  :pattern ((valid%limited $Snap.unit (Seq_index
    ($FVF.lookup_val (as sm@12@01  $FVF<val>) (slot<Ref> a@1@01 1))
    j@11@01) 1 true))
  :qid |prog./silicon/silver/src/test/resources/all/sequences/sequence_incompletenesses.vpr@49@10@50@71|)))
(pop) ; 2
(pop) ; 1
; ---------- colourings1 ----------
(declare-const a@14@01 Array_)
(declare-const a@15@01 Array_)
(push) ; 1
(declare-const $t@16@01 $Snap)
(assert (= $t@16@01 ($Snap.combine ($Snap.first $t@16@01) ($Snap.second $t@16@01))))
(assert (= ($Snap.first $t@16@01) $Snap.unit))
; [eval] len(a) == 51
; [eval] len(a)
(assert (= (len<Int> a@15@01) 51))
(declare-const i@17@01 Int)
(push) ; 2
; [eval] 0 <= i && i < len(a)
; [eval] 0 <= i
(push) ; 3
; [then-branch: 4 | !(0 <= i@17@01) | live]
; [else-branch: 4 | 0 <= i@17@01 | live]
(push) ; 4
; [then-branch: 4 | !(0 <= i@17@01)]
(assert (not (<= 0 i@17@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 4 | 0 <= i@17@01]
(assert (<= 0 i@17@01))
; [eval] i < len(a)
; [eval] len(a)
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@17@01) (not (<= 0 i@17@01))))
(assert (and (<= 0 i@17@01) (< i@17@01 (len<Int> a@15@01))))
; [eval] slot(a, i)
(pop) ; 2
(declare-fun inv@18@01 ($Ref) Int)
(declare-fun img@19@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@17@01 Int)) (!
  (=>
    (and (<= 0 i@17@01) (< i@17@01 (len<Int> a@15@01)))
    (or (<= 0 i@17@01) (not (<= 0 i@17@01))))
  :pattern ((slot<Ref> a@15@01 i@17@01))
  :qid |val-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@17@01 Int) (i2@17@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@17@01) (< i1@17@01 (len<Int> a@15@01)))
      (and (<= 0 i2@17@01) (< i2@17@01 (len<Int> a@15@01)))
      (= (slot<Ref> a@15@01 i1@17@01) (slot<Ref> a@15@01 i2@17@01)))
    (= i1@17@01 i2@17@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@17@01 Int)) (!
  (=>
    (and (<= 0 i@17@01) (< i@17@01 (len<Int> a@15@01)))
    (and
      (= (inv@18@01 (slot<Ref> a@15@01 i@17@01)) i@17@01)
      (img@19@01 (slot<Ref> a@15@01 i@17@01))))
  :pattern ((slot<Ref> a@15@01 i@17@01))
  :qid |quant-u-15|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@19@01 r)
      (and (<= 0 (inv@18@01 r)) (< (inv@18@01 r) (len<Int> a@15@01))))
    (= (slot<Ref> a@15@01 (inv@18@01 r)) r))
  :pattern ((inv@18@01 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@17@01 Int)) (!
  (=>
    (and (<= 0 i@17@01) (< i@17@01 (len<Int> a@15@01)))
    (not (= (slot<Ref> a@15@01 i@17@01) $Ref.null)))
  :pattern ((slot<Ref> a@15@01 i@17@01))
  :qid |val-permImpliesNonNull|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var n: Int
(declare-const n@20@01 Int)
; [exec]
; slot(a, 0).val := Seq(Seq[Int]())
; [eval] slot(a, 0)
; [eval] Seq(Seq[Int]())
; [eval] Seq[Int]()
(assert (= (Seq_length (Seq_singleton (as Seq_empty  Seq<Int>))) 1))
; Precomputing data for removing quantified permissions
(define-fun pTaken@21@01 ((r $Ref)) $Perm
  (ite
    (= r (slot<Ref> a@15@01 0))
    ($Perm.min
      (ite
        (and
          (img@19@01 r)
          (and (<= 0 (inv@18@01 r)) (< (inv@18@01 r) (len<Int> a@15@01))))
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
          (img@19@01 r)
          (and (<= 0 (inv@18@01 r)) (< (inv@18@01 r) (len<Int> a@15@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@21@01 r))
    $Perm.No)
  
  :qid |quant-u-17|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@21@01 r) $Perm.No)
  
  :qid |quant-u-18|))))
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
  (=> (= r (slot<Ref> a@15@01 0)) (= (- $Perm.Write (pTaken@21@01 r)) $Perm.No))
  
  :qid |quant-u-19|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@22@01 $FVF<val>)
; Definitional axioms for singleton-FVF's value
(assert (=
  ($FVF.lookup_val (as sm@22@01  $FVF<val>) (slot<Ref> a@15@01 0))
  (Seq_singleton (as Seq_empty  Seq<Int>))))
; [exec]
; slot(a, 1).val := Seq(Seq(0, 1))
; [eval] slot(a, 1)
; [eval] Seq(Seq(0, 1))
; [eval] Seq(0, 1)
(assert (= (Seq_length (Seq_append (Seq_singleton 0) (Seq_singleton 1))) 2))
(assert (=
  (Seq_length (Seq_singleton (Seq_append (Seq_singleton 0) (Seq_singleton 1))))
  1))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (slot<Ref> a@15@01 0) (slot<Ref> a@15@01 1))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@23@01 ((r $Ref)) $Perm
  (ite
    (= r (slot<Ref> a@15@01 1))
    ($Perm.min
      (ite
        (and
          (img@19@01 r)
          (and (<= 0 (inv@18@01 r)) (< (inv@18@01 r) (len<Int> a@15@01))))
        (- $Perm.Write (pTaken@21@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@24@01 ((r $Ref)) $Perm
  (ite
    (= r (slot<Ref> a@15@01 1))
    ($Perm.min
      (ite (= r (slot<Ref> a@15@01 0)) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@23@01 r)))
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
        (and
          (img@19@01 r)
          (and (<= 0 (inv@18@01 r)) (< (inv@18@01 r) (len<Int> a@15@01))))
        (- $Perm.Write (pTaken@21@01 r))
        $Perm.No)
      (pTaken@23@01 r))
    $Perm.No)
  
  :qid |quant-u-21|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@23@01 r) $Perm.No)
  
  :qid |quant-u-22|))))
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
  (=> (= r (slot<Ref> a@15@01 1)) (= (- $Perm.Write (pTaken@23@01 r)) $Perm.No))
  
  :qid |quant-u-23|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@25@01 $FVF<val>)
; Definitional axioms for singleton-FVF's value
(assert (=
  ($FVF.lookup_val (as sm@25@01  $FVF<val>) (slot<Ref> a@15@01 1))
  (Seq_singleton (Seq_append (Seq_singleton 0) (Seq_singleton 1)))))
; [exec]
; assert valid(Seq[Int](), 0, false)
; [eval] valid(Seq[Int](), 0, false)
; [eval] Seq[Int]()
(set-option :timeout 0)
(push) ; 3
(assert (valid%precondition $Snap.unit (as Seq_empty  Seq<Int>) 0 false))
(pop) ; 3
; Joined path conditions
(assert (valid%precondition $Snap.unit (as Seq_empty  Seq<Int>) 0 false))
(push) ; 3
(assert (not (valid $Snap.unit (as Seq_empty  Seq<Int>) 0 false)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (valid $Snap.unit (as Seq_empty  Seq<Int>) 0 false))
; [exec]
; assert Seq(0, 1)[2..] == Seq[Int]()
; [eval] Seq(0, 1)[2..] == Seq[Int]()
; [eval] Seq(0, 1)[2..]
; [eval] Seq(0, 1)
; [eval] Seq[Int]()
(push) ; 3
(assert (not (Seq_equal
  (Seq_drop (Seq_append (Seq_singleton 0) (Seq_singleton 1)) 2)
  (as Seq_empty  Seq<Int>))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal
  (Seq_drop (Seq_append (Seq_singleton 0) (Seq_singleton 1)) 2)
  (as Seq_empty  Seq<Int>)))
; [exec]
; assert (forall j: Int ::
;     { valid(slot(a, 1).val[j], 1, true) }
;     0 <= j && j < |slot(a, 1).val| ==>
;     slot(a, 1).val[j] == Seq(0, 1) && valid(slot(a, 1).val[j], 1, true))
; [eval] (forall j: Int :: { valid(slot(a, 1).val[j], 1, true) } 0 <= j && j < |slot(a, 1).val| ==> slot(a, 1).val[j] == Seq(0, 1) && valid(slot(a, 1).val[j], 1, true))
(declare-const j@26@01 Int)
(push) ; 3
; [eval] 0 <= j && j < |slot(a, 1).val| ==> slot(a, 1).val[j] == Seq(0, 1) && valid(slot(a, 1).val[j], 1, true)
; [eval] 0 <= j && j < |slot(a, 1).val|
; [eval] 0 <= j
(push) ; 4
; [then-branch: 5 | !(0 <= j@26@01) | live]
; [else-branch: 5 | 0 <= j@26@01 | live]
(push) ; 5
; [then-branch: 5 | !(0 <= j@26@01)]
(assert (not (<= 0 j@26@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 5 | 0 <= j@26@01]
(assert (<= 0 j@26@01))
; [eval] j < |slot(a, 1).val|
; [eval] |slot(a, 1).val|
; [eval] slot(a, 1)
(declare-const sm@27@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 1))
    (=
      ($FVF.lookup_val (as sm@27@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@25@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@27@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@25@01  $FVF<val>) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 0))
    (=
      ($FVF.lookup_val (as sm@27@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@22@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@27@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@22@01  $FVF<val>) r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@19@01 r)
        (and (<= 0 (inv@18@01 r)) (< (inv@18@01 r) (len<Int> a@15@01))))
      (< $Perm.No (- (- $Perm.Write (pTaken@21@01 r)) (pTaken@23@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@27@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@16@01)) r)))
  :pattern (($FVF.lookup_val (as sm@27@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@16@01)) r))
  :qid |qp.fvfValDef6|)))
(declare-const pm@28@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@28@01  $FPM) r)
    (+
      (+
        (ite (= r (slot<Ref> a@15@01 1)) $Perm.Write $Perm.No)
        (ite (= r (slot<Ref> a@15@01 0)) $Perm.Write $Perm.No))
      (ite
        (and
          (img@19@01 r)
          (and (<= 0 (inv@18@01 r)) (< (inv@18@01 r) (len<Int> a@15@01))))
        (- (- $Perm.Write (pTaken@21@01 r)) (pTaken@23@01 r))
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@28@01  $FPM) r))
  :qid |qp.resPrmSumDef7|)))
(push) ; 6
(assert (not (< $Perm.No ($FVF.perm_val (as pm@28@01  $FPM) (slot<Ref> a@15@01 1)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 1))
    (=
      ($FVF.lookup_val (as sm@27@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@25@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@27@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@25@01  $FVF<val>) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 0))
    (=
      ($FVF.lookup_val (as sm@27@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@22@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@27@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@22@01  $FVF<val>) r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@19@01 r)
        (and (<= 0 (inv@18@01 r)) (< (inv@18@01 r) (len<Int> a@15@01))))
      (< $Perm.No (- (- $Perm.Write (pTaken@21@01 r)) (pTaken@23@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@27@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@16@01)) r)))
  :pattern (($FVF.lookup_val (as sm@27@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@16@01)) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@28@01  $FPM) r)
    (+
      (+
        (ite (= r (slot<Ref> a@15@01 1)) $Perm.Write $Perm.No)
        (ite (= r (slot<Ref> a@15@01 0)) $Perm.Write $Perm.No))
      (ite
        (and
          (img@19@01 r)
          (and (<= 0 (inv@18@01 r)) (< (inv@18@01 r) (len<Int> a@15@01))))
        (- (- $Perm.Write (pTaken@21@01 r)) (pTaken@23@01 r))
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@28@01  $FPM) r))
  :qid |qp.resPrmSumDef7|)))
(assert (or (<= 0 j@26@01) (not (<= 0 j@26@01))))
(push) ; 4
; [then-branch: 6 | 0 <= j@26@01 && j@26@01 < |Lookup(val, sm@27@01, slot[Ref](a@15@01, 1))| | live]
; [else-branch: 6 | !(0 <= j@26@01 && j@26@01 < |Lookup(val, sm@27@01, slot[Ref](a@15@01, 1))|) | live]
(push) ; 5
; [then-branch: 6 | 0 <= j@26@01 && j@26@01 < |Lookup(val, sm@27@01, slot[Ref](a@15@01, 1))|]
(assert (and
  (<= 0 j@26@01)
  (<
    j@26@01
    (Seq_length ($FVF.lookup_val (as sm@27@01  $FVF<val>) (slot<Ref> a@15@01 1))))))
; [eval] slot(a, 1).val[j] == Seq(0, 1) && valid(slot(a, 1).val[j], 1, true)
; [eval] slot(a, 1).val[j] == Seq(0, 1)
; [eval] slot(a, 1).val[j]
; [eval] slot(a, 1)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r (slot<Ref> a@15@01 1))
      (=
        ($FVF.lookup_val (as sm@27@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@25@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@27@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@25@01  $FVF<val>) r))
    :qid |qp.fvfValDef4|))
  (forall ((r $Ref)) (!
    (=>
      (= r (slot<Ref> a@15@01 0))
      (=
        ($FVF.lookup_val (as sm@27@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@22@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@27@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@22@01  $FVF<val>) r))
    :qid |qp.fvfValDef5|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and
          (img@19@01 r)
          (and (<= 0 (inv@18@01 r)) (< (inv@18@01 r) (len<Int> a@15@01))))
        (< $Perm.No (- (- $Perm.Write (pTaken@21@01 r)) (pTaken@23@01 r)))
        false)
      (=
        ($FVF.lookup_val (as sm@27@01  $FVF<val>) r)
        ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@16@01)) r)))
    :pattern (($FVF.lookup_val (as sm@27@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@16@01)) r))
    :qid |qp.fvfValDef6|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (+
      (ite (= (slot<Ref> a@15@01 1) (slot<Ref> a@15@01 1)) $Perm.Write $Perm.No)
      (ite (= (slot<Ref> a@15@01 1) (slot<Ref> a@15@01 0)) $Perm.Write $Perm.No))
    (ite
      (and
        (img@19@01 (slot<Ref> a@15@01 1))
        (and
          (<= 0 (inv@18@01 (slot<Ref> a@15@01 1)))
          (< (inv@18@01 (slot<Ref> a@15@01 1)) (len<Int> a@15@01))))
      (-
        (- $Perm.Write (pTaken@21@01 (slot<Ref> a@15@01 1)))
        (pTaken@23@01 (slot<Ref> a@15@01 1)))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (>= j@26@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] Seq(0, 1)
(push) ; 6
; [then-branch: 7 | !(Lookup(val, sm@27@01, slot[Ref](a@15@01, 1))[j@26@01] === [0] ++ [1]) | live]
; [else-branch: 7 | Lookup(val, sm@27@01, slot[Ref](a@15@01, 1))[j@26@01] === [0] ++ [1] | live]
(push) ; 7
; [then-branch: 7 | !(Lookup(val, sm@27@01, slot[Ref](a@15@01, 1))[j@26@01] === [0] ++ [1])]
(assert (not
  (Seq_equal
    (Seq_index
      ($FVF.lookup_val (as sm@27@01  $FVF<val>) (slot<Ref> a@15@01 1))
      j@26@01)
    (Seq_append (Seq_singleton 0) (Seq_singleton 1)))))
(pop) ; 7
(push) ; 7
; [else-branch: 7 | Lookup(val, sm@27@01, slot[Ref](a@15@01, 1))[j@26@01] === [0] ++ [1]]
(assert (Seq_equal
  (Seq_index
    ($FVF.lookup_val (as sm@27@01  $FVF<val>) (slot<Ref> a@15@01 1))
    j@26@01)
  (Seq_append (Seq_singleton 0) (Seq_singleton 1))))
; [eval] valid(slot(a, 1).val[j], 1, true)
; [eval] slot(a, 1).val[j]
; [eval] slot(a, 1)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r (slot<Ref> a@15@01 1))
      (=
        ($FVF.lookup_val (as sm@27@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@25@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@27@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@25@01  $FVF<val>) r))
    :qid |qp.fvfValDef4|))
  (forall ((r $Ref)) (!
    (=>
      (= r (slot<Ref> a@15@01 0))
      (=
        ($FVF.lookup_val (as sm@27@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@22@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@27@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@22@01  $FVF<val>) r))
    :qid |qp.fvfValDef5|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and
          (img@19@01 r)
          (and (<= 0 (inv@18@01 r)) (< (inv@18@01 r) (len<Int> a@15@01))))
        (< $Perm.No (- (- $Perm.Write (pTaken@21@01 r)) (pTaken@23@01 r)))
        false)
      (=
        ($FVF.lookup_val (as sm@27@01  $FVF<val>) r)
        ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@16@01)) r)))
    :pattern (($FVF.lookup_val (as sm@27@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@16@01)) r))
    :qid |qp.fvfValDef6|))))
(push) ; 8
(assert (not (<
  $Perm.No
  (+
    (+
      (ite (= (slot<Ref> a@15@01 1) (slot<Ref> a@15@01 1)) $Perm.Write $Perm.No)
      (ite (= (slot<Ref> a@15@01 1) (slot<Ref> a@15@01 0)) $Perm.Write $Perm.No))
    (ite
      (and
        (img@19@01 (slot<Ref> a@15@01 1))
        (and
          (<= 0 (inv@18@01 (slot<Ref> a@15@01 1)))
          (< (inv@18@01 (slot<Ref> a@15@01 1)) (len<Int> a@15@01))))
      (-
        (- $Perm.Write (pTaken@21@01 (slot<Ref> a@15@01 1)))
        (pTaken@23@01 (slot<Ref> a@15@01 1)))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(push) ; 8
(assert (not (>= j@26@01 0)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(push) ; 8
(assert (valid%precondition $Snap.unit (Seq_index
  ($FVF.lookup_val (as sm@27@01  $FVF<val>) (slot<Ref> a@15@01 1))
  j@26@01) 1 true))
(pop) ; 8
; Joined path conditions
(assert (valid%precondition $Snap.unit (Seq_index
  ($FVF.lookup_val (as sm@27@01  $FVF<val>) (slot<Ref> a@15@01 1))
  j@26@01) 1 true))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 1))
    (=
      ($FVF.lookup_val (as sm@27@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@25@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@27@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@25@01  $FVF<val>) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 0))
    (=
      ($FVF.lookup_val (as sm@27@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@22@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@27@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@22@01  $FVF<val>) r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@19@01 r)
        (and (<= 0 (inv@18@01 r)) (< (inv@18@01 r) (len<Int> a@15@01))))
      (< $Perm.No (- (- $Perm.Write (pTaken@21@01 r)) (pTaken@23@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@27@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@16@01)) r)))
  :pattern (($FVF.lookup_val (as sm@27@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@16@01)) r))
  :qid |qp.fvfValDef6|)))
(assert (=>
  (Seq_equal
    (Seq_index
      ($FVF.lookup_val (as sm@27@01  $FVF<val>) (slot<Ref> a@15@01 1))
      j@26@01)
    (Seq_append (Seq_singleton 0) (Seq_singleton 1)))
  (and
    (Seq_equal
      (Seq_index
        ($FVF.lookup_val (as sm@27@01  $FVF<val>) (slot<Ref> a@15@01 1))
        j@26@01)
      (Seq_append (Seq_singleton 0) (Seq_singleton 1)))
    (valid%precondition $Snap.unit (Seq_index
      ($FVF.lookup_val (as sm@27@01  $FVF<val>) (slot<Ref> a@15@01 1))
      j@26@01) 1 true))))
(assert (or
  (Seq_equal
    (Seq_index
      ($FVF.lookup_val (as sm@27@01  $FVF<val>) (slot<Ref> a@15@01 1))
      j@26@01)
    (Seq_append (Seq_singleton 0) (Seq_singleton 1)))
  (not
    (Seq_equal
      (Seq_index
        ($FVF.lookup_val (as sm@27@01  $FVF<val>) (slot<Ref> a@15@01 1))
        j@26@01)
      (Seq_append (Seq_singleton 0) (Seq_singleton 1))))))
(pop) ; 5
(push) ; 5
; [else-branch: 6 | !(0 <= j@26@01 && j@26@01 < |Lookup(val, sm@27@01, slot[Ref](a@15@01, 1))|)]
(assert (not
  (and
    (<= 0 j@26@01)
    (<
      j@26@01
      (Seq_length
        ($FVF.lookup_val (as sm@27@01  $FVF<val>) (slot<Ref> a@15@01 1)))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 1))
    (=
      ($FVF.lookup_val (as sm@27@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@25@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@27@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@25@01  $FVF<val>) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 0))
    (=
      ($FVF.lookup_val (as sm@27@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@22@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@27@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@22@01  $FVF<val>) r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@19@01 r)
        (and (<= 0 (inv@18@01 r)) (< (inv@18@01 r) (len<Int> a@15@01))))
      (< $Perm.No (- (- $Perm.Write (pTaken@21@01 r)) (pTaken@23@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@27@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@16@01)) r)))
  :pattern (($FVF.lookup_val (as sm@27@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@16@01)) r))
  :qid |qp.fvfValDef6|)))
(assert (=>
  (and
    (<= 0 j@26@01)
    (<
      j@26@01
      (Seq_length
        ($FVF.lookup_val (as sm@27@01  $FVF<val>) (slot<Ref> a@15@01 1)))))
  (and
    (<= 0 j@26@01)
    (<
      j@26@01
      (Seq_length
        ($FVF.lookup_val (as sm@27@01  $FVF<val>) (slot<Ref> a@15@01 1))))
    (=>
      (Seq_equal
        (Seq_index
          ($FVF.lookup_val (as sm@27@01  $FVF<val>) (slot<Ref> a@15@01 1))
          j@26@01)
        (Seq_append (Seq_singleton 0) (Seq_singleton 1)))
      (and
        (Seq_equal
          (Seq_index
            ($FVF.lookup_val (as sm@27@01  $FVF<val>) (slot<Ref> a@15@01 1))
            j@26@01)
          (Seq_append (Seq_singleton 0) (Seq_singleton 1)))
        (valid%precondition $Snap.unit (Seq_index
          ($FVF.lookup_val (as sm@27@01  $FVF<val>) (slot<Ref> a@15@01 1))
          j@26@01) 1 true)))
    (or
      (Seq_equal
        (Seq_index
          ($FVF.lookup_val (as sm@27@01  $FVF<val>) (slot<Ref> a@15@01 1))
          j@26@01)
        (Seq_append (Seq_singleton 0) (Seq_singleton 1)))
      (not
        (Seq_equal
          (Seq_index
            ($FVF.lookup_val (as sm@27@01  $FVF<val>) (slot<Ref> a@15@01 1))
            j@26@01)
          (Seq_append (Seq_singleton 0) (Seq_singleton 1))))))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 j@26@01)
      (<
        j@26@01
        (Seq_length
          ($FVF.lookup_val (as sm@27@01  $FVF<val>) (slot<Ref> a@15@01 1))))))
  (and
    (<= 0 j@26@01)
    (<
      j@26@01
      (Seq_length
        ($FVF.lookup_val (as sm@27@01  $FVF<val>) (slot<Ref> a@15@01 1)))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 1))
    (=
      ($FVF.lookup_val (as sm@27@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@25@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@27@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@25@01  $FVF<val>) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 0))
    (=
      ($FVF.lookup_val (as sm@27@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@22@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@27@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@22@01  $FVF<val>) r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@19@01 r)
        (and (<= 0 (inv@18@01 r)) (< (inv@18@01 r) (len<Int> a@15@01))))
      (< $Perm.No (- (- $Perm.Write (pTaken@21@01 r)) (pTaken@23@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@27@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@16@01)) r)))
  :pattern (($FVF.lookup_val (as sm@27@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@16@01)) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@28@01  $FPM) r)
    (+
      (+
        (ite (= r (slot<Ref> a@15@01 1)) $Perm.Write $Perm.No)
        (ite (= r (slot<Ref> a@15@01 0)) $Perm.Write $Perm.No))
      (ite
        (and
          (img@19@01 r)
          (and (<= 0 (inv@18@01 r)) (< (inv@18@01 r) (len<Int> a@15@01))))
        (- (- $Perm.Write (pTaken@21@01 r)) (pTaken@23@01 r))
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@28@01  $FPM) r))
  :qid |qp.resPrmSumDef7|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@26@01 Int)) (!
  (and
    (or (<= 0 j@26@01) (not (<= 0 j@26@01)))
    (=>
      (and
        (<= 0 j@26@01)
        (<
          j@26@01
          (Seq_length
            ($FVF.lookup_val (as sm@27@01  $FVF<val>) (slot<Ref> a@15@01 1)))))
      (and
        (<= 0 j@26@01)
        (<
          j@26@01
          (Seq_length
            ($FVF.lookup_val (as sm@27@01  $FVF<val>) (slot<Ref> a@15@01 1))))
        (=>
          (Seq_equal
            (Seq_index
              ($FVF.lookup_val (as sm@27@01  $FVF<val>) (slot<Ref> a@15@01 1))
              j@26@01)
            (Seq_append (Seq_singleton 0) (Seq_singleton 1)))
          (and
            (Seq_equal
              (Seq_index
                ($FVF.lookup_val (as sm@27@01  $FVF<val>) (slot<Ref> a@15@01 1))
                j@26@01)
              (Seq_append (Seq_singleton 0) (Seq_singleton 1)))
            (valid%precondition $Snap.unit (Seq_index
              ($FVF.lookup_val (as sm@27@01  $FVF<val>) (slot<Ref> a@15@01 1))
              j@26@01) 1 true)))
        (or
          (Seq_equal
            (Seq_index
              ($FVF.lookup_val (as sm@27@01  $FVF<val>) (slot<Ref> a@15@01 1))
              j@26@01)
            (Seq_append (Seq_singleton 0) (Seq_singleton 1)))
          (not
            (Seq_equal
              (Seq_index
                ($FVF.lookup_val (as sm@27@01  $FVF<val>) (slot<Ref> a@15@01 1))
                j@26@01)
              (Seq_append (Seq_singleton 0) (Seq_singleton 1)))))))
    (or
      (not
        (and
          (<= 0 j@26@01)
          (<
            j@26@01
            (Seq_length
              ($FVF.lookup_val (as sm@27@01  $FVF<val>) (slot<Ref> a@15@01 1))))))
      (and
        (<= 0 j@26@01)
        (<
          j@26@01
          (Seq_length
            ($FVF.lookup_val (as sm@27@01  $FVF<val>) (slot<Ref> a@15@01 1)))))))
  :pattern ((valid%limited $Snap.unit (Seq_index
    ($FVF.lookup_val (as sm@27@01  $FVF<val>) (slot<Ref> a@15@01 1))
    j@26@01) 1 true))
  :qid |prog./silicon/silver/src/test/resources/all/sequences/sequence_incompletenesses.vpr@67@10@68@71-aux|)))
(assert (forall ((j@26@01 Int)) (!
  (=>
    (and
      (and
        (<= 0 j@26@01)
        (<
          j@26@01
          (Seq_length
            ($FVF.lookup_val (as sm@27@01  $FVF<val>) (slot<Ref> a@15@01 1)))))
      (Seq_equal
        (Seq_index
          ($FVF.lookup_val (as sm@27@01  $FVF<val>) (slot<Ref> a@15@01 1))
          j@26@01)
        (Seq_append (Seq_singleton 0) (Seq_singleton 1))))
    (valid%precondition $Snap.unit (Seq_index
      ($FVF.lookup_val (as sm@27@01  $FVF<val>) (slot<Ref> a@15@01 1))
      j@26@01) 1 true))
  :pattern ((valid%limited $Snap.unit (Seq_index
    ($FVF.lookup_val (as sm@27@01  $FVF<val>) (slot<Ref> a@15@01 1))
    j@26@01) 1 true))
  :qid |prog./silicon/silver/src/test/resources/all/sequences/sequence_incompletenesses.vpr@67@10@68@71_precondition|)))
(push) ; 3
(assert (not (forall ((j@26@01 Int)) (!
  (=>
    (and
      (=>
        (and
          (and
            (<= 0 j@26@01)
            (<
              j@26@01
              (Seq_length
                ($FVF.lookup_val (as sm@27@01  $FVF<val>) (slot<Ref> a@15@01 1)))))
          (Seq_equal
            (Seq_index
              ($FVF.lookup_val (as sm@27@01  $FVF<val>) (slot<Ref> a@15@01 1))
              j@26@01)
            (Seq_append (Seq_singleton 0) (Seq_singleton 1))))
        (valid%precondition $Snap.unit (Seq_index
          ($FVF.lookup_val (as sm@27@01  $FVF<val>) (slot<Ref> a@15@01 1))
          j@26@01) 1 true))
      (and
        (<= 0 j@26@01)
        (<
          j@26@01
          (Seq_length
            ($FVF.lookup_val (as sm@27@01  $FVF<val>) (slot<Ref> a@15@01 1))))))
    (and
      (Seq_equal
        (Seq_index
          ($FVF.lookup_val (as sm@27@01  $FVF<val>) (slot<Ref> a@15@01 1))
          j@26@01)
        (Seq_append (Seq_singleton 0) (Seq_singleton 1)))
      (valid $Snap.unit (Seq_index
        ($FVF.lookup_val (as sm@27@01  $FVF<val>) (slot<Ref> a@15@01 1))
        j@26@01) 1 true)))
  :pattern ((valid%limited $Snap.unit (Seq_index
    ($FVF.lookup_val (as sm@27@01  $FVF<val>) (slot<Ref> a@15@01 1))
    j@26@01) 1 true))
  :qid |prog./silicon/silver/src/test/resources/all/sequences/sequence_incompletenesses.vpr@67@10@68@71|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((j@26@01 Int)) (!
  (=>
    (and
      (<= 0 j@26@01)
      (<
        j@26@01
        (Seq_length
          ($FVF.lookup_val (as sm@27@01  $FVF<val>) (slot<Ref> a@15@01 1)))))
    (and
      (Seq_equal
        (Seq_index
          ($FVF.lookup_val (as sm@27@01  $FVF<val>) (slot<Ref> a@15@01 1))
          j@26@01)
        (Seq_append (Seq_singleton 0) (Seq_singleton 1)))
      (valid $Snap.unit (Seq_index
        ($FVF.lookup_val (as sm@27@01  $FVF<val>) (slot<Ref> a@15@01 1))
        j@26@01) 1 true)))
  :pattern ((valid%limited $Snap.unit (Seq_index
    ($FVF.lookup_val (as sm@27@01  $FVF<val>) (slot<Ref> a@15@01 1))
    j@26@01) 1 true))
  :qid |prog./silicon/silver/src/test/resources/all/sequences/sequence_incompletenesses.vpr@67@10@68@71|)))
; [exec]
; slot(a, 2).val := Seq(Seq(0, 2))
; [eval] slot(a, 2)
; [eval] Seq(Seq(0, 2))
; [eval] Seq(0, 2)
(assert (= (Seq_length (Seq_append (Seq_singleton 0) (Seq_singleton 2))) 2))
(assert (=
  (Seq_length (Seq_singleton (Seq_append (Seq_singleton 0) (Seq_singleton 2))))
  1))
(push) ; 3
(set-option :timeout 10)
(assert (not (= (slot<Ref> a@15@01 1) (slot<Ref> a@15@01 2))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (slot<Ref> a@15@01 0) (slot<Ref> a@15@01 2))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@29@01 ((r $Ref)) $Perm
  (ite
    (= r (slot<Ref> a@15@01 2))
    ($Perm.min
      (ite
        (and
          (img@19@01 r)
          (and (<= 0 (inv@18@01 r)) (< (inv@18@01 r) (len<Int> a@15@01))))
        (- (- $Perm.Write (pTaken@21@01 r)) (pTaken@23@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@30@01 ((r $Ref)) $Perm
  (ite
    (= r (slot<Ref> a@15@01 2))
    ($Perm.min
      (ite (= r (slot<Ref> a@15@01 1)) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@29@01 r)))
    $Perm.No))
(define-fun pTaken@31@01 ((r $Ref)) $Perm
  (ite
    (= r (slot<Ref> a@15@01 2))
    ($Perm.min
      (ite (= r (slot<Ref> a@15@01 0)) $Perm.Write $Perm.No)
      (- (- $Perm.Write (pTaken@29@01 r)) (pTaken@30@01 r)))
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
        (and
          (img@19@01 r)
          (and (<= 0 (inv@18@01 r)) (< (inv@18@01 r) (len<Int> a@15@01))))
        (- (- $Perm.Write (pTaken@21@01 r)) (pTaken@23@01 r))
        $Perm.No)
      (pTaken@29@01 r))
    $Perm.No)
  
  :qid |quant-u-25|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@29@01 r) $Perm.No)
  
  :qid |quant-u-26|))))
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
  (=> (= r (slot<Ref> a@15@01 2)) (= (- $Perm.Write (pTaken@29@01 r)) $Perm.No))
  
  :qid |quant-u-27|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@32@01 $FVF<val>)
; Definitional axioms for singleton-FVF's value
(assert (=
  ($FVF.lookup_val (as sm@32@01  $FVF<val>) (slot<Ref> a@15@01 2))
  (Seq_singleton (Seq_append (Seq_singleton 0) (Seq_singleton 2)))))
; [exec]
; assert Seq(0, 2)[2..] == Seq[Int]()
; [eval] Seq(0, 2)[2..] == Seq[Int]()
; [eval] Seq(0, 2)[2..]
; [eval] Seq(0, 2)
; [eval] Seq[Int]()
(set-option :timeout 0)
(push) ; 3
(assert (not (Seq_equal
  (Seq_drop (Seq_append (Seq_singleton 0) (Seq_singleton 2)) 2)
  (as Seq_empty  Seq<Int>))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal
  (Seq_drop (Seq_append (Seq_singleton 0) (Seq_singleton 2)) 2)
  (as Seq_empty  Seq<Int>)))
; [exec]
; assert (forall j: Int ::
;     { valid(slot(a, 2).val[j], 2, true) }
;     0 <= j && j < |slot(a, 2).val| ==> valid(slot(a, 2).val[j], 2, true))
; [eval] (forall j: Int :: { valid(slot(a, 2).val[j], 2, true) } 0 <= j && j < |slot(a, 2).val| ==> valid(slot(a, 2).val[j], 2, true))
(declare-const j@33@01 Int)
(push) ; 3
; [eval] 0 <= j && j < |slot(a, 2).val| ==> valid(slot(a, 2).val[j], 2, true)
; [eval] 0 <= j && j < |slot(a, 2).val|
; [eval] 0 <= j
(push) ; 4
; [then-branch: 8 | !(0 <= j@33@01) | live]
; [else-branch: 8 | 0 <= j@33@01 | live]
(push) ; 5
; [then-branch: 8 | !(0 <= j@33@01)]
(assert (not (<= 0 j@33@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 8 | 0 <= j@33@01]
(assert (<= 0 j@33@01))
; [eval] j < |slot(a, 2).val|
; [eval] |slot(a, 2).val|
; [eval] slot(a, 2)
(declare-const sm@34@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 2))
    (=
      ($FVF.lookup_val (as sm@34@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@32@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@34@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@32@01  $FVF<val>) r))
  :qid |qp.fvfValDef8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 0))
    (=
      ($FVF.lookup_val (as sm@34@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@22@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@34@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@22@01  $FVF<val>) r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 1))
    (=
      ($FVF.lookup_val (as sm@34@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@25@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@34@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@25@01  $FVF<val>) r))
  :qid |qp.fvfValDef10|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@19@01 r)
        (and (<= 0 (inv@18@01 r)) (< (inv@18@01 r) (len<Int> a@15@01))))
      (<
        $Perm.No
        (-
          (- (- $Perm.Write (pTaken@21@01 r)) (pTaken@23@01 r))
          (pTaken@29@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@34@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@16@01)) r)))
  :pattern (($FVF.lookup_val (as sm@34@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@16@01)) r))
  :qid |qp.fvfValDef11|)))
(declare-const pm@35@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@35@01  $FPM) r)
    (+
      (+
        (+
          (ite (= r (slot<Ref> a@15@01 2)) $Perm.Write $Perm.No)
          (ite (= r (slot<Ref> a@15@01 0)) $Perm.Write $Perm.No))
        (ite (= r (slot<Ref> a@15@01 1)) $Perm.Write $Perm.No))
      (ite
        (and
          (img@19@01 r)
          (and (<= 0 (inv@18@01 r)) (< (inv@18@01 r) (len<Int> a@15@01))))
        (-
          (- (- $Perm.Write (pTaken@21@01 r)) (pTaken@23@01 r))
          (pTaken@29@01 r))
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@35@01  $FPM) r))
  :qid |qp.resPrmSumDef12|)))
(push) ; 6
(assert (not (< $Perm.No ($FVF.perm_val (as pm@35@01  $FPM) (slot<Ref> a@15@01 2)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 2))
    (=
      ($FVF.lookup_val (as sm@34@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@32@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@34@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@32@01  $FVF<val>) r))
  :qid |qp.fvfValDef8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 0))
    (=
      ($FVF.lookup_val (as sm@34@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@22@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@34@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@22@01  $FVF<val>) r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 1))
    (=
      ($FVF.lookup_val (as sm@34@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@25@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@34@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@25@01  $FVF<val>) r))
  :qid |qp.fvfValDef10|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@19@01 r)
        (and (<= 0 (inv@18@01 r)) (< (inv@18@01 r) (len<Int> a@15@01))))
      (<
        $Perm.No
        (-
          (- (- $Perm.Write (pTaken@21@01 r)) (pTaken@23@01 r))
          (pTaken@29@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@34@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@16@01)) r)))
  :pattern (($FVF.lookup_val (as sm@34@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@16@01)) r))
  :qid |qp.fvfValDef11|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@35@01  $FPM) r)
    (+
      (+
        (+
          (ite (= r (slot<Ref> a@15@01 2)) $Perm.Write $Perm.No)
          (ite (= r (slot<Ref> a@15@01 0)) $Perm.Write $Perm.No))
        (ite (= r (slot<Ref> a@15@01 1)) $Perm.Write $Perm.No))
      (ite
        (and
          (img@19@01 r)
          (and (<= 0 (inv@18@01 r)) (< (inv@18@01 r) (len<Int> a@15@01))))
        (-
          (- (- $Perm.Write (pTaken@21@01 r)) (pTaken@23@01 r))
          (pTaken@29@01 r))
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@35@01  $FPM) r))
  :qid |qp.resPrmSumDef12|)))
(assert (or (<= 0 j@33@01) (not (<= 0 j@33@01))))
(push) ; 4
; [then-branch: 9 | 0 <= j@33@01 && j@33@01 < |Lookup(val, sm@34@01, slot[Ref](a@15@01, 2))| | live]
; [else-branch: 9 | !(0 <= j@33@01 && j@33@01 < |Lookup(val, sm@34@01, slot[Ref](a@15@01, 2))|) | live]
(push) ; 5
; [then-branch: 9 | 0 <= j@33@01 && j@33@01 < |Lookup(val, sm@34@01, slot[Ref](a@15@01, 2))|]
(assert (and
  (<= 0 j@33@01)
  (<
    j@33@01
    (Seq_length ($FVF.lookup_val (as sm@34@01  $FVF<val>) (slot<Ref> a@15@01 2))))))
; [eval] valid(slot(a, 2).val[j], 2, true)
; [eval] slot(a, 2).val[j]
; [eval] slot(a, 2)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r (slot<Ref> a@15@01 2))
      (=
        ($FVF.lookup_val (as sm@34@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@32@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@34@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@32@01  $FVF<val>) r))
    :qid |qp.fvfValDef8|))
  (forall ((r $Ref)) (!
    (=>
      (= r (slot<Ref> a@15@01 0))
      (=
        ($FVF.lookup_val (as sm@34@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@22@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@34@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@22@01  $FVF<val>) r))
    :qid |qp.fvfValDef9|))
  (forall ((r $Ref)) (!
    (=>
      (= r (slot<Ref> a@15@01 1))
      (=
        ($FVF.lookup_val (as sm@34@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@25@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@34@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@25@01  $FVF<val>) r))
    :qid |qp.fvfValDef10|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and
          (img@19@01 r)
          (and (<= 0 (inv@18@01 r)) (< (inv@18@01 r) (len<Int> a@15@01))))
        (<
          $Perm.No
          (-
            (- (- $Perm.Write (pTaken@21@01 r)) (pTaken@23@01 r))
            (pTaken@29@01 r)))
        false)
      (=
        ($FVF.lookup_val (as sm@34@01  $FVF<val>) r)
        ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@16@01)) r)))
    :pattern (($FVF.lookup_val (as sm@34@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@16@01)) r))
    :qid |qp.fvfValDef11|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (+
      (+
        (ite
          (= (slot<Ref> a@15@01 2) (slot<Ref> a@15@01 2))
          $Perm.Write
          $Perm.No)
        (ite
          (= (slot<Ref> a@15@01 2) (slot<Ref> a@15@01 0))
          $Perm.Write
          $Perm.No))
      (ite (= (slot<Ref> a@15@01 2) (slot<Ref> a@15@01 1)) $Perm.Write $Perm.No))
    (ite
      (and
        (img@19@01 (slot<Ref> a@15@01 2))
        (and
          (<= 0 (inv@18@01 (slot<Ref> a@15@01 2)))
          (< (inv@18@01 (slot<Ref> a@15@01 2)) (len<Int> a@15@01))))
      (-
        (-
          (- $Perm.Write (pTaken@21@01 (slot<Ref> a@15@01 2)))
          (pTaken@23@01 (slot<Ref> a@15@01 2)))
        (pTaken@29@01 (slot<Ref> a@15@01 2)))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (>= j@33@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (valid%precondition $Snap.unit (Seq_index
  ($FVF.lookup_val (as sm@34@01  $FVF<val>) (slot<Ref> a@15@01 2))
  j@33@01) 2 true))
(pop) ; 6
; Joined path conditions
(assert (valid%precondition $Snap.unit (Seq_index
  ($FVF.lookup_val (as sm@34@01  $FVF<val>) (slot<Ref> a@15@01 2))
  j@33@01) 2 true))
(pop) ; 5
(push) ; 5
; [else-branch: 9 | !(0 <= j@33@01 && j@33@01 < |Lookup(val, sm@34@01, slot[Ref](a@15@01, 2))|)]
(assert (not
  (and
    (<= 0 j@33@01)
    (<
      j@33@01
      (Seq_length
        ($FVF.lookup_val (as sm@34@01  $FVF<val>) (slot<Ref> a@15@01 2)))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 2))
    (=
      ($FVF.lookup_val (as sm@34@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@32@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@34@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@32@01  $FVF<val>) r))
  :qid |qp.fvfValDef8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 0))
    (=
      ($FVF.lookup_val (as sm@34@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@22@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@34@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@22@01  $FVF<val>) r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 1))
    (=
      ($FVF.lookup_val (as sm@34@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@25@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@34@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@25@01  $FVF<val>) r))
  :qid |qp.fvfValDef10|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@19@01 r)
        (and (<= 0 (inv@18@01 r)) (< (inv@18@01 r) (len<Int> a@15@01))))
      (<
        $Perm.No
        (-
          (- (- $Perm.Write (pTaken@21@01 r)) (pTaken@23@01 r))
          (pTaken@29@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@34@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@16@01)) r)))
  :pattern (($FVF.lookup_val (as sm@34@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@16@01)) r))
  :qid |qp.fvfValDef11|)))
(assert (=>
  (and
    (<= 0 j@33@01)
    (<
      j@33@01
      (Seq_length
        ($FVF.lookup_val (as sm@34@01  $FVF<val>) (slot<Ref> a@15@01 2)))))
  (and
    (<= 0 j@33@01)
    (<
      j@33@01
      (Seq_length
        ($FVF.lookup_val (as sm@34@01  $FVF<val>) (slot<Ref> a@15@01 2))))
    (valid%precondition $Snap.unit (Seq_index
      ($FVF.lookup_val (as sm@34@01  $FVF<val>) (slot<Ref> a@15@01 2))
      j@33@01) 2 true))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 j@33@01)
      (<
        j@33@01
        (Seq_length
          ($FVF.lookup_val (as sm@34@01  $FVF<val>) (slot<Ref> a@15@01 2))))))
  (and
    (<= 0 j@33@01)
    (<
      j@33@01
      (Seq_length
        ($FVF.lookup_val (as sm@34@01  $FVF<val>) (slot<Ref> a@15@01 2)))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 2))
    (=
      ($FVF.lookup_val (as sm@34@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@32@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@34@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@32@01  $FVF<val>) r))
  :qid |qp.fvfValDef8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 0))
    (=
      ($FVF.lookup_val (as sm@34@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@22@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@34@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@22@01  $FVF<val>) r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 1))
    (=
      ($FVF.lookup_val (as sm@34@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@25@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@34@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@25@01  $FVF<val>) r))
  :qid |qp.fvfValDef10|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@19@01 r)
        (and (<= 0 (inv@18@01 r)) (< (inv@18@01 r) (len<Int> a@15@01))))
      (<
        $Perm.No
        (-
          (- (- $Perm.Write (pTaken@21@01 r)) (pTaken@23@01 r))
          (pTaken@29@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@34@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@16@01)) r)))
  :pattern (($FVF.lookup_val (as sm@34@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@16@01)) r))
  :qid |qp.fvfValDef11|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@35@01  $FPM) r)
    (+
      (+
        (+
          (ite (= r (slot<Ref> a@15@01 2)) $Perm.Write $Perm.No)
          (ite (= r (slot<Ref> a@15@01 0)) $Perm.Write $Perm.No))
        (ite (= r (slot<Ref> a@15@01 1)) $Perm.Write $Perm.No))
      (ite
        (and
          (img@19@01 r)
          (and (<= 0 (inv@18@01 r)) (< (inv@18@01 r) (len<Int> a@15@01))))
        (-
          (- (- $Perm.Write (pTaken@21@01 r)) (pTaken@23@01 r))
          (pTaken@29@01 r))
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@35@01  $FPM) r))
  :qid |qp.resPrmSumDef12|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@33@01 Int)) (!
  (and
    (or (<= 0 j@33@01) (not (<= 0 j@33@01)))
    (=>
      (and
        (<= 0 j@33@01)
        (<
          j@33@01
          (Seq_length
            ($FVF.lookup_val (as sm@34@01  $FVF<val>) (slot<Ref> a@15@01 2)))))
      (and
        (<= 0 j@33@01)
        (<
          j@33@01
          (Seq_length
            ($FVF.lookup_val (as sm@34@01  $FVF<val>) (slot<Ref> a@15@01 2))))
        (valid%precondition $Snap.unit (Seq_index
          ($FVF.lookup_val (as sm@34@01  $FVF<val>) (slot<Ref> a@15@01 2))
          j@33@01) 2 true)))
    (or
      (not
        (and
          (<= 0 j@33@01)
          (<
            j@33@01
            (Seq_length
              ($FVF.lookup_val (as sm@34@01  $FVF<val>) (slot<Ref> a@15@01 2))))))
      (and
        (<= 0 j@33@01)
        (<
          j@33@01
          (Seq_length
            ($FVF.lookup_val (as sm@34@01  $FVF<val>) (slot<Ref> a@15@01 2)))))))
  :pattern ((valid%limited $Snap.unit (Seq_index
    ($FVF.lookup_val (as sm@34@01  $FVF<val>) (slot<Ref> a@15@01 2))
    j@33@01) 2 true))
  :qid |prog./silicon/silver/src/test/resources/all/sequences/sequence_incompletenesses.vpr@72@10@73@37-aux|)))
(assert (forall ((j@33@01 Int)) (!
  (=>
    (and
      (<= 0 j@33@01)
      (<
        j@33@01
        (Seq_length
          ($FVF.lookup_val (as sm@34@01  $FVF<val>) (slot<Ref> a@15@01 2)))))
    (valid%precondition $Snap.unit (Seq_index
      ($FVF.lookup_val (as sm@34@01  $FVF<val>) (slot<Ref> a@15@01 2))
      j@33@01) 2 true))
  :pattern ((valid%limited $Snap.unit (Seq_index
    ($FVF.lookup_val (as sm@34@01  $FVF<val>) (slot<Ref> a@15@01 2))
    j@33@01) 2 true))
  :qid |prog./silicon/silver/src/test/resources/all/sequences/sequence_incompletenesses.vpr@72@10@73@37_precondition|)))
(push) ; 3
(assert (not (forall ((j@33@01 Int)) (!
  (=>
    (and
      (=>
        (and
          (<= 0 j@33@01)
          (<
            j@33@01
            (Seq_length
              ($FVF.lookup_val (as sm@34@01  $FVF<val>) (slot<Ref> a@15@01 2)))))
        (valid%precondition $Snap.unit (Seq_index
          ($FVF.lookup_val (as sm@34@01  $FVF<val>) (slot<Ref> a@15@01 2))
          j@33@01) 2 true))
      (and
        (<= 0 j@33@01)
        (<
          j@33@01
          (Seq_length
            ($FVF.lookup_val (as sm@34@01  $FVF<val>) (slot<Ref> a@15@01 2))))))
    (valid $Snap.unit (Seq_index
      ($FVF.lookup_val (as sm@34@01  $FVF<val>) (slot<Ref> a@15@01 2))
      j@33@01) 2 true))
  :pattern ((valid%limited $Snap.unit (Seq_index
    ($FVF.lookup_val (as sm@34@01  $FVF<val>) (slot<Ref> a@15@01 2))
    j@33@01) 2 true))
  :qid |prog./silicon/silver/src/test/resources/all/sequences/sequence_incompletenesses.vpr@72@10@73@37|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((j@33@01 Int)) (!
  (=>
    (and
      (<= 0 j@33@01)
      (<
        j@33@01
        (Seq_length
          ($FVF.lookup_val (as sm@34@01  $FVF<val>) (slot<Ref> a@15@01 2)))))
    (valid $Snap.unit (Seq_index
      ($FVF.lookup_val (as sm@34@01  $FVF<val>) (slot<Ref> a@15@01 2))
      j@33@01) 2 true))
  :pattern ((valid%limited $Snap.unit (Seq_index
    ($FVF.lookup_val (as sm@34@01  $FVF<val>) (slot<Ref> a@15@01 2))
    j@33@01) 2 true))
  :qid |prog./silicon/silver/src/test/resources/all/sequences/sequence_incompletenesses.vpr@72@10@73@37|)))
; [exec]
; slot(a, 3).val := Seq(Seq(0, 3), Seq(3))
; [eval] slot(a, 3)
; [eval] Seq(Seq(0, 3), Seq(3))
; [eval] Seq(0, 3)
(assert (= (Seq_length (Seq_append (Seq_singleton 0) (Seq_singleton 3))) 2))
; [eval] Seq(3)
(assert (= (Seq_length (Seq_singleton 3)) 1))
(assert (=
  (Seq_length
    (Seq_append
      (Seq_singleton (Seq_append (Seq_singleton 0) (Seq_singleton 3)))
      (Seq_singleton (Seq_singleton 3))))
  2))
(push) ; 3
(set-option :timeout 10)
(assert (not (= (slot<Ref> a@15@01 2) (slot<Ref> a@15@01 3))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (slot<Ref> a@15@01 0) (slot<Ref> a@15@01 3))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (slot<Ref> a@15@01 1) (slot<Ref> a@15@01 3))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@36@01 ((r $Ref)) $Perm
  (ite
    (= r (slot<Ref> a@15@01 3))
    ($Perm.min
      (ite
        (and
          (img@19@01 r)
          (and (<= 0 (inv@18@01 r)) (< (inv@18@01 r) (len<Int> a@15@01))))
        (-
          (- (- $Perm.Write (pTaken@21@01 r)) (pTaken@23@01 r))
          (pTaken@29@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@37@01 ((r $Ref)) $Perm
  (ite
    (= r (slot<Ref> a@15@01 3))
    ($Perm.min
      (ite (= r (slot<Ref> a@15@01 2)) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@36@01 r)))
    $Perm.No))
(define-fun pTaken@38@01 ((r $Ref)) $Perm
  (ite
    (= r (slot<Ref> a@15@01 3))
    ($Perm.min
      (ite (= r (slot<Ref> a@15@01 0)) $Perm.Write $Perm.No)
      (- (- $Perm.Write (pTaken@36@01 r)) (pTaken@37@01 r)))
    $Perm.No))
(define-fun pTaken@39@01 ((r $Ref)) $Perm
  (ite
    (= r (slot<Ref> a@15@01 3))
    ($Perm.min
      (ite (= r (slot<Ref> a@15@01 1)) $Perm.Write $Perm.No)
      (- (- (- $Perm.Write (pTaken@36@01 r)) (pTaken@37@01 r)) (pTaken@38@01 r)))
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
        (and
          (img@19@01 r)
          (and (<= 0 (inv@18@01 r)) (< (inv@18@01 r) (len<Int> a@15@01))))
        (-
          (- (- $Perm.Write (pTaken@21@01 r)) (pTaken@23@01 r))
          (pTaken@29@01 r))
        $Perm.No)
      (pTaken@36@01 r))
    $Perm.No)
  
  :qid |quant-u-29|))))
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
  
  :qid |quant-u-30|))))
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
  (=> (= r (slot<Ref> a@15@01 3)) (= (- $Perm.Write (pTaken@36@01 r)) $Perm.No))
  
  :qid |quant-u-31|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@40@01 $FVF<val>)
; Definitional axioms for singleton-FVF's value
(assert (=
  ($FVF.lookup_val (as sm@40@01  $FVF<val>) (slot<Ref> a@15@01 3))
  (Seq_append
    (Seq_singleton (Seq_append (Seq_singleton 0) (Seq_singleton 3)))
    (Seq_singleton (Seq_singleton 3)))))
; [exec]
; assert Seq(0, 3)[2..] == Seq[Int]()
; [eval] Seq(0, 3)[2..] == Seq[Int]()
; [eval] Seq(0, 3)[2..]
; [eval] Seq(0, 3)
; [eval] Seq[Int]()
(set-option :timeout 0)
(push) ; 3
(assert (not (Seq_equal
  (Seq_drop (Seq_append (Seq_singleton 0) (Seq_singleton 3)) 2)
  (as Seq_empty  Seq<Int>))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (Seq_equal
  (Seq_drop (Seq_append (Seq_singleton 0) (Seq_singleton 3)) 2)
  (as Seq_empty  Seq<Int>)))
; [exec]
; assert (forall j: Int ::
;     { valid(slot(a, 3).val[j], 3, true) }
;     0 <= j && j < |slot(a, 3).val| ==> valid(slot(a, 3).val[j], 3, true))
; [eval] (forall j: Int :: { valid(slot(a, 3).val[j], 3, true) } 0 <= j && j < |slot(a, 3).val| ==> valid(slot(a, 3).val[j], 3, true))
(declare-const j@41@01 Int)
(push) ; 3
; [eval] 0 <= j && j < |slot(a, 3).val| ==> valid(slot(a, 3).val[j], 3, true)
; [eval] 0 <= j && j < |slot(a, 3).val|
; [eval] 0 <= j
(push) ; 4
; [then-branch: 10 | !(0 <= j@41@01) | live]
; [else-branch: 10 | 0 <= j@41@01 | live]
(push) ; 5
; [then-branch: 10 | !(0 <= j@41@01)]
(assert (not (<= 0 j@41@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 10 | 0 <= j@41@01]
(assert (<= 0 j@41@01))
; [eval] j < |slot(a, 3).val|
; [eval] |slot(a, 3).val|
; [eval] slot(a, 3)
(declare-const sm@42@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 3))
    (=
      ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@40@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@40@01  $FVF<val>) r))
  :qid |qp.fvfValDef13|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 1))
    (=
      ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@25@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@25@01  $FVF<val>) r))
  :qid |qp.fvfValDef14|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 0))
    (=
      ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@22@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@22@01  $FVF<val>) r))
  :qid |qp.fvfValDef15|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 2))
    (=
      ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@32@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@32@01  $FVF<val>) r))
  :qid |qp.fvfValDef16|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@19@01 r)
        (and (<= 0 (inv@18@01 r)) (< (inv@18@01 r) (len<Int> a@15@01))))
      (<
        $Perm.No
        (-
          (-
            (- (- $Perm.Write (pTaken@21@01 r)) (pTaken@23@01 r))
            (pTaken@29@01 r))
          (pTaken@36@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@16@01)) r)))
  :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@16@01)) r))
  :qid |qp.fvfValDef17|)))
(declare-const pm@43@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@43@01  $FPM) r)
    (+
      (+
        (+
          (+
            (ite (= r (slot<Ref> a@15@01 3)) $Perm.Write $Perm.No)
            (ite (= r (slot<Ref> a@15@01 1)) $Perm.Write $Perm.No))
          (ite (= r (slot<Ref> a@15@01 0)) $Perm.Write $Perm.No))
        (ite (= r (slot<Ref> a@15@01 2)) $Perm.Write $Perm.No))
      (ite
        (and
          (img@19@01 r)
          (and (<= 0 (inv@18@01 r)) (< (inv@18@01 r) (len<Int> a@15@01))))
        (-
          (-
            (- (- $Perm.Write (pTaken@21@01 r)) (pTaken@23@01 r))
            (pTaken@29@01 r))
          (pTaken@36@01 r))
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@43@01  $FPM) r))
  :qid |qp.resPrmSumDef18|)))
(push) ; 6
(assert (not (< $Perm.No ($FVF.perm_val (as pm@43@01  $FPM) (slot<Ref> a@15@01 3)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 3))
    (=
      ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@40@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@40@01  $FVF<val>) r))
  :qid |qp.fvfValDef13|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 1))
    (=
      ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@25@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@25@01  $FVF<val>) r))
  :qid |qp.fvfValDef14|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 0))
    (=
      ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@22@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@22@01  $FVF<val>) r))
  :qid |qp.fvfValDef15|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 2))
    (=
      ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@32@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@32@01  $FVF<val>) r))
  :qid |qp.fvfValDef16|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@19@01 r)
        (and (<= 0 (inv@18@01 r)) (< (inv@18@01 r) (len<Int> a@15@01))))
      (<
        $Perm.No
        (-
          (-
            (- (- $Perm.Write (pTaken@21@01 r)) (pTaken@23@01 r))
            (pTaken@29@01 r))
          (pTaken@36@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@16@01)) r)))
  :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@16@01)) r))
  :qid |qp.fvfValDef17|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@43@01  $FPM) r)
    (+
      (+
        (+
          (+
            (ite (= r (slot<Ref> a@15@01 3)) $Perm.Write $Perm.No)
            (ite (= r (slot<Ref> a@15@01 1)) $Perm.Write $Perm.No))
          (ite (= r (slot<Ref> a@15@01 0)) $Perm.Write $Perm.No))
        (ite (= r (slot<Ref> a@15@01 2)) $Perm.Write $Perm.No))
      (ite
        (and
          (img@19@01 r)
          (and (<= 0 (inv@18@01 r)) (< (inv@18@01 r) (len<Int> a@15@01))))
        (-
          (-
            (- (- $Perm.Write (pTaken@21@01 r)) (pTaken@23@01 r))
            (pTaken@29@01 r))
          (pTaken@36@01 r))
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@43@01  $FPM) r))
  :qid |qp.resPrmSumDef18|)))
(assert (or (<= 0 j@41@01) (not (<= 0 j@41@01))))
(push) ; 4
; [then-branch: 11 | 0 <= j@41@01 && j@41@01 < |Lookup(val, sm@42@01, slot[Ref](a@15@01, 3))| | live]
; [else-branch: 11 | !(0 <= j@41@01 && j@41@01 < |Lookup(val, sm@42@01, slot[Ref](a@15@01, 3))|) | live]
(push) ; 5
; [then-branch: 11 | 0 <= j@41@01 && j@41@01 < |Lookup(val, sm@42@01, slot[Ref](a@15@01, 3))|]
(assert (and
  (<= 0 j@41@01)
  (<
    j@41@01
    (Seq_length ($FVF.lookup_val (as sm@42@01  $FVF<val>) (slot<Ref> a@15@01 3))))))
; [eval] valid(slot(a, 3).val[j], 3, true)
; [eval] slot(a, 3).val[j]
; [eval] slot(a, 3)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r (slot<Ref> a@15@01 3))
      (=
        ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@40@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@40@01  $FVF<val>) r))
    :qid |qp.fvfValDef13|))
  (forall ((r $Ref)) (!
    (=>
      (= r (slot<Ref> a@15@01 1))
      (=
        ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@25@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@25@01  $FVF<val>) r))
    :qid |qp.fvfValDef14|))
  (forall ((r $Ref)) (!
    (=>
      (= r (slot<Ref> a@15@01 0))
      (=
        ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@22@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@22@01  $FVF<val>) r))
    :qid |qp.fvfValDef15|))
  (forall ((r $Ref)) (!
    (=>
      (= r (slot<Ref> a@15@01 2))
      (=
        ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@32@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@32@01  $FVF<val>) r))
    :qid |qp.fvfValDef16|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and
          (img@19@01 r)
          (and (<= 0 (inv@18@01 r)) (< (inv@18@01 r) (len<Int> a@15@01))))
        (<
          $Perm.No
          (-
            (-
              (- (- $Perm.Write (pTaken@21@01 r)) (pTaken@23@01 r))
              (pTaken@29@01 r))
            (pTaken@36@01 r)))
        false)
      (=
        ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
        ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@16@01)) r)))
    :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@16@01)) r))
    :qid |qp.fvfValDef17|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (+
      (+
        (+
          (ite
            (= (slot<Ref> a@15@01 3) (slot<Ref> a@15@01 3))
            $Perm.Write
            $Perm.No)
          (ite
            (= (slot<Ref> a@15@01 3) (slot<Ref> a@15@01 1))
            $Perm.Write
            $Perm.No))
        (ite
          (= (slot<Ref> a@15@01 3) (slot<Ref> a@15@01 0))
          $Perm.Write
          $Perm.No))
      (ite (= (slot<Ref> a@15@01 3) (slot<Ref> a@15@01 2)) $Perm.Write $Perm.No))
    (ite
      (and
        (img@19@01 (slot<Ref> a@15@01 3))
        (and
          (<= 0 (inv@18@01 (slot<Ref> a@15@01 3)))
          (< (inv@18@01 (slot<Ref> a@15@01 3)) (len<Int> a@15@01))))
      (-
        (-
          (-
            (- $Perm.Write (pTaken@21@01 (slot<Ref> a@15@01 3)))
            (pTaken@23@01 (slot<Ref> a@15@01 3)))
          (pTaken@29@01 (slot<Ref> a@15@01 3)))
        (pTaken@36@01 (slot<Ref> a@15@01 3)))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (>= j@41@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (valid%precondition $Snap.unit (Seq_index
  ($FVF.lookup_val (as sm@42@01  $FVF<val>) (slot<Ref> a@15@01 3))
  j@41@01) 3 true))
(pop) ; 6
; Joined path conditions
(assert (valid%precondition $Snap.unit (Seq_index
  ($FVF.lookup_val (as sm@42@01  $FVF<val>) (slot<Ref> a@15@01 3))
  j@41@01) 3 true))
(pop) ; 5
(push) ; 5
; [else-branch: 11 | !(0 <= j@41@01 && j@41@01 < |Lookup(val, sm@42@01, slot[Ref](a@15@01, 3))|)]
(assert (not
  (and
    (<= 0 j@41@01)
    (<
      j@41@01
      (Seq_length
        ($FVF.lookup_val (as sm@42@01  $FVF<val>) (slot<Ref> a@15@01 3)))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 3))
    (=
      ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@40@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@40@01  $FVF<val>) r))
  :qid |qp.fvfValDef13|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 1))
    (=
      ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@25@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@25@01  $FVF<val>) r))
  :qid |qp.fvfValDef14|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 0))
    (=
      ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@22@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@22@01  $FVF<val>) r))
  :qid |qp.fvfValDef15|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 2))
    (=
      ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@32@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@32@01  $FVF<val>) r))
  :qid |qp.fvfValDef16|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@19@01 r)
        (and (<= 0 (inv@18@01 r)) (< (inv@18@01 r) (len<Int> a@15@01))))
      (<
        $Perm.No
        (-
          (-
            (- (- $Perm.Write (pTaken@21@01 r)) (pTaken@23@01 r))
            (pTaken@29@01 r))
          (pTaken@36@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@16@01)) r)))
  :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@16@01)) r))
  :qid |qp.fvfValDef17|)))
(assert (=>
  (and
    (<= 0 j@41@01)
    (<
      j@41@01
      (Seq_length
        ($FVF.lookup_val (as sm@42@01  $FVF<val>) (slot<Ref> a@15@01 3)))))
  (and
    (<= 0 j@41@01)
    (<
      j@41@01
      (Seq_length
        ($FVF.lookup_val (as sm@42@01  $FVF<val>) (slot<Ref> a@15@01 3))))
    (valid%precondition $Snap.unit (Seq_index
      ($FVF.lookup_val (as sm@42@01  $FVF<val>) (slot<Ref> a@15@01 3))
      j@41@01) 3 true))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 j@41@01)
      (<
        j@41@01
        (Seq_length
          ($FVF.lookup_val (as sm@42@01  $FVF<val>) (slot<Ref> a@15@01 3))))))
  (and
    (<= 0 j@41@01)
    (<
      j@41@01
      (Seq_length
        ($FVF.lookup_val (as sm@42@01  $FVF<val>) (slot<Ref> a@15@01 3)))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 3))
    (=
      ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@40@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@40@01  $FVF<val>) r))
  :qid |qp.fvfValDef13|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 1))
    (=
      ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@25@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@25@01  $FVF<val>) r))
  :qid |qp.fvfValDef14|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 0))
    (=
      ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@22@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@22@01  $FVF<val>) r))
  :qid |qp.fvfValDef15|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 2))
    (=
      ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@32@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@32@01  $FVF<val>) r))
  :qid |qp.fvfValDef16|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@19@01 r)
        (and (<= 0 (inv@18@01 r)) (< (inv@18@01 r) (len<Int> a@15@01))))
      (<
        $Perm.No
        (-
          (-
            (- (- $Perm.Write (pTaken@21@01 r)) (pTaken@23@01 r))
            (pTaken@29@01 r))
          (pTaken@36@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@16@01)) r)))
  :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@16@01)) r))
  :qid |qp.fvfValDef17|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@43@01  $FPM) r)
    (+
      (+
        (+
          (+
            (ite (= r (slot<Ref> a@15@01 3)) $Perm.Write $Perm.No)
            (ite (= r (slot<Ref> a@15@01 1)) $Perm.Write $Perm.No))
          (ite (= r (slot<Ref> a@15@01 0)) $Perm.Write $Perm.No))
        (ite (= r (slot<Ref> a@15@01 2)) $Perm.Write $Perm.No))
      (ite
        (and
          (img@19@01 r)
          (and (<= 0 (inv@18@01 r)) (< (inv@18@01 r) (len<Int> a@15@01))))
        (-
          (-
            (- (- $Perm.Write (pTaken@21@01 r)) (pTaken@23@01 r))
            (pTaken@29@01 r))
          (pTaken@36@01 r))
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@43@01  $FPM) r))
  :qid |qp.resPrmSumDef18|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@41@01 Int)) (!
  (and
    (or (<= 0 j@41@01) (not (<= 0 j@41@01)))
    (=>
      (and
        (<= 0 j@41@01)
        (<
          j@41@01
          (Seq_length
            ($FVF.lookup_val (as sm@42@01  $FVF<val>) (slot<Ref> a@15@01 3)))))
      (and
        (<= 0 j@41@01)
        (<
          j@41@01
          (Seq_length
            ($FVF.lookup_val (as sm@42@01  $FVF<val>) (slot<Ref> a@15@01 3))))
        (valid%precondition $Snap.unit (Seq_index
          ($FVF.lookup_val (as sm@42@01  $FVF<val>) (slot<Ref> a@15@01 3))
          j@41@01) 3 true)))
    (or
      (not
        (and
          (<= 0 j@41@01)
          (<
            j@41@01
            (Seq_length
              ($FVF.lookup_val (as sm@42@01  $FVF<val>) (slot<Ref> a@15@01 3))))))
      (and
        (<= 0 j@41@01)
        (<
          j@41@01
          (Seq_length
            ($FVF.lookup_val (as sm@42@01  $FVF<val>) (slot<Ref> a@15@01 3)))))))
  :pattern ((valid%limited $Snap.unit (Seq_index
    ($FVF.lookup_val (as sm@42@01  $FVF<val>) (slot<Ref> a@15@01 3))
    j@41@01) 3 true))
  :qid |prog./silicon/silver/src/test/resources/all/sequences/sequence_incompletenesses.vpr@77@10@78@37-aux|)))
(assert (forall ((j@41@01 Int)) (!
  (=>
    (and
      (<= 0 j@41@01)
      (<
        j@41@01
        (Seq_length
          ($FVF.lookup_val (as sm@42@01  $FVF<val>) (slot<Ref> a@15@01 3)))))
    (valid%precondition $Snap.unit (Seq_index
      ($FVF.lookup_val (as sm@42@01  $FVF<val>) (slot<Ref> a@15@01 3))
      j@41@01) 3 true))
  :pattern ((valid%limited $Snap.unit (Seq_index
    ($FVF.lookup_val (as sm@42@01  $FVF<val>) (slot<Ref> a@15@01 3))
    j@41@01) 3 true))
  :qid |prog./silicon/silver/src/test/resources/all/sequences/sequence_incompletenesses.vpr@77@10@78@37_precondition|)))
(push) ; 3
(assert (not (forall ((j@41@01 Int)) (!
  (=>
    (and
      (=>
        (and
          (<= 0 j@41@01)
          (<
            j@41@01
            (Seq_length
              ($FVF.lookup_val (as sm@42@01  $FVF<val>) (slot<Ref> a@15@01 3)))))
        (valid%precondition $Snap.unit (Seq_index
          ($FVF.lookup_val (as sm@42@01  $FVF<val>) (slot<Ref> a@15@01 3))
          j@41@01) 3 true))
      (and
        (<= 0 j@41@01)
        (<
          j@41@01
          (Seq_length
            ($FVF.lookup_val (as sm@42@01  $FVF<val>) (slot<Ref> a@15@01 3))))))
    (valid $Snap.unit (Seq_index
      ($FVF.lookup_val (as sm@42@01  $FVF<val>) (slot<Ref> a@15@01 3))
      j@41@01) 3 true))
  :pattern ((valid%limited $Snap.unit (Seq_index
    ($FVF.lookup_val (as sm@42@01  $FVF<val>) (slot<Ref> a@15@01 3))
    j@41@01) 3 true))
  :qid |prog./silicon/silver/src/test/resources/all/sequences/sequence_incompletenesses.vpr@77@10@78@37|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((j@41@01 Int)) (!
  (=>
    (and
      (<= 0 j@41@01)
      (<
        j@41@01
        (Seq_length
          ($FVF.lookup_val (as sm@42@01  $FVF<val>) (slot<Ref> a@15@01 3)))))
    (valid $Snap.unit (Seq_index
      ($FVF.lookup_val (as sm@42@01  $FVF<val>) (slot<Ref> a@15@01 3))
      j@41@01) 3 true))
  :pattern ((valid%limited $Snap.unit (Seq_index
    ($FVF.lookup_val (as sm@42@01  $FVF<val>) (slot<Ref> a@15@01 3))
    j@41@01) 3 true))
  :qid |prog./silicon/silver/src/test/resources/all/sequences/sequence_incompletenesses.vpr@77@10@78@37|)))
; [exec]
; n := 4
(declare-const i@44@01 Int)
(declare-const oldSoln@45@01 Seq<Int>)
(declare-const n@46@01 Int)
(declare-const soln@47@01 Seq<Int>)
(push) ; 3
; Loop head block: Check well-definedness of invariant
(declare-const $t@48@01 $Snap)
(assert (= $t@48@01 ($Snap.combine ($Snap.first $t@48@01) ($Snap.second $t@48@01))))
(assert (= ($Snap.first $t@48@01) $Snap.unit))
; [eval] 4 <= n
(assert (<= 4 n@46@01))
(assert (=
  ($Snap.second $t@48@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@48@01))
    ($Snap.second ($Snap.second $t@48@01)))))
(assert (= ($Snap.first ($Snap.second $t@48@01)) $Snap.unit))
; [eval] n <= 51
(assert (<= n@46@01 51))
(assert (=
  ($Snap.second ($Snap.second $t@48@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@48@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@48@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@48@01))) $Snap.unit))
; [eval] len(a) == 51
; [eval] len(a)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@48@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@48@01)))))))
(declare-const i@49@01 Int)
(push) ; 4
; [eval] 0 <= i && i < len(a)
; [eval] 0 <= i
(push) ; 5
; [then-branch: 12 | !(0 <= i@49@01) | live]
; [else-branch: 12 | 0 <= i@49@01 | live]
(push) ; 6
; [then-branch: 12 | !(0 <= i@49@01)]
(assert (not (<= 0 i@49@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 12 | 0 <= i@49@01]
(assert (<= 0 i@49@01))
; [eval] i < len(a)
; [eval] len(a)
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@49@01) (not (<= 0 i@49@01))))
(assert (and (<= 0 i@49@01) (< i@49@01 (len<Int> a@15@01))))
; [eval] slot(a, i)
(pop) ; 4
(declare-fun inv@50@01 ($Ref) Int)
(declare-fun img@51@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@49@01 Int)) (!
  (=>
    (and (<= 0 i@49@01) (< i@49@01 (len<Int> a@15@01)))
    (or (<= 0 i@49@01) (not (<= 0 i@49@01))))
  :pattern ((slot<Ref> a@15@01 i@49@01))
  :qid |val-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@49@01 Int) (i2@49@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@49@01) (< i1@49@01 (len<Int> a@15@01)))
      (and (<= 0 i2@49@01) (< i2@49@01 (len<Int> a@15@01)))
      (= (slot<Ref> a@15@01 i1@49@01) (slot<Ref> a@15@01 i2@49@01)))
    (= i1@49@01 i2@49@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@49@01 Int)) (!
  (=>
    (and (<= 0 i@49@01) (< i@49@01 (len<Int> a@15@01)))
    (and
      (= (inv@50@01 (slot<Ref> a@15@01 i@49@01)) i@49@01)
      (img@51@01 (slot<Ref> a@15@01 i@49@01))))
  :pattern ((slot<Ref> a@15@01 i@49@01))
  :qid |quant-u-33|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@51@01 r)
      (and (<= 0 (inv@50@01 r)) (< (inv@50@01 r) (len<Int> a@15@01))))
    (= (slot<Ref> a@15@01 (inv@50@01 r)) r))
  :pattern ((inv@50@01 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@49@01 Int)) (!
  (=>
    (and (<= 0 i@49@01) (< i@49@01 (len<Int> a@15@01)))
    (not (= (slot<Ref> a@15@01 i@49@01) $Ref.null)))
  :pattern ((slot<Ref> a@15@01 i@49@01))
  :qid |val-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@48@01))))
  $Snap.unit))
; [eval] (forall m: Int, j: Int :: { |slot(a, m).val|, slot(a, m).val[j] } { |slot(a, m).val|, valid(slot(a, m).val[j], m, true) } { valid(slot(a, m).val[j], m, true) } 0 <= m && (m < n && (0 <= j && j < |slot(a, m).val|)) ==> valid(slot(a, m).val[j], m, true))
(declare-const m@52@01 Int)
(declare-const j@53@01 Int)
(push) ; 4
; [eval] 0 <= m && (m < n && (0 <= j && j < |slot(a, m).val|)) ==> valid(slot(a, m).val[j], m, true)
; [eval] 0 <= m && (m < n && (0 <= j && j < |slot(a, m).val|))
; [eval] 0 <= m
(push) ; 5
; [then-branch: 13 | !(0 <= m@52@01) | live]
; [else-branch: 13 | 0 <= m@52@01 | live]
(push) ; 6
; [then-branch: 13 | !(0 <= m@52@01)]
(assert (not (<= 0 m@52@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 13 | 0 <= m@52@01]
(assert (<= 0 m@52@01))
; [eval] m < n
(push) ; 7
; [then-branch: 14 | !(m@52@01 < n@46@01) | live]
; [else-branch: 14 | m@52@01 < n@46@01 | live]
(push) ; 8
; [then-branch: 14 | !(m@52@01 < n@46@01)]
(assert (not (< m@52@01 n@46@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 14 | m@52@01 < n@46@01]
(assert (< m@52@01 n@46@01))
; [eval] 0 <= j
(push) ; 9
; [then-branch: 15 | !(0 <= j@53@01) | live]
; [else-branch: 15 | 0 <= j@53@01 | live]
(push) ; 10
; [then-branch: 15 | !(0 <= j@53@01)]
(assert (not (<= 0 j@53@01)))
(pop) ; 10
(push) ; 10
; [else-branch: 15 | 0 <= j@53@01]
(assert (<= 0 j@53@01))
; [eval] j < |slot(a, m).val|
; [eval] |slot(a, m).val|
; [eval] slot(a, m)
(push) ; 11
(assert (not (and
  (img@51@01 (slot<Ref> a@15@01 m@52@01))
  (and
    (<= 0 (inv@50@01 (slot<Ref> a@15@01 m@52@01)))
    (< (inv@50@01 (slot<Ref> a@15@01 m@52@01)) (len<Int> a@15@01))))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j@53@01) (not (<= 0 j@53@01))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (< m@52@01 n@46@01)
  (and (< m@52@01 n@46@01) (or (<= 0 j@53@01) (not (<= 0 j@53@01))))))
(assert (or (< m@52@01 n@46@01) (not (< m@52@01 n@46@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 m@52@01)
  (and
    (<= 0 m@52@01)
    (=>
      (< m@52@01 n@46@01)
      (and (< m@52@01 n@46@01) (or (<= 0 j@53@01) (not (<= 0 j@53@01)))))
    (or (< m@52@01 n@46@01) (not (< m@52@01 n@46@01))))))
(assert (or (<= 0 m@52@01) (not (<= 0 m@52@01))))
(push) ; 5
; [then-branch: 16 | 0 <= m@52@01 && m@52@01 < n@46@01 && 0 <= j@53@01 && j@53@01 < |Lookup(val, First:(Second:(Second:(Second:($t@48@01)))), slot[Ref](a@15@01, m@52@01))| | live]
; [else-branch: 16 | !(0 <= m@52@01 && m@52@01 < n@46@01 && 0 <= j@53@01 && j@53@01 < |Lookup(val, First:(Second:(Second:(Second:($t@48@01)))), slot[Ref](a@15@01, m@52@01))|) | live]
(push) ; 6
; [then-branch: 16 | 0 <= m@52@01 && m@52@01 < n@46@01 && 0 <= j@53@01 && j@53@01 < |Lookup(val, First:(Second:(Second:(Second:($t@48@01)))), slot[Ref](a@15@01, m@52@01))|]
(assert (and
  (<= 0 m@52@01)
  (and
    (< m@52@01 n@46@01)
    (and
      (<= 0 j@53@01)
      (<
        j@53@01
        (Seq_length
          ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) (slot<Ref> a@15@01 m@52@01))))))))
; [eval] valid(slot(a, m).val[j], m, true)
; [eval] slot(a, m).val[j]
; [eval] slot(a, m)
(push) ; 7
(assert (not (and
  (img@51@01 (slot<Ref> a@15@01 m@52@01))
  (and
    (<= 0 (inv@50@01 (slot<Ref> a@15@01 m@52@01)))
    (< (inv@50@01 (slot<Ref> a@15@01 m@52@01)) (len<Int> a@15@01))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (>= j@53@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (valid%precondition $Snap.unit (Seq_index
  ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) (slot<Ref> a@15@01 m@52@01))
  j@53@01) m@52@01 true))
(pop) ; 7
; Joined path conditions
(assert (valid%precondition $Snap.unit (Seq_index
  ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) (slot<Ref> a@15@01 m@52@01))
  j@53@01) m@52@01 true))
(pop) ; 6
(push) ; 6
; [else-branch: 16 | !(0 <= m@52@01 && m@52@01 < n@46@01 && 0 <= j@53@01 && j@53@01 < |Lookup(val, First:(Second:(Second:(Second:($t@48@01)))), slot[Ref](a@15@01, m@52@01))|)]
(assert (not
  (and
    (<= 0 m@52@01)
    (and
      (< m@52@01 n@46@01)
      (and
        (<= 0 j@53@01)
        (<
          j@53@01
          (Seq_length
            ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) (slot<Ref> a@15@01 m@52@01)))))))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (<= 0 m@52@01)
    (and
      (< m@52@01 n@46@01)
      (and
        (<= 0 j@53@01)
        (<
          j@53@01
          (Seq_length
            ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) (slot<Ref> a@15@01 m@52@01)))))))
  (and
    (<= 0 m@52@01)
    (< m@52@01 n@46@01)
    (<= 0 j@53@01)
    (<
      j@53@01
      (Seq_length
        ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) (slot<Ref> a@15@01 m@52@01))))
    (valid%precondition $Snap.unit (Seq_index
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) (slot<Ref> a@15@01 m@52@01))
      j@53@01) m@52@01 true))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 m@52@01)
      (and
        (< m@52@01 n@46@01)
        (and
          (<= 0 j@53@01)
          (<
            j@53@01
            (Seq_length
              ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) (slot<Ref> a@15@01 m@52@01))))))))
  (and
    (<= 0 m@52@01)
    (and
      (< m@52@01 n@46@01)
      (and
        (<= 0 j@53@01)
        (<
          j@53@01
          (Seq_length
            ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) (slot<Ref> a@15@01 m@52@01)))))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((m@52@01 Int) (j@53@01 Int)) (!
  (and
    (=>
      (<= 0 m@52@01)
      (and
        (<= 0 m@52@01)
        (=>
          (< m@52@01 n@46@01)
          (and (< m@52@01 n@46@01) (or (<= 0 j@53@01) (not (<= 0 j@53@01)))))
        (or (< m@52@01 n@46@01) (not (< m@52@01 n@46@01)))))
    (or (<= 0 m@52@01) (not (<= 0 m@52@01)))
    (=>
      (and
        (<= 0 m@52@01)
        (and
          (< m@52@01 n@46@01)
          (and
            (<= 0 j@53@01)
            (<
              j@53@01
              (Seq_length
                ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) (slot<Ref> a@15@01 m@52@01)))))))
      (and
        (<= 0 m@52@01)
        (< m@52@01 n@46@01)
        (<= 0 j@53@01)
        (<
          j@53@01
          (Seq_length
            ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) (slot<Ref> a@15@01 m@52@01))))
        (valid%precondition $Snap.unit (Seq_index
          ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) (slot<Ref> a@15@01 m@52@01))
          j@53@01) m@52@01 true)))
    (or
      (not
        (and
          (<= 0 m@52@01)
          (and
            (< m@52@01 n@46@01)
            (and
              (<= 0 j@53@01)
              (<
                j@53@01
                (Seq_length
                  ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) (slot<Ref> a@15@01 m@52@01))))))))
      (and
        (<= 0 m@52@01)
        (and
          (< m@52@01 n@46@01)
          (and
            (<= 0 j@53@01)
            (<
              j@53@01
              (Seq_length
                ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) (slot<Ref> a@15@01 m@52@01)))))))))
  :pattern ((Seq_length
    ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) (slot<Ref> a@15@01 m@52@01))) (Seq_index
    ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) (slot<Ref> a@15@01 m@52@01))
    j@53@01))
  :qid |prog./silicon/silver/src/test/resources/all/sequences/sequence_incompletenesses.vpr@85@13@86@39-aux|)))
(assert (forall ((m@52@01 Int) (j@53@01 Int)) (!
  (and
    (=>
      (<= 0 m@52@01)
      (and
        (<= 0 m@52@01)
        (=>
          (< m@52@01 n@46@01)
          (and (< m@52@01 n@46@01) (or (<= 0 j@53@01) (not (<= 0 j@53@01)))))
        (or (< m@52@01 n@46@01) (not (< m@52@01 n@46@01)))))
    (or (<= 0 m@52@01) (not (<= 0 m@52@01)))
    (=>
      (and
        (<= 0 m@52@01)
        (and
          (< m@52@01 n@46@01)
          (and
            (<= 0 j@53@01)
            (<
              j@53@01
              (Seq_length
                ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) (slot<Ref> a@15@01 m@52@01)))))))
      (and
        (<= 0 m@52@01)
        (< m@52@01 n@46@01)
        (<= 0 j@53@01)
        (<
          j@53@01
          (Seq_length
            ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) (slot<Ref> a@15@01 m@52@01))))
        (valid%precondition $Snap.unit (Seq_index
          ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) (slot<Ref> a@15@01 m@52@01))
          j@53@01) m@52@01 true)))
    (or
      (not
        (and
          (<= 0 m@52@01)
          (and
            (< m@52@01 n@46@01)
            (and
              (<= 0 j@53@01)
              (<
                j@53@01
                (Seq_length
                  ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) (slot<Ref> a@15@01 m@52@01))))))))
      (and
        (<= 0 m@52@01)
        (and
          (< m@52@01 n@46@01)
          (and
            (<= 0 j@53@01)
            (<
              j@53@01
              (Seq_length
                ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) (slot<Ref> a@15@01 m@52@01)))))))))
  :pattern ((Seq_length
    ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) (slot<Ref> a@15@01 m@52@01))) (valid%limited $Snap.unit (Seq_index
    ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) (slot<Ref> a@15@01 m@52@01))
    j@53@01) m@52@01 true))
  :qid |prog./silicon/silver/src/test/resources/all/sequences/sequence_incompletenesses.vpr@85@13@86@39-aux|)))
(assert (forall ((m@52@01 Int) (j@53@01 Int)) (!
  (and
    (=>
      (<= 0 m@52@01)
      (and
        (<= 0 m@52@01)
        (=>
          (< m@52@01 n@46@01)
          (and (< m@52@01 n@46@01) (or (<= 0 j@53@01) (not (<= 0 j@53@01)))))
        (or (< m@52@01 n@46@01) (not (< m@52@01 n@46@01)))))
    (or (<= 0 m@52@01) (not (<= 0 m@52@01)))
    (=>
      (and
        (<= 0 m@52@01)
        (and
          (< m@52@01 n@46@01)
          (and
            (<= 0 j@53@01)
            (<
              j@53@01
              (Seq_length
                ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) (slot<Ref> a@15@01 m@52@01)))))))
      (and
        (<= 0 m@52@01)
        (< m@52@01 n@46@01)
        (<= 0 j@53@01)
        (<
          j@53@01
          (Seq_length
            ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) (slot<Ref> a@15@01 m@52@01))))
        (valid%precondition $Snap.unit (Seq_index
          ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) (slot<Ref> a@15@01 m@52@01))
          j@53@01) m@52@01 true)))
    (or
      (not
        (and
          (<= 0 m@52@01)
          (and
            (< m@52@01 n@46@01)
            (and
              (<= 0 j@53@01)
              (<
                j@53@01
                (Seq_length
                  ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) (slot<Ref> a@15@01 m@52@01))))))))
      (and
        (<= 0 m@52@01)
        (and
          (< m@52@01 n@46@01)
          (and
            (<= 0 j@53@01)
            (<
              j@53@01
              (Seq_length
                ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) (slot<Ref> a@15@01 m@52@01)))))))))
  :pattern ((valid%limited $Snap.unit (Seq_index
    ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) (slot<Ref> a@15@01 m@52@01))
    j@53@01) m@52@01 true))
  :qid |prog./silicon/silver/src/test/resources/all/sequences/sequence_incompletenesses.vpr@85@13@86@39-aux|)))
(assert (forall ((m@52@01 Int) (j@53@01 Int)) (!
  (=>
    (and
      (<= 0 m@52@01)
      (and
        (< m@52@01 n@46@01)
        (and
          (<= 0 j@53@01)
          (<
            j@53@01
            (Seq_length
              ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) (slot<Ref> a@15@01 m@52@01)))))))
    (valid $Snap.unit (Seq_index
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) (slot<Ref> a@15@01 m@52@01))
      j@53@01) m@52@01 true))
  :pattern ((Seq_length
    ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) (slot<Ref> a@15@01 m@52@01))) (Seq_index
    ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) (slot<Ref> a@15@01 m@52@01))
    j@53@01))
  :pattern ((Seq_length
    ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) (slot<Ref> a@15@01 m@52@01))) (valid%limited $Snap.unit (Seq_index
    ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) (slot<Ref> a@15@01 m@52@01))
    j@53@01) m@52@01 true))
  :pattern ((valid%limited $Snap.unit (Seq_index
    ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) (slot<Ref> a@15@01 m@52@01))
    j@53@01) m@52@01 true))
  :qid |prog./silicon/silver/src/test/resources/all/sequences/sequence_incompletenesses.vpr@85@13@86@39|)))
(pop) ; 3
(push) ; 3
; Loop head block: Establish invariant
; [eval] 4 <= n
; [eval] n <= 51
; [eval] len(a) == 51
; [eval] len(a)
(declare-const i@54@01 Int)
(push) ; 4
; [eval] 0 <= i && i < len(a)
; [eval] 0 <= i
(push) ; 5
; [then-branch: 17 | !(0 <= i@54@01) | live]
; [else-branch: 17 | 0 <= i@54@01 | live]
(push) ; 6
; [then-branch: 17 | !(0 <= i@54@01)]
(assert (not (<= 0 i@54@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 17 | 0 <= i@54@01]
(assert (<= 0 i@54@01))
; [eval] i < len(a)
; [eval] len(a)
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@54@01) (not (<= 0 i@54@01))))
(assert (and (<= 0 i@54@01) (< i@54@01 (len<Int> a@15@01))))
; [eval] slot(a, i)
(pop) ; 4
(declare-fun inv@55@01 ($Ref) Int)
(declare-fun img@56@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@54@01 Int)) (!
  (=>
    (and (<= 0 i@54@01) (< i@54@01 (len<Int> a@15@01)))
    (or (<= 0 i@54@01) (not (<= 0 i@54@01))))
  :pattern ((slot<Ref> a@15@01 i@54@01))
  :qid |val-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@54@01 Int) (i2@54@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@54@01) (< i1@54@01 (len<Int> a@15@01)))
      (and (<= 0 i2@54@01) (< i2@54@01 (len<Int> a@15@01)))
      (= (slot<Ref> a@15@01 i1@54@01) (slot<Ref> a@15@01 i2@54@01)))
    (= i1@54@01 i2@54@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@54@01 Int)) (!
  (=>
    (and (<= 0 i@54@01) (< i@54@01 (len<Int> a@15@01)))
    (and
      (= (inv@55@01 (slot<Ref> a@15@01 i@54@01)) i@54@01)
      (img@56@01 (slot<Ref> a@15@01 i@54@01))))
  :pattern ((slot<Ref> a@15@01 i@54@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@56@01 r)
      (and (<= 0 (inv@55@01 r)) (< (inv@55@01 r) (len<Int> a@15@01))))
    (= (slot<Ref> a@15@01 (inv@55@01 r)) r))
  :pattern ((inv@55@01 r))
  :qid |val-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@57@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@55@01 r)) (< (inv@55@01 r) (len<Int> a@15@01)))
      (img@56@01 r)
      (= r (slot<Ref> a@15@01 (inv@55@01 r))))
    ($Perm.min
      (ite
        (and
          (img@19@01 r)
          (and (<= 0 (inv@18@01 r)) (< (inv@18@01 r) (len<Int> a@15@01))))
        (-
          (-
            (- (- $Perm.Write (pTaken@21@01 r)) (pTaken@23@01 r))
            (pTaken@29@01 r))
          (pTaken@36@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@58@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@55@01 r)) (< (inv@55@01 r) (len<Int> a@15@01)))
      (img@56@01 r)
      (= r (slot<Ref> a@15@01 (inv@55@01 r))))
    ($Perm.min
      (ite (= r (slot<Ref> a@15@01 3)) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@57@01 r)))
    $Perm.No))
(define-fun pTaken@59@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@55@01 r)) (< (inv@55@01 r) (len<Int> a@15@01)))
      (img@56@01 r)
      (= r (slot<Ref> a@15@01 (inv@55@01 r))))
    ($Perm.min
      (ite (= r (slot<Ref> a@15@01 1)) $Perm.Write $Perm.No)
      (- (- $Perm.Write (pTaken@57@01 r)) (pTaken@58@01 r)))
    $Perm.No))
(define-fun pTaken@60@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@55@01 r)) (< (inv@55@01 r) (len<Int> a@15@01)))
      (img@56@01 r)
      (= r (slot<Ref> a@15@01 (inv@55@01 r))))
    ($Perm.min
      (ite (= r (slot<Ref> a@15@01 0)) $Perm.Write $Perm.No)
      (- (- (- $Perm.Write (pTaken@57@01 r)) (pTaken@58@01 r)) (pTaken@59@01 r)))
    $Perm.No))
(define-fun pTaken@61@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@55@01 r)) (< (inv@55@01 r) (len<Int> a@15@01)))
      (img@56@01 r)
      (= r (slot<Ref> a@15@01 (inv@55@01 r))))
    ($Perm.min
      (ite (= r (slot<Ref> a@15@01 2)) $Perm.Write $Perm.No)
      (-
        (-
          (- (- $Perm.Write (pTaken@57@01 r)) (pTaken@58@01 r))
          (pTaken@59@01 r))
        (pTaken@60@01 r)))
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
          (img@19@01 r)
          (and (<= 0 (inv@18@01 r)) (< (inv@18@01 r) (len<Int> a@15@01))))
        (-
          (-
            (- (- $Perm.Write (pTaken@21@01 r)) (pTaken@23@01 r))
            (pTaken@29@01 r))
          (pTaken@36@01 r))
        $Perm.No)
      (pTaken@57@01 r))
    $Perm.No)
  
  :qid |quant-u-36|))))
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
      (and (<= 0 (inv@55@01 r)) (< (inv@55@01 r) (len<Int> a@15@01)))
      (img@56@01 r)
      (= r (slot<Ref> a@15@01 (inv@55@01 r))))
    (= (- $Perm.Write (pTaken@57@01 r)) $Perm.No))
  
  :qid |quant-u-37|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (=
  (-
    (ite (= (slot<Ref> a@15@01 3) (slot<Ref> a@15@01 3)) $Perm.Write $Perm.No)
    (pTaken@58@01 (slot<Ref> a@15@01 3)))
  $Perm.No)))
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
      (and (<= 0 (inv@55@01 r)) (< (inv@55@01 r) (len<Int> a@15@01)))
      (img@56@01 r)
      (= r (slot<Ref> a@15@01 (inv@55@01 r))))
    (= (- (- $Perm.Write (pTaken@57@01 r)) (pTaken@58@01 r)) $Perm.No))
  
  :qid |quant-u-39|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (=
  (-
    (ite (= (slot<Ref> a@15@01 1) (slot<Ref> a@15@01 1)) $Perm.Write $Perm.No)
    (pTaken@59@01 (slot<Ref> a@15@01 1)))
  $Perm.No)))
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
      (and (<= 0 (inv@55@01 r)) (< (inv@55@01 r) (len<Int> a@15@01)))
      (img@56@01 r)
      (= r (slot<Ref> a@15@01 (inv@55@01 r))))
    (=
      (- (- (- $Perm.Write (pTaken@57@01 r)) (pTaken@58@01 r)) (pTaken@59@01 r))
      $Perm.No))
  
  :qid |quant-u-41|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (=
  (-
    (ite (= (slot<Ref> a@15@01 0) (slot<Ref> a@15@01 0)) $Perm.Write $Perm.No)
    (pTaken@60@01 (slot<Ref> a@15@01 0)))
  $Perm.No)))
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
      (and (<= 0 (inv@55@01 r)) (< (inv@55@01 r) (len<Int> a@15@01)))
      (img@56@01 r)
      (= r (slot<Ref> a@15@01 (inv@55@01 r))))
    (=
      (-
        (-
          (- (- $Perm.Write (pTaken@57@01 r)) (pTaken@58@01 r))
          (pTaken@59@01 r))
        (pTaken@60@01 r))
      $Perm.No))
  
  :qid |quant-u-43|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (=
  (-
    (ite (= (slot<Ref> a@15@01 2) (slot<Ref> a@15@01 2)) $Perm.Write $Perm.No)
    (pTaken@61@01 (slot<Ref> a@15@01 2)))
  $Perm.No)))
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
      (and (<= 0 (inv@55@01 r)) (< (inv@55@01 r) (len<Int> a@15@01)))
      (img@56@01 r)
      (= r (slot<Ref> a@15@01 (inv@55@01 r))))
    (=
      (-
        (-
          (-
            (- (- $Perm.Write (pTaken@57@01 r)) (pTaken@58@01 r))
            (pTaken@59@01 r))
          (pTaken@60@01 r))
        (pTaken@61@01 r))
      $Perm.No))
  
  :qid |quant-u-45|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values
; [eval] (forall m: Int, j: Int :: { |slot(a, m).val|, slot(a, m).val[j] } { |slot(a, m).val|, valid(slot(a, m).val[j], m, true) } { valid(slot(a, m).val[j], m, true) } 0 <= m && (m < n && (0 <= j && j < |slot(a, m).val|)) ==> valid(slot(a, m).val[j], m, true))
(declare-const m@62@01 Int)
(declare-const j@63@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] 0 <= m && (m < n && (0 <= j && j < |slot(a, m).val|)) ==> valid(slot(a, m).val[j], m, true)
; [eval] 0 <= m && (m < n && (0 <= j && j < |slot(a, m).val|))
; [eval] 0 <= m
(push) ; 5
; [then-branch: 18 | !(0 <= m@62@01) | live]
; [else-branch: 18 | 0 <= m@62@01 | live]
(push) ; 6
; [then-branch: 18 | !(0 <= m@62@01)]
(assert (not (<= 0 m@62@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 18 | 0 <= m@62@01]
(assert (<= 0 m@62@01))
; [eval] m < n
(push) ; 7
; [then-branch: 19 | !(m@62@01 < 4) | live]
; [else-branch: 19 | m@62@01 < 4 | live]
(push) ; 8
; [then-branch: 19 | !(m@62@01 < 4)]
(assert (not (< m@62@01 4)))
(pop) ; 8
(push) ; 8
; [else-branch: 19 | m@62@01 < 4]
(assert (< m@62@01 4))
; [eval] 0 <= j
(push) ; 9
; [then-branch: 20 | !(0 <= j@63@01) | live]
; [else-branch: 20 | 0 <= j@63@01 | live]
(push) ; 10
; [then-branch: 20 | !(0 <= j@63@01)]
(assert (not (<= 0 j@63@01)))
(pop) ; 10
(push) ; 10
; [else-branch: 20 | 0 <= j@63@01]
(assert (<= 0 j@63@01))
; [eval] j < |slot(a, m).val|
; [eval] |slot(a, m).val|
; [eval] slot(a, m)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r (slot<Ref> a@15@01 3))
      (=
        ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@40@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@40@01  $FVF<val>) r))
    :qid |qp.fvfValDef13|))
  (forall ((r $Ref)) (!
    (=>
      (= r (slot<Ref> a@15@01 1))
      (=
        ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@25@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@25@01  $FVF<val>) r))
    :qid |qp.fvfValDef14|))
  (forall ((r $Ref)) (!
    (=>
      (= r (slot<Ref> a@15@01 0))
      (=
        ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@22@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@22@01  $FVF<val>) r))
    :qid |qp.fvfValDef15|))
  (forall ((r $Ref)) (!
    (=>
      (= r (slot<Ref> a@15@01 2))
      (=
        ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@32@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@32@01  $FVF<val>) r))
    :qid |qp.fvfValDef16|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and
          (img@19@01 r)
          (and (<= 0 (inv@18@01 r)) (< (inv@18@01 r) (len<Int> a@15@01))))
        (<
          $Perm.No
          (-
            (-
              (- (- $Perm.Write (pTaken@21@01 r)) (pTaken@23@01 r))
              (pTaken@29@01 r))
            (pTaken@36@01 r)))
        false)
      (=
        ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
        ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@16@01)) r)))
    :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@16@01)) r))
    :qid |qp.fvfValDef17|))))
(push) ; 11
(assert (not (<
  $Perm.No
  (+
    (+
      (+
        (+
          (ite
            (= (slot<Ref> a@15@01 m@62@01) (slot<Ref> a@15@01 3))
            $Perm.Write
            $Perm.No)
          (ite
            (= (slot<Ref> a@15@01 m@62@01) (slot<Ref> a@15@01 1))
            $Perm.Write
            $Perm.No))
        (ite
          (= (slot<Ref> a@15@01 m@62@01) (slot<Ref> a@15@01 0))
          $Perm.Write
          $Perm.No))
      (ite
        (= (slot<Ref> a@15@01 m@62@01) (slot<Ref> a@15@01 2))
        $Perm.Write
        $Perm.No))
    (ite
      (and
        (img@19@01 (slot<Ref> a@15@01 m@62@01))
        (and
          (<= 0 (inv@18@01 (slot<Ref> a@15@01 m@62@01)))
          (< (inv@18@01 (slot<Ref> a@15@01 m@62@01)) (len<Int> a@15@01))))
      (-
        (-
          (-
            (- $Perm.Write (pTaken@21@01 (slot<Ref> a@15@01 m@62@01)))
            (pTaken@23@01 (slot<Ref> a@15@01 m@62@01)))
          (pTaken@29@01 (slot<Ref> a@15@01 m@62@01)))
        (pTaken@36@01 (slot<Ref> a@15@01 m@62@01)))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 3))
    (=
      ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@40@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@40@01  $FVF<val>) r))
  :qid |qp.fvfValDef13|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 1))
    (=
      ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@25@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@25@01  $FVF<val>) r))
  :qid |qp.fvfValDef14|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 0))
    (=
      ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@22@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@22@01  $FVF<val>) r))
  :qid |qp.fvfValDef15|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 2))
    (=
      ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@32@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@32@01  $FVF<val>) r))
  :qid |qp.fvfValDef16|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@19@01 r)
        (and (<= 0 (inv@18@01 r)) (< (inv@18@01 r) (len<Int> a@15@01))))
      (<
        $Perm.No
        (-
          (-
            (- (- $Perm.Write (pTaken@21@01 r)) (pTaken@23@01 r))
            (pTaken@29@01 r))
          (pTaken@36@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@16@01)) r)))
  :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@16@01)) r))
  :qid |qp.fvfValDef17|)))
(assert (or (<= 0 j@63@01) (not (<= 0 j@63@01))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 3))
    (=
      ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@40@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@40@01  $FVF<val>) r))
  :qid |qp.fvfValDef13|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 1))
    (=
      ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@25@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@25@01  $FVF<val>) r))
  :qid |qp.fvfValDef14|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 0))
    (=
      ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@22@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@22@01  $FVF<val>) r))
  :qid |qp.fvfValDef15|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 2))
    (=
      ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@32@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@32@01  $FVF<val>) r))
  :qid |qp.fvfValDef16|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@19@01 r)
        (and (<= 0 (inv@18@01 r)) (< (inv@18@01 r) (len<Int> a@15@01))))
      (<
        $Perm.No
        (-
          (-
            (- (- $Perm.Write (pTaken@21@01 r)) (pTaken@23@01 r))
            (pTaken@29@01 r))
          (pTaken@36@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@16@01)) r)))
  :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@16@01)) r))
  :qid |qp.fvfValDef17|)))
(assert (=> (< m@62@01 4) (and (< m@62@01 4) (or (<= 0 j@63@01) (not (<= 0 j@63@01))))))
(assert (or (< m@62@01 4) (not (< m@62@01 4))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 3))
    (=
      ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@40@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@40@01  $FVF<val>) r))
  :qid |qp.fvfValDef13|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 1))
    (=
      ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@25@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@25@01  $FVF<val>) r))
  :qid |qp.fvfValDef14|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 0))
    (=
      ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@22@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@22@01  $FVF<val>) r))
  :qid |qp.fvfValDef15|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 2))
    (=
      ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@32@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@32@01  $FVF<val>) r))
  :qid |qp.fvfValDef16|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@19@01 r)
        (and (<= 0 (inv@18@01 r)) (< (inv@18@01 r) (len<Int> a@15@01))))
      (<
        $Perm.No
        (-
          (-
            (- (- $Perm.Write (pTaken@21@01 r)) (pTaken@23@01 r))
            (pTaken@29@01 r))
          (pTaken@36@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@16@01)) r)))
  :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@16@01)) r))
  :qid |qp.fvfValDef17|)))
(assert (=>
  (<= 0 m@62@01)
  (and
    (<= 0 m@62@01)
    (=>
      (< m@62@01 4)
      (and (< m@62@01 4) (or (<= 0 j@63@01) (not (<= 0 j@63@01)))))
    (or (< m@62@01 4) (not (< m@62@01 4))))))
(assert (or (<= 0 m@62@01) (not (<= 0 m@62@01))))
(push) ; 5
; [then-branch: 21 | 0 <= m@62@01 && m@62@01 < 4 && 0 <= j@63@01 && j@63@01 < |Lookup(val, sm@42@01, slot[Ref](a@15@01, m@62@01))| | live]
; [else-branch: 21 | !(0 <= m@62@01 && m@62@01 < 4 && 0 <= j@63@01 && j@63@01 < |Lookup(val, sm@42@01, slot[Ref](a@15@01, m@62@01))|) | live]
(push) ; 6
; [then-branch: 21 | 0 <= m@62@01 && m@62@01 < 4 && 0 <= j@63@01 && j@63@01 < |Lookup(val, sm@42@01, slot[Ref](a@15@01, m@62@01))|]
(assert (and
  (<= 0 m@62@01)
  (and
    (< m@62@01 4)
    (and
      (<= 0 j@63@01)
      (<
        j@63@01
        (Seq_length
          ($FVF.lookup_val (as sm@42@01  $FVF<val>) (slot<Ref> a@15@01 m@62@01))))))))
; [eval] valid(slot(a, m).val[j], m, true)
; [eval] slot(a, m).val[j]
; [eval] slot(a, m)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r (slot<Ref> a@15@01 3))
      (=
        ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@40@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@40@01  $FVF<val>) r))
    :qid |qp.fvfValDef13|))
  (forall ((r $Ref)) (!
    (=>
      (= r (slot<Ref> a@15@01 1))
      (=
        ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@25@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@25@01  $FVF<val>) r))
    :qid |qp.fvfValDef14|))
  (forall ((r $Ref)) (!
    (=>
      (= r (slot<Ref> a@15@01 0))
      (=
        ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@22@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@22@01  $FVF<val>) r))
    :qid |qp.fvfValDef15|))
  (forall ((r $Ref)) (!
    (=>
      (= r (slot<Ref> a@15@01 2))
      (=
        ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@32@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@32@01  $FVF<val>) r))
    :qid |qp.fvfValDef16|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and
          (img@19@01 r)
          (and (<= 0 (inv@18@01 r)) (< (inv@18@01 r) (len<Int> a@15@01))))
        (<
          $Perm.No
          (-
            (-
              (- (- $Perm.Write (pTaken@21@01 r)) (pTaken@23@01 r))
              (pTaken@29@01 r))
            (pTaken@36@01 r)))
        false)
      (=
        ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
        ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@16@01)) r)))
    :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@16@01)) r))
    :qid |qp.fvfValDef17|))))
(push) ; 7
(assert (not (<
  $Perm.No
  (+
    (+
      (+
        (+
          (ite
            (= (slot<Ref> a@15@01 m@62@01) (slot<Ref> a@15@01 3))
            $Perm.Write
            $Perm.No)
          (ite
            (= (slot<Ref> a@15@01 m@62@01) (slot<Ref> a@15@01 1))
            $Perm.Write
            $Perm.No))
        (ite
          (= (slot<Ref> a@15@01 m@62@01) (slot<Ref> a@15@01 0))
          $Perm.Write
          $Perm.No))
      (ite
        (= (slot<Ref> a@15@01 m@62@01) (slot<Ref> a@15@01 2))
        $Perm.Write
        $Perm.No))
    (ite
      (and
        (img@19@01 (slot<Ref> a@15@01 m@62@01))
        (and
          (<= 0 (inv@18@01 (slot<Ref> a@15@01 m@62@01)))
          (< (inv@18@01 (slot<Ref> a@15@01 m@62@01)) (len<Int> a@15@01))))
      (-
        (-
          (-
            (- $Perm.Write (pTaken@21@01 (slot<Ref> a@15@01 m@62@01)))
            (pTaken@23@01 (slot<Ref> a@15@01 m@62@01)))
          (pTaken@29@01 (slot<Ref> a@15@01 m@62@01)))
        (pTaken@36@01 (slot<Ref> a@15@01 m@62@01)))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0,01s
; (get-info :all-statistics)
(push) ; 7
(assert (not (>= j@63@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (valid%precondition $Snap.unit (Seq_index
  ($FVF.lookup_val (as sm@42@01  $FVF<val>) (slot<Ref> a@15@01 m@62@01))
  j@63@01) m@62@01 true))
(pop) ; 7
; Joined path conditions
(assert (valid%precondition $Snap.unit (Seq_index
  ($FVF.lookup_val (as sm@42@01  $FVF<val>) (slot<Ref> a@15@01 m@62@01))
  j@63@01) m@62@01 true))
(pop) ; 6
(push) ; 6
; [else-branch: 21 | !(0 <= m@62@01 && m@62@01 < 4 && 0 <= j@63@01 && j@63@01 < |Lookup(val, sm@42@01, slot[Ref](a@15@01, m@62@01))|)]
(assert (not
  (and
    (<= 0 m@62@01)
    (and
      (< m@62@01 4)
      (and
        (<= 0 j@63@01)
        (<
          j@63@01
          (Seq_length
            ($FVF.lookup_val (as sm@42@01  $FVF<val>) (slot<Ref> a@15@01 m@62@01)))))))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 3))
    (=
      ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@40@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@40@01  $FVF<val>) r))
  :qid |qp.fvfValDef13|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 1))
    (=
      ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@25@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@25@01  $FVF<val>) r))
  :qid |qp.fvfValDef14|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 0))
    (=
      ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@22@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@22@01  $FVF<val>) r))
  :qid |qp.fvfValDef15|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 2))
    (=
      ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@32@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@32@01  $FVF<val>) r))
  :qid |qp.fvfValDef16|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@19@01 r)
        (and (<= 0 (inv@18@01 r)) (< (inv@18@01 r) (len<Int> a@15@01))))
      (<
        $Perm.No
        (-
          (-
            (- (- $Perm.Write (pTaken@21@01 r)) (pTaken@23@01 r))
            (pTaken@29@01 r))
          (pTaken@36@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@16@01)) r)))
  :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@16@01)) r))
  :qid |qp.fvfValDef17|)))
(assert (=>
  (and
    (<= 0 m@62@01)
    (and
      (< m@62@01 4)
      (and
        (<= 0 j@63@01)
        (<
          j@63@01
          (Seq_length
            ($FVF.lookup_val (as sm@42@01  $FVF<val>) (slot<Ref> a@15@01 m@62@01)))))))
  (and
    (<= 0 m@62@01)
    (< m@62@01 4)
    (<= 0 j@63@01)
    (<
      j@63@01
      (Seq_length
        ($FVF.lookup_val (as sm@42@01  $FVF<val>) (slot<Ref> a@15@01 m@62@01))))
    (valid%precondition $Snap.unit (Seq_index
      ($FVF.lookup_val (as sm@42@01  $FVF<val>) (slot<Ref> a@15@01 m@62@01))
      j@63@01) m@62@01 true))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 m@62@01)
      (and
        (< m@62@01 4)
        (and
          (<= 0 j@63@01)
          (<
            j@63@01
            (Seq_length
              ($FVF.lookup_val (as sm@42@01  $FVF<val>) (slot<Ref> a@15@01 m@62@01))))))))
  (and
    (<= 0 m@62@01)
    (and
      (< m@62@01 4)
      (and
        (<= 0 j@63@01)
        (<
          j@63@01
          (Seq_length
            ($FVF.lookup_val (as sm@42@01  $FVF<val>) (slot<Ref> a@15@01 m@62@01)))))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 3))
    (=
      ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@40@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@40@01  $FVF<val>) r))
  :qid |qp.fvfValDef13|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 1))
    (=
      ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@25@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@25@01  $FVF<val>) r))
  :qid |qp.fvfValDef14|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 0))
    (=
      ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@22@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@22@01  $FVF<val>) r))
  :qid |qp.fvfValDef15|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 2))
    (=
      ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@32@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@32@01  $FVF<val>) r))
  :qid |qp.fvfValDef16|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@19@01 r)
        (and (<= 0 (inv@18@01 r)) (< (inv@18@01 r) (len<Int> a@15@01))))
      (<
        $Perm.No
        (-
          (-
            (- (- $Perm.Write (pTaken@21@01 r)) (pTaken@23@01 r))
            (pTaken@29@01 r))
          (pTaken@36@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@16@01)) r)))
  :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@16@01)) r))
  :qid |qp.fvfValDef17|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((m@62@01 Int) (j@63@01 Int)) (!
  (and
    (=>
      (<= 0 m@62@01)
      (and
        (<= 0 m@62@01)
        (=>
          (< m@62@01 4)
          (and (< m@62@01 4) (or (<= 0 j@63@01) (not (<= 0 j@63@01)))))
        (or (< m@62@01 4) (not (< m@62@01 4)))))
    (or (<= 0 m@62@01) (not (<= 0 m@62@01)))
    (=>
      (and
        (<= 0 m@62@01)
        (and
          (< m@62@01 4)
          (and
            (<= 0 j@63@01)
            (<
              j@63@01
              (Seq_length
                ($FVF.lookup_val (as sm@42@01  $FVF<val>) (slot<Ref> a@15@01 m@62@01)))))))
      (and
        (<= 0 m@62@01)
        (< m@62@01 4)
        (<= 0 j@63@01)
        (<
          j@63@01
          (Seq_length
            ($FVF.lookup_val (as sm@42@01  $FVF<val>) (slot<Ref> a@15@01 m@62@01))))
        (valid%precondition $Snap.unit (Seq_index
          ($FVF.lookup_val (as sm@42@01  $FVF<val>) (slot<Ref> a@15@01 m@62@01))
          j@63@01) m@62@01 true)))
    (or
      (not
        (and
          (<= 0 m@62@01)
          (and
            (< m@62@01 4)
            (and
              (<= 0 j@63@01)
              (<
                j@63@01
                (Seq_length
                  ($FVF.lookup_val (as sm@42@01  $FVF<val>) (slot<Ref> a@15@01 m@62@01))))))))
      (and
        (<= 0 m@62@01)
        (and
          (< m@62@01 4)
          (and
            (<= 0 j@63@01)
            (<
              j@63@01
              (Seq_length
                ($FVF.lookup_val (as sm@42@01  $FVF<val>) (slot<Ref> a@15@01 m@62@01)))))))))
  :pattern ((Seq_length
    ($FVF.lookup_val (as sm@42@01  $FVF<val>) (slot<Ref> a@15@01 m@62@01))) (Seq_index
    ($FVF.lookup_val (as sm@42@01  $FVF<val>) (slot<Ref> a@15@01 m@62@01))
    j@63@01))
  :qid |prog./silicon/silver/src/test/resources/all/sequences/sequence_incompletenesses.vpr@85@13@86@39-aux|)))
(assert (forall ((m@62@01 Int) (j@63@01 Int)) (!
  (and
    (=>
      (<= 0 m@62@01)
      (and
        (<= 0 m@62@01)
        (=>
          (< m@62@01 4)
          (and (< m@62@01 4) (or (<= 0 j@63@01) (not (<= 0 j@63@01)))))
        (or (< m@62@01 4) (not (< m@62@01 4)))))
    (or (<= 0 m@62@01) (not (<= 0 m@62@01)))
    (=>
      (and
        (<= 0 m@62@01)
        (and
          (< m@62@01 4)
          (and
            (<= 0 j@63@01)
            (<
              j@63@01
              (Seq_length
                ($FVF.lookup_val (as sm@42@01  $FVF<val>) (slot<Ref> a@15@01 m@62@01)))))))
      (and
        (<= 0 m@62@01)
        (< m@62@01 4)
        (<= 0 j@63@01)
        (<
          j@63@01
          (Seq_length
            ($FVF.lookup_val (as sm@42@01  $FVF<val>) (slot<Ref> a@15@01 m@62@01))))
        (valid%precondition $Snap.unit (Seq_index
          ($FVF.lookup_val (as sm@42@01  $FVF<val>) (slot<Ref> a@15@01 m@62@01))
          j@63@01) m@62@01 true)))
    (or
      (not
        (and
          (<= 0 m@62@01)
          (and
            (< m@62@01 4)
            (and
              (<= 0 j@63@01)
              (<
                j@63@01
                (Seq_length
                  ($FVF.lookup_val (as sm@42@01  $FVF<val>) (slot<Ref> a@15@01 m@62@01))))))))
      (and
        (<= 0 m@62@01)
        (and
          (< m@62@01 4)
          (and
            (<= 0 j@63@01)
            (<
              j@63@01
              (Seq_length
                ($FVF.lookup_val (as sm@42@01  $FVF<val>) (slot<Ref> a@15@01 m@62@01)))))))))
  :pattern ((Seq_length
    ($FVF.lookup_val (as sm@42@01  $FVF<val>) (slot<Ref> a@15@01 m@62@01))) (valid%limited $Snap.unit (Seq_index
    ($FVF.lookup_val (as sm@42@01  $FVF<val>) (slot<Ref> a@15@01 m@62@01))
    j@63@01) m@62@01 true))
  :qid |prog./silicon/silver/src/test/resources/all/sequences/sequence_incompletenesses.vpr@85@13@86@39-aux|)))
(assert (forall ((m@62@01 Int) (j@63@01 Int)) (!
  (and
    (=>
      (<= 0 m@62@01)
      (and
        (<= 0 m@62@01)
        (=>
          (< m@62@01 4)
          (and (< m@62@01 4) (or (<= 0 j@63@01) (not (<= 0 j@63@01)))))
        (or (< m@62@01 4) (not (< m@62@01 4)))))
    (or (<= 0 m@62@01) (not (<= 0 m@62@01)))
    (=>
      (and
        (<= 0 m@62@01)
        (and
          (< m@62@01 4)
          (and
            (<= 0 j@63@01)
            (<
              j@63@01
              (Seq_length
                ($FVF.lookup_val (as sm@42@01  $FVF<val>) (slot<Ref> a@15@01 m@62@01)))))))
      (and
        (<= 0 m@62@01)
        (< m@62@01 4)
        (<= 0 j@63@01)
        (<
          j@63@01
          (Seq_length
            ($FVF.lookup_val (as sm@42@01  $FVF<val>) (slot<Ref> a@15@01 m@62@01))))
        (valid%precondition $Snap.unit (Seq_index
          ($FVF.lookup_val (as sm@42@01  $FVF<val>) (slot<Ref> a@15@01 m@62@01))
          j@63@01) m@62@01 true)))
    (or
      (not
        (and
          (<= 0 m@62@01)
          (and
            (< m@62@01 4)
            (and
              (<= 0 j@63@01)
              (<
                j@63@01
                (Seq_length
                  ($FVF.lookup_val (as sm@42@01  $FVF<val>) (slot<Ref> a@15@01 m@62@01))))))))
      (and
        (<= 0 m@62@01)
        (and
          (< m@62@01 4)
          (and
            (<= 0 j@63@01)
            (<
              j@63@01
              (Seq_length
                ($FVF.lookup_val (as sm@42@01  $FVF<val>) (slot<Ref> a@15@01 m@62@01)))))))))
  :pattern ((valid%limited $Snap.unit (Seq_index
    ($FVF.lookup_val (as sm@42@01  $FVF<val>) (slot<Ref> a@15@01 m@62@01))
    j@63@01) m@62@01 true))
  :qid |prog./silicon/silver/src/test/resources/all/sequences/sequence_incompletenesses.vpr@85@13@86@39-aux|)))
(assert (forall ((m@62@01 Int) (j@63@01 Int)) (!
  (=>
    (and
      (<= 0 m@62@01)
      (and
        (< m@62@01 4)
        (and
          (<= 0 j@63@01)
          (<
            j@63@01
            (Seq_length
              ($FVF.lookup_val (as sm@42@01  $FVF<val>) (slot<Ref> a@15@01 m@62@01)))))))
    (valid%precondition $Snap.unit (Seq_index
      ($FVF.lookup_val (as sm@42@01  $FVF<val>) (slot<Ref> a@15@01 m@62@01))
      j@63@01) m@62@01 true))
  :pattern ((Seq_length
    ($FVF.lookup_val (as sm@42@01  $FVF<val>) (slot<Ref> a@15@01 m@62@01))) (Seq_index
    ($FVF.lookup_val (as sm@42@01  $FVF<val>) (slot<Ref> a@15@01 m@62@01))
    j@63@01))
  :pattern ((Seq_length
    ($FVF.lookup_val (as sm@42@01  $FVF<val>) (slot<Ref> a@15@01 m@62@01))) (valid%limited $Snap.unit (Seq_index
    ($FVF.lookup_val (as sm@42@01  $FVF<val>) (slot<Ref> a@15@01 m@62@01))
    j@63@01) m@62@01 true))
  :pattern ((valid%limited $Snap.unit (Seq_index
    ($FVF.lookup_val (as sm@42@01  $FVF<val>) (slot<Ref> a@15@01 m@62@01))
    j@63@01) m@62@01 true))
  :qid |prog./silicon/silver/src/test/resources/all/sequences/sequence_incompletenesses.vpr@85@13@86@39_precondition|)))
(push) ; 4
(assert (not (forall ((m@62@01 Int) (j@63@01 Int)) (!
  (=>
    (and
      (=>
        (and
          (<= 0 m@62@01)
          (and
            (< m@62@01 4)
            (and
              (<= 0 j@63@01)
              (<
                j@63@01
                (Seq_length
                  ($FVF.lookup_val (as sm@42@01  $FVF<val>) (slot<Ref> a@15@01 m@62@01)))))))
        (valid%precondition $Snap.unit (Seq_index
          ($FVF.lookup_val (as sm@42@01  $FVF<val>) (slot<Ref> a@15@01 m@62@01))
          j@63@01) m@62@01 true))
      (and
        (<= 0 m@62@01)
        (and
          (< m@62@01 4)
          (and
            (<= 0 j@63@01)
            (<
              j@63@01
              (Seq_length
                ($FVF.lookup_val (as sm@42@01  $FVF<val>) (slot<Ref> a@15@01 m@62@01))))))))
    (valid $Snap.unit (Seq_index
      ($FVF.lookup_val (as sm@42@01  $FVF<val>) (slot<Ref> a@15@01 m@62@01))
      j@63@01) m@62@01 true))
  :pattern ((Seq_length
    ($FVF.lookup_val (as sm@42@01  $FVF<val>) (slot<Ref> a@15@01 m@62@01))) (Seq_index
    ($FVF.lookup_val (as sm@42@01  $FVF<val>) (slot<Ref> a@15@01 m@62@01))
    j@63@01))
  :pattern ((Seq_length
    ($FVF.lookup_val (as sm@42@01  $FVF<val>) (slot<Ref> a@15@01 m@62@01))) (valid%limited $Snap.unit (Seq_index
    ($FVF.lookup_val (as sm@42@01  $FVF<val>) (slot<Ref> a@15@01 m@62@01))
    j@63@01) m@62@01 true))
  :pattern ((valid%limited $Snap.unit (Seq_index
    ($FVF.lookup_val (as sm@42@01  $FVF<val>) (slot<Ref> a@15@01 m@62@01))
    j@63@01) m@62@01 true))
  :qid |prog./silicon/silver/src/test/resources/all/sequences/sequence_incompletenesses.vpr@85@13@86@39|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((m@62@01 Int) (j@63@01 Int)) (!
  (=>
    (and
      (<= 0 m@62@01)
      (and
        (< m@62@01 4)
        (and
          (<= 0 j@63@01)
          (<
            j@63@01
            (Seq_length
              ($FVF.lookup_val (as sm@42@01  $FVF<val>) (slot<Ref> a@15@01 m@62@01)))))))
    (valid $Snap.unit (Seq_index
      ($FVF.lookup_val (as sm@42@01  $FVF<val>) (slot<Ref> a@15@01 m@62@01))
      j@63@01) m@62@01 true))
  :pattern ((Seq_length
    ($FVF.lookup_val (as sm@42@01  $FVF<val>) (slot<Ref> a@15@01 m@62@01))) (Seq_index
    ($FVF.lookup_val (as sm@42@01  $FVF<val>) (slot<Ref> a@15@01 m@62@01))
    j@63@01))
  :pattern ((Seq_length
    ($FVF.lookup_val (as sm@42@01  $FVF<val>) (slot<Ref> a@15@01 m@62@01))) (valid%limited $Snap.unit (Seq_index
    ($FVF.lookup_val (as sm@42@01  $FVF<val>) (slot<Ref> a@15@01 m@62@01))
    j@63@01) m@62@01 true))
  :pattern ((valid%limited $Snap.unit (Seq_index
    ($FVF.lookup_val (as sm@42@01  $FVF<val>) (slot<Ref> a@15@01 m@62@01))
    j@63@01) m@62@01 true))
  :qid |prog./silicon/silver/src/test/resources/all/sequences/sequence_incompletenesses.vpr@85@13@86@39|)))
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 4
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@51@01 r)
      (and (<= 0 (inv@50@01 r)) (< (inv@50@01 r) (len<Int> a@15@01))))
    (= (slot<Ref> a@15@01 (inv@50@01 r)) r))
  :pattern ((inv@50@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((i@49@01 Int)) (!
  (=>
    (and (<= 0 i@49@01) (< i@49@01 (len<Int> a@15@01)))
    (and
      (= (inv@50@01 (slot<Ref> a@15@01 i@49@01)) i@49@01)
      (img@51@01 (slot<Ref> a@15@01 i@49@01))))
  :pattern ((slot<Ref> a@15@01 i@49@01))
  :qid |quant-u-33|)))
(assert (forall ((i@49@01 Int)) (!
  (=>
    (and (<= 0 i@49@01) (< i@49@01 (len<Int> a@15@01)))
    (not (= (slot<Ref> a@15@01 i@49@01) $Ref.null)))
  :pattern ((slot<Ref> a@15@01 i@49@01))
  :qid |val-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@48@01))))
  $Snap.unit))
(assert (forall ((m@52@01 Int) (j@53@01 Int)) (!
  (and
    (=>
      (<= 0 m@52@01)
      (and
        (<= 0 m@52@01)
        (=>
          (< m@52@01 n@46@01)
          (and (< m@52@01 n@46@01) (or (<= 0 j@53@01) (not (<= 0 j@53@01)))))
        (or (< m@52@01 n@46@01) (not (< m@52@01 n@46@01)))))
    (or (<= 0 m@52@01) (not (<= 0 m@52@01)))
    (=>
      (and
        (<= 0 m@52@01)
        (and
          (< m@52@01 n@46@01)
          (and
            (<= 0 j@53@01)
            (<
              j@53@01
              (Seq_length
                ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) (slot<Ref> a@15@01 m@52@01)))))))
      (and
        (<= 0 m@52@01)
        (< m@52@01 n@46@01)
        (<= 0 j@53@01)
        (<
          j@53@01
          (Seq_length
            ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) (slot<Ref> a@15@01 m@52@01))))
        (valid%precondition $Snap.unit (Seq_index
          ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) (slot<Ref> a@15@01 m@52@01))
          j@53@01) m@52@01 true)))
    (or
      (not
        (and
          (<= 0 m@52@01)
          (and
            (< m@52@01 n@46@01)
            (and
              (<= 0 j@53@01)
              (<
                j@53@01
                (Seq_length
                  ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) (slot<Ref> a@15@01 m@52@01))))))))
      (and
        (<= 0 m@52@01)
        (and
          (< m@52@01 n@46@01)
          (and
            (<= 0 j@53@01)
            (<
              j@53@01
              (Seq_length
                ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) (slot<Ref> a@15@01 m@52@01)))))))))
  :pattern ((Seq_length
    ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) (slot<Ref> a@15@01 m@52@01))) (Seq_index
    ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) (slot<Ref> a@15@01 m@52@01))
    j@53@01))
  :qid |prog./silicon/silver/src/test/resources/all/sequences/sequence_incompletenesses.vpr@85@13@86@39-aux|)))
(assert (forall ((m@52@01 Int) (j@53@01 Int)) (!
  (and
    (=>
      (<= 0 m@52@01)
      (and
        (<= 0 m@52@01)
        (=>
          (< m@52@01 n@46@01)
          (and (< m@52@01 n@46@01) (or (<= 0 j@53@01) (not (<= 0 j@53@01)))))
        (or (< m@52@01 n@46@01) (not (< m@52@01 n@46@01)))))
    (or (<= 0 m@52@01) (not (<= 0 m@52@01)))
    (=>
      (and
        (<= 0 m@52@01)
        (and
          (< m@52@01 n@46@01)
          (and
            (<= 0 j@53@01)
            (<
              j@53@01
              (Seq_length
                ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) (slot<Ref> a@15@01 m@52@01)))))))
      (and
        (<= 0 m@52@01)
        (< m@52@01 n@46@01)
        (<= 0 j@53@01)
        (<
          j@53@01
          (Seq_length
            ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) (slot<Ref> a@15@01 m@52@01))))
        (valid%precondition $Snap.unit (Seq_index
          ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) (slot<Ref> a@15@01 m@52@01))
          j@53@01) m@52@01 true)))
    (or
      (not
        (and
          (<= 0 m@52@01)
          (and
            (< m@52@01 n@46@01)
            (and
              (<= 0 j@53@01)
              (<
                j@53@01
                (Seq_length
                  ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) (slot<Ref> a@15@01 m@52@01))))))))
      (and
        (<= 0 m@52@01)
        (and
          (< m@52@01 n@46@01)
          (and
            (<= 0 j@53@01)
            (<
              j@53@01
              (Seq_length
                ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) (slot<Ref> a@15@01 m@52@01)))))))))
  :pattern ((Seq_length
    ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) (slot<Ref> a@15@01 m@52@01))) (valid%limited $Snap.unit (Seq_index
    ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) (slot<Ref> a@15@01 m@52@01))
    j@53@01) m@52@01 true))
  :qid |prog./silicon/silver/src/test/resources/all/sequences/sequence_incompletenesses.vpr@85@13@86@39-aux|)))
(assert (forall ((m@52@01 Int) (j@53@01 Int)) (!
  (and
    (=>
      (<= 0 m@52@01)
      (and
        (<= 0 m@52@01)
        (=>
          (< m@52@01 n@46@01)
          (and (< m@52@01 n@46@01) (or (<= 0 j@53@01) (not (<= 0 j@53@01)))))
        (or (< m@52@01 n@46@01) (not (< m@52@01 n@46@01)))))
    (or (<= 0 m@52@01) (not (<= 0 m@52@01)))
    (=>
      (and
        (<= 0 m@52@01)
        (and
          (< m@52@01 n@46@01)
          (and
            (<= 0 j@53@01)
            (<
              j@53@01
              (Seq_length
                ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) (slot<Ref> a@15@01 m@52@01)))))))
      (and
        (<= 0 m@52@01)
        (< m@52@01 n@46@01)
        (<= 0 j@53@01)
        (<
          j@53@01
          (Seq_length
            ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) (slot<Ref> a@15@01 m@52@01))))
        (valid%precondition $Snap.unit (Seq_index
          ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) (slot<Ref> a@15@01 m@52@01))
          j@53@01) m@52@01 true)))
    (or
      (not
        (and
          (<= 0 m@52@01)
          (and
            (< m@52@01 n@46@01)
            (and
              (<= 0 j@53@01)
              (<
                j@53@01
                (Seq_length
                  ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) (slot<Ref> a@15@01 m@52@01))))))))
      (and
        (<= 0 m@52@01)
        (and
          (< m@52@01 n@46@01)
          (and
            (<= 0 j@53@01)
            (<
              j@53@01
              (Seq_length
                ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) (slot<Ref> a@15@01 m@52@01)))))))))
  :pattern ((valid%limited $Snap.unit (Seq_index
    ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) (slot<Ref> a@15@01 m@52@01))
    j@53@01) m@52@01 true))
  :qid |prog./silicon/silver/src/test/resources/all/sequences/sequence_incompletenesses.vpr@85@13@86@39-aux|)))
(assert (forall ((m@52@01 Int) (j@53@01 Int)) (!
  (=>
    (and
      (<= 0 m@52@01)
      (and
        (< m@52@01 n@46@01)
        (and
          (<= 0 j@53@01)
          (<
            j@53@01
            (Seq_length
              ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) (slot<Ref> a@15@01 m@52@01)))))))
    (valid $Snap.unit (Seq_index
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) (slot<Ref> a@15@01 m@52@01))
      j@53@01) m@52@01 true))
  :pattern ((Seq_length
    ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) (slot<Ref> a@15@01 m@52@01))) (Seq_index
    ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) (slot<Ref> a@15@01 m@52@01))
    j@53@01))
  :pattern ((Seq_length
    ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) (slot<Ref> a@15@01 m@52@01))) (valid%limited $Snap.unit (Seq_index
    ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) (slot<Ref> a@15@01 m@52@01))
    j@53@01) m@52@01 true))
  :pattern ((valid%limited $Snap.unit (Seq_index
    ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) (slot<Ref> a@15@01 m@52@01))
    j@53@01) m@52@01 true))
  :qid |prog./silicon/silver/src/test/resources/all/sequences/sequence_incompletenesses.vpr@85@13@86@39|)))
(assert (= $t@48@01 ($Snap.combine ($Snap.first $t@48@01) ($Snap.second $t@48@01))))
(assert (= ($Snap.first $t@48@01) $Snap.unit))
(assert (<= 4 n@46@01))
(assert (=
  ($Snap.second $t@48@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@48@01))
    ($Snap.second ($Snap.second $t@48@01)))))
(assert (= ($Snap.first ($Snap.second $t@48@01)) $Snap.unit))
(assert (<= n@46@01 51))
(assert (=
  ($Snap.second ($Snap.second $t@48@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@48@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@48@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@48@01))) $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@48@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@48@01)))))))
(assert (forall ((i@49@01 Int)) (!
  (=>
    (and (<= 0 i@49@01) (< i@49@01 (len<Int> a@15@01)))
    (or (<= 0 i@49@01) (not (<= 0 i@49@01))))
  :pattern ((slot<Ref> a@15@01 i@49@01))
  :qid |val-aux|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 10)
(check-sat)
; unknown
; Loop head block: Check well-definedness of edge conditions
(set-option :timeout 0)
(push) ; 5
; [eval] n <= 50
(pop) ; 5
(push) ; 5
; [eval] !(n <= 50)
; [eval] n <= 50
(pop) ; 5
; Loop head block: Follow loop-internal edges
; [eval] n <= 50
(push) ; 5
(set-option :timeout 10)
(assert (not (not (<= n@46@01 50))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (<= n@46@01 50)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 22 | n@46@01 <= 50 | live]
; [else-branch: 22 | !(n@46@01 <= 50) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 22 | n@46@01 <= 50]
(assert (<= n@46@01 50))
; [exec]
; var i: Int
(declare-const i@64@01 Int)
; [exec]
; slot(a, n).val := Seq[Seq[Int]]()
; [eval] slot(a, n)
; [eval] Seq[Seq[Int]]()
; Precomputing data for removing quantified permissions
(define-fun pTaken@65@01 ((r $Ref)) $Perm
  (ite
    (= r (slot<Ref> a@15@01 n@46@01))
    ($Perm.min
      (ite
        (and
          (img@51@01 r)
          (and (<= 0 (inv@50@01 r)) (< (inv@50@01 r) (len<Int> a@15@01))))
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
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@51@01 r)
          (and (<= 0 (inv@50@01 r)) (< (inv@50@01 r) (len<Int> a@15@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@65@01 r))
    $Perm.No)
  
  :qid |quant-u-47|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@65@01 r) $Perm.No)
  
  :qid |quant-u-48|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 n@46@01))
    (= (- $Perm.Write (pTaken@65@01 r)) $Perm.No))
  
  :qid |quant-u-49|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@66@01 $FVF<val>)
; Definitional axioms for singleton-FVF's value
(assert (=
  ($FVF.lookup_val (as sm@66@01  $FVF<val>) (slot<Ref> a@15@01 n@46@01))
  (as Seq_empty  Seq<Seq<Int>>)))
; [exec]
; i := 0
(declare-const oldSoln@67@01 Seq<Int>)
(declare-const soln@68@01 Seq<Int>)
(declare-const i@69@01 Int)
(set-option :timeout 0)
(push) ; 6
; Loop head block: Check well-definedness of invariant
(declare-const $t@70@01 $Snap)
(assert (= $t@70@01 ($Snap.combine ($Snap.first $t@70@01) ($Snap.second $t@70@01))))
; [eval] slot(a, n - 1)
; [eval] n - 1
(declare-const sm@71@01 $FVF<val>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_val (as sm@71@01  $FVF<val>) (slot<Ref> a@15@01 (- n@46@01 1)))
  ($SortWrappers.$SnapToSeq<Seq<Int>> ($Snap.first $t@70@01))))
(assert (<=
  $Perm.No
  (ite
    (= (slot<Ref> a@15@01 (- n@46@01 1)) (slot<Ref> a@15@01 (- n@46@01 1)))
    (/ (to_real 1) (to_real 2))
    $Perm.No)))
(assert (<=
  (ite
    (= (slot<Ref> a@15@01 (- n@46@01 1)) (slot<Ref> a@15@01 (- n@46@01 1)))
    (/ (to_real 1) (to_real 2))
    $Perm.No)
  $Perm.Write))
(assert (=>
  (= (slot<Ref> a@15@01 (- n@46@01 1)) (slot<Ref> a@15@01 (- n@46@01 1)))
  (not (= (slot<Ref> a@15@01 (- n@46@01 1)) $Ref.null))))
(assert (=
  ($Snap.second $t@70@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@70@01))
    ($Snap.second ($Snap.second $t@70@01)))))
(assert (= ($Snap.first ($Snap.second $t@70@01)) $Snap.unit))
; [eval] len(a) == 51
; [eval] len(a)
(assert (=
  ($Snap.second ($Snap.second $t@70@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@70@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@70@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@70@01))) $Snap.unit))
; [eval] 0 <= i
(assert (<= 0 i@69@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@70@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@70@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@70@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@70@01))))
  $Snap.unit))
; [eval] i <= |slot(a, n - 1).val|
; [eval] |slot(a, n - 1).val|
; [eval] slot(a, n - 1)
; [eval] n - 1
(push) ; 7
(assert (not (= (slot<Ref> a@15@01 (- n@46@01 1)) (slot<Ref> a@15@01 (- n@46@01 1)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (<=
  i@69@01
  (Seq_length
    ($FVF.lookup_val (as sm@71@01  $FVF<val>) (slot<Ref> a@15@01 (- n@46@01 1))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@70@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@70@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@70@01))))))))
; [eval] slot(a, n)
(declare-const sm@72@01 $FVF<val>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_val (as sm@72@01  $FVF<val>) (slot<Ref> a@15@01 n@46@01))
  ($SortWrappers.$SnapToSeq<Seq<Int>> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@70@01))))))))
(push) ; 7
(set-option :timeout 10)
(assert (not (= (slot<Ref> a@15@01 n@46@01) (slot<Ref> a@15@01 (- n@46@01 1)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (<=
  $Perm.No
  (ite
    (= (slot<Ref> a@15@01 n@46@01) (slot<Ref> a@15@01 n@46@01))
    $Perm.Write
    $Perm.No)))
(assert (<=
  (ite
    (= (slot<Ref> a@15@01 n@46@01) (slot<Ref> a@15@01 n@46@01))
    $Perm.Write
    $Perm.No)
  $Perm.Write))
(assert (=>
  (= (slot<Ref> a@15@01 n@46@01) (slot<Ref> a@15@01 n@46@01))
  (not (= (slot<Ref> a@15@01 n@46@01) $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@70@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@70@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@70@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@70@01))))))
  $Snap.unit))
; [eval] |slot(a, n).val| == i
; [eval] |slot(a, n).val|
; [eval] slot(a, n)
(declare-const sm@73@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 (- n@46@01 1)))
    (=
      ($FVF.lookup_val (as sm@73@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@71@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@73@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@71@01  $FVF<val>) r))
  :qid |qp.fvfValDef19|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 n@46@01))
    (=
      ($FVF.lookup_val (as sm@73@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@72@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@73@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@72@01  $FVF<val>) r))
  :qid |qp.fvfValDef20|)))
(declare-const pm@74@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@74@01  $FPM) r)
    (+
      (ite
        (= r (slot<Ref> a@15@01 (- n@46@01 1)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (ite (= r (slot<Ref> a@15@01 n@46@01)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_val (as pm@74@01  $FPM) r))
  :qid |qp.resPrmSumDef21|)))
(set-option :timeout 0)
(push) ; 7
(assert (not (< $Perm.No ($FVF.perm_val (as pm@74@01  $FPM) (slot<Ref> a@15@01 n@46@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (=
  (Seq_length
    ($FVF.lookup_val (as sm@73@01  $FVF<val>) (slot<Ref> a@15@01 n@46@01)))
  i@69@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@70@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@70@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@70@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@70@01)))))))
  $Snap.unit))
; [eval] (forall j: Int, n1: Int :: { slot(a, n1).val[j] } n1 == n - 1 && (0 <= j && j < |slot(a, n - 1).val|) ==> valid(slot(a, n1).val[j], n - 1, true))
(declare-const j@75@01 Int)
(declare-const n1@76@01 Int)
(push) ; 7
; [eval] n1 == n - 1 && (0 <= j && j < |slot(a, n - 1).val|) ==> valid(slot(a, n1).val[j], n - 1, true)
; [eval] n1 == n - 1 && (0 <= j && j < |slot(a, n - 1).val|)
; [eval] n1 == n - 1
; [eval] n - 1
(push) ; 8
; [then-branch: 23 | n1@76@01 != n@46@01 - 1 | live]
; [else-branch: 23 | n1@76@01 == n@46@01 - 1 | live]
(push) ; 9
; [then-branch: 23 | n1@76@01 != n@46@01 - 1]
(assert (not (= n1@76@01 (- n@46@01 1))))
(pop) ; 9
(push) ; 9
; [else-branch: 23 | n1@76@01 == n@46@01 - 1]
(assert (= n1@76@01 (- n@46@01 1)))
; [eval] 0 <= j
(push) ; 10
; [then-branch: 24 | !(0 <= j@75@01) | live]
; [else-branch: 24 | 0 <= j@75@01 | live]
(push) ; 11
; [then-branch: 24 | !(0 <= j@75@01)]
(assert (not (<= 0 j@75@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 24 | 0 <= j@75@01]
(assert (<= 0 j@75@01))
; [eval] j < |slot(a, n - 1).val|
; [eval] |slot(a, n - 1).val|
; [eval] slot(a, n - 1)
; [eval] n - 1
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r (slot<Ref> a@15@01 (- n@46@01 1)))
      (=
        ($FVF.lookup_val (as sm@73@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@71@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@73@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@71@01  $FVF<val>) r))
    :qid |qp.fvfValDef19|))
  (forall ((r $Ref)) (!
    (=>
      (= r (slot<Ref> a@15@01 n@46@01))
      (=
        ($FVF.lookup_val (as sm@73@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@72@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@73@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@72@01  $FVF<val>) r))
    :qid |qp.fvfValDef20|))))
(push) ; 12
(assert (not (<
  $Perm.No
  (+
    (ite
      (= (slot<Ref> a@15@01 (- n@46@01 1)) (slot<Ref> a@15@01 (- n@46@01 1)))
      (/ (to_real 1) (to_real 2))
      $Perm.No)
    (ite
      (= (slot<Ref> a@15@01 (- n@46@01 1)) (slot<Ref> a@15@01 n@46@01))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 (- n@46@01 1)))
    (=
      ($FVF.lookup_val (as sm@73@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@71@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@73@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@71@01  $FVF<val>) r))
  :qid |qp.fvfValDef19|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 n@46@01))
    (=
      ($FVF.lookup_val (as sm@73@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@72@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@73@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@72@01  $FVF<val>) r))
  :qid |qp.fvfValDef20|)))
(assert (or (<= 0 j@75@01) (not (<= 0 j@75@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 (- n@46@01 1)))
    (=
      ($FVF.lookup_val (as sm@73@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@71@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@73@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@71@01  $FVF<val>) r))
  :qid |qp.fvfValDef19|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 n@46@01))
    (=
      ($FVF.lookup_val (as sm@73@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@72@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@73@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@72@01  $FVF<val>) r))
  :qid |qp.fvfValDef20|)))
(assert (=>
  (= n1@76@01 (- n@46@01 1))
  (and (= n1@76@01 (- n@46@01 1)) (or (<= 0 j@75@01) (not (<= 0 j@75@01))))))
(assert (or (= n1@76@01 (- n@46@01 1)) (not (= n1@76@01 (- n@46@01 1)))))
(push) ; 8
; [then-branch: 25 | n1@76@01 == n@46@01 - 1 && 0 <= j@75@01 && j@75@01 < |Lookup(val, sm@73@01, slot[Ref](a@15@01, n@46@01 - 1))| | live]
; [else-branch: 25 | !(n1@76@01 == n@46@01 - 1 && 0 <= j@75@01 && j@75@01 < |Lookup(val, sm@73@01, slot[Ref](a@15@01, n@46@01 - 1))|) | live]
(push) ; 9
; [then-branch: 25 | n1@76@01 == n@46@01 - 1 && 0 <= j@75@01 && j@75@01 < |Lookup(val, sm@73@01, slot[Ref](a@15@01, n@46@01 - 1))|]
(assert (and
  (= n1@76@01 (- n@46@01 1))
  (and
    (<= 0 j@75@01)
    (<
      j@75@01
      (Seq_length
        ($FVF.lookup_val (as sm@73@01  $FVF<val>) (slot<Ref> a@15@01 (-
          n@46@01
          1))))))))
; [eval] valid(slot(a, n1).val[j], n - 1, true)
; [eval] slot(a, n1).val[j]
; [eval] slot(a, n1)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r (slot<Ref> a@15@01 (- n@46@01 1)))
      (=
        ($FVF.lookup_val (as sm@73@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@71@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@73@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@71@01  $FVF<val>) r))
    :qid |qp.fvfValDef19|))
  (forall ((r $Ref)) (!
    (=>
      (= r (slot<Ref> a@15@01 n@46@01))
      (=
        ($FVF.lookup_val (as sm@73@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@72@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@73@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@72@01  $FVF<val>) r))
    :qid |qp.fvfValDef20|))))
(push) ; 10
(assert (not (<
  $Perm.No
  (+
    (ite
      (= (slot<Ref> a@15@01 n1@76@01) (slot<Ref> a@15@01 (- n@46@01 1)))
      (/ (to_real 1) (to_real 2))
      $Perm.No)
    (ite
      (= (slot<Ref> a@15@01 n1@76@01) (slot<Ref> a@15@01 n@46@01))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(push) ; 10
(assert (not (>= j@75@01 0)))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(push) ; 10
(assert (not (<
  j@75@01
  (Seq_length
    ($FVF.lookup_val (as sm@73@01  $FVF<val>) (slot<Ref> a@15@01 n1@76@01))))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [eval] n - 1
(push) ; 10
(assert (valid%precondition $Snap.unit (Seq_index
  ($FVF.lookup_val (as sm@73@01  $FVF<val>) (slot<Ref> a@15@01 n1@76@01))
  j@75@01) (- n@46@01 1) true))
(pop) ; 10
; Joined path conditions
(assert (valid%precondition $Snap.unit (Seq_index
  ($FVF.lookup_val (as sm@73@01  $FVF<val>) (slot<Ref> a@15@01 n1@76@01))
  j@75@01) (- n@46@01 1) true))
(pop) ; 9
(push) ; 9
; [else-branch: 25 | !(n1@76@01 == n@46@01 - 1 && 0 <= j@75@01 && j@75@01 < |Lookup(val, sm@73@01, slot[Ref](a@15@01, n@46@01 - 1))|)]
(assert (not
  (and
    (= n1@76@01 (- n@46@01 1))
    (and
      (<= 0 j@75@01)
      (<
        j@75@01
        (Seq_length
          ($FVF.lookup_val (as sm@73@01  $FVF<val>) (slot<Ref> a@15@01 (-
            n@46@01
            1)))))))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 (- n@46@01 1)))
    (=
      ($FVF.lookup_val (as sm@73@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@71@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@73@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@71@01  $FVF<val>) r))
  :qid |qp.fvfValDef19|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 n@46@01))
    (=
      ($FVF.lookup_val (as sm@73@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@72@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@73@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@72@01  $FVF<val>) r))
  :qid |qp.fvfValDef20|)))
(assert (=>
  (and
    (= n1@76@01 (- n@46@01 1))
    (and
      (<= 0 j@75@01)
      (<
        j@75@01
        (Seq_length
          ($FVF.lookup_val (as sm@73@01  $FVF<val>) (slot<Ref> a@15@01 (-
            n@46@01
            1)))))))
  (and
    (= n1@76@01 (- n@46@01 1))
    (<= 0 j@75@01)
    (<
      j@75@01
      (Seq_length
        ($FVF.lookup_val (as sm@73@01  $FVF<val>) (slot<Ref> a@15@01 (-
          n@46@01
          1)))))
    (valid%precondition $Snap.unit (Seq_index
      ($FVF.lookup_val (as sm@73@01  $FVF<val>) (slot<Ref> a@15@01 n1@76@01))
      j@75@01) (- n@46@01 1) true))))
; Joined path conditions
(assert (or
  (not
    (and
      (= n1@76@01 (- n@46@01 1))
      (and
        (<= 0 j@75@01)
        (<
          j@75@01
          (Seq_length
            ($FVF.lookup_val (as sm@73@01  $FVF<val>) (slot<Ref> a@15@01 (-
              n@46@01
              1))))))))
  (and
    (= n1@76@01 (- n@46@01 1))
    (and
      (<= 0 j@75@01)
      (<
        j@75@01
        (Seq_length
          ($FVF.lookup_val (as sm@73@01  $FVF<val>) (slot<Ref> a@15@01 (-
            n@46@01
            1)))))))))
(pop) ; 7
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 (- n@46@01 1)))
    (=
      ($FVF.lookup_val (as sm@73@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@71@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@73@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@71@01  $FVF<val>) r))
  :qid |qp.fvfValDef19|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 n@46@01))
    (=
      ($FVF.lookup_val (as sm@73@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@72@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@73@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@72@01  $FVF<val>) r))
  :qid |qp.fvfValDef20|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@75@01 Int) (n1@76@01 Int)) (!
  (and
    (=>
      (= n1@76@01 (- n@46@01 1))
      (and (= n1@76@01 (- n@46@01 1)) (or (<= 0 j@75@01) (not (<= 0 j@75@01)))))
    (or (= n1@76@01 (- n@46@01 1)) (not (= n1@76@01 (- n@46@01 1))))
    (=>
      (and
        (= n1@76@01 (- n@46@01 1))
        (and
          (<= 0 j@75@01)
          (<
            j@75@01
            (Seq_length
              ($FVF.lookup_val (as sm@73@01  $FVF<val>) (slot<Ref> a@15@01 (-
                n@46@01
                1)))))))
      (and
        (= n1@76@01 (- n@46@01 1))
        (<= 0 j@75@01)
        (<
          j@75@01
          (Seq_length
            ($FVF.lookup_val (as sm@73@01  $FVF<val>) (slot<Ref> a@15@01 (-
              n@46@01
              1)))))
        (valid%precondition $Snap.unit (Seq_index
          ($FVF.lookup_val (as sm@73@01  $FVF<val>) (slot<Ref> a@15@01 n1@76@01))
          j@75@01) (- n@46@01 1) true)))
    (or
      (not
        (and
          (= n1@76@01 (- n@46@01 1))
          (and
            (<= 0 j@75@01)
            (<
              j@75@01
              (Seq_length
                ($FVF.lookup_val (as sm@73@01  $FVF<val>) (slot<Ref> a@15@01 (-
                  n@46@01
                  1))))))))
      (and
        (= n1@76@01 (- n@46@01 1))
        (and
          (<= 0 j@75@01)
          (<
            j@75@01
            (Seq_length
              ($FVF.lookup_val (as sm@73@01  $FVF<val>) (slot<Ref> a@15@01 (-
                n@46@01
                1)))))))))
  :pattern ((Seq_index
    ($FVF.lookup_val (as sm@73@01  $FVF<val>) (slot<Ref> a@15@01 n1@76@01))
    j@75@01))
  :qid |prog./silicon/silver/src/test/resources/all/sequences/sequence_incompletenesses.vpr@97@17@98@44-aux|)))
(assert (forall ((j@75@01 Int) (n1@76@01 Int)) (!
  (=>
    (and
      (= n1@76@01 (- n@46@01 1))
      (and
        (<= 0 j@75@01)
        (<
          j@75@01
          (Seq_length
            ($FVF.lookup_val (as sm@73@01  $FVF<val>) (slot<Ref> a@15@01 (-
              n@46@01
              1)))))))
    (valid $Snap.unit (Seq_index
      ($FVF.lookup_val (as sm@73@01  $FVF<val>) (slot<Ref> a@15@01 n1@76@01))
      j@75@01) (- n@46@01 1) true))
  :pattern ((Seq_index
    ($FVF.lookup_val (as sm@73@01  $FVF<val>) (slot<Ref> a@15@01 n1@76@01))
    j@75@01))
  :qid |prog./silicon/silver/src/test/resources/all/sequences/sequence_incompletenesses.vpr@97@17@98@44|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@70@01)))))))
  $Snap.unit))
; [eval] (forall j: Int :: { slot(a, n).val[j] } 0 <= j && j < i ==> valid(slot(a, n).val[j], n, true))
(declare-const j@77@01 Int)
(push) ; 7
; [eval] 0 <= j && j < i ==> valid(slot(a, n).val[j], n, true)
; [eval] 0 <= j && j < i
; [eval] 0 <= j
(push) ; 8
; [then-branch: 26 | !(0 <= j@77@01) | live]
; [else-branch: 26 | 0 <= j@77@01 | live]
(push) ; 9
; [then-branch: 26 | !(0 <= j@77@01)]
(assert (not (<= 0 j@77@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 26 | 0 <= j@77@01]
(assert (<= 0 j@77@01))
; [eval] j < i
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j@77@01) (not (<= 0 j@77@01))))
(push) ; 8
; [then-branch: 27 | 0 <= j@77@01 && j@77@01 < i@69@01 | live]
; [else-branch: 27 | !(0 <= j@77@01 && j@77@01 < i@69@01) | live]
(push) ; 9
; [then-branch: 27 | 0 <= j@77@01 && j@77@01 < i@69@01]
(assert (and (<= 0 j@77@01) (< j@77@01 i@69@01)))
; [eval] valid(slot(a, n).val[j], n, true)
; [eval] slot(a, n).val[j]
; [eval] slot(a, n)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r (slot<Ref> a@15@01 (- n@46@01 1)))
      (=
        ($FVF.lookup_val (as sm@73@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@71@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@73@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@71@01  $FVF<val>) r))
    :qid |qp.fvfValDef19|))
  (forall ((r $Ref)) (!
    (=>
      (= r (slot<Ref> a@15@01 n@46@01))
      (=
        ($FVF.lookup_val (as sm@73@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@72@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@73@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@72@01  $FVF<val>) r))
    :qid |qp.fvfValDef20|))))
(push) ; 10
(assert (not (<
  $Perm.No
  (+
    (ite
      (= (slot<Ref> a@15@01 n@46@01) (slot<Ref> a@15@01 (- n@46@01 1)))
      (/ (to_real 1) (to_real 2))
      $Perm.No)
    (ite
      (= (slot<Ref> a@15@01 n@46@01) (slot<Ref> a@15@01 n@46@01))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(push) ; 10
(assert (not (>= j@77@01 0)))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(push) ; 10
(assert (not (<
  j@77@01
  (Seq_length
    ($FVF.lookup_val (as sm@73@01  $FVF<val>) (slot<Ref> a@15@01 n@46@01))))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(push) ; 10
(assert (valid%precondition $Snap.unit (Seq_index
  ($FVF.lookup_val (as sm@73@01  $FVF<val>) (slot<Ref> a@15@01 n@46@01))
  j@77@01) n@46@01 true))
(pop) ; 10
; Joined path conditions
(assert (valid%precondition $Snap.unit (Seq_index
  ($FVF.lookup_val (as sm@73@01  $FVF<val>) (slot<Ref> a@15@01 n@46@01))
  j@77@01) n@46@01 true))
(pop) ; 9
(push) ; 9
; [else-branch: 27 | !(0 <= j@77@01 && j@77@01 < i@69@01)]
(assert (not (and (<= 0 j@77@01) (< j@77@01 i@69@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 (- n@46@01 1)))
    (=
      ($FVF.lookup_val (as sm@73@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@71@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@73@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@71@01  $FVF<val>) r))
  :qid |qp.fvfValDef19|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 n@46@01))
    (=
      ($FVF.lookup_val (as sm@73@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@72@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@73@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@72@01  $FVF<val>) r))
  :qid |qp.fvfValDef20|)))
(assert (=>
  (and (<= 0 j@77@01) (< j@77@01 i@69@01))
  (and
    (<= 0 j@77@01)
    (< j@77@01 i@69@01)
    (valid%precondition $Snap.unit (Seq_index
      ($FVF.lookup_val (as sm@73@01  $FVF<val>) (slot<Ref> a@15@01 n@46@01))
      j@77@01) n@46@01 true))))
; Joined path conditions
(assert (or
  (not (and (<= 0 j@77@01) (< j@77@01 i@69@01)))
  (and (<= 0 j@77@01) (< j@77@01 i@69@01))))
(pop) ; 7
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 (- n@46@01 1)))
    (=
      ($FVF.lookup_val (as sm@73@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@71@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@73@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@71@01  $FVF<val>) r))
  :qid |qp.fvfValDef19|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 n@46@01))
    (=
      ($FVF.lookup_val (as sm@73@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@72@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@73@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@72@01  $FVF<val>) r))
  :qid |qp.fvfValDef20|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@77@01 Int)) (!
  (and
    (or (<= 0 j@77@01) (not (<= 0 j@77@01)))
    (=>
      (and (<= 0 j@77@01) (< j@77@01 i@69@01))
      (and
        (<= 0 j@77@01)
        (< j@77@01 i@69@01)
        (valid%precondition $Snap.unit (Seq_index
          ($FVF.lookup_val (as sm@73@01  $FVF<val>) (slot<Ref> a@15@01 n@46@01))
          j@77@01) n@46@01 true)))
    (or
      (not (and (<= 0 j@77@01) (< j@77@01 i@69@01)))
      (and (<= 0 j@77@01) (< j@77@01 i@69@01))))
  :pattern ((Seq_index
    ($FVF.lookup_val (as sm@73@01  $FVF<val>) (slot<Ref> a@15@01 n@46@01))
    j@77@01))
  :qid |prog./silicon/silver/src/test/resources/all/sequences/sequence_incompletenesses.vpr@99@17@99@104-aux|)))
(assert (forall ((j@77@01 Int)) (!
  (=>
    (and (<= 0 j@77@01) (< j@77@01 i@69@01))
    (valid $Snap.unit (Seq_index
      ($FVF.lookup_val (as sm@73@01  $FVF<val>) (slot<Ref> a@15@01 n@46@01))
      j@77@01) n@46@01 true))
  :pattern ((Seq_index
    ($FVF.lookup_val (as sm@73@01  $FVF<val>) (slot<Ref> a@15@01 n@46@01))
    j@77@01))
  :qid |prog./silicon/silver/src/test/resources/all/sequences/sequence_incompletenesses.vpr@99@17@99@104|)))
(pop) ; 6
(push) ; 6
; Loop head block: Establish invariant
; [eval] slot(a, n - 1)
; [eval] n - 1
(push) ; 7
(set-option :timeout 10)
(assert (not (= (slot<Ref> a@15@01 n@46@01) (slot<Ref> a@15@01 (- n@46@01 1)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@78@01 ((r $Ref)) $Perm
  (ite
    (= r (slot<Ref> a@15@01 (- n@46@01 1)))
    ($Perm.min
      (ite
        (and
          (img@51@01 r)
          (and (<= 0 (inv@50@01 r)) (< (inv@50@01 r) (len<Int> a@15@01))))
        (- $Perm.Write (pTaken@65@01 r))
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
(define-fun pTaken@79@01 ((r $Ref)) $Perm
  (ite
    (= r (slot<Ref> a@15@01 (- n@46@01 1)))
    ($Perm.min
      (ite (= r (slot<Ref> a@15@01 n@46@01)) $Perm.Write $Perm.No)
      (- (/ (to_real 1) (to_real 2)) (pTaken@78@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@51@01 r)
          (and (<= 0 (inv@50@01 r)) (< (inv@50@01 r) (len<Int> a@15@01))))
        (- $Perm.Write (pTaken@65@01 r))
        $Perm.No)
      (pTaken@78@01 r))
    $Perm.No)
  
  :qid |quant-u-51|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@78@01 r) $Perm.No)
  
  :qid |quant-u-52|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 (- n@46@01 1)))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@78@01 r)) $Perm.No))
  
  :qid |quant-u-53|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@80@01 $FVF<val>)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (= (slot<Ref> a@15@01 (- n@46@01 1)) (slot<Ref> a@15@01 n@46@01))
  (=
    ($FVF.lookup_val (as sm@80@01  $FVF<val>) (slot<Ref> a@15@01 (- n@46@01 1)))
    ($FVF.lookup_val (as sm@66@01  $FVF<val>) (slot<Ref> a@15@01 (- n@46@01 1))))))
(assert (=>
  (ite
    (and
      (img@51@01 (slot<Ref> a@15@01 (- n@46@01 1)))
      (and
        (<= 0 (inv@50@01 (slot<Ref> a@15@01 (- n@46@01 1))))
        (< (inv@50@01 (slot<Ref> a@15@01 (- n@46@01 1))) (len<Int> a@15@01))))
    (< $Perm.No (- $Perm.Write (pTaken@65@01 (slot<Ref> a@15@01 (- n@46@01 1)))))
    false)
  (=
    ($FVF.lookup_val (as sm@80@01  $FVF<val>) (slot<Ref> a@15@01 (- n@46@01 1)))
    ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) (slot<Ref> a@15@01 (-
      n@46@01
      1))))))
; [eval] len(a) == 51
; [eval] len(a)
; [eval] 0 <= i
; [eval] i <= |slot(a, n - 1).val|
; [eval] |slot(a, n - 1).val|
; [eval] slot(a, n - 1)
; [eval] n - 1
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r (slot<Ref> a@15@01 n@46@01))
      (=
        ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@66@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@66@01  $FVF<val>) r))
    :qid |qp.fvfValDef22|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and
          (img@51@01 r)
          (and (<= 0 (inv@50@01 r)) (< (inv@50@01 r) (len<Int> a@15@01))))
        (< $Perm.No (- $Perm.Write (pTaken@65@01 r)))
        false)
      (=
        ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
        ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) r)))
    :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) r))
    :qid |qp.fvfValDef23|))))
(set-option :timeout 0)
(push) ; 7
(assert (not (<
  $Perm.No
  (+
    (ite
      (= (slot<Ref> a@15@01 (- n@46@01 1)) (slot<Ref> a@15@01 n@46@01))
      $Perm.Write
      $Perm.No)
    (ite
      (and
        (img@51@01 (slot<Ref> a@15@01 (- n@46@01 1)))
        (and
          (<= 0 (inv@50@01 (slot<Ref> a@15@01 (- n@46@01 1))))
          (< (inv@50@01 (slot<Ref> a@15@01 (- n@46@01 1))) (len<Int> a@15@01))))
      (- $Perm.Write (pTaken@65@01 (slot<Ref> a@15@01 (- n@46@01 1))))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (<=
  0
  (Seq_length
    ($FVF.lookup_val (as sm@80@01  $FVF<val>) (slot<Ref> a@15@01 (- n@46@01 1)))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (<=
  0
  (Seq_length
    ($FVF.lookup_val (as sm@80@01  $FVF<val>) (slot<Ref> a@15@01 (- n@46@01 1))))))
; [eval] slot(a, n)
; Precomputing data for removing quantified permissions
(define-fun pTaken@81@01 ((r $Ref)) $Perm
  (ite
    (= r (slot<Ref> a@15@01 n@46@01))
    ($Perm.min
      (ite (= r (slot<Ref> a@15@01 n@46@01)) $Perm.Write $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@82@01 ((r $Ref)) $Perm
  (ite
    (= r (slot<Ref> a@15@01 n@46@01))
    ($Perm.min
      (ite
        (and
          (img@51@01 r)
          (and (<= 0 (inv@50@01 r)) (< (inv@50@01 r) (len<Int> a@15@01))))
        (- (- $Perm.Write (pTaken@65@01 r)) (pTaken@78@01 r))
        $Perm.No)
      (- $Perm.Write (pTaken@81@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (=
  (-
    (ite
      (= (slot<Ref> a@15@01 n@46@01) (slot<Ref> a@15@01 n@46@01))
      $Perm.Write
      $Perm.No)
    (pTaken@81@01 (slot<Ref> a@15@01 n@46@01)))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 n@46@01))
    (= (- $Perm.Write (pTaken@81@01 r)) $Perm.No))
  
  :qid |quant-u-56|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@83@01 $FVF<val>)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (= (slot<Ref> a@15@01 n@46@01) (slot<Ref> a@15@01 n@46@01))
  (=
    ($FVF.lookup_val (as sm@83@01  $FVF<val>) (slot<Ref> a@15@01 n@46@01))
    ($FVF.lookup_val (as sm@66@01  $FVF<val>) (slot<Ref> a@15@01 n@46@01)))))
(assert (=>
  (ite
    (and
      (img@51@01 (slot<Ref> a@15@01 n@46@01))
      (and
        (<= 0 (inv@50@01 (slot<Ref> a@15@01 n@46@01)))
        (< (inv@50@01 (slot<Ref> a@15@01 n@46@01)) (len<Int> a@15@01))))
    (<
      $Perm.No
      (-
        (- $Perm.Write (pTaken@65@01 (slot<Ref> a@15@01 n@46@01)))
        (pTaken@78@01 (slot<Ref> a@15@01 n@46@01))))
    false)
  (=
    ($FVF.lookup_val (as sm@83@01  $FVF<val>) (slot<Ref> a@15@01 n@46@01))
    ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) (slot<Ref> a@15@01 n@46@01)))))
; [eval] |slot(a, n).val| == i
; [eval] |slot(a, n).val|
; [eval] slot(a, n)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r (slot<Ref> a@15@01 n@46@01))
      (=
        ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@66@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@66@01  $FVF<val>) r))
    :qid |qp.fvfValDef22|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and
          (img@51@01 r)
          (and (<= 0 (inv@50@01 r)) (< (inv@50@01 r) (len<Int> a@15@01))))
        (< $Perm.No (- $Perm.Write (pTaken@65@01 r)))
        false)
      (=
        ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
        ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) r)))
    :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) r))
    :qid |qp.fvfValDef23|))))
(set-option :timeout 0)
(push) ; 7
(assert (not (<
  $Perm.No
  (+
    (ite
      (= (slot<Ref> a@15@01 n@46@01) (slot<Ref> a@15@01 n@46@01))
      $Perm.Write
      $Perm.No)
    (ite
      (and
        (img@51@01 (slot<Ref> a@15@01 n@46@01))
        (and
          (<= 0 (inv@50@01 (slot<Ref> a@15@01 n@46@01)))
          (< (inv@50@01 (slot<Ref> a@15@01 n@46@01)) (len<Int> a@15@01))))
      (- $Perm.Write (pTaken@65@01 (slot<Ref> a@15@01 n@46@01)))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (=
  (Seq_length
    ($FVF.lookup_val (as sm@80@01  $FVF<val>) (slot<Ref> a@15@01 n@46@01)))
  0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (=
  (Seq_length
    ($FVF.lookup_val (as sm@80@01  $FVF<val>) (slot<Ref> a@15@01 n@46@01)))
  0))
; [eval] (forall j: Int, n1: Int :: { slot(a, n1).val[j] } n1 == n - 1 && (0 <= j && j < |slot(a, n - 1).val|) ==> valid(slot(a, n1).val[j], n - 1, true))
(declare-const j@84@01 Int)
(declare-const n1@85@01 Int)
(push) ; 7
; [eval] n1 == n - 1 && (0 <= j && j < |slot(a, n - 1).val|) ==> valid(slot(a, n1).val[j], n - 1, true)
; [eval] n1 == n - 1 && (0 <= j && j < |slot(a, n - 1).val|)
; [eval] n1 == n - 1
; [eval] n - 1
(push) ; 8
; [then-branch: 28 | n1@85@01 != n@46@01 - 1 | live]
; [else-branch: 28 | n1@85@01 == n@46@01 - 1 | live]
(push) ; 9
; [then-branch: 28 | n1@85@01 != n@46@01 - 1]
(assert (not (= n1@85@01 (- n@46@01 1))))
(pop) ; 9
(push) ; 9
; [else-branch: 28 | n1@85@01 == n@46@01 - 1]
(assert (= n1@85@01 (- n@46@01 1)))
; [eval] 0 <= j
(push) ; 10
; [then-branch: 29 | !(0 <= j@84@01) | live]
; [else-branch: 29 | 0 <= j@84@01 | live]
(push) ; 11
; [then-branch: 29 | !(0 <= j@84@01)]
(assert (not (<= 0 j@84@01)))
(pop) ; 11
(push) ; 11
; [else-branch: 29 | 0 <= j@84@01]
(assert (<= 0 j@84@01))
; [eval] j < |slot(a, n - 1).val|
; [eval] |slot(a, n - 1).val|
; [eval] slot(a, n - 1)
; [eval] n - 1
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r (slot<Ref> a@15@01 n@46@01))
      (=
        ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@66@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@66@01  $FVF<val>) r))
    :qid |qp.fvfValDef22|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and
          (img@51@01 r)
          (and (<= 0 (inv@50@01 r)) (< (inv@50@01 r) (len<Int> a@15@01))))
        (< $Perm.No (- $Perm.Write (pTaken@65@01 r)))
        false)
      (=
        ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
        ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) r)))
    :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) r))
    :qid |qp.fvfValDef23|))))
(push) ; 12
(assert (not (<
  $Perm.No
  (+
    (ite
      (= (slot<Ref> a@15@01 (- n@46@01 1)) (slot<Ref> a@15@01 n@46@01))
      $Perm.Write
      $Perm.No)
    (ite
      (and
        (img@51@01 (slot<Ref> a@15@01 (- n@46@01 1)))
        (and
          (<= 0 (inv@50@01 (slot<Ref> a@15@01 (- n@46@01 1))))
          (< (inv@50@01 (slot<Ref> a@15@01 (- n@46@01 1))) (len<Int> a@15@01))))
      (- $Perm.Write (pTaken@65@01 (slot<Ref> a@15@01 (- n@46@01 1))))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 12
; 0,00s
; (get-info :all-statistics)
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 n@46@01))
    (=
      ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@66@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@66@01  $FVF<val>) r))
  :qid |qp.fvfValDef22|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@51@01 r)
        (and (<= 0 (inv@50@01 r)) (< (inv@50@01 r) (len<Int> a@15@01))))
      (< $Perm.No (- $Perm.Write (pTaken@65@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) r)))
  :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) r))
  :qid |qp.fvfValDef23|)))
(assert (or (<= 0 j@84@01) (not (<= 0 j@84@01))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 n@46@01))
    (=
      ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@66@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@66@01  $FVF<val>) r))
  :qid |qp.fvfValDef22|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@51@01 r)
        (and (<= 0 (inv@50@01 r)) (< (inv@50@01 r) (len<Int> a@15@01))))
      (< $Perm.No (- $Perm.Write (pTaken@65@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) r)))
  :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) r))
  :qid |qp.fvfValDef23|)))
(assert (=>
  (= n1@85@01 (- n@46@01 1))
  (and (= n1@85@01 (- n@46@01 1)) (or (<= 0 j@84@01) (not (<= 0 j@84@01))))))
(assert (or (= n1@85@01 (- n@46@01 1)) (not (= n1@85@01 (- n@46@01 1)))))
(push) ; 8
; [then-branch: 30 | n1@85@01 == n@46@01 - 1 && 0 <= j@84@01 && j@84@01 < |Lookup(val, sm@80@01, slot[Ref](a@15@01, n@46@01 - 1))| | live]
; [else-branch: 30 | !(n1@85@01 == n@46@01 - 1 && 0 <= j@84@01 && j@84@01 < |Lookup(val, sm@80@01, slot[Ref](a@15@01, n@46@01 - 1))|) | live]
(push) ; 9
; [then-branch: 30 | n1@85@01 == n@46@01 - 1 && 0 <= j@84@01 && j@84@01 < |Lookup(val, sm@80@01, slot[Ref](a@15@01, n@46@01 - 1))|]
(assert (and
  (= n1@85@01 (- n@46@01 1))
  (and
    (<= 0 j@84@01)
    (<
      j@84@01
      (Seq_length
        ($FVF.lookup_val (as sm@80@01  $FVF<val>) (slot<Ref> a@15@01 (-
          n@46@01
          1))))))))
; [eval] valid(slot(a, n1).val[j], n - 1, true)
; [eval] slot(a, n1).val[j]
; [eval] slot(a, n1)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r (slot<Ref> a@15@01 n@46@01))
      (=
        ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@66@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@66@01  $FVF<val>) r))
    :qid |qp.fvfValDef22|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and
          (img@51@01 r)
          (and (<= 0 (inv@50@01 r)) (< (inv@50@01 r) (len<Int> a@15@01))))
        (< $Perm.No (- $Perm.Write (pTaken@65@01 r)))
        false)
      (=
        ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
        ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) r)))
    :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) r))
    :qid |qp.fvfValDef23|))))
(push) ; 10
(assert (not (<
  $Perm.No
  (+
    (ite
      (= (slot<Ref> a@15@01 n1@85@01) (slot<Ref> a@15@01 n@46@01))
      $Perm.Write
      $Perm.No)
    (ite
      (and
        (img@51@01 (slot<Ref> a@15@01 n1@85@01))
        (and
          (<= 0 (inv@50@01 (slot<Ref> a@15@01 n1@85@01)))
          (< (inv@50@01 (slot<Ref> a@15@01 n1@85@01)) (len<Int> a@15@01))))
      (- $Perm.Write (pTaken@65@01 (slot<Ref> a@15@01 n1@85@01)))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(push) ; 10
(assert (not (>= j@84@01 0)))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(push) ; 10
(assert (not (<
  j@84@01
  (Seq_length
    ($FVF.lookup_val (as sm@80@01  $FVF<val>) (slot<Ref> a@15@01 n1@85@01))))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [eval] n - 1
(push) ; 10
(assert (valid%precondition $Snap.unit (Seq_index
  ($FVF.lookup_val (as sm@80@01  $FVF<val>) (slot<Ref> a@15@01 n1@85@01))
  j@84@01) (- n@46@01 1) true))
(pop) ; 10
; Joined path conditions
(assert (valid%precondition $Snap.unit (Seq_index
  ($FVF.lookup_val (as sm@80@01  $FVF<val>) (slot<Ref> a@15@01 n1@85@01))
  j@84@01) (- n@46@01 1) true))
(pop) ; 9
(push) ; 9
; [else-branch: 30 | !(n1@85@01 == n@46@01 - 1 && 0 <= j@84@01 && j@84@01 < |Lookup(val, sm@80@01, slot[Ref](a@15@01, n@46@01 - 1))|)]
(assert (not
  (and
    (= n1@85@01 (- n@46@01 1))
    (and
      (<= 0 j@84@01)
      (<
        j@84@01
        (Seq_length
          ($FVF.lookup_val (as sm@80@01  $FVF<val>) (slot<Ref> a@15@01 (-
            n@46@01
            1)))))))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 n@46@01))
    (=
      ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@66@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@66@01  $FVF<val>) r))
  :qid |qp.fvfValDef22|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@51@01 r)
        (and (<= 0 (inv@50@01 r)) (< (inv@50@01 r) (len<Int> a@15@01))))
      (< $Perm.No (- $Perm.Write (pTaken@65@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) r)))
  :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) r))
  :qid |qp.fvfValDef23|)))
(assert (=>
  (and
    (= n1@85@01 (- n@46@01 1))
    (and
      (<= 0 j@84@01)
      (<
        j@84@01
        (Seq_length
          ($FVF.lookup_val (as sm@80@01  $FVF<val>) (slot<Ref> a@15@01 (-
            n@46@01
            1)))))))
  (and
    (= n1@85@01 (- n@46@01 1))
    (<= 0 j@84@01)
    (<
      j@84@01
      (Seq_length
        ($FVF.lookup_val (as sm@80@01  $FVF<val>) (slot<Ref> a@15@01 (-
          n@46@01
          1)))))
    (valid%precondition $Snap.unit (Seq_index
      ($FVF.lookup_val (as sm@80@01  $FVF<val>) (slot<Ref> a@15@01 n1@85@01))
      j@84@01) (- n@46@01 1) true))))
; Joined path conditions
(assert (or
  (not
    (and
      (= n1@85@01 (- n@46@01 1))
      (and
        (<= 0 j@84@01)
        (<
          j@84@01
          (Seq_length
            ($FVF.lookup_val (as sm@80@01  $FVF<val>) (slot<Ref> a@15@01 (-
              n@46@01
              1))))))))
  (and
    (= n1@85@01 (- n@46@01 1))
    (and
      (<= 0 j@84@01)
      (<
        j@84@01
        (Seq_length
          ($FVF.lookup_val (as sm@80@01  $FVF<val>) (slot<Ref> a@15@01 (-
            n@46@01
            1)))))))))
(pop) ; 7
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 n@46@01))
    (=
      ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@66@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@66@01  $FVF<val>) r))
  :qid |qp.fvfValDef22|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@51@01 r)
        (and (<= 0 (inv@50@01 r)) (< (inv@50@01 r) (len<Int> a@15@01))))
      (< $Perm.No (- $Perm.Write (pTaken@65@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) r)))
  :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) r))
  :qid |qp.fvfValDef23|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@84@01 Int) (n1@85@01 Int)) (!
  (and
    (=>
      (= n1@85@01 (- n@46@01 1))
      (and (= n1@85@01 (- n@46@01 1)) (or (<= 0 j@84@01) (not (<= 0 j@84@01)))))
    (or (= n1@85@01 (- n@46@01 1)) (not (= n1@85@01 (- n@46@01 1))))
    (=>
      (and
        (= n1@85@01 (- n@46@01 1))
        (and
          (<= 0 j@84@01)
          (<
            j@84@01
            (Seq_length
              ($FVF.lookup_val (as sm@80@01  $FVF<val>) (slot<Ref> a@15@01 (-
                n@46@01
                1)))))))
      (and
        (= n1@85@01 (- n@46@01 1))
        (<= 0 j@84@01)
        (<
          j@84@01
          (Seq_length
            ($FVF.lookup_val (as sm@80@01  $FVF<val>) (slot<Ref> a@15@01 (-
              n@46@01
              1)))))
        (valid%precondition $Snap.unit (Seq_index
          ($FVF.lookup_val (as sm@80@01  $FVF<val>) (slot<Ref> a@15@01 n1@85@01))
          j@84@01) (- n@46@01 1) true)))
    (or
      (not
        (and
          (= n1@85@01 (- n@46@01 1))
          (and
            (<= 0 j@84@01)
            (<
              j@84@01
              (Seq_length
                ($FVF.lookup_val (as sm@80@01  $FVF<val>) (slot<Ref> a@15@01 (-
                  n@46@01
                  1))))))))
      (and
        (= n1@85@01 (- n@46@01 1))
        (and
          (<= 0 j@84@01)
          (<
            j@84@01
            (Seq_length
              ($FVF.lookup_val (as sm@80@01  $FVF<val>) (slot<Ref> a@15@01 (-
                n@46@01
                1)))))))))
  :pattern ((Seq_index
    ($FVF.lookup_val (as sm@80@01  $FVF<val>) (slot<Ref> a@15@01 n1@85@01))
    j@84@01))
  :qid |prog./silicon/silver/src/test/resources/all/sequences/sequence_incompletenesses.vpr@97@17@98@44-aux|)))
(assert (forall ((j@84@01 Int) (n1@85@01 Int)) (!
  (=>
    (and
      (= n1@85@01 (- n@46@01 1))
      (and
        (<= 0 j@84@01)
        (<
          j@84@01
          (Seq_length
            ($FVF.lookup_val (as sm@80@01  $FVF<val>) (slot<Ref> a@15@01 (-
              n@46@01
              1)))))))
    (valid%precondition $Snap.unit (Seq_index
      ($FVF.lookup_val (as sm@80@01  $FVF<val>) (slot<Ref> a@15@01 n1@85@01))
      j@84@01) (- n@46@01 1) true))
  :pattern ((Seq_index
    ($FVF.lookup_val (as sm@80@01  $FVF<val>) (slot<Ref> a@15@01 n1@85@01))
    j@84@01))
  :qid |prog./silicon/silver/src/test/resources/all/sequences/sequence_incompletenesses.vpr@97@17@98@44_precondition|)))
(push) ; 7
(assert (not (forall ((j@84@01 Int) (n1@85@01 Int)) (!
  (=>
    (and
      (=>
        (and
          (= n1@85@01 (- n@46@01 1))
          (and
            (<= 0 j@84@01)
            (<
              j@84@01
              (Seq_length
                ($FVF.lookup_val (as sm@80@01  $FVF<val>) (slot<Ref> a@15@01 (-
                  n@46@01
                  1)))))))
        (valid%precondition $Snap.unit (Seq_index
          ($FVF.lookup_val (as sm@80@01  $FVF<val>) (slot<Ref> a@15@01 n1@85@01))
          j@84@01) (- n@46@01 1) true))
      (and
        (= n1@85@01 (- n@46@01 1))
        (and
          (<= 0 j@84@01)
          (<
            j@84@01
            (Seq_length
              ($FVF.lookup_val (as sm@80@01  $FVF<val>) (slot<Ref> a@15@01 (-
                n@46@01
                1))))))))
    (valid $Snap.unit (Seq_index
      ($FVF.lookup_val (as sm@80@01  $FVF<val>) (slot<Ref> a@15@01 n1@85@01))
      j@84@01) (- n@46@01 1) true))
  :pattern ((Seq_index
    ($FVF.lookup_val (as sm@80@01  $FVF<val>) (slot<Ref> a@15@01 n1@85@01))
    j@84@01))
  :qid |prog./silicon/silver/src/test/resources/all/sequences/sequence_incompletenesses.vpr@97@17@98@44|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (forall ((j@84@01 Int) (n1@85@01 Int)) (!
  (=>
    (and
      (= n1@85@01 (- n@46@01 1))
      (and
        (<= 0 j@84@01)
        (<
          j@84@01
          (Seq_length
            ($FVF.lookup_val (as sm@80@01  $FVF<val>) (slot<Ref> a@15@01 (-
              n@46@01
              1)))))))
    (valid $Snap.unit (Seq_index
      ($FVF.lookup_val (as sm@80@01  $FVF<val>) (slot<Ref> a@15@01 n1@85@01))
      j@84@01) (- n@46@01 1) true))
  :pattern ((Seq_index
    ($FVF.lookup_val (as sm@80@01  $FVF<val>) (slot<Ref> a@15@01 n1@85@01))
    j@84@01))
  :qid |prog./silicon/silver/src/test/resources/all/sequences/sequence_incompletenesses.vpr@97@17@98@44|)))
; [eval] (forall j: Int :: { slot(a, n).val[j] } 0 <= j && j < i ==> valid(slot(a, n).val[j], n, true))
(declare-const j@86@01 Int)
(push) ; 7
; [eval] 0 <= j && j < i ==> valid(slot(a, n).val[j], n, true)
; [eval] 0 <= j && j < i
; [eval] 0 <= j
(push) ; 8
; [then-branch: 31 | !(0 <= j@86@01) | live]
; [else-branch: 31 | 0 <= j@86@01 | live]
(push) ; 9
; [then-branch: 31 | !(0 <= j@86@01)]
(assert (not (<= 0 j@86@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 31 | 0 <= j@86@01]
(assert (<= 0 j@86@01))
; [eval] j < i
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j@86@01) (not (<= 0 j@86@01))))
(push) ; 8
; [then-branch: 32 | 0 <= j@86@01 && j@86@01 < 0 | live]
; [else-branch: 32 | !(0 <= j@86@01 && j@86@01 < 0) | live]
(push) ; 9
; [then-branch: 32 | 0 <= j@86@01 && j@86@01 < 0]
(assert (and (<= 0 j@86@01) (< j@86@01 0)))
; [eval] valid(slot(a, n).val[j], n, true)
; [eval] slot(a, n).val[j]
; [eval] slot(a, n)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r (slot<Ref> a@15@01 n@46@01))
      (=
        ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@66@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@66@01  $FVF<val>) r))
    :qid |qp.fvfValDef22|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and
          (img@51@01 r)
          (and (<= 0 (inv@50@01 r)) (< (inv@50@01 r) (len<Int> a@15@01))))
        (< $Perm.No (- $Perm.Write (pTaken@65@01 r)))
        false)
      (=
        ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
        ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) r)))
    :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) r))
    :qid |qp.fvfValDef23|))))
(push) ; 10
(assert (not (<
  $Perm.No
  (+
    (ite
      (= (slot<Ref> a@15@01 n@46@01) (slot<Ref> a@15@01 n@46@01))
      $Perm.Write
      $Perm.No)
    (ite
      (and
        (img@51@01 (slot<Ref> a@15@01 n@46@01))
        (and
          (<= 0 (inv@50@01 (slot<Ref> a@15@01 n@46@01)))
          (< (inv@50@01 (slot<Ref> a@15@01 n@46@01)) (len<Int> a@15@01))))
      (- $Perm.Write (pTaken@65@01 (slot<Ref> a@15@01 n@46@01)))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(push) ; 10
(assert (not (>= j@86@01 0)))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(push) ; 10
(assert (not (<
  j@86@01
  (Seq_length
    ($FVF.lookup_val (as sm@80@01  $FVF<val>) (slot<Ref> a@15@01 n@46@01))))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(push) ; 10
(assert (valid%precondition $Snap.unit (Seq_index
  ($FVF.lookup_val (as sm@80@01  $FVF<val>) (slot<Ref> a@15@01 n@46@01))
  j@86@01) n@46@01 true))
(pop) ; 10
; Joined path conditions
(assert (valid%precondition $Snap.unit (Seq_index
  ($FVF.lookup_val (as sm@80@01  $FVF<val>) (slot<Ref> a@15@01 n@46@01))
  j@86@01) n@46@01 true))
(pop) ; 9
(push) ; 9
; [else-branch: 32 | !(0 <= j@86@01 && j@86@01 < 0)]
(assert (not (and (<= 0 j@86@01) (< j@86@01 0))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 n@46@01))
    (=
      ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@66@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@66@01  $FVF<val>) r))
  :qid |qp.fvfValDef22|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@51@01 r)
        (and (<= 0 (inv@50@01 r)) (< (inv@50@01 r) (len<Int> a@15@01))))
      (< $Perm.No (- $Perm.Write (pTaken@65@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) r)))
  :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) r))
  :qid |qp.fvfValDef23|)))
(assert (=>
  (and (<= 0 j@86@01) (< j@86@01 0))
  (and
    (<= 0 j@86@01)
    (< j@86@01 0)
    (valid%precondition $Snap.unit (Seq_index
      ($FVF.lookup_val (as sm@80@01  $FVF<val>) (slot<Ref> a@15@01 n@46@01))
      j@86@01) n@46@01 true))))
; Joined path conditions
(assert (or (not (and (<= 0 j@86@01) (< j@86@01 0))) (and (<= 0 j@86@01) (< j@86@01 0))))
(pop) ; 7
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 n@46@01))
    (=
      ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@66@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@66@01  $FVF<val>) r))
  :qid |qp.fvfValDef22|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@51@01 r)
        (and (<= 0 (inv@50@01 r)) (< (inv@50@01 r) (len<Int> a@15@01))))
      (< $Perm.No (- $Perm.Write (pTaken@65@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) r)))
  :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@48@01))))) r))
  :qid |qp.fvfValDef23|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@86@01 Int)) (!
  (and
    (or (<= 0 j@86@01) (not (<= 0 j@86@01)))
    (=>
      (and (<= 0 j@86@01) (< j@86@01 0))
      (and
        (<= 0 j@86@01)
        (< j@86@01 0)
        (valid%precondition $Snap.unit (Seq_index
          ($FVF.lookup_val (as sm@80@01  $FVF<val>) (slot<Ref> a@15@01 n@46@01))
          j@86@01) n@46@01 true)))
    (or
      (not (and (<= 0 j@86@01) (< j@86@01 0)))
      (and (<= 0 j@86@01) (< j@86@01 0))))
  :pattern ((Seq_index
    ($FVF.lookup_val (as sm@80@01  $FVF<val>) (slot<Ref> a@15@01 n@46@01))
    j@86@01))
  :qid |prog./silicon/silver/src/test/resources/all/sequences/sequence_incompletenesses.vpr@99@17@99@104-aux|)))
(assert (forall ((j@86@01 Int)) (!
  (=>
    (and (<= 0 j@86@01) (< j@86@01 0))
    (valid%precondition $Snap.unit (Seq_index
      ($FVF.lookup_val (as sm@80@01  $FVF<val>) (slot<Ref> a@15@01 n@46@01))
      j@86@01) n@46@01 true))
  :pattern ((Seq_index
    ($FVF.lookup_val (as sm@80@01  $FVF<val>) (slot<Ref> a@15@01 n@46@01))
    j@86@01))
  :qid |prog./silicon/silver/src/test/resources/all/sequences/sequence_incompletenesses.vpr@99@17@99@104_precondition|)))
(push) ; 7
(assert (not (forall ((j@86@01 Int)) (!
  (=>
    (and
      (=>
        (and (<= 0 j@86@01) (< j@86@01 0))
        (valid%precondition $Snap.unit (Seq_index
          ($FVF.lookup_val (as sm@80@01  $FVF<val>) (slot<Ref> a@15@01 n@46@01))
          j@86@01) n@46@01 true))
      (and (<= 0 j@86@01) (< j@86@01 0)))
    (valid $Snap.unit (Seq_index
      ($FVF.lookup_val (as sm@80@01  $FVF<val>) (slot<Ref> a@15@01 n@46@01))
      j@86@01) n@46@01 true))
  :pattern ((Seq_index
    ($FVF.lookup_val (as sm@80@01  $FVF<val>) (slot<Ref> a@15@01 n@46@01))
    j@86@01))
  :qid |prog./silicon/silver/src/test/resources/all/sequences/sequence_incompletenesses.vpr@99@17@99@104|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (forall ((j@86@01 Int)) (!
  (=>
    (and (<= 0 j@86@01) (< j@86@01 0))
    (valid $Snap.unit (Seq_index
      ($FVF.lookup_val (as sm@80@01  $FVF<val>) (slot<Ref> a@15@01 n@46@01))
      j@86@01) n@46@01 true))
  :pattern ((Seq_index
    ($FVF.lookup_val (as sm@80@01  $FVF<val>) (slot<Ref> a@15@01 n@46@01))
    j@86@01))
  :qid |prog./silicon/silver/src/test/resources/all/sequences/sequence_incompletenesses.vpr@99@17@99@104|)))
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 7
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 (- n@46@01 1)))
    (=
      ($FVF.lookup_val (as sm@73@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@71@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@73@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@71@01  $FVF<val>) r))
  :qid |qp.fvfValDef19|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 n@46@01))
    (=
      ($FVF.lookup_val (as sm@73@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@72@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@73@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@72@01  $FVF<val>) r))
  :qid |qp.fvfValDef20|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@74@01  $FPM) r)
    (+
      (ite
        (= r (slot<Ref> a@15@01 (- n@46@01 1)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (ite (= r (slot<Ref> a@15@01 n@46@01)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_val (as pm@74@01  $FPM) r))
  :qid |qp.resPrmSumDef21|)))
(assert (=
  ($FVF.lookup_val (as sm@72@01  $FVF<val>) (slot<Ref> a@15@01 n@46@01))
  ($SortWrappers.$SnapToSeq<Seq<Int>> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@70@01))))))))
(assert (<=
  $Perm.No
  (ite
    (= (slot<Ref> a@15@01 n@46@01) (slot<Ref> a@15@01 n@46@01))
    $Perm.Write
    $Perm.No)))
(assert (<=
  (ite
    (= (slot<Ref> a@15@01 n@46@01) (slot<Ref> a@15@01 n@46@01))
    $Perm.Write
    $Perm.No)
  $Perm.Write))
(assert (=>
  (= (slot<Ref> a@15@01 n@46@01) (slot<Ref> a@15@01 n@46@01))
  (not (= (slot<Ref> a@15@01 n@46@01) $Ref.null))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@70@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@70@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@70@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@70@01))))))
  $Snap.unit))
(assert (=
  (Seq_length
    ($FVF.lookup_val (as sm@73@01  $FVF<val>) (slot<Ref> a@15@01 n@46@01)))
  i@69@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@70@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@70@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@70@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@70@01)))))))
  $Snap.unit))
(assert (forall ((j@75@01 Int) (n1@76@01 Int)) (!
  (and
    (=>
      (= n1@76@01 (- n@46@01 1))
      (and (= n1@76@01 (- n@46@01 1)) (or (<= 0 j@75@01) (not (<= 0 j@75@01)))))
    (or (= n1@76@01 (- n@46@01 1)) (not (= n1@76@01 (- n@46@01 1))))
    (=>
      (and
        (= n1@76@01 (- n@46@01 1))
        (and
          (<= 0 j@75@01)
          (<
            j@75@01
            (Seq_length
              ($FVF.lookup_val (as sm@73@01  $FVF<val>) (slot<Ref> a@15@01 (-
                n@46@01
                1)))))))
      (and
        (= n1@76@01 (- n@46@01 1))
        (<= 0 j@75@01)
        (<
          j@75@01
          (Seq_length
            ($FVF.lookup_val (as sm@73@01  $FVF<val>) (slot<Ref> a@15@01 (-
              n@46@01
              1)))))
        (valid%precondition $Snap.unit (Seq_index
          ($FVF.lookup_val (as sm@73@01  $FVF<val>) (slot<Ref> a@15@01 n1@76@01))
          j@75@01) (- n@46@01 1) true)))
    (or
      (not
        (and
          (= n1@76@01 (- n@46@01 1))
          (and
            (<= 0 j@75@01)
            (<
              j@75@01
              (Seq_length
                ($FVF.lookup_val (as sm@73@01  $FVF<val>) (slot<Ref> a@15@01 (-
                  n@46@01
                  1))))))))
      (and
        (= n1@76@01 (- n@46@01 1))
        (and
          (<= 0 j@75@01)
          (<
            j@75@01
            (Seq_length
              ($FVF.lookup_val (as sm@73@01  $FVF<val>) (slot<Ref> a@15@01 (-
                n@46@01
                1)))))))))
  :pattern ((Seq_index
    ($FVF.lookup_val (as sm@73@01  $FVF<val>) (slot<Ref> a@15@01 n1@76@01))
    j@75@01))
  :qid |prog./silicon/silver/src/test/resources/all/sequences/sequence_incompletenesses.vpr@97@17@98@44-aux|)))
(assert (forall ((j@75@01 Int) (n1@76@01 Int)) (!
  (=>
    (and
      (= n1@76@01 (- n@46@01 1))
      (and
        (<= 0 j@75@01)
        (<
          j@75@01
          (Seq_length
            ($FVF.lookup_val (as sm@73@01  $FVF<val>) (slot<Ref> a@15@01 (-
              n@46@01
              1)))))))
    (valid $Snap.unit (Seq_index
      ($FVF.lookup_val (as sm@73@01  $FVF<val>) (slot<Ref> a@15@01 n1@76@01))
      j@75@01) (- n@46@01 1) true))
  :pattern ((Seq_index
    ($FVF.lookup_val (as sm@73@01  $FVF<val>) (slot<Ref> a@15@01 n1@76@01))
    j@75@01))
  :qid |prog./silicon/silver/src/test/resources/all/sequences/sequence_incompletenesses.vpr@97@17@98@44|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@70@01)))))))
  $Snap.unit))
(assert (forall ((j@77@01 Int)) (!
  (and
    (or (<= 0 j@77@01) (not (<= 0 j@77@01)))
    (=>
      (and (<= 0 j@77@01) (< j@77@01 i@69@01))
      (and
        (<= 0 j@77@01)
        (< j@77@01 i@69@01)
        (valid%precondition $Snap.unit (Seq_index
          ($FVF.lookup_val (as sm@73@01  $FVF<val>) (slot<Ref> a@15@01 n@46@01))
          j@77@01) n@46@01 true)))
    (or
      (not (and (<= 0 j@77@01) (< j@77@01 i@69@01)))
      (and (<= 0 j@77@01) (< j@77@01 i@69@01))))
  :pattern ((Seq_index
    ($FVF.lookup_val (as sm@73@01  $FVF<val>) (slot<Ref> a@15@01 n@46@01))
    j@77@01))
  :qid |prog./silicon/silver/src/test/resources/all/sequences/sequence_incompletenesses.vpr@99@17@99@104-aux|)))
(assert (forall ((j@77@01 Int)) (!
  (=>
    (and (<= 0 j@77@01) (< j@77@01 i@69@01))
    (valid $Snap.unit (Seq_index
      ($FVF.lookup_val (as sm@73@01  $FVF<val>) (slot<Ref> a@15@01 n@46@01))
      j@77@01) n@46@01 true))
  :pattern ((Seq_index
    ($FVF.lookup_val (as sm@73@01  $FVF<val>) (slot<Ref> a@15@01 n@46@01))
    j@77@01))
  :qid |prog./silicon/silver/src/test/resources/all/sequences/sequence_incompletenesses.vpr@99@17@99@104|)))
(assert (=
  ($FVF.lookup_val (as sm@71@01  $FVF<val>) (slot<Ref> a@15@01 (- n@46@01 1)))
  ($SortWrappers.$SnapToSeq<Seq<Int>> ($Snap.first $t@70@01))))
(assert (<=
  $Perm.No
  (ite
    (= (slot<Ref> a@15@01 (- n@46@01 1)) (slot<Ref> a@15@01 (- n@46@01 1)))
    (/ (to_real 1) (to_real 2))
    $Perm.No)))
(assert (<=
  (ite
    (= (slot<Ref> a@15@01 (- n@46@01 1)) (slot<Ref> a@15@01 (- n@46@01 1)))
    (/ (to_real 1) (to_real 2))
    $Perm.No)
  $Perm.Write))
(assert (=>
  (= (slot<Ref> a@15@01 (- n@46@01 1)) (slot<Ref> a@15@01 (- n@46@01 1)))
  (not (= (slot<Ref> a@15@01 (- n@46@01 1)) $Ref.null))))
(assert (=
  ($Snap.second $t@70@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@70@01))
    ($Snap.second ($Snap.second $t@70@01)))))
(assert (= ($Snap.first ($Snap.second $t@70@01)) $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second $t@70@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@70@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@70@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@70@01))) $Snap.unit))
(assert (<= 0 i@69@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@70@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@70@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@70@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@70@01))))
  $Snap.unit))
(assert (<=
  i@69@01
  (Seq_length
    ($FVF.lookup_val (as sm@71@01  $FVF<val>) (slot<Ref> a@15@01 (- n@46@01 1))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@70@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@70@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@70@01))))))))
(assert (= $t@70@01 ($Snap.combine ($Snap.first $t@70@01) ($Snap.second $t@70@01))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 10)
(check-sat)
; unknown
; Loop head block: Check well-definedness of edge conditions
(set-option :timeout 0)
(push) ; 8
; [eval] i < |slot(a, n - 1).val|
; [eval] |slot(a, n - 1).val|
; [eval] slot(a, n - 1)
; [eval] n - 1
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r (slot<Ref> a@15@01 (- n@46@01 1)))
      (=
        ($FVF.lookup_val (as sm@73@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@71@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@73@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@71@01  $FVF<val>) r))
    :qid |qp.fvfValDef19|))
  (forall ((r $Ref)) (!
    (=>
      (= r (slot<Ref> a@15@01 n@46@01))
      (=
        ($FVF.lookup_val (as sm@73@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@72@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@73@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@72@01  $FVF<val>) r))
    :qid |qp.fvfValDef20|))))
(push) ; 9
(assert (not (<
  $Perm.No
  (+
    (ite
      (= (slot<Ref> a@15@01 (- n@46@01 1)) (slot<Ref> a@15@01 (- n@46@01 1)))
      (/ (to_real 1) (to_real 2))
      $Perm.No)
    (ite
      (= (slot<Ref> a@15@01 (- n@46@01 1)) (slot<Ref> a@15@01 n@46@01))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(pop) ; 8
(push) ; 8
; [eval] !(i < |slot(a, n - 1).val|)
; [eval] i < |slot(a, n - 1).val|
; [eval] |slot(a, n - 1).val|
; [eval] slot(a, n - 1)
; [eval] n - 1
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r (slot<Ref> a@15@01 (- n@46@01 1)))
      (=
        ($FVF.lookup_val (as sm@73@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@71@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@73@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@71@01  $FVF<val>) r))
    :qid |qp.fvfValDef19|))
  (forall ((r $Ref)) (!
    (=>
      (= r (slot<Ref> a@15@01 n@46@01))
      (=
        ($FVF.lookup_val (as sm@73@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@72@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@73@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@72@01  $FVF<val>) r))
    :qid |qp.fvfValDef20|))))
(push) ; 9
(assert (not (<
  $Perm.No
  (+
    (ite
      (= (slot<Ref> a@15@01 (- n@46@01 1)) (slot<Ref> a@15@01 (- n@46@01 1)))
      (/ (to_real 1) (to_real 2))
      $Perm.No)
    (ite
      (= (slot<Ref> a@15@01 (- n@46@01 1)) (slot<Ref> a@15@01 n@46@01))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(pop) ; 8
; Loop head block: Follow loop-internal edges
; [eval] i < |slot(a, n - 1).val|
; [eval] |slot(a, n - 1).val|
; [eval] slot(a, n - 1)
; [eval] n - 1
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r (slot<Ref> a@15@01 (- n@46@01 1)))
      (=
        ($FVF.lookup_val (as sm@73@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@71@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@73@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@71@01  $FVF<val>) r))
    :qid |qp.fvfValDef19|))
  (forall ((r $Ref)) (!
    (=>
      (= r (slot<Ref> a@15@01 n@46@01))
      (=
        ($FVF.lookup_val (as sm@73@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@72@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@73@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@72@01  $FVF<val>) r))
    :qid |qp.fvfValDef20|))))
(push) ; 8
(assert (not (<
  $Perm.No
  (+
    (ite
      (= (slot<Ref> a@15@01 (- n@46@01 1)) (slot<Ref> a@15@01 (- n@46@01 1)))
      (/ (to_real 1) (to_real 2))
      $Perm.No)
    (ite
      (= (slot<Ref> a@15@01 (- n@46@01 1)) (slot<Ref> a@15@01 n@46@01))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(push) ; 8
(set-option :timeout 10)
(assert (not (not
  (<
    i@69@01
    (Seq_length
      ($FVF.lookup_val (as sm@73@01  $FVF<val>) (slot<Ref> a@15@01 (- n@46@01 1))))))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (<
  i@69@01
  (Seq_length
    ($FVF.lookup_val (as sm@73@01  $FVF<val>) (slot<Ref> a@15@01 (- n@46@01 1)))))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 33 | i@69@01 < |Lookup(val, sm@73@01, slot[Ref](a@15@01, n@46@01 - 1))| | live]
; [else-branch: 33 | !(i@69@01 < |Lookup(val, sm@73@01, slot[Ref](a@15@01, n@46@01 - 1))|) | live]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 33 | i@69@01 < |Lookup(val, sm@73@01, slot[Ref](a@15@01, n@46@01 - 1))|]
(assert (<
  i@69@01
  (Seq_length
    ($FVF.lookup_val (as sm@73@01  $FVF<val>) (slot<Ref> a@15@01 (- n@46@01 1))))))
; [exec]
; var oldSoln: Seq[Int]
(declare-const oldSoln@87@01 Seq<Int>)
; [exec]
; var soln: Seq[Int]
(declare-const soln@88@01 Seq<Int>)
; [exec]
; oldSoln := slot(a, n - 1).val[i]
; [eval] slot(a, n - 1).val[i]
; [eval] slot(a, n - 1)
; [eval] n - 1
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r (slot<Ref> a@15@01 (- n@46@01 1)))
      (=
        ($FVF.lookup_val (as sm@73@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@71@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@73@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@71@01  $FVF<val>) r))
    :qid |qp.fvfValDef19|))
  (forall ((r $Ref)) (!
    (=>
      (= r (slot<Ref> a@15@01 n@46@01))
      (=
        ($FVF.lookup_val (as sm@73@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@72@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@73@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@72@01  $FVF<val>) r))
    :qid |qp.fvfValDef20|))))
(push) ; 9
(assert (not (<
  $Perm.No
  (+
    (ite
      (= (slot<Ref> a@15@01 (- n@46@01 1)) (slot<Ref> a@15@01 (- n@46@01 1)))
      (/ (to_real 1) (to_real 2))
      $Perm.No)
    (ite
      (= (slot<Ref> a@15@01 (- n@46@01 1)) (slot<Ref> a@15@01 n@46@01))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(push) ; 9
(assert (not (>= i@69@01 0)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(declare-const oldSoln@89@01 Seq<Int>)
(assert (=
  oldSoln@89@01
  (Seq_index
    ($FVF.lookup_val (as sm@73@01  $FVF<val>) (slot<Ref> a@15@01 (- n@46@01 1)))
    i@69@01)))
; [eval] oldSoln[0] == 0
; [eval] oldSoln[0]
(push) ; 9
(assert (not (< 0 (Seq_length oldSoln@89@01))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(push) ; 9
(set-option :timeout 10)
(assert (not (not (= (Seq_index oldSoln@89@01 0) 0))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (= (Seq_index oldSoln@89@01 0) 0)))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [then-branch: 34 | oldSoln@89@01[0] == 0 | live]
; [else-branch: 34 | oldSoln@89@01[0] != 0 | live]
(set-option :timeout 0)
(push) ; 9
; [then-branch: 34 | oldSoln@89@01[0] == 0]
(assert (= (Seq_index oldSoln@89@01 0) 0))
; [exec]
; soln := oldSoln[1 := oldSoln[1] + 1]
; [eval] oldSoln[1 := oldSoln[1] + 1]
; [eval] oldSoln[1] + 1
; [eval] oldSoln[1]
(push) ; 10
(assert (not (< 1 (Seq_length oldSoln@89@01))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(push) ; 10
(assert (not (< 1 (Seq_length oldSoln@89@01))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(declare-const soln@90@01 Seq<Int>)
(assert (=
  soln@90@01
  (Seq_append
    (Seq_take oldSoln@89@01 1)
    (Seq_append
      (Seq_singleton (+ (Seq_index oldSoln@89@01 1) 1))
      (Seq_drop oldSoln@89@01 2)))))
; [exec]
; assert valid(soln, n, true)
; [eval] valid(soln, n, true)
(push) ; 10
(assert (valid%precondition $Snap.unit soln@90@01 n@46@01 true))
(pop) ; 10
; Joined path conditions
(assert (valid%precondition $Snap.unit soln@90@01 n@46@01 true))
(push) ; 10
(assert (not (valid $Snap.unit soln@90@01 n@46@01 true)))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(assert (valid $Snap.unit soln@90@01 n@46@01 true))
; [exec]
; slot(a, n).val := slot(a, n).val ++ Seq(soln)
; [eval] slot(a, n)
; [eval] slot(a, n).val ++ Seq(soln)
; [eval] slot(a, n)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r (slot<Ref> a@15@01 (- n@46@01 1)))
      (=
        ($FVF.lookup_val (as sm@73@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@71@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@73@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@71@01  $FVF<val>) r))
    :qid |qp.fvfValDef19|))
  (forall ((r $Ref)) (!
    (=>
      (= r (slot<Ref> a@15@01 n@46@01))
      (=
        ($FVF.lookup_val (as sm@73@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@72@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@73@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@72@01  $FVF<val>) r))
    :qid |qp.fvfValDef20|))))
(push) ; 10
(assert (not (<
  $Perm.No
  (+
    (ite
      (= (slot<Ref> a@15@01 n@46@01) (slot<Ref> a@15@01 (- n@46@01 1)))
      (/ (to_real 1) (to_real 2))
      $Perm.No)
    (ite
      (= (slot<Ref> a@15@01 n@46@01) (slot<Ref> a@15@01 n@46@01))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; [eval] Seq(soln)
(assert (= (Seq_length (Seq_singleton soln@90@01)) 1))
; Precomputing data for removing quantified permissions
(define-fun pTaken@91@01 ((r $Ref)) $Perm
  (ite
    (= r (slot<Ref> a@15@01 n@46@01))
    ($Perm.min
      (ite (= r (slot<Ref> a@15@01 n@46@01)) $Perm.Write $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@92@01 ((r $Ref)) $Perm
  (ite
    (= r (slot<Ref> a@15@01 n@46@01))
    ($Perm.min
      (ite
        (= r (slot<Ref> a@15@01 (- n@46@01 1)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (- $Perm.Write (pTaken@91@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 500)
(assert (not (=
  (-
    (ite
      (= (slot<Ref> a@15@01 n@46@01) (slot<Ref> a@15@01 n@46@01))
      $Perm.Write
      $Perm.No)
    (pTaken@91@01 (slot<Ref> a@15@01 n@46@01)))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 n@46@01))
    (= (- $Perm.Write (pTaken@91@01 r)) $Perm.No))
  
  :qid |quant-u-59|))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@93@01 $FVF<val>)
; Definitional axioms for singleton-FVF's value
(assert (=
  ($FVF.lookup_val (as sm@93@01  $FVF<val>) (slot<Ref> a@15@01 n@46@01))
  (Seq_append
    ($FVF.lookup_val (as sm@73@01  $FVF<val>) (slot<Ref> a@15@01 n@46@01))
    (Seq_singleton soln@90@01))))
; [exec]
; i := i + 1
; [eval] i + 1
(declare-const i@94@01 Int)
(assert (= i@94@01 (+ i@69@01 1)))
; Loop head block: Re-establish invariant
; [eval] slot(a, n - 1)
; [eval] n - 1
; Precomputing data for removing quantified permissions
(define-fun pTaken@95@01 ((r $Ref)) $Perm
  (ite
    (= r (slot<Ref> a@15@01 (- n@46@01 1)))
    ($Perm.min
      (ite
        (= r (slot<Ref> a@15@01 (- n@46@01 1)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
(define-fun pTaken@96@01 ((r $Ref)) $Perm
  (ite
    (= r (slot<Ref> a@15@01 (- n@46@01 1)))
    ($Perm.min
      (ite (= r (slot<Ref> a@15@01 n@46@01)) $Perm.Write $Perm.No)
      (- (/ (to_real 1) (to_real 2)) (pTaken@95@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 500)
(assert (not (=
  (-
    (ite
      (= (slot<Ref> a@15@01 (- n@46@01 1)) (slot<Ref> a@15@01 (- n@46@01 1)))
      (/ (to_real 1) (to_real 2))
      $Perm.No)
    (pTaken@95@01 (slot<Ref> a@15@01 (- n@46@01 1))))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 (- n@46@01 1)))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@95@01 r)) $Perm.No))
  
  :qid |quant-u-62|))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@97@01 $FVF<val>)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (= (slot<Ref> a@15@01 (- n@46@01 1)) (slot<Ref> a@15@01 n@46@01))
  (=
    ($FVF.lookup_val (as sm@97@01  $FVF<val>) (slot<Ref> a@15@01 (- n@46@01 1)))
    ($FVF.lookup_val (as sm@93@01  $FVF<val>) (slot<Ref> a@15@01 (- n@46@01 1))))))
(assert (=>
  (= (slot<Ref> a@15@01 (- n@46@01 1)) (slot<Ref> a@15@01 (- n@46@01 1)))
  (=
    ($FVF.lookup_val (as sm@97@01  $FVF<val>) (slot<Ref> a@15@01 (- n@46@01 1)))
    ($FVF.lookup_val (as sm@71@01  $FVF<val>) (slot<Ref> a@15@01 (- n@46@01 1))))))
; [eval] len(a) == 51
; [eval] len(a)
; [eval] 0 <= i
(set-option :timeout 0)
(push) ; 10
(assert (not (<= 0 i@94@01)))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 i@94@01))
; [eval] i <= |slot(a, n - 1).val|
; [eval] |slot(a, n - 1).val|
; [eval] slot(a, n - 1)
; [eval] n - 1
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r (slot<Ref> a@15@01 n@46@01))
      (=
        ($FVF.lookup_val (as sm@97@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@93@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@97@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@93@01  $FVF<val>) r))
    :qid |qp.fvfValDef26|))
  (forall ((r $Ref)) (!
    (=>
      (= r (slot<Ref> a@15@01 (- n@46@01 1)))
      (=
        ($FVF.lookup_val (as sm@97@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@71@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@97@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@71@01  $FVF<val>) r))
    :qid |qp.fvfValDef27|))))
(push) ; 10
(assert (not (<
  $Perm.No
  (+
    (ite
      (= (slot<Ref> a@15@01 (- n@46@01 1)) (slot<Ref> a@15@01 n@46@01))
      $Perm.Write
      $Perm.No)
    (ite
      (= (slot<Ref> a@15@01 (- n@46@01 1)) (slot<Ref> a@15@01 (- n@46@01 1)))
      (/ (to_real 1) (to_real 2))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(push) ; 10
(assert (not (<=
  i@94@01
  (Seq_length
    ($FVF.lookup_val (as sm@97@01  $FVF<val>) (slot<Ref> a@15@01 (- n@46@01 1)))))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(assert (<=
  i@94@01
  (Seq_length
    ($FVF.lookup_val (as sm@97@01  $FVF<val>) (slot<Ref> a@15@01 (- n@46@01 1))))))
; [eval] slot(a, n)
; Precomputing data for removing quantified permissions
(define-fun pTaken@98@01 ((r $Ref)) $Perm
  (ite
    (= r (slot<Ref> a@15@01 n@46@01))
    ($Perm.min
      (ite (= r (slot<Ref> a@15@01 n@46@01)) $Perm.Write $Perm.No)
      $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Chunk depleted?
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 500)
(assert (not (=
  (-
    (ite
      (= (slot<Ref> a@15@01 n@46@01) (slot<Ref> a@15@01 n@46@01))
      $Perm.Write
      $Perm.No)
    (pTaken@98@01 (slot<Ref> a@15@01 n@46@01)))
  $Perm.No)))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 10
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (slot<Ref> a@15@01 n@46@01))
    (= (- $Perm.Write (pTaken@98@01 r)) $Perm.No))
  
  :qid |quant-u-65|))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@99@01 $FVF<val>)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (= (slot<Ref> a@15@01 n@46@01) (slot<Ref> a@15@01 n@46@01))
  (=
    ($FVF.lookup_val (as sm@99@01  $FVF<val>) (slot<Ref> a@15@01 n@46@01))
    ($FVF.lookup_val (as sm@93@01  $FVF<val>) (slot<Ref> a@15@01 n@46@01)))))
; [eval] |slot(a, n).val| == i
; [eval] |slot(a, n).val|
; [eval] slot(a, n)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r (slot<Ref> a@15@01 n@46@01))
      (=
        ($FVF.lookup_val (as sm@97@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@93@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@97@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@93@01  $FVF<val>) r))
    :qid |qp.fvfValDef26|))
  (forall ((r $Ref)) (!
    (=>
      (= r (slot<Ref> a@15@01 (- n@46@01 1)))
      (=
        ($FVF.lookup_val (as sm@97@01  $FVF<val>) r)
        ($FVF.lookup_val (as sm@71@01  $FVF<val>) r)))
    :pattern (($FVF.lookup_val (as sm@97@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val (as sm@71@01  $FVF<val>) r))
    :qid |qp.fvfValDef27|))))
(set-option :timeout 0)
(push) ; 10
(assert (not (<
  $Perm.No
  (+
    (ite
      (= (slot<Ref> a@15@01 n@46@01) (slot<Ref> a@15@01 n@46@01))
      $Perm.Write
      $Perm.No)
    (ite
      (= (slot<Ref> a@15@01 n@46@01) (slot<Ref> a@15@01 (- n@46@01 1)))
      (/ (to_real 1) (to_real 2))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(push) ; 10
(assert (not (=
  (Seq_length
    ($FVF.lookup_val (as sm@97@01  $FVF<val>) (slot<Ref> a@15@01 n@46@01)))
  i@94@01)))
(check-sat)
; unsat
(pop) ; 10
; 0,00s
; (get-info :all-statistics)
(assert (=
  (Seq_length
    ($FVF.lookup_val (as sm@97@01  $FVF<val>) (slot<Ref> a@15@01 n@46@01)))
  i@94@01))
; [eval] (forall j: Int, n1: Int :: { slot(a, n1).val[j] } n1 == n - 1 && (0 <= j && j < |slot(a, n - 1).val|) ==> valid(slot(a, n1).val[j], n - 1, true))
(declare-const j@100@01 Int)
(declare-const n1@101@01 Int)
(push) ; 10
; [eval] n1 == n - 1 && (0 <= j && j < |slot(a, n - 1).val|) ==> valid(slot(a, n1).val[j], n - 1, true)
; [eval] n1 == n - 1 && (0 <= j && j < |slot(a, n - 1).val|)
; [eval] n1 == n - 1
; [eval] n - 1
(push) ; 11
; [then-branch: 35 | n1@101@01 != n@46@01 - 1 | live]
; [else-branch: 35 | n1@101@01 == n@46@01 - 1 | live]
(push) ; 12
; [then-branch: 35 | n1@101@01 != n@46@01 - 1]
(assert (not (= n1@101@01 (- n@46@01 1))))
(pop) ; 12
(push) ; 12
; [else-branch: 35 | n1@101@01 == n@46@01 - 1]
(assert (= n1@101@01 (- n@46@01 1)))
; [eval] 0 <= j
(push) ; 13
; [then-branch: 36 | !(0 <= j@100@01) | live]
; [else-branch: 36 | 0 <= j@100@01 | live]
(push) ; 14
; ---------- colourings2 ----------
(declare-const a@102@01 Array_)
; ---------- colourings ----------
