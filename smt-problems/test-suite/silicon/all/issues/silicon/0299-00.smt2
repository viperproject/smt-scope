(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:54:35
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silicon/0299.vpr
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
(declare-fun len<Int> (Array_) Int)
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
(declare-fun dummy ($Snap Int) Bool)
(declare-fun dummy%limited ($Snap Int) Bool)
(declare-fun dummy%stateless (Int) Bool)
(declare-fun dummy%precondition ($Snap Int) Bool)
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
  :qid |prog.all_diff|)))
(assert (forall ((a Array_)) (!
  (>= (len<Int> a) 0)
  :pattern ((len<Int> a))
  :qid |prog.length_nonneg|)))
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
(assert (forall ((s@$ $Snap) (x@0@00 Int)) (!
  (= (dummy%limited s@$ x@0@00) (dummy s@$ x@0@00))
  :pattern ((dummy s@$ x@0@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (x@0@00 Int)) (!
  (dummy%stateless x@0@00)
  :pattern ((dummy%limited s@$ x@0@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (x@0@00 Int)) (!
  (=> (dummy%precondition s@$ x@0@00) (= (dummy s@$ x@0@00) true))
  :pattern ((dummy s@$ x@0@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (x@0@00 Int)) (!
  true
  :pattern ((dummy s@$ x@0@00))
  :qid |quant-u-3|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- quicksort_rec ----------
(declare-const a@0@01 Array_)
(declare-const lo@1@01 Int)
(declare-const hi@2@01 Int)
(declare-const permutation@3@01 Seq<Int>)
(declare-const a@4@01 Array_)
(declare-const lo@5@01 Int)
(declare-const hi@6@01 Int)
(declare-const permutation@7@01 Seq<Int>)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@8@01 $Snap)
(assert (= $t@8@01 ($Snap.combine ($Snap.first $t@8@01) ($Snap.second $t@8@01))))
(assert (= ($Snap.first $t@8@01) $Snap.unit))
; [eval] lo >= 0
(assert (>= lo@5@01 0))
(declare-const i@9@01 Int)
(push) ; 2
; [eval] lo <= i && i <= hi
; [eval] lo <= i
(push) ; 3
; [then-branch: 0 | !(lo@5@01 <= i@9@01) | live]
; [else-branch: 0 | lo@5@01 <= i@9@01 | live]
(push) ; 4
; [then-branch: 0 | !(lo@5@01 <= i@9@01)]
(assert (not (<= lo@5@01 i@9@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | lo@5@01 <= i@9@01]
(assert (<= lo@5@01 i@9@01))
; [eval] i <= hi
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= lo@5@01 i@9@01) (not (<= lo@5@01 i@9@01))))
(assert (and (<= lo@5@01 i@9@01) (<= i@9@01 hi@6@01)))
; [eval] loc(a, i)
(declare-const sm@10@01 $FVF<val>)
; Definitional axioms for snapshot map values
; [eval] loc(a, i)
(pop) ; 2
(declare-fun inv@11@01 ($Ref) Int)
(declare-fun img@12@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@9@01 Int)) (!
  (=>
    (and (<= lo@5@01 i@9@01) (<= i@9@01 hi@6@01))
    (or (<= lo@5@01 i@9@01) (not (<= lo@5@01 i@9@01))))
  :pattern (($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@8@01)) (loc<Ref> a@4@01 i@9@01)) (loc<Ref> a@4@01 i@9@01)))
  :qid |val-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@9@01 Int) (i2@9@01 Int)) (!
  (=>
    (and
      (and (<= lo@5@01 i1@9@01) (<= i1@9@01 hi@6@01))
      (and (<= lo@5@01 i2@9@01) (<= i2@9@01 hi@6@01))
      (= (loc<Ref> a@4@01 i1@9@01) (loc<Ref> a@4@01 i2@9@01)))
    (= i1@9@01 i2@9@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@9@01 Int)) (!
  (=>
    (and (<= lo@5@01 i@9@01) (<= i@9@01 hi@6@01))
    (and
      (= (inv@11@01 (loc<Ref> a@4@01 i@9@01)) i@9@01)
      (img@12@01 (loc<Ref> a@4@01 i@9@01))))
  :pattern (($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@8@01)) (loc<Ref> a@4@01 i@9@01)) (loc<Ref> a@4@01 i@9@01)))
  :qid |quant-u-5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@12@01 r)
      (and (<= lo@5@01 (inv@11@01 r)) (<= (inv@11@01 r) hi@6@01)))
    (= (loc<Ref> a@4@01 (inv@11@01 r)) r))
  :pattern ((inv@11@01 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@9@01 Int)) (!
  (=>
    (and (<= lo@5@01 i@9@01) (<= i@9@01 hi@6@01))
    (not (= (loc<Ref> a@4@01 i@9@01) $Ref.null)))
  :pattern (($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@8@01)) (loc<Ref> a@4@01 i@9@01)) (loc<Ref> a@4@01 i@9@01)))
  :qid |val-permImpliesNonNull|)))
(declare-const sm@13@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@12@01 r)
      (and (<= lo@5@01 (inv@11@01 r)) (<= (inv@11@01 r) hi@6@01)))
    (=
      ($FVF.lookup_val (as sm@13@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@8@01)) r)))
  :pattern (($FVF.lookup_val (as sm@13@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@8@01)) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@8@01)) r) r)
  :pattern (($FVF.lookup_val (as sm@13@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (<= lo@5@01 (inv@11@01 r)) (<= (inv@11@01 r) hi@6@01))
    ($FVF.loc_val ($FVF.lookup_val (as sm@13@01  $FVF<val>) r) r))
  :pattern ((inv@11@01 r))
  :qid |quant-u-6|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@14@01 $Snap)
(assert (= $t@14@01 ($Snap.combine ($Snap.first $t@14@01) ($Snap.second $t@14@01))))
(declare-const i@15@01 Int)
(push) ; 3
; [eval] lo <= i && i <= hi
; [eval] lo <= i
(push) ; 4
; [then-branch: 1 | !(lo@5@01 <= i@15@01) | live]
; [else-branch: 1 | lo@5@01 <= i@15@01 | live]
(push) ; 5
; [then-branch: 1 | !(lo@5@01 <= i@15@01)]
(assert (not (<= lo@5@01 i@15@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 1 | lo@5@01 <= i@15@01]
(assert (<= lo@5@01 i@15@01))
; [eval] i <= hi
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= lo@5@01 i@15@01) (not (<= lo@5@01 i@15@01))))
(assert (and (<= lo@5@01 i@15@01) (<= i@15@01 hi@6@01)))
; [eval] loc(a, i)
(declare-const sm@16@01 $FVF<val>)
; Definitional axioms for snapshot map values
; [eval] loc(a, i)
(pop) ; 3
(declare-fun inv@17@01 ($Ref) Int)
(declare-fun img@18@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@15@01 Int)) (!
  (=>
    (and (<= lo@5@01 i@15@01) (<= i@15@01 hi@6@01))
    (or (<= lo@5@01 i@15@01) (not (<= lo@5@01 i@15@01))))
  :pattern (($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@14@01)) (loc<Ref> a@4@01 i@15@01)) (loc<Ref> a@4@01 i@15@01)))
  :qid |val-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@15@01 Int) (i2@15@01 Int)) (!
  (=>
    (and
      (and (<= lo@5@01 i1@15@01) (<= i1@15@01 hi@6@01))
      (and (<= lo@5@01 i2@15@01) (<= i2@15@01 hi@6@01))
      (= (loc<Ref> a@4@01 i1@15@01) (loc<Ref> a@4@01 i2@15@01)))
    (= i1@15@01 i2@15@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@15@01 Int)) (!
  (=>
    (and (<= lo@5@01 i@15@01) (<= i@15@01 hi@6@01))
    (and
      (= (inv@17@01 (loc<Ref> a@4@01 i@15@01)) i@15@01)
      (img@18@01 (loc<Ref> a@4@01 i@15@01))))
  :pattern (($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@14@01)) (loc<Ref> a@4@01 i@15@01)) (loc<Ref> a@4@01 i@15@01)))
  :qid |quant-u-8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@18@01 r)
      (and (<= lo@5@01 (inv@17@01 r)) (<= (inv@17@01 r) hi@6@01)))
    (= (loc<Ref> a@4@01 (inv@17@01 r)) r))
  :pattern ((inv@17@01 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@15@01 Int)) (!
  (=>
    (and (<= lo@5@01 i@15@01) (<= i@15@01 hi@6@01))
    (not (= (loc<Ref> a@4@01 i@15@01) $Ref.null)))
  :pattern (($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@14@01)) (loc<Ref> a@4@01 i@15@01)) (loc<Ref> a@4@01 i@15@01)))
  :qid |val-permImpliesNonNull|)))
(declare-const sm@19@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@18@01 r)
      (and (<= lo@5@01 (inv@17@01 r)) (<= (inv@17@01 r) hi@6@01)))
    (=
      ($FVF.lookup_val (as sm@19@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@14@01)) r)))
  :pattern (($FVF.lookup_val (as sm@19@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@14@01)) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@14@01)) r) r)
  :pattern (($FVF.lookup_val (as sm@19@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (<= lo@5@01 (inv@17@01 r)) (<= (inv@17@01 r) hi@6@01))
    ($FVF.loc_val ($FVF.lookup_val (as sm@19@01  $FVF<val>) r) r))
  :pattern ((inv@17@01 r))
  :qid |quant-u-9|)))
