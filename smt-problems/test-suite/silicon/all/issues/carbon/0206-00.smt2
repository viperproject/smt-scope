(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 19:48:35
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/carbon/0206.vpr
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
(declare-sort Foobar 0)
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
(declare-fun $SortWrappers.FoobarTo$Snap (Foobar) $Snap)
(declare-fun $SortWrappers.$SnapToFoobar ($Snap) Foobar)
(assert (forall ((x Foobar)) (!
    (= x ($SortWrappers.$SnapToFoobar($SortWrappers.FoobarTo$Snap x)))
    :pattern (($SortWrappers.FoobarTo$Snap x))
    :qid |$Snap.$SnapToFoobarTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.FoobarTo$Snap($SortWrappers.$SnapToFoobar x)))
    :pattern (($SortWrappers.$SnapToFoobar x))
    :qid |$Snap.FoobarTo$SnapToFoobar|
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
(declare-fun dummy<Bool> (Bool) Bool)
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
; ---------- swap ----------
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
; [eval] (i in [0..length(a)))
; [eval] [0..length(a))
; [eval] length(a)
(assert (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i@7@01))
; [eval] loc(a, i)
(declare-const sm@8@01 $FVF<val>)
; Definitional axioms for snapshot map values
; [eval] loc(a, i)
(pop) ; 2
(declare-fun inv@9@01 ($Ref) Int)
(declare-fun img@10@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@7@01 Int) (i2@7@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i1@7@01)
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i2@7@01)
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
    (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i@7@01)
    (and
      (= (inv@9@01 (loc<Ref> a@3@01 i@7@01)) i@7@01)
      (img@10@01 (loc<Ref> a@3@01 i@7@01))))
  :pattern (($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) (loc<Ref> a@3@01 i@7@01)) (loc<Ref> a@3@01 i@7@01)))
  :qid |quant-u-8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@10@01 r)
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@9@01 r)))
    (= (loc<Ref> a@3@01 (inv@9@01 r)) r))
  :pattern ((inv@9@01 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@7@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i@7@01)
    (not (= (loc<Ref> a@3@01 i@7@01) $Ref.null)))
  :pattern (($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) (loc<Ref> a@3@01 i@7@01)) (loc<Ref> a@3@01 i@7@01)))
  :qid |val-permImpliesNonNull|)))
(declare-const sm@11@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@10@01 r)
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@9@01 r)))
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
    (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@9@01 r))
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
  $Snap.unit))
; [eval] y < length(a)
; [eval] length(a)
(assert (< y@5@01 (length<Int> a@3@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@12@01 $Snap)
(assert (= $t@12@01 ($Snap.combine ($Snap.first $t@12@01) ($Snap.second $t@12@01))))
(declare-const i@13@01 Int)
(push) ; 3
; [eval] (i in [0..length(a)))
; [eval] [0..length(a))
; [eval] length(a)
(assert (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i@13@01))
; [eval] loc(a, i)
(declare-const sm@14@01 $FVF<val>)
; Definitional axioms for snapshot map values
; [eval] loc(a, i)
(pop) ; 3
(declare-fun inv@15@01 ($Ref) Int)
(declare-fun img@16@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@13@01 Int) (i2@13@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i1@13@01)
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i2@13@01)
      (= (loc<Ref> a@3@01 i1@13@01) (loc<Ref> a@3@01 i2@13@01)))
    (= i1@13@01 i2@13@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@13@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i@13@01)
    (and
      (= (inv@15@01 (loc<Ref> a@3@01 i@13@01)) i@13@01)
      (img@16@01 (loc<Ref> a@3@01 i@13@01))))
  :pattern (($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@12@01)) (loc<Ref> a@3@01 i@13@01)) (loc<Ref> a@3@01 i@13@01)))
  :qid |quant-u-11|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@16@01 r)
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@15@01 r)))
    (= (loc<Ref> a@3@01 (inv@15@01 r)) r))
  :pattern ((inv@15@01 r))
  :qid |val-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@13@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i@13@01)
    (not (= (loc<Ref> a@3@01 i@13@01) $Ref.null)))
  :pattern (($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@12@01)) (loc<Ref> a@3@01 i@13@01)) (loc<Ref> a@3@01 i@13@01)))
  :qid |val-permImpliesNonNull|)))
(declare-const sm@17@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@16@01 r)
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@15@01 r)))
    (=
      ($FVF.lookup_val (as sm@17@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@12@01)) r)))
  :pattern (($FVF.lookup_val (as sm@17@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@12@01)) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@12@01)) r) r)
  :pattern (($FVF.lookup_val (as sm@17@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@15@01 r))
    ($FVF.loc_val ($FVF.lookup_val (as sm@17@01  $FVF<val>) r) r))
  :pattern ((inv@15@01 r))
  :qid |quant-u-12|)))
(assert (= ($Snap.second $t@12@01) $Snap.unit))
; [eval] elements(a) == old(elements(a))
; [eval] elements(a)
(push) ; 3
(declare-const i@18@01 Int)
(push) ; 4
; [eval] (i in [0..length(this)))
; [eval] [0..length(this))
; [eval] length(this)
(assert (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i@18@01))
; [eval] loc(this, i)
(pop) ; 4
(declare-fun inv@19@01 ($Ref) Int)
(declare-fun img@20@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@18@01 Int) (i2@18@01 Int)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i1@18@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@17@01  $FVF<val>) (loc<Ref> a@3@01 i1@18@01)) (loc<Ref> a@3@01 i1@18@01)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i2@18@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@17@01  $FVF<val>) (loc<Ref> a@3@01 i2@18@01)) (loc<Ref> a@3@01 i2@18@01)))
      (= (loc<Ref> a@3@01 i1@18@01) (loc<Ref> a@3@01 i2@18@01)))
    (= i1@18@01 i2@18@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@18@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i@18@01)
    (and
      (= (inv@19@01 (loc<Ref> a@3@01 i@18@01)) i@18@01)
      (img@20@01 (loc<Ref> a@3@01 i@18@01))))
  :pattern ((loc<Ref> a@3@01 i@18@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@20@01 r)
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@19@01 r)))
    (= (loc<Ref> a@3@01 (inv@19@01 r)) r))
  :pattern ((inv@19@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@19@01 r))
    ($FVF.loc_val ($FVF.lookup_val (as sm@17@01  $FVF<val>) r) r))
  :pattern ((inv@19@01 r))
  :qid |quant-u-14|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@21@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@19@01 r))
      (img@20@01 r)
      (= r (loc<Ref> a@3@01 (inv@19@01 r))))
    ($Perm.min
      (ite
        (and
          (img@16@01 r)
          (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@15@01 r)))
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
          (img@16@01 r)
          (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@15@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@21@01 r))
    $Perm.No)
  
  :qid |quant-u-16|))))
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
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@19@01 r))
      (img@20@01 r)
      (= r (loc<Ref> a@3@01 (inv@19@01 r))))
    (= (- $Perm.Write (pTaken@21@01 r)) $Perm.No))
  
  :qid |quant-u-17|))))
(check-sat)
; unsat
(pop) ; 4
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
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@19@01 r))
        (img@20@01 r)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@19@01 r))
        (img@20@01 r))
      (Set_in r ($FVF.domain_val (as sm@22@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@22@01  $FVF<val>))))
  :qid |qp.fvfDomDef8|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@19@01 r))
        (img@20@01 r))
      (and
        (img@16@01 r)
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@15@01 r))))
    (=
      ($FVF.lookup_val (as sm@22@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@12@01)) r)))
  :pattern (($FVF.lookup_val (as sm@22@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@12@01)) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@12@01)) r) r)
  :pattern (($FVF.lookup_val (as sm@22@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef7|)))
(assert (elements%precondition ($SortWrappers.$FVF<val>To$Snap (as sm@22@01  $FVF<val>)) a@3@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((i@18@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i@18@01)
    (and
      (= (inv@19@01 (loc<Ref> a@3@01 i@18@01)) i@18@01)
      (img@20@01 (loc<Ref> a@3@01 i@18@01))))
  :pattern ((loc<Ref> a@3@01 i@18@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@20@01 r)
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@19@01 r)))
    (= (loc<Ref> a@3@01 (inv@19@01 r)) r))
  :pattern ((inv@19@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@22@01  $FVF<val>)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@19@01 r))
        (img@20@01 r)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@19@01 r))
        (img@20@01 r))
      (Set_in r ($FVF.domain_val (as sm@22@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@22@01  $FVF<val>))))
  :qid |qp.fvfDomDef8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@19@01 r))
        (img@20@01 r))
      (and
        (img@16@01 r)
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@15@01 r))))
    (=
      ($FVF.lookup_val (as sm@22@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@12@01)) r)))
  :pattern (($FVF.lookup_val (as sm@22@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@12@01)) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@12@01)) r) r)
  :pattern (($FVF.lookup_val (as sm@22@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef7|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@19@01 r))
      ($FVF.loc_val ($FVF.lookup_val (as sm@17@01  $FVF<val>) r) r))
    :pattern ((inv@19@01 r))
    :qid |quant-u-14|))
  (elements%precondition ($SortWrappers.$FVF<val>To$Snap (as sm@22@01  $FVF<val>)) a@3@01)))
