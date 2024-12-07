(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:48:38
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/carbon/0207.vpr
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
(declare-sort Set<Int> 0)
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
(declare-fun Seq_length (Seq<Int>) Int)
(declare-const Seq_empty Seq<Int>)
(declare-fun Seq_singleton (Int) Seq<Int>)
(declare-fun Seq_append (Seq<Int> Seq<Int>) Seq<Int>)
(declare-fun Seq_index (Seq<Int> Int) Int)
(declare-fun Seq_add (Int Int) Int)
(declare-fun Seq_sub (Int Int) Int)
(declare-fun Seq_update (Seq<Int> Int Int) Seq<Int>)
(declare-fun Seq_take (Seq<Int> Int) Seq<Int>)
(declare-fun Seq_drop (Seq<Int> Int) Seq<Int>)
(declare-fun Seq_contains (Seq<Int> Int) Bool)
(declare-fun Seq_contains_trigger (Seq<Int> Int) Bool)
(declare-fun Seq_skolem (Seq<Int> Int) Int)
(declare-fun Seq_equal (Seq<Int> Seq<Int>) Bool)
(declare-fun Seq_skolem_diff (Seq<Int> Seq<Int>) Int)
(declare-fun Seq_range (Int Int) Seq<Int>)
(declare-fun loc<Ref> (Array_ Int) $Ref)
(declare-fun length<Int> (Array_) Int)
(declare-fun first<Array> ($Ref) Array_)
(declare-fun second<Int> ($Ref) Int)
; /field_value_functions_declarations.smt2 [val: Int]
(declare-fun $FVF.domain_val ($FVF<val>) Set<$Ref>)
(declare-fun $FVF.lookup_val ($FVF<val> $Ref) Int)
(declare-fun $FVF.after_val ($FVF<val> $FVF<val>) Bool)
(declare-fun $FVF.loc_val (Int $Ref) Bool)
(declare-fun $FVF.perm_val ($FPM $Ref) $Perm)
(declare-const $fvfTOP_val $FVF<val>)
; Declaring symbols related to program functions (from program analysis)
(declare-fun elements ($Snap Array_) Set<Int>)
(declare-fun elements%limited ($Snap Array_) Set<Int>)
(declare-fun elements%stateless (Array_) Bool)
(declare-fun elements%precondition ($Snap Array_) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
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
(assert (forall ((i Int) (j Int)) (!
  (= (Seq_add i j) (+ i j))
  :pattern ((Seq_add i j))
  )))
(assert (forall ((i Int) (j Int)) (!
  (= (Seq_sub i j) (- i j))
  :pattern ((Seq_sub i j))
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
(assert (forall ((a Array_) (i Int)) (!
  (and (= (first<Array> (loc<Ref> a i)) a) (= (second<Int> (loc<Ref> a i)) i))
  :pattern ((loc<Ref> a i))
  :qid |prog.injectivity|)))
(assert (forall ((a Array_)) (!
  (>= (length<Int> a) 0)
  :pattern ((length<Int> a))
  :qid |prog.lengthNonNegative|)))
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
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :timeout 100)
(check-sat)
; unknown
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
(declare-fun inv@4@00 ($Snap Array_ $Ref) Int)
(declare-fun img@5@00 ($Snap Array_ $Ref) Bool)
(declare-fun sm@3@00 ($Snap Array_) $FVF<val>)
(declare-fun sm@6@00 ($Snap Array_) $FVF<val>)
(assert (forall ((s@$ $Snap) (this@0@00 Array_)) (!
  (= (elements%limited s@$ this@0@00) (elements s@$ this@0@00))
  :pattern ((elements s@$ this@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (this@0@00 Array_)) (!
  (elements%stateless this@0@00)
  :pattern ((elements%limited s@$ this@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (this@0@00 Array_)) (!
  (let ((result@1@00 (elements%limited s@$ this@0@00))) (and
    (forall ((i@2@00 Int)) (!
      (=>
        (Seq_contains (Seq_range 0 (length<Int> this@0@00)) i@2@00)
        (and
          (= (inv@4@00 s@$ this@0@00 (loc<Ref> this@0@00 i@2@00)) i@2@00)
          (img@5@00 s@$ this@0@00 (loc<Ref> this@0@00 i@2@00))))
      :pattern (($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> s@$) (loc<Ref> this@0@00 i@2@00)) (loc<Ref> this@0@00 i@2@00)))
      :pattern ((Seq_contains (Seq_range 0 (length<Int> this@0@00)) i@2@00))
      :pattern ((Seq_contains_trigger
        (Seq_range 0 (length<Int> this@0@00))
        i@2@00))
      :qid |quant-u-3|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@5@00 s@$ this@0@00 r)
          (Seq_contains
            (Seq_range 0 (length<Int> this@0@00))
            (inv@4@00 s@$ this@0@00 r)))
        (= (loc<Ref> this@0@00 (inv@4@00 s@$ this@0@00 r)) r))
      :pattern ((inv@4@00 s@$ this@0@00 r))
      :qid |val-fctOfInv|))
    (forall ((r $Ref)) (!
      true
      :pattern (($FVF.lookup_val (sm@3@00 s@$ this@0@00) r))
      :qid |qp.fvfResTrgDef0|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@5@00 s@$ this@0@00 r)
          (Seq_contains
            (Seq_range 0 (length<Int> this@0@00))
            (inv@4@00 s@$ this@0@00 r)))
        (=
          ($FVF.lookup_val (sm@6@00 s@$ this@0@00) r)
          ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> s@$) r)))
      :pattern (($FVF.lookup_val (sm@6@00 s@$ this@0@00) r))
      :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> s@$) r))
      :qid |qp.fvfValDef1|))
    (forall ((r $Ref)) (!
      ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> s@$) r) r)
      :pattern (($FVF.lookup_val (sm@6@00 s@$ this@0@00) r))
      :qid |qp.fvfResTrgDef2|))
    (=>
      (elements%precondition s@$ this@0@00)
      (forall ((i Int)) (!
        (=>
          (Seq_contains (Seq_range 0 (length<Int> this@0@00)) i)
          (Set_in ($FVF.lookup_val (sm@6@00 s@$ this@0@00) (loc<Ref> this@0@00 i)) result@1@00))
        :pattern (($FVF.lookup_val (sm@6@00 s@$ this@0@00) (loc<Ref> this@0@00 i)))
        :pattern ((Seq_contains (Seq_range 0 (length<Int> this@0@00)) i))
        :pattern ((Seq_contains_trigger (Seq_range 0 (length<Int> this@0@00)) i))
        :pattern ((Seq_contains_trigger (Seq_range 0 (length<Int> this@0@00)) i))
        )))))
  :pattern ((elements%limited s@$ this@0@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (this@0@00 Array_)) (!
  (let ((result@1@00 (elements%limited s@$ this@0@00))) true)
  :pattern ((elements%limited s@$ this@0@00))
  :qid |quant-u-6|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- swap01 ----------
(declare-const a@0@01 Array_)
(declare-const x@1@01 Int)
(declare-const y@2@01 Int)
(declare-const a@3@01 Array_)
(declare-const x@4@01 Int)
(declare-const y@5@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@6@01 $Snap)
(assert (= $t@6@01 ($Snap.combine ($Snap.first $t@6@01) ($Snap.second $t@6@01))))
(declare-const i@7@01 Int)
(push) ; 2
; [eval] 0 <= i && i < length(a)
; [eval] 0 <= i
(push) ; 3
; [then-branch: 0 | !(0 <= i@7@01) | live]
; [else-branch: 0 | 0 <= i@7@01 | live]
(push) ; 4
; [then-branch: 0 | !(0 <= i@7@01)]
(assert (not (<= 0 i@7@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | 0 <= i@7@01]
(assert (<= 0 i@7@01))
; [eval] i < length(a)
; [eval] length(a)
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@7@01) (not (<= 0 i@7@01))))
(assert (and (<= 0 i@7@01) (< i@7@01 (length<Int> a@3@01))))
; [eval] loc(a, i)
(declare-const sm@8@01 $FVF<val>)
; Definitional axioms for snapshot map values
; [eval] loc(a, i)
(pop) ; 2
(declare-fun inv@9@01 ($Ref) Int)
(declare-fun img@10@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@7@01 Int)) (!
  (=>
    (and (<= 0 i@7@01) (< i@7@01 (length<Int> a@3@01)))
    (or (<= 0 i@7@01) (not (<= 0 i@7@01))))
  :pattern (($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) (loc<Ref> a@3@01 i@7@01)) (loc<Ref> a@3@01 i@7@01)))
  :qid |val-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@7@01 Int) (i2@7@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@7@01) (< i1@7@01 (length<Int> a@3@01)))
      (and (<= 0 i2@7@01) (< i2@7@01 (length<Int> a@3@01)))
      (= (loc<Ref> a@3@01 i1@7@01) (loc<Ref> a@3@01 i2@7@01)))
    (= i1@7@01 i2@7@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@7@01 Int)) (!
  (=>
    (and (<= 0 i@7@01) (< i@7@01 (length<Int> a@3@01)))
    (and
      (= (inv@9@01 (loc<Ref> a@3@01 i@7@01)) i@7@01)
      (img@10@01 (loc<Ref> a@3@01 i@7@01))))
  :pattern (($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) (loc<Ref> a@3@01 i@7@01)) (loc<Ref> a@3@01 i@7@01)))
  :qid |quant-u-8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@10@01 r)
      (and (<= 0 (inv@9@01 r)) (< (inv@9@01 r) (length<Int> a@3@01))))
    (= (loc<Ref> a@3@01 (inv@9@01 r)) r))
  :pattern ((inv@9@01 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@7@01 Int)) (!
  (=>
    (and (<= 0 i@7@01) (< i@7@01 (length<Int> a@3@01)))
    (not (= (loc<Ref> a@3@01 i@7@01) $Ref.null)))
  :pattern (($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) (loc<Ref> a@3@01 i@7@01)) (loc<Ref> a@3@01 i@7@01)))
  :qid |val-permImpliesNonNull|)))
(declare-const sm@11@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@10@01 r)
      (and (<= 0 (inv@9@01 r)) (< (inv@9@01 r) (length<Int> a@3@01))))
    (=
      ($FVF.lookup_val (as sm@11@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r)))
  :pattern (($FVF.lookup_val (as sm@11@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r) r)
  :pattern (($FVF.lookup_val (as sm@11@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (<= 0 (inv@9@01 r)) (< (inv@9@01 r) (length<Int> a@3@01)))
    ($FVF.loc_val ($FVF.lookup_val (as sm@11@01  $FVF<val>) r) r))
  :pattern ((inv@9@01 r))
  :qid |quant-u-9|)))
(assert (=
  ($Snap.second $t@6@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@6@01))
    ($Snap.second ($Snap.second $t@6@01)))))
(assert (= ($Snap.first ($Snap.second $t@6@01)) $Snap.unit))
; [eval] 0 <= x
(assert (<= 0 x@4@01))
(assert (=
  ($Snap.second ($Snap.second $t@6@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@6@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@6@01))) $Snap.unit))
; [eval] x < length(a)
; [eval] length(a)
(assert (< x@4@01 (length<Int> a@3@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@6@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01)))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01)))) $Snap.unit))
; [eval] 0 <= y
(assert (<= 0 y@5@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01)))))
  $Snap.unit))
; [eval] y < length(a)
; [eval] length(a)
(assert (< y@5@01 (length<Int> a@3@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01)))))
  $Snap.unit))
; [eval] x < y
(assert (< x@4@01 y@5@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var tmp: Int
(declare-const tmp@12@01 Int)
; [exec]
; label pre
; [exec]
; inhale (forall e: Int ::
;     { (e in elements(a)) }
;     (e in elements(a)) ==>
;     (exists j: Int :: { (j in [0..length(a))) } (j in [0..length(a)))))
(declare-const $t@13@01 $Snap)
(assert (= $t@13@01 $Snap.unit))
; [eval] (forall e: Int :: { (e in elements(a)) } (e in elements(a)) ==> (exists j: Int :: { (j in [0..length(a))) } (j in [0..length(a)))))
(declare-const e@14@01 Int)
(push) ; 3
; [eval] (e in elements(a)) ==> (exists j: Int :: { (j in [0..length(a))) } (j in [0..length(a))))
; [eval] (e in elements(a))
; [eval] elements(a)
(push) ; 4
(declare-const i@15@01 Int)
(push) ; 5
; [eval] (i in [0..length(this)))
; [eval] [0..length(this))
; [eval] length(this)
(assert (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i@15@01))
; [eval] loc(this, i)
(pop) ; 5
(declare-fun inv@16@01 ($Ref) Int)
(declare-fun img@17@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((i1@15@01 Int) (i2@15@01 Int)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i1@15@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@11@01  $FVF<val>) (loc<Ref> a@3@01 i1@15@01)) (loc<Ref> a@3@01 i1@15@01)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i2@15@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@11@01  $FVF<val>) (loc<Ref> a@3@01 i2@15@01)) (loc<Ref> a@3@01 i2@15@01)))
      (= (loc<Ref> a@3@01 i1@15@01) (loc<Ref> a@3@01 i2@15@01)))
    (= i1@15@01 i2@15@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@15@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i@15@01)
    (and
      (= (inv@16@01 (loc<Ref> a@3@01 i@15@01)) i@15@01)
      (img@17@01 (loc<Ref> a@3@01 i@15@01))))
  :pattern ((loc<Ref> a@3@01 i@15@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@17@01 r)
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@16@01 r)))
    (= (loc<Ref> a@3@01 (inv@16@01 r)) r))
  :pattern ((inv@16@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@16@01 r))
    ($FVF.loc_val ($FVF.lookup_val (as sm@11@01  $FVF<val>) r) r))
  :pattern ((inv@16@01 r))
  :qid |quant-u-11|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@18@01 ((r $Ref) (e@14@01 Int)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@16@01 r))
      (img@17@01 r)
      (= r (loc<Ref> a@3@01 (inv@16@01 r))))
    ($Perm.min
      (ite
        (and
          (img@10@01 r)
          (and (<= 0 (inv@9@01 r)) (< (inv@9@01 r) (length<Int> a@3@01))))
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
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@10@01 r)
          (and (<= 0 (inv@9@01 r)) (< (inv@9@01 r) (length<Int> a@3@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@18@01 r e@14@01))
    $Perm.No)
  
  :qid |quant-u-13|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@16@01 r))
      (img@17@01 r)
      (= r (loc<Ref> a@3@01 (inv@16@01 r))))
    (= (- $Perm.Write (pTaken@18@01 r e@14@01)) $Perm.No))
  
  :qid |quant-u-14|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@19@01 $FVF<val>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@19@01  $FVF<val>)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@16@01 r))
        (img@17@01 r)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@16@01 r))
        (img@17@01 r))
      (Set_in r ($FVF.domain_val (as sm@19@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@19@01  $FVF<val>))))
  :qid |qp.fvfDomDef5|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@16@01 r))
        (img@17@01 r))
      (and
        (img@10@01 r)
        (and (<= 0 (inv@9@01 r)) (< (inv@9@01 r) (length<Int> a@3@01)))))
    (=
      ($FVF.lookup_val (as sm@19@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r)))
  :pattern (($FVF.lookup_val (as sm@19@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r) r)
  :pattern (($FVF.lookup_val (as sm@19@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef4|)))
(assert (elements%precondition ($SortWrappers.$FVF<val>To$Snap (as sm@19@01  $FVF<val>)) a@3@01))
(pop) ; 4
; Joined path conditions
(assert (forall ((i@15@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i@15@01)
    (and
      (= (inv@16@01 (loc<Ref> a@3@01 i@15@01)) i@15@01)
      (img@17@01 (loc<Ref> a@3@01 i@15@01))))
  :pattern ((loc<Ref> a@3@01 i@15@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@17@01 r)
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@16@01 r)))
    (= (loc<Ref> a@3@01 (inv@16@01 r)) r))
  :pattern ((inv@16@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@19@01  $FVF<val>)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@16@01 r))
        (img@17@01 r)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@16@01 r))
        (img@17@01 r))
      (Set_in r ($FVF.domain_val (as sm@19@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@19@01  $FVF<val>))))
  :qid |qp.fvfDomDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@16@01 r))
        (img@17@01 r))
      (and
        (img@10@01 r)
        (and (<= 0 (inv@9@01 r)) (< (inv@9@01 r) (length<Int> a@3@01)))))
    (=
      ($FVF.lookup_val (as sm@19@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r)))
  :pattern (($FVF.lookup_val (as sm@19@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r) r)
  :pattern (($FVF.lookup_val (as sm@19@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef4|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@16@01 r))
      ($FVF.loc_val ($FVF.lookup_val (as sm@11@01  $FVF<val>) r) r))
    :pattern ((inv@16@01 r))
    :qid |quant-u-11|))
  (elements%precondition ($SortWrappers.$FVF<val>To$Snap (as sm@19@01  $FVF<val>)) a@3@01)))
(set-option :timeout 0)
(push) ; 4
; [then-branch: 1 | e@14@01 in elements(sm@19@01, a@3@01) | live]
; [else-branch: 1 | !(e@14@01 in elements(sm@19@01, a@3@01)) | live]
(push) ; 5
; [then-branch: 1 | e@14@01 in elements(sm@19@01, a@3@01)]
(assert (Set_in e@14@01 (elements ($SortWrappers.$FVF<val>To$Snap (as sm@19@01  $FVF<val>)) a@3@01)))
; [eval] (exists j: Int :: { (j in [0..length(a))) } (j in [0..length(a))))
(declare-const j@20@01 Int)
(push) ; 6
; [eval] (j in [0..length(a)))
; [eval] [0..length(a))
; [eval] length(a)
(pop) ; 6
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(pop) ; 5
(push) ; 5
; [else-branch: 1 | !(e@14@01 in elements(sm@19@01, a@3@01))]
(assert (not
  (Set_in e@14@01 (elements ($SortWrappers.$FVF<val>To$Snap (as sm@19@01  $FVF<val>)) a@3@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (Set_in e@14@01 (elements ($SortWrappers.$FVF<val>To$Snap (as sm@19@01  $FVF<val>)) a@3@01)))
  (Set_in e@14@01 (elements ($SortWrappers.$FVF<val>To$Snap (as sm@19@01  $FVF<val>)) a@3@01))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((i@15@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i@15@01)
    (and
      (= (inv@16@01 (loc<Ref> a@3@01 i@15@01)) i@15@01)
      (img@17@01 (loc<Ref> a@3@01 i@15@01))))
  :pattern ((loc<Ref> a@3@01 i@15@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@17@01 r)
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@16@01 r)))
    (= (loc<Ref> a@3@01 (inv@16@01 r)) r))
  :pattern ((inv@16@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@19@01  $FVF<val>)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@16@01 r))
        (img@17@01 r)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@16@01 r))
        (img@17@01 r))
      (Set_in r ($FVF.domain_val (as sm@19@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@19@01  $FVF<val>))))
  :qid |qp.fvfDomDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@16@01 r))
        (img@17@01 r))
      (and
        (img@10@01 r)
        (and (<= 0 (inv@9@01 r)) (< (inv@9@01 r) (length<Int> a@3@01)))))
    (=
      ($FVF.lookup_val (as sm@19@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r)))
  :pattern (($FVF.lookup_val (as sm@19@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r) r)
  :pattern (($FVF.lookup_val (as sm@19@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@16@01 r))
    ($FVF.loc_val ($FVF.lookup_val (as sm@11@01  $FVF<val>) r) r))
  :pattern ((inv@16@01 r))
  :qid |quant-u-11|)))
(assert (elements%precondition ($SortWrappers.$FVF<val>To$Snap (as sm@19@01  $FVF<val>)) a@3@01))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((e@14@01 Int)) (!
  (or
    (not
      (Set_in e@14@01 (elements ($SortWrappers.$FVF<val>To$Snap (as sm@19@01  $FVF<val>)) a@3@01)))
    (Set_in e@14@01 (elements ($SortWrappers.$FVF<val>To$Snap (as sm@19@01  $FVF<val>)) a@3@01)))
  :pattern ((Set_in e@14@01 (elements ($SortWrappers.$FVF<val>To$Snap (as sm@19@01  $FVF<val>)) a@3@01)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0207.vpr@20@11@20@83-aux|)))
(assert (forall ((e@14@01 Int)) (!
  (=>
    (Set_in e@14@01 (elements ($SortWrappers.$FVF<val>To$Snap (as sm@19@01  $FVF<val>)) a@3@01))
    (exists ((j@20@01 Int)) (!
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) j@20@01)
      :pattern ((Seq_contains (Seq_range 0 (length<Int> a@3@01)) j@20@01))
      :pattern ((Seq_contains_trigger (Seq_range 0 (length<Int> a@3@01)) j@20@01))
      :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0207.vpr@20@48@20@83|)))
  :pattern ((Set_in e@14@01 (elements ($SortWrappers.$FVF<val>To$Snap (as sm@19@01  $FVF<val>)) a@3@01)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0207.vpr@20@11@20@83|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; tmp := loc(a, x).val
; [eval] loc(a, x)
(assert ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) (loc<Ref> a@3@01 x@4@01)) (loc<Ref> a@3@01 x@4@01)))
(set-option :timeout 0)
(push) ; 3
(assert (not (and
  (img@10@01 (loc<Ref> a@3@01 x@4@01))
  (and
    (<= 0 (inv@9@01 (loc<Ref> a@3@01 x@4@01)))
    (< (inv@9@01 (loc<Ref> a@3@01 x@4@01)) (length<Int> a@3@01))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const tmp@21@01 Int)
(assert (=
  tmp@21@01
  ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) (loc<Ref> a@3@01 x@4@01))))
; [exec]
; loc(a, x).val := loc(a, y).val
; [eval] loc(a, x)
; [eval] loc(a, y)
(assert ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) (loc<Ref> a@3@01 y@5@01)) (loc<Ref> a@3@01 y@5@01)))
(push) ; 3
(assert (not (and
  (img@10@01 (loc<Ref> a@3@01 y@5@01))
  (and
    (<= 0 (inv@9@01 (loc<Ref> a@3@01 y@5@01)))
    (< (inv@9@01 (loc<Ref> a@3@01 y@5@01)) (length<Int> a@3@01))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const sm@22@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@10@01 r)
      (and (<= 0 (inv@9@01 r)) (< (inv@9@01 r) (length<Int> a@3@01))))
    (=
      ($FVF.lookup_val (as sm@22@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r)))
  :pattern (($FVF.lookup_val (as sm@22@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r) r)
  :pattern (($FVF.lookup_val (as sm@22@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef7|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@22@01  $FVF<val>) (loc<Ref> a@3@01 x@4@01)) (loc<Ref> a@3@01 x@4@01)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@23@01 ((r $Ref)) $Perm
  (ite
    (= r (loc<Ref> a@3@01 x@4@01))
    ($Perm.min
      (ite
        (and
          (img@10@01 r)
          (and (<= 0 (inv@9@01 r)) (< (inv@9@01 r) (length<Int> a@3@01))))
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
          (img@10@01 r)
          (and (<= 0 (inv@9@01 r)) (< (inv@9@01 r) (length<Int> a@3@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@23@01 r))
    $Perm.No)
  
  :qid |quant-u-16|))))
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
  
  :qid |quant-u-17|))))
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
    (= r (loc<Ref> a@3@01 x@4@01))
    (= (- $Perm.Write (pTaken@23@01 r)) $Perm.No))
  
  :qid |quant-u-18|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@24@01 $FVF<val>)