(assert (= ($Snap.second $t@14@01) $Snap.unit))
; [eval] (forall i$0: Int, j: Int :: { loc(a, i$0).val, loc(a, j).val } lo <= i$0 && (i$0 <= j && j <= hi) ==> loc(a, i$0).val <= loc(a, j).val)
(declare-const i$0@20@01 Int)
(declare-const j@21@01 Int)
(push) ; 3
; [eval] lo <= i$0 && (i$0 <= j && j <= hi) ==> loc(a, i$0).val <= loc(a, j).val
; [eval] lo <= i$0 && (i$0 <= j && j <= hi)
; [eval] lo <= i$0
(push) ; 4
; [then-branch: 2 | !(lo@5@01 <= i$0@20@01) | live]
; [else-branch: 2 | lo@5@01 <= i$0@20@01 | live]
(push) ; 5
; [then-branch: 2 | !(lo@5@01 <= i$0@20@01)]
(assert (not (<= lo@5@01 i$0@20@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 2 | lo@5@01 <= i$0@20@01]
(assert (<= lo@5@01 i$0@20@01))
; [eval] i$0 <= j
(push) ; 6
; [then-branch: 3 | !(i$0@20@01 <= j@21@01) | live]
; [else-branch: 3 | i$0@20@01 <= j@21@01 | live]
(push) ; 7
; [then-branch: 3 | !(i$0@20@01 <= j@21@01)]
(assert (not (<= i$0@20@01 j@21@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 3 | i$0@20@01 <= j@21@01]
(assert (<= i$0@20@01 j@21@01))
; [eval] j <= hi
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (<= i$0@20@01 j@21@01) (not (<= i$0@20@01 j@21@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= lo@5@01 i$0@20@01)
  (and
    (<= lo@5@01 i$0@20@01)
    (or (<= i$0@20@01 j@21@01) (not (<= i$0@20@01 j@21@01))))))
(assert (or (<= lo@5@01 i$0@20@01) (not (<= lo@5@01 i$0@20@01))))
(push) ; 4
; [then-branch: 4 | lo@5@01 <= i$0@20@01 && i$0@20@01 <= j@21@01 && j@21@01 <= hi@6@01 | live]
; [else-branch: 4 | !(lo@5@01 <= i$0@20@01 && i$0@20@01 <= j@21@01 && j@21@01 <= hi@6@01) | live]
(push) ; 5
; [then-branch: 4 | lo@5@01 <= i$0@20@01 && i$0@20@01 <= j@21@01 && j@21@01 <= hi@6@01]
(assert (and (<= lo@5@01 i$0@20@01) (and (<= i$0@20@01 j@21@01) (<= j@21@01 hi@6@01))))
; [eval] loc(a, i$0).val <= loc(a, j).val
; [eval] loc(a, i$0)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@18@01 r)
        (and (<= lo@5@01 (inv@17@01 r)) (<= (inv@17@01 r) hi@6@01)))
      (=
        ($FVF.lookup_val (as sm@19@01  $FVF<val>) r)
        ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@14@01)) r)))
    :pattern (($FVF.lookup_val (as sm@19@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@14@01)) r))
    :qid |qp.fvfValDef4|))
  (forall ((r $Ref)) (!
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@14@01)) r) r)
    :pattern (($FVF.lookup_val (as sm@19@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef5|))))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@19@01  $FVF<val>) (loc<Ref> a@4@01 i$0@20@01)) (loc<Ref> a@4@01 i$0@20@01)))
(push) ; 6
(assert (not (and
  (img@18@01 (loc<Ref> a@4@01 i$0@20@01))
  (and
    (<= lo@5@01 (inv@17@01 (loc<Ref> a@4@01 i$0@20@01)))
    (<= (inv@17@01 (loc<Ref> a@4@01 i$0@20@01)) hi@6@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] loc(a, j)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@18@01 r)
        (and (<= lo@5@01 (inv@17@01 r)) (<= (inv@17@01 r) hi@6@01)))
      (=
        ($FVF.lookup_val (as sm@19@01  $FVF<val>) r)
        ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@14@01)) r)))
    :pattern (($FVF.lookup_val (as sm@19@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@14@01)) r))
    :qid |qp.fvfValDef4|))
  (forall ((r $Ref)) (!
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@14@01)) r) r)
    :pattern (($FVF.lookup_val (as sm@19@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef5|))))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@19@01  $FVF<val>) (loc<Ref> a@4@01 j@21@01)) (loc<Ref> a@4@01 j@21@01)))
(push) ; 6
(assert (not (and
  (img@18@01 (loc<Ref> a@4@01 j@21@01))
  (and
    (<= lo@5@01 (inv@17@01 (loc<Ref> a@4@01 j@21@01)))
    (<= (inv@17@01 (loc<Ref> a@4@01 j@21@01)) hi@6@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 4 | !(lo@5@01 <= i$0@20@01 && i$0@20@01 <= j@21@01 && j@21@01 <= hi@6@01)]
(assert (not
  (and (<= lo@5@01 i$0@20@01) (and (<= i$0@20@01 j@21@01) (<= j@21@01 hi@6@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@18@01 r)
      (and (<= lo@5@01 (inv@17@01 r)) (<= (inv@17@01 r) hi@6@01)))
    (=
      ($FVF.lookup_val (as sm@19@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@14@01)) r)))
  :pattern (($FVF.lookup_val (as sm@19@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@14@01)) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@14@01)) r) r)
  :pattern (($FVF.lookup_val (as sm@19@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef5|)))
(assert (=>
  (and (<= lo@5@01 i$0@20@01) (and (<= i$0@20@01 j@21@01) (<= j@21@01 hi@6@01)))
  (and
    (<= lo@5@01 i$0@20@01)
    (<= i$0@20@01 j@21@01)
    (<= j@21@01 hi@6@01)
    ($FVF.loc_val ($FVF.lookup_val (as sm@19@01  $FVF<val>) (loc<Ref> a@4@01 i$0@20@01)) (loc<Ref> a@4@01 i$0@20@01))
    ($FVF.loc_val ($FVF.lookup_val (as sm@19@01  $FVF<val>) (loc<Ref> a@4@01 j@21@01)) (loc<Ref> a@4@01 j@21@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= lo@5@01 i$0@20@01)
      (and (<= i$0@20@01 j@21@01) (<= j@21@01 hi@6@01))))
  (and (<= lo@5@01 i$0@20@01) (and (<= i$0@20@01 j@21@01) (<= j@21@01 hi@6@01)))))
; Definitional axioms for snapshot map values
; Definitional axioms for snapshot map values
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@18@01 r)
      (and (<= lo@5@01 (inv@17@01 r)) (<= (inv@17@01 r) hi@6@01)))
    (=
      ($FVF.lookup_val (as sm@19@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@14@01)) r)))
  :pattern (($FVF.lookup_val (as sm@19@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@14@01)) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@14@01)) r) r)
  :pattern (($FVF.lookup_val (as sm@19@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef5|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i$0@20@01 Int) (j@21@01 Int)) (!
  (and
    (=>
      (<= lo@5@01 i$0@20@01)
      (and
        (<= lo@5@01 i$0@20@01)
        (or (<= i$0@20@01 j@21@01) (not (<= i$0@20@01 j@21@01)))))
    (or (<= lo@5@01 i$0@20@01) (not (<= lo@5@01 i$0@20@01)))
    (=>
      (and
        (<= lo@5@01 i$0@20@01)
        (and (<= i$0@20@01 j@21@01) (<= j@21@01 hi@6@01)))
      (and
        (<= lo@5@01 i$0@20@01)
        (<= i$0@20@01 j@21@01)
        (<= j@21@01 hi@6@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@19@01  $FVF<val>) (loc<Ref> a@4@01 i$0@20@01)) (loc<Ref> a@4@01 i$0@20@01))
        ($FVF.loc_val ($FVF.lookup_val (as sm@19@01  $FVF<val>) (loc<Ref> a@4@01 j@21@01)) (loc<Ref> a@4@01 j@21@01))))
    (or
      (not
        (and
          (<= lo@5@01 i$0@20@01)
          (and (<= i$0@20@01 j@21@01) (<= j@21@01 hi@6@01))))
      (and
        (<= lo@5@01 i$0@20@01)
        (and (<= i$0@20@01 j@21@01) (<= j@21@01 hi@6@01)))))
  :pattern (($FVF.loc_val ($FVF.lookup_val (as sm@19@01  $FVF<val>) (loc<Ref> a@4@01 i$0@20@01)) (loc<Ref> a@4@01 i$0@20@01)) ($FVF.loc_val ($FVF.lookup_val (as sm@19@01  $FVF<val>) (loc<Ref> a@4@01 j@21@01)) (loc<Ref> a@4@01 j@21@01)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0299.vpr@34@11@34@28-aux|)))