; [eval] old(elements(a))
; [eval] elements(a)
(set-option :timeout 0)
(push) ; 3
(declare-const i@23@01 Int)
(push) ; 4
; [eval] (i in [0..length(this)))
; [eval] [0..length(this))
; [eval] length(this)
(assert (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i@23@01))
; [eval] loc(this, i)
(pop) ; 4
(declare-fun inv@24@01 ($Ref) Int)
(declare-fun img@25@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@23@01 Int) (i2@23@01 Int)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i1@23@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@11@01  $FVF<val>) (loc<Ref> a@3@01 i1@23@01)) (loc<Ref> a@3@01 i1@23@01)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i2@23@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@11@01  $FVF<val>) (loc<Ref> a@3@01 i2@23@01)) (loc<Ref> a@3@01 i2@23@01)))
      (= (loc<Ref> a@3@01 i1@23@01) (loc<Ref> a@3@01 i2@23@01)))
    (= i1@23@01 i2@23@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@23@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i@23@01)
    (and
      (= (inv@24@01 (loc<Ref> a@3@01 i@23@01)) i@23@01)
      (img@25@01 (loc<Ref> a@3@01 i@23@01))))
  :pattern ((loc<Ref> a@3@01 i@23@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@25@01 r)
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@24@01 r)))
    (= (loc<Ref> a@3@01 (inv@24@01 r)) r))
  :pattern ((inv@24@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@24@01 r))
    ($FVF.loc_val ($FVF.lookup_val (as sm@11@01  $FVF<val>) r) r))
  :pattern ((inv@24@01 r))
  :qid |quant-u-19|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@26@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@24@01 r))
      (img@25@01 r)
      (= r (loc<Ref> a@3@01 (inv@24@01 r))))
    ($Perm.min
      (ite
        (and
          (img@10@01 r)
          (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@9@01 r)))
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
          (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@9@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@26@01 r))
    $Perm.No)
  
  :qid |quant-u-21|))))
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
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@24@01 r))
      (img@25@01 r)
      (= r (loc<Ref> a@3@01 (inv@24@01 r))))
    (= (- $Perm.Write (pTaken@26@01 r)) $Perm.No))
  
  :qid |quant-u-22|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@27@01 $FVF<val>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@27@01  $FVF<val>)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@24@01 r))
        (img@25@01 r)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@24@01 r))
        (img@25@01 r))
      (Set_in r ($FVF.domain_val (as sm@27@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@27@01  $FVF<val>))))
  :qid |qp.fvfDomDef11|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@24@01 r))
        (img@25@01 r))
      (and
        (img@10@01 r)
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@9@01 r))))
    (=
      ($FVF.lookup_val (as sm@27@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r)))
  :pattern (($FVF.lookup_val (as sm@27@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r) r)
  :pattern (($FVF.lookup_val (as sm@27@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef10|)))
(assert (elements%precondition ($SortWrappers.$FVF<val>To$Snap (as sm@27@01  $FVF<val>)) a@3@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((i@23@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i@23@01)
    (and
      (= (inv@24@01 (loc<Ref> a@3@01 i@23@01)) i@23@01)
      (img@25@01 (loc<Ref> a@3@01 i@23@01))))
  :pattern ((loc<Ref> a@3@01 i@23@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@25@01 r)
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@24@01 r)))
    (= (loc<Ref> a@3@01 (inv@24@01 r)) r))
  :pattern ((inv@24@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@27@01  $FVF<val>)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@24@01 r))
        (img@25@01 r)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@24@01 r))
        (img@25@01 r))
      (Set_in r ($FVF.domain_val (as sm@27@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@27@01  $FVF<val>))))
  :qid |qp.fvfDomDef11|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@24@01 r))
        (img@25@01 r))
      (and
        (img@10@01 r)
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@9@01 r))))
    (=
      ($FVF.lookup_val (as sm@27@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r)))
  :pattern (($FVF.lookup_val (as sm@27@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r) r)
  :pattern (($FVF.lookup_val (as sm@27@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef10|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@24@01 r))
      ($FVF.loc_val ($FVF.lookup_val (as sm@11@01  $FVF<val>) r) r))
    :pattern ((inv@24@01 r))
    :qid |quant-u-19|))
  (elements%precondition ($SortWrappers.$FVF<val>To$Snap (as sm@27@01  $FVF<val>)) a@3@01)))
(assert (Set_equal (elements ($SortWrappers.$FVF<val>To$Snap (as sm@22@01  $FVF<val>)) a@3@01) (elements ($SortWrappers.$FVF<val>To$Snap (as sm@27@01  $FVF<val>)) a@3@01)))
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
; [exec]
; inhale (forall j: Int ::
;     { (j in elements(a)) }
;     0 <= j && j < length(a) ==> dummy((j in elements(a))))
(declare-const $t@28@01 $Snap)
(assert (= $t@28@01 $Snap.unit))
; [eval] (forall j: Int :: { (j in elements(a)) } 0 <= j && j < length(a) ==> dummy((j in elements(a))))
(declare-const j@29@01 Int)
(push) ; 3
; [eval] 0 <= j && j < length(a) ==> dummy((j in elements(a)))
; [eval] 0 <= j && j < length(a)
; [eval] 0 <= j
(push) ; 4
; [then-branch: 0 | !(0 <= j@29@01) | live]
; [else-branch: 0 | 0 <= j@29@01 | live]
(push) ; 5
; [then-branch: 0 | !(0 <= j@29@01)]
(assert (not (<= 0 j@29@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 0 | 0 <= j@29@01]
(assert (<= 0 j@29@01))
; [eval] j < length(a)
; [eval] length(a)
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j@29@01) (not (<= 0 j@29@01))))
(push) ; 4
; [then-branch: 1 | 0 <= j@29@01 && j@29@01 < length[Int](a@3@01) | live]
; [else-branch: 1 | !(0 <= j@29@01 && j@29@01 < length[Int](a@3@01)) | live]
(push) ; 5
; [then-branch: 1 | 0 <= j@29@01 && j@29@01 < length[Int](a@3@01)]
(assert (and (<= 0 j@29@01) (< j@29@01 (length<Int> a@3@01))))
; [eval] dummy((j in elements(a)))
; [eval] (j in elements(a))
; [eval] elements(a)
(push) ; 6
(declare-const i@30@01 Int)
(push) ; 7
; [eval] (i in [0..length(this)))
; [eval] [0..length(this))
; [eval] length(this)
(assert (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i@30@01))
; [eval] loc(this, i)
(pop) ; 7
(declare-fun inv@31@01 ($Ref) Int)
(declare-fun img@32@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 7
(assert (not (forall ((i1@30@01 Int) (i2@30@01 Int)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i1@30@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@11@01  $FVF<val>) (loc<Ref> a@3@01 i1@30@01)) (loc<Ref> a@3@01 i1@30@01)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i2@30@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@11@01  $FVF<val>) (loc<Ref> a@3@01 i2@30@01)) (loc<Ref> a@3@01 i2@30@01)))
      (= (loc<Ref> a@3@01 i1@30@01) (loc<Ref> a@3@01 i2@30@01)))
    (= i1@30@01 i2@30@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@30@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i@30@01)
    (and
      (= (inv@31@01 (loc<Ref> a@3@01 i@30@01)) i@30@01)
      (img@32@01 (loc<Ref> a@3@01 i@30@01))))
  :pattern ((loc<Ref> a@3@01 i@30@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@32@01 r)
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@31@01 r)))
    (= (loc<Ref> a@3@01 (inv@31@01 r)) r))
  :pattern ((inv@31@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@31@01 r))
    ($FVF.loc_val ($FVF.lookup_val (as sm@11@01  $FVF<val>) r) r))
  :pattern ((inv@31@01 r))
  :qid |quant-u-24|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@33@01 ((r $Ref) (j@29@01 Int)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@31@01 r))
      (img@32@01 r)
      (= r (loc<Ref> a@3@01 (inv@31@01 r))))
    ($Perm.min
      (ite
        (and
          (img@10@01 r)
          (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@9@01 r)))
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
(push) ; 7
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@10@01 r)
          (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@9@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@33@01 r j@29@01))
    $Perm.No)
  
  :qid |quant-u-26|))))
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
    (and
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@31@01 r))
      (img@32@01 r)
      (= r (loc<Ref> a@3@01 (inv@31@01 r))))
    (= (- $Perm.Write (pTaken@33@01 r j@29@01)) $Perm.No))
  
  :qid |quant-u-27|))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@34@01 $FVF<val>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@34@01  $FVF<val>)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@31@01 r))
        (img@32@01 r)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@31@01 r))
        (img@32@01 r))
      (Set_in r ($FVF.domain_val (as sm@34@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@34@01  $FVF<val>))))
  :qid |qp.fvfDomDef14|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@31@01 r))
        (img@32@01 r))
      (and
        (img@10@01 r)
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@9@01 r))))
    (=
      ($FVF.lookup_val (as sm@34@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r)))
  :pattern (($FVF.lookup_val (as sm@34@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r))
  :qid |qp.fvfValDef12|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r) r)
  :pattern (($FVF.lookup_val (as sm@34@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef13|)))
