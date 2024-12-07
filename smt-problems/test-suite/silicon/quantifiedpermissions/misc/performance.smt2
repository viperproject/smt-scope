(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:18:52
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr
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
; ---------- init ----------
(declare-const xs@0@01 Seq<$Ref>)
(declare-const xs@1@01 Seq<$Ref>)
(set-option :timeout 0)
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@2@01 $Snap)
(assert (= $t@2@01 ($Snap.combine ($Snap.first $t@2@01) ($Snap.second $t@2@01))))
(assert (= ($Snap.first $t@2@01) $Snap.unit))
; [eval] (forall i: Int, j: Int :: { (i in [0..|xs|)), (j in [0..|xs|)) } { (i in [0..|xs|)), xs[j] } { (j in [0..|xs|)), xs[i] } { xs[i], xs[j] } (i in [0..|xs|)) && ((j in [0..|xs|)) && i != j) ==> xs[i] != xs[j])
(declare-const i@3@01 Int)
(declare-const j@4@01 Int)
(push) ; 3
; [eval] (i in [0..|xs|)) && ((j in [0..|xs|)) && i != j) ==> xs[i] != xs[j]
; [eval] (i in [0..|xs|)) && ((j in [0..|xs|)) && i != j)
; [eval] (i in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(push) ; 4
; [then-branch: 0 | !(i@3@01 in [0..|xs@1@01|]) | live]
; [else-branch: 0 | i@3@01 in [0..|xs@1@01|] | live]
(push) ; 5
; [then-branch: 0 | !(i@3@01 in [0..|xs@1@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@3@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 0 | i@3@01 in [0..|xs@1@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@3@01))
; [eval] (j in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(push) ; 6
; [then-branch: 1 | !(j@4@01 in [0..|xs@1@01|]) | live]
; [else-branch: 1 | j@4@01 in [0..|xs@1@01|] | live]
(push) ; 7
; [then-branch: 1 | !(j@4@01 in [0..|xs@1@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@4@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 1 | j@4@01 in [0..|xs@1@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@4@01))
; [eval] i != j
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@4@01)
  (not (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@4@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@3@01)
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@3@01)
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@4@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@4@01))))))
(assert (or
  (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@3@01)
  (not (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@3@01))))
(push) ; 4
; [then-branch: 2 | i@3@01 in [0..|xs@1@01|] && j@4@01 in [0..|xs@1@01|] && i@3@01 != j@4@01 | live]
; [else-branch: 2 | !(i@3@01 in [0..|xs@1@01|] && j@4@01 in [0..|xs@1@01|] && i@3@01 != j@4@01) | live]
(push) ; 5
; [then-branch: 2 | i@3@01 in [0..|xs@1@01|] && j@4@01 in [0..|xs@1@01|] && i@3@01 != j@4@01]
(assert (and
  (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@3@01)
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@4@01)
    (not (= i@3@01 j@4@01)))))
; [eval] xs[i] != xs[j]
; [eval] xs[i]
(push) ; 6
(assert (not (>= i@3@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@3@01 (Seq_length xs@1@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] xs[j]
(push) ; 6
(assert (not (>= j@4@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< j@4@01 (Seq_length xs@1@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 2 | !(i@3@01 in [0..|xs@1@01|] && j@4@01 in [0..|xs@1@01|] && i@3@01 != j@4@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@3@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@4@01)
      (not (= i@3@01 j@4@01))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@3@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@4@01)
      (not (= i@3@01 j@4@01))))
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@3@01)
    (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@4@01)
    (not (= i@3@01 j@4@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@3@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@4@01)
        (not (= i@3@01 j@4@01)))))
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@3@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@4@01)
      (not (= i@3@01 j@4@01))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@3@01 Int) (j@4@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@3@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@3@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@4@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@4@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@3@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@3@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@3@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@4@01)
          (not (= i@3@01 j@4@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@3@01)
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@4@01)
        (not (= i@3@01 j@4@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@3@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@4@01)
            (not (= i@3@01 j@4@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@3@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@4@01)
          (not (= i@3@01 j@4@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@3@01) (Seq_contains
    (Seq_range 0 (Seq_length xs@1@01))
    j@4@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@1@01)) i@3@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs@1@01))
    j@4@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@7@11@7@97-aux|)))
(assert (forall ((i@3@01 Int) (j@4@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@3@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@3@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@4@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@4@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@3@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@3@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@3@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@4@01)
          (not (= i@3@01 j@4@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@3@01)
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@4@01)
        (not (= i@3@01 j@4@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@3@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@4@01)
            (not (= i@3@01 j@4@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@3@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@4@01)
          (not (= i@3@01 j@4@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@1@01)) i@3@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs@1@01))
    j@4@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@7@11@7@97-aux|)))
(assert (forall ((i@3@01 Int) (j@4@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@3@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@3@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@4@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@4@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@3@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@3@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@3@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@4@01)
          (not (= i@3@01 j@4@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@3@01)
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@4@01)
        (not (= i@3@01 j@4@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@3@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@4@01)
            (not (= i@3@01 j@4@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@3@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@4@01)
          (not (= i@3@01 j@4@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@3@01) (Seq_index
    xs@1@01
    j@4@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@1@01)) i@3@01) (Seq_index
    xs@1@01
    j@4@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@7@11@7@97-aux|)))
(assert (forall ((i@3@01 Int) (j@4@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@3@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@3@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@4@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@4@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@3@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@3@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@3@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@4@01)
          (not (= i@3@01 j@4@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@3@01)
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@4@01)
        (not (= i@3@01 j@4@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@3@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@4@01)
            (not (= i@3@01 j@4@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@3@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@4@01)
          (not (= i@3@01 j@4@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@1@01)) i@3@01) (Seq_index
    xs@1@01
    j@4@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@7@11@7@97-aux|)))
(assert (forall ((i@3@01 Int) (j@4@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@3@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@3@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@4@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@4@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@3@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@3@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@3@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@4@01)
          (not (= i@3@01 j@4@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@3@01)
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@4@01)
        (not (= i@3@01 j@4@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@3@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@4@01)
            (not (= i@3@01 j@4@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@3@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@4@01)
          (not (= i@3@01 j@4@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@4@01) (Seq_index
    xs@1@01
    i@3@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@1@01)) j@4@01) (Seq_index
    xs@1@01
    i@3@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@7@11@7@97-aux|)))
(assert (forall ((i@3@01 Int) (j@4@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@3@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@3@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@4@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@4@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@3@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@3@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@3@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@4@01)
          (not (= i@3@01 j@4@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@3@01)
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@4@01)
        (not (= i@3@01 j@4@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@3@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@4@01)
            (not (= i@3@01 j@4@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@3@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@4@01)
          (not (= i@3@01 j@4@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@1@01)) j@4@01) (Seq_index
    xs@1@01
    i@3@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@7@11@7@97-aux|)))
(assert (forall ((i@3@01 Int) (j@4@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@3@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@3@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@4@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@4@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@3@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@3@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@3@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@4@01)
          (not (= i@3@01 j@4@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@3@01)
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@4@01)
        (not (= i@3@01 j@4@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@3@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@4@01)
            (not (= i@3@01 j@4@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@3@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@4@01)
          (not (= i@3@01 j@4@01))))))
  :pattern ((Seq_index xs@1@01 i@3@01) (Seq_index xs@1@01 j@4@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@7@11@7@97-aux|)))
(assert (forall ((i@3@01 Int) (j@4@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@3@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@4@01)
        (not (= i@3@01 j@4@01))))
    (not (= (Seq_index xs@1@01 i@3@01) (Seq_index xs@1@01 j@4@01))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@3@01) (Seq_contains
    (Seq_range 0 (Seq_length xs@1@01))
    j@4@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@1@01)) i@3@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs@1@01))
    j@4@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@3@01) (Seq_index
    xs@1@01
    j@4@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@1@01)) i@3@01) (Seq_index
    xs@1@01
    j@4@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@4@01) (Seq_index
    xs@1@01
    i@3@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@1@01)) j@4@01) (Seq_index
    xs@1@01
    i@3@01))
  :pattern ((Seq_index xs@1@01 i@3@01) (Seq_index xs@1@01 j@4@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@7@11@7@97|)))
(declare-const i@5@01 Int)
(push) ; 3
; [eval] (i in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(assert (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@5@01))
; [eval] xs[i]
(push) ; 4
(assert (not (>= i@5@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@5@01 (Seq_length xs@1@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@6@01 ($Ref) Int)
(declare-fun img@7@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@5@01 Int) (i2@5@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i1@5@01)
      (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i2@5@01)
      (= (Seq_index xs@1@01 i1@5@01) (Seq_index xs@1@01 i2@5@01)))
    (= i1@5@01 i2@5@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@5@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@5@01)
    (and
      (= (inv@6@01 (Seq_index xs@1@01 i@5@01)) i@5@01)
      (img@7@01 (Seq_index xs@1@01 i@5@01))))
  :pattern ((Seq_index xs@1@01 i@5@01))
  :qid |quant-u-1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@7@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) (inv@6@01 r)))
    (= (Seq_index xs@1@01 (inv@6@01 r)) r))
  :pattern ((inv@6@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@5@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@5@01)
    (not (= (Seq_index xs@1@01 i@5@01) $Ref.null)))
  :pattern ((Seq_index xs@1@01 i@5@01))
  :qid |f-permImpliesNonNull|)))
(pop) ; 2
(push) ; 2
; [exec]
; inhale (forall i: Int, j: Int ::
;     { (i in [0..|xs|)), (j in [0..|xs|)) }
;     { (i in [0..|xs|)), xs[j] }
;     { (j in [0..|xs|)), xs[i] }
;     { xs[i], xs[j] }
;     (i in [0..|xs|)) && ((j in [0..|xs|)) && i != j) ==> xs[i] != xs[j])
(declare-const $t@8@01 $Snap)
(assert (= $t@8@01 $Snap.unit))
; [eval] (forall i: Int, j: Int :: { (i in [0..|xs|)), (j in [0..|xs|)) } { (i in [0..|xs|)), xs[j] } { (j in [0..|xs|)), xs[i] } { xs[i], xs[j] } (i in [0..|xs|)) && ((j in [0..|xs|)) && i != j) ==> xs[i] != xs[j])
(declare-const i@9@01 Int)
(declare-const j@10@01 Int)
(push) ; 3
; [eval] (i in [0..|xs|)) && ((j in [0..|xs|)) && i != j) ==> xs[i] != xs[j]
; [eval] (i in [0..|xs|)) && ((j in [0..|xs|)) && i != j)
; [eval] (i in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(push) ; 4
; [then-branch: 3 | !(i@9@01 in [0..|xs@1@01|]) | live]
; [else-branch: 3 | i@9@01 in [0..|xs@1@01|] | live]
(push) ; 5
; [then-branch: 3 | !(i@9@01 in [0..|xs@1@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@9@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 3 | i@9@01 in [0..|xs@1@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@9@01))
; [eval] (j in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(push) ; 6
; [then-branch: 4 | !(j@10@01 in [0..|xs@1@01|]) | live]
; [else-branch: 4 | j@10@01 in [0..|xs@1@01|] | live]
(push) ; 7
; [then-branch: 4 | !(j@10@01 in [0..|xs@1@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@10@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 4 | j@10@01 in [0..|xs@1@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@10@01))
; [eval] i != j
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@10@01)
  (not (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@10@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@9@01)
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@9@01)
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@10@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@10@01))))))
(assert (or
  (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@9@01)
  (not (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@9@01))))
(push) ; 4
; [then-branch: 5 | i@9@01 in [0..|xs@1@01|] && j@10@01 in [0..|xs@1@01|] && i@9@01 != j@10@01 | live]
; [else-branch: 5 | !(i@9@01 in [0..|xs@1@01|] && j@10@01 in [0..|xs@1@01|] && i@9@01 != j@10@01) | live]
(push) ; 5
; [then-branch: 5 | i@9@01 in [0..|xs@1@01|] && j@10@01 in [0..|xs@1@01|] && i@9@01 != j@10@01]
(assert (and
  (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@9@01)
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@10@01)
    (not (= i@9@01 j@10@01)))))
; [eval] xs[i] != xs[j]
; [eval] xs[i]
(push) ; 6
(assert (not (>= i@9@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@9@01 (Seq_length xs@1@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] xs[j]
(push) ; 6
(assert (not (>= j@10@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< j@10@01 (Seq_length xs@1@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 5 | !(i@9@01 in [0..|xs@1@01|] && j@10@01 in [0..|xs@1@01|] && i@9@01 != j@10@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@9@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@10@01)
      (not (= i@9@01 j@10@01))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@9@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@10@01)
      (not (= i@9@01 j@10@01))))
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@9@01)
    (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@10@01)
    (not (= i@9@01 j@10@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@9@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@10@01)
        (not (= i@9@01 j@10@01)))))
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@9@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@10@01)
      (not (= i@9@01 j@10@01))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@9@01 Int) (j@10@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@9@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@9@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@10@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@10@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@9@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@9@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@9@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@10@01)
          (not (= i@9@01 j@10@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@9@01)
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@10@01)
        (not (= i@9@01 j@10@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@9@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@10@01)
            (not (= i@9@01 j@10@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@9@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@10@01)
          (not (= i@9@01 j@10@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@9@01) (Seq_contains
    (Seq_range 0 (Seq_length xs@1@01))
    j@10@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@1@01)) i@9@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs@1@01))
    j@10@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@10@10@10@96-aux|)))
(assert (forall ((i@9@01 Int) (j@10@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@9@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@9@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@10@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@10@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@9@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@9@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@9@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@10@01)
          (not (= i@9@01 j@10@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@9@01)
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@10@01)
        (not (= i@9@01 j@10@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@9@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@10@01)
            (not (= i@9@01 j@10@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@9@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@10@01)
          (not (= i@9@01 j@10@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@1@01)) i@9@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs@1@01))
    j@10@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@10@10@10@96-aux|)))
(assert (forall ((i@9@01 Int) (j@10@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@9@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@9@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@10@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@10@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@9@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@9@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@9@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@10@01)
          (not (= i@9@01 j@10@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@9@01)
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@10@01)
        (not (= i@9@01 j@10@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@9@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@10@01)
            (not (= i@9@01 j@10@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@9@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@10@01)
          (not (= i@9@01 j@10@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@9@01) (Seq_index
    xs@1@01
    j@10@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@1@01)) i@9@01) (Seq_index
    xs@1@01
    j@10@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@10@10@10@96-aux|)))
(assert (forall ((i@9@01 Int) (j@10@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@9@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@9@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@10@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@10@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@9@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@9@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@9@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@10@01)
          (not (= i@9@01 j@10@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@9@01)
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@10@01)
        (not (= i@9@01 j@10@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@9@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@10@01)
            (not (= i@9@01 j@10@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@9@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@10@01)
          (not (= i@9@01 j@10@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@1@01)) i@9@01) (Seq_index
    xs@1@01
    j@10@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@10@10@10@96-aux|)))
(assert (forall ((i@9@01 Int) (j@10@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@9@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@9@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@10@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@10@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@9@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@9@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@9@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@10@01)
          (not (= i@9@01 j@10@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@9@01)
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@10@01)
        (not (= i@9@01 j@10@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@9@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@10@01)
            (not (= i@9@01 j@10@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@9@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@10@01)
          (not (= i@9@01 j@10@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@10@01) (Seq_index
    xs@1@01
    i@9@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@1@01)) j@10@01) (Seq_index
    xs@1@01
    i@9@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@10@10@10@96-aux|)))
(assert (forall ((i@9@01 Int) (j@10@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@9@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@9@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@10@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@10@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@9@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@9@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@9@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@10@01)
          (not (= i@9@01 j@10@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@9@01)
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@10@01)
        (not (= i@9@01 j@10@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@9@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@10@01)
            (not (= i@9@01 j@10@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@9@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@10@01)
          (not (= i@9@01 j@10@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@1@01)) j@10@01) (Seq_index
    xs@1@01
    i@9@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@10@10@10@96-aux|)))
(assert (forall ((i@9@01 Int) (j@10@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@9@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@9@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@10@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@10@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@9@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@9@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@9@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@10@01)
          (not (= i@9@01 j@10@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@9@01)
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@10@01)
        (not (= i@9@01 j@10@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@9@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@10@01)
            (not (= i@9@01 j@10@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@9@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@10@01)
          (not (= i@9@01 j@10@01))))))
  :pattern ((Seq_index xs@1@01 i@9@01) (Seq_index xs@1@01 j@10@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@10@10@10@96-aux|)))
(assert (forall ((i@9@01 Int) (j@10@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@9@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@10@01)
        (not (= i@9@01 j@10@01))))
    (not (= (Seq_index xs@1@01 i@9@01) (Seq_index xs@1@01 j@10@01))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@9@01) (Seq_contains
    (Seq_range 0 (Seq_length xs@1@01))
    j@10@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@1@01)) i@9@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs@1@01))
    j@10@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@9@01) (Seq_index
    xs@1@01
    j@10@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@1@01)) i@9@01) (Seq_index
    xs@1@01
    j@10@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@10@01) (Seq_index
    xs@1@01
    i@9@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@1@01)) j@10@01) (Seq_index
    xs@1@01
    i@9@01))
  :pattern ((Seq_index xs@1@01 i@9@01) (Seq_index xs@1@01 j@10@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@10@10@10@96|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall i: Int ::(i in [0..|xs|)) ==> acc(xs[i].f, write))
(declare-const i@11@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (i in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(assert (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@11@01))
; [eval] xs[i]
(push) ; 4
(assert (not (>= i@11@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@11@01 (Seq_length xs@1@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-const $t@12@01 $FVF<f>)
(declare-fun inv@13@01 ($Ref) Int)
(declare-fun img@14@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@11@01 Int) (i2@11@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i1@11@01)
      (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i2@11@01)
      (= (Seq_index xs@1@01 i1@11@01) (Seq_index xs@1@01 i2@11@01)))
    (= i1@11@01 i2@11@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@11@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@11@01)
    (and
      (= (inv@13@01 (Seq_index xs@1@01 i@11@01)) i@11@01)
      (img@14@01 (Seq_index xs@1@01 i@11@01))))
  :pattern ((Seq_index xs@1@01 i@11@01))
  :qid |quant-u-3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@14@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) (inv@13@01 r)))
    (= (Seq_index xs@1@01 (inv@13@01 r)) r))
  :pattern ((inv@13@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@11@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@11@01)
    (not (= (Seq_index xs@1@01 i@11@01) $Ref.null)))
  :pattern ((Seq_index xs@1@01 i@11@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [eval] (forall i: Int, j: Int :: { (i in [0..|xs|)), (j in [0..|xs|)) } { (i in [0..|xs|)), xs[j] } { (j in [0..|xs|)), xs[i] } { xs[i], xs[j] } (i in [0..|xs|)) && ((j in [0..|xs|)) && i != j) ==> xs[i] != xs[j])
(declare-const i@15@01 Int)
(declare-const j@16@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (i in [0..|xs|)) && ((j in [0..|xs|)) && i != j) ==> xs[i] != xs[j]
; [eval] (i in [0..|xs|)) && ((j in [0..|xs|)) && i != j)
; [eval] (i in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(push) ; 4
; [then-branch: 6 | !(i@15@01 in [0..|xs@1@01|]) | live]
; [else-branch: 6 | i@15@01 in [0..|xs@1@01|] | live]
(push) ; 5
; [then-branch: 6 | !(i@15@01 in [0..|xs@1@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@15@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 6 | i@15@01 in [0..|xs@1@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@15@01))
; [eval] (j in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(push) ; 6
; [then-branch: 7 | !(j@16@01 in [0..|xs@1@01|]) | live]
; [else-branch: 7 | j@16@01 in [0..|xs@1@01|] | live]
(push) ; 7
; [then-branch: 7 | !(j@16@01 in [0..|xs@1@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@16@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 7 | j@16@01 in [0..|xs@1@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@16@01))
; [eval] i != j
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@16@01)
  (not (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@16@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@15@01)
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@15@01)
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@16@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@16@01))))))
(assert (or
  (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@15@01)
  (not (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@15@01))))
(push) ; 4
; [then-branch: 8 | i@15@01 in [0..|xs@1@01|] && j@16@01 in [0..|xs@1@01|] && i@15@01 != j@16@01 | live]
; [else-branch: 8 | !(i@15@01 in [0..|xs@1@01|] && j@16@01 in [0..|xs@1@01|] && i@15@01 != j@16@01) | live]
(push) ; 5
; [then-branch: 8 | i@15@01 in [0..|xs@1@01|] && j@16@01 in [0..|xs@1@01|] && i@15@01 != j@16@01]
(assert (and
  (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@15@01)
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@16@01)
    (not (= i@15@01 j@16@01)))))
; [eval] xs[i] != xs[j]
; [eval] xs[i]
(push) ; 6
(assert (not (>= i@15@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@15@01 (Seq_length xs@1@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] xs[j]
(push) ; 6
(assert (not (>= j@16@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< j@16@01 (Seq_length xs@1@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 8 | !(i@15@01 in [0..|xs@1@01|] && j@16@01 in [0..|xs@1@01|] && i@15@01 != j@16@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@15@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@16@01)
      (not (= i@15@01 j@16@01))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@15@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@16@01)
      (not (= i@15@01 j@16@01))))
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@15@01)
    (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@16@01)
    (not (= i@15@01 j@16@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@15@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@16@01)
        (not (= i@15@01 j@16@01)))))
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@15@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@16@01)
      (not (= i@15@01 j@16@01))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@15@01 Int) (j@16@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@15@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@15@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@16@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@16@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@15@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@15@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@15@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@16@01)
          (not (= i@15@01 j@16@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@15@01)
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@16@01)
        (not (= i@15@01 j@16@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@15@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@16@01)
            (not (= i@15@01 j@16@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@15@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@16@01)
          (not (= i@15@01 j@16@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@15@01) (Seq_contains
    (Seq_range 0 (Seq_length xs@1@01))
    j@16@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@1@01)) i@15@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs@1@01))
    j@16@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@7@11@7@97-aux|)))
(assert (forall ((i@15@01 Int) (j@16@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@15@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@15@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@16@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@16@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@15@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@15@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@15@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@16@01)
          (not (= i@15@01 j@16@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@15@01)
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@16@01)
        (not (= i@15@01 j@16@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@15@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@16@01)
            (not (= i@15@01 j@16@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@15@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@16@01)
          (not (= i@15@01 j@16@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@1@01)) i@15@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs@1@01))
    j@16@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@7@11@7@97-aux|)))
(assert (forall ((i@15@01 Int) (j@16@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@15@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@15@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@16@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@16@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@15@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@15@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@15@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@16@01)
          (not (= i@15@01 j@16@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@15@01)
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@16@01)
        (not (= i@15@01 j@16@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@15@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@16@01)
            (not (= i@15@01 j@16@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@15@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@16@01)
          (not (= i@15@01 j@16@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@15@01) (Seq_index
    xs@1@01
    j@16@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@1@01)) i@15@01) (Seq_index
    xs@1@01
    j@16@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@7@11@7@97-aux|)))
(assert (forall ((i@15@01 Int) (j@16@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@15@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@15@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@16@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@16@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@15@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@15@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@15@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@16@01)
          (not (= i@15@01 j@16@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@15@01)
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@16@01)
        (not (= i@15@01 j@16@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@15@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@16@01)
            (not (= i@15@01 j@16@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@15@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@16@01)
          (not (= i@15@01 j@16@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@1@01)) i@15@01) (Seq_index
    xs@1@01
    j@16@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@7@11@7@97-aux|)))
(assert (forall ((i@15@01 Int) (j@16@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@15@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@15@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@16@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@16@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@15@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@15@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@15@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@16@01)
          (not (= i@15@01 j@16@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@15@01)
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@16@01)
        (not (= i@15@01 j@16@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@15@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@16@01)
            (not (= i@15@01 j@16@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@15@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@16@01)
          (not (= i@15@01 j@16@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@16@01) (Seq_index
    xs@1@01
    i@15@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@1@01)) j@16@01) (Seq_index
    xs@1@01
    i@15@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@7@11@7@97-aux|)))
(assert (forall ((i@15@01 Int) (j@16@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@15@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@15@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@16@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@16@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@15@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@15@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@15@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@16@01)
          (not (= i@15@01 j@16@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@15@01)
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@16@01)
        (not (= i@15@01 j@16@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@15@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@16@01)
            (not (= i@15@01 j@16@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@15@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@16@01)
          (not (= i@15@01 j@16@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@1@01)) j@16@01) (Seq_index
    xs@1@01
    i@15@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@7@11@7@97-aux|)))
(assert (forall ((i@15@01 Int) (j@16@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@15@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@15@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@16@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@16@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@15@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@15@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@15@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@16@01)
          (not (= i@15@01 j@16@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@15@01)
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@16@01)
        (not (= i@15@01 j@16@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@15@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@16@01)
            (not (= i@15@01 j@16@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@15@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@16@01)
          (not (= i@15@01 j@16@01))))))
  :pattern ((Seq_index xs@1@01 i@15@01) (Seq_index xs@1@01 j@16@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@7@11@7@97-aux|)))
(push) ; 3
(assert (not (forall ((i@15@01 Int) (j@16@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@15@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@16@01)
        (not (= i@15@01 j@16@01))))
    (not (= (Seq_index xs@1@01 i@15@01) (Seq_index xs@1@01 j@16@01))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@15@01) (Seq_contains
    (Seq_range 0 (Seq_length xs@1@01))
    j@16@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@1@01)) i@15@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs@1@01))
    j@16@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@1@01)) i@15@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs@1@01))
    j@16@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@15@01) (Seq_index
    xs@1@01
    j@16@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@1@01)) i@15@01) (Seq_index
    xs@1@01
    j@16@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@1@01)) i@15@01) (Seq_index
    xs@1@01
    j@16@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@16@01) (Seq_index
    xs@1@01
    i@15@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@1@01)) j@16@01) (Seq_index
    xs@1@01
    i@15@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@1@01)) j@16@01) (Seq_index
    xs@1@01
    i@15@01))
  :pattern ((Seq_index xs@1@01 i@15@01) (Seq_index xs@1@01 j@16@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@7@11@7@97|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@15@01 Int) (j@16@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@15@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@16@01)
        (not (= i@15@01 j@16@01))))
    (not (= (Seq_index xs@1@01 i@15@01) (Seq_index xs@1@01 j@16@01))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@15@01) (Seq_contains
    (Seq_range 0 (Seq_length xs@1@01))
    j@16@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@1@01)) i@15@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs@1@01))
    j@16@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@15@01) (Seq_index
    xs@1@01
    j@16@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@1@01)) i@15@01) (Seq_index
    xs@1@01
    j@16@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs@1@01)) j@16@01) (Seq_index
    xs@1@01
    i@15@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@1@01)) j@16@01) (Seq_index
    xs@1@01
    i@15@01))
  :pattern ((Seq_index xs@1@01 i@15@01) (Seq_index xs@1@01 j@16@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@7@11@7@97|)))
(declare-const i@17@01 Int)
(push) ; 3
; [eval] (i in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(assert (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@17@01))
; [eval] xs[i]
(push) ; 4
(assert (not (>= i@17@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@17@01 (Seq_length xs@1@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@18@01 ($Ref) Int)
(declare-fun img@19@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@17@01 Int) (i2@17@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i1@17@01)
      (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i2@17@01)
      (= (Seq_index xs@1@01 i1@17@01) (Seq_index xs@1@01 i2@17@01)))
    (= i1@17@01 i2@17@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@17@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) i@17@01)
    (and
      (= (inv@18@01 (Seq_index xs@1@01 i@17@01)) i@17@01)
      (img@19@01 (Seq_index xs@1@01 i@17@01))))
  :pattern ((Seq_index xs@1@01 i@17@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@19@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) (inv@18@01 r)))
    (= (Seq_index xs@1@01 (inv@18@01 r)) r))
  :pattern ((inv@18@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@20@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) (inv@18@01 r))
      (img@19@01 r)
      (= r (Seq_index xs@1@01 (inv@18@01 r))))
    ($Perm.min
      (ite
        (and
          (img@14@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) (inv@13@01 r)))
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
          (img@14@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) (inv@13@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@20@01 r))
    $Perm.No)
  
  :qid |quant-u-6|))))
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
      (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) (inv@18@01 r))
      (img@19@01 r)
      (= r (Seq_index xs@1@01 (inv@18@01 r))))
    (= (- $Perm.Write (pTaken@20@01 r)) $Perm.No))
  
  :qid |quant-u-7|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@21@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@14@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs@1@01)) (inv@13@01 r)))
    (= ($FVF.lookup_f (as sm@21@01  $FVF<f>) r) ($FVF.lookup_f $t@12@01 r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@12@01 r))
  :qid |qp.fvfValDef0|)))
(pop) ; 2
(pop) ; 1
; ---------- leak ----------
(declare-const xs@22@01 Seq<$Ref>)
(declare-const p@23@01 $Perm)
(declare-const xs@24@01 Seq<$Ref>)
(declare-const p@25@01 $Perm)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@26@01 $Snap)
(assert (= $t@26@01 ($Snap.combine ($Snap.first $t@26@01) ($Snap.second $t@26@01))))
(assert (= ($Snap.first $t@26@01) $Snap.unit))
; [eval] p >= none
(assert (>= p@25@01 $Perm.No))
(assert (=
  ($Snap.second $t@26@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@26@01))
    ($Snap.second ($Snap.second $t@26@01)))))
(assert (= ($Snap.first ($Snap.second $t@26@01)) $Snap.unit))
; [eval] (forall i: Int, j: Int :: { (i in [0..|xs|)), (j in [0..|xs|)) } { (i in [0..|xs|)), xs[j] } { (j in [0..|xs|)), xs[i] } { xs[i], xs[j] } (i in [0..|xs|)) && ((j in [0..|xs|)) && i != j) ==> xs[i] != xs[j])
(declare-const i@27@01 Int)
(declare-const j@28@01 Int)
(push) ; 2
; [eval] (i in [0..|xs|)) && ((j in [0..|xs|)) && i != j) ==> xs[i] != xs[j]
; [eval] (i in [0..|xs|)) && ((j in [0..|xs|)) && i != j)
; [eval] (i in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(push) ; 3
; [then-branch: 9 | !(i@27@01 in [0..|xs@24@01|]) | live]
; [else-branch: 9 | i@27@01 in [0..|xs@24@01|] | live]
(push) ; 4
; [then-branch: 9 | !(i@27@01 in [0..|xs@24@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) i@27@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 9 | i@27@01 in [0..|xs@24@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) i@27@01))
; [eval] (j in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(push) ; 5
; [then-branch: 10 | !(j@28@01 in [0..|xs@24@01|]) | live]
; [else-branch: 10 | j@28@01 in [0..|xs@24@01|] | live]
(push) ; 6
; [then-branch: 10 | !(j@28@01 in [0..|xs@24@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) j@28@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 10 | j@28@01 in [0..|xs@24@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) j@28@01))
; [eval] i != j
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) j@28@01)
  (not (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) j@28@01))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) i@27@01)
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) i@27@01)
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) j@28@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) j@28@01))))))
(assert (or
  (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) i@27@01)
  (not (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) i@27@01))))
(push) ; 3
; [then-branch: 11 | i@27@01 in [0..|xs@24@01|] && j@28@01 in [0..|xs@24@01|] && i@27@01 != j@28@01 | live]
; [else-branch: 11 | !(i@27@01 in [0..|xs@24@01|] && j@28@01 in [0..|xs@24@01|] && i@27@01 != j@28@01) | live]
(push) ; 4
; [then-branch: 11 | i@27@01 in [0..|xs@24@01|] && j@28@01 in [0..|xs@24@01|] && i@27@01 != j@28@01]
(assert (and
  (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) i@27@01)
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) j@28@01)
    (not (= i@27@01 j@28@01)))))
; [eval] xs[i] != xs[j]
; [eval] xs[i]
(push) ; 5
(assert (not (>= i@27@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@27@01 (Seq_length xs@24@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] xs[j]
(push) ; 5
(assert (not (>= j@28@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< j@28@01 (Seq_length xs@24@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 11 | !(i@27@01 in [0..|xs@24@01|] && j@28@01 in [0..|xs@24@01|] && i@27@01 != j@28@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) i@27@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) j@28@01)
      (not (= i@27@01 j@28@01))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) i@27@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) j@28@01)
      (not (= i@27@01 j@28@01))))
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) i@27@01)
    (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) j@28@01)
    (not (= i@27@01 j@28@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) i@27@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) j@28@01)
        (not (= i@27@01 j@28@01)))))
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) i@27@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) j@28@01)
      (not (= i@27@01 j@28@01))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@27@01 Int) (j@28@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) i@27@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) i@27@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) j@28@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) j@28@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) i@27@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) i@27@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) i@27@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) j@28@01)
          (not (= i@27@01 j@28@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) i@27@01)
        (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) j@28@01)
        (not (= i@27@01 j@28@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) i@27@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) j@28@01)
            (not (= i@27@01 j@28@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) i@27@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) j@28@01)
          (not (= i@27@01 j@28@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs@24@01)) i@27@01) (Seq_contains
    (Seq_range 0 (Seq_length xs@24@01))
    j@28@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@24@01)) i@27@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs@24@01))
    j@28@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@16@12@16@98-aux|)))
(assert (forall ((i@27@01 Int) (j@28@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) i@27@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) i@27@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) j@28@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) j@28@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) i@27@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) i@27@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) i@27@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) j@28@01)
          (not (= i@27@01 j@28@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) i@27@01)
        (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) j@28@01)
        (not (= i@27@01 j@28@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) i@27@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) j@28@01)
            (not (= i@27@01 j@28@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) i@27@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) j@28@01)
          (not (= i@27@01 j@28@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@24@01)) i@27@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs@24@01))
    j@28@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@16@12@16@98-aux|)))
(assert (forall ((i@27@01 Int) (j@28@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) i@27@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) i@27@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) j@28@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) j@28@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) i@27@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) i@27@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) i@27@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) j@28@01)
          (not (= i@27@01 j@28@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) i@27@01)
        (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) j@28@01)
        (not (= i@27@01 j@28@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) i@27@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) j@28@01)
            (not (= i@27@01 j@28@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) i@27@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) j@28@01)
          (not (= i@27@01 j@28@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs@24@01)) i@27@01) (Seq_index
    xs@24@01
    j@28@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@24@01)) i@27@01) (Seq_index
    xs@24@01
    j@28@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@16@12@16@98-aux|)))
(assert (forall ((i@27@01 Int) (j@28@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) i@27@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) i@27@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) j@28@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) j@28@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) i@27@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) i@27@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) i@27@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) j@28@01)
          (not (= i@27@01 j@28@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) i@27@01)
        (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) j@28@01)
        (not (= i@27@01 j@28@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) i@27@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) j@28@01)
            (not (= i@27@01 j@28@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) i@27@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) j@28@01)
          (not (= i@27@01 j@28@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@24@01)) i@27@01) (Seq_index
    xs@24@01
    j@28@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@16@12@16@98-aux|)))
(assert (forall ((i@27@01 Int) (j@28@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) i@27@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) i@27@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) j@28@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) j@28@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) i@27@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) i@27@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) i@27@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) j@28@01)
          (not (= i@27@01 j@28@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) i@27@01)
        (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) j@28@01)
        (not (= i@27@01 j@28@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) i@27@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) j@28@01)
            (not (= i@27@01 j@28@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) i@27@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) j@28@01)
          (not (= i@27@01 j@28@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs@24@01)) j@28@01) (Seq_index
    xs@24@01
    i@27@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@24@01)) j@28@01) (Seq_index
    xs@24@01
    i@27@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@16@12@16@98-aux|)))
(assert (forall ((i@27@01 Int) (j@28@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) i@27@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) i@27@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) j@28@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) j@28@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) i@27@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) i@27@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) i@27@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) j@28@01)
          (not (= i@27@01 j@28@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) i@27@01)
        (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) j@28@01)
        (not (= i@27@01 j@28@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) i@27@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) j@28@01)
            (not (= i@27@01 j@28@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) i@27@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) j@28@01)
          (not (= i@27@01 j@28@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@24@01)) j@28@01) (Seq_index
    xs@24@01
    i@27@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@16@12@16@98-aux|)))