(assert (forall ((i$0@20@01 Int) (j@21@01 Int)) (!
  (=>
    (and
      (<= lo@5@01 i$0@20@01)
      (and (<= i$0@20@01 j@21@01) (<= j@21@01 hi@6@01)))
    (<=
      ($FVF.lookup_val (as sm@19@01  $FVF<val>) (loc<Ref> a@4@01 i$0@20@01))
      ($FVF.lookup_val (as sm@19@01  $FVF<val>) (loc<Ref> a@4@01 j@21@01))))
  :pattern (($FVF.loc_val ($FVF.lookup_val (as sm@19@01  $FVF<val>) (loc<Ref> a@4@01 i$0@20@01)) (loc<Ref> a@4@01 i$0@20@01)) ($FVF.loc_val ($FVF.lookup_val (as sm@19@01  $FVF<val>) (loc<Ref> a@4@01 j@21@01)) (loc<Ref> a@4@01 j@21@01)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0299.vpr@34@11@34@28|)))
(pop) ; 2
(push) ; 2
(declare-const i@22@01 Int)
(push) ; 3
; [eval] lo <= i && i <= hi
; [eval] lo <= i
(push) ; 4
; [then-branch: 5 | !(lo@5@01 <= i@22@01) | live]
; [else-branch: 5 | lo@5@01 <= i@22@01 | live]
(push) ; 5
; [then-branch: 5 | !(lo@5@01 <= i@22@01)]
(assert (not (<= lo@5@01 i@22@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 5 | lo@5@01 <= i@22@01]
(assert (<= lo@5@01 i@22@01))
; [eval] i <= hi
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= lo@5@01 i@22@01) (not (<= lo@5@01 i@22@01))))
(assert (and (<= lo@5@01 i@22@01) (<= i@22@01 hi@6@01)))
; [eval] loc(a, i)
; Definitional axioms for snapshot map values
; [eval] loc(a, i)
(pop) ; 3
(declare-fun inv@23@01 ($Ref) Int)
(declare-fun img@24@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@22@01 Int)) (!
  (=>
    (and (<= lo@5@01 i@22@01) (<= i@22@01 hi@6@01))
    (or (<= lo@5@01 i@22@01) (not (<= lo@5@01 i@22@01))))
  :pattern (($FVF.loc_val ($FVF.lookup_val (as sm@13@01  $FVF<val>) (loc<Ref> a@4@01 i@22@01)) (loc<Ref> a@4@01 i@22@01)))
  :qid |val-aux|)))
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@22@01 Int) (i2@22@01 Int)) (!
  (=>
    (and
      (and
        (and (<= lo@5@01 i1@22@01) (<= i1@22@01 hi@6@01))
        ($FVF.loc_val ($FVF.lookup_val (as sm@13@01  $FVF<val>) (loc<Ref> a@4@01 i1@22@01)) (loc<Ref> a@4@01 i1@22@01)))
      (and
        (and (<= lo@5@01 i2@22@01) (<= i2@22@01 hi@6@01))
        ($FVF.loc_val ($FVF.lookup_val (as sm@13@01  $FVF<val>) (loc<Ref> a@4@01 i2@22@01)) (loc<Ref> a@4@01 i2@22@01)))
      (= (loc<Ref> a@4@01 i1@22@01) (loc<Ref> a@4@01 i2@22@01)))
    (= i1@22@01 i2@22@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@22@01 Int)) (!
  (=>
    (and (<= lo@5@01 i@22@01) (<= i@22@01 hi@6@01))
    (and
      (= (inv@23@01 (loc<Ref> a@4@01 i@22@01)) i@22@01)
      (img@24@01 (loc<Ref> a@4@01 i@22@01))))
  :pattern (($FVF.loc_val ($FVF.lookup_val (as sm@13@01  $FVF<val>) (loc<Ref> a@4@01 i@22@01)) (loc<Ref> a@4@01 i@22@01)))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@24@01 r)
      (and (<= lo@5@01 (inv@23@01 r)) (<= (inv@23@01 r) hi@6@01)))
    (= (loc<Ref> a@4@01 (inv@23@01 r)) r))
  :pattern ((inv@23@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (<= lo@5@01 (inv@23@01 r)) (<= (inv@23@01 r) hi@6@01))
    ($FVF.loc_val ($FVF.lookup_val (as sm@13@01  $FVF<val>) r) r))
  :pattern ((inv@23@01 r))
  :qid |quant-u-11|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@25@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= lo@5@01 (inv@23@01 r)) (<= (inv@23@01 r) hi@6@01))
      (img@24@01 r)
      (= r (loc<Ref> a@4@01 (inv@23@01 r))))
    ($Perm.min
      (ite
        (and
          (img@12@01 r)
          (and (<= lo@5@01 (inv@11@01 r)) (<= (inv@11@01 r) hi@6@01)))
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
          (img@12@01 r)
          (and (<= lo@5@01 (inv@11@01 r)) (<= (inv@11@01 r) hi@6@01)))
        $Perm.Write
        $Perm.No)
      (pTaken@25@01 r))
    $Perm.No)
  
  :qid |quant-u-13|))))
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
      (and (<= lo@5@01 (inv@23@01 r)) (<= (inv@23@01 r) hi@6@01))
      (img@24@01 r)
      (= r (loc<Ref> a@4@01 (inv@23@01 r))))
    (= (- $Perm.Write (pTaken@25@01 r)) $Perm.No))
  
  :qid |quant-u-14|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values
; [eval] (forall i$0: Int, j: Int :: { loc(a, i$0).val, loc(a, j).val } lo <= i$0 && (i$0 <= j && j <= hi) ==> loc(a, i$0).val <= loc(a, j).val)
(declare-const i$0@26@01 Int)
(declare-const j@27@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] lo <= i$0 && (i$0 <= j && j <= hi) ==> loc(a, i$0).val <= loc(a, j).val
; [eval] lo <= i$0 && (i$0 <= j && j <= hi)
; [eval] lo <= i$0
(push) ; 4
; [then-branch: 6 | !(lo@5@01 <= i$0@26@01) | live]
; [else-branch: 6 | lo@5@01 <= i$0@26@01 | live]
(push) ; 5
; [then-branch: 6 | !(lo@5@01 <= i$0@26@01)]
(assert (not (<= lo@5@01 i$0@26@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 6 | lo@5@01 <= i$0@26@01]
(assert (<= lo@5@01 i$0@26@01))
; [eval] i$0 <= j
(push) ; 6
; [then-branch: 7 | !(i$0@26@01 <= j@27@01) | live]
; [else-branch: 7 | i$0@26@01 <= j@27@01 | live]
(push) ; 7
; [then-branch: 7 | !(i$0@26@01 <= j@27@01)]
(assert (not (<= i$0@26@01 j@27@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 7 | i$0@26@01 <= j@27@01]
(assert (<= i$0@26@01 j@27@01))
; [eval] j <= hi
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (<= i$0@26@01 j@27@01) (not (<= i$0@26@01 j@27@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= lo@5@01 i$0@26@01)
  (and
    (<= lo@5@01 i$0@26@01)
    (or (<= i$0@26@01 j@27@01) (not (<= i$0@26@01 j@27@01))))))
(assert (or (<= lo@5@01 i$0@26@01) (not (<= lo@5@01 i$0@26@01))))
(push) ; 4
; [then-branch: 8 | lo@5@01 <= i$0@26@01 && i$0@26@01 <= j@27@01 && j@27@01 <= hi@6@01 | live]
; [else-branch: 8 | !(lo@5@01 <= i$0@26@01 && i$0@26@01 <= j@27@01 && j@27@01 <= hi@6@01) | live]
(push) ; 5
; [then-branch: 8 | lo@5@01 <= i$0@26@01 && i$0@26@01 <= j@27@01 && j@27@01 <= hi@6@01]
(assert (and (<= lo@5@01 i$0@26@01) (and (<= i$0@26@01 j@27@01) (<= j@27@01 hi@6@01))))
; [eval] loc(a, i$0).val <= loc(a, j).val
; [eval] loc(a, i$0)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@12@01 r)
        (and (<= lo@5@01 (inv@11@01 r)) (<= (inv@11@01 r) hi@6@01)))
      (=
        ($FVF.lookup_val (as sm@13@01  $FVF<val>) r)
        ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@8@01)) r)))
    :pattern (($FVF.lookup_val (as sm@13@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@8@01)) r))
    :qid |qp.fvfValDef1|))
  (forall ((r $Ref)) (!
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@8@01)) r) r)
    :pattern (($FVF.lookup_val (as sm@13@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef2|))))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@13@01  $FVF<val>) (loc<Ref> a@4@01 i$0@26@01)) (loc<Ref> a@4@01 i$0@26@01)))