(assert (elements%precondition ($SortWrappers.$FVF<val>To$Snap (as sm@34@01  $FVF<val>)) a@3@01))
(pop) ; 6
; Joined path conditions
(assert (forall ((i@30@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i@30@01)
    (and
      (= (inv@31@01 (loc<Ref> a@3@01 i@30@01)) i@30@01)
      (img@32@01 (loc<Ref> a@3@01 i@30@01))))
  :pattern ((loc<Ref> a@3@01 i@30@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@32@01 r)
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@31@01 r)))
    (= (loc<Ref> a@3@01 (inv@31@01 r)) r))
  :pattern ((inv@31@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@34@01  $FVF<val>)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@31@01 r))
        (img@32@01 r)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@31@01 r))
        (img@32@01 r))
      (Set_in r ($FVF.domain_val (as sm@34@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@34@01  $FVF<val>))))
  :qid |qp.fvfDomDef14|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@31@01 r))
        (img@32@01 r))
      (and
        (img@10@01 r)
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@9@01 r))))
    (=
      ($FVF.lookup_val (as sm@34@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r)))
  :pattern (($FVF.lookup_val (as sm@34@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r))
  :qid |qp.fvfValDef12|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r) r)
  :pattern (($FVF.lookup_val (as sm@34@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef13|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@31@01 r))
      ($FVF.loc_val ($FVF.lookup_val (as sm@11@01  $FVF<val>) r) r))
    :pattern ((inv@31@01 r))
    :qid |quant-u-24|))
  (elements%precondition ($SortWrappers.$FVF<val>To$Snap (as sm@34@01  $FVF<val>)) a@3@01)))
(pop) ; 5
(set-option :timeout 0)
(push) ; 5
; [else-branch: 1 | !(0 <= j@29@01 && j@29@01 < length[Int](a@3@01))]
(assert (not (and (<= 0 j@29@01) (< j@29@01 (length<Int> a@3@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((i@30@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i@30@01)
    (and
      (= (inv@31@01 (loc<Ref> a@3@01 i@30@01)) i@30@01)
      (img@32@01 (loc<Ref> a@3@01 i@30@01))))
  :pattern ((loc<Ref> a@3@01 i@30@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@32@01 r)
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@31@01 r)))
    (= (loc<Ref> a@3@01 (inv@31@01 r)) r))
  :pattern ((inv@31@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@34@01  $FVF<val>)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@31@01 r))
        (img@32@01 r)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@31@01 r))
        (img@32@01 r))
      (Set_in r ($FVF.domain_val (as sm@34@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@34@01  $FVF<val>))))
  :qid |qp.fvfDomDef14|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@31@01 r))
        (img@32@01 r))
      (and
        (img@10@01 r)
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@9@01 r))))
    (=
      ($FVF.lookup_val (as sm@34@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r)))
  :pattern (($FVF.lookup_val (as sm@34@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r))
  :qid |qp.fvfValDef12|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r) r)
  :pattern (($FVF.lookup_val (as sm@34@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef13|)))
(assert (=>
  (and (<= 0 j@29@01) (< j@29@01 (length<Int> a@3@01)))
  (and
    (<= 0 j@29@01)
    (< j@29@01 (length<Int> a@3@01))
    (forall ((r $Ref)) (!
      (=>
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@31@01 r))
        ($FVF.loc_val ($FVF.lookup_val (as sm@11@01  $FVF<val>) r) r))
      :pattern ((inv@31@01 r))
      :qid |quant-u-24|))
    (elements%precondition ($SortWrappers.$FVF<val>To$Snap (as sm@34@01  $FVF<val>)) a@3@01))))
; Joined path conditions
(assert (or
  (not (and (<= 0 j@29@01) (< j@29@01 (length<Int> a@3@01))))
  (and (<= 0 j@29@01) (< j@29@01 (length<Int> a@3@01)))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((i@30@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i@30@01)
    (and
      (= (inv@31@01 (loc<Ref> a@3@01 i@30@01)) i@30@01)
      (img@32@01 (loc<Ref> a@3@01 i@30@01))))
  :pattern ((loc<Ref> a@3@01 i@30@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@32@01 r)
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@31@01 r)))
    (= (loc<Ref> a@3@01 (inv@31@01 r)) r))
  :pattern ((inv@31@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@34@01  $FVF<val>)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@31@01 r))
        (img@32@01 r)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@31@01 r))
        (img@32@01 r))
      (Set_in r ($FVF.domain_val (as sm@34@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@34@01  $FVF<val>))))
  :qid |qp.fvfDomDef14|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@31@01 r))
        (img@32@01 r))
      (and
        (img@10@01 r)
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@9@01 r))))
    (=
      ($FVF.lookup_val (as sm@34@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r)))
  :pattern (($FVF.lookup_val (as sm@34@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r))
  :qid |qp.fvfValDef12|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r) r)
  :pattern (($FVF.lookup_val (as sm@34@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef13|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@29@01 Int)) (!
  (and
    (or (<= 0 j@29@01) (not (<= 0 j@29@01)))
    (=>
      (and (<= 0 j@29@01) (< j@29@01 (length<Int> a@3@01)))
      (and
        (<= 0 j@29@01)
        (< j@29@01 (length<Int> a@3@01))
        (forall ((r $Ref)) (!
          (=>
            (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@31@01 r))
            ($FVF.loc_val ($FVF.lookup_val (as sm@11@01  $FVF<val>) r) r))
          :pattern ((inv@31@01 r))
          :qid |quant-u-24|))
        (elements%precondition ($SortWrappers.$FVF<val>To$Snap (as sm@34@01  $FVF<val>)) a@3@01)))
    (or
      (not (and (<= 0 j@29@01) (< j@29@01 (length<Int> a@3@01))))
      (and (<= 0 j@29@01) (< j@29@01 (length<Int> a@3@01)))))
  :pattern ((Set_in j@29@01 (elements ($SortWrappers.$FVF<val>To$Snap (as sm@34@01  $FVF<val>)) a@3@01)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0206.vpr@38@12@38@102-aux|)))
(assert (forall ((j@29@01 Int)) (!
  (=>
    (and (<= 0 j@29@01) (< j@29@01 (length<Int> a@3@01)))
    (dummy<Bool> (Set_in j@29@01 (elements ($SortWrappers.$FVF<val>To$Snap (as sm@34@01  $FVF<val>)) a@3@01))))
  :pattern ((Set_in j@29@01 (elements ($SortWrappers.$FVF<val>To$Snap (as sm@34@01  $FVF<val>)) a@3@01)))
  :qid |prog./silicon/silver/src/test/resources/all/issues/carbon/0206.vpr@38@12@38@102|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; loc(a, x).val := -77
; [eval] loc(a, x)
; [eval] -77
; Definitional axioms for snapshot map values
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@11@01  $FVF<val>) (loc<Ref> a@3@01 x@4@01)) (loc<Ref> a@3@01 x@4@01)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@35@01 ((r $Ref)) $Perm
  (ite
    (= r (loc<Ref> a@3@01 x@4@01))
    ($Perm.min
      (ite
        (and
          (img@10@01 r)
          (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@9@01 r)))
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
          (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@9@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@35@01 r))
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
  (= (pTaken@35@01 r) $Perm.No)
  
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
  (=>
    (= r (loc<Ref> a@3@01 x@4@01))
    (= (- $Perm.Write (pTaken@35@01 r)) $Perm.No))
  
  :qid |quant-u-31|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@36@01 $FVF<val>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_val (as sm@36@01  $FVF<val>) (loc<Ref> a@3@01 x@4@01)) (- 0 77)))
(assert ($FVF.loc_val ($FVF.lookup_val (as sm@36@01  $FVF<val>) (loc<Ref> a@3@01 x@4@01)) (loc<Ref> a@3@01 x@4@01)))
(declare-const i@37@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (i in [0..length(a)))
; [eval] [0..length(a))
; [eval] length(a)
(assert (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i@37@01))
; [eval] loc(a, i)
(declare-const sm@38@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@3@01 x@4@01))
    (=
      ($FVF.lookup_val (as sm@38@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@36@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@38@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@36@01  $FVF<val>) r))
  :qid |qp.fvfValDef15|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@10@01 r)
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@9@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@35@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@38@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r)))
  :pattern (($FVF.lookup_val (as sm@38@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r))
  :qid |qp.fvfValDef16|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@36@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r) r))
  :pattern (($FVF.lookup_val (as sm@38@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef17|)))
; [eval] loc(a, i)
(pop) ; 3
(declare-fun inv@39@01 ($Ref) Int)
(declare-fun img@40@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@3@01 x@4@01))
    (=
      ($FVF.lookup_val (as sm@38@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@36@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@38@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@36@01  $FVF<val>) r))
  :qid |qp.fvfValDef15|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@10@01 r)
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@9@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@35@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@38@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r)))
  :pattern (($FVF.lookup_val (as sm@38@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r))
  :qid |qp.fvfValDef16|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@36@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r) r))
  :pattern (($FVF.lookup_val (as sm@38@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef17|)))
