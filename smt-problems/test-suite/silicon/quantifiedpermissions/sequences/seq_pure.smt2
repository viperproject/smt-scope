(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:19:38
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr
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
; ---------- test01 ----------
(declare-const S@0@01 Seq<$Ref>)
(declare-const a@1@01 Int)
(declare-const S@2@01 Seq<$Ref>)
(declare-const a@3@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@4@01 $Snap)
(assert (= $t@4@01 ($Snap.combine ($Snap.first $t@4@01) ($Snap.second $t@4@01))))
(assert (= ($Snap.first $t@4@01) $Snap.unit))
; [eval] 0 <= a
(assert (<= 0 a@3@01))
(assert (=
  ($Snap.second $t@4@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@4@01))
    ($Snap.second ($Snap.second $t@4@01)))))
(assert (= ($Snap.first ($Snap.second $t@4@01)) $Snap.unit))
; [eval] a < |S|
; [eval] |S|
(assert (< a@3@01 (Seq_length S@2@01)))
(assert (=
  ($Snap.second ($Snap.second $t@4@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@4@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@4@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@4@01))) $Snap.unit))
; [eval] (forall j1: Int, j2: Int :: { (j1 in [0..|S|)), (j2 in [0..|S|)) } (j1 in [0..|S|)) && ((j2 in [0..|S|)) && j1 != j2) ==> S[j1] != S[j2])
(declare-const j1@5@01 Int)
(declare-const j2@6@01 Int)
(push) ; 2
; [eval] (j1 in [0..|S|)) && ((j2 in [0..|S|)) && j1 != j2) ==> S[j1] != S[j2]
; [eval] (j1 in [0..|S|)) && ((j2 in [0..|S|)) && j1 != j2)
; [eval] (j1 in [0..|S|))
; [eval] [0..|S|)
; [eval] |S|
(push) ; 3
; [then-branch: 0 | !(j1@5@01 in [0..|S@2@01|]) | live]
; [else-branch: 0 | j1@5@01 in [0..|S@2@01|] | live]
(push) ; 4
; [then-branch: 0 | !(j1@5@01 in [0..|S@2@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j1@5@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | j1@5@01 in [0..|S@2@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j1@5@01))
; [eval] (j2 in [0..|S|))
; [eval] [0..|S|)
; [eval] |S|
(push) ; 5
; [then-branch: 1 | !(j2@6@01 in [0..|S@2@01|]) | live]
; [else-branch: 1 | j2@6@01 in [0..|S@2@01|] | live]
(push) ; 6
; [then-branch: 1 | !(j2@6@01 in [0..|S@2@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j2@6@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 1 | j2@6@01 in [0..|S@2@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j2@6@01))
; [eval] j1 != j2
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j2@6@01)
  (not (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j2@6@01))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j1@5@01)
  (and
    (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j1@5@01)
    (or
      (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j2@6@01)
      (not (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j2@6@01))))))
(assert (or
  (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j1@5@01)
  (not (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j1@5@01))))
(push) ; 3
; [then-branch: 2 | j1@5@01 in [0..|S@2@01|] && j2@6@01 in [0..|S@2@01|] && j1@5@01 != j2@6@01 | live]
; [else-branch: 2 | !(j1@5@01 in [0..|S@2@01|] && j2@6@01 in [0..|S@2@01|] && j1@5@01 != j2@6@01) | live]
(push) ; 4
; [then-branch: 2 | j1@5@01 in [0..|S@2@01|] && j2@6@01 in [0..|S@2@01|] && j1@5@01 != j2@6@01]
(assert (and
  (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j1@5@01)
  (and
    (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j2@6@01)
    (not (= j1@5@01 j2@6@01)))))
; [eval] S[j1] != S[j2]
; [eval] S[j1]
(push) ; 5
(assert (not (>= j1@5@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< j1@5@01 (Seq_length S@2@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] S[j2]
(push) ; 5
(assert (not (>= j2@6@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< j2@6@01 (Seq_length S@2@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 2 | !(j1@5@01 in [0..|S@2@01|] && j2@6@01 in [0..|S@2@01|] && j1@5@01 != j2@6@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j1@5@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j2@6@01)
      (not (= j1@5@01 j2@6@01))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j1@5@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j2@6@01)
      (not (= j1@5@01 j2@6@01))))
  (and
    (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j1@5@01)
    (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j2@6@01)
    (not (= j1@5@01 j2@6@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j1@5@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j2@6@01)
        (not (= j1@5@01 j2@6@01)))))
  (and
    (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j1@5@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j2@6@01)
      (not (= j1@5@01 j2@6@01))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j1@5@01 Int) (j2@6@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j1@5@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j1@5@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j2@6@01)
          (not (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j2@6@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j1@5@01)
      (not (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j1@5@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j1@5@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j2@6@01)
          (not (= j1@5@01 j2@6@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j1@5@01)
        (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j2@6@01)
        (not (= j1@5@01 j2@6@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j1@5@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j2@6@01)
            (not (= j1@5@01 j2@6@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j1@5@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j2@6@01)
          (not (= j1@5@01 j2@6@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length S@2@01)) j1@5@01) (Seq_contains
    (Seq_range 0 (Seq_length S@2@01))
    j2@6@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length S@2@01)) j1@5@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length S@2@01))
    j2@6@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@9@12@9@136-aux|)))
(assert (forall ((j1@5@01 Int) (j2@6@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j1@5@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j1@5@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j2@6@01)
          (not (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j2@6@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j1@5@01)
      (not (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j1@5@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j1@5@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j2@6@01)
          (not (= j1@5@01 j2@6@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j1@5@01)
        (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j2@6@01)
        (not (= j1@5@01 j2@6@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j1@5@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j2@6@01)
            (not (= j1@5@01 j2@6@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j1@5@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j2@6@01)
          (not (= j1@5@01 j2@6@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length S@2@01)) j1@5@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length S@2@01))
    j2@6@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@9@12@9@136-aux|)))
(assert (forall ((j1@5@01 Int) (j2@6@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j1@5@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j2@6@01)
        (not (= j1@5@01 j2@6@01))))
    (not (= (Seq_index S@2@01 j1@5@01) (Seq_index S@2@01 j2@6@01))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length S@2@01)) j1@5@01) (Seq_contains
    (Seq_range 0 (Seq_length S@2@01))
    j2@6@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length S@2@01)) j1@5@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length S@2@01))
    j2@6@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@9@12@9@136|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@4@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01)))))))
(declare-const j@7@01 Int)
(push) ; 2
; [eval] (j in [0..|S|))
; [eval] [0..|S|)
; [eval] |S|
(assert (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j@7@01))
; [eval] S[j]
(push) ; 3
(assert (not (>= j@7@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< j@7@01 (Seq_length S@2@01))))
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
(assert (not (forall ((j1@7@01 Int) (j2@7@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j1@7@01)
      (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j2@7@01)
      (= (Seq_index S@2@01 j1@7@01) (Seq_index S@2@01 j2@7@01)))
    (= j1@7@01 j2@7@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@7@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j@7@01)
    (and
      (= (inv@8@01 (Seq_index S@2@01 j@7@01)) j@7@01)
      (img@9@01 (Seq_index S@2@01 j@7@01))))
  :pattern ((Seq_index S@2@01 j@7@01))
  :qid |quant-u-1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@9@01 r)
      (Seq_contains (Seq_range 0 (Seq_length S@2@01)) (inv@8@01 r)))
    (= (Seq_index S@2@01 (inv@8@01 r)) r))
  :pattern ((inv@8@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j@7@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j@7@01)
    (not (= (Seq_index S@2@01 j@7@01) $Ref.null)))
  :pattern ((Seq_index S@2@01 j@7@01))
  :qid |f-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@4@01))))
  $Snap.unit))
; [eval] (forall j: Int :: { (j in [0..|S|)) } { S[j] } (j in [0..|S|)) ==> S[j].f > 0)
(declare-const j@10@01 Int)
(push) ; 2
; [eval] (j in [0..|S|)) ==> S[j].f > 0
; [eval] (j in [0..|S|))
; [eval] [0..|S|)
; [eval] |S|
(push) ; 3
; [then-branch: 3 | j@10@01 in [0..|S@2@01|] | live]
; [else-branch: 3 | !(j@10@01 in [0..|S@2@01|]) | live]
(push) ; 4
; [then-branch: 3 | j@10@01 in [0..|S@2@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j@10@01))
; [eval] S[j].f > 0
; [eval] S[j]
(push) ; 5
(assert (not (>= j@10@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< j@10@01 (Seq_length S@2@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (and
  (img@9@01 (Seq_index S@2@01 j@10@01))
  (Seq_contains
    (Seq_range 0 (Seq_length S@2@01))
    (inv@8@01 (Seq_index S@2@01 j@10@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 3 | !(j@10@01 in [0..|S@2@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j@10@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or
  (not (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j@10@01))
  (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j@10@01)))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@10@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j@10@01))
    (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j@10@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length S@2@01)) j@10@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length S@2@01)) j@10@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@11@12@11@56-aux|)))
(assert (forall ((j@10@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j@10@01))
    (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j@10@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length S@2@01)) j@10@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@11@12@11@56-aux|)))
(assert (forall ((j@10@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j@10@01))
    (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j@10@01))
  :pattern ((Seq_index S@2@01 j@10@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@11@12@11@56-aux|)))
(assert (forall ((j@10@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j@10@01)
    (>
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))) (Seq_index
        S@2@01
        j@10@01))
      0))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length S@2@01)) j@10@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length S@2@01)) j@10@01))
  :pattern ((Seq_index S@2@01 j@10@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@11@12@11@56|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@11@01 $Snap)
(assert (= $t@11@01 ($Snap.combine ($Snap.first $t@11@01) ($Snap.second $t@11@01))))
(declare-const j@12@01 Int)
(push) ; 3
; [eval] (j in [0..|S|))
; [eval] [0..|S|)
; [eval] |S|
(assert (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j@12@01))
; [eval] S[j]
(push) ; 4
(assert (not (>= j@12@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< j@12@01 (Seq_length S@2@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@13@01 ($Ref) Int)
(declare-fun img@14@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j1@12@01 Int) (j2@12@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j1@12@01)
      (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j2@12@01)
      (= (Seq_index S@2@01 j1@12@01) (Seq_index S@2@01 j2@12@01)))
    (= j1@12@01 j2@12@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@12@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j@12@01)
    (and
      (= (inv@13@01 (Seq_index S@2@01 j@12@01)) j@12@01)
      (img@14@01 (Seq_index S@2@01 j@12@01))))
  :pattern ((Seq_index S@2@01 j@12@01))
  :qid |quant-u-3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@14@01 r)
      (Seq_contains (Seq_range 0 (Seq_length S@2@01)) (inv@13@01 r)))
    (= (Seq_index S@2@01 (inv@13@01 r)) r))
  :pattern ((inv@13@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j@12@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j@12@01)
    (not (= (Seq_index S@2@01 j@12@01) $Ref.null)))
  :pattern ((Seq_index S@2@01 j@12@01))
  :qid |f-permImpliesNonNull|)))
(assert (= ($Snap.second $t@11@01) $Snap.unit))
; [eval] (forall j: Int :: { (j in [0..|S|)) } { S[j] } (j in [0..|S|)) ==> S[j].f > 0)
(declare-const j@15@01 Int)
(push) ; 3
; [eval] (j in [0..|S|)) ==> S[j].f > 0
; [eval] (j in [0..|S|))
; [eval] [0..|S|)
; [eval] |S|
(push) ; 4
; [then-branch: 4 | j@15@01 in [0..|S@2@01|] | live]
; [else-branch: 4 | !(j@15@01 in [0..|S@2@01|]) | live]
(push) ; 5
; [then-branch: 4 | j@15@01 in [0..|S@2@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j@15@01))
; [eval] S[j].f > 0
; [eval] S[j]
(push) ; 6
(assert (not (>= j@15@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< j@15@01 (Seq_length S@2@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (and
  (img@14@01 (Seq_index S@2@01 j@15@01))
  (Seq_contains
    (Seq_range 0 (Seq_length S@2@01))
    (inv@13@01 (Seq_index S@2@01 j@15@01))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 4 | !(j@15@01 in [0..|S@2@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j@15@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j@15@01))
  (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j@15@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@15@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j@15@01))
    (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j@15@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length S@2@01)) j@15@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length S@2@01)) j@15@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@13@11@13@55-aux|)))
(assert (forall ((j@15@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j@15@01))
    (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j@15@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length S@2@01)) j@15@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@13@11@13@55-aux|)))
(assert (forall ((j@15@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j@15@01))
    (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j@15@01))
  :pattern ((Seq_index S@2@01 j@15@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@13@11@13@55-aux|)))
(assert (forall ((j@15@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j@15@01)
    (>
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@11@01)) (Seq_index
        S@2@01
        j@15@01))
      0))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length S@2@01)) j@15@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length S@2@01)) j@15@01))
  :pattern ((Seq_index S@2@01 j@15@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@13@11@13@55|)))
(pop) ; 2
(push) ; 2
; [exec]
; S[a].f := 2
; [eval] S[a]
(push) ; 3
(assert (not (>= a@3@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@16@01 ((r $Ref)) $Perm
  (ite
    (= r (Seq_index S@2@01 a@3@01))
    ($Perm.min
      (ite
        (and
          (img@9@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@2@01)) (inv@8@01 r)))
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
          (img@9@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@2@01)) (inv@8@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@16@01 r))
    $Perm.No)
  
  :qid |quant-u-5|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@16@01 r) $Perm.No)
  
  :qid |quant-u-6|))))
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
    (= r (Seq_index S@2@01 a@3@01))
    (= (- $Perm.Write (pTaken@16@01 r)) $Perm.No))
  
  :qid |quant-u-7|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@17@01 $FVF<f>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_f (as sm@17@01  $FVF<f>) (Seq_index S@2@01 a@3@01)) 2))
(declare-const j@18@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (j in [0..|S|))
; [eval] [0..|S|)
; [eval] |S|
(assert (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j@18@01))
; [eval] S[j]
(push) ; 4
(assert (not (>= j@18@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< j@18@01 (Seq_length S@2@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@19@01 ($Ref) Int)
(declare-fun img@20@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j1@18@01 Int) (j2@18@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j1@18@01)
      (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j2@18@01)
      (= (Seq_index S@2@01 j1@18@01) (Seq_index S@2@01 j2@18@01)))
    (= j1@18@01 j2@18@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@18@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j@18@01)
    (and
      (= (inv@19@01 (Seq_index S@2@01 j@18@01)) j@18@01)
      (img@20@01 (Seq_index S@2@01 j@18@01))))
  :pattern ((Seq_index S@2@01 j@18@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@20@01 r)
      (Seq_contains (Seq_range 0 (Seq_length S@2@01)) (inv@19@01 r)))
    (= (Seq_index S@2@01 (inv@19@01 r)) r))
  :pattern ((inv@19@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@21@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length S@2@01)) (inv@19@01 r))
      (img@20@01 r)
      (= r (Seq_index S@2@01 (inv@19@01 r))))
    ($Perm.min
      (ite
        (and
          (img@9@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@2@01)) (inv@8@01 r)))
        (- $Perm.Write (pTaken@16@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@22@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length S@2@01)) (inv@19@01 r))
      (img@20@01 r)
      (= r (Seq_index S@2@01 (inv@19@01 r))))
    ($Perm.min
      (ite (= r (Seq_index S@2@01 a@3@01)) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@21@01 r)))
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
          (img@9@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@2@01)) (inv@8@01 r)))
        (- $Perm.Write (pTaken@16@01 r))
        $Perm.No)
      (pTaken@21@01 r))
    $Perm.No)
  
  :qid |quant-u-10|))))
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
      (Seq_contains (Seq_range 0 (Seq_length S@2@01)) (inv@19@01 r))
      (img@20@01 r)
      (= r (Seq_index S@2@01 (inv@19@01 r))))
    (= (- $Perm.Write (pTaken@21@01 r)) $Perm.No))
  
  :qid |quant-u-11|))))
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
      (= (Seq_index S@2@01 a@3@01) (Seq_index S@2@01 a@3@01))
      $Perm.Write
      $Perm.No)
    (pTaken@22@01 (Seq_index S@2@01 a@3@01)))
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
      (Seq_contains (Seq_range 0 (Seq_length S@2@01)) (inv@19@01 r))
      (img@20@01 r)
      (= r (Seq_index S@2@01 (inv@19@01 r))))
    (= (- (- $Perm.Write (pTaken@21@01 r)) (pTaken@22@01 r)) $Perm.No))
  
  :qid |quant-u-13|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@23@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index S@2@01 a@3@01))
    (=
      ($FVF.lookup_f (as sm@23@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@17@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@23@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@17@01  $FVF<f>) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@9@01 r)
        (Seq_contains (Seq_range 0 (Seq_length S@2@01)) (inv@8@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@16@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@23@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))) r)))
  :pattern (($FVF.lookup_f (as sm@23@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))) r))
  :qid |qp.fvfValDef1|)))
; [eval] (forall j: Int :: { (j in [0..|S|)) } { S[j] } (j in [0..|S|)) ==> S[j].f > 0)
(declare-const j@24@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (j in [0..|S|)) ==> S[j].f > 0
; [eval] (j in [0..|S|))
; [eval] [0..|S|)
; [eval] |S|
(push) ; 4
; [then-branch: 5 | j@24@01 in [0..|S@2@01|] | live]
; [else-branch: 5 | !(j@24@01 in [0..|S@2@01|]) | live]
(push) ; 5
; [then-branch: 5 | j@24@01 in [0..|S@2@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j@24@01))
; [eval] S[j].f > 0
; [eval] S[j]
(push) ; 6
(assert (not (>= j@24@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< j@24@01 (Seq_length S@2@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r (Seq_index S@2@01 a@3@01))
      (=
        ($FVF.lookup_f (as sm@23@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@17@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@23@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@17@01  $FVF<f>) r))
    :qid |qp.fvfValDef0|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and
          (img@9@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@2@01)) (inv@8@01 r)))
        (< $Perm.No (- $Perm.Write (pTaken@16@01 r)))
        false)
      (=
        ($FVF.lookup_f (as sm@23@01  $FVF<f>) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))) r)))
    :pattern (($FVF.lookup_f (as sm@23@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))) r))
    :qid |qp.fvfValDef1|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (ite
      (= (Seq_index S@2@01 j@24@01) (Seq_index S@2@01 a@3@01))
      $Perm.Write
      $Perm.No)
    (ite
      (and
        (img@9@01 (Seq_index S@2@01 j@24@01))
        (Seq_contains
          (Seq_range 0 (Seq_length S@2@01))
          (inv@8@01 (Seq_index S@2@01 j@24@01))))
      (- $Perm.Write (pTaken@16@01 (Seq_index S@2@01 j@24@01)))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 5 | !(j@24@01 in [0..|S@2@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j@24@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index S@2@01 a@3@01))
    (=
      ($FVF.lookup_f (as sm@23@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@17@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@23@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@17@01  $FVF<f>) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@9@01 r)
        (Seq_contains (Seq_range 0 (Seq_length S@2@01)) (inv@8@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@16@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@23@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))) r)))
  :pattern (($FVF.lookup_f (as sm@23@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))) r))
  :qid |qp.fvfValDef1|)))
; Joined path conditions
(assert (or
  (not (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j@24@01))
  (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j@24@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index S@2@01 a@3@01))
    (=
      ($FVF.lookup_f (as sm@23@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@17@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@23@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@17@01  $FVF<f>) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@9@01 r)
        (Seq_contains (Seq_range 0 (Seq_length S@2@01)) (inv@8@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@16@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@23@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))) r)))
  :pattern (($FVF.lookup_f (as sm@23@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@4@01))))) r))
  :qid |qp.fvfValDef1|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@24@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j@24@01))
    (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j@24@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length S@2@01)) j@24@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length S@2@01)) j@24@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@13@11@13@55-aux|)))
(assert (forall ((j@24@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j@24@01))
    (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j@24@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length S@2@01)) j@24@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@13@11@13@55-aux|)))
(assert (forall ((j@24@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j@24@01))
    (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j@24@01))
  :pattern ((Seq_index S@2@01 j@24@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@13@11@13@55-aux|)))
(push) ; 3
(assert (not (forall ((j@24@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j@24@01)
    (> ($FVF.lookup_f (as sm@23@01  $FVF<f>) (Seq_index S@2@01 j@24@01)) 0))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length S@2@01)) j@24@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length S@2@01)) j@24@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length S@2@01)) j@24@01))
  :pattern ((Seq_index S@2@01 j@24@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@13@11@13@55|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((j@24@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length S@2@01)) j@24@01)
    (> ($FVF.lookup_f (as sm@23@01  $FVF<f>) (Seq_index S@2@01 j@24@01)) 0))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length S@2@01)) j@24@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length S@2@01)) j@24@01))
  :pattern ((Seq_index S@2@01 j@24@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@13@11@13@55|)))
(pop) ; 2
(pop) ; 1
; ---------- test02 ----------
(declare-const S@25@01 Seq<$Ref>)
(declare-const a@26@01 Int)
(declare-const S@27@01 Seq<$Ref>)
(declare-const a@28@01 Int)
(push) ; 1
(declare-const $t@29@01 $Snap)
(assert (= $t@29@01 ($Snap.combine ($Snap.first $t@29@01) ($Snap.second $t@29@01))))
(assert (= ($Snap.first $t@29@01) $Snap.unit))
; [eval] 0 <= a
(assert (<= 0 a@28@01))
(assert (=
  ($Snap.second $t@29@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@29@01))
    ($Snap.second ($Snap.second $t@29@01)))))
(assert (= ($Snap.first ($Snap.second $t@29@01)) $Snap.unit))
; [eval] a < |S|
; [eval] |S|
(assert (< a@28@01 (Seq_length S@27@01)))
(assert (=
  ($Snap.second ($Snap.second $t@29@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@29@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@29@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@29@01))) $Snap.unit))