; Definitional axioms for singleton-FVF's value
(assert (=
  ($FVF.lookup_val (as sm@24@01  $FVF<val>) (loc<Ref> a@3@01 x@4@01))
  ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) (loc<Ref> a@3@01 y@5@01))))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@24@01  $FVF<val>) (loc<Ref> a@3@01 x@4@01)) (loc<Ref> a@3@01 x@4@01)))
; [exec]
; loc(a, y).val := tmp
; [eval] loc(a, y)
(declare-const sm@25@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@3@01 x@4@01))
    (=
      ($FVF.lookup_val (as sm@25@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@24@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@25@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@24@01  $FVF<val>) r))
  :qid |qp.fvfValDef8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@10@01 r)
        (and (<= 0 (inv@9@01 r)) (< (inv@9@01 r) (length<Int> a@3@01))))
      (< $Perm.No (- $Perm.Write (pTaken@23@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@25@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r)))
  :pattern (($FVF.lookup_val (as sm@25@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@24@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r) r))
  :pattern (($FVF.lookup_val (as sm@25@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef10|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@25@01  $FVF<val>) (loc<Ref> a@3@01 y@5@01)) (loc<Ref> a@3@01 y@5@01)))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (loc<Ref> a@3@01 x@4@01) (loc<Ref> a@3@01 y@5@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@26@01 ((r $Ref)) $Perm
  (ite
    (= r (loc<Ref> a@3@01 y@5@01))
    ($Perm.min
      (ite
        (and
          (img@10@01 r)
          (and (<= 0 (inv@9@01 r)) (< (inv@9@01 r) (length<Int> a@3@01))))
        (- $Perm.Write (pTaken@23@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@27@01 ((r $Ref)) $Perm
  (ite
    (= r (loc<Ref> a@3@01 y@5@01))
    ($Perm.min
      (ite (= r (loc<Ref> a@3@01 x@4@01)) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@26@01 r)))
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
          (img@10@01 r)
          (and (<= 0 (inv@9@01 r)) (< (inv@9@01 r) (length<Int> a@3@01))))
        (- $Perm.Write (pTaken@23@01 r))
        $Perm.No)
      (pTaken@26@01 r))
    $Perm.No)
  
  :qid |quant-u-20|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@26@01 r) $Perm.No)
  
  :qid |quant-u-21|))))
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
    (= r (loc<Ref> a@3@01 y@5@01))
    (= (- $Perm.Write (pTaken@26@01 r)) $Perm.No))
  
  :qid |quant-u-22|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@28@01 $FVF<val>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_val (as sm@28@01  $FVF<val>) (loc<Ref> a@3@01 y@5@01)) tmp@21@01))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@28@01  $FVF<val>) (loc<Ref> a@3@01 y@5@01)) (loc<Ref> a@3@01 y@5@01)))
; [exec]
; assert elements(a) == old(elements(a))
; [eval] elements(a) == old(elements(a))
; [eval] elements(a)
(set-option :timeout 0)
(push) ; 3
(declare-const i@29@01 Int)
(push) ; 4
; [eval] (i in [0..length(this)))
; [eval] [0..length(this))
; [eval] length(this)
(assert (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i@29@01))
; [eval] loc(this, i)
(pop) ; 4
(declare-fun inv@30@01 ($Ref) Int)
(declare-fun img@31@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-const sm@32@01 $FVF<val>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@3@01 y@5@01))
    (=
      ($FVF.lookup_val (as sm@32@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@28@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@32@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@28@01  $FVF<val>) r))
  :qid |qp.fvfValDef11|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@3@01 x@4@01))
    (=
      ($FVF.lookup_val (as sm@32@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@24@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@32@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@24@01  $FVF<val>) r))
  :qid |qp.fvfValDef12|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@10@01 r)
        (and (<= 0 (inv@9@01 r)) (< (inv@9@01 r) (length<Int> a@3@01))))
      (< $Perm.No (- (- $Perm.Write (pTaken@23@01 r)) (pTaken@26@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@32@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r)))
  :pattern (($FVF.lookup_val (as sm@32@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r))
  :qid |qp.fvfValDef13|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@28@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@24@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r) r))
  :pattern (($FVF.lookup_val (as sm@32@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef14|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@29@01 Int) (i2@29@01 Int)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i1@29@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@32@01  $FVF<val>) (loc<Ref> a@3@01 i1@29@01)) (loc<Ref> a@3@01 i1@29@01)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i2@29@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@32@01  $FVF<val>) (loc<Ref> a@3@01 i2@29@01)) (loc<Ref> a@3@01 i2@29@01)))
      (= (loc<Ref> a@3@01 i1@29@01) (loc<Ref> a@3@01 i2@29@01)))
    (= i1@29@01 i2@29@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@29@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i@29@01)
    (and
      (= (inv@30@01 (loc<Ref> a@3@01 i@29@01)) i@29@01)
      (img@31@01 (loc<Ref> a@3@01 i@29@01))))
  :pattern ((loc<Ref> a@3@01 i@29@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@31@01 r)
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@30@01 r)))
    (= (loc<Ref> a@3@01 (inv@30@01 r)) r))
  :pattern ((inv@30@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@30@01 r))
    ($FVF.loc_val ($FVF.lookup_val (as sm@32@01  $FVF<val>) r) r))
  :pattern ((inv@30@01 r))
  :qid |quant-u-24|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@33@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@30@01 r))
      (img@31@01 r)
      (= r (loc<Ref> a@3@01 (inv@30@01 r))))
    ($Perm.min
      (ite
        (and
          (img@10@01 r)
          (and (<= 0 (inv@9@01 r)) (< (inv@9@01 r) (length<Int> a@3@01))))
        (- (- $Perm.Write (pTaken@23@01 r)) (pTaken@26@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@34@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@30@01 r))
      (img@31@01 r)
      (= r (loc<Ref> a@3@01 (inv@30@01 r))))
    ($Perm.min
      (ite (= r (loc<Ref> a@3@01 y@5@01)) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@33@01 r)))
    $Perm.No))
(define-fun pTaken@35@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@30@01 r))
      (img@31@01 r)
      (= r (loc<Ref> a@3@01 (inv@30@01 r))))
    ($Perm.min
      (ite (= r (loc<Ref> a@3@01 x@4@01)) $Perm.Write $Perm.No)
      (- (- $Perm.Write (pTaken@33@01 r)) (pTaken@34@01 r)))
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
          (img@10@01 r)
          (and (<= 0 (inv@9@01 r)) (< (inv@9@01 r) (length<Int> a@3@01))))
        (- (- $Perm.Write (pTaken@23@01 r)) (pTaken@26@01 r))
        $Perm.No)
      (pTaken@33@01 r))
    $Perm.No)
  
  :qid |quant-u-26|))))
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
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@30@01 r))
      (img@31@01 r)
      (= r (loc<Ref> a@3@01 (inv@30@01 r))))
    (= (- $Perm.Write (pTaken@33@01 r)) $Perm.No))
  
  :qid |quant-u-27|))))
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
    (ite
      (= (loc<Ref> a@3@01 y@5@01) (loc<Ref> a@3@01 y@5@01))
      $Perm.Write
      $Perm.No)
    (pTaken@34@01 (loc<Ref> a@3@01 y@5@01)))
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
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@30@01 r))
      (img@31@01 r)
      (= r (loc<Ref> a@3@01 (inv@30@01 r))))
    (= (- (- $Perm.Write (pTaken@33@01 r)) (pTaken@34@01 r)) $Perm.No))
  
  :qid |quant-u-29|))))
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
    (ite
      (= (loc<Ref> a@3@01 x@4@01) (loc<Ref> a@3@01 x@4@01))
      $Perm.Write
      $Perm.No)
    (pTaken@35@01 (loc<Ref> a@3@01 x@4@01)))
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
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@30@01 r))
      (img@31@01 r)
      (= r (loc<Ref> a@3@01 (inv@30@01 r))))
    (=
      (- (- (- $Perm.Write (pTaken@33@01 r)) (pTaken@34@01 r)) (pTaken@35@01 r))
      $Perm.No))
  
  :qid |quant-u-31|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@36@01 $FVF<val>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@36@01  $FVF<val>)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@30@01 r))
        (img@31@01 r)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@30@01 r))
        (img@31@01 r))
      (Set_in r ($FVF.domain_val (as sm@36@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@36@01  $FVF<val>))))
  :qid |qp.fvfDomDef19|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@30@01 r))
        (img@31@01 r))
      (= r (loc<Ref> a@3@01 y@5@01)))
    (=
      ($FVF.lookup_val (as sm@36@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@28@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@36@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@28@01  $FVF<val>) r))
  :qid |qp.fvfValDef15|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@30@01 r))
        (img@31@01 r))
      (= r (loc<Ref> a@3@01 x@4@01)))
    (=
      ($FVF.lookup_val (as sm@36@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@24@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@36@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@24@01  $FVF<val>) r))
  :qid |qp.fvfValDef16|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@30@01 r))
        (img@31@01 r))
      (ite
        (and
          (img@10@01 r)
          (and (<= 0 (inv@9@01 r)) (< (inv@9@01 r) (length<Int> a@3@01))))
        (< $Perm.No (- (- $Perm.Write (pTaken@23@01 r)) (pTaken@26@01 r)))
        false))
    (=
      ($FVF.lookup_val (as sm@36@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r)))
  :pattern (($FVF.lookup_val (as sm@36@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r))
  :qid |qp.fvfValDef17|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@28@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@24@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r) r))
  :pattern (($FVF.lookup_val (as sm@36@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef18|)))
(assert (elements%precondition ($SortWrappers.$FVF<val>To$Snap (as sm@36@01  $FVF<val>)) a@3@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@3@01 y@5@01))
    (=
      ($FVF.lookup_val (as sm@32@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@28@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@32@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@28@01  $FVF<val>) r))
  :qid |qp.fvfValDef11|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@3@01 x@4@01))
    (=
      ($FVF.lookup_val (as sm@32@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@24@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@32@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@24@01  $FVF<val>) r))
  :qid |qp.fvfValDef12|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@10@01 r)
        (and (<= 0 (inv@9@01 r)) (< (inv@9@01 r) (length<Int> a@3@01))))
      (< $Perm.No (- (- $Perm.Write (pTaken@23@01 r)) (pTaken@26@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@32@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r)))
  :pattern (($FVF.lookup_val (as sm@32@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r))
  :qid |qp.fvfValDef13|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@28@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@24@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r) r))
  :pattern (($FVF.lookup_val (as sm@32@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef14|)))
(assert (forall ((i@29@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i@29@01)
    (and
      (= (inv@30@01 (loc<Ref> a@3@01 i@29@01)) i@29@01)
      (img@31@01 (loc<Ref> a@3@01 i@29@01))))
  :pattern ((loc<Ref> a@3@01 i@29@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@31@01 r)
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@30@01 r)))
    (= (loc<Ref> a@3@01 (inv@30@01 r)) r))
  :pattern ((inv@30@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@36@01  $FVF<val>)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@30@01 r))
        (img@31@01 r)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@30@01 r))
        (img@31@01 r))
      (Set_in r ($FVF.domain_val (as sm@36@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@36@01  $FVF<val>))))
  :qid |qp.fvfDomDef19|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@30@01 r))
        (img@31@01 r))
      (= r (loc<Ref> a@3@01 y@5@01)))
    (=
      ($FVF.lookup_val (as sm@36@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@28@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@36@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@28@01  $FVF<val>) r))
  :qid |qp.fvfValDef15|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@30@01 r))
        (img@31@01 r))
      (= r (loc<Ref> a@3@01 x@4@01)))
    (=
      ($FVF.lookup_val (as sm@36@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@24@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@36@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@24@01  $FVF<val>) r))
  :qid |qp.fvfValDef16|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@30@01 r))
        (img@31@01 r))
      (ite
        (and
          (img@10@01 r)
          (and (<= 0 (inv@9@01 r)) (< (inv@9@01 r) (length<Int> a@3@01))))
        (< $Perm.No (- (- $Perm.Write (pTaken@23@01 r)) (pTaken@26@01 r)))
        false))
    (=
      ($FVF.lookup_val (as sm@36@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r)))
  :pattern (($FVF.lookup_val (as sm@36@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r))
  :qid |qp.fvfValDef17|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@28@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@24@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r) r))
  :pattern (($FVF.lookup_val (as sm@36@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef18|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@30@01 r))
      ($FVF.loc_val ($FVF.lookup_val (as sm@32@01  $FVF<val>) r) r))
    :pattern ((inv@30@01 r))
    :qid |quant-u-24|))
  (elements%precondition ($SortWrappers.$FVF<val>To$Snap (as sm@36@01  $FVF<val>)) a@3@01)))
; [eval] old(elements(a))
; [eval] elements(a)
(set-option :timeout 0)
(push) ; 3
(declare-const i@37@01 Int)
(push) ; 4
; [eval] (i in [0..length(this)))
; [eval] [0..length(this))
; [eval] length(this)
(assert (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i@37@01))
; [eval] loc(this, i)
(pop) ; 4
(declare-fun inv@38@01 ($Ref) Int)
(declare-fun img@39@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@37@01 Int) (i2@37@01 Int)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i1@37@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@22@01  $FVF<val>) (loc<Ref> a@3@01 i1@37@01)) (loc<Ref> a@3@01 i1@37@01)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i2@37@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@22@01  $FVF<val>) (loc<Ref> a@3@01 i2@37@01)) (loc<Ref> a@3@01 i2@37@01)))
      (= (loc<Ref> a@3@01 i1@37@01) (loc<Ref> a@3@01 i2@37@01)))
    (= i1@37@01 i2@37@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@37@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i@37@01)
    (and
      (= (inv@38@01 (loc<Ref> a@3@01 i@37@01)) i@37@01)
      (img@39@01 (loc<Ref> a@3@01 i@37@01))))
  :pattern ((loc<Ref> a@3@01 i@37@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@39@01 r)
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@38@01 r)))
    (= (loc<Ref> a@3@01 (inv@38@01 r)) r))
  :pattern ((inv@38@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@38@01 r))
    ($FVF.loc_val ($FVF.lookup_val (as sm@22@01  $FVF<val>) r) r))
  :pattern ((inv@38@01 r))
  :qid |quant-u-33|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@40@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@38@01 r))
      (img@39@01 r)
      (= r (loc<Ref> a@3@01 (inv@38@01 r))))
    ($Perm.min
      (ite
        (and
          (img@10@01 r)
          (and (<= 0 (inv@9@01 r)) (< (inv@9@01 r) (length<Int> a@3@01))))
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
        (and
          (img@10@01 r)
          (and (<= 0 (inv@9@01 r)) (< (inv@9@01 r) (length<Int> a@3@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@40@01 r))
    $Perm.No)
  
  :qid |quant-u-35|))))
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
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@38@01 r))
      (img@39@01 r)
      (= r (loc<Ref> a@3@01 (inv@38@01 r))))
    (= (- $Perm.Write (pTaken@40@01 r)) $Perm.No))
  
  :qid |quant-u-36|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@41@01 $FVF<val>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@41@01  $FVF<val>)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@38@01 r))
        (img@39@01 r)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@38@01 r))
        (img@39@01 r))
      (Set_in r ($FVF.domain_val (as sm@41@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@41@01  $FVF<val>))))
  :qid |qp.fvfDomDef22|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@38@01 r))
        (img@39@01 r))
      (and
        (img@10@01 r)
        (and (<= 0 (inv@9@01 r)) (< (inv@9@01 r) (length<Int> a@3@01)))))
    (=
      ($FVF.lookup_val (as sm@41@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r)))
  :pattern (($FVF.lookup_val (as sm@41@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r))
  :qid |qp.fvfValDef20|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r) r)
  :pattern (($FVF.lookup_val (as sm@41@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef21|)))
(assert (elements%precondition ($SortWrappers.$FVF<val>To$Snap (as sm@41@01  $FVF<val>)) a@3@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((i@37@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i@37@01)
    (and
      (= (inv@38@01 (loc<Ref> a@3@01 i@37@01)) i@37@01)
      (img@39@01 (loc<Ref> a@3@01 i@37@01))))
  :pattern ((loc<Ref> a@3@01 i@37@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@39@01 r)
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@38@01 r)))
    (= (loc<Ref> a@3@01 (inv@38@01 r)) r))
  :pattern ((inv@38@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@41@01  $FVF<val>)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@38@01 r))
        (img@39@01 r)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@38@01 r))
        (img@39@01 r))
      (Set_in r ($FVF.domain_val (as sm@41@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@41@01  $FVF<val>))))
  :qid |qp.fvfDomDef22|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@38@01 r))
        (img@39@01 r))
      (and
        (img@10@01 r)
        (and (<= 0 (inv@9@01 r)) (< (inv@9@01 r) (length<Int> a@3@01)))))
    (=
      ($FVF.lookup_val (as sm@41@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r)))
  :pattern (($FVF.lookup_val (as sm@41@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r))
  :qid |qp.fvfValDef20|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r) r)
  :pattern (($FVF.lookup_val (as sm@41@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef21|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@38@01 r))
      ($FVF.loc_val ($FVF.lookup_val (as sm@22@01  $FVF<val>) r) r))
    :pattern ((inv@38@01 r))
    :qid |quant-u-33|))
  (elements%precondition ($SortWrappers.$FVF<val>To$Snap (as sm@41@01  $FVF<val>)) a@3@01)))
(set-option :timeout 0)
(push) ; 3
(assert (not (Set_equal (elements ($SortWrappers.$FVF<val>To$Snap (as sm@36@01  $FVF<val>)) a@3@01) (elements ($SortWrappers.$FVF<val>To$Snap (as sm@41@01  $FVF<val>)) a@3@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,01s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (loc<Ref> a@3@01 y@5@01) (loc<Ref> a@3@01 x@4@01))))
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
      (= (loc<Ref> a@3@01 y@5@01) (loc<Ref> a@3@01 y@5@01))
      $Perm.Write
      $Perm.No)
    (ite
      (= (loc<Ref> a@3@01 x@4@01) (loc<Ref> a@3@01 x@4@01))
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
      (= (loc<Ref> a@3@01 x@4@01) (loc<Ref> a@3@01 x@4@01))
      $Perm.Write
      $Perm.No)
    (ite
      (= (loc<Ref> a@3@01 y@5@01) (loc<Ref> a@3@01 y@5@01))
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
    (= (loc<Ref> a@3@01 y@5@01) (loc<Ref> a@3@01 y@5@01))
    (= (loc<Ref> a@3@01 x@4@01) (loc<Ref> a@3@01 x@4@01)))
  (not
    (=
      ($FVF.lookup_val (as sm@28@01  $FVF<val>) (loc<Ref> a@3@01 y@5@01))
      ($FVF.lookup_val (as sm@24@01  $FVF<val>) (loc<Ref> a@3@01 x@4@01)))))))
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
    (= (loc<Ref> a@3@01 x@4@01) (loc<Ref> a@3@01 x@4@01))
    (= (loc<Ref> a@3@01 y@5@01) (loc<Ref> a@3@01 y@5@01)))
  (not
    (=
      ($FVF.lookup_val (as sm@24@01  $FVF<val>) (loc<Ref> a@3@01 x@4@01))
      ($FVF.lookup_val (as sm@28@01  $FVF<val>) (loc<Ref> a@3@01 y@5@01)))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and
  (not (= (loc<Ref> a@3@01 y@5@01) (loc<Ref> a@3@01 x@4@01)))
  (not (= (loc<Ref> a@3@01 x@4@01) (loc<Ref> a@3@01 y@5@01)))))
(declare-const sm@42@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@3@01 y@5@01))
    (=
      ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@28@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@28@01  $FVF<val>) r))
  :qid |qp.fvfValDef23|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@3@01 x@4@01))
    (=
      ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@24@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@24@01  $FVF<val>) r))
  :qid |qp.fvfValDef24|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@10@01 r)
        (and (<= 0 (inv@9@01 r)) (< (inv@9@01 r) (length<Int> a@3@01))))
      (< $Perm.No (- (- $Perm.Write (pTaken@23@01 r)) (pTaken@26@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@42@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r)))
  :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r))
  :qid |qp.fvfValDef25|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@28@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@24@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r) r))
  :pattern (($FVF.lookup_val (as sm@42@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef26|)))
(declare-const pm@43@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@43@01  $FPM) r)
    (+
      (+
        (ite (= r (loc<Ref> a@3@01 y@5@01)) $Perm.Write $Perm.No)
        (ite (= r (loc<Ref> a@3@01 x@4@01)) $Perm.Write $Perm.No))
      (ite
        (and
          (img@10@01 r)
          (and (<= 0 (inv@9@01 r)) (< (inv@9@01 r) (length<Int> a@3@01))))
        (- (- $Perm.Write (pTaken@23@01 r)) (pTaken@26@01 r))
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@43@01  $FPM) r))
  :qid |qp.resPrmSumDef27|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@42@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@28@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@24@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r) r))
  :pattern (($FVF.perm_val (as pm@43@01  $FPM) r))
  :qid |qp.resTrgDef28|)))
; Assume upper permission bound for field val
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_val (as pm@43@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_val ($FVF.lookup_val (as sm@42@01  $FVF<val>) r) r))
  :qid |qp-fld-prm-bnd|)))
