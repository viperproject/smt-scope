(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:21:29
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/quantifiedpermissions/third_party/shift.vpr
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
(declare-sort Set<$Ref> 0)
(declare-sort Set<$Snap> 0)
(declare-sort $FVF<Integer_value> 0)
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
(declare-fun $SortWrappers.$FVF<Integer_value>To$Snap ($FVF<Integer_value>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<Integer_value> ($Snap) $FVF<Integer_value>)
(assert (forall ((x $FVF<Integer_value>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<Integer_value>($SortWrappers.$FVF<Integer_value>To$Snap x)))
    :pattern (($SortWrappers.$FVF<Integer_value>To$Snap x))
    :qid |$Snap.$SnapTo$FVF<Integer_value>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$FVF<Integer_value>To$Snap($SortWrappers.$SnapTo$FVF<Integer_value> x)))
    :pattern (($SortWrappers.$SnapTo$FVF<Integer_value> x))
    :qid |$Snap.$FVF<Integer_value>To$SnapTo$FVF<Integer_value>|
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
; /field_value_functions_declarations.smt2 [Integer_value: Int]
(declare-fun $FVF.domain_Integer_value ($FVF<Integer_value>) Set<$Ref>)
(declare-fun $FVF.lookup_Integer_value ($FVF<Integer_value> $Ref) Int)
(declare-fun $FVF.after_Integer_value ($FVF<Integer_value> $FVF<Integer_value>) Bool)
(declare-fun $FVF.loc_Integer_value (Int $Ref) Bool)
(declare-fun $FVF.perm_Integer_value ($FPM $Ref) $Perm)
(declare-const $fvfTOP_Integer_value $FVF<Integer_value>)
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
; /field_value_functions_axioms.smt2 [Integer_value: Int]
(assert (forall ((vs $FVF<Integer_value>) (ws $FVF<Integer_value>)) (!
    (=>
      (and
        (Set_equal ($FVF.domain_Integer_value vs) ($FVF.domain_Integer_value ws))
        (forall ((x $Ref)) (!
          (=>
            (Set_in x ($FVF.domain_Integer_value vs))
            (= ($FVF.lookup_Integer_value vs x) ($FVF.lookup_Integer_value ws x)))
          :pattern (($FVF.lookup_Integer_value vs x) ($FVF.lookup_Integer_value ws x))
          :qid |qp.$FVF<Integer_value>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<Integer_value>To$Snap vs)
              ($SortWrappers.$FVF<Integer_value>To$Snap ws)
              )
    :qid |qp.$FVF<Integer_value>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_Integer_value pm r))
    :pattern (($FVF.perm_Integer_value pm r)))))
(assert (forall ((r $Ref) (f Int)) (!
    (= ($FVF.loc_Integer_value f r) true)
    :pattern (($FVF.loc_Integer_value f r)))))
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
(declare-const len@0@01 Int)
(declare-const ar@1@01 Seq<$Ref>)
(declare-const len@2@01 Int)
(declare-const ar@3@01 Seq<$Ref>)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@4@01 $Snap)
(assert (= $t@4@01 ($Snap.combine ($Snap.first $t@4@01) ($Snap.second $t@4@01))))
(assert (= ($Snap.first $t@4@01) $Snap.unit))
; [eval] |ar| == len
; [eval] |ar|
(assert (= (Seq_length ar@3@01) len@2@01))
(assert (=
  ($Snap.second $t@4@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@4@01))
    ($Snap.second ($Snap.second $t@4@01)))))
