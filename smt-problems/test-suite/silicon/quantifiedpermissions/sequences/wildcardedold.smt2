(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:19:58
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/quantifiedpermissions/sequences/wildcardedold.vpr
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
(declare-sort $FVF<f> 0)
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
; /field_value_functions_declarations.smt2 [f: Int]
(declare-fun $FVF.domain_f ($FVF<f>) Set<$Ref>)
(declare-fun $FVF.lookup_f ($FVF<f> $Ref) Int)
(declare-fun $FVF.after_f ($FVF<f> $FVF<f>) Bool)
(declare-fun $FVF.loc_f (Int $Ref) Bool)
(declare-fun $FVF.perm_f ($FPM $Ref) $Perm)
(declare-const $fvfTOP_f $FVF<f>)
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
; ---------- m ----------
(declare-const a@0@01 $Ref)
(declare-const a@1@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $k@2@01 $Perm)
(assert ($Perm.isReadVar $k@2@01))
(declare-const $t@3@01 Int)
(assert (<= $Perm.No $k@2@01))
(assert (<= $k@2@01 $Perm.Write))
(assert (=> (< $Perm.No $k@2@01) (not (= a@1@01 $Ref.null))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $k@4@01 $Perm)
(assert ($Perm.isReadVar $k@4@01))
(declare-const $t@5@01 Int)
(assert (<= $Perm.No $k@4@01))
(assert (<= $k@4@01 $Perm.Write))
(assert (=> (< $Perm.No $k@4@01) (not (= a@1@01 $Ref.null))))
(pop) ; 2
(push) ; 2
; [exec]
; m(a)
(declare-const $k@6@01 $Perm)
(assert ($Perm.isReadVar $k@6@01))
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= $k@2@01 $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< $k@6@01 $k@2@01))
(assert (<= $Perm.No (- $k@2@01 $k@6@01)))
(assert (<= (- $k@2@01 $k@6@01) $Perm.Write))
(assert (=> (< $Perm.No (- $k@2@01 $k@6@01)) (not (= a@1@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@6@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const $k@7@01 $Perm)
(assert ($Perm.isReadVar $k@7@01))
(declare-const $t@8@01 Int)
(declare-const $t@9@01 Int)
(assert (and
  (=> (< $Perm.No (- $k@2@01 $k@6@01)) (= $t@9@01 $t@3@01))
  (=> (< $Perm.No $k@7@01) (= $t@9@01 $t@8@01))))
(assert (<= $Perm.No (+ (- $k@2@01 $k@6@01) $k@7@01)))
(assert (<= (+ (- $k@2@01 $k@6@01) $k@7@01) $Perm.Write))
(assert (=> (< $Perm.No (+ (- $k@2@01 $k@6@01) $k@7@01)) (not (= a@1@01 $Ref.null))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; assert a.f == old(a.f)
; [eval] a.f == old(a.f)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No (+ (- $k@2@01 $k@6@01) $k@7@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] old(a.f)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@2@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(assert (not (= $t@9@01 $t@3@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= $t@9@01 $t@3@01))
(declare-const $k@10@01 $Perm)
(assert ($Perm.isReadVar $k@10@01))
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= (+ (- $k@2@01 $k@6@01) $k@7@01) $Perm.No))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< $k@10@01 (+ (- $k@2@01 $k@6@01) $k@7@01)))
(assert (<= $Perm.No (- (+ (- $k@2@01 $k@6@01) $k@7@01) $k@10@01)))
(assert (<= (- (+ (- $k@2@01 $k@6@01) $k@7@01) $k@10@01) $Perm.Write))
(assert (=>
  (< $Perm.No (- (+ (- $k@2@01 $k@6@01) $k@7@01) $k@10@01))
  (not (= a@1@01 $Ref.null))))
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< $Perm.No $k@10@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- m2 ----------
(declare-const a@11@01 $Ref)
(declare-const a@12@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@13@01 Int)
(assert (not (= a@12@01 $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@14@01 Int)
(pop) ; 2
(push) ; 2
; [exec]
; m2(a)
(declare-const $t@15@01 Int)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; assert a.f == old(a.f)
; [eval] a.f == old(a.f)
; [eval] old(a.f)
(set-option :timeout 0)
(push) ; 3
(assert (not (= $t@15@01 $t@13@01)))
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
; [eval] a.f == old(a.f)
; [eval] old(a.f)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
(assert (not (= $t@15@01 $t@13@01)))
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
; [eval] a.f == old(a.f)
; [eval] old(a.f)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
(assert (not (= $t@15@01 $t@13@01)))
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
; [eval] a.f == old(a.f)
; [eval] old(a.f)
; [state consolidation]
; State saturation: before repetition
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
(assert (not (= $t@15@01 $t@13@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- m3 ----------
(declare-const a@16@01 Seq<$Ref>)
(declare-const a@17@01 Seq<$Ref>)
(push) ; 1
(declare-const $t@18@01 $Snap)
(assert (= $t@18@01 ($Snap.combine ($Snap.first $t@18@01) ($Snap.second $t@18@01))))
(assert (= ($Snap.first $t@18@01) $Snap.unit))
; [eval] (forall i1: Int, i2: Int :: { (i1 in [0..|a|)), (i2 in [0..|a|)) } { (i1 in [0..|a|)), a[i2] } { (i2 in [0..|a|)), a[i1] } { a[i1], a[i2] } (i1 in [0..|a|)) && ((i2 in [0..|a|)) && i1 != i2) ==> a[i1] != a[i2])
(declare-const i1@19@01 Int)
(declare-const i2@20@01 Int)
(push) ; 2
; [eval] (i1 in [0..|a|)) && ((i2 in [0..|a|)) && i1 != i2) ==> a[i1] != a[i2]
; [eval] (i1 in [0..|a|)) && ((i2 in [0..|a|)) && i1 != i2)
; [eval] (i1 in [0..|a|))
; [eval] [0..|a|)
; [eval] |a|
(push) ; 3
; [then-branch: 0 | !(i1@19@01 in [0..|a@17@01|]) | live]
; [else-branch: 0 | i1@19@01 in [0..|a@17@01|] | live]
(push) ; 4
; [then-branch: 0 | !(i1@19@01 in [0..|a@17@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@19@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | i1@19@01 in [0..|a@17@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@19@01))
; [eval] (i2 in [0..|a|))
; [eval] [0..|a|)
; [eval] |a|
(push) ; 5
; [then-branch: 1 | !(i2@20@01 in [0..|a@17@01|]) | live]
; [else-branch: 1 | i2@20@01 in [0..|a@17@01|] | live]
(push) ; 6
; [then-branch: 1 | !(i2@20@01 in [0..|a@17@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@20@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 1 | i2@20@01 in [0..|a@17@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@20@01))
; [eval] i1 != i2
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@20@01)
  (not (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@20@01))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@19@01)
  (and
    (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@19@01)
    (or
      (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@20@01)
      (not (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@20@01))))))
(assert (or
  (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@19@01)
  (not (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@19@01))))
(push) ; 3
; [then-branch: 2 | i1@19@01 in [0..|a@17@01|] && i2@20@01 in [0..|a@17@01|] && i1@19@01 != i2@20@01 | live]
; [else-branch: 2 | !(i1@19@01 in [0..|a@17@01|] && i2@20@01 in [0..|a@17@01|] && i1@19@01 != i2@20@01) | live]
(push) ; 4
; [then-branch: 2 | i1@19@01 in [0..|a@17@01|] && i2@20@01 in [0..|a@17@01|] && i1@19@01 != i2@20@01]
(assert (and
  (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@19@01)
  (and
    (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@20@01)
    (not (= i1@19@01 i2@20@01)))))
; [eval] a[i1] != a[i2]
; [eval] a[i1]
(push) ; 5
(assert (not (>= i1@19@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i1@19@01 (Seq_length a@17@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] a[i2]
(push) ; 5
(assert (not (>= i2@20@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i2@20@01 (Seq_length a@17@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 2 | !(i1@19@01 in [0..|a@17@01|] && i2@20@01 in [0..|a@17@01|] && i1@19@01 != i2@20@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@19@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@20@01)
      (not (= i1@19@01 i2@20@01))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@19@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@20@01)
      (not (= i1@19@01 i2@20@01))))
  (and
    (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@19@01)
    (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@20@01)
    (not (= i1@19@01 i2@20@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@19@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@20@01)
        (not (= i1@19@01 i2@20@01)))))
  (and
    (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@19@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@20@01)
      (not (= i1@19@01 i2@20@01))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i1@19@01 Int) (i2@20@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@19@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@19@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@20@01)
          (not (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@20@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@19@01)
      (not (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@19@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@19@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@20@01)
          (not (= i1@19@01 i2@20@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@19@01)
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@20@01)
        (not (= i1@19@01 i2@20@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@19@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@20@01)
            (not (= i1@19@01 i2@20@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@19@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@20@01)
          (not (= i1@19@01 i2@20@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@19@01) (Seq_contains
    (Seq_range 0 (Seq_length a@17@01))
    i2@20@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length a@17@01)) i1@19@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length a@17@01))
    i2@20@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/wildcardedold.vpr@24@12@24@102-aux|)))
(assert (forall ((i1@19@01 Int) (i2@20@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@19@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@19@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@20@01)
          (not (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@20@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@19@01)
      (not (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@19@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@19@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@20@01)
          (not (= i1@19@01 i2@20@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@19@01)
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@20@01)
        (not (= i1@19@01 i2@20@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@19@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@20@01)
            (not (= i1@19@01 i2@20@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@19@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@20@01)
          (not (= i1@19@01 i2@20@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length a@17@01)) i1@19@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length a@17@01))
    i2@20@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/wildcardedold.vpr@24@12@24@102-aux|)))
(assert (forall ((i1@19@01 Int) (i2@20@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@19@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@19@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@20@01)
          (not (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@20@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@19@01)
      (not (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@19@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@19@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@20@01)
          (not (= i1@19@01 i2@20@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@19@01)
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@20@01)
        (not (= i1@19@01 i2@20@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@19@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@20@01)
            (not (= i1@19@01 i2@20@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@19@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@20@01)
          (not (= i1@19@01 i2@20@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@19@01) (Seq_index
    a@17@01
    i2@20@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length a@17@01)) i1@19@01) (Seq_index
    a@17@01
    i2@20@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/wildcardedold.vpr@24@12@24@102-aux|)))
(assert (forall ((i1@19@01 Int) (i2@20@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@19@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@19@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@20@01)
          (not (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@20@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@19@01)
      (not (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@19@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@19@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@20@01)
          (not (= i1@19@01 i2@20@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@19@01)
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@20@01)
        (not (= i1@19@01 i2@20@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@19@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@20@01)
            (not (= i1@19@01 i2@20@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@19@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@20@01)
          (not (= i1@19@01 i2@20@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length a@17@01)) i1@19@01) (Seq_index
    a@17@01
    i2@20@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/wildcardedold.vpr@24@12@24@102-aux|)))
(assert (forall ((i1@19@01 Int) (i2@20@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@19@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@19@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@20@01)
          (not (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@20@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@19@01)
      (not (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@19@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@19@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@20@01)
          (not (= i1@19@01 i2@20@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@19@01)
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@20@01)
        (not (= i1@19@01 i2@20@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@19@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@20@01)
            (not (= i1@19@01 i2@20@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@19@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@20@01)
          (not (= i1@19@01 i2@20@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@20@01) (Seq_index
    a@17@01
    i1@19@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length a@17@01)) i2@20@01) (Seq_index
    a@17@01
    i1@19@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/wildcardedold.vpr@24@12@24@102-aux|)))
(assert (forall ((i1@19@01 Int) (i2@20@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@19@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@19@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@20@01)
          (not (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@20@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@19@01)
      (not (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@19@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@19@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@20@01)
          (not (= i1@19@01 i2@20@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@19@01)
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@20@01)
        (not (= i1@19@01 i2@20@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@19@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@20@01)
            (not (= i1@19@01 i2@20@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@19@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@20@01)
          (not (= i1@19@01 i2@20@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length a@17@01)) i2@20@01) (Seq_index
    a@17@01
    i1@19@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/wildcardedold.vpr@24@12@24@102-aux|)))
(assert (forall ((i1@19@01 Int) (i2@20@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@19@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@19@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@20@01)
          (not (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@20@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@19@01)
      (not (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@19@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@19@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@20@01)
          (not (= i1@19@01 i2@20@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@19@01)
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@20@01)
        (not (= i1@19@01 i2@20@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@19@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@20@01)
            (not (= i1@19@01 i2@20@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@19@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@20@01)
          (not (= i1@19@01 i2@20@01))))))
  :pattern ((Seq_index a@17@01 i1@19@01) (Seq_index a@17@01 i2@20@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/wildcardedold.vpr@24@12@24@102-aux|)))
(assert (forall ((i1@19@01 Int) (i2@20@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@19@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@20@01)
        (not (= i1@19@01 i2@20@01))))
    (not (= (Seq_index a@17@01 i1@19@01) (Seq_index a@17@01 i2@20@01))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@19@01) (Seq_contains
    (Seq_range 0 (Seq_length a@17@01))
    i2@20@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length a@17@01)) i1@19@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length a@17@01))
    i2@20@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@19@01) (Seq_index
    a@17@01
    i2@20@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length a@17@01)) i1@19@01) (Seq_index
    a@17@01
    i2@20@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@20@01) (Seq_index
    a@17@01
    i1@19@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length a@17@01)) i2@20@01) (Seq_index
    a@17@01
    i1@19@01))
  :pattern ((Seq_index a@17@01 i1@19@01) (Seq_index a@17@01 i2@20@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/wildcardedold.vpr@24@12@24@102|)))
(declare-const i@21@01 Int)
(push) ; 2
; [eval] (i in [0..|a|))
; [eval] [0..|a|)
; [eval] |a|
(assert (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i@21@01))
; [eval] a[i]
(push) ; 3
(assert (not (>= i@21@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@21@01 (Seq_length a@17@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const $k@22@01 $Perm)
(assert ($Perm.isReadVar $k@22@01))
(pop) ; 2
(declare-fun inv@23@01 ($Ref) Int)
(declare-fun img@24@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@22@01))
; Nested auxiliary terms: non-globals
(push) ; 2
(assert (not (forall ((i@21@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i@21@01)
    (or (= $k@22@01 $Perm.No) (< $Perm.No $k@22@01)))
  
  :qid |quant-u-0|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@21@01 Int) (i2@21@01 Int)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@21@01)
        (< $Perm.No $k@22@01))
      (and
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@21@01)
        (< $Perm.No $k@22@01))
      (= (Seq_index a@17@01 i1@21@01) (Seq_index a@17@01 i2@21@01)))
    (= i1@21@01 i2@21@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@21@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i@21@01)
      (< $Perm.No $k@22@01))
    (and
      (= (inv@23@01 (Seq_index a@17@01 i@21@01)) i@21@01)
      (img@24@01 (Seq_index a@17@01 i@21@01))))
  :pattern ((Seq_index a@17@01 i@21@01))
  :qid |quant-u-1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@24@01 r)
      (and
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) (inv@23@01 r))
        (< $Perm.No $k@22@01)))
    (= (Seq_index a@17@01 (inv@23@01 r)) r))
  :pattern ((inv@23@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((i@21@01 Int)) (!
  (<= $Perm.No $k@22@01)
  :pattern ((Seq_index a@17@01 i@21@01))
  :qid |f-permAtLeastZero|)))
; Field permissions are at most one
(assert (forall ((i@21@01 Int)) (!
  (<= $k@22@01 $Perm.Write)
  :pattern ((Seq_index a@17@01 i@21@01))
  :qid |f-permAtMostOne|)))
; Permission implies non-null receiver
(assert (forall ((i@21@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i@21@01)
      (< $Perm.No $k@22@01))
    (not (= (Seq_index a@17@01 i@21@01) $Ref.null)))
  :pattern ((Seq_index a@17@01 i@21@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@25@01 $Snap)
(assert (= $t@25@01 ($Snap.combine ($Snap.first $t@25@01) ($Snap.second $t@25@01))))
(declare-const j@26@01 Int)
(push) ; 3
; [eval] (j in [0..|a|))
; [eval] [0..|a|)
; [eval] |a|
(assert (Seq_contains (Seq_range 0 (Seq_length a@17@01)) j@26@01))
; [eval] a[j]
(push) ; 4
(assert (not (>= j@26@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< j@26@01 (Seq_length a@17@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(declare-const $k@27@01 $Perm)
(assert ($Perm.isReadVar $k@27@01))
(pop) ; 3
(declare-fun inv@28@01 ($Ref) Int)
(declare-fun img@29@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@27@01))
; Nested auxiliary terms: non-globals
(push) ; 3
(assert (not (forall ((j@26@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length a@17@01)) j@26@01)
    (or (= $k@27@01 $Perm.No) (< $Perm.No $k@27@01)))
  
  :qid |quant-u-2|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j1@26@01 Int) (j2@26@01 Int)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) j1@26@01)
        (< $Perm.No $k@27@01))
      (and
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) j2@26@01)
        (< $Perm.No $k@27@01))
      (= (Seq_index a@17@01 j1@26@01) (Seq_index a@17@01 j2@26@01)))
    (= j1@26@01 j2@26@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@26@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length a@17@01)) j@26@01)
      (< $Perm.No $k@27@01))
    (and
      (= (inv@28@01 (Seq_index a@17@01 j@26@01)) j@26@01)
      (img@29@01 (Seq_index a@17@01 j@26@01))))
  :pattern ((Seq_index a@17@01 j@26@01))
  :qid |quant-u-3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@29@01 r)
      (and
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) (inv@28@01 r))
        (< $Perm.No $k@27@01)))
    (= (Seq_index a@17@01 (inv@28@01 r)) r))
  :pattern ((inv@28@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((j@26@01 Int)) (!
  (<= $Perm.No $k@27@01)
  :pattern ((Seq_index a@17@01 j@26@01))
  :qid |f-permAtLeastZero|)))
; Field permissions are at most one
(assert (forall ((j@26@01 Int)) (!
  (<= $k@27@01 $Perm.Write)
  :pattern ((Seq_index a@17@01 j@26@01))
  :qid |f-permAtMostOne|)))
; Permission implies non-null receiver
(assert (forall ((j@26@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length a@17@01)) j@26@01)
      (< $Perm.No $k@27@01))
    (not (= (Seq_index a@17@01 j@26@01) $Ref.null)))
  :pattern ((Seq_index a@17@01 j@26@01))
  :qid |f-permImpliesNonNull|)))