(assert (forall ((i@27@01 Int) (j@28@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) i@27@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) i@27@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) j@28@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) j@28@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) i@27@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) i@27@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) i@27@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) j@28@01)
          (not (= i@27@01 j@28@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) i@27@01)
        (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) j@28@01)
        (not (= i@27@01 j@28@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) i@27@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) j@28@01)
            (not (= i@27@01 j@28@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) i@27@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) j@28@01)
          (not (= i@27@01 j@28@01))))))
  :pattern ((Seq_index xs@24@01 i@27@01) (Seq_index xs@24@01 j@28@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@16@12@16@98-aux|)))
(assert (forall ((i@27@01 Int) (j@28@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) i@27@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) j@28@01)
        (not (= i@27@01 j@28@01))))
    (not (= (Seq_index xs@24@01 i@27@01) (Seq_index xs@24@01 j@28@01))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs@24@01)) i@27@01) (Seq_contains
    (Seq_range 0 (Seq_length xs@24@01))
    j@28@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@24@01)) i@27@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs@24@01))
    j@28@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs@24@01)) i@27@01) (Seq_index
    xs@24@01
    j@28@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@24@01)) i@27@01) (Seq_index
    xs@24@01
    j@28@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs@24@01)) j@28@01) (Seq_index
    xs@24@01
    i@27@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@24@01)) j@28@01) (Seq_index
    xs@24@01
    i@27@01))
  :pattern ((Seq_index xs@24@01 i@27@01) (Seq_index xs@24@01 j@28@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@16@12@16@98|)))
(declare-const i@29@01 Int)
(push) ; 2
; [eval] (i in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(assert (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) i@29@01))
; [eval] xs[i]
(push) ; 3
(assert (not (>= i@29@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@29@01 (Seq_length xs@24@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@30@01 ($Ref) Int)
(declare-fun img@31@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(push) ; 2
(assert (not (forall ((i@29@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) i@29@01)
    (or (= p@25@01 $Perm.No) (< $Perm.No p@25@01)))
  
  :qid |quant-u-8|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@29@01 Int) (i2@29@01 Int)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) i1@29@01)
        (< $Perm.No p@25@01))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) i2@29@01)
        (< $Perm.No p@25@01))
      (= (Seq_index xs@24@01 i1@29@01) (Seq_index xs@24@01 i2@29@01)))
    (= i1@29@01 i2@29@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@29@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) i@29@01)
      (< $Perm.No p@25@01))
    (and
      (= (inv@30@01 (Seq_index xs@24@01 i@29@01)) i@29@01)
      (img@31@01 (Seq_index xs@24@01 i@29@01))))
  :pattern ((Seq_index xs@24@01 i@29@01))
  :qid |quant-u-9|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@31@01 r)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) (inv@30@01 r))
        (< $Perm.No p@25@01)))
    (= (Seq_index xs@24@01 (inv@30@01 r)) r))
  :pattern ((inv@30@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((i@29@01 Int)) (!
  (<= $Perm.No p@25@01)
  :pattern ((Seq_index xs@24@01 i@29@01))
  :qid |f-permAtLeastZero|)))
; Field permissions are at most one
(assert (forall ((i@29@01 Int)) (!
  (<= p@25@01 $Perm.Write)
  :pattern ((Seq_index xs@24@01 i@29@01))
  :qid |f-permAtMostOne|)))
; Permission implies non-null receiver
(assert (forall ((i@29@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs@24@01)) i@29@01)
      (< $Perm.No p@25@01))
    (not (= (Seq_index xs@24@01 i@29@01) $Ref.null)))
  :pattern ((Seq_index xs@24@01 i@29@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
(pop) ; 2
(pop) ; 1
; ---------- split ----------
(declare-const xs@32@01 Seq<$Ref>)
(declare-const p@33@01 $Perm)
(declare-const q@34@01 $Perm)
(declare-const xs@35@01 Seq<$Ref>)
(declare-const p@36@01 $Perm)
(declare-const q@37@01 $Perm)
(push) ; 1
(declare-const $t@38@01 $Snap)
(assert (= $t@38@01 ($Snap.combine ($Snap.first $t@38@01) ($Snap.second $t@38@01))))
(assert (= ($Snap.first $t@38@01) $Snap.unit))
; [eval] p == 2 * q
; [eval] 2 * q
(assert (= p@36@01 (* (to_real 2) q@37@01)))
(assert (=
  ($Snap.second $t@38@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@38@01))
    ($Snap.second ($Snap.second $t@38@01)))))
(assert (= ($Snap.first ($Snap.second $t@38@01)) $Snap.unit))
; [eval] p >= none
(assert (>= p@36@01 $Perm.No))
(assert (=
  ($Snap.second ($Snap.second $t@38@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@38@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@38@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@38@01))) $Snap.unit))
; [eval] (forall i: Int, j: Int :: { (i in [0..|xs|)), (j in [0..|xs|)) } { (i in [0..|xs|)), xs[j] } { (j in [0..|xs|)), xs[i] } { xs[i], xs[j] } (i in [0..|xs|)) && ((j in [0..|xs|)) && i != j) ==> xs[i] != xs[j])
(declare-const i@39@01 Int)
(declare-const j@40@01 Int)
(push) ; 2
; [eval] (i in [0..|xs|)) && ((j in [0..|xs|)) && i != j) ==> xs[i] != xs[j]
; [eval] (i in [0..|xs|)) && ((j in [0..|xs|)) && i != j)
; [eval] (i in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(push) ; 3
; [then-branch: 12 | !(i@39@01 in [0..|xs@35@01|]) | live]
; [else-branch: 12 | i@39@01 in [0..|xs@35@01|] | live]
(push) ; 4
; [then-branch: 12 | !(i@39@01 in [0..|xs@35@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@39@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 12 | i@39@01 in [0..|xs@35@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@39@01))
; [eval] (j in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(push) ; 5
; [then-branch: 13 | !(j@40@01 in [0..|xs@35@01|]) | live]
; [else-branch: 13 | j@40@01 in [0..|xs@35@01|] | live]
(push) ; 6
; [then-branch: 13 | !(j@40@01 in [0..|xs@35@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) j@40@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 13 | j@40@01 in [0..|xs@35@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) j@40@01))
; [eval] i != j
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) j@40@01)
  (not (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) j@40@01))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@39@01)
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@39@01)
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) j@40@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) j@40@01))))))
(assert (or
  (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@39@01)
  (not (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@39@01))))
(push) ; 3
; [then-branch: 14 | i@39@01 in [0..|xs@35@01|] && j@40@01 in [0..|xs@35@01|] && i@39@01 != j@40@01 | live]
; [else-branch: 14 | !(i@39@01 in [0..|xs@35@01|] && j@40@01 in [0..|xs@35@01|] && i@39@01 != j@40@01) | live]
(push) ; 4
; [then-branch: 14 | i@39@01 in [0..|xs@35@01|] && j@40@01 in [0..|xs@35@01|] && i@39@01 != j@40@01]
(assert (and
  (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@39@01)
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) j@40@01)
    (not (= i@39@01 j@40@01)))))
; [eval] xs[i] != xs[j]
; [eval] xs[i]
(push) ; 5
(assert (not (>= i@39@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@39@01 (Seq_length xs@35@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] xs[j]
(push) ; 5
(assert (not (>= j@40@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< j@40@01 (Seq_length xs@35@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 14 | !(i@39@01 in [0..|xs@35@01|] && j@40@01 in [0..|xs@35@01|] && i@39@01 != j@40@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@39@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) j@40@01)
      (not (= i@39@01 j@40@01))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@39@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) j@40@01)
      (not (= i@39@01 j@40@01))))
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@39@01)
    (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) j@40@01)
    (not (= i@39@01 j@40@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@39@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) j@40@01)
        (not (= i@39@01 j@40@01)))))
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@39@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) j@40@01)
      (not (= i@39@01 j@40@01))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@39@01 Int) (j@40@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@39@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@39@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) j@40@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) j@40@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@39@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@39@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@39@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) j@40@01)
          (not (= i@39@01 j@40@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@39@01)
        (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) j@40@01)
        (not (= i@39@01 j@40@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@39@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) j@40@01)
            (not (= i@39@01 j@40@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@39@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) j@40@01)
          (not (= i@39@01 j@40@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@39@01) (Seq_contains
    (Seq_range 0 (Seq_length xs@35@01))
    j@40@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@35@01)) i@39@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs@35@01))
    j@40@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@23@12@23@98-aux|)))
(assert (forall ((i@39@01 Int) (j@40@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@39@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@39@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) j@40@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) j@40@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@39@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@39@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@39@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) j@40@01)
          (not (= i@39@01 j@40@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@39@01)
        (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) j@40@01)
        (not (= i@39@01 j@40@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@39@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) j@40@01)
            (not (= i@39@01 j@40@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@39@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) j@40@01)
          (not (= i@39@01 j@40@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@35@01)) i@39@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs@35@01))
    j@40@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@23@12@23@98-aux|)))
(assert (forall ((i@39@01 Int) (j@40@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@39@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@39@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) j@40@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) j@40@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@39@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@39@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@39@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) j@40@01)
          (not (= i@39@01 j@40@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@39@01)
        (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) j@40@01)
        (not (= i@39@01 j@40@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@39@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) j@40@01)
            (not (= i@39@01 j@40@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@39@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) j@40@01)
          (not (= i@39@01 j@40@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@39@01) (Seq_index
    xs@35@01
    j@40@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@35@01)) i@39@01) (Seq_index
    xs@35@01
    j@40@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@23@12@23@98-aux|)))
(assert (forall ((i@39@01 Int) (j@40@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@39@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@39@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) j@40@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) j@40@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@39@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@39@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@39@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) j@40@01)
          (not (= i@39@01 j@40@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@39@01)
        (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) j@40@01)
        (not (= i@39@01 j@40@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@39@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) j@40@01)
            (not (= i@39@01 j@40@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@39@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) j@40@01)
          (not (= i@39@01 j@40@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@35@01)) i@39@01) (Seq_index
    xs@35@01
    j@40@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@23@12@23@98-aux|)))
(assert (forall ((i@39@01 Int) (j@40@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@39@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@39@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) j@40@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) j@40@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@39@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@39@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@39@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) j@40@01)
          (not (= i@39@01 j@40@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@39@01)
        (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) j@40@01)
        (not (= i@39@01 j@40@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@39@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) j@40@01)
            (not (= i@39@01 j@40@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@39@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) j@40@01)
          (not (= i@39@01 j@40@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs@35@01)) j@40@01) (Seq_index
    xs@35@01
    i@39@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@35@01)) j@40@01) (Seq_index
    xs@35@01
    i@39@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@23@12@23@98-aux|)))
(assert (forall ((i@39@01 Int) (j@40@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@39@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@39@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) j@40@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) j@40@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@39@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@39@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@39@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) j@40@01)
          (not (= i@39@01 j@40@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@39@01)
        (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) j@40@01)
        (not (= i@39@01 j@40@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@39@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) j@40@01)
            (not (= i@39@01 j@40@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@39@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) j@40@01)
          (not (= i@39@01 j@40@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@35@01)) j@40@01) (Seq_index
    xs@35@01
    i@39@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@23@12@23@98-aux|)))
(assert (forall ((i@39@01 Int) (j@40@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@39@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@39@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) j@40@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) j@40@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@39@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@39@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@39@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) j@40@01)
          (not (= i@39@01 j@40@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@39@01)
        (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) j@40@01)
        (not (= i@39@01 j@40@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@39@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) j@40@01)
            (not (= i@39@01 j@40@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@39@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) j@40@01)
          (not (= i@39@01 j@40@01))))))
  :pattern ((Seq_index xs@35@01 i@39@01) (Seq_index xs@35@01 j@40@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@23@12@23@98-aux|)))
(assert (forall ((i@39@01 Int) (j@40@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@39@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) j@40@01)
        (not (= i@39@01 j@40@01))))
    (not (= (Seq_index xs@35@01 i@39@01) (Seq_index xs@35@01 j@40@01))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@39@01) (Seq_contains
    (Seq_range 0 (Seq_length xs@35@01))
    j@40@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@35@01)) i@39@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs@35@01))
    j@40@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@39@01) (Seq_index
    xs@35@01
    j@40@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@35@01)) i@39@01) (Seq_index
    xs@35@01
    j@40@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs@35@01)) j@40@01) (Seq_index
    xs@35@01
    i@39@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs@35@01)) j@40@01) (Seq_index
    xs@35@01
    i@39@01))
  :pattern ((Seq_index xs@35@01 i@39@01) (Seq_index xs@35@01 j@40@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@23@12@23@98|)))
(declare-const i@41@01 Int)
(push) ; 2
; [eval] (i in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(assert (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@41@01))
; [eval] xs[i]
(push) ; 3
(assert (not (>= i@41@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@41@01 (Seq_length xs@35@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@42@01 ($Ref) Int)
(declare-fun img@43@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(push) ; 2
(assert (not (forall ((i@41@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@41@01)
    (or (= p@36@01 $Perm.No) (< $Perm.No p@36@01)))
  
  :qid |quant-u-10|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@41@01 Int) (i2@41@01 Int)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i1@41@01)
        (< $Perm.No p@36@01))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i2@41@01)
        (< $Perm.No p@36@01))
      (= (Seq_index xs@35@01 i1@41@01) (Seq_index xs@35@01 i2@41@01)))
    (= i1@41@01 i2@41@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@41@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@41@01)
      (< $Perm.No p@36@01))
    (and
      (= (inv@42@01 (Seq_index xs@35@01 i@41@01)) i@41@01)
      (img@43@01 (Seq_index xs@35@01 i@41@01))))
  :pattern ((Seq_index xs@35@01 i@41@01))
  :qid |quant-u-11|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@43@01 r)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) (inv@42@01 r))
        (< $Perm.No p@36@01)))
    (= (Seq_index xs@35@01 (inv@42@01 r)) r))
  :pattern ((inv@42@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((i@41@01 Int)) (!
  (<= $Perm.No p@36@01)
  :pattern ((Seq_index xs@35@01 i@41@01))
  :qid |f-permAtLeastZero|)))
; Field permissions are at most one
(assert (forall ((i@41@01 Int)) (!
  (<= p@36@01 $Perm.Write)
  :pattern ((Seq_index xs@35@01 i@41@01))
  :qid |f-permAtMostOne|)))
; Permission implies non-null receiver
(assert (forall ((i@41@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@41@01)
      (< $Perm.No p@36@01))
    (not (= (Seq_index xs@35@01 i@41@01) $Ref.null)))
  :pattern ((Seq_index xs@35@01 i@41@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@44@01 $Snap)
(assert (= $t@44@01 ($Snap.combine ($Snap.first $t@44@01) ($Snap.second $t@44@01))))
(declare-const i@45@01 Int)
(push) ; 3
; [eval] (i in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(assert (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@45@01))
; [eval] xs[i]
(push) ; 4
(assert (not (>= i@45@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@45@01 (Seq_length xs@35@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@46@01 ($Ref) Int)
(declare-fun img@47@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(push) ; 3
(assert (not (forall ((i@45@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@45@01)
    (or (= q@37@01 $Perm.No) (< $Perm.No q@37@01)))
  
  :qid |quant-u-12|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@45@01 Int) (i2@45@01 Int)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i1@45@01)
        (< $Perm.No q@37@01))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i2@45@01)
        (< $Perm.No q@37@01))
      (= (Seq_index xs@35@01 i1@45@01) (Seq_index xs@35@01 i2@45@01)))
    (= i1@45@01 i2@45@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@45@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@45@01)
      (< $Perm.No q@37@01))
    (and
      (= (inv@46@01 (Seq_index xs@35@01 i@45@01)) i@45@01)
      (img@47@01 (Seq_index xs@35@01 i@45@01))))
  :pattern ((Seq_index xs@35@01 i@45@01))
  :qid |quant-u-13|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@47@01 r)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) (inv@46@01 r))
        (< $Perm.No q@37@01)))
    (= (Seq_index xs@35@01 (inv@46@01 r)) r))
  :pattern ((inv@46@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((i@45@01 Int)) (!
  (<= $Perm.No q@37@01)
  :pattern ((Seq_index xs@35@01 i@45@01))
  :qid |f-permAtLeastZero|)))
; Field permissions are at most one
(assert (forall ((i@45@01 Int)) (!
  (<= q@37@01 $Perm.Write)
  :pattern ((Seq_index xs@35@01 i@45@01))
  :qid |f-permAtMostOne|)))
; Permission implies non-null receiver
(assert (forall ((i@45@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@45@01)
      (< $Perm.No q@37@01))
    (not (= (Seq_index xs@35@01 i@45@01) $Ref.null)))
  :pattern ((Seq_index xs@35@01 i@45@01))
  :qid |f-permImpliesNonNull|)))
(declare-const i@48@01 Int)
(push) ; 3
; [eval] (i in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(assert (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@48@01))
; [eval] xs[i]
(push) ; 4
(assert (not (>= i@48@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@48@01 (Seq_length xs@35@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@49@01 ($Ref) Int)
(declare-fun img@50@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(push) ; 3
(assert (not (forall ((i@48@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@48@01)
    (or (= q@37@01 $Perm.No) (< $Perm.No q@37@01)))
  
  :qid |quant-u-14|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@48@01 Int) (i2@48@01 Int)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i1@48@01)
        (< $Perm.No q@37@01))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i2@48@01)
        (< $Perm.No q@37@01))
      (= (Seq_index xs@35@01 i1@48@01) (Seq_index xs@35@01 i2@48@01)))
    (= i1@48@01 i2@48@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@48@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@48@01)
      (< $Perm.No q@37@01))
    (and
      (= (inv@49@01 (Seq_index xs@35@01 i@48@01)) i@48@01)
      (img@50@01 (Seq_index xs@35@01 i@48@01))))
  :pattern ((Seq_index xs@35@01 i@48@01))
  :qid |quant-u-15|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@50@01 r)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) (inv@49@01 r))
        (< $Perm.No q@37@01)))
    (= (Seq_index xs@35@01 (inv@49@01 r)) r))
  :pattern ((inv@49@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
(assert (forall ((i@48@01 Int)) (!
  (<= $Perm.No q@37@01)
  :pattern ((Seq_index xs@35@01 i@48@01))
  :qid |f-permAtLeastZero|)))
; Field permissions are at most one
(assert (forall ((i@48@01 Int)) (!
  (<= q@37@01 $Perm.Write)
  :pattern ((Seq_index xs@35@01 i@48@01))
  :qid |f-permAtMostOne|)))
; Permission implies non-null receiver
(assert (forall ((i@48@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@48@01)
      (< $Perm.No q@37@01))
    (not (= (Seq_index xs@35@01 i@48@01) $Ref.null)))
  :pattern ((Seq_index xs@35@01 i@48@01))
  :qid |f-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@35@01 i@48@01) (Seq_index xs@35@01 i@45@01))
    (=
      (and
        (img@50@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) (inv@49@01 r)))
      (and
        (img@47@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) (inv@46@01 r)))))
  
  :qid |quant-u-16|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
(declare-const i@51@01 Int)
(push) ; 3
; [eval] (i in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(assert (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@51@01))
; [eval] xs[i]
(push) ; 4
(assert (not (>= i@51@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@51@01 (Seq_length xs@35@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@52@01 ($Ref) Int)
(declare-fun img@53@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(push) ; 3
(assert (not (forall ((i@51@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@51@01)
    (or (= q@37@01 $Perm.No) (< $Perm.No q@37@01)))
  
  :qid |quant-u-17|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@51@01 Int) (i2@51@01 Int)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i1@51@01)
        (< $Perm.No q@37@01))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i2@51@01)
        (< $Perm.No q@37@01))
      (= (Seq_index xs@35@01 i1@51@01) (Seq_index xs@35@01 i2@51@01)))
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
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@51@01)
      (< $Perm.No q@37@01))
    (and
      (= (inv@52@01 (Seq_index xs@35@01 i@51@01)) i@51@01)
      (img@53@01 (Seq_index xs@35@01 i@51@01))))
  :pattern ((Seq_index xs@35@01 i@51@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@53@01 r)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) (inv@52@01 r))
        (< $Perm.No q@37@01)))
    (= (Seq_index xs@35@01 (inv@52@01 r)) r))
  :pattern ((inv@52@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@54@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) (inv@52@01 r))
      (img@53@01 r)
      (= r (Seq_index xs@35@01 (inv@52@01 r))))
    ($Perm.min
      (ite
        (and
          (img@43@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) (inv@42@01 r)))
        p@36@01
        $Perm.No)
      q@37@01)
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
          (img@43@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) (inv@42@01 r)))
        p@36@01
        $Perm.No)
      (pTaken@54@01 r))
    $Perm.No)
  
  :qid |quant-u-19|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@54@01 r) $Perm.No)
  
  :qid |quant-u-20|))))
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
      (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) (inv@52@01 r))
      (img@53@01 r)
      (= r (Seq_index xs@35@01 (inv@52@01 r))))
    (= (- q@37@01 (pTaken@54@01 r)) $Perm.No))
  
  :qid |quant-u-21|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@55@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@43@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) (inv@42@01 r)))
      (< $Perm.No p@36@01)
      false)
    (=
      ($FVF.lookup_f (as sm@55@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second $t@38@01)))) r)))
  :pattern (($FVF.lookup_f (as sm@55@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second $t@38@01)))) r))
  :qid |qp.fvfValDef1|)))
(declare-const i@56@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (i in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(assert (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@56@01))
; [eval] xs[i]
(push) ; 4
(assert (not (>= i@56@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@56@01 (Seq_length xs@35@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@57@01 ($Ref) Int)
(declare-fun img@58@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(push) ; 3
(assert (not (forall ((i@56@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@56@01)
    (or (= q@37@01 $Perm.No) (< $Perm.No q@37@01)))
  
  :qid |quant-u-22|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@56@01 Int) (i2@56@01 Int)) (!
  (=>
    (and
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i1@56@01)
        (< $Perm.No q@37@01))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i2@56@01)
        (< $Perm.No q@37@01))
      (= (Seq_index xs@35@01 i1@56@01) (Seq_index xs@35@01 i2@56@01)))
    (= i1@56@01 i2@56@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@56@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) i@56@01)
      (< $Perm.No q@37@01))
    (and
      (= (inv@57@01 (Seq_index xs@35@01 i@56@01)) i@56@01)
      (img@58@01 (Seq_index xs@35@01 i@56@01))))
  :pattern ((Seq_index xs@35@01 i@56@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@58@01 r)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) (inv@57@01 r))
        (< $Perm.No q@37@01)))
    (= (Seq_index xs@35@01 (inv@57@01 r)) r))
  :pattern ((inv@57@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@59@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) (inv@57@01 r))
      (img@58@01 r)
      (= r (Seq_index xs@35@01 (inv@57@01 r))))
    ($Perm.min
      (ite
        (and
          (img@43@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) (inv@42@01 r)))
        (- p@36@01 (pTaken@54@01 r))
        $Perm.No)
      q@37@01)
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
          (img@43@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) (inv@42@01 r)))
        (- p@36@01 (pTaken@54@01 r))
        $Perm.No)
      (pTaken@59@01 r))
    $Perm.No)
  
  :qid |quant-u-24|))))
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
      (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) (inv@57@01 r))
      (img@58@01 r)
      (= r (Seq_index xs@35@01 (inv@57@01 r))))
    (= (- q@37@01 (pTaken@59@01 r)) $Perm.No))
  
  :qid |quant-u-25|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@60@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@43@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs@35@01)) (inv@42@01 r)))
      (< $Perm.No (- p@36@01 (pTaken@54@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@60@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second $t@38@01)))) r)))
  :pattern (($FVF.lookup_f (as sm@60@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second $t@38@01)))) r))
  :qid |qp.fvfValDef2|)))
(pop) ; 2
(pop) ; 1
; ---------- test01 ----------
(set-option :timeout 0)
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
; var xs1: Seq[Ref]
(declare-const xs1@61@01 Seq<$Ref>)
; [exec]
; var xs2: Seq[Ref]
(declare-const xs2@62@01 Seq<$Ref>)
; [exec]
; var xs3: Seq[Ref]
(declare-const xs3@63@01 Seq<$Ref>)
; [exec]
; init(xs1)
(declare-const $t@64@01 $Snap)
(assert (= $t@64@01 ($Snap.combine ($Snap.first $t@64@01) ($Snap.second $t@64@01))))
(assert (= ($Snap.first $t@64@01) $Snap.unit))
; [eval] (forall i: Int, j: Int :: { (i in [0..|xs|)), (j in [0..|xs|)) } { (i in [0..|xs|)), xs[j] } { (j in [0..|xs|)), xs[i] } { xs[i], xs[j] } (i in [0..|xs|)) && ((j in [0..|xs|)) && i != j) ==> xs[i] != xs[j])
(declare-const i@65@01 Int)
(declare-const j@66@01 Int)
(push) ; 3
; [eval] (i in [0..|xs|)) && ((j in [0..|xs|)) && i != j) ==> xs[i] != xs[j]
; [eval] (i in [0..|xs|)) && ((j in [0..|xs|)) && i != j)
; [eval] (i in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(push) ; 4
; [then-branch: 15 | !(i@65@01 in [0..|xs1@61@01|]) | live]
; [else-branch: 15 | i@65@01 in [0..|xs1@61@01|] | live]
(push) ; 5
; [then-branch: 15 | !(i@65@01 in [0..|xs1@61@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@65@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 15 | i@65@01 in [0..|xs1@61@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@65@01))
; [eval] (j in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(push) ; 6
; [then-branch: 16 | !(j@66@01 in [0..|xs1@61@01|]) | live]
; [else-branch: 16 | j@66@01 in [0..|xs1@61@01|] | live]
(push) ; 7
; [then-branch: 16 | !(j@66@01 in [0..|xs1@61@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@66@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 16 | j@66@01 in [0..|xs1@61@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@66@01))
; [eval] i != j
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@66@01)
  (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@66@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@65@01)
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@65@01)
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@66@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@66@01))))))
(assert (or
  (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@65@01)
  (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@65@01))))
(push) ; 4
; [then-branch: 17 | i@65@01 in [0..|xs1@61@01|] && j@66@01 in [0..|xs1@61@01|] && i@65@01 != j@66@01 | live]
; [else-branch: 17 | !(i@65@01 in [0..|xs1@61@01|] && j@66@01 in [0..|xs1@61@01|] && i@65@01 != j@66@01) | live]
(push) ; 5
; [then-branch: 17 | i@65@01 in [0..|xs1@61@01|] && j@66@01 in [0..|xs1@61@01|] && i@65@01 != j@66@01]
(assert (and
  (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@65@01)
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@66@01)
    (not (= i@65@01 j@66@01)))))
; [eval] xs[i] != xs[j]
; [eval] xs[i]
(push) ; 6
(assert (not (>= i@65@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@65@01 (Seq_length xs1@61@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] xs[j]
(push) ; 6
(assert (not (>= j@66@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< j@66@01 (Seq_length xs1@61@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 17 | !(i@65@01 in [0..|xs1@61@01|] && j@66@01 in [0..|xs1@61@01|] && i@65@01 != j@66@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@65@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@66@01)
      (not (= i@65@01 j@66@01))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@65@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@66@01)
      (not (= i@65@01 j@66@01))))
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@65@01)
    (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@66@01)
    (not (= i@65@01 j@66@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@65@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@66@01)
        (not (= i@65@01 j@66@01)))))
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@65@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@66@01)
      (not (= i@65@01 j@66@01))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@65@01 Int) (j@66@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@65@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@65@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@66@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@66@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@65@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@65@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@65@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@66@01)
          (not (= i@65@01 j@66@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@65@01)
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@66@01)
        (not (= i@65@01 j@66@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@65@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@66@01)
            (not (= i@65@01 j@66@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@65@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@66@01)
          (not (= i@65@01 j@66@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@65@01) (Seq_contains
    (Seq_range 0 (Seq_length xs1@61@01))
    j@66@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) i@65@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs1@61@01))
    j@66@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@7@11@7@97-aux|)))
(assert (forall ((i@65@01 Int) (j@66@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@65@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@65@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@66@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@66@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@65@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@65@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@65@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@66@01)
          (not (= i@65@01 j@66@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@65@01)
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@66@01)
        (not (= i@65@01 j@66@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@65@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@66@01)
            (not (= i@65@01 j@66@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@65@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@66@01)
          (not (= i@65@01 j@66@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) i@65@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs1@61@01))
    j@66@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@7@11@7@97-aux|)))
(assert (forall ((i@65@01 Int) (j@66@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@65@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@65@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@66@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@66@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@65@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@65@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@65@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@66@01)
          (not (= i@65@01 j@66@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@65@01)
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@66@01)
        (not (= i@65@01 j@66@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@65@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@66@01)
            (not (= i@65@01 j@66@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@65@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@66@01)
          (not (= i@65@01 j@66@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@65@01) (Seq_index
    xs1@61@01
    j@66@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) i@65@01) (Seq_index
    xs1@61@01
    j@66@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@7@11@7@97-aux|)))
(assert (forall ((i@65@01 Int) (j@66@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@65@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@65@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@66@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@66@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@65@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@65@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@65@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@66@01)
          (not (= i@65@01 j@66@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@65@01)
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@66@01)
        (not (= i@65@01 j@66@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@65@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@66@01)
            (not (= i@65@01 j@66@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@65@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@66@01)
          (not (= i@65@01 j@66@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) i@65@01) (Seq_index
    xs1@61@01
    j@66@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@7@11@7@97-aux|)))
(assert (forall ((i@65@01 Int) (j@66@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@65@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@65@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@66@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@66@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@65@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@65@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@65@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@66@01)
          (not (= i@65@01 j@66@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@65@01)
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@66@01)
        (not (= i@65@01 j@66@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@65@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@66@01)
            (not (= i@65@01 j@66@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@65@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@66@01)
          (not (= i@65@01 j@66@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@66@01) (Seq_index
    xs1@61@01
    i@65@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) j@66@01) (Seq_index
    xs1@61@01
    i@65@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@7@11@7@97-aux|)))
(assert (forall ((i@65@01 Int) (j@66@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@65@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@65@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@66@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@66@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@65@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@65@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@65@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@66@01)
          (not (= i@65@01 j@66@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@65@01)
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@66@01)
        (not (= i@65@01 j@66@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@65@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@66@01)
            (not (= i@65@01 j@66@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@65@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@66@01)
          (not (= i@65@01 j@66@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) j@66@01) (Seq_index
    xs1@61@01
    i@65@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@7@11@7@97-aux|)))
(assert (forall ((i@65@01 Int) (j@66@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@65@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@65@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@66@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@66@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@65@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@65@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@65@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@66@01)
          (not (= i@65@01 j@66@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@65@01)
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@66@01)
        (not (= i@65@01 j@66@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@65@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@66@01)
            (not (= i@65@01 j@66@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@65@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@66@01)
          (not (= i@65@01 j@66@01))))))
  :pattern ((Seq_index xs1@61@01 i@65@01) (Seq_index xs1@61@01 j@66@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@7@11@7@97-aux|)))
(assert (forall ((i@65@01 Int) (j@66@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@65@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@66@01)
        (not (= i@65@01 j@66@01))))
    (not (= (Seq_index xs1@61@01 i@65@01) (Seq_index xs1@61@01 j@66@01))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@65@01) (Seq_contains
    (Seq_range 0 (Seq_length xs1@61@01))
    j@66@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) i@65@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs1@61@01))
    j@66@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@65@01) (Seq_index
    xs1@61@01
    j@66@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) i@65@01) (Seq_index
    xs1@61@01
    j@66@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@66@01) (Seq_index
    xs1@61@01
    i@65@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) j@66@01) (Seq_index
    xs1@61@01
    i@65@01))
  :pattern ((Seq_index xs1@61@01 i@65@01) (Seq_index xs1@61@01 j@66@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@7@11@7@97|)))
(declare-const i@67@01 Int)
(push) ; 3
; [eval] (i in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(assert (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@67@01))
; [eval] xs[i]
(push) ; 4
(assert (not (>= i@67@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@67@01 (Seq_length xs1@61@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@68@01 ($Ref) Int)
(declare-fun img@69@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@67@01 Int) (i2@67@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i1@67@01)
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i2@67@01)
      (= (Seq_index xs1@61@01 i1@67@01) (Seq_index xs1@61@01 i2@67@01)))
    (= i1@67@01 i2@67@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@67@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@67@01)
    (and
      (= (inv@68@01 (Seq_index xs1@61@01 i@67@01)) i@67@01)
      (img@69@01 (Seq_index xs1@61@01 i@67@01))))
  :pattern ((Seq_index xs1@61@01 i@67@01))
  :qid |quant-u-27|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@69@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@68@01 r)))
    (= (Seq_index xs1@61@01 (inv@68@01 r)) r))
  :pattern ((inv@68@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@67@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@67@01)
    (not (= (Seq_index xs1@61@01 i@67@01) $Ref.null)))
  :pattern ((Seq_index xs1@61@01 i@67@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; init(xs2)
(declare-const $t@70@01 $Snap)
(assert (= $t@70@01 ($Snap.combine ($Snap.first $t@70@01) ($Snap.second $t@70@01))))
(assert (= ($Snap.first $t@70@01) $Snap.unit))
; [eval] (forall i: Int, j: Int :: { (i in [0..|xs|)), (j in [0..|xs|)) } { (i in [0..|xs|)), xs[j] } { (j in [0..|xs|)), xs[i] } { xs[i], xs[j] } (i in [0..|xs|)) && ((j in [0..|xs|)) && i != j) ==> xs[i] != xs[j])
(declare-const i@71@01 Int)
(declare-const j@72@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (i in [0..|xs|)) && ((j in [0..|xs|)) && i != j) ==> xs[i] != xs[j]
; [eval] (i in [0..|xs|)) && ((j in [0..|xs|)) && i != j)
; [eval] (i in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(push) ; 4
; [then-branch: 18 | !(i@71@01 in [0..|xs2@62@01|]) | live]
; [else-branch: 18 | i@71@01 in [0..|xs2@62@01|] | live]
(push) ; 5
; [then-branch: 18 | !(i@71@01 in [0..|xs2@62@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@71@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 18 | i@71@01 in [0..|xs2@62@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@71@01))
; [eval] (j in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(push) ; 6
; [then-branch: 19 | !(j@72@01 in [0..|xs2@62@01|]) | live]
; [else-branch: 19 | j@72@01 in [0..|xs2@62@01|] | live]
(push) ; 7
; [then-branch: 19 | !(j@72@01 in [0..|xs2@62@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@72@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 19 | j@72@01 in [0..|xs2@62@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@72@01))
; [eval] i != j
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@72@01)
  (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@72@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@71@01)
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@71@01)
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@72@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@72@01))))))
(assert (or
  (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@71@01)
  (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@71@01))))
(push) ; 4
; [then-branch: 20 | i@71@01 in [0..|xs2@62@01|] && j@72@01 in [0..|xs2@62@01|] && i@71@01 != j@72@01 | live]
; [else-branch: 20 | !(i@71@01 in [0..|xs2@62@01|] && j@72@01 in [0..|xs2@62@01|] && i@71@01 != j@72@01) | live]
(push) ; 5
; [then-branch: 20 | i@71@01 in [0..|xs2@62@01|] && j@72@01 in [0..|xs2@62@01|] && i@71@01 != j@72@01]
(assert (and
  (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@71@01)
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@72@01)
    (not (= i@71@01 j@72@01)))))
; [eval] xs[i] != xs[j]
; [eval] xs[i]
(push) ; 6
(assert (not (>= i@71@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@71@01 (Seq_length xs2@62@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] xs[j]
(push) ; 6
(assert (not (>= j@72@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< j@72@01 (Seq_length xs2@62@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 20 | !(i@71@01 in [0..|xs2@62@01|] && j@72@01 in [0..|xs2@62@01|] && i@71@01 != j@72@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@71@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@72@01)
      (not (= i@71@01 j@72@01))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@71@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@72@01)
      (not (= i@71@01 j@72@01))))
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@71@01)
    (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@72@01)
    (not (= i@71@01 j@72@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@71@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@72@01)
        (not (= i@71@01 j@72@01)))))
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@71@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@72@01)
      (not (= i@71@01 j@72@01))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@71@01 Int) (j@72@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@71@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@71@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@72@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@72@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@71@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@71@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@71@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@72@01)
          (not (= i@71@01 j@72@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@71@01)
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@72@01)
        (not (= i@71@01 j@72@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@71@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@72@01)
            (not (= i@71@01 j@72@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@71@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@72@01)
          (not (= i@71@01 j@72@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@71@01) (Seq_contains
    (Seq_range 0 (Seq_length xs2@62@01))
    j@72@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs2@62@01)) i@71@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs2@62@01))
    j@72@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@7@11@7@97-aux|)))