(push) ; 6
(assert (not (and
  (img@12@01 (loc<Ref> a@4@01 i$0@26@01))
  (and
    (<= lo@5@01 (inv@11@01 (loc<Ref> a@4@01 i$0@26@01)))
    (<= (inv@11@01 (loc<Ref> a@4@01 i$0@26@01)) hi@6@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] loc(a, j)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@12@01 r)
        (and (<= lo@5@01 (inv@11@01 r)) (<= (inv@11@01 r) hi@6@01)))
      (=
        ($FVF.lookup_val (as sm@13@01  $FVF<val>) r)
        ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@8@01)) r)))
    :pattern (($FVF.lookup_val (as sm@13@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@8@01)) r))
    :qid |qp.fvfValDef1|))
  (forall ((r $Ref)) (!
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@8@01)) r) r)
    :pattern (($FVF.lookup_val (as sm@13@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef2|))))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@13@01  $FVF<val>) (loc<Ref> a@4@01 j@27@01)) (loc<Ref> a@4@01 j@27@01)))
(push) ; 6
(assert (not (and
  (img@12@01 (loc<Ref> a@4@01 j@27@01))
  (and
    (<= lo@5@01 (inv@11@01 (loc<Ref> a@4@01 j@27@01)))
    (<= (inv@11@01 (loc<Ref> a@4@01 j@27@01)) hi@6@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 8 | !(lo@5@01 <= i$0@26@01 && i$0@26@01 <= j@27@01 && j@27@01 <= hi@6@01)]
(assert (not
  (and (<= lo@5@01 i$0@26@01) (and (<= i$0@26@01 j@27@01) (<= j@27@01 hi@6@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@12@01 r)
      (and (<= lo@5@01 (inv@11@01 r)) (<= (inv@11@01 r) hi@6@01)))
    (=
      ($FVF.lookup_val (as sm@13@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@8@01)) r)))
  :pattern (($FVF.lookup_val (as sm@13@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@8@01)) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@8@01)) r) r)
  :pattern (($FVF.lookup_val (as sm@13@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef2|)))
(assert (=>
  (and (<= lo@5@01 i$0@26@01) (and (<= i$0@26@01 j@27@01) (<= j@27@01 hi@6@01)))
  (and
    (<= lo@5@01 i$0@26@01)
    (<= i$0@26@01 j@27@01)
    (<= j@27@01 hi@6@01)
    ($FVF.loc_val ($FVF.lookup_val (as sm@13@01  $FVF<val>) (loc<Ref> a@4@01 i$0@26@01)) (loc<Ref> a@4@01 i$0@26@01))
    ($FVF.loc_val ($FVF.lookup_val (as sm@13@01  $FVF<val>) (loc<Ref> a@4@01 j@27@01)) (loc<Ref> a@4@01 j@27@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= lo@5@01 i$0@26@01)
      (and (<= i$0@26@01 j@27@01) (<= j@27@01 hi@6@01))))
  (and (<= lo@5@01 i$0@26@01) (and (<= i$0@26@01 j@27@01) (<= j@27@01 hi@6@01)))))
; Definitional axioms for snapshot map values
; Definitional axioms for snapshot map values
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@12@01 r)
      (and (<= lo@5@01 (inv@11@01 r)) (<= (inv@11@01 r) hi@6@01)))
    (=
      ($FVF.lookup_val (as sm@13@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@8@01)) r)))
  :pattern (($FVF.lookup_val (as sm@13@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@8@01)) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@8@01)) r) r)
  :pattern (($FVF.lookup_val (as sm@13@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef2|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i$0@26@01 Int) (j@27@01 Int)) (!
  (and
    (=>
      (<= lo@5@01 i$0@26@01)
      (and
        (<= lo@5@01 i$0@26@01)
        (or (<= i$0@26@01 j@27@01) (not (<= i$0@26@01 j@27@01)))))
    (or (<= lo@5@01 i$0@26@01) (not (<= lo@5@01 i$0@26@01)))
    (=>
      (and
        (<= lo@5@01 i$0@26@01)
        (and (<= i$0@26@01 j@27@01) (<= j@27@01 hi@6@01)))
      (and
        (<= lo@5@01 i$0@26@01)
        (<= i$0@26@01 j@27@01)
        (<= j@27@01 hi@6@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@13@01  $FVF<val>) (loc<Ref> a@4@01 i$0@26@01)) (loc<Ref> a@4@01 i$0@26@01))
        ($FVF.loc_val ($FVF.lookup_val (as sm@13@01  $FVF<val>) (loc<Ref> a@4@01 j@27@01)) (loc<Ref> a@4@01 j@27@01))))
    (or
      (not
        (and
          (<= lo@5@01 i$0@26@01)
          (and (<= i$0@26@01 j@27@01) (<= j@27@01 hi@6@01))))
      (and
        (<= lo@5@01 i$0@26@01)
        (and (<= i$0@26@01 j@27@01) (<= j@27@01 hi@6@01)))))
  :pattern (($FVF.loc_val ($FVF.lookup_val (as sm@13@01  $FVF<val>) (loc<Ref> a@4@01 i$0@26@01)) (loc<Ref> a@4@01 i$0@26@01)) ($FVF.loc_val ($FVF.lookup_val (as sm@13@01  $FVF<val>) (loc<Ref> a@4@01 j@27@01)) (loc<Ref> a@4@01 j@27@01)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0299.vpr@34@11@34@28-aux|)))
(push) ; 3
(assert (not (forall ((i$0@26@01 Int) (j@27@01 Int)) (!
  (=>
    (and
      (<= lo@5@01 i$0@26@01)
      (and (<= i$0@26@01 j@27@01) (<= j@27@01 hi@6@01)))
    (<=
      ($FVF.lookup_val (as sm@13@01  $FVF<val>) (loc<Ref> a@4@01 i$0@26@01))
      ($FVF.lookup_val (as sm@13@01  $FVF<val>) (loc<Ref> a@4@01 j@27@01))))
  :pattern (($FVF.loc_val ($FVF.lookup_val (as sm@13@01  $FVF<val>) (loc<Ref> a@4@01 i$0@26@01)) (loc<Ref> a@4@01 i$0@26@01)) ($FVF.loc_val ($FVF.lookup_val (as sm@13@01  $FVF<val>) (loc<Ref> a@4@01 j@27@01)) (loc<Ref> a@4@01 j@27@01)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0299.vpr@34@11@34@28|))))
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
; Definitional axioms for snapshot map values
(declare-const pm@28@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@28@01  $FPM) r)
    (ite
      (and
        (img@12@01 r)
        (and (<= lo@5@01 (inv@11@01 r)) (<= (inv@11@01 r) hi@6@01)))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_val (as pm@28@01  $FPM) r))
  :qid |qp.resPrmSumDef6|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@13@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@8@01)) r) r))
  :pattern (($FVF.perm_val (as pm@28@01  $FPM) r))
  :qid |qp.resTrgDef7|)))
; Assume upper permission bound for field val
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_val (as pm@28@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_val ($FVF.lookup_val (as sm@13@01  $FVF<val>) r) r))
  :qid |qp-fld-prm-bnd|)))
; [eval] (forall i$0: Int, j: Int :: { loc(a, i$0).val, loc(a, j).val } lo <= i$0 && (i$0 <= j && j <= hi) ==> loc(a, i$0).val <= loc(a, j).val)
(declare-const i$0@29@01 Int)
(declare-const j@30@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] lo <= i$0 && (i$0 <= j && j <= hi) ==> loc(a, i$0).val <= loc(a, j).val
; [eval] lo <= i$0 && (i$0 <= j && j <= hi)
; [eval] lo <= i$0
(push) ; 4
; [then-branch: 9 | !(lo@5@01 <= i$0@29@01) | live]
; [else-branch: 9 | lo@5@01 <= i$0@29@01 | live]
(push) ; 5
; [then-branch: 9 | !(lo@5@01 <= i$0@29@01)]
(assert (not (<= lo@5@01 i$0@29@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
; Assume upper permission bound for field val
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 9 | lo@5@01 <= i$0@29@01]
(assert (<= lo@5@01 i$0@29@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
; Assume upper permission bound for field val
; [eval] i$0 <= j
(set-option :timeout 0)
(push) ; 6
; [then-branch: 10 | !(i$0@29@01 <= j@30@01) | live]
; [else-branch: 10 | i$0@29@01 <= j@30@01 | live]
(push) ; 7
; [then-branch: 10 | !(i$0@29@01 <= j@30@01)]
(assert (not (<= i$0@29@01 j@30@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
; Assume upper permission bound for field val
(pop) ; 7
(set-option :timeout 0)
(push) ; 7
; [else-branch: 10 | i$0@29@01 <= j@30@01]
(assert (<= i$0@29@01 j@30@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
; Assume upper permission bound for field val
; [eval] j <= hi
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (<= i$0@29@01 j@30@01) (not (<= i$0@29@01 j@30@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= lo@5@01 i$0@29@01)
  (and
    (<= lo@5@01 i$0@29@01)
    (or (<= i$0@29@01 j@30@01) (not (<= i$0@29@01 j@30@01))))))
(assert (or (<= lo@5@01 i$0@29@01) (not (<= lo@5@01 i$0@29@01))))
(set-option :timeout 0)
(push) ; 4
; [then-branch: 11 | lo@5@01 <= i$0@29@01 && i$0@29@01 <= j@30@01 && j@30@01 <= hi@6@01 | live]
; [else-branch: 11 | !(lo@5@01 <= i$0@29@01 && i$0@29@01 <= j@30@01 && j@30@01 <= hi@6@01) | live]
(push) ; 5
; [then-branch: 11 | lo@5@01 <= i$0@29@01 && i$0@29@01 <= j@30@01 && j@30@01 <= hi@6@01]
(assert (and (<= lo@5@01 i$0@29@01) (and (<= i$0@29@01 j@30@01) (<= j@30@01 hi@6@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
; Assume upper permission bound for field val
; [eval] loc(a, i$0).val <= loc(a, j).val
; [eval] loc(a, i$0)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@12@01 r)
        (and (<= lo@5@01 (inv@11@01 r)) (<= (inv@11@01 r) hi@6@01)))
      (=
        ($FVF.lookup_val (as sm@13@01  $FVF<val>) r)
        ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@8@01)) r)))
    :pattern (($FVF.lookup_val (as sm@13@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@8@01)) r))
    :qid |qp.fvfValDef1|))
  (forall ((r $Ref)) (!
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@8@01)) r) r)
    :pattern (($FVF.lookup_val (as sm@13@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef2|))))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@13@01  $FVF<val>) (loc<Ref> a@4@01 i$0@29@01)) (loc<Ref> a@4@01 i$0@29@01)))