(assert (= ($Snap.second $t@25@01) $Snap.unit))
; [eval] (forall l: Int :: { (l in [0..|a|)) } { old(a[l]) } (l in [0..|a|)) ==> a[l].f == old(a[l].f))
(declare-const l@30@01 Int)
(push) ; 3
; [eval] (l in [0..|a|)) ==> a[l].f == old(a[l].f)
; [eval] (l in [0..|a|))
; [eval] [0..|a|)
; [eval] |a|
(push) ; 4
; [then-branch: 3 | l@30@01 in [0..|a@17@01|] | live]
; [else-branch: 3 | !(l@30@01 in [0..|a@17@01|]) | live]
(push) ; 5
; [then-branch: 3 | l@30@01 in [0..|a@17@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length a@17@01)) l@30@01))
; [eval] a[l].f == old(a[l].f)
; [eval] a[l]
(push) ; 6
(assert (not (>= l@30@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< l@30@01 (Seq_length a@17@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (ite
  (and
    (img@29@01 (Seq_index a@17@01 l@30@01))
    (Seq_contains
      (Seq_range 0 (Seq_length a@17@01))
      (inv@28@01 (Seq_index a@17@01 l@30@01))))
  (< $Perm.No $k@27@01)
  false)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] old(a[l].f)
; [eval] a[l]
(push) ; 6
(assert (not (>= l@30@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< l@30@01 (Seq_length a@17@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (ite
  (and
    (img@24@01 (Seq_index a@17@01 l@30@01))
    (Seq_contains
      (Seq_range 0 (Seq_length a@17@01))
      (inv@23@01 (Seq_index a@17@01 l@30@01))))
  (< $Perm.No $k@22@01)
  false)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 3 | !(l@30@01 in [0..|a@17@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length a@17@01)) l@30@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not (Seq_contains (Seq_range 0 (Seq_length a@17@01)) l@30@01))
  (Seq_contains (Seq_range 0 (Seq_length a@17@01)) l@30@01)))
; [eval] old(a[l])
; [eval] a[l]
(push) ; 4
(assert (not (>= l@30@01 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((l@30@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 (Seq_length a@17@01)) l@30@01))
    (Seq_contains (Seq_range 0 (Seq_length a@17@01)) l@30@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length a@17@01)) l@30@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length a@17@01)) l@30@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/wildcardedold.vpr@27@11@27@66-aux|)))