; Nested auxiliary terms: non-globals
(declare-const sm@41@01 $FVF<val>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@3@01 x@4@01))
    (=
      ($FVF.lookup_val (as sm@41@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@36@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@41@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@36@01  $FVF<val>) r))
  :qid |qp.fvfValDef18|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@10@01 r)
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@9@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@35@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@41@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r)))
  :pattern (($FVF.lookup_val (as sm@41@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r))
  :qid |qp.fvfValDef19|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@36@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r) r))
  :pattern (($FVF.lookup_val (as sm@41@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef20|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@37@01 Int) (i2@37@01 Int)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i1@37@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@41@01  $FVF<val>) (loc<Ref> a@3@01 i1@37@01)) (loc<Ref> a@3@01 i1@37@01)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i2@37@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@41@01  $FVF<val>) (loc<Ref> a@3@01 i2@37@01)) (loc<Ref> a@3@01 i2@37@01)))
      (= (loc<Ref> a@3@01 i1@37@01) (loc<Ref> a@3@01 i2@37@01)))
    (= i1@37@01 i2@37@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@37@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i@37@01)
    (and
      (= (inv@39@01 (loc<Ref> a@3@01 i@37@01)) i@37@01)
      (img@40@01 (loc<Ref> a@3@01 i@37@01))))
  :pattern (($FVF.loc_val ($FVF.lookup_val (as sm@38@01  $FVF<val>) (loc<Ref> a@3@01 i@37@01)) (loc<Ref> a@3@01 i@37@01)))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@40@01 r)
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@39@01 r)))
    (= (loc<Ref> a@3@01 (inv@39@01 r)) r))
  :pattern ((inv@39@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@39@01 r))
    ($FVF.loc_val ($FVF.lookup_val (as sm@41@01  $FVF<val>) r) r))
  :pattern ((inv@39@01 r))
  :qid |quant-u-33|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@42@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@39@01 r))
      (img@40@01 r)
      (= r (loc<Ref> a@3@01 (inv@39@01 r))))
    ($Perm.min
      (ite
        (and
          (img@10@01 r)
          (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@9@01 r)))
        (- $Perm.Write (pTaken@35@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@43@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@39@01 r))
      (img@40@01 r)
      (= r (loc<Ref> a@3@01 (inv@39@01 r))))
    ($Perm.min
      (ite (= r (loc<Ref> a@3@01 x@4@01)) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@42@01 r)))
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
          (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@9@01 r)))
        (- $Perm.Write (pTaken@35@01 r))
        $Perm.No)
      (pTaken@42@01 r))
    $Perm.No)
  
  :qid |quant-u-35|))))
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
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@39@01 r))
      (img@40@01 r)
      (= r (loc<Ref> a@3@01 (inv@39@01 r))))
    (= (- $Perm.Write (pTaken@42@01 r)) $Perm.No))
  
  :qid |quant-u-36|))))
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
      (= (loc<Ref> a@3@01 x@4@01) (loc<Ref> a@3@01 x@4@01))
      $Perm.Write
      $Perm.No)
    (pTaken@43@01 (loc<Ref> a@3@01 x@4@01)))
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
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@39@01 r))
      (img@40@01 r)
      (= r (loc<Ref> a@3@01 (inv@39@01 r))))
    (= (- (- $Perm.Write (pTaken@42@01 r)) (pTaken@43@01 r)) $Perm.No))
  
  :qid |quant-u-38|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values
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
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@44@01 Int) (i2@44@01 Int)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i1@44@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@41@01  $FVF<val>) (loc<Ref> a@3@01 i1@44@01)) (loc<Ref> a@3@01 i1@44@01)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i2@44@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@41@01  $FVF<val>) (loc<Ref> a@3@01 i2@44@01)) (loc<Ref> a@3@01 i2@44@01)))
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
    ($FVF.loc_val ($FVF.lookup_val (as sm@41@01  $FVF<val>) r) r))
  :pattern ((inv@45@01 r))
  :qid |quant-u-40|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@47@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@45@01 r))
      (img@46@01 r)
      (= r (loc<Ref> a@3@01 (inv@45@01 r))))
    ($Perm.min
      (ite
        (and
          (img@10@01 r)
          (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@9@01 r)))
        (- $Perm.Write (pTaken@35@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@48@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@45@01 r))
      (img@46@01 r)
      (= r (loc<Ref> a@3@01 (inv@45@01 r))))
    ($Perm.min
      (ite (= r (loc<Ref> a@3@01 x@4@01)) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@47@01 r)))
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
          (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@9@01 r)))
        (- $Perm.Write (pTaken@35@01 r))
        $Perm.No)
      (pTaken@47@01 r))
    $Perm.No)
  
  :qid |quant-u-42|))))
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
    (= (- $Perm.Write (pTaken@47@01 r)) $Perm.No))
  
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
      (= (loc<Ref> a@3@01 x@4@01) (loc<Ref> a@3@01 x@4@01))
      $Perm.Write
      $Perm.No)
    (pTaken@48@01 (loc<Ref> a@3@01 x@4@01)))
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
    (= (- (- $Perm.Write (pTaken@47@01 r)) (pTaken@48@01 r)) $Perm.No))
  
  :qid |quant-u-45|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@49@01 $FVF<val>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@49@01  $FVF<val>)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@45@01 r))
        (img@46@01 r)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@45@01 r))
        (img@46@01 r))
      (Set_in r ($FVF.domain_val (as sm@49@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@49@01  $FVF<val>))))
  :qid |qp.fvfDomDef24|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@45@01 r))
        (img@46@01 r))
      (= r (loc<Ref> a@3@01 x@4@01)))
    (=
      ($FVF.lookup_val (as sm@49@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@36@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@49@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@36@01  $FVF<val>) r))
  :qid |qp.fvfValDef21|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@45@01 r))
        (img@46@01 r))
      (ite
        (and
          (img@10@01 r)
          (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@9@01 r)))
        (< $Perm.No (- $Perm.Write (pTaken@35@01 r)))
        false))
    (=
      ($FVF.lookup_val (as sm@49@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r)))
  :pattern (($FVF.lookup_val (as sm@49@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r))
  :qid |qp.fvfValDef22|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@36@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r) r))
  :pattern (($FVF.lookup_val (as sm@49@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef23|)))
(assert (elements%precondition ($SortWrappers.$FVF<val>To$Snap (as sm@49@01  $FVF<val>)) a@3@01))
(pop) ; 3
; Joined path conditions
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
      (Set_in r ($FVF.domain_val (as sm@49@01  $FVF<val>)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@45@01 r))
        (img@46@01 r)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@45@01 r))
        (img@46@01 r))
      (Set_in r ($FVF.domain_val (as sm@49@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@49@01  $FVF<val>))))
  :qid |qp.fvfDomDef24|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@45@01 r))
        (img@46@01 r))
      (= r (loc<Ref> a@3@01 x@4@01)))
    (=
      ($FVF.lookup_val (as sm@49@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@36@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@49@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@36@01  $FVF<val>) r))
  :qid |qp.fvfValDef21|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@45@01 r))
        (img@46@01 r))
      (ite
        (and
          (img@10@01 r)
          (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@9@01 r)))
        (< $Perm.No (- $Perm.Write (pTaken@35@01 r)))
        false))
    (=
      ($FVF.lookup_val (as sm@49@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r)))
  :pattern (($FVF.lookup_val (as sm@49@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r))
  :qid |qp.fvfValDef22|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@36@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r) r))
  :pattern (($FVF.lookup_val (as sm@49@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef23|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@45@01 r))
      ($FVF.loc_val ($FVF.lookup_val (as sm@41@01  $FVF<val>) r) r))
    :pattern ((inv@45@01 r))
    :qid |quant-u-40|))
  (elements%precondition ($SortWrappers.$FVF<val>To$Snap (as sm@49@01  $FVF<val>)) a@3@01)))
; [eval] old(elements(a))
; [eval] elements(a)
(set-option :timeout 0)
(push) ; 3
(declare-const i@50@01 Int)
(push) ; 4
; [eval] (i in [0..length(this)))
; [eval] [0..length(this))
; [eval] length(this)
(assert (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i@50@01))
; [eval] loc(this, i)
(pop) ; 4
(declare-fun inv@51@01 ($Ref) Int)
(declare-fun img@52@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@50@01 Int) (i2@50@01 Int)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i1@50@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@11@01  $FVF<val>) (loc<Ref> a@3@01 i1@50@01)) (loc<Ref> a@3@01 i1@50@01)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i2@50@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@11@01  $FVF<val>) (loc<Ref> a@3@01 i2@50@01)) (loc<Ref> a@3@01 i2@50@01)))
      (= (loc<Ref> a@3@01 i1@50@01) (loc<Ref> a@3@01 i2@50@01)))
    (= i1@50@01 i2@50@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@50@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i@50@01)
    (and
      (= (inv@51@01 (loc<Ref> a@3@01 i@50@01)) i@50@01)
      (img@52@01 (loc<Ref> a@3@01 i@50@01))))
  :pattern ((loc<Ref> a@3@01 i@50@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@52@01 r)
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@51@01 r)))
    (= (loc<Ref> a@3@01 (inv@51@01 r)) r))
  :pattern ((inv@51@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@51@01 r))
    ($FVF.loc_val ($FVF.lookup_val (as sm@11@01  $FVF<val>) r) r))
  :pattern ((inv@51@01 r))
  :qid |quant-u-47|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@53@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@51@01 r))
      (img@52@01 r)
      (= r (loc<Ref> a@3@01 (inv@51@01 r))))
    ($Perm.min
      (ite
        (and
          (img@10@01 r)
          (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@9@01 r)))
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
          (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@9@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@53@01 r))
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
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@51@01 r))
      (img@52@01 r)
      (= r (loc<Ref> a@3@01 (inv@51@01 r))))
    (= (- $Perm.Write (pTaken@53@01 r)) $Perm.No))
  
  :qid |quant-u-50|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@54@01 $FVF<val>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@54@01  $FVF<val>)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@51@01 r))
        (img@52@01 r)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@51@01 r))
        (img@52@01 r))
      (Set_in r ($FVF.domain_val (as sm@54@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@54@01  $FVF<val>))))
  :qid |qp.fvfDomDef27|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@51@01 r))
        (img@52@01 r))
      (and
        (img@10@01 r)
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@9@01 r))))
    (=
      ($FVF.lookup_val (as sm@54@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r)))
  :pattern (($FVF.lookup_val (as sm@54@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r))
  :qid |qp.fvfValDef25|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r) r)
  :pattern (($FVF.lookup_val (as sm@54@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef26|)))