; [eval] elements(a) == old(elements(a))
; [eval] elements(a)
(set-option :timeout 0)
(push) ; 3
(declare-const i@44@01 Int)
(push) ; 4
; [eval] (i in [0..length(this)))
; [eval] [0..length(this))
; [eval] length(this)
(assert (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i@44@01))
; [eval] loc(this, i)
(pop) ; 4
(declare-fun inv@45@01 ($Ref) Int)
(declare-fun img@46@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-const sm@47@01 $FVF<val>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@10@01 r)
        (and (<= 0 (inv@9@01 r)) (< (inv@9@01 r) (length<Int> a@3@01))))
      (< $Perm.No (- (- $Perm.Write (pTaken@23@01 r)) (pTaken@26@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@47@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r)))
  :pattern (($FVF.lookup_val (as sm@47@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r))
  :qid |qp.fvfValDef29|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@3@01 x@4@01))
    (=
      ($FVF.lookup_val (as sm@47@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@24@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@47@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@24@01  $FVF<val>) r))
  :qid |qp.fvfValDef30|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@3@01 y@5@01))
    (=
      ($FVF.lookup_val (as sm@47@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@28@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@47@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@28@01  $FVF<val>) r))
  :qid |qp.fvfValDef31|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@24@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@28@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@47@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef32|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@44@01 Int) (i2@44@01 Int)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i1@44@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@47@01  $FVF<val>) (loc<Ref> a@3@01 i1@44@01)) (loc<Ref> a@3@01 i1@44@01)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i2@44@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@47@01  $FVF<val>) (loc<Ref> a@3@01 i2@44@01)) (loc<Ref> a@3@01 i2@44@01)))
      (= (loc<Ref> a@3@01 i1@44@01) (loc<Ref> a@3@01 i2@44@01)))
    (= i1@44@01 i2@44@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@44@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i@44@01)
    (and
      (= (inv@45@01 (loc<Ref> a@3@01 i@44@01)) i@44@01)
      (img@46@01 (loc<Ref> a@3@01 i@44@01))))
  :pattern ((loc<Ref> a@3@01 i@44@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@46@01 r)
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@45@01 r)))
    (= (loc<Ref> a@3@01 (inv@45@01 r)) r))
  :pattern ((inv@45@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@45@01 r))
    ($FVF.loc_val ($FVF.lookup_val (as sm@47@01  $FVF<val>) r) r))
  :pattern ((inv@45@01 r))
  :qid |quant-u-38|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@48@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@45@01 r))
      (img@46@01 r)
      (= r (loc<Ref> a@3@01 (inv@45@01 r))))
    ($Perm.min
      (ite
        (and
          (img@10@01 r)
          (and (<= 0 (inv@9@01 r)) (< (inv@9@01 r) (length<Int> a@3@01))))
        (- (- $Perm.Write (pTaken@23@01 r)) (pTaken@26@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@49@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@45@01 r))
      (img@46@01 r)
      (= r (loc<Ref> a@3@01 (inv@45@01 r))))
    ($Perm.min
      (ite (= r (loc<Ref> a@3@01 x@4@01)) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@48@01 r)))
    $Perm.No))
(define-fun pTaken@50@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@45@01 r))
      (img@46@01 r)
      (= r (loc<Ref> a@3@01 (inv@45@01 r))))
    ($Perm.min
      (ite (= r (loc<Ref> a@3@01 y@5@01)) $Perm.Write $Perm.No)
      (- (- $Perm.Write (pTaken@48@01 r)) (pTaken@49@01 r)))
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
          (img@10@01 r)
          (and (<= 0 (inv@9@01 r)) (< (inv@9@01 r) (length<Int> a@3@01))))
        (- (- $Perm.Write (pTaken@23@01 r)) (pTaken@26@01 r))
        $Perm.No)
      (pTaken@48@01 r))
    $Perm.No)
  
  :qid |quant-u-40|))))
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
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@45@01 r))
      (img@46@01 r)
      (= r (loc<Ref> a@3@01 (inv@45@01 r))))
    (= (- $Perm.Write (pTaken@48@01 r)) $Perm.No))
  
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
    (ite
      (= (loc<Ref> a@3@01 x@4@01) (loc<Ref> a@3@01 x@4@01))
      $Perm.Write
      $Perm.No)
    (pTaken@49@01 (loc<Ref> a@3@01 x@4@01)))
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
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@45@01 r))
      (img@46@01 r)
      (= r (loc<Ref> a@3@01 (inv@45@01 r))))
    (= (- (- $Perm.Write (pTaken@48@01 r)) (pTaken@49@01 r)) $Perm.No))
  
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
    (ite
      (= (loc<Ref> a@3@01 y@5@01) (loc<Ref> a@3@01 y@5@01))
      $Perm.Write
      $Perm.No)
    (pTaken@50@01 (loc<Ref> a@3@01 y@5@01)))
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
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@45@01 r))
      (img@46@01 r)
      (= r (loc<Ref> a@3@01 (inv@45@01 r))))
    (=
      (- (- (- $Perm.Write (pTaken@48@01 r)) (pTaken@49@01 r)) (pTaken@50@01 r))
      $Perm.No))
  
  :qid |quant-u-45|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@51@01 $FVF<val>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@51@01  $FVF<val>)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@45@01 r))
        (img@46@01 r)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@45@01 r))
        (img@46@01 r))
      (Set_in r ($FVF.domain_val (as sm@51@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@51@01  $FVF<val>))))
  :qid |qp.fvfDomDef37|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@45@01 r))
        (img@46@01 r))
      (ite
        (and
          (img@10@01 r)
          (and (<= 0 (inv@9@01 r)) (< (inv@9@01 r) (length<Int> a@3@01))))
        (< $Perm.No (- (- $Perm.Write (pTaken@23@01 r)) (pTaken@26@01 r)))
        false))
    (=
      ($FVF.lookup_val (as sm@51@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r)))
  :pattern (($FVF.lookup_val (as sm@51@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r))
  :qid |qp.fvfValDef33|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@45@01 r))
        (img@46@01 r))
      (= r (loc<Ref> a@3@01 x@4@01)))
    (=
      ($FVF.lookup_val (as sm@51@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@24@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@51@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@24@01  $FVF<val>) r))
  :qid |qp.fvfValDef34|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@45@01 r))
        (img@46@01 r))
      (= r (loc<Ref> a@3@01 y@5@01)))
    (=
      ($FVF.lookup_val (as sm@51@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@28@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@51@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@28@01  $FVF<val>) r))
  :qid |qp.fvfValDef35|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@24@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@28@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@51@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef36|)))
(assert (elements%precondition ($SortWrappers.$FVF<val>To$Snap (as sm@51@01  $FVF<val>)) a@3@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@10@01 r)
        (and (<= 0 (inv@9@01 r)) (< (inv@9@01 r) (length<Int> a@3@01))))
      (< $Perm.No (- (- $Perm.Write (pTaken@23@01 r)) (pTaken@26@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@47@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r)))
  :pattern (($FVF.lookup_val (as sm@47@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r))
  :qid |qp.fvfValDef29|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@3@01 x@4@01))
    (=
      ($FVF.lookup_val (as sm@47@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@24@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@47@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@24@01  $FVF<val>) r))
  :qid |qp.fvfValDef30|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@3@01 y@5@01))
    (=
      ($FVF.lookup_val (as sm@47@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@28@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@47@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@28@01  $FVF<val>) r))
  :qid |qp.fvfValDef31|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@24@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@28@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@47@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef32|)))
(assert (forall ((i@44@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i@44@01)
    (and
      (= (inv@45@01 (loc<Ref> a@3@01 i@44@01)) i@44@01)
      (img@46@01 (loc<Ref> a@3@01 i@44@01))))
  :pattern ((loc<Ref> a@3@01 i@44@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@46@01 r)
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@45@01 r)))
    (= (loc<Ref> a@3@01 (inv@45@01 r)) r))
  :pattern ((inv@45@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@51@01  $FVF<val>)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@45@01 r))
        (img@46@01 r)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@45@01 r))
        (img@46@01 r))
      (Set_in r ($FVF.domain_val (as sm@51@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@51@01  $FVF<val>))))
  :qid |qp.fvfDomDef37|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@45@01 r))
        (img@46@01 r))
      (ite
        (and
          (img@10@01 r)
          (and (<= 0 (inv@9@01 r)) (< (inv@9@01 r) (length<Int> a@3@01))))
        (< $Perm.No (- (- $Perm.Write (pTaken@23@01 r)) (pTaken@26@01 r)))
        false))
    (=
      ($FVF.lookup_val (as sm@51@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r)))
  :pattern (($FVF.lookup_val (as sm@51@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r))
  :qid |qp.fvfValDef33|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@45@01 r))
        (img@46@01 r))
      (= r (loc<Ref> a@3@01 x@4@01)))
    (=
      ($FVF.lookup_val (as sm@51@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@24@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@51@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@24@01  $FVF<val>) r))
  :qid |qp.fvfValDef34|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@45@01 r))
        (img@46@01 r))
      (= r (loc<Ref> a@3@01 y@5@01)))
    (=
      ($FVF.lookup_val (as sm@51@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@28@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@51@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@28@01  $FVF<val>) r))
  :qid |qp.fvfValDef35|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@24@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@28@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@51@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef36|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@45@01 r))
      ($FVF.loc_val ($FVF.lookup_val (as sm@47@01  $FVF<val>) r) r))
    :pattern ((inv@45@01 r))
    :qid |quant-u-38|))
  (elements%precondition ($SortWrappers.$FVF<val>To$Snap (as sm@51@01  $FVF<val>)) a@3@01)))
; [eval] old(elements(a))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
(declare-const pm@52@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@52@01  $FPM) r)
    (ite
      (and
        (img@10@01 r)
        (and (<= 0 (inv@9@01 r)) (< (inv@9@01 r) (length<Int> a@3@01))))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_val (as pm@52@01  $FPM) r))
  :qid |qp.resPrmSumDef38|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@22@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r) r))
  :pattern (($FVF.perm_val (as pm@52@01  $FPM) r))
  :qid |qp.resTrgDef39|)))
; Assume upper permission bound for field val
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_val (as pm@52@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_val ($FVF.lookup_val (as sm@22@01  $FVF<val>) r) r))
  :qid |qp-fld-prm-bnd|)))
; [eval] elements(a)
(set-option :timeout 0)
(push) ; 3
(declare-const i@53@01 Int)
(push) ; 4
; [eval] (i in [0..length(this)))
; [eval] [0..length(this))
; [eval] length(this)
(assert (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i@53@01))
; [eval] loc(this, i)
(pop) ; 4
(declare-fun inv@54@01 ($Ref) Int)
(declare-fun img@55@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@53@01 Int) (i2@53@01 Int)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i1@53@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@22@01  $FVF<val>) (loc<Ref> a@3@01 i1@53@01)) (loc<Ref> a@3@01 i1@53@01)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i2@53@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@22@01  $FVF<val>) (loc<Ref> a@3@01 i2@53@01)) (loc<Ref> a@3@01 i2@53@01)))
      (= (loc<Ref> a@3@01 i1@53@01) (loc<Ref> a@3@01 i2@53@01)))
    (= i1@53@01 i2@53@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@53@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i@53@01)
    (and
      (= (inv@54@01 (loc<Ref> a@3@01 i@53@01)) i@53@01)
      (img@55@01 (loc<Ref> a@3@01 i@53@01))))
  :pattern ((loc<Ref> a@3@01 i@53@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@55@01 r)
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@54@01 r)))
    (= (loc<Ref> a@3@01 (inv@54@01 r)) r))
  :pattern ((inv@54@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@54@01 r))
    ($FVF.loc_val ($FVF.lookup_val (as sm@22@01  $FVF<val>) r) r))
  :pattern ((inv@54@01 r))
  :qid |quant-u-47|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@56@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@54@01 r))
      (img@55@01 r)
      (= r (loc<Ref> a@3@01 (inv@54@01 r))))
    ($Perm.min
      (ite
        (and
          (img@10@01 r)
          (and (<= 0 (inv@9@01 r)) (< (inv@9@01 r) (length<Int> a@3@01))))
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
        (and
          (img@10@01 r)
          (and (<= 0 (inv@9@01 r)) (< (inv@9@01 r) (length<Int> a@3@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@56@01 r))
    $Perm.No)
  
  :qid |quant-u-49|))))
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
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@54@01 r))
      (img@55@01 r)
      (= r (loc<Ref> a@3@01 (inv@54@01 r))))
    (= (- $Perm.Write (pTaken@56@01 r)) $Perm.No))
  
  :qid |quant-u-50|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@57@01 $FVF<val>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@57@01  $FVF<val>)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@54@01 r))
        (img@55@01 r)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@54@01 r))
        (img@55@01 r))
      (Set_in r ($FVF.domain_val (as sm@57@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@57@01  $FVF<val>))))
  :qid |qp.fvfDomDef42|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@54@01 r))
        (img@55@01 r))
      (and
        (img@10@01 r)
        (and (<= 0 (inv@9@01 r)) (< (inv@9@01 r) (length<Int> a@3@01)))))
    (=
      ($FVF.lookup_val (as sm@57@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r)))
  :pattern (($FVF.lookup_val (as sm@57@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r))
  :qid |qp.fvfValDef40|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r) r)
  :pattern (($FVF.lookup_val (as sm@57@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef41|)))
(assert (elements%precondition ($SortWrappers.$FVF<val>To$Snap (as sm@57@01  $FVF<val>)) a@3@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((i@53@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i@53@01)
    (and
      (= (inv@54@01 (loc<Ref> a@3@01 i@53@01)) i@53@01)
      (img@55@01 (loc<Ref> a@3@01 i@53@01))))
  :pattern ((loc<Ref> a@3@01 i@53@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@55@01 r)
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@54@01 r)))
    (= (loc<Ref> a@3@01 (inv@54@01 r)) r))
  :pattern ((inv@54@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@57@01  $FVF<val>)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@54@01 r))
        (img@55@01 r)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@54@01 r))
        (img@55@01 r))
      (Set_in r ($FVF.domain_val (as sm@57@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@57@01  $FVF<val>))))
  :qid |qp.fvfDomDef42|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@54@01 r))
        (img@55@01 r))
      (and
        (img@10@01 r)
        (and (<= 0 (inv@9@01 r)) (< (inv@9@01 r) (length<Int> a@3@01)))))
    (=
      ($FVF.lookup_val (as sm@57@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r)))
  :pattern (($FVF.lookup_val (as sm@57@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r))
  :qid |qp.fvfValDef40|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r) r)
  :pattern (($FVF.lookup_val (as sm@57@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef41|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@54@01 r))
      ($FVF.loc_val ($FVF.lookup_val (as sm@22@01  $FVF<val>) r) r))
    :pattern ((inv@54@01 r))
    :qid |quant-u-47|))
  (elements%precondition ($SortWrappers.$FVF<val>To$Snap (as sm@57@01  $FVF<val>)) a@3@01)))
(set-option :timeout 0)
(push) ; 3
(assert (not (Set_equal (elements ($SortWrappers.$FVF<val>To$Snap (as sm@51@01  $FVF<val>)) a@3@01) (elements ($SortWrappers.$FVF<val>To$Snap (as sm@57@01  $FVF<val>)) a@3@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,01s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (loc<Ref> a@3@01 y@5@01) (loc<Ref> a@3@01 x@4@01))))
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
      (= (loc<Ref> a@3@01 y@5@01) (loc<Ref> a@3@01 y@5@01))
      $Perm.Write
      $Perm.No)
    (ite
      (= (loc<Ref> a@3@01 x@4@01) (loc<Ref> a@3@01 x@4@01))
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
      (= (loc<Ref> a@3@01 x@4@01) (loc<Ref> a@3@01 x@4@01))
      $Perm.Write
      $Perm.No)
    (ite
      (= (loc<Ref> a@3@01 y@5@01) (loc<Ref> a@3@01 y@5@01))
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
    (= (loc<Ref> a@3@01 y@5@01) (loc<Ref> a@3@01 y@5@01))
    (= (loc<Ref> a@3@01 x@4@01) (loc<Ref> a@3@01 x@4@01)))
  (not
    (=
      ($FVF.lookup_val (as sm@28@01  $FVF<val>) (loc<Ref> a@3@01 y@5@01))
      ($FVF.lookup_val (as sm@24@01  $FVF<val>) (loc<Ref> a@3@01 x@4@01)))))))
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
    (= (loc<Ref> a@3@01 x@4@01) (loc<Ref> a@3@01 x@4@01))
    (= (loc<Ref> a@3@01 y@5@01) (loc<Ref> a@3@01 y@5@01)))
  (not
    (=
      ($FVF.lookup_val (as sm@24@01  $FVF<val>) (loc<Ref> a@3@01 x@4@01))
      ($FVF.lookup_val (as sm@28@01  $FVF<val>) (loc<Ref> a@3@01 y@5@01)))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and
  (not (= (loc<Ref> a@3@01 y@5@01) (loc<Ref> a@3@01 x@4@01)))
  (not (= (loc<Ref> a@3@01 x@4@01) (loc<Ref> a@3@01 y@5@01)))))
(declare-const sm@58@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@3@01 y@5@01))
    (=
      ($FVF.lookup_val (as sm@58@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@28@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@58@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@28@01  $FVF<val>) r))
  :qid |qp.fvfValDef43|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@3@01 x@4@01))
    (=
      ($FVF.lookup_val (as sm@58@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@24@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@58@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@24@01  $FVF<val>) r))
  :qid |qp.fvfValDef44|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@10@01 r)
        (and (<= 0 (inv@9@01 r)) (< (inv@9@01 r) (length<Int> a@3@01))))
      (< $Perm.No (- (- $Perm.Write (pTaken@23@01 r)) (pTaken@26@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@58@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r)))
  :pattern (($FVF.lookup_val (as sm@58@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r))
  :qid |qp.fvfValDef45|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@28@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@24@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r) r))
  :pattern (($FVF.lookup_val (as sm@58@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef46|)))
(declare-const pm@59@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@59@01  $FPM) r)
    (+
      (+
        (ite (= r (loc<Ref> a@3@01 y@5@01)) $Perm.Write $Perm.No)
        (ite (= r (loc<Ref> a@3@01 x@4@01)) $Perm.Write $Perm.No))
      (ite
        (and
          (img@10@01 r)
          (and (<= 0 (inv@9@01 r)) (< (inv@9@01 r) (length<Int> a@3@01))))
        (- (- $Perm.Write (pTaken@23@01 r)) (pTaken@26@01 r))
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@59@01  $FPM) r))
  :qid |qp.resPrmSumDef47|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@58@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@28@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@24@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r) r))
  :pattern (($FVF.perm_val (as pm@59@01  $FPM) r))
  :qid |qp.resTrgDef48|)))
; Assume upper permission bound for field val
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_val (as pm@59@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_val ($FVF.lookup_val (as sm@58@01  $FVF<val>) r) r))
  :qid |qp-fld-prm-bnd|)))
; [eval] elements(a) == old(elements(a))
; [eval] elements(a)
(set-option :timeout 0)
(push) ; 3
(declare-const i@60@01 Int)
(push) ; 4
; [eval] (i in [0..length(this)))
; [eval] [0..length(this))
; [eval] length(this)
(assert (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i@60@01))
; [eval] loc(this, i)
(pop) ; 4
(declare-fun inv@61@01 ($Ref) Int)
(declare-fun img@62@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@60@01 Int) (i2@60@01 Int)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i1@60@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@58@01  $FVF<val>) (loc<Ref> a@3@01 i1@60@01)) (loc<Ref> a@3@01 i1@60@01)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i2@60@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@58@01  $FVF<val>) (loc<Ref> a@3@01 i2@60@01)) (loc<Ref> a@3@01 i2@60@01)))
      (= (loc<Ref> a@3@01 i1@60@01) (loc<Ref> a@3@01 i2@60@01)))
    (= i1@60@01 i2@60@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@60@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i@60@01)
    (and
      (= (inv@61@01 (loc<Ref> a@3@01 i@60@01)) i@60@01)
      (img@62@01 (loc<Ref> a@3@01 i@60@01))))
  :pattern ((loc<Ref> a@3@01 i@60@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@62@01 r)
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@61@01 r)))
    (= (loc<Ref> a@3@01 (inv@61@01 r)) r))
  :pattern ((inv@61@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@61@01 r))
    ($FVF.loc_val ($FVF.lookup_val (as sm@58@01  $FVF<val>) r) r))
  :pattern ((inv@61@01 r))
  :qid |quant-u-52|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@63@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@61@01 r))
      (img@62@01 r)
      (= r (loc<Ref> a@3@01 (inv@61@01 r))))
    ($Perm.min
      (ite
        (and
          (img@10@01 r)
          (and (<= 0 (inv@9@01 r)) (< (inv@9@01 r) (length<Int> a@3@01))))
        (- (- $Perm.Write (pTaken@23@01 r)) (pTaken@26@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@64@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@61@01 r))
      (img@62@01 r)
      (= r (loc<Ref> a@3@01 (inv@61@01 r))))
    ($Perm.min
      (ite (= r (loc<Ref> a@3@01 y@5@01)) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@63@01 r)))
    $Perm.No))
(define-fun pTaken@65@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@61@01 r))
      (img@62@01 r)
      (= r (loc<Ref> a@3@01 (inv@61@01 r))))
    ($Perm.min
      (ite (= r (loc<Ref> a@3@01 x@4@01)) $Perm.Write $Perm.No)
      (- (- $Perm.Write (pTaken@63@01 r)) (pTaken@64@01 r)))
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
          (img@10@01 r)
          (and (<= 0 (inv@9@01 r)) (< (inv@9@01 r) (length<Int> a@3@01))))
        (- (- $Perm.Write (pTaken@23@01 r)) (pTaken@26@01 r))
        $Perm.No)
      (pTaken@63@01 r))
    $Perm.No)
  
  :qid |quant-u-54|))))
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
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@61@01 r))
      (img@62@01 r)
      (= r (loc<Ref> a@3@01 (inv@61@01 r))))
    (= (- $Perm.Write (pTaken@63@01 r)) $Perm.No))
  
  :qid |quant-u-55|))))
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
    (ite
      (= (loc<Ref> a@3@01 y@5@01) (loc<Ref> a@3@01 y@5@01))
      $Perm.Write
      $Perm.No)
    (pTaken@64@01 (loc<Ref> a@3@01 y@5@01)))
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
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@61@01 r))
      (img@62@01 r)
      (= r (loc<Ref> a@3@01 (inv@61@01 r))))
    (= (- (- $Perm.Write (pTaken@63@01 r)) (pTaken@64@01 r)) $Perm.No))
  
  :qid |quant-u-57|))))
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
    (ite
      (= (loc<Ref> a@3@01 x@4@01) (loc<Ref> a@3@01 x@4@01))
      $Perm.Write
      $Perm.No)
    (pTaken@65@01 (loc<Ref> a@3@01 x@4@01)))
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
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@61@01 r))
      (img@62@01 r)
      (= r (loc<Ref> a@3@01 (inv@61@01 r))))
    (=
      (- (- (- $Perm.Write (pTaken@63@01 r)) (pTaken@64@01 r)) (pTaken@65@01 r))
      $Perm.No))
  
  :qid |quant-u-59|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@66@01 $FVF<val>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@66@01  $FVF<val>)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@61@01 r))
        (img@62@01 r)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@61@01 r))
        (img@62@01 r))
      (Set_in r ($FVF.domain_val (as sm@66@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@66@01  $FVF<val>))))
  :qid |qp.fvfDomDef53|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@61@01 r))
        (img@62@01 r))
      (= r (loc<Ref> a@3@01 y@5@01)))
    (=
      ($FVF.lookup_val (as sm@66@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@28@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@66@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@28@01  $FVF<val>) r))
  :qid |qp.fvfValDef49|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@61@01 r))
        (img@62@01 r))
      (= r (loc<Ref> a@3@01 x@4@01)))
    (=
      ($FVF.lookup_val (as sm@66@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@24@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@66@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@24@01  $FVF<val>) r))
  :qid |qp.fvfValDef50|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@61@01 r))
        (img@62@01 r))
      (ite
        (and
          (img@10@01 r)
          (and (<= 0 (inv@9@01 r)) (< (inv@9@01 r) (length<Int> a@3@01))))
        (< $Perm.No (- (- $Perm.Write (pTaken@23@01 r)) (pTaken@26@01 r)))
        false))
    (=
      ($FVF.lookup_val (as sm@66@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r)))
  :pattern (($FVF.lookup_val (as sm@66@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r))
  :qid |qp.fvfValDef51|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@28@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@24@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r) r))
  :pattern (($FVF.lookup_val (as sm@66@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef52|)))