; [eval] (forall j1: Int, j2: Int :: { (j1 in [0..|S|)), (j2 in [0..|S|)) } { (j1 in [0..|S|)), S[j2] } { (j2 in [0..|S|)), S[j1] } { S[j1], S[j2] } (j1 in [0..|S|)) && ((j2 in [0..|S|)) && j1 != j2) ==> S[j1] != S[j2])
(declare-const j1@30@01 Int)
(declare-const j2@31@01 Int)
(push) ; 2
; [eval] (j1 in [0..|S|)) && ((j2 in [0..|S|)) && j1 != j2) ==> S[j1] != S[j2]
; [eval] (j1 in [0..|S|)) && ((j2 in [0..|S|)) && j1 != j2)
; [eval] (j1 in [0..|S|))
; [eval] [0..|S|)
; [eval] |S|
(push) ; 3
; [then-branch: 6 | !(j1@30@01 in [0..|S@27@01|]) | live]
; [else-branch: 6 | j1@30@01 in [0..|S@27@01|] | live]
(push) ; 4
; [then-branch: 6 | !(j1@30@01 in [0..|S@27@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j1@30@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 6 | j1@30@01 in [0..|S@27@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j1@30@01))
; [eval] (j2 in [0..|S|))
; [eval] [0..|S|)
; [eval] |S|
(push) ; 5
; [then-branch: 7 | !(j2@31@01 in [0..|S@27@01|]) | live]
; [else-branch: 7 | j2@31@01 in [0..|S@27@01|] | live]
(push) ; 6
; [then-branch: 7 | !(j2@31@01 in [0..|S@27@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j2@31@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 7 | j2@31@01 in [0..|S@27@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j2@31@01))
; [eval] j1 != j2
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j2@31@01)
  (not (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j2@31@01))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j1@30@01)
  (and
    (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j1@30@01)
    (or
      (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j2@31@01)
      (not (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j2@31@01))))))
(assert (or
  (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j1@30@01)
  (not (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j1@30@01))))
(push) ; 3
; [then-branch: 8 | j1@30@01 in [0..|S@27@01|] && j2@31@01 in [0..|S@27@01|] && j1@30@01 != j2@31@01 | live]
; [else-branch: 8 | !(j1@30@01 in [0..|S@27@01|] && j2@31@01 in [0..|S@27@01|] && j1@30@01 != j2@31@01) | live]
(push) ; 4
; [then-branch: 8 | j1@30@01 in [0..|S@27@01|] && j2@31@01 in [0..|S@27@01|] && j1@30@01 != j2@31@01]
(assert (and
  (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j1@30@01)
  (and
    (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j2@31@01)
    (not (= j1@30@01 j2@31@01)))))
; [eval] S[j1] != S[j2]
; [eval] S[j1]
(push) ; 5
(assert (not (>= j1@30@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< j1@30@01 (Seq_length S@27@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] S[j2]
(push) ; 5
(assert (not (>= j2@31@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< j2@31@01 (Seq_length S@27@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 8 | !(j1@30@01 in [0..|S@27@01|] && j2@31@01 in [0..|S@27@01|] && j1@30@01 != j2@31@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j1@30@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j2@31@01)
      (not (= j1@30@01 j2@31@01))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j1@30@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j2@31@01)
      (not (= j1@30@01 j2@31@01))))
  (and
    (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j1@30@01)
    (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j2@31@01)
    (not (= j1@30@01 j2@31@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j1@30@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j2@31@01)
        (not (= j1@30@01 j2@31@01)))))
  (and
    (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j1@30@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j2@31@01)
      (not (= j1@30@01 j2@31@01))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j1@30@01 Int) (j2@31@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j1@30@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j1@30@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j2@31@01)
          (not (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j2@31@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j1@30@01)
      (not (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j1@30@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j1@30@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j2@31@01)
          (not (= j1@30@01 j2@31@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j1@30@01)
        (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j2@31@01)
        (not (= j1@30@01 j2@31@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j1@30@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j2@31@01)
            (not (= j1@30@01 j2@31@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j1@30@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j2@31@01)
          (not (= j1@30@01 j2@31@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length S@27@01)) j1@30@01) (Seq_contains
    (Seq_range 0 (Seq_length S@27@01))
    j2@31@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length S@27@01)) j1@30@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length S@27@01))
    j2@31@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@21@12@21@102-aux|)))
(assert (forall ((j1@30@01 Int) (j2@31@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j1@30@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j1@30@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j2@31@01)
          (not (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j2@31@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j1@30@01)
      (not (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j1@30@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j1@30@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j2@31@01)
          (not (= j1@30@01 j2@31@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j1@30@01)
        (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j2@31@01)
        (not (= j1@30@01 j2@31@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j1@30@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j2@31@01)
            (not (= j1@30@01 j2@31@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j1@30@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j2@31@01)
          (not (= j1@30@01 j2@31@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length S@27@01)) j1@30@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length S@27@01))
    j2@31@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@21@12@21@102-aux|)))
(assert (forall ((j1@30@01 Int) (j2@31@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j1@30@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j1@30@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j2@31@01)
          (not (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j2@31@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j1@30@01)
      (not (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j1@30@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j1@30@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j2@31@01)
          (not (= j1@30@01 j2@31@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j1@30@01)
        (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j2@31@01)
        (not (= j1@30@01 j2@31@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j1@30@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j2@31@01)
            (not (= j1@30@01 j2@31@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j1@30@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j2@31@01)
          (not (= j1@30@01 j2@31@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length S@27@01)) j1@30@01) (Seq_index
    S@27@01
    j2@31@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length S@27@01)) j1@30@01) (Seq_index
    S@27@01
    j2@31@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@21@12@21@102-aux|)))
(assert (forall ((j1@30@01 Int) (j2@31@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j1@30@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j1@30@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j2@31@01)
          (not (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j2@31@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j1@30@01)
      (not (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j1@30@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j1@30@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j2@31@01)
          (not (= j1@30@01 j2@31@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j1@30@01)
        (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j2@31@01)
        (not (= j1@30@01 j2@31@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j1@30@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j2@31@01)
            (not (= j1@30@01 j2@31@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j1@30@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j2@31@01)
          (not (= j1@30@01 j2@31@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length S@27@01)) j1@30@01) (Seq_index
    S@27@01
    j2@31@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@21@12@21@102-aux|)))
(assert (forall ((j1@30@01 Int) (j2@31@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j1@30@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j1@30@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j2@31@01)
          (not (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j2@31@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j1@30@01)
      (not (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j1@30@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j1@30@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j2@31@01)
          (not (= j1@30@01 j2@31@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j1@30@01)
        (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j2@31@01)
        (not (= j1@30@01 j2@31@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j1@30@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j2@31@01)
            (not (= j1@30@01 j2@31@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j1@30@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j2@31@01)
          (not (= j1@30@01 j2@31@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length S@27@01)) j2@31@01) (Seq_index
    S@27@01
    j1@30@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length S@27@01)) j2@31@01) (Seq_index
    S@27@01
    j1@30@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@21@12@21@102-aux|)))
(assert (forall ((j1@30@01 Int) (j2@31@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j1@30@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j1@30@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j2@31@01)
          (not (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j2@31@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j1@30@01)
      (not (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j1@30@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j1@30@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j2@31@01)
          (not (= j1@30@01 j2@31@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j1@30@01)
        (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j2@31@01)
        (not (= j1@30@01 j2@31@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j1@30@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j2@31@01)
            (not (= j1@30@01 j2@31@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j1@30@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j2@31@01)
          (not (= j1@30@01 j2@31@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length S@27@01)) j2@31@01) (Seq_index
    S@27@01
    j1@30@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@21@12@21@102-aux|)))
(assert (forall ((j1@30@01 Int) (j2@31@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j1@30@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j1@30@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j2@31@01)
          (not (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j2@31@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j1@30@01)
      (not (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j1@30@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j1@30@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j2@31@01)
          (not (= j1@30@01 j2@31@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j1@30@01)
        (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j2@31@01)
        (not (= j1@30@01 j2@31@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j1@30@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j2@31@01)
            (not (= j1@30@01 j2@31@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j1@30@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j2@31@01)
          (not (= j1@30@01 j2@31@01))))))
  :pattern ((Seq_index S@27@01 j1@30@01) (Seq_index S@27@01 j2@31@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@21@12@21@102-aux|)))
(assert (forall ((j1@30@01 Int) (j2@31@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j1@30@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j2@31@01)
        (not (= j1@30@01 j2@31@01))))
    (not (= (Seq_index S@27@01 j1@30@01) (Seq_index S@27@01 j2@31@01))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length S@27@01)) j1@30@01) (Seq_contains
    (Seq_range 0 (Seq_length S@27@01))
    j2@31@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length S@27@01)) j1@30@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length S@27@01))
    j2@31@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length S@27@01)) j1@30@01) (Seq_index
    S@27@01
    j2@31@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length S@27@01)) j1@30@01) (Seq_index
    S@27@01
    j2@31@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length S@27@01)) j2@31@01) (Seq_index
    S@27@01
    j1@30@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length S@27@01)) j2@31@01) (Seq_index
    S@27@01
    j1@30@01))
  :pattern ((Seq_index S@27@01 j1@30@01) (Seq_index S@27@01 j2@31@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@21@12@21@102|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@29@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@29@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@29@01)))))))
(declare-const j@32@01 Int)
(push) ; 2
; [eval] (j in [0..|S|))
; [eval] [0..|S|)
; [eval] |S|
(assert (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@32@01))
; [eval] S[j]
(push) ; 3
(assert (not (>= j@32@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< j@32@01 (Seq_length S@27@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@33@01 ($Ref) Int)
(declare-fun img@34@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((j1@32@01 Int) (j2@32@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j1@32@01)
      (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j2@32@01)
      (= (Seq_index S@27@01 j1@32@01) (Seq_index S@27@01 j2@32@01)))
    (= j1@32@01 j2@32@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@32@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@32@01)
    (and
      (= (inv@33@01 (Seq_index S@27@01 j@32@01)) j@32@01)
      (img@34@01 (Seq_index S@27@01 j@32@01))))
  :pattern ((Seq_index S@27@01 j@32@01))
  :qid |quant-u-15|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@34@01 r)
      (Seq_contains (Seq_range 0 (Seq_length S@27@01)) (inv@33@01 r)))
    (= (Seq_index S@27@01 (inv@33@01 r)) r))
  :pattern ((inv@33@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j@32@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@32@01)
    (not (= (Seq_index S@27@01 j@32@01) $Ref.null)))
  :pattern ((Seq_index S@27@01 j@32@01))
  :qid |f-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@29@01))))
  $Snap.unit))
; [eval] (forall j: Int :: { (j in [0..|S|)) } { S[j] } (j in [0..|S|)) ==> S[j].f > 0)
(declare-const j@35@01 Int)
(push) ; 2
; [eval] (j in [0..|S|)) ==> S[j].f > 0
; [eval] (j in [0..|S|))
; [eval] [0..|S|)
; [eval] |S|
(push) ; 3
; [then-branch: 9 | j@35@01 in [0..|S@27@01|] | live]
; [else-branch: 9 | !(j@35@01 in [0..|S@27@01|]) | live]
(push) ; 4
; [then-branch: 9 | j@35@01 in [0..|S@27@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@35@01))
; [eval] S[j].f > 0
; [eval] S[j]
(push) ; 5
(assert (not (>= j@35@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< j@35@01 (Seq_length S@27@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (and
  (img@34@01 (Seq_index S@27@01 j@35@01))
  (Seq_contains
    (Seq_range 0 (Seq_length S@27@01))
    (inv@33@01 (Seq_index S@27@01 j@35@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 9 | !(j@35@01 in [0..|S@27@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@35@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or
  (not (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@35@01))
  (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@35@01)))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@35@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@35@01))
    (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@35@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@35@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length S@27@01)) j@35@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@23@12@23@56-aux|)))
(assert (forall ((j@35@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@35@01))
    (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@35@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length S@27@01)) j@35@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@23@12@23@56-aux|)))
(assert (forall ((j@35@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@35@01))
    (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@35@01))
  :pattern ((Seq_index S@27@01 j@35@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@23@12@23@56-aux|)))
(assert (forall ((j@35@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@35@01)
    (>
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@29@01))))) (Seq_index
        S@27@01
        j@35@01))
      0))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@35@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length S@27@01)) j@35@01))
  :pattern ((Seq_index S@27@01 j@35@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@23@12@23@56|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@36@01 $Snap)
(assert (= $t@36@01 ($Snap.combine ($Snap.first $t@36@01) ($Snap.second $t@36@01))))
(declare-const j@37@01 Int)
(push) ; 3
; [eval] (j in [0..|S|))
; [eval] [0..|S|)
; [eval] |S|
(assert (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@37@01))
; [eval] S[j]
(push) ; 4
(assert (not (>= j@37@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< j@37@01 (Seq_length S@27@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@38@01 ($Ref) Int)
(declare-fun img@39@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j1@37@01 Int) (j2@37@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j1@37@01)
      (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j2@37@01)
      (= (Seq_index S@27@01 j1@37@01) (Seq_index S@27@01 j2@37@01)))
    (= j1@37@01 j2@37@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@37@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@37@01)
    (and
      (= (inv@38@01 (Seq_index S@27@01 j@37@01)) j@37@01)
      (img@39@01 (Seq_index S@27@01 j@37@01))))
  :pattern ((Seq_index S@27@01 j@37@01))
  :qid |quant-u-17|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@39@01 r)
      (Seq_contains (Seq_range 0 (Seq_length S@27@01)) (inv@38@01 r)))
    (= (Seq_index S@27@01 (inv@38@01 r)) r))
  :pattern ((inv@38@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j@37@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@37@01)
    (not (= (Seq_index S@27@01 j@37@01) $Ref.null)))
  :pattern ((Seq_index S@27@01 j@37@01))
  :qid |f-permImpliesNonNull|)))
(assert (= ($Snap.second $t@36@01) $Snap.unit))
; [eval] (forall j: Int :: { (j in [0..|S|)) } { S[j] } (j in [0..|S|)) ==> S[j].f > 0)
(declare-const j@40@01 Int)
(push) ; 3
; [eval] (j in [0..|S|)) ==> S[j].f > 0
; [eval] (j in [0..|S|))
; [eval] [0..|S|)
; [eval] |S|
(push) ; 4
; [then-branch: 10 | j@40@01 in [0..|S@27@01|] | live]
; [else-branch: 10 | !(j@40@01 in [0..|S@27@01|]) | live]
(push) ; 5
; [then-branch: 10 | j@40@01 in [0..|S@27@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@40@01))
; [eval] S[j].f > 0
; [eval] S[j]
(push) ; 6
(assert (not (>= j@40@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< j@40@01 (Seq_length S@27@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (and
  (img@39@01 (Seq_index S@27@01 j@40@01))
  (Seq_contains
    (Seq_range 0 (Seq_length S@27@01))
    (inv@38@01 (Seq_index S@27@01 j@40@01))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 10 | !(j@40@01 in [0..|S@27@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@40@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@40@01))
  (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@40@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@40@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@40@01))
    (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@40@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@40@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length S@27@01)) j@40@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@25@11@25@55-aux|)))
(assert (forall ((j@40@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@40@01))
    (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@40@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length S@27@01)) j@40@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@25@11@25@55-aux|)))
(assert (forall ((j@40@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@40@01))
    (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@40@01))
  :pattern ((Seq_index S@27@01 j@40@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@25@11@25@55-aux|)))
(assert (forall ((j@40@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@40@01)
    (>
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@36@01)) (Seq_index
        S@27@01
        j@40@01))
      0))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@40@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length S@27@01)) j@40@01))
  :pattern ((Seq_index S@27@01 j@40@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@25@11@25@55|)))
(pop) ; 2
(push) ; 2
; [exec]
; S[a].f := -1
; [eval] S[a]
(push) ; 3
(assert (not (>= a@28@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] -1
; Precomputing data for removing quantified permissions
(define-fun pTaken@41@01 ((r $Ref)) $Perm
  (ite
    (= r (Seq_index S@27@01 a@28@01))
    ($Perm.min
      (ite
        (and
          (img@34@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@27@01)) (inv@33@01 r)))
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
          (img@34@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@27@01)) (inv@33@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@41@01 r))
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
  (= (pTaken@41@01 r) $Perm.No)
  
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
    (= r (Seq_index S@27@01 a@28@01))
    (= (- $Perm.Write (pTaken@41@01 r)) $Perm.No))
  
  :qid |quant-u-21|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@42@01 $FVF<f>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_f (as sm@42@01  $FVF<f>) (Seq_index S@27@01 a@28@01)) (- 0 1)))
; [exec]
; assert (forall j: Int ::
;     { (j in [0..|S|)) }
;     { S[j] }
;     (j in [0..|S|)) ==> S[j].f > 0)
; [eval] (forall j: Int :: { (j in [0..|S|)) } { S[j] } (j in [0..|S|)) ==> S[j].f > 0)
(declare-const j@43@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (j in [0..|S|)) ==> S[j].f > 0
; [eval] (j in [0..|S|))
; [eval] [0..|S|)
; [eval] |S|
(push) ; 4
; [then-branch: 11 | j@43@01 in [0..|S@27@01|] | live]
; [else-branch: 11 | !(j@43@01 in [0..|S@27@01|]) | live]
(push) ; 5
; [then-branch: 11 | j@43@01 in [0..|S@27@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@43@01))
; [eval] S[j].f > 0
; [eval] S[j]
(push) ; 6
(assert (not (>= j@43@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< j@43@01 (Seq_length S@27@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(declare-const sm@44@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index S@27@01 a@28@01))
    (=
      ($FVF.lookup_f (as sm@44@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@42@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@44@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@42@01  $FVF<f>) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@34@01 r)
        (Seq_contains (Seq_range 0 (Seq_length S@27@01)) (inv@33@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@41@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@44@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@29@01))))) r)))
  :pattern (($FVF.lookup_f (as sm@44@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@29@01))))) r))
  :qid |qp.fvfValDef3|)))
(declare-const pm@45@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@45@01  $FPM) r)
    (+
      (ite (= r (Seq_index S@27@01 a@28@01)) $Perm.Write $Perm.No)
      (ite
        (and
          (img@34@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@27@01)) (inv@33@01 r)))
        (- $Perm.Write (pTaken@41@01 r))
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@45@01  $FPM) r))
  :qid |qp.resPrmSumDef4|)))
(push) ; 6
(assert (not (< $Perm.No ($FVF.perm_f (as pm@45@01  $FPM) (Seq_index S@27@01 j@43@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 11 | !(j@43@01 in [0..|S@27@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@43@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index S@27@01 a@28@01))
    (=
      ($FVF.lookup_f (as sm@44@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@42@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@44@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@42@01  $FVF<f>) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@34@01 r)
        (Seq_contains (Seq_range 0 (Seq_length S@27@01)) (inv@33@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@41@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@44@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@29@01))))) r)))
  :pattern (($FVF.lookup_f (as sm@44@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@29@01))))) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@45@01  $FPM) r)
    (+
      (ite (= r (Seq_index S@27@01 a@28@01)) $Perm.Write $Perm.No)
      (ite
        (and
          (img@34@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@27@01)) (inv@33@01 r)))
        (- $Perm.Write (pTaken@41@01 r))
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@45@01  $FPM) r))
  :qid |qp.resPrmSumDef4|)))
; Joined path conditions
(assert (or
  (not (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@43@01))
  (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@43@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index S@27@01 a@28@01))
    (=
      ($FVF.lookup_f (as sm@44@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@42@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@44@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@42@01  $FVF<f>) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@34@01 r)
        (Seq_contains (Seq_range 0 (Seq_length S@27@01)) (inv@33@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@41@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@44@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@29@01))))) r)))
  :pattern (($FVF.lookup_f (as sm@44@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@29@01))))) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@45@01  $FPM) r)
    (+
      (ite (= r (Seq_index S@27@01 a@28@01)) $Perm.Write $Perm.No)
      (ite
        (and
          (img@34@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@27@01)) (inv@33@01 r)))
        (- $Perm.Write (pTaken@41@01 r))
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@45@01  $FPM) r))
  :qid |qp.resPrmSumDef4|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@43@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@43@01))
    (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@43@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@43@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length S@27@01)) j@43@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@29@11@29@55-aux|)))
(assert (forall ((j@43@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@43@01))
    (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@43@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length S@27@01)) j@43@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@29@11@29@55-aux|)))
(assert (forall ((j@43@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@43@01))
    (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@43@01))
  :pattern ((Seq_index S@27@01 j@43@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@29@11@29@55-aux|)))
(push) ; 3
(assert (not (forall ((j@43@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@43@01)
    (> ($FVF.lookup_f (as sm@44@01  $FVF<f>) (Seq_index S@27@01 j@43@01)) 0))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@43@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length S@27@01)) j@43@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length S@27@01)) j@43@01))
  :pattern ((Seq_index S@27@01 j@43@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@29@11@29@55|))))
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
(declare-const sm@46@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index S@27@01 a@28@01))
    (=
      ($FVF.lookup_f (as sm@46@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@42@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@46@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@42@01  $FVF<f>) r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@34@01 r)
        (Seq_contains (Seq_range 0 (Seq_length S@27@01)) (inv@33@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@41@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@46@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@29@01))))) r)))
  :pattern (($FVF.lookup_f (as sm@46@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@29@01))))) r))
  :qid |qp.fvfValDef6|)))
(declare-const pm@47@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@47@01  $FPM) r)
    (+
      (ite (= r (Seq_index S@27@01 a@28@01)) $Perm.Write $Perm.No)
      (ite
        (and
          (img@34@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@27@01)) (inv@33@01 r)))
        (- $Perm.Write (pTaken@41@01 r))
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@47@01  $FPM) r))
  :qid |qp.resPrmSumDef7|)))
(assert (<= ($FVF.perm_f (as pm@47@01  $FPM) (Seq_index S@27@01 a@28@01)) $Perm.Write))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@47@01  $FPM) r) $Perm.Write)
  :pattern ((inv@33@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] (forall j: Int :: { (j in [0..|S|)) } { S[j] } (j in [0..|S|)) ==> S[j].f > 0)
(declare-const j@48@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (j in [0..|S|)) ==> S[j].f > 0
; [eval] (j in [0..|S|))
; [eval] [0..|S|)
; [eval] |S|
(push) ; 4
; [then-branch: 12 | j@48@01 in [0..|S@27@01|] | live]
; [else-branch: 12 | !(j@48@01 in [0..|S@27@01|]) | live]
(push) ; 5
; [then-branch: 12 | j@48@01 in [0..|S@27@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@48@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const sm@49@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@34@01 r)
        (Seq_contains (Seq_range 0 (Seq_length S@27@01)) (inv@33@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@41@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@49@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@29@01))))) r)))
  :pattern (($FVF.lookup_f (as sm@49@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@29@01))))) r))
  :qid |qp.fvfValDef8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index S@27@01 a@28@01))
    (=
      ($FVF.lookup_f (as sm@49@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@42@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@49@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@42@01  $FVF<f>) r))
  :qid |qp.fvfValDef9|)))
(declare-const pm@50@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@50@01  $FPM) r)
    (+
      (ite
        (and
          (img@34@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@27@01)) (inv@33@01 r)))
        (- $Perm.Write (pTaken@41@01 r))
        $Perm.No)
      (ite (= r (Seq_index S@27@01 a@28@01)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@50@01  $FPM) r))
  :qid |qp.resPrmSumDef10|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@50@01  $FPM) r) $Perm.Write)
  :pattern ((inv@33@01 r))
  :qid |qp-fld-prm-bnd|)))