(assert (forall ((i@71@01 Int) (j@72@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@71@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@71@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@72@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@72@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@71@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@71@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@71@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@72@01)
          (not (= i@71@01 j@72@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@71@01)
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@72@01)
        (not (= i@71@01 j@72@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@71@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@72@01)
            (not (= i@71@01 j@72@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@71@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@72@01)
          (not (= i@71@01 j@72@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs2@62@01)) i@71@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs2@62@01))
    j@72@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@7@11@7@97-aux|)))
(assert (forall ((i@71@01 Int) (j@72@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@71@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@71@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@72@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@72@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@71@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@71@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@71@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@72@01)
          (not (= i@71@01 j@72@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@71@01)
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@72@01)
        (not (= i@71@01 j@72@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@71@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@72@01)
            (not (= i@71@01 j@72@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@71@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@72@01)
          (not (= i@71@01 j@72@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@71@01) (Seq_index
    xs2@62@01
    j@72@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs2@62@01)) i@71@01) (Seq_index
    xs2@62@01
    j@72@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@7@11@7@97-aux|)))
(assert (forall ((i@71@01 Int) (j@72@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@71@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@71@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@72@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@72@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@71@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@71@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@71@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@72@01)
          (not (= i@71@01 j@72@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@71@01)
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@72@01)
        (not (= i@71@01 j@72@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@71@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@72@01)
            (not (= i@71@01 j@72@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@71@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@72@01)
          (not (= i@71@01 j@72@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs2@62@01)) i@71@01) (Seq_index
    xs2@62@01
    j@72@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@7@11@7@97-aux|)))
(assert (forall ((i@71@01 Int) (j@72@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@71@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@71@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@72@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@72@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@71@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@71@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@71@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@72@01)
          (not (= i@71@01 j@72@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@71@01)
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@72@01)
        (not (= i@71@01 j@72@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@71@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@72@01)
            (not (= i@71@01 j@72@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@71@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@72@01)
          (not (= i@71@01 j@72@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@72@01) (Seq_index
    xs2@62@01
    i@71@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs2@62@01)) j@72@01) (Seq_index
    xs2@62@01
    i@71@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@7@11@7@97-aux|)))
(assert (forall ((i@71@01 Int) (j@72@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@71@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@71@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@72@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@72@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@71@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@71@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@71@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@72@01)
          (not (= i@71@01 j@72@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@71@01)
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@72@01)
        (not (= i@71@01 j@72@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@71@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@72@01)
            (not (= i@71@01 j@72@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@71@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@72@01)
          (not (= i@71@01 j@72@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs2@62@01)) j@72@01) (Seq_index
    xs2@62@01
    i@71@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@7@11@7@97-aux|)))
(assert (forall ((i@71@01 Int) (j@72@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@71@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@71@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@72@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@72@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@71@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@71@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@71@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@72@01)
          (not (= i@71@01 j@72@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@71@01)
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@72@01)
        (not (= i@71@01 j@72@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@71@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@72@01)
            (not (= i@71@01 j@72@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@71@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@72@01)
          (not (= i@71@01 j@72@01))))))
  :pattern ((Seq_index xs2@62@01 i@71@01) (Seq_index xs2@62@01 j@72@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@7@11@7@97-aux|)))
(assert (forall ((i@71@01 Int) (j@72@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@71@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@72@01)
        (not (= i@71@01 j@72@01))))
    (not (= (Seq_index xs2@62@01 i@71@01) (Seq_index xs2@62@01 j@72@01))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@71@01) (Seq_contains
    (Seq_range 0 (Seq_length xs2@62@01))
    j@72@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs2@62@01)) i@71@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs2@62@01))
    j@72@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@71@01) (Seq_index
    xs2@62@01
    j@72@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs2@62@01)) i@71@01) (Seq_index
    xs2@62@01
    j@72@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@72@01) (Seq_index
    xs2@62@01
    i@71@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs2@62@01)) j@72@01) (Seq_index
    xs2@62@01
    i@71@01))
  :pattern ((Seq_index xs2@62@01 i@71@01) (Seq_index xs2@62@01 j@72@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@7@11@7@97|)))
(declare-const i@73@01 Int)
(push) ; 3
; [eval] (i in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(assert (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@73@01))
; [eval] xs[i]
(push) ; 4
(assert (not (>= i@73@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@73@01 (Seq_length xs2@62@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@74@01 ($Ref) Int)
(declare-fun img@75@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@73@01 Int) (i2@73@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i1@73@01)
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i2@73@01)
      (= (Seq_index xs2@62@01 i1@73@01) (Seq_index xs2@62@01 i2@73@01)))
    (= i1@73@01 i2@73@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@73@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@73@01)
    (and
      (= (inv@74@01 (Seq_index xs2@62@01 i@73@01)) i@73@01)
      (img@75@01 (Seq_index xs2@62@01 i@73@01))))
  :pattern ((Seq_index xs2@62@01 i@73@01))
  :qid |quant-u-29|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@75@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@74@01 r)))
    (= (Seq_index xs2@62@01 (inv@74@01 r)) r))
  :pattern ((inv@74@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@73@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@73@01)
    (not (= (Seq_index xs2@62@01 i@73@01) $Ref.null)))
  :pattern ((Seq_index xs2@62@01 i@73@01))
  :qid |f-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs2@62@01 i@73@01) (Seq_index xs1@61@01 i@67@01))
    (=
      (and
        (img@75@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@74@01 r)))
      (and
        (img@69@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@68@01 r)))))
  
  :qid |quant-u-30|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; init(xs3)
(declare-const $t@76@01 $Snap)
(assert (= $t@76@01 ($Snap.combine ($Snap.first $t@76@01) ($Snap.second $t@76@01))))
(assert (= ($Snap.first $t@76@01) $Snap.unit))
; [eval] (forall i: Int, j: Int :: { (i in [0..|xs|)), (j in [0..|xs|)) } { (i in [0..|xs|)), xs[j] } { (j in [0..|xs|)), xs[i] } { xs[i], xs[j] } (i in [0..|xs|)) && ((j in [0..|xs|)) && i != j) ==> xs[i] != xs[j])
(declare-const i@77@01 Int)
(declare-const j@78@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (i in [0..|xs|)) && ((j in [0..|xs|)) && i != j) ==> xs[i] != xs[j]
; [eval] (i in [0..|xs|)) && ((j in [0..|xs|)) && i != j)
; [eval] (i in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(push) ; 4
; [then-branch: 21 | !(i@77@01 in [0..|xs3@63@01|]) | live]
; [else-branch: 21 | i@77@01 in [0..|xs3@63@01|] | live]
(push) ; 5
; [then-branch: 21 | !(i@77@01 in [0..|xs3@63@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@77@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 21 | i@77@01 in [0..|xs3@63@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@77@01))
; [eval] (j in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(push) ; 6
; [then-branch: 22 | !(j@78@01 in [0..|xs3@63@01|]) | live]
; [else-branch: 22 | j@78@01 in [0..|xs3@63@01|] | live]
(push) ; 7
; [then-branch: 22 | !(j@78@01 in [0..|xs3@63@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@78@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 22 | j@78@01 in [0..|xs3@63@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@78@01))
; [eval] i != j
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@78@01)
  (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@78@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@77@01)
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@77@01)
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@78@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@78@01))))))
(assert (or
  (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@77@01)
  (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@77@01))))
(push) ; 4
; [then-branch: 23 | i@77@01 in [0..|xs3@63@01|] && j@78@01 in [0..|xs3@63@01|] && i@77@01 != j@78@01 | live]
; [else-branch: 23 | !(i@77@01 in [0..|xs3@63@01|] && j@78@01 in [0..|xs3@63@01|] && i@77@01 != j@78@01) | live]
(push) ; 5
; [then-branch: 23 | i@77@01 in [0..|xs3@63@01|] && j@78@01 in [0..|xs3@63@01|] && i@77@01 != j@78@01]
(assert (and
  (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@77@01)
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@78@01)
    (not (= i@77@01 j@78@01)))))
; [eval] xs[i] != xs[j]
; [eval] xs[i]
(push) ; 6
(assert (not (>= i@77@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@77@01 (Seq_length xs3@63@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] xs[j]
(push) ; 6
(assert (not (>= j@78@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< j@78@01 (Seq_length xs3@63@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 23 | !(i@77@01 in [0..|xs3@63@01|] && j@78@01 in [0..|xs3@63@01|] && i@77@01 != j@78@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@77@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@78@01)
      (not (= i@77@01 j@78@01))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@77@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@78@01)
      (not (= i@77@01 j@78@01))))
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@77@01)
    (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@78@01)
    (not (= i@77@01 j@78@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@77@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@78@01)
        (not (= i@77@01 j@78@01)))))
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@77@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@78@01)
      (not (= i@77@01 j@78@01))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@77@01 Int) (j@78@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@77@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@77@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@78@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@78@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@77@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@77@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@77@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@78@01)
          (not (= i@77@01 j@78@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@77@01)
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@78@01)
        (not (= i@77@01 j@78@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@77@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@78@01)
            (not (= i@77@01 j@78@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@77@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@78@01)
          (not (= i@77@01 j@78@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@77@01) (Seq_contains
    (Seq_range 0 (Seq_length xs3@63@01))
    j@78@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs3@63@01)) i@77@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs3@63@01))
    j@78@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@7@11@7@97-aux|)))
(assert (forall ((i@77@01 Int) (j@78@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@77@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@77@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@78@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@78@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@77@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@77@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@77@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@78@01)
          (not (= i@77@01 j@78@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@77@01)
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@78@01)
        (not (= i@77@01 j@78@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@77@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@78@01)
            (not (= i@77@01 j@78@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@77@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@78@01)
          (not (= i@77@01 j@78@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs3@63@01)) i@77@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs3@63@01))
    j@78@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@7@11@7@97-aux|)))
(assert (forall ((i@77@01 Int) (j@78@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@77@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@77@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@78@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@78@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@77@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@77@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@77@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@78@01)
          (not (= i@77@01 j@78@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@77@01)
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@78@01)
        (not (= i@77@01 j@78@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@77@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@78@01)
            (not (= i@77@01 j@78@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@77@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@78@01)
          (not (= i@77@01 j@78@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@77@01) (Seq_index
    xs3@63@01
    j@78@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs3@63@01)) i@77@01) (Seq_index
    xs3@63@01
    j@78@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@7@11@7@97-aux|)))
(assert (forall ((i@77@01 Int) (j@78@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@77@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@77@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@78@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@78@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@77@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@77@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@77@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@78@01)
          (not (= i@77@01 j@78@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@77@01)
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@78@01)
        (not (= i@77@01 j@78@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@77@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@78@01)
            (not (= i@77@01 j@78@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@77@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@78@01)
          (not (= i@77@01 j@78@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs3@63@01)) i@77@01) (Seq_index
    xs3@63@01
    j@78@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@7@11@7@97-aux|)))
(assert (forall ((i@77@01 Int) (j@78@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@77@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@77@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@78@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@78@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@77@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@77@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@77@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@78@01)
          (not (= i@77@01 j@78@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@77@01)
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@78@01)
        (not (= i@77@01 j@78@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@77@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@78@01)
            (not (= i@77@01 j@78@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@77@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@78@01)
          (not (= i@77@01 j@78@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@78@01) (Seq_index
    xs3@63@01
    i@77@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs3@63@01)) j@78@01) (Seq_index
    xs3@63@01
    i@77@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@7@11@7@97-aux|)))
(assert (forall ((i@77@01 Int) (j@78@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@77@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@77@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@78@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@78@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@77@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@77@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@77@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@78@01)
          (not (= i@77@01 j@78@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@77@01)
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@78@01)
        (not (= i@77@01 j@78@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@77@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@78@01)
            (not (= i@77@01 j@78@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@77@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@78@01)
          (not (= i@77@01 j@78@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs3@63@01)) j@78@01) (Seq_index
    xs3@63@01
    i@77@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@7@11@7@97-aux|)))
(assert (forall ((i@77@01 Int) (j@78@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@77@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@77@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@78@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@78@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@77@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@77@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@77@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@78@01)
          (not (= i@77@01 j@78@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@77@01)
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@78@01)
        (not (= i@77@01 j@78@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@77@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@78@01)
            (not (= i@77@01 j@78@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@77@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@78@01)
          (not (= i@77@01 j@78@01))))))
  :pattern ((Seq_index xs3@63@01 i@77@01) (Seq_index xs3@63@01 j@78@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@7@11@7@97-aux|)))
(assert (forall ((i@77@01 Int) (j@78@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@77@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@78@01)
        (not (= i@77@01 j@78@01))))
    (not (= (Seq_index xs3@63@01 i@77@01) (Seq_index xs3@63@01 j@78@01))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@77@01) (Seq_contains
    (Seq_range 0 (Seq_length xs3@63@01))
    j@78@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs3@63@01)) i@77@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs3@63@01))
    j@78@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@77@01) (Seq_index
    xs3@63@01
    j@78@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs3@63@01)) i@77@01) (Seq_index
    xs3@63@01
    j@78@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@78@01) (Seq_index
    xs3@63@01
    i@77@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs3@63@01)) j@78@01) (Seq_index
    xs3@63@01
    i@77@01))
  :pattern ((Seq_index xs3@63@01 i@77@01) (Seq_index xs3@63@01 j@78@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@7@11@7@97|)))
(declare-const i@79@01 Int)
(push) ; 3
; [eval] (i in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(assert (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@79@01))
; [eval] xs[i]
(push) ; 4
(assert (not (>= i@79@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@79@01 (Seq_length xs3@63@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@80@01 ($Ref) Int)
(declare-fun img@81@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@79@01 Int) (i2@79@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i1@79@01)
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i2@79@01)
      (= (Seq_index xs3@63@01 i1@79@01) (Seq_index xs3@63@01 i2@79@01)))
    (= i1@79@01 i2@79@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@79@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@79@01)
    (and
      (= (inv@80@01 (Seq_index xs3@63@01 i@79@01)) i@79@01)
      (img@81@01 (Seq_index xs3@63@01 i@79@01))))
  :pattern ((Seq_index xs3@63@01 i@79@01))
  :qid |quant-u-32|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@81@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@80@01 r)))
    (= (Seq_index xs3@63@01 (inv@80@01 r)) r))
  :pattern ((inv@80@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@79@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@79@01)
    (not (= (Seq_index xs3@63@01 i@79@01) $Ref.null)))
  :pattern ((Seq_index xs3@63@01 i@79@01))
  :qid |f-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs3@63@01 i@79@01) (Seq_index xs2@62@01 i@73@01))
    (=
      (and
        (img@81@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@80@01 r)))
      (and
        (img@75@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@74@01 r)))))
  
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
  (and
    (= (Seq_index xs3@63@01 i@79@01) (Seq_index xs1@61@01 i@67@01))
    (=
      (and
        (img@81@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@80@01 r)))
      (and
        (img@69@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@68@01 r)))))
  
  :qid |quant-u-34|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; split(xs1, write, 1 / 2)
; [eval] p == 2 * q
; [eval] 2 * q
; [eval] p >= none
; [eval] (forall i: Int, j: Int :: { (i in [0..|xs|)), (j in [0..|xs|)) } { (i in [0..|xs|)), xs[j] } { (j in [0..|xs|)), xs[i] } { xs[i], xs[j] } (i in [0..|xs|)) && ((j in [0..|xs|)) && i != j) ==> xs[i] != xs[j])
(declare-const i@82@01 Int)
(declare-const j@83@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (i in [0..|xs|)) && ((j in [0..|xs|)) && i != j) ==> xs[i] != xs[j]
; [eval] (i in [0..|xs|)) && ((j in [0..|xs|)) && i != j)
; [eval] (i in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(push) ; 4
; [then-branch: 24 | !(i@82@01 in [0..|xs1@61@01|]) | live]
; [else-branch: 24 | i@82@01 in [0..|xs1@61@01|] | live]
(push) ; 5
; [then-branch: 24 | !(i@82@01 in [0..|xs1@61@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@82@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 24 | i@82@01 in [0..|xs1@61@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@82@01))
; [eval] (j in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(push) ; 6
; [then-branch: 25 | !(j@83@01 in [0..|xs1@61@01|]) | live]
; [else-branch: 25 | j@83@01 in [0..|xs1@61@01|] | live]
(push) ; 7
; [then-branch: 25 | !(j@83@01 in [0..|xs1@61@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@83@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 25 | j@83@01 in [0..|xs1@61@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@83@01))
; [eval] i != j
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@83@01)
  (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@83@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@82@01)
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@82@01)
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@83@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@83@01))))))
(assert (or
  (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@82@01)
  (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@82@01))))
(push) ; 4
; [then-branch: 26 | i@82@01 in [0..|xs1@61@01|] && j@83@01 in [0..|xs1@61@01|] && i@82@01 != j@83@01 | live]
; [else-branch: 26 | !(i@82@01 in [0..|xs1@61@01|] && j@83@01 in [0..|xs1@61@01|] && i@82@01 != j@83@01) | live]
(push) ; 5
; [then-branch: 26 | i@82@01 in [0..|xs1@61@01|] && j@83@01 in [0..|xs1@61@01|] && i@82@01 != j@83@01]
(assert (and
  (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@82@01)
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@83@01)
    (not (= i@82@01 j@83@01)))))
; [eval] xs[i] != xs[j]
; [eval] xs[i]
(push) ; 6
(assert (not (>= i@82@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@82@01 (Seq_length xs1@61@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] xs[j]
(push) ; 6
(assert (not (>= j@83@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< j@83@01 (Seq_length xs1@61@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 26 | !(i@82@01 in [0..|xs1@61@01|] && j@83@01 in [0..|xs1@61@01|] && i@82@01 != j@83@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@82@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@83@01)
      (not (= i@82@01 j@83@01))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@82@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@83@01)
      (not (= i@82@01 j@83@01))))
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@82@01)
    (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@83@01)
    (not (= i@82@01 j@83@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@82@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@83@01)
        (not (= i@82@01 j@83@01)))))
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@82@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@83@01)
      (not (= i@82@01 j@83@01))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@82@01 Int) (j@83@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@82@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@82@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@83@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@83@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@82@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@82@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@82@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@83@01)
          (not (= i@82@01 j@83@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@82@01)
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@83@01)
        (not (= i@82@01 j@83@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@82@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@83@01)
            (not (= i@82@01 j@83@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@82@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@83@01)
          (not (= i@82@01 j@83@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@82@01) (Seq_contains
    (Seq_range 0 (Seq_length xs1@61@01))
    j@83@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) i@82@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs1@61@01))
    j@83@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@23@12@23@98-aux|)))
(assert (forall ((i@82@01 Int) (j@83@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@82@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@82@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@83@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@83@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@82@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@82@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@82@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@83@01)
          (not (= i@82@01 j@83@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@82@01)
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@83@01)
        (not (= i@82@01 j@83@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@82@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@83@01)
            (not (= i@82@01 j@83@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@82@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@83@01)
          (not (= i@82@01 j@83@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) i@82@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs1@61@01))
    j@83@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@23@12@23@98-aux|)))
(assert (forall ((i@82@01 Int) (j@83@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@82@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@82@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@83@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@83@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@82@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@82@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@82@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@83@01)
          (not (= i@82@01 j@83@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@82@01)
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@83@01)
        (not (= i@82@01 j@83@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@82@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@83@01)
            (not (= i@82@01 j@83@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@82@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@83@01)
          (not (= i@82@01 j@83@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@82@01) (Seq_index
    xs1@61@01
    j@83@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) i@82@01) (Seq_index
    xs1@61@01
    j@83@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@23@12@23@98-aux|)))
(assert (forall ((i@82@01 Int) (j@83@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@82@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@82@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@83@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@83@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@82@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@82@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@82@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@83@01)
          (not (= i@82@01 j@83@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@82@01)
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@83@01)
        (not (= i@82@01 j@83@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@82@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@83@01)
            (not (= i@82@01 j@83@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@82@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@83@01)
          (not (= i@82@01 j@83@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) i@82@01) (Seq_index
    xs1@61@01
    j@83@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@23@12@23@98-aux|)))
(assert (forall ((i@82@01 Int) (j@83@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@82@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@82@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@83@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@83@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@82@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@82@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@82@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@83@01)
          (not (= i@82@01 j@83@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@82@01)
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@83@01)
        (not (= i@82@01 j@83@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@82@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@83@01)
            (not (= i@82@01 j@83@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@82@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@83@01)
          (not (= i@82@01 j@83@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@83@01) (Seq_index
    xs1@61@01
    i@82@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) j@83@01) (Seq_index
    xs1@61@01
    i@82@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@23@12@23@98-aux|)))
(assert (forall ((i@82@01 Int) (j@83@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@82@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@82@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@83@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@83@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@82@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@82@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@82@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@83@01)
          (not (= i@82@01 j@83@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@82@01)
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@83@01)
        (not (= i@82@01 j@83@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@82@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@83@01)
            (not (= i@82@01 j@83@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@82@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@83@01)
          (not (= i@82@01 j@83@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) j@83@01) (Seq_index
    xs1@61@01
    i@82@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@23@12@23@98-aux|)))
(assert (forall ((i@82@01 Int) (j@83@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@82@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@82@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@83@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@83@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@82@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@82@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@82@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@83@01)
          (not (= i@82@01 j@83@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@82@01)
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@83@01)
        (not (= i@82@01 j@83@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@82@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@83@01)
            (not (= i@82@01 j@83@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@82@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@83@01)
          (not (= i@82@01 j@83@01))))))
  :pattern ((Seq_index xs1@61@01 i@82@01) (Seq_index xs1@61@01 j@83@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@23@12@23@98-aux|)))
(push) ; 3
(assert (not (forall ((i@82@01 Int) (j@83@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@82@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@83@01)
        (not (= i@82@01 j@83@01))))
    (not (= (Seq_index xs1@61@01 i@82@01) (Seq_index xs1@61@01 j@83@01))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@82@01) (Seq_contains
    (Seq_range 0 (Seq_length xs1@61@01))
    j@83@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) i@82@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs1@61@01))
    j@83@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) i@82@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs1@61@01))
    j@83@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@82@01) (Seq_index
    xs1@61@01
    j@83@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) i@82@01) (Seq_index
    xs1@61@01
    j@83@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) i@82@01) (Seq_index
    xs1@61@01
    j@83@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@83@01) (Seq_index
    xs1@61@01
    i@82@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) j@83@01) (Seq_index
    xs1@61@01
    i@82@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) j@83@01) (Seq_index
    xs1@61@01
    i@82@01))
  :pattern ((Seq_index xs1@61@01 i@82@01) (Seq_index xs1@61@01 j@83@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@23@12@23@98|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@82@01 Int) (j@83@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@82@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@83@01)
        (not (= i@82@01 j@83@01))))
    (not (= (Seq_index xs1@61@01 i@82@01) (Seq_index xs1@61@01 j@83@01))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@82@01) (Seq_contains
    (Seq_range 0 (Seq_length xs1@61@01))
    j@83@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) i@82@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs1@61@01))
    j@83@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@82@01) (Seq_index
    xs1@61@01
    j@83@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) i@82@01) (Seq_index
    xs1@61@01
    j@83@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@83@01) (Seq_index
    xs1@61@01
    i@82@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) j@83@01) (Seq_index
    xs1@61@01
    i@82@01))
  :pattern ((Seq_index xs1@61@01 i@82@01) (Seq_index xs1@61@01 j@83@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@23@12@23@98|)))
(declare-const i@84@01 Int)
(push) ; 3
; [eval] (i in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(assert (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@84@01))
; [eval] xs[i]
(push) ; 4
(assert (not (>= i@84@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@84@01 (Seq_length xs1@61@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@85@01 ($Ref) Int)
(declare-fun img@86@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@84@01 Int) (i2@84@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i1@84@01)
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i2@84@01)
      (= (Seq_index xs1@61@01 i1@84@01) (Seq_index xs1@61@01 i2@84@01)))
    (= i1@84@01 i2@84@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@84@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@84@01)
    (and
      (= (inv@85@01 (Seq_index xs1@61@01 i@84@01)) i@84@01)
      (img@86@01 (Seq_index xs1@61@01 i@84@01))))
  :pattern ((Seq_index xs1@61@01 i@84@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@86@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@85@01 r)))
    (= (Seq_index xs1@61@01 (inv@85@01 r)) r))
  :pattern ((inv@85@01 r))
  :qid |f-fctOfInv|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((i@84@01 Int)) (!
  (= (Seq_index xs1@61@01 i@84@01) (Seq_index xs2@62@01 i@84@01))
  
  :qid |quant-u-36|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((i@84@01 Int)) (!
  (= (Seq_index xs1@61@01 i@84@01) (Seq_index xs3@63@01 i@84@01))
  
  :qid |quant-u-37|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@87@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@85@01 r))
      (img@86@01 r)
      (= r (Seq_index xs1@61@01 (inv@85@01 r))))
    ($Perm.min
      (ite
        (and
          (img@69@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@68@01 r)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@88@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@85@01 r))
      (img@86@01 r)
      (= r (Seq_index xs1@61@01 (inv@85@01 r))))
    ($Perm.min
      (ite
        (and
          (img@75@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@74@01 r)))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@87@01 r)))
    $Perm.No))
(define-fun pTaken@89@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@85@01 r))
      (img@86@01 r)
      (= r (Seq_index xs1@61@01 (inv@85@01 r))))
    ($Perm.min
      (ite
        (and
          (img@81@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@80@01 r)))
        $Perm.Write
        $Perm.No)
      (- (- $Perm.Write (pTaken@87@01 r)) (pTaken@88@01 r)))
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
          (img@69@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@68@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@87@01 r))
    $Perm.No)
  
  :qid |quant-u-39|))))
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
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@85@01 r))
      (img@86@01 r)
      (= r (Seq_index xs1@61@01 (inv@85@01 r))))
    (= (- $Perm.Write (pTaken@87@01 r)) $Perm.No))
  
  :qid |quant-u-40|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@90@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@69@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@68@01 r)))
    (=
      ($FVF.lookup_f (as sm@90@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@64@01)) r)))
  :pattern (($FVF.lookup_f (as sm@90@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@64@01)) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@75@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@74@01 r)))
    (=
      ($FVF.lookup_f (as sm@90@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@70@01)) r)))
  :pattern (($FVF.lookup_f (as sm@90@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@70@01)) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@81@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@80@01 r)))
    (=
      ($FVF.lookup_f (as sm@90@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@76@01)) r)))
  :pattern (($FVF.lookup_f (as sm@90@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@76@01)) r))
  :qid |qp.fvfValDef5|)))
(declare-const $t@91@01 $Snap)
(assert (= $t@91@01 ($Snap.combine ($Snap.first $t@91@01) ($Snap.second $t@91@01))))
(declare-const i@92@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (i in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(assert (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@92@01))
; [eval] xs[i]
(push) ; 4
(assert (not (>= i@92@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@92@01 (Seq_length xs1@61@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@93@01 ($Ref) Int)
(declare-fun img@94@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@92@01 Int) (i2@92@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i1@92@01)
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i2@92@01)
      (= (Seq_index xs1@61@01 i1@92@01) (Seq_index xs1@61@01 i2@92@01)))
    (= i1@92@01 i2@92@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@92@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@92@01)
    (and
      (= (inv@93@01 (Seq_index xs1@61@01 i@92@01)) i@92@01)
      (img@94@01 (Seq_index xs1@61@01 i@92@01))))
  :pattern ((Seq_index xs1@61@01 i@92@01))
  :qid |quant-u-42|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@94@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@93@01 r)))
    (= (Seq_index xs1@61@01 (inv@93@01 r)) r))
  :pattern ((inv@93@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@92@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@92@01)
    (not (= (Seq_index xs1@61@01 i@92@01) $Ref.null)))
  :pattern ((Seq_index xs1@61@01 i@92@01))
  :qid |f-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs1@61@01 i@92@01) (Seq_index xs2@62@01 i@73@01))
    (=
      (and
        (img@94@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@93@01 r)))
      (and
        (img@75@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@74@01 r)))))
  
  :qid |quant-u-43|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs1@61@01 i@92@01) (Seq_index xs3@63@01 i@79@01))
    (=
      (and
        (img@94@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@93@01 r)))
      (and
        (img@81@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@80@01 r)))))
  
  :qid |quant-u-44|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const i@95@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (i in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(assert (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@95@01))
; [eval] xs[i]
(push) ; 4
(assert (not (>= i@95@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@95@01 (Seq_length xs1@61@01))))
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
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@95@01 Int) (i2@95@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i1@95@01)
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i2@95@01)
      (= (Seq_index xs1@61@01 i1@95@01) (Seq_index xs1@61@01 i2@95@01)))
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
    (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@95@01)
    (and
      (= (inv@96@01 (Seq_index xs1@61@01 i@95@01)) i@95@01)
      (img@97@01 (Seq_index xs1@61@01 i@95@01))))
  :pattern ((Seq_index xs1@61@01 i@95@01))
  :qid |quant-u-46|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@97@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@96@01 r)))
    (= (Seq_index xs1@61@01 (inv@96@01 r)) r))
  :pattern ((inv@96@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@95@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@95@01)
    (not (= (Seq_index xs1@61@01 i@95@01) $Ref.null)))
  :pattern ((Seq_index xs1@61@01 i@95@01))
  :qid |f-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs1@61@01 i@95@01) (Seq_index xs1@61@01 i@92@01))
    (=
      (and
        (img@97@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@96@01 r)))
      (and
        (img@94@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@93@01 r)))))
  
  :qid |quant-u-47|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs1@61@01 i@95@01) (Seq_index xs2@62@01 i@73@01))
    (=
      (and
        (img@97@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@96@01 r)))
      (and
        (img@75@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@74@01 r)))))
  
  :qid |quant-u-48|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs1@61@01 i@95@01) (Seq_index xs3@63@01 i@79@01))
    (=
      (and
        (img@97@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@96@01 r)))
      (and
        (img@81@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@80@01 r)))))
  
  :qid |quant-u-49|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; split(xs2, 1 / 2, 1 / 4)
; [eval] p == 2 * q
; [eval] 2 * q
; [eval] p >= none
; [eval] (forall i: Int, j: Int :: { (i in [0..|xs|)), (j in [0..|xs|)) } { (i in [0..|xs|)), xs[j] } { (j in [0..|xs|)), xs[i] } { xs[i], xs[j] } (i in [0..|xs|)) && ((j in [0..|xs|)) && i != j) ==> xs[i] != xs[j])
(declare-const i@98@01 Int)
(declare-const j@99@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (i in [0..|xs|)) && ((j in [0..|xs|)) && i != j) ==> xs[i] != xs[j]
; [eval] (i in [0..|xs|)) && ((j in [0..|xs|)) && i != j)
; [eval] (i in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(push) ; 4
; [then-branch: 27 | !(i@98@01 in [0..|xs2@62@01|]) | live]
; [else-branch: 27 | i@98@01 in [0..|xs2@62@01|] | live]
(push) ; 5
; [then-branch: 27 | !(i@98@01 in [0..|xs2@62@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@98@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 27 | i@98@01 in [0..|xs2@62@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@98@01))
; [eval] (j in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(push) ; 6
; [then-branch: 28 | !(j@99@01 in [0..|xs2@62@01|]) | live]
; [else-branch: 28 | j@99@01 in [0..|xs2@62@01|] | live]
(push) ; 7
; [then-branch: 28 | !(j@99@01 in [0..|xs2@62@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@99@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 28 | j@99@01 in [0..|xs2@62@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@99@01))
; [eval] i != j
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@99@01)
  (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@99@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@98@01)
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@98@01)
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@99@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@99@01))))))
(assert (or
  (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@98@01)
  (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@98@01))))
(push) ; 4
; [then-branch: 29 | i@98@01 in [0..|xs2@62@01|] && j@99@01 in [0..|xs2@62@01|] && i@98@01 != j@99@01 | live]
; [else-branch: 29 | !(i@98@01 in [0..|xs2@62@01|] && j@99@01 in [0..|xs2@62@01|] && i@98@01 != j@99@01) | live]
(push) ; 5
; [then-branch: 29 | i@98@01 in [0..|xs2@62@01|] && j@99@01 in [0..|xs2@62@01|] && i@98@01 != j@99@01]
(assert (and
  (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@98@01)
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@99@01)
    (not (= i@98@01 j@99@01)))))
; [eval] xs[i] != xs[j]
; [eval] xs[i]
(push) ; 6
(assert (not (>= i@98@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@98@01 (Seq_length xs2@62@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] xs[j]
(push) ; 6
(assert (not (>= j@99@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< j@99@01 (Seq_length xs2@62@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 29 | !(i@98@01 in [0..|xs2@62@01|] && j@99@01 in [0..|xs2@62@01|] && i@98@01 != j@99@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@98@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@99@01)
      (not (= i@98@01 j@99@01))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@98@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@99@01)
      (not (= i@98@01 j@99@01))))
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@98@01)
    (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@99@01)
    (not (= i@98@01 j@99@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@98@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@99@01)
        (not (= i@98@01 j@99@01)))))
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@98@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@99@01)
      (not (= i@98@01 j@99@01))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@98@01 Int) (j@99@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@98@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@98@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@99@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@99@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@98@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@98@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@98@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@99@01)
          (not (= i@98@01 j@99@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@98@01)
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@99@01)
        (not (= i@98@01 j@99@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@98@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@99@01)
            (not (= i@98@01 j@99@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@98@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@99@01)
          (not (= i@98@01 j@99@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@98@01) (Seq_contains
    (Seq_range 0 (Seq_length xs2@62@01))
    j@99@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs2@62@01)) i@98@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs2@62@01))
    j@99@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@23@12@23@98-aux|)))
(assert (forall ((i@98@01 Int) (j@99@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@98@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@98@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@99@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@99@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@98@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@98@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@98@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@99@01)
          (not (= i@98@01 j@99@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@98@01)
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@99@01)
        (not (= i@98@01 j@99@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@98@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@99@01)
            (not (= i@98@01 j@99@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@98@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@99@01)
          (not (= i@98@01 j@99@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs2@62@01)) i@98@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs2@62@01))
    j@99@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@23@12@23@98-aux|)))