(assert (= ($Snap.first ($Snap.second $t@4@01)) $Snap.unit))
; [eval] (forall i: Int, j: Int :: { ar[i], ar[j] } 0 <= i && (i < |ar| && (0 <= j && (j < |ar| && i != j))) ==> ar[i] != ar[j])
(declare-const i@5@01 Int)
(declare-const j@6@01 Int)
(push) ; 2
; [eval] 0 <= i && (i < |ar| && (0 <= j && (j < |ar| && i != j))) ==> ar[i] != ar[j]
; [eval] 0 <= i && (i < |ar| && (0 <= j && (j < |ar| && i != j)))
; [eval] 0 <= i
(push) ; 3
; [then-branch: 0 | !(0 <= i@5@01) | live]
; [else-branch: 0 | 0 <= i@5@01 | live]
(push) ; 4
; [then-branch: 0 | !(0 <= i@5@01)]
(assert (not (<= 0 i@5@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | 0 <= i@5@01]
(assert (<= 0 i@5@01))
; [eval] i < |ar|
; [eval] |ar|
(push) ; 5
; [then-branch: 1 | !(i@5@01 < |ar@3@01|) | live]
; [else-branch: 1 | i@5@01 < |ar@3@01| | live]
(push) ; 6
; [then-branch: 1 | !(i@5@01 < |ar@3@01|)]
(assert (not (< i@5@01 (Seq_length ar@3@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 1 | i@5@01 < |ar@3@01|]
(assert (< i@5@01 (Seq_length ar@3@01)))
; [eval] 0 <= j
(push) ; 7
; [then-branch: 2 | !(0 <= j@6@01) | live]
; [else-branch: 2 | 0 <= j@6@01 | live]
(push) ; 8
; [then-branch: 2 | !(0 <= j@6@01)]
(assert (not (<= 0 j@6@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 2 | 0 <= j@6@01]
(assert (<= 0 j@6@01))
; [eval] j < |ar|
; [eval] |ar|
(push) ; 9
; [then-branch: 3 | !(j@6@01 < |ar@3@01|) | live]
; [else-branch: 3 | j@6@01 < |ar@3@01| | live]
(push) ; 10
; [then-branch: 3 | !(j@6@01 < |ar@3@01|)]
(assert (not (< j@6@01 (Seq_length ar@3@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 3 | j@6@01 < |ar@3@01|]
(assert (< j@6@01 (Seq_length ar@3@01)))
; [eval] i != j
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< j@6@01 (Seq_length ar@3@01)) (not (< j@6@01 (Seq_length ar@3@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j@6@01)
  (and
    (<= 0 j@6@01)
    (or (< j@6@01 (Seq_length ar@3@01)) (not (< j@6@01 (Seq_length ar@3@01)))))))
(assert (or (<= 0 j@6@01) (not (<= 0 j@6@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i@5@01 (Seq_length ar@3@01))
  (and
    (< i@5@01 (Seq_length ar@3@01))
    (=>
      (<= 0 j@6@01)
      (and
        (<= 0 j@6@01)
        (or
          (< j@6@01 (Seq_length ar@3@01))
          (not (< j@6@01 (Seq_length ar@3@01))))))
    (or (<= 0 j@6@01) (not (<= 0 j@6@01))))))
(assert (or (< i@5@01 (Seq_length ar@3@01)) (not (< i@5@01 (Seq_length ar@3@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i@5@01)
  (and
    (<= 0 i@5@01)
    (=>
      (< i@5@01 (Seq_length ar@3@01))
      (and
        (< i@5@01 (Seq_length ar@3@01))
        (=>
          (<= 0 j@6@01)
          (and
            (<= 0 j@6@01)
            (or
              (< j@6@01 (Seq_length ar@3@01))
              (not (< j@6@01 (Seq_length ar@3@01))))))
        (or (<= 0 j@6@01) (not (<= 0 j@6@01)))))
    (or (< i@5@01 (Seq_length ar@3@01)) (not (< i@5@01 (Seq_length ar@3@01)))))))
(assert (or (<= 0 i@5@01) (not (<= 0 i@5@01))))
(push) ; 3
; [then-branch: 4 | 0 <= i@5@01 && i@5@01 < |ar@3@01| && 0 <= j@6@01 && j@6@01 < |ar@3@01| && i@5@01 != j@6@01 | live]
; [else-branch: 4 | !(0 <= i@5@01 && i@5@01 < |ar@3@01| && 0 <= j@6@01 && j@6@01 < |ar@3@01| && i@5@01 != j@6@01) | live]
(push) ; 4
; [then-branch: 4 | 0 <= i@5@01 && i@5@01 < |ar@3@01| && 0 <= j@6@01 && j@6@01 < |ar@3@01| && i@5@01 != j@6@01]
(assert (and
  (<= 0 i@5@01)
  (and
    (< i@5@01 (Seq_length ar@3@01))
    (and
      (<= 0 j@6@01)
      (and (< j@6@01 (Seq_length ar@3@01)) (not (= i@5@01 j@6@01)))))))
; [eval] ar[i] != ar[j]
; [eval] ar[i]
(push) ; 5
(assert (not (>= i@5@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] ar[j]
(push) ; 5
(assert (not (>= j@6@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 4 | !(0 <= i@5@01 && i@5@01 < |ar@3@01| && 0 <= j@6@01 && j@6@01 < |ar@3@01| && i@5@01 != j@6@01)]
(assert (not
  (and
    (<= 0 i@5@01)
    (and
      (< i@5@01 (Seq_length ar@3@01))
      (and
        (<= 0 j@6@01)
        (and (< j@6@01 (Seq_length ar@3@01)) (not (= i@5@01 j@6@01))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (<= 0 i@5@01)
    (and
      (< i@5@01 (Seq_length ar@3@01))
      (and
        (<= 0 j@6@01)
        (and (< j@6@01 (Seq_length ar@3@01)) (not (= i@5@01 j@6@01))))))
  (and
    (<= 0 i@5@01)
    (< i@5@01 (Seq_length ar@3@01))
    (<= 0 j@6@01)
    (< j@6@01 (Seq_length ar@3@01))
    (not (= i@5@01 j@6@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i@5@01)
      (and
        (< i@5@01 (Seq_length ar@3@01))
        (and
          (<= 0 j@6@01)
          (and (< j@6@01 (Seq_length ar@3@01)) (not (= i@5@01 j@6@01)))))))
  (and
    (<= 0 i@5@01)
    (and
      (< i@5@01 (Seq_length ar@3@01))
      (and
        (<= 0 j@6@01)
        (and (< j@6@01 (Seq_length ar@3@01)) (not (= i@5@01 j@6@01))))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@5@01 Int) (j@6@01 Int)) (!
  (and
    (=>
      (<= 0 i@5@01)
      (and
        (<= 0 i@5@01)
        (=>
          (< i@5@01 (Seq_length ar@3@01))
          (and
            (< i@5@01 (Seq_length ar@3@01))
            (=>
              (<= 0 j@6@01)
              (and
                (<= 0 j@6@01)
                (or
                  (< j@6@01 (Seq_length ar@3@01))
                  (not (< j@6@01 (Seq_length ar@3@01))))))
            (or (<= 0 j@6@01) (not (<= 0 j@6@01)))))
        (or
          (< i@5@01 (Seq_length ar@3@01))
          (not (< i@5@01 (Seq_length ar@3@01))))))
    (or (<= 0 i@5@01) (not (<= 0 i@5@01)))
    (=>
      (and
        (<= 0 i@5@01)
        (and
          (< i@5@01 (Seq_length ar@3@01))
          (and
            (<= 0 j@6@01)
            (and (< j@6@01 (Seq_length ar@3@01)) (not (= i@5@01 j@6@01))))))
      (and
        (<= 0 i@5@01)
        (< i@5@01 (Seq_length ar@3@01))
        (<= 0 j@6@01)
        (< j@6@01 (Seq_length ar@3@01))
        (not (= i@5@01 j@6@01))))
    (or
      (not
        (and
          (<= 0 i@5@01)
          (and
            (< i@5@01 (Seq_length ar@3@01))
            (and
              (<= 0 j@6@01)
              (and (< j@6@01 (Seq_length ar@3@01)) (not (= i@5@01 j@6@01)))))))
      (and
        (<= 0 i@5@01)
        (and
          (< i@5@01 (Seq_length ar@3@01))
          (and
            (<= 0 j@6@01)
            (and (< j@6@01 (Seq_length ar@3@01)) (not (= i@5@01 j@6@01))))))))
  :pattern ((Seq_index ar@3@01 i@5@01) (Seq_index ar@3@01 j@6@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/shift.vpr@13@12@13@106-aux|)))
(assert (forall ((i@5@01 Int) (j@6@01 Int)) (!
  (=>
    (and
      (<= 0 i@5@01)
      (and
        (< i@5@01 (Seq_length ar@3@01))
        (and
          (<= 0 j@6@01)
          (and (< j@6@01 (Seq_length ar@3@01)) (not (= i@5@01 j@6@01))))))
    (not (= (Seq_index ar@3@01 i@5@01) (Seq_index ar@3@01 j@6@01))))
  :pattern ((Seq_index ar@3@01 i@5@01) (Seq_index ar@3@01 j@6@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/shift.vpr@13@12@13@106|)))
(assert (=
  ($Snap.second ($Snap.second $t@4@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))
(declare-const i@7@01 Int)
(push) ; 2
; [eval] (i in [0..len))
; [eval] [0..len)
(assert (Seq_contains (Seq_range 0 len@2@01) i@7@01))
; [eval] ar[i]
(push) ; 3
(assert (not (>= i@7@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@7@01 (Seq_length ar@3@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@8@01 ($Ref) Int)
(declare-fun img@9@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@7@01 Int) (i2@7@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 len@2@01) i1@7@01)
      (Seq_contains (Seq_range 0 len@2@01) i2@7@01)
      (= (Seq_index ar@3@01 i1@7@01) (Seq_index ar@3@01 i2@7@01)))
    (= i1@7@01 i2@7@01))
  
  :qid |Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@7@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 len@2@01) i@7@01)
    (and
      (= (inv@8@01 (Seq_index ar@3@01 i@7@01)) i@7@01)
      (img@9@01 (Seq_index ar@3@01 i@7@01))))
  :pattern ((Seq_index ar@3@01 i@7@01))
  :qid |quant-u-1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@9@01 r) (Seq_contains (Seq_range 0 len@2@01) (inv@8@01 r)))
    (= (Seq_index ar@3@01 (inv@8@01 r)) r))
  :pattern ((inv@8@01 r))
  :qid |Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@7@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 len@2@01) i@7@01)
    (not (= (Seq_index ar@3@01 i@7@01) $Ref.null)))
  :pattern ((Seq_index ar@3@01 i@7@01))
  :qid |Integer_value-permImpliesNonNull|)))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@4@01))) $Snap.unit))
; [eval] (forall i: Int :: { ar[i] } 0 <= i && i < len ==> ar[i].Integer_value == 0)
(declare-const i@10@01 Int)
(push) ; 2
; [eval] 0 <= i && i < len ==> ar[i].Integer_value == 0
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 3
; [then-branch: 5 | !(0 <= i@10@01) | live]
; [else-branch: 5 | 0 <= i@10@01 | live]
(push) ; 4
; [then-branch: 5 | !(0 <= i@10@01)]
(assert (not (<= 0 i@10@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 5 | 0 <= i@10@01]
(assert (<= 0 i@10@01))
; [eval] i < len
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@10@01) (not (<= 0 i@10@01))))
(push) ; 3
; [then-branch: 6 | 0 <= i@10@01 && i@10@01 < len@2@01 | live]
; [else-branch: 6 | !(0 <= i@10@01 && i@10@01 < len@2@01) | live]
(push) ; 4
; [then-branch: 6 | 0 <= i@10@01 && i@10@01 < len@2@01]
(assert (and (<= 0 i@10@01) (< i@10@01 len@2@01)))
; [eval] ar[i].Integer_value == 0
; [eval] ar[i]
(push) ; 5
(assert (not (>= i@10@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@10@01 (Seq_length ar@3@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (and
  (img@9@01 (Seq_index ar@3@01 i@10@01))
  (Seq_contains (Seq_range 0 len@2@01) (inv@8@01 (Seq_index ar@3@01 i@10@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 6 | !(0 <= i@10@01 && i@10@01 < len@2@01)]
(assert (not (and (<= 0 i@10@01) (< i@10@01 len@2@01))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (<= 0 i@10@01) (< i@10@01 len@2@01)))
  (and (<= 0 i@10@01) (< i@10@01 len@2@01))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@10@01 Int)) (!
  (and
    (or (<= 0 i@10@01) (not (<= 0 i@10@01)))
    (or
      (not (and (<= 0 i@10@01) (< i@10@01 len@2@01)))
      (and (<= 0 i@10@01) (< i@10@01 len@2@01))))
  :pattern ((Seq_index ar@3@01 i@10@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/shift.vpr@15@13@15@82-aux|)))
(assert (forall ((i@10@01 Int)) (!
  (=>
    (and (<= 0 i@10@01) (< i@10@01 len@2@01))
    (=
      ($FVF.lookup_Integer_value ($SortWrappers.$SnapTo$FVF<Integer_value> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) (Seq_index
        ar@3@01
        i@10@01))
      0))
  :pattern ((Seq_index ar@3@01 i@10@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/shift.vpr@15@13@15@82|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert (forall i: Int ::
;     { ar[i] }
;     1 <= i && i < len ==> ar[i].Integer_value == 0)
; [eval] (forall i: Int :: { ar[i] } 1 <= i && i < len ==> ar[i].Integer_value == 0)
(declare-const i@11@01 Int)
(push) ; 3
; [eval] 1 <= i && i < len ==> ar[i].Integer_value == 0
; [eval] 1 <= i && i < len
; [eval] 1 <= i
(push) ; 4
; [then-branch: 7 | !(1 <= i@11@01) | live]
; [else-branch: 7 | 1 <= i@11@01 | live]
(push) ; 5
; [then-branch: 7 | !(1 <= i@11@01)]
(assert (not (<= 1 i@11@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 7 | 1 <= i@11@01]
(assert (<= 1 i@11@01))
; [eval] i < len
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 1 i@11@01) (not (<= 1 i@11@01))))
(push) ; 4
; [then-branch: 8 | 1 <= i@11@01 && i@11@01 < len@2@01 | live]
; [else-branch: 8 | !(1 <= i@11@01 && i@11@01 < len@2@01) | live]
(push) ; 5
; [then-branch: 8 | 1 <= i@11@01 && i@11@01 < len@2@01]
(assert (and (<= 1 i@11@01) (< i@11@01 len@2@01)))
; [eval] ar[i].Integer_value == 0
; [eval] ar[i]
(push) ; 6
(assert (not (>= i@11@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@11@01 (Seq_length ar@3@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (and
  (img@9@01 (Seq_index ar@3@01 i@11@01))
  (Seq_contains (Seq_range 0 len@2@01) (inv@8@01 (Seq_index ar@3@01 i@11@01))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 8 | !(1 <= i@11@01 && i@11@01 < len@2@01)]
(assert (not (and (<= 1 i@11@01) (< i@11@01 len@2@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (<= 1 i@11@01) (< i@11@01 len@2@01)))
  (and (<= 1 i@11@01) (< i@11@01 len@2@01))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@11@01 Int)) (!
  (and
    (or (<= 1 i@11@01) (not (<= 1 i@11@01)))
    (or
      (not (and (<= 1 i@11@01) (< i@11@01 len@2@01)))
      (and (<= 1 i@11@01) (< i@11@01 len@2@01))))
  :pattern ((Seq_index ar@3@01 i@11@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/shift.vpr@17@11@17@80-aux|)))
(push) ; 3
(assert (not (forall ((i@11@01 Int)) (!
  (=>
    (and (<= 1 i@11@01) (< i@11@01 len@2@01))
    (=
      ($FVF.lookup_Integer_value ($SortWrappers.$SnapTo$FVF<Integer_value> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) (Seq_index
        ar@3@01
        i@11@01))
      0))
  :pattern ((Seq_index ar@3@01 i@11@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/shift.vpr@17@11@17@80|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@11@01 Int)) (!
  (=>
    (and (<= 1 i@11@01) (< i@11@01 len@2@01))
    (=
      ($FVF.lookup_Integer_value ($SortWrappers.$SnapTo$FVF<Integer_value> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) (Seq_index
        ar@3@01
        i@11@01))
      0))
  :pattern ((Seq_index ar@3@01 i@11@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/shift.vpr@17@11@17@80|)))
; [exec]
; assert (forall i: Int, fresh__1: Int ::
;     { (i in [0..fresh__1)) }
;     (i in [0..len - 1)) ==> ar[i + 1].Integer_value == 0)
; [eval] (forall i: Int, fresh__1: Int :: { (i in [0..fresh__1)) } (i in [0..len - 1)) ==> ar[i + 1].Integer_value == 0)
(declare-const i@12@01 Int)
(declare-const fresh__1@13@01 Int)
(push) ; 3
; [eval] (i in [0..len - 1)) ==> ar[i + 1].Integer_value == 0
; [eval] (i in [0..len - 1))
; [eval] [0..len - 1)
; [eval] len - 1
(push) ; 4
; [then-branch: 9 | i@12@01 in [0..len@2@01 - 1] | live]
; [else-branch: 9 | !(i@12@01 in [0..len@2@01 - 1]) | live]
(push) ; 5
; [then-branch: 9 | i@12@01 in [0..len@2@01 - 1]]
(assert (Seq_contains (Seq_range 0 (- len@2@01 1)) i@12@01))
; [eval] ar[i + 1].Integer_value == 0
; [eval] ar[i + 1]
; [eval] i + 1
(push) ; 6
(assert (not (>= (+ i@12@01 1) 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< (+ i@12@01 1) (Seq_length ar@3@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (and
  (img@9@01 (Seq_index ar@3@01 (+ i@12@01 1)))
  (Seq_contains
    (Seq_range 0 len@2@01)
    (inv@8@01 (Seq_index ar@3@01 (+ i@12@01 1)))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 9 | !(i@12@01 in [0..len@2@01 - 1])]
(assert (not (Seq_contains (Seq_range 0 (- len@2@01 1)) i@12@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not (Seq_contains (Seq_range 0 (- len@2@01 1)) i@12@01))
  (Seq_contains (Seq_range 0 (- len@2@01 1)) i@12@01)))
; [eval] (i in [0..fresh__1))
; [eval] [0..fresh__1)
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@12@01 Int) (fresh__1@13@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 (- len@2@01 1)) i@12@01))
    (Seq_contains (Seq_range 0 (- len@2@01 1)) i@12@01))
  :pattern ((Seq_contains (Seq_range 0 fresh__1@13@01) i@12@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 fresh__1@13@01) i@12@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/shift.vpr@18@11@18@80-aux|)))
(assert (forall ((i@12@01 Int) (fresh__1@13@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 (- len@2@01 1)) i@12@01))
    (Seq_contains (Seq_range 0 (- len@2@01 1)) i@12@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 fresh__1@13@01) i@12@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/shift.vpr@18@11@18@80-aux|)))
(push) ; 3
(assert (not (forall ((i@12@01 Int) (fresh__1@13@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (- len@2@01 1)) i@12@01)
    (=
      ($FVF.lookup_Integer_value ($SortWrappers.$SnapTo$FVF<Integer_value> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) (Seq_index
        ar@3@01
        (+ i@12@01 1)))
      0))
  :pattern ((Seq_contains (Seq_range 0 fresh__1@13@01) i@12@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 fresh__1@13@01) i@12@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 fresh__1@13@01) i@12@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/shift.vpr@18@11@18@80|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@12@01 Int) (fresh__1@13@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (- len@2@01 1)) i@12@01)
    (=
      ($FVF.lookup_Integer_value ($SortWrappers.$SnapTo$FVF<Integer_value> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) (Seq_index
        ar@3@01
        (+ i@12@01 1)))
      0))
  :pattern ((Seq_contains (Seq_range 0 fresh__1@13@01) i@12@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 fresh__1@13@01) i@12@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/shift.vpr@18@11@18@80|)))
; [exec]
; assert (forall __rw_i1: Int ::
;     { ar[__rw_i1] }
;     true ==>
;     0 <= __rw_i1 - 1 && __rw_i1 - 1 < len - 1 ==>
;     ar[__rw_i1].Integer_value == 0)
; [eval] (forall __rw_i1: Int :: { ar[__rw_i1] } true ==> 0 <= __rw_i1 - 1 && __rw_i1 - 1 < len - 1 ==> ar[__rw_i1].Integer_value == 0)
(declare-const __rw_i1@14@01 Int)
(push) ; 3
; [eval] true ==> 0 <= __rw_i1 - 1 && __rw_i1 - 1 < len - 1 ==> ar[__rw_i1].Integer_value == 0
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 10 | True | live]
; [else-branch: 10 | False | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 10 | True]
; [eval] 0 <= __rw_i1 - 1 && __rw_i1 - 1 < len - 1 ==> ar[__rw_i1].Integer_value == 0
; [eval] 0 <= __rw_i1 - 1 && __rw_i1 - 1 < len - 1
; [eval] 0 <= __rw_i1 - 1
; [eval] __rw_i1 - 1
(push) ; 6
; [then-branch: 11 | !(0 <= __rw_i1@14@01 - 1) | live]
; [else-branch: 11 | 0 <= __rw_i1@14@01 - 1 | live]
(push) ; 7
; [then-branch: 11 | !(0 <= __rw_i1@14@01 - 1)]
(assert (not (<= 0 (- __rw_i1@14@01 1))))
(pop) ; 7
(push) ; 7
; [else-branch: 11 | 0 <= __rw_i1@14@01 - 1]
(assert (<= 0 (- __rw_i1@14@01 1)))
; [eval] __rw_i1 - 1 < len - 1
; [eval] __rw_i1 - 1
; [eval] len - 1
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 (- __rw_i1@14@01 1)) (not (<= 0 (- __rw_i1@14@01 1)))))
(push) ; 6
; [then-branch: 12 | 0 <= __rw_i1@14@01 - 1 && __rw_i1@14@01 - 1 < len@2@01 - 1 | live]
; [else-branch: 12 | !(0 <= __rw_i1@14@01 - 1 && __rw_i1@14@01 - 1 < len@2@01 - 1) | live]
(push) ; 7
; [then-branch: 12 | 0 <= __rw_i1@14@01 - 1 && __rw_i1@14@01 - 1 < len@2@01 - 1]
(assert (and (<= 0 (- __rw_i1@14@01 1)) (< (- __rw_i1@14@01 1) (- len@2@01 1))))
; [eval] ar[__rw_i1].Integer_value == 0
; [eval] ar[__rw_i1]
(push) ; 8
(assert (not (>= __rw_i1@14@01 0)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(push) ; 8
(assert (not (< __rw_i1@14@01 (Seq_length ar@3@01))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(push) ; 8
(assert (not (and
  (img@9@01 (Seq_index ar@3@01 __rw_i1@14@01))
  (Seq_contains
    (Seq_range 0 len@2@01)
    (inv@8@01 (Seq_index ar@3@01 __rw_i1@14@01))))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
(push) ; 7
; [else-branch: 12 | !(0 <= __rw_i1@14@01 - 1 && __rw_i1@14@01 - 1 < len@2@01 - 1)]
(assert (not (and (<= 0 (- __rw_i1@14@01 1)) (< (- __rw_i1@14@01 1) (- len@2@01 1)))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (<= 0 (- __rw_i1@14@01 1)) (< (- __rw_i1@14@01 1) (- len@2@01 1))))
  (and (<= 0 (- __rw_i1@14@01 1)) (< (- __rw_i1@14@01 1) (- len@2@01 1)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (and
  (or (<= 0 (- __rw_i1@14@01 1)) (not (<= 0 (- __rw_i1@14@01 1))))
  (or
    (not (and (<= 0 (- __rw_i1@14@01 1)) (< (- __rw_i1@14@01 1) (- len@2@01 1))))
    (and (<= 0 (- __rw_i1@14@01 1)) (< (- __rw_i1@14@01 1) (- len@2@01 1))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((__rw_i1@14@01 Int)) (!
  (and
    (or (<= 0 (- __rw_i1@14@01 1)) (not (<= 0 (- __rw_i1@14@01 1))))
    (or
      (not
        (and (<= 0 (- __rw_i1@14@01 1)) (< (- __rw_i1@14@01 1) (- len@2@01 1))))
      (and (<= 0 (- __rw_i1@14@01 1)) (< (- __rw_i1@14@01 1) (- len@2@01 1)))))
  :pattern ((Seq_index ar@3@01 __rw_i1@14@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/shift.vpr@19@11@19@86-aux|)))
(push) ; 3
(assert (not (forall ((__rw_i1@14@01 Int)) (!
  (=>
    (and (<= 0 (- __rw_i1@14@01 1)) (< (- __rw_i1@14@01 1) (- len@2@01 1)))
    (=
      ($FVF.lookup_Integer_value ($SortWrappers.$SnapTo$FVF<Integer_value> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) (Seq_index
        ar@3@01
        __rw_i1@14@01))
      0))
  :pattern ((Seq_index ar@3@01 __rw_i1@14@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/shift.vpr@19@11@19@86|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((__rw_i1@14@01 Int)) (!
  (=>
    (and (<= 0 (- __rw_i1@14@01 1)) (< (- __rw_i1@14@01 1) (- len@2@01 1)))
    (=
      ($FVF.lookup_Integer_value ($SortWrappers.$SnapTo$FVF<Integer_value> ($Snap.first ($Snap.second ($Snap.second $t@4@01)))) (Seq_index
        ar@3@01
        __rw_i1@14@01))
      0))
  :pattern ((Seq_index ar@3@01 __rw_i1@14@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/shift.vpr@19@11@19@86|)))
(pop) ; 2
(pop) ; 1
; ---------- test2 ----------
(declare-const len@15@01 Int)
(declare-const ar@16@01 Seq<$Ref>)
(declare-const len@17@01 Int)
(declare-const ar@18@01 Seq<$Ref>)
(push) ; 1
(declare-const $t@19@01 $Snap)
(assert (= $t@19@01 ($Snap.combine ($Snap.first $t@19@01) ($Snap.second $t@19@01))))
(assert (= ($Snap.first $t@19@01) $Snap.unit))
; [eval] |ar| == len
; [eval] |ar|
(assert (= (Seq_length ar@18@01) len@17@01))
(assert (=
  ($Snap.second $t@19@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@19@01))
    ($Snap.second ($Snap.second $t@19@01)))))
(assert (= ($Snap.first ($Snap.second $t@19@01)) $Snap.unit))
; [eval] (forall i: Int, j: Int :: { ar[i], ar[j] } 0 <= i && (i < |ar| && (0 <= j && (j < |ar| && i != j))) ==> ar[i] != ar[j])
(declare-const i@20@01 Int)
(declare-const j@21@01 Int)
(push) ; 2
; [eval] 0 <= i && (i < |ar| && (0 <= j && (j < |ar| && i != j))) ==> ar[i] != ar[j]
; [eval] 0 <= i && (i < |ar| && (0 <= j && (j < |ar| && i != j)))
; [eval] 0 <= i
(push) ; 3
; [then-branch: 13 | !(0 <= i@20@01) | live]
; [else-branch: 13 | 0 <= i@20@01 | live]
(push) ; 4
; [then-branch: 13 | !(0 <= i@20@01)]
(assert (not (<= 0 i@20@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 13 | 0 <= i@20@01]
(assert (<= 0 i@20@01))
; [eval] i < |ar|
; [eval] |ar|
(push) ; 5
; [then-branch: 14 | !(i@20@01 < |ar@18@01|) | live]
; [else-branch: 14 | i@20@01 < |ar@18@01| | live]
(push) ; 6
; [then-branch: 14 | !(i@20@01 < |ar@18@01|)]
(assert (not (< i@20@01 (Seq_length ar@18@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 14 | i@20@01 < |ar@18@01|]
(assert (< i@20@01 (Seq_length ar@18@01)))
; [eval] 0 <= j
(push) ; 7
; [then-branch: 15 | !(0 <= j@21@01) | live]
; [else-branch: 15 | 0 <= j@21@01 | live]
(push) ; 8
; [then-branch: 15 | !(0 <= j@21@01)]
(assert (not (<= 0 j@21@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 15 | 0 <= j@21@01]
(assert (<= 0 j@21@01))
; [eval] j < |ar|
; [eval] |ar|
(push) ; 9
; [then-branch: 16 | !(j@21@01 < |ar@18@01|) | live]
; [else-branch: 16 | j@21@01 < |ar@18@01| | live]
(push) ; 10
; [then-branch: 16 | !(j@21@01 < |ar@18@01|)]
(assert (not (< j@21@01 (Seq_length ar@18@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 16 | j@21@01 < |ar@18@01|]
(assert (< j@21@01 (Seq_length ar@18@01)))
; [eval] i != j
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< j@21@01 (Seq_length ar@18@01)) (not (< j@21@01 (Seq_length ar@18@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j@21@01)
  (and
    (<= 0 j@21@01)
    (or
      (< j@21@01 (Seq_length ar@18@01))
      (not (< j@21@01 (Seq_length ar@18@01)))))))
(assert (or (<= 0 j@21@01) (not (<= 0 j@21@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i@20@01 (Seq_length ar@18@01))
  (and
    (< i@20@01 (Seq_length ar@18@01))
    (=>
      (<= 0 j@21@01)
      (and
        (<= 0 j@21@01)
        (or
          (< j@21@01 (Seq_length ar@18@01))
          (not (< j@21@01 (Seq_length ar@18@01))))))
    (or (<= 0 j@21@01) (not (<= 0 j@21@01))))))
(assert (or (< i@20@01 (Seq_length ar@18@01)) (not (< i@20@01 (Seq_length ar@18@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i@20@01)
  (and
    (<= 0 i@20@01)
    (=>
      (< i@20@01 (Seq_length ar@18@01))
      (and
        (< i@20@01 (Seq_length ar@18@01))
        (=>
          (<= 0 j@21@01)
          (and
            (<= 0 j@21@01)
            (or
              (< j@21@01 (Seq_length ar@18@01))
              (not (< j@21@01 (Seq_length ar@18@01))))))
        (or (<= 0 j@21@01) (not (<= 0 j@21@01)))))
    (or
      (< i@20@01 (Seq_length ar@18@01))
      (not (< i@20@01 (Seq_length ar@18@01)))))))
(assert (or (<= 0 i@20@01) (not (<= 0 i@20@01))))
(push) ; 3
; [then-branch: 17 | 0 <= i@20@01 && i@20@01 < |ar@18@01| && 0 <= j@21@01 && j@21@01 < |ar@18@01| && i@20@01 != j@21@01 | live]
; [else-branch: 17 | !(0 <= i@20@01 && i@20@01 < |ar@18@01| && 0 <= j@21@01 && j@21@01 < |ar@18@01| && i@20@01 != j@21@01) | live]
(push) ; 4
; [then-branch: 17 | 0 <= i@20@01 && i@20@01 < |ar@18@01| && 0 <= j@21@01 && j@21@01 < |ar@18@01| && i@20@01 != j@21@01]
(assert (and
  (<= 0 i@20@01)
  (and
    (< i@20@01 (Seq_length ar@18@01))
    (and
      (<= 0 j@21@01)
      (and (< j@21@01 (Seq_length ar@18@01)) (not (= i@20@01 j@21@01)))))))
; [eval] ar[i] != ar[j]
; [eval] ar[i]
(push) ; 5
(assert (not (>= i@20@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] ar[j]
(push) ; 5
(assert (not (>= j@21@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 17 | !(0 <= i@20@01 && i@20@01 < |ar@18@01| && 0 <= j@21@01 && j@21@01 < |ar@18@01| && i@20@01 != j@21@01)]
(assert (not
  (and
    (<= 0 i@20@01)
    (and
      (< i@20@01 (Seq_length ar@18@01))
      (and
        (<= 0 j@21@01)
        (and (< j@21@01 (Seq_length ar@18@01)) (not (= i@20@01 j@21@01))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (<= 0 i@20@01)
    (and
      (< i@20@01 (Seq_length ar@18@01))
      (and
        (<= 0 j@21@01)
        (and (< j@21@01 (Seq_length ar@18@01)) (not (= i@20@01 j@21@01))))))
  (and
    (<= 0 i@20@01)
    (< i@20@01 (Seq_length ar@18@01))
    (<= 0 j@21@01)
    (< j@21@01 (Seq_length ar@18@01))
    (not (= i@20@01 j@21@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i@20@01)
      (and
        (< i@20@01 (Seq_length ar@18@01))
        (and
          (<= 0 j@21@01)
          (and (< j@21@01 (Seq_length ar@18@01)) (not (= i@20@01 j@21@01)))))))
  (and
    (<= 0 i@20@01)
    (and
      (< i@20@01 (Seq_length ar@18@01))
      (and
        (<= 0 j@21@01)
        (and (< j@21@01 (Seq_length ar@18@01)) (not (= i@20@01 j@21@01))))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@20@01 Int) (j@21@01 Int)) (!
  (and
    (=>
      (<= 0 i@20@01)
      (and
        (<= 0 i@20@01)
        (=>
          (< i@20@01 (Seq_length ar@18@01))
          (and
            (< i@20@01 (Seq_length ar@18@01))
            (=>
              (<= 0 j@21@01)
              (and
                (<= 0 j@21@01)
                (or
                  (< j@21@01 (Seq_length ar@18@01))
                  (not (< j@21@01 (Seq_length ar@18@01))))))
            (or (<= 0 j@21@01) (not (<= 0 j@21@01)))))
        (or
          (< i@20@01 (Seq_length ar@18@01))
          (not (< i@20@01 (Seq_length ar@18@01))))))
    (or (<= 0 i@20@01) (not (<= 0 i@20@01)))
    (=>
      (and
        (<= 0 i@20@01)
        (and
          (< i@20@01 (Seq_length ar@18@01))
          (and
            (<= 0 j@21@01)
            (and (< j@21@01 (Seq_length ar@18@01)) (not (= i@20@01 j@21@01))))))
      (and
        (<= 0 i@20@01)
        (< i@20@01 (Seq_length ar@18@01))
        (<= 0 j@21@01)
        (< j@21@01 (Seq_length ar@18@01))
        (not (= i@20@01 j@21@01))))
    (or
      (not
        (and
          (<= 0 i@20@01)
          (and
            (< i@20@01 (Seq_length ar@18@01))
            (and
              (<= 0 j@21@01)
              (and (< j@21@01 (Seq_length ar@18@01)) (not (= i@20@01 j@21@01)))))))
      (and
        (<= 0 i@20@01)
        (and
          (< i@20@01 (Seq_length ar@18@01))
          (and
            (<= 0 j@21@01)
            (and (< j@21@01 (Seq_length ar@18@01)) (not (= i@20@01 j@21@01))))))))
  :pattern ((Seq_index ar@18@01 i@20@01) (Seq_index ar@18@01 j@21@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/shift.vpr@24@12@24@106-aux|)))
(assert (forall ((i@20@01 Int) (j@21@01 Int)) (!
  (=>
    (and
      (<= 0 i@20@01)
      (and
        (< i@20@01 (Seq_length ar@18@01))
        (and
          (<= 0 j@21@01)
          (and (< j@21@01 (Seq_length ar@18@01)) (not (= i@20@01 j@21@01))))))
    (not (= (Seq_index ar@18@01 i@20@01) (Seq_index ar@18@01 j@21@01))))
  :pattern ((Seq_index ar@18@01 i@20@01) (Seq_index ar@18@01 j@21@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/shift.vpr@24@12@24@106|)))
(assert (=
  ($Snap.second ($Snap.second $t@19@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@19@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@19@01))))))
(declare-const i@22@01 Int)
(push) ; 2
; [eval] (i in [0..len))
; [eval] [0..len)
(assert (Seq_contains (Seq_range 0 len@17@01) i@22@01))
; [eval] ar[i]
(push) ; 3
(assert (not (>= i@22@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@22@01 (Seq_length ar@18@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@23@01 ($Ref) Int)
(declare-fun img@24@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@22@01 Int) (i2@22@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 len@17@01) i1@22@01)
      (Seq_contains (Seq_range 0 len@17@01) i2@22@01)
      (= (Seq_index ar@18@01 i1@22@01) (Seq_index ar@18@01 i2@22@01)))
    (= i1@22@01 i2@22@01))
  
  :qid |Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@22@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 len@17@01) i@22@01)
    (and
      (= (inv@23@01 (Seq_index ar@18@01 i@22@01)) i@22@01)
      (img@24@01 (Seq_index ar@18@01 i@22@01))))
  :pattern ((Seq_index ar@18@01 i@22@01))
  :qid |quant-u-3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@24@01 r) (Seq_contains (Seq_range 0 len@17@01) (inv@23@01 r)))
    (= (Seq_index ar@18@01 (inv@23@01 r)) r))
  :pattern ((inv@23@01 r))
  :qid |Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@22@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 len@17@01) i@22@01)
    (not (= (Seq_index ar@18@01 i@22@01) $Ref.null)))
  :pattern ((Seq_index ar@18@01 i@22@01))
  :qid |Integer_value-permImpliesNonNull|)))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@19@01))) $Snap.unit))
; [eval] (forall i: Int :: { ar[i] } 0 <= i && i < len ==> ar[i].Integer_value == 0)
(declare-const i@25@01 Int)
(push) ; 2
; [eval] 0 <= i && i < len ==> ar[i].Integer_value == 0
; [eval] 0 <= i && i < len
; [eval] 0 <= i
(push) ; 3
; [then-branch: 18 | !(0 <= i@25@01) | live]
; [else-branch: 18 | 0 <= i@25@01 | live]
(push) ; 4
; [then-branch: 18 | !(0 <= i@25@01)]
(assert (not (<= 0 i@25@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 18 | 0 <= i@25@01]
(assert (<= 0 i@25@01))
; [eval] i < len
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@25@01) (not (<= 0 i@25@01))))
(push) ; 3
; [then-branch: 19 | 0 <= i@25@01 && i@25@01 < len@17@01 | live]
; [else-branch: 19 | !(0 <= i@25@01 && i@25@01 < len@17@01) | live]
(push) ; 4
; [then-branch: 19 | 0 <= i@25@01 && i@25@01 < len@17@01]
(assert (and (<= 0 i@25@01) (< i@25@01 len@17@01)))
; [eval] ar[i].Integer_value == 0
; [eval] ar[i]
(push) ; 5
(assert (not (>= i@25@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@25@01 (Seq_length ar@18@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (and
  (img@24@01 (Seq_index ar@18@01 i@25@01))
  (Seq_contains (Seq_range 0 len@17@01) (inv@23@01 (Seq_index ar@18@01 i@25@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 19 | !(0 <= i@25@01 && i@25@01 < len@17@01)]
(assert (not (and (<= 0 i@25@01) (< i@25@01 len@17@01))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (<= 0 i@25@01) (< i@25@01 len@17@01)))
  (and (<= 0 i@25@01) (< i@25@01 len@17@01))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@25@01 Int)) (!
  (and
    (or (<= 0 i@25@01) (not (<= 0 i@25@01)))
    (or
      (not (and (<= 0 i@25@01) (< i@25@01 len@17@01)))
      (and (<= 0 i@25@01) (< i@25@01 len@17@01))))
  :pattern ((Seq_index ar@18@01 i@25@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/shift.vpr@26@13@26@82-aux|)))
(assert (forall ((i@25@01 Int)) (!
  (=>
    (and (<= 0 i@25@01) (< i@25@01 len@17@01))
    (=
      ($FVF.lookup_Integer_value ($SortWrappers.$SnapTo$FVF<Integer_value> ($Snap.first ($Snap.second ($Snap.second $t@19@01)))) (Seq_index
        ar@18@01
        i@25@01))
      0))
  :pattern ((Seq_index ar@18@01 i@25@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/shift.vpr@26@13@26@82|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; assert (forall i: Int ::
;     { ar[i] }
;     0 <= i && i < len - 1 ==> ar[i].Integer_value == 0)
; [eval] (forall i: Int :: { ar[i] } 0 <= i && i < len - 1 ==> ar[i].Integer_value == 0)
(declare-const i@26@01 Int)
(push) ; 3
; [eval] 0 <= i && i < len - 1 ==> ar[i].Integer_value == 0
; [eval] 0 <= i && i < len - 1
; [eval] 0 <= i
(push) ; 4
; [then-branch: 20 | !(0 <= i@26@01) | live]
; [else-branch: 20 | 0 <= i@26@01 | live]
(push) ; 5
; [then-branch: 20 | !(0 <= i@26@01)]
(assert (not (<= 0 i@26@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 20 | 0 <= i@26@01]
(assert (<= 0 i@26@01))
; [eval] i < len - 1
; [eval] len - 1
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@26@01) (not (<= 0 i@26@01))))
(push) ; 4
; [then-branch: 21 | 0 <= i@26@01 && i@26@01 < len@17@01 - 1 | live]
; [else-branch: 21 | !(0 <= i@26@01 && i@26@01 < len@17@01 - 1) | live]
(push) ; 5
; [then-branch: 21 | 0 <= i@26@01 && i@26@01 < len@17@01 - 1]
(assert (and (<= 0 i@26@01) (< i@26@01 (- len@17@01 1))))
; [eval] ar[i].Integer_value == 0
; [eval] ar[i]
(push) ; 6
(assert (not (>= i@26@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@26@01 (Seq_length ar@18@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (and
  (img@24@01 (Seq_index ar@18@01 i@26@01))
  (Seq_contains (Seq_range 0 len@17@01) (inv@23@01 (Seq_index ar@18@01 i@26@01))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 21 | !(0 <= i@26@01 && i@26@01 < len@17@01 - 1)]
(assert (not (and (<= 0 i@26@01) (< i@26@01 (- len@17@01 1)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (<= 0 i@26@01) (< i@26@01 (- len@17@01 1))))
  (and (<= 0 i@26@01) (< i@26@01 (- len@17@01 1)))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@26@01 Int)) (!
  (and
    (or (<= 0 i@26@01) (not (<= 0 i@26@01)))
    (or
      (not (and (<= 0 i@26@01) (< i@26@01 (- len@17@01 1))))
      (and (<= 0 i@26@01) (< i@26@01 (- len@17@01 1)))))
  :pattern ((Seq_index ar@18@01 i@26@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/shift.vpr@28@11@28@82-aux|)))
(push) ; 3
(assert (not (forall ((i@26@01 Int)) (!
  (=>
    (and (<= 0 i@26@01) (< i@26@01 (- len@17@01 1)))
    (=
      ($FVF.lookup_Integer_value ($SortWrappers.$SnapTo$FVF<Integer_value> ($Snap.first ($Snap.second ($Snap.second $t@19@01)))) (Seq_index
        ar@18@01
        i@26@01))
      0))
  :pattern ((Seq_index ar@18@01 i@26@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/shift.vpr@28@11@28@82|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@26@01 Int)) (!
  (=>
    (and (<= 0 i@26@01) (< i@26@01 (- len@17@01 1)))
    (=
      ($FVF.lookup_Integer_value ($SortWrappers.$SnapTo$FVF<Integer_value> ($Snap.first ($Snap.second ($Snap.second $t@19@01)))) (Seq_index
        ar@18@01
        i@26@01))
      0))
  :pattern ((Seq_index ar@18@01 i@26@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/shift.vpr@28@11@28@82|)))
; [exec]
; assert (forall i: Int ::
;     { (i in [1..len)) }
;     (i in [1..len)) ==> ar[i - 1].Integer_value == 0)
; [eval] (forall i: Int :: { (i in [1..len)) } (i in [1..len)) ==> ar[i - 1].Integer_value == 0)
(declare-const i@27@01 Int)
(push) ; 3
; [eval] (i in [1..len)) ==> ar[i - 1].Integer_value == 0
; [eval] (i in [1..len))
; [eval] [1..len)
(push) ; 4
; [then-branch: 22 | i@27@01 in [1..len@17@01] | live]
; [else-branch: 22 | !(i@27@01 in [1..len@17@01]) | live]
(push) ; 5
; [then-branch: 22 | i@27@01 in [1..len@17@01]]
(assert (Seq_contains (Seq_range 1 len@17@01) i@27@01))
; [eval] ar[i - 1].Integer_value == 0
; [eval] ar[i - 1]
; [eval] i - 1
(push) ; 6
(assert (not (>= (- i@27@01 1) 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< (- i@27@01 1) (Seq_length ar@18@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (and
  (img@24@01 (Seq_index ar@18@01 (- i@27@01 1)))
  (Seq_contains
    (Seq_range 0 len@17@01)
    (inv@23@01 (Seq_index ar@18@01 (- i@27@01 1)))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 22 | !(i@27@01 in [1..len@17@01])]
(assert (not (Seq_contains (Seq_range 1 len@17@01) i@27@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not (Seq_contains (Seq_range 1 len@17@01) i@27@01))
  (Seq_contains (Seq_range 1 len@17@01) i@27@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@27@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 1 len@17@01) i@27@01))
    (Seq_contains (Seq_range 1 len@17@01) i@27@01))
  :pattern ((Seq_contains (Seq_range 1 len@17@01) i@27@01))
  :pattern ((Seq_contains_trigger (Seq_range 1 len@17@01) i@27@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/shift.vpr@29@11@29@76-aux|)))
(assert (forall ((i@27@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 1 len@17@01) i@27@01))
    (Seq_contains (Seq_range 1 len@17@01) i@27@01))
  :pattern ((Seq_contains_trigger (Seq_range 1 len@17@01) i@27@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/shift.vpr@29@11@29@76-aux|)))
(push) ; 3
(assert (not (forall ((i@27@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 1 len@17@01) i@27@01)
    (=
      ($FVF.lookup_Integer_value ($SortWrappers.$SnapTo$FVF<Integer_value> ($Snap.first ($Snap.second ($Snap.second $t@19@01)))) (Seq_index
        ar@18@01
        (- i@27@01 1)))
      0))
  :pattern ((Seq_contains (Seq_range 1 len@17@01) i@27@01))
  :pattern ((Seq_contains_trigger (Seq_range 1 len@17@01) i@27@01))
  :pattern ((Seq_contains_trigger (Seq_range 1 len@17@01) i@27@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/shift.vpr@29@11@29@76|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@27@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 1 len@17@01) i@27@01)
    (=
      ($FVF.lookup_Integer_value ($SortWrappers.$SnapTo$FVF<Integer_value> ($Snap.first ($Snap.second ($Snap.second $t@19@01)))) (Seq_index
        ar@18@01
        (- i@27@01 1)))
      0))
  :pattern ((Seq_contains (Seq_range 1 len@17@01) i@27@01))
  :pattern ((Seq_contains_trigger (Seq_range 1 len@17@01) i@27@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/shift.vpr@29@11@29@76|)))
; [exec]
; assert (forall __rw_i2: Int ::
;     { ar[__rw_i2] }
;     true ==>
;     1 <= __rw_i2 + 1 && __rw_i2 + 1 < len ==>
;     ar[__rw_i2].Integer_value == 0)
; [eval] (forall __rw_i2: Int :: { ar[__rw_i2] } true ==> 1 <= __rw_i2 + 1 && __rw_i2 + 1 < len ==> ar[__rw_i2].Integer_value == 0)
(declare-const __rw_i2@28@01 Int)
(push) ; 3
; [eval] true ==> 1 <= __rw_i2 + 1 && __rw_i2 + 1 < len ==> ar[__rw_i2].Integer_value == 0
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 23 | True | live]
; [else-branch: 23 | False | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 23 | True]
; [eval] 1 <= __rw_i2 + 1 && __rw_i2 + 1 < len ==> ar[__rw_i2].Integer_value == 0
; [eval] 1 <= __rw_i2 + 1 && __rw_i2 + 1 < len
; [eval] 1 <= __rw_i2 + 1
; [eval] __rw_i2 + 1
(push) ; 6
; [then-branch: 24 | !(1 <= __rw_i2@28@01 + 1) | live]
; [else-branch: 24 | 1 <= __rw_i2@28@01 + 1 | live]
(push) ; 7
; [then-branch: 24 | !(1 <= __rw_i2@28@01 + 1)]
(assert (not (<= 1 (+ __rw_i2@28@01 1))))
(pop) ; 7
(push) ; 7
; [else-branch: 24 | 1 <= __rw_i2@28@01 + 1]
(assert (<= 1 (+ __rw_i2@28@01 1)))
; [eval] __rw_i2 + 1 < len
; [eval] __rw_i2 + 1
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (<= 1 (+ __rw_i2@28@01 1)) (not (<= 1 (+ __rw_i2@28@01 1)))))
(push) ; 6
; [then-branch: 25 | 1 <= __rw_i2@28@01 + 1 && __rw_i2@28@01 + 1 < len@17@01 | live]
; [else-branch: 25 | !(1 <= __rw_i2@28@01 + 1 && __rw_i2@28@01 + 1 < len@17@01) | live]
(push) ; 7
; [then-branch: 25 | 1 <= __rw_i2@28@01 + 1 && __rw_i2@28@01 + 1 < len@17@01]
(assert (and (<= 1 (+ __rw_i2@28@01 1)) (< (+ __rw_i2@28@01 1) len@17@01)))
; [eval] ar[__rw_i2].Integer_value == 0
; [eval] ar[__rw_i2]
(push) ; 8
(assert (not (>= __rw_i2@28@01 0)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(push) ; 8
(assert (not (< __rw_i2@28@01 (Seq_length ar@18@01))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(push) ; 8
(assert (not (and
  (img@24@01 (Seq_index ar@18@01 __rw_i2@28@01))
  (Seq_contains
    (Seq_range 0 len@17@01)
    (inv@23@01 (Seq_index ar@18@01 __rw_i2@28@01))))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
(push) ; 7
; [else-branch: 25 | !(1 <= __rw_i2@28@01 + 1 && __rw_i2@28@01 + 1 < len@17@01)]
(assert (not (and (<= 1 (+ __rw_i2@28@01 1)) (< (+ __rw_i2@28@01 1) len@17@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (<= 1 (+ __rw_i2@28@01 1)) (< (+ __rw_i2@28@01 1) len@17@01)))
  (and (<= 1 (+ __rw_i2@28@01 1)) (< (+ __rw_i2@28@01 1) len@17@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (and
  (or (<= 1 (+ __rw_i2@28@01 1)) (not (<= 1 (+ __rw_i2@28@01 1))))
  (or
    (not (and (<= 1 (+ __rw_i2@28@01 1)) (< (+ __rw_i2@28@01 1) len@17@01)))
    (and (<= 1 (+ __rw_i2@28@01 1)) (< (+ __rw_i2@28@01 1) len@17@01)))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((__rw_i2@28@01 Int)) (!
  (and
    (or (<= 1 (+ __rw_i2@28@01 1)) (not (<= 1 (+ __rw_i2@28@01 1))))
    (or
      (not (and (<= 1 (+ __rw_i2@28@01 1)) (< (+ __rw_i2@28@01 1) len@17@01)))
      (and (<= 1 (+ __rw_i2@28@01 1)) (< (+ __rw_i2@28@01 1) len@17@01))))
  :pattern ((Seq_index ar@18@01 __rw_i2@28@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/shift.vpr@30@11@30@82-aux|)))
(push) ; 3
(assert (not (forall ((__rw_i2@28@01 Int)) (!
  (=>
    (and (<= 1 (+ __rw_i2@28@01 1)) (< (+ __rw_i2@28@01 1) len@17@01))
    (=
      ($FVF.lookup_Integer_value ($SortWrappers.$SnapTo$FVF<Integer_value> ($Snap.first ($Snap.second ($Snap.second $t@19@01)))) (Seq_index
        ar@18@01
        __rw_i2@28@01))
      0))
  :pattern ((Seq_index ar@18@01 __rw_i2@28@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/shift.vpr@30@11@30@82|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((__rw_i2@28@01 Int)) (!
  (=>
    (and (<= 1 (+ __rw_i2@28@01 1)) (< (+ __rw_i2@28@01 1) len@17@01))
    (=
      ($FVF.lookup_Integer_value ($SortWrappers.$SnapTo$FVF<Integer_value> ($Snap.first ($Snap.second ($Snap.second $t@19@01)))) (Seq_index
        ar@18@01
        __rw_i2@28@01))
      0))
  :pattern ((Seq_index ar@18@01 __rw_i2@28@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/shift.vpr@30@11@30@82|)))
(pop) ; 2
(pop) ; 1