(assert (<= ($FVF.perm_f (as pm@50@01  $FPM) (Seq_index S@27@01 a@28@01)) $Perm.Write))
; [eval] S[j].f > 0
; [eval] S[j]
(set-option :timeout 0)
(push) ; 6
(assert (not (>= j@48@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< j@48@01 (Seq_length S@27@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r (Seq_index S@27@01 a@28@01))
      (=
        ($FVF.lookup_f (as sm@46@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@42@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@46@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@42@01  $FVF<f>) r))
    :qid |qp.fvfValDef5|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and
          (img@34@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@27@01)) (inv@33@01 r)))
        (< $Perm.No (- $Perm.Write (pTaken@41@01 r)))
        false)
      (=
        ($FVF.lookup_f (as sm@46@01  $FVF<f>) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@29@01))))) r)))
    :pattern (($FVF.lookup_f (as sm@46@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@29@01))))) r))
    :qid |qp.fvfValDef6|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (ite
      (= (Seq_index S@27@01 j@48@01) (Seq_index S@27@01 a@28@01))
      $Perm.Write
      $Perm.No)
    (ite
      (and
        (img@34@01 (Seq_index S@27@01 j@48@01))
        (Seq_contains
          (Seq_range 0 (Seq_length S@27@01))
          (inv@33@01 (Seq_index S@27@01 j@48@01))))
      (- $Perm.Write (pTaken@41@01 (Seq_index S@27@01 j@48@01)))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 12 | !(j@48@01 in [0..|S@27@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@48@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const sm@51@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@34@01 r)
        (Seq_contains (Seq_range 0 (Seq_length S@27@01)) (inv@33@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@41@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@51@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@29@01))))) r)))
  :pattern (($FVF.lookup_f (as sm@51@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@29@01))))) r))
  :qid |qp.fvfValDef11|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index S@27@01 a@28@01))
    (=
      ($FVF.lookup_f (as sm@51@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@42@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@51@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@42@01  $FVF<f>) r))
  :qid |qp.fvfValDef12|)))
(declare-const pm@52@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@52@01  $FPM) r)
    (+
      (ite
        (and
          (img@34@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@27@01)) (inv@33@01 r)))
        (- $Perm.Write (pTaken@41@01 r))
        $Perm.No)
      (ite (= r (Seq_index S@27@01 a@28@01)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@52@01  $FPM) r))
  :qid |qp.resPrmSumDef13|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@52@01  $FPM) r) $Perm.Write)
  :pattern ((inv@33@01 r))
  :qid |qp-fld-prm-bnd|)))
(assert (<= ($FVF.perm_f (as pm@52@01  $FPM) (Seq_index S@27@01 a@28@01)) $Perm.Write))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@34@01 r)
        (Seq_contains (Seq_range 0 (Seq_length S@27@01)) (inv@33@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@41@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@49@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@29@01))))) r)))
  :pattern (($FVF.lookup_f (as sm@49@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@29@01))))) r))
  :qid |qp.fvfValDef8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index S@27@01 a@28@01))
    (=
      ($FVF.lookup_f (as sm@49@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@42@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@49@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@42@01  $FVF<f>) r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@50@01  $FPM) r)
    (+
      (ite
        (and
          (img@34@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@27@01)) (inv@33@01 r)))
        (- $Perm.Write (pTaken@41@01 r))
        $Perm.No)
      (ite (= r (Seq_index S@27@01 a@28@01)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@50@01  $FPM) r))
  :qid |qp.resPrmSumDef10|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index S@27@01 a@28@01))
    (=
      ($FVF.lookup_f (as sm@46@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@42@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@46@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@42@01  $FVF<f>) r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@34@01 r)
        (Seq_contains (Seq_range 0 (Seq_length S@27@01)) (inv@33@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@41@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@46@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@29@01))))) r)))
  :pattern (($FVF.lookup_f (as sm@46@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@29@01))))) r))
  :qid |qp.fvfValDef6|)))
(assert (=>
  (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@48@01)
  (and
    (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@48@01)
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@50@01  $FPM) r) $Perm.Write)
      :pattern ((inv@33@01 r))
      :qid |qp-fld-prm-bnd|))
    (<=
      ($FVF.perm_f (as pm@50@01  $FPM) (Seq_index S@27@01 a@28@01))
      $Perm.Write))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@34@01 r)
        (Seq_contains (Seq_range 0 (Seq_length S@27@01)) (inv@33@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@41@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@51@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@29@01))))) r)))
  :pattern (($FVF.lookup_f (as sm@51@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@29@01))))) r))
  :qid |qp.fvfValDef11|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index S@27@01 a@28@01))
    (=
      ($FVF.lookup_f (as sm@51@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@42@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@51@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@42@01  $FVF<f>) r))
  :qid |qp.fvfValDef12|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@52@01  $FPM) r)
    (+
      (ite
        (and
          (img@34@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@27@01)) (inv@33@01 r)))
        (- $Perm.Write (pTaken@41@01 r))
        $Perm.No)
      (ite (= r (Seq_index S@27@01 a@28@01)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@52@01  $FPM) r))
  :qid |qp.resPrmSumDef13|)))
(assert (=>
  (not (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@48@01))
  (and
    (not (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@48@01))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@52@01  $FPM) r) $Perm.Write)
      :pattern ((inv@33@01 r))
      :qid |qp-fld-prm-bnd|))
    (<=
      ($FVF.perm_f (as pm@52@01  $FPM) (Seq_index S@27@01 a@28@01))
      $Perm.Write))))
(assert (or
  (not (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@48@01))
  (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@48@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@34@01 r)
        (Seq_contains (Seq_range 0 (Seq_length S@27@01)) (inv@33@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@41@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@49@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@29@01))))) r)))
  :pattern (($FVF.lookup_f (as sm@49@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@29@01))))) r))
  :qid |qp.fvfValDef8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index S@27@01 a@28@01))
    (=
      ($FVF.lookup_f (as sm@49@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@42@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@49@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@42@01  $FVF<f>) r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@50@01  $FPM) r)
    (+
      (ite
        (and
          (img@34@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@27@01)) (inv@33@01 r)))
        (- $Perm.Write (pTaken@41@01 r))
        $Perm.No)
      (ite (= r (Seq_index S@27@01 a@28@01)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@50@01  $FPM) r))
  :qid |qp.resPrmSumDef10|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index S@27@01 a@28@01))
    (=
      ($FVF.lookup_f (as sm@46@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@42@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@46@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@42@01  $FVF<f>) r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@34@01 r)
        (Seq_contains (Seq_range 0 (Seq_length S@27@01)) (inv@33@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@41@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@46@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@29@01))))) r)))
  :pattern (($FVF.lookup_f (as sm@46@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@29@01))))) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@34@01 r)
        (Seq_contains (Seq_range 0 (Seq_length S@27@01)) (inv@33@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@41@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@51@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@29@01))))) r)))
  :pattern (($FVF.lookup_f (as sm@51@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@29@01))))) r))
  :qid |qp.fvfValDef11|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index S@27@01 a@28@01))
    (=
      ($FVF.lookup_f (as sm@51@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@42@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@51@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@42@01  $FVF<f>) r))
  :qid |qp.fvfValDef12|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@52@01  $FPM) r)
    (+
      (ite
        (and
          (img@34@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@27@01)) (inv@33@01 r)))
        (- $Perm.Write (pTaken@41@01 r))
        $Perm.No)
      (ite (= r (Seq_index S@27@01 a@28@01)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@52@01  $FPM) r))
  :qid |qp.resPrmSumDef13|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@48@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@48@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@48@01)
        (forall ((r $Ref)) (!
          (<= ($FVF.perm_f (as pm@50@01  $FPM) r) $Perm.Write)
          :pattern ((inv@33@01 r))
          :qid |qp-fld-prm-bnd|))
        (<=
          ($FVF.perm_f (as pm@50@01  $FPM) (Seq_index S@27@01 a@28@01))
          $Perm.Write)))
    (=>
      (not (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@48@01))
      (and
        (not (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@48@01))
        (forall ((r $Ref)) (!
          (<= ($FVF.perm_f (as pm@52@01  $FPM) r) $Perm.Write)
          :pattern ((inv@33@01 r))
          :qid |qp-fld-prm-bnd|))
        (<=
          ($FVF.perm_f (as pm@52@01  $FPM) (Seq_index S@27@01 a@28@01))
          $Perm.Write)))
    (or
      (not (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@48@01))
      (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@48@01)))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@48@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length S@27@01)) j@48@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@29@11@29@55-aux|)))
(assert (forall ((j@48@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@48@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@48@01)
        (forall ((r $Ref)) (!
          (<= ($FVF.perm_f (as pm@50@01  $FPM) r) $Perm.Write)
          :pattern ((inv@33@01 r))
          :qid |qp-fld-prm-bnd|))
        (<=
          ($FVF.perm_f (as pm@50@01  $FPM) (Seq_index S@27@01 a@28@01))
          $Perm.Write)))
    (=>
      (not (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@48@01))
      (and
        (not (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@48@01))
        (forall ((r $Ref)) (!
          (<= ($FVF.perm_f (as pm@52@01  $FPM) r) $Perm.Write)
          :pattern ((inv@33@01 r))
          :qid |qp-fld-prm-bnd|))
        (<=
          ($FVF.perm_f (as pm@52@01  $FPM) (Seq_index S@27@01 a@28@01))
          $Perm.Write)))
    (or
      (not (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@48@01))
      (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@48@01)))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length S@27@01)) j@48@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@29@11@29@55-aux|)))
(assert (forall ((j@48@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@48@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@48@01)
        (forall ((r $Ref)) (!
          (<= ($FVF.perm_f (as pm@50@01  $FPM) r) $Perm.Write)
          :pattern ((inv@33@01 r))
          :qid |qp-fld-prm-bnd|))
        (<=
          ($FVF.perm_f (as pm@50@01  $FPM) (Seq_index S@27@01 a@28@01))
          $Perm.Write)))
    (=>
      (not (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@48@01))
      (and
        (not (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@48@01))
        (forall ((r $Ref)) (!
          (<= ($FVF.perm_f (as pm@52@01  $FPM) r) $Perm.Write)
          :pattern ((inv@33@01 r))
          :qid |qp-fld-prm-bnd|))
        (<=
          ($FVF.perm_f (as pm@52@01  $FPM) (Seq_index S@27@01 a@28@01))
          $Perm.Write)))
    (or
      (not (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@48@01))
      (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@48@01)))
  :pattern ((Seq_index S@27@01 j@48@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@29@11@29@55-aux|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((j@48@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@48@01)
    (> ($FVF.lookup_f (as sm@46@01  $FVF<f>) (Seq_index S@27@01 j@48@01)) 0))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@48@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length S@27@01)) j@48@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length S@27@01)) j@48@01))
  :pattern ((Seq_index S@27@01 j@48@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@29@11@29@55|))))
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
(declare-const sm@53@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index S@27@01 a@28@01))
    (=
      ($FVF.lookup_f (as sm@53@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@42@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@53@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@42@01  $FVF<f>) r))
  :qid |qp.fvfValDef14|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@34@01 r)
        (Seq_contains (Seq_range 0 (Seq_length S@27@01)) (inv@33@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@41@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@53@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@29@01))))) r)))
  :pattern (($FVF.lookup_f (as sm@53@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@29@01))))) r))
  :qid |qp.fvfValDef15|)))
(declare-const pm@54@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@54@01  $FPM) r)
    (+
      (ite (= r (Seq_index S@27@01 a@28@01)) $Perm.Write $Perm.No)
      (ite
        (and
          (img@34@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@27@01)) (inv@33@01 r)))
        (- $Perm.Write (pTaken@41@01 r))
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@54@01  $FPM) r))
  :qid |qp.resPrmSumDef16|)))
(assert (<= ($FVF.perm_f (as pm@54@01  $FPM) (Seq_index S@27@01 a@28@01)) $Perm.Write))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@54@01  $FPM) r) $Perm.Write)
  :pattern ((inv@33@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] (forall j: Int :: { (j in [0..|S|)) } { S[j] } (j in [0..|S|)) ==> S[j].f > 0)
(declare-const j@55@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (j in [0..|S|)) ==> S[j].f > 0
; [eval] (j in [0..|S|))
; [eval] [0..|S|)
; [eval] |S|
(push) ; 4
; [then-branch: 13 | j@55@01 in [0..|S@27@01|] | live]
; [else-branch: 13 | !(j@55@01 in [0..|S@27@01|]) | live]
(push) ; 5
; [then-branch: 13 | j@55@01 in [0..|S@27@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@55@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; [eval] S[j].f > 0
; [eval] S[j]
(set-option :timeout 0)
(push) ; 6
(assert (not (>= j@55@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< j@55@01 (Seq_length S@27@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(declare-const sm@56@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@34@01 r)
        (Seq_contains (Seq_range 0 (Seq_length S@27@01)) (inv@33@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@41@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@56@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@29@01))))) r)))
  :pattern (($FVF.lookup_f (as sm@56@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@29@01))))) r))
  :qid |qp.fvfValDef17|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index S@27@01 a@28@01))
    (=
      ($FVF.lookup_f (as sm@56@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@42@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@56@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@42@01  $FVF<f>) r))
  :qid |qp.fvfValDef18|)))
(declare-const pm@57@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@57@01  $FPM) r)
    (+
      (ite
        (and
          (img@34@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@27@01)) (inv@33@01 r)))
        (- $Perm.Write (pTaken@41@01 r))
        $Perm.No)
      (ite (= r (Seq_index S@27@01 a@28@01)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@57@01  $FPM) r))
  :qid |qp.resPrmSumDef19|)))
(push) ; 6
(assert (not (< $Perm.No ($FVF.perm_f (as pm@57@01  $FPM) (Seq_index S@27@01 j@55@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 13 | !(j@55@01 in [0..|S@27@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@55@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@34@01 r)
        (Seq_contains (Seq_range 0 (Seq_length S@27@01)) (inv@33@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@41@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@56@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@29@01))))) r)))
  :pattern (($FVF.lookup_f (as sm@56@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@29@01))))) r))
  :qid |qp.fvfValDef17|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index S@27@01 a@28@01))
    (=
      ($FVF.lookup_f (as sm@56@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@42@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@56@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@42@01  $FVF<f>) r))
  :qid |qp.fvfValDef18|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@57@01  $FPM) r)
    (+
      (ite
        (and
          (img@34@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@27@01)) (inv@33@01 r)))
        (- $Perm.Write (pTaken@41@01 r))
        $Perm.No)
      (ite (= r (Seq_index S@27@01 a@28@01)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@57@01  $FPM) r))
  :qid |qp.resPrmSumDef19|)))
; Joined path conditions
(assert (or
  (not (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@55@01))
  (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@55@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@34@01 r)
        (Seq_contains (Seq_range 0 (Seq_length S@27@01)) (inv@33@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@41@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@56@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@29@01))))) r)))
  :pattern (($FVF.lookup_f (as sm@56@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@29@01))))) r))
  :qid |qp.fvfValDef17|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index S@27@01 a@28@01))
    (=
      ($FVF.lookup_f (as sm@56@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@42@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@56@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@42@01  $FVF<f>) r))
  :qid |qp.fvfValDef18|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@57@01  $FPM) r)
    (+
      (ite
        (and
          (img@34@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@27@01)) (inv@33@01 r)))
        (- $Perm.Write (pTaken@41@01 r))
        $Perm.No)
      (ite (= r (Seq_index S@27@01 a@28@01)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@57@01  $FPM) r))
  :qid |qp.resPrmSumDef19|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@55@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@55@01))
    (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@55@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@55@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length S@27@01)) j@55@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@29@11@29@55-aux|)))
(assert (forall ((j@55@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@55@01))
    (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@55@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length S@27@01)) j@55@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@29@11@29@55-aux|)))
(assert (forall ((j@55@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@55@01))
    (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@55@01))
  :pattern ((Seq_index S@27@01 j@55@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@29@11@29@55-aux|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((j@55@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@55@01)
    (> ($FVF.lookup_f (as sm@56@01  $FVF<f>) (Seq_index S@27@01 j@55@01)) 0))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@55@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length S@27@01)) j@55@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length S@27@01)) j@55@01))
  :pattern ((Seq_index S@27@01 j@55@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@29@11@29@55|))))
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
; Assume upper permission bound for field f
; [eval] (forall j: Int :: { (j in [0..|S|)) } { S[j] } (j in [0..|S|)) ==> S[j].f > 0)
(declare-const j@58@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (j in [0..|S|)) ==> S[j].f > 0
; [eval] (j in [0..|S|))
; [eval] [0..|S|)
; [eval] |S|
(push) ; 4
; [then-branch: 14 | j@58@01 in [0..|S@27@01|] | live]
; [else-branch: 14 | !(j@58@01 in [0..|S@27@01|]) | live]
(push) ; 5
; [then-branch: 14 | j@58@01 in [0..|S@27@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@58@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const sm@59@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@34@01 r)
        (Seq_contains (Seq_range 0 (Seq_length S@27@01)) (inv@33@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@41@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@59@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@29@01))))) r)))
  :pattern (($FVF.lookup_f (as sm@59@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@29@01))))) r))
  :qid |qp.fvfValDef20|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index S@27@01 a@28@01))
    (=
      ($FVF.lookup_f (as sm@59@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@42@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@59@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@42@01  $FVF<f>) r))
  :qid |qp.fvfValDef21|)))
(declare-const pm@60@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@60@01  $FPM) r)
    (+
      (ite
        (and
          (img@34@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@27@01)) (inv@33@01 r)))
        (- $Perm.Write (pTaken@41@01 r))
        $Perm.No)
      (ite (= r (Seq_index S@27@01 a@28@01)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@60@01  $FPM) r))
  :qid |qp.resPrmSumDef22|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@60@01  $FPM) r) $Perm.Write)
  :pattern ((inv@33@01 r))
  :qid |qp-fld-prm-bnd|)))
(assert (<= ($FVF.perm_f (as pm@60@01  $FPM) (Seq_index S@27@01 a@28@01)) $Perm.Write))
; [eval] S[j].f > 0
; [eval] S[j]
(set-option :timeout 0)
(push) ; 6
(assert (not (>= j@58@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< j@58@01 (Seq_length S@27@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r (Seq_index S@27@01 a@28@01))
      (=
        ($FVF.lookup_f (as sm@53@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@42@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@53@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@42@01  $FVF<f>) r))
    :qid |qp.fvfValDef14|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and
          (img@34@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@27@01)) (inv@33@01 r)))
        (< $Perm.No (- $Perm.Write (pTaken@41@01 r)))
        false)
      (=
        ($FVF.lookup_f (as sm@53@01  $FVF<f>) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@29@01))))) r)))
    :pattern (($FVF.lookup_f (as sm@53@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@29@01))))) r))
    :qid |qp.fvfValDef15|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (ite
      (= (Seq_index S@27@01 j@58@01) (Seq_index S@27@01 a@28@01))
      $Perm.Write
      $Perm.No)
    (ite
      (and
        (img@34@01 (Seq_index S@27@01 j@58@01))
        (Seq_contains
          (Seq_range 0 (Seq_length S@27@01))
          (inv@33@01 (Seq_index S@27@01 j@58@01))))
      (- $Perm.Write (pTaken@41@01 (Seq_index S@27@01 j@58@01)))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 14 | !(j@58@01 in [0..|S@27@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@58@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const sm@61@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@34@01 r)
        (Seq_contains (Seq_range 0 (Seq_length S@27@01)) (inv@33@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@41@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@61@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@29@01))))) r)))
  :pattern (($FVF.lookup_f (as sm@61@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@29@01))))) r))
  :qid |qp.fvfValDef23|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index S@27@01 a@28@01))
    (=
      ($FVF.lookup_f (as sm@61@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@42@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@61@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@42@01  $FVF<f>) r))
  :qid |qp.fvfValDef24|)))
(declare-const pm@62@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@62@01  $FPM) r)
    (+
      (ite
        (and
          (img@34@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@27@01)) (inv@33@01 r)))
        (- $Perm.Write (pTaken@41@01 r))
        $Perm.No)
      (ite (= r (Seq_index S@27@01 a@28@01)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@62@01  $FPM) r))
  :qid |qp.resPrmSumDef25|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@62@01  $FPM) r) $Perm.Write)
  :pattern ((inv@33@01 r))
  :qid |qp-fld-prm-bnd|)))
(assert (<= ($FVF.perm_f (as pm@62@01  $FPM) (Seq_index S@27@01 a@28@01)) $Perm.Write))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@34@01 r)
        (Seq_contains (Seq_range 0 (Seq_length S@27@01)) (inv@33@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@41@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@59@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@29@01))))) r)))
  :pattern (($FVF.lookup_f (as sm@59@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@29@01))))) r))
  :qid |qp.fvfValDef20|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index S@27@01 a@28@01))
    (=
      ($FVF.lookup_f (as sm@59@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@42@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@59@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@42@01  $FVF<f>) r))
  :qid |qp.fvfValDef21|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@60@01  $FPM) r)
    (+
      (ite
        (and
          (img@34@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@27@01)) (inv@33@01 r)))
        (- $Perm.Write (pTaken@41@01 r))
        $Perm.No)
      (ite (= r (Seq_index S@27@01 a@28@01)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@60@01  $FPM) r))
  :qid |qp.resPrmSumDef22|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index S@27@01 a@28@01))
    (=
      ($FVF.lookup_f (as sm@53@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@42@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@53@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@42@01  $FVF<f>) r))
  :qid |qp.fvfValDef14|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@34@01 r)
        (Seq_contains (Seq_range 0 (Seq_length S@27@01)) (inv@33@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@41@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@53@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@29@01))))) r)))
  :pattern (($FVF.lookup_f (as sm@53@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@29@01))))) r))
  :qid |qp.fvfValDef15|)))
(assert (=>
  (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@58@01)
  (and
    (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@58@01)
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@60@01  $FPM) r) $Perm.Write)
      :pattern ((inv@33@01 r))
      :qid |qp-fld-prm-bnd|))
    (<=
      ($FVF.perm_f (as pm@60@01  $FPM) (Seq_index S@27@01 a@28@01))
      $Perm.Write))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@34@01 r)
        (Seq_contains (Seq_range 0 (Seq_length S@27@01)) (inv@33@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@41@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@61@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@29@01))))) r)))
  :pattern (($FVF.lookup_f (as sm@61@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@29@01))))) r))
  :qid |qp.fvfValDef23|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index S@27@01 a@28@01))
    (=
      ($FVF.lookup_f (as sm@61@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@42@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@61@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@42@01  $FVF<f>) r))
  :qid |qp.fvfValDef24|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@62@01  $FPM) r)
    (+
      (ite
        (and
          (img@34@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@27@01)) (inv@33@01 r)))
        (- $Perm.Write (pTaken@41@01 r))
        $Perm.No)
      (ite (= r (Seq_index S@27@01 a@28@01)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@62@01  $FPM) r))
  :qid |qp.resPrmSumDef25|)))