(assert (elements%precondition ($SortWrappers.$FVF<val>To$Snap (as sm@54@01  $FVF<val>)) a@3@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((i@50@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i@50@01)
    (and
      (= (inv@51@01 (loc<Ref> a@3@01 i@50@01)) i@50@01)
      (img@52@01 (loc<Ref> a@3@01 i@50@01))))
  :pattern ((loc<Ref> a@3@01 i@50@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@52@01 r)
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@51@01 r)))
    (= (loc<Ref> a@3@01 (inv@51@01 r)) r))
  :pattern ((inv@51@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@54@01  $FVF<val>)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@51@01 r))
        (img@52@01 r)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@51@01 r))
        (img@52@01 r))
      (Set_in r ($FVF.domain_val (as sm@54@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@54@01  $FVF<val>))))
  :qid |qp.fvfDomDef27|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@51@01 r))
        (img@52@01 r))
      (and
        (img@10@01 r)
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@9@01 r))))
    (=
      ($FVF.lookup_val (as sm@54@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r)))
  :pattern (($FVF.lookup_val (as sm@54@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r))
  :qid |qp.fvfValDef25|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r) r)
  :pattern (($FVF.lookup_val (as sm@54@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef26|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@51@01 r))
      ($FVF.loc_val ($FVF.lookup_val (as sm@11@01  $FVF<val>) r) r))
    :pattern ((inv@51@01 r))
    :qid |quant-u-47|))
  (elements%precondition ($SortWrappers.$FVF<val>To$Snap (as sm@54@01  $FVF<val>)) a@3@01)))
(set-option :timeout 0)
(push) ; 3
(assert (not (Set_equal (elements ($SortWrappers.$FVF<val>To$Snap (as sm@49@01  $FVF<val>)) a@3@01) (elements ($SortWrappers.$FVF<val>To$Snap (as sm@54@01  $FVF<val>)) a@3@01))))
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
; Definitional axioms for snapshot map values
(declare-const pm@55@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@55@01  $FPM) r)
    (+
      (ite (= r (loc<Ref> a@3@01 x@4@01)) $Perm.Write $Perm.No)
      (ite
        (and
          (img@10@01 r)
          (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@9@01 r)))
        (- $Perm.Write (pTaken@35@01 r))
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@55@01  $FPM) r))
  :qid |qp.resPrmSumDef28|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@41@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@36@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r) r))
  :pattern (($FVF.perm_val (as pm@55@01  $FPM) r))
  :qid |qp.resTrgDef29|)))
; Assume upper permission bound for field val
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_val (as pm@55@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_val ($FVF.lookup_val (as sm@41@01  $FVF<val>) r) r))
  :qid |qp-fld-prm-bnd|)))
; [eval] elements(a) == old(elements(a))
; [eval] elements(a)
(set-option :timeout 0)
(push) ; 3
(declare-const i@56@01 Int)
(push) ; 4
; [eval] (i in [0..length(this)))
; [eval] [0..length(this))
; [eval] length(this)
(assert (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i@56@01))
; [eval] loc(this, i)
(pop) ; 4
(declare-fun inv@57@01 ($Ref) Int)
(declare-fun img@58@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(declare-const sm@59@01 $FVF<val>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@10@01 r)
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@9@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@35@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@59@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r)))
  :pattern (($FVF.lookup_val (as sm@59@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r))
  :qid |qp.fvfValDef30|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@3@01 x@4@01))
    (=
      ($FVF.lookup_val (as sm@59@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@36@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@59@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@36@01  $FVF<val>) r))
  :qid |qp.fvfValDef31|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@36@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@59@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef32|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@56@01 Int) (i2@56@01 Int)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i1@56@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@59@01  $FVF<val>) (loc<Ref> a@3@01 i1@56@01)) (loc<Ref> a@3@01 i1@56@01)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i2@56@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@59@01  $FVF<val>) (loc<Ref> a@3@01 i2@56@01)) (loc<Ref> a@3@01 i2@56@01)))
      (= (loc<Ref> a@3@01 i1@56@01) (loc<Ref> a@3@01 i2@56@01)))
    (= i1@56@01 i2@56@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@56@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i@56@01)
    (and
      (= (inv@57@01 (loc<Ref> a@3@01 i@56@01)) i@56@01)
      (img@58@01 (loc<Ref> a@3@01 i@56@01))))
  :pattern ((loc<Ref> a@3@01 i@56@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@58@01 r)
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@57@01 r)))
    (= (loc<Ref> a@3@01 (inv@57@01 r)) r))
  :pattern ((inv@57@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@57@01 r))
    ($FVF.loc_val ($FVF.lookup_val (as sm@59@01  $FVF<val>) r) r))
  :pattern ((inv@57@01 r))
  :qid |quant-u-52|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@60@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@57@01 r))
      (img@58@01 r)
      (= r (loc<Ref> a@3@01 (inv@57@01 r))))
    ($Perm.min
      (ite
        (and
          (img@10@01 r)
          (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@9@01 r)))
        (- $Perm.Write (pTaken@35@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@61@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@57@01 r))
      (img@58@01 r)
      (= r (loc<Ref> a@3@01 (inv@57@01 r))))
    ($Perm.min
      (ite (= r (loc<Ref> a@3@01 x@4@01)) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@60@01 r)))
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
          (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@9@01 r)))
        (- $Perm.Write (pTaken@35@01 r))
        $Perm.No)
      (pTaken@60@01 r))
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
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@57@01 r))
      (img@58@01 r)
      (= r (loc<Ref> a@3@01 (inv@57@01 r))))
    (= (- $Perm.Write (pTaken@60@01 r)) $Perm.No))
  
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
      (= (loc<Ref> a@3@01 x@4@01) (loc<Ref> a@3@01 x@4@01))
      $Perm.Write
      $Perm.No)
    (pTaken@61@01 (loc<Ref> a@3@01 x@4@01)))
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
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@57@01 r))
      (img@58@01 r)
      (= r (loc<Ref> a@3@01 (inv@57@01 r))))
    (= (- (- $Perm.Write (pTaken@60@01 r)) (pTaken@61@01 r)) $Perm.No))
  
  :qid |quant-u-57|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@62@01 $FVF<val>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@62@01  $FVF<val>)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@57@01 r))
        (img@58@01 r)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@57@01 r))
        (img@58@01 r))
      (Set_in r ($FVF.domain_val (as sm@62@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@62@01  $FVF<val>))))
  :qid |qp.fvfDomDef36|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@57@01 r))
        (img@58@01 r))
      (ite
        (and
          (img@10@01 r)
          (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@9@01 r)))
        (< $Perm.No (- $Perm.Write (pTaken@35@01 r)))
        false))
    (=
      ($FVF.lookup_val (as sm@62@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r)))
  :pattern (($FVF.lookup_val (as sm@62@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r))
  :qid |qp.fvfValDef33|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@57@01 r))
        (img@58@01 r))
      (= r (loc<Ref> a@3@01 x@4@01)))
    (=
      ($FVF.lookup_val (as sm@62@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@36@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@62@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@36@01  $FVF<val>) r))
  :qid |qp.fvfValDef34|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@36@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@62@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef35|)))
(assert (elements%precondition ($SortWrappers.$FVF<val>To$Snap (as sm@62@01  $FVF<val>)) a@3@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@10@01 r)
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@9@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@35@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@59@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r)))
  :pattern (($FVF.lookup_val (as sm@59@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r))
  :qid |qp.fvfValDef30|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@3@01 x@4@01))
    (=
      ($FVF.lookup_val (as sm@59@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@36@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@59@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@36@01  $FVF<val>) r))
  :qid |qp.fvfValDef31|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@36@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@59@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef32|)))
(assert (forall ((i@56@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i@56@01)
    (and
      (= (inv@57@01 (loc<Ref> a@3@01 i@56@01)) i@56@01)
      (img@58@01 (loc<Ref> a@3@01 i@56@01))))
  :pattern ((loc<Ref> a@3@01 i@56@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@58@01 r)
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@57@01 r)))
    (= (loc<Ref> a@3@01 (inv@57@01 r)) r))
  :pattern ((inv@57@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@62@01  $FVF<val>)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@57@01 r))
        (img@58@01 r)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@57@01 r))
        (img@58@01 r))
      (Set_in r ($FVF.domain_val (as sm@62@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@62@01  $FVF<val>))))
  :qid |qp.fvfDomDef36|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@57@01 r))
        (img@58@01 r))
      (ite
        (and
          (img@10@01 r)
          (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@9@01 r)))
        (< $Perm.No (- $Perm.Write (pTaken@35@01 r)))
        false))
    (=
      ($FVF.lookup_val (as sm@62@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r)))
  :pattern (($FVF.lookup_val (as sm@62@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r))
  :qid |qp.fvfValDef33|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@57@01 r))
        (img@58@01 r))
      (= r (loc<Ref> a@3@01 x@4@01)))
    (=
      ($FVF.lookup_val (as sm@62@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@36@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@62@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@36@01  $FVF<val>) r))
  :qid |qp.fvfValDef34|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@36@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@62@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef35|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@57@01 r))
      ($FVF.loc_val ($FVF.lookup_val (as sm@59@01  $FVF<val>) r) r))
    :pattern ((inv@57@01 r))
    :qid |quant-u-52|))
  (elements%precondition ($SortWrappers.$FVF<val>To$Snap (as sm@62@01  $FVF<val>)) a@3@01)))
; [eval] old(elements(a))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
(declare-const pm@63@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@63@01  $FPM) r)
    (ite
      (and
        (img@10@01 r)
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@9@01 r)))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_val (as pm@63@01  $FPM) r))
  :qid |qp.resPrmSumDef37|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@11@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r) r))
  :pattern (($FVF.perm_val (as pm@63@01  $FPM) r))
  :qid |qp.resTrgDef38|)))