(assert (forall ((l@30@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 (Seq_length a@17@01)) l@30@01))
    (Seq_contains (Seq_range 0 (Seq_length a@17@01)) l@30@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length a@17@01)) l@30@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/wildcardedold.vpr@27@11@27@66-aux|)))
(assert (forall ((l@30@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 (Seq_length a@17@01)) l@30@01))
    (Seq_contains (Seq_range 0 (Seq_length a@17@01)) l@30@01))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/wildcardedold.vpr@27@11@27@66-aux|)))
(assert (forall ((l@30@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length a@17@01)) l@30@01)
    (=
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@25@01)) (Seq_index
        a@17@01
        l@30@01))
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@18@01)) (Seq_index
        a@17@01
        l@30@01))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length a@17@01)) l@30@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length a@17@01)) l@30@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/wildcardedold.vpr@27@11@27@66|)))
(pop) ; 2
(push) ; 2
; [exec]
; m3(a)
; [eval] (forall i1: Int, i2: Int :: { (i1 in [0..|a|)), (i2 in [0..|a|)) } { (i1 in [0..|a|)), a[i2] } { (i2 in [0..|a|)), a[i1] } { a[i1], a[i2] } (i1 in [0..|a|)) && ((i2 in [0..|a|)) && i1 != i2) ==> a[i1] != a[i2])
(declare-const i1@31@01 Int)
(declare-const i2@32@01 Int)
(push) ; 3
; [eval] (i1 in [0..|a|)) && ((i2 in [0..|a|)) && i1 != i2) ==> a[i1] != a[i2]
; [eval] (i1 in [0..|a|)) && ((i2 in [0..|a|)) && i1 != i2)
; [eval] (i1 in [0..|a|))
; [eval] [0..|a|)
; [eval] |a|
(push) ; 4
; [then-branch: 4 | !(i1@31@01 in [0..|a@17@01|]) | live]
; [else-branch: 4 | i1@31@01 in [0..|a@17@01|] | live]
(push) ; 5
; [then-branch: 4 | !(i1@31@01 in [0..|a@17@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@31@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 4 | i1@31@01 in [0..|a@17@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@31@01))
; [eval] (i2 in [0..|a|))
; [eval] [0..|a|)
; [eval] |a|
(push) ; 6
; [then-branch: 5 | !(i2@32@01 in [0..|a@17@01|]) | live]
; [else-branch: 5 | i2@32@01 in [0..|a@17@01|] | live]
(push) ; 7
; [then-branch: 5 | !(i2@32@01 in [0..|a@17@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@32@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 5 | i2@32@01 in [0..|a@17@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@32@01))
; [eval] i1 != i2
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@32@01)
  (not (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@32@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@31@01)
  (and
    (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@31@01)
    (or
      (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@32@01)
      (not (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@32@01))))))
(assert (or
  (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@31@01)
  (not (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@31@01))))
(push) ; 4
; [then-branch: 6 | i1@31@01 in [0..|a@17@01|] && i2@32@01 in [0..|a@17@01|] && i1@31@01 != i2@32@01 | live]
; [else-branch: 6 | !(i1@31@01 in [0..|a@17@01|] && i2@32@01 in [0..|a@17@01|] && i1@31@01 != i2@32@01) | live]
(push) ; 5
; [then-branch: 6 | i1@31@01 in [0..|a@17@01|] && i2@32@01 in [0..|a@17@01|] && i1@31@01 != i2@32@01]
(assert (and
  (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@31@01)
  (and
    (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@32@01)
    (not (= i1@31@01 i2@32@01)))))
; [eval] a[i1] != a[i2]
; [eval] a[i1]
(push) ; 6
(assert (not (>= i1@31@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i1@31@01 (Seq_length a@17@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] a[i2]
(push) ; 6
(assert (not (>= i2@32@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i2@32@01 (Seq_length a@17@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 6 | !(i1@31@01 in [0..|a@17@01|] && i2@32@01 in [0..|a@17@01|] && i1@31@01 != i2@32@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@31@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@32@01)
      (not (= i1@31@01 i2@32@01))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@31@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@32@01)
      (not (= i1@31@01 i2@32@01))))
  (and
    (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@31@01)
    (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@32@01)
    (not (= i1@31@01 i2@32@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@31@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@32@01)
        (not (= i1@31@01 i2@32@01)))))
  (and
    (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@31@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@32@01)
      (not (= i1@31@01 i2@32@01))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i1@31@01 Int) (i2@32@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@31@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@31@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@32@01)
          (not (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@32@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@31@01)
      (not (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@31@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@31@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@32@01)
          (not (= i1@31@01 i2@32@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@31@01)
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@32@01)
        (not (= i1@31@01 i2@32@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@31@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@32@01)
            (not (= i1@31@01 i2@32@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@31@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@32@01)
          (not (= i1@31@01 i2@32@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@31@01) (Seq_contains
    (Seq_range 0 (Seq_length a@17@01))
    i2@32@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length a@17@01)) i1@31@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length a@17@01))
    i2@32@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/wildcardedold.vpr@24@12@24@102-aux|)))
(assert (forall ((i1@31@01 Int) (i2@32@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@31@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@31@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@32@01)
          (not (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@32@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@31@01)
      (not (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@31@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@31@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@32@01)
          (not (= i1@31@01 i2@32@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@31@01)
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@32@01)
        (not (= i1@31@01 i2@32@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@31@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@32@01)
            (not (= i1@31@01 i2@32@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@31@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@32@01)
          (not (= i1@31@01 i2@32@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length a@17@01)) i1@31@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length a@17@01))
    i2@32@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/wildcardedold.vpr@24@12@24@102-aux|)))
(assert (forall ((i1@31@01 Int) (i2@32@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@31@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@31@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@32@01)
          (not (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@32@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@31@01)
      (not (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@31@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@31@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@32@01)
          (not (= i1@31@01 i2@32@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@31@01)
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@32@01)
        (not (= i1@31@01 i2@32@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@31@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@32@01)
            (not (= i1@31@01 i2@32@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@31@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@32@01)
          (not (= i1@31@01 i2@32@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@31@01) (Seq_index
    a@17@01
    i2@32@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length a@17@01)) i1@31@01) (Seq_index
    a@17@01
    i2@32@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/wildcardedold.vpr@24@12@24@102-aux|)))
(assert (forall ((i1@31@01 Int) (i2@32@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@31@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@31@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@32@01)
          (not (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@32@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@31@01)
      (not (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@31@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@31@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@32@01)
          (not (= i1@31@01 i2@32@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@31@01)
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@32@01)
        (not (= i1@31@01 i2@32@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@31@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@32@01)
            (not (= i1@31@01 i2@32@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@31@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@32@01)
          (not (= i1@31@01 i2@32@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length a@17@01)) i1@31@01) (Seq_index
    a@17@01
    i2@32@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/wildcardedold.vpr@24@12@24@102-aux|)))
(assert (forall ((i1@31@01 Int) (i2@32@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@31@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@31@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@32@01)
          (not (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@32@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@31@01)
      (not (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@31@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@31@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@32@01)
          (not (= i1@31@01 i2@32@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@31@01)
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@32@01)
        (not (= i1@31@01 i2@32@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@31@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@32@01)
            (not (= i1@31@01 i2@32@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@31@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@32@01)
          (not (= i1@31@01 i2@32@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@32@01) (Seq_index
    a@17@01
    i1@31@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length a@17@01)) i2@32@01) (Seq_index
    a@17@01
    i1@31@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/wildcardedold.vpr@24@12@24@102-aux|)))
(assert (forall ((i1@31@01 Int) (i2@32@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@31@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@31@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@32@01)
          (not (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@32@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@31@01)
      (not (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@31@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@31@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@32@01)
          (not (= i1@31@01 i2@32@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@31@01)
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@32@01)
        (not (= i1@31@01 i2@32@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@31@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@32@01)
            (not (= i1@31@01 i2@32@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@31@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@32@01)
          (not (= i1@31@01 i2@32@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length a@17@01)) i2@32@01) (Seq_index
    a@17@01
    i1@31@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/wildcardedold.vpr@24@12@24@102-aux|)))
(assert (forall ((i1@31@01 Int) (i2@32@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@31@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@31@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@32@01)
          (not (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@32@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@31@01)
      (not (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@31@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@31@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@32@01)
          (not (= i1@31@01 i2@32@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@31@01)
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@32@01)
        (not (= i1@31@01 i2@32@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@31@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@32@01)
            (not (= i1@31@01 i2@32@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@31@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@32@01)
          (not (= i1@31@01 i2@32@01))))))
  :pattern ((Seq_index a@17@01 i1@31@01) (Seq_index a@17@01 i2@32@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/wildcardedold.vpr@24@12@24@102-aux|)))
(push) ; 3
(assert (not (forall ((i1@31@01 Int) (i2@32@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@31@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@32@01)
        (not (= i1@31@01 i2@32@01))))
    (not (= (Seq_index a@17@01 i1@31@01) (Seq_index a@17@01 i2@32@01))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@31@01) (Seq_contains
    (Seq_range 0 (Seq_length a@17@01))
    i2@32@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length a@17@01)) i1@31@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length a@17@01))
    i2@32@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length a@17@01)) i1@31@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length a@17@01))
    i2@32@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@31@01) (Seq_index
    a@17@01
    i2@32@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length a@17@01)) i1@31@01) (Seq_index
    a@17@01
    i2@32@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length a@17@01)) i1@31@01) (Seq_index
    a@17@01
    i2@32@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@32@01) (Seq_index
    a@17@01
    i1@31@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length a@17@01)) i2@32@01) (Seq_index
    a@17@01
    i1@31@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length a@17@01)) i2@32@01) (Seq_index
    a@17@01
    i1@31@01))
  :pattern ((Seq_index a@17@01 i1@31@01) (Seq_index a@17@01 i2@32@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/wildcardedold.vpr@24@12@24@102|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i1@31@01 Int) (i2@32@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@31@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@32@01)
        (not (= i1@31@01 i2@32@01))))
    (not (= (Seq_index a@17@01 i1@31@01) (Seq_index a@17@01 i2@32@01))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@31@01) (Seq_contains
    (Seq_range 0 (Seq_length a@17@01))
    i2@32@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length a@17@01)) i1@31@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length a@17@01))
    i2@32@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@31@01) (Seq_index
    a@17@01
    i2@32@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length a@17@01)) i1@31@01) (Seq_index
    a@17@01
    i2@32@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@32@01) (Seq_index
    a@17@01
    i1@31@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length a@17@01)) i2@32@01) (Seq_index
    a@17@01
    i1@31@01))
  :pattern ((Seq_index a@17@01 i1@31@01) (Seq_index a@17@01 i2@32@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/wildcardedold.vpr@24@12@24@102|)))