(assert (forall ((i@98@01 Int) (j@99@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@98@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@98@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@99@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@99@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@98@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@98@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@98@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@99@01)
          (not (= i@98@01 j@99@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@98@01)
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@99@01)
        (not (= i@98@01 j@99@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@98@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@99@01)
            (not (= i@98@01 j@99@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@98@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@99@01)
          (not (= i@98@01 j@99@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@98@01) (Seq_index
    xs2@62@01
    j@99@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs2@62@01)) i@98@01) (Seq_index
    xs2@62@01
    j@99@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@23@12@23@98-aux|)))
(assert (forall ((i@98@01 Int) (j@99@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@98@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@98@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@99@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@99@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@98@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@98@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@98@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@99@01)
          (not (= i@98@01 j@99@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@98@01)
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@99@01)
        (not (= i@98@01 j@99@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@98@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@99@01)
            (not (= i@98@01 j@99@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@98@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@99@01)
          (not (= i@98@01 j@99@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs2@62@01)) i@98@01) (Seq_index
    xs2@62@01
    j@99@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@23@12@23@98-aux|)))
(assert (forall ((i@98@01 Int) (j@99@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@98@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@98@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@99@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@99@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@98@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@98@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@98@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@99@01)
          (not (= i@98@01 j@99@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@98@01)
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@99@01)
        (not (= i@98@01 j@99@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@98@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@99@01)
            (not (= i@98@01 j@99@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@98@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@99@01)
          (not (= i@98@01 j@99@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@99@01) (Seq_index
    xs2@62@01
    i@98@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs2@62@01)) j@99@01) (Seq_index
    xs2@62@01
    i@98@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@23@12@23@98-aux|)))
(assert (forall ((i@98@01 Int) (j@99@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@98@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@98@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@99@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@99@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@98@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@98@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@98@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@99@01)
          (not (= i@98@01 j@99@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@98@01)
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@99@01)
        (not (= i@98@01 j@99@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@98@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@99@01)
            (not (= i@98@01 j@99@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@98@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@99@01)
          (not (= i@98@01 j@99@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs2@62@01)) j@99@01) (Seq_index
    xs2@62@01
    i@98@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@23@12@23@98-aux|)))
(assert (forall ((i@98@01 Int) (j@99@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@98@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@98@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@99@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@99@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@98@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@98@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@98@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@99@01)
          (not (= i@98@01 j@99@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@98@01)
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@99@01)
        (not (= i@98@01 j@99@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@98@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@99@01)
            (not (= i@98@01 j@99@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@98@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@99@01)
          (not (= i@98@01 j@99@01))))))
  :pattern ((Seq_index xs2@62@01 i@98@01) (Seq_index xs2@62@01 j@99@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@23@12@23@98-aux|)))
(push) ; 3
(assert (not (forall ((i@98@01 Int) (j@99@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@98@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@99@01)
        (not (= i@98@01 j@99@01))))
    (not (= (Seq_index xs2@62@01 i@98@01) (Seq_index xs2@62@01 j@99@01))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@98@01) (Seq_contains
    (Seq_range 0 (Seq_length xs2@62@01))
    j@99@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs2@62@01)) i@98@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs2@62@01))
    j@99@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs2@62@01)) i@98@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs2@62@01))
    j@99@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@98@01) (Seq_index
    xs2@62@01
    j@99@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs2@62@01)) i@98@01) (Seq_index
    xs2@62@01
    j@99@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs2@62@01)) i@98@01) (Seq_index
    xs2@62@01
    j@99@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@99@01) (Seq_index
    xs2@62@01
    i@98@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs2@62@01)) j@99@01) (Seq_index
    xs2@62@01
    i@98@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs2@62@01)) j@99@01) (Seq_index
    xs2@62@01
    i@98@01))
  :pattern ((Seq_index xs2@62@01 i@98@01) (Seq_index xs2@62@01 j@99@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@23@12@23@98|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@98@01 Int) (j@99@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@98@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@99@01)
        (not (= i@98@01 j@99@01))))
    (not (= (Seq_index xs2@62@01 i@98@01) (Seq_index xs2@62@01 j@99@01))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@98@01) (Seq_contains
    (Seq_range 0 (Seq_length xs2@62@01))
    j@99@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs2@62@01)) i@98@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs2@62@01))
    j@99@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@98@01) (Seq_index
    xs2@62@01
    j@99@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs2@62@01)) i@98@01) (Seq_index
    xs2@62@01
    j@99@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@99@01) (Seq_index
    xs2@62@01
    i@98@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs2@62@01)) j@99@01) (Seq_index
    xs2@62@01
    i@98@01))
  :pattern ((Seq_index xs2@62@01 i@98@01) (Seq_index xs2@62@01 j@99@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@23@12@23@98|)))
(declare-const i@100@01 Int)
(push) ; 3
; [eval] (i in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(assert (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@100@01))
; [eval] xs[i]
(push) ; 4
(assert (not (>= i@100@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@100@01 (Seq_length xs2@62@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@101@01 ($Ref) Int)
(declare-fun img@102@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@100@01 Int) (i2@100@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i1@100@01)
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i2@100@01)
      (= (Seq_index xs2@62@01 i1@100@01) (Seq_index xs2@62@01 i2@100@01)))
    (= i1@100@01 i2@100@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@100@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@100@01)
    (and
      (= (inv@101@01 (Seq_index xs2@62@01 i@100@01)) i@100@01)
      (img@102@01 (Seq_index xs2@62@01 i@100@01))))
  :pattern ((Seq_index xs2@62@01 i@100@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@102@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@101@01 r)))
    (= (Seq_index xs2@62@01 (inv@101@01 r)) r))
  :pattern ((inv@101@01 r))
  :qid |f-fctOfInv|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((i@100@01 Int)) (!
  (= (Seq_index xs2@62@01 i@100@01) (Seq_index xs3@63@01 i@100@01))
  
  :qid |quant-u-51|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((i@100@01 Int)) (!
  (= (Seq_index xs2@62@01 i@100@01) (Seq_index xs1@61@01 i@100@01))
  
  :qid |quant-u-52|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((i@100@01 Int)) (!
  (= (Seq_index xs2@62@01 i@100@01) (Seq_index xs1@61@01 i@100@01))
  
  :qid |quant-u-53|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@103@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@101@01 r))
      (img@102@01 r)
      (= r (Seq_index xs2@62@01 (inv@101@01 r))))
    ($Perm.min
      (ite
        (and
          (img@75@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@74@01 r)))
        $Perm.Write
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
(define-fun pTaken@104@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@101@01 r))
      (img@102@01 r)
      (= r (Seq_index xs2@62@01 (inv@101@01 r))))
    ($Perm.min
      (ite
        (and
          (img@81@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@80@01 r)))
        $Perm.Write
        $Perm.No)
      (- (/ (to_real 1) (to_real 2)) (pTaken@103@01 r)))
    $Perm.No))
(define-fun pTaken@105@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@101@01 r))
      (img@102@01 r)
      (= r (Seq_index xs2@62@01 (inv@101@01 r))))
    ($Perm.min
      (ite
        (and
          (img@94@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@93@01 r)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (- (- (/ (to_real 1) (to_real 2)) (pTaken@103@01 r)) (pTaken@104@01 r)))
    $Perm.No))
(define-fun pTaken@106@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@101@01 r))
      (img@102@01 r)
      (= r (Seq_index xs2@62@01 (inv@101@01 r))))
    ($Perm.min
      (ite
        (and
          (img@97@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@96@01 r)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (-
        (- (- (/ (to_real 1) (to_real 2)) (pTaken@103@01 r)) (pTaken@104@01 r))
        (pTaken@105@01 r)))
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
          (img@75@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@74@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@103@01 r))
    $Perm.No)
  
  :qid |quant-u-55|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@103@01 r) $Perm.No)
  
  :qid |quant-u-56|))))
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
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@101@01 r))
      (img@102@01 r)
      (= r (Seq_index xs2@62@01 (inv@101@01 r))))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@103@01 r)) $Perm.No))
  
  :qid |quant-u-57|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@107@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@81@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@80@01 r)))
    (=
      ($FVF.lookup_f (as sm@107@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@76@01)) r)))
  :pattern (($FVF.lookup_f (as sm@107@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@76@01)) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@75@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@74@01 r)))
    (=
      ($FVF.lookup_f (as sm@107@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@70@01)) r)))
  :pattern (($FVF.lookup_f (as sm@107@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@70@01)) r))
  :qid |qp.fvfValDef7|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@94@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@93@01 r)))
    (=
      ($FVF.lookup_f (as sm@107@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@91@01)) r)))
  :pattern (($FVF.lookup_f (as sm@107@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@91@01)) r))
  :qid |qp.fvfValDef8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@97@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@96@01 r)))
    (=
      ($FVF.lookup_f (as sm@107@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@91@01)) r)))
  :pattern (($FVF.lookup_f (as sm@107@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@91@01)) r))
  :qid |qp.fvfValDef9|)))
(declare-const $t@108@01 $Snap)
(assert (= $t@108@01 ($Snap.combine ($Snap.first $t@108@01) ($Snap.second $t@108@01))))
(declare-const i@109@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (i in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(assert (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@109@01))
; [eval] xs[i]
(push) ; 4
(assert (not (>= i@109@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@109@01 (Seq_length xs2@62@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@110@01 ($Ref) Int)
(declare-fun img@111@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@109@01 Int) (i2@109@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i1@109@01)
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i2@109@01)
      (= (Seq_index xs2@62@01 i1@109@01) (Seq_index xs2@62@01 i2@109@01)))
    (= i1@109@01 i2@109@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@109@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@109@01)
    (and
      (= (inv@110@01 (Seq_index xs2@62@01 i@109@01)) i@109@01)
      (img@111@01 (Seq_index xs2@62@01 i@109@01))))
  :pattern ((Seq_index xs2@62@01 i@109@01))
  :qid |quant-u-59|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@111@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@110@01 r)))
    (= (Seq_index xs2@62@01 (inv@110@01 r)) r))
  :pattern ((inv@110@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@109@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@109@01)
    (not (= (Seq_index xs2@62@01 i@109@01) $Ref.null)))
  :pattern ((Seq_index xs2@62@01 i@109@01))
  :qid |f-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs2@62@01 i@109@01) (Seq_index xs2@62@01 i@73@01))
    (=
      (and
        (img@111@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@110@01 r)))
      (and
        (img@75@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@74@01 r)))))
  
  :qid |quant-u-60|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs2@62@01 i@109@01) (Seq_index xs3@63@01 i@79@01))
    (=
      (and
        (img@111@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@110@01 r)))
      (and
        (img@81@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@80@01 r)))))
  
  :qid |quant-u-61|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs2@62@01 i@109@01) (Seq_index xs1@61@01 i@92@01))
    (=
      (and
        (img@111@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@110@01 r)))
      (and
        (img@94@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@93@01 r)))))
  
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
  (and
    (= (Seq_index xs2@62@01 i@109@01) (Seq_index xs1@61@01 i@95@01))
    (=
      (and
        (img@111@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@110@01 r)))
      (and
        (img@97@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@96@01 r)))))
  
  :qid |quant-u-63|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const i@112@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (i in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(assert (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@112@01))
; [eval] xs[i]
(push) ; 4
(assert (not (>= i@112@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@112@01 (Seq_length xs2@62@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@113@01 ($Ref) Int)
(declare-fun img@114@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@112@01 Int) (i2@112@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i1@112@01)
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i2@112@01)
      (= (Seq_index xs2@62@01 i1@112@01) (Seq_index xs2@62@01 i2@112@01)))
    (= i1@112@01 i2@112@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,07s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@112@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@112@01)
    (and
      (= (inv@113@01 (Seq_index xs2@62@01 i@112@01)) i@112@01)
      (img@114@01 (Seq_index xs2@62@01 i@112@01))))
  :pattern ((Seq_index xs2@62@01 i@112@01))
  :qid |quant-u-65|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@114@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@113@01 r)))
    (= (Seq_index xs2@62@01 (inv@113@01 r)) r))
  :pattern ((inv@113@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@112@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@112@01)
    (not (= (Seq_index xs2@62@01 i@112@01) $Ref.null)))
  :pattern ((Seq_index xs2@62@01 i@112@01))
  :qid |f-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs2@62@01 i@112@01) (Seq_index xs2@62@01 i@109@01))
    (=
      (and
        (img@114@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@113@01 r)))
      (and
        (img@111@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@110@01 r)))))
  
  :qid |quant-u-66|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs2@62@01 i@112@01) (Seq_index xs2@62@01 i@73@01))
    (=
      (and
        (img@114@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@113@01 r)))
      (and
        (img@75@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@74@01 r)))))
  
  :qid |quant-u-67|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs2@62@01 i@112@01) (Seq_index xs3@63@01 i@79@01))
    (=
      (and
        (img@114@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@113@01 r)))
      (and
        (img@81@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@80@01 r)))))
  
  :qid |quant-u-68|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs2@62@01 i@112@01) (Seq_index xs1@61@01 i@92@01))
    (=
      (and
        (img@114@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@113@01 r)))
      (and
        (img@94@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@93@01 r)))))
  
  :qid |quant-u-69|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs2@62@01 i@112@01) (Seq_index xs1@61@01 i@95@01))
    (=
      (and
        (img@114@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@113@01 r)))
      (and
        (img@97@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@96@01 r)))))
  
  :qid |quant-u-70|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; split(xs3, write, 1 / 2)
; [eval] p == 2 * q
; [eval] 2 * q
; [eval] p >= none
; [eval] (forall i: Int, j: Int :: { (i in [0..|xs|)), (j in [0..|xs|)) } { (i in [0..|xs|)), xs[j] } { (j in [0..|xs|)), xs[i] } { xs[i], xs[j] } (i in [0..|xs|)) && ((j in [0..|xs|)) && i != j) ==> xs[i] != xs[j])
(declare-const i@115@01 Int)
(declare-const j@116@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (i in [0..|xs|)) && ((j in [0..|xs|)) && i != j) ==> xs[i] != xs[j]
; [eval] (i in [0..|xs|)) && ((j in [0..|xs|)) && i != j)
; [eval] (i in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(push) ; 4
; [then-branch: 30 | !(i@115@01 in [0..|xs3@63@01|]) | live]
; [else-branch: 30 | i@115@01 in [0..|xs3@63@01|] | live]
(push) ; 5
; [then-branch: 30 | !(i@115@01 in [0..|xs3@63@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@115@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 30 | i@115@01 in [0..|xs3@63@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@115@01))
; [eval] (j in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(push) ; 6
; [then-branch: 31 | !(j@116@01 in [0..|xs3@63@01|]) | live]
; [else-branch: 31 | j@116@01 in [0..|xs3@63@01|] | live]
(push) ; 7
; [then-branch: 31 | !(j@116@01 in [0..|xs3@63@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@116@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 31 | j@116@01 in [0..|xs3@63@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@116@01))
; [eval] i != j
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@116@01)
  (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@116@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@115@01)
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@115@01)
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@116@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@116@01))))))
(assert (or
  (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@115@01)
  (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@115@01))))
(push) ; 4
; [then-branch: 32 | i@115@01 in [0..|xs3@63@01|] && j@116@01 in [0..|xs3@63@01|] && i@115@01 != j@116@01 | live]
; [else-branch: 32 | !(i@115@01 in [0..|xs3@63@01|] && j@116@01 in [0..|xs3@63@01|] && i@115@01 != j@116@01) | live]
(push) ; 5
; [then-branch: 32 | i@115@01 in [0..|xs3@63@01|] && j@116@01 in [0..|xs3@63@01|] && i@115@01 != j@116@01]
(assert (and
  (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@115@01)
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@116@01)
    (not (= i@115@01 j@116@01)))))
; [eval] xs[i] != xs[j]
; [eval] xs[i]
(push) ; 6
(assert (not (>= i@115@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@115@01 (Seq_length xs3@63@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] xs[j]
(push) ; 6
(assert (not (>= j@116@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< j@116@01 (Seq_length xs3@63@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 32 | !(i@115@01 in [0..|xs3@63@01|] && j@116@01 in [0..|xs3@63@01|] && i@115@01 != j@116@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@115@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@116@01)
      (not (= i@115@01 j@116@01))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@115@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@116@01)
      (not (= i@115@01 j@116@01))))
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@115@01)
    (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@116@01)
    (not (= i@115@01 j@116@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@115@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@116@01)
        (not (= i@115@01 j@116@01)))))
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@115@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@116@01)
      (not (= i@115@01 j@116@01))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@115@01 Int) (j@116@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@115@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@115@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@116@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@116@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@115@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@115@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@115@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@116@01)
          (not (= i@115@01 j@116@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@115@01)
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@116@01)
        (not (= i@115@01 j@116@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@115@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@116@01)
            (not (= i@115@01 j@116@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@115@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@116@01)
          (not (= i@115@01 j@116@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@115@01) (Seq_contains
    (Seq_range 0 (Seq_length xs3@63@01))
    j@116@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs3@63@01)) i@115@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs3@63@01))
    j@116@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@23@12@23@98-aux|)))
(assert (forall ((i@115@01 Int) (j@116@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@115@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@115@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@116@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@116@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@115@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@115@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@115@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@116@01)
          (not (= i@115@01 j@116@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@115@01)
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@116@01)
        (not (= i@115@01 j@116@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@115@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@116@01)
            (not (= i@115@01 j@116@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@115@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@116@01)
          (not (= i@115@01 j@116@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs3@63@01)) i@115@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs3@63@01))
    j@116@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@23@12@23@98-aux|)))
(assert (forall ((i@115@01 Int) (j@116@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@115@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@115@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@116@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@116@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@115@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@115@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@115@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@116@01)
          (not (= i@115@01 j@116@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@115@01)
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@116@01)
        (not (= i@115@01 j@116@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@115@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@116@01)
            (not (= i@115@01 j@116@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@115@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@116@01)
          (not (= i@115@01 j@116@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@115@01) (Seq_index
    xs3@63@01
    j@116@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs3@63@01)) i@115@01) (Seq_index
    xs3@63@01
    j@116@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@23@12@23@98-aux|)))
(assert (forall ((i@115@01 Int) (j@116@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@115@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@115@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@116@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@116@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@115@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@115@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@115@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@116@01)
          (not (= i@115@01 j@116@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@115@01)
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@116@01)
        (not (= i@115@01 j@116@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@115@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@116@01)
            (not (= i@115@01 j@116@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@115@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@116@01)
          (not (= i@115@01 j@116@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs3@63@01)) i@115@01) (Seq_index
    xs3@63@01
    j@116@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@23@12@23@98-aux|)))
(assert (forall ((i@115@01 Int) (j@116@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@115@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@115@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@116@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@116@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@115@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@115@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@115@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@116@01)
          (not (= i@115@01 j@116@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@115@01)
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@116@01)
        (not (= i@115@01 j@116@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@115@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@116@01)
            (not (= i@115@01 j@116@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@115@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@116@01)
          (not (= i@115@01 j@116@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@116@01) (Seq_index
    xs3@63@01
    i@115@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs3@63@01)) j@116@01) (Seq_index
    xs3@63@01
    i@115@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@23@12@23@98-aux|)))
(assert (forall ((i@115@01 Int) (j@116@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@115@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@115@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@116@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@116@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@115@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@115@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@115@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@116@01)
          (not (= i@115@01 j@116@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@115@01)
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@116@01)
        (not (= i@115@01 j@116@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@115@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@116@01)
            (not (= i@115@01 j@116@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@115@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@116@01)
          (not (= i@115@01 j@116@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs3@63@01)) j@116@01) (Seq_index
    xs3@63@01
    i@115@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@23@12@23@98-aux|)))
(assert (forall ((i@115@01 Int) (j@116@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@115@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@115@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@116@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@116@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@115@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@115@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@115@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@116@01)
          (not (= i@115@01 j@116@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@115@01)
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@116@01)
        (not (= i@115@01 j@116@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@115@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@116@01)
            (not (= i@115@01 j@116@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@115@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@116@01)
          (not (= i@115@01 j@116@01))))))
  :pattern ((Seq_index xs3@63@01 i@115@01) (Seq_index xs3@63@01 j@116@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@23@12@23@98-aux|)))
(push) ; 3
(assert (not (forall ((i@115@01 Int) (j@116@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@115@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@116@01)
        (not (= i@115@01 j@116@01))))
    (not (= (Seq_index xs3@63@01 i@115@01) (Seq_index xs3@63@01 j@116@01))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@115@01) (Seq_contains
    (Seq_range 0 (Seq_length xs3@63@01))
    j@116@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs3@63@01)) i@115@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs3@63@01))
    j@116@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs3@63@01)) i@115@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs3@63@01))
    j@116@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@115@01) (Seq_index
    xs3@63@01
    j@116@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs3@63@01)) i@115@01) (Seq_index
    xs3@63@01
    j@116@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs3@63@01)) i@115@01) (Seq_index
    xs3@63@01
    j@116@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@116@01) (Seq_index
    xs3@63@01
    i@115@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs3@63@01)) j@116@01) (Seq_index
    xs3@63@01
    i@115@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs3@63@01)) j@116@01) (Seq_index
    xs3@63@01
    i@115@01))
  :pattern ((Seq_index xs3@63@01 i@115@01) (Seq_index xs3@63@01 j@116@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@23@12@23@98|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@115@01 Int) (j@116@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@115@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@116@01)
        (not (= i@115@01 j@116@01))))
    (not (= (Seq_index xs3@63@01 i@115@01) (Seq_index xs3@63@01 j@116@01))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@115@01) (Seq_contains
    (Seq_range 0 (Seq_length xs3@63@01))
    j@116@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs3@63@01)) i@115@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs3@63@01))
    j@116@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@115@01) (Seq_index
    xs3@63@01
    j@116@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs3@63@01)) i@115@01) (Seq_index
    xs3@63@01
    j@116@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@116@01) (Seq_index
    xs3@63@01
    i@115@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs3@63@01)) j@116@01) (Seq_index
    xs3@63@01
    i@115@01))
  :pattern ((Seq_index xs3@63@01 i@115@01) (Seq_index xs3@63@01 j@116@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@23@12@23@98|)))
(declare-const i@117@01 Int)
(push) ; 3
; [eval] (i in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(assert (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@117@01))
; [eval] xs[i]
(push) ; 4
(assert (not (>= i@117@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@117@01 (Seq_length xs3@63@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@118@01 ($Ref) Int)
(declare-fun img@119@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@117@01 Int) (i2@117@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i1@117@01)
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i2@117@01)
      (= (Seq_index xs3@63@01 i1@117@01) (Seq_index xs3@63@01 i2@117@01)))
    (= i1@117@01 i2@117@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@117@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@117@01)
    (and
      (= (inv@118@01 (Seq_index xs3@63@01 i@117@01)) i@117@01)
      (img@119@01 (Seq_index xs3@63@01 i@117@01))))
  :pattern ((Seq_index xs3@63@01 i@117@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@119@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@118@01 r)))
    (= (Seq_index xs3@63@01 (inv@118@01 r)) r))
  :pattern ((inv@118@01 r))
  :qid |f-fctOfInv|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((i@117@01 Int)) (!
  (= (Seq_index xs3@63@01 i@117@01) (Seq_index xs1@61@01 i@117@01))
  
  :qid |quant-u-72|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((i@117@01 Int)) (!
  (= (Seq_index xs3@63@01 i@117@01) (Seq_index xs1@61@01 i@117@01))
  
  :qid |quant-u-73|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((i@117@01 Int)) (!
  (= (Seq_index xs3@63@01 i@117@01) (Seq_index xs2@62@01 i@117@01))
  
  :qid |quant-u-74|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((i@117@01 Int)) (!
  (= (Seq_index xs3@63@01 i@117@01) (Seq_index xs2@62@01 i@117@01))
  
  :qid |quant-u-75|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((i@117@01 Int)) (!
  (= (Seq_index xs3@63@01 i@117@01) (Seq_index xs2@62@01 i@117@01))
  
  :qid |quant-u-76|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@120@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@118@01 r))
      (img@119@01 r)
      (= r (Seq_index xs3@63@01 (inv@118@01 r))))
    ($Perm.min
      (ite
        (and
          (img@81@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@80@01 r)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@121@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@118@01 r))
      (img@119@01 r)
      (= r (Seq_index xs3@63@01 (inv@118@01 r))))
    ($Perm.min
      (ite
        (and
          (img@97@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@96@01 r)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (- $Perm.Write (pTaken@120@01 r)))
    $Perm.No))
(define-fun pTaken@122@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@118@01 r))
      (img@119@01 r)
      (= r (Seq_index xs3@63@01 (inv@118@01 r))))
    ($Perm.min
      (ite
        (and
          (img@94@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@93@01 r)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (- (- $Perm.Write (pTaken@120@01 r)) (pTaken@121@01 r)))
    $Perm.No))
(define-fun pTaken@123@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@118@01 r))
      (img@119@01 r)
      (= r (Seq_index xs3@63@01 (inv@118@01 r))))
    ($Perm.min
      (ite
        (and
          (img@75@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@74@01 r)))
        (- $Perm.Write (pTaken@103@01 r))
        $Perm.No)
      (-
        (- (- $Perm.Write (pTaken@120@01 r)) (pTaken@121@01 r))
        (pTaken@122@01 r)))
    $Perm.No))
(define-fun pTaken@124@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@118@01 r))
      (img@119@01 r)
      (= r (Seq_index xs3@63@01 (inv@118@01 r))))
    ($Perm.min
      (ite
        (and
          (img@111@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@110@01 r)))
        (/ (to_real 1) (to_real 4))
        $Perm.No)
      (-
        (-
          (- (- $Perm.Write (pTaken@120@01 r)) (pTaken@121@01 r))
          (pTaken@122@01 r))
        (pTaken@123@01 r)))
    $Perm.No))
(define-fun pTaken@125@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@118@01 r))
      (img@119@01 r)
      (= r (Seq_index xs3@63@01 (inv@118@01 r))))
    ($Perm.min
      (ite
        (and
          (img@114@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@113@01 r)))
        (/ (to_real 1) (to_real 4))
        $Perm.No)
      (-
        (-
          (-
            (- (- $Perm.Write (pTaken@120@01 r)) (pTaken@121@01 r))
            (pTaken@122@01 r))
          (pTaken@123@01 r))
        (pTaken@124@01 r)))
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
          (img@81@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@80@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@120@01 r))
    $Perm.No)
  
  :qid |quant-u-78|))))
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
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@118@01 r))
      (img@119@01 r)
      (= r (Seq_index xs3@63@01 (inv@118@01 r))))
    (= (- $Perm.Write (pTaken@120@01 r)) $Perm.No))
  
  :qid |quant-u-79|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@126@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@97@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@96@01 r)))
    (=
      ($FVF.lookup_f (as sm@126@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@91@01)) r)))
  :pattern (($FVF.lookup_f (as sm@126@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@91@01)) r))
  :qid |qp.fvfValDef10|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@94@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@93@01 r)))
    (=
      ($FVF.lookup_f (as sm@126@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@91@01)) r)))
  :pattern (($FVF.lookup_f (as sm@126@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@91@01)) r))
  :qid |qp.fvfValDef11|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@81@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@80@01 r)))
    (=
      ($FVF.lookup_f (as sm@126@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@76@01)) r)))
  :pattern (($FVF.lookup_f (as sm@126@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@76@01)) r))
  :qid |qp.fvfValDef12|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@75@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@74@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@103@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@126@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@70@01)) r)))
  :pattern (($FVF.lookup_f (as sm@126@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@70@01)) r))
  :qid |qp.fvfValDef13|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@111@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@110@01 r)))
    (=
      ($FVF.lookup_f (as sm@126@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@108@01)) r)))
  :pattern (($FVF.lookup_f (as sm@126@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@108@01)) r))
  :qid |qp.fvfValDef14|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@114@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@113@01 r)))
    (=
      ($FVF.lookup_f (as sm@126@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@108@01)) r)))
  :pattern (($FVF.lookup_f (as sm@126@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@108@01)) r))
  :qid |qp.fvfValDef15|)))
(declare-const $t@127@01 $Snap)
(assert (= $t@127@01 ($Snap.combine ($Snap.first $t@127@01) ($Snap.second $t@127@01))))
(declare-const i@128@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (i in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(assert (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@128@01))
; [eval] xs[i]
(push) ; 4
(assert (not (>= i@128@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@128@01 (Seq_length xs3@63@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@129@01 ($Ref) Int)
(declare-fun img@130@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@128@01 Int) (i2@128@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i1@128@01)
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i2@128@01)
      (= (Seq_index xs3@63@01 i1@128@01) (Seq_index xs3@63@01 i2@128@01)))
    (= i1@128@01 i2@128@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@128@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@128@01)
    (and
      (= (inv@129@01 (Seq_index xs3@63@01 i@128@01)) i@128@01)
      (img@130@01 (Seq_index xs3@63@01 i@128@01))))
  :pattern ((Seq_index xs3@63@01 i@128@01))
  :qid |quant-u-81|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@130@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@129@01 r)))
    (= (Seq_index xs3@63@01 (inv@129@01 r)) r))
  :pattern ((inv@129@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@128@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@128@01)
    (not (= (Seq_index xs3@63@01 i@128@01) $Ref.null)))
  :pattern ((Seq_index xs3@63@01 i@128@01))
  :qid |f-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs3@63@01 i@128@01) (Seq_index xs1@61@01 i@95@01))
    (=
      (and
        (img@130@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@129@01 r)))
      (and
        (img@97@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@96@01 r)))))
  
  :qid |quant-u-82|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs3@63@01 i@128@01) (Seq_index xs1@61@01 i@92@01))
    (=
      (and
        (img@130@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@129@01 r)))
      (and
        (img@94@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@93@01 r)))))
  
  :qid |quant-u-83|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs3@63@01 i@128@01) (Seq_index xs2@62@01 i@73@01))
    (=
      (and
        (img@130@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@129@01 r)))
      (and
        (img@75@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@74@01 r)))))
  
  :qid |quant-u-84|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs3@63@01 i@128@01) (Seq_index xs2@62@01 i@109@01))
    (=
      (and
        (img@130@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@129@01 r)))
      (and
        (img@111@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@110@01 r)))))
  
  :qid |quant-u-85|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs3@63@01 i@128@01) (Seq_index xs2@62@01 i@112@01))
    (=
      (and
        (img@130@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@129@01 r)))
      (and
        (img@114@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@113@01 r)))))
  
  :qid |quant-u-86|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const i@131@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (i in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(assert (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@131@01))
; [eval] xs[i]
(push) ; 4
(assert (not (>= i@131@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@131@01 (Seq_length xs3@63@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@132@01 ($Ref) Int)
(declare-fun img@133@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@131@01 Int) (i2@131@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i1@131@01)
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i2@131@01)
      (= (Seq_index xs3@63@01 i1@131@01) (Seq_index xs3@63@01 i2@131@01)))
    (= i1@131@01 i2@131@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@131@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@131@01)
    (and
      (= (inv@132@01 (Seq_index xs3@63@01 i@131@01)) i@131@01)
      (img@133@01 (Seq_index xs3@63@01 i@131@01))))
  :pattern ((Seq_index xs3@63@01 i@131@01))
  :qid |quant-u-88|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@133@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@132@01 r)))
    (= (Seq_index xs3@63@01 (inv@132@01 r)) r))
  :pattern ((inv@132@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@131@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@131@01)
    (not (= (Seq_index xs3@63@01 i@131@01) $Ref.null)))
  :pattern ((Seq_index xs3@63@01 i@131@01))
  :qid |f-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs3@63@01 i@131@01) (Seq_index xs3@63@01 i@128@01))
    (=
      (and
        (img@133@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@132@01 r)))
      (and
        (img@130@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@129@01 r)))))
  
  :qid |quant-u-89|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs3@63@01 i@131@01) (Seq_index xs1@61@01 i@95@01))
    (=
      (and
        (img@133@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@132@01 r)))
      (and
        (img@97@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@96@01 r)))))
  
  :qid |quant-u-90|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs3@63@01 i@131@01) (Seq_index xs1@61@01 i@92@01))
    (=
      (and
        (img@133@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@132@01 r)))
      (and
        (img@94@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@93@01 r)))))
  
  :qid |quant-u-91|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs3@63@01 i@131@01) (Seq_index xs2@62@01 i@73@01))
    (=
      (and
        (img@133@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@132@01 r)))
      (and
        (img@75@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@74@01 r)))))
  
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
  (and
    (= (Seq_index xs3@63@01 i@131@01) (Seq_index xs2@62@01 i@109@01))
    (=
      (and
        (img@133@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@132@01 r)))
      (and
        (img@111@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@110@01 r)))))
  
  :qid |quant-u-93|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs3@63@01 i@131@01) (Seq_index xs2@62@01 i@112@01))
    (=
      (and
        (img@133@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@132@01 r)))
      (and
        (img@114@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@113@01 r)))))
  
  :qid |quant-u-94|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; leak(xs1, 1 / 2)
; [eval] p >= none
; [eval] (forall i: Int, j: Int :: { (i in [0..|xs|)), (j in [0..|xs|)) } { (i in [0..|xs|)), xs[j] } { (j in [0..|xs|)), xs[i] } { xs[i], xs[j] } (i in [0..|xs|)) && ((j in [0..|xs|)) && i != j) ==> xs[i] != xs[j])
(declare-const i@134@01 Int)
(declare-const j@135@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (i in [0..|xs|)) && ((j in [0..|xs|)) && i != j) ==> xs[i] != xs[j]
; [eval] (i in [0..|xs|)) && ((j in [0..|xs|)) && i != j)
; [eval] (i in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(push) ; 4
; [then-branch: 33 | !(i@134@01 in [0..|xs1@61@01|]) | live]
; [else-branch: 33 | i@134@01 in [0..|xs1@61@01|] | live]
(push) ; 5
; [then-branch: 33 | !(i@134@01 in [0..|xs1@61@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@134@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 33 | i@134@01 in [0..|xs1@61@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@134@01))
; [eval] (j in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(push) ; 6
; [then-branch: 34 | !(j@135@01 in [0..|xs1@61@01|]) | live]
; [else-branch: 34 | j@135@01 in [0..|xs1@61@01|] | live]
(push) ; 7
; [then-branch: 34 | !(j@135@01 in [0..|xs1@61@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@135@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 34 | j@135@01 in [0..|xs1@61@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@135@01))
; [eval] i != j
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@135@01)
  (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@135@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@134@01)
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@134@01)
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@135@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@135@01))))))
(assert (or
  (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@134@01)
  (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@134@01))))
(push) ; 4
; [then-branch: 35 | i@134@01 in [0..|xs1@61@01|] && j@135@01 in [0..|xs1@61@01|] && i@134@01 != j@135@01 | live]
; [else-branch: 35 | !(i@134@01 in [0..|xs1@61@01|] && j@135@01 in [0..|xs1@61@01|] && i@134@01 != j@135@01) | live]
(push) ; 5
; [then-branch: 35 | i@134@01 in [0..|xs1@61@01|] && j@135@01 in [0..|xs1@61@01|] && i@134@01 != j@135@01]
(assert (and
  (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@134@01)
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@135@01)
    (not (= i@134@01 j@135@01)))))
; [eval] xs[i] != xs[j]
; [eval] xs[i]
(push) ; 6
(assert (not (>= i@134@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@134@01 (Seq_length xs1@61@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] xs[j]
(push) ; 6
(assert (not (>= j@135@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< j@135@01 (Seq_length xs1@61@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 35 | !(i@134@01 in [0..|xs1@61@01|] && j@135@01 in [0..|xs1@61@01|] && i@134@01 != j@135@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@134@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@135@01)
      (not (= i@134@01 j@135@01))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@134@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@135@01)
      (not (= i@134@01 j@135@01))))
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@134@01)
    (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@135@01)
    (not (= i@134@01 j@135@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@134@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@135@01)
        (not (= i@134@01 j@135@01)))))
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@134@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@135@01)
      (not (= i@134@01 j@135@01))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@134@01 Int) (j@135@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@134@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@134@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@135@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@135@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@134@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@134@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@134@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@135@01)
          (not (= i@134@01 j@135@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@134@01)
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@135@01)
        (not (= i@134@01 j@135@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@134@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@135@01)
            (not (= i@134@01 j@135@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@134@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@135@01)
          (not (= i@134@01 j@135@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@134@01) (Seq_contains
    (Seq_range 0 (Seq_length xs1@61@01))
    j@135@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) i@134@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs1@61@01))
    j@135@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@16@12@16@98-aux|)))