(assert (elements%precondition ($SortWrappers.$FVF<val>To$Snap (as sm@66@01  $FVF<val>)) a@3@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((i@60@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i@60@01)
    (and
      (= (inv@61@01 (loc<Ref> a@3@01 i@60@01)) i@60@01)
      (img@62@01 (loc<Ref> a@3@01 i@60@01))))
  :pattern ((loc<Ref> a@3@01 i@60@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@62@01 r)
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@61@01 r)))
    (= (loc<Ref> a@3@01 (inv@61@01 r)) r))
  :pattern ((inv@61@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@66@01  $FVF<val>)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@61@01 r))
        (img@62@01 r)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@61@01 r))
        (img@62@01 r))
      (Set_in r ($FVF.domain_val (as sm@66@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@66@01  $FVF<val>))))
  :qid |qp.fvfDomDef53|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@61@01 r))
        (img@62@01 r))
      (= r (loc<Ref> a@3@01 y@5@01)))
    (=
      ($FVF.lookup_val (as sm@66@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@28@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@66@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@28@01  $FVF<val>) r))
  :qid |qp.fvfValDef49|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@61@01 r))
        (img@62@01 r))
      (= r (loc<Ref> a@3@01 x@4@01)))
    (=
      ($FVF.lookup_val (as sm@66@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@24@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@66@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@24@01  $FVF<val>) r))
  :qid |qp.fvfValDef50|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@61@01 r))
        (img@62@01 r))
      (ite
        (and
          (img@10@01 r)
          (and (<= 0 (inv@9@01 r)) (< (inv@9@01 r) (length<Int> a@3@01))))
        (< $Perm.No (- (- $Perm.Write (pTaken@23@01 r)) (pTaken@26@01 r)))
        false))
    (=
      ($FVF.lookup_val (as sm@66@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r)))
  :pattern (($FVF.lookup_val (as sm@66@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r))
  :qid |qp.fvfValDef51|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@28@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@24@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r) r))
  :pattern (($FVF.lookup_val (as sm@66@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef52|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@61@01 r))
      ($FVF.loc_val ($FVF.lookup_val (as sm@58@01  $FVF<val>) r) r))
    :pattern ((inv@61@01 r))
    :qid |quant-u-52|))
  (elements%precondition ($SortWrappers.$FVF<val>To$Snap (as sm@66@01  $FVF<val>)) a@3@01)))
; [eval] old(elements(a))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
(declare-const pm@67@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@67@01  $FPM) r)
    (ite
      (and
        (img@10@01 r)
        (and (<= 0 (inv@9@01 r)) (< (inv@9@01 r) (length<Int> a@3@01))))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_val (as pm@67@01  $FPM) r))
  :qid |qp.resPrmSumDef54|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@22@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r) r))
  :pattern (($FVF.perm_val (as pm@67@01  $FPM) r))
  :qid |qp.resTrgDef55|)))
; Assume upper permission bound for field val
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_val (as pm@67@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_val ($FVF.lookup_val (as sm@22@01  $FVF<val>) r) r))
  :qid |qp-fld-prm-bnd|)))
; [eval] elements(a)
(set-option :timeout 0)
(push) ; 3
(declare-const i@68@01 Int)
(push) ; 4
; [eval] (i in [0..length(this)))
; [eval] [0..length(this))
; [eval] length(this)
(assert (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i@68@01))
; [eval] loc(this, i)
(pop) ; 4
(declare-fun inv@69@01 ($Ref) Int)
(declare-fun img@70@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@68@01 Int) (i2@68@01 Int)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i1@68@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@22@01  $FVF<val>) (loc<Ref> a@3@01 i1@68@01)) (loc<Ref> a@3@01 i1@68@01)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i2@68@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@22@01  $FVF<val>) (loc<Ref> a@3@01 i2@68@01)) (loc<Ref> a@3@01 i2@68@01)))
      (= (loc<Ref> a@3@01 i1@68@01) (loc<Ref> a@3@01 i2@68@01)))
    (= i1@68@01 i2@68@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@68@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i@68@01)
    (and
      (= (inv@69@01 (loc<Ref> a@3@01 i@68@01)) i@68@01)
      (img@70@01 (loc<Ref> a@3@01 i@68@01))))
  :pattern ((loc<Ref> a@3@01 i@68@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@70@01 r)
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@69@01 r)))
    (= (loc<Ref> a@3@01 (inv@69@01 r)) r))
  :pattern ((inv@69@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@69@01 r))
    ($FVF.loc_val ($FVF.lookup_val (as sm@22@01  $FVF<val>) r) r))
  :pattern ((inv@69@01 r))
  :qid |quant-u-61|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@71@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@69@01 r))
      (img@70@01 r)
      (= r (loc<Ref> a@3@01 (inv@69@01 r))))
    ($Perm.min
      (ite
        (and
          (img@10@01 r)
          (and (<= 0 (inv@9@01 r)) (< (inv@9@01 r) (length<Int> a@3@01))))
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
        (and
          (img@10@01 r)
          (and (<= 0 (inv@9@01 r)) (< (inv@9@01 r) (length<Int> a@3@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@71@01 r))
    $Perm.No)
  
  :qid |quant-u-63|))))
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
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@69@01 r))
      (img@70@01 r)
      (= r (loc<Ref> a@3@01 (inv@69@01 r))))
    (= (- $Perm.Write (pTaken@71@01 r)) $Perm.No))
  
  :qid |quant-u-64|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@72@01 $FVF<val>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@72@01  $FVF<val>)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@69@01 r))
        (img@70@01 r)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@69@01 r))
        (img@70@01 r))
      (Set_in r ($FVF.domain_val (as sm@72@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@72@01  $FVF<val>))))
  :qid |qp.fvfDomDef58|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@69@01 r))
        (img@70@01 r))
      (and
        (img@10@01 r)
        (and (<= 0 (inv@9@01 r)) (< (inv@9@01 r) (length<Int> a@3@01)))))
    (=
      ($FVF.lookup_val (as sm@72@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r)))
  :pattern (($FVF.lookup_val (as sm@72@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r))
  :qid |qp.fvfValDef56|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r) r)
  :pattern (($FVF.lookup_val (as sm@72@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef57|)))
(assert (elements%precondition ($SortWrappers.$FVF<val>To$Snap (as sm@72@01  $FVF<val>)) a@3@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((i@68@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i@68@01)
    (and
      (= (inv@69@01 (loc<Ref> a@3@01 i@68@01)) i@68@01)
      (img@70@01 (loc<Ref> a@3@01 i@68@01))))
  :pattern ((loc<Ref> a@3@01 i@68@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@70@01 r)
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@69@01 r)))
    (= (loc<Ref> a@3@01 (inv@69@01 r)) r))
  :pattern ((inv@69@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@72@01  $FVF<val>)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@69@01 r))
        (img@70@01 r)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@69@01 r))
        (img@70@01 r))
      (Set_in r ($FVF.domain_val (as sm@72@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@72@01  $FVF<val>))))
  :qid |qp.fvfDomDef58|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@69@01 r))
        (img@70@01 r))
      (and
        (img@10@01 r)
        (and (<= 0 (inv@9@01 r)) (< (inv@9@01 r) (length<Int> a@3@01)))))
    (=
      ($FVF.lookup_val (as sm@72@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r)))
  :pattern (($FVF.lookup_val (as sm@72@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r))
  :qid |qp.fvfValDef56|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r) r)
  :pattern (($FVF.lookup_val (as sm@72@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef57|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@69@01 r))
      ($FVF.loc_val ($FVF.lookup_val (as sm@22@01  $FVF<val>) r) r))
    :pattern ((inv@69@01 r))
    :qid |quant-u-61|))
  (elements%precondition ($SortWrappers.$FVF<val>To$Snap (as sm@72@01  $FVF<val>)) a@3@01)))
(set-option :timeout 0)
(push) ; 3
(assert (not (Set_equal (elements ($SortWrappers.$FVF<val>To$Snap (as sm@66@01  $FVF<val>)) a@3@01) (elements ($SortWrappers.$FVF<val>To$Snap (as sm@72@01  $FVF<val>)) a@3@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,01s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (loc<Ref> a@3@01 y@5@01) (loc<Ref> a@3@01 x@4@01))))
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
      (= (loc<Ref> a@3@01 y@5@01) (loc<Ref> a@3@01 y@5@01))
      $Perm.Write
      $Perm.No)
    (ite
      (= (loc<Ref> a@3@01 x@4@01) (loc<Ref> a@3@01 x@4@01))
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
      (= (loc<Ref> a@3@01 x@4@01) (loc<Ref> a@3@01 x@4@01))
      $Perm.Write
      $Perm.No)
    (ite
      (= (loc<Ref> a@3@01 y@5@01) (loc<Ref> a@3@01 y@5@01))
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
    (= (loc<Ref> a@3@01 y@5@01) (loc<Ref> a@3@01 y@5@01))
    (= (loc<Ref> a@3@01 x@4@01) (loc<Ref> a@3@01 x@4@01)))
  (not
    (=
      ($FVF.lookup_val (as sm@28@01  $FVF<val>) (loc<Ref> a@3@01 y@5@01))
      ($FVF.lookup_val (as sm@24@01  $FVF<val>) (loc<Ref> a@3@01 x@4@01)))))))
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
    (= (loc<Ref> a@3@01 x@4@01) (loc<Ref> a@3@01 x@4@01))
    (= (loc<Ref> a@3@01 y@5@01) (loc<Ref> a@3@01 y@5@01)))
  (not
    (=
      ($FVF.lookup_val (as sm@24@01  $FVF<val>) (loc<Ref> a@3@01 x@4@01))
      ($FVF.lookup_val (as sm@28@01  $FVF<val>) (loc<Ref> a@3@01 y@5@01)))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and
  (not (= (loc<Ref> a@3@01 y@5@01) (loc<Ref> a@3@01 x@4@01)))
  (not (= (loc<Ref> a@3@01 x@4@01) (loc<Ref> a@3@01 y@5@01)))))
; Definitional axioms for snapshot map values
; Assume upper permission bound for field val
; [eval] elements(a) == old(elements(a))
; [eval] elements(a)
(set-option :timeout 0)
(push) ; 3
(declare-const i@73@01 Int)
(push) ; 4
; [eval] (i in [0..length(this)))
; [eval] [0..length(this))
; [eval] length(this)
(assert (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i@73@01))
; [eval] loc(this, i)
(pop) ; 4
(declare-fun inv@74@01 ($Ref) Int)
(declare-fun img@75@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-const sm@76@01 $FVF<val>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@10@01 r)
        (and (<= 0 (inv@9@01 r)) (< (inv@9@01 r) (length<Int> a@3@01))))
      (< $Perm.No (- (- $Perm.Write (pTaken@23@01 r)) (pTaken@26@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@76@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r)))
  :pattern (($FVF.lookup_val (as sm@76@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r))
  :qid |qp.fvfValDef59|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@3@01 x@4@01))
    (=
      ($FVF.lookup_val (as sm@76@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@24@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@76@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@24@01  $FVF<val>) r))
  :qid |qp.fvfValDef60|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@3@01 y@5@01))
    (=
      ($FVF.lookup_val (as sm@76@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@28@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@76@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@28@01  $FVF<val>) r))
  :qid |qp.fvfValDef61|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@24@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@28@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@76@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef62|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@73@01 Int) (i2@73@01 Int)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i1@73@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@76@01  $FVF<val>) (loc<Ref> a@3@01 i1@73@01)) (loc<Ref> a@3@01 i1@73@01)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i2@73@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@76@01  $FVF<val>) (loc<Ref> a@3@01 i2@73@01)) (loc<Ref> a@3@01 i2@73@01)))
      (= (loc<Ref> a@3@01 i1@73@01) (loc<Ref> a@3@01 i2@73@01)))
    (= i1@73@01 i2@73@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@73@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i@73@01)
    (and
      (= (inv@74@01 (loc<Ref> a@3@01 i@73@01)) i@73@01)
      (img@75@01 (loc<Ref> a@3@01 i@73@01))))
  :pattern ((loc<Ref> a@3@01 i@73@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@75@01 r)
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@74@01 r)))
    (= (loc<Ref> a@3@01 (inv@74@01 r)) r))
  :pattern ((inv@74@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@74@01 r))
    ($FVF.loc_val ($FVF.lookup_val (as sm@76@01  $FVF<val>) r) r))
  :pattern ((inv@74@01 r))
  :qid |quant-u-66|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@77@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@74@01 r))
      (img@75@01 r)
      (= r (loc<Ref> a@3@01 (inv@74@01 r))))
    ($Perm.min
      (ite
        (and
          (img@10@01 r)
          (and (<= 0 (inv@9@01 r)) (< (inv@9@01 r) (length<Int> a@3@01))))
        (- (- $Perm.Write (pTaken@23@01 r)) (pTaken@26@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@78@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@74@01 r))
      (img@75@01 r)
      (= r (loc<Ref> a@3@01 (inv@74@01 r))))
    ($Perm.min
      (ite (= r (loc<Ref> a@3@01 x@4@01)) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@77@01 r)))
    $Perm.No))
(define-fun pTaken@79@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@74@01 r))
      (img@75@01 r)
      (= r (loc<Ref> a@3@01 (inv@74@01 r))))
    ($Perm.min
      (ite (= r (loc<Ref> a@3@01 y@5@01)) $Perm.Write $Perm.No)
      (- (- $Perm.Write (pTaken@77@01 r)) (pTaken@78@01 r)))
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
          (img@10@01 r)
          (and (<= 0 (inv@9@01 r)) (< (inv@9@01 r) (length<Int> a@3@01))))
        (- (- $Perm.Write (pTaken@23@01 r)) (pTaken@26@01 r))
        $Perm.No)
      (pTaken@77@01 r))
    $Perm.No)
  
  :qid |quant-u-68|))))
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
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@74@01 r))
      (img@75@01 r)
      (= r (loc<Ref> a@3@01 (inv@74@01 r))))
    (= (- $Perm.Write (pTaken@77@01 r)) $Perm.No))
  
  :qid |quant-u-69|))))
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
    (ite
      (= (loc<Ref> a@3@01 x@4@01) (loc<Ref> a@3@01 x@4@01))
      $Perm.Write
      $Perm.No)
    (pTaken@78@01 (loc<Ref> a@3@01 x@4@01)))
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
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@74@01 r))
      (img@75@01 r)
      (= r (loc<Ref> a@3@01 (inv@74@01 r))))
    (= (- (- $Perm.Write (pTaken@77@01 r)) (pTaken@78@01 r)) $Perm.No))
  
  :qid |quant-u-71|))))
(check-sat)
; unknown
(pop) ; 4
; 0,01s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (=
  (-
    (ite
      (= (loc<Ref> a@3@01 y@5@01) (loc<Ref> a@3@01 y@5@01))
      $Perm.Write
      $Perm.No)
    (pTaken@79@01 (loc<Ref> a@3@01 y@5@01)))
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
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@74@01 r))
      (img@75@01 r)
      (= r (loc<Ref> a@3@01 (inv@74@01 r))))
    (=
      (- (- (- $Perm.Write (pTaken@77@01 r)) (pTaken@78@01 r)) (pTaken@79@01 r))
      $Perm.No))
  
  :qid |quant-u-73|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@80@01 $FVF<val>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@80@01  $FVF<val>)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@74@01 r))
        (img@75@01 r)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@74@01 r))
        (img@75@01 r))
      (Set_in r ($FVF.domain_val (as sm@80@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@80@01  $FVF<val>))))
  :qid |qp.fvfDomDef67|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@74@01 r))
        (img@75@01 r))
      (ite
        (and
          (img@10@01 r)
          (and (<= 0 (inv@9@01 r)) (< (inv@9@01 r) (length<Int> a@3@01))))
        (< $Perm.No (- (- $Perm.Write (pTaken@23@01 r)) (pTaken@26@01 r)))
        false))
    (=
      ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r)))
  :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r))
  :qid |qp.fvfValDef63|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@74@01 r))
        (img@75@01 r))
      (= r (loc<Ref> a@3@01 x@4@01)))
    (=
      ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@24@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@24@01  $FVF<val>) r))
  :qid |qp.fvfValDef64|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@74@01 r))
        (img@75@01 r))
      (= r (loc<Ref> a@3@01 y@5@01)))
    (=
      ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@28@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@28@01  $FVF<val>) r))
  :qid |qp.fvfValDef65|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@24@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@28@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef66|)))
(assert (elements%precondition ($SortWrappers.$FVF<val>To$Snap (as sm@80@01  $FVF<val>)) a@3@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@10@01 r)
        (and (<= 0 (inv@9@01 r)) (< (inv@9@01 r) (length<Int> a@3@01))))
      (< $Perm.No (- (- $Perm.Write (pTaken@23@01 r)) (pTaken@26@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@76@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r)))
  :pattern (($FVF.lookup_val (as sm@76@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r))
  :qid |qp.fvfValDef59|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@3@01 x@4@01))
    (=
      ($FVF.lookup_val (as sm@76@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@24@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@76@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@24@01  $FVF<val>) r))
  :qid |qp.fvfValDef60|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@3@01 y@5@01))
    (=
      ($FVF.lookup_val (as sm@76@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@28@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@76@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@28@01  $FVF<val>) r))
  :qid |qp.fvfValDef61|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@24@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@28@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@76@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef62|)))
(assert (forall ((i@73@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i@73@01)
    (and
      (= (inv@74@01 (loc<Ref> a@3@01 i@73@01)) i@73@01)
      (img@75@01 (loc<Ref> a@3@01 i@73@01))))
  :pattern ((loc<Ref> a@3@01 i@73@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@75@01 r)
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@74@01 r)))
    (= (loc<Ref> a@3@01 (inv@74@01 r)) r))
  :pattern ((inv@74@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@80@01  $FVF<val>)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@74@01 r))
        (img@75@01 r)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@74@01 r))
        (img@75@01 r))
      (Set_in r ($FVF.domain_val (as sm@80@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@80@01  $FVF<val>))))
  :qid |qp.fvfDomDef67|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@74@01 r))
        (img@75@01 r))
      (ite
        (and
          (img@10@01 r)
          (and (<= 0 (inv@9@01 r)) (< (inv@9@01 r) (length<Int> a@3@01))))
        (< $Perm.No (- (- $Perm.Write (pTaken@23@01 r)) (pTaken@26@01 r)))
        false))
    (=
      ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r)))
  :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r))
  :qid |qp.fvfValDef63|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@74@01 r))
        (img@75@01 r))
      (= r (loc<Ref> a@3@01 x@4@01)))
    (=
      ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@24@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@24@01  $FVF<val>) r))
  :qid |qp.fvfValDef64|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@74@01 r))
        (img@75@01 r))
      (= r (loc<Ref> a@3@01 y@5@01)))
    (=
      ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@28@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@28@01  $FVF<val>) r))
  :qid |qp.fvfValDef65|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@24@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@28@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef66|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@74@01 r))
      ($FVF.loc_val ($FVF.lookup_val (as sm@76@01  $FVF<val>) r) r))
    :pattern ((inv@74@01 r))
    :qid |quant-u-66|))
  (elements%precondition ($SortWrappers.$FVF<val>To$Snap (as sm@80@01  $FVF<val>)) a@3@01)))
; [eval] old(elements(a))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
(declare-const pm@81@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@81@01  $FPM) r)
    (ite
      (and
        (img@10@01 r)
        (and (<= 0 (inv@9@01 r)) (< (inv@9@01 r) (length<Int> a@3@01))))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_val (as pm@81@01  $FPM) r))
  :qid |qp.resPrmSumDef68|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@22@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r) r))
  :pattern (($FVF.perm_val (as pm@81@01  $FPM) r))
  :qid |qp.resTrgDef69|)))
; Assume upper permission bound for field val
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_val (as pm@81@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_val ($FVF.lookup_val (as sm@22@01  $FVF<val>) r) r))
  :qid |qp-fld-prm-bnd|)))
; [eval] elements(a)
(set-option :timeout 0)
(push) ; 3
(declare-const i@82@01 Int)
(push) ; 4
; [eval] (i in [0..length(this)))
; [eval] [0..length(this))
; [eval] length(this)
(assert (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i@82@01))
; [eval] loc(this, i)
(pop) ; 4
(declare-fun inv@83@01 ($Ref) Int)
(declare-fun img@84@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@82@01 Int) (i2@82@01 Int)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i1@82@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@22@01  $FVF<val>) (loc<Ref> a@3@01 i1@82@01)) (loc<Ref> a@3@01 i1@82@01)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i2@82@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@22@01  $FVF<val>) (loc<Ref> a@3@01 i2@82@01)) (loc<Ref> a@3@01 i2@82@01)))
      (= (loc<Ref> a@3@01 i1@82@01) (loc<Ref> a@3@01 i2@82@01)))
    (= i1@82@01 i2@82@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@82@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i@82@01)
    (and
      (= (inv@83@01 (loc<Ref> a@3@01 i@82@01)) i@82@01)
      (img@84@01 (loc<Ref> a@3@01 i@82@01))))
  :pattern ((loc<Ref> a@3@01 i@82@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@84@01 r)
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@83@01 r)))
    (= (loc<Ref> a@3@01 (inv@83@01 r)) r))
  :pattern ((inv@83@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@83@01 r))
    ($FVF.loc_val ($FVF.lookup_val (as sm@22@01  $FVF<val>) r) r))
  :pattern ((inv@83@01 r))
  :qid |quant-u-75|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@85@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@83@01 r))
      (img@84@01 r)
      (= r (loc<Ref> a@3@01 (inv@83@01 r))))
    ($Perm.min
      (ite
        (and
          (img@10@01 r)
          (and (<= 0 (inv@9@01 r)) (< (inv@9@01 r) (length<Int> a@3@01))))
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
        (and
          (img@10@01 r)
          (and (<= 0 (inv@9@01 r)) (< (inv@9@01 r) (length<Int> a@3@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@85@01 r))
    $Perm.No)
  
  :qid |quant-u-77|))))
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
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@83@01 r))
      (img@84@01 r)
      (= r (loc<Ref> a@3@01 (inv@83@01 r))))
    (= (- $Perm.Write (pTaken@85@01 r)) $Perm.No))
  
  :qid |quant-u-78|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@86@01 $FVF<val>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@86@01  $FVF<val>)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@83@01 r))
        (img@84@01 r)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@83@01 r))
        (img@84@01 r))
      (Set_in r ($FVF.domain_val (as sm@86@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@86@01  $FVF<val>))))
  :qid |qp.fvfDomDef72|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@83@01 r))
        (img@84@01 r))
      (and
        (img@10@01 r)
        (and (<= 0 (inv@9@01 r)) (< (inv@9@01 r) (length<Int> a@3@01)))))
    (=
      ($FVF.lookup_val (as sm@86@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r)))
  :pattern (($FVF.lookup_val (as sm@86@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r))
  :qid |qp.fvfValDef70|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r) r)
  :pattern (($FVF.lookup_val (as sm@86@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef71|)))