(declare-const i@33@01 Int)
(push) ; 3
; [eval] (i in [0..|a|))
; [eval] [0..|a|)
; [eval] |a|
(assert (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i@33@01))
(declare-const $k@34@01 $Perm)
(assert ($Perm.isReadVar $k@34@01))
; [eval] a[i]
(push) ; 4
(assert (not (>= i@33@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@33@01 (Seq_length a@17@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@35@01 ($Ref) Int)
(declare-fun img@36@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@34@01))
; Nested auxiliary terms: non-globals
(push) ; 3
(assert (not (forall ((i@33@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i@33@01)
    (or (= $k@34@01 $Perm.No) (< $Perm.No $k@34@01)))
  
  :qid |quant-u-4|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@33@01 Int) (i2@33@01 Int)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i1@33@01)
        (< $Perm.No $k@34@01))
      (and
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i2@33@01)
        (< $Perm.No $k@34@01))
      (= (Seq_index a@17@01 i1@33@01) (Seq_index a@17@01 i2@33@01)))
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
    (and
      (Seq_contains (Seq_range 0 (Seq_length a@17@01)) i@33@01)
      (< $Perm.No $k@34@01))
    (and
      (= (inv@35@01 (Seq_index a@17@01 i@33@01)) i@33@01)
      (img@36@01 (Seq_index a@17@01 i@33@01))))
  :pattern ((Seq_index a@17@01 i@33@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@36@01 r)
      (and
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) (inv@35@01 r))
        (< $Perm.No $k@34@01)))
    (= (Seq_index a@17@01 (inv@35@01 r)) r))
  :pattern ((inv@35@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@37@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length a@17@01)) (inv@35@01 r))
      (img@36@01 r)
      (= r (Seq_index a@17@01 (inv@35@01 r))))
    ($Perm.min
      (ite
        (and
          (img@24@01 r)
          (Seq_contains (Seq_range 0 (Seq_length a@17@01)) (inv@23@01 r)))
        $k@22@01
        $Perm.No)
      $k@34@01)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@34@01