(assert (forall ((i@134@01 Int) (j@135@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@134@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@134@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@135@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@135@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@134@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@134@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@134@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@135@01)
          (not (= i@134@01 j@135@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@134@01)
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@135@01)
        (not (= i@134@01 j@135@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@134@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@135@01)
            (not (= i@134@01 j@135@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@134@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@135@01)
          (not (= i@134@01 j@135@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) i@134@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs1@61@01))
    j@135@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@16@12@16@98-aux|)))
(assert (forall ((i@134@01 Int) (j@135@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@134@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@134@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@135@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@135@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@134@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@134@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@134@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@135@01)
          (not (= i@134@01 j@135@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@134@01)
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@135@01)
        (not (= i@134@01 j@135@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@134@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@135@01)
            (not (= i@134@01 j@135@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@134@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@135@01)
          (not (= i@134@01 j@135@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@134@01) (Seq_index
    xs1@61@01
    j@135@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) i@134@01) (Seq_index
    xs1@61@01
    j@135@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@16@12@16@98-aux|)))
(assert (forall ((i@134@01 Int) (j@135@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@134@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@134@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@135@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@135@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@134@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@134@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@134@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@135@01)
          (not (= i@134@01 j@135@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@134@01)
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@135@01)
        (not (= i@134@01 j@135@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@134@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@135@01)
            (not (= i@134@01 j@135@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@134@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@135@01)
          (not (= i@134@01 j@135@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) i@134@01) (Seq_index
    xs1@61@01
    j@135@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@16@12@16@98-aux|)))
(assert (forall ((i@134@01 Int) (j@135@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@134@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@134@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@135@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@135@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@134@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@134@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@134@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@135@01)
          (not (= i@134@01 j@135@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@134@01)
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@135@01)
        (not (= i@134@01 j@135@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@134@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@135@01)
            (not (= i@134@01 j@135@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@134@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@135@01)
          (not (= i@134@01 j@135@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@135@01) (Seq_index
    xs1@61@01
    i@134@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) j@135@01) (Seq_index
    xs1@61@01
    i@134@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@16@12@16@98-aux|)))
(assert (forall ((i@134@01 Int) (j@135@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@134@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@134@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@135@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@135@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@134@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@134@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@134@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@135@01)
          (not (= i@134@01 j@135@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@134@01)
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@135@01)
        (not (= i@134@01 j@135@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@134@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@135@01)
            (not (= i@134@01 j@135@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@134@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@135@01)
          (not (= i@134@01 j@135@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) j@135@01) (Seq_index
    xs1@61@01
    i@134@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@16@12@16@98-aux|)))
(assert (forall ((i@134@01 Int) (j@135@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@134@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@134@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@135@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@135@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@134@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@134@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@134@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@135@01)
          (not (= i@134@01 j@135@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@134@01)
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@135@01)
        (not (= i@134@01 j@135@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@134@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@135@01)
            (not (= i@134@01 j@135@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@134@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@135@01)
          (not (= i@134@01 j@135@01))))))
  :pattern ((Seq_index xs1@61@01 i@134@01) (Seq_index xs1@61@01 j@135@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@16@12@16@98-aux|)))
(push) ; 3
(assert (not (forall ((i@134@01 Int) (j@135@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@134@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@135@01)
        (not (= i@134@01 j@135@01))))
    (not (= (Seq_index xs1@61@01 i@134@01) (Seq_index xs1@61@01 j@135@01))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@134@01) (Seq_contains
    (Seq_range 0 (Seq_length xs1@61@01))
    j@135@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) i@134@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs1@61@01))
    j@135@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) i@134@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs1@61@01))
    j@135@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@134@01) (Seq_index
    xs1@61@01
    j@135@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) i@134@01) (Seq_index
    xs1@61@01
    j@135@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) i@134@01) (Seq_index
    xs1@61@01
    j@135@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@135@01) (Seq_index
    xs1@61@01
    i@134@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) j@135@01) (Seq_index
    xs1@61@01
    i@134@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) j@135@01) (Seq_index
    xs1@61@01
    i@134@01))
  :pattern ((Seq_index xs1@61@01 i@134@01) (Seq_index xs1@61@01 j@135@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@16@12@16@98|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@134@01 Int) (j@135@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@134@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@135@01)
        (not (= i@134@01 j@135@01))))
    (not (= (Seq_index xs1@61@01 i@134@01) (Seq_index xs1@61@01 j@135@01))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@134@01) (Seq_contains
    (Seq_range 0 (Seq_length xs1@61@01))
    j@135@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) i@134@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs1@61@01))
    j@135@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@134@01) (Seq_index
    xs1@61@01
    j@135@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) i@134@01) (Seq_index
    xs1@61@01
    j@135@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@135@01) (Seq_index
    xs1@61@01
    i@134@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) j@135@01) (Seq_index
    xs1@61@01
    i@134@01))
  :pattern ((Seq_index xs1@61@01 i@134@01) (Seq_index xs1@61@01 j@135@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@16@12@16@98|)))
(declare-const i@136@01 Int)
(push) ; 3
; [eval] (i in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(assert (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@136@01))
; [eval] xs[i]
(push) ; 4
(assert (not (>= i@136@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@136@01 (Seq_length xs1@61@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@137@01 ($Ref) Int)
(declare-fun img@138@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@136@01 Int) (i2@136@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i1@136@01)
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i2@136@01)
      (= (Seq_index xs1@61@01 i1@136@01) (Seq_index xs1@61@01 i2@136@01)))
    (= i1@136@01 i2@136@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@136@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@136@01)
    (and
      (= (inv@137@01 (Seq_index xs1@61@01 i@136@01)) i@136@01)
      (img@138@01 (Seq_index xs1@61@01 i@136@01))))
  :pattern ((Seq_index xs1@61@01 i@136@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@138@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@137@01 r)))
    (= (Seq_index xs1@61@01 (inv@137@01 r)) r))
  :pattern ((inv@137@01 r))
  :qid |f-fctOfInv|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((i@136@01 Int)) (!
  (= (Seq_index xs1@61@01 i@136@01) (Seq_index xs2@62@01 i@136@01))
  
  :qid |quant-u-96|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((i@136@01 Int)) (!
  (= (Seq_index xs1@61@01 i@136@01) (Seq_index xs2@62@01 i@136@01))
  
  :qid |quant-u-97|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((i@136@01 Int)) (!
  (= (Seq_index xs1@61@01 i@136@01) (Seq_index xs2@62@01 i@136@01))
  
  :qid |quant-u-98|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((i@136@01 Int)) (!
  (= (Seq_index xs1@61@01 i@136@01) (Seq_index xs3@63@01 i@136@01))
  
  :qid |quant-u-99|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((i@136@01 Int)) (!
  (= (Seq_index xs1@61@01 i@136@01) (Seq_index xs3@63@01 i@136@01))
  
  :qid |quant-u-100|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@139@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@137@01 r))
      (img@138@01 r)
      (= r (Seq_index xs1@61@01 (inv@137@01 r))))
    ($Perm.min
      (ite
        (and
          (img@94@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@93@01 r)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
(define-fun pTaken@140@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@137@01 r))
      (img@138@01 r)
      (= r (Seq_index xs1@61@01 (inv@137@01 r))))
    ($Perm.min
      (ite
        (and
          (img@97@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@96@01 r)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (- (/ (to_real 1) (to_real 2)) (pTaken@139@01 r)))
    $Perm.No))
(define-fun pTaken@141@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@137@01 r))
      (img@138@01 r)
      (= r (Seq_index xs1@61@01 (inv@137@01 r))))
    ($Perm.min
      (ite
        (and
          (img@114@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@113@01 r)))
        (/ (to_real 1) (to_real 4))
        $Perm.No)
      (- (- (/ (to_real 1) (to_real 2)) (pTaken@139@01 r)) (pTaken@140@01 r)))
    $Perm.No))
(define-fun pTaken@142@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@137@01 r))
      (img@138@01 r)
      (= r (Seq_index xs1@61@01 (inv@137@01 r))))
    ($Perm.min
      (ite
        (and
          (img@111@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@110@01 r)))
        (/ (to_real 1) (to_real 4))
        $Perm.No)
      (-
        (- (- (/ (to_real 1) (to_real 2)) (pTaken@139@01 r)) (pTaken@140@01 r))
        (pTaken@141@01 r)))
    $Perm.No))
(define-fun pTaken@143@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@137@01 r))
      (img@138@01 r)
      (= r (Seq_index xs1@61@01 (inv@137@01 r))))
    ($Perm.min
      (ite
        (and
          (img@75@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@74@01 r)))
        (- $Perm.Write (pTaken@103@01 r))
        $Perm.No)
      (-
        (-
          (- (- (/ (to_real 1) (to_real 2)) (pTaken@139@01 r)) (pTaken@140@01 r))
          (pTaken@141@01 r))
        (pTaken@142@01 r)))
    $Perm.No))
(define-fun pTaken@144@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@137@01 r))
      (img@138@01 r)
      (= r (Seq_index xs1@61@01 (inv@137@01 r))))
    ($Perm.min
      (ite
        (and
          (img@130@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@129@01 r)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (-
        (-
          (-
            (-
              (- (/ (to_real 1) (to_real 2)) (pTaken@139@01 r))
              (pTaken@140@01 r))
            (pTaken@141@01 r))
          (pTaken@142@01 r))
        (pTaken@143@01 r)))
    $Perm.No))
(define-fun pTaken@145@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@137@01 r))
      (img@138@01 r)
      (= r (Seq_index xs1@61@01 (inv@137@01 r))))
    ($Perm.min
      (ite
        (and
          (img@133@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@132@01 r)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (-
        (-
          (-
            (-
              (-
                (- (/ (to_real 1) (to_real 2)) (pTaken@139@01 r))
                (pTaken@140@01 r))
              (pTaken@141@01 r))
            (pTaken@142@01 r))
          (pTaken@143@01 r))
        (pTaken@144@01 r)))
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
          (img@94@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@93@01 r)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@139@01 r))
    $Perm.No)
  
  :qid |quant-u-102|))))
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
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@137@01 r))
      (img@138@01 r)
      (= r (Seq_index xs1@61@01 (inv@137@01 r))))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@139@01 r)) $Perm.No))
  
  :qid |quant-u-103|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@146@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@114@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@113@01 r)))
    (=
      ($FVF.lookup_f (as sm@146@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@108@01)) r)))
  :pattern (($FVF.lookup_f (as sm@146@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@108@01)) r))
  :qid |qp.fvfValDef16|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@111@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@110@01 r)))
    (=
      ($FVF.lookup_f (as sm@146@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@108@01)) r)))
  :pattern (($FVF.lookup_f (as sm@146@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@108@01)) r))
  :qid |qp.fvfValDef17|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@75@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@74@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@103@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@146@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@70@01)) r)))
  :pattern (($FVF.lookup_f (as sm@146@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@70@01)) r))
  :qid |qp.fvfValDef18|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@94@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@93@01 r)))
    (=
      ($FVF.lookup_f (as sm@146@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@91@01)) r)))
  :pattern (($FVF.lookup_f (as sm@146@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@91@01)) r))
  :qid |qp.fvfValDef19|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@97@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@96@01 r)))
    (=
      ($FVF.lookup_f (as sm@146@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@91@01)) r)))
  :pattern (($FVF.lookup_f (as sm@146@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@91@01)) r))
  :qid |qp.fvfValDef20|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@130@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@129@01 r)))
    (=
      ($FVF.lookup_f (as sm@146@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@127@01)) r)))
  :pattern (($FVF.lookup_f (as sm@146@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@127@01)) r))
  :qid |qp.fvfValDef21|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@133@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@132@01 r)))
    (=
      ($FVF.lookup_f (as sm@146@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@127@01)) r)))
  :pattern (($FVF.lookup_f (as sm@146@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@127@01)) r))
  :qid |qp.fvfValDef22|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; leak(xs2, 1 / 2)
; [eval] p >= none
; [eval] (forall i: Int, j: Int :: { (i in [0..|xs|)), (j in [0..|xs|)) } { (i in [0..|xs|)), xs[j] } { (j in [0..|xs|)), xs[i] } { xs[i], xs[j] } (i in [0..|xs|)) && ((j in [0..|xs|)) && i != j) ==> xs[i] != xs[j])
(declare-const i@147@01 Int)
(declare-const j@148@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (i in [0..|xs|)) && ((j in [0..|xs|)) && i != j) ==> xs[i] != xs[j]
; [eval] (i in [0..|xs|)) && ((j in [0..|xs|)) && i != j)
; [eval] (i in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(push) ; 4
; [then-branch: 36 | !(i@147@01 in [0..|xs2@62@01|]) | live]
; [else-branch: 36 | i@147@01 in [0..|xs2@62@01|] | live]
(push) ; 5
; [then-branch: 36 | !(i@147@01 in [0..|xs2@62@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@147@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 36 | i@147@01 in [0..|xs2@62@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@147@01))
; [eval] (j in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(push) ; 6
; [then-branch: 37 | !(j@148@01 in [0..|xs2@62@01|]) | live]
; [else-branch: 37 | j@148@01 in [0..|xs2@62@01|] | live]
(push) ; 7
; [then-branch: 37 | !(j@148@01 in [0..|xs2@62@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@148@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 37 | j@148@01 in [0..|xs2@62@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@148@01))
; [eval] i != j
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@148@01)
  (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@148@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@147@01)
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@147@01)
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@148@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@148@01))))))
(assert (or
  (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@147@01)
  (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@147@01))))
(push) ; 4
; [then-branch: 38 | i@147@01 in [0..|xs2@62@01|] && j@148@01 in [0..|xs2@62@01|] && i@147@01 != j@148@01 | live]
; [else-branch: 38 | !(i@147@01 in [0..|xs2@62@01|] && j@148@01 in [0..|xs2@62@01|] && i@147@01 != j@148@01) | live]
(push) ; 5
; [then-branch: 38 | i@147@01 in [0..|xs2@62@01|] && j@148@01 in [0..|xs2@62@01|] && i@147@01 != j@148@01]
(assert (and
  (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@147@01)
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@148@01)
    (not (= i@147@01 j@148@01)))))
; [eval] xs[i] != xs[j]
; [eval] xs[i]
(push) ; 6
(assert (not (>= i@147@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@147@01 (Seq_length xs2@62@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] xs[j]
(push) ; 6
(assert (not (>= j@148@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< j@148@01 (Seq_length xs2@62@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 38 | !(i@147@01 in [0..|xs2@62@01|] && j@148@01 in [0..|xs2@62@01|] && i@147@01 != j@148@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@147@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@148@01)
      (not (= i@147@01 j@148@01))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@147@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@148@01)
      (not (= i@147@01 j@148@01))))
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@147@01)
    (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@148@01)
    (not (= i@147@01 j@148@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@147@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@148@01)
        (not (= i@147@01 j@148@01)))))
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@147@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@148@01)
      (not (= i@147@01 j@148@01))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@147@01 Int) (j@148@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@147@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@147@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@148@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@148@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@147@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@147@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@147@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@148@01)
          (not (= i@147@01 j@148@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@147@01)
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@148@01)
        (not (= i@147@01 j@148@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@147@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@148@01)
            (not (= i@147@01 j@148@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@147@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@148@01)
          (not (= i@147@01 j@148@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@147@01) (Seq_contains
    (Seq_range 0 (Seq_length xs2@62@01))
    j@148@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs2@62@01)) i@147@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs2@62@01))
    j@148@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@16@12@16@98-aux|)))
(assert (forall ((i@147@01 Int) (j@148@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@147@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@147@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@148@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@148@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@147@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@147@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@147@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@148@01)
          (not (= i@147@01 j@148@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@147@01)
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@148@01)
        (not (= i@147@01 j@148@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@147@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@148@01)
            (not (= i@147@01 j@148@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@147@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@148@01)
          (not (= i@147@01 j@148@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs2@62@01)) i@147@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs2@62@01))
    j@148@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@16@12@16@98-aux|)))
(assert (forall ((i@147@01 Int) (j@148@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@147@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@147@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@148@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@148@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@147@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@147@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@147@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@148@01)
          (not (= i@147@01 j@148@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@147@01)
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@148@01)
        (not (= i@147@01 j@148@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@147@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@148@01)
            (not (= i@147@01 j@148@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@147@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@148@01)
          (not (= i@147@01 j@148@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@147@01) (Seq_index
    xs2@62@01
    j@148@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs2@62@01)) i@147@01) (Seq_index
    xs2@62@01
    j@148@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@16@12@16@98-aux|)))
(assert (forall ((i@147@01 Int) (j@148@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@147@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@147@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@148@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@148@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@147@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@147@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@147@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@148@01)
          (not (= i@147@01 j@148@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@147@01)
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@148@01)
        (not (= i@147@01 j@148@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@147@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@148@01)
            (not (= i@147@01 j@148@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@147@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@148@01)
          (not (= i@147@01 j@148@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs2@62@01)) i@147@01) (Seq_index
    xs2@62@01
    j@148@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@16@12@16@98-aux|)))
(assert (forall ((i@147@01 Int) (j@148@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@147@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@147@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@148@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@148@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@147@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@147@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@147@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@148@01)
          (not (= i@147@01 j@148@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@147@01)
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@148@01)
        (not (= i@147@01 j@148@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@147@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@148@01)
            (not (= i@147@01 j@148@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@147@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@148@01)
          (not (= i@147@01 j@148@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@148@01) (Seq_index
    xs2@62@01
    i@147@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs2@62@01)) j@148@01) (Seq_index
    xs2@62@01
    i@147@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@16@12@16@98-aux|)))
(assert (forall ((i@147@01 Int) (j@148@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@147@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@147@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@148@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@148@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@147@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@147@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@147@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@148@01)
          (not (= i@147@01 j@148@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@147@01)
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@148@01)
        (not (= i@147@01 j@148@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@147@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@148@01)
            (not (= i@147@01 j@148@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@147@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@148@01)
          (not (= i@147@01 j@148@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs2@62@01)) j@148@01) (Seq_index
    xs2@62@01
    i@147@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@16@12@16@98-aux|)))
(assert (forall ((i@147@01 Int) (j@148@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@147@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@147@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@148@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@148@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@147@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@147@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@147@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@148@01)
          (not (= i@147@01 j@148@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@147@01)
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@148@01)
        (not (= i@147@01 j@148@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@147@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@148@01)
            (not (= i@147@01 j@148@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@147@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@148@01)
          (not (= i@147@01 j@148@01))))))
  :pattern ((Seq_index xs2@62@01 i@147@01) (Seq_index xs2@62@01 j@148@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@16@12@16@98-aux|)))
(push) ; 3
(assert (not (forall ((i@147@01 Int) (j@148@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@147@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@148@01)
        (not (= i@147@01 j@148@01))))
    (not (= (Seq_index xs2@62@01 i@147@01) (Seq_index xs2@62@01 j@148@01))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@147@01) (Seq_contains
    (Seq_range 0 (Seq_length xs2@62@01))
    j@148@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs2@62@01)) i@147@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs2@62@01))
    j@148@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs2@62@01)) i@147@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs2@62@01))
    j@148@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@147@01) (Seq_index
    xs2@62@01
    j@148@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs2@62@01)) i@147@01) (Seq_index
    xs2@62@01
    j@148@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs2@62@01)) i@147@01) (Seq_index
    xs2@62@01
    j@148@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@148@01) (Seq_index
    xs2@62@01
    i@147@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs2@62@01)) j@148@01) (Seq_index
    xs2@62@01
    i@147@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs2@62@01)) j@148@01) (Seq_index
    xs2@62@01
    i@147@01))
  :pattern ((Seq_index xs2@62@01 i@147@01) (Seq_index xs2@62@01 j@148@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@16@12@16@98|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@147@01 Int) (j@148@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@147@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@148@01)
        (not (= i@147@01 j@148@01))))
    (not (= (Seq_index xs2@62@01 i@147@01) (Seq_index xs2@62@01 j@148@01))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@147@01) (Seq_contains
    (Seq_range 0 (Seq_length xs2@62@01))
    j@148@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs2@62@01)) i@147@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs2@62@01))
    j@148@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@147@01) (Seq_index
    xs2@62@01
    j@148@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs2@62@01)) i@147@01) (Seq_index
    xs2@62@01
    j@148@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@148@01) (Seq_index
    xs2@62@01
    i@147@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs2@62@01)) j@148@01) (Seq_index
    xs2@62@01
    i@147@01))
  :pattern ((Seq_index xs2@62@01 i@147@01) (Seq_index xs2@62@01 j@148@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@16@12@16@98|)))
(declare-const i@149@01 Int)
(push) ; 3
; [eval] (i in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(assert (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@149@01))
; [eval] xs[i]
(push) ; 4
(assert (not (>= i@149@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@149@01 (Seq_length xs2@62@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@150@01 ($Ref) Int)
(declare-fun img@151@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@149@01 Int) (i2@149@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i1@149@01)
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i2@149@01)
      (= (Seq_index xs2@62@01 i1@149@01) (Seq_index xs2@62@01 i2@149@01)))
    (= i1@149@01 i2@149@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@149@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@149@01)
    (and
      (= (inv@150@01 (Seq_index xs2@62@01 i@149@01)) i@149@01)
      (img@151@01 (Seq_index xs2@62@01 i@149@01))))
  :pattern ((Seq_index xs2@62@01 i@149@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@151@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@150@01 r)))
    (= (Seq_index xs2@62@01 (inv@150@01 r)) r))
  :pattern ((inv@150@01 r))
  :qid |f-fctOfInv|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((i@149@01 Int)) (!
  (= (Seq_index xs2@62@01 i@149@01) (Seq_index xs3@63@01 i@149@01))
  
  :qid |quant-u-105|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((i@149@01 Int)) (!
  (= (Seq_index xs2@62@01 i@149@01) (Seq_index xs3@63@01 i@149@01))
  
  :qid |quant-u-106|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((i@149@01 Int)) (!
  (= (Seq_index xs2@62@01 i@149@01) (Seq_index xs1@61@01 i@149@01))
  
  :qid |quant-u-107|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@152@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@150@01 r))
      (img@151@01 r)
      (= r (Seq_index xs2@62@01 (inv@150@01 r))))
    ($Perm.min
      (ite
        (and
          (img@75@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@74@01 r)))
        (- $Perm.Write (pTaken@103@01 r))
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
(define-fun pTaken@153@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@150@01 r))
      (img@151@01 r)
      (= r (Seq_index xs2@62@01 (inv@150@01 r))))
    ($Perm.min
      (ite
        (and
          (img@111@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@110@01 r)))
        (/ (to_real 1) (to_real 4))
        $Perm.No)
      (- (/ (to_real 1) (to_real 2)) (pTaken@152@01 r)))
    $Perm.No))
(define-fun pTaken@154@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@150@01 r))
      (img@151@01 r)
      (= r (Seq_index xs2@62@01 (inv@150@01 r))))
    ($Perm.min
      (ite
        (and
          (img@114@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@113@01 r)))
        (/ (to_real 1) (to_real 4))
        $Perm.No)
      (- (- (/ (to_real 1) (to_real 2)) (pTaken@152@01 r)) (pTaken@153@01 r)))
    $Perm.No))
(define-fun pTaken@155@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@150@01 r))
      (img@151@01 r)
      (= r (Seq_index xs2@62@01 (inv@150@01 r))))
    ($Perm.min
      (ite
        (and
          (img@133@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@132@01 r)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (-
        (- (- (/ (to_real 1) (to_real 2)) (pTaken@152@01 r)) (pTaken@153@01 r))
        (pTaken@154@01 r)))
    $Perm.No))
(define-fun pTaken@156@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@150@01 r))
      (img@151@01 r)
      (= r (Seq_index xs2@62@01 (inv@150@01 r))))
    ($Perm.min
      (ite
        (and
          (img@130@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@129@01 r)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (-
        (-
          (- (- (/ (to_real 1) (to_real 2)) (pTaken@152@01 r)) (pTaken@153@01 r))
          (pTaken@154@01 r))
        (pTaken@155@01 r)))
    $Perm.No))
(define-fun pTaken@157@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@150@01 r))
      (img@151@01 r)
      (= r (Seq_index xs2@62@01 (inv@150@01 r))))
    ($Perm.min
      (ite
        (and
          (img@97@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@96@01 r)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (-
        (-
          (-
            (-
              (- (/ (to_real 1) (to_real 2)) (pTaken@152@01 r))
              (pTaken@153@01 r))
            (pTaken@154@01 r))
          (pTaken@155@01 r))
        (pTaken@156@01 r)))
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
          (img@75@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@74@01 r)))
        (- $Perm.Write (pTaken@103@01 r))
        $Perm.No)
      (pTaken@152@01 r))
    $Perm.No)
  
  :qid |quant-u-109|))))
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
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@150@01 r))
      (img@151@01 r)
      (= r (Seq_index xs2@62@01 (inv@150@01 r))))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@152@01 r)) $Perm.No))
  
  :qid |quant-u-110|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@158@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@133@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@132@01 r)))
    (=
      ($FVF.lookup_f (as sm@158@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@127@01)) r)))
  :pattern (($FVF.lookup_f (as sm@158@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@127@01)) r))
  :qid |qp.fvfValDef23|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@130@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@129@01 r)))
    (=
      ($FVF.lookup_f (as sm@158@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@127@01)) r)))
  :pattern (($FVF.lookup_f (as sm@158@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@127@01)) r))
  :qid |qp.fvfValDef24|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@75@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@74@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@103@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@158@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@70@01)) r)))
  :pattern (($FVF.lookup_f (as sm@158@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@70@01)) r))
  :qid |qp.fvfValDef25|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@111@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@110@01 r)))
    (=
      ($FVF.lookup_f (as sm@158@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@108@01)) r)))
  :pattern (($FVF.lookup_f (as sm@158@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@108@01)) r))
  :qid |qp.fvfValDef26|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@114@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@113@01 r)))
    (=
      ($FVF.lookup_f (as sm@158@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@108@01)) r)))
  :pattern (($FVF.lookup_f (as sm@158@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@108@01)) r))
  :qid |qp.fvfValDef27|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@97@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@96@01 r)))
    (=
      ($FVF.lookup_f (as sm@158@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@91@01)) r)))
  :pattern (($FVF.lookup_f (as sm@158@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@91@01)) r))
  :qid |qp.fvfValDef28|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; leak(xs3, 1 / 3)
; [eval] p >= none
; [eval] (forall i: Int, j: Int :: { (i in [0..|xs|)), (j in [0..|xs|)) } { (i in [0..|xs|)), xs[j] } { (j in [0..|xs|)), xs[i] } { xs[i], xs[j] } (i in [0..|xs|)) && ((j in [0..|xs|)) && i != j) ==> xs[i] != xs[j])
(declare-const i@159@01 Int)
(declare-const j@160@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (i in [0..|xs|)) && ((j in [0..|xs|)) && i != j) ==> xs[i] != xs[j]
; [eval] (i in [0..|xs|)) && ((j in [0..|xs|)) && i != j)
; [eval] (i in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(push) ; 4
; [then-branch: 39 | !(i@159@01 in [0..|xs3@63@01|]) | live]
; [else-branch: 39 | i@159@01 in [0..|xs3@63@01|] | live]
(push) ; 5
; [then-branch: 39 | !(i@159@01 in [0..|xs3@63@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@159@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 39 | i@159@01 in [0..|xs3@63@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@159@01))
; [eval] (j in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(push) ; 6
; [then-branch: 40 | !(j@160@01 in [0..|xs3@63@01|]) | live]
; [else-branch: 40 | j@160@01 in [0..|xs3@63@01|] | live]
(push) ; 7
; [then-branch: 40 | !(j@160@01 in [0..|xs3@63@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@160@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 40 | j@160@01 in [0..|xs3@63@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@160@01))
; [eval] i != j
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@160@01)
  (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@160@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@159@01)
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@159@01)
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@160@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@160@01))))))
(assert (or
  (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@159@01)
  (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@159@01))))
(push) ; 4
; [then-branch: 41 | i@159@01 in [0..|xs3@63@01|] && j@160@01 in [0..|xs3@63@01|] && i@159@01 != j@160@01 | live]
; [else-branch: 41 | !(i@159@01 in [0..|xs3@63@01|] && j@160@01 in [0..|xs3@63@01|] && i@159@01 != j@160@01) | live]
(push) ; 5
; [then-branch: 41 | i@159@01 in [0..|xs3@63@01|] && j@160@01 in [0..|xs3@63@01|] && i@159@01 != j@160@01]
(assert (and
  (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@159@01)
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@160@01)
    (not (= i@159@01 j@160@01)))))
; [eval] xs[i] != xs[j]
; [eval] xs[i]
(push) ; 6
(assert (not (>= i@159@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@159@01 (Seq_length xs3@63@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] xs[j]
(push) ; 6
(assert (not (>= j@160@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< j@160@01 (Seq_length xs3@63@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 41 | !(i@159@01 in [0..|xs3@63@01|] && j@160@01 in [0..|xs3@63@01|] && i@159@01 != j@160@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@159@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@160@01)
      (not (= i@159@01 j@160@01))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@159@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@160@01)
      (not (= i@159@01 j@160@01))))
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@159@01)
    (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@160@01)
    (not (= i@159@01 j@160@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@159@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@160@01)
        (not (= i@159@01 j@160@01)))))
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@159@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@160@01)
      (not (= i@159@01 j@160@01))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@159@01 Int) (j@160@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@159@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@159@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@160@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@160@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@159@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@159@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@159@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@160@01)
          (not (= i@159@01 j@160@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@159@01)
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@160@01)
        (not (= i@159@01 j@160@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@159@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@160@01)
            (not (= i@159@01 j@160@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@159@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@160@01)
          (not (= i@159@01 j@160@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@159@01) (Seq_contains
    (Seq_range 0 (Seq_length xs3@63@01))
    j@160@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs3@63@01)) i@159@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs3@63@01))
    j@160@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@16@12@16@98-aux|)))
(assert (forall ((i@159@01 Int) (j@160@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@159@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@159@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@160@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@160@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@159@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@159@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@159@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@160@01)
          (not (= i@159@01 j@160@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@159@01)
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@160@01)
        (not (= i@159@01 j@160@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@159@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@160@01)
            (not (= i@159@01 j@160@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@159@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@160@01)
          (not (= i@159@01 j@160@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs3@63@01)) i@159@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs3@63@01))
    j@160@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@16@12@16@98-aux|)))
(assert (forall ((i@159@01 Int) (j@160@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@159@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@159@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@160@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@160@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@159@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@159@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@159@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@160@01)
          (not (= i@159@01 j@160@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@159@01)
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@160@01)
        (not (= i@159@01 j@160@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@159@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@160@01)
            (not (= i@159@01 j@160@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@159@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@160@01)
          (not (= i@159@01 j@160@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@159@01) (Seq_index
    xs3@63@01
    j@160@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs3@63@01)) i@159@01) (Seq_index
    xs3@63@01
    j@160@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@16@12@16@98-aux|)))
(assert (forall ((i@159@01 Int) (j@160@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@159@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@159@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@160@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@160@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@159@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@159@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@159@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@160@01)
          (not (= i@159@01 j@160@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@159@01)
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@160@01)
        (not (= i@159@01 j@160@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@159@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@160@01)
            (not (= i@159@01 j@160@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@159@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@160@01)
          (not (= i@159@01 j@160@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs3@63@01)) i@159@01) (Seq_index
    xs3@63@01
    j@160@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@16@12@16@98-aux|)))
(assert (forall ((i@159@01 Int) (j@160@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@159@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@159@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@160@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@160@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@159@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@159@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@159@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@160@01)
          (not (= i@159@01 j@160@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@159@01)
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@160@01)
        (not (= i@159@01 j@160@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@159@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@160@01)
            (not (= i@159@01 j@160@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@159@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@160@01)
          (not (= i@159@01 j@160@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@160@01) (Seq_index
    xs3@63@01
    i@159@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs3@63@01)) j@160@01) (Seq_index
    xs3@63@01
    i@159@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@16@12@16@98-aux|)))
(assert (forall ((i@159@01 Int) (j@160@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@159@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@159@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@160@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@160@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@159@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@159@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@159@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@160@01)
          (not (= i@159@01 j@160@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@159@01)
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@160@01)
        (not (= i@159@01 j@160@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@159@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@160@01)
            (not (= i@159@01 j@160@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@159@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@160@01)
          (not (= i@159@01 j@160@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs3@63@01)) j@160@01) (Seq_index
    xs3@63@01
    i@159@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@16@12@16@98-aux|)))
(assert (forall ((i@159@01 Int) (j@160@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@159@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@159@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@160@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@160@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@159@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@159@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@159@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@160@01)
          (not (= i@159@01 j@160@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@159@01)
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@160@01)
        (not (= i@159@01 j@160@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@159@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@160@01)
            (not (= i@159@01 j@160@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@159@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@160@01)
          (not (= i@159@01 j@160@01))))))
  :pattern ((Seq_index xs3@63@01 i@159@01) (Seq_index xs3@63@01 j@160@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@16@12@16@98-aux|)))
(push) ; 3
(assert (not (forall ((i@159@01 Int) (j@160@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@159@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@160@01)
        (not (= i@159@01 j@160@01))))
    (not (= (Seq_index xs3@63@01 i@159@01) (Seq_index xs3@63@01 j@160@01))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@159@01) (Seq_contains
    (Seq_range 0 (Seq_length xs3@63@01))
    j@160@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs3@63@01)) i@159@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs3@63@01))
    j@160@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs3@63@01)) i@159@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs3@63@01))
    j@160@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@159@01) (Seq_index
    xs3@63@01
    j@160@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs3@63@01)) i@159@01) (Seq_index
    xs3@63@01
    j@160@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs3@63@01)) i@159@01) (Seq_index
    xs3@63@01
    j@160@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@160@01) (Seq_index
    xs3@63@01
    i@159@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs3@63@01)) j@160@01) (Seq_index
    xs3@63@01
    i@159@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs3@63@01)) j@160@01) (Seq_index
    xs3@63@01
    i@159@01))
  :pattern ((Seq_index xs3@63@01 i@159@01) (Seq_index xs3@63@01 j@160@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@16@12@16@98|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@159@01 Int) (j@160@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@159@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@160@01)
        (not (= i@159@01 j@160@01))))
    (not (= (Seq_index xs3@63@01 i@159@01) (Seq_index xs3@63@01 j@160@01))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@159@01) (Seq_contains
    (Seq_range 0 (Seq_length xs3@63@01))
    j@160@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs3@63@01)) i@159@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs3@63@01))
    j@160@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@159@01) (Seq_index
    xs3@63@01
    j@160@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs3@63@01)) i@159@01) (Seq_index
    xs3@63@01
    j@160@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@160@01) (Seq_index
    xs3@63@01
    i@159@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs3@63@01)) j@160@01) (Seq_index
    xs3@63@01
    i@159@01))
  :pattern ((Seq_index xs3@63@01 i@159@01) (Seq_index xs3@63@01 j@160@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@16@12@16@98|)))
(declare-const i@161@01 Int)
(push) ; 3
; [eval] (i in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(assert (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@161@01))
; [eval] xs[i]
(push) ; 4
(assert (not (>= i@161@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@161@01 (Seq_length xs3@63@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@162@01 ($Ref) Int)
(declare-fun img@163@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@161@01 Int) (i2@161@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i1@161@01)
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i2@161@01)
      (= (Seq_index xs3@63@01 i1@161@01) (Seq_index xs3@63@01 i2@161@01)))
    (= i1@161@01 i2@161@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@161@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@161@01)
    (and
      (= (inv@162@01 (Seq_index xs3@63@01 i@161@01)) i@161@01)
      (img@163@01 (Seq_index xs3@63@01 i@161@01))))
  :pattern ((Seq_index xs3@63@01 i@161@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@163@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@162@01 r)))
    (= (Seq_index xs3@63@01 (inv@162@01 r)) r))
  :pattern ((inv@162@01 r))
  :qid |f-fctOfInv|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((i@161@01 Int)) (!
  (= (Seq_index xs3@63@01 i@161@01) (Seq_index xs1@61@01 i@161@01))
  
  :qid |quant-u-112|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((i@161@01 Int)) (!
  (= (Seq_index xs3@63@01 i@161@01) (Seq_index xs2@62@01 i@161@01))
  
  :qid |quant-u-113|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((i@161@01 Int)) (!
  (= (Seq_index xs3@63@01 i@161@01) (Seq_index xs2@62@01 i@161@01))
  
  :qid |quant-u-114|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@164@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@162@01 r))
      (img@163@01 r)
      (= r (Seq_index xs3@63@01 (inv@162@01 r))))
    ($Perm.min
      (ite
        (and
          (img@130@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@129@01 r)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (/ (to_real 1) (to_real 3)))
    $Perm.No))
(define-fun pTaken@165@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@162@01 r))
      (img@163@01 r)
      (= r (Seq_index xs3@63@01 (inv@162@01 r))))
    ($Perm.min
      (ite
        (and
          (img@133@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@132@01 r)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (- (/ (to_real 1) (to_real 3)) (pTaken@164@01 r)))
    $Perm.No))
(define-fun pTaken@166@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@162@01 r))
      (img@163@01 r)
      (= r (Seq_index xs3@63@01 (inv@162@01 r))))
    ($Perm.min
      (ite
        (and
          (img@97@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@96@01 r)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (- (- (/ (to_real 1) (to_real 3)) (pTaken@164@01 r)) (pTaken@165@01 r)))
    $Perm.No))