(assert (elements%precondition ($SortWrappers.$FVF<val>To$Snap (as sm@86@01  $FVF<val>)) a@3@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((i@82@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i@82@01)
    (and
      (= (inv@83@01 (loc<Ref> a@3@01 i@82@01)) i@82@01)
      (img@84@01 (loc<Ref> a@3@01 i@82@01))))
  :pattern ((loc<Ref> a@3@01 i@82@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@84@01 r)
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@83@01 r)))
    (= (loc<Ref> a@3@01 (inv@83@01 r)) r))
  :pattern ((inv@83@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@86@01  $FVF<val>)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@83@01 r))
        (img@84@01 r)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@83@01 r))
        (img@84@01 r))
      (Set_in r ($FVF.domain_val (as sm@86@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@86@01  $FVF<val>))))
  :qid |qp.fvfDomDef72|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@83@01 r))
        (img@84@01 r))
      (and
        (img@10@01 r)
        (and (<= 0 (inv@9@01 r)) (< (inv@9@01 r) (length<Int> a@3@01)))))
    (=
      ($FVF.lookup_val (as sm@86@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r)))
  :pattern (($FVF.lookup_val (as sm@86@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r))
  :qid |qp.fvfValDef70|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r) r)
  :pattern (($FVF.lookup_val (as sm@86@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef71|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@83@01 r))
      ($FVF.loc_val ($FVF.lookup_val (as sm@22@01  $FVF<val>) r) r))
    :pattern ((inv@83@01 r))
    :qid |quant-u-75|))
  (elements%precondition ($SortWrappers.$FVF<val>To$Snap (as sm@86@01  $FVF<val>)) a@3@01)))
(set-option :timeout 0)
(push) ; 3
(assert (not (Set_equal (elements ($SortWrappers.$FVF<val>To$Snap (as sm@80@01  $FVF<val>)) a@3@01) (elements ($SortWrappers.$FVF<val>To$Snap (as sm@86@01  $FVF<val>)) a@3@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,01s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- swap02 ----------
(declare-const a@87@01 Array_)
(declare-const x@88@01 Int)
(declare-const y@89@01 Int)
(declare-const a@90@01 Array_)
(declare-const x@91@01 Int)
(declare-const y@92@01 Int)
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
; var tmp: Int
(declare-const tmp@93@01 Int)
; [exec]
; inhale (forall i: Int ::
;     { loc(a, i).val }
;     { (i in [0..length(a))) }
;     (i in [0..length(a))) ==> acc(loc(a, i).val, write))
(declare-const i@94@01 Int)
(push) ; 3
; [eval] (i in [0..length(a)))
; [eval] [0..length(a))
; [eval] length(a)
(assert (Seq_contains (Seq_range 0 (length<Int> a@90@01)) i@94@01))
; [eval] loc(a, i)
(declare-const sm@95@01 $FVF<val>)
; Definitional axioms for snapshot map values
; [eval] loc(a, i)
(pop) ; 3
(declare-const $t@96@01 $FVF<val>)
(declare-fun inv@97@01 ($Ref) Int)
(declare-fun img@98@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@94@01 Int) (i2@94@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (length<Int> a@90@01)) i1@94@01)
      (Seq_contains (Seq_range 0 (length<Int> a@90@01)) i2@94@01)
      (= (loc<Ref> a@90@01 i1@94@01) (loc<Ref> a@90@01 i2@94@01)))
    (= i1@94@01 i2@94@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@94@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@90@01)) i@94@01)
    (and
      (= (inv@97@01 (loc<Ref> a@90@01 i@94@01)) i@94@01)
      (img@98@01 (loc<Ref> a@90@01 i@94@01))))
  :pattern (($FVF.loc_val ($FVF.lookup_val $t@96@01 (loc<Ref> a@90@01 i@94@01)) (loc<Ref> a@90@01 i@94@01)))
  :pattern ((Seq_contains (Seq_range 0 (length<Int> a@90@01)) i@94@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (length<Int> a@90@01)) i@94@01))
  :qid |quant-u-80|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@98@01 r)
      (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@97@01 r)))
    (= (loc<Ref> a@90@01 (inv@97@01 r)) r))
  :pattern ((inv@97@01 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@94@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@90@01)) i@94@01)
    (not (= (loc<Ref> a@90@01 i@94@01) $Ref.null)))
  :pattern (($FVF.loc_val ($FVF.lookup_val $t@96@01 (loc<Ref> a@90@01 i@94@01)) (loc<Ref> a@90@01 i@94@01)))
  :pattern ((Seq_contains (Seq_range 0 (length<Int> a@90@01)) i@94@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (length<Int> a@90@01)) i@94@01))
  :qid |val-permImpliesNonNull|)))
(declare-const sm@99@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@98@01 r)
      (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@97@01 r)))
    (= ($FVF.lookup_val (as sm@99@01  $FVF<val>) r) ($FVF.lookup_val $t@96@01 r)))
  :pattern (($FVF.lookup_val (as sm@99@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val $t@96@01 r))
  :qid |qp.fvfValDef74|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val $t@96@01 r) r)
  :pattern (($FVF.lookup_val (as sm@99@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef75|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@97@01 r))
    ($FVF.loc_val ($FVF.lookup_val (as sm@99@01  $FVF<val>) r) r))
  :pattern ((inv@97@01 r))
  :qid |quant-u-81|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale 0 <= x && x < length(a)
(declare-const $t@100@01 $Snap)
(assert (= $t@100@01 ($Snap.combine ($Snap.first $t@100@01) ($Snap.second $t@100@01))))
(assert (= ($Snap.first $t@100@01) $Snap.unit))
; [eval] 0 <= x
(assert (<= 0 x@91@01))
(assert (= ($Snap.second $t@100@01) $Snap.unit))
; [eval] x < length(a)
; [eval] length(a)
(assert (< x@91@01 (length<Int> a@90@01)))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale 0 <= y && y < length(a)
(declare-const $t@101@01 $Snap)
(assert (= $t@101@01 ($Snap.combine ($Snap.first $t@101@01) ($Snap.second $t@101@01))))
(assert (= ($Snap.first $t@101@01) $Snap.unit))
; [eval] 0 <= y
(assert (<= 0 y@92@01))
(assert (= ($Snap.second $t@101@01) $Snap.unit))
; [eval] y < length(a)
; [eval] length(a)
(assert (< y@92@01 (length<Int> a@90@01)))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale x < y
(declare-const $t@102@01 $Snap)
(assert (= $t@102@01 $Snap.unit))
; [eval] x < y
(assert (< x@91@01 y@92@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label pre
; [exec]
; inhale (forall e: Int ::
;     { (e in elements(a)) }
;     (e in elements(a)) ==>
;     (exists j: Int :: { (j in [0..length(a))) } (j in [0..length(a)))))
(declare-const $t@103@01 $Snap)
(assert (= $t@103@01 $Snap.unit))
; [eval] (forall e: Int :: { (e in elements(a)) } (e in elements(a)) ==> (exists j: Int :: { (j in [0..length(a))) } (j in [0..length(a)))))
(declare-const e@104@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (e in elements(a)) ==> (exists j: Int :: { (j in [0..length(a))) } (j in [0..length(a))))
; [eval] (e in elements(a))
; [eval] elements(a)
(push) ; 4
(declare-const i@105@01 Int)
(push) ; 5
; [eval] (i in [0..length(this)))
; [eval] [0..length(this))
; [eval] length(this)
(assert (Seq_contains (Seq_range 0 (length<Int> a@90@01)) i@105@01))
; [eval] loc(this, i)
(pop) ; 5
(declare-fun inv@106@01 ($Ref) Int)
(declare-fun img@107@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((i1@105@01 Int) (i2@105@01 Int)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) i1@105@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@99@01  $FVF<val>) (loc<Ref> a@90@01 i1@105@01)) (loc<Ref> a@90@01 i1@105@01)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) i2@105@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@99@01  $FVF<val>) (loc<Ref> a@90@01 i2@105@01)) (loc<Ref> a@90@01 i2@105@01)))
      (= (loc<Ref> a@90@01 i1@105@01) (loc<Ref> a@90@01 i2@105@01)))
    (= i1@105@01 i2@105@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@105@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@90@01)) i@105@01)
    (and
      (= (inv@106@01 (loc<Ref> a@90@01 i@105@01)) i@105@01)
      (img@107@01 (loc<Ref> a@90@01 i@105@01))))
  :pattern ((loc<Ref> a@90@01 i@105@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@107@01 r)
      (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@106@01 r)))
    (= (loc<Ref> a@90@01 (inv@106@01 r)) r))
  :pattern ((inv@106@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@106@01 r))
    ($FVF.loc_val ($FVF.lookup_val (as sm@99@01  $FVF<val>) r) r))
  :pattern ((inv@106@01 r))
  :qid |quant-u-83|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@108@01 ((r $Ref) (e@104@01 Int)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@106@01 r))
      (img@107@01 r)
      (= r (loc<Ref> a@90@01 (inv@106@01 r))))
    ($Perm.min
      (ite
        (and
          (img@98@01 r)
          (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@97@01 r)))
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
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@98@01 r)
          (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@97@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@108@01 r e@104@01))
    $Perm.No)
  
  :qid |quant-u-85|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@106@01 r))
      (img@107@01 r)
      (= r (loc<Ref> a@90@01 (inv@106@01 r))))
    (= (- $Perm.Write (pTaken@108@01 r e@104@01)) $Perm.No))
  
  :qid |quant-u-86|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@109@01 $FVF<val>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@109@01  $FVF<val>)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@106@01 r))
        (img@107@01 r)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@106@01 r))
        (img@107@01 r))
      (Set_in r ($FVF.domain_val (as sm@109@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@109@01  $FVF<val>))))
  :qid |qp.fvfDomDef78|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@106@01 r))
        (img@107@01 r))
      (and
        (img@98@01 r)
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@97@01 r))))
    (=
      ($FVF.lookup_val (as sm@109@01  $FVF<val>) r)
      ($FVF.lookup_val $t@96@01 r)))
  :pattern (($FVF.lookup_val (as sm@109@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val $t@96@01 r))
  :qid |qp.fvfValDef76|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val $t@96@01 r) r)
  :pattern (($FVF.lookup_val (as sm@109@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef77|)))
(assert (elements%precondition ($SortWrappers.$FVF<val>To$Snap (as sm@109@01  $FVF<val>)) a@90@01))
(pop) ; 4
; Joined path conditions
(assert (forall ((i@105@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@90@01)) i@105@01)
    (and
      (= (inv@106@01 (loc<Ref> a@90@01 i@105@01)) i@105@01)
      (img@107@01 (loc<Ref> a@90@01 i@105@01))))
  :pattern ((loc<Ref> a@90@01 i@105@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@107@01 r)
      (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@106@01 r)))
    (= (loc<Ref> a@90@01 (inv@106@01 r)) r))
  :pattern ((inv@106@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@109@01  $FVF<val>)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@106@01 r))
        (img@107@01 r)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@106@01 r))
        (img@107@01 r))
      (Set_in r ($FVF.domain_val (as sm@109@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@109@01  $FVF<val>))))
  :qid |qp.fvfDomDef78|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@106@01 r))
        (img@107@01 r))
      (and
        (img@98@01 r)
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@97@01 r))))
    (=
      ($FVF.lookup_val (as sm@109@01  $FVF<val>) r)
      ($FVF.lookup_val $t@96@01 r)))
  :pattern (($FVF.lookup_val (as sm@109@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val $t@96@01 r))
  :qid |qp.fvfValDef76|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val $t@96@01 r) r)
  :pattern (($FVF.lookup_val (as sm@109@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef77|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@106@01 r))
      ($FVF.loc_val ($FVF.lookup_val (as sm@99@01  $FVF<val>) r) r))
    :pattern ((inv@106@01 r))
    :qid |quant-u-83|))
  (elements%precondition ($SortWrappers.$FVF<val>To$Snap (as sm@109@01  $FVF<val>)) a@90@01)))
(set-option :timeout 0)
(push) ; 4
; [then-branch: 2 | e@104@01 in elements(sm@109@01, a@90@01) | live]
; [else-branch: 2 | !(e@104@01 in elements(sm@109@01, a@90@01)) | live]
(push) ; 5
; [then-branch: 2 | e@104@01 in elements(sm@109@01, a@90@01)]
(assert (Set_in e@104@01 (elements ($SortWrappers.$FVF<val>To$Snap (as sm@109@01  $FVF<val>)) a@90@01)))
; [eval] (exists j: Int :: { (j in [0..length(a))) } (j in [0..length(a))))
(declare-const j@110@01 Int)
(push) ; 6
; [eval] (j in [0..length(a)))
; [eval] [0..length(a))
; [eval] length(a)
(pop) ; 6
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(pop) ; 5
(push) ; 5
; [else-branch: 2 | !(e@104@01 in elements(sm@109@01, a@90@01))]
(assert (not
  (Set_in e@104@01 (elements ($SortWrappers.$FVF<val>To$Snap (as sm@109@01  $FVF<val>)) a@90@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (Set_in e@104@01 (elements ($SortWrappers.$FVF<val>To$Snap (as sm@109@01  $FVF<val>)) a@90@01)))
  (Set_in e@104@01 (elements ($SortWrappers.$FVF<val>To$Snap (as sm@109@01  $FVF<val>)) a@90@01))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((i@105@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@90@01)) i@105@01)
    (and
      (= (inv@106@01 (loc<Ref> a@90@01 i@105@01)) i@105@01)
      (img@107@01 (loc<Ref> a@90@01 i@105@01))))
  :pattern ((loc<Ref> a@90@01 i@105@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@107@01 r)
      (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@106@01 r)))
    (= (loc<Ref> a@90@01 (inv@106@01 r)) r))
  :pattern ((inv@106@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@109@01  $FVF<val>)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@106@01 r))
        (img@107@01 r)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@106@01 r))
        (img@107@01 r))
      (Set_in r ($FVF.domain_val (as sm@109@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@109@01  $FVF<val>))))
  :qid |qp.fvfDomDef78|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@106@01 r))
        (img@107@01 r))
      (and
        (img@98@01 r)
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@97@01 r))))
    (=
      ($FVF.lookup_val (as sm@109@01  $FVF<val>) r)
      ($FVF.lookup_val $t@96@01 r)))
  :pattern (($FVF.lookup_val (as sm@109@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val $t@96@01 r))
  :qid |qp.fvfValDef76|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val $t@96@01 r) r)
  :pattern (($FVF.lookup_val (as sm@109@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef77|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@106@01 r))
    ($FVF.loc_val ($FVF.lookup_val (as sm@99@01  $FVF<val>) r) r))
  :pattern ((inv@106@01 r))
  :qid |quant-u-83|)))
(assert (elements%precondition ($SortWrappers.$FVF<val>To$Snap (as sm@109@01  $FVF<val>)) a@90@01))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((e@104@01 Int)) (!
  (or
    (not
      (Set_in e@104@01 (elements ($SortWrappers.$FVF<val>To$Snap (as sm@109@01  $FVF<val>)) a@90@01)))
    (Set_in e@104@01 (elements ($SortWrappers.$FVF<val>To$Snap (as sm@109@01  $FVF<val>)) a@90@01)))
  :pattern ((Set_in e@104@01 (elements ($SortWrappers.$FVF<val>To$Snap (as sm@109@01  $FVF<val>)) a@90@01)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0207.vpr@43@10@43@82-aux|)))
(assert (forall ((e@104@01 Int)) (!
  (=>
    (Set_in e@104@01 (elements ($SortWrappers.$FVF<val>To$Snap (as sm@109@01  $FVF<val>)) a@90@01))
    (exists ((j@110@01 Int)) (!
      (Seq_contains (Seq_range 0 (length<Int> a@90@01)) j@110@01)
      :pattern ((Seq_contains (Seq_range 0 (length<Int> a@90@01)) j@110@01))
      :pattern ((Seq_contains_trigger
        (Seq_range 0 (length<Int> a@90@01))
        j@110@01))
      :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0207.vpr@43@47@43@82|)))
  :pattern ((Set_in e@104@01 (elements ($SortWrappers.$FVF<val>To$Snap (as sm@109@01  $FVF<val>)) a@90@01)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0207.vpr@43@10@43@82|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; tmp := loc(a, x).val
; [eval] loc(a, x)
(assert ($FVF.loc_val ($FVF.lookup_val $t@96@01 (loc<Ref> a@90@01 x@91@01)) (loc<Ref> a@90@01 x@91@01)))
(set-option :timeout 0)
(push) ; 3
(assert (not (and
  (img@98@01 (loc<Ref> a@90@01 x@91@01))
  (Seq_contains
    (Seq_range 0 (length<Int> a@90@01))
    (inv@97@01 (loc<Ref> a@90@01 x@91@01))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const tmp@111@01 Int)
(assert (= tmp@111@01 ($FVF.lookup_val $t@96@01 (loc<Ref> a@90@01 x@91@01))))
; [exec]
; loc(a, x).val := loc(a, y).val
; [eval] loc(a, x)
; [eval] loc(a, y)
(assert ($FVF.loc_val ($FVF.lookup_val $t@96@01 (loc<Ref> a@90@01 y@92@01)) (loc<Ref> a@90@01 y@92@01)))
(push) ; 3
(assert (not (and
  (img@98@01 (loc<Ref> a@90@01 y@92@01))
  (Seq_contains
    (Seq_range 0 (length<Int> a@90@01))
    (inv@97@01 (loc<Ref> a@90@01 y@92@01))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const sm@112@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@98@01 r)
      (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@97@01 r)))
    (=
      ($FVF.lookup_val (as sm@112@01  $FVF<val>) r)
      ($FVF.lookup_val $t@96@01 r)))
  :pattern (($FVF.lookup_val (as sm@112@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val $t@96@01 r))
  :qid |qp.fvfValDef79|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val $t@96@01 r) r)
  :pattern (($FVF.lookup_val (as sm@112@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef80|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@112@01  $FVF<val>) (loc<Ref> a@90@01 x@91@01)) (loc<Ref> a@90@01 x@91@01)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@113@01 ((r $Ref)) $Perm
  (ite
    (= r (loc<Ref> a@90@01 x@91@01))
    ($Perm.min
      (ite
        (and
          (img@98@01 r)
          (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@97@01 r)))
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
          (img@98@01 r)
          (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@97@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@113@01 r))
    $Perm.No)
  
  :qid |quant-u-88|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@113@01 r) $Perm.No)
  
  :qid |quant-u-89|))))
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
    (= r (loc<Ref> a@90@01 x@91@01))
    (= (- $Perm.Write (pTaken@113@01 r)) $Perm.No))
  
  :qid |quant-u-90|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@114@01 $FVF<val>)
; Definitional axioms for singleton-FVF's value
(assert (=
  ($FVF.lookup_val (as sm@114@01  $FVF<val>) (loc<Ref> a@90@01 x@91@01))
  ($FVF.lookup_val $t@96@01 (loc<Ref> a@90@01 y@92@01))))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@114@01  $FVF<val>) (loc<Ref> a@90@01 x@91@01)) (loc<Ref> a@90@01 x@91@01)))
; [exec]
; loc(a, y).val := tmp
; [eval] loc(a, y)
(declare-const sm@115@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@90@01 x@91@01))
    (=
      ($FVF.lookup_val (as sm@115@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@114@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@115@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@114@01  $FVF<val>) r))
  :qid |qp.fvfValDef81|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@98@01 r)
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@97@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@113@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@115@01  $FVF<val>) r)
      ($FVF.lookup_val $t@96@01 r)))
  :pattern (($FVF.lookup_val (as sm@115@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val $t@96@01 r))
  :qid |qp.fvfValDef82|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@114@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val $t@96@01 r) r))
  :pattern (($FVF.lookup_val (as sm@115@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef83|)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@115@01  $FVF<val>) (loc<Ref> a@90@01 y@92@01)) (loc<Ref> a@90@01 y@92@01)))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (loc<Ref> a@90@01 x@91@01) (loc<Ref> a@90@01 y@92@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@116@01 ((r $Ref)) $Perm
  (ite
    (= r (loc<Ref> a@90@01 y@92@01))
    ($Perm.min
      (ite
        (and
          (img@98@01 r)
          (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@97@01 r)))
        (- $Perm.Write (pTaken@113@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@117@01 ((r $Ref)) $Perm
  (ite
    (= r (loc<Ref> a@90@01 y@92@01))
    ($Perm.min
      (ite (= r (loc<Ref> a@90@01 x@91@01)) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@116@01 r)))
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
          (img@98@01 r)
          (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@97@01 r)))
        (- $Perm.Write (pTaken@113@01 r))
        $Perm.No)
      (pTaken@116@01 r))
    $Perm.No)
  
  :qid |quant-u-92|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@116@01 r) $Perm.No)
  
  :qid |quant-u-93|))))
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
    (= r (loc<Ref> a@90@01 y@92@01))
    (= (- $Perm.Write (pTaken@116@01 r)) $Perm.No))
  
  :qid |quant-u-94|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@118@01 $FVF<val>)
; Definitional axioms for singleton-FVF's value
(assert (=
  ($FVF.lookup_val (as sm@118@01  $FVF<val>) (loc<Ref> a@90@01 y@92@01))
  tmp@111@01))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@118@01  $FVF<val>) (loc<Ref> a@90@01 y@92@01)) (loc<Ref> a@90@01 y@92@01)))