; Assume upper permission bound for field val
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_val (as pm@63@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_val ($FVF.lookup_val (as sm@11@01  $FVF<val>) r) r))
  :qid |qp-fld-prm-bnd|)))
; [eval] elements(a)
(set-option :timeout 0)
(push) ; 3
(declare-const i@64@01 Int)
(push) ; 4
; [eval] (i in [0..length(this)))
; [eval] [0..length(this))
; [eval] length(this)
(assert (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i@64@01))
; [eval] loc(this, i)
(pop) ; 4
(declare-fun inv@65@01 ($Ref) Int)
(declare-fun img@66@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@64@01 Int) (i2@64@01 Int)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i1@64@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@11@01  $FVF<val>) (loc<Ref> a@3@01 i1@64@01)) (loc<Ref> a@3@01 i1@64@01)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i2@64@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@11@01  $FVF<val>) (loc<Ref> a@3@01 i2@64@01)) (loc<Ref> a@3@01 i2@64@01)))
      (= (loc<Ref> a@3@01 i1@64@01) (loc<Ref> a@3@01 i2@64@01)))
    (= i1@64@01 i2@64@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@64@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i@64@01)
    (and
      (= (inv@65@01 (loc<Ref> a@3@01 i@64@01)) i@64@01)
      (img@66@01 (loc<Ref> a@3@01 i@64@01))))
  :pattern ((loc<Ref> a@3@01 i@64@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@66@01 r)
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@65@01 r)))
    (= (loc<Ref> a@3@01 (inv@65@01 r)) r))
  :pattern ((inv@65@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@65@01 r))
    ($FVF.loc_val ($FVF.lookup_val (as sm@11@01  $FVF<val>) r) r))
  :pattern ((inv@65@01 r))
  :qid |quant-u-59|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@67@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@65@01 r))
      (img@66@01 r)
      (= r (loc<Ref> a@3@01 (inv@65@01 r))))
    ($Perm.min
      (ite
        (and
          (img@10@01 r)
          (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@9@01 r)))
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
          (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@9@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@67@01 r))
    $Perm.No)
  
  :qid |quant-u-61|))))
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
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@65@01 r))
      (img@66@01 r)
      (= r (loc<Ref> a@3@01 (inv@65@01 r))))
    (= (- $Perm.Write (pTaken@67@01 r)) $Perm.No))
  
  :qid |quant-u-62|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@68@01 $FVF<val>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@68@01  $FVF<val>)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@65@01 r))
        (img@66@01 r)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@65@01 r))
        (img@66@01 r))
      (Set_in r ($FVF.domain_val (as sm@68@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@68@01  $FVF<val>))))
  :qid |qp.fvfDomDef41|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@65@01 r))
        (img@66@01 r))
      (and
        (img@10@01 r)
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@9@01 r))))
    (=
      ($FVF.lookup_val (as sm@68@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r)))
  :pattern (($FVF.lookup_val (as sm@68@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r))
  :qid |qp.fvfValDef39|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r) r)
  :pattern (($FVF.lookup_val (as sm@68@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef40|)))
(assert (elements%precondition ($SortWrappers.$FVF<val>To$Snap (as sm@68@01  $FVF<val>)) a@3@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((i@64@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i@64@01)
    (and
      (= (inv@65@01 (loc<Ref> a@3@01 i@64@01)) i@64@01)
      (img@66@01 (loc<Ref> a@3@01 i@64@01))))
  :pattern ((loc<Ref> a@3@01 i@64@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@66@01 r)
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@65@01 r)))
    (= (loc<Ref> a@3@01 (inv@65@01 r)) r))
  :pattern ((inv@65@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@68@01  $FVF<val>)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@65@01 r))
        (img@66@01 r)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@65@01 r))
        (img@66@01 r))
      (Set_in r ($FVF.domain_val (as sm@68@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@68@01  $FVF<val>))))
  :qid |qp.fvfDomDef41|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@65@01 r))
        (img@66@01 r))
      (and
        (img@10@01 r)
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@9@01 r))))
    (=
      ($FVF.lookup_val (as sm@68@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r)))
  :pattern (($FVF.lookup_val (as sm@68@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r))
  :qid |qp.fvfValDef39|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r) r)
  :pattern (($FVF.lookup_val (as sm@68@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef40|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@65@01 r))
      ($FVF.loc_val ($FVF.lookup_val (as sm@11@01  $FVF<val>) r) r))
    :pattern ((inv@65@01 r))
    :qid |quant-u-59|))
  (elements%precondition ($SortWrappers.$FVF<val>To$Snap (as sm@68@01  $FVF<val>)) a@3@01)))
(set-option :timeout 0)
(push) ; 3
(assert (not (Set_equal (elements ($SortWrappers.$FVF<val>To$Snap (as sm@62@01  $FVF<val>)) a@3@01) (elements ($SortWrappers.$FVF<val>To$Snap (as sm@68@01  $FVF<val>)) a@3@01))))
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
; [eval] elements(a) == old(elements(a))
; [eval] elements(a)
(set-option :timeout 0)
(push) ; 3
(declare-const i@69@01 Int)
(push) ; 4
; [eval] (i in [0..length(this)))
; [eval] [0..length(this))
; [eval] length(this)
(assert (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i@69@01))
; [eval] loc(this, i)
(pop) ; 4
(declare-fun inv@70@01 ($Ref) Int)
(declare-fun img@71@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@69@01 Int) (i2@69@01 Int)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i1@69@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@41@01  $FVF<val>) (loc<Ref> a@3@01 i1@69@01)) (loc<Ref> a@3@01 i1@69@01)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i2@69@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@41@01  $FVF<val>) (loc<Ref> a@3@01 i2@69@01)) (loc<Ref> a@3@01 i2@69@01)))
      (= (loc<Ref> a@3@01 i1@69@01) (loc<Ref> a@3@01 i2@69@01)))
    (= i1@69@01 i2@69@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@69@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i@69@01)
    (and
      (= (inv@70@01 (loc<Ref> a@3@01 i@69@01)) i@69@01)
      (img@71@01 (loc<Ref> a@3@01 i@69@01))))
  :pattern ((loc<Ref> a@3@01 i@69@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@71@01 r)
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@70@01 r)))
    (= (loc<Ref> a@3@01 (inv@70@01 r)) r))
  :pattern ((inv@70@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@70@01 r))
    ($FVF.loc_val ($FVF.lookup_val (as sm@41@01  $FVF<val>) r) r))
  :pattern ((inv@70@01 r))
  :qid |quant-u-64|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@72@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@70@01 r))
      (img@71@01 r)
      (= r (loc<Ref> a@3@01 (inv@70@01 r))))
    ($Perm.min
      (ite
        (and
          (img@10@01 r)
          (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@9@01 r)))
        (- $Perm.Write (pTaken@35@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@73@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@70@01 r))
      (img@71@01 r)
      (= r (loc<Ref> a@3@01 (inv@70@01 r))))
    ($Perm.min
      (ite (= r (loc<Ref> a@3@01 x@4@01)) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@72@01 r)))
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
          (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@9@01 r)))
        (- $Perm.Write (pTaken@35@01 r))
        $Perm.No)
      (pTaken@72@01 r))
    $Perm.No)
  
  :qid |quant-u-66|))))
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
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@70@01 r))
      (img@71@01 r)
      (= r (loc<Ref> a@3@01 (inv@70@01 r))))
    (= (- $Perm.Write (pTaken@72@01 r)) $Perm.No))
  
  :qid |quant-u-67|))))
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
    (pTaken@73@01 (loc<Ref> a@3@01 x@4@01)))
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
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@70@01 r))
      (img@71@01 r)
      (= r (loc<Ref> a@3@01 (inv@70@01 r))))
    (= (- (- $Perm.Write (pTaken@72@01 r)) (pTaken@73@01 r)) $Perm.No))
  
  :qid |quant-u-69|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@74@01 $FVF<val>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@74@01  $FVF<val>)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@70@01 r))
        (img@71@01 r)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@70@01 r))
        (img@71@01 r))
      (Set_in r ($FVF.domain_val (as sm@74@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@74@01  $FVF<val>))))
  :qid |qp.fvfDomDef45|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@70@01 r))
        (img@71@01 r))
      (= r (loc<Ref> a@3@01 x@4@01)))
    (=
      ($FVF.lookup_val (as sm@74@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@36@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@74@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@36@01  $FVF<val>) r))
  :qid |qp.fvfValDef42|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@70@01 r))
        (img@71@01 r))
      (ite
        (and
          (img@10@01 r)
          (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@9@01 r)))
        (< $Perm.No (- $Perm.Write (pTaken@35@01 r)))
        false))
    (=
      ($FVF.lookup_val (as sm@74@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r)))
  :pattern (($FVF.lookup_val (as sm@74@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r))
  :qid |qp.fvfValDef43|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@36@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r) r))
  :pattern (($FVF.lookup_val (as sm@74@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef44|)))