(assert (=>
  (not (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@58@01))
  (and
    (not (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@58@01))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@62@01  $FPM) r) $Perm.Write)
      :pattern ((inv@33@01 r))
      :qid |qp-fld-prm-bnd|))
    (<=
      ($FVF.perm_f (as pm@62@01  $FPM) (Seq_index S@27@01 a@28@01))
      $Perm.Write))))
(assert (or
  (not (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@58@01))
  (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@58@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@34@01 r)
        (Seq_contains (Seq_range 0 (Seq_length S@27@01)) (inv@33@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@41@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@59@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@29@01))))) r)))
  :pattern (($FVF.lookup_f (as sm@59@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@29@01))))) r))
  :qid |qp.fvfValDef20|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index S@27@01 a@28@01))
    (=
      ($FVF.lookup_f (as sm@59@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@42@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@59@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@42@01  $FVF<f>) r))
  :qid |qp.fvfValDef21|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@60@01  $FPM) r)
    (+
      (ite
        (and
          (img@34@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@27@01)) (inv@33@01 r)))
        (- $Perm.Write (pTaken@41@01 r))
        $Perm.No)
      (ite (= r (Seq_index S@27@01 a@28@01)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@60@01  $FPM) r))
  :qid |qp.resPrmSumDef22|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index S@27@01 a@28@01))
    (=
      ($FVF.lookup_f (as sm@53@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@42@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@53@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@42@01  $FVF<f>) r))
  :qid |qp.fvfValDef14|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@34@01 r)
        (Seq_contains (Seq_range 0 (Seq_length S@27@01)) (inv@33@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@41@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@53@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@29@01))))) r)))
  :pattern (($FVF.lookup_f (as sm@53@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@29@01))))) r))
  :qid |qp.fvfValDef15|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@34@01 r)
        (Seq_contains (Seq_range 0 (Seq_length S@27@01)) (inv@33@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@41@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@61@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@29@01))))) r)))
  :pattern (($FVF.lookup_f (as sm@61@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@29@01))))) r))
  :qid |qp.fvfValDef23|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index S@27@01 a@28@01))
    (=
      ($FVF.lookup_f (as sm@61@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@42@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@61@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@42@01  $FVF<f>) r))
  :qid |qp.fvfValDef24|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@62@01  $FPM) r)
    (+
      (ite
        (and
          (img@34@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@27@01)) (inv@33@01 r)))
        (- $Perm.Write (pTaken@41@01 r))
        $Perm.No)
      (ite (= r (Seq_index S@27@01 a@28@01)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@62@01  $FPM) r))
  :qid |qp.resPrmSumDef25|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@58@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@58@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@58@01)
        (forall ((r $Ref)) (!
          (<= ($FVF.perm_f (as pm@60@01  $FPM) r) $Perm.Write)
          :pattern ((inv@33@01 r))
          :qid |qp-fld-prm-bnd|))
        (<=
          ($FVF.perm_f (as pm@60@01  $FPM) (Seq_index S@27@01 a@28@01))
          $Perm.Write)))
    (=>
      (not (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@58@01))
      (and
        (not (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@58@01))
        (forall ((r $Ref)) (!
          (<= ($FVF.perm_f (as pm@62@01  $FPM) r) $Perm.Write)
          :pattern ((inv@33@01 r))
          :qid |qp-fld-prm-bnd|))
        (<=
          ($FVF.perm_f (as pm@62@01  $FPM) (Seq_index S@27@01 a@28@01))
          $Perm.Write)))
    (or
      (not (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@58@01))
      (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@58@01)))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@58@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length S@27@01)) j@58@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@29@11@29@55-aux|)))
(assert (forall ((j@58@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@58@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@58@01)
        (forall ((r $Ref)) (!
          (<= ($FVF.perm_f (as pm@60@01  $FPM) r) $Perm.Write)
          :pattern ((inv@33@01 r))
          :qid |qp-fld-prm-bnd|))
        (<=
          ($FVF.perm_f (as pm@60@01  $FPM) (Seq_index S@27@01 a@28@01))
          $Perm.Write)))
    (=>
      (not (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@58@01))
      (and
        (not (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@58@01))
        (forall ((r $Ref)) (!
          (<= ($FVF.perm_f (as pm@62@01  $FPM) r) $Perm.Write)
          :pattern ((inv@33@01 r))
          :qid |qp-fld-prm-bnd|))
        (<=
          ($FVF.perm_f (as pm@62@01  $FPM) (Seq_index S@27@01 a@28@01))
          $Perm.Write)))
    (or
      (not (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@58@01))
      (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@58@01)))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length S@27@01)) j@58@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@29@11@29@55-aux|)))
(assert (forall ((j@58@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@58@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@58@01)
        (forall ((r $Ref)) (!
          (<= ($FVF.perm_f (as pm@60@01  $FPM) r) $Perm.Write)
          :pattern ((inv@33@01 r))
          :qid |qp-fld-prm-bnd|))
        (<=
          ($FVF.perm_f (as pm@60@01  $FPM) (Seq_index S@27@01 a@28@01))
          $Perm.Write)))
    (=>
      (not (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@58@01))
      (and
        (not (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@58@01))
        (forall ((r $Ref)) (!
          (<= ($FVF.perm_f (as pm@62@01  $FPM) r) $Perm.Write)
          :pattern ((inv@33@01 r))
          :qid |qp-fld-prm-bnd|))
        (<=
          ($FVF.perm_f (as pm@62@01  $FPM) (Seq_index S@27@01 a@28@01))
          $Perm.Write)))
    (or
      (not (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@58@01))
      (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@58@01)))
  :pattern ((Seq_index S@27@01 j@58@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@29@11@29@55-aux|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((j@58@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@58@01)
    (> ($FVF.lookup_f (as sm@53@01  $FVF<f>) (Seq_index S@27@01 j@58@01)) 0))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length S@27@01)) j@58@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length S@27@01)) j@58@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length S@27@01)) j@58@01))
  :pattern ((Seq_index S@27@01 j@58@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@29@11@29@55|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test03 ----------
(declare-const S@63@01 Seq<$Ref>)
(declare-const S@64@01 Seq<$Ref>)
(push) ; 1
(declare-const $t@65@01 $Snap)
(assert (= $t@65@01 ($Snap.combine ($Snap.first $t@65@01) ($Snap.second $t@65@01))))
(assert (= ($Snap.first $t@65@01) $Snap.unit))
; [eval] (forall j1: Int, j2: Int :: { (j1 in [0..|S|)), (j2 in [0..|S|)) } { (j1 in [0..|S|)), S[j2] } { (j2 in [0..|S|)), S[j1] } { S[j1], S[j2] } (j1 in [0..|S|)) && ((j2 in [0..|S|)) && j1 != j2) ==> S[j1] != S[j2])
(declare-const j1@66@01 Int)
(declare-const j2@67@01 Int)
(push) ; 2
; [eval] (j1 in [0..|S|)) && ((j2 in [0..|S|)) && j1 != j2) ==> S[j1] != S[j2]
; [eval] (j1 in [0..|S|)) && ((j2 in [0..|S|)) && j1 != j2)
; [eval] (j1 in [0..|S|))
; [eval] [0..|S|)
; [eval] |S|
(push) ; 3
; [then-branch: 15 | !(j1@66@01 in [0..|S@64@01|]) | live]
; [else-branch: 15 | j1@66@01 in [0..|S@64@01|] | live]
(push) ; 4
; [then-branch: 15 | !(j1@66@01 in [0..|S@64@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j1@66@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 15 | j1@66@01 in [0..|S@64@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j1@66@01))
; [eval] (j2 in [0..|S|))
; [eval] [0..|S|)
; [eval] |S|
(push) ; 5
; [then-branch: 16 | !(j2@67@01 in [0..|S@64@01|]) | live]
; [else-branch: 16 | j2@67@01 in [0..|S@64@01|] | live]
(push) ; 6
; [then-branch: 16 | !(j2@67@01 in [0..|S@64@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j2@67@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 16 | j2@67@01 in [0..|S@64@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j2@67@01))
; [eval] j1 != j2
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j2@67@01)
  (not (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j2@67@01))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j1@66@01)
  (and
    (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j1@66@01)
    (or
      (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j2@67@01)
      (not (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j2@67@01))))))
(assert (or
  (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j1@66@01)
  (not (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j1@66@01))))
(push) ; 3
; [then-branch: 17 | j1@66@01 in [0..|S@64@01|] && j2@67@01 in [0..|S@64@01|] && j1@66@01 != j2@67@01 | live]
; [else-branch: 17 | !(j1@66@01 in [0..|S@64@01|] && j2@67@01 in [0..|S@64@01|] && j1@66@01 != j2@67@01) | live]
(push) ; 4
; [then-branch: 17 | j1@66@01 in [0..|S@64@01|] && j2@67@01 in [0..|S@64@01|] && j1@66@01 != j2@67@01]
(assert (and
  (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j1@66@01)
  (and
    (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j2@67@01)
    (not (= j1@66@01 j2@67@01)))))
; [eval] S[j1] != S[j2]
; [eval] S[j1]
(push) ; 5
(assert (not (>= j1@66@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< j1@66@01 (Seq_length S@64@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] S[j2]
(push) ; 5
(assert (not (>= j2@67@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< j2@67@01 (Seq_length S@64@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 17 | !(j1@66@01 in [0..|S@64@01|] && j2@67@01 in [0..|S@64@01|] && j1@66@01 != j2@67@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j1@66@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j2@67@01)
      (not (= j1@66@01 j2@67@01))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j1@66@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j2@67@01)
      (not (= j1@66@01 j2@67@01))))
  (and
    (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j1@66@01)
    (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j2@67@01)
    (not (= j1@66@01 j2@67@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j1@66@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j2@67@01)
        (not (= j1@66@01 j2@67@01)))))
  (and
    (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j1@66@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j2@67@01)
      (not (= j1@66@01 j2@67@01))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j1@66@01 Int) (j2@67@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j1@66@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j1@66@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j2@67@01)
          (not (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j2@67@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j1@66@01)
      (not (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j1@66@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j1@66@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j2@67@01)
          (not (= j1@66@01 j2@67@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j1@66@01)
        (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j2@67@01)
        (not (= j1@66@01 j2@67@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j1@66@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j2@67@01)
            (not (= j1@66@01 j2@67@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j1@66@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j2@67@01)
          (not (= j1@66@01 j2@67@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length S@64@01)) j1@66@01) (Seq_contains
    (Seq_range 0 (Seq_length S@64@01))
    j2@67@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length S@64@01)) j1@66@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length S@64@01))
    j2@67@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@33@12@33@102-aux|)))
(assert (forall ((j1@66@01 Int) (j2@67@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j1@66@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j1@66@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j2@67@01)
          (not (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j2@67@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j1@66@01)
      (not (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j1@66@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j1@66@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j2@67@01)
          (not (= j1@66@01 j2@67@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j1@66@01)
        (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j2@67@01)
        (not (= j1@66@01 j2@67@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j1@66@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j2@67@01)
            (not (= j1@66@01 j2@67@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j1@66@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j2@67@01)
          (not (= j1@66@01 j2@67@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length S@64@01)) j1@66@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length S@64@01))
    j2@67@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@33@12@33@102-aux|)))
(assert (forall ((j1@66@01 Int) (j2@67@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j1@66@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j1@66@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j2@67@01)
          (not (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j2@67@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j1@66@01)
      (not (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j1@66@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j1@66@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j2@67@01)
          (not (= j1@66@01 j2@67@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j1@66@01)
        (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j2@67@01)
        (not (= j1@66@01 j2@67@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j1@66@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j2@67@01)
            (not (= j1@66@01 j2@67@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j1@66@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j2@67@01)
          (not (= j1@66@01 j2@67@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length S@64@01)) j1@66@01) (Seq_index
    S@64@01
    j2@67@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length S@64@01)) j1@66@01) (Seq_index
    S@64@01
    j2@67@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@33@12@33@102-aux|)))
(assert (forall ((j1@66@01 Int) (j2@67@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j1@66@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j1@66@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j2@67@01)
          (not (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j2@67@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j1@66@01)
      (not (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j1@66@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j1@66@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j2@67@01)
          (not (= j1@66@01 j2@67@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j1@66@01)
        (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j2@67@01)
        (not (= j1@66@01 j2@67@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j1@66@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j2@67@01)
            (not (= j1@66@01 j2@67@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j1@66@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j2@67@01)
          (not (= j1@66@01 j2@67@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length S@64@01)) j1@66@01) (Seq_index
    S@64@01
    j2@67@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@33@12@33@102-aux|)))
(assert (forall ((j1@66@01 Int) (j2@67@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j1@66@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j1@66@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j2@67@01)
          (not (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j2@67@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j1@66@01)
      (not (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j1@66@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j1@66@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j2@67@01)
          (not (= j1@66@01 j2@67@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j1@66@01)
        (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j2@67@01)
        (not (= j1@66@01 j2@67@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j1@66@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j2@67@01)
            (not (= j1@66@01 j2@67@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j1@66@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j2@67@01)
          (not (= j1@66@01 j2@67@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length S@64@01)) j2@67@01) (Seq_index
    S@64@01
    j1@66@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length S@64@01)) j2@67@01) (Seq_index
    S@64@01
    j1@66@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@33@12@33@102-aux|)))
(assert (forall ((j1@66@01 Int) (j2@67@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j1@66@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j1@66@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j2@67@01)
          (not (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j2@67@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j1@66@01)
      (not (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j1@66@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j1@66@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j2@67@01)
          (not (= j1@66@01 j2@67@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j1@66@01)
        (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j2@67@01)
        (not (= j1@66@01 j2@67@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j1@66@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j2@67@01)
            (not (= j1@66@01 j2@67@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j1@66@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j2@67@01)
          (not (= j1@66@01 j2@67@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length S@64@01)) j2@67@01) (Seq_index
    S@64@01
    j1@66@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@33@12@33@102-aux|)))
(assert (forall ((j1@66@01 Int) (j2@67@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j1@66@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j1@66@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j2@67@01)
          (not (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j2@67@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j1@66@01)
      (not (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j1@66@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j1@66@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j2@67@01)
          (not (= j1@66@01 j2@67@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j1@66@01)
        (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j2@67@01)
        (not (= j1@66@01 j2@67@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j1@66@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j2@67@01)
            (not (= j1@66@01 j2@67@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j1@66@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j2@67@01)
          (not (= j1@66@01 j2@67@01))))))
  :pattern ((Seq_index S@64@01 j1@66@01) (Seq_index S@64@01 j2@67@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@33@12@33@102-aux|)))
(assert (forall ((j1@66@01 Int) (j2@67@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j1@66@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j2@67@01)
        (not (= j1@66@01 j2@67@01))))
    (not (= (Seq_index S@64@01 j1@66@01) (Seq_index S@64@01 j2@67@01))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length S@64@01)) j1@66@01) (Seq_contains
    (Seq_range 0 (Seq_length S@64@01))
    j2@67@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length S@64@01)) j1@66@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length S@64@01))
    j2@67@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length S@64@01)) j1@66@01) (Seq_index
    S@64@01
    j2@67@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length S@64@01)) j1@66@01) (Seq_index
    S@64@01
    j2@67@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length S@64@01)) j2@67@01) (Seq_index
    S@64@01
    j1@66@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length S@64@01)) j2@67@01) (Seq_index
    S@64@01
    j1@66@01))
  :pattern ((Seq_index S@64@01 j1@66@01) (Seq_index S@64@01 j2@67@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@33@12@33@102|)))
(assert (=
  ($Snap.second $t@65@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@65@01))
    ($Snap.second ($Snap.second $t@65@01)))))
(declare-const j@68@01 Int)
(push) ; 2
; [eval] (j in [0..|S|))
; [eval] [0..|S|)
; [eval] |S|
(assert (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j@68@01))
; [eval] S[j]
(push) ; 3
(assert (not (>= j@68@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< j@68@01 (Seq_length S@64@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@69@01 ($Ref) Int)
(declare-fun img@70@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((j1@68@01 Int) (j2@68@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j1@68@01)
      (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j2@68@01)
      (= (Seq_index S@64@01 j1@68@01) (Seq_index S@64@01 j2@68@01)))
    (= j1@68@01 j2@68@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@68@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j@68@01)
    (and
      (= (inv@69@01 (Seq_index S@64@01 j@68@01)) j@68@01)
      (img@70@01 (Seq_index S@64@01 j@68@01))))
  :pattern ((Seq_index S@64@01 j@68@01))
  :qid |quant-u-23|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@70@01 r)
      (Seq_contains (Seq_range 0 (Seq_length S@64@01)) (inv@69@01 r)))
    (= (Seq_index S@64@01 (inv@69@01 r)) r))
  :pattern ((inv@69@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j@68@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j@68@01)
    (not (= (Seq_index S@64@01 j@68@01) $Ref.null)))
  :pattern ((Seq_index S@64@01 j@68@01))
  :qid |f-permImpliesNonNull|)))
(assert (= ($Snap.second ($Snap.second $t@65@01)) $Snap.unit))
; [eval] (forall j: Int :: { S[j] } (j in [0..|S| - 1)) ==> S[j].f <= S[j + 1].f)
(declare-const j@71@01 Int)
(push) ; 2
; [eval] (j in [0..|S| - 1)) ==> S[j].f <= S[j + 1].f
; [eval] (j in [0..|S| - 1))
; [eval] [0..|S| - 1)
; [eval] |S| - 1
; [eval] |S|
(push) ; 3
; [then-branch: 18 | j@71@01 in [0..|S@64@01| - 1] | live]
; [else-branch: 18 | !(j@71@01 in [0..|S@64@01| - 1]) | live]
(push) ; 4
; [then-branch: 18 | j@71@01 in [0..|S@64@01| - 1]]
(assert (Seq_contains (Seq_range 0 (- (Seq_length S@64@01) 1)) j@71@01))
; [eval] S[j].f <= S[j + 1].f
; [eval] S[j]
(push) ; 5
(assert (not (>= j@71@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< j@71@01 (Seq_length S@64@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (and
  (img@70@01 (Seq_index S@64@01 j@71@01))
  (Seq_contains
    (Seq_range 0 (Seq_length S@64@01))
    (inv@69@01 (Seq_index S@64@01 j@71@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] S[j + 1]
; [eval] j + 1
(push) ; 5
(assert (not (>= (+ j@71@01 1) 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< (+ j@71@01 1) (Seq_length S@64@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (and
  (img@70@01 (Seq_index S@64@01 (+ j@71@01 1)))
  (Seq_contains
    (Seq_range 0 (Seq_length S@64@01))
    (inv@69@01 (Seq_index S@64@01 (+ j@71@01 1)))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 18 | !(j@71@01 in [0..|S@64@01| - 1])]
(assert (not (Seq_contains (Seq_range 0 (- (Seq_length S@64@01) 1)) j@71@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or
  (not (Seq_contains (Seq_range 0 (- (Seq_length S@64@01) 1)) j@71@01))
  (Seq_contains (Seq_range 0 (- (Seq_length S@64@01) 1)) j@71@01)))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@71@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 (- (Seq_length S@64@01) 1)) j@71@01))
    (Seq_contains (Seq_range 0 (- (Seq_length S@64@01) 1)) j@71@01))
  :pattern ((Seq_index S@64@01 j@71@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@35@12@35@66-aux|)))
(assert (forall ((j@71@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (- (Seq_length S@64@01) 1)) j@71@01)
    (<=
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@65@01))) (Seq_index
        S@64@01
        j@71@01))
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@65@01))) (Seq_index
        S@64@01
        (+ j@71@01 1)))))
  :pattern ((Seq_index S@64@01 j@71@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@35@12@35@66|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@72@01 $Snap)
(assert (= $t@72@01 ($Snap.combine ($Snap.first $t@72@01) ($Snap.second $t@72@01))))
(declare-const j@73@01 Int)
(push) ; 3
; [eval] (j in [0..|S|))
; [eval] [0..|S|)
; [eval] |S|
(assert (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j@73@01))
; [eval] S[j]
(push) ; 4
(assert (not (>= j@73@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< j@73@01 (Seq_length S@64@01))))
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
(assert (not (forall ((j1@73@01 Int) (j2@73@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j1@73@01)
      (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j2@73@01)
      (= (Seq_index S@64@01 j1@73@01) (Seq_index S@64@01 j2@73@01)))
    (= j1@73@01 j2@73@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@73@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j@73@01)
    (and
      (= (inv@74@01 (Seq_index S@64@01 j@73@01)) j@73@01)
      (img@75@01 (Seq_index S@64@01 j@73@01))))
  :pattern ((Seq_index S@64@01 j@73@01))
  :qid |quant-u-25|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@75@01 r)
      (Seq_contains (Seq_range 0 (Seq_length S@64@01)) (inv@74@01 r)))
    (= (Seq_index S@64@01 (inv@74@01 r)) r))
  :pattern ((inv@74@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j@73@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j@73@01)
    (not (= (Seq_index S@64@01 j@73@01) $Ref.null)))
  :pattern ((Seq_index S@64@01 j@73@01))
  :qid |f-permImpliesNonNull|)))
(assert (= ($Snap.second $t@72@01) $Snap.unit))
; [eval] (forall j: Int :: { S[j] } (j in [0..|S| - 1)) ==> S[j].f <= S[j + 1].f)
(declare-const j@76@01 Int)
(push) ; 3
; [eval] (j in [0..|S| - 1)) ==> S[j].f <= S[j + 1].f
; [eval] (j in [0..|S| - 1))
; [eval] [0..|S| - 1)
; [eval] |S| - 1
; [eval] |S|
(push) ; 4
; [then-branch: 19 | j@76@01 in [0..|S@64@01| - 1] | live]
; [else-branch: 19 | !(j@76@01 in [0..|S@64@01| - 1]) | live]
(push) ; 5
; [then-branch: 19 | j@76@01 in [0..|S@64@01| - 1]]
(assert (Seq_contains (Seq_range 0 (- (Seq_length S@64@01) 1)) j@76@01))
; [eval] S[j].f <= S[j + 1].f
; [eval] S[j]
(push) ; 6
(assert (not (>= j@76@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< j@76@01 (Seq_length S@64@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (and
  (img@75@01 (Seq_index S@64@01 j@76@01))
  (Seq_contains
    (Seq_range 0 (Seq_length S@64@01))
    (inv@74@01 (Seq_index S@64@01 j@76@01))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] S[j + 1]
; [eval] j + 1
(push) ; 6
(assert (not (>= (+ j@76@01 1) 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< (+ j@76@01 1) (Seq_length S@64@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (and
  (img@75@01 (Seq_index S@64@01 (+ j@76@01 1)))
  (Seq_contains
    (Seq_range 0 (Seq_length S@64@01))
    (inv@74@01 (Seq_index S@64@01 (+ j@76@01 1)))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 19 | !(j@76@01 in [0..|S@64@01| - 1])]
(assert (not (Seq_contains (Seq_range 0 (- (Seq_length S@64@01) 1)) j@76@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not (Seq_contains (Seq_range 0 (- (Seq_length S@64@01) 1)) j@76@01))
  (Seq_contains (Seq_range 0 (- (Seq_length S@64@01) 1)) j@76@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@76@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 (- (Seq_length S@64@01) 1)) j@76@01))
    (Seq_contains (Seq_range 0 (- (Seq_length S@64@01) 1)) j@76@01))
  :pattern ((Seq_index S@64@01 j@76@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@37@11@37@65-aux|)))
(assert (forall ((j@76@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (- (Seq_length S@64@01) 1)) j@76@01)
    (<=
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@72@01)) (Seq_index
        S@64@01
        j@76@01))
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@72@01)) (Seq_index
        S@64@01
        (+ j@76@01 1)))))
  :pattern ((Seq_index S@64@01 j@76@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@37@11@37@65|)))
(pop) ; 2
(push) ; 2
(declare-const j@77@01 Int)
(push) ; 3
; [eval] (j in [0..|S|))
; [eval] [0..|S|)
; [eval] |S|
(assert (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j@77@01))
; [eval] S[j]
(push) ; 4
(assert (not (>= j@77@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< j@77@01 (Seq_length S@64@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@78@01 ($Ref) Int)
(declare-fun img@79@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j1@77@01 Int) (j2@77@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j1@77@01)
      (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j2@77@01)
      (= (Seq_index S@64@01 j1@77@01) (Seq_index S@64@01 j2@77@01)))
    (= j1@77@01 j2@77@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@77@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length S@64@01)) j@77@01)
    (and
      (= (inv@78@01 (Seq_index S@64@01 j@77@01)) j@77@01)
      (img@79@01 (Seq_index S@64@01 j@77@01))))
  :pattern ((Seq_index S@64@01 j@77@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@79@01 r)
      (Seq_contains (Seq_range 0 (Seq_length S@64@01)) (inv@78@01 r)))
    (= (Seq_index S@64@01 (inv@78@01 r)) r))
  :pattern ((inv@78@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@80@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length S@64@01)) (inv@78@01 r))
      (img@79@01 r)
      (= r (Seq_index S@64@01 (inv@78@01 r))))
    ($Perm.min
      (ite
        (and
          (img@70@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@64@01)) (inv@69@01 r)))
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
          (img@70@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@64@01)) (inv@69@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@80@01 r))
    $Perm.No)
  
  :qid |quant-u-28|))))
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
      (Seq_contains (Seq_range 0 (Seq_length S@64@01)) (inv@78@01 r))
      (img@79@01 r)
      (= r (Seq_index S@64@01 (inv@78@01 r))))
    (= (- $Perm.Write (pTaken@80@01 r)) $Perm.No))
  
  :qid |quant-u-29|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@81@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@70@01 r)
      (Seq_contains (Seq_range 0 (Seq_length S@64@01)) (inv@69@01 r)))
    (=
      ($FVF.lookup_f (as sm@81@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@65@01))) r)))
  :pattern (($FVF.lookup_f (as sm@81@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second $t@65@01))) r))
  :qid |qp.fvfValDef26|)))