(assert (forall ((r $Ref)) (!
  (=>
    (not
      (=
        (ite
          (and
            (img@24@01 r)
            (Seq_contains (Seq_range 0 (Seq_length a@17@01)) (inv@23@01 r)))
          $k@22@01
          $Perm.No)
        $Perm.No))
    (ite
      (and
        (img@24@01 r)
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) (inv@23@01 r)))
      (<
        (ite
          (and
            (Seq_contains (Seq_range 0 (Seq_length a@17@01)) (inv@35@01 r))
            (img@36@01 r)
            (= r (Seq_index a@17@01 (inv@35@01 r))))
          $k@34@01
          $Perm.No)
        $k@22@01)
      (<
        (ite
          (and
            (Seq_contains (Seq_range 0 (Seq_length a@17@01)) (inv@35@01 r))
            (img@36@01 r)
            (= r (Seq_index a@17@01 (inv@35@01 r))))
          $k@34@01
          $Perm.No)
        $Perm.No)))
  :pattern ((img@24@01 r))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length a@17@01)) (inv@23@01 r)))
  :pattern ((Seq_contains_trigger
    (Seq_range 0 (Seq_length a@17@01))
    (inv@23@01 r)))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length a@17@01)) (inv@35@01 r)))
  :pattern ((Seq_contains_trigger
    (Seq_range 0 (Seq_length a@17@01))
    (inv@35@01 r)))
  :pattern ((img@36@01 r))
  :pattern ((Seq_index a@17@01 (inv@35@01 r)))
  :qid |qp.srp0|)))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length a@17@01)) (inv@35@01 r))
      (img@36@01 r)
      (= r (Seq_index a@17@01 (inv@35@01 r))))
    (= (- $k@34@01 (pTaken@37@01 r)) $Perm.No))
  
  :qid |quant-u-7|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@38@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@24@01 r)
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) (inv@23@01 r)))
      (< $Perm.No $k@22@01)
      false)
    (=
      ($FVF.lookup_f (as sm@38@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@18@01)) r)))
  :pattern (($FVF.lookup_f (as sm@38@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@18@01)) r))
  :qid |qp.fvfValDef1|)))