(define-fun pTaken@167@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@162@01 r))
      (img@163@01 r)
      (= r (Seq_index xs3@63@01 (inv@162@01 r))))
    ($Perm.min
      (ite
        (and
          (img@114@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@113@01 r)))
        (/ (to_real 1) (to_real 4))
        $Perm.No)
      (-
        (- (- (/ (to_real 1) (to_real 3)) (pTaken@164@01 r)) (pTaken@165@01 r))
        (pTaken@166@01 r)))
    $Perm.No))
(define-fun pTaken@168@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@162@01 r))
      (img@163@01 r)
      (= r (Seq_index xs3@63@01 (inv@162@01 r))))
    ($Perm.min
      (ite
        (and
          (img@111@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@110@01 r)))
        (/ (to_real 1) (to_real 4))
        $Perm.No)
      (-
        (-
          (- (- (/ (to_real 1) (to_real 3)) (pTaken@164@01 r)) (pTaken@165@01 r))
          (pTaken@166@01 r))
        (pTaken@167@01 r)))
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
          (img@130@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@129@01 r)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@164@01 r))
    $Perm.No)
  
  :qid |quant-u-116|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@164@01 r) $Perm.No)
  
  :qid |quant-u-117|))))
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
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@162@01 r))
      (img@163@01 r)
      (= r (Seq_index xs3@63@01 (inv@162@01 r))))
    (= (- (/ (to_real 1) (to_real 3)) (pTaken@164@01 r)) $Perm.No))
  
  :qid |quant-u-118|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@169@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@97@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@96@01 r)))
    (=
      ($FVF.lookup_f (as sm@169@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@91@01)) r)))
  :pattern (($FVF.lookup_f (as sm@169@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@91@01)) r))
  :qid |qp.fvfValDef29|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@130@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@129@01 r)))
    (=
      ($FVF.lookup_f (as sm@169@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@127@01)) r)))
  :pattern (($FVF.lookup_f (as sm@169@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@127@01)) r))
  :qid |qp.fvfValDef30|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@133@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@132@01 r)))
    (=
      ($FVF.lookup_f (as sm@169@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@127@01)) r)))
  :pattern (($FVF.lookup_f (as sm@169@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@127@01)) r))
  :qid |qp.fvfValDef31|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@114@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@113@01 r)))
    (=
      ($FVF.lookup_f (as sm@169@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@108@01)) r)))
  :pattern (($FVF.lookup_f (as sm@169@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@108@01)) r))
  :qid |qp.fvfValDef32|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@111@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@110@01 r)))
    (=
      ($FVF.lookup_f (as sm@169@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@108@01)) r)))
  :pattern (($FVF.lookup_f (as sm@169@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@108@01)) r))
  :qid |qp.fvfValDef33|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; split(xs1, 1 / 2, 1 / 4)
; [eval] p == 2 * q
; [eval] 2 * q
; [eval] p >= none
; [eval] (forall i: Int, j: Int :: { (i in [0..|xs|)), (j in [0..|xs|)) } { (i in [0..|xs|)), xs[j] } { (j in [0..|xs|)), xs[i] } { xs[i], xs[j] } (i in [0..|xs|)) && ((j in [0..|xs|)) && i != j) ==> xs[i] != xs[j])
(declare-const i@170@01 Int)
(declare-const j@171@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (i in [0..|xs|)) && ((j in [0..|xs|)) && i != j) ==> xs[i] != xs[j]
; [eval] (i in [0..|xs|)) && ((j in [0..|xs|)) && i != j)
; [eval] (i in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(push) ; 4
; [then-branch: 42 | !(i@170@01 in [0..|xs1@61@01|]) | live]
; [else-branch: 42 | i@170@01 in [0..|xs1@61@01|] | live]
(push) ; 5
; [then-branch: 42 | !(i@170@01 in [0..|xs1@61@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@170@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 42 | i@170@01 in [0..|xs1@61@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@170@01))
; [eval] (j in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(push) ; 6
; [then-branch: 43 | !(j@171@01 in [0..|xs1@61@01|]) | live]
; [else-branch: 43 | j@171@01 in [0..|xs1@61@01|] | live]
(push) ; 7
; [then-branch: 43 | !(j@171@01 in [0..|xs1@61@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@171@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 43 | j@171@01 in [0..|xs1@61@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@171@01))
; [eval] i != j
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@171@01)
  (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@171@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@170@01)
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@170@01)
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@171@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@171@01))))))
(assert (or
  (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@170@01)
  (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@170@01))))
(push) ; 4
; [then-branch: 44 | i@170@01 in [0..|xs1@61@01|] && j@171@01 in [0..|xs1@61@01|] && i@170@01 != j@171@01 | live]
; [else-branch: 44 | !(i@170@01 in [0..|xs1@61@01|] && j@171@01 in [0..|xs1@61@01|] && i@170@01 != j@171@01) | live]
(push) ; 5
; [then-branch: 44 | i@170@01 in [0..|xs1@61@01|] && j@171@01 in [0..|xs1@61@01|] && i@170@01 != j@171@01]
(assert (and
  (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@170@01)
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@171@01)
    (not (= i@170@01 j@171@01)))))
; [eval] xs[i] != xs[j]
; [eval] xs[i]
(push) ; 6
(assert (not (>= i@170@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@170@01 (Seq_length xs1@61@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] xs[j]
(push) ; 6
(assert (not (>= j@171@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< j@171@01 (Seq_length xs1@61@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 44 | !(i@170@01 in [0..|xs1@61@01|] && j@171@01 in [0..|xs1@61@01|] && i@170@01 != j@171@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@170@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@171@01)
      (not (= i@170@01 j@171@01))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@170@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@171@01)
      (not (= i@170@01 j@171@01))))
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@170@01)
    (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@171@01)
    (not (= i@170@01 j@171@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@170@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@171@01)
        (not (= i@170@01 j@171@01)))))
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@170@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@171@01)
      (not (= i@170@01 j@171@01))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@170@01 Int) (j@171@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@170@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@170@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@171@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@171@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@170@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@170@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@170@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@171@01)
          (not (= i@170@01 j@171@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@170@01)
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@171@01)
        (not (= i@170@01 j@171@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@170@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@171@01)
            (not (= i@170@01 j@171@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@170@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@171@01)
          (not (= i@170@01 j@171@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@170@01) (Seq_contains
    (Seq_range 0 (Seq_length xs1@61@01))
    j@171@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) i@170@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs1@61@01))
    j@171@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@23@12@23@98-aux|)))
(assert (forall ((i@170@01 Int) (j@171@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@170@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@170@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@171@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@171@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@170@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@170@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@170@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@171@01)
          (not (= i@170@01 j@171@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@170@01)
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@171@01)
        (not (= i@170@01 j@171@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@170@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@171@01)
            (not (= i@170@01 j@171@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@170@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@171@01)
          (not (= i@170@01 j@171@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) i@170@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs1@61@01))
    j@171@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@23@12@23@98-aux|)))
(assert (forall ((i@170@01 Int) (j@171@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@170@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@170@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@171@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@171@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@170@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@170@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@170@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@171@01)
          (not (= i@170@01 j@171@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@170@01)
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@171@01)
        (not (= i@170@01 j@171@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@170@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@171@01)
            (not (= i@170@01 j@171@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@170@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@171@01)
          (not (= i@170@01 j@171@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@170@01) (Seq_index
    xs1@61@01
    j@171@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) i@170@01) (Seq_index
    xs1@61@01
    j@171@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@23@12@23@98-aux|)))
(assert (forall ((i@170@01 Int) (j@171@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@170@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@170@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@171@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@171@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@170@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@170@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@170@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@171@01)
          (not (= i@170@01 j@171@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@170@01)
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@171@01)
        (not (= i@170@01 j@171@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@170@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@171@01)
            (not (= i@170@01 j@171@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@170@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@171@01)
          (not (= i@170@01 j@171@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) i@170@01) (Seq_index
    xs1@61@01
    j@171@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@23@12@23@98-aux|)))
(assert (forall ((i@170@01 Int) (j@171@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@170@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@170@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@171@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@171@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@170@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@170@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@170@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@171@01)
          (not (= i@170@01 j@171@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@170@01)
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@171@01)
        (not (= i@170@01 j@171@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@170@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@171@01)
            (not (= i@170@01 j@171@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@170@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@171@01)
          (not (= i@170@01 j@171@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@171@01) (Seq_index
    xs1@61@01
    i@170@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) j@171@01) (Seq_index
    xs1@61@01
    i@170@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@23@12@23@98-aux|)))
(assert (forall ((i@170@01 Int) (j@171@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@170@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@170@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@171@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@171@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@170@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@170@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@170@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@171@01)
          (not (= i@170@01 j@171@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@170@01)
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@171@01)
        (not (= i@170@01 j@171@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@170@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@171@01)
            (not (= i@170@01 j@171@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@170@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@171@01)
          (not (= i@170@01 j@171@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) j@171@01) (Seq_index
    xs1@61@01
    i@170@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@23@12@23@98-aux|)))
(assert (forall ((i@170@01 Int) (j@171@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@170@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@170@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@171@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@171@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@170@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@170@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@170@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@171@01)
          (not (= i@170@01 j@171@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@170@01)
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@171@01)
        (not (= i@170@01 j@171@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@170@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@171@01)
            (not (= i@170@01 j@171@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@170@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@171@01)
          (not (= i@170@01 j@171@01))))))
  :pattern ((Seq_index xs1@61@01 i@170@01) (Seq_index xs1@61@01 j@171@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@23@12@23@98-aux|)))
(push) ; 3
(assert (not (forall ((i@170@01 Int) (j@171@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@170@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@171@01)
        (not (= i@170@01 j@171@01))))
    (not (= (Seq_index xs1@61@01 i@170@01) (Seq_index xs1@61@01 j@171@01))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@170@01) (Seq_contains
    (Seq_range 0 (Seq_length xs1@61@01))
    j@171@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) i@170@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs1@61@01))
    j@171@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) i@170@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs1@61@01))
    j@171@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@170@01) (Seq_index
    xs1@61@01
    j@171@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) i@170@01) (Seq_index
    xs1@61@01
    j@171@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) i@170@01) (Seq_index
    xs1@61@01
    j@171@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@171@01) (Seq_index
    xs1@61@01
    i@170@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) j@171@01) (Seq_index
    xs1@61@01
    i@170@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) j@171@01) (Seq_index
    xs1@61@01
    i@170@01))
  :pattern ((Seq_index xs1@61@01 i@170@01) (Seq_index xs1@61@01 j@171@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@23@12@23@98|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@170@01 Int) (j@171@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@170@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@171@01)
        (not (= i@170@01 j@171@01))))
    (not (= (Seq_index xs1@61@01 i@170@01) (Seq_index xs1@61@01 j@171@01))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@170@01) (Seq_contains
    (Seq_range 0 (Seq_length xs1@61@01))
    j@171@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) i@170@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs1@61@01))
    j@171@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@170@01) (Seq_index
    xs1@61@01
    j@171@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) i@170@01) (Seq_index
    xs1@61@01
    j@171@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@171@01) (Seq_index
    xs1@61@01
    i@170@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) j@171@01) (Seq_index
    xs1@61@01
    i@170@01))
  :pattern ((Seq_index xs1@61@01 i@170@01) (Seq_index xs1@61@01 j@171@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@23@12@23@98|)))
(declare-const i@172@01 Int)
(push) ; 3
; [eval] (i in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(assert (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@172@01))
; [eval] xs[i]
(push) ; 4
(assert (not (>= i@172@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@172@01 (Seq_length xs1@61@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@173@01 ($Ref) Int)
(declare-fun img@174@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@172@01 Int) (i2@172@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i1@172@01)
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i2@172@01)
      (= (Seq_index xs1@61@01 i1@172@01) (Seq_index xs1@61@01 i2@172@01)))
    (= i1@172@01 i2@172@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@172@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@172@01)
    (and
      (= (inv@173@01 (Seq_index xs1@61@01 i@172@01)) i@172@01)
      (img@174@01 (Seq_index xs1@61@01 i@172@01))))
  :pattern ((Seq_index xs1@61@01 i@172@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@174@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@173@01 r)))
    (= (Seq_index xs1@61@01 (inv@173@01 r)) r))
  :pattern ((inv@173@01 r))
  :qid |f-fctOfInv|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((i@172@01 Int)) (!
  (= (Seq_index xs1@61@01 i@172@01) (Seq_index xs2@62@01 i@172@01))
  
  :qid |quant-u-120|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((i@172@01 Int)) (!
  (= (Seq_index xs1@61@01 i@172@01) (Seq_index xs2@62@01 i@172@01))
  
  :qid |quant-u-121|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((i@172@01 Int)) (!
  (= (Seq_index xs1@61@01 i@172@01) (Seq_index xs3@63@01 i@172@01))
  
  :qid |quant-u-122|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((i@172@01 Int)) (!
  (= (Seq_index xs1@61@01 i@172@01) (Seq_index xs3@63@01 i@172@01))
  
  :qid |quant-u-123|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@175@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@173@01 r))
      (img@174@01 r)
      (= r (Seq_index xs1@61@01 (inv@173@01 r))))
    ($Perm.min
      (ite
        (and
          (img@97@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@96@01 r)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
(define-fun pTaken@176@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@173@01 r))
      (img@174@01 r)
      (= r (Seq_index xs1@61@01 (inv@173@01 r))))
    ($Perm.min
      (ite
        (and
          (img@111@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@110@01 r)))
        (/ (to_real 1) (to_real 4))
        $Perm.No)
      (- (/ (to_real 1) (to_real 2)) (pTaken@175@01 r)))
    $Perm.No))
(define-fun pTaken@177@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@173@01 r))
      (img@174@01 r)
      (= r (Seq_index xs1@61@01 (inv@173@01 r))))
    ($Perm.min
      (ite
        (and
          (img@114@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@113@01 r)))
        (/ (to_real 1) (to_real 4))
        $Perm.No)
      (- (- (/ (to_real 1) (to_real 2)) (pTaken@175@01 r)) (pTaken@176@01 r)))
    $Perm.No))
(define-fun pTaken@178@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@173@01 r))
      (img@174@01 r)
      (= r (Seq_index xs1@61@01 (inv@173@01 r))))
    ($Perm.min
      (ite
        (and
          (img@133@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@132@01 r)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (-
        (- (- (/ (to_real 1) (to_real 2)) (pTaken@175@01 r)) (pTaken@176@01 r))
        (pTaken@177@01 r)))
    $Perm.No))
(define-fun pTaken@179@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@173@01 r))
      (img@174@01 r)
      (= r (Seq_index xs1@61@01 (inv@173@01 r))))
    ($Perm.min
      (ite
        (and
          (img@130@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@129@01 r)))
        (- (/ (to_real 1) (to_real 2)) (pTaken@164@01 r))
        $Perm.No)
      (-
        (-
          (- (- (/ (to_real 1) (to_real 2)) (pTaken@175@01 r)) (pTaken@176@01 r))
          (pTaken@177@01 r))
        (pTaken@178@01 r)))
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
          (img@97@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@96@01 r)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@175@01 r))
    $Perm.No)
  
  :qid |quant-u-125|))))
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
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@173@01 r))
      (img@174@01 r)
      (= r (Seq_index xs1@61@01 (inv@173@01 r))))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@175@01 r)) $Perm.No))
  
  :qid |quant-u-126|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@180@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@111@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@110@01 r)))
    (=
      ($FVF.lookup_f (as sm@180@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@108@01)) r)))
  :pattern (($FVF.lookup_f (as sm@180@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@108@01)) r))
  :qid |qp.fvfValDef34|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@114@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@113@01 r)))
    (=
      ($FVF.lookup_f (as sm@180@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@108@01)) r)))
  :pattern (($FVF.lookup_f (as sm@180@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@108@01)) r))
  :qid |qp.fvfValDef35|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@97@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@96@01 r)))
    (=
      ($FVF.lookup_f (as sm@180@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@91@01)) r)))
  :pattern (($FVF.lookup_f (as sm@180@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@91@01)) r))
  :qid |qp.fvfValDef36|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@133@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@132@01 r)))
    (=
      ($FVF.lookup_f (as sm@180@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@127@01)) r)))
  :pattern (($FVF.lookup_f (as sm@180@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@127@01)) r))
  :qid |qp.fvfValDef37|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@130@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@129@01 r)))
      (< $Perm.No (- (/ (to_real 1) (to_real 2)) (pTaken@164@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@180@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@127@01)) r)))
  :pattern (($FVF.lookup_f (as sm@180@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@127@01)) r))
  :qid |qp.fvfValDef38|)))
(declare-const $t@181@01 $Snap)
(assert (= $t@181@01 ($Snap.combine ($Snap.first $t@181@01) ($Snap.second $t@181@01))))
(declare-const i@182@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (i in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(assert (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@182@01))
; [eval] xs[i]
(push) ; 4
(assert (not (>= i@182@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@182@01 (Seq_length xs1@61@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@183@01 ($Ref) Int)
(declare-fun img@184@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@182@01 Int) (i2@182@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i1@182@01)
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i2@182@01)
      (= (Seq_index xs1@61@01 i1@182@01) (Seq_index xs1@61@01 i2@182@01)))
    (= i1@182@01 i2@182@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@182@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@182@01)
    (and
      (= (inv@183@01 (Seq_index xs1@61@01 i@182@01)) i@182@01)
      (img@184@01 (Seq_index xs1@61@01 i@182@01))))
  :pattern ((Seq_index xs1@61@01 i@182@01))
  :qid |quant-u-128|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@184@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@183@01 r)))
    (= (Seq_index xs1@61@01 (inv@183@01 r)) r))
  :pattern ((inv@183@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@182@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@182@01)
    (not (= (Seq_index xs1@61@01 i@182@01) $Ref.null)))
  :pattern ((Seq_index xs1@61@01 i@182@01))
  :qid |f-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs1@61@01 i@182@01) (Seq_index xs2@62@01 i@109@01))
    (=
      (and
        (img@184@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@183@01 r)))
      (and
        (img@111@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@110@01 r)))))
  
  :qid |quant-u-129|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs1@61@01 i@182@01) (Seq_index xs2@62@01 i@112@01))
    (=
      (and
        (img@184@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@183@01 r)))
      (and
        (img@114@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@113@01 r)))))
  
  :qid |quant-u-130|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs1@61@01 i@182@01) (Seq_index xs3@63@01 i@131@01))
    (=
      (and
        (img@184@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@183@01 r)))
      (and
        (img@133@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@132@01 r)))))
  
  :qid |quant-u-131|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs1@61@01 i@182@01) (Seq_index xs3@63@01 i@128@01))
    (=
      (and
        (img@184@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@183@01 r)))
      (and
        (img@130@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@129@01 r)))))
  
  :qid |quant-u-132|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const i@185@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (i in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(assert (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@185@01))
; [eval] xs[i]
(push) ; 4
(assert (not (>= i@185@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@185@01 (Seq_length xs1@61@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@186@01 ($Ref) Int)
(declare-fun img@187@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@185@01 Int) (i2@185@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i1@185@01)
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i2@185@01)
      (= (Seq_index xs1@61@01 i1@185@01) (Seq_index xs1@61@01 i2@185@01)))
    (= i1@185@01 i2@185@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@185@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@185@01)
    (and
      (= (inv@186@01 (Seq_index xs1@61@01 i@185@01)) i@185@01)
      (img@187@01 (Seq_index xs1@61@01 i@185@01))))
  :pattern ((Seq_index xs1@61@01 i@185@01))
  :qid |quant-u-134|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@187@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@186@01 r)))
    (= (Seq_index xs1@61@01 (inv@186@01 r)) r))
  :pattern ((inv@186@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@185@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@185@01)
    (not (= (Seq_index xs1@61@01 i@185@01) $Ref.null)))
  :pattern ((Seq_index xs1@61@01 i@185@01))
  :qid |f-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs1@61@01 i@185@01) (Seq_index xs1@61@01 i@182@01))
    (=
      (and
        (img@187@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@186@01 r)))
      (and
        (img@184@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@183@01 r)))))
  
  :qid |quant-u-135|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs1@61@01 i@185@01) (Seq_index xs2@62@01 i@109@01))
    (=
      (and
        (img@187@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@186@01 r)))
      (and
        (img@111@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@110@01 r)))))
  
  :qid |quant-u-136|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs1@61@01 i@185@01) (Seq_index xs2@62@01 i@112@01))
    (=
      (and
        (img@187@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@186@01 r)))
      (and
        (img@114@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@113@01 r)))))
  
  :qid |quant-u-137|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs1@61@01 i@185@01) (Seq_index xs3@63@01 i@131@01))
    (=
      (and
        (img@187@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@186@01 r)))
      (and
        (img@133@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@132@01 r)))))
  
  :qid |quant-u-138|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs1@61@01 i@185@01) (Seq_index xs3@63@01 i@128@01))
    (=
      (and
        (img@187@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@186@01 r)))
      (and
        (img@130@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@129@01 r)))))
  
  :qid |quant-u-139|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; leak(xs1, 1 / 4)
; [eval] p >= none
; [eval] (forall i: Int, j: Int :: { (i in [0..|xs|)), (j in [0..|xs|)) } { (i in [0..|xs|)), xs[j] } { (j in [0..|xs|)), xs[i] } { xs[i], xs[j] } (i in [0..|xs|)) && ((j in [0..|xs|)) && i != j) ==> xs[i] != xs[j])
(declare-const i@188@01 Int)
(declare-const j@189@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (i in [0..|xs|)) && ((j in [0..|xs|)) && i != j) ==> xs[i] != xs[j]
; [eval] (i in [0..|xs|)) && ((j in [0..|xs|)) && i != j)
; [eval] (i in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(push) ; 4
; [then-branch: 45 | !(i@188@01 in [0..|xs1@61@01|]) | live]
; [else-branch: 45 | i@188@01 in [0..|xs1@61@01|] | live]
(push) ; 5
; [then-branch: 45 | !(i@188@01 in [0..|xs1@61@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@188@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 45 | i@188@01 in [0..|xs1@61@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@188@01))
; [eval] (j in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(push) ; 6
; [then-branch: 46 | !(j@189@01 in [0..|xs1@61@01|]) | live]
; [else-branch: 46 | j@189@01 in [0..|xs1@61@01|] | live]
(push) ; 7
; [then-branch: 46 | !(j@189@01 in [0..|xs1@61@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@189@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 46 | j@189@01 in [0..|xs1@61@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@189@01))
; [eval] i != j
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@189@01)
  (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@189@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@188@01)
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@188@01)
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@189@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@189@01))))))
(assert (or
  (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@188@01)
  (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@188@01))))
(push) ; 4
; [then-branch: 47 | i@188@01 in [0..|xs1@61@01|] && j@189@01 in [0..|xs1@61@01|] && i@188@01 != j@189@01 | live]
; [else-branch: 47 | !(i@188@01 in [0..|xs1@61@01|] && j@189@01 in [0..|xs1@61@01|] && i@188@01 != j@189@01) | live]
(push) ; 5
; [then-branch: 47 | i@188@01 in [0..|xs1@61@01|] && j@189@01 in [0..|xs1@61@01|] && i@188@01 != j@189@01]
(assert (and
  (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@188@01)
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@189@01)
    (not (= i@188@01 j@189@01)))))
; [eval] xs[i] != xs[j]
; [eval] xs[i]
(push) ; 6
(assert (not (>= i@188@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@188@01 (Seq_length xs1@61@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] xs[j]
(push) ; 6
(assert (not (>= j@189@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< j@189@01 (Seq_length xs1@61@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 47 | !(i@188@01 in [0..|xs1@61@01|] && j@189@01 in [0..|xs1@61@01|] && i@188@01 != j@189@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@188@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@189@01)
      (not (= i@188@01 j@189@01))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@188@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@189@01)
      (not (= i@188@01 j@189@01))))
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@188@01)
    (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@189@01)
    (not (= i@188@01 j@189@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@188@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@189@01)
        (not (= i@188@01 j@189@01)))))
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@188@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@189@01)
      (not (= i@188@01 j@189@01))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@188@01 Int) (j@189@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@188@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@188@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@189@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@189@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@188@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@188@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@188@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@189@01)
          (not (= i@188@01 j@189@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@188@01)
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@189@01)
        (not (= i@188@01 j@189@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@188@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@189@01)
            (not (= i@188@01 j@189@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@188@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@189@01)
          (not (= i@188@01 j@189@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@188@01) (Seq_contains
    (Seq_range 0 (Seq_length xs1@61@01))
    j@189@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) i@188@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs1@61@01))
    j@189@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@16@12@16@98-aux|)))
(assert (forall ((i@188@01 Int) (j@189@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@188@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@188@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@189@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@189@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@188@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@188@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@188@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@189@01)
          (not (= i@188@01 j@189@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@188@01)
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@189@01)
        (not (= i@188@01 j@189@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@188@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@189@01)
            (not (= i@188@01 j@189@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@188@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@189@01)
          (not (= i@188@01 j@189@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) i@188@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs1@61@01))
    j@189@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@16@12@16@98-aux|)))
(assert (forall ((i@188@01 Int) (j@189@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@188@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@188@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@189@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@189@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@188@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@188@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@188@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@189@01)
          (not (= i@188@01 j@189@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@188@01)
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@189@01)
        (not (= i@188@01 j@189@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@188@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@189@01)
            (not (= i@188@01 j@189@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@188@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@189@01)
          (not (= i@188@01 j@189@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@188@01) (Seq_index
    xs1@61@01
    j@189@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) i@188@01) (Seq_index
    xs1@61@01
    j@189@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@16@12@16@98-aux|)))
(assert (forall ((i@188@01 Int) (j@189@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@188@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@188@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@189@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@189@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@188@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@188@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@188@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@189@01)
          (not (= i@188@01 j@189@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@188@01)
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@189@01)
        (not (= i@188@01 j@189@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@188@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@189@01)
            (not (= i@188@01 j@189@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@188@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@189@01)
          (not (= i@188@01 j@189@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) i@188@01) (Seq_index
    xs1@61@01
    j@189@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@16@12@16@98-aux|)))
(assert (forall ((i@188@01 Int) (j@189@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@188@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@188@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@189@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@189@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@188@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@188@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@188@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@189@01)
          (not (= i@188@01 j@189@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@188@01)
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@189@01)
        (not (= i@188@01 j@189@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@188@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@189@01)
            (not (= i@188@01 j@189@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@188@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@189@01)
          (not (= i@188@01 j@189@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@189@01) (Seq_index
    xs1@61@01
    i@188@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) j@189@01) (Seq_index
    xs1@61@01
    i@188@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@16@12@16@98-aux|)))
(assert (forall ((i@188@01 Int) (j@189@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@188@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@188@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@189@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@189@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@188@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@188@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@188@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@189@01)
          (not (= i@188@01 j@189@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@188@01)
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@189@01)
        (not (= i@188@01 j@189@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@188@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@189@01)
            (not (= i@188@01 j@189@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@188@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@189@01)
          (not (= i@188@01 j@189@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) j@189@01) (Seq_index
    xs1@61@01
    i@188@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@16@12@16@98-aux|)))
(assert (forall ((i@188@01 Int) (j@189@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@188@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@188@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@189@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@189@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@188@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@188@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@188@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@189@01)
          (not (= i@188@01 j@189@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@188@01)
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@189@01)
        (not (= i@188@01 j@189@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@188@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@189@01)
            (not (= i@188@01 j@189@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@188@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@189@01)
          (not (= i@188@01 j@189@01))))))
  :pattern ((Seq_index xs1@61@01 i@188@01) (Seq_index xs1@61@01 j@189@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@16@12@16@98-aux|)))
(push) ; 3
(assert (not (forall ((i@188@01 Int) (j@189@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@188@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@189@01)
        (not (= i@188@01 j@189@01))))
    (not (= (Seq_index xs1@61@01 i@188@01) (Seq_index xs1@61@01 j@189@01))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@188@01) (Seq_contains
    (Seq_range 0 (Seq_length xs1@61@01))
    j@189@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) i@188@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs1@61@01))
    j@189@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) i@188@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs1@61@01))
    j@189@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@188@01) (Seq_index
    xs1@61@01
    j@189@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) i@188@01) (Seq_index
    xs1@61@01
    j@189@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) i@188@01) (Seq_index
    xs1@61@01
    j@189@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@189@01) (Seq_index
    xs1@61@01
    i@188@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) j@189@01) (Seq_index
    xs1@61@01
    i@188@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) j@189@01) (Seq_index
    xs1@61@01
    i@188@01))
  :pattern ((Seq_index xs1@61@01 i@188@01) (Seq_index xs1@61@01 j@189@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@16@12@16@98|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@188@01 Int) (j@189@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@188@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@189@01)
        (not (= i@188@01 j@189@01))))
    (not (= (Seq_index xs1@61@01 i@188@01) (Seq_index xs1@61@01 j@189@01))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@188@01) (Seq_contains
    (Seq_range 0 (Seq_length xs1@61@01))
    j@189@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) i@188@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs1@61@01))
    j@189@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@188@01) (Seq_index
    xs1@61@01
    j@189@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) i@188@01) (Seq_index
    xs1@61@01
    j@189@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@189@01) (Seq_index
    xs1@61@01
    i@188@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) j@189@01) (Seq_index
    xs1@61@01
    i@188@01))
  :pattern ((Seq_index xs1@61@01 i@188@01) (Seq_index xs1@61@01 j@189@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@16@12@16@98|)))
(declare-const i@190@01 Int)
(push) ; 3
; [eval] (i in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(assert (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@190@01))
; [eval] xs[i]
(push) ; 4
(assert (not (>= i@190@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@190@01 (Seq_length xs1@61@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@191@01 ($Ref) Int)
(declare-fun img@192@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@190@01 Int) (i2@190@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i1@190@01)
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i2@190@01)
      (= (Seq_index xs1@61@01 i1@190@01) (Seq_index xs1@61@01 i2@190@01)))
    (= i1@190@01 i2@190@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@190@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@190@01)
    (and
      (= (inv@191@01 (Seq_index xs1@61@01 i@190@01)) i@190@01)
      (img@192@01 (Seq_index xs1@61@01 i@190@01))))
  :pattern ((Seq_index xs1@61@01 i@190@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@192@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@191@01 r)))
    (= (Seq_index xs1@61@01 (inv@191@01 r)) r))
  :pattern ((inv@191@01 r))
  :qid |f-fctOfInv|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((i@190@01 Int)) (!
  (= (Seq_index xs1@61@01 i@190@01) (Seq_index xs3@63@01 i@190@01))
  
  :qid |quant-u-141|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((i@190@01 Int)) (!
  (= (Seq_index xs1@61@01 i@190@01) (Seq_index xs3@63@01 i@190@01))
  
  :qid |quant-u-142|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((i@190@01 Int)) (!
  (= (Seq_index xs1@61@01 i@190@01) (Seq_index xs2@62@01 i@190@01))
  
  :qid |quant-u-143|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((i@190@01 Int)) (!
  (= (Seq_index xs1@61@01 i@190@01) (Seq_index xs2@62@01 i@190@01))
  
  :qid |quant-u-144|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@193@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@191@01 r))
      (img@192@01 r)
      (= r (Seq_index xs1@61@01 (inv@191@01 r))))
    ($Perm.min
      (ite
        (and
          (img@184@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@183@01 r)))
        (/ (to_real 1) (to_real 4))
        $Perm.No)
      (/ (to_real 1) (to_real 4)))
    $Perm.No))
(define-fun pTaken@194@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@191@01 r))
      (img@192@01 r)
      (= r (Seq_index xs1@61@01 (inv@191@01 r))))
    ($Perm.min
      (ite
        (and
          (img@187@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@186@01 r)))
        (/ (to_real 1) (to_real 4))
        $Perm.No)
      (- (/ (to_real 1) (to_real 4)) (pTaken@193@01 r)))
    $Perm.No))
(define-fun pTaken@195@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@191@01 r))
      (img@192@01 r)
      (= r (Seq_index xs1@61@01 (inv@191@01 r))))
    ($Perm.min
      (ite
        (and
          (img@130@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@129@01 r)))
        (- (/ (to_real 1) (to_real 2)) (pTaken@164@01 r))
        $Perm.No)
      (- (- (/ (to_real 1) (to_real 4)) (pTaken@193@01 r)) (pTaken@194@01 r)))
    $Perm.No))
(define-fun pTaken@196@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@191@01 r))
      (img@192@01 r)
      (= r (Seq_index xs1@61@01 (inv@191@01 r))))
    ($Perm.min
      (ite
        (and
          (img@133@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@132@01 r)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (-
        (- (- (/ (to_real 1) (to_real 4)) (pTaken@193@01 r)) (pTaken@194@01 r))
        (pTaken@195@01 r)))
    $Perm.No))
(define-fun pTaken@197@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@191@01 r))
      (img@192@01 r)
      (= r (Seq_index xs1@61@01 (inv@191@01 r))))
    ($Perm.min
      (ite
        (and
          (img@114@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@113@01 r)))
        (/ (to_real 1) (to_real 4))
        $Perm.No)
      (-
        (-
          (- (- (/ (to_real 1) (to_real 4)) (pTaken@193@01 r)) (pTaken@194@01 r))
          (pTaken@195@01 r))
        (pTaken@196@01 r)))
    $Perm.No))
(define-fun pTaken@198@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@191@01 r))
      (img@192@01 r)
      (= r (Seq_index xs1@61@01 (inv@191@01 r))))
    ($Perm.min
      (ite
        (and
          (img@111@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@110@01 r)))
        (/ (to_real 1) (to_real 4))
        $Perm.No)
      (-
        (-
          (-
            (-
              (- (/ (to_real 1) (to_real 4)) (pTaken@193@01 r))
              (pTaken@194@01 r))
            (pTaken@195@01 r))
          (pTaken@196@01 r))
        (pTaken@197@01 r)))
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
          (img@184@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@183@01 r)))
        (/ (to_real 1) (to_real 4))
        $Perm.No)
      (pTaken@193@01 r))
    $Perm.No)
  
  :qid |quant-u-146|))))
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
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@191@01 r))
      (img@192@01 r)
      (= r (Seq_index xs1@61@01 (inv@191@01 r))))
    (= (- (/ (to_real 1) (to_real 4)) (pTaken@193@01 r)) $Perm.No))
  
  :qid |quant-u-147|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@199@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@130@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@129@01 r)))
      (< $Perm.No (- (/ (to_real 1) (to_real 2)) (pTaken@164@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@199@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@127@01)) r)))
  :pattern (($FVF.lookup_f (as sm@199@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@127@01)) r))
  :qid |qp.fvfValDef39|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@133@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@132@01 r)))
    (=
      ($FVF.lookup_f (as sm@199@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@127@01)) r)))
  :pattern (($FVF.lookup_f (as sm@199@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@127@01)) r))
  :qid |qp.fvfValDef40|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@114@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@113@01 r)))
    (=
      ($FVF.lookup_f (as sm@199@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@108@01)) r)))
  :pattern (($FVF.lookup_f (as sm@199@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@108@01)) r))
  :qid |qp.fvfValDef41|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@111@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@110@01 r)))
    (=
      ($FVF.lookup_f (as sm@199@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@108@01)) r)))
  :pattern (($FVF.lookup_f (as sm@199@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@108@01)) r))
  :qid |qp.fvfValDef42|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@184@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@183@01 r)))
    (=
      ($FVF.lookup_f (as sm@199@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@181@01)) r)))
  :pattern (($FVF.lookup_f (as sm@199@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@181@01)) r))
  :qid |qp.fvfValDef43|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@187@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@186@01 r)))
    (=
      ($FVF.lookup_f (as sm@199@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@181@01)) r)))
  :pattern (($FVF.lookup_f (as sm@199@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@181@01)) r))
  :qid |qp.fvfValDef44|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; leak(xs3, 1 / 3)