; [eval] (forall j: Int :: { S[j] } (j in [0..|S| - 1)) ==> S[j].f <= S[j + 1].f)
(declare-const j@82@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (j in [0..|S| - 1)) ==> S[j].f <= S[j + 1].f
; [eval] (j in [0..|S| - 1))
; [eval] [0..|S| - 1)
; [eval] |S| - 1
; [eval] |S|
(push) ; 4
; [then-branch: 20 | j@82@01 in [0..|S@64@01| - 1] | live]
; [else-branch: 20 | !(j@82@01 in [0..|S@64@01| - 1]) | live]
(push) ; 5
; [then-branch: 20 | j@82@01 in [0..|S@64@01| - 1]]
(assert (Seq_contains (Seq_range 0 (- (Seq_length S@64@01) 1)) j@82@01))
; [eval] S[j].f <= S[j + 1].f
; [eval] S[j]
(push) ; 6
(assert (not (>= j@82@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< j@82@01 (Seq_length S@64@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (and
  (img@70@01 (Seq_index S@64@01 j@82@01))
  (Seq_contains
    (Seq_range 0 (Seq_length S@64@01))
    (inv@69@01 (Seq_index S@64@01 j@82@01))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] S[j + 1]
; [eval] j + 1
(push) ; 6
(assert (not (>= (+ j@82@01 1) 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< (+ j@82@01 1) (Seq_length S@64@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (and
  (img@70@01 (Seq_index S@64@01 (+ j@82@01 1)))
  (Seq_contains
    (Seq_range 0 (Seq_length S@64@01))
    (inv@69@01 (Seq_index S@64@01 (+ j@82@01 1)))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 20 | !(j@82@01 in [0..|S@64@01| - 1])]
(assert (not (Seq_contains (Seq_range 0 (- (Seq_length S@64@01) 1)) j@82@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not (Seq_contains (Seq_range 0 (- (Seq_length S@64@01) 1)) j@82@01))
  (Seq_contains (Seq_range 0 (- (Seq_length S@64@01) 1)) j@82@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@82@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 (- (Seq_length S@64@01) 1)) j@82@01))
    (Seq_contains (Seq_range 0 (- (Seq_length S@64@01) 1)) j@82@01))
  :pattern ((Seq_index S@64@01 j@82@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@37@11@37@65-aux|)))
(push) ; 3
(assert (not (forall ((j@82@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (- (Seq_length S@64@01) 1)) j@82@01)
    (<=
      ($FVF.lookup_f (as sm@81@01  $FVF<f>) (Seq_index S@64@01 j@82@01))
      ($FVF.lookup_f (as sm@81@01  $FVF<f>) (Seq_index S@64@01 (+ j@82@01 1)))))
  :pattern ((Seq_index S@64@01 j@82@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@37@11@37@65|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((j@82@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (- (Seq_length S@64@01) 1)) j@82@01)
    (<=
      ($FVF.lookup_f (as sm@81@01  $FVF<f>) (Seq_index S@64@01 j@82@01))
      ($FVF.lookup_f (as sm@81@01  $FVF<f>) (Seq_index S@64@01 (+ j@82@01 1)))))
  :pattern ((Seq_index S@64@01 j@82@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@37@11@37@65|)))
(pop) ; 2
(pop) ; 1
; ---------- test04 ----------
(declare-const S@83@01 Seq<$Ref>)
(declare-const a@84@01 Int)
(declare-const S@85@01 Seq<$Ref>)
(declare-const a@86@01 Int)
(push) ; 1
(declare-const $t@87@01 $Snap)
(assert (= $t@87@01 ($Snap.combine ($Snap.first $t@87@01) ($Snap.second $t@87@01))))
(assert (= ($Snap.first $t@87@01) $Snap.unit))
; [eval] 0 <= a
(assert (<= 0 a@86@01))
(assert (=
  ($Snap.second $t@87@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@87@01))
    ($Snap.second ($Snap.second $t@87@01)))))
(assert (= ($Snap.first ($Snap.second $t@87@01)) $Snap.unit))
; [eval] a < |S|
; [eval] |S|
(assert (< a@86@01 (Seq_length S@85@01)))
(assert (=
  ($Snap.second ($Snap.second $t@87@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@87@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@87@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@87@01))) $Snap.unit))
; [eval] (forall j1: Int, j2: Int :: { S[j1], S[j2] } (j1 in [0..|S|)) && ((j2 in [0..|S|)) && j1 != j2) ==> S[j1] != S[j2])
(declare-const j1@88@01 Int)
(declare-const j2@89@01 Int)
(push) ; 2
; [eval] (j1 in [0..|S|)) && ((j2 in [0..|S|)) && j1 != j2) ==> S[j1] != S[j2]
; [eval] (j1 in [0..|S|)) && ((j2 in [0..|S|)) && j1 != j2)
; [eval] (j1 in [0..|S|))
; [eval] [0..|S|)
; [eval] |S|
(push) ; 3
; [then-branch: 21 | !(j1@88@01 in [0..|S@85@01|]) | live]
; [else-branch: 21 | j1@88@01 in [0..|S@85@01|] | live]
(push) ; 4
; [then-branch: 21 | !(j1@88@01 in [0..|S@85@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length S@85@01)) j1@88@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 21 | j1@88@01 in [0..|S@85@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length S@85@01)) j1@88@01))
; [eval] (j2 in [0..|S|))
; [eval] [0..|S|)
; [eval] |S|
(push) ; 5
; [then-branch: 22 | !(j2@89@01 in [0..|S@85@01|]) | live]
; [else-branch: 22 | j2@89@01 in [0..|S@85@01|] | live]
(push) ; 6
; [then-branch: 22 | !(j2@89@01 in [0..|S@85@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length S@85@01)) j2@89@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 22 | j2@89@01 in [0..|S@85@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length S@85@01)) j2@89@01))
; [eval] j1 != j2
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 (Seq_length S@85@01)) j2@89@01)
  (not (Seq_contains (Seq_range 0 (Seq_length S@85@01)) j2@89@01))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 (Seq_length S@85@01)) j1@88@01)
  (and
    (Seq_contains (Seq_range 0 (Seq_length S@85@01)) j1@88@01)
    (or
      (Seq_contains (Seq_range 0 (Seq_length S@85@01)) j2@89@01)
      (not (Seq_contains (Seq_range 0 (Seq_length S@85@01)) j2@89@01))))))
(assert (or
  (Seq_contains (Seq_range 0 (Seq_length S@85@01)) j1@88@01)
  (not (Seq_contains (Seq_range 0 (Seq_length S@85@01)) j1@88@01))))
(push) ; 3
; [then-branch: 23 | j1@88@01 in [0..|S@85@01|] && j2@89@01 in [0..|S@85@01|] && j1@88@01 != j2@89@01 | live]
; [else-branch: 23 | !(j1@88@01 in [0..|S@85@01|] && j2@89@01 in [0..|S@85@01|] && j1@88@01 != j2@89@01) | live]
(push) ; 4
; [then-branch: 23 | j1@88@01 in [0..|S@85@01|] && j2@89@01 in [0..|S@85@01|] && j1@88@01 != j2@89@01]
(assert (and
  (Seq_contains (Seq_range 0 (Seq_length S@85@01)) j1@88@01)
  (and
    (Seq_contains (Seq_range 0 (Seq_length S@85@01)) j2@89@01)
    (not (= j1@88@01 j2@89@01)))))
; [eval] S[j1] != S[j2]
; [eval] S[j1]
(push) ; 5
(assert (not (>= j1@88@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< j1@88@01 (Seq_length S@85@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] S[j2]
(push) ; 5
(assert (not (>= j2@89@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< j2@89@01 (Seq_length S@85@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 23 | !(j1@88@01 in [0..|S@85@01|] && j2@89@01 in [0..|S@85@01|] && j1@88@01 != j2@89@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 (Seq_length S@85@01)) j1@88@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length S@85@01)) j2@89@01)
      (not (= j1@88@01 j2@89@01))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 (Seq_length S@85@01)) j1@88@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length S@85@01)) j2@89@01)
      (not (= j1@88@01 j2@89@01))))
  (and
    (Seq_contains (Seq_range 0 (Seq_length S@85@01)) j1@88@01)
    (Seq_contains (Seq_range 0 (Seq_length S@85@01)) j2@89@01)
    (not (= j1@88@01 j2@89@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 (Seq_length S@85@01)) j1@88@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@85@01)) j2@89@01)
        (not (= j1@88@01 j2@89@01)))))
  (and
    (Seq_contains (Seq_range 0 (Seq_length S@85@01)) j1@88@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length S@85@01)) j2@89@01)
      (not (= j1@88@01 j2@89@01))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j1@88@01 Int) (j2@89@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length S@85@01)) j1@88@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@85@01)) j1@88@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length S@85@01)) j2@89@01)
          (not (Seq_contains (Seq_range 0 (Seq_length S@85@01)) j2@89@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length S@85@01)) j1@88@01)
      (not (Seq_contains (Seq_range 0 (Seq_length S@85@01)) j1@88@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@85@01)) j1@88@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length S@85@01)) j2@89@01)
          (not (= j1@88@01 j2@89@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@85@01)) j1@88@01)
        (Seq_contains (Seq_range 0 (Seq_length S@85@01)) j2@89@01)
        (not (= j1@88@01 j2@89@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length S@85@01)) j1@88@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length S@85@01)) j2@89@01)
            (not (= j1@88@01 j2@89@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@85@01)) j1@88@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length S@85@01)) j2@89@01)
          (not (= j1@88@01 j2@89@01))))))
  :pattern ((Seq_index S@85@01 j1@88@01) (Seq_index S@85@01 j2@89@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@42@12@42@117-aux|)))
(assert (forall ((j1@88@01 Int) (j2@89@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length S@85@01)) j1@88@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@85@01)) j2@89@01)
        (not (= j1@88@01 j2@89@01))))
    (not (= (Seq_index S@85@01 j1@88@01) (Seq_index S@85@01 j2@89@01))))
  :pattern ((Seq_index S@85@01 j1@88@01) (Seq_index S@85@01 j2@89@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@42@12@42@117|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@87@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@87@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@87@01)))))))
(declare-const j@90@01 Int)
(push) ; 2
; [eval] (j in [0..|S|))
; [eval] [0..|S|)
; [eval] |S|
(assert (Seq_contains (Seq_range 0 (Seq_length S@85@01)) j@90@01))
; [eval] S[j]
(push) ; 3
(assert (not (>= j@90@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< j@90@01 (Seq_length S@85@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@91@01 ($Ref) Int)
(declare-fun img@92@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((j1@90@01 Int) (j2@90@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length S@85@01)) j1@90@01)
      (Seq_contains (Seq_range 0 (Seq_length S@85@01)) j2@90@01)
      (= (Seq_index S@85@01 j1@90@01) (Seq_index S@85@01 j2@90@01)))
    (= j1@90@01 j2@90@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@90@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length S@85@01)) j@90@01)
    (and
      (= (inv@91@01 (Seq_index S@85@01 j@90@01)) j@90@01)
      (img@92@01 (Seq_index S@85@01 j@90@01))))
  :pattern ((Seq_index S@85@01 j@90@01))
  :qid |quant-u-31|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@92@01 r)
      (Seq_contains (Seq_range 0 (Seq_length S@85@01)) (inv@91@01 r)))
    (= (Seq_index S@85@01 (inv@91@01 r)) r))
  :pattern ((inv@91@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j@90@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length S@85@01)) j@90@01)
    (not (= (Seq_index S@85@01 j@90@01) $Ref.null)))
  :pattern ((Seq_index S@85@01 j@90@01))
  :qid |f-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@87@01))))
  $Snap.unit))
; [eval] (forall j: Int :: { S[j] } (j in [0..|S| - 1)) ==> S[j].f <= S[j + 1].f)
(declare-const j@93@01 Int)
(push) ; 2
; [eval] (j in [0..|S| - 1)) ==> S[j].f <= S[j + 1].f
; [eval] (j in [0..|S| - 1))
; [eval] [0..|S| - 1)
; [eval] |S| - 1
; [eval] |S|
(push) ; 3
; [then-branch: 24 | j@93@01 in [0..|S@85@01| - 1] | live]
; [else-branch: 24 | !(j@93@01 in [0..|S@85@01| - 1]) | live]
(push) ; 4
; [then-branch: 24 | j@93@01 in [0..|S@85@01| - 1]]
(assert (Seq_contains (Seq_range 0 (- (Seq_length S@85@01) 1)) j@93@01))
; [eval] S[j].f <= S[j + 1].f
; [eval] S[j]
(push) ; 5
(assert (not (>= j@93@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< j@93@01 (Seq_length S@85@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (and
  (img@92@01 (Seq_index S@85@01 j@93@01))
  (Seq_contains
    (Seq_range 0 (Seq_length S@85@01))
    (inv@91@01 (Seq_index S@85@01 j@93@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] S[j + 1]
; [eval] j + 1
(push) ; 5
(assert (not (>= (+ j@93@01 1) 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< (+ j@93@01 1) (Seq_length S@85@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (and
  (img@92@01 (Seq_index S@85@01 (+ j@93@01 1)))
  (Seq_contains
    (Seq_range 0 (Seq_length S@85@01))
    (inv@91@01 (Seq_index S@85@01 (+ j@93@01 1)))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 24 | !(j@93@01 in [0..|S@85@01| - 1])]
(assert (not (Seq_contains (Seq_range 0 (- (Seq_length S@85@01) 1)) j@93@01)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or
  (not (Seq_contains (Seq_range 0 (- (Seq_length S@85@01) 1)) j@93@01))
  (Seq_contains (Seq_range 0 (- (Seq_length S@85@01) 1)) j@93@01)))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@93@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 (- (Seq_length S@85@01) 1)) j@93@01))
    (Seq_contains (Seq_range 0 (- (Seq_length S@85@01) 1)) j@93@01))
  :pattern ((Seq_index S@85@01 j@93@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@44@12@44@66-aux|)))
(assert (forall ((j@93@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (- (Seq_length S@85@01) 1)) j@93@01)
    (<=
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@87@01))))) (Seq_index
        S@85@01
        j@93@01))
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@87@01))))) (Seq_index
        S@85@01
        (+ j@93@01 1)))))
  :pattern ((Seq_index S@85@01 j@93@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@44@12@44@66|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@94@01 $Snap)
(assert (= $t@94@01 ($Snap.combine ($Snap.first $t@94@01) ($Snap.second $t@94@01))))
(declare-const j@95@01 Int)
(push) ; 3
; [eval] (j in [0..|S|))
; [eval] [0..|S|)
; [eval] |S|
(assert (Seq_contains (Seq_range 0 (Seq_length S@85@01)) j@95@01))
; [eval] S[j]
(push) ; 4
(assert (not (>= j@95@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< j@95@01 (Seq_length S@85@01))))
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
(assert (not (forall ((j1@95@01 Int) (j2@95@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length S@85@01)) j1@95@01)
      (Seq_contains (Seq_range 0 (Seq_length S@85@01)) j2@95@01)
      (= (Seq_index S@85@01 j1@95@01) (Seq_index S@85@01 j2@95@01)))
    (= j1@95@01 j2@95@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@95@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length S@85@01)) j@95@01)
    (and
      (= (inv@96@01 (Seq_index S@85@01 j@95@01)) j@95@01)
      (img@97@01 (Seq_index S@85@01 j@95@01))))
  :pattern ((Seq_index S@85@01 j@95@01))
  :qid |quant-u-33|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@97@01 r)
      (Seq_contains (Seq_range 0 (Seq_length S@85@01)) (inv@96@01 r)))
    (= (Seq_index S@85@01 (inv@96@01 r)) r))
  :pattern ((inv@96@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j@95@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length S@85@01)) j@95@01)
    (not (= (Seq_index S@85@01 j@95@01) $Ref.null)))
  :pattern ((Seq_index S@85@01 j@95@01))
  :qid |f-permImpliesNonNull|)))
(assert (= ($Snap.second $t@94@01) $Snap.unit))
; [eval] (forall j: Int :: { S[j] } (j in [0..|S| - 1)) ==> S[j].f <= S[j + 1].f)
(declare-const j@98@01 Int)
(push) ; 3
; [eval] (j in [0..|S| - 1)) ==> S[j].f <= S[j + 1].f
; [eval] (j in [0..|S| - 1))
; [eval] [0..|S| - 1)
; [eval] |S| - 1
; [eval] |S|
(push) ; 4
; [then-branch: 25 | j@98@01 in [0..|S@85@01| - 1] | live]
; [else-branch: 25 | !(j@98@01 in [0..|S@85@01| - 1]) | live]
(push) ; 5
; [then-branch: 25 | j@98@01 in [0..|S@85@01| - 1]]
(assert (Seq_contains (Seq_range 0 (- (Seq_length S@85@01) 1)) j@98@01))
; [eval] S[j].f <= S[j + 1].f
; [eval] S[j]
(push) ; 6
(assert (not (>= j@98@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< j@98@01 (Seq_length S@85@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (and
  (img@97@01 (Seq_index S@85@01 j@98@01))
  (Seq_contains
    (Seq_range 0 (Seq_length S@85@01))
    (inv@96@01 (Seq_index S@85@01 j@98@01))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] S[j + 1]
; [eval] j + 1
(push) ; 6
(assert (not (>= (+ j@98@01 1) 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< (+ j@98@01 1) (Seq_length S@85@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (and
  (img@97@01 (Seq_index S@85@01 (+ j@98@01 1)))
  (Seq_contains
    (Seq_range 0 (Seq_length S@85@01))
    (inv@96@01 (Seq_index S@85@01 (+ j@98@01 1)))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 25 | !(j@98@01 in [0..|S@85@01| - 1])]
(assert (not (Seq_contains (Seq_range 0 (- (Seq_length S@85@01) 1)) j@98@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not (Seq_contains (Seq_range 0 (- (Seq_length S@85@01) 1)) j@98@01))
  (Seq_contains (Seq_range 0 (- (Seq_length S@85@01) 1)) j@98@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@98@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 (- (Seq_length S@85@01) 1)) j@98@01))
    (Seq_contains (Seq_range 0 (- (Seq_length S@85@01) 1)) j@98@01))
  :pattern ((Seq_index S@85@01 j@98@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@47@11@47@65-aux|)))
(assert (forall ((j@98@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (- (Seq_length S@85@01) 1)) j@98@01)
    (<=
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@94@01)) (Seq_index
        S@85@01
        j@98@01))
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@94@01)) (Seq_index
        S@85@01
        (+ j@98@01 1)))))
  :pattern ((Seq_index S@85@01 j@98@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@47@11@47@65|)))
(pop) ; 2
(push) ; 2
; [exec]
; S[a].f := 5
; [eval] S[a]
(push) ; 3
(assert (not (>= a@86@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@99@01 ((r $Ref)) $Perm
  (ite
    (= r (Seq_index S@85@01 a@86@01))
    ($Perm.min
      (ite
        (and
          (img@92@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@85@01)) (inv@91@01 r)))
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
          (img@92@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@85@01)) (inv@91@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@99@01 r))
    $Perm.No)
  
  :qid |quant-u-35|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@99@01 r) $Perm.No)
  
  :qid |quant-u-36|))))
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
    (= r (Seq_index S@85@01 a@86@01))
    (= (- $Perm.Write (pTaken@99@01 r)) $Perm.No))
  
  :qid |quant-u-37|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@100@01 $FVF<f>)