; [exec]
; assert elements(a) == old[pre](elements(a))
; [eval] elements(a) == old[pre](elements(a))
; [eval] elements(a)
(set-option :timeout 0)
(push) ; 3
(declare-const i@119@01 Int)
(push) ; 4
; [eval] (i in [0..length(this)))
; [eval] [0..length(this))
; [eval] length(this)
(assert (Seq_contains (Seq_range 0 (length<Int> a@90@01)) i@119@01))
; [eval] loc(this, i)
(pop) ; 4
(declare-fun inv@120@01 ($Ref) Int)
(declare-fun img@121@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-const sm@122@01 $FVF<val>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@90@01 y@92@01))
    (=
      ($FVF.lookup_val (as sm@122@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@118@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@122@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@118@01  $FVF<val>) r))
  :qid |qp.fvfValDef84|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@90@01 x@91@01))
    (=
      ($FVF.lookup_val (as sm@122@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@114@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@122@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@114@01  $FVF<val>) r))
  :qid |qp.fvfValDef85|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@98@01 r)
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@97@01 r)))
      (< $Perm.No (- (- $Perm.Write (pTaken@113@01 r)) (pTaken@116@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@122@01  $FVF<val>) r)
      ($FVF.lookup_val $t@96@01 r)))
  :pattern (($FVF.lookup_val (as sm@122@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val $t@96@01 r))
  :qid |qp.fvfValDef86|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@118@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@114@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val $t@96@01 r) r))
  :pattern (($FVF.lookup_val (as sm@122@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef87|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@119@01 Int) (i2@119@01 Int)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) i1@119@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@122@01  $FVF<val>) (loc<Ref> a@90@01 i1@119@01)) (loc<Ref> a@90@01 i1@119@01)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) i2@119@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@122@01  $FVF<val>) (loc<Ref> a@90@01 i2@119@01)) (loc<Ref> a@90@01 i2@119@01)))
      (= (loc<Ref> a@90@01 i1@119@01) (loc<Ref> a@90@01 i2@119@01)))
    (= i1@119@01 i2@119@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@119@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@90@01)) i@119@01)
    (and
      (= (inv@120@01 (loc<Ref> a@90@01 i@119@01)) i@119@01)
      (img@121@01 (loc<Ref> a@90@01 i@119@01))))
  :pattern ((loc<Ref> a@90@01 i@119@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@121@01 r)
      (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@120@01 r)))
    (= (loc<Ref> a@90@01 (inv@120@01 r)) r))
  :pattern ((inv@120@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@120@01 r))
    ($FVF.loc_val ($FVF.lookup_val (as sm@122@01  $FVF<val>) r) r))
  :pattern ((inv@120@01 r))
  :qid |quant-u-96|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@123@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@120@01 r))
      (img@121@01 r)
      (= r (loc<Ref> a@90@01 (inv@120@01 r))))
    ($Perm.min
      (ite
        (and
          (img@98@01 r)
          (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@97@01 r)))
        (- (- $Perm.Write (pTaken@113@01 r)) (pTaken@116@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@124@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@120@01 r))
      (img@121@01 r)
      (= r (loc<Ref> a@90@01 (inv@120@01 r))))
    ($Perm.min
      (ite (= r (loc<Ref> a@90@01 y@92@01)) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@123@01 r)))
    $Perm.No))
(define-fun pTaken@125@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@120@01 r))
      (img@121@01 r)
      (= r (loc<Ref> a@90@01 (inv@120@01 r))))
    ($Perm.min
      (ite (= r (loc<Ref> a@90@01 x@91@01)) $Perm.Write $Perm.No)
      (- (- $Perm.Write (pTaken@123@01 r)) (pTaken@124@01 r)))
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
          (img@98@01 r)
          (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@97@01 r)))
        (- (- $Perm.Write (pTaken@113@01 r)) (pTaken@116@01 r))
        $Perm.No)
      (pTaken@123@01 r))
    $Perm.No)
  
  :qid |quant-u-98|))))
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
      (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@120@01 r))
      (img@121@01 r)
      (= r (loc<Ref> a@90@01 (inv@120@01 r))))
    (= (- $Perm.Write (pTaken@123@01 r)) $Perm.No))
  
  :qid |quant-u-99|))))
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
    (ite
      (= (loc<Ref> a@90@01 y@92@01) (loc<Ref> a@90@01 y@92@01))
      $Perm.Write
      $Perm.No)
    (pTaken@124@01 (loc<Ref> a@90@01 y@92@01)))
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
      (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@120@01 r))
      (img@121@01 r)
      (= r (loc<Ref> a@90@01 (inv@120@01 r))))
    (= (- (- $Perm.Write (pTaken@123@01 r)) (pTaken@124@01 r)) $Perm.No))
  
  :qid |quant-u-101|))))
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
    (ite
      (= (loc<Ref> a@90@01 x@91@01) (loc<Ref> a@90@01 x@91@01))
      $Perm.Write
      $Perm.No)
    (pTaken@125@01 (loc<Ref> a@90@01 x@91@01)))
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
      (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@120@01 r))
      (img@121@01 r)
      (= r (loc<Ref> a@90@01 (inv@120@01 r))))
    (=
      (-
        (- (- $Perm.Write (pTaken@123@01 r)) (pTaken@124@01 r))
        (pTaken@125@01 r))
      $Perm.No))
  
  :qid |quant-u-103|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@126@01 $FVF<val>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@126@01  $FVF<val>)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@120@01 r))
        (img@121@01 r)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@120@01 r))
        (img@121@01 r))
      (Set_in r ($FVF.domain_val (as sm@126@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@126@01  $FVF<val>))))
  :qid |qp.fvfDomDef92|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@120@01 r))
        (img@121@01 r))
      (= r (loc<Ref> a@90@01 y@92@01)))
    (=
      ($FVF.lookup_val (as sm@126@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@118@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@126@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@118@01  $FVF<val>) r))
  :qid |qp.fvfValDef88|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@120@01 r))
        (img@121@01 r))
      (= r (loc<Ref> a@90@01 x@91@01)))
    (=
      ($FVF.lookup_val (as sm@126@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@114@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@126@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@114@01  $FVF<val>) r))
  :qid |qp.fvfValDef89|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@120@01 r))
        (img@121@01 r))
      (ite
        (and
          (img@98@01 r)
          (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@97@01 r)))
        (< $Perm.No (- (- $Perm.Write (pTaken@113@01 r)) (pTaken@116@01 r)))
        false))
    (=
      ($FVF.lookup_val (as sm@126@01  $FVF<val>) r)
      ($FVF.lookup_val $t@96@01 r)))
  :pattern (($FVF.lookup_val (as sm@126@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val $t@96@01 r))
  :qid |qp.fvfValDef90|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@118@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@114@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val $t@96@01 r) r))
  :pattern (($FVF.lookup_val (as sm@126@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef91|)))
(assert (elements%precondition ($SortWrappers.$FVF<val>To$Snap (as sm@126@01  $FVF<val>)) a@90@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@90@01 y@92@01))
    (=
      ($FVF.lookup_val (as sm@122@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@118@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@122@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@118@01  $FVF<val>) r))
  :qid |qp.fvfValDef84|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@90@01 x@91@01))
    (=
      ($FVF.lookup_val (as sm@122@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@114@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@122@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@114@01  $FVF<val>) r))
  :qid |qp.fvfValDef85|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@98@01 r)
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@97@01 r)))
      (< $Perm.No (- (- $Perm.Write (pTaken@113@01 r)) (pTaken@116@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@122@01  $FVF<val>) r)
      ($FVF.lookup_val $t@96@01 r)))
  :pattern (($FVF.lookup_val (as sm@122@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val $t@96@01 r))
  :qid |qp.fvfValDef86|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@118@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@114@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val $t@96@01 r) r))
  :pattern (($FVF.lookup_val (as sm@122@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef87|)))
(assert (forall ((i@119@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@90@01)) i@119@01)
    (and
      (= (inv@120@01 (loc<Ref> a@90@01 i@119@01)) i@119@01)
      (img@121@01 (loc<Ref> a@90@01 i@119@01))))
  :pattern ((loc<Ref> a@90@01 i@119@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@121@01 r)
      (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@120@01 r)))
    (= (loc<Ref> a@90@01 (inv@120@01 r)) r))
  :pattern ((inv@120@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@126@01  $FVF<val>)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@120@01 r))
        (img@121@01 r)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@120@01 r))
        (img@121@01 r))
      (Set_in r ($FVF.domain_val (as sm@126@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@126@01  $FVF<val>))))
  :qid |qp.fvfDomDef92|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@120@01 r))
        (img@121@01 r))
      (= r (loc<Ref> a@90@01 y@92@01)))
    (=
      ($FVF.lookup_val (as sm@126@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@118@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@126@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@118@01  $FVF<val>) r))
  :qid |qp.fvfValDef88|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@120@01 r))
        (img@121@01 r))
      (= r (loc<Ref> a@90@01 x@91@01)))
    (=
      ($FVF.lookup_val (as sm@126@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@114@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@126@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@114@01  $FVF<val>) r))
  :qid |qp.fvfValDef89|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@120@01 r))
        (img@121@01 r))
      (ite
        (and
          (img@98@01 r)
          (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@97@01 r)))
        (< $Perm.No (- (- $Perm.Write (pTaken@113@01 r)) (pTaken@116@01 r)))
        false))
    (=
      ($FVF.lookup_val (as sm@126@01  $FVF<val>) r)
      ($FVF.lookup_val $t@96@01 r)))
  :pattern (($FVF.lookup_val (as sm@126@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val $t@96@01 r))
  :qid |qp.fvfValDef90|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@118@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@114@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val $t@96@01 r) r))
  :pattern (($FVF.lookup_val (as sm@126@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef91|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@120@01 r))
      ($FVF.loc_val ($FVF.lookup_val (as sm@122@01  $FVF<val>) r) r))
    :pattern ((inv@120@01 r))
    :qid |quant-u-96|))
  (elements%precondition ($SortWrappers.$FVF<val>To$Snap (as sm@126@01  $FVF<val>)) a@90@01)))
; [eval] old[pre](elements(a))
; [eval] elements(a)
(set-option :timeout 0)
(push) ; 3
(declare-const i@127@01 Int)
(push) ; 4
; [eval] (i in [0..length(this)))
; [eval] [0..length(this))
; [eval] length(this)
(assert (Seq_contains (Seq_range 0 (length<Int> a@90@01)) i@127@01))
; [eval] loc(this, i)
(pop) ; 4
(declare-fun inv@128@01 ($Ref) Int)
(declare-fun img@129@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@127@01 Int) (i2@127@01 Int)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) i1@127@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@112@01  $FVF<val>) (loc<Ref> a@90@01 i1@127@01)) (loc<Ref> a@90@01 i1@127@01)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) i2@127@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@112@01  $FVF<val>) (loc<Ref> a@90@01 i2@127@01)) (loc<Ref> a@90@01 i2@127@01)))
      (= (loc<Ref> a@90@01 i1@127@01) (loc<Ref> a@90@01 i2@127@01)))
    (= i1@127@01 i2@127@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@127@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@90@01)) i@127@01)
    (and
      (= (inv@128@01 (loc<Ref> a@90@01 i@127@01)) i@127@01)
      (img@129@01 (loc<Ref> a@90@01 i@127@01))))
  :pattern ((loc<Ref> a@90@01 i@127@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@129@01 r)
      (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@128@01 r)))
    (= (loc<Ref> a@90@01 (inv@128@01 r)) r))
  :pattern ((inv@128@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@128@01 r))
    ($FVF.loc_val ($FVF.lookup_val (as sm@112@01  $FVF<val>) r) r))
  :pattern ((inv@128@01 r))
  :qid |quant-u-105|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@130@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@128@01 r))
      (img@129@01 r)
      (= r (loc<Ref> a@90@01 (inv@128@01 r))))
    ($Perm.min
      (ite
        (and
          (img@98@01 r)
          (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@97@01 r)))
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
        (and
          (img@98@01 r)
          (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@97@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@130@01 r))
    $Perm.No)
  
  :qid |quant-u-107|))))
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
      (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@128@01 r))
      (img@129@01 r)
      (= r (loc<Ref> a@90@01 (inv@128@01 r))))
    (= (- $Perm.Write (pTaken@130@01 r)) $Perm.No))
  
  :qid |quant-u-108|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@131@01 $FVF<val>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@131@01  $FVF<val>)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@128@01 r))
        (img@129@01 r)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@128@01 r))
        (img@129@01 r))
      (Set_in r ($FVF.domain_val (as sm@131@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@131@01  $FVF<val>))))
  :qid |qp.fvfDomDef95|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@128@01 r))
        (img@129@01 r))
      (and
        (img@98@01 r)
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@97@01 r))))
    (=
      ($FVF.lookup_val (as sm@131@01  $FVF<val>) r)
      ($FVF.lookup_val $t@96@01 r)))
  :pattern (($FVF.lookup_val (as sm@131@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val $t@96@01 r))
  :qid |qp.fvfValDef93|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val $t@96@01 r) r)
  :pattern (($FVF.lookup_val (as sm@131@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef94|)))
(assert (elements%precondition ($SortWrappers.$FVF<val>To$Snap (as sm@131@01  $FVF<val>)) a@90@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((i@127@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@90@01)) i@127@01)
    (and
      (= (inv@128@01 (loc<Ref> a@90@01 i@127@01)) i@127@01)
      (img@129@01 (loc<Ref> a@90@01 i@127@01))))
  :pattern ((loc<Ref> a@90@01 i@127@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@129@01 r)
      (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@128@01 r)))
    (= (loc<Ref> a@90@01 (inv@128@01 r)) r))
  :pattern ((inv@128@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@131@01  $FVF<val>)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@128@01 r))
        (img@129@01 r)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@128@01 r))
        (img@129@01 r))
      (Set_in r ($FVF.domain_val (as sm@131@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@131@01  $FVF<val>))))
  :qid |qp.fvfDomDef95|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@128@01 r))
        (img@129@01 r))
      (and
        (img@98@01 r)
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@97@01 r))))
    (=
      ($FVF.lookup_val (as sm@131@01  $FVF<val>) r)
      ($FVF.lookup_val $t@96@01 r)))
  :pattern (($FVF.lookup_val (as sm@131@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val $t@96@01 r))
  :qid |qp.fvfValDef93|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val $t@96@01 r) r)
  :pattern (($FVF.lookup_val (as sm@131@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef94|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@128@01 r))
      ($FVF.loc_val ($FVF.lookup_val (as sm@112@01  $FVF<val>) r) r))
    :pattern ((inv@128@01 r))
    :qid |quant-u-105|))
  (elements%precondition ($SortWrappers.$FVF<val>To$Snap (as sm@131@01  $FVF<val>)) a@90@01)))
(set-option :timeout 0)
(push) ; 3
(assert (not (Set_equal (elements ($SortWrappers.$FVF<val>To$Snap (as sm@126@01  $FVF<val>)) a@90@01) (elements ($SortWrappers.$FVF<val>To$Snap (as sm@131@01  $FVF<val>)) a@90@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,01s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (loc<Ref> a@90@01 y@92@01) (loc<Ref> a@90@01 x@91@01))))
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
      (= (loc<Ref> a@90@01 y@92@01) (loc<Ref> a@90@01 y@92@01))
      $Perm.Write
      $Perm.No)
    (ite
      (= (loc<Ref> a@90@01 x@91@01) (loc<Ref> a@90@01 x@91@01))
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
      (= (loc<Ref> a@90@01 x@91@01) (loc<Ref> a@90@01 x@91@01))
      $Perm.Write
      $Perm.No)
    (ite
      (= (loc<Ref> a@90@01 y@92@01) (loc<Ref> a@90@01 y@92@01))
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
    (= (loc<Ref> a@90@01 y@92@01) (loc<Ref> a@90@01 y@92@01))
    (= (loc<Ref> a@90@01 x@91@01) (loc<Ref> a@90@01 x@91@01)))
  (not
    (=
      ($FVF.lookup_val (as sm@118@01  $FVF<val>) (loc<Ref> a@90@01 y@92@01))
      ($FVF.lookup_val (as sm@114@01  $FVF<val>) (loc<Ref> a@90@01 x@91@01)))))))
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
    (= (loc<Ref> a@90@01 x@91@01) (loc<Ref> a@90@01 x@91@01))
    (= (loc<Ref> a@90@01 y@92@01) (loc<Ref> a@90@01 y@92@01)))
  (not
    (=
      ($FVF.lookup_val (as sm@114@01  $FVF<val>) (loc<Ref> a@90@01 x@91@01))
      ($FVF.lookup_val (as sm@118@01  $FVF<val>) (loc<Ref> a@90@01 y@92@01)))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and
  (not (= (loc<Ref> a@90@01 y@92@01) (loc<Ref> a@90@01 x@91@01)))
  (not (= (loc<Ref> a@90@01 x@91@01) (loc<Ref> a@90@01 y@92@01)))))
(declare-const sm@132@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@90@01 y@92@01))
    (=
      ($FVF.lookup_val (as sm@132@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@118@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@132@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@118@01  $FVF<val>) r))
  :qid |qp.fvfValDef96|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@90@01 x@91@01))
    (=
      ($FVF.lookup_val (as sm@132@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@114@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@132@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@114@01  $FVF<val>) r))
  :qid |qp.fvfValDef97|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@98@01 r)
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@97@01 r)))
      (< $Perm.No (- (- $Perm.Write (pTaken@113@01 r)) (pTaken@116@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@132@01  $FVF<val>) r)
      ($FVF.lookup_val $t@96@01 r)))
  :pattern (($FVF.lookup_val (as sm@132@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val $t@96@01 r))
  :qid |qp.fvfValDef98|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@118@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@114@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val $t@96@01 r) r))
  :pattern (($FVF.lookup_val (as sm@132@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef99|)))
(declare-const pm@133@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@133@01  $FPM) r)
    (+
      (+
        (ite (= r (loc<Ref> a@90@01 y@92@01)) $Perm.Write $Perm.No)
        (ite (= r (loc<Ref> a@90@01 x@91@01)) $Perm.Write $Perm.No))
      (ite
        (and
          (img@98@01 r)
          (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@97@01 r)))
        (- (- $Perm.Write (pTaken@113@01 r)) (pTaken@116@01 r))
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@133@01  $FPM) r))
  :qid |qp.resPrmSumDef100|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@132@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@118@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@114@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val $t@96@01 r) r))
  :pattern (($FVF.perm_val (as pm@133@01  $FPM) r))
  :qid |qp.resTrgDef101|)))
; Assume upper permission bound for field val
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_val (as pm@133@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_val ($FVF.lookup_val (as sm@132@01  $FVF<val>) r) r))
  :qid |qp-fld-prm-bnd|)))
; [eval] elements(a) == old[pre](elements(a))
; [eval] elements(a)
(set-option :timeout 0)
(push) ; 3
(declare-const i@134@01 Int)
(push) ; 4
; [eval] (i in [0..length(this)))
; [eval] [0..length(this))
; [eval] length(this)
(assert (Seq_contains (Seq_range 0 (length<Int> a@90@01)) i@134@01))
; [eval] loc(this, i)
(pop) ; 4
(declare-fun inv@135@01 ($Ref) Int)
(declare-fun img@136@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-const sm@137@01 $FVF<val>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@98@01 r)
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@97@01 r)))
      (< $Perm.No (- (- $Perm.Write (pTaken@113@01 r)) (pTaken@116@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@137@01  $FVF<val>) r)
      ($FVF.lookup_val $t@96@01 r)))
  :pattern (($FVF.lookup_val (as sm@137@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val $t@96@01 r))
  :qid |qp.fvfValDef102|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@90@01 x@91@01))
    (=
      ($FVF.lookup_val (as sm@137@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@114@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@137@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@114@01  $FVF<val>) r))
  :qid |qp.fvfValDef103|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@90@01 y@92@01))
    (=
      ($FVF.lookup_val (as sm@137@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@118@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@137@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@118@01  $FVF<val>) r))
  :qid |qp.fvfValDef104|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val $t@96@01 r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@114@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@118@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@137@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef105|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@134@01 Int) (i2@134@01 Int)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) i1@134@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@137@01  $FVF<val>) (loc<Ref> a@90@01 i1@134@01)) (loc<Ref> a@90@01 i1@134@01)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) i2@134@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@137@01  $FVF<val>) (loc<Ref> a@90@01 i2@134@01)) (loc<Ref> a@90@01 i2@134@01)))
      (= (loc<Ref> a@90@01 i1@134@01) (loc<Ref> a@90@01 i2@134@01)))
    (= i1@134@01 i2@134@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@134@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@90@01)) i@134@01)
    (and
      (= (inv@135@01 (loc<Ref> a@90@01 i@134@01)) i@134@01)
      (img@136@01 (loc<Ref> a@90@01 i@134@01))))
  :pattern ((loc<Ref> a@90@01 i@134@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@136@01 r)
      (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@135@01 r)))
    (= (loc<Ref> a@90@01 (inv@135@01 r)) r))
  :pattern ((inv@135@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@135@01 r))
    ($FVF.loc_val ($FVF.lookup_val (as sm@137@01  $FVF<val>) r) r))
  :pattern ((inv@135@01 r))
  :qid |quant-u-110|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@138@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@135@01 r))
      (img@136@01 r)
      (= r (loc<Ref> a@90@01 (inv@135@01 r))))
    ($Perm.min
      (ite
        (and
          (img@98@01 r)
          (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@97@01 r)))
        (- (- $Perm.Write (pTaken@113@01 r)) (pTaken@116@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@139@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@135@01 r))
      (img@136@01 r)
      (= r (loc<Ref> a@90@01 (inv@135@01 r))))
    ($Perm.min
      (ite (= r (loc<Ref> a@90@01 x@91@01)) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@138@01 r)))
    $Perm.No))
