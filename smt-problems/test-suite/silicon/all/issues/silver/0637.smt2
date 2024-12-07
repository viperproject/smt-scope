(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:04:58
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/all/issues/silver/0637.vpr
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
; ---------- test1 ----------
(declare-const xs@0@01 Seq<$Ref>)
(declare-const xs@1@01 Seq<$Ref>)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@2@01 $Snap)
(assert (= $t@2@01 ($Snap.combine ($Snap.first $t@2@01) ($Snap.second $t@2@01))))
(assert (= ($Snap.first $t@2@01) $Snap.unit))
; [eval] (forall i: Int, j: Int :: { xs[i], xs[j] } 0 <= i && (i < |xs| && (0 <= j && j < |xs|)) ==> xs[i] == xs[j] ==> i == j)
(declare-const i@3@01 Int)
(declare-const j@4@01 Int)
(push) ; 2
; [eval] 0 <= i && (i < |xs| && (0 <= j && j < |xs|)) ==> xs[i] == xs[j] ==> i == j
; [eval] 0 <= i && (i < |xs| && (0 <= j && j < |xs|))
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
; [eval] i < |xs|
; [eval] |xs|
(push) ; 5
; [then-branch: 1 | !(i@3@01 < |xs@1@01|) | live]
; [else-branch: 1 | i@3@01 < |xs@1@01| | live]
(push) ; 6
; [then-branch: 1 | !(i@3@01 < |xs@1@01|)]
(assert (not (< i@3@01 (Seq_length xs@1@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 1 | i@3@01 < |xs@1@01|]
(assert (< i@3@01 (Seq_length xs@1@01)))
; [eval] 0 <= j
(push) ; 7
; [then-branch: 2 | !(0 <= j@4@01) | live]
; [else-branch: 2 | 0 <= j@4@01 | live]
(push) ; 8
; [then-branch: 2 | !(0 <= j@4@01)]
(assert (not (<= 0 j@4@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 2 | 0 <= j@4@01]
(assert (<= 0 j@4@01))
; [eval] j < |xs|
; [eval] |xs|
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j@4@01) (not (<= 0 j@4@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i@3@01 (Seq_length xs@1@01))
  (and (< i@3@01 (Seq_length xs@1@01)) (or (<= 0 j@4@01) (not (<= 0 j@4@01))))))
(assert (or (< i@3@01 (Seq_length xs@1@01)) (not (< i@3@01 (Seq_length xs@1@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i@3@01)
  (and
    (<= 0 i@3@01)
    (=>
      (< i@3@01 (Seq_length xs@1@01))
      (and
        (< i@3@01 (Seq_length xs@1@01))
        (or (<= 0 j@4@01) (not (<= 0 j@4@01)))))
    (or (< i@3@01 (Seq_length xs@1@01)) (not (< i@3@01 (Seq_length xs@1@01)))))))
(assert (or (<= 0 i@3@01) (not (<= 0 i@3@01))))
(push) ; 3
; [then-branch: 3 | 0 <= i@3@01 && i@3@01 < |xs@1@01| && 0 <= j@4@01 && j@4@01 < |xs@1@01| | live]
; [else-branch: 3 | !(0 <= i@3@01 && i@3@01 < |xs@1@01| && 0 <= j@4@01 && j@4@01 < |xs@1@01|) | live]
(push) ; 4
; [then-branch: 3 | 0 <= i@3@01 && i@3@01 < |xs@1@01| && 0 <= j@4@01 && j@4@01 < |xs@1@01|]
(assert (and
  (<= 0 i@3@01)
  (and
    (< i@3@01 (Seq_length xs@1@01))
    (and (<= 0 j@4@01) (< j@4@01 (Seq_length xs@1@01))))))
; [eval] xs[i] == xs[j] ==> i == j
; [eval] xs[i] == xs[j]
; [eval] xs[i]
(push) ; 5
(assert (not (>= i@3@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] xs[j]
(push) ; 5
(assert (not (>= j@4@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
; [then-branch: 4 | xs@1@01[i@3@01] == xs@1@01[j@4@01] | live]
; [else-branch: 4 | xs@1@01[i@3@01] != xs@1@01[j@4@01] | live]
(push) ; 6
; [then-branch: 4 | xs@1@01[i@3@01] == xs@1@01[j@4@01]]
(assert (= (Seq_index xs@1@01 i@3@01) (Seq_index xs@1@01 j@4@01)))
; [eval] i == j
(pop) ; 6
(push) ; 6
; [else-branch: 4 | xs@1@01[i@3@01] != xs@1@01[j@4@01]]
(assert (not (= (Seq_index xs@1@01 i@3@01) (Seq_index xs@1@01 j@4@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or
  (not (= (Seq_index xs@1@01 i@3@01) (Seq_index xs@1@01 j@4@01)))
  (= (Seq_index xs@1@01 i@3@01) (Seq_index xs@1@01 j@4@01))))
(pop) ; 4
(push) ; 4
; [else-branch: 3 | !(0 <= i@3@01 && i@3@01 < |xs@1@01| && 0 <= j@4@01 && j@4@01 < |xs@1@01|)]
(assert (not
  (and
    (<= 0 i@3@01)
    (and
      (< i@3@01 (Seq_length xs@1@01))
      (and (<= 0 j@4@01) (< j@4@01 (Seq_length xs@1@01)))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (<= 0 i@3@01)
    (and
      (< i@3@01 (Seq_length xs@1@01))
      (and (<= 0 j@4@01) (< j@4@01 (Seq_length xs@1@01)))))
  (and
    (<= 0 i@3@01)
    (< i@3@01 (Seq_length xs@1@01))
    (<= 0 j@4@01)
    (< j@4@01 (Seq_length xs@1@01))
    (or
      (not (= (Seq_index xs@1@01 i@3@01) (Seq_index xs@1@01 j@4@01)))
      (= (Seq_index xs@1@01 i@3@01) (Seq_index xs@1@01 j@4@01))))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i@3@01)
      (and
        (< i@3@01 (Seq_length xs@1@01))
        (and (<= 0 j@4@01) (< j@4@01 (Seq_length xs@1@01))))))
  (and
    (<= 0 i@3@01)
    (and
      (< i@3@01 (Seq_length xs@1@01))
      (and (<= 0 j@4@01) (< j@4@01 (Seq_length xs@1@01)))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@3@01 Int) (j@4@01 Int)) (!
  (and
    (=>
      (<= 0 i@3@01)
      (and
        (<= 0 i@3@01)
        (=>
          (< i@3@01 (Seq_length xs@1@01))
          (and
            (< i@3@01 (Seq_length xs@1@01))
            (or (<= 0 j@4@01) (not (<= 0 j@4@01)))))
        (or
          (< i@3@01 (Seq_length xs@1@01))
          (not (< i@3@01 (Seq_length xs@1@01))))))
    (or (<= 0 i@3@01) (not (<= 0 i@3@01)))
    (=>
      (and
        (<= 0 i@3@01)
        (and
          (< i@3@01 (Seq_length xs@1@01))
          (and (<= 0 j@4@01) (< j@4@01 (Seq_length xs@1@01)))))
      (and
        (<= 0 i@3@01)
        (< i@3@01 (Seq_length xs@1@01))
        (<= 0 j@4@01)
        (< j@4@01 (Seq_length xs@1@01))
        (or
          (not (= (Seq_index xs@1@01 i@3@01) (Seq_index xs@1@01 j@4@01)))
          (= (Seq_index xs@1@01 i@3@01) (Seq_index xs@1@01 j@4@01)))))
    (or
      (not
        (and
          (<= 0 i@3@01)
          (and
            (< i@3@01 (Seq_length xs@1@01))
            (and (<= 0 j@4@01) (< j@4@01 (Seq_length xs@1@01))))))
      (and
        (<= 0 i@3@01)
        (and
          (< i@3@01 (Seq_length xs@1@01))
          (and (<= 0 j@4@01) (< j@4@01 (Seq_length xs@1@01)))))))
  :pattern ((Seq_index xs@1@01 i@3@01) (Seq_index xs@1@01 j@4@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0637.vpr@7@15@7@110-aux|)))
(assert (forall ((i@3@01 Int) (j@4@01 Int)) (!
  (=>
    (and
      (and
        (<= 0 i@3@01)
        (and
          (< i@3@01 (Seq_length xs@1@01))
          (and (<= 0 j@4@01) (< j@4@01 (Seq_length xs@1@01)))))
      (= (Seq_index xs@1@01 i@3@01) (Seq_index xs@1@01 j@4@01)))
    (= i@3@01 j@4@01))
  :pattern ((Seq_index xs@1@01 i@3@01) (Seq_index xs@1@01 j@4@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0637.vpr@7@15@7@110|)))
(assert (=
  ($Snap.second $t@2@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@2@01))
    ($Snap.second ($Snap.second $t@2@01)))))
(declare-const i@5@01 Int)
(push) ; 2
; [eval] 0 <= i && i < |xs| && (let j == (xs[i].f) in true)
; [eval] 0 <= i
(push) ; 3
; [then-branch: 5 | !(0 <= i@5@01) | live]
; [else-branch: 5 | 0 <= i@5@01 | live]
(push) ; 4
; [then-branch: 5 | !(0 <= i@5@01)]
(assert (not (<= 0 i@5@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 5 | 0 <= i@5@01]
(assert (<= 0 i@5@01))
; [eval] i < |xs|
; [eval] |xs|
(push) ; 5
; [then-branch: 6 | !(i@5@01 < |xs@1@01|) | live]
; [else-branch: 6 | i@5@01 < |xs@1@01| | live]
(push) ; 6
; [then-branch: 6 | !(i@5@01 < |xs@1@01|)]
(assert (not (< i@5@01 (Seq_length xs@1@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 6 | i@5@01 < |xs@1@01|]
(assert (< i@5@01 (Seq_length xs@1@01)))
; [eval] (let j == (xs[i].f) in true)
; [eval] xs[i]
(push) ; 7
(assert (not (>= i@5@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(declare-const sm@6@01 $FVF<f>)
; Definitional axioms for snapshot map values
(declare-const pm@7@01 $FPM)
(assert (forall ((r $Ref)) (!
  (= ($FVF.perm_f (as pm@7@01  $FPM) r) $Perm.No)
  :pattern (($FVF.perm_f (as pm@7@01  $FPM) r))
  :qid |qp.resPrmSumDef0|)))
(push) ; 7
(assert (not (< $Perm.No ($FVF.perm_f (as pm@7@01  $FPM) (Seq_index xs@1@01 i@5@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- test2 ----------
(declare-const x@8@01 $Ref)
(declare-const x@9@01 $Ref)
(push) ; 1
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
(pop) ; 1
; ---------- test3 ----------
(declare-const xs@10@01 Seq<$Ref>)
(declare-const ys@11@01 Seq<Int>)
(declare-const xs@12@01 Seq<$Ref>)
(declare-const ys@13@01 Seq<Int>)
(push) ; 1
(declare-const $t@14@01 $Snap)
(assert (= $t@14@01 ($Snap.combine ($Snap.first $t@14@01) ($Snap.second $t@14@01))))
(assert (= ($Snap.first $t@14@01) $Snap.unit))
; [eval] |xs| == |ys|
; [eval] |xs|
; [eval] |ys|
(assert (= (Seq_length xs@12@01) (Seq_length ys@13@01)))
(assert (=
  ($Snap.second $t@14@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@14@01))
    ($Snap.second ($Snap.second $t@14@01)))))
(assert (= ($Snap.first ($Snap.second $t@14@01)) $Snap.unit))
; [eval] (forall i: Int, j: Int :: { xs[i], xs[j] } 0 <= i && (i < |xs| && (0 <= j && j < |xs|)) ==> xs[i] == xs[j] ==> i == j)
(declare-const i@15@01 Int)
(declare-const j@16@01 Int)
(push) ; 2
; [eval] 0 <= i && (i < |xs| && (0 <= j && j < |xs|)) ==> xs[i] == xs[j] ==> i == j
; [eval] 0 <= i && (i < |xs| && (0 <= j && j < |xs|))
; [eval] 0 <= i
(push) ; 3
; [then-branch: 7 | !(0 <= i@15@01) | live]
; [else-branch: 7 | 0 <= i@15@01 | live]
(push) ; 4
; [then-branch: 7 | !(0 <= i@15@01)]
(assert (not (<= 0 i@15@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 7 | 0 <= i@15@01]
(assert (<= 0 i@15@01))
; [eval] i < |xs|
; [eval] |xs|
(push) ; 5
; [then-branch: 8 | !(i@15@01 < |xs@12@01|) | live]
; [else-branch: 8 | i@15@01 < |xs@12@01| | live]
(push) ; 6
; [then-branch: 8 | !(i@15@01 < |xs@12@01|)]
(assert (not (< i@15@01 (Seq_length xs@12@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 8 | i@15@01 < |xs@12@01|]
(assert (< i@15@01 (Seq_length xs@12@01)))
; [eval] 0 <= j
(push) ; 7
; [then-branch: 9 | !(0 <= j@16@01) | live]
; [else-branch: 9 | 0 <= j@16@01 | live]
(push) ; 8
; [then-branch: 9 | !(0 <= j@16@01)]
(assert (not (<= 0 j@16@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 9 | 0 <= j@16@01]
(assert (<= 0 j@16@01))
; [eval] j < |xs|
; [eval] |xs|
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j@16@01) (not (<= 0 j@16@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i@15@01 (Seq_length xs@12@01))
  (and
    (< i@15@01 (Seq_length xs@12@01))
    (or (<= 0 j@16@01) (not (<= 0 j@16@01))))))
(assert (or (< i@15@01 (Seq_length xs@12@01)) (not (< i@15@01 (Seq_length xs@12@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i@15@01)
  (and
    (<= 0 i@15@01)
    (=>
      (< i@15@01 (Seq_length xs@12@01))
      (and
        (< i@15@01 (Seq_length xs@12@01))
        (or (<= 0 j@16@01) (not (<= 0 j@16@01)))))
    (or
      (< i@15@01 (Seq_length xs@12@01))
      (not (< i@15@01 (Seq_length xs@12@01)))))))
(assert (or (<= 0 i@15@01) (not (<= 0 i@15@01))))
(push) ; 3
; [then-branch: 10 | 0 <= i@15@01 && i@15@01 < |xs@12@01| && 0 <= j@16@01 && j@16@01 < |xs@12@01| | live]
; [else-branch: 10 | !(0 <= i@15@01 && i@15@01 < |xs@12@01| && 0 <= j@16@01 && j@16@01 < |xs@12@01|) | live]
(push) ; 4
; [then-branch: 10 | 0 <= i@15@01 && i@15@01 < |xs@12@01| && 0 <= j@16@01 && j@16@01 < |xs@12@01|]
(assert (and
  (<= 0 i@15@01)
  (and
    (< i@15@01 (Seq_length xs@12@01))
    (and (<= 0 j@16@01) (< j@16@01 (Seq_length xs@12@01))))))
; [eval] xs[i] == xs[j] ==> i == j
; [eval] xs[i] == xs[j]
; [eval] xs[i]
(push) ; 5
(assert (not (>= i@15@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] xs[j]
(push) ; 5
(assert (not (>= j@16@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
; [then-branch: 11 | xs@12@01[i@15@01] == xs@12@01[j@16@01] | live]
; [else-branch: 11 | xs@12@01[i@15@01] != xs@12@01[j@16@01] | live]
(push) ; 6
; [then-branch: 11 | xs@12@01[i@15@01] == xs@12@01[j@16@01]]
(assert (= (Seq_index xs@12@01 i@15@01) (Seq_index xs@12@01 j@16@01)))
; [eval] i == j
(pop) ; 6
(push) ; 6
; [else-branch: 11 | xs@12@01[i@15@01] != xs@12@01[j@16@01]]
(assert (not (= (Seq_index xs@12@01 i@15@01) (Seq_index xs@12@01 j@16@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or
  (not (= (Seq_index xs@12@01 i@15@01) (Seq_index xs@12@01 j@16@01)))
  (= (Seq_index xs@12@01 i@15@01) (Seq_index xs@12@01 j@16@01))))
(pop) ; 4
(push) ; 4
; [else-branch: 10 | !(0 <= i@15@01 && i@15@01 < |xs@12@01| && 0 <= j@16@01 && j@16@01 < |xs@12@01|)]
(assert (not
  (and
    (<= 0 i@15@01)
    (and
      (< i@15@01 (Seq_length xs@12@01))
      (and (<= 0 j@16@01) (< j@16@01 (Seq_length xs@12@01)))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (<= 0 i@15@01)
    (and
      (< i@15@01 (Seq_length xs@12@01))
      (and (<= 0 j@16@01) (< j@16@01 (Seq_length xs@12@01)))))
  (and
    (<= 0 i@15@01)
    (< i@15@01 (Seq_length xs@12@01))
    (<= 0 j@16@01)
    (< j@16@01 (Seq_length xs@12@01))
    (or
      (not (= (Seq_index xs@12@01 i@15@01) (Seq_index xs@12@01 j@16@01)))
      (= (Seq_index xs@12@01 i@15@01) (Seq_index xs@12@01 j@16@01))))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i@15@01)
      (and
        (< i@15@01 (Seq_length xs@12@01))
        (and (<= 0 j@16@01) (< j@16@01 (Seq_length xs@12@01))))))
  (and
    (<= 0 i@15@01)
    (and
      (< i@15@01 (Seq_length xs@12@01))
      (and (<= 0 j@16@01) (< j@16@01 (Seq_length xs@12@01)))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@15@01 Int) (j@16@01 Int)) (!
  (and
    (=>
      (<= 0 i@15@01)
      (and
        (<= 0 i@15@01)
        (=>
          (< i@15@01 (Seq_length xs@12@01))
          (and
            (< i@15@01 (Seq_length xs@12@01))
            (or (<= 0 j@16@01) (not (<= 0 j@16@01)))))
        (or
          (< i@15@01 (Seq_length xs@12@01))
          (not (< i@15@01 (Seq_length xs@12@01))))))
    (or (<= 0 i@15@01) (not (<= 0 i@15@01)))
    (=>
      (and
        (<= 0 i@15@01)
        (and
          (< i@15@01 (Seq_length xs@12@01))
          (and (<= 0 j@16@01) (< j@16@01 (Seq_length xs@12@01)))))
      (and
        (<= 0 i@15@01)
        (< i@15@01 (Seq_length xs@12@01))
        (<= 0 j@16@01)
        (< j@16@01 (Seq_length xs@12@01))
        (or
          (not (= (Seq_index xs@12@01 i@15@01) (Seq_index xs@12@01 j@16@01)))
          (= (Seq_index xs@12@01 i@15@01) (Seq_index xs@12@01 j@16@01)))))
    (or
      (not
        (and
          (<= 0 i@15@01)
          (and
            (< i@15@01 (Seq_length xs@12@01))
            (and (<= 0 j@16@01) (< j@16@01 (Seq_length xs@12@01))))))
      (and
        (<= 0 i@15@01)
        (and
          (< i@15@01 (Seq_length xs@12@01))
          (and (<= 0 j@16@01) (< j@16@01 (Seq_length xs@12@01)))))))
  :pattern ((Seq_index xs@12@01 i@15@01) (Seq_index xs@12@01 j@16@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0637.vpr@23@15@23@110-aux|)))
(assert (forall ((i@15@01 Int) (j@16@01 Int)) (!
  (=>
    (and
      (and
        (<= 0 i@15@01)
        (and
          (< i@15@01 (Seq_length xs@12@01))
          (and (<= 0 j@16@01) (< j@16@01 (Seq_length xs@12@01)))))
      (= (Seq_index xs@12@01 i@15@01) (Seq_index xs@12@01 j@16@01)))
    (= i@15@01 j@16@01))
  :pattern ((Seq_index xs@12@01 i@15@01) (Seq_index xs@12@01 j@16@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0637.vpr@23@15@23@110|)))
(assert (=
  ($Snap.second ($Snap.second $t@14@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@14@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@14@01))))))
(declare-const i@17@01 Int)
(push) ; 2
; [eval] 0 <= i && i < |xs| && (let j == (ys[i]) in true)
; [eval] 0 <= i
(push) ; 3
; [then-branch: 12 | !(0 <= i@17@01) | live]
; [else-branch: 12 | 0 <= i@17@01 | live]
(push) ; 4
; [then-branch: 12 | !(0 <= i@17@01)]
(assert (not (<= 0 i@17@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 12 | 0 <= i@17@01]
(assert (<= 0 i@17@01))
; [eval] i < |xs|
; [eval] |xs|
(push) ; 5
; [then-branch: 13 | !(i@17@01 < |xs@12@01|) | live]
; [else-branch: 13 | i@17@01 < |xs@12@01| | live]
(push) ; 6
; [then-branch: 13 | !(i@17@01 < |xs@12@01|)]
(assert (not (< i@17@01 (Seq_length xs@12@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 13 | i@17@01 < |xs@12@01|]
(assert (< i@17@01 (Seq_length xs@12@01)))
; [eval] (let j == (ys[i]) in true)
; [eval] ys[i]
(push) ; 7
(assert (not (>= i@17@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@17@01 (Seq_length ys@13@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(declare-fun letvar@18@01 (Int) Int)
(assert (= (letvar@18@01 i@17@01) (Seq_index ys@13@01 i@17@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i@17@01 (Seq_length xs@12@01))
  (and
    (< i@17@01 (Seq_length xs@12@01))
    (= (letvar@18@01 i@17@01) (Seq_index ys@13@01 i@17@01)))))
(assert (or (< i@17@01 (Seq_length xs@12@01)) (not (< i@17@01 (Seq_length xs@12@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i@17@01)
  (and
    (<= 0 i@17@01)
    (=>
      (< i@17@01 (Seq_length xs@12@01))
      (and
        (< i@17@01 (Seq_length xs@12@01))
        (= (letvar@18@01 i@17@01) (Seq_index ys@13@01 i@17@01))))
    (or
      (< i@17@01 (Seq_length xs@12@01))
      (not (< i@17@01 (Seq_length xs@12@01)))))))
(assert (or (<= 0 i@17@01) (not (<= 0 i@17@01))))
(assert (and (<= 0 i@17@01) (< i@17@01 (Seq_length xs@12@01))))
; [eval] xs[i]
(push) ; 3
(assert (not (>= i@17@01 0)))
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
(assert (forall ((i@17@01 Int)) (!
  (=>
    (and (<= 0 i@17@01) (< i@17@01 (Seq_length xs@12@01)))
    (and
      (=>
        (<= 0 i@17@01)
        (and
          (<= 0 i@17@01)
          (=>
            (< i@17@01 (Seq_length xs@12@01))
            (and
              (< i@17@01 (Seq_length xs@12@01))
              (= (letvar@18@01 i@17@01) (Seq_index ys@13@01 i@17@01))))
          (or
            (< i@17@01 (Seq_length xs@12@01))
            (not (< i@17@01 (Seq_length xs@12@01))))))
      (or (<= 0 i@17@01) (not (<= 0 i@17@01)))))
  :pattern ((Seq_index xs@12@01 i@17@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@17@01 Int) (i2@17@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@17@01) (< i1@17@01 (Seq_length xs@12@01)))
      (and (<= 0 i2@17@01) (< i2@17@01 (Seq_length xs@12@01)))
      (= (Seq_index xs@12@01 i1@17@01) (Seq_index xs@12@01 i2@17@01)))
    (= i1@17@01 i2@17@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@17@01 Int)) (!
  (=>
    (and (<= 0 i@17@01) (< i@17@01 (Seq_length xs@12@01)))
    (and
      (= (inv@19@01 (Seq_index xs@12@01 i@17@01)) i@17@01)
      (img@20@01 (Seq_index xs@12@01 i@17@01))))
  :pattern ((Seq_index xs@12@01 i@17@01))
  :qid |quant-u-1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@20@01 r)
      (and (<= 0 (inv@19@01 r)) (< (inv@19@01 r) (Seq_length xs@12@01))))
    (= (Seq_index xs@12@01 (inv@19@01 r)) r))
  :pattern ((inv@19@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@17@01 Int)) (!
  (=>
    (and (<= 0 i@17@01) (< i@17@01 (Seq_length xs@12@01)))
    (not (= (Seq_index xs@12@01 i@17@01) $Ref.null)))
  :pattern ((Seq_index xs@12@01 i@17@01))
  :qid |f-permImpliesNonNull|)))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@14@01))) $Snap.unit))
; [eval] (forall i: Int :: { ys[i] } { xs[i] } 0 <= i && i < |xs| ==> (let j == (ys[i]) in true ==> xs[i].f == j))
(declare-const i@21@01 Int)
(push) ; 2
; [eval] 0 <= i && i < |xs| ==> (let j == (ys[i]) in true ==> xs[i].f == j)
; [eval] 0 <= i && i < |xs|
; [eval] 0 <= i
(push) ; 3
; [then-branch: 14 | !(0 <= i@21@01) | live]
; [else-branch: 14 | 0 <= i@21@01 | live]
(push) ; 4
; [then-branch: 14 | !(0 <= i@21@01)]
(assert (not (<= 0 i@21@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 14 | 0 <= i@21@01]
(assert (<= 0 i@21@01))
; [eval] i < |xs|
; [eval] |xs|
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@21@01) (not (<= 0 i@21@01))))
(push) ; 3
; [then-branch: 15 | 0 <= i@21@01 && i@21@01 < |xs@12@01| | live]
; [else-branch: 15 | !(0 <= i@21@01 && i@21@01 < |xs@12@01|) | live]
(push) ; 4
; [then-branch: 15 | 0 <= i@21@01 && i@21@01 < |xs@12@01|]
(assert (and (<= 0 i@21@01) (< i@21@01 (Seq_length xs@12@01))))
; [eval] (let j == (ys[i]) in true ==> xs[i].f == j)
; [eval] ys[i]
(push) ; 5
(assert (not (>= i@21@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@21@01 (Seq_length ys@13@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(declare-fun letvar@22@01 (Int) Int)
(assert (= (letvar@22@01 i@21@01) (Seq_index ys@13@01 i@21@01)))
; [eval] true ==> xs[i].f == j
(push) ; 5
(push) ; 6
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 16 | True | live]
; [else-branch: 16 | False | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 16 | True]
; [eval] xs[i].f == j
; [eval] xs[i]
(push) ; 7
(assert (not (>= i@21@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (and
  (img@20@01 (Seq_index xs@12@01 i@21@01))
  (and
    (<= 0 (inv@19@01 (Seq_index xs@12@01 i@21@01)))
    (< (inv@19@01 (Seq_index xs@12@01 i@21@01)) (Seq_length xs@12@01))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(pop) ; 5
; Joined path conditions
(pop) ; 4
(push) ; 4
; [else-branch: 15 | !(0 <= i@21@01 && i@21@01 < |xs@12@01|)]
(assert (not (and (<= 0 i@21@01) (< i@21@01 (Seq_length xs@12@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and (<= 0 i@21@01) (< i@21@01 (Seq_length xs@12@01)))
  (and
    (<= 0 i@21@01)
    (< i@21@01 (Seq_length xs@12@01))
    (= (letvar@22@01 i@21@01) (Seq_index ys@13@01 i@21@01)))))
; Joined path conditions
(assert (or
  (not (and (<= 0 i@21@01) (< i@21@01 (Seq_length xs@12@01))))
  (and (<= 0 i@21@01) (< i@21@01 (Seq_length xs@12@01)))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@21@01 Int)) (!
  (and
    (or (<= 0 i@21@01) (not (<= 0 i@21@01)))
    (=>
      (and (<= 0 i@21@01) (< i@21@01 (Seq_length xs@12@01)))
      (and
        (<= 0 i@21@01)
        (< i@21@01 (Seq_length xs@12@01))
        (= (letvar@22@01 i@21@01) (Seq_index ys@13@01 i@21@01))))
    (or
      (not (and (<= 0 i@21@01) (< i@21@01 (Seq_length xs@12@01))))
      (and (<= 0 i@21@01) (< i@21@01 (Seq_length xs@12@01)))))
  :pattern ((Seq_index ys@13@01 i@21@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0637.vpr@24@15@24@108-aux|)))
(assert (forall ((i@21@01 Int)) (!
  (and
    (or (<= 0 i@21@01) (not (<= 0 i@21@01)))
    (=>
      (and (<= 0 i@21@01) (< i@21@01 (Seq_length xs@12@01)))
      (and
        (<= 0 i@21@01)
        (< i@21@01 (Seq_length xs@12@01))
        (= (letvar@22@01 i@21@01) (Seq_index ys@13@01 i@21@01))))
    (or
      (not (and (<= 0 i@21@01) (< i@21@01 (Seq_length xs@12@01))))
      (and (<= 0 i@21@01) (< i@21@01 (Seq_length xs@12@01)))))
  :pattern ((Seq_index xs@12@01 i@21@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0637.vpr@24@15@24@108-aux|)))
(assert (forall ((i@21@01 Int)) (!
  (=>
    (and (<= 0 i@21@01) (< i@21@01 (Seq_length xs@12@01)))
    (=
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@14@01)))) (Seq_index
        xs@12@01
        i@21@01))
      (Seq_index ys@13@01 i@21@01)))
  :pattern ((Seq_index ys@13@01 i@21@01))
  :pattern ((Seq_index xs@12@01 i@21@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0637.vpr@24@15@24@108|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; inhale |xs| > 3
(declare-const $t@23@01 $Snap)
(assert (= $t@23@01 $Snap.unit))
; [eval] |xs| > 3
; [eval] |xs|
(assert (> (Seq_length xs@12@01) 3))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert xs[2].f == ys[2]
; [eval] xs[2].f == ys[2]
; [eval] xs[2]
(set-option :timeout 0)
(push) ; 3
(assert (not (< 2 (Seq_length xs@12@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (and
  (img@20@01 (Seq_index xs@12@01 2))
  (and
    (<= 0 (inv@19@01 (Seq_index xs@12@01 2)))
    (< (inv@19@01 (Seq_index xs@12@01 2)) (Seq_length xs@12@01))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] ys[2]
(push) ; 3
(assert (not (< 2 (Seq_length ys@13@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (=
  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@14@01)))) (Seq_index
    xs@12@01
    2))
  (Seq_index ys@13@01 2))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@14@01)))) (Seq_index
    xs@12@01
    2))
  (Seq_index ys@13@01 2)))
; [exec]
; assert false
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const sm@24@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@20@01 r)
      (and (<= 0 (inv@19@01 r)) (< (inv@19@01 r) (Seq_length xs@12@01))))
    (=
      ($FVF.lookup_f (as sm@24@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@14@01)))) r)))
  :pattern (($FVF.lookup_f (as sm@24@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@14@01)))) r))
  :qid |qp.fvfValDef1|)))
(declare-const pm@25@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@25@01  $FPM) r)
    (ite
      (and
        (img@20@01 r)
        (and (<= 0 (inv@19@01 r)) (< (inv@19@01 r) (Seq_length xs@12@01))))
      (/ (to_real 1) (to_real 2))
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@25@01  $FPM) r))
  :qid |qp.resPrmSumDef2|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@25@01  $FPM) r) $Perm.Write)
  :pattern ((inv@19@01 r))
  :qid |qp-fld-prm-bnd|)))
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 2
(pop) ; 1
; ---------- test4 ----------
(declare-const xs@26@01 Seq<$Ref>)
(declare-const ys@27@01 Seq<Int>)
(declare-const xs@28@01 Seq<$Ref>)
(declare-const ys@29@01 Seq<Int>)
(push) ; 1
(declare-const $t@30@01 $Snap)
(assert (= $t@30@01 ($Snap.combine ($Snap.first $t@30@01) ($Snap.second $t@30@01))))
(assert (= ($Snap.first $t@30@01) $Snap.unit))
; [eval] |xs| == |ys|
; [eval] |xs|
; [eval] |ys|
(assert (= (Seq_length xs@28@01) (Seq_length ys@29@01)))
(assert (=
  ($Snap.second $t@30@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@30@01))
    ($Snap.second ($Snap.second $t@30@01)))))
(assert (= ($Snap.first ($Snap.second $t@30@01)) $Snap.unit))
; [eval] (forall i: Int, j: Int :: { xs[i], xs[j] } 0 <= i && (i < |xs| && (0 <= j && j < |xs|)) ==> xs[i] == xs[j] ==> i == j)
(declare-const i@31@01 Int)
(declare-const j@32@01 Int)
(push) ; 2
; [eval] 0 <= i && (i < |xs| && (0 <= j && j < |xs|)) ==> xs[i] == xs[j] ==> i == j
; [eval] 0 <= i && (i < |xs| && (0 <= j && j < |xs|))
; [eval] 0 <= i
(push) ; 3
; [then-branch: 17 | !(0 <= i@31@01) | live]
; [else-branch: 17 | 0 <= i@31@01 | live]
(push) ; 4
; [then-branch: 17 | !(0 <= i@31@01)]
(assert (not (<= 0 i@31@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 17 | 0 <= i@31@01]
(assert (<= 0 i@31@01))
; [eval] i < |xs|
; [eval] |xs|
(push) ; 5
; [then-branch: 18 | !(i@31@01 < |xs@28@01|) | live]
; [else-branch: 18 | i@31@01 < |xs@28@01| | live]
(push) ; 6
; [then-branch: 18 | !(i@31@01 < |xs@28@01|)]
(assert (not (< i@31@01 (Seq_length xs@28@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 18 | i@31@01 < |xs@28@01|]
(assert (< i@31@01 (Seq_length xs@28@01)))
; [eval] 0 <= j
(push) ; 7
; [then-branch: 19 | !(0 <= j@32@01) | live]
; [else-branch: 19 | 0 <= j@32@01 | live]
(push) ; 8
; [then-branch: 19 | !(0 <= j@32@01)]
(assert (not (<= 0 j@32@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 19 | 0 <= j@32@01]
(assert (<= 0 j@32@01))
; [eval] j < |xs|
; [eval] |xs|
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 j@32@01) (not (<= 0 j@32@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i@31@01 (Seq_length xs@28@01))
  (and
    (< i@31@01 (Seq_length xs@28@01))
    (or (<= 0 j@32@01) (not (<= 0 j@32@01))))))
(assert (or (< i@31@01 (Seq_length xs@28@01)) (not (< i@31@01 (Seq_length xs@28@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i@31@01)
  (and
    (<= 0 i@31@01)
    (=>
      (< i@31@01 (Seq_length xs@28@01))
      (and
        (< i@31@01 (Seq_length xs@28@01))
        (or (<= 0 j@32@01) (not (<= 0 j@32@01)))))
    (or
      (< i@31@01 (Seq_length xs@28@01))
      (not (< i@31@01 (Seq_length xs@28@01)))))))
(assert (or (<= 0 i@31@01) (not (<= 0 i@31@01))))
(push) ; 3
; [then-branch: 20 | 0 <= i@31@01 && i@31@01 < |xs@28@01| && 0 <= j@32@01 && j@32@01 < |xs@28@01| | live]
; [else-branch: 20 | !(0 <= i@31@01 && i@31@01 < |xs@28@01| && 0 <= j@32@01 && j@32@01 < |xs@28@01|) | live]
(push) ; 4
; [then-branch: 20 | 0 <= i@31@01 && i@31@01 < |xs@28@01| && 0 <= j@32@01 && j@32@01 < |xs@28@01|]
(assert (and
  (<= 0 i@31@01)
  (and
    (< i@31@01 (Seq_length xs@28@01))
    (and (<= 0 j@32@01) (< j@32@01 (Seq_length xs@28@01))))))
; [eval] xs[i] == xs[j] ==> i == j
; [eval] xs[i] == xs[j]
; [eval] xs[i]
(push) ; 5
(assert (not (>= i@31@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] xs[j]
(push) ; 5
(assert (not (>= j@32@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
; [then-branch: 21 | xs@28@01[i@31@01] == xs@28@01[j@32@01] | live]
; [else-branch: 21 | xs@28@01[i@31@01] != xs@28@01[j@32@01] | live]
(push) ; 6
; [then-branch: 21 | xs@28@01[i@31@01] == xs@28@01[j@32@01]]
(assert (= (Seq_index xs@28@01 i@31@01) (Seq_index xs@28@01 j@32@01)))
; [eval] i == j
(pop) ; 6
(push) ; 6
; [else-branch: 21 | xs@28@01[i@31@01] != xs@28@01[j@32@01]]
(assert (not (= (Seq_index xs@28@01 i@31@01) (Seq_index xs@28@01 j@32@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or
  (not (= (Seq_index xs@28@01 i@31@01) (Seq_index xs@28@01 j@32@01)))
  (= (Seq_index xs@28@01 i@31@01) (Seq_index xs@28@01 j@32@01))))
(pop) ; 4
(push) ; 4
; [else-branch: 20 | !(0 <= i@31@01 && i@31@01 < |xs@28@01| && 0 <= j@32@01 && j@32@01 < |xs@28@01|)]
(assert (not
  (and
    (<= 0 i@31@01)
    (and
      (< i@31@01 (Seq_length xs@28@01))
      (and (<= 0 j@32@01) (< j@32@01 (Seq_length xs@28@01)))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (<= 0 i@31@01)
    (and
      (< i@31@01 (Seq_length xs@28@01))
      (and (<= 0 j@32@01) (< j@32@01 (Seq_length xs@28@01)))))
  (and
    (<= 0 i@31@01)
    (< i@31@01 (Seq_length xs@28@01))
    (<= 0 j@32@01)
    (< j@32@01 (Seq_length xs@28@01))
    (or
      (not (= (Seq_index xs@28@01 i@31@01) (Seq_index xs@28@01 j@32@01)))
      (= (Seq_index xs@28@01 i@31@01) (Seq_index xs@28@01 j@32@01))))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i@31@01)
      (and
        (< i@31@01 (Seq_length xs@28@01))
        (and (<= 0 j@32@01) (< j@32@01 (Seq_length xs@28@01))))))
  (and
    (<= 0 i@31@01)
    (and
      (< i@31@01 (Seq_length xs@28@01))
      (and (<= 0 j@32@01) (< j@32@01 (Seq_length xs@28@01)))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@31@01 Int) (j@32@01 Int)) (!
  (and
    (=>
      (<= 0 i@31@01)
      (and
        (<= 0 i@31@01)
        (=>
          (< i@31@01 (Seq_length xs@28@01))
          (and
            (< i@31@01 (Seq_length xs@28@01))
            (or (<= 0 j@32@01) (not (<= 0 j@32@01)))))
        (or
          (< i@31@01 (Seq_length xs@28@01))
          (not (< i@31@01 (Seq_length xs@28@01))))))
    (or (<= 0 i@31@01) (not (<= 0 i@31@01)))
    (=>
      (and
        (<= 0 i@31@01)
        (and
          (< i@31@01 (Seq_length xs@28@01))
          (and (<= 0 j@32@01) (< j@32@01 (Seq_length xs@28@01)))))
      (and
        (<= 0 i@31@01)
        (< i@31@01 (Seq_length xs@28@01))
        (<= 0 j@32@01)
        (< j@32@01 (Seq_length xs@28@01))
        (or
          (not (= (Seq_index xs@28@01 i@31@01) (Seq_index xs@28@01 j@32@01)))
          (= (Seq_index xs@28@01 i@31@01) (Seq_index xs@28@01 j@32@01)))))
    (or
      (not
        (and
          (<= 0 i@31@01)
          (and
            (< i@31@01 (Seq_length xs@28@01))
            (and (<= 0 j@32@01) (< j@32@01 (Seq_length xs@28@01))))))
      (and
        (<= 0 i@31@01)
        (and
          (< i@31@01 (Seq_length xs@28@01))
          (and (<= 0 j@32@01) (< j@32@01 (Seq_length xs@28@01)))))))
  :pattern ((Seq_index xs@28@01 i@31@01) (Seq_index xs@28@01 j@32@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0637.vpr@34@15@34@110-aux|)))
(assert (forall ((i@31@01 Int) (j@32@01 Int)) (!
  (=>
    (and
      (and
        (<= 0 i@31@01)
        (and
          (< i@31@01 (Seq_length xs@28@01))
          (and (<= 0 j@32@01) (< j@32@01 (Seq_length xs@28@01)))))
      (= (Seq_index xs@28@01 i@31@01) (Seq_index xs@28@01 j@32@01)))
    (= i@31@01 j@32@01))
  :pattern ((Seq_index xs@28@01 i@31@01) (Seq_index xs@28@01 j@32@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0637.vpr@34@15@34@110|)))
(assert (=
  ($Snap.second ($Snap.second $t@30@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@30@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@30@01))))))
(declare-const i@33@01 Int)
(push) ; 2
; [eval] 0 <= i && i < |xs| && (let j == (i) in true)
; [eval] 0 <= i
(push) ; 3
; [then-branch: 22 | !(0 <= i@33@01) | live]
; [else-branch: 22 | 0 <= i@33@01 | live]
(push) ; 4
; [then-branch: 22 | !(0 <= i@33@01)]
(assert (not (<= 0 i@33@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 22 | 0 <= i@33@01]
(assert (<= 0 i@33@01))
; [eval] i < |xs|
; [eval] |xs|
(push) ; 5
; [then-branch: 23 | !(i@33@01 < |xs@28@01|) | live]
; [else-branch: 23 | i@33@01 < |xs@28@01| | live]
(push) ; 6
; [then-branch: 23 | !(i@33@01 < |xs@28@01|)]
(assert (not (< i@33@01 (Seq_length xs@28@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 23 | i@33@01 < |xs@28@01|]
(assert (< i@33@01 (Seq_length xs@28@01)))
; [eval] (let j == (i) in true)
(declare-fun letvar@34@01 (Int) Int)
(assert (= (letvar@34@01 i@33@01) i@33@01))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i@33@01 (Seq_length xs@28@01))
  (and (< i@33@01 (Seq_length xs@28@01)) (= (letvar@34@01 i@33@01) i@33@01))))
(assert (or (< i@33@01 (Seq_length xs@28@01)) (not (< i@33@01 (Seq_length xs@28@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i@33@01)
  (and
    (<= 0 i@33@01)
    (=>
      (< i@33@01 (Seq_length xs@28@01))
      (and (< i@33@01 (Seq_length xs@28@01)) (= (letvar@34@01 i@33@01) i@33@01)))
    (or
      (< i@33@01 (Seq_length xs@28@01))
      (not (< i@33@01 (Seq_length xs@28@01)))))))
(assert (or (<= 0 i@33@01) (not (<= 0 i@33@01))))
(assert (and (<= 0 i@33@01) (< i@33@01 (Seq_length xs@28@01))))
; [eval] xs[i]
(push) ; 3
(assert (not (>= i@33@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@35@01 ($Ref) Int)
(declare-fun img@36@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@33@01 Int)) (!
  (=>
    (and (<= 0 i@33@01) (< i@33@01 (Seq_length xs@28@01)))
    (and
      (=>
        (<= 0 i@33@01)
        (and
          (<= 0 i@33@01)
          (=>
            (< i@33@01 (Seq_length xs@28@01))
            (and
              (< i@33@01 (Seq_length xs@28@01))
              (= (letvar@34@01 i@33@01) i@33@01)))
          (or
            (< i@33@01 (Seq_length xs@28@01))
            (not (< i@33@01 (Seq_length xs@28@01))))))
      (or (<= 0 i@33@01) (not (<= 0 i@33@01)))))
  :pattern ((Seq_index xs@28@01 i@33@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@33@01 Int) (i2@33@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@33@01) (< i1@33@01 (Seq_length xs@28@01)))
      (and (<= 0 i2@33@01) (< i2@33@01 (Seq_length xs@28@01)))
      (= (Seq_index xs@28@01 i1@33@01) (Seq_index xs@28@01 i2@33@01)))
    (= i1@33@01 i2@33@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@33@01 Int)) (!
  (=>
    (and (<= 0 i@33@01) (< i@33@01 (Seq_length xs@28@01)))
    (and
      (= (inv@35@01 (Seq_index xs@28@01 i@33@01)) i@33@01)
      (img@36@01 (Seq_index xs@28@01 i@33@01))))
  :pattern ((Seq_index xs@28@01 i@33@01))
  :qid |quant-u-3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@36@01 r)
      (and (<= 0 (inv@35@01 r)) (< (inv@35@01 r) (Seq_length xs@28@01))))
    (= (Seq_index xs@28@01 (inv@35@01 r)) r))
  :pattern ((inv@35@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@33@01 Int)) (!
  (=>
    (and (<= 0 i@33@01) (< i@33@01 (Seq_length xs@28@01)))
    (not (= (Seq_index xs@28@01 i@33@01) $Ref.null)))
  :pattern ((Seq_index xs@28@01 i@33@01))
  :qid |f-permImpliesNonNull|)))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@30@01))) $Snap.unit))
; [eval] (forall i: Int :: { xs[i] } 0 <= i && i < |xs| ==> (let j == (i) in true ==> xs[i].f == 0))
(declare-const i@37@01 Int)
(push) ; 2
; [eval] 0 <= i && i < |xs| ==> (let j == (i) in true ==> xs[i].f == 0)
; [eval] 0 <= i && i < |xs|
; [eval] 0 <= i
(push) ; 3
; [then-branch: 24 | !(0 <= i@37@01) | live]
; [else-branch: 24 | 0 <= i@37@01 | live]
(push) ; 4
; [then-branch: 24 | !(0 <= i@37@01)]
(assert (not (<= 0 i@37@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 24 | 0 <= i@37@01]
(assert (<= 0 i@37@01))
; [eval] i < |xs|
; [eval] |xs|
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@37@01) (not (<= 0 i@37@01))))
(push) ; 3
; [then-branch: 25 | 0 <= i@37@01 && i@37@01 < |xs@28@01| | live]
; [else-branch: 25 | !(0 <= i@37@01 && i@37@01 < |xs@28@01|) | live]
(push) ; 4
; [then-branch: 25 | 0 <= i@37@01 && i@37@01 < |xs@28@01|]
(assert (and (<= 0 i@37@01) (< i@37@01 (Seq_length xs@28@01))))
; [eval] (let j == (i) in true ==> xs[i].f == 0)
(declare-fun letvar@38@01 (Int) Int)
(assert (= (letvar@38@01 i@37@01) i@37@01))
; [eval] true ==> xs[i].f == 0
(push) ; 5
(push) ; 6
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 26 | True | live]
; [else-branch: 26 | False | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 26 | True]
; [eval] xs[i].f == 0
; [eval] xs[i]
(push) ; 7
(assert (not (>= i@37@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (and
  (img@36@01 (Seq_index xs@28@01 i@37@01))
  (and
    (<= 0 (inv@35@01 (Seq_index xs@28@01 i@37@01)))
    (< (inv@35@01 (Seq_index xs@28@01 i@37@01)) (Seq_length xs@28@01))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(pop) ; 5
; Joined path conditions
(pop) ; 4
(push) ; 4
; [else-branch: 25 | !(0 <= i@37@01 && i@37@01 < |xs@28@01|)]
(assert (not (and (<= 0 i@37@01) (< i@37@01 (Seq_length xs@28@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and (<= 0 i@37@01) (< i@37@01 (Seq_length xs@28@01)))
  (and
    (<= 0 i@37@01)
    (< i@37@01 (Seq_length xs@28@01))
    (= (letvar@38@01 i@37@01) i@37@01))))
; Joined path conditions
(assert (or
  (not (and (<= 0 i@37@01) (< i@37@01 (Seq_length xs@28@01))))
  (and (<= 0 i@37@01) (< i@37@01 (Seq_length xs@28@01)))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@37@01 Int)) (!
  (and
    (or (<= 0 i@37@01) (not (<= 0 i@37@01)))
    (=>
      (and (<= 0 i@37@01) (< i@37@01 (Seq_length xs@28@01)))
      (and
        (<= 0 i@37@01)
        (< i@37@01 (Seq_length xs@28@01))
        (= (letvar@38@01 i@37@01) i@37@01)))
    (or
      (not (and (<= 0 i@37@01) (< i@37@01 (Seq_length xs@28@01))))
      (and (<= 0 i@37@01) (< i@37@01 (Seq_length xs@28@01)))))
  :pattern ((Seq_index xs@28@01 i@37@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0637.vpr@35@15@35@104-aux|)))
(assert (forall ((i@37@01 Int)) (!
  (=>
    (and (<= 0 i@37@01) (< i@37@01 (Seq_length xs@28@01)))
    (=
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@30@01)))) (Seq_index
        xs@28@01
        i@37@01))
      0))
  :pattern ((Seq_index xs@28@01 i@37@01))
  :qid |prog./silicon/silver/src/test/resources/all/issues/silver/0637.vpr@35@15@35@104|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; inhale |xs| > 3
(declare-const $t@39@01 $Snap)
(assert (= $t@39@01 $Snap.unit))
; [eval] |xs| > 3
; [eval] |xs|
(assert (> (Seq_length xs@28@01) 3))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; assert xs[2].f == 0
; [eval] xs[2].f == 0
; [eval] xs[2]
(set-option :timeout 0)
(push) ; 3
(assert (not (< 2 (Seq_length xs@28@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (and
  (img@36@01 (Seq_index xs@28@01 2))
  (and
    (<= 0 (inv@35@01 (Seq_index xs@28@01 2)))
    (< (inv@35@01 (Seq_index xs@28@01 2)) (Seq_length xs@28@01))))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (=
  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@30@01)))) (Seq_index
    xs@28@01
    2))
  0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@30@01)))) (Seq_index
    xs@28@01
    2))
  0))
; [exec]
; assert false
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const sm@40@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@36@01 r)
      (and (<= 0 (inv@35@01 r)) (< (inv@35@01 r) (Seq_length xs@28@01))))
    (=
      ($FVF.lookup_f (as sm@40@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@30@01)))) r)))
  :pattern (($FVF.lookup_f (as sm@40@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second $t@30@01)))) r))
  :qid |qp.fvfValDef3|)))
(declare-const pm@41@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@41@01  $FPM) r)
    (ite
      (and
        (img@36@01 r)
        (and (<= 0 (inv@35@01 r)) (< (inv@35@01 r) (Seq_length xs@28@01))))
      (/ (to_real 1) (to_real 2))
      $Perm.No))
  :pattern (($FVF.perm_f (as pm@41@01  $FPM) r))
  :qid |qp.resPrmSumDef4|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@41@01  $FPM) r) $Perm.Write)
  :pattern ((inv@35@01 r))
  :qid |qp-fld-prm-bnd|)))
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 2
(pop) ; 1