; Definitional axioms for singleton-FVF's value
(assert (= ($FVF.lookup_f (as sm@100@01  $FVF<f>) (Seq_index S@85@01 a@86@01)) 5))
; [exec]
; assert (forall j: Int ::
;     { (j in [0..|S|)) }
;     (j in [0..|S| - 1)) ==> (j in [0..|S|)))
; [eval] (forall j: Int :: { (j in [0..|S|)) } (j in [0..|S| - 1)) ==> (j in [0..|S|)))
(declare-const j@101@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (j in [0..|S| - 1)) ==> (j in [0..|S|))
; [eval] (j in [0..|S| - 1))
; [eval] [0..|S| - 1)
; [eval] |S| - 1
; [eval] |S|
(push) ; 4
; [then-branch: 26 | j@101@01 in [0..|S@85@01| - 1] | live]
; [else-branch: 26 | !(j@101@01 in [0..|S@85@01| - 1]) | live]
(push) ; 5
; [then-branch: 26 | j@101@01 in [0..|S@85@01| - 1]]
(assert (Seq_contains (Seq_range 0 (- (Seq_length S@85@01) 1)) j@101@01))
; [eval] (j in [0..|S|))
; [eval] [0..|S|)
; [eval] |S|
(pop) ; 5
(push) ; 5
; [else-branch: 26 | !(j@101@01 in [0..|S@85@01| - 1])]
(assert (not (Seq_contains (Seq_range 0 (- (Seq_length S@85@01) 1)) j@101@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not (Seq_contains (Seq_range 0 (- (Seq_length S@85@01) 1)) j@101@01))
  (Seq_contains (Seq_range 0 (- (Seq_length S@85@01) 1)) j@101@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@101@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 (- (Seq_length S@85@01) 1)) j@101@01))
    (Seq_contains (Seq_range 0 (- (Seq_length S@85@01) 1)) j@101@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length S@85@01)) j@101@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length S@85@01)) j@101@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@50@10@50@59-aux|)))
(assert (forall ((j@101@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 (- (Seq_length S@85@01) 1)) j@101@01))
    (Seq_contains (Seq_range 0 (- (Seq_length S@85@01) 1)) j@101@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length S@85@01)) j@101@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@50@10@50@59-aux|)))
(push) ; 3
(assert (not (forall ((j@101@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (- (Seq_length S@85@01) 1)) j@101@01)
    (Seq_contains (Seq_range 0 (Seq_length S@85@01)) j@101@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length S@85@01)) j@101@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length S@85@01)) j@101@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length S@85@01)) j@101@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@50@10@50@59|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((j@101@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (- (Seq_length S@85@01) 1)) j@101@01)
    (Seq_contains (Seq_range 0 (Seq_length S@85@01)) j@101@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length S@85@01)) j@101@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length S@85@01)) j@101@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@50@10@50@59|)))
(declare-const j@102@01 Int)
(push) ; 3
; [eval] (j in [0..|S|))
; [eval] [0..|S|)
; [eval] |S|
(assert (Seq_contains (Seq_range 0 (Seq_length S@85@01)) j@102@01))
; [eval] S[j]
(push) ; 4
(assert (not (>= j@102@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< j@102@01 (Seq_length S@85@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@103@01 ($Ref) Int)
(declare-fun img@104@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j1@102@01 Int) (j2@102@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length S@85@01)) j1@102@01)
      (Seq_contains (Seq_range 0 (Seq_length S@85@01)) j2@102@01)
      (= (Seq_index S@85@01 j1@102@01) (Seq_index S@85@01 j2@102@01)))
    (= j1@102@01 j2@102@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@102@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length S@85@01)) j@102@01)
    (and
      (= (inv@103@01 (Seq_index S@85@01 j@102@01)) j@102@01)
      (img@104@01 (Seq_index S@85@01 j@102@01))))
  :pattern ((Seq_index S@85@01 j@102@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@104@01 r)
      (Seq_contains (Seq_range 0 (Seq_length S@85@01)) (inv@103@01 r)))
    (= (Seq_index S@85@01 (inv@103@01 r)) r))
  :pattern ((inv@103@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@105@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length S@85@01)) (inv@103@01 r))
      (img@104@01 r)
      (= r (Seq_index S@85@01 (inv@103@01 r))))
    ($Perm.min
      (ite
        (and
          (img@92@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@85@01)) (inv@91@01 r)))
        (- $Perm.Write (pTaken@99@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@106@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length S@85@01)) (inv@103@01 r))
      (img@104@01 r)
      (= r (Seq_index S@85@01 (inv@103@01 r))))
    ($Perm.min
      (ite (= r (Seq_index S@85@01 a@86@01)) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@105@01 r)))
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
          (img@92@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@85@01)) (inv@91@01 r)))
        (- $Perm.Write (pTaken@99@01 r))
        $Perm.No)
      (pTaken@105@01 r))
    $Perm.No)
  
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
    (and
      (Seq_contains (Seq_range 0 (Seq_length S@85@01)) (inv@103@01 r))
      (img@104@01 r)
      (= r (Seq_index S@85@01 (inv@103@01 r))))
    (= (- $Perm.Write (pTaken@105@01 r)) $Perm.No))
  
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
(assert (not (=
  (-
    (ite
      (= (Seq_index S@85@01 a@86@01) (Seq_index S@85@01 a@86@01))
      $Perm.Write
      $Perm.No)
    (pTaken@106@01 (Seq_index S@85@01 a@86@01)))
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
      (Seq_contains (Seq_range 0 (Seq_length S@85@01)) (inv@103@01 r))
      (img@104@01 r)
      (= r (Seq_index S@85@01 (inv@103@01 r))))
    (= (- (- $Perm.Write (pTaken@105@01 r)) (pTaken@106@01 r)) $Perm.No))
  
  :qid |quant-u-43|))))
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
    (= r (Seq_index S@85@01 a@86@01))
    (=
      ($FVF.lookup_f (as sm@107@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@100@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@107@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@100@01  $FVF<f>) r))
  :qid |qp.fvfValDef27|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@92@01 r)
        (Seq_contains (Seq_range 0 (Seq_length S@85@01)) (inv@91@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@99@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@107@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@87@01))))) r)))
  :pattern (($FVF.lookup_f (as sm@107@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@87@01))))) r))
  :qid |qp.fvfValDef28|)))
; [eval] (forall j: Int :: { S[j] } (j in [0..|S| - 1)) ==> S[j].f <= S[j + 1].f)
(declare-const j@108@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (j in [0..|S| - 1)) ==> S[j].f <= S[j + 1].f
; [eval] (j in [0..|S| - 1))
; [eval] [0..|S| - 1)
; [eval] |S| - 1
; [eval] |S|
(push) ; 4
; [then-branch: 27 | j@108@01 in [0..|S@85@01| - 1] | live]
; [else-branch: 27 | !(j@108@01 in [0..|S@85@01| - 1]) | live]
(push) ; 5
; [then-branch: 27 | j@108@01 in [0..|S@85@01| - 1]]
(assert (Seq_contains (Seq_range 0 (- (Seq_length S@85@01) 1)) j@108@01))
; [eval] S[j].f <= S[j + 1].f
; [eval] S[j]
(push) ; 6
(assert (not (>= j@108@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< j@108@01 (Seq_length S@85@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r (Seq_index S@85@01 a@86@01))
      (=
        ($FVF.lookup_f (as sm@107@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@100@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@107@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@100@01  $FVF<f>) r))
    :qid |qp.fvfValDef27|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and
          (img@92@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@85@01)) (inv@91@01 r)))
        (< $Perm.No (- $Perm.Write (pTaken@99@01 r)))
        false)
      (=
        ($FVF.lookup_f (as sm@107@01  $FVF<f>) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@87@01))))) r)))
    :pattern (($FVF.lookup_f (as sm@107@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@87@01))))) r))
    :qid |qp.fvfValDef28|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (ite
      (= (Seq_index S@85@01 j@108@01) (Seq_index S@85@01 a@86@01))
      $Perm.Write
      $Perm.No)
    (ite
      (and
        (img@92@01 (Seq_index S@85@01 j@108@01))
        (Seq_contains
          (Seq_range 0 (Seq_length S@85@01))
          (inv@91@01 (Seq_index S@85@01 j@108@01))))
      (- $Perm.Write (pTaken@99@01 (Seq_index S@85@01 j@108@01)))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] S[j + 1]
; [eval] j + 1
(push) ; 6
(assert (not (>= (+ j@108@01 1) 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< (+ j@108@01 1) (Seq_length S@85@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r (Seq_index S@85@01 a@86@01))
      (=
        ($FVF.lookup_f (as sm@107@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@100@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@107@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@100@01  $FVF<f>) r))
    :qid |qp.fvfValDef27|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and
          (img@92@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@85@01)) (inv@91@01 r)))
        (< $Perm.No (- $Perm.Write (pTaken@99@01 r)))
        false)
      (=
        ($FVF.lookup_f (as sm@107@01  $FVF<f>) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@87@01))))) r)))
    :pattern (($FVF.lookup_f (as sm@107@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@87@01))))) r))
    :qid |qp.fvfValDef28|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (ite
      (= (Seq_index S@85@01 (+ j@108@01 1)) (Seq_index S@85@01 a@86@01))
      $Perm.Write
      $Perm.No)
    (ite
      (and
        (img@92@01 (Seq_index S@85@01 (+ j@108@01 1)))
        (Seq_contains
          (Seq_range 0 (Seq_length S@85@01))
          (inv@91@01 (Seq_index S@85@01 (+ j@108@01 1)))))
      (- $Perm.Write (pTaken@99@01 (Seq_index S@85@01 (+ j@108@01 1))))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 27 | !(j@108@01 in [0..|S@85@01| - 1])]
(assert (not (Seq_contains (Seq_range 0 (- (Seq_length S@85@01) 1)) j@108@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index S@85@01 a@86@01))
    (=
      ($FVF.lookup_f (as sm@107@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@100@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@107@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@100@01  $FVF<f>) r))
  :qid |qp.fvfValDef27|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@92@01 r)
        (Seq_contains (Seq_range 0 (Seq_length S@85@01)) (inv@91@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@99@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@107@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@87@01))))) r)))
  :pattern (($FVF.lookup_f (as sm@107@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@87@01))))) r))
  :qid |qp.fvfValDef28|)))
; Joined path conditions
(assert (or
  (not (Seq_contains (Seq_range 0 (- (Seq_length S@85@01) 1)) j@108@01))
  (Seq_contains (Seq_range 0 (- (Seq_length S@85@01) 1)) j@108@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index S@85@01 a@86@01))
    (=
      ($FVF.lookup_f (as sm@107@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@100@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@107@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@100@01  $FVF<f>) r))
  :qid |qp.fvfValDef27|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@92@01 r)
        (Seq_contains (Seq_range 0 (Seq_length S@85@01)) (inv@91@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@99@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@107@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@87@01))))) r)))
  :pattern (($FVF.lookup_f (as sm@107@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@87@01))))) r))
  :qid |qp.fvfValDef28|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@108@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 (- (Seq_length S@85@01) 1)) j@108@01))
    (Seq_contains (Seq_range 0 (- (Seq_length S@85@01) 1)) j@108@01))
  :pattern ((Seq_index S@85@01 j@108@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@47@11@47@65-aux|)))
(push) ; 3
(assert (not (forall ((j@108@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (- (Seq_length S@85@01) 1)) j@108@01)
    (<=
      ($FVF.lookup_f (as sm@107@01  $FVF<f>) (Seq_index S@85@01 j@108@01))
      ($FVF.lookup_f (as sm@107@01  $FVF<f>) (Seq_index S@85@01 (+ j@108@01 1)))))
  :pattern ((Seq_index S@85@01 j@108@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@47@11@47@65|))))
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
(declare-const pm@109@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@109@01  $FPM) r)
    (+
      (ite (= r (Seq_index S@85@01 a@86@01)) $Perm.Write $Perm.No)
      (ite
        (and
          (img@92@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@85@01)) (inv@91@01 r)))
        (- $Perm.Write (pTaken@99@01 r))
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@109@01  $FPM) r))
  :qid |qp.resPrmSumDef29|)))
(assert (<= ($FVF.perm_f (as pm@109@01  $FPM) (Seq_index S@85@01 a@86@01)) $Perm.Write))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@109@01  $FPM) r) $Perm.Write)
  :pattern ((inv@91@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] (forall j: Int :: { S[j] } (j in [0..|S| - 1)) ==> S[j].f <= S[j + 1].f)
(declare-const j@110@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (j in [0..|S| - 1)) ==> S[j].f <= S[j + 1].f
; [eval] (j in [0..|S| - 1))
; [eval] [0..|S| - 1)
; [eval] |S| - 1
; [eval] |S|
(push) ; 4
; [then-branch: 28 | j@110@01 in [0..|S@85@01| - 1] | live]
; [else-branch: 28 | !(j@110@01 in [0..|S@85@01| - 1]) | live]
(push) ; 5
; [then-branch: 28 | j@110@01 in [0..|S@85@01| - 1]]
(assert (Seq_contains (Seq_range 0 (- (Seq_length S@85@01) 1)) j@110@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const sm@111@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@92@01 r)
        (Seq_contains (Seq_range 0 (Seq_length S@85@01)) (inv@91@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@99@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@111@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@87@01))))) r)))
  :pattern (($FVF.lookup_f (as sm@111@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@87@01))))) r))
  :qid |qp.fvfValDef30|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index S@85@01 a@86@01))
    (=
      ($FVF.lookup_f (as sm@111@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@100@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@111@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@100@01  $FVF<f>) r))
  :qid |qp.fvfValDef31|)))
(declare-const pm@112@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@112@01  $FPM) r)
    (+
      (ite
        (and
          (img@92@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@85@01)) (inv@91@01 r)))
        (- $Perm.Write (pTaken@99@01 r))
        $Perm.No)
      (ite (= r (Seq_index S@85@01 a@86@01)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@112@01  $FPM) r))
  :qid |qp.resPrmSumDef32|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@112@01  $FPM) r) $Perm.Write)
  :pattern ((inv@91@01 r))
  :qid |qp-fld-prm-bnd|)))
(assert (<= ($FVF.perm_f (as pm@112@01  $FPM) (Seq_index S@85@01 a@86@01)) $Perm.Write))
; [eval] S[j].f <= S[j + 1].f
; [eval] S[j]
(set-option :timeout 0)
(push) ; 6
(assert (not (>= j@110@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< j@110@01 (Seq_length S@85@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r (Seq_index S@85@01 a@86@01))
      (=
        ($FVF.lookup_f (as sm@107@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@100@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@107@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@100@01  $FVF<f>) r))
    :qid |qp.fvfValDef27|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and
          (img@92@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@85@01)) (inv@91@01 r)))
        (< $Perm.No (- $Perm.Write (pTaken@99@01 r)))
        false)
      (=
        ($FVF.lookup_f (as sm@107@01  $FVF<f>) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@87@01))))) r)))
    :pattern (($FVF.lookup_f (as sm@107@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@87@01))))) r))
    :qid |qp.fvfValDef28|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (ite
      (= (Seq_index S@85@01 j@110@01) (Seq_index S@85@01 a@86@01))
      $Perm.Write
      $Perm.No)
    (ite
      (and
        (img@92@01 (Seq_index S@85@01 j@110@01))
        (Seq_contains
          (Seq_range 0 (Seq_length S@85@01))
          (inv@91@01 (Seq_index S@85@01 j@110@01))))
      (- $Perm.Write (pTaken@99@01 (Seq_index S@85@01 j@110@01)))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] S[j + 1]
; [eval] j + 1
(push) ; 6
(assert (not (>= (+ j@110@01 1) 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< (+ j@110@01 1) (Seq_length S@85@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r (Seq_index S@85@01 a@86@01))
      (=
        ($FVF.lookup_f (as sm@107@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@100@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@107@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@100@01  $FVF<f>) r))
    :qid |qp.fvfValDef27|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and
          (img@92@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@85@01)) (inv@91@01 r)))
        (< $Perm.No (- $Perm.Write (pTaken@99@01 r)))
        false)
      (=
        ($FVF.lookup_f (as sm@107@01  $FVF<f>) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@87@01))))) r)))
    :pattern (($FVF.lookup_f (as sm@107@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@87@01))))) r))
    :qid |qp.fvfValDef28|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (ite
      (= (Seq_index S@85@01 (+ j@110@01 1)) (Seq_index S@85@01 a@86@01))
      $Perm.Write
      $Perm.No)
    (ite
      (and
        (img@92@01 (Seq_index S@85@01 (+ j@110@01 1)))
        (Seq_contains
          (Seq_range 0 (Seq_length S@85@01))
          (inv@91@01 (Seq_index S@85@01 (+ j@110@01 1)))))
      (- $Perm.Write (pTaken@99@01 (Seq_index S@85@01 (+ j@110@01 1))))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 28 | !(j@110@01 in [0..|S@85@01| - 1])]
(assert (not (Seq_contains (Seq_range 0 (- (Seq_length S@85@01) 1)) j@110@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const sm@113@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@92@01 r)
        (Seq_contains (Seq_range 0 (Seq_length S@85@01)) (inv@91@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@99@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@113@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@87@01))))) r)))
  :pattern (($FVF.lookup_f (as sm@113@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@87@01))))) r))
  :qid |qp.fvfValDef33|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index S@85@01 a@86@01))
    (=
      ($FVF.lookup_f (as sm@113@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@100@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@113@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@100@01  $FVF<f>) r))
  :qid |qp.fvfValDef34|)))
(declare-const pm@114@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@114@01  $FPM) r)
    (+
      (ite
        (and
          (img@92@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@85@01)) (inv@91@01 r)))
        (- $Perm.Write (pTaken@99@01 r))
        $Perm.No)
      (ite (= r (Seq_index S@85@01 a@86@01)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@114@01  $FPM) r))
  :qid |qp.resPrmSumDef35|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@114@01  $FPM) r) $Perm.Write)
  :pattern ((inv@91@01 r))
  :qid |qp-fld-prm-bnd|)))
(assert (<= ($FVF.perm_f (as pm@114@01  $FPM) (Seq_index S@85@01 a@86@01)) $Perm.Write))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@92@01 r)
        (Seq_contains (Seq_range 0 (Seq_length S@85@01)) (inv@91@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@99@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@111@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@87@01))))) r)))
  :pattern (($FVF.lookup_f (as sm@111@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@87@01))))) r))
  :qid |qp.fvfValDef30|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index S@85@01 a@86@01))
    (=
      ($FVF.lookup_f (as sm@111@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@100@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@111@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@100@01  $FVF<f>) r))
  :qid |qp.fvfValDef31|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@112@01  $FPM) r)
    (+
      (ite
        (and
          (img@92@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@85@01)) (inv@91@01 r)))
        (- $Perm.Write (pTaken@99@01 r))
        $Perm.No)
      (ite (= r (Seq_index S@85@01 a@86@01)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@112@01  $FPM) r))
  :qid |qp.resPrmSumDef32|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index S@85@01 a@86@01))
    (=
      ($FVF.lookup_f (as sm@107@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@100@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@107@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@100@01  $FVF<f>) r))
  :qid |qp.fvfValDef27|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@92@01 r)
        (Seq_contains (Seq_range 0 (Seq_length S@85@01)) (inv@91@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@99@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@107@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@87@01))))) r)))
  :pattern (($FVF.lookup_f (as sm@107@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@87@01))))) r))
  :qid |qp.fvfValDef28|)))
(assert (=>
  (Seq_contains (Seq_range 0 (- (Seq_length S@85@01) 1)) j@110@01)
  (and
    (Seq_contains (Seq_range 0 (- (Seq_length S@85@01) 1)) j@110@01)
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@112@01  $FPM) r) $Perm.Write)
      :pattern ((inv@91@01 r))
      :qid |qp-fld-prm-bnd|))
    (<=
      ($FVF.perm_f (as pm@112@01  $FPM) (Seq_index S@85@01 a@86@01))
      $Perm.Write))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@92@01 r)
        (Seq_contains (Seq_range 0 (Seq_length S@85@01)) (inv@91@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@99@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@113@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@87@01))))) r)))
  :pattern (($FVF.lookup_f (as sm@113@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@87@01))))) r))
  :qid |qp.fvfValDef33|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index S@85@01 a@86@01))
    (=
      ($FVF.lookup_f (as sm@113@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@100@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@113@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@100@01  $FVF<f>) r))
  :qid |qp.fvfValDef34|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@114@01  $FPM) r)
    (+
      (ite
        (and
          (img@92@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@85@01)) (inv@91@01 r)))
        (- $Perm.Write (pTaken@99@01 r))
        $Perm.No)
      (ite (= r (Seq_index S@85@01 a@86@01)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@114@01  $FPM) r))
  :qid |qp.resPrmSumDef35|)))
(assert (=>
  (not (Seq_contains (Seq_range 0 (- (Seq_length S@85@01) 1)) j@110@01))
  (and
    (not (Seq_contains (Seq_range 0 (- (Seq_length S@85@01) 1)) j@110@01))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@114@01  $FPM) r) $Perm.Write)
      :pattern ((inv@91@01 r))
      :qid |qp-fld-prm-bnd|))
    (<=
      ($FVF.perm_f (as pm@114@01  $FPM) (Seq_index S@85@01 a@86@01))
      $Perm.Write))))