(define-fun pTaken@140@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@135@01 r))
      (img@136@01 r)
      (= r (loc<Ref> a@90@01 (inv@135@01 r))))
    ($Perm.min
      (ite (= r (loc<Ref> a@90@01 y@92@01)) $Perm.Write $Perm.No)
      (- (- $Perm.Write (pTaken@138@01 r)) (pTaken@139@01 r)))
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
          (img@98@01 r)
          (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@97@01 r)))
        (- (- $Perm.Write (pTaken@113@01 r)) (pTaken@116@01 r))
        $Perm.No)
      (pTaken@138@01 r))
    $Perm.No)
  
  :qid |quant-u-112|))))
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
      (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@135@01 r))
      (img@136@01 r)
      (= r (loc<Ref> a@90@01 (inv@135@01 r))))
    (= (- $Perm.Write (pTaken@138@01 r)) $Perm.No))
  
  :qid |quant-u-113|))))
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
    (ite
      (= (loc<Ref> a@90@01 x@91@01) (loc<Ref> a@90@01 x@91@01))
      $Perm.Write
      $Perm.No)
    (pTaken@139@01 (loc<Ref> a@90@01 x@91@01)))
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
      (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@135@01 r))
      (img@136@01 r)
      (= r (loc<Ref> a@90@01 (inv@135@01 r))))
    (= (- (- $Perm.Write (pTaken@138@01 r)) (pTaken@139@01 r)) $Perm.No))
  
  :qid |quant-u-115|))))
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
    (ite
      (= (loc<Ref> a@90@01 y@92@01) (loc<Ref> a@90@01 y@92@01))
      $Perm.Write
      $Perm.No)
    (pTaken@140@01 (loc<Ref> a@90@01 y@92@01)))
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
      (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@135@01 r))
      (img@136@01 r)
      (= r (loc<Ref> a@90@01 (inv@135@01 r))))
    (=
      (-
        (- (- $Perm.Write (pTaken@138@01 r)) (pTaken@139@01 r))
        (pTaken@140@01 r))
      $Perm.No))
  
  :qid |quant-u-117|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@141@01 $FVF<val>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@141@01  $FVF<val>)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@135@01 r))
        (img@136@01 r)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@135@01 r))
        (img@136@01 r))
      (Set_in r ($FVF.domain_val (as sm@141@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@141@01  $FVF<val>))))
  :qid |qp.fvfDomDef110|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@135@01 r))
        (img@136@01 r))
      (ite
        (and
          (img@98@01 r)
          (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@97@01 r)))
        (< $Perm.No (- (- $Perm.Write (pTaken@113@01 r)) (pTaken@116@01 r)))
        false))
    (=
      ($FVF.lookup_val (as sm@141@01  $FVF<val>) r)
      ($FVF.lookup_val $t@96@01 r)))
  :pattern (($FVF.lookup_val (as sm@141@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val $t@96@01 r))
  :qid |qp.fvfValDef106|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@135@01 r))
        (img@136@01 r))
      (= r (loc<Ref> a@90@01 x@91@01)))
    (=
      ($FVF.lookup_val (as sm@141@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@114@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@141@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@114@01  $FVF<val>) r))
  :qid |qp.fvfValDef107|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@135@01 r))
        (img@136@01 r))
      (= r (loc<Ref> a@90@01 y@92@01)))
    (=
      ($FVF.lookup_val (as sm@141@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@118@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@141@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@118@01  $FVF<val>) r))
  :qid |qp.fvfValDef108|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val $t@96@01 r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@114@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@118@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@141@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef109|)))
(assert (elements%precondition ($SortWrappers.$FVF<val>To$Snap (as sm@141@01  $FVF<val>)) a@90@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@98@01 r)
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@97@01 r)))
      (< $Perm.No (- (- $Perm.Write (pTaken@113@01 r)) (pTaken@116@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@137@01  $FVF<val>) r)
      ($FVF.lookup_val $t@96@01 r)))
  :pattern (($FVF.lookup_val (as sm@137@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val $t@96@01 r))
  :qid |qp.fvfValDef102|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@90@01 x@91@01))
    (=
      ($FVF.lookup_val (as sm@137@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@114@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@137@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@114@01  $FVF<val>) r))
  :qid |qp.fvfValDef103|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@90@01 y@92@01))
    (=
      ($FVF.lookup_val (as sm@137@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@118@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@137@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@118@01  $FVF<val>) r))
  :qid |qp.fvfValDef104|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val $t@96@01 r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@114@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@118@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@137@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef105|)))
(assert (forall ((i@134@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@90@01)) i@134@01)
    (and
      (= (inv@135@01 (loc<Ref> a@90@01 i@134@01)) i@134@01)
      (img@136@01 (loc<Ref> a@90@01 i@134@01))))
  :pattern ((loc<Ref> a@90@01 i@134@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@136@01 r)
      (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@135@01 r)))
    (= (loc<Ref> a@90@01 (inv@135@01 r)) r))
  :pattern ((inv@135@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@141@01  $FVF<val>)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@135@01 r))
        (img@136@01 r)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@135@01 r))
        (img@136@01 r))
      (Set_in r ($FVF.domain_val (as sm@141@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@141@01  $FVF<val>))))
  :qid |qp.fvfDomDef110|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@135@01 r))
        (img@136@01 r))
      (ite
        (and
          (img@98@01 r)
          (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@97@01 r)))
        (< $Perm.No (- (- $Perm.Write (pTaken@113@01 r)) (pTaken@116@01 r)))
        false))
    (=
      ($FVF.lookup_val (as sm@141@01  $FVF<val>) r)
      ($FVF.lookup_val $t@96@01 r)))
  :pattern (($FVF.lookup_val (as sm@141@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val $t@96@01 r))
  :qid |qp.fvfValDef106|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@135@01 r))
        (img@136@01 r))
      (= r (loc<Ref> a@90@01 x@91@01)))
    (=
      ($FVF.lookup_val (as sm@141@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@114@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@141@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@114@01  $FVF<val>) r))
  :qid |qp.fvfValDef107|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@135@01 r))
        (img@136@01 r))
      (= r (loc<Ref> a@90@01 y@92@01)))
    (=
      ($FVF.lookup_val (as sm@141@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@118@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@141@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@118@01  $FVF<val>) r))
  :qid |qp.fvfValDef108|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val $t@96@01 r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@114@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@118@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@141@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef109|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@135@01 r))
      ($FVF.loc_val ($FVF.lookup_val (as sm@137@01  $FVF<val>) r) r))
    :pattern ((inv@135@01 r))
    :qid |quant-u-110|))
  (elements%precondition ($SortWrappers.$FVF<val>To$Snap (as sm@141@01  $FVF<val>)) a@90@01)))
; [eval] old[pre](elements(a))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
(declare-const pm@142@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@142@01  $FPM) r)
    (ite
      (and
        (img@98@01 r)
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@97@01 r)))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_val (as pm@142@01  $FPM) r))
  :qid |qp.resPrmSumDef111|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@112@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val $t@96@01 r) r))
  :pattern (($FVF.perm_val (as pm@142@01  $FPM) r))
  :qid |qp.resTrgDef112|)))
; Assume upper permission bound for field val
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_val (as pm@142@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_val ($FVF.lookup_val (as sm@112@01  $FVF<val>) r) r))
  :qid |qp-fld-prm-bnd|)))
; [eval] elements(a)
(set-option :timeout 0)
(push) ; 3
(declare-const i@143@01 Int)
(push) ; 4
; [eval] (i in [0..length(this)))
; [eval] [0..length(this))
; [eval] length(this)
(assert (Seq_contains (Seq_range 0 (length<Int> a@90@01)) i@143@01))
; [eval] loc(this, i)
(pop) ; 4
(declare-fun inv@144@01 ($Ref) Int)
(declare-fun img@145@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@143@01 Int) (i2@143@01 Int)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) i1@143@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@112@01  $FVF<val>) (loc<Ref> a@90@01 i1@143@01)) (loc<Ref> a@90@01 i1@143@01)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) i2@143@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@112@01  $FVF<val>) (loc<Ref> a@90@01 i2@143@01)) (loc<Ref> a@90@01 i2@143@01)))
      (= (loc<Ref> a@90@01 i1@143@01) (loc<Ref> a@90@01 i2@143@01)))
    (= i1@143@01 i2@143@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@143@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@90@01)) i@143@01)
    (and
      (= (inv@144@01 (loc<Ref> a@90@01 i@143@01)) i@143@01)
      (img@145@01 (loc<Ref> a@90@01 i@143@01))))
  :pattern ((loc<Ref> a@90@01 i@143@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@145@01 r)
      (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@144@01 r)))
    (= (loc<Ref> a@90@01 (inv@144@01 r)) r))
  :pattern ((inv@144@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@144@01 r))
    ($FVF.loc_val ($FVF.lookup_val (as sm@112@01  $FVF<val>) r) r))
  :pattern ((inv@144@01 r))
  :qid |quant-u-119|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@146@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@144@01 r))
      (img@145@01 r)
      (= r (loc<Ref> a@90@01 (inv@144@01 r))))
    ($Perm.min
      (ite
        (and
          (img@98@01 r)
          (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@97@01 r)))
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
        (and
          (img@98@01 r)
          (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@97@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@146@01 r))
    $Perm.No)
  
  :qid |quant-u-121|))))
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
      (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@144@01 r))
      (img@145@01 r)
      (= r (loc<Ref> a@90@01 (inv@144@01 r))))
    (= (- $Perm.Write (pTaken@146@01 r)) $Perm.No))
  
  :qid |quant-u-122|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@147@01 $FVF<val>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@147@01  $FVF<val>)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@144@01 r))
        (img@145@01 r)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@144@01 r))
        (img@145@01 r))
      (Set_in r ($FVF.domain_val (as sm@147@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@147@01  $FVF<val>))))
  :qid |qp.fvfDomDef115|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@144@01 r))
        (img@145@01 r))
      (and
        (img@98@01 r)
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@97@01 r))))
    (=
      ($FVF.lookup_val (as sm@147@01  $FVF<val>) r)
      ($FVF.lookup_val $t@96@01 r)))
  :pattern (($FVF.lookup_val (as sm@147@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val $t@96@01 r))
  :qid |qp.fvfValDef113|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val $t@96@01 r) r)
  :pattern (($FVF.lookup_val (as sm@147@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef114|)))
(assert (elements%precondition ($SortWrappers.$FVF<val>To$Snap (as sm@147@01  $FVF<val>)) a@90@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((i@143@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@90@01)) i@143@01)
    (and
      (= (inv@144@01 (loc<Ref> a@90@01 i@143@01)) i@143@01)
      (img@145@01 (loc<Ref> a@90@01 i@143@01))))
  :pattern ((loc<Ref> a@90@01 i@143@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@145@01 r)
      (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@144@01 r)))
    (= (loc<Ref> a@90@01 (inv@144@01 r)) r))
  :pattern ((inv@144@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@147@01  $FVF<val>)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@144@01 r))
        (img@145@01 r)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@144@01 r))
        (img@145@01 r))
      (Set_in r ($FVF.domain_val (as sm@147@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@147@01  $FVF<val>))))
  :qid |qp.fvfDomDef115|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@144@01 r))
        (img@145@01 r))
      (and
        (img@98@01 r)
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@97@01 r))))
    (=
      ($FVF.lookup_val (as sm@147@01  $FVF<val>) r)
      ($FVF.lookup_val $t@96@01 r)))
  :pattern (($FVF.lookup_val (as sm@147@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val $t@96@01 r))
  :qid |qp.fvfValDef113|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val $t@96@01 r) r)
  :pattern (($FVF.lookup_val (as sm@147@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef114|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@144@01 r))
      ($FVF.loc_val ($FVF.lookup_val (as sm@112@01  $FVF<val>) r) r))
    :pattern ((inv@144@01 r))
    :qid |quant-u-119|))
  (elements%precondition ($SortWrappers.$FVF<val>To$Snap (as sm@147@01  $FVF<val>)) a@90@01)))
(set-option :timeout 0)
(push) ; 3
(assert (not (Set_equal (elements ($SortWrappers.$FVF<val>To$Snap (as sm@141@01  $FVF<val>)) a@90@01) (elements ($SortWrappers.$FVF<val>To$Snap (as sm@147@01  $FVF<val>)) a@90@01))))
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
(assert (not (= (loc<Ref> a@90@01 y@92@01) (loc<Ref> a@90@01 x@91@01))))
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
      (= (loc<Ref> a@90@01 y@92@01) (loc<Ref> a@90@01 y@92@01))
      $Perm.Write
      $Perm.No)
    (ite
      (= (loc<Ref> a@90@01 x@91@01) (loc<Ref> a@90@01 x@91@01))
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
      (= (loc<Ref> a@90@01 x@91@01) (loc<Ref> a@90@01 x@91@01))
      $Perm.Write
      $Perm.No)
    (ite
      (= (loc<Ref> a@90@01 y@92@01) (loc<Ref> a@90@01 y@92@01))
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
    (= (loc<Ref> a@90@01 y@92@01) (loc<Ref> a@90@01 y@92@01))
    (= (loc<Ref> a@90@01 x@91@01) (loc<Ref> a@90@01 x@91@01)))
  (not
    (=
      ($FVF.lookup_val (as sm@118@01  $FVF<val>) (loc<Ref> a@90@01 y@92@01))
      ($FVF.lookup_val (as sm@114@01  $FVF<val>) (loc<Ref> a@90@01 x@91@01)))))))
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
    (= (loc<Ref> a@90@01 x@91@01) (loc<Ref> a@90@01 x@91@01))
    (= (loc<Ref> a@90@01 y@92@01) (loc<Ref> a@90@01 y@92@01)))
  (not
    (=
      ($FVF.lookup_val (as sm@114@01  $FVF<val>) (loc<Ref> a@90@01 x@91@01))
      ($FVF.lookup_val (as sm@118@01  $FVF<val>) (loc<Ref> a@90@01 y@92@01)))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and
  (not (= (loc<Ref> a@90@01 y@92@01) (loc<Ref> a@90@01 x@91@01)))
  (not (= (loc<Ref> a@90@01 x@91@01) (loc<Ref> a@90@01 y@92@01)))))
(declare-const sm@148@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@90@01 y@92@01))
    (=
      ($FVF.lookup_val (as sm@148@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@118@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@148@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@118@01  $FVF<val>) r))
  :qid |qp.fvfValDef116|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@90@01 x@91@01))
    (=
      ($FVF.lookup_val (as sm@148@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@114@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@148@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@114@01  $FVF<val>) r))
  :qid |qp.fvfValDef117|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@98@01 r)
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@97@01 r)))
      (< $Perm.No (- (- $Perm.Write (pTaken@113@01 r)) (pTaken@116@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@148@01  $FVF<val>) r)
      ($FVF.lookup_val $t@96@01 r)))
  :pattern (($FVF.lookup_val (as sm@148@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val $t@96@01 r))
  :qid |qp.fvfValDef118|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@118@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@114@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val $t@96@01 r) r))
  :pattern (($FVF.lookup_val (as sm@148@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef119|)))
(declare-const pm@149@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@149@01  $FPM) r)
    (+
      (+
        (ite (= r (loc<Ref> a@90@01 y@92@01)) $Perm.Write $Perm.No)
        (ite (= r (loc<Ref> a@90@01 x@91@01)) $Perm.Write $Perm.No))
      (ite
        (and
          (img@98@01 r)
          (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@97@01 r)))
        (- (- $Perm.Write (pTaken@113@01 r)) (pTaken@116@01 r))
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@149@01  $FPM) r))
  :qid |qp.resPrmSumDef120|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@148@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@118@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@114@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val $t@96@01 r) r))
  :pattern (($FVF.perm_val (as pm@149@01  $FPM) r))
  :qid |qp.resTrgDef121|)))
; Assume upper permission bound for field val
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_val (as pm@149@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_val ($FVF.lookup_val (as sm@148@01  $FVF<val>) r) r))
  :qid |qp-fld-prm-bnd|)))
; [eval] elements(a) == old[pre](elements(a))
; [eval] elements(a)
(set-option :timeout 0)
(push) ; 3
(declare-const i@150@01 Int)
(push) ; 4
; [eval] (i in [0..length(this)))
; [eval] [0..length(this))
; [eval] length(this)
(assert (Seq_contains (Seq_range 0 (length<Int> a@90@01)) i@150@01))
; [eval] loc(this, i)
(pop) ; 4
(declare-fun inv@151@01 ($Ref) Int)
(declare-fun img@152@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@150@01 Int) (i2@150@01 Int)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) i1@150@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@148@01  $FVF<val>) (loc<Ref> a@90@01 i1@150@01)) (loc<Ref> a@90@01 i1@150@01)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) i2@150@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@148@01  $FVF<val>) (loc<Ref> a@90@01 i2@150@01)) (loc<Ref> a@90@01 i2@150@01)))
      (= (loc<Ref> a@90@01 i1@150@01) (loc<Ref> a@90@01 i2@150@01)))
    (= i1@150@01 i2@150@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@150@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@90@01)) i@150@01)
    (and
      (= (inv@151@01 (loc<Ref> a@90@01 i@150@01)) i@150@01)
      (img@152@01 (loc<Ref> a@90@01 i@150@01))))
  :pattern ((loc<Ref> a@90@01 i@150@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@152@01 r)
      (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@151@01 r)))
    (= (loc<Ref> a@90@01 (inv@151@01 r)) r))
  :pattern ((inv@151@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@151@01 r))
    ($FVF.loc_val ($FVF.lookup_val (as sm@148@01  $FVF<val>) r) r))
  :pattern ((inv@151@01 r))
  :qid |quant-u-124|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@153@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@151@01 r))
      (img@152@01 r)
      (= r (loc<Ref> a@90@01 (inv@151@01 r))))
    ($Perm.min
      (ite
        (and
          (img@98@01 r)
          (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@97@01 r)))
        (- (- $Perm.Write (pTaken@113@01 r)) (pTaken@116@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@154@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@151@01 r))
      (img@152@01 r)
      (= r (loc<Ref> a@90@01 (inv@151@01 r))))
    ($Perm.min
      (ite (= r (loc<Ref> a@90@01 y@92@01)) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@153@01 r)))
    $Perm.No))
(define-fun pTaken@155@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@151@01 r))
      (img@152@01 r)
      (= r (loc<Ref> a@90@01 (inv@151@01 r))))
    ($Perm.min
      (ite (= r (loc<Ref> a@90@01 x@91@01)) $Perm.Write $Perm.No)
      (- (- $Perm.Write (pTaken@153@01 r)) (pTaken@154@01 r)))
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
          (img@98@01 r)
          (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@97@01 r)))
        (- (- $Perm.Write (pTaken@113@01 r)) (pTaken@116@01 r))
        $Perm.No)
      (pTaken@153@01 r))
    $Perm.No)
  
  :qid |quant-u-126|))))
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
      (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@151@01 r))
      (img@152@01 r)
      (= r (loc<Ref> a@90@01 (inv@151@01 r))))
    (= (- $Perm.Write (pTaken@153@01 r)) $Perm.No))
  
  :qid |quant-u-127|))))
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
    (ite
      (= (loc<Ref> a@90@01 y@92@01) (loc<Ref> a@90@01 y@92@01))
      $Perm.Write
      $Perm.No)
    (pTaken@154@01 (loc<Ref> a@90@01 y@92@01)))
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
      (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@151@01 r))
      (img@152@01 r)
      (= r (loc<Ref> a@90@01 (inv@151@01 r))))
    (= (- (- $Perm.Write (pTaken@153@01 r)) (pTaken@154@01 r)) $Perm.No))
  
  :qid |quant-u-129|))))
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
    (ite
      (= (loc<Ref> a@90@01 x@91@01) (loc<Ref> a@90@01 x@91@01))
      $Perm.Write
      $Perm.No)
    (pTaken@155@01 (loc<Ref> a@90@01 x@91@01)))
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
      (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@151@01 r))
      (img@152@01 r)
      (= r (loc<Ref> a@90@01 (inv@151@01 r))))
    (=
      (-
        (- (- $Perm.Write (pTaken@153@01 r)) (pTaken@154@01 r))
        (pTaken@155@01 r))
      $Perm.No))
  
  :qid |quant-u-131|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@156@01 $FVF<val>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@156@01  $FVF<val>)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@151@01 r))
        (img@152@01 r)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@151@01 r))
        (img@152@01 r))
      (Set_in r ($FVF.domain_val (as sm@156@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@156@01  $FVF<val>))))
  :qid |qp.fvfDomDef126|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@151@01 r))
        (img@152@01 r))
      (= r (loc<Ref> a@90@01 y@92@01)))
    (=
      ($FVF.lookup_val (as sm@156@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@118@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@156@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@118@01  $FVF<val>) r))
  :qid |qp.fvfValDef122|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@151@01 r))
        (img@152@01 r))
      (= r (loc<Ref> a@90@01 x@91@01)))
    (=
      ($FVF.lookup_val (as sm@156@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@114@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@156@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@114@01  $FVF<val>) r))
  :qid |qp.fvfValDef123|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@151@01 r))
        (img@152@01 r))
      (ite
        (and
          (img@98@01 r)
          (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@97@01 r)))
        (< $Perm.No (- (- $Perm.Write (pTaken@113@01 r)) (pTaken@116@01 r)))
        false))
    (=
      ($FVF.lookup_val (as sm@156@01  $FVF<val>) r)
      ($FVF.lookup_val $t@96@01 r)))
  :pattern (($FVF.lookup_val (as sm@156@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val $t@96@01 r))
  :qid |qp.fvfValDef124|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@118@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@114@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val $t@96@01 r) r))
  :pattern (($FVF.lookup_val (as sm@156@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef125|)))
(assert (elements%precondition ($SortWrappers.$FVF<val>To$Snap (as sm@156@01  $FVF<val>)) a@90@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((i@150@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@90@01)) i@150@01)
    (and
      (= (inv@151@01 (loc<Ref> a@90@01 i@150@01)) i@150@01)
      (img@152@01 (loc<Ref> a@90@01 i@150@01))))
  :pattern ((loc<Ref> a@90@01 i@150@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@152@01 r)
      (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@151@01 r)))
    (= (loc<Ref> a@90@01 (inv@151@01 r)) r))
  :pattern ((inv@151@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@156@01  $FVF<val>)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@151@01 r))
        (img@152@01 r)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@151@01 r))
        (img@152@01 r))
      (Set_in r ($FVF.domain_val (as sm@156@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@156@01  $FVF<val>))))
  :qid |qp.fvfDomDef126|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@151@01 r))
        (img@152@01 r))
      (= r (loc<Ref> a@90@01 y@92@01)))
    (=
      ($FVF.lookup_val (as sm@156@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@118@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@156@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@118@01  $FVF<val>) r))
  :qid |qp.fvfValDef122|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@151@01 r))
        (img@152@01 r))
      (= r (loc<Ref> a@90@01 x@91@01)))
    (=
      ($FVF.lookup_val (as sm@156@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@114@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@156@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@114@01  $FVF<val>) r))
  :qid |qp.fvfValDef123|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@151@01 r))
        (img@152@01 r))
      (ite
        (and
          (img@98@01 r)
          (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@97@01 r)))
        (< $Perm.No (- (- $Perm.Write (pTaken@113@01 r)) (pTaken@116@01 r)))
        false))
    (=
      ($FVF.lookup_val (as sm@156@01  $FVF<val>) r)
      ($FVF.lookup_val $t@96@01 r)))
  :pattern (($FVF.lookup_val (as sm@156@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val $t@96@01 r))
  :qid |qp.fvfValDef124|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@118@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@114@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val $t@96@01 r) r))
  :pattern (($FVF.lookup_val (as sm@156@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef125|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@151@01 r))
      ($FVF.loc_val ($FVF.lookup_val (as sm@148@01  $FVF<val>) r) r))
    :pattern ((inv@151@01 r))
    :qid |quant-u-124|))
  (elements%precondition ($SortWrappers.$FVF<val>To$Snap (as sm@156@01  $FVF<val>)) a@90@01)))