(set-option :timeout 0)
(push) ; 6
(assert (not (and
  (img@12@01 (loc<Ref> a@4@01 i$0@29@01))
  (and
    (<= lo@5@01 (inv@11@01 (loc<Ref> a@4@01 i$0@29@01)))
    (<= (inv@11@01 (loc<Ref> a@4@01 i$0@29@01)) hi@6@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] loc(a, j)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@12@01 r)
        (and (<= lo@5@01 (inv@11@01 r)) (<= (inv@11@01 r) hi@6@01)))
      (=
        ($FVF.lookup_val (as sm@13@01  $FVF<val>) r)
        ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@8@01)) r)))
    :pattern (($FVF.lookup_val (as sm@13@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@8@01)) r))
    :qid |qp.fvfValDef1|))
  (forall ((r $Ref)) (!
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@8@01)) r) r)
    :pattern (($FVF.lookup_val (as sm@13@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef2|))))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@13@01  $FVF<val>) (loc<Ref> a@4@01 j@30@01)) (loc<Ref> a@4@01 j@30@01)))
(push) ; 6
(assert (not (and
  (img@12@01 (loc<Ref> a@4@01 j@30@01))
  (and
    (<= lo@5@01 (inv@11@01 (loc<Ref> a@4@01 j@30@01)))
    (<= (inv@11@01 (loc<Ref> a@4@01 j@30@01)) hi@6@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 11 | !(lo@5@01 <= i$0@29@01 && i$0@29@01 <= j@30@01 && j@30@01 <= hi@6@01)]
(assert (not
  (and (<= lo@5@01 i$0@29@01) (and (<= i$0@29@01 j@30@01) (<= j@30@01 hi@6@01)))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@12@01 r)
      (and (<= lo@5@01 (inv@11@01 r)) (<= (inv@11@01 r) hi@6@01)))
    (=
      ($FVF.lookup_val (as sm@13@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@8@01)) r)))
  :pattern (($FVF.lookup_val (as sm@13@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@8@01)) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@8@01)) r) r)
  :pattern (($FVF.lookup_val (as sm@13@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef2|)))
; Assume upper permission bound for field val
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@12@01 r)
      (and (<= lo@5@01 (inv@11@01 r)) (<= (inv@11@01 r) hi@6@01)))
    (=
      ($FVF.lookup_val (as sm@13@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@8@01)) r)))
  :pattern (($FVF.lookup_val (as sm@13@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@8@01)) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@8@01)) r) r)
  :pattern (($FVF.lookup_val (as sm@13@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef2|)))
(assert (=>
  (and (<= lo@5@01 i$0@29@01) (and (<= i$0@29@01 j@30@01) (<= j@30@01 hi@6@01)))
  (and
    (<= lo@5@01 i$0@29@01)
    (<= i$0@29@01 j@30@01)
    (<= j@30@01 hi@6@01)
    ($FVF.loc_val ($FVF.lookup_val (as sm@13@01  $FVF<val>) (loc<Ref> a@4@01 i$0@29@01)) (loc<Ref> a@4@01 i$0@29@01))
    ($FVF.loc_val ($FVF.lookup_val (as sm@13@01  $FVF<val>) (loc<Ref> a@4@01 j@30@01)) (loc<Ref> a@4@01 j@30@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= lo@5@01 i$0@29@01)
      (and (<= i$0@29@01 j@30@01) (<= j@30@01 hi@6@01))))
  (and (<= lo@5@01 i$0@29@01) (and (<= i$0@29@01 j@30@01) (<= j@30@01 hi@6@01)))))
; Definitional axioms for snapshot map values
; Definitional axioms for snapshot map values
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@12@01 r)
      (and (<= lo@5@01 (inv@11@01 r)) (<= (inv@11@01 r) hi@6@01)))
    (=
      ($FVF.lookup_val (as sm@13@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@8@01)) r)))
  :pattern (($FVF.lookup_val (as sm@13@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@8@01)) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@8@01)) r) r)
  :pattern (($FVF.lookup_val (as sm@13@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef2|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i$0@29@01 Int) (j@30@01 Int)) (!
  (and
    (=>
      (<= lo@5@01 i$0@29@01)
      (and
        (<= lo@5@01 i$0@29@01)
        (or (<= i$0@29@01 j@30@01) (not (<= i$0@29@01 j@30@01)))))
    (or (<= lo@5@01 i$0@29@01) (not (<= lo@5@01 i$0@29@01)))
    (=>
      (and
        (<= lo@5@01 i$0@29@01)
        (and (<= i$0@29@01 j@30@01) (<= j@30@01 hi@6@01)))
      (and
        (<= lo@5@01 i$0@29@01)
        (<= i$0@29@01 j@30@01)
        (<= j@30@01 hi@6@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@13@01  $FVF<val>) (loc<Ref> a@4@01 i$0@29@01)) (loc<Ref> a@4@01 i$0@29@01))
        ($FVF.loc_val ($FVF.lookup_val (as sm@13@01  $FVF<val>) (loc<Ref> a@4@01 j@30@01)) (loc<Ref> a@4@01 j@30@01))))
    (or
      (not
        (and
          (<= lo@5@01 i$0@29@01)
          (and (<= i$0@29@01 j@30@01) (<= j@30@01 hi@6@01))))
      (and
        (<= lo@5@01 i$0@29@01)
        (and (<= i$0@29@01 j@30@01) (<= j@30@01 hi@6@01)))))
  :pattern (($FVF.loc_val ($FVF.lookup_val (as sm@13@01  $FVF<val>) (loc<Ref> a@4@01 i$0@29@01)) (loc<Ref> a@4@01 i$0@29@01)) ($FVF.loc_val ($FVF.lookup_val (as sm@13@01  $FVF<val>) (loc<Ref> a@4@01 j@30@01)) (loc<Ref> a@4@01 j@30@01)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0299.vpr@34@11@34@28-aux|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((i$0@29@01 Int) (j@30@01 Int)) (!
  (=>
    (and
      (<= lo@5@01 i$0@29@01)
      (and (<= i$0@29@01 j@30@01) (<= j@30@01 hi@6@01)))
    (<=
      ($FVF.lookup_val (as sm@13@01  $FVF<val>) (loc<Ref> a@4@01 i$0@29@01))
      ($FVF.lookup_val (as sm@13@01  $FVF<val>) (loc<Ref> a@4@01 j@30@01))))
  :pattern (($FVF.loc_val ($FVF.lookup_val (as sm@13@01  $FVF<val>) (loc<Ref> a@4@01 i$0@29@01)) (loc<Ref> a@4@01 i$0@29@01)) ($FVF.loc_val ($FVF.lookup_val (as sm@13@01  $FVF<val>) (loc<Ref> a@4@01 j@30@01)) (loc<Ref> a@4@01 j@30@01)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0299.vpr@34@11@34@28|))))
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
; [eval] (forall i$0: Int, j: Int :: { loc(a, i$0).val, loc(a, j).val } lo <= i$0 && (i$0 <= j && j <= hi) ==> loc(a, i$0).val <= loc(a, j).val)
(declare-const i$0@31@01 Int)
(declare-const j@32@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] lo <= i$0 && (i$0 <= j && j <= hi) ==> loc(a, i$0).val <= loc(a, j).val
; [eval] lo <= i$0 && (i$0 <= j && j <= hi)
; [eval] lo <= i$0
(push) ; 4
; [then-branch: 12 | !(lo@5@01 <= i$0@31@01) | live]
; [else-branch: 12 | lo@5@01 <= i$0@31@01 | live]
(push) ; 5
; [then-branch: 12 | !(lo@5@01 <= i$0@31@01)]
(assert (not (<= lo@5@01 i$0@31@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
(declare-const pm@33@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@33@01  $FPM) r)
    (ite
      (and
        (img@12@01 r)
        (and (<= lo@5@01 (inv@11@01 r)) (<= (inv@11@01 r) hi@6@01)))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_val (as pm@33@01  $FPM) r))
  :qid |qp.resPrmSumDef8|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@13@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@8@01)) r) r))
  :pattern (($FVF.perm_val (as pm@33@01  $FPM) r))
  :qid |qp.resTrgDef9|)))