(assert (or
  (not (Seq_contains (Seq_range 0 (- (Seq_length S@85@01) 1)) j@110@01))
  (Seq_contains (Seq_range 0 (- (Seq_length S@85@01) 1)) j@110@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@92@01 r)
        (Seq_contains (Seq_range 0 (Seq_length S@85@01)) (inv@91@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@99@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@111@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@87@01))))) r)))
  :pattern (($FVF.lookup_f (as sm@111@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@87@01))))) r))
  :qid |qp.fvfValDef30|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index S@85@01 a@86@01))
    (=
      ($FVF.lookup_f (as sm@111@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@100@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@111@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@100@01  $FVF<f>) r))
  :qid |qp.fvfValDef31|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@112@01  $FPM) r)
    (+
      (ite
        (and
          (img@92@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@85@01)) (inv@91@01 r)))
        (- $Perm.Write (pTaken@99@01 r))
        $Perm.No)
      (ite (= r (Seq_index S@85@01 a@86@01)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@112@01  $FPM) r))
  :qid |qp.resPrmSumDef32|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index S@85@01 a@86@01))
    (=
      ($FVF.lookup_f (as sm@107@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@100@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@107@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@100@01  $FVF<f>) r))
  :qid |qp.fvfValDef27|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@92@01 r)
        (Seq_contains (Seq_range 0 (Seq_length S@85@01)) (inv@91@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@99@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@107@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@87@01))))) r)))
  :pattern (($FVF.lookup_f (as sm@107@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@87@01))))) r))
  :qid |qp.fvfValDef28|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@92@01 r)
        (Seq_contains (Seq_range 0 (Seq_length S@85@01)) (inv@91@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@99@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@113@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@87@01))))) r)))
  :pattern (($FVF.lookup_f (as sm@113@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@87@01))))) r))
  :qid |qp.fvfValDef33|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index S@85@01 a@86@01))
    (=
      ($FVF.lookup_f (as sm@113@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@100@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@113@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@100@01  $FVF<f>) r))
  :qid |qp.fvfValDef34|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@114@01  $FPM) r)
    (+
      (ite
        (and
          (img@92@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@85@01)) (inv@91@01 r)))
        (- $Perm.Write (pTaken@99@01 r))
        $Perm.No)
      (ite (= r (Seq_index S@85@01 a@86@01)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@114@01  $FPM) r))
  :qid |qp.resPrmSumDef35|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@110@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (- (Seq_length S@85@01) 1)) j@110@01)
      (and
        (Seq_contains (Seq_range 0 (- (Seq_length S@85@01) 1)) j@110@01)
        (forall ((r $Ref)) (!
          (<= ($FVF.perm_f (as pm@112@01  $FPM) r) $Perm.Write)
          :pattern ((inv@91@01 r))
          :qid |qp-fld-prm-bnd|))
        (<=
          ($FVF.perm_f (as pm@112@01  $FPM) (Seq_index S@85@01 a@86@01))
          $Perm.Write)))
    (=>
      (not (Seq_contains (Seq_range 0 (- (Seq_length S@85@01) 1)) j@110@01))
      (and
        (not (Seq_contains (Seq_range 0 (- (Seq_length S@85@01) 1)) j@110@01))
        (forall ((r $Ref)) (!
          (<= ($FVF.perm_f (as pm@114@01  $FPM) r) $Perm.Write)
          :pattern ((inv@91@01 r))
          :qid |qp-fld-prm-bnd|))
        (<=
          ($FVF.perm_f (as pm@114@01  $FPM) (Seq_index S@85@01 a@86@01))
          $Perm.Write)))
    (or
      (not (Seq_contains (Seq_range 0 (- (Seq_length S@85@01) 1)) j@110@01))
      (Seq_contains (Seq_range 0 (- (Seq_length S@85@01) 1)) j@110@01)))
  :pattern ((Seq_index S@85@01 j@110@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@47@11@47@65-aux|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((j@110@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (- (Seq_length S@85@01) 1)) j@110@01)
    (<=
      ($FVF.lookup_f (as sm@107@01  $FVF<f>) (Seq_index S@85@01 j@110@01))
      ($FVF.lookup_f (as sm@107@01  $FVF<f>) (Seq_index S@85@01 (+ j@110@01 1)))))
  :pattern ((Seq_index S@85@01 j@110@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@47@11@47@65|))))
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
; [eval] (forall j: Int :: { S[j] } (j in [0..|S| - 1)) ==> S[j].f <= S[j + 1].f)
(declare-const j@115@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (j in [0..|S| - 1)) ==> S[j].f <= S[j + 1].f
; [eval] (j in [0..|S| - 1))
; [eval] [0..|S| - 1)
; [eval] |S| - 1
; [eval] |S|
(push) ; 4
; [then-branch: 29 | j@115@01 in [0..|S@85@01| - 1] | live]
; [else-branch: 29 | !(j@115@01 in [0..|S@85@01| - 1]) | live]
(push) ; 5
; [then-branch: 29 | j@115@01 in [0..|S@85@01| - 1]]
(assert (Seq_contains (Seq_range 0 (- (Seq_length S@85@01) 1)) j@115@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
(declare-const pm@116@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@116@01  $FPM) r)
    (+
      (ite (= r (Seq_index S@85@01 a@86@01)) $Perm.Write $Perm.No)
      (ite
        (and
          (img@92@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@85@01)) (inv@91@01 r)))
        (- $Perm.Write (pTaken@99@01 r))
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@116@01  $FPM) r))
  :qid |qp.resPrmSumDef36|)))
(assert (<= ($FVF.perm_f (as pm@116@01  $FPM) (Seq_index S@85@01 a@86@01)) $Perm.Write))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@116@01  $FPM) r) $Perm.Write)
  :pattern ((inv@91@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] S[j].f <= S[j + 1].f
; [eval] S[j]
(set-option :timeout 0)
(push) ; 6
(assert (not (>= j@115@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< j@115@01 (Seq_length S@85@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(declare-const sm@117@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@92@01 r)
        (Seq_contains (Seq_range 0 (Seq_length S@85@01)) (inv@91@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@99@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@117@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@87@01))))) r)))
  :pattern (($FVF.lookup_f (as sm@117@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@87@01))))) r))
  :qid |qp.fvfValDef37|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index S@85@01 a@86@01))
    (=
      ($FVF.lookup_f (as sm@117@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@100@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@117@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@100@01  $FVF<f>) r))
  :qid |qp.fvfValDef38|)))
(declare-const pm@118@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@118@01  $FPM) r)
    (+
      (ite
        (and
          (img@92@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@85@01)) (inv@91@01 r)))
        (- $Perm.Write (pTaken@99@01 r))
        $Perm.No)
      (ite (= r (Seq_index S@85@01 a@86@01)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@118@01  $FPM) r))
  :qid |qp.resPrmSumDef39|)))
(push) ; 6
(assert (not (< $Perm.No ($FVF.perm_f (as pm@118@01  $FPM) (Seq_index S@85@01 j@115@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] S[j + 1]
; [eval] j + 1
(push) ; 6
(assert (not (>= (+ j@115@01 1) 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< (+ j@115@01 1) (Seq_length S@85@01))))
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
          (img@92@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@85@01)) (inv@91@01 r)))
        (< $Perm.No (- $Perm.Write (pTaken@99@01 r)))
        false)
      (=
        ($FVF.lookup_f (as sm@117@01  $FVF<f>) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@87@01))))) r)))
    :pattern (($FVF.lookup_f (as sm@117@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@87@01))))) r))
    :qid |qp.fvfValDef37|))
  (forall ((r $Ref)) (!
    (=>
      (= r (Seq_index S@85@01 a@86@01))
      (=
        ($FVF.lookup_f (as sm@117@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@100@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@117@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@100@01  $FVF<f>) r))
    :qid |qp.fvfValDef38|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (ite
      (and
        (img@92@01 (Seq_index S@85@01 (+ j@115@01 1)))
        (Seq_contains
          (Seq_range 0 (Seq_length S@85@01))
          (inv@91@01 (Seq_index S@85@01 (+ j@115@01 1)))))
      (- $Perm.Write (pTaken@99@01 (Seq_index S@85@01 (+ j@115@01 1))))
      $Perm.No)
    (ite
      (= (Seq_index S@85@01 (+ j@115@01 1)) (Seq_index S@85@01 a@86@01))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 29 | !(j@115@01 in [0..|S@85@01| - 1])]
(assert (not (Seq_contains (Seq_range 0 (- (Seq_length S@85@01) 1)) j@115@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Definitional axioms for snapshot map values
(declare-const pm@119@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@119@01  $FPM) r)
    (+
      (ite (= r (Seq_index S@85@01 a@86@01)) $Perm.Write $Perm.No)
      (ite
        (and
          (img@92@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@85@01)) (inv@91@01 r)))
        (- $Perm.Write (pTaken@99@01 r))
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@119@01  $FPM) r))
  :qid |qp.resPrmSumDef40|)))
(assert (<= ($FVF.perm_f (as pm@119@01  $FPM) (Seq_index S@85@01 a@86@01)) $Perm.Write))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@119@01  $FPM) r) $Perm.Write)
  :pattern ((inv@91@01 r))
  :qid |qp-fld-prm-bnd|)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@116@01  $FPM) r)
    (+
      (ite (= r (Seq_index S@85@01 a@86@01)) $Perm.Write $Perm.No)
      (ite
        (and
          (img@92@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@85@01)) (inv@91@01 r)))
        (- $Perm.Write (pTaken@99@01 r))
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@116@01  $FPM) r))
  :qid |qp.resPrmSumDef36|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@92@01 r)
        (Seq_contains (Seq_range 0 (Seq_length S@85@01)) (inv@91@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@99@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@117@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@87@01))))) r)))
  :pattern (($FVF.lookup_f (as sm@117@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@87@01))))) r))
  :qid |qp.fvfValDef37|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index S@85@01 a@86@01))
    (=
      ($FVF.lookup_f (as sm@117@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@100@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@117@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@100@01  $FVF<f>) r))
  :qid |qp.fvfValDef38|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@118@01  $FPM) r)
    (+
      (ite
        (and
          (img@92@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@85@01)) (inv@91@01 r)))
        (- $Perm.Write (pTaken@99@01 r))
        $Perm.No)
      (ite (= r (Seq_index S@85@01 a@86@01)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@118@01  $FPM) r))
  :qid |qp.resPrmSumDef39|)))
(assert (=>
  (Seq_contains (Seq_range 0 (- (Seq_length S@85@01) 1)) j@115@01)
  (and
    (Seq_contains (Seq_range 0 (- (Seq_length S@85@01) 1)) j@115@01)
    (<=
      ($FVF.perm_f (as pm@116@01  $FPM) (Seq_index S@85@01 a@86@01))
      $Perm.Write)
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@116@01  $FPM) r) $Perm.Write)
      :pattern ((inv@91@01 r))
      :qid |qp-fld-prm-bnd|)))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@119@01  $FPM) r)
    (+
      (ite (= r (Seq_index S@85@01 a@86@01)) $Perm.Write $Perm.No)
      (ite
        (and
          (img@92@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@85@01)) (inv@91@01 r)))
        (- $Perm.Write (pTaken@99@01 r))
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@119@01  $FPM) r))
  :qid |qp.resPrmSumDef40|)))
(assert (=>
  (not (Seq_contains (Seq_range 0 (- (Seq_length S@85@01) 1)) j@115@01))
  (and
    (not (Seq_contains (Seq_range 0 (- (Seq_length S@85@01) 1)) j@115@01))
    (<=
      ($FVF.perm_f (as pm@119@01  $FPM) (Seq_index S@85@01 a@86@01))
      $Perm.Write)
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@119@01  $FPM) r) $Perm.Write)
      :pattern ((inv@91@01 r))
      :qid |qp-fld-prm-bnd|)))))
(assert (or
  (not (Seq_contains (Seq_range 0 (- (Seq_length S@85@01) 1)) j@115@01))
  (Seq_contains (Seq_range 0 (- (Seq_length S@85@01) 1)) j@115@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@116@01  $FPM) r)
    (+
      (ite (= r (Seq_index S@85@01 a@86@01)) $Perm.Write $Perm.No)
      (ite
        (and
          (img@92@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@85@01)) (inv@91@01 r)))
        (- $Perm.Write (pTaken@99@01 r))
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@116@01  $FPM) r))
  :qid |qp.resPrmSumDef36|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@92@01 r)
        (Seq_contains (Seq_range 0 (Seq_length S@85@01)) (inv@91@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@99@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@117@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@87@01))))) r)))
  :pattern (($FVF.lookup_f (as sm@117@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@87@01))))) r))
  :qid |qp.fvfValDef37|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index S@85@01 a@86@01))
    (=
      ($FVF.lookup_f (as sm@117@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@100@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@117@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@100@01  $FVF<f>) r))
  :qid |qp.fvfValDef38|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@118@01  $FPM) r)
    (+
      (ite
        (and
          (img@92@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@85@01)) (inv@91@01 r)))
        (- $Perm.Write (pTaken@99@01 r))
        $Perm.No)
      (ite (= r (Seq_index S@85@01 a@86@01)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@118@01  $FPM) r))
  :qid |qp.resPrmSumDef39|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@119@01  $FPM) r)
    (+
      (ite (= r (Seq_index S@85@01 a@86@01)) $Perm.Write $Perm.No)
      (ite
        (and
          (img@92@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@85@01)) (inv@91@01 r)))
        (- $Perm.Write (pTaken@99@01 r))
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@119@01  $FPM) r))
  :qid |qp.resPrmSumDef40|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@115@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (- (Seq_length S@85@01) 1)) j@115@01)
      (and
        (Seq_contains (Seq_range 0 (- (Seq_length S@85@01) 1)) j@115@01)
        (<=
          ($FVF.perm_f (as pm@116@01  $FPM) (Seq_index S@85@01 a@86@01))
          $Perm.Write)
        (forall ((r $Ref)) (!
          (<= ($FVF.perm_f (as pm@116@01  $FPM) r) $Perm.Write)
          :pattern ((inv@91@01 r))
          :qid |qp-fld-prm-bnd|))))
    (=>
      (not (Seq_contains (Seq_range 0 (- (Seq_length S@85@01) 1)) j@115@01))
      (and
        (not (Seq_contains (Seq_range 0 (- (Seq_length S@85@01) 1)) j@115@01))
        (<=
          ($FVF.perm_f (as pm@119@01  $FPM) (Seq_index S@85@01 a@86@01))
          $Perm.Write)
        (forall ((r $Ref)) (!
          (<= ($FVF.perm_f (as pm@119@01  $FPM) r) $Perm.Write)
          :pattern ((inv@91@01 r))
          :qid |qp-fld-prm-bnd|))))
    (or
      (not (Seq_contains (Seq_range 0 (- (Seq_length S@85@01) 1)) j@115@01))
      (Seq_contains (Seq_range 0 (- (Seq_length S@85@01) 1)) j@115@01)))
  :pattern ((Seq_index S@85@01 j@115@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@47@11@47@65-aux|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((j@115@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (- (Seq_length S@85@01) 1)) j@115@01)
    (<=
      ($FVF.lookup_f (as sm@117@01  $FVF<f>) (Seq_index S@85@01 j@115@01))
      ($FVF.lookup_f (as sm@117@01  $FVF<f>) (Seq_index S@85@01 (+ j@115@01 1)))))
  :pattern ((Seq_index S@85@01 j@115@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@47@11@47@65|))))
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
(declare-const pm@120@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@120@01  $FPM) r)
    (+
      (ite (= r (Seq_index S@85@01 a@86@01)) $Perm.Write $Perm.No)
      (ite
        (and
          (img@92@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@85@01)) (inv@91@01 r)))
        (- $Perm.Write (pTaken@99@01 r))
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@120@01  $FPM) r))
  :qid |qp.resPrmSumDef41|)))
(assert (<= ($FVF.perm_f (as pm@120@01  $FPM) (Seq_index S@85@01 a@86@01)) $Perm.Write))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@120@01  $FPM) r) $Perm.Write)
  :pattern ((inv@91@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] (forall j: Int :: { S[j] } (j in [0..|S| - 1)) ==> S[j].f <= S[j + 1].f)
(declare-const j@121@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (j in [0..|S| - 1)) ==> S[j].f <= S[j + 1].f
; [eval] (j in [0..|S| - 1))
; [eval] [0..|S| - 1)
; [eval] |S| - 1
; [eval] |S|
(push) ; 4
; [then-branch: 30 | j@121@01 in [0..|S@85@01| - 1] | live]
; [else-branch: 30 | !(j@121@01 in [0..|S@85@01| - 1]) | live]
(push) ; 5
; [then-branch: 30 | j@121@01 in [0..|S@85@01| - 1]]
(assert (Seq_contains (Seq_range 0 (- (Seq_length S@85@01) 1)) j@121@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const sm@122@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@92@01 r)
        (Seq_contains (Seq_range 0 (Seq_length S@85@01)) (inv@91@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@99@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@122@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@87@01))))) r)))
  :pattern (($FVF.lookup_f (as sm@122@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@87@01))))) r))
  :qid |qp.fvfValDef42|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index S@85@01 a@86@01))
    (=
      ($FVF.lookup_f (as sm@122@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@100@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@122@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@100@01  $FVF<f>) r))
  :qid |qp.fvfValDef43|)))
(declare-const pm@123@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@123@01  $FPM) r)
    (+
      (ite
        (and
          (img@92@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@85@01)) (inv@91@01 r)))
        (- $Perm.Write (pTaken@99@01 r))
        $Perm.No)
      (ite (= r (Seq_index S@85@01 a@86@01)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@123@01  $FPM) r))
  :qid |qp.resPrmSumDef44|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@123@01  $FPM) r) $Perm.Write)
  :pattern ((inv@91@01 r))
  :qid |qp-fld-prm-bnd|)))
(assert (<= ($FVF.perm_f (as pm@123@01  $FPM) (Seq_index S@85@01 a@86@01)) $Perm.Write))
; [eval] S[j].f <= S[j + 1].f
; [eval] S[j]
(set-option :timeout 0)
(push) ; 6
(assert (not (>= j@121@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< j@121@01 (Seq_length S@85@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r (Seq_index S@85@01 a@86@01))
      (=
        ($FVF.lookup_f (as sm@107@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@100@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@107@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@100@01  $FVF<f>) r))
    :qid |qp.fvfValDef27|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and
          (img@92@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@85@01)) (inv@91@01 r)))
        (< $Perm.No (- $Perm.Write (pTaken@99@01 r)))
        false)
      (=
        ($FVF.lookup_f (as sm@107@01  $FVF<f>) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@87@01))))) r)))
    :pattern (($FVF.lookup_f (as sm@107@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@87@01))))) r))
    :qid |qp.fvfValDef28|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (ite
      (= (Seq_index S@85@01 j@121@01) (Seq_index S@85@01 a@86@01))
      $Perm.Write
      $Perm.No)
    (ite
      (and
        (img@92@01 (Seq_index S@85@01 j@121@01))
        (Seq_contains
          (Seq_range 0 (Seq_length S@85@01))
          (inv@91@01 (Seq_index S@85@01 j@121@01))))
      (- $Perm.Write (pTaken@99@01 (Seq_index S@85@01 j@121@01)))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] S[j + 1]
; [eval] j + 1
(push) ; 6
(assert (not (>= (+ j@121@01 1) 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< (+ j@121@01 1) (Seq_length S@85@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r (Seq_index S@85@01 a@86@01))
      (=
        ($FVF.lookup_f (as sm@107@01  $FVF<f>) r)
        ($FVF.lookup_f (as sm@100@01  $FVF<f>) r)))
    :pattern (($FVF.lookup_f (as sm@107@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f (as sm@100@01  $FVF<f>) r))
    :qid |qp.fvfValDef27|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and
          (img@92@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@85@01)) (inv@91@01 r)))
        (< $Perm.No (- $Perm.Write (pTaken@99@01 r)))
        false)
      (=
        ($FVF.lookup_f (as sm@107@01  $FVF<f>) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@87@01))))) r)))
    :pattern (($FVF.lookup_f (as sm@107@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@87@01))))) r))
    :qid |qp.fvfValDef28|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (ite
      (= (Seq_index S@85@01 (+ j@121@01 1)) (Seq_index S@85@01 a@86@01))
      $Perm.Write
      $Perm.No)
    (ite
      (and
        (img@92@01 (Seq_index S@85@01 (+ j@121@01 1)))
        (Seq_contains
          (Seq_range 0 (Seq_length S@85@01))
          (inv@91@01 (Seq_index S@85@01 (+ j@121@01 1)))))
      (- $Perm.Write (pTaken@99@01 (Seq_index S@85@01 (+ j@121@01 1))))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 30 | !(j@121@01 in [0..|S@85@01| - 1])]
(assert (not (Seq_contains (Seq_range 0 (- (Seq_length S@85@01) 1)) j@121@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const sm@124@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@92@01 r)
        (Seq_contains (Seq_range 0 (Seq_length S@85@01)) (inv@91@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@99@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@124@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@87@01))))) r)))
  :pattern (($FVF.lookup_f (as sm@124@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@87@01))))) r))
  :qid |qp.fvfValDef45|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index S@85@01 a@86@01))
    (=
      ($FVF.lookup_f (as sm@124@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@100@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@124@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@100@01  $FVF<f>) r))
  :qid |qp.fvfValDef46|)))
(declare-const pm@125@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@125@01  $FPM) r)
    (+
      (ite
        (and
          (img@92@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@85@01)) (inv@91@01 r)))
        (- $Perm.Write (pTaken@99@01 r))
        $Perm.No)
      (ite (= r (Seq_index S@85@01 a@86@01)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@125@01  $FPM) r))
  :qid |qp.resPrmSumDef47|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@125@01  $FPM) r) $Perm.Write)
  :pattern ((inv@91@01 r))
  :qid |qp-fld-prm-bnd|)))
(assert (<= ($FVF.perm_f (as pm@125@01  $FPM) (Seq_index S@85@01 a@86@01)) $Perm.Write))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@92@01 r)
        (Seq_contains (Seq_range 0 (Seq_length S@85@01)) (inv@91@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@99@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@122@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@87@01))))) r)))
  :pattern (($FVF.lookup_f (as sm@122@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@87@01))))) r))
  :qid |qp.fvfValDef42|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index S@85@01 a@86@01))
    (=
      ($FVF.lookup_f (as sm@122@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@100@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@122@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@100@01  $FVF<f>) r))
  :qid |qp.fvfValDef43|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@123@01  $FPM) r)
    (+
      (ite
        (and
          (img@92@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@85@01)) (inv@91@01 r)))
        (- $Perm.Write (pTaken@99@01 r))
        $Perm.No)
      (ite (= r (Seq_index S@85@01 a@86@01)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@123@01  $FPM) r))
  :qid |qp.resPrmSumDef44|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index S@85@01 a@86@01))
    (=
      ($FVF.lookup_f (as sm@107@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@100@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@107@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@100@01  $FVF<f>) r))
  :qid |qp.fvfValDef27|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@92@01 r)
        (Seq_contains (Seq_range 0 (Seq_length S@85@01)) (inv@91@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@99@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@107@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@87@01))))) r)))
  :pattern (($FVF.lookup_f (as sm@107@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@87@01))))) r))
  :qid |qp.fvfValDef28|)))