; [eval] old[pre](elements(a))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
(declare-const pm@157@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@157@01  $FPM) r)
    (ite
      (and
        (img@98@01 r)
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@97@01 r)))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_val (as pm@157@01  $FPM) r))
  :qid |qp.resPrmSumDef127|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@112@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val $t@96@01 r) r))
  :pattern (($FVF.perm_val (as pm@157@01  $FPM) r))
  :qid |qp.resTrgDef128|)))
; Assume upper permission bound for field val
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_val (as pm@157@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_val ($FVF.lookup_val (as sm@112@01  $FVF<val>) r) r))
  :qid |qp-fld-prm-bnd|)))
; [eval] elements(a)
(set-option :timeout 0)
(push) ; 3
(declare-const i@158@01 Int)
(push) ; 4
; [eval] (i in [0..length(this)))
; [eval] [0..length(this))
; [eval] length(this)
(assert (Seq_contains (Seq_range 0 (length<Int> a@90@01)) i@158@01))
; [eval] loc(this, i)
(pop) ; 4
(declare-fun inv@159@01 ($Ref) Int)
(declare-fun img@160@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@158@01 Int) (i2@158@01 Int)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) i1@158@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@112@01  $FVF<val>) (loc<Ref> a@90@01 i1@158@01)) (loc<Ref> a@90@01 i1@158@01)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) i2@158@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@112@01  $FVF<val>) (loc<Ref> a@90@01 i2@158@01)) (loc<Ref> a@90@01 i2@158@01)))
      (= (loc<Ref> a@90@01 i1@158@01) (loc<Ref> a@90@01 i2@158@01)))
    (= i1@158@01 i2@158@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@158@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@90@01)) i@158@01)
    (and
      (= (inv@159@01 (loc<Ref> a@90@01 i@158@01)) i@158@01)
      (img@160@01 (loc<Ref> a@90@01 i@158@01))))
  :pattern ((loc<Ref> a@90@01 i@158@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@160@01 r)
      (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@159@01 r)))
    (= (loc<Ref> a@90@01 (inv@159@01 r)) r))
  :pattern ((inv@159@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@159@01 r))
    ($FVF.loc_val ($FVF.lookup_val (as sm@112@01  $FVF<val>) r) r))
  :pattern ((inv@159@01 r))
  :qid |quant-u-133|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@161@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@159@01 r))
      (img@160@01 r)
      (= r (loc<Ref> a@90@01 (inv@159@01 r))))
    ($Perm.min
      (ite
        (and
          (img@98@01 r)
          (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@97@01 r)))
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
        (and
          (img@98@01 r)
          (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@97@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@161@01 r))
    $Perm.No)
  
  :qid |quant-u-135|))))
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
      (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@159@01 r))
      (img@160@01 r)
      (= r (loc<Ref> a@90@01 (inv@159@01 r))))
    (= (- $Perm.Write (pTaken@161@01 r)) $Perm.No))
  
  :qid |quant-u-136|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@162@01 $FVF<val>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@162@01  $FVF<val>)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@159@01 r))
        (img@160@01 r)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@159@01 r))
        (img@160@01 r))
      (Set_in r ($FVF.domain_val (as sm@162@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@162@01  $FVF<val>))))
  :qid |qp.fvfDomDef131|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@159@01 r))
        (img@160@01 r))
      (and
        (img@98@01 r)
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@97@01 r))))
    (=
      ($FVF.lookup_val (as sm@162@01  $FVF<val>) r)
      ($FVF.lookup_val $t@96@01 r)))
  :pattern (($FVF.lookup_val (as sm@162@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val $t@96@01 r))
  :qid |qp.fvfValDef129|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val $t@96@01 r) r)
  :pattern (($FVF.lookup_val (as sm@162@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef130|)))
(assert (elements%precondition ($SortWrappers.$FVF<val>To$Snap (as sm@162@01  $FVF<val>)) a@90@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((i@158@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@90@01)) i@158@01)
    (and
      (= (inv@159@01 (loc<Ref> a@90@01 i@158@01)) i@158@01)
      (img@160@01 (loc<Ref> a@90@01 i@158@01))))
  :pattern ((loc<Ref> a@90@01 i@158@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@160@01 r)
      (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@159@01 r)))
    (= (loc<Ref> a@90@01 (inv@159@01 r)) r))
  :pattern ((inv@159@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@162@01  $FVF<val>)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@159@01 r))
        (img@160@01 r)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@159@01 r))
        (img@160@01 r))
      (Set_in r ($FVF.domain_val (as sm@162@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@162@01  $FVF<val>))))
  :qid |qp.fvfDomDef131|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@159@01 r))
        (img@160@01 r))
      (and
        (img@98@01 r)
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@97@01 r))))
    (=
      ($FVF.lookup_val (as sm@162@01  $FVF<val>) r)
      ($FVF.lookup_val $t@96@01 r)))
  :pattern (($FVF.lookup_val (as sm@162@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val $t@96@01 r))
  :qid |qp.fvfValDef129|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val $t@96@01 r) r)
  :pattern (($FVF.lookup_val (as sm@162@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef130|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@159@01 r))
      ($FVF.loc_val ($FVF.lookup_val (as sm@112@01  $FVF<val>) r) r))
    :pattern ((inv@159@01 r))
    :qid |quant-u-133|))
  (elements%precondition ($SortWrappers.$FVF<val>To$Snap (as sm@162@01  $FVF<val>)) a@90@01)))
(set-option :timeout 0)
(push) ; 3
(assert (not (Set_equal (elements ($SortWrappers.$FVF<val>To$Snap (as sm@156@01  $FVF<val>)) a@90@01) (elements ($SortWrappers.$FVF<val>To$Snap (as sm@162@01  $FVF<val>)) a@90@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,01s
; (get-info :all-statistics)
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (loc<Ref> a@90@01 y@92@01) (loc<Ref> a@90@01 x@91@01))))
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
      (= (loc<Ref> a@90@01 y@92@01) (loc<Ref> a@90@01 y@92@01))
      $Perm.Write
      $Perm.No)
    (ite
      (= (loc<Ref> a@90@01 x@91@01) (loc<Ref> a@90@01 x@91@01))
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
      (= (loc<Ref> a@90@01 x@91@01) (loc<Ref> a@90@01 x@91@01))
      $Perm.Write
      $Perm.No)
    (ite
      (= (loc<Ref> a@90@01 y@92@01) (loc<Ref> a@90@01 y@92@01))
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
    (= (loc<Ref> a@90@01 y@92@01) (loc<Ref> a@90@01 y@92@01))
    (= (loc<Ref> a@90@01 x@91@01) (loc<Ref> a@90@01 x@91@01)))
  (not
    (=
      ($FVF.lookup_val (as sm@118@01  $FVF<val>) (loc<Ref> a@90@01 y@92@01))
      ($FVF.lookup_val (as sm@114@01  $FVF<val>) (loc<Ref> a@90@01 x@91@01)))))))
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
    (= (loc<Ref> a@90@01 x@91@01) (loc<Ref> a@90@01 x@91@01))
    (= (loc<Ref> a@90@01 y@92@01) (loc<Ref> a@90@01 y@92@01)))
  (not
    (=
      ($FVF.lookup_val (as sm@114@01  $FVF<val>) (loc<Ref> a@90@01 x@91@01))
      ($FVF.lookup_val (as sm@118@01  $FVF<val>) (loc<Ref> a@90@01 y@92@01)))))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (and
  (not (= (loc<Ref> a@90@01 y@92@01) (loc<Ref> a@90@01 x@91@01)))
  (not (= (loc<Ref> a@90@01 x@91@01) (loc<Ref> a@90@01 y@92@01)))))
; Definitional axioms for snapshot map values
; Assume upper permission bound for field val
; [eval] elements(a) == old[pre](elements(a))
; [eval] elements(a)
(set-option :timeout 0)
(push) ; 3
(declare-const i@163@01 Int)
(push) ; 4
; [eval] (i in [0..length(this)))
; [eval] [0..length(this))
; [eval] length(this)
(assert (Seq_contains (Seq_range 0 (length<Int> a@90@01)) i@163@01))
; [eval] loc(this, i)
(pop) ; 4
(declare-fun inv@164@01 ($Ref) Int)
(declare-fun img@165@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-const sm@166@01 $FVF<val>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@98@01 r)
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@97@01 r)))
      (< $Perm.No (- (- $Perm.Write (pTaken@113@01 r)) (pTaken@116@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@166@01  $FVF<val>) r)
      ($FVF.lookup_val $t@96@01 r)))
  :pattern (($FVF.lookup_val (as sm@166@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val $t@96@01 r))
  :qid |qp.fvfValDef132|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@90@01 x@91@01))
    (=
      ($FVF.lookup_val (as sm@166@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@114@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@166@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@114@01  $FVF<val>) r))
  :qid |qp.fvfValDef133|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@90@01 y@92@01))
    (=
      ($FVF.lookup_val (as sm@166@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@118@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@166@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@118@01  $FVF<val>) r))
  :qid |qp.fvfValDef134|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val $t@96@01 r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@114@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@118@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@166@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef135|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@163@01 Int) (i2@163@01 Int)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) i1@163@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@166@01  $FVF<val>) (loc<Ref> a@90@01 i1@163@01)) (loc<Ref> a@90@01 i1@163@01)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) i2@163@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@166@01  $FVF<val>) (loc<Ref> a@90@01 i2@163@01)) (loc<Ref> a@90@01 i2@163@01)))
      (= (loc<Ref> a@90@01 i1@163@01) (loc<Ref> a@90@01 i2@163@01)))
    (= i1@163@01 i2@163@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@163@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@90@01)) i@163@01)
    (and
      (= (inv@164@01 (loc<Ref> a@90@01 i@163@01)) i@163@01)
      (img@165@01 (loc<Ref> a@90@01 i@163@01))))
  :pattern ((loc<Ref> a@90@01 i@163@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@165@01 r)
      (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@164@01 r)))
    (= (loc<Ref> a@90@01 (inv@164@01 r)) r))
  :pattern ((inv@164@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@164@01 r))
    ($FVF.loc_val ($FVF.lookup_val (as sm@166@01  $FVF<val>) r) r))
  :pattern ((inv@164@01 r))
  :qid |quant-u-138|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@167@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@164@01 r))
      (img@165@01 r)
      (= r (loc<Ref> a@90@01 (inv@164@01 r))))
    ($Perm.min
      (ite
        (and
          (img@98@01 r)
          (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@97@01 r)))
        (- (- $Perm.Write (pTaken@113@01 r)) (pTaken@116@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@168@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@164@01 r))
      (img@165@01 r)
      (= r (loc<Ref> a@90@01 (inv@164@01 r))))
    ($Perm.min
      (ite (= r (loc<Ref> a@90@01 x@91@01)) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@167@01 r)))
    $Perm.No))
(define-fun pTaken@169@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@164@01 r))
      (img@165@01 r)
      (= r (loc<Ref> a@90@01 (inv@164@01 r))))
    ($Perm.min
      (ite (= r (loc<Ref> a@90@01 y@92@01)) $Perm.Write $Perm.No)
      (- (- $Perm.Write (pTaken@167@01 r)) (pTaken@168@01 r)))
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
          (img@98@01 r)
          (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@97@01 r)))
        (- (- $Perm.Write (pTaken@113@01 r)) (pTaken@116@01 r))
        $Perm.No)
      (pTaken@167@01 r))
    $Perm.No)
  
  :qid |quant-u-140|))))
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
      (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@164@01 r))
      (img@165@01 r)
      (= r (loc<Ref> a@90@01 (inv@164@01 r))))
    (= (- $Perm.Write (pTaken@167@01 r)) $Perm.No))
  
  :qid |quant-u-141|))))
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
    (ite
      (= (loc<Ref> a@90@01 x@91@01) (loc<Ref> a@90@01 x@91@01))
      $Perm.Write
      $Perm.No)
    (pTaken@168@01 (loc<Ref> a@90@01 x@91@01)))
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
      (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@164@01 r))
      (img@165@01 r)
      (= r (loc<Ref> a@90@01 (inv@164@01 r))))
    (= (- (- $Perm.Write (pTaken@167@01 r)) (pTaken@168@01 r)) $Perm.No))
  
  :qid |quant-u-143|))))
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
    (ite
      (= (loc<Ref> a@90@01 y@92@01) (loc<Ref> a@90@01 y@92@01))
      $Perm.Write
      $Perm.No)
    (pTaken@169@01 (loc<Ref> a@90@01 y@92@01)))
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
      (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@164@01 r))
      (img@165@01 r)
      (= r (loc<Ref> a@90@01 (inv@164@01 r))))
    (=
      (-
        (- (- $Perm.Write (pTaken@167@01 r)) (pTaken@168@01 r))
        (pTaken@169@01 r))
      $Perm.No))
  
  :qid |quant-u-145|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@170@01 $FVF<val>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@170@01  $FVF<val>)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@164@01 r))
        (img@165@01 r)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@164@01 r))
        (img@165@01 r))
      (Set_in r ($FVF.domain_val (as sm@170@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@170@01  $FVF<val>))))
  :qid |qp.fvfDomDef140|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@164@01 r))
        (img@165@01 r))
      (ite
        (and
          (img@98@01 r)
          (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@97@01 r)))
        (< $Perm.No (- (- $Perm.Write (pTaken@113@01 r)) (pTaken@116@01 r)))
        false))
    (=
      ($FVF.lookup_val (as sm@170@01  $FVF<val>) r)
      ($FVF.lookup_val $t@96@01 r)))
  :pattern (($FVF.lookup_val (as sm@170@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val $t@96@01 r))
  :qid |qp.fvfValDef136|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@164@01 r))
        (img@165@01 r))
      (= r (loc<Ref> a@90@01 x@91@01)))
    (=
      ($FVF.lookup_val (as sm@170@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@114@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@170@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@114@01  $FVF<val>) r))
  :qid |qp.fvfValDef137|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@164@01 r))
        (img@165@01 r))
      (= r (loc<Ref> a@90@01 y@92@01)))
    (=
      ($FVF.lookup_val (as sm@170@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@118@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@170@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@118@01  $FVF<val>) r))
  :qid |qp.fvfValDef138|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val $t@96@01 r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@114@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@118@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@170@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef139|)))
(assert (elements%precondition ($SortWrappers.$FVF<val>To$Snap (as sm@170@01  $FVF<val>)) a@90@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@98@01 r)
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@97@01 r)))
      (< $Perm.No (- (- $Perm.Write (pTaken@113@01 r)) (pTaken@116@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@166@01  $FVF<val>) r)
      ($FVF.lookup_val $t@96@01 r)))
  :pattern (($FVF.lookup_val (as sm@166@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val $t@96@01 r))
  :qid |qp.fvfValDef132|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@90@01 x@91@01))
    (=
      ($FVF.lookup_val (as sm@166@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@114@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@166@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@114@01  $FVF<val>) r))
  :qid |qp.fvfValDef133|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@90@01 y@92@01))
    (=
      ($FVF.lookup_val (as sm@166@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@118@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@166@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@118@01  $FVF<val>) r))
  :qid |qp.fvfValDef134|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val $t@96@01 r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@114@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@118@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@166@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef135|)))
(assert (forall ((i@163@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@90@01)) i@163@01)
    (and
      (= (inv@164@01 (loc<Ref> a@90@01 i@163@01)) i@163@01)
      (img@165@01 (loc<Ref> a@90@01 i@163@01))))
  :pattern ((loc<Ref> a@90@01 i@163@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@165@01 r)
      (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@164@01 r)))
    (= (loc<Ref> a@90@01 (inv@164@01 r)) r))
  :pattern ((inv@164@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@170@01  $FVF<val>)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@164@01 r))
        (img@165@01 r)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@164@01 r))
        (img@165@01 r))
      (Set_in r ($FVF.domain_val (as sm@170@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@170@01  $FVF<val>))))
  :qid |qp.fvfDomDef140|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@164@01 r))
        (img@165@01 r))
      (ite
        (and
          (img@98@01 r)
          (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@97@01 r)))
        (< $Perm.No (- (- $Perm.Write (pTaken@113@01 r)) (pTaken@116@01 r)))
        false))
    (=
      ($FVF.lookup_val (as sm@170@01  $FVF<val>) r)
      ($FVF.lookup_val $t@96@01 r)))
  :pattern (($FVF.lookup_val (as sm@170@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val $t@96@01 r))
  :qid |qp.fvfValDef136|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@164@01 r))
        (img@165@01 r))
      (= r (loc<Ref> a@90@01 x@91@01)))
    (=
      ($FVF.lookup_val (as sm@170@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@114@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@170@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@114@01  $FVF<val>) r))
  :qid |qp.fvfValDef137|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@164@01 r))
        (img@165@01 r))
      (= r (loc<Ref> a@90@01 y@92@01)))
    (=
      ($FVF.lookup_val (as sm@170@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@118@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@170@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@118@01  $FVF<val>) r))
  :qid |qp.fvfValDef138|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val $t@96@01 r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@114@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@118@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@170@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef139|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@164@01 r))
      ($FVF.loc_val ($FVF.lookup_val (as sm@166@01  $FVF<val>) r) r))
    :pattern ((inv@164@01 r))
    :qid |quant-u-138|))
  (elements%precondition ($SortWrappers.$FVF<val>To$Snap (as sm@170@01  $FVF<val>)) a@90@01)))
; [eval] old[pre](elements(a))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
(declare-const pm@171@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@171@01  $FPM) r)
    (ite
      (and
        (img@98@01 r)
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@97@01 r)))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_val (as pm@171@01  $FPM) r))
  :qid |qp.resPrmSumDef141|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@112@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val $t@96@01 r) r))
  :pattern (($FVF.perm_val (as pm@171@01  $FPM) r))
  :qid |qp.resTrgDef142|)))
; Assume upper permission bound for field val
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_val (as pm@171@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_val ($FVF.lookup_val (as sm@112@01  $FVF<val>) r) r))
  :qid |qp-fld-prm-bnd|)))
; [eval] elements(a)
(set-option :timeout 0)
(push) ; 3
(declare-const i@172@01 Int)
(push) ; 4
; [eval] (i in [0..length(this)))
; [eval] [0..length(this))
; [eval] length(this)
(assert (Seq_contains (Seq_range 0 (length<Int> a@90@01)) i@172@01))
; [eval] loc(this, i)
(pop) ; 4
(declare-fun inv@173@01 ($Ref) Int)
(declare-fun img@174@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@172@01 Int) (i2@172@01 Int)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) i1@172@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@112@01  $FVF<val>) (loc<Ref> a@90@01 i1@172@01)) (loc<Ref> a@90@01 i1@172@01)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) i2@172@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@112@01  $FVF<val>) (loc<Ref> a@90@01 i2@172@01)) (loc<Ref> a@90@01 i2@172@01)))
      (= (loc<Ref> a@90@01 i1@172@01) (loc<Ref> a@90@01 i2@172@01)))
    (= i1@172@01 i2@172@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@172@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@90@01)) i@172@01)
    (and
      (= (inv@173@01 (loc<Ref> a@90@01 i@172@01)) i@172@01)
      (img@174@01 (loc<Ref> a@90@01 i@172@01))))
  :pattern ((loc<Ref> a@90@01 i@172@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@174@01 r)
      (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@173@01 r)))
    (= (loc<Ref> a@90@01 (inv@173@01 r)) r))
  :pattern ((inv@173@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@173@01 r))
    ($FVF.loc_val ($FVF.lookup_val (as sm@112@01  $FVF<val>) r) r))
  :pattern ((inv@173@01 r))
  :qid |quant-u-147|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@175@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@173@01 r))
      (img@174@01 r)
      (= r (loc<Ref> a@90@01 (inv@173@01 r))))
    ($Perm.min
      (ite
        (and
          (img@98@01 r)
          (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@97@01 r)))
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
        (and
          (img@98@01 r)
          (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@97@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@175@01 r))
    $Perm.No)
  
  :qid |quant-u-149|))))
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
      (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@173@01 r))
      (img@174@01 r)
      (= r (loc<Ref> a@90@01 (inv@173@01 r))))
    (= (- $Perm.Write (pTaken@175@01 r)) $Perm.No))
  
  :qid |quant-u-150|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@176@01 $FVF<val>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@176@01  $FVF<val>)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@173@01 r))
        (img@174@01 r)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@173@01 r))
        (img@174@01 r))
      (Set_in r ($FVF.domain_val (as sm@176@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@176@01  $FVF<val>))))
  :qid |qp.fvfDomDef145|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@173@01 r))
        (img@174@01 r))
      (and
        (img@98@01 r)
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@97@01 r))))
    (=
      ($FVF.lookup_val (as sm@176@01  $FVF<val>) r)
      ($FVF.lookup_val $t@96@01 r)))
  :pattern (($FVF.lookup_val (as sm@176@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val $t@96@01 r))
  :qid |qp.fvfValDef143|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val $t@96@01 r) r)
  :pattern (($FVF.lookup_val (as sm@176@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef144|)))
(assert (elements%precondition ($SortWrappers.$FVF<val>To$Snap (as sm@176@01  $FVF<val>)) a@90@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((i@172@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@90@01)) i@172@01)
    (and
      (= (inv@173@01 (loc<Ref> a@90@01 i@172@01)) i@172@01)
      (img@174@01 (loc<Ref> a@90@01 i@172@01))))
  :pattern ((loc<Ref> a@90@01 i@172@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@174@01 r)
      (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@173@01 r)))
    (= (loc<Ref> a@90@01 (inv@173@01 r)) r))
  :pattern ((inv@173@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@176@01  $FVF<val>)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@173@01 r))
        (img@174@01 r)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@173@01 r))
        (img@174@01 r))
      (Set_in r ($FVF.domain_val (as sm@176@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@176@01  $FVF<val>))))
  :qid |qp.fvfDomDef145|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@173@01 r))
        (img@174@01 r))
      (and
        (img@98@01 r)
        (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@97@01 r))))
    (=
      ($FVF.lookup_val (as sm@176@01  $FVF<val>) r)
      ($FVF.lookup_val $t@96@01 r)))
  :pattern (($FVF.lookup_val (as sm@176@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val $t@96@01 r))
  :qid |qp.fvfValDef143|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val $t@96@01 r) r)
  :pattern (($FVF.lookup_val (as sm@176@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef144|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Seq_contains (Seq_range 0 (length<Int> a@90@01)) (inv@173@01 r))
      ($FVF.loc_val ($FVF.lookup_val (as sm@112@01  $FVF<val>) r) r))
    :pattern ((inv@173@01 r))
    :qid |quant-u-147|))
  (elements%precondition ($SortWrappers.$FVF<val>To$Snap (as sm@176@01  $FVF<val>)) a@90@01)))
(set-option :timeout 0)
(push) ; 3
(assert (not (Set_equal (elements ($SortWrappers.$FVF<val>To$Snap (as sm@170@01  $FVF<val>)) a@90@01) (elements ($SortWrappers.$FVF<val>To$Snap (as sm@176@01  $FVF<val>)) a@90@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