(assert (elements%precondition ($SortWrappers.$FVF<val>To$Snap (as sm@74@01  $FVF<val>)) a@3@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((i@69@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i@69@01)
    (and
      (= (inv@70@01 (loc<Ref> a@3@01 i@69@01)) i@69@01)
      (img@71@01 (loc<Ref> a@3@01 i@69@01))))
  :pattern ((loc<Ref> a@3@01 i@69@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@71@01 r)
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@70@01 r)))
    (= (loc<Ref> a@3@01 (inv@70@01 r)) r))
  :pattern ((inv@70@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@74@01  $FVF<val>)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@70@01 r))
        (img@71@01 r)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@70@01 r))
        (img@71@01 r))
      (Set_in r ($FVF.domain_val (as sm@74@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@74@01  $FVF<val>))))
  :qid |qp.fvfDomDef45|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@70@01 r))
        (img@71@01 r))
      (= r (loc<Ref> a@3@01 x@4@01)))
    (=
      ($FVF.lookup_val (as sm@74@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@36@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@74@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@36@01  $FVF<val>) r))
  :qid |qp.fvfValDef42|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@70@01 r))
        (img@71@01 r))
      (ite
        (and
          (img@10@01 r)
          (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@9@01 r)))
        (< $Perm.No (- $Perm.Write (pTaken@35@01 r)))
        false))
    (=
      ($FVF.lookup_val (as sm@74@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r)))
  :pattern (($FVF.lookup_val (as sm@74@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r))
  :qid |qp.fvfValDef43|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@36@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r) r))
  :pattern (($FVF.lookup_val (as sm@74@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef44|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@70@01 r))
      ($FVF.loc_val ($FVF.lookup_val (as sm@41@01  $FVF<val>) r) r))
    :pattern ((inv@70@01 r))
    :qid |quant-u-64|))
  (elements%precondition ($SortWrappers.$FVF<val>To$Snap (as sm@74@01  $FVF<val>)) a@3@01)))
; [eval] old(elements(a))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
(declare-const pm@75@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@75@01  $FPM) r)
    (ite
      (and
        (img@10@01 r)
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@9@01 r)))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_val (as pm@75@01  $FPM) r))
  :qid |qp.resPrmSumDef46|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@11@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r) r))
  :pattern (($FVF.perm_val (as pm@75@01  $FPM) r))
  :qid |qp.resTrgDef47|)))
; Assume upper permission bound for field val
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_val (as pm@75@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_val ($FVF.lookup_val (as sm@11@01  $FVF<val>) r) r))
  :qid |qp-fld-prm-bnd|)))
; [eval] elements(a)
(set-option :timeout 0)
(push) ; 3
(declare-const i@76@01 Int)
(push) ; 4
; [eval] (i in [0..length(this)))
; [eval] [0..length(this))
; [eval] length(this)
(assert (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i@76@01))
; [eval] loc(this, i)
(pop) ; 4
(declare-fun inv@77@01 ($Ref) Int)
(declare-fun img@78@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@76@01 Int) (i2@76@01 Int)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i1@76@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@11@01  $FVF<val>) (loc<Ref> a@3@01 i1@76@01)) (loc<Ref> a@3@01 i1@76@01)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i2@76@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@11@01  $FVF<val>) (loc<Ref> a@3@01 i2@76@01)) (loc<Ref> a@3@01 i2@76@01)))
      (= (loc<Ref> a@3@01 i1@76@01) (loc<Ref> a@3@01 i2@76@01)))
    (= i1@76@01 i2@76@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@76@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i@76@01)
    (and
      (= (inv@77@01 (loc<Ref> a@3@01 i@76@01)) i@76@01)
      (img@78@01 (loc<Ref> a@3@01 i@76@01))))
  :pattern ((loc<Ref> a@3@01 i@76@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@78@01 r)
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@77@01 r)))
    (= (loc<Ref> a@3@01 (inv@77@01 r)) r))
  :pattern ((inv@77@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@77@01 r))
    ($FVF.loc_val ($FVF.lookup_val (as sm@11@01  $FVF<val>) r) r))
  :pattern ((inv@77@01 r))
  :qid |quant-u-71|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@79@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@77@01 r))
      (img@78@01 r)
      (= r (loc<Ref> a@3@01 (inv@77@01 r))))
    ($Perm.min
      (ite
        (and
          (img@10@01 r)
          (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@9@01 r)))
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
          (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@9@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@79@01 r))
    $Perm.No)
  
  :qid |quant-u-73|))))
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
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@77@01 r))
      (img@78@01 r)
      (= r (loc<Ref> a@3@01 (inv@77@01 r))))
    (= (- $Perm.Write (pTaken@79@01 r)) $Perm.No))
  
  :qid |quant-u-74|))))
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
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@77@01 r))
        (img@78@01 r)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@77@01 r))
        (img@78@01 r))
      (Set_in r ($FVF.domain_val (as sm@80@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@80@01  $FVF<val>))))
  :qid |qp.fvfDomDef50|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@77@01 r))
        (img@78@01 r))
      (and
        (img@10@01 r)
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@9@01 r))))
    (=
      ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r)))
  :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r))
  :qid |qp.fvfValDef48|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r) r)
  :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef49|)))
(assert (elements%precondition ($SortWrappers.$FVF<val>To$Snap (as sm@80@01  $FVF<val>)) a@3@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((i@76@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i@76@01)
    (and
      (= (inv@77@01 (loc<Ref> a@3@01 i@76@01)) i@76@01)
      (img@78@01 (loc<Ref> a@3@01 i@76@01))))
  :pattern ((loc<Ref> a@3@01 i@76@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@78@01 r)
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@77@01 r)))
    (= (loc<Ref> a@3@01 (inv@77@01 r)) r))
  :pattern ((inv@77@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@80@01  $FVF<val>)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@77@01 r))
        (img@78@01 r)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@77@01 r))
        (img@78@01 r))
      (Set_in r ($FVF.domain_val (as sm@80@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@80@01  $FVF<val>))))
  :qid |qp.fvfDomDef50|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@77@01 r))
        (img@78@01 r))
      (and
        (img@10@01 r)
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@9@01 r))))
    (=
      ($FVF.lookup_val (as sm@80@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r)))
  :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r))
  :qid |qp.fvfValDef48|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r) r)
  :pattern (($FVF.lookup_val (as sm@80@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef49|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@77@01 r))
      ($FVF.loc_val ($FVF.lookup_val (as sm@11@01  $FVF<val>) r) r))
    :pattern ((inv@77@01 r))
    :qid |quant-u-71|))
  (elements%precondition ($SortWrappers.$FVF<val>To$Snap (as sm@80@01  $FVF<val>)) a@3@01)))
(set-option :timeout 0)
(push) ; 3
(assert (not (Set_equal (elements ($SortWrappers.$FVF<val>To$Snap (as sm@74@01  $FVF<val>)) a@3@01) (elements ($SortWrappers.$FVF<val>To$Snap (as sm@80@01  $FVF<val>)) a@3@01))))
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
; Definitional axioms for snapshot map values
(declare-const pm@81@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@81@01  $FPM) r)
    (+
      (ite (= r (loc<Ref> a@3@01 x@4@01)) $Perm.Write $Perm.No)
      (ite
        (and
          (img@10@01 r)
          (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@9@01 r)))
        (- $Perm.Write (pTaken@35@01 r))
        $Perm.No)))
  :pattern (($FVF.perm_val (as pm@81@01  $FPM) r))
  :qid |qp.resPrmSumDef51|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@41@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@36@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r) r))
  :pattern (($FVF.perm_val (as pm@81@01  $FPM) r))
  :qid |qp.resTrgDef52|)))
; Assume upper permission bound for field val
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_val (as pm@81@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_val ($FVF.lookup_val (as sm@41@01  $FVF<val>) r) r))
  :qid |qp-fld-prm-bnd|)))
; [eval] elements(a) == old(elements(a))
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
(declare-const sm@85@01 $FVF<val>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@10@01 r)
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@9@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@35@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@85@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r)))
  :pattern (($FVF.lookup_val (as sm@85@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r))
  :qid |qp.fvfValDef53|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@3@01 x@4@01))
    (=
      ($FVF.lookup_val (as sm@85@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@36@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@85@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@36@01  $FVF<val>) r))
  :qid |qp.fvfValDef54|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@36@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@85@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef55|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@82@01 Int) (i2@82@01 Int)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i1@82@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@85@01  $FVF<val>) (loc<Ref> a@3@01 i1@82@01)) (loc<Ref> a@3@01 i1@82@01)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i2@82@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@85@01  $FVF<val>) (loc<Ref> a@3@01 i2@82@01)) (loc<Ref> a@3@01 i2@82@01)))
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
    ($FVF.loc_val ($FVF.lookup_val (as sm@85@01  $FVF<val>) r) r))
  :pattern ((inv@83@01 r))
  :qid |quant-u-76|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@86@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@83@01 r))
      (img@84@01 r)
      (= r (loc<Ref> a@3@01 (inv@83@01 r))))
    ($Perm.min
      (ite
        (and
          (img@10@01 r)
          (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@9@01 r)))
        (- $Perm.Write (pTaken@35@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@87@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@83@01 r))
      (img@84@01 r)
      (= r (loc<Ref> a@3@01 (inv@83@01 r))))
    ($Perm.min
      (ite (= r (loc<Ref> a@3@01 x@4@01)) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@86@01 r)))
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
          (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@9@01 r)))
        (- $Perm.Write (pTaken@35@01 r))
        $Perm.No)
      (pTaken@86@01 r))
    $Perm.No)
  
  :qid |quant-u-78|))))
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
    (= (- $Perm.Write (pTaken@86@01 r)) $Perm.No))
  
  :qid |quant-u-79|))))
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
    (pTaken@87@01 (loc<Ref> a@3@01 x@4@01)))
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
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@83@01 r))
      (img@84@01 r)
      (= r (loc<Ref> a@3@01 (inv@83@01 r))))
    (= (- (- $Perm.Write (pTaken@86@01 r)) (pTaken@87@01 r)) $Perm.No))
  
  :qid |quant-u-81|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@88@01 $FVF<val>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@88@01  $FVF<val>)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@83@01 r))
        (img@84@01 r)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@83@01 r))
        (img@84@01 r))
      (Set_in r ($FVF.domain_val (as sm@88@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@88@01  $FVF<val>))))
  :qid |qp.fvfDomDef59|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@83@01 r))
        (img@84@01 r))
      (ite
        (and
          (img@10@01 r)
          (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@9@01 r)))
        (< $Perm.No (- $Perm.Write (pTaken@35@01 r)))
        false))
    (=
      ($FVF.lookup_val (as sm@88@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r)))
  :pattern (($FVF.lookup_val (as sm@88@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r))
  :qid |qp.fvfValDef56|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@83@01 r))
        (img@84@01 r))
      (= r (loc<Ref> a@3@01 x@4@01)))
    (=
      ($FVF.lookup_val (as sm@88@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@36@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@88@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@36@01  $FVF<val>) r))
  :qid |qp.fvfValDef57|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@36@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@88@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef58|)))