; [eval] p >= none
; [eval] (forall i: Int, j: Int :: { (i in [0..|xs|)), (j in [0..|xs|)) } { (i in [0..|xs|)), xs[j] } { (j in [0..|xs|)), xs[i] } { xs[i], xs[j] } (i in [0..|xs|)) && ((j in [0..|xs|)) && i != j) ==> xs[i] != xs[j])
(declare-const i@200@01 Int)
(declare-const j@201@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (i in [0..|xs|)) && ((j in [0..|xs|)) && i != j) ==> xs[i] != xs[j]
; [eval] (i in [0..|xs|)) && ((j in [0..|xs|)) && i != j)
; [eval] (i in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(push) ; 4
; [then-branch: 48 | !(i@200@01 in [0..|xs3@63@01|]) | live]
; [else-branch: 48 | i@200@01 in [0..|xs3@63@01|] | live]
(push) ; 5
; [then-branch: 48 | !(i@200@01 in [0..|xs3@63@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@200@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 48 | i@200@01 in [0..|xs3@63@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@200@01))
; [eval] (j in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(push) ; 6
; [then-branch: 49 | !(j@201@01 in [0..|xs3@63@01|]) | live]
; [else-branch: 49 | j@201@01 in [0..|xs3@63@01|] | live]
(push) ; 7
; [then-branch: 49 | !(j@201@01 in [0..|xs3@63@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@201@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 49 | j@201@01 in [0..|xs3@63@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@201@01))
; [eval] i != j
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@201@01)
  (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@201@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@200@01)
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@200@01)
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@201@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@201@01))))))
(assert (or
  (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@200@01)
  (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@200@01))))
(push) ; 4
; [then-branch: 50 | i@200@01 in [0..|xs3@63@01|] && j@201@01 in [0..|xs3@63@01|] && i@200@01 != j@201@01 | live]
; [else-branch: 50 | !(i@200@01 in [0..|xs3@63@01|] && j@201@01 in [0..|xs3@63@01|] && i@200@01 != j@201@01) | live]
(push) ; 5
; [then-branch: 50 | i@200@01 in [0..|xs3@63@01|] && j@201@01 in [0..|xs3@63@01|] && i@200@01 != j@201@01]
(assert (and
  (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@200@01)
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@201@01)
    (not (= i@200@01 j@201@01)))))
; [eval] xs[i] != xs[j]
; [eval] xs[i]
(push) ; 6
(assert (not (>= i@200@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@200@01 (Seq_length xs3@63@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] xs[j]
(push) ; 6
(assert (not (>= j@201@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< j@201@01 (Seq_length xs3@63@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 50 | !(i@200@01 in [0..|xs3@63@01|] && j@201@01 in [0..|xs3@63@01|] && i@200@01 != j@201@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@200@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@201@01)
      (not (= i@200@01 j@201@01))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@200@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@201@01)
      (not (= i@200@01 j@201@01))))
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@200@01)
    (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@201@01)
    (not (= i@200@01 j@201@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@200@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@201@01)
        (not (= i@200@01 j@201@01)))))
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@200@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@201@01)
      (not (= i@200@01 j@201@01))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@200@01 Int) (j@201@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@200@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@200@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@201@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@201@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@200@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@200@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@200@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@201@01)
          (not (= i@200@01 j@201@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@200@01)
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@201@01)
        (not (= i@200@01 j@201@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@200@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@201@01)
            (not (= i@200@01 j@201@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@200@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@201@01)
          (not (= i@200@01 j@201@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@200@01) (Seq_contains
    (Seq_range 0 (Seq_length xs3@63@01))
    j@201@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs3@63@01)) i@200@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs3@63@01))
    j@201@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@16@12@16@98-aux|)))
(assert (forall ((i@200@01 Int) (j@201@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@200@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@200@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@201@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@201@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@200@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@200@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@200@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@201@01)
          (not (= i@200@01 j@201@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@200@01)
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@201@01)
        (not (= i@200@01 j@201@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@200@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@201@01)
            (not (= i@200@01 j@201@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@200@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@201@01)
          (not (= i@200@01 j@201@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs3@63@01)) i@200@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs3@63@01))
    j@201@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@16@12@16@98-aux|)))
(assert (forall ((i@200@01 Int) (j@201@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@200@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@200@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@201@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@201@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@200@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@200@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@200@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@201@01)
          (not (= i@200@01 j@201@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@200@01)
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@201@01)
        (not (= i@200@01 j@201@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@200@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@201@01)
            (not (= i@200@01 j@201@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@200@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@201@01)
          (not (= i@200@01 j@201@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@200@01) (Seq_index
    xs3@63@01
    j@201@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs3@63@01)) i@200@01) (Seq_index
    xs3@63@01
    j@201@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@16@12@16@98-aux|)))
(assert (forall ((i@200@01 Int) (j@201@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@200@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@200@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@201@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@201@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@200@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@200@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@200@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@201@01)
          (not (= i@200@01 j@201@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@200@01)
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@201@01)
        (not (= i@200@01 j@201@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@200@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@201@01)
            (not (= i@200@01 j@201@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@200@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@201@01)
          (not (= i@200@01 j@201@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs3@63@01)) i@200@01) (Seq_index
    xs3@63@01
    j@201@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@16@12@16@98-aux|)))
(assert (forall ((i@200@01 Int) (j@201@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@200@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@200@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@201@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@201@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@200@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@200@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@200@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@201@01)
          (not (= i@200@01 j@201@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@200@01)
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@201@01)
        (not (= i@200@01 j@201@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@200@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@201@01)
            (not (= i@200@01 j@201@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@200@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@201@01)
          (not (= i@200@01 j@201@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@201@01) (Seq_index
    xs3@63@01
    i@200@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs3@63@01)) j@201@01) (Seq_index
    xs3@63@01
    i@200@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@16@12@16@98-aux|)))
(assert (forall ((i@200@01 Int) (j@201@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@200@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@200@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@201@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@201@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@200@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@200@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@200@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@201@01)
          (not (= i@200@01 j@201@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@200@01)
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@201@01)
        (not (= i@200@01 j@201@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@200@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@201@01)
            (not (= i@200@01 j@201@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@200@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@201@01)
          (not (= i@200@01 j@201@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs3@63@01)) j@201@01) (Seq_index
    xs3@63@01
    i@200@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@16@12@16@98-aux|)))
(assert (forall ((i@200@01 Int) (j@201@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@200@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@200@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@201@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@201@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@200@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@200@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@200@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@201@01)
          (not (= i@200@01 j@201@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@200@01)
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@201@01)
        (not (= i@200@01 j@201@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@200@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@201@01)
            (not (= i@200@01 j@201@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@200@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@201@01)
          (not (= i@200@01 j@201@01))))))
  :pattern ((Seq_index xs3@63@01 i@200@01) (Seq_index xs3@63@01 j@201@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@16@12@16@98-aux|)))
(push) ; 3
(assert (not (forall ((i@200@01 Int) (j@201@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@200@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@201@01)
        (not (= i@200@01 j@201@01))))
    (not (= (Seq_index xs3@63@01 i@200@01) (Seq_index xs3@63@01 j@201@01))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@200@01) (Seq_contains
    (Seq_range 0 (Seq_length xs3@63@01))
    j@201@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs3@63@01)) i@200@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs3@63@01))
    j@201@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs3@63@01)) i@200@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs3@63@01))
    j@201@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@200@01) (Seq_index
    xs3@63@01
    j@201@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs3@63@01)) i@200@01) (Seq_index
    xs3@63@01
    j@201@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs3@63@01)) i@200@01) (Seq_index
    xs3@63@01
    j@201@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@201@01) (Seq_index
    xs3@63@01
    i@200@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs3@63@01)) j@201@01) (Seq_index
    xs3@63@01
    i@200@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs3@63@01)) j@201@01) (Seq_index
    xs3@63@01
    i@200@01))
  :pattern ((Seq_index xs3@63@01 i@200@01) (Seq_index xs3@63@01 j@201@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@16@12@16@98|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@200@01 Int) (j@201@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@200@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@201@01)
        (not (= i@200@01 j@201@01))))
    (not (= (Seq_index xs3@63@01 i@200@01) (Seq_index xs3@63@01 j@201@01))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@200@01) (Seq_contains
    (Seq_range 0 (Seq_length xs3@63@01))
    j@201@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs3@63@01)) i@200@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs3@63@01))
    j@201@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@200@01) (Seq_index
    xs3@63@01
    j@201@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs3@63@01)) i@200@01) (Seq_index
    xs3@63@01
    j@201@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@201@01) (Seq_index
    xs3@63@01
    i@200@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs3@63@01)) j@201@01) (Seq_index
    xs3@63@01
    i@200@01))
  :pattern ((Seq_index xs3@63@01 i@200@01) (Seq_index xs3@63@01 j@201@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@16@12@16@98|)))
(declare-const i@202@01 Int)
(push) ; 3
; [eval] (i in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(assert (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@202@01))
; [eval] xs[i]
(push) ; 4
(assert (not (>= i@202@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@202@01 (Seq_length xs3@63@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@203@01 ($Ref) Int)
(declare-fun img@204@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@202@01 Int) (i2@202@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i1@202@01)
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i2@202@01)
      (= (Seq_index xs3@63@01 i1@202@01) (Seq_index xs3@63@01 i2@202@01)))
    (= i1@202@01 i2@202@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@202@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@202@01)
    (and
      (= (inv@203@01 (Seq_index xs3@63@01 i@202@01)) i@202@01)
      (img@204@01 (Seq_index xs3@63@01 i@202@01))))
  :pattern ((Seq_index xs3@63@01 i@202@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@204@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@203@01 r)))
    (= (Seq_index xs3@63@01 (inv@203@01 r)) r))
  :pattern ((inv@203@01 r))
  :qid |f-fctOfInv|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((i@202@01 Int)) (!
  (= (Seq_index xs3@63@01 i@202@01) (Seq_index xs2@62@01 i@202@01))
  
  :qid |quant-u-149|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((i@202@01 Int)) (!
  (= (Seq_index xs3@63@01 i@202@01) (Seq_index xs2@62@01 i@202@01))
  
  :qid |quant-u-150|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((i@202@01 Int)) (!
  (= (Seq_index xs3@63@01 i@202@01) (Seq_index xs1@61@01 i@202@01))
  
  :qid |quant-u-151|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@205@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@203@01 r))
      (img@204@01 r)
      (= r (Seq_index xs3@63@01 (inv@203@01 r))))
    ($Perm.min
      (ite
        (and
          (img@133@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@132@01 r)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (/ (to_real 1) (to_real 3)))
    $Perm.No))
(define-fun pTaken@206@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@203@01 r))
      (img@204@01 r)
      (= r (Seq_index xs3@63@01 (inv@203@01 r))))
    ($Perm.min
      (ite
        (and
          (img@130@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@129@01 r)))
        (- (/ (to_real 1) (to_real 2)) (pTaken@164@01 r))
        $Perm.No)
      (- (/ (to_real 1) (to_real 3)) (pTaken@205@01 r)))
    $Perm.No))
(define-fun pTaken@207@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@203@01 r))
      (img@204@01 r)
      (= r (Seq_index xs3@63@01 (inv@203@01 r))))
    ($Perm.min
      (ite
        (and
          (img@111@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@110@01 r)))
        (/ (to_real 1) (to_real 4))
        $Perm.No)
      (- (- (/ (to_real 1) (to_real 3)) (pTaken@205@01 r)) (pTaken@206@01 r)))
    $Perm.No))
(define-fun pTaken@208@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@203@01 r))
      (img@204@01 r)
      (= r (Seq_index xs3@63@01 (inv@203@01 r))))
    ($Perm.min
      (ite
        (and
          (img@114@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@113@01 r)))
        (/ (to_real 1) (to_real 4))
        $Perm.No)
      (-
        (- (- (/ (to_real 1) (to_real 3)) (pTaken@205@01 r)) (pTaken@206@01 r))
        (pTaken@207@01 r)))
    $Perm.No))
(define-fun pTaken@209@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@203@01 r))
      (img@204@01 r)
      (= r (Seq_index xs3@63@01 (inv@203@01 r))))
    ($Perm.min
      (ite
        (and
          (img@187@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@186@01 r)))
        (/ (to_real 1) (to_real 4))
        $Perm.No)
      (-
        (-
          (- (- (/ (to_real 1) (to_real 3)) (pTaken@205@01 r)) (pTaken@206@01 r))
          (pTaken@207@01 r))
        (pTaken@208@01 r)))
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
          (img@133@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@132@01 r)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@205@01 r))
    $Perm.No)
  
  :qid |quant-u-153|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@205@01 r) $Perm.No)
  
  :qid |quant-u-154|))))
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
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@203@01 r))
      (img@204@01 r)
      (= r (Seq_index xs3@63@01 (inv@203@01 r))))
    (= (- (/ (to_real 1) (to_real 3)) (pTaken@205@01 r)) $Perm.No))
  
  :qid |quant-u-155|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@210@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@111@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@110@01 r)))
    (=
      ($FVF.lookup_f (as sm@210@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@108@01)) r)))
  :pattern (($FVF.lookup_f (as sm@210@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@108@01)) r))
  :qid |qp.fvfValDef45|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@114@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@113@01 r)))
    (=
      ($FVF.lookup_f (as sm@210@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@108@01)) r)))
  :pattern (($FVF.lookup_f (as sm@210@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@108@01)) r))
  :qid |qp.fvfValDef46|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@133@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@132@01 r)))
    (=
      ($FVF.lookup_f (as sm@210@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@127@01)) r)))
  :pattern (($FVF.lookup_f (as sm@210@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@127@01)) r))
  :qid |qp.fvfValDef47|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@130@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@129@01 r)))
      (< $Perm.No (- (/ (to_real 1) (to_real 2)) (pTaken@164@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@210@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@127@01)) r)))
  :pattern (($FVF.lookup_f (as sm@210@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@127@01)) r))
  :qid |qp.fvfValDef48|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@187@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@186@01 r)))
    (=
      ($FVF.lookup_f (as sm@210@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@181@01)) r)))
  :pattern (($FVF.lookup_f (as sm@210@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@181@01)) r))
  :qid |qp.fvfValDef49|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; split(xs2, 1 / 2, 1 / 4)
; [eval] p == 2 * q
; [eval] 2 * q
; [eval] p >= none
; [eval] (forall i: Int, j: Int :: { (i in [0..|xs|)), (j in [0..|xs|)) } { (i in [0..|xs|)), xs[j] } { (j in [0..|xs|)), xs[i] } { xs[i], xs[j] } (i in [0..|xs|)) && ((j in [0..|xs|)) && i != j) ==> xs[i] != xs[j])
(declare-const i@211@01 Int)
(declare-const j@212@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (i in [0..|xs|)) && ((j in [0..|xs|)) && i != j) ==> xs[i] != xs[j]
; [eval] (i in [0..|xs|)) && ((j in [0..|xs|)) && i != j)
; [eval] (i in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(push) ; 4
; [then-branch: 51 | !(i@211@01 in [0..|xs2@62@01|]) | live]
; [else-branch: 51 | i@211@01 in [0..|xs2@62@01|] | live]
(push) ; 5
; [then-branch: 51 | !(i@211@01 in [0..|xs2@62@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@211@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 51 | i@211@01 in [0..|xs2@62@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@211@01))
; [eval] (j in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(push) ; 6
; [then-branch: 52 | !(j@212@01 in [0..|xs2@62@01|]) | live]
; [else-branch: 52 | j@212@01 in [0..|xs2@62@01|] | live]
(push) ; 7
; [then-branch: 52 | !(j@212@01 in [0..|xs2@62@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@212@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 52 | j@212@01 in [0..|xs2@62@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@212@01))
; [eval] i != j
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@212@01)
  (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@212@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@211@01)
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@211@01)
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@212@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@212@01))))))
(assert (or
  (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@211@01)
  (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@211@01))))
(push) ; 4
; [then-branch: 53 | i@211@01 in [0..|xs2@62@01|] && j@212@01 in [0..|xs2@62@01|] && i@211@01 != j@212@01 | live]
; [else-branch: 53 | !(i@211@01 in [0..|xs2@62@01|] && j@212@01 in [0..|xs2@62@01|] && i@211@01 != j@212@01) | live]
(push) ; 5
; [then-branch: 53 | i@211@01 in [0..|xs2@62@01|] && j@212@01 in [0..|xs2@62@01|] && i@211@01 != j@212@01]
(assert (and
  (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@211@01)
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@212@01)
    (not (= i@211@01 j@212@01)))))
; [eval] xs[i] != xs[j]
; [eval] xs[i]
(push) ; 6
(assert (not (>= i@211@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@211@01 (Seq_length xs2@62@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] xs[j]
(push) ; 6
(assert (not (>= j@212@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< j@212@01 (Seq_length xs2@62@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 53 | !(i@211@01 in [0..|xs2@62@01|] && j@212@01 in [0..|xs2@62@01|] && i@211@01 != j@212@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@211@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@212@01)
      (not (= i@211@01 j@212@01))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@211@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@212@01)
      (not (= i@211@01 j@212@01))))
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@211@01)
    (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@212@01)
    (not (= i@211@01 j@212@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@211@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@212@01)
        (not (= i@211@01 j@212@01)))))
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@211@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@212@01)
      (not (= i@211@01 j@212@01))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@211@01 Int) (j@212@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@211@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@211@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@212@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@212@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@211@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@211@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@211@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@212@01)
          (not (= i@211@01 j@212@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@211@01)
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@212@01)
        (not (= i@211@01 j@212@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@211@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@212@01)
            (not (= i@211@01 j@212@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@211@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@212@01)
          (not (= i@211@01 j@212@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@211@01) (Seq_contains
    (Seq_range 0 (Seq_length xs2@62@01))
    j@212@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs2@62@01)) i@211@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs2@62@01))
    j@212@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@23@12@23@98-aux|)))
(assert (forall ((i@211@01 Int) (j@212@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@211@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@211@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@212@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@212@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@211@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@211@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@211@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@212@01)
          (not (= i@211@01 j@212@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@211@01)
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@212@01)
        (not (= i@211@01 j@212@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@211@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@212@01)
            (not (= i@211@01 j@212@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@211@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@212@01)
          (not (= i@211@01 j@212@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs2@62@01)) i@211@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs2@62@01))
    j@212@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@23@12@23@98-aux|)))
(assert (forall ((i@211@01 Int) (j@212@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@211@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@211@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@212@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@212@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@211@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@211@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@211@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@212@01)
          (not (= i@211@01 j@212@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@211@01)
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@212@01)
        (not (= i@211@01 j@212@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@211@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@212@01)
            (not (= i@211@01 j@212@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@211@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@212@01)
          (not (= i@211@01 j@212@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@211@01) (Seq_index
    xs2@62@01
    j@212@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs2@62@01)) i@211@01) (Seq_index
    xs2@62@01
    j@212@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@23@12@23@98-aux|)))
(assert (forall ((i@211@01 Int) (j@212@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@211@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@211@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@212@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@212@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@211@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@211@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@211@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@212@01)
          (not (= i@211@01 j@212@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@211@01)
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@212@01)
        (not (= i@211@01 j@212@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@211@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@212@01)
            (not (= i@211@01 j@212@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@211@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@212@01)
          (not (= i@211@01 j@212@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs2@62@01)) i@211@01) (Seq_index
    xs2@62@01
    j@212@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@23@12@23@98-aux|)))
(assert (forall ((i@211@01 Int) (j@212@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@211@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@211@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@212@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@212@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@211@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@211@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@211@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@212@01)
          (not (= i@211@01 j@212@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@211@01)
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@212@01)
        (not (= i@211@01 j@212@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@211@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@212@01)
            (not (= i@211@01 j@212@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@211@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@212@01)
          (not (= i@211@01 j@212@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@212@01) (Seq_index
    xs2@62@01
    i@211@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs2@62@01)) j@212@01) (Seq_index
    xs2@62@01
    i@211@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@23@12@23@98-aux|)))
(assert (forall ((i@211@01 Int) (j@212@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@211@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@211@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@212@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@212@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@211@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@211@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@211@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@212@01)
          (not (= i@211@01 j@212@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@211@01)
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@212@01)
        (not (= i@211@01 j@212@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@211@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@212@01)
            (not (= i@211@01 j@212@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@211@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@212@01)
          (not (= i@211@01 j@212@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs2@62@01)) j@212@01) (Seq_index
    xs2@62@01
    i@211@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@23@12@23@98-aux|)))
(assert (forall ((i@211@01 Int) (j@212@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@211@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@211@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@212@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@212@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@211@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@211@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@211@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@212@01)
          (not (= i@211@01 j@212@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@211@01)
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@212@01)
        (not (= i@211@01 j@212@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@211@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@212@01)
            (not (= i@211@01 j@212@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@211@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@212@01)
          (not (= i@211@01 j@212@01))))))
  :pattern ((Seq_index xs2@62@01 i@211@01) (Seq_index xs2@62@01 j@212@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@23@12@23@98-aux|)))
(push) ; 3
(assert (not (forall ((i@211@01 Int) (j@212@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@211@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@212@01)
        (not (= i@211@01 j@212@01))))
    (not (= (Seq_index xs2@62@01 i@211@01) (Seq_index xs2@62@01 j@212@01))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@211@01) (Seq_contains
    (Seq_range 0 (Seq_length xs2@62@01))
    j@212@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs2@62@01)) i@211@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs2@62@01))
    j@212@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs2@62@01)) i@211@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs2@62@01))
    j@212@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@211@01) (Seq_index
    xs2@62@01
    j@212@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs2@62@01)) i@211@01) (Seq_index
    xs2@62@01
    j@212@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs2@62@01)) i@211@01) (Seq_index
    xs2@62@01
    j@212@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@212@01) (Seq_index
    xs2@62@01
    i@211@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs2@62@01)) j@212@01) (Seq_index
    xs2@62@01
    i@211@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs2@62@01)) j@212@01) (Seq_index
    xs2@62@01
    i@211@01))
  :pattern ((Seq_index xs2@62@01 i@211@01) (Seq_index xs2@62@01 j@212@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@23@12@23@98|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@211@01 Int) (j@212@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@211@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@212@01)
        (not (= i@211@01 j@212@01))))
    (not (= (Seq_index xs2@62@01 i@211@01) (Seq_index xs2@62@01 j@212@01))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@211@01) (Seq_contains
    (Seq_range 0 (Seq_length xs2@62@01))
    j@212@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs2@62@01)) i@211@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs2@62@01))
    j@212@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@211@01) (Seq_index
    xs2@62@01
    j@212@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs2@62@01)) i@211@01) (Seq_index
    xs2@62@01
    j@212@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@212@01) (Seq_index
    xs2@62@01
    i@211@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs2@62@01)) j@212@01) (Seq_index
    xs2@62@01
    i@211@01))
  :pattern ((Seq_index xs2@62@01 i@211@01) (Seq_index xs2@62@01 j@212@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@23@12@23@98|)))
(declare-const i@213@01 Int)
(push) ; 3
; [eval] (i in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(assert (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@213@01))
; [eval] xs[i]
(push) ; 4
(assert (not (>= i@213@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@213@01 (Seq_length xs2@62@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@214@01 ($Ref) Int)
(declare-fun img@215@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@213@01 Int) (i2@213@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i1@213@01)
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i2@213@01)
      (= (Seq_index xs2@62@01 i1@213@01) (Seq_index xs2@62@01 i2@213@01)))
    (= i1@213@01 i2@213@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@213@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@213@01)
    (and
      (= (inv@214@01 (Seq_index xs2@62@01 i@213@01)) i@213@01)
      (img@215@01 (Seq_index xs2@62@01 i@213@01))))
  :pattern ((Seq_index xs2@62@01 i@213@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@215@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@214@01 r)))
    (= (Seq_index xs2@62@01 (inv@214@01 r)) r))
  :pattern ((inv@214@01 r))
  :qid |f-fctOfInv|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((i@213@01 Int)) (!
  (= (Seq_index xs2@62@01 i@213@01) (Seq_index xs1@61@01 i@213@01))
  
  :qid |quant-u-157|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((i@213@01 Int)) (!
  (= (Seq_index xs2@62@01 i@213@01) (Seq_index xs3@63@01 i@213@01))
  
  :qid |quant-u-158|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((i@213@01 Int)) (!
  (= (Seq_index xs2@62@01 i@213@01) (Seq_index xs3@63@01 i@213@01))
  
  :qid |quant-u-159|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@216@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@214@01 r))
      (img@215@01 r)
      (= r (Seq_index xs2@62@01 (inv@214@01 r))))
    ($Perm.min
      (ite
        (and
          (img@114@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@113@01 r)))
        (/ (to_real 1) (to_real 4))
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
(define-fun pTaken@217@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@214@01 r))
      (img@215@01 r)
      (= r (Seq_index xs2@62@01 (inv@214@01 r))))
    ($Perm.min
      (ite
        (and
          (img@111@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@110@01 r)))
        (/ (to_real 1) (to_real 4))
        $Perm.No)
      (- (/ (to_real 1) (to_real 2)) (pTaken@216@01 r)))
    $Perm.No))
(define-fun pTaken@218@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@214@01 r))
      (img@215@01 r)
      (= r (Seq_index xs2@62@01 (inv@214@01 r))))
    ($Perm.min
      (ite
        (and
          (img@187@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@186@01 r)))
        (/ (to_real 1) (to_real 4))
        $Perm.No)
      (- (- (/ (to_real 1) (to_real 2)) (pTaken@216@01 r)) (pTaken@217@01 r)))
    $Perm.No))
(define-fun pTaken@219@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@214@01 r))
      (img@215@01 r)
      (= r (Seq_index xs2@62@01 (inv@214@01 r))))
    ($Perm.min
      (ite
        (and
          (img@130@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@129@01 r)))
        (- (/ (to_real 1) (to_real 2)) (pTaken@164@01 r))
        $Perm.No)
      (-
        (- (- (/ (to_real 1) (to_real 2)) (pTaken@216@01 r)) (pTaken@217@01 r))
        (pTaken@218@01 r)))
    $Perm.No))
(define-fun pTaken@220@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@214@01 r))
      (img@215@01 r)
      (= r (Seq_index xs2@62@01 (inv@214@01 r))))
    ($Perm.min
      (ite
        (and
          (img@133@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@132@01 r)))
        (- (/ (to_real 1) (to_real 2)) (pTaken@205@01 r))
        $Perm.No)
      (-
        (-
          (- (- (/ (to_real 1) (to_real 2)) (pTaken@216@01 r)) (pTaken@217@01 r))
          (pTaken@218@01 r))
        (pTaken@219@01 r)))
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
          (img@114@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@113@01 r)))
        (/ (to_real 1) (to_real 4))
        $Perm.No)
      (pTaken@216@01 r))
    $Perm.No)
  
  :qid |quant-u-161|))))
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
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@214@01 r))
      (img@215@01 r)
      (= r (Seq_index xs2@62@01 (inv@214@01 r))))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@216@01 r)) $Perm.No))
  
  :qid |quant-u-162|))))
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
        (and
          (img@111@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@110@01 r)))
        (/ (to_real 1) (to_real 4))
        $Perm.No)
      (pTaken@217@01 r))
    $Perm.No)
  
  :qid |quant-u-163|))))
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
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@214@01 r))
      (img@215@01 r)
      (= r (Seq_index xs2@62@01 (inv@214@01 r))))
    (=
      (- (- (/ (to_real 1) (to_real 2)) (pTaken@216@01 r)) (pTaken@217@01 r))
      $Perm.No))
  
  :qid |quant-u-164|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@221@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@187@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@186@01 r)))
    (=
      ($FVF.lookup_f (as sm@221@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@181@01)) r)))
  :pattern (($FVF.lookup_f (as sm@221@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@181@01)) r))
  :qid |qp.fvfValDef50|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@114@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@113@01 r)))
    (=
      ($FVF.lookup_f (as sm@221@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@108@01)) r)))
  :pattern (($FVF.lookup_f (as sm@221@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@108@01)) r))
  :qid |qp.fvfValDef51|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@111@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@110@01 r)))
    (=
      ($FVF.lookup_f (as sm@221@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@108@01)) r)))
  :pattern (($FVF.lookup_f (as sm@221@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@108@01)) r))
  :qid |qp.fvfValDef52|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@130@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@129@01 r)))
      (< $Perm.No (- (/ (to_real 1) (to_real 2)) (pTaken@164@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@221@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@127@01)) r)))
  :pattern (($FVF.lookup_f (as sm@221@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@127@01)) r))
  :qid |qp.fvfValDef53|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@133@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@132@01 r)))
      (< $Perm.No (- (/ (to_real 1) (to_real 2)) (pTaken@205@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@221@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@127@01)) r)))
  :pattern (($FVF.lookup_f (as sm@221@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@127@01)) r))
  :qid |qp.fvfValDef54|)))
(declare-const $t@222@01 $Snap)
(assert (= $t@222@01 ($Snap.combine ($Snap.first $t@222@01) ($Snap.second $t@222@01))))
(declare-const i@223@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (i in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(assert (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@223@01))
; [eval] xs[i]
(push) ; 4
(assert (not (>= i@223@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@223@01 (Seq_length xs2@62@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@224@01 ($Ref) Int)
(declare-fun img@225@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@223@01 Int) (i2@223@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i1@223@01)
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i2@223@01)
      (= (Seq_index xs2@62@01 i1@223@01) (Seq_index xs2@62@01 i2@223@01)))
    (= i1@223@01 i2@223@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@223@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@223@01)
    (and
      (= (inv@224@01 (Seq_index xs2@62@01 i@223@01)) i@223@01)
      (img@225@01 (Seq_index xs2@62@01 i@223@01))))
  :pattern ((Seq_index xs2@62@01 i@223@01))
  :qid |quant-u-166|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@225@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@224@01 r)))
    (= (Seq_index xs2@62@01 (inv@224@01 r)) r))
  :pattern ((inv@224@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@223@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@223@01)
    (not (= (Seq_index xs2@62@01 i@223@01) $Ref.null)))
  :pattern ((Seq_index xs2@62@01 i@223@01))
  :qid |f-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs2@62@01 i@223@01) (Seq_index xs1@61@01 i@185@01))
    (=
      (and
        (img@225@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@224@01 r)))
      (and
        (img@187@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@186@01 r)))))
  
  :qid |quant-u-167|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs2@62@01 i@223@01) (Seq_index xs3@63@01 i@128@01))
    (=
      (and
        (img@225@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@224@01 r)))
      (and
        (img@130@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@129@01 r)))))
  
  :qid |quant-u-168|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs2@62@01 i@223@01) (Seq_index xs3@63@01 i@131@01))
    (=
      (and
        (img@225@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@224@01 r)))
      (and
        (img@133@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@132@01 r)))))
  
  :qid |quant-u-169|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const i@226@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (i in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(assert (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@226@01))
; [eval] xs[i]
(push) ; 4
(assert (not (>= i@226@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@226@01 (Seq_length xs2@62@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@227@01 ($Ref) Int)
(declare-fun img@228@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@226@01 Int) (i2@226@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i1@226@01)
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i2@226@01)
      (= (Seq_index xs2@62@01 i1@226@01) (Seq_index xs2@62@01 i2@226@01)))
    (= i1@226@01 i2@226@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@226@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@226@01)
    (and
      (= (inv@227@01 (Seq_index xs2@62@01 i@226@01)) i@226@01)
      (img@228@01 (Seq_index xs2@62@01 i@226@01))))
  :pattern ((Seq_index xs2@62@01 i@226@01))
  :qid |quant-u-171|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@228@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@227@01 r)))
    (= (Seq_index xs2@62@01 (inv@227@01 r)) r))
  :pattern ((inv@227@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@226@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@226@01)
    (not (= (Seq_index xs2@62@01 i@226@01) $Ref.null)))
  :pattern ((Seq_index xs2@62@01 i@226@01))
  :qid |f-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs2@62@01 i@226@01) (Seq_index xs2@62@01 i@223@01))
    (=
      (and
        (img@228@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@227@01 r)))
      (and
        (img@225@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@224@01 r)))))
  
  :qid |quant-u-172|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs2@62@01 i@226@01) (Seq_index xs1@61@01 i@185@01))
    (=
      (and
        (img@228@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@227@01 r)))
      (and
        (img@187@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@186@01 r)))))
  
  :qid |quant-u-173|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs2@62@01 i@226@01) (Seq_index xs3@63@01 i@128@01))
    (=
      (and
        (img@228@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@227@01 r)))
      (and
        (img@130@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@129@01 r)))))
  
  :qid |quant-u-174|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs2@62@01 i@226@01) (Seq_index xs3@63@01 i@131@01))
    (=
      (and
        (img@228@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@227@01 r)))
      (and
        (img@133@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@132@01 r)))))
  
  :qid |quant-u-175|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; leak(xs1, 1 / 4)
; [eval] p >= none
; [eval] (forall i: Int, j: Int :: { (i in [0..|xs|)), (j in [0..|xs|)) } { (i in [0..|xs|)), xs[j] } { (j in [0..|xs|)), xs[i] } { xs[i], xs[j] } (i in [0..|xs|)) && ((j in [0..|xs|)) && i != j) ==> xs[i] != xs[j])
(declare-const i@229@01 Int)
(declare-const j@230@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (i in [0..|xs|)) && ((j in [0..|xs|)) && i != j) ==> xs[i] != xs[j]
; [eval] (i in [0..|xs|)) && ((j in [0..|xs|)) && i != j)
; [eval] (i in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(push) ; 4
; [then-branch: 54 | !(i@229@01 in [0..|xs1@61@01|]) | live]
; [else-branch: 54 | i@229@01 in [0..|xs1@61@01|] | live]
(push) ; 5
; [then-branch: 54 | !(i@229@01 in [0..|xs1@61@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@229@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 54 | i@229@01 in [0..|xs1@61@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@229@01))
; [eval] (j in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(push) ; 6
; [then-branch: 55 | !(j@230@01 in [0..|xs1@61@01|]) | live]
; [else-branch: 55 | j@230@01 in [0..|xs1@61@01|] | live]
(push) ; 7
; [then-branch: 55 | !(j@230@01 in [0..|xs1@61@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@230@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 55 | j@230@01 in [0..|xs1@61@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@230@01))
; [eval] i != j
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@230@01)
  (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@230@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@229@01)
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@229@01)
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@230@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@230@01))))))
(assert (or
  (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@229@01)
  (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@229@01))))
(push) ; 4
; [then-branch: 56 | i@229@01 in [0..|xs1@61@01|] && j@230@01 in [0..|xs1@61@01|] && i@229@01 != j@230@01 | live]
; [else-branch: 56 | !(i@229@01 in [0..|xs1@61@01|] && j@230@01 in [0..|xs1@61@01|] && i@229@01 != j@230@01) | live]
(push) ; 5
; [then-branch: 56 | i@229@01 in [0..|xs1@61@01|] && j@230@01 in [0..|xs1@61@01|] && i@229@01 != j@230@01]
(assert (and
  (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@229@01)
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@230@01)
    (not (= i@229@01 j@230@01)))))
; [eval] xs[i] != xs[j]
; [eval] xs[i]
(push) ; 6
(assert (not (>= i@229@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@229@01 (Seq_length xs1@61@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] xs[j]
(push) ; 6
(assert (not (>= j@230@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< j@230@01 (Seq_length xs1@61@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 56 | !(i@229@01 in [0..|xs1@61@01|] && j@230@01 in [0..|xs1@61@01|] && i@229@01 != j@230@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@229@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@230@01)
      (not (= i@229@01 j@230@01))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@229@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@230@01)
      (not (= i@229@01 j@230@01))))
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@229@01)
    (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@230@01)
    (not (= i@229@01 j@230@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@229@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@230@01)
        (not (= i@229@01 j@230@01)))))
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@229@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@230@01)
      (not (= i@229@01 j@230@01))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@229@01 Int) (j@230@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@229@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@229@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@230@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@230@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@229@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@229@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@229@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@230@01)
          (not (= i@229@01 j@230@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@229@01)
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@230@01)
        (not (= i@229@01 j@230@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@229@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@230@01)
            (not (= i@229@01 j@230@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@229@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@230@01)
          (not (= i@229@01 j@230@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@229@01) (Seq_contains
    (Seq_range 0 (Seq_length xs1@61@01))
    j@230@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) i@229@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs1@61@01))
    j@230@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@16@12@16@98-aux|)))