; Assume upper permission bound for field val
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_val (as pm@33@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_val ($FVF.lookup_val (as sm@13@01  $FVF<val>) r) r))
  :qid |qp-fld-prm-bnd|)))
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 12 | lo@5@01 <= i$0@31@01]
(assert (<= lo@5@01 i$0@31@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
(declare-const pm@34@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@34@01  $FPM) r)
    (ite
      (and
        (img@12@01 r)
        (and (<= lo@5@01 (inv@11@01 r)) (<= (inv@11@01 r) hi@6@01)))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_val (as pm@34@01  $FPM) r))
  :qid |qp.resPrmSumDef10|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@13@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@8@01)) r) r))
  :pattern (($FVF.perm_val (as pm@34@01  $FPM) r))
  :qid |qp.resTrgDef11|)))
; Assume upper permission bound for field val
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_val (as pm@34@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_val ($FVF.lookup_val (as sm@13@01  $FVF<val>) r) r))
  :qid |qp-fld-prm-bnd|)))
; [eval] i$0 <= j
(set-option :timeout 0)
(push) ; 6
; [then-branch: 13 | !(i$0@31@01 <= j@32@01) | live]
; [else-branch: 13 | i$0@31@01 <= j@32@01 | live]
(push) ; 7
; [then-branch: 13 | !(i$0@31@01 <= j@32@01)]
(assert (not (<= i$0@31@01 j@32@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
; Assume upper permission bound for field val
(pop) ; 7
(set-option :timeout 0)
(push) ; 7
; [else-branch: 13 | i$0@31@01 <= j@32@01]
(assert (<= i$0@31@01 j@32@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
; Assume upper permission bound for field val
; [eval] j <= hi
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (<= i$0@31@01 j@32@01) (not (<= i$0@31@01 j@32@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@33@01  $FPM) r)
    (ite
      (and
        (img@12@01 r)
        (and (<= lo@5@01 (inv@11@01 r)) (<= (inv@11@01 r) hi@6@01)))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_val (as pm@33@01  $FPM) r))
  :qid |qp.resPrmSumDef8|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@13@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@8@01)) r) r))
  :pattern (($FVF.perm_val (as pm@33@01  $FPM) r))
  :qid |qp.resTrgDef9|)))
(assert (=>
  (not (<= lo@5@01 i$0@31@01))
  (and
    (not (<= lo@5@01 i$0@31@01))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_val (as pm@33@01  $FPM) r) $Perm.Write)
      :pattern (($FVF.loc_val ($FVF.lookup_val (as sm@13@01  $FVF<val>) r) r))
      :qid |qp-fld-prm-bnd|)))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@34@01  $FPM) r)
    (ite
      (and
        (img@12@01 r)
        (and (<= lo@5@01 (inv@11@01 r)) (<= (inv@11@01 r) hi@6@01)))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_val (as pm@34@01  $FPM) r))
  :qid |qp.resPrmSumDef10|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@13@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@8@01)) r) r))
  :pattern (($FVF.perm_val (as pm@34@01  $FPM) r))
  :qid |qp.resTrgDef11|)))
(assert (=>
  (<= lo@5@01 i$0@31@01)
  (and
    (<= lo@5@01 i$0@31@01)
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_val (as pm@34@01  $FPM) r) $Perm.Write)
      :pattern (($FVF.loc_val ($FVF.lookup_val (as sm@13@01  $FVF<val>) r) r))
      :qid |qp-fld-prm-bnd|))
    (or (<= i$0@31@01 j@32@01) (not (<= i$0@31@01 j@32@01))))))
(assert (or (<= lo@5@01 i$0@31@01) (not (<= lo@5@01 i$0@31@01))))
(set-option :timeout 0)
(push) ; 4
; [then-branch: 14 | lo@5@01 <= i$0@31@01 && i$0@31@01 <= j@32@01 && j@32@01 <= hi@6@01 | live]
; [else-branch: 14 | !(lo@5@01 <= i$0@31@01 && i$0@31@01 <= j@32@01 && j@32@01 <= hi@6@01) | live]
(push) ; 5
; [then-branch: 14 | lo@5@01 <= i$0@31@01 && i$0@31@01 <= j@32@01 && j@32@01 <= hi@6@01]
(assert (and (<= lo@5@01 i$0@31@01) (and (<= i$0@31@01 j@32@01) (<= j@32@01 hi@6@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
; Assume upper permission bound for field val
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_val (as pm@34@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_val ($FVF.lookup_val (as sm@13@01  $FVF<val>) r) r))
  :qid |qp-fld-prm-bnd|)))
; [eval] loc(a, i$0).val <= loc(a, j).val
; [eval] loc(a, i$0)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@12@01 r)
        (and (<= lo@5@01 (inv@11@01 r)) (<= (inv@11@01 r) hi@6@01)))
      (=
        ($FVF.lookup_val (as sm@13@01  $FVF<val>) r)
        ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@8@01)) r)))
    :pattern (($FVF.lookup_val (as sm@13@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@8@01)) r))
    :qid |qp.fvfValDef1|))
  (forall ((r $Ref)) (!
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@8@01)) r) r)
    :pattern (($FVF.lookup_val (as sm@13@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef2|))))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@13@01  $FVF<val>) (loc<Ref> a@4@01 i$0@31@01)) (loc<Ref> a@4@01 i$0@31@01)))
(set-option :timeout 0)
(push) ; 6
(assert (not (and
  (img@12@01 (loc<Ref> a@4@01 i$0@31@01))
  (and
    (<= lo@5@01 (inv@11@01 (loc<Ref> a@4@01 i$0@31@01)))
    (<= (inv@11@01 (loc<Ref> a@4@01 i$0@31@01)) hi@6@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] loc(a, j)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@12@01 r)
        (and (<= lo@5@01 (inv@11@01 r)) (<= (inv@11@01 r) hi@6@01)))
      (=
        ($FVF.lookup_val (as sm@13@01  $FVF<val>) r)
        ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@8@01)) r)))
    :pattern (($FVF.lookup_val (as sm@13@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@8@01)) r))
    :qid |qp.fvfValDef1|))
  (forall ((r $Ref)) (!
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@8@01)) r) r)
    :pattern (($FVF.lookup_val (as sm@13@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef2|))))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@13@01  $FVF<val>) (loc<Ref> a@4@01 j@32@01)) (loc<Ref> a@4@01 j@32@01)))
(push) ; 6
(assert (not (and
  (img@12@01 (loc<Ref> a@4@01 j@32@01))
  (and
    (<= lo@5@01 (inv@11@01 (loc<Ref> a@4@01 j@32@01)))
    (<= (inv@11@01 (loc<Ref> a@4@01 j@32@01)) hi@6@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 14 | !(lo@5@01 <= i$0@31@01 && i$0@31@01 <= j@32@01 && j@32@01 <= hi@6@01)]
(assert (not
  (and (<= lo@5@01 i$0@31@01) (and (<= i$0@31@01 j@32@01) (<= j@32@01 hi@6@01)))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@12@01 r)
      (and (<= lo@5@01 (inv@11@01 r)) (<= (inv@11@01 r) hi@6@01)))
    (=
      ($FVF.lookup_val (as sm@13@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@8@01)) r)))
  :pattern (($FVF.lookup_val (as sm@13@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@8@01)) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@8@01)) r) r)
  :pattern (($FVF.lookup_val (as sm@13@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef2|)))
; Assume upper permission bound for field val
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_val (as pm@34@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_val ($FVF.lookup_val (as sm@13@01  $FVF<val>) r) r))
  :qid |qp-fld-prm-bnd|)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@12@01 r)
      (and (<= lo@5@01 (inv@11@01 r)) (<= (inv@11@01 r) hi@6@01)))
    (=
      ($FVF.lookup_val (as sm@13@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@8@01)) r)))
  :pattern (($FVF.lookup_val (as sm@13@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@8@01)) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@8@01)) r) r)
  :pattern (($FVF.lookup_val (as sm@13@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef2|)))
(assert (=>
  (and (<= lo@5@01 i$0@31@01) (and (<= i$0@31@01 j@32@01) (<= j@32@01 hi@6@01)))
  (and
    (<= lo@5@01 i$0@31@01)
    (<= i$0@31@01 j@32@01)
    (<= j@32@01 hi@6@01)
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_val (as pm@34@01  $FPM) r) $Perm.Write)
      :pattern (($FVF.loc_val ($FVF.lookup_val (as sm@13@01  $FVF<val>) r) r))
      :qid |qp-fld-prm-bnd|))
    ($FVF.loc_val ($FVF.lookup_val (as sm@13@01  $FVF<val>) (loc<Ref> a@4@01 i$0@31@01)) (loc<Ref> a@4@01 i$0@31@01))
    ($FVF.loc_val ($FVF.lookup_val (as sm@13@01  $FVF<val>) (loc<Ref> a@4@01 j@32@01)) (loc<Ref> a@4@01 j@32@01)))))
