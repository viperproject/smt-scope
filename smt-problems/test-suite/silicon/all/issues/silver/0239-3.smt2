(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:03:52
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silver/0239-3.vpr
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
(declare-sort Set<$Ref> 0)
(declare-sort Set<$Snap> 0)
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
; ---------- foo ----------
(declare-const tree@0@01 $Ref)
(declare-const leftArray@1@01 Seq<$Ref>)
(declare-const rightArray@2@01 Seq<$Ref>)
(declare-const array@3@01 Seq<$Ref>)
(declare-const tree@4@01 $Ref)
(declare-const leftArray@5@01 Seq<$Ref>)
(declare-const rightArray@6@01 Seq<$Ref>)
(declare-const array@7@01 Seq<$Ref>)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@8@01 $Snap)
(assert (= $t@8@01 ($Snap.combine ($Snap.first $t@8@01) ($Snap.second $t@8@01))))
(assert (= ($Snap.first $t@8@01) $Snap.unit))
; [eval] (forall i$0: Int, j: Int :: { array[i$0], array[j] } 0 <= i$0 && i$0 < |array| && (0 <= j && j < |array| && i$0 != j) ==> array[i$0] != array[j])
(declare-const i$0@9@01 Int)
(declare-const j@10@01 Int)
(push) ; 2
; [eval] 0 <= i$0 && i$0 < |array| && (0 <= j && j < |array| && i$0 != j) ==> array[i$0] != array[j]
; [eval] 0 <= i$0 && i$0 < |array| && (0 <= j && j < |array| && i$0 != j)
; [eval] 0 <= i$0
(push) ; 3
; [then-branch: 0 | !(0 <= i$0@9@01) | live]
; [else-branch: 0 | 0 <= i$0@9@01 | live]
(push) ; 4
; [then-branch: 0 | !(0 <= i$0@9@01)]
(assert (not (<= 0 i$0@9@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | 0 <= i$0@9@01]
(assert (<= 0 i$0@9@01))
; [eval] i$0 < |array|
; [eval] |array|
(push) ; 5
; [then-branch: 1 | !(i$0@9@01 < |array@7@01|) | live]
; [else-branch: 1 | i$0@9@01 < |array@7@01| | live]
(push) ; 6
; [then-branch: 1 | !(i$0@9@01 < |array@7@01|)]
(assert (not (< i$0@9@01 (Seq_length array@7@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 1 | i$0@9@01 < |array@7@01|]
(assert (< i$0@9@01 (Seq_length array@7@01)))
; [eval] 0 <= j
(push) ; 7
; [then-branch: 2 | !(0 <= j@10@01) | live]
; [else-branch: 2 | 0 <= j@10@01 | live]
(push) ; 8
; [then-branch: 2 | !(0 <= j@10@01)]
(assert (not (<= 0 j@10@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 2 | 0 <= j@10@01]
(assert (<= 0 j@10@01))
; [eval] j < |array|
; [eval] |array|
(push) ; 9
; [then-branch: 3 | !(j@10@01 < |array@7@01|) | live]
; [else-branch: 3 | j@10@01 < |array@7@01| | live]
(push) ; 10
; [then-branch: 3 | !(j@10@01 < |array@7@01|)]
(assert (not (< j@10@01 (Seq_length array@7@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 3 | j@10@01 < |array@7@01|]
(assert (< j@10@01 (Seq_length array@7@01)))
; [eval] i$0 != j
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or
  (< j@10@01 (Seq_length array@7@01))
  (not (< j@10@01 (Seq_length array@7@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j@10@01)
  (and
    (<= 0 j@10@01)
    (or
      (< j@10@01 (Seq_length array@7@01))
      (not (< j@10@01 (Seq_length array@7@01)))))))
(assert (or (<= 0 j@10@01) (not (<= 0 j@10@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i$0@9@01 (Seq_length array@7@01))
  (and
    (< i$0@9@01 (Seq_length array@7@01))
    (=>
      (<= 0 j@10@01)
      (and
        (<= 0 j@10@01)
        (or
          (< j@10@01 (Seq_length array@7@01))
          (not (< j@10@01 (Seq_length array@7@01))))))
    (or (<= 0 j@10@01) (not (<= 0 j@10@01))))))
(assert (or
  (< i$0@9@01 (Seq_length array@7@01))
  (not (< i$0@9@01 (Seq_length array@7@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i$0@9@01)
  (and
    (<= 0 i$0@9@01)
    (=>
      (< i$0@9@01 (Seq_length array@7@01))
      (and
        (< i$0@9@01 (Seq_length array@7@01))
        (=>
          (<= 0 j@10@01)
          (and
            (<= 0 j@10@01)
            (or
              (< j@10@01 (Seq_length array@7@01))
              (not (< j@10@01 (Seq_length array@7@01))))))
        (or (<= 0 j@10@01) (not (<= 0 j@10@01)))))
    (or
      (< i$0@9@01 (Seq_length array@7@01))
      (not (< i$0@9@01 (Seq_length array@7@01)))))))
(assert (or (<= 0 i$0@9@01) (not (<= 0 i$0@9@01))))
(push) ; 3
; [then-branch: 4 | 0 <= i$0@9@01 && i$0@9@01 < |array@7@01| && 0 <= j@10@01 && j@10@01 < |array@7@01| && i$0@9@01 != j@10@01 | live]
; [else-branch: 4 | !(0 <= i$0@9@01 && i$0@9@01 < |array@7@01| && 0 <= j@10@01 && j@10@01 < |array@7@01| && i$0@9@01 != j@10@01) | live]
(push) ; 4
; [then-branch: 4 | 0 <= i$0@9@01 && i$0@9@01 < |array@7@01| && 0 <= j@10@01 && j@10@01 < |array@7@01| && i$0@9@01 != j@10@01]
(assert (and
  (<= 0 i$0@9@01)
  (and
    (< i$0@9@01 (Seq_length array@7@01))
    (and
      (<= 0 j@10@01)
      (and (< j@10@01 (Seq_length array@7@01)) (not (= i$0@9@01 j@10@01)))))))
; [eval] array[i$0] != array[j]
; [eval] array[i$0]
(push) ; 5
(assert (not (>= i$0@9@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] array[j]
(push) ; 5
(assert (not (>= j@10@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 4 | !(0 <= i$0@9@01 && i$0@9@01 < |array@7@01| && 0 <= j@10@01 && j@10@01 < |array@7@01| && i$0@9@01 != j@10@01)]
(assert (not
  (and
    (<= 0 i$0@9@01)
    (and
      (< i$0@9@01 (Seq_length array@7@01))
      (and
        (<= 0 j@10@01)
        (and (< j@10@01 (Seq_length array@7@01)) (not (= i$0@9@01 j@10@01))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (<= 0 i$0@9@01)
    (and
      (< i$0@9@01 (Seq_length array@7@01))
      (and
        (<= 0 j@10@01)
        (and (< j@10@01 (Seq_length array@7@01)) (not (= i$0@9@01 j@10@01))))))
  (and
    (<= 0 i$0@9@01)
    (< i$0@9@01 (Seq_length array@7@01))
    (<= 0 j@10@01)
    (< j@10@01 (Seq_length array@7@01))
    (not (= i$0@9@01 j@10@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i$0@9@01)
      (and
        (< i$0@9@01 (Seq_length array@7@01))
        (and
          (<= 0 j@10@01)
          (and (< j@10@01 (Seq_length array@7@01)) (not (= i$0@9@01 j@10@01)))))))
  (and
    (<= 0 i$0@9@01)
    (and
      (< i$0@9@01 (Seq_length array@7@01))
      (and
        (<= 0 j@10@01)
        (and (< j@10@01 (Seq_length array@7@01)) (not (= i$0@9@01 j@10@01))))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i$0@9@01 Int) (j@10@01 Int)) (!
  (and
    (=>
      (<= 0 i$0@9@01)
      (and
        (<= 0 i$0@9@01)
        (=>
          (< i$0@9@01 (Seq_length array@7@01))
          (and
            (< i$0@9@01 (Seq_length array@7@01))
            (=>
              (<= 0 j@10@01)
              (and
                (<= 0 j@10@01)
                (or
                  (< j@10@01 (Seq_length array@7@01))
                  (not (< j@10@01 (Seq_length array@7@01))))))
            (or (<= 0 j@10@01) (not (<= 0 j@10@01)))))
        (or
          (< i$0@9@01 (Seq_length array@7@01))
          (not (< i$0@9@01 (Seq_length array@7@01))))))
    (or (<= 0 i$0@9@01) (not (<= 0 i$0@9@01)))
    (=>
      (and
        (<= 0 i$0@9@01)
        (and
          (< i$0@9@01 (Seq_length array@7@01))
          (and
            (<= 0 j@10@01)
            (and (< j@10@01 (Seq_length array@7@01)) (not (= i$0@9@01 j@10@01))))))
      (and
        (<= 0 i$0@9@01)
        (< i$0@9@01 (Seq_length array@7@01))
        (<= 0 j@10@01)
        (< j@10@01 (Seq_length array@7@01))
        (not (= i$0@9@01 j@10@01))))
    (or
      (not
        (and
          (<= 0 i$0@9@01)
          (and
            (< i$0@9@01 (Seq_length array@7@01))
            (and
              (<= 0 j@10@01)
              (and
                (< j@10@01 (Seq_length array@7@01))
                (not (= i$0@9@01 j@10@01)))))))
      (and
        (<= 0 i$0@9@01)
        (and
          (< i$0@9@01 (Seq_length array@7@01))
          (and
            (<= 0 j@10@01)
            (and (< j@10@01 (Seq_length array@7@01)) (not (= i$0@9@01 j@10@01))))))))
  :pattern ((Seq_index array@7@01 i$0@9@01) (Seq_index array@7@01 j@10@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0239-3.vpr@16@14@16@30-aux|)))
(assert (forall ((i$0@9@01 Int) (j@10@01 Int)) (!
  (=>
    (and
      (<= 0 i$0@9@01)
      (and
        (< i$0@9@01 (Seq_length array@7@01))
        (and
          (<= 0 j@10@01)
          (and (< j@10@01 (Seq_length array@7@01)) (not (= i$0@9@01 j@10@01))))))
    (not (= (Seq_index array@7@01 i$0@9@01) (Seq_index array@7@01 j@10@01))))
  :pattern ((Seq_index array@7@01 i$0@9@01) (Seq_index array@7@01 j@10@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0239-3.vpr@16@14@16@30|)))
(assert (=
  ($Snap.second $t@8@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@8@01))
    ($Snap.second ($Snap.second $t@8@01)))))
(assert (= ($Snap.first ($Snap.second $t@8@01)) $Snap.unit))
; [eval] (forall i$1: Int :: { array[i$1] } 0 <= i$1 && i$1 < |array| ==> array[i$1] != null)
(declare-const i$1@11@01 Int)
(push) ; 2
; [eval] 0 <= i$1 && i$1 < |array| ==> array[i$1] != null
; [eval] 0 <= i$1 && i$1 < |array|
; [eval] 0 <= i$1
(push) ; 3
; [then-branch: 5 | !(0 <= i$1@11@01) | live]
; [else-branch: 5 | 0 <= i$1@11@01 | live]
(push) ; 4
; [then-branch: 5 | !(0 <= i$1@11@01)]
(assert (not (<= 0 i$1@11@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 5 | 0 <= i$1@11@01]
(assert (<= 0 i$1@11@01))
; [eval] i$1 < |array|
; [eval] |array|
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i$1@11@01) (not (<= 0 i$1@11@01))))
(push) ; 3
; [then-branch: 6 | 0 <= i$1@11@01 && i$1@11@01 < |array@7@01| | live]
; [else-branch: 6 | !(0 <= i$1@11@01 && i$1@11@01 < |array@7@01|) | live]
(push) ; 4
; [then-branch: 6 | 0 <= i$1@11@01 && i$1@11@01 < |array@7@01|]
(assert (and (<= 0 i$1@11@01) (< i$1@11@01 (Seq_length array@7@01))))
; [eval] array[i$1] != null
; [eval] array[i$1]
(push) ; 5
(assert (not (>= i$1@11@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 6 | !(0 <= i$1@11@01 && i$1@11@01 < |array@7@01|)]
(assert (not (and (<= 0 i$1@11@01) (< i$1@11@01 (Seq_length array@7@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (<= 0 i$1@11@01) (< i$1@11@01 (Seq_length array@7@01))))
  (and (<= 0 i$1@11@01) (< i$1@11@01 (Seq_length array@7@01)))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i$1@11@01 Int)) (!
  (and
    (or (<= 0 i$1@11@01) (not (<= 0 i$1@11@01)))
    (or
      (not (and (<= 0 i$1@11@01) (< i$1@11@01 (Seq_length array@7@01))))
      (and (<= 0 i$1@11@01) (< i$1@11@01 (Seq_length array@7@01)))))
  :pattern ((Seq_index array@7@01 i$1@11@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0239-3.vpr@16@14@16@30-aux|)))
(assert (forall ((i$1@11@01 Int)) (!
  (=>
    (and (<= 0 i$1@11@01) (< i$1@11@01 (Seq_length array@7@01)))
    (not (= (Seq_index array@7@01 i$1@11@01) $Ref.null)))
  :pattern ((Seq_index array@7@01 i$1@11@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0239-3.vpr@16@14@16@30|)))
(declare-const i$1@12@01 Int)
(push) ; 2
; [eval] 0 <= i$1 && i$1 < |array|
; [eval] 0 <= i$1
(push) ; 3
; [then-branch: 7 | !(0 <= i$1@12@01) | live]
; [else-branch: 7 | 0 <= i$1@12@01 | live]
(push) ; 4
; [then-branch: 7 | !(0 <= i$1@12@01)]
(assert (not (<= 0 i$1@12@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 7 | 0 <= i$1@12@01]
(assert (<= 0 i$1@12@01))
; [eval] i$1 < |array|
; [eval] |array|
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i$1@12@01) (not (<= 0 i$1@12@01))))
(assert (and (<= 0 i$1@12@01) (< i$1@12@01 (Seq_length array@7@01))))
; [eval] array[i$1]
(push) ; 3
(assert (not (>= i$1@12@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@13@01 ($Ref) Int)
(declare-fun img@14@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i$1@12@01 Int)) (!
  (=>
    (and (<= 0 i$1@12@01) (< i$1@12@01 (Seq_length array@7@01)))
    (or (<= 0 i$1@12@01) (not (<= 0 i$1@12@01))))
  :pattern ((Seq_index array@7@01 i$1@12@01))
  :qid |value-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i$11@12@01 Int) (i$12@12@01 Int)) (!
  (=>
    (and
      (and (<= 0 i$11@12@01) (< i$11@12@01 (Seq_length array@7@01)))
      (and (<= 0 i$12@12@01) (< i$12@12@01 (Seq_length array@7@01)))
      (= (Seq_index array@7@01 i$11@12@01) (Seq_index array@7@01 i$12@12@01)))
    (= i$11@12@01 i$12@12@01))
  
  :qid |value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i$1@12@01 Int)) (!
  (=>
    (and (<= 0 i$1@12@01) (< i$1@12@01 (Seq_length array@7@01)))
    (and
      (= (inv@13@01 (Seq_index array@7@01 i$1@12@01)) i$1@12@01)
      (img@14@01 (Seq_index array@7@01 i$1@12@01))))
  :pattern ((Seq_index array@7@01 i$1@12@01))
  :qid |quant-u-1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@14@01 r)
      (and (<= 0 (inv@13@01 r)) (< (inv@13@01 r) (Seq_length array@7@01))))
    (= (Seq_index array@7@01 (inv@13@01 r)) r))
  :pattern ((inv@13@01 r))
  :qid |value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i$1@12@01 Int)) (!
  (=>
    (and (<= 0 i$1@12@01) (< i$1@12@01 (Seq_length array@7@01)))
    (not (= (Seq_index array@7@01 i$1@12@01) $Ref.null)))
  :pattern ((Seq_index array@7@01 i$1@12@01))
  :qid |value-permImpliesNonNull|)))
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
;     { array[i] }
;     0 <= i - |leftArray| - 1 && i - |leftArray| - 1 < |rightArray| ==>
;     acc(array[i].value, write))
(declare-const i@15@01 Int)
(push) ; 3
; [eval] 0 <= i - |leftArray| - 1 && i - |leftArray| - 1 < |rightArray|
; [eval] 0 <= i - |leftArray| - 1
; [eval] i - |leftArray| - 1
; [eval] i - |leftArray|
; [eval] |leftArray|
(push) ; 4
; [then-branch: 8 | !(0 <= i@15@01 - |leftArray@5@01| - 1) | live]
; [else-branch: 8 | 0 <= i@15@01 - |leftArray@5@01| - 1 | live]
(push) ; 5
; [then-branch: 8 | !(0 <= i@15@01 - |leftArray@5@01| - 1)]
(assert (not (<= 0 (- (- i@15@01 (Seq_length leftArray@5@01)) 1))))
(pop) ; 5
(push) ; 5
; [else-branch: 8 | 0 <= i@15@01 - |leftArray@5@01| - 1]
(assert (<= 0 (- (- i@15@01 (Seq_length leftArray@5@01)) 1)))
; [eval] i - |leftArray| - 1 < |rightArray|
; [eval] i - |leftArray| - 1
; [eval] i - |leftArray|
; [eval] |leftArray|
; [eval] |rightArray|
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (<= 0 (- (- i@15@01 (Seq_length leftArray@5@01)) 1))
  (not (<= 0 (- (- i@15@01 (Seq_length leftArray@5@01)) 1)))))
(assert (and
  (<= 0 (- (- i@15@01 (Seq_length leftArray@5@01)) 1))
  (< (- (- i@15@01 (Seq_length leftArray@5@01)) 1) (Seq_length rightArray@6@01))))
; [eval] array[i]
(push) ; 4
(assert (not (>= i@15@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@15@01 (Seq_length array@7@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const sm@16@01 $FVF<value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@14@01 r)
      (and (<= 0 (inv@13@01 r)) (< (inv@13@01 r) (Seq_length array@7@01))))
    (=
      ($FVF.lookup_value (as sm@16@01  $FVF<value>) r)
      ($FVF.lookup_value ($SortWrappers.$SnapTo$FVF<value> ($Snap.second ($Snap.second $t@8@01))) r)))
  :pattern (($FVF.lookup_value (as sm@16@01  $FVF<value>) r))
  :pattern (($FVF.lookup_value ($SortWrappers.$SnapTo$FVF<value> ($Snap.second ($Snap.second $t@8@01))) r))
  :qid |qp.fvfValDef0|)))
(declare-const pm@17@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_value (as pm@17@01  $FPM) r)
    (ite
      (and
        (img@14@01 r)
        (and (<= 0 (inv@13@01 r)) (< (inv@13@01 r) (Seq_length array@7@01))))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_value (as pm@17@01  $FPM) r))
  :qid |qp.resPrmSumDef1|)))
; Assume upper permission bound for field value
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_value (as pm@17@01  $FPM) r) $Perm.Write)
  :pattern ((inv@13@01 r))
  :qid |qp-fld-prm-bnd|)))
(declare-const i@18@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i - |leftArray| - 1 && i - |leftArray| - 1 < |rightArray|
; [eval] 0 <= i - |leftArray| - 1
; [eval] i - |leftArray| - 1
; [eval] i - |leftArray|
; [eval] |leftArray|
(push) ; 4
; [then-branch: 9 | !(0 <= i@18@01 - |leftArray@5@01| - 1) | live]
; [else-branch: 9 | 0 <= i@18@01 - |leftArray@5@01| - 1 | live]
(push) ; 5
; [then-branch: 9 | !(0 <= i@18@01 - |leftArray@5@01| - 1)]
(assert (not (<= 0 (- (- i@18@01 (Seq_length leftArray@5@01)) 1))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
; Assume upper permission bound for field value
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 9 | 0 <= i@18@01 - |leftArray@5@01| - 1]
(assert (<= 0 (- (- i@18@01 (Seq_length leftArray@5@01)) 1)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
; Assume upper permission bound for field value
; [eval] i - |leftArray| - 1 < |rightArray|
; [eval] i - |leftArray| - 1
; [eval] i - |leftArray|
; [eval] |leftArray|
; [eval] |rightArray|
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (<= 0 (- (- i@18@01 (Seq_length leftArray@5@01)) 1))
  (not (<= 0 (- (- i@18@01 (Seq_length leftArray@5@01)) 1)))))
(assert (and
  (<= 0 (- (- i@18@01 (Seq_length leftArray@5@01)) 1))
  (< (- (- i@18@01 (Seq_length leftArray@5@01)) 1) (Seq_length rightArray@6@01))))
; [eval] array[i]
(set-option :timeout 0)
(push) ; 4
(assert (not (>= i@18@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@18@01 (Seq_length array@7@01))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(pop) ; 2
(pop) ; 1