(assert (forall ((i@229@01 Int) (j@230@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@229@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@229@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@230@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@230@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@229@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@229@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@229@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@230@01)
          (not (= i@229@01 j@230@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@229@01)
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@230@01)
        (not (= i@229@01 j@230@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@229@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@230@01)
            (not (= i@229@01 j@230@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@229@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@230@01)
          (not (= i@229@01 j@230@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) i@229@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs1@61@01))
    j@230@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@16@12@16@98-aux|)))
(assert (forall ((i@229@01 Int) (j@230@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@229@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@229@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@230@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@230@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@229@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@229@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@229@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@230@01)
          (not (= i@229@01 j@230@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@229@01)
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@230@01)
        (not (= i@229@01 j@230@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@229@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@230@01)
            (not (= i@229@01 j@230@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@229@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@230@01)
          (not (= i@229@01 j@230@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@229@01) (Seq_index
    xs1@61@01
    j@230@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) i@229@01) (Seq_index
    xs1@61@01
    j@230@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@16@12@16@98-aux|)))
(assert (forall ((i@229@01 Int) (j@230@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@229@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@229@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@230@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@230@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@229@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@229@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@229@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@230@01)
          (not (= i@229@01 j@230@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@229@01)
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@230@01)
        (not (= i@229@01 j@230@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@229@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@230@01)
            (not (= i@229@01 j@230@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@229@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@230@01)
          (not (= i@229@01 j@230@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) i@229@01) (Seq_index
    xs1@61@01
    j@230@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@16@12@16@98-aux|)))
(assert (forall ((i@229@01 Int) (j@230@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@229@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@229@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@230@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@230@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@229@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@229@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@229@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@230@01)
          (not (= i@229@01 j@230@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@229@01)
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@230@01)
        (not (= i@229@01 j@230@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@229@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@230@01)
            (not (= i@229@01 j@230@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@229@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@230@01)
          (not (= i@229@01 j@230@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@230@01) (Seq_index
    xs1@61@01
    i@229@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) j@230@01) (Seq_index
    xs1@61@01
    i@229@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@16@12@16@98-aux|)))
(assert (forall ((i@229@01 Int) (j@230@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@229@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@229@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@230@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@230@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@229@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@229@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@229@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@230@01)
          (not (= i@229@01 j@230@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@229@01)
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@230@01)
        (not (= i@229@01 j@230@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@229@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@230@01)
            (not (= i@229@01 j@230@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@229@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@230@01)
          (not (= i@229@01 j@230@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) j@230@01) (Seq_index
    xs1@61@01
    i@229@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@16@12@16@98-aux|)))
(assert (forall ((i@229@01 Int) (j@230@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@229@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@229@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@230@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@230@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@229@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@229@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@229@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@230@01)
          (not (= i@229@01 j@230@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@229@01)
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@230@01)
        (not (= i@229@01 j@230@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@229@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@230@01)
            (not (= i@229@01 j@230@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@229@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@230@01)
          (not (= i@229@01 j@230@01))))))
  :pattern ((Seq_index xs1@61@01 i@229@01) (Seq_index xs1@61@01 j@230@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@16@12@16@98-aux|)))
(push) ; 3
(assert (not (forall ((i@229@01 Int) (j@230@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@229@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@230@01)
        (not (= i@229@01 j@230@01))))
    (not (= (Seq_index xs1@61@01 i@229@01) (Seq_index xs1@61@01 j@230@01))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@229@01) (Seq_contains
    (Seq_range 0 (Seq_length xs1@61@01))
    j@230@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) i@229@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs1@61@01))
    j@230@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) i@229@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs1@61@01))
    j@230@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@229@01) (Seq_index
    xs1@61@01
    j@230@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) i@229@01) (Seq_index
    xs1@61@01
    j@230@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) i@229@01) (Seq_index
    xs1@61@01
    j@230@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@230@01) (Seq_index
    xs1@61@01
    i@229@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) j@230@01) (Seq_index
    xs1@61@01
    i@229@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) j@230@01) (Seq_index
    xs1@61@01
    i@229@01))
  :pattern ((Seq_index xs1@61@01 i@229@01) (Seq_index xs1@61@01 j@230@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@16@12@16@98|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@229@01 Int) (j@230@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@229@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@230@01)
        (not (= i@229@01 j@230@01))))
    (not (= (Seq_index xs1@61@01 i@229@01) (Seq_index xs1@61@01 j@230@01))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@229@01) (Seq_contains
    (Seq_range 0 (Seq_length xs1@61@01))
    j@230@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) i@229@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs1@61@01))
    j@230@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@229@01) (Seq_index
    xs1@61@01
    j@230@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) i@229@01) (Seq_index
    xs1@61@01
    j@230@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) j@230@01) (Seq_index
    xs1@61@01
    i@229@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs1@61@01)) j@230@01) (Seq_index
    xs1@61@01
    i@229@01))
  :pattern ((Seq_index xs1@61@01 i@229@01) (Seq_index xs1@61@01 j@230@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@16@12@16@98|)))
(declare-const i@231@01 Int)
(push) ; 3
; [eval] (i in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(assert (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@231@01))
; [eval] xs[i]
(push) ; 4
(assert (not (>= i@231@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@231@01 (Seq_length xs1@61@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@232@01 ($Ref) Int)
(declare-fun img@233@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@231@01 Int) (i2@231@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i1@231@01)
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i2@231@01)
      (= (Seq_index xs1@61@01 i1@231@01) (Seq_index xs1@61@01 i2@231@01)))
    (= i1@231@01 i2@231@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@231@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) i@231@01)
    (and
      (= (inv@232@01 (Seq_index xs1@61@01 i@231@01)) i@231@01)
      (img@233@01 (Seq_index xs1@61@01 i@231@01))))
  :pattern ((Seq_index xs1@61@01 i@231@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@233@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@232@01 r)))
    (= (Seq_index xs1@61@01 (inv@232@01 r)) r))
  :pattern ((inv@232@01 r))
  :qid |f-fctOfInv|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((i@231@01 Int)) (!
  (= (Seq_index xs1@61@01 i@231@01) (Seq_index xs3@63@01 i@231@01))
  
  :qid |quant-u-177|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((i@231@01 Int)) (!
  (= (Seq_index xs1@61@01 i@231@01) (Seq_index xs3@63@01 i@231@01))
  
  :qid |quant-u-178|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((i@231@01 Int)) (!
  (= (Seq_index xs1@61@01 i@231@01) (Seq_index xs2@62@01 i@231@01))
  
  :qid |quant-u-179|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((i@231@01 Int)) (!
  (= (Seq_index xs1@61@01 i@231@01) (Seq_index xs2@62@01 i@231@01))
  
  :qid |quant-u-180|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@234@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@232@01 r))
      (img@233@01 r)
      (= r (Seq_index xs1@61@01 (inv@232@01 r))))
    ($Perm.min
      (ite
        (and
          (img@187@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@186@01 r)))
        (/ (to_real 1) (to_real 4))
        $Perm.No)
      (/ (to_real 1) (to_real 4)))
    $Perm.No))
(define-fun pTaken@235@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@232@01 r))
      (img@233@01 r)
      (= r (Seq_index xs1@61@01 (inv@232@01 r))))
    ($Perm.min
      (ite
        (and
          (img@133@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@132@01 r)))
        (- (/ (to_real 1) (to_real 2)) (pTaken@205@01 r))
        $Perm.No)
      (- (/ (to_real 1) (to_real 4)) (pTaken@234@01 r)))
    $Perm.No))
(define-fun pTaken@236@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@232@01 r))
      (img@233@01 r)
      (= r (Seq_index xs1@61@01 (inv@232@01 r))))
    ($Perm.min
      (ite
        (and
          (img@130@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@129@01 r)))
        (- (/ (to_real 1) (to_real 2)) (pTaken@164@01 r))
        $Perm.No)
      (- (- (/ (to_real 1) (to_real 4)) (pTaken@234@01 r)) (pTaken@235@01 r)))
    $Perm.No))
(define-fun pTaken@237@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@232@01 r))
      (img@233@01 r)
      (= r (Seq_index xs1@61@01 (inv@232@01 r))))
    ($Perm.min
      (ite
        (and
          (img@225@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@224@01 r)))
        (/ (to_real 1) (to_real 4))
        $Perm.No)
      (-
        (- (- (/ (to_real 1) (to_real 4)) (pTaken@234@01 r)) (pTaken@235@01 r))
        (pTaken@236@01 r)))
    $Perm.No))
(define-fun pTaken@238@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@232@01 r))
      (img@233@01 r)
      (= r (Seq_index xs1@61@01 (inv@232@01 r))))
    ($Perm.min
      (ite
        (and
          (img@228@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@227@01 r)))
        (/ (to_real 1) (to_real 4))
        $Perm.No)
      (-
        (-
          (- (- (/ (to_real 1) (to_real 4)) (pTaken@234@01 r)) (pTaken@235@01 r))
          (pTaken@236@01 r))
        (pTaken@237@01 r)))
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
          (img@187@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@186@01 r)))
        (/ (to_real 1) (to_real 4))
        $Perm.No)
      (pTaken@234@01 r))
    $Perm.No)
  
  :qid |quant-u-182|))))
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
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@232@01 r))
      (img@233@01 r)
      (= r (Seq_index xs1@61@01 (inv@232@01 r))))
    (= (- (/ (to_real 1) (to_real 4)) (pTaken@234@01 r)) $Perm.No))
  
  :qid |quant-u-183|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@239@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@133@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@132@01 r)))
      (< $Perm.No (- (/ (to_real 1) (to_real 2)) (pTaken@205@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@239@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@127@01)) r)))
  :pattern (($FVF.lookup_f (as sm@239@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@127@01)) r))
  :qid |qp.fvfValDef55|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@130@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@129@01 r)))
      (< $Perm.No (- (/ (to_real 1) (to_real 2)) (pTaken@164@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@239@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@127@01)) r)))
  :pattern (($FVF.lookup_f (as sm@239@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@127@01)) r))
  :qid |qp.fvfValDef56|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@187@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs1@61@01)) (inv@186@01 r)))
    (=
      ($FVF.lookup_f (as sm@239@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@181@01)) r)))
  :pattern (($FVF.lookup_f (as sm@239@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@181@01)) r))
  :qid |qp.fvfValDef57|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@225@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@224@01 r)))
    (=
      ($FVF.lookup_f (as sm@239@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@222@01)) r)))
  :pattern (($FVF.lookup_f (as sm@239@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@222@01)) r))
  :qid |qp.fvfValDef58|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@228@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@227@01 r)))
    (=
      ($FVF.lookup_f (as sm@239@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@222@01)) r)))
  :pattern (($FVF.lookup_f (as sm@239@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@222@01)) r))
  :qid |qp.fvfValDef59|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; leak(xs3, 1 / 3)
; [eval] p >= none
; [eval] (forall i: Int, j: Int :: { (i in [0..|xs|)), (j in [0..|xs|)) } { (i in [0..|xs|)), xs[j] } { (j in [0..|xs|)), xs[i] } { xs[i], xs[j] } (i in [0..|xs|)) && ((j in [0..|xs|)) && i != j) ==> xs[i] != xs[j])
(declare-const i@240@01 Int)
(declare-const j@241@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (i in [0..|xs|)) && ((j in [0..|xs|)) && i != j) ==> xs[i] != xs[j]
; [eval] (i in [0..|xs|)) && ((j in [0..|xs|)) && i != j)
; [eval] (i in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(push) ; 4
; [then-branch: 57 | !(i@240@01 in [0..|xs3@63@01|]) | live]
; [else-branch: 57 | i@240@01 in [0..|xs3@63@01|] | live]
(push) ; 5
; [then-branch: 57 | !(i@240@01 in [0..|xs3@63@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@240@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 57 | i@240@01 in [0..|xs3@63@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@240@01))
; [eval] (j in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(push) ; 6
; [then-branch: 58 | !(j@241@01 in [0..|xs3@63@01|]) | live]
; [else-branch: 58 | j@241@01 in [0..|xs3@63@01|] | live]
(push) ; 7
; [then-branch: 58 | !(j@241@01 in [0..|xs3@63@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@241@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 58 | j@241@01 in [0..|xs3@63@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@241@01))
; [eval] i != j
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@241@01)
  (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@241@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@240@01)
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@240@01)
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@241@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@241@01))))))
(assert (or
  (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@240@01)
  (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@240@01))))
(push) ; 4
; [then-branch: 59 | i@240@01 in [0..|xs3@63@01|] && j@241@01 in [0..|xs3@63@01|] && i@240@01 != j@241@01 | live]
; [else-branch: 59 | !(i@240@01 in [0..|xs3@63@01|] && j@241@01 in [0..|xs3@63@01|] && i@240@01 != j@241@01) | live]
(push) ; 5
; [then-branch: 59 | i@240@01 in [0..|xs3@63@01|] && j@241@01 in [0..|xs3@63@01|] && i@240@01 != j@241@01]
(assert (and
  (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@240@01)
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@241@01)
    (not (= i@240@01 j@241@01)))))
; [eval] xs[i] != xs[j]
; [eval] xs[i]
(push) ; 6
(assert (not (>= i@240@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@240@01 (Seq_length xs3@63@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] xs[j]
(push) ; 6
(assert (not (>= j@241@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< j@241@01 (Seq_length xs3@63@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 59 | !(i@240@01 in [0..|xs3@63@01|] && j@241@01 in [0..|xs3@63@01|] && i@240@01 != j@241@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@240@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@241@01)
      (not (= i@240@01 j@241@01))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@240@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@241@01)
      (not (= i@240@01 j@241@01))))
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@240@01)
    (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@241@01)
    (not (= i@240@01 j@241@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@240@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@241@01)
        (not (= i@240@01 j@241@01)))))
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@240@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@241@01)
      (not (= i@240@01 j@241@01))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@240@01 Int) (j@241@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@240@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@240@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@241@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@241@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@240@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@240@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@240@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@241@01)
          (not (= i@240@01 j@241@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@240@01)
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@241@01)
        (not (= i@240@01 j@241@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@240@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@241@01)
            (not (= i@240@01 j@241@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@240@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@241@01)
          (not (= i@240@01 j@241@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@240@01) (Seq_contains
    (Seq_range 0 (Seq_length xs3@63@01))
    j@241@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs3@63@01)) i@240@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs3@63@01))
    j@241@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@16@12@16@98-aux|)))
(assert (forall ((i@240@01 Int) (j@241@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@240@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@240@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@241@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@241@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@240@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@240@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@240@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@241@01)
          (not (= i@240@01 j@241@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@240@01)
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@241@01)
        (not (= i@240@01 j@241@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@240@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@241@01)
            (not (= i@240@01 j@241@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@240@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@241@01)
          (not (= i@240@01 j@241@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs3@63@01)) i@240@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs3@63@01))
    j@241@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@16@12@16@98-aux|)))
(assert (forall ((i@240@01 Int) (j@241@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@240@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@240@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@241@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@241@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@240@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@240@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@240@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@241@01)
          (not (= i@240@01 j@241@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@240@01)
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@241@01)
        (not (= i@240@01 j@241@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@240@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@241@01)
            (not (= i@240@01 j@241@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@240@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@241@01)
          (not (= i@240@01 j@241@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@240@01) (Seq_index
    xs3@63@01
    j@241@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs3@63@01)) i@240@01) (Seq_index
    xs3@63@01
    j@241@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@16@12@16@98-aux|)))
(assert (forall ((i@240@01 Int) (j@241@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@240@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@240@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@241@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@241@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@240@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@240@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@240@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@241@01)
          (not (= i@240@01 j@241@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@240@01)
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@241@01)
        (not (= i@240@01 j@241@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@240@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@241@01)
            (not (= i@240@01 j@241@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@240@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@241@01)
          (not (= i@240@01 j@241@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs3@63@01)) i@240@01) (Seq_index
    xs3@63@01
    j@241@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@16@12@16@98-aux|)))
(assert (forall ((i@240@01 Int) (j@241@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@240@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@240@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@241@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@241@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@240@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@240@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@240@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@241@01)
          (not (= i@240@01 j@241@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@240@01)
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@241@01)
        (not (= i@240@01 j@241@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@240@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@241@01)
            (not (= i@240@01 j@241@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@240@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@241@01)
          (not (= i@240@01 j@241@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@241@01) (Seq_index
    xs3@63@01
    i@240@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs3@63@01)) j@241@01) (Seq_index
    xs3@63@01
    i@240@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@16@12@16@98-aux|)))
(assert (forall ((i@240@01 Int) (j@241@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@240@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@240@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@241@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@241@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@240@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@240@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@240@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@241@01)
          (not (= i@240@01 j@241@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@240@01)
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@241@01)
        (not (= i@240@01 j@241@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@240@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@241@01)
            (not (= i@240@01 j@241@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@240@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@241@01)
          (not (= i@240@01 j@241@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs3@63@01)) j@241@01) (Seq_index
    xs3@63@01
    i@240@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@16@12@16@98-aux|)))
(assert (forall ((i@240@01 Int) (j@241@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@240@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@240@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@241@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@241@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@240@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@240@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@240@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@241@01)
          (not (= i@240@01 j@241@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@240@01)
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@241@01)
        (not (= i@240@01 j@241@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@240@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@241@01)
            (not (= i@240@01 j@241@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@240@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@241@01)
          (not (= i@240@01 j@241@01))))))
  :pattern ((Seq_index xs3@63@01 i@240@01) (Seq_index xs3@63@01 j@241@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@16@12@16@98-aux|)))
(push) ; 3
(assert (not (forall ((i@240@01 Int) (j@241@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@240@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@241@01)
        (not (= i@240@01 j@241@01))))
    (not (= (Seq_index xs3@63@01 i@240@01) (Seq_index xs3@63@01 j@241@01))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@240@01) (Seq_contains
    (Seq_range 0 (Seq_length xs3@63@01))
    j@241@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs3@63@01)) i@240@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs3@63@01))
    j@241@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs3@63@01)) i@240@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs3@63@01))
    j@241@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@240@01) (Seq_index
    xs3@63@01
    j@241@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs3@63@01)) i@240@01) (Seq_index
    xs3@63@01
    j@241@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs3@63@01)) i@240@01) (Seq_index
    xs3@63@01
    j@241@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@241@01) (Seq_index
    xs3@63@01
    i@240@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs3@63@01)) j@241@01) (Seq_index
    xs3@63@01
    i@240@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs3@63@01)) j@241@01) (Seq_index
    xs3@63@01
    i@240@01))
  :pattern ((Seq_index xs3@63@01 i@240@01) (Seq_index xs3@63@01 j@241@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@16@12@16@98|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@240@01 Int) (j@241@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@240@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@241@01)
        (not (= i@240@01 j@241@01))))
    (not (= (Seq_index xs3@63@01 i@240@01) (Seq_index xs3@63@01 j@241@01))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@240@01) (Seq_contains
    (Seq_range 0 (Seq_length xs3@63@01))
    j@241@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs3@63@01)) i@240@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs3@63@01))
    j@241@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@240@01) (Seq_index
    xs3@63@01
    j@241@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs3@63@01)) i@240@01) (Seq_index
    xs3@63@01
    j@241@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) j@241@01) (Seq_index
    xs3@63@01
    i@240@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs3@63@01)) j@241@01) (Seq_index
    xs3@63@01
    i@240@01))
  :pattern ((Seq_index xs3@63@01 i@240@01) (Seq_index xs3@63@01 j@241@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@16@12@16@98|)))
(declare-const i@242@01 Int)
(push) ; 3
; [eval] (i in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(assert (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@242@01))
; [eval] xs[i]
(push) ; 4
(assert (not (>= i@242@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@242@01 (Seq_length xs3@63@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@243@01 ($Ref) Int)
(declare-fun img@244@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@242@01 Int) (i2@242@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i1@242@01)
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i2@242@01)
      (= (Seq_index xs3@63@01 i1@242@01) (Seq_index xs3@63@01 i2@242@01)))
    (= i1@242@01 i2@242@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@242@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) i@242@01)
    (and
      (= (inv@243@01 (Seq_index xs3@63@01 i@242@01)) i@242@01)
      (img@244@01 (Seq_index xs3@63@01 i@242@01))))
  :pattern ((Seq_index xs3@63@01 i@242@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@244@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@243@01 r)))
    (= (Seq_index xs3@63@01 (inv@243@01 r)) r))
  :pattern ((inv@243@01 r))
  :qid |f-fctOfInv|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((i@242@01 Int)) (!
  (= (Seq_index xs3@63@01 i@242@01) (Seq_index xs2@62@01 i@242@01))
  
  :qid |quant-u-185|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((i@242@01 Int)) (!
  (= (Seq_index xs3@63@01 i@242@01) (Seq_index xs2@62@01 i@242@01))
  
  :qid |quant-u-186|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@245@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@243@01 r))
      (img@244@01 r)
      (= r (Seq_index xs3@63@01 (inv@243@01 r))))
    ($Perm.min
      (ite
        (and
          (img@130@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@129@01 r)))
        (- (/ (to_real 1) (to_real 2)) (pTaken@164@01 r))
        $Perm.No)
      (/ (to_real 1) (to_real 3)))
    $Perm.No))
(define-fun pTaken@246@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@243@01 r))
      (img@244@01 r)
      (= r (Seq_index xs3@63@01 (inv@243@01 r))))
    ($Perm.min
      (ite
        (and
          (img@133@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@132@01 r)))
        (- (/ (to_real 1) (to_real 2)) (pTaken@205@01 r))
        $Perm.No)
      (- (/ (to_real 1) (to_real 3)) (pTaken@245@01 r)))
    $Perm.No))
(define-fun pTaken@247@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@243@01 r))
      (img@244@01 r)
      (= r (Seq_index xs3@63@01 (inv@243@01 r))))
    ($Perm.min
      (ite
        (and
          (img@228@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@227@01 r)))
        (/ (to_real 1) (to_real 4))
        $Perm.No)
      (- (- (/ (to_real 1) (to_real 3)) (pTaken@245@01 r)) (pTaken@246@01 r)))
    $Perm.No))
(define-fun pTaken@248@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@243@01 r))
      (img@244@01 r)
      (= r (Seq_index xs3@63@01 (inv@243@01 r))))
    ($Perm.min
      (ite
        (and
          (img@225@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@224@01 r)))
        (/ (to_real 1) (to_real 4))
        $Perm.No)
      (-
        (- (- (/ (to_real 1) (to_real 3)) (pTaken@245@01 r)) (pTaken@246@01 r))
        (pTaken@247@01 r)))
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
          (img@130@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@129@01 r)))
        (- (/ (to_real 1) (to_real 2)) (pTaken@164@01 r))
        $Perm.No)
      (pTaken@245@01 r))
    $Perm.No)
  
  :qid |quant-u-188|))))
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
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@243@01 r))
      (img@244@01 r)
      (= r (Seq_index xs3@63@01 (inv@243@01 r))))
    (= (- (/ (to_real 1) (to_real 3)) (pTaken@245@01 r)) $Perm.No))
  
  :qid |quant-u-189|))))
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
        (and
          (img@133@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@132@01 r)))
        (- (/ (to_real 1) (to_real 2)) (pTaken@205@01 r))
        $Perm.No)
      (pTaken@246@01 r))
    $Perm.No)
  
  :qid |quant-u-190|))))
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
      (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@243@01 r))
      (img@244@01 r)
      (= r (Seq_index xs3@63@01 (inv@243@01 r))))
    (=
      (- (- (/ (to_real 1) (to_real 3)) (pTaken@245@01 r)) (pTaken@246@01 r))
      $Perm.No))
  
  :qid |quant-u-191|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@249@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@228@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@227@01 r)))
    (=
      ($FVF.lookup_f (as sm@249@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@222@01)) r)))
  :pattern (($FVF.lookup_f (as sm@249@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@222@01)) r))
  :qid |qp.fvfValDef60|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@225@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@224@01 r)))
    (=
      ($FVF.lookup_f (as sm@249@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@222@01)) r)))
  :pattern (($FVF.lookup_f (as sm@249@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@222@01)) r))
  :qid |qp.fvfValDef61|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@130@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@129@01 r)))
      (< $Perm.No (- (/ (to_real 1) (to_real 2)) (pTaken@164@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@249@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@127@01)) r)))
  :pattern (($FVF.lookup_f (as sm@249@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@127@01)) r))
  :qid |qp.fvfValDef62|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@133@01 r)
        (Seq_contains (Seq_range 0 (Seq_length xs3@63@01)) (inv@132@01 r)))
      (< $Perm.No (- (/ (to_real 1) (to_real 2)) (pTaken@205@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@249@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@127@01)) r)))
  :pattern (($FVF.lookup_f (as sm@249@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@127@01)) r))
  :qid |qp.fvfValDef63|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; leak(xs2, 1 / 2)
; [eval] p >= none
; [eval] (forall i: Int, j: Int :: { (i in [0..|xs|)), (j in [0..|xs|)) } { (i in [0..|xs|)), xs[j] } { (j in [0..|xs|)), xs[i] } { xs[i], xs[j] } (i in [0..|xs|)) && ((j in [0..|xs|)) && i != j) ==> xs[i] != xs[j])
(declare-const i@250@01 Int)
(declare-const j@251@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (i in [0..|xs|)) && ((j in [0..|xs|)) && i != j) ==> xs[i] != xs[j]
; [eval] (i in [0..|xs|)) && ((j in [0..|xs|)) && i != j)
; [eval] (i in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(push) ; 4
; [then-branch: 60 | !(i@250@01 in [0..|xs2@62@01|]) | live]
; [else-branch: 60 | i@250@01 in [0..|xs2@62@01|] | live]
(push) ; 5
; [then-branch: 60 | !(i@250@01 in [0..|xs2@62@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@250@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 60 | i@250@01 in [0..|xs2@62@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@250@01))
; [eval] (j in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(push) ; 6
; [then-branch: 61 | !(j@251@01 in [0..|xs2@62@01|]) | live]
; [else-branch: 61 | j@251@01 in [0..|xs2@62@01|] | live]
(push) ; 7
; [then-branch: 61 | !(j@251@01 in [0..|xs2@62@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@251@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 61 | j@251@01 in [0..|xs2@62@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@251@01))
; [eval] i != j
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@251@01)
  (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@251@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@250@01)
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@250@01)
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@251@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@251@01))))))
(assert (or
  (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@250@01)
  (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@250@01))))
(push) ; 4
; [then-branch: 62 | i@250@01 in [0..|xs2@62@01|] && j@251@01 in [0..|xs2@62@01|] && i@250@01 != j@251@01 | live]
; [else-branch: 62 | !(i@250@01 in [0..|xs2@62@01|] && j@251@01 in [0..|xs2@62@01|] && i@250@01 != j@251@01) | live]
(push) ; 5
; [then-branch: 62 | i@250@01 in [0..|xs2@62@01|] && j@251@01 in [0..|xs2@62@01|] && i@250@01 != j@251@01]
(assert (and
  (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@250@01)
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@251@01)
    (not (= i@250@01 j@251@01)))))
; [eval] xs[i] != xs[j]
; [eval] xs[i]
(push) ; 6
(assert (not (>= i@250@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@250@01 (Seq_length xs2@62@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] xs[j]
(push) ; 6
(assert (not (>= j@251@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< j@251@01 (Seq_length xs2@62@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 62 | !(i@250@01 in [0..|xs2@62@01|] && j@251@01 in [0..|xs2@62@01|] && i@250@01 != j@251@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@250@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@251@01)
      (not (= i@250@01 j@251@01))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@250@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@251@01)
      (not (= i@250@01 j@251@01))))
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@250@01)
    (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@251@01)
    (not (= i@250@01 j@251@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@250@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@251@01)
        (not (= i@250@01 j@251@01)))))
  (and
    (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@250@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@251@01)
      (not (= i@250@01 j@251@01))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@250@01 Int) (j@251@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@250@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@250@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@251@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@251@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@250@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@250@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@250@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@251@01)
          (not (= i@250@01 j@251@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@250@01)
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@251@01)
        (not (= i@250@01 j@251@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@250@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@251@01)
            (not (= i@250@01 j@251@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@250@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@251@01)
          (not (= i@250@01 j@251@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@250@01) (Seq_contains
    (Seq_range 0 (Seq_length xs2@62@01))
    j@251@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs2@62@01)) i@250@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs2@62@01))
    j@251@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@16@12@16@98-aux|)))
(assert (forall ((i@250@01 Int) (j@251@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@250@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@250@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@251@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@251@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@250@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@250@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@250@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@251@01)
          (not (= i@250@01 j@251@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@250@01)
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@251@01)
        (not (= i@250@01 j@251@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@250@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@251@01)
            (not (= i@250@01 j@251@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@250@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@251@01)
          (not (= i@250@01 j@251@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs2@62@01)) i@250@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs2@62@01))
    j@251@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@16@12@16@98-aux|)))
(assert (forall ((i@250@01 Int) (j@251@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@250@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@250@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@251@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@251@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@250@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@250@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@250@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@251@01)
          (not (= i@250@01 j@251@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@250@01)
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@251@01)
        (not (= i@250@01 j@251@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@250@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@251@01)
            (not (= i@250@01 j@251@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@250@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@251@01)
          (not (= i@250@01 j@251@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@250@01) (Seq_index
    xs2@62@01
    j@251@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs2@62@01)) i@250@01) (Seq_index
    xs2@62@01
    j@251@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@16@12@16@98-aux|)))
(assert (forall ((i@250@01 Int) (j@251@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@250@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@250@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@251@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@251@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@250@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@250@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@250@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@251@01)
          (not (= i@250@01 j@251@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@250@01)
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@251@01)
        (not (= i@250@01 j@251@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@250@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@251@01)
            (not (= i@250@01 j@251@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@250@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@251@01)
          (not (= i@250@01 j@251@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs2@62@01)) i@250@01) (Seq_index
    xs2@62@01
    j@251@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@16@12@16@98-aux|)))
(assert (forall ((i@250@01 Int) (j@251@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@250@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@250@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@251@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@251@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@250@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@250@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@250@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@251@01)
          (not (= i@250@01 j@251@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@250@01)
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@251@01)
        (not (= i@250@01 j@251@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@250@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@251@01)
            (not (= i@250@01 j@251@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@250@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@251@01)
          (not (= i@250@01 j@251@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@251@01) (Seq_index
    xs2@62@01
    i@250@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs2@62@01)) j@251@01) (Seq_index
    xs2@62@01
    i@250@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@16@12@16@98-aux|)))
(assert (forall ((i@250@01 Int) (j@251@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@250@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@250@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@251@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@251@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@250@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@250@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@250@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@251@01)
          (not (= i@250@01 j@251@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@250@01)
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@251@01)
        (not (= i@250@01 j@251@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@250@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@251@01)
            (not (= i@250@01 j@251@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@250@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@251@01)
          (not (= i@250@01 j@251@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs2@62@01)) j@251@01) (Seq_index
    xs2@62@01
    i@250@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@16@12@16@98-aux|)))
(assert (forall ((i@250@01 Int) (j@251@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@250@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@250@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@251@01)
          (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@251@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@250@01)
      (not (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@250@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@250@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@251@01)
          (not (= i@250@01 j@251@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@250@01)
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@251@01)
        (not (= i@250@01 j@251@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@250@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@251@01)
            (not (= i@250@01 j@251@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@250@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@251@01)
          (not (= i@250@01 j@251@01))))))
  :pattern ((Seq_index xs2@62@01 i@250@01) (Seq_index xs2@62@01 j@251@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@16@12@16@98-aux|)))
(push) ; 3
(assert (not (forall ((i@250@01 Int) (j@251@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@250@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@251@01)
        (not (= i@250@01 j@251@01))))
    (not (= (Seq_index xs2@62@01 i@250@01) (Seq_index xs2@62@01 j@251@01))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@250@01) (Seq_contains
    (Seq_range 0 (Seq_length xs2@62@01))
    j@251@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs2@62@01)) i@250@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs2@62@01))
    j@251@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs2@62@01)) i@250@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs2@62@01))
    j@251@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@250@01) (Seq_index
    xs2@62@01
    j@251@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs2@62@01)) i@250@01) (Seq_index
    xs2@62@01
    j@251@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs2@62@01)) i@250@01) (Seq_index
    xs2@62@01
    j@251@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@251@01) (Seq_index
    xs2@62@01
    i@250@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs2@62@01)) j@251@01) (Seq_index
    xs2@62@01
    i@250@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs2@62@01)) j@251@01) (Seq_index
    xs2@62@01
    i@250@01))
  :pattern ((Seq_index xs2@62@01 i@250@01) (Seq_index xs2@62@01 j@251@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@16@12@16@98|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@250@01 Int) (j@251@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@250@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@251@01)
        (not (= i@250@01 j@251@01))))
    (not (= (Seq_index xs2@62@01 i@250@01) (Seq_index xs2@62@01 j@251@01))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@250@01) (Seq_contains
    (Seq_range 0 (Seq_length xs2@62@01))
    j@251@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs2@62@01)) i@250@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length xs2@62@01))
    j@251@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@250@01) (Seq_index
    xs2@62@01
    j@251@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs2@62@01)) i@250@01) (Seq_index
    xs2@62@01
    j@251@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) j@251@01) (Seq_index
    xs2@62@01
    i@250@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length xs2@62@01)) j@251@01) (Seq_index
    xs2@62@01
    i@250@01))
  :pattern ((Seq_index xs2@62@01 i@250@01) (Seq_index xs2@62@01 j@251@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/performance.vpr@16@12@16@98|)))
(declare-const i@252@01 Int)
(push) ; 3
; [eval] (i in [0..|xs|))
; [eval] [0..|xs|)
; [eval] |xs|
(assert (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@252@01))
; [eval] xs[i]
(push) ; 4
(assert (not (>= i@252@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@252@01 (Seq_length xs2@62@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@253@01 ($Ref) Int)
(declare-fun img@254@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@252@01 Int) (i2@252@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i1@252@01)
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i2@252@01)
      (= (Seq_index xs2@62@01 i1@252@01) (Seq_index xs2@62@01 i2@252@01)))
    (= i1@252@01 i2@252@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@252@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) i@252@01)
    (and
      (= (inv@253@01 (Seq_index xs2@62@01 i@252@01)) i@252@01)
      (img@254@01 (Seq_index xs2@62@01 i@252@01))))
  :pattern ((Seq_index xs2@62@01 i@252@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@254@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@253@01 r)))
    (= (Seq_index xs2@62@01 (inv@253@01 r)) r))
  :pattern ((inv@253@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@255@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@253@01 r))
      (img@254@01 r)
      (= r (Seq_index xs2@62@01 (inv@253@01 r))))
    ($Perm.min
      (ite
        (and
          (img@225@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@224@01 r)))
        (/ (to_real 1) (to_real 4))
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
(define-fun pTaken@256@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@253@01 r))
      (img@254@01 r)
      (= r (Seq_index xs2@62@01 (inv@253@01 r))))
    ($Perm.min
      (ite
        (and
          (img@228@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@227@01 r)))
        (/ (to_real 1) (to_real 4))
        $Perm.No)
      (- (/ (to_real 1) (to_real 2)) (pTaken@255@01 r)))
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
          (img@225@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@224@01 r)))
        (/ (to_real 1) (to_real 4))
        $Perm.No)
      (pTaken@255@01 r))
    $Perm.No)
  
  :qid |quant-u-194|))))
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
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@253@01 r))
      (img@254@01 r)
      (= r (Seq_index xs2@62@01 (inv@253@01 r))))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@255@01 r)) $Perm.No))
  
  :qid |quant-u-195|))))
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
        (and
          (img@228@01 r)
          (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@227@01 r)))
        (/ (to_real 1) (to_real 4))
        $Perm.No)
      (pTaken@256@01 r))
    $Perm.No)
  
  :qid |quant-u-196|))))
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
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@253@01 r))
      (img@254@01 r)
      (= r (Seq_index xs2@62@01 (inv@253@01 r))))
    (=
      (- (- (/ (to_real 1) (to_real 2)) (pTaken@255@01 r)) (pTaken@256@01 r))
      $Perm.No))
  
  :qid |quant-u-197|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@257@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@225@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@224@01 r)))
    (=
      ($FVF.lookup_f (as sm@257@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@222@01)) r)))
  :pattern (($FVF.lookup_f (as sm@257@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@222@01)) r))
  :qid |qp.fvfValDef64|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@228@01 r)
      (Seq_contains (Seq_range 0 (Seq_length xs2@62@01)) (inv@227@01 r)))
    (=
      ($FVF.lookup_f (as sm@257@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@222@01)) r)))
  :pattern (($FVF.lookup_f (as sm@257@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@222@01)) r))
  :qid |qp.fvfValDef65|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(pop) ; 2
(pop) ; 1