; Joined path conditions
(assert (=>
  (not
    (and
      (<= lo@5@01 i$0@31@01)
      (and (<= i$0@31@01 j@32@01) (<= j@32@01 hi@6@01))))
  (and
    (not
      (and
        (<= lo@5@01 i$0@31@01)
        (and (<= i$0@31@01 j@32@01) (<= j@32@01 hi@6@01))))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_val (as pm@34@01  $FPM) r) $Perm.Write)
      :pattern (($FVF.loc_val ($FVF.lookup_val (as sm@13@01  $FVF<val>) r) r))
      :qid |qp-fld-prm-bnd|)))))
(assert (or
  (not
    (and
      (<= lo@5@01 i$0@31@01)
      (and (<= i$0@31@01 j@32@01) (<= j@32@01 hi@6@01))))
  (and (<= lo@5@01 i$0@31@01) (and (<= i$0@31@01 j@32@01) (<= j@32@01 hi@6@01)))))
; Definitional axioms for snapshot map values
; Definitional axioms for snapshot map values
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@33@01  $FPM) r)
    (ite
      (and
        (img@12@01 r)
        (and (<= lo@5@01 (inv@11@01 r)) (<= (inv@11@01 r) hi@6@01)))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_val (as pm@33@01  $FPM) r))
  :qid |qp.resPrmSumDef8|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@13@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@8@01)) r) r))
  :pattern (($FVF.perm_val (as pm@33@01  $FPM) r))
  :qid |qp.resTrgDef9|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@34@01  $FPM) r)
    (ite
      (and
        (img@12@01 r)
        (and (<= lo@5@01 (inv@11@01 r)) (<= (inv@11@01 r) hi@6@01)))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_val (as pm@34@01  $FPM) r))
  :qid |qp.resPrmSumDef10|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@13@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@8@01)) r) r))
  :pattern (($FVF.perm_val (as pm@34@01  $FPM) r))
  :qid |qp.resTrgDef11|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@12@01 r)
      (and (<= lo@5@01 (inv@11@01 r)) (<= (inv@11@01 r) hi@6@01)))
    (=
      ($FVF.lookup_val (as sm@13@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@8@01)) r)))
  :pattern (($FVF.lookup_val (as sm@13@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@8@01)) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@8@01)) r) r)
  :pattern (($FVF.lookup_val (as sm@13@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef2|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i$0@31@01 Int) (j@32@01 Int)) (!
  (and
    (=>
      (not (<= lo@5@01 i$0@31@01))
      (and
        (not (<= lo@5@01 i$0@31@01))
        (forall ((r $Ref)) (!
          (<= ($FVF.perm_val (as pm@33@01  $FPM) r) $Perm.Write)
          :pattern (($FVF.loc_val ($FVF.lookup_val (as sm@13@01  $FVF<val>) r) r))
          :qid |qp-fld-prm-bnd|))))
    (=>
      (<= lo@5@01 i$0@31@01)
      (and
        (<= lo@5@01 i$0@31@01)
        (forall ((r $Ref)) (!
          (<= ($FVF.perm_val (as pm@34@01  $FPM) r) $Perm.Write)
          :pattern (($FVF.loc_val ($FVF.lookup_val (as sm@13@01  $FVF<val>) r) r))
          :qid |qp-fld-prm-bnd|))
        (or (<= i$0@31@01 j@32@01) (not (<= i$0@31@01 j@32@01)))))
    (or (<= lo@5@01 i$0@31@01) (not (<= lo@5@01 i$0@31@01)))
    (=>
      (and
        (<= lo@5@01 i$0@31@01)
        (and (<= i$0@31@01 j@32@01) (<= j@32@01 hi@6@01)))
      (and
        (<= lo@5@01 i$0@31@01)
        (<= i$0@31@01 j@32@01)
        (<= j@32@01 hi@6@01)
        (forall ((r $Ref)) (!
          (<= ($FVF.perm_val (as pm@34@01  $FPM) r) $Perm.Write)
          :pattern (($FVF.loc_val ($FVF.lookup_val (as sm@13@01  $FVF<val>) r) r))
          :qid |qp-fld-prm-bnd|))
        ($FVF.loc_val ($FVF.lookup_val (as sm@13@01  $FVF<val>) (loc<Ref> a@4@01 i$0@31@01)) (loc<Ref> a@4@01 i$0@31@01))
        ($FVF.loc_val ($FVF.lookup_val (as sm@13@01  $FVF<val>) (loc<Ref> a@4@01 j@32@01)) (loc<Ref> a@4@01 j@32@01))))
    (=>
      (not
        (and
          (<= lo@5@01 i$0@31@01)
          (and (<= i$0@31@01 j@32@01) (<= j@32@01 hi@6@01))))
      (and
        (not
          (and
            (<= lo@5@01 i$0@31@01)
            (and (<= i$0@31@01 j@32@01) (<= j@32@01 hi@6@01))))
        (forall ((r $Ref)) (!
          (<= ($FVF.perm_val (as pm@34@01  $FPM) r) $Perm.Write)
          :pattern (($FVF.loc_val ($FVF.lookup_val (as sm@13@01  $FVF<val>) r) r))
          :qid |qp-fld-prm-bnd|))))
    (or
      (not
        (and
          (<= lo@5@01 i$0@31@01)
          (and (<= i$0@31@01 j@32@01) (<= j@32@01 hi@6@01))))
      (and
        (<= lo@5@01 i$0@31@01)
        (and (<= i$0@31@01 j@32@01) (<= j@32@01 hi@6@01)))))
  :pattern (($FVF.loc_val ($FVF.lookup_val (as sm@13@01  $FVF<val>) (loc<Ref> a@4@01 i$0@31@01)) (loc<Ref> a@4@01 i$0@31@01)) ($FVF.loc_val ($FVF.lookup_val (as sm@13@01  $FVF<val>) (loc<Ref> a@4@01 j@32@01)) (loc<Ref> a@4@01 j@32@01)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0299.vpr@34@11@34@28-aux|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((i$0@31@01 Int) (j@32@01 Int)) (!
  (=>
    (and
      (<= lo@5@01 i$0@31@01)
      (and (<= i$0@31@01 j@32@01) (<= j@32@01 hi@6@01)))
    (<=
      ($FVF.lookup_val (as sm@13@01  $FVF<val>) (loc<Ref> a@4@01 i$0@31@01))
      ($FVF.lookup_val (as sm@13@01  $FVF<val>) (loc<Ref> a@4@01 j@32@01))))
  :pattern (($FVF.loc_val ($FVF.lookup_val (as sm@13@01  $FVF<val>) (loc<Ref> a@4@01 i$0@31@01)) (loc<Ref> a@4@01 i$0@31@01)) ($FVF.loc_val ($FVF.lookup_val (as sm@13@01  $FVF<val>) (loc<Ref> a@4@01 j@32@01)) (loc<Ref> a@4@01 j@32@01)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0299.vpr@34@11@34@28|))))
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
; Definitional axioms for snapshot map values
(declare-const pm@35@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@35@01  $FPM) r)
    (ite
      (and
        (img@12@01 r)
        (and (<= lo@5@01 (inv@11@01 r)) (<= (inv@11@01 r) hi@6@01)))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_val (as pm@35@01  $FPM) r))
  :qid |qp.resPrmSumDef12|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@13@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@8@01)) r) r))
  :pattern (($FVF.perm_val (as pm@35@01  $FPM) r))
  :qid |qp.resTrgDef13|)))
; Assume upper permission bound for field val
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_val (as pm@35@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_val ($FVF.lookup_val (as sm@13@01  $FVF<val>) r) r))
  :qid |qp-fld-prm-bnd|)))