(assert (=>
  (Seq_contains (Seq_range 0 (- (Seq_length S@85@01) 1)) j@121@01)
  (and
    (Seq_contains (Seq_range 0 (- (Seq_length S@85@01) 1)) j@121@01)
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@123@01  $FPM) r) $Perm.Write)
      :pattern ((inv@91@01 r))
      :qid |qp-fld-prm-bnd|))
    (<=
      ($FVF.perm_f (as pm@123@01  $FPM) (Seq_index S@85@01 a@86@01))
      $Perm.Write))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@92@01 r)
        (Seq_contains (Seq_range 0 (Seq_length S@85@01)) (inv@91@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@99@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@124@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@87@01))))) r)))
  :pattern (($FVF.lookup_f (as sm@124@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@87@01))))) r))
  :qid |qp.fvfValDef45|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index S@85@01 a@86@01))
    (=
      ($FVF.lookup_f (as sm@124@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@100@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@124@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@100@01  $FVF<f>) r))
  :qid |qp.fvfValDef46|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@125@01  $FPM) r)
    (+
      (ite
        (and
          (img@92@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@85@01)) (inv@91@01 r)))
        (- $Perm.Write (pTaken@99@01 r))
        $Perm.No)
      (ite (= r (Seq_index S@85@01 a@86@01)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@125@01  $FPM) r))
  :qid |qp.resPrmSumDef47|)))
(assert (=>
  (not (Seq_contains (Seq_range 0 (- (Seq_length S@85@01) 1)) j@121@01))
  (and
    (not (Seq_contains (Seq_range 0 (- (Seq_length S@85@01) 1)) j@121@01))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@125@01  $FPM) r) $Perm.Write)
      :pattern ((inv@91@01 r))
      :qid |qp-fld-prm-bnd|))
    (<=
      ($FVF.perm_f (as pm@125@01  $FPM) (Seq_index S@85@01 a@86@01))
      $Perm.Write))))
(assert (or
  (not (Seq_contains (Seq_range 0 (- (Seq_length S@85@01) 1)) j@121@01))
  (Seq_contains (Seq_range 0 (- (Seq_length S@85@01) 1)) j@121@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@92@01 r)
        (Seq_contains (Seq_range 0 (Seq_length S@85@01)) (inv@91@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@99@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@122@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@87@01))))) r)))
  :pattern (($FVF.lookup_f (as sm@122@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@87@01))))) r))
  :qid |qp.fvfValDef42|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index S@85@01 a@86@01))
    (=
      ($FVF.lookup_f (as sm@122@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@100@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@122@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@100@01  $FVF<f>) r))
  :qid |qp.fvfValDef43|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@123@01  $FPM) r)
    (+
      (ite
        (and
          (img@92@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@85@01)) (inv@91@01 r)))
        (- $Perm.Write (pTaken@99@01 r))
        $Perm.No)
      (ite (= r (Seq_index S@85@01 a@86@01)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@123@01  $FPM) r))
  :qid |qp.resPrmSumDef44|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index S@85@01 a@86@01))
    (=
      ($FVF.lookup_f (as sm@107@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@100@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@107@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@100@01  $FVF<f>) r))
  :qid |qp.fvfValDef27|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@92@01 r)
        (Seq_contains (Seq_range 0 (Seq_length S@85@01)) (inv@91@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@99@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@107@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@87@01))))) r)))
  :pattern (($FVF.lookup_f (as sm@107@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@87@01))))) r))
  :qid |qp.fvfValDef28|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@92@01 r)
        (Seq_contains (Seq_range 0 (Seq_length S@85@01)) (inv@91@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@99@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@124@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@87@01))))) r)))
  :pattern (($FVF.lookup_f (as sm@124@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@87@01))))) r))
  :qid |qp.fvfValDef45|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index S@85@01 a@86@01))
    (=
      ($FVF.lookup_f (as sm@124@01  $FVF<f>) r)
      ($FVF.lookup_f (as sm@100@01  $FVF<f>) r)))
  :pattern (($FVF.lookup_f (as sm@124@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f (as sm@100@01  $FVF<f>) r))
  :qid |qp.fvfValDef46|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@125@01  $FPM) r)
    (+
      (ite
        (and
          (img@92@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@85@01)) (inv@91@01 r)))
        (- $Perm.Write (pTaken@99@01 r))
        $Perm.No)
      (ite (= r (Seq_index S@85@01 a@86@01)) $Perm.Write $Perm.No)))
  :pattern (($FVF.perm_f (as pm@125@01  $FPM) r))
  :qid |qp.resPrmSumDef47|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@121@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (- (Seq_length S@85@01) 1)) j@121@01)
      (and
        (Seq_contains (Seq_range 0 (- (Seq_length S@85@01) 1)) j@121@01)
        (forall ((r $Ref)) (!
          (<= ($FVF.perm_f (as pm@123@01  $FPM) r) $Perm.Write)
          :pattern ((inv@91@01 r))
          :qid |qp-fld-prm-bnd|))
        (<=
          ($FVF.perm_f (as pm@123@01  $FPM) (Seq_index S@85@01 a@86@01))
          $Perm.Write)))
    (=>
      (not (Seq_contains (Seq_range 0 (- (Seq_length S@85@01) 1)) j@121@01))
      (and
        (not (Seq_contains (Seq_range 0 (- (Seq_length S@85@01) 1)) j@121@01))
        (forall ((r $Ref)) (!
          (<= ($FVF.perm_f (as pm@125@01  $FPM) r) $Perm.Write)
          :pattern ((inv@91@01 r))
          :qid |qp-fld-prm-bnd|))
        (<=
          ($FVF.perm_f (as pm@125@01  $FPM) (Seq_index S@85@01 a@86@01))
          $Perm.Write)))
    (or
      (not (Seq_contains (Seq_range 0 (- (Seq_length S@85@01) 1)) j@121@01))
      (Seq_contains (Seq_range 0 (- (Seq_length S@85@01) 1)) j@121@01)))
  :pattern ((Seq_index S@85@01 j@121@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@47@11@47@65-aux|)))
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((j@121@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (- (Seq_length S@85@01) 1)) j@121@01)
    (<=
      ($FVF.lookup_f (as sm@107@01  $FVF<f>) (Seq_index S@85@01 j@121@01))
      ($FVF.lookup_f (as sm@107@01  $FVF<f>) (Seq_index S@85@01 (+ j@121@01 1)))))
  :pattern ((Seq_index S@85@01 j@121@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@47@11@47@65|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- test05 ----------
(declare-const S@126@01 Seq<$Ref>)
(declare-const a@127@01 Int)
(declare-const S@128@01 Seq<$Ref>)
(declare-const a@129@01 Int)
(push) ; 1
(declare-const $t@130@01 $Snap)
(assert (= $t@130@01 ($Snap.combine ($Snap.first $t@130@01) ($Snap.second $t@130@01))))
(assert (= ($Snap.first $t@130@01) $Snap.unit))
; [eval] 0 <= a
(assert (<= 0 a@129@01))
(assert (=
  ($Snap.second $t@130@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@130@01))
    ($Snap.second ($Snap.second $t@130@01)))))
(assert (= ($Snap.first ($Snap.second $t@130@01)) $Snap.unit))
; [eval] a < |S|
; [eval] |S|
(assert (< a@129@01 (Seq_length S@128@01)))
(assert (=
  ($Snap.second ($Snap.second $t@130@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@130@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@130@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@130@01))) $Snap.unit))
; [eval] (forall j1: Int, j2: Int :: { (j1 in [0..|S|)), (j2 in [0..|S|)) } { (j1 in [0..|S|)), S[j2] } { (j2 in [0..|S|)), S[j1] } { S[j1], S[j2] } (j1 in [0..|S|)) && ((j2 in [0..|S|)) && j1 != j2) ==> S[j1] != S[j2])
(declare-const j1@131@01 Int)
(declare-const j2@132@01 Int)
(push) ; 2
; [eval] (j1 in [0..|S|)) && ((j2 in [0..|S|)) && j1 != j2) ==> S[j1] != S[j2]
; [eval] (j1 in [0..|S|)) && ((j2 in [0..|S|)) && j1 != j2)
; [eval] (j1 in [0..|S|))
; [eval] [0..|S|)
; [eval] |S|
(push) ; 3
; [then-branch: 31 | !(j1@131@01 in [0..|S@128@01|]) | live]
; [else-branch: 31 | j1@131@01 in [0..|S@128@01|] | live]
(push) ; 4
; [then-branch: 31 | !(j1@131@01 in [0..|S@128@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j1@131@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 31 | j1@131@01 in [0..|S@128@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j1@131@01))
; [eval] (j2 in [0..|S|))
; [eval] [0..|S|)
; [eval] |S|
(push) ; 5
; [then-branch: 32 | !(j2@132@01 in [0..|S@128@01|]) | live]
; [else-branch: 32 | j2@132@01 in [0..|S@128@01|] | live]
(push) ; 6
; [then-branch: 32 | !(j2@132@01 in [0..|S@128@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j2@132@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 32 | j2@132@01 in [0..|S@128@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j2@132@01))
; [eval] j1 != j2
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or
  (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j2@132@01)
  (not (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j2@132@01))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j1@131@01)
  (and
    (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j1@131@01)
    (or
      (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j2@132@01)
      (not (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j2@132@01))))))
(assert (or
  (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j1@131@01)
  (not (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j1@131@01))))
(push) ; 3
; [then-branch: 33 | j1@131@01 in [0..|S@128@01|] && j2@132@01 in [0..|S@128@01|] && j1@131@01 != j2@132@01 | live]
; [else-branch: 33 | !(j1@131@01 in [0..|S@128@01|] && j2@132@01 in [0..|S@128@01|] && j1@131@01 != j2@132@01) | live]
(push) ; 4
; [then-branch: 33 | j1@131@01 in [0..|S@128@01|] && j2@132@01 in [0..|S@128@01|] && j1@131@01 != j2@132@01]
(assert (and
  (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j1@131@01)
  (and
    (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j2@132@01)
    (not (= j1@131@01 j2@132@01)))))
; [eval] S[j1] != S[j2]
; [eval] S[j1]
(push) ; 5
(assert (not (>= j1@131@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< j1@131@01 (Seq_length S@128@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] S[j2]
(push) ; 5
(assert (not (>= j2@132@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< j2@132@01 (Seq_length S@128@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 33 | !(j1@131@01 in [0..|S@128@01|] && j2@132@01 in [0..|S@128@01|] && j1@131@01 != j2@132@01)]
(assert (not
  (and
    (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j1@131@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j2@132@01)
      (not (= j1@131@01 j2@132@01))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j1@131@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j2@132@01)
      (not (= j1@131@01 j2@132@01))))
  (and
    (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j1@131@01)
    (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j2@132@01)
    (not (= j1@131@01 j2@132@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j1@131@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j2@132@01)
        (not (= j1@131@01 j2@132@01)))))
  (and
    (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j1@131@01)
    (and
      (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j2@132@01)
      (not (= j1@131@01 j2@132@01))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j1@131@01 Int) (j2@132@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j1@131@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j1@131@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j2@132@01)
          (not (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j2@132@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j1@131@01)
      (not (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j1@131@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j1@131@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j2@132@01)
          (not (= j1@131@01 j2@132@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j1@131@01)
        (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j2@132@01)
        (not (= j1@131@01 j2@132@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j1@131@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j2@132@01)
            (not (= j1@131@01 j2@132@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j1@131@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j2@132@01)
          (not (= j1@131@01 j2@132@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length S@128@01)) j1@131@01) (Seq_contains
    (Seq_range 0 (Seq_length S@128@01))
    j2@132@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length S@128@01)) j1@131@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length S@128@01))
    j2@132@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@55@12@55@102-aux|)))
(assert (forall ((j1@131@01 Int) (j2@132@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j1@131@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j1@131@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j2@132@01)
          (not (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j2@132@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j1@131@01)
      (not (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j1@131@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j1@131@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j2@132@01)
          (not (= j1@131@01 j2@132@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j1@131@01)
        (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j2@132@01)
        (not (= j1@131@01 j2@132@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j1@131@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j2@132@01)
            (not (= j1@131@01 j2@132@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j1@131@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j2@132@01)
          (not (= j1@131@01 j2@132@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length S@128@01)) j1@131@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length S@128@01))
    j2@132@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@55@12@55@102-aux|)))
(assert (forall ((j1@131@01 Int) (j2@132@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j1@131@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j1@131@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j2@132@01)
          (not (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j2@132@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j1@131@01)
      (not (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j1@131@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j1@131@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j2@132@01)
          (not (= j1@131@01 j2@132@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j1@131@01)
        (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j2@132@01)
        (not (= j1@131@01 j2@132@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j1@131@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j2@132@01)
            (not (= j1@131@01 j2@132@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j1@131@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j2@132@01)
          (not (= j1@131@01 j2@132@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length S@128@01)) j1@131@01) (Seq_index
    S@128@01
    j2@132@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length S@128@01)) j1@131@01) (Seq_index
    S@128@01
    j2@132@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@55@12@55@102-aux|)))
(assert (forall ((j1@131@01 Int) (j2@132@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j1@131@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j1@131@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j2@132@01)
          (not (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j2@132@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j1@131@01)
      (not (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j1@131@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j1@131@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j2@132@01)
          (not (= j1@131@01 j2@132@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j1@131@01)
        (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j2@132@01)
        (not (= j1@131@01 j2@132@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j1@131@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j2@132@01)
            (not (= j1@131@01 j2@132@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j1@131@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j2@132@01)
          (not (= j1@131@01 j2@132@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length S@128@01)) j1@131@01) (Seq_index
    S@128@01
    j2@132@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@55@12@55@102-aux|)))
(assert (forall ((j1@131@01 Int) (j2@132@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j1@131@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j1@131@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j2@132@01)
          (not (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j2@132@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j1@131@01)
      (not (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j1@131@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j1@131@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j2@132@01)
          (not (= j1@131@01 j2@132@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j1@131@01)
        (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j2@132@01)
        (not (= j1@131@01 j2@132@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j1@131@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j2@132@01)
            (not (= j1@131@01 j2@132@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j1@131@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j2@132@01)
          (not (= j1@131@01 j2@132@01))))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length S@128@01)) j2@132@01) (Seq_index
    S@128@01
    j1@131@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length S@128@01)) j2@132@01) (Seq_index
    S@128@01
    j1@131@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@55@12@55@102-aux|)))
(assert (forall ((j1@131@01 Int) (j2@132@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j1@131@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j1@131@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j2@132@01)
          (not (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j2@132@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j1@131@01)
      (not (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j1@131@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j1@131@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j2@132@01)
          (not (= j1@131@01 j2@132@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j1@131@01)
        (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j2@132@01)
        (not (= j1@131@01 j2@132@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j1@131@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j2@132@01)
            (not (= j1@131@01 j2@132@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j1@131@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j2@132@01)
          (not (= j1@131@01 j2@132@01))))))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length S@128@01)) j2@132@01) (Seq_index
    S@128@01
    j1@131@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@55@12@55@102-aux|)))
(assert (forall ((j1@131@01 Int) (j2@132@01 Int)) (!
  (and
    (=>
      (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j1@131@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j1@131@01)
        (or
          (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j2@132@01)
          (not (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j2@132@01)))))
    (or
      (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j1@131@01)
      (not (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j1@131@01)))
    (=>
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j1@131@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j2@132@01)
          (not (= j1@131@01 j2@132@01))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j1@131@01)
        (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j2@132@01)
        (not (= j1@131@01 j2@132@01))))
    (or
      (not
        (and
          (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j1@131@01)
          (and
            (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j2@132@01)
            (not (= j1@131@01 j2@132@01)))))
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j1@131@01)
        (and
          (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j2@132@01)
          (not (= j1@131@01 j2@132@01))))))
  :pattern ((Seq_index S@128@01 j1@131@01) (Seq_index S@128@01 j2@132@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@55@12@55@102-aux|)))
(assert (forall ((j1@131@01 Int) (j2@132@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j1@131@01)
      (and
        (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j2@132@01)
        (not (= j1@131@01 j2@132@01))))
    (not (= (Seq_index S@128@01 j1@131@01) (Seq_index S@128@01 j2@132@01))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length S@128@01)) j1@131@01) (Seq_contains
    (Seq_range 0 (Seq_length S@128@01))
    j2@132@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length S@128@01)) j1@131@01) (Seq_contains_trigger
    (Seq_range 0 (Seq_length S@128@01))
    j2@132@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length S@128@01)) j1@131@01) (Seq_index
    S@128@01
    j2@132@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length S@128@01)) j1@131@01) (Seq_index
    S@128@01
    j2@132@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length S@128@01)) j2@132@01) (Seq_index
    S@128@01
    j1@131@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length S@128@01)) j2@132@01) (Seq_index
    S@128@01
    j1@131@01))
  :pattern ((Seq_index S@128@01 j1@131@01) (Seq_index S@128@01 j2@132@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/sequences/seq_pure.vpr@55@12@55@102|)))
(declare-const j@133@01 Int)
(push) ; 2
; [eval] (j in [0..|S|))
; [eval] [0..|S|)
; [eval] |S|
(assert (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j@133@01))
; [eval] S[j]
(push) ; 3
(assert (not (>= j@133@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< j@133@01 (Seq_length S@128@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@134@01 ($Ref) Int)
(declare-fun img@135@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((j1@133@01 Int) (j2@133@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j1@133@01)
      (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j2@133@01)
      (= (Seq_index S@128@01 j1@133@01) (Seq_index S@128@01 j2@133@01)))
    (= j1@133@01 j2@133@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@133@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j@133@01)
    (and
      (= (inv@134@01 (Seq_index S@128@01 j@133@01)) j@133@01)
      (img@135@01 (Seq_index S@128@01 j@133@01))))
  :pattern ((Seq_index S@128@01 j@133@01))
  :qid |quant-u-45|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@135@01 r)
      (Seq_contains (Seq_range 0 (Seq_length S@128@01)) (inv@134@01 r)))
    (= (Seq_index S@128@01 (inv@134@01 r)) r))
  :pattern ((inv@134@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j@133@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j@133@01)
    (not (= (Seq_index S@128@01 j@133@01) $Ref.null)))
  :pattern ((Seq_index S@128@01 j@133@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; exhale (forall j: Int ::(j in [0..|S|)) ==> acc(S[j].f, write))
(declare-const j@136@01 Int)
(push) ; 3
; [eval] (j in [0..|S|))
; [eval] [0..|S|)
; [eval] |S|
(assert (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j@136@01))
; [eval] S[j]
(push) ; 4
(assert (not (>= j@136@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< j@136@01 (Seq_length S@128@01))))
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
(assert (not (forall ((j1@136@01 Int) (j2@136@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j1@136@01)
      (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j2@136@01)
      (= (Seq_index S@128@01 j1@136@01) (Seq_index S@128@01 j2@136@01)))
    (= j1@136@01 j2@136@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@136@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j@136@01)
    (and
      (= (inv@137@01 (Seq_index S@128@01 j@136@01)) j@136@01)
      (img@138@01 (Seq_index S@128@01 j@136@01))))
  :pattern ((Seq_index S@128@01 j@136@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@138@01 r)
      (Seq_contains (Seq_range 0 (Seq_length S@128@01)) (inv@137@01 r)))
    (= (Seq_index S@128@01 (inv@137@01 r)) r))
  :pattern ((inv@137@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@139@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length S@128@01)) (inv@137@01 r))
      (img@138@01 r)
      (= r (Seq_index S@128@01 (inv@137@01 r))))
    ($Perm.min
      (ite
        (and
          (img@135@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@128@01)) (inv@134@01 r)))
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
          (img@135@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@128@01)) (inv@134@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@139@01 r))
    $Perm.No)
  
  :qid |quant-u-48|))))
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
      (Seq_contains (Seq_range 0 (Seq_length S@128@01)) (inv@137@01 r))
      (img@138@01 r)
      (= r (Seq_index S@128@01 (inv@137@01 r))))
    (= (- $Perm.Write (pTaken@139@01 r)) $Perm.No))
  
  :qid |quant-u-49|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@140@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@135@01 r)
      (Seq_contains (Seq_range 0 (Seq_length S@128@01)) (inv@134@01 r)))
    (=
      ($FVF.lookup_f (as sm@140@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second $t@130@01)))) r)))
  :pattern (($FVF.lookup_f (as sm@140@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second ($Snap.second ($Snap.second $t@130@01)))) r))
  :qid |qp.fvfValDef48|)))
; [exec]
; exhale (forall j: Int ::(j in [0..|S|)) ==> acc(S[j].f, write))
(declare-const j@141@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (j in [0..|S|))
; [eval] [0..|S|)
; [eval] |S|
(assert (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j@141@01))
; [eval] S[j]
(push) ; 4
(assert (not (>= j@141@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< j@141@01 (Seq_length S@128@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@142@01 ($Ref) Int)
(declare-fun img@143@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j1@141@01 Int) (j2@141@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j1@141@01)
      (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j2@141@01)
      (= (Seq_index S@128@01 j1@141@01) (Seq_index S@128@01 j2@141@01)))
    (= j1@141@01 j2@141@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@141@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j@141@01)
    (and
      (= (inv@142@01 (Seq_index S@128@01 j@141@01)) j@141@01)
      (img@143@01 (Seq_index S@128@01 j@141@01))))
  :pattern ((Seq_index S@128@01 j@141@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@143@01 r)
      (Seq_contains (Seq_range 0 (Seq_length S@128@01)) (inv@142@01 r)))
    (= (Seq_index S@128@01 (inv@142@01 r)) r))
  :pattern ((inv@142@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length S@128@01)) (inv@142@01 r))
      (img@143@01 r)
      (= r (Seq_index S@128@01 (inv@142@01 r))))
    false)
  
  :qid |quant-u-51|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const j@144@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (j in [0..|S|))
; [eval] [0..|S|)
; [eval] |S|
(assert (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j@144@01))
; [eval] S[j]
(push) ; 4
(assert (not (>= j@144@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< j@144@01 (Seq_length S@128@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@145@01 ($Ref) Int)
(declare-fun img@146@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j1@144@01 Int) (j2@144@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j1@144@01)
      (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j2@144@01)
      (= (Seq_index S@128@01 j1@144@01) (Seq_index S@128@01 j2@144@01)))
    (= j1@144@01 j2@144@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@144@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length S@128@01)) j@144@01)
    (and
      (= (inv@145@01 (Seq_index S@128@01 j@144@01)) j@144@01)
      (img@146@01 (Seq_index S@128@01 j@144@01))))
  :pattern ((Seq_index S@128@01 j@144@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@146@01 r)
      (Seq_contains (Seq_range 0 (Seq_length S@128@01)) (inv@145@01 r)))
    (= (Seq_index S@128@01 (inv@145@01 r)) r))
  :pattern ((inv@145@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
; Final check if taken enough permissions
(set-option :timeout 0)
(push) ; 3
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length S@128@01)) (inv@145@01 r))
      (img@146@01 r)
      (= r (Seq_index S@128@01 (inv@145@01 r))))
    false)
  
  :qid |quant-u-53|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Done removing quantified permissions
(pop) ; 2
(pop) ; 1