(assert (elements%precondition ($SortWrappers.$FVF<val>To$Snap (as sm@88@01  $FVF<val>)) a@3@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@10@01 r)
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@9@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@35@01 r)))
      false)
    (=
      ($FVF.lookup_val (as sm@85@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r)))
  :pattern (($FVF.lookup_val (as sm@85@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r))
  :qid |qp.fvfValDef53|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (loc<Ref> a@3@01 x@4@01))
    (=
      ($FVF.lookup_val (as sm@85@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@36@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@85@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@36@01  $FVF<val>) r))
  :qid |qp.fvfValDef54|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@36@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@85@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef55|)))
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
      (Set_in r ($FVF.domain_val (as sm@88@01  $FVF<val>)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@83@01 r))
        (img@84@01 r)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@83@01 r))
        (img@84@01 r))
      (Set_in r ($FVF.domain_val (as sm@88@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@88@01  $FVF<val>))))
  :qid |qp.fvfDomDef59|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@83@01 r))
        (img@84@01 r))
      (ite
        (and
          (img@10@01 r)
          (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@9@01 r)))
        (< $Perm.No (- $Perm.Write (pTaken@35@01 r)))
        false))
    (=
      ($FVF.lookup_val (as sm@88@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r)))
  :pattern (($FVF.lookup_val (as sm@88@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r))
  :qid |qp.fvfValDef56|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@83@01 r))
        (img@84@01 r))
      (= r (loc<Ref> a@3@01 x@4@01)))
    (=
      ($FVF.lookup_val (as sm@88@01  $FVF<val>) r)
      ($FVF.lookup_val (as sm@36@01  $FVF<val>) r)))
  :pattern (($FVF.lookup_val (as sm@88@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val (as sm@36@01  $FVF<val>) r))
  :qid |qp.fvfValDef57|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r) r)
    ($FVF.loc_val ($FVF.lookup_val (as sm@36@01  $FVF<val>) r) r))
  :pattern (($FVF.lookup_val (as sm@88@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef58|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@83@01 r))
      ($FVF.loc_val ($FVF.lookup_val (as sm@85@01  $FVF<val>) r) r))
    :pattern ((inv@83@01 r))
    :qid |quant-u-76|))
  (elements%precondition ($SortWrappers.$FVF<val>To$Snap (as sm@88@01  $FVF<val>)) a@3@01)))
; [eval] old(elements(a))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
(declare-const pm@89@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_val (as pm@89@01  $FPM) r)
    (ite
      (and
        (img@10@01 r)
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@9@01 r)))
      $Perm.Write
      $Perm.No))
  :pattern (($FVF.perm_val (as pm@89@01  $FPM) r))
  :qid |qp.resPrmSumDef60|)))
(assert (forall ((r $Ref)) (!
  (and
    ($FVF.loc_val ($FVF.lookup_val (as sm@11@01  $FVF<val>) r) r)
    ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r) r))
  :pattern (($FVF.perm_val (as pm@89@01  $FPM) r))
  :qid |qp.resTrgDef61|)))
; Assume upper permission bound for field val
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_val (as pm@89@01  $FPM) r) $Perm.Write)
  :pattern (($FVF.loc_val ($FVF.lookup_val (as sm@11@01  $FVF<val>) r) r))
  :qid |qp-fld-prm-bnd|)))
; [eval] elements(a)
(set-option :timeout 0)
(push) ; 3
(declare-const i@90@01 Int)
(push) ; 4
; [eval] (i in [0..length(this)))
; [eval] [0..length(this))
; [eval] length(this)
(assert (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i@90@01))
; [eval] loc(this, i)
(pop) ; 4
(declare-fun inv@91@01 ($Ref) Int)
(declare-fun img@92@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@90@01 Int) (i2@90@01 Int)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i1@90@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@11@01  $FVF<val>) (loc<Ref> a@3@01 i1@90@01)) (loc<Ref> a@3@01 i1@90@01)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i2@90@01)
        ($FVF.loc_val ($FVF.lookup_val (as sm@11@01  $FVF<val>) (loc<Ref> a@3@01 i2@90@01)) (loc<Ref> a@3@01 i2@90@01)))
      (= (loc<Ref> a@3@01 i1@90@01) (loc<Ref> a@3@01 i2@90@01)))
    (= i1@90@01 i2@90@01))
  
  :qid |val-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@90@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i@90@01)
    (and
      (= (inv@91@01 (loc<Ref> a@3@01 i@90@01)) i@90@01)
      (img@92@01 (loc<Ref> a@3@01 i@90@01))))
  :pattern ((loc<Ref> a@3@01 i@90@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@92@01 r)
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@91@01 r)))
    (= (loc<Ref> a@3@01 (inv@91@01 r)) r))
  :pattern ((inv@91@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@91@01 r))
    ($FVF.loc_val ($FVF.lookup_val (as sm@11@01  $FVF<val>) r) r))
  :pattern ((inv@91@01 r))
  :qid |quant-u-83|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@93@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@91@01 r))
      (img@92@01 r)
      (= r (loc<Ref> a@3@01 (inv@91@01 r))))
    ($Perm.min
      (ite
        (and
          (img@10@01 r)
          (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@9@01 r)))
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
          (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@9@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@93@01 r))
    $Perm.No)
  
  :qid |quant-u-85|))))
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
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@91@01 r))
      (img@92@01 r)
      (= r (loc<Ref> a@3@01 (inv@91@01 r))))
    (= (- $Perm.Write (pTaken@93@01 r)) $Perm.No))
  
  :qid |quant-u-86|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@94@01 $FVF<val>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@94@01  $FVF<val>)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@91@01 r))
        (img@92@01 r)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@91@01 r))
        (img@92@01 r))
      (Set_in r ($FVF.domain_val (as sm@94@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@94@01  $FVF<val>))))
  :qid |qp.fvfDomDef64|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@91@01 r))
        (img@92@01 r))
      (and
        (img@10@01 r)
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@9@01 r))))
    (=
      ($FVF.lookup_val (as sm@94@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r)))
  :pattern (($FVF.lookup_val (as sm@94@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r))
  :qid |qp.fvfValDef62|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r) r)
  :pattern (($FVF.lookup_val (as sm@94@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef63|)))
(assert (elements%precondition ($SortWrappers.$FVF<val>To$Snap (as sm@94@01  $FVF<val>)) a@3@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((i@90@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (length<Int> a@3@01)) i@90@01)
    (and
      (= (inv@91@01 (loc<Ref> a@3@01 i@90@01)) i@90@01)
      (img@92@01 (loc<Ref> a@3@01 i@90@01))))
  :pattern ((loc<Ref> a@3@01 i@90@01))
  :qid |val-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@92@01 r)
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@91@01 r)))
    (= (loc<Ref> a@3@01 (inv@91@01 r)) r))
  :pattern ((inv@91@01 r))
  :qid |val-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_val (as sm@94@01  $FVF<val>)))
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@91@01 r))
        (img@92@01 r)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@91@01 r))
        (img@92@01 r))
      (Set_in r ($FVF.domain_val (as sm@94@01  $FVF<val>)))))
  :pattern ((Set_in r ($FVF.domain_val (as sm@94@01  $FVF<val>))))
  :qid |qp.fvfDomDef64|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@91@01 r))
        (img@92@01 r))
      (and
        (img@10@01 r)
        (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@9@01 r))))
    (=
      ($FVF.lookup_val (as sm@94@01  $FVF<val>) r)
      ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r)))
  :pattern (($FVF.lookup_val (as sm@94@01  $FVF<val>) r))
  :pattern (($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r))
  :qid |qp.fvfValDef62|)))
(assert (forall ((r $Ref)) (!
  ($FVF.loc_val ($FVF.lookup_val ($SortWrappers.$SnapTo$FVF<val> ($Snap.first $t@6@01)) r) r)
  :pattern (($FVF.lookup_val (as sm@94@01  $FVF<val>) r))
  :qid |qp.fvfResTrgDef63|)))
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (Seq_contains (Seq_range 0 (length<Int> a@3@01)) (inv@91@01 r))
      ($FVF.loc_val ($FVF.lookup_val (as sm@11@01  $FVF<val>) r) r))
    :pattern ((inv@91@01 r))
    :qid |quant-u-83|))
  (elements%precondition ($SortWrappers.$FVF<val>To$Snap (as sm@94@01  $FVF<val>)) a@3@01)))
(set-option :timeout 0)
(push) ; 3
(assert (not (Set_equal (elements ($SortWrappers.$FVF<val>To$Snap (as sm@88@01  $FVF<val>)) a@3@01) (elements ($SortWrappers.$FVF<val>To$Snap (as sm@94@01  $FVF<val>)) a@3@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,01s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