; [eval] (forall i$0: Int, j: Int :: { loc(a, i$0).val, loc(a, j).val } lo <= i$0 && (i$0 <= j && j <= hi) ==> loc(a, i$0).val <= loc(a, j).val)
(declare-const i$0@36@01 Int)
(declare-const j@37@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] lo <= i$0 && (i$0 <= j && j <= hi) ==> loc(a, i$0).val <= loc(a, j).val
; [eval] lo <= i$0 && (i$0 <= j && j <= hi)
; [eval] lo <= i$0
(push) ; 4
; [then-branch: 15 | !(lo@5@01 <= i$0@36@01) | live]
; [else-branch: 15 | lo@5@01 <= i$0@36@01 | live]
(push) ; 5
; [then-branch: 15 | !(lo@5@01 <= i$0@36@01)]
(assert (not (<= lo@5@01 i$0@36@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
; Assume upper permission bound for field val
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 15 | lo@5@01 <= i$0@36@01]
(assert (<= lo@5@01 i$0@36@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
; Assume upper permission bound for field val
; [eval] i$0 <= j
(set-option :timeout 0)
(push) ; 6
; [then-branch: 16 | !(i$0@36@01 <= j@37@01) | live]
; [else-branch: 16 | i$0@36@01 <= j@37@01 | live]
(push) ; 7
; [then-branch: 16 | !(i$0@36@01 <= j@37@01)]
(assert (not (<= i$0@36@01 j@37@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
; Assume upper permission bound for field val
(pop) ; 7
(set-option :timeout 0)
(push) ; 7
; [else-branch: 16 | i$0@36@01 <= j@37@01]
(assert (<= i$0@36@01 j@37@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
; Assume upper permission bound for field val
; [eval] j <= hi
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (<= i$0@36@01 j@37@01) (not (<= i$0@36@01 j@37@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= lo@5@01 i$0@36@01)
  (and
    (<= lo@5@01 i$0@36@01)
    (or (<= i$0@36@01 j@37@01) (not (<= i$0@36@01 j@37@01))))))
(assert (or (<= lo@5@01 i$0@36@01) (not (<= lo@5@01 i$0@36@01))))
(set-option :timeout 0)
(push) ; 4
; [then-branch: 17 | lo@5@01 <= i$0@36@01 && i$0@36@01 <= j@37@01 && j@37@01 <= hi@6@01 | live]
; [else-branch: 17 | !(lo@5@01 <= i$0@36@01 && i$0@36@01 <= j@37@01 && j@37@01 <= hi@6@01) | live]
(push) ; 5
; [then-branch: 17 | lo@5@01 <= i$0@36@01 && i$0@36@01 <= j@37@01 && j@37@01 <= hi@6@01]
(assert (and (<= lo@5@01 i$0@36@01) (and (<= i$0@36@01 j@37@01) (<= j@37@01 hi@6@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
; Assume upper permission bound for field val
; [eval] loc(a, i$0).val <= loc(a, j).val
; [eval] loc(a, i$0)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@12@01 r)
        (and (<= lo@5@01 (inv@11@01 r)) (<= (inv@11@01 r) hi@6@01)))
      (=
        ($FVF.lookup_val (as sm@13@01  $FVF<val>) r)
        ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@8@01)) r)))
    :pattern (($FVF.lookup_val (as sm@13@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@8@01)) r))
    :qid |qp.fvfValDef1|))
  (forall ((r $Ref)) (!
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@8@01)) r) r)
    :pattern (($FVF.lookup_val (as sm@13@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef2|))))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@13@01  $FVF<val>) (loc<Ref> a@4@01 i$0@36@01)) (loc<Ref> a@4@01 i$0@36@01)))
(set-option :timeout 0)
(push) ; 6
(assert (not (and
  (img@12@01 (loc<Ref> a@4@01 i$0@36@01))
  (and
    (<= lo@5@01 (inv@11@01 (loc<Ref> a@4@01 i$0@36@01)))
    (<= (inv@11@01 (loc<Ref> a@4@01 i$0@36@01)) hi@6@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] loc(a, j)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@12@01 r)
        (and (<= lo@5@01 (inv@11@01 r)) (<= (inv@11@01 r) hi@6@01)))
      (=
        ($FVF.lookup_val (as sm@13@01  $FVF<val>) r)
        ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@8@01)) r)))
    :pattern (($FVF.lookup_val (as sm@13@01  $FVF<val>) r))
    :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@8@01)) r))
    :qid |qp.fvfValDef1|))
  (forall ((r $Ref)) (!
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@8@01)) r) r)
    :pattern (($FVF.lookup_val (as sm@13@01  $FVF<val>) r))
    :qid |qp.fvfResTrgDef2|))))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@13@01  $FVF<val>) (loc<Ref> a@4@01 j@37@01)) (loc<Ref> a@4@01 j@37@01)))
(push) ; 6
(assert (not (and
  (img@12@01 (loc<Ref> a@4@01 j@37@01))
  (and
    (<= lo@5@01 (inv@11@01 (loc<Ref> a@4@01 j@37@01)))
    (<= (inv@11@01 (loc<Ref> a@4@01 j@37@01)) hi@6@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 17 | !(lo@5@01 <= i$0@36@01 && i$0@36@01 <= j@37@01 && j@37@01 <= hi@6@01)]
(assert (not
  (and (<= lo@5@01 i$0@36@01) (and (<= i$0@36@01 j@37@01) (<= j@37@01 hi@6@01)))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@12@01 r)
      (and (<= lo@5@01 (inv@11@01 r)) (<= (inv@11@01 r) hi@6@01)))
    (=
      ($FVF.lookup_val (as sm@13@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@8@01)) r)))
  :pattern (($FVF.lookup_val (as sm@13@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@8@01)) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@8@01)) r) r)
  :pattern (($FVF.lookup_val (as sm@13@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef2|)))
; Assume upper permission bound for field val
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@12@01 r)
      (and (<= lo@5@01 (inv@11@01 r)) (<= (inv@11@01 r) hi@6@01)))
    (=
      ($FVF.lookup_val (as sm@13@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@8@01)) r)))
  :pattern (($FVF.lookup_val (as sm@13@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@8@01)) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@8@01)) r) r)
  :pattern (($FVF.lookup_val (as sm@13@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef2|)))
(assert (=>
  (and (<= lo@5@01 i$0@36@01) (and (<= i$0@36@01 j@37@01) (<= j@37@01 hi@6@01)))
  (and
    (<= lo@5@01 i$0@36@01)
    (<= i$0@36@01 j@37@01)
    (<= j@37@01 hi@6@01)
    ($FVF.loc_val ($FVF.lookup_val (as sm@13@01  $FVF<val>) (loc<Ref> a@4@01 i$0@36@01)) (loc<Ref> a@4@01 i$0@36@01))
    ($FVF.loc_val ($FVF.lookup_val (as sm@13@01  $FVF<val>) (loc<Ref> a@4@01 j@37@01)) (loc<Ref> a@4@01 j@37@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= lo@5@01 i$0@36@01)
      (and (<= i$0@36@01 j@37@01) (<= j@37@01 hi@6@01))))
  (and (<= lo@5@01 i$0@36@01) (and (<= i$0@36@01 j@37@01) (<= j@37@01 hi@6@01)))))
; Definitional axioms for snapshot map values
; Definitional axioms for snapshot map values
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@12@01 r)
      (and (<= lo@5@01 (inv@11@01 r)) (<= (inv@11@01 r) hi@6@01)))
    (=
      ($FVF.lookup_val (as sm@13@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@8@01)) r)))
  :pattern (($FVF.lookup_val (as sm@13@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@8@01)) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.second $t@8@01)) r) r)
  :pattern (($FVF.lookup_val (as sm@13@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef2|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i$0@36@01 Int) (j@37@01 Int)) (!
  (and
    (=>
      (<= lo@5@01 i$0@36@01)
      (and
        (<= lo@5@01 i$0@36@01)
        (or (<= i$0@36@01 j@37@01) (not (<= i$0@36@01 j@37@01)))))
    (or (<= lo@5@01 i$0@36@01) (not (<= lo@5@01 i$0@36@01)))
    (=>
      (and
        (<= lo@5@01 i$0@36@01)
        (and (<= i$0@36@01 j@37@01) (<= j@37@01 hi@6@01)))
      (and
        (<= lo@5@01 i$0@36@01)
        (<= i$0@36@01 j@37@01)
        (<= j@37@01 hi@6@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@13@01  $FVF<val>) (loc<Ref> a@4@01 i$0@36@01)) (loc<Ref> a@4@01 i$0@36@01))
        ($FVF.loc_val ($FVF.lookup_val (as sm@13@01  $FVF<val>) (loc<Ref> a@4@01 j@37@01)) (loc<Ref> a@4@01 j@37@01))))
    (or
      (not
        (and
          (<= lo@5@01 i$0@36@01)
          (and (<= i$0@36@01 j@37@01) (<= j@37@01 hi@6@01))))
      (and
        (<= lo@5@01 i$0@36@01)
        (and (<= i$0@36@01 j@37@01) (<= j@37@01 hi@6@01)))))
  :pattern (($FVF.loc_val ($FVF.lookup_val (as sm@13@01  $FVF<val>) (loc<Ref> a@4@01 i$0@36@01)) (loc<Ref> a@4@01 i$0@36@01)) ($FVF.loc_val ($FVF.lookup_val (as sm@13@01  $FVF<val>) (loc<Ref> a@4@01 j@37@01)) (loc<Ref> a@4@01 j@37@01)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0299.vpr@34@11@34@28-aux|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((i$0@36@01 Int) (j@37@01 Int)) (!
  (=>
    (and
      (<= lo@5@01 i$0@36@01)
      (and (<= i$0@36@01 j@37@01) (<= j@37@01 hi@6@01)))
    (<=
      ($FVF.lookup_val (as sm@13@01  $FVF<val>) (loc<Ref> a@4@01 i$0@36@01))
      ($FVF.lookup_val (as sm@13@01  $FVF<val>) (loc<Ref> a@4@01 j@37@01))))
  :pattern (($FVF.loc_val ($FVF.lookup_val (as sm@13@01  $FVF<val>) (loc<Ref> a@4@01 i$0@36@01)) (loc<Ref> a@4@01 i$0@36@01)) ($FVF.loc_val ($FVF.lookup_val (as sm@13@01  $FVF<val>) (loc<Ref> a@4@01 j@37@01)) (loc<Ref> a@4@01 j@37@01)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silicon/0299.vpr@34@11@34@28|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