(declare-const $t@39@01 $Snap)
(assert (= $t@39@01 ($Snap.combine ($Snap.first $t@39@01) ($Snap.second $t@39@01))))
(declare-const j@40@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (j in [0..|a|))
; [eval] [0..|a|)
; [eval] |a|
(assert (Seq_contains (Seq_range 0 (Seq_length a@17@01)) j@40@01))
; [eval] a[j]
(push) ; 4
(assert (not (>= j@40@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< j@40@01 (Seq_length a@17@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(declare-const $k@41@01 $Perm)
(assert ($Perm.isReadVar $k@41@01))
(pop) ; 3
(declare-fun inv@42@01 ($Ref) Int)
(declare-fun img@43@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@41@01))
; Nested auxiliary terms: non-globals
(push) ; 3
(assert (not (forall ((j@40@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length a@17@01)) j@40@01)
    (or (= $k@41@01 $Perm.No) (< $Perm.No $k@41@01)))
  
  :qid |quant-u-8|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j1@40@01 Int) (j2@40@01 Int)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) j1@40@01)
        (< $Perm.No $k@41@01))
      (and
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) j2@40@01)
        (< $Perm.No $k@41@01))
      (= (Seq_index a@17@01 j1@40@01) (Seq_index a@17@01 j2@40@01)))
    (= j1@40@01 j2@40@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@40@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length a@17@01)) j@40@01)
      (< $Perm.No $k@41@01))
    (and
      (= (inv@42@01 (Seq_index a@17@01 j@40@01)) j@40@01)
      (img@43@01 (Seq_index a@17@01 j@40@01))))
  :pattern ((Seq_index a@17@01 j@40@01))
  :qid |quant-u-9|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@43@01 r)
      (and
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) (inv@42@01 r))
        (< $Perm.No $k@41@01)))
    (= (Seq_index a@17@01 (inv@42@01 r)) r))
  :pattern ((inv@42@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((j@40@01 Int)) (!
  (<= $Perm.No $k@41@01)
  :pattern ((Seq_index a@17@01 j@40@01))
  :qid |f-permAtLeastZero|)))
; Field permissions are at most one
(assert (forall ((j@40@01 Int)) (!
  (<= $k@41@01 $Perm.Write)
  :pattern ((Seq_index a@17@01 j@40@01))
  :qid |f-permAtMostOne|)))
; Permission implies non-null receiver
(assert (forall ((j@40@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length a@17@01)) j@40@01)
      (< $Perm.No $k@41@01))
    (not (= (Seq_index a@17@01 j@40@01) $Ref.null)))
  :pattern ((Seq_index a@17@01 j@40@01))
  :qid |f-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index a@17@01 j@40@01) (Seq_index a@17@01 i@21@01))
    (=
      (and
        (img@43@01 r)
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) (inv@42@01 r)))
      (and
        (img@24@01 r)
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) (inv@23@01 r)))))
  
  :qid |quant-u-10|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (= ($Snap.second $t@39@01) $Snap.unit))
; [eval] (forall l: Int :: { (l in [0..|a|)) } { old(a[l]) } (l in [0..|a|)) ==> a[l].f == old(a[l].f))
(declare-const l@44@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (l in [0..|a|)) ==> a[l].f == old(a[l].f)
; [eval] (l in [0..|a|))
; [eval] [0..|a|)
; [eval] |a|
(push) ; 4
; [then-branch: 7 | l@44@01 in [0..|a@17@01|] | live]
; [else-branch: 7 | !(l@44@01 in [0..|a@17@01|]) | live]
(push) ; 5
; [then-branch: 7 | l@44@01 in [0..|a@17@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length a@17@01)) l@44@01))
; [eval] a[l].f == old(a[l].f)
; [eval] a[l]
(push) ; 6
(assert (not (>= l@44@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< l@44@01 (Seq_length a@17@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(declare-const sm@45@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@24@01 r)
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) (inv@23@01 r)))
      (< $Perm.No (- $k@22@01 (pTaken@37@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@45@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@18@01)) r)))
  :pattern (($FVF.lookup_f (as sm@45@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@18@01)) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@43@01 r)
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) (inv@42@01 r)))
      (< $Perm.No $k@41@01)
      false)
    (=
      ($FVF.lookup_f (as sm@45@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@39@01)) r)))
  :pattern (($FVF.lookup_f (as sm@45@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@39@01)) r))
  :qid |qp.fvfValDef3|)))
(declare-const pm@46@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@46@01  $FPM) r)
    (+
      (ite
        (and
          (img@24@01 r)
          (Seq_contains (Seq_range 0 (Seq_length a@17@01)) (inv@23@01 r)))
        (- $k@22@01 (pTaken@37@01 r))
        $Perm.No)
      (ite
        (and
          (img@43@01 r)
          (Seq_contains (Seq_range 0 (Seq_length a@17@01)) (inv@42@01 r)))
        $k@41@01
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@46@01  $FPM) r))
  :qid |qp.resPrmSumDef4|)))
(push) ; 6
(assert (not (< $Perm.No ($FVF.perm_f (as pm@46@01  $FPM) (Seq_index a@17@01 l@44@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] old(a[l].f)
; [eval] a[l]
(push) ; 6
(assert (not (>= l@44@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< l@44@01 (Seq_length a@17@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (ite
  (and
    (img@24@01 (Seq_index a@17@01 l@44@01))
    (Seq_contains
      (Seq_range 0 (Seq_length a@17@01))
      (inv@23@01 (Seq_index a@17@01 l@44@01))))
  (< $Perm.No $k@22@01)
  false)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 7 | !(l@44@01 in [0..|a@17@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length a@17@01)) l@44@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@24@01 r)
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) (inv@23@01 r)))
      (< $Perm.No (- $k@22@01 (pTaken@37@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@45@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@18@01)) r)))
  :pattern (($FVF.lookup_f (as sm@45@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@18@01)) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@43@01 r)
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) (inv@42@01 r)))
      (< $Perm.No $k@41@01)
      false)
    (=
      ($FVF.lookup_f (as sm@45@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@39@01)) r)))
  :pattern (($FVF.lookup_f (as sm@45@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@39@01)) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@46@01  $FPM) r)
    (+
      (ite
        (and
          (img@24@01 r)
          (Seq_contains (Seq_range 0 (Seq_length a@17@01)) (inv@23@01 r)))
        (- $k@22@01 (pTaken@37@01 r))
        $Perm.No)
      (ite
        (and
          (img@43@01 r)
          (Seq_contains (Seq_range 0 (Seq_length a@17@01)) (inv@42@01 r)))
        $k@41@01
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@46@01  $FPM) r))
  :qid |qp.resPrmSumDef4|)))
; Joined path conditions
(assert (or
  (not (Seq_contains (Seq_range 0 (Seq_length a@17@01)) l@44@01))
  (Seq_contains (Seq_range 0 (Seq_length a@17@01)) l@44@01)))
; [eval] old(a[l])
; [eval] a[l]
(push) ; 4
(assert (not (>= l@44@01 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@24@01 r)
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) (inv@23@01 r)))
      (< $Perm.No (- $k@22@01 (pTaken@37@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@45@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@18@01)) r)))
  :pattern (($FVF.lookup_f (as sm@45@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@18@01)) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@43@01 r)
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) (inv@42@01 r)))
      (< $Perm.No $k@41@01)
      false)
    (=
      ($FVF.lookup_f (as sm@45@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@39@01)) r)))
  :pattern (($FVF.lookup_f (as sm@45@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@39@01)) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@46@01  $FPM) r)
    (+
      (ite
        (and
          (img@24@01 r)
          (Seq_contains (Seq_range 0 (Seq_length a@17@01)) (inv@23@01 r)))
        (- $k@22@01 (pTaken@37@01 r))
        $Perm.No)
      (ite
        (and
          (img@43@01 r)
          (Seq_contains (Seq_range 0 (Seq_length a@17@01)) (inv@42@01 r)))
        $k@41@01
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@46@01  $FPM) r))
  :qid |qp.resPrmSumDef4|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((l@44@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 (Seq_length a@17@01)) l@44@01))
    (Seq_contains (Seq_range 0 (Seq_length a@17@01)) l@44@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length a@17@01)) l@44@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length a@17@01)) l@44@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/wildcardedold.vpr@27@11@27@66-aux|)))
(assert (forall ((l@44@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 (Seq_length a@17@01)) l@44@01))
    (Seq_contains (Seq_range 0 (Seq_length a@17@01)) l@44@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length a@17@01)) l@44@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/wildcardedold.vpr@27@11@27@66-aux|)))
(assert (forall ((l@44@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 (Seq_length a@17@01)) l@44@01))
    (Seq_contains (Seq_range 0 (Seq_length a@17@01)) l@44@01))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/wildcardedold.vpr@27@11@27@66-aux|)))
(assert (forall ((l@44@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length a@17@01)) l@44@01)
    (=
      ($FVF.lookup_f (as sm@45@01  $FVF<f>) (Seq_index a@17@01 l@44@01))
      ($FVF.lookup_f (as sm@38@01  $FVF<f>) (Seq_index a@17@01 l@44@01))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length a@17@01)) l@44@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length a@17@01)) l@44@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/wildcardedold.vpr@27@11@27@66|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(declare-const j@47@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (j in [0..|a|))
; [eval] [0..|a|)
; [eval] |a|
(assert (Seq_contains (Seq_range 0 (Seq_length a@17@01)) j@47@01))
(declare-const $k@48@01 $Perm)
(assert ($Perm.isReadVar $k@48@01))
; [eval] a[j]
(push) ; 4
(assert (not (>= j@47@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< j@47@01 (Seq_length a@17@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@49@01 ($Ref) Int)
(declare-fun img@50@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert ($Perm.isReadVar $k@48@01))
; Nested auxiliary terms: non-globals
(push) ; 3
(assert (not (forall ((j@47@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length a@17@01)) j@47@01)
    (or (= $k@48@01 $Perm.No) (< $Perm.No $k@48@01)))
  
  :qid |quant-u-11|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j1@47@01 Int) (j2@47@01 Int)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) j1@47@01)
        (< $Perm.No $k@48@01))
      (and
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) j2@47@01)
        (< $Perm.No $k@48@01))
      (= (Seq_index a@17@01 j1@47@01) (Seq_index a@17@01 j2@47@01)))
    (= j1@47@01 j2@47@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@47@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length a@17@01)) j@47@01)
      (< $Perm.No $k@48@01))
    (and
      (= (inv@49@01 (Seq_index a@17@01 j@47@01)) j@47@01)
      (img@50@01 (Seq_index a@17@01 j@47@01))))
  :pattern ((Seq_index a@17@01 j@47@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@50@01 r)
      (and
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) (inv@49@01 r))
        (< $Perm.No $k@48@01)))
    (= (Seq_index a@17@01 (inv@49@01 r)) r))
  :pattern ((inv@49@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@51@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length a@17@01)) (inv@49@01 r))
      (img@50@01 r)
      (= r (Seq_index a@17@01 (inv@49@01 r))))
    ($Perm.min
      (ite
        (and
          (img@24@01 r)
          (Seq_contains (Seq_range 0 (Seq_length a@17@01)) (inv@23@01 r)))
        (- $k@22@01 (pTaken@37@01 r))
        $Perm.No)
      $k@48@01)
    $Perm.No))
(define-fun pTaken@52@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length a@17@01)) (inv@49@01 r))
      (img@50@01 r)
      (= r (Seq_index a@17@01 (inv@49@01 r))))
    ($Perm.min
      (ite
        (and
          (img@43@01 r)
          (Seq_contains (Seq_range 0 (Seq_length a@17@01)) (inv@42@01 r)))
        $k@41@01
        $Perm.No)
      (- $k@48@01 (pTaken@51@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Constrain original permissions $k@48@01
(assert (forall ((r $Ref)) (!
  (=>
    (not
      (=
        (ite
          (and
            (img@24@01 r)
            (Seq_contains (Seq_range 0 (Seq_length a@17@01)) (inv@23@01 r)))
          (- $k@22@01 (pTaken@37@01 r))
          $Perm.No)
        $Perm.No))
    (ite
      (and
        (img@24@01 r)
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) (inv@23@01 r)))
      (<
        (ite
          (and
            (Seq_contains (Seq_range 0 (Seq_length a@17@01)) (inv@49@01 r))
            (img@50@01 r)
            (= r (Seq_index a@17@01 (inv@49@01 r))))
          $k@48@01
          $Perm.No)
        (- $k@22@01 (pTaken@37@01 r)))
      (<
        (ite
          (and
            (Seq_contains (Seq_range 0 (Seq_length a@17@01)) (inv@49@01 r))
            (img@50@01 r)
            (= r (Seq_index a@17@01 (inv@49@01 r))))
          $k@48@01
          $Perm.No)
        $Perm.No)))
  :pattern ((img@24@01 r))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length a@17@01)) (inv@23@01 r)))
  :pattern ((Seq_contains_trigger
    (Seq_range 0 (Seq_length a@17@01))
    (inv@23@01 r)))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length a@17@01)) (inv@49@01 r)))
  :pattern ((Seq_contains_trigger
    (Seq_range 0 (Seq_length a@17@01))
    (inv@49@01 r)))
  :pattern ((img@50@01 r))
  :pattern ((Seq_index a@17@01 (inv@49@01 r)))
  :qid |qp.srp5|)))
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length a@17@01)) (inv@49@01 r))
      (img@50@01 r)
      (= r (Seq_index a@17@01 (inv@49@01 r))))
    (= (- $k@48@01 (pTaken@51@01 r)) $Perm.No))
  
  :qid |quant-u-14|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values
; [eval] (forall l: Int :: { (l in [0..|a|)) } { old(a[l]) } (l in [0..|a|)) ==> a[l].f == old(a[l].f))
(declare-const l@53@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (l in [0..|a|)) ==> a[l].f == old(a[l].f)
; [eval] (l in [0..|a|))
; [eval] [0..|a|)
; [eval] |a|
(push) ; 4
; [then-branch: 8 | l@53@01 in [0..|a@17@01|] | live]
; [else-branch: 8 | !(l@53@01 in [0..|a@17@01|]) | live]
(push) ; 5
; [then-branch: 8 | l@53@01 in [0..|a@17@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length a@17@01)) l@53@01))
; [eval] a[l].f == old(a[l].f)
; [eval] a[l]
(push) ; 6
(assert (not (>= l@53@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< l@53@01 (Seq_length a@17@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and
          (img@24@01 r)
          (Seq_contains (Seq_range 0 (Seq_length a@17@01)) (inv@23@01 r)))
        (< $Perm.No (- $k@22@01 (pTaken@37@01 r)))
        false)
      (=
        ($FVF.lookup_f (as sm@45@01  $FVF<f>) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@18@01)) r)))
    :pattern (($FVF.lookup_f (as sm@45@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@18@01)) r))
    :qid |qp.fvfValDef2|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and
          (img@43@01 r)
          (Seq_contains (Seq_range 0 (Seq_length a@17@01)) (inv@42@01 r)))
        (< $Perm.No $k@41@01)
        false)
      (=
        ($FVF.lookup_f (as sm@45@01  $FVF<f>) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@39@01)) r)))
    :pattern (($FVF.lookup_f (as sm@45@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@39@01)) r))
    :qid |qp.fvfValDef3|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (ite
      (and
        (img@24@01 (Seq_index a@17@01 l@53@01))
        (Seq_contains
          (Seq_range 0 (Seq_length a@17@01))
          (inv@23@01 (Seq_index a@17@01 l@53@01))))
      (- $k@22@01 (pTaken@37@01 (Seq_index a@17@01 l@53@01)))
      $Perm.No)
    (ite
      (and
        (img@43@01 (Seq_index a@17@01 l@53@01))
        (Seq_contains
          (Seq_range 0 (Seq_length a@17@01))
          (inv@42@01 (Seq_index a@17@01 l@53@01))))
      $k@41@01
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] old(a[l].f)
; [eval] a[l]
(push) ; 6
(assert (not (>= l@53@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< l@53@01 (Seq_length a@17@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (ite
  (and
    (img@24@01 (Seq_index a@17@01 l@53@01))
    (Seq_contains
      (Seq_range 0 (Seq_length a@17@01))
      (inv@23@01 (Seq_index a@17@01 l@53@01))))
  (< $Perm.No $k@22@01)
  false)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 8 | !(l@53@01 in [0..|a@17@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length a@17@01)) l@53@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@24@01 r)
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) (inv@23@01 r)))
      (< $Perm.No (- $k@22@01 (pTaken@37@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@45@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@18@01)) r)))
  :pattern (($FVF.lookup_f (as sm@45@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@18@01)) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@43@01 r)
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) (inv@42@01 r)))
      (< $Perm.No $k@41@01)
      false)
    (=
      ($FVF.lookup_f (as sm@45@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@39@01)) r)))
  :pattern (($FVF.lookup_f (as sm@45@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@39@01)) r))
  :qid |qp.fvfValDef3|)))
; Joined path conditions
(assert (or
  (not (Seq_contains (Seq_range 0 (Seq_length a@17@01)) l@53@01))
  (Seq_contains (Seq_range 0 (Seq_length a@17@01)) l@53@01)))
; [eval] old(a[l])
; [eval] a[l]
(push) ; 4
(assert (not (>= l@53@01 0)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@24@01 r)
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) (inv@23@01 r)))
      (< $Perm.No (- $k@22@01 (pTaken@37@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@45@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@18@01)) r)))
  :pattern (($FVF.lookup_f (as sm@45@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@18@01)) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@43@01 r)
        (Seq_contains (Seq_range 0 (Seq_length a@17@01)) (inv@42@01 r)))
      (< $Perm.No $k@41@01)
      false)
    (=
      ($FVF.lookup_f (as sm@45@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@39@01)) r)))
  :pattern (($FVF.lookup_f (as sm@45@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@39@01)) r))
  :qid |qp.fvfValDef3|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((l@53@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 (Seq_length a@17@01)) l@53@01))
    (Seq_contains (Seq_range 0 (Seq_length a@17@01)) l@53@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length a@17@01)) l@53@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length a@17@01)) l@53@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/wildcardedold.vpr@27@11@27@66-aux|)))
(assert (forall ((l@53@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 (Seq_length a@17@01)) l@53@01))
    (Seq_contains (Seq_range 0 (Seq_length a@17@01)) l@53@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length a@17@01)) l@53@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/wildcardedold.vpr@27@11@27@66-aux|)))
(assert (forall ((l@53@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 (Seq_length a@17@01)) l@53@01))
    (Seq_contains (Seq_range 0 (Seq_length a@17@01)) l@53@01))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/wildcardedold.vpr@27@11@27@66-aux|)))
(push) ; 3
(assert (not (forall ((l@53@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length a@17@01)) l@53@01)
    (=
      ($FVF.lookup_f (as sm@45@01  $FVF<f>) (Seq_index a@17@01 l@53@01))
      ($FVF.lookup_f (as sm@38@01  $FVF<f>) (Seq_index a@17@01 l@53@01))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length a@17@01)) l@53@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length a@17@01)) l@53@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length a@17@01)) l@53@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/wildcardedold.vpr@27@11@27@66|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((l@53@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length a@17@01)) l@53@01)
    (=
      ($FVF.lookup_f (as sm@45@01  $FVF<f>) (Seq_index a@17@01 l@53@01))
      ($FVF.lookup_f (as sm@38@01  $FVF<f>) (Seq_index a@17@01 l@53@01))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length a@17@01)) l@53@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length a@17@01)) l@53@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/wildcardedold.vpr@27@11@27@66|)))
(pop) ; 2
(pop) ; 1
