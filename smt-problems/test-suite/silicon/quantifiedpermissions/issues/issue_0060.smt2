(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:16:32
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0060.vpr
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
; ---------- find_var ----------
(declare-const S@0@01 Seq<$Ref>)
(declare-const x@1@01 Int)
(declare-const index@2@01 Int)
(declare-const S@3@01 Seq<$Ref>)
(declare-const x@4@01 Int)
(declare-const index@5@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@6@01 $Snap)
(assert (= $t@6@01 ($Snap.combine ($Snap.first $t@6@01) ($Snap.second $t@6@01))))
(assert (= ($Snap.first $t@6@01) $Snap.unit))
; [eval] (forall i: Int, j: Int :: { S[i], S[j] } 0 <= i && (i < j && j < |S|) ==> S[i] != S[j])
(declare-const i@7@01 Int)
(declare-const j@8@01 Int)
(push) ; 2
; [eval] 0 <= i && (i < j && j < |S|) ==> S[i] != S[j]
; [eval] 0 <= i && (i < j && j < |S|)
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
; [eval] i < j
(push) ; 5
; [then-branch: 1 | !(i@7@01 < j@8@01) | live]
; [else-branch: 1 | i@7@01 < j@8@01 | live]
(push) ; 6
; [then-branch: 1 | !(i@7@01 < j@8@01)]
(assert (not (< i@7@01 j@8@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 1 | i@7@01 < j@8@01]
(assert (< i@7@01 j@8@01))
; [eval] j < |S|
; [eval] |S|
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (< i@7@01 j@8@01) (not (< i@7@01 j@8@01))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i@7@01)
  (and (<= 0 i@7@01) (or (< i@7@01 j@8@01) (not (< i@7@01 j@8@01))))))
(assert (or (<= 0 i@7@01) (not (<= 0 i@7@01))))
(push) ; 3
; [then-branch: 2 | 0 <= i@7@01 && i@7@01 < j@8@01 && j@8@01 < |S@3@01| | live]
; [else-branch: 2 | !(0 <= i@7@01 && i@7@01 < j@8@01 && j@8@01 < |S@3@01|) | live]
(push) ; 4
; [then-branch: 2 | 0 <= i@7@01 && i@7@01 < j@8@01 && j@8@01 < |S@3@01|]
(assert (and (<= 0 i@7@01) (and (< i@7@01 j@8@01) (< j@8@01 (Seq_length S@3@01)))))
; [eval] S[i] != S[j]
; [eval] S[i]
(push) ; 5
(assert (not (>= i@7@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@7@01 (Seq_length S@3@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] S[j]
(push) ; 5
(assert (not (>= j@8@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 2 | !(0 <= i@7@01 && i@7@01 < j@8@01 && j@8@01 < |S@3@01|)]
(assert (not (and (<= 0 i@7@01) (and (< i@7@01 j@8@01) (< j@8@01 (Seq_length S@3@01))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and (<= 0 i@7@01) (and (< i@7@01 j@8@01) (< j@8@01 (Seq_length S@3@01))))
  (and (<= 0 i@7@01) (< i@7@01 j@8@01) (< j@8@01 (Seq_length S@3@01)))))
; Joined path conditions
(assert (or
  (not
    (and (<= 0 i@7@01) (and (< i@7@01 j@8@01) (< j@8@01 (Seq_length S@3@01)))))
  (and (<= 0 i@7@01) (and (< i@7@01 j@8@01) (< j@8@01 (Seq_length S@3@01))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@7@01 Int) (j@8@01 Int)) (!
  (and
    (=>
      (<= 0 i@7@01)
      (and (<= 0 i@7@01) (or (< i@7@01 j@8@01) (not (< i@7@01 j@8@01)))))
    (or (<= 0 i@7@01) (not (<= 0 i@7@01)))
    (=>
      (and (<= 0 i@7@01) (and (< i@7@01 j@8@01) (< j@8@01 (Seq_length S@3@01))))
      (and (<= 0 i@7@01) (< i@7@01 j@8@01) (< j@8@01 (Seq_length S@3@01))))
    (or
      (not
        (and
          (<= 0 i@7@01)
          (and (< i@7@01 j@8@01) (< j@8@01 (Seq_length S@3@01)))))
      (and (<= 0 i@7@01) (and (< i@7@01 j@8@01) (< j@8@01 (Seq_length S@3@01))))))
  :pattern ((Seq_index S@3@01 i@7@01) (Seq_index S@3@01 j@8@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0060.vpr@7@12@7@80-aux|)))
(assert (forall ((i@7@01 Int) (j@8@01 Int)) (!
  (=>
    (and (<= 0 i@7@01) (and (< i@7@01 j@8@01) (< j@8@01 (Seq_length S@3@01))))
    (not (= (Seq_index S@3@01 i@7@01) (Seq_index S@3@01 j@8@01))))
  :pattern ((Seq_index S@3@01 i@7@01) (Seq_index S@3@01 j@8@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0060.vpr@7@12@7@80|)))
(declare-const i@9@01 Int)
(push) ; 2
; [eval] (i in [0..|S|))
; [eval] [0..|S|)
; [eval] |S|
(assert (Seq_contains (Seq_range 0 (Seq_length S@3@01)) i@9@01))
; [eval] S[i]
(push) ; 3
(assert (not (>= i@9@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@9@01 (Seq_length S@3@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@10@01 ($Ref) Int)
(declare-fun img@11@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@9@01 Int) (i2@9@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length S@3@01)) i1@9@01)
      (Seq_contains (Seq_range 0 (Seq_length S@3@01)) i2@9@01)
      (= (Seq_index S@3@01 i1@9@01) (Seq_index S@3@01 i2@9@01)))
    (= i1@9@01 i2@9@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@9@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length S@3@01)) i@9@01)
    (and
      (= (inv@10@01 (Seq_index S@3@01 i@9@01)) i@9@01)
      (img@11@01 (Seq_index S@3@01 i@9@01))))
  :pattern ((Seq_index S@3@01 i@9@01))
  :qid |quant-u-1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@11@01 r)
      (Seq_contains (Seq_range 0 (Seq_length S@3@01)) (inv@10@01 r)))
    (= (Seq_index S@3@01 (inv@10@01 r)) r))
  :pattern ((inv@10@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@9@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length S@3@01)) i@9@01)
    (not (= (Seq_index S@3@01 i@9@01) $Ref.null)))
  :pattern ((Seq_index S@3@01 i@9@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@12@01 $Snap)
(assert (= $t@12@01 ($Snap.combine ($Snap.first $t@12@01) ($Snap.second $t@12@01))))
(declare-const j@13@01 Int)
(push) ; 3
; [eval] (j in [0..|S|))
; [eval] [0..|S|)
; [eval] |S|
(assert (Seq_contains (Seq_range 0 (Seq_length S@3@01)) j@13@01))
; [eval] S[j]
(push) ; 4
(assert (not (>= j@13@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< j@13@01 (Seq_length S@3@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@14@01 ($Ref) Int)
(declare-fun img@15@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((j1@13@01 Int) (j2@13@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length S@3@01)) j1@13@01)
      (Seq_contains (Seq_range 0 (Seq_length S@3@01)) j2@13@01)
      (= (Seq_index S@3@01 j1@13@01) (Seq_index S@3@01 j2@13@01)))
    (= j1@13@01 j2@13@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@13@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length S@3@01)) j@13@01)
    (and
      (= (inv@14@01 (Seq_index S@3@01 j@13@01)) j@13@01)
      (img@15@01 (Seq_index S@3@01 j@13@01))))
  :pattern ((Seq_index S@3@01 j@13@01))
  :qid |quant-u-3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@15@01 r)
      (Seq_contains (Seq_range 0 (Seq_length S@3@01)) (inv@14@01 r)))
    (= (Seq_index S@3@01 (inv@14@01 r)) r))
  :pattern ((inv@14@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j@13@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length S@3@01)) j@13@01)
    (not (= (Seq_index S@3@01 j@13@01) $Ref.null)))
  :pattern ((Seq_index S@3@01 j@13@01))
  :qid |f-permImpliesNonNull|)))
(assert (=
  ($Snap.second $t@12@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@12@01))
    ($Snap.second ($Snap.second $t@12@01)))))
(assert (= ($Snap.first ($Snap.second $t@12@01)) $Snap.unit))
; [eval] 0 <= index
(assert (<= 0 index@5@01))
(assert (=
  ($Snap.second ($Snap.second $t@12@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@12@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@12@01))) $Snap.unit))
; [eval] index <= |S|
; [eval] |S|
(assert (<= index@5@01 (Seq_length S@3@01)))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@12@01))) $Snap.unit))
; [eval] 0 <= index && index < |S| ==> S[index].f == x
; [eval] 0 <= index && index < |S|
; [eval] 0 <= index
(push) ; 3
; [then-branch: 3 | !(0 <= index@5@01) | live]
; [else-branch: 3 | 0 <= index@5@01 | live]
(push) ; 4
; [then-branch: 3 | !(0 <= index@5@01)]
(assert (not (<= 0 index@5@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 3 | 0 <= index@5@01]
; [eval] index < |S|
; [eval] |S|
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 index@5@01) (not (<= 0 index@5@01))))
(push) ; 3
(push) ; 4
(set-option :timeout 10)
(assert (not (not (and (<= 0 index@5@01) (< index@5@01 (Seq_length S@3@01))))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (and (<= 0 index@5@01) (< index@5@01 (Seq_length S@3@01)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 4 | 0 <= index@5@01 && index@5@01 < |S@3@01| | live]
; [else-branch: 4 | !(0 <= index@5@01 && index@5@01 < |S@3@01|) | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 4 | 0 <= index@5@01 && index@5@01 < |S@3@01|]
(assert (and (<= 0 index@5@01) (< index@5@01 (Seq_length S@3@01))))
; [eval] S[index].f == x
; [eval] S[index]
(push) ; 5
(assert (not (>= index@5@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (and
  (img@15@01 (Seq_index S@3@01 index@5@01))
  (Seq_contains
    (Seq_range 0 (Seq_length S@3@01))
    (inv@14@01 (Seq_index S@3@01 index@5@01))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 4 | !(0 <= index@5@01 && index@5@01 < |S@3@01|)]
(assert (not (and (<= 0 index@5@01) (< index@5@01 (Seq_length S@3@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (<= 0 index@5@01) (< index@5@01 (Seq_length S@3@01))))
  (and (<= 0 index@5@01) (< index@5@01 (Seq_length S@3@01)))))
(assert (=>
  (and (<= 0 index@5@01) (< index@5@01 (Seq_length S@3@01)))
  (=
    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@12@01)) (Seq_index
      S@3@01
      index@5@01))
    x@4@01)))
(pop) ; 2
(push) ; 2
; [eval] |S| == 0
; [eval] |S|
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= (Seq_length S@3@01) 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (Seq_length S@3@01) 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 5 | |S@3@01| == 0 | live]
; [else-branch: 5 | |S@3@01| != 0 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 5 | |S@3@01| == 0]
(assert (= (Seq_length S@3@01) 0))
; [exec]
; index := 0
(declare-const j@16@01 Int)
(push) ; 4
; [eval] (j in [0..|S|))
; [eval] [0..|S|)
; [eval] |S|
(assert (Seq_contains (Seq_range 0 (Seq_length S@3@01)) j@16@01))
; [eval] S[j]
(push) ; 5
(assert (not (>= j@16@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< j@16@01 (Seq_length S@3@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@17@01 ($Ref) Int)
(declare-fun img@18@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((j1@16@01 Int) (j2@16@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length S@3@01)) j1@16@01)
      (Seq_contains (Seq_range 0 (Seq_length S@3@01)) j2@16@01)
      (= (Seq_index S@3@01 j1@16@01) (Seq_index S@3@01 j2@16@01)))
    (= j1@16@01 j2@16@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@16@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length S@3@01)) j@16@01)
    (and
      (= (inv@17@01 (Seq_index S@3@01 j@16@01)) j@16@01)
      (img@18@01 (Seq_index S@3@01 j@16@01))))
  :pattern ((Seq_index S@3@01 j@16@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@18@01 r)
      (Seq_contains (Seq_range 0 (Seq_length S@3@01)) (inv@17@01 r)))
    (= (Seq_index S@3@01 (inv@17@01 r)) r))
  :pattern ((inv@17@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@19@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length S@3@01)) (inv@17@01 r))
      (img@18@01 r)
      (= r (Seq_index S@3@01 (inv@17@01 r))))
    ($Perm.min
      (ite
        (and
          (img@11@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@3@01)) (inv@10@01 r)))
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
          (img@11@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@3@01)) (inv@10@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@19@01 r))
    $Perm.No)
  
  :qid |quant-u-6|))))
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
      (Seq_contains (Seq_range 0 (Seq_length S@3@01)) (inv@17@01 r))
      (img@18@01 r)
      (= r (Seq_index S@3@01 (inv@17@01 r))))
    (= (- $Perm.Write (pTaken@19@01 r)) $Perm.No))
  
  :qid |quant-u-7|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@20@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@11@01 r)
      (Seq_contains (Seq_range 0 (Seq_length S@3@01)) (inv@10@01 r)))
    (=
      ($FVF.lookup_f (as sm@20@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@6@01)) r)))
  :pattern (($FVF.lookup_f (as sm@20@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@6@01)) r))
  :qid |qp.fvfValDef0|)))
; [eval] 0 <= index
; [eval] index <= |S|
; [eval] |S|
(set-option :timeout 0)
(push) ; 4
(assert (not (<= 0 (Seq_length S@3@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 (Seq_length S@3@01)))
; [eval] 0 <= index && index < |S| ==> S[index].f == x
; [eval] 0 <= index && index < |S|
; [eval] 0 <= index
(push) ; 4
; [then-branch: 6 | False | live]
; [else-branch: 6 | True | live]
(push) ; 5
; [then-branch: 6 | False]
(assert false)
(pop) ; 5
(push) ; 5
; [else-branch: 6 | True]
; [eval] index < |S|
; [eval] |S|
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(push) ; 4
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< 0 (Seq_length S@3@01)))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | 0 < |S@3@01| | dead]
; [else-branch: 7 | !(0 < |S@3@01|) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 7 | !(0 < |S@3@01|)]
(assert (not (< 0 (Seq_length S@3@01))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (not (< 0 (Seq_length S@3@01))))
(pop) ; 3
(push) ; 3
; [else-branch: 5 | |S@3@01| != 0]
(assert (not (= (Seq_length S@3@01) 0)))
(pop) ; 3
; [eval] !(|S| == 0)
; [eval] |S| == 0
; [eval] |S|
(push) ; 3
(set-option :timeout 10)
(assert (not (= (Seq_length S@3@01) 0)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (not (= (Seq_length S@3@01) 0))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 8 | |S@3@01| != 0 | live]
; [else-branch: 8 | |S@3@01| == 0 | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 8 | |S@3@01| != 0]
(assert (not (= (Seq_length S@3@01) 0)))
; [eval] |S| == 1
; [eval] |S|
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= (Seq_length S@3@01) 1))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (Seq_length S@3@01) 1)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 9 | |S@3@01| == 1 | live]
; [else-branch: 9 | |S@3@01| != 1 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 9 | |S@3@01| == 1]
(assert (= (Seq_length S@3@01) 1))
; [exec]
; index := (x == S[0].f ? 0 : 1)
; [eval] (x == S[0].f ? 0 : 1)
; [eval] x == S[0].f
; [eval] S[0]
(push) ; 5
(assert (not (< 0 (Seq_length S@3@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (and
  (img@11@01 (Seq_index S@3@01 0))
  (Seq_contains
    (Seq_range 0 (Seq_length S@3@01))
    (inv@10@01 (Seq_index S@3@01 0))))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(push) ; 6
(set-option :timeout 10)
(assert (not (not
  (=
    x@4@01
    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@6@01)) (Seq_index
      S@3@01
      0))))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (=
  x@4@01
  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@6@01)) (Seq_index
    S@3@01
    0)))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 10 | x@4@01 == Lookup(f, Second:($t@6@01), S@3@01[0]) | live]
; [else-branch: 10 | x@4@01 != Lookup(f, Second:($t@6@01), S@3@01[0]) | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 10 | x@4@01 == Lookup(f, Second:($t@6@01), S@3@01[0])]
(assert (=
  x@4@01
  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@6@01)) (Seq_index
    S@3@01
    0))))
(pop) ; 6
(push) ; 6
; [else-branch: 10 | x@4@01 != Lookup(f, Second:($t@6@01), S@3@01[0])]
(assert (not
  (=
    x@4@01
    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@6@01)) (Seq_index
      S@3@01
      0)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or
  (not
    (=
      x@4@01
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@6@01)) (Seq_index
        S@3@01
        0))))
  (=
    x@4@01
    ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@6@01)) (Seq_index
      S@3@01
      0)))))
(declare-const index@21@01 Int)
(assert (=
  index@21@01
  (ite
    (=
      x@4@01
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@6@01)) (Seq_index
        S@3@01
        0)))
    0
    1)))
(declare-const j@22@01 Int)
(push) ; 5
; [eval] (j in [0..|S|))
; [eval] [0..|S|)
; [eval] |S|
(assert (Seq_contains (Seq_range 0 (Seq_length S@3@01)) j@22@01))
; [eval] S[j]
(push) ; 6
(assert (not (>= j@22@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< j@22@01 (Seq_length S@3@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(declare-fun inv@23@01 ($Ref) Int)
(declare-fun img@24@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((j1@22@01 Int) (j2@22@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length S@3@01)) j1@22@01)
      (Seq_contains (Seq_range 0 (Seq_length S@3@01)) j2@22@01)
      (= (Seq_index S@3@01 j1@22@01) (Seq_index S@3@01 j2@22@01)))
    (= j1@22@01 j2@22@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@22@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length S@3@01)) j@22@01)
    (and
      (= (inv@23@01 (Seq_index S@3@01 j@22@01)) j@22@01)
      (img@24@01 (Seq_index S@3@01 j@22@01))))
  :pattern ((Seq_index S@3@01 j@22@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@24@01 r)
      (Seq_contains (Seq_range 0 (Seq_length S@3@01)) (inv@23@01 r)))
    (= (Seq_index S@3@01 (inv@23@01 r)) r))
  :pattern ((inv@23@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@25@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length S@3@01)) (inv@23@01 r))
      (img@24@01 r)
      (= r (Seq_index S@3@01 (inv@23@01 r))))
    ($Perm.min
      (ite
        (and
          (img@11@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@3@01)) (inv@10@01 r)))
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
          (img@11@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@3@01)) (inv@10@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@25@01 r))
    $Perm.No)
  
  :qid |quant-u-10|))))
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
      (Seq_contains (Seq_range 0 (Seq_length S@3@01)) (inv@23@01 r))
      (img@24@01 r)
      (= r (Seq_index S@3@01 (inv@23@01 r))))
    (= (- $Perm.Write (pTaken@25@01 r)) $Perm.No))
  
  :qid |quant-u-11|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@26@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@11@01 r)
      (Seq_contains (Seq_range 0 (Seq_length S@3@01)) (inv@10@01 r)))
    (=
      ($FVF.lookup_f (as sm@26@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@6@01)) r)))
  :pattern (($FVF.lookup_f (as sm@26@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@6@01)) r))
  :qid |qp.fvfValDef1|)))
; [eval] 0 <= index
(set-option :timeout 0)
(push) ; 5
(assert (not (<= 0 index@21@01)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 index@21@01))
; [eval] index <= |S|
; [eval] |S|
(push) ; 5
(assert (not (<= index@21@01 (Seq_length S@3@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (<= index@21@01 (Seq_length S@3@01)))
; [eval] 0 <= index && index < |S| ==> S[index].f == x
; [eval] 0 <= index && index < |S|
; [eval] 0 <= index
(push) ; 5
; [then-branch: 11 | !(0 <= index@21@01) | live]
; [else-branch: 11 | 0 <= index@21@01 | live]
(push) ; 6
; [then-branch: 11 | !(0 <= index@21@01)]
(assert (not (<= 0 index@21@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 11 | 0 <= index@21@01]
; [eval] index < |S|
; [eval] |S|
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 index@21@01) (not (<= 0 index@21@01))))
(push) ; 5
(push) ; 6
(set-option :timeout 10)
(assert (not (not (and (<= 0 index@21@01) (< index@21@01 (Seq_length S@3@01))))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and (<= 0 index@21@01) (< index@21@01 (Seq_length S@3@01)))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 12 | 0 <= index@21@01 && index@21@01 < |S@3@01| | live]
; [else-branch: 12 | !(0 <= index@21@01 && index@21@01 < |S@3@01|) | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 12 | 0 <= index@21@01 && index@21@01 < |S@3@01|]
(assert (and (<= 0 index@21@01) (< index@21@01 (Seq_length S@3@01))))
; [eval] S[index].f == x
; [eval] S[index]
(push) ; 7
(assert (not (>= index@21@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (and
  (img@11@01 (Seq_index S@3@01 index@21@01))
  (Seq_contains
    (Seq_range 0 (Seq_length S@3@01))
    (inv@10@01 (Seq_index S@3@01 index@21@01))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 12 | !(0 <= index@21@01 && index@21@01 < |S@3@01|)]
(assert (not (and (<= 0 index@21@01) (< index@21@01 (Seq_length S@3@01)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (<= 0 index@21@01) (< index@21@01 (Seq_length S@3@01))))
  (and (<= 0 index@21@01) (< index@21@01 (Seq_length S@3@01)))))
(push) ; 5
(assert (not (=>
  (and (<= 0 index@21@01) (< index@21@01 (Seq_length S@3@01)))
  (=
    ($FVF.lookup_f (as sm@26@01  $FVF<f>) (Seq_index S@3@01 index@21@01))
    x@4@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=>
  (and (<= 0 index@21@01) (< index@21@01 (Seq_length S@3@01)))
  (=
    ($FVF.lookup_f (as sm@26@01  $FVF<f>) (Seq_index S@3@01 index@21@01))
    x@4@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 9 | |S@3@01| != 1]
(assert (not (= (Seq_length S@3@01) 1)))
(pop) ; 4
; [eval] !(|S| == 1)
; [eval] |S| == 1
; [eval] |S|
(push) ; 4
(set-option :timeout 10)
(assert (not (= (Seq_length S@3@01) 1)))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (not (= (Seq_length S@3@01) 1))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; [then-branch: 13 | |S@3@01| != 1 | live]
; [else-branch: 13 | |S@3@01| == 1 | live]
(set-option :timeout 0)
(push) ; 4
; [then-branch: 13 | |S@3@01| != 1]
(assert (not (= (Seq_length S@3@01) 1)))
; [exec]
; var k: Int
(declare-const k@27@01 Int)
; [exec]
; var f1: Int
(declare-const f1@28@01 Int)
; [exec]
; var f2: Int
(declare-const f2@29@01 Int)
; [exec]
; inhale 0 < k && k < |S| - 1
(declare-const $t@30@01 $Snap)
(assert (= $t@30@01 ($Snap.combine ($Snap.first $t@30@01) ($Snap.second $t@30@01))))
(assert (= ($Snap.first $t@30@01) $Snap.unit))
; [eval] 0 < k
(assert (< 0 k@27@01))
(assert (= ($Snap.second $t@30@01) $Snap.unit))
; [eval] k < |S| - 1
; [eval] |S| - 1
; [eval] |S|
(assert (< k@27@01 (- (Seq_length S@3@01) 1)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; f1 := find_var(S[..k], x)
; [eval] S[..k]
; [eval] (forall i: Int, j: Int :: { S[i], S[j] } 0 <= i && (i < j && j < |S|) ==> S[i] != S[j])
(declare-const i@31@01 Int)
(declare-const j@32@01 Int)
(set-option :timeout 0)
(push) ; 5
; [eval] 0 <= i && (i < j && j < |S|) ==> S[i] != S[j]
; [eval] 0 <= i && (i < j && j < |S|)
; [eval] 0 <= i
(push) ; 6
; [then-branch: 14 | !(0 <= i@31@01) | live]
; [else-branch: 14 | 0 <= i@31@01 | live]
(push) ; 7
; [then-branch: 14 | !(0 <= i@31@01)]
(assert (not (<= 0 i@31@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 14 | 0 <= i@31@01]
(assert (<= 0 i@31@01))
; [eval] i < j
(push) ; 8
; [then-branch: 15 | !(i@31@01 < j@32@01) | live]
; [else-branch: 15 | i@31@01 < j@32@01 | live]
(push) ; 9
; [then-branch: 15 | !(i@31@01 < j@32@01)]
(assert (not (< i@31@01 j@32@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 15 | i@31@01 < j@32@01]
(assert (< i@31@01 j@32@01))
; [eval] j < |S|
; [eval] |S|
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or (< i@31@01 j@32@01) (not (< i@31@01 j@32@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i@31@01)
  (and (<= 0 i@31@01) (or (< i@31@01 j@32@01) (not (< i@31@01 j@32@01))))))
(assert (or (<= 0 i@31@01) (not (<= 0 i@31@01))))
(push) ; 6
; [then-branch: 16 | 0 <= i@31@01 && i@31@01 < j@32@01 && j@32@01 < |S@3@01[:k@27@01]| | live]
; [else-branch: 16 | !(0 <= i@31@01 && i@31@01 < j@32@01 && j@32@01 < |S@3@01[:k@27@01]|) | live]
(push) ; 7
; [then-branch: 16 | 0 <= i@31@01 && i@31@01 < j@32@01 && j@32@01 < |S@3@01[:k@27@01]|]
(assert (and
  (<= 0 i@31@01)
  (and (< i@31@01 j@32@01) (< j@32@01 (Seq_length (Seq_take S@3@01 k@27@01))))))
; [eval] S[i] != S[j]
; [eval] S[i]
(push) ; 8
(assert (not (>= i@31@01 0)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(push) ; 8
(assert (not (< i@31@01 (Seq_length (Seq_take S@3@01 k@27@01)))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [eval] S[j]
(push) ; 8
(assert (not (>= j@32@01 0)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
(push) ; 7
; [else-branch: 16 | !(0 <= i@31@01 && i@31@01 < j@32@01 && j@32@01 < |S@3@01[:k@27@01]|)]
(assert (not
  (and
    (<= 0 i@31@01)
    (and (< i@31@01 j@32@01) (< j@32@01 (Seq_length (Seq_take S@3@01 k@27@01)))))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (and
    (<= 0 i@31@01)
    (and (< i@31@01 j@32@01) (< j@32@01 (Seq_length (Seq_take S@3@01 k@27@01)))))
  (and
    (<= 0 i@31@01)
    (< i@31@01 j@32@01)
    (< j@32@01 (Seq_length (Seq_take S@3@01 k@27@01))))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i@31@01)
      (and
        (< i@31@01 j@32@01)
        (< j@32@01 (Seq_length (Seq_take S@3@01 k@27@01))))))
  (and
    (<= 0 i@31@01)
    (and (< i@31@01 j@32@01) (< j@32@01 (Seq_length (Seq_take S@3@01 k@27@01)))))))
(pop) ; 5
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@31@01 Int) (j@32@01 Int)) (!
  (and
    (=>
      (<= 0 i@31@01)
      (and (<= 0 i@31@01) (or (< i@31@01 j@32@01) (not (< i@31@01 j@32@01)))))
    (or (<= 0 i@31@01) (not (<= 0 i@31@01)))
    (=>
      (and
        (<= 0 i@31@01)
        (and
          (< i@31@01 j@32@01)
          (< j@32@01 (Seq_length (Seq_take S@3@01 k@27@01)))))
      (and
        (<= 0 i@31@01)
        (< i@31@01 j@32@01)
        (< j@32@01 (Seq_length (Seq_take S@3@01 k@27@01)))))
    (or
      (not
        (and
          (<= 0 i@31@01)
          (and
            (< i@31@01 j@32@01)
            (< j@32@01 (Seq_length (Seq_take S@3@01 k@27@01))))))
      (and
        (<= 0 i@31@01)
        (and
          (< i@31@01 j@32@01)
          (< j@32@01 (Seq_length (Seq_take S@3@01 k@27@01)))))))
  :pattern ((Seq_index (Seq_take S@3@01 k@27@01) i@31@01) (Seq_index
    (Seq_take S@3@01 k@27@01)
    j@32@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0060.vpr@7@12@7@80-aux|)))
(push) ; 5
(assert (not (forall ((i@31@01 Int) (j@32@01 Int)) (!
  (=>
    (and
      (<= 0 i@31@01)
      (and
        (< i@31@01 j@32@01)
        (< j@32@01 (Seq_length (Seq_take S@3@01 k@27@01)))))
    (not
      (=
        (Seq_index (Seq_take S@3@01 k@27@01) i@31@01)
        (Seq_index (Seq_take S@3@01 k@27@01) j@32@01))))
  :pattern ((Seq_index (Seq_take S@3@01 k@27@01) i@31@01) (Seq_index
    (Seq_take S@3@01 k@27@01)
    j@32@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0060.vpr@7@12@7@80|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@31@01 Int) (j@32@01 Int)) (!
  (=>
    (and
      (<= 0 i@31@01)
      (and
        (< i@31@01 j@32@01)
        (< j@32@01 (Seq_length (Seq_take S@3@01 k@27@01)))))
    (not
      (=
        (Seq_index (Seq_take S@3@01 k@27@01) i@31@01)
        (Seq_index (Seq_take S@3@01 k@27@01) j@32@01))))
  :pattern ((Seq_index (Seq_take S@3@01 k@27@01) i@31@01) (Seq_index
    (Seq_take S@3@01 k@27@01)
    j@32@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0060.vpr@7@12@7@80|)))
(declare-const i@33@01 Int)
(push) ; 5
; [eval] (i in [0..|S|))
; [eval] [0..|S|)
; [eval] |S|
(assert (Seq_contains (Seq_range 0 (Seq_length (Seq_take S@3@01 k@27@01))) i@33@01))
; [eval] S[i]
(push) ; 6
(assert (not (>= i@33@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@33@01 (Seq_length (Seq_take S@3@01 k@27@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(declare-fun inv@34@01 ($Ref) Int)
(declare-fun img@35@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((i1@33@01 Int) (i2@33@01 Int)) (!
  (=>
    (and
      (Seq_contains
        (Seq_range 0 (Seq_length (Seq_take S@3@01 k@27@01)))
        i1@33@01)
      (Seq_contains
        (Seq_range 0 (Seq_length (Seq_take S@3@01 k@27@01)))
        i2@33@01)
      (=
        (Seq_index (Seq_take S@3@01 k@27@01) i1@33@01)
        (Seq_index (Seq_take S@3@01 k@27@01) i2@33@01)))
    (= i1@33@01 i2@33@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@33@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length (Seq_take S@3@01 k@27@01))) i@33@01)
    (and
      (= (inv@34@01 (Seq_index (Seq_take S@3@01 k@27@01) i@33@01)) i@33@01)
      (img@35@01 (Seq_index (Seq_take S@3@01 k@27@01) i@33@01))))
  :pattern ((Seq_index (Seq_take S@3@01 k@27@01) i@33@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@35@01 r)
      (Seq_contains
        (Seq_range 0 (Seq_length (Seq_take S@3@01 k@27@01)))
        (inv@34@01 r)))
    (= (Seq_index (Seq_take S@3@01 k@27@01) (inv@34@01 r)) r))
  :pattern ((inv@34@01 r))
  :qid |f-fctOfInv|)))
(push) ; 5
(set-option :timeout 10)
(assert (not (forall ((i@33@01 Int)) (!
  (= (Seq_index (Seq_take S@3@01 k@27@01) i@33@01) (Seq_index S@3@01 i@33@01))
  
  :qid |quant-u-13|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@36@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains
        (Seq_range 0 (Seq_length (Seq_take S@3@01 k@27@01)))
        (inv@34@01 r))
      (img@35@01 r)
      (= r (Seq_index (Seq_take S@3@01 k@27@01) (inv@34@01 r))))
    ($Perm.min
      (ite
        (and
          (img@11@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@3@01)) (inv@10@01 r)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
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
          (img@11@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@3@01)) (inv@10@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@36@01 r))
    $Perm.No)
  
  :qid |quant-u-15|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@36@01 r) $Perm.No)
  
  :qid |quant-u-16|))))
(check-sat)
; unknown
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
      (Seq_contains
        (Seq_range 0 (Seq_length (Seq_take S@3@01 k@27@01)))
        (inv@34@01 r))
      (img@35@01 r)
      (= r (Seq_index (Seq_take S@3@01 k@27@01) (inv@34@01 r))))
    (= (- $Perm.Write (pTaken@36@01 r)) $Perm.No))
  
  :qid |quant-u-17|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@37@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@11@01 r)
      (Seq_contains (Seq_range 0 (Seq_length S@3@01)) (inv@10@01 r)))
    (=
      ($FVF.lookup_f (as sm@37@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@6@01)) r)))
  :pattern (($FVF.lookup_f (as sm@37@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@6@01)) r))
  :qid |qp.fvfValDef2|)))
(declare-const index@38@01 Int)
(declare-const $t@39@01 $Snap)
(assert (= $t@39@01 ($Snap.combine ($Snap.first $t@39@01) ($Snap.second $t@39@01))))
(declare-const j@40@01 Int)
(set-option :timeout 0)
(push) ; 5
; [eval] (j in [0..|S|))
; [eval] [0..|S|)
; [eval] |S|
(assert (Seq_contains (Seq_range 0 (Seq_length (Seq_take S@3@01 k@27@01))) j@40@01))
; [eval] S[j]
(push) ; 6
(assert (not (>= j@40@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< j@40@01 (Seq_length (Seq_take S@3@01 k@27@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(declare-fun inv@41@01 ($Ref) Int)
(declare-fun img@42@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((j1@40@01 Int) (j2@40@01 Int)) (!
  (=>
    (and
      (Seq_contains
        (Seq_range 0 (Seq_length (Seq_take S@3@01 k@27@01)))
        j1@40@01)
      (Seq_contains
        (Seq_range 0 (Seq_length (Seq_take S@3@01 k@27@01)))
        j2@40@01)
      (=
        (Seq_index (Seq_take S@3@01 k@27@01) j1@40@01)
        (Seq_index (Seq_take S@3@01 k@27@01) j2@40@01)))
    (= j1@40@01 j2@40@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@40@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length (Seq_take S@3@01 k@27@01))) j@40@01)
    (and
      (= (inv@41@01 (Seq_index (Seq_take S@3@01 k@27@01) j@40@01)) j@40@01)
      (img@42@01 (Seq_index (Seq_take S@3@01 k@27@01) j@40@01))))
  :pattern ((Seq_index (Seq_take S@3@01 k@27@01) j@40@01))
  :qid |quant-u-19|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@42@01 r)
      (Seq_contains
        (Seq_range 0 (Seq_length (Seq_take S@3@01 k@27@01)))
        (inv@41@01 r)))
    (= (Seq_index (Seq_take S@3@01 k@27@01) (inv@41@01 r)) r))
  :pattern ((inv@41@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j@40@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length (Seq_take S@3@01 k@27@01))) j@40@01)
    (not (= (Seq_index (Seq_take S@3@01 k@27@01) j@40@01) $Ref.null)))
  :pattern ((Seq_index (Seq_take S@3@01 k@27@01) j@40@01))
  :qid |f-permImpliesNonNull|)))
(push) ; 5
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index (Seq_take S@3@01 k@27@01) j@40@01) (Seq_index S@3@01 i@9@01))
    (=
      (and
        (img@42@01 r)
        (Seq_contains
          (Seq_range 0 (Seq_length (Seq_take S@3@01 k@27@01)))
          (inv@41@01 r)))
      (and
        (img@11@01 r)
        (Seq_contains (Seq_range 0 (Seq_length S@3@01)) (inv@10@01 r)))))
  
  :qid |quant-u-20|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second $t@39@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@39@01))
    ($Snap.second ($Snap.second $t@39@01)))))
(assert (= ($Snap.first ($Snap.second $t@39@01)) $Snap.unit))
; [eval] 0 <= index
(assert (<= 0 index@38@01))
(assert (=
  ($Snap.second ($Snap.second $t@39@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@39@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@39@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@39@01))) $Snap.unit))
; [eval] index <= |S|
; [eval] |S|
(assert (<= index@38@01 (Seq_length (Seq_take S@3@01 k@27@01))))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@39@01))) $Snap.unit))
; [eval] 0 <= index && index < |S| ==> S[index].f == x
; [eval] 0 <= index && index < |S|
; [eval] 0 <= index
(set-option :timeout 0)
(push) ; 5
; [then-branch: 17 | !(0 <= index@38@01) | live]
; [else-branch: 17 | 0 <= index@38@01 | live]
(push) ; 6
; [then-branch: 17 | !(0 <= index@38@01)]
(assert (not (<= 0 index@38@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 17 | 0 <= index@38@01]
; [eval] index < |S|
; [eval] |S|
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 index@38@01) (not (<= 0 index@38@01))))
(push) ; 5
(push) ; 6
(set-option :timeout 10)
(assert (not (not
  (and (<= 0 index@38@01) (< index@38@01 (Seq_length (Seq_take S@3@01 k@27@01)))))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and (<= 0 index@38@01) (< index@38@01 (Seq_length (Seq_take S@3@01 k@27@01))))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 18 | 0 <= index@38@01 && index@38@01 < |S@3@01[:k@27@01]| | live]
; [else-branch: 18 | !(0 <= index@38@01 && index@38@01 < |S@3@01[:k@27@01]|) | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 18 | 0 <= index@38@01 && index@38@01 < |S@3@01[:k@27@01]|]
(assert (and (<= 0 index@38@01) (< index@38@01 (Seq_length (Seq_take S@3@01 k@27@01)))))
; [eval] S[index].f == x
; [eval] S[index]
(push) ; 7
(assert (not (>= index@38@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(declare-const sm@43@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@11@01 r)
        (Seq_contains (Seq_range 0 (Seq_length S@3@01)) (inv@10@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@36@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@43@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@6@01)) r)))
  :pattern (($FVF.lookup_f (as sm@43@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@6@01)) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@42@01 r)
      (Seq_contains
        (Seq_range 0 (Seq_length (Seq_take S@3@01 k@27@01)))
        (inv@41@01 r)))
    (=
      ($FVF.lookup_f (as sm@43@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@39@01)) r)))
  :pattern (($FVF.lookup_f (as sm@43@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@39@01)) r))
  :qid |qp.fvfValDef4|)))
(declare-const pm@44@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@44@01  $FPM) r)
    (+
      (ite
        (and
          (img@11@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@3@01)) (inv@10@01 r)))
        (- $Perm.Write (pTaken@36@01 r))
        $Perm.No)
      (ite
        (and
          (img@42@01 r)
          (Seq_contains
            (Seq_range 0 (Seq_length (Seq_take S@3@01 k@27@01)))
            (inv@41@01 r)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@44@01  $FPM) r))
  :qid |qp.resPrmSumDef5|)))
(push) ; 7
(assert (not (<
  $Perm.No
  ($FVF.perm_f (as pm@44@01  $FPM) (Seq_index
    (Seq_take S@3@01 k@27@01)
    index@38@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 18 | !(0 <= index@38@01 && index@38@01 < |S@3@01[:k@27@01]|)]
(assert (not
  (and (<= 0 index@38@01) (< index@38@01 (Seq_length (Seq_take S@3@01 k@27@01))))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@11@01 r)
        (Seq_contains (Seq_range 0 (Seq_length S@3@01)) (inv@10@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@36@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@43@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@6@01)) r)))
  :pattern (($FVF.lookup_f (as sm@43@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@6@01)) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@42@01 r)
      (Seq_contains
        (Seq_range 0 (Seq_length (Seq_take S@3@01 k@27@01)))
        (inv@41@01 r)))
    (=
      ($FVF.lookup_f (as sm@43@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@39@01)) r)))
  :pattern (($FVF.lookup_f (as sm@43@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@39@01)) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@44@01  $FPM) r)
    (+
      (ite
        (and
          (img@11@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@3@01)) (inv@10@01 r)))
        (- $Perm.Write (pTaken@36@01 r))
        $Perm.No)
      (ite
        (and
          (img@42@01 r)
          (Seq_contains
            (Seq_range 0 (Seq_length (Seq_take S@3@01 k@27@01)))
            (inv@41@01 r)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@44@01  $FPM) r))
  :qid |qp.resPrmSumDef5|)))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 index@38@01)
      (< index@38@01 (Seq_length (Seq_take S@3@01 k@27@01)))))
  (and (<= 0 index@38@01) (< index@38@01 (Seq_length (Seq_take S@3@01 k@27@01))))))
(assert (=>
  (and (<= 0 index@38@01) (< index@38@01 (Seq_length (Seq_take S@3@01 k@27@01))))
  (=
    ($FVF.lookup_f (as sm@43@01  $FVF<f>) (Seq_index
      (Seq_take S@3@01 k@27@01)
      index@38@01))
    x@4@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; f2 := find_var(S[k..], x)
; [eval] S[k..]
; [eval] (forall i: Int, j: Int :: { S[i], S[j] } 0 <= i && (i < j && j < |S|) ==> S[i] != S[j])
(declare-const i@45@01 Int)
(declare-const j@46@01 Int)
(set-option :timeout 0)
(push) ; 5
; [eval] 0 <= i && (i < j && j < |S|) ==> S[i] != S[j]
; [eval] 0 <= i && (i < j && j < |S|)
; [eval] 0 <= i
(push) ; 6
; [then-branch: 19 | !(0 <= i@45@01) | live]
; [else-branch: 19 | 0 <= i@45@01 | live]
(push) ; 7
; [then-branch: 19 | !(0 <= i@45@01)]
(assert (not (<= 0 i@45@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 19 | 0 <= i@45@01]
(assert (<= 0 i@45@01))
; [eval] i < j
(push) ; 8
; [then-branch: 20 | !(i@45@01 < j@46@01) | live]
; [else-branch: 20 | i@45@01 < j@46@01 | live]
(push) ; 9
; [then-branch: 20 | !(i@45@01 < j@46@01)]
(assert (not (< i@45@01 j@46@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 20 | i@45@01 < j@46@01]
(assert (< i@45@01 j@46@01))
; [eval] j < |S|
; [eval] |S|
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (or (< i@45@01 j@46@01) (not (< i@45@01 j@46@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i@45@01)
  (and (<= 0 i@45@01) (or (< i@45@01 j@46@01) (not (< i@45@01 j@46@01))))))
(assert (or (<= 0 i@45@01) (not (<= 0 i@45@01))))
(push) ; 6
; [then-branch: 21 | 0 <= i@45@01 && i@45@01 < j@46@01 && j@46@01 < |S@3@01[k@27@01:]| | live]
; [else-branch: 21 | !(0 <= i@45@01 && i@45@01 < j@46@01 && j@46@01 < |S@3@01[k@27@01:]|) | live]
(push) ; 7
; [then-branch: 21 | 0 <= i@45@01 && i@45@01 < j@46@01 && j@46@01 < |S@3@01[k@27@01:]|]
(assert (and
  (<= 0 i@45@01)
  (and (< i@45@01 j@46@01) (< j@46@01 (Seq_length (Seq_drop S@3@01 k@27@01))))))
; [eval] S[i] != S[j]
; [eval] S[i]
(push) ; 8
(assert (not (>= i@45@01 0)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(push) ; 8
(assert (not (< i@45@01 (Seq_length (Seq_drop S@3@01 k@27@01)))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [eval] S[j]
(push) ; 8
(assert (not (>= j@46@01 0)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
(push) ; 7
; [else-branch: 21 | !(0 <= i@45@01 && i@45@01 < j@46@01 && j@46@01 < |S@3@01[k@27@01:]|)]
(assert (not
  (and
    (<= 0 i@45@01)
    (and (< i@45@01 j@46@01) (< j@46@01 (Seq_length (Seq_drop S@3@01 k@27@01)))))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (=>
  (and
    (<= 0 i@45@01)
    (and (< i@45@01 j@46@01) (< j@46@01 (Seq_length (Seq_drop S@3@01 k@27@01)))))
  (and
    (<= 0 i@45@01)
    (< i@45@01 j@46@01)
    (< j@46@01 (Seq_length (Seq_drop S@3@01 k@27@01))))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i@45@01)
      (and
        (< i@45@01 j@46@01)
        (< j@46@01 (Seq_length (Seq_drop S@3@01 k@27@01))))))
  (and
    (<= 0 i@45@01)
    (and (< i@45@01 j@46@01) (< j@46@01 (Seq_length (Seq_drop S@3@01 k@27@01)))))))
(pop) ; 5
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@45@01 Int) (j@46@01 Int)) (!
  (and
    (=>
      (<= 0 i@45@01)
      (and (<= 0 i@45@01) (or (< i@45@01 j@46@01) (not (< i@45@01 j@46@01)))))
    (or (<= 0 i@45@01) (not (<= 0 i@45@01)))
    (=>
      (and
        (<= 0 i@45@01)
        (and
          (< i@45@01 j@46@01)
          (< j@46@01 (Seq_length (Seq_drop S@3@01 k@27@01)))))
      (and
        (<= 0 i@45@01)
        (< i@45@01 j@46@01)
        (< j@46@01 (Seq_length (Seq_drop S@3@01 k@27@01)))))
    (or
      (not
        (and
          (<= 0 i@45@01)
          (and
            (< i@45@01 j@46@01)
            (< j@46@01 (Seq_length (Seq_drop S@3@01 k@27@01))))))
      (and
        (<= 0 i@45@01)
        (and
          (< i@45@01 j@46@01)
          (< j@46@01 (Seq_length (Seq_drop S@3@01 k@27@01)))))))
  :pattern ((Seq_index (Seq_drop S@3@01 k@27@01) i@45@01) (Seq_index
    (Seq_drop S@3@01 k@27@01)
    j@46@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0060.vpr@7@12@7@80-aux|)))
(push) ; 5
(assert (not (forall ((i@45@01 Int) (j@46@01 Int)) (!
  (=>
    (and
      (<= 0 i@45@01)
      (and
        (< i@45@01 j@46@01)
        (< j@46@01 (Seq_length (Seq_drop S@3@01 k@27@01)))))
    (not
      (=
        (Seq_index (Seq_drop S@3@01 k@27@01) i@45@01)
        (Seq_index (Seq_drop S@3@01 k@27@01) j@46@01))))
  :pattern ((Seq_index (Seq_drop S@3@01 k@27@01) i@45@01) (Seq_index
    (Seq_drop S@3@01 k@27@01)
    j@46@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0060.vpr@7@12@7@80|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@45@01 Int) (j@46@01 Int)) (!
  (=>
    (and
      (<= 0 i@45@01)
      (and
        (< i@45@01 j@46@01)
        (< j@46@01 (Seq_length (Seq_drop S@3@01 k@27@01)))))
    (not
      (=
        (Seq_index (Seq_drop S@3@01 k@27@01) i@45@01)
        (Seq_index (Seq_drop S@3@01 k@27@01) j@46@01))))
  :pattern ((Seq_index (Seq_drop S@3@01 k@27@01) i@45@01) (Seq_index
    (Seq_drop S@3@01 k@27@01)
    j@46@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/issues/issue_0060.vpr@7@12@7@80|)))
(declare-const i@47@01 Int)
(push) ; 5
; [eval] (i in [0..|S|))
; [eval] [0..|S|)
; [eval] |S|
(assert (Seq_contains (Seq_range 0 (Seq_length (Seq_drop S@3@01 k@27@01))) i@47@01))
; [eval] S[i]
(push) ; 6
(assert (not (>= i@47@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@47@01 (Seq_length (Seq_drop S@3@01 k@27@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(declare-fun inv@48@01 ($Ref) Int)
(declare-fun img@49@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((i1@47@01 Int) (i2@47@01 Int)) (!
  (=>
    (and
      (Seq_contains
        (Seq_range 0 (Seq_length (Seq_drop S@3@01 k@27@01)))
        i1@47@01)
      (Seq_contains
        (Seq_range 0 (Seq_length (Seq_drop S@3@01 k@27@01)))
        i2@47@01)
      (=
        (Seq_index (Seq_drop S@3@01 k@27@01) i1@47@01)
        (Seq_index (Seq_drop S@3@01 k@27@01) i2@47@01)))
    (= i1@47@01 i2@47@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@47@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length (Seq_drop S@3@01 k@27@01))) i@47@01)
    (and
      (= (inv@48@01 (Seq_index (Seq_drop S@3@01 k@27@01) i@47@01)) i@47@01)
      (img@49@01 (Seq_index (Seq_drop S@3@01 k@27@01) i@47@01))))
  :pattern ((Seq_index (Seq_drop S@3@01 k@27@01) i@47@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@49@01 r)
      (Seq_contains
        (Seq_range 0 (Seq_length (Seq_drop S@3@01 k@27@01)))
        (inv@48@01 r)))
    (= (Seq_index (Seq_drop S@3@01 k@27@01) (inv@48@01 r)) r))
  :pattern ((inv@48@01 r))
  :qid |f-fctOfInv|)))
(push) ; 5
(set-option :timeout 10)
(assert (not (forall ((i@47@01 Int)) (!
  (= (Seq_index (Seq_drop S@3@01 k@27@01) i@47@01) (Seq_index S@3@01 i@47@01))
  
  :qid |quant-u-22|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (forall ((i@47@01 Int)) (!
  (=
    (Seq_index (Seq_drop S@3@01 k@27@01) i@47@01)
    (Seq_index (Seq_take S@3@01 k@27@01) i@47@01))
  
  :qid |quant-u-23|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@50@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains
        (Seq_range 0 (Seq_length (Seq_drop S@3@01 k@27@01)))
        (inv@48@01 r))
      (img@49@01 r)
      (= r (Seq_index (Seq_drop S@3@01 k@27@01) (inv@48@01 r))))
    ($Perm.min
      (ite
        (and
          (img@11@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@3@01)) (inv@10@01 r)))
        (- $Perm.Write (pTaken@36@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@51@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains
        (Seq_range 0 (Seq_length (Seq_drop S@3@01 k@27@01)))
        (inv@48@01 r))
      (img@49@01 r)
      (= r (Seq_index (Seq_drop S@3@01 k@27@01) (inv@48@01 r))))
    ($Perm.min
      (ite
        (and
          (img@42@01 r)
          (Seq_contains
            (Seq_range 0 (Seq_length (Seq_take S@3@01 k@27@01)))
            (inv@41@01 r)))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@50@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
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
          (img@11@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@3@01)) (inv@10@01 r)))
        (- $Perm.Write (pTaken@36@01 r))
        $Perm.No)
      (pTaken@50@01 r))
    $Perm.No)
  
  :qid |quant-u-25|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@50@01 r) $Perm.No)
  
  :qid |quant-u-26|))))
(check-sat)
; unknown
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
      (Seq_contains
        (Seq_range 0 (Seq_length (Seq_drop S@3@01 k@27@01)))
        (inv@48@01 r))
      (img@49@01 r)
      (= r (Seq_index (Seq_drop S@3@01 k@27@01) (inv@48@01 r))))
    (= (- $Perm.Write (pTaken@50@01 r)) $Perm.No))
  
  :qid |quant-u-27|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values
(declare-const index@52@01 Int)
(declare-const $t@53@01 $Snap)
(assert (= $t@53@01 ($Snap.combine ($Snap.first $t@53@01) ($Snap.second $t@53@01))))
(declare-const j@54@01 Int)
(set-option :timeout 0)
(push) ; 5
; [eval] (j in [0..|S|))
; [eval] [0..|S|)
; [eval] |S|
(assert (Seq_contains (Seq_range 0 (Seq_length (Seq_drop S@3@01 k@27@01))) j@54@01))
; [eval] S[j]
(push) ; 6
(assert (not (>= j@54@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< j@54@01 (Seq_length (Seq_drop S@3@01 k@27@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(declare-fun inv@55@01 ($Ref) Int)
(declare-fun img@56@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 5
(assert (not (forall ((j1@54@01 Int) (j2@54@01 Int)) (!
  (=>
    (and
      (Seq_contains
        (Seq_range 0 (Seq_length (Seq_drop S@3@01 k@27@01)))
        j1@54@01)
      (Seq_contains
        (Seq_range 0 (Seq_length (Seq_drop S@3@01 k@27@01)))
        j2@54@01)
      (=
        (Seq_index (Seq_drop S@3@01 k@27@01) j1@54@01)
        (Seq_index (Seq_drop S@3@01 k@27@01) j2@54@01)))
    (= j1@54@01 j2@54@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@54@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length (Seq_drop S@3@01 k@27@01))) j@54@01)
    (and
      (= (inv@55@01 (Seq_index (Seq_drop S@3@01 k@27@01) j@54@01)) j@54@01)
      (img@56@01 (Seq_index (Seq_drop S@3@01 k@27@01) j@54@01))))
  :pattern ((Seq_index (Seq_drop S@3@01 k@27@01) j@54@01))
  :qid |quant-u-29|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@56@01 r)
      (Seq_contains
        (Seq_range 0 (Seq_length (Seq_drop S@3@01 k@27@01)))
        (inv@55@01 r)))
    (= (Seq_index (Seq_drop S@3@01 k@27@01) (inv@55@01 r)) r))
  :pattern ((inv@55@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((j@54@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length (Seq_drop S@3@01 k@27@01))) j@54@01)
    (not (= (Seq_index (Seq_drop S@3@01 k@27@01) j@54@01) $Ref.null)))
  :pattern ((Seq_index (Seq_drop S@3@01 k@27@01) j@54@01))
  :qid |f-permImpliesNonNull|)))
(push) ; 5
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index (Seq_drop S@3@01 k@27@01) j@54@01) (Seq_index S@3@01 i@9@01))
    (=
      (and
        (img@56@01 r)
        (Seq_contains
          (Seq_range 0 (Seq_length (Seq_drop S@3@01 k@27@01)))
          (inv@55@01 r)))
      (and
        (img@11@01 r)
        (Seq_contains (Seq_range 0 (Seq_length S@3@01)) (inv@10@01 r)))))
  
  :qid |quant-u-30|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (=
      (Seq_index (Seq_drop S@3@01 k@27@01) j@54@01)
      (Seq_index (Seq_take S@3@01 k@27@01) j@40@01))
    (=
      (and
        (img@56@01 r)
        (Seq_contains
          (Seq_range 0 (Seq_length (Seq_drop S@3@01 k@27@01)))
          (inv@55@01 r)))
      (and
        (img@42@01 r)
        (Seq_contains
          (Seq_range 0 (Seq_length (Seq_take S@3@01 k@27@01)))
          (inv@41@01 r)))))
  
  :qid |quant-u-31|))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second $t@53@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@53@01))
    ($Snap.second ($Snap.second $t@53@01)))))
(assert (= ($Snap.first ($Snap.second $t@53@01)) $Snap.unit))
; [eval] 0 <= index
(assert (<= 0 index@52@01))
(assert (=
  ($Snap.second ($Snap.second $t@53@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@53@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@53@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@53@01))) $Snap.unit))
; [eval] index <= |S|
; [eval] |S|
(assert (<= index@52@01 (Seq_length (Seq_drop S@3@01 k@27@01))))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@53@01))) $Snap.unit))
; [eval] 0 <= index && index < |S| ==> S[index].f == x
; [eval] 0 <= index && index < |S|
; [eval] 0 <= index
(set-option :timeout 0)
(push) ; 5
; [then-branch: 22 | !(0 <= index@52@01) | live]
; [else-branch: 22 | 0 <= index@52@01 | live]
(push) ; 6
; [then-branch: 22 | !(0 <= index@52@01)]
(assert (not (<= 0 index@52@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 22 | 0 <= index@52@01]
; [eval] index < |S|
; [eval] |S|
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 index@52@01) (not (<= 0 index@52@01))))
(push) ; 5
(push) ; 6
(set-option :timeout 10)
(assert (not (not
  (and (<= 0 index@52@01) (< index@52@01 (Seq_length (Seq_drop S@3@01 k@27@01)))))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (and (<= 0 index@52@01) (< index@52@01 (Seq_length (Seq_drop S@3@01 k@27@01))))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 23 | 0 <= index@52@01 && index@52@01 < |S@3@01[k@27@01:]| | live]
; [else-branch: 23 | !(0 <= index@52@01 && index@52@01 < |S@3@01[k@27@01:]|) | live]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 23 | 0 <= index@52@01 && index@52@01 < |S@3@01[k@27@01:]|]
(assert (and (<= 0 index@52@01) (< index@52@01 (Seq_length (Seq_drop S@3@01 k@27@01)))))
; [eval] S[index].f == x
; [eval] S[index]
(push) ; 7
(assert (not (>= index@52@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(declare-const sm@57@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@42@01 r)
      (Seq_contains
        (Seq_range 0 (Seq_length (Seq_take S@3@01 k@27@01)))
        (inv@41@01 r)))
    (=
      ($FVF.lookup_f (as sm@57@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@39@01)) r)))
  :pattern (($FVF.lookup_f (as sm@57@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@39@01)) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@11@01 r)
        (Seq_contains (Seq_range 0 (Seq_length S@3@01)) (inv@10@01 r)))
      (< $Perm.No (- (- $Perm.Write (pTaken@36@01 r)) (pTaken@50@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@57@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@6@01)) r)))
  :pattern (($FVF.lookup_f (as sm@57@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@6@01)) r))
  :qid |qp.fvfValDef7|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@56@01 r)
      (Seq_contains
        (Seq_range 0 (Seq_length (Seq_drop S@3@01 k@27@01)))
        (inv@55@01 r)))
    (=
      ($FVF.lookup_f (as sm@57@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@53@01)) r)))
  :pattern (($FVF.lookup_f (as sm@57@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@53@01)) r))
  :qid |qp.fvfValDef8|)))
(declare-const pm@58@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@58@01  $FPM) r)
    (+
      (+
        (ite
          (and
            (img@42@01 r)
            (Seq_contains
              (Seq_range 0 (Seq_length (Seq_take S@3@01 k@27@01)))
              (inv@41@01 r)))
          $Perm.Write
          $Perm.No)
        (ite
          (and
            (img@11@01 r)
            (Seq_contains (Seq_range 0 (Seq_length S@3@01)) (inv@10@01 r)))
          (- (- $Perm.Write (pTaken@36@01 r)) (pTaken@50@01 r))
          $Perm.No))
      (ite
        (and
          (img@56@01 r)
          (Seq_contains
            (Seq_range 0 (Seq_length (Seq_drop S@3@01 k@27@01)))
            (inv@55@01 r)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@58@01  $FPM) r))
  :qid |qp.resPrmSumDef9|)))
(push) ; 7
(assert (not (<
  $Perm.No
  ($FVF.perm_f (as pm@58@01  $FPM) (Seq_index
    (Seq_drop S@3@01 k@27@01)
    index@52@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 23 | !(0 <= index@52@01 && index@52@01 < |S@3@01[k@27@01:]|)]
(assert (not
  (and (<= 0 index@52@01) (< index@52@01 (Seq_length (Seq_drop S@3@01 k@27@01))))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@42@01 r)
      (Seq_contains
        (Seq_range 0 (Seq_length (Seq_take S@3@01 k@27@01)))
        (inv@41@01 r)))
    (=
      ($FVF.lookup_f (as sm@57@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@39@01)) r)))
  :pattern (($FVF.lookup_f (as sm@57@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@39@01)) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@11@01 r)
        (Seq_contains (Seq_range 0 (Seq_length S@3@01)) (inv@10@01 r)))
      (< $Perm.No (- (- $Perm.Write (pTaken@36@01 r)) (pTaken@50@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@57@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@6@01)) r)))
  :pattern (($FVF.lookup_f (as sm@57@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@6@01)) r))
  :qid |qp.fvfValDef7|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@56@01 r)
      (Seq_contains
        (Seq_range 0 (Seq_length (Seq_drop S@3@01 k@27@01)))
        (inv@55@01 r)))
    (=
      ($FVF.lookup_f (as sm@57@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@53@01)) r)))
  :pattern (($FVF.lookup_f (as sm@57@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@53@01)) r))
  :qid |qp.fvfValDef8|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@58@01  $FPM) r)
    (+
      (+
        (ite
          (and
            (img@42@01 r)
            (Seq_contains
              (Seq_range 0 (Seq_length (Seq_take S@3@01 k@27@01)))
              (inv@41@01 r)))
          $Perm.Write
          $Perm.No)
        (ite
          (and
            (img@11@01 r)
            (Seq_contains (Seq_range 0 (Seq_length S@3@01)) (inv@10@01 r)))
          (- (- $Perm.Write (pTaken@36@01 r)) (pTaken@50@01 r))
          $Perm.No))
      (ite
        (and
          (img@56@01 r)
          (Seq_contains
            (Seq_range 0 (Seq_length (Seq_drop S@3@01 k@27@01)))
            (inv@55@01 r)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@58@01  $FPM) r))
  :qid |qp.resPrmSumDef9|)))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 index@52@01)
      (< index@52@01 (Seq_length (Seq_drop S@3@01 k@27@01)))))
  (and (<= 0 index@52@01) (< index@52@01 (Seq_length (Seq_drop S@3@01 k@27@01))))))
(assert (=>
  (and (<= 0 index@52@01) (< index@52@01 (Seq_length (Seq_drop S@3@01 k@27@01))))
  (=
    ($FVF.lookup_f (as sm@57@01  $FVF<f>) (Seq_index
      (Seq_drop S@3@01 k@27@01)
      index@52@01))
    x@4@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] f1 != k
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= index@38@01 k@27@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= index@38@01 k@27@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 24 | index@38@01 != k@27@01 | live]
; [else-branch: 24 | index@38@01 == k@27@01 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 24 | index@38@01 != k@27@01]
(assert (not (= index@38@01 k@27@01)))
; [exec]
; index := f1
(declare-const j@59@01 Int)
(push) ; 6
; [eval] (j in [0..|S|))
; [eval] [0..|S|)
; [eval] |S|
(assert (Seq_contains (Seq_range 0 (Seq_length S@3@01)) j@59@01))
; [eval] S[j]
(push) ; 7
(assert (not (>= j@59@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< j@59@01 (Seq_length S@3@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(declare-fun inv@60@01 ($Ref) Int)
(declare-fun img@61@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 6
(assert (not (forall ((j1@59@01 Int) (j2@59@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length S@3@01)) j1@59@01)
      (Seq_contains (Seq_range 0 (Seq_length S@3@01)) j2@59@01)
      (= (Seq_index S@3@01 j1@59@01) (Seq_index S@3@01 j2@59@01)))
    (= j1@59@01 j2@59@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@59@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length S@3@01)) j@59@01)
    (and
      (= (inv@60@01 (Seq_index S@3@01 j@59@01)) j@59@01)
      (img@61@01 (Seq_index S@3@01 j@59@01))))
  :pattern ((Seq_index S@3@01 j@59@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@61@01 r)
      (Seq_contains (Seq_range 0 (Seq_length S@3@01)) (inv@60@01 r)))
    (= (Seq_index S@3@01 (inv@60@01 r)) r))
  :pattern ((inv@60@01 r))
  :qid |f-fctOfInv|)))
(push) ; 6
(set-option :timeout 10)
(assert (not (forall ((j@59@01 Int)) (!
  (= (Seq_index S@3@01 j@59@01) (Seq_index (Seq_take S@3@01 k@27@01) j@59@01))
  
  :qid |quant-u-33|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (forall ((j@59@01 Int)) (!
  (= (Seq_index S@3@01 j@59@01) (Seq_index (Seq_drop S@3@01 k@27@01) j@59@01))
  
  :qid |quant-u-34|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@62@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length S@3@01)) (inv@60@01 r))
      (img@61@01 r)
      (= r (Seq_index S@3@01 (inv@60@01 r))))
    ($Perm.min
      (ite
        (and
          (img@11@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@3@01)) (inv@10@01 r)))
        (- (- $Perm.Write (pTaken@36@01 r)) (pTaken@50@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@63@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length S@3@01)) (inv@60@01 r))
      (img@61@01 r)
      (= r (Seq_index S@3@01 (inv@60@01 r))))
    ($Perm.min
      (ite
        (and
          (img@42@01 r)
          (Seq_contains
            (Seq_range 0 (Seq_length (Seq_take S@3@01 k@27@01)))
            (inv@41@01 r)))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@62@01 r)))
    $Perm.No))
(define-fun pTaken@64@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length S@3@01)) (inv@60@01 r))
      (img@61@01 r)
      (= r (Seq_index S@3@01 (inv@60@01 r))))
    ($Perm.min
      (ite
        (and
          (img@56@01 r)
          (Seq_contains
            (Seq_range 0 (Seq_length (Seq_drop S@3@01 k@27@01)))
            (inv@55@01 r)))
        $Perm.Write
        $Perm.No)
      (- (- $Perm.Write (pTaken@62@01 r)) (pTaken@63@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
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
          (img@11@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@3@01)) (inv@10@01 r)))
        (- (- $Perm.Write (pTaken@36@01 r)) (pTaken@50@01 r))
        $Perm.No)
      (pTaken@62@01 r))
    $Perm.No)
  
  :qid |quant-u-36|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length S@3@01)) (inv@60@01 r))
      (img@61@01 r)
      (= r (Seq_index S@3@01 (inv@60@01 r))))
    (= (- $Perm.Write (pTaken@62@01 r)) $Perm.No))
  
  :qid |quant-u-37|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@42@01 r)
          (Seq_contains
            (Seq_range 0 (Seq_length (Seq_take S@3@01 k@27@01)))
            (inv@41@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@63@01 r))
    $Perm.No)
  
  :qid |quant-u-38|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length S@3@01)) (inv@60@01 r))
      (img@61@01 r)
      (= r (Seq_index S@3@01 (inv@60@01 r))))
    (= (- (- $Perm.Write (pTaken@62@01 r)) (pTaken@63@01 r)) $Perm.No))
  
  :qid |quant-u-39|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@56@01 r)
          (Seq_contains
            (Seq_range 0 (Seq_length (Seq_drop S@3@01 k@27@01)))
            (inv@55@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@64@01 r))
    $Perm.No)
  
  :qid |quant-u-40|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length S@3@01)) (inv@60@01 r))
      (img@61@01 r)
      (= r (Seq_index S@3@01 (inv@60@01 r))))
    (=
      (- (- (- $Perm.Write (pTaken@62@01 r)) (pTaken@63@01 r)) (pTaken@64@01 r))
      $Perm.No))
  
  :qid |quant-u-41|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values
; [eval] 0 <= index
(set-option :timeout 0)
(push) ; 6
(assert (not (<= 0 index@38@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 index@38@01))
; [eval] index <= |S|
; [eval] |S|
(push) ; 6
(assert (not (<= index@38@01 (Seq_length S@3@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (<= index@38@01 (Seq_length S@3@01)))
; [eval] 0 <= index && index < |S| ==> S[index].f == x
; [eval] 0 <= index && index < |S|
; [eval] 0 <= index
(push) ; 6
; [then-branch: 25 | !(0 <= index@38@01) | live]
; [else-branch: 25 | 0 <= index@38@01 | live]
(push) ; 7
; [then-branch: 25 | !(0 <= index@38@01)]
(assert (not (<= 0 index@38@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 25 | 0 <= index@38@01]
; [eval] index < |S|
; [eval] |S|
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (not (and (<= 0 index@38@01) (< index@38@01 (Seq_length S@3@01))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and (<= 0 index@38@01) (< index@38@01 (Seq_length S@3@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 26 | 0 <= index@38@01 && index@38@01 < |S@3@01| | live]
; [else-branch: 26 | !(0 <= index@38@01 && index@38@01 < |S@3@01|) | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 26 | 0 <= index@38@01 && index@38@01 < |S@3@01|]
(assert (and (<= 0 index@38@01) (< index@38@01 (Seq_length S@3@01))))
; [eval] S[index].f == x
; [eval] S[index]
(push) ; 8
(assert (not (>= index@38@01 0)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@42@01 r)
        (Seq_contains
          (Seq_range 0 (Seq_length (Seq_take S@3@01 k@27@01)))
          (inv@41@01 r)))
      (=
        ($FVF.lookup_f (as sm@57@01  $FVF<f>) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@39@01)) r)))
    :pattern (($FVF.lookup_f (as sm@57@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@39@01)) r))
    :qid |qp.fvfValDef6|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and
          (img@11@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@3@01)) (inv@10@01 r)))
        (< $Perm.No (- (- $Perm.Write (pTaken@36@01 r)) (pTaken@50@01 r)))
        false)
      (=
        ($FVF.lookup_f (as sm@57@01  $FVF<f>) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@6@01)) r)))
    :pattern (($FVF.lookup_f (as sm@57@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@6@01)) r))
    :qid |qp.fvfValDef7|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@56@01 r)
        (Seq_contains
          (Seq_range 0 (Seq_length (Seq_drop S@3@01 k@27@01)))
          (inv@55@01 r)))
      (=
        ($FVF.lookup_f (as sm@57@01  $FVF<f>) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@53@01)) r)))
    :pattern (($FVF.lookup_f (as sm@57@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@53@01)) r))
    :qid |qp.fvfValDef8|))))
(push) ; 8
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and
          (img@42@01 (Seq_index S@3@01 index@38@01))
          (Seq_contains
            (Seq_range 0 (Seq_length (Seq_take S@3@01 k@27@01)))
            (inv@41@01 (Seq_index S@3@01 index@38@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@11@01 (Seq_index S@3@01 index@38@01))
          (Seq_contains
            (Seq_range 0 (Seq_length S@3@01))
            (inv@10@01 (Seq_index S@3@01 index@38@01))))
        (-
          (- $Perm.Write (pTaken@36@01 (Seq_index S@3@01 index@38@01)))
          (pTaken@50@01 (Seq_index S@3@01 index@38@01)))
        $Perm.No))
    (ite
      (and
        (img@56@01 (Seq_index S@3@01 index@38@01))
        (Seq_contains
          (Seq_range 0 (Seq_length (Seq_drop S@3@01 k@27@01)))
          (inv@55@01 (Seq_index S@3@01 index@38@01))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@42@01 r)
      (Seq_contains
        (Seq_range 0 (Seq_length (Seq_take S@3@01 k@27@01)))
        (inv@41@01 r)))
    (=
      ($FVF.lookup_f (as sm@57@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@39@01)) r)))
  :pattern (($FVF.lookup_f (as sm@57@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@39@01)) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@11@01 r)
        (Seq_contains (Seq_range 0 (Seq_length S@3@01)) (inv@10@01 r)))
      (< $Perm.No (- (- $Perm.Write (pTaken@36@01 r)) (pTaken@50@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@57@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@6@01)) r)))
  :pattern (($FVF.lookup_f (as sm@57@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@6@01)) r))
  :qid |qp.fvfValDef7|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@56@01 r)
      (Seq_contains
        (Seq_range 0 (Seq_length (Seq_drop S@3@01 k@27@01)))
        (inv@55@01 r)))
    (=
      ($FVF.lookup_f (as sm@57@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@53@01)) r)))
  :pattern (($FVF.lookup_f (as sm@57@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@53@01)) r))
  :qid |qp.fvfValDef8|)))
(assert (and (<= 0 index@38@01) (< index@38@01 (Seq_length S@3@01))))
(push) ; 6
(assert (not (=>
  (and (<= 0 index@38@01) (< index@38@01 (Seq_length S@3@01)))
  (=
    ($FVF.lookup_f (as sm@57@01  $FVF<f>) (Seq_index S@3@01 index@38@01))
    x@4@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (=>
  (and (<= 0 index@38@01) (< index@38@01 (Seq_length S@3@01)))
  (=
    ($FVF.lookup_f (as sm@57@01  $FVF<f>) (Seq_index S@3@01 index@38@01))
    x@4@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 24 | index@38@01 == k@27@01]
(assert (= index@38@01 k@27@01))
(pop) ; 5
; [eval] !(f1 != k)
; [eval] f1 != k
(push) ; 5
(set-option :timeout 10)
(assert (not (not (= index@38@01 k@27@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= index@38@01 k@27@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 27 | index@38@01 == k@27@01 | live]
; [else-branch: 27 | index@38@01 != k@27@01 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 27 | index@38@01 == k@27@01]
(assert (= index@38@01 k@27@01))
; [exec]
; index := k + f2
; [eval] k + f2
(declare-const index@65@01 Int)
(assert (= index@65@01 (+ k@27@01 index@52@01)))
(declare-const j@66@01 Int)
(push) ; 6
; [eval] (j in [0..|S|))
; [eval] [0..|S|)
; [eval] |S|
(assert (Seq_contains (Seq_range 0 (Seq_length S@3@01)) j@66@01))
; [eval] S[j]
(push) ; 7
(assert (not (>= j@66@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< j@66@01 (Seq_length S@3@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(declare-fun inv@67@01 ($Ref) Int)
(declare-fun img@68@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 6
(assert (not (forall ((j1@66@01 Int) (j2@66@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length S@3@01)) j1@66@01)
      (Seq_contains (Seq_range 0 (Seq_length S@3@01)) j2@66@01)
      (= (Seq_index S@3@01 j1@66@01) (Seq_index S@3@01 j2@66@01)))
    (= j1@66@01 j2@66@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((j@66@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length S@3@01)) j@66@01)
    (and
      (= (inv@67@01 (Seq_index S@3@01 j@66@01)) j@66@01)
      (img@68@01 (Seq_index S@3@01 j@66@01))))
  :pattern ((Seq_index S@3@01 j@66@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@68@01 r)
      (Seq_contains (Seq_range 0 (Seq_length S@3@01)) (inv@67@01 r)))
    (= (Seq_index S@3@01 (inv@67@01 r)) r))
  :pattern ((inv@67@01 r))
  :qid |f-fctOfInv|)))
(push) ; 6
(set-option :timeout 10)
(assert (not (forall ((j@66@01 Int)) (!
  (= (Seq_index S@3@01 j@66@01) (Seq_index (Seq_take S@3@01 k@27@01) j@66@01))
  
  :qid |quant-u-43|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (forall ((j@66@01 Int)) (!
  (= (Seq_index S@3@01 j@66@01) (Seq_index (Seq_drop S@3@01 k@27@01) j@66@01))
  
  :qid |quant-u-44|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@69@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length S@3@01)) (inv@67@01 r))
      (img@68@01 r)
      (= r (Seq_index S@3@01 (inv@67@01 r))))
    ($Perm.min
      (ite
        (and
          (img@11@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@3@01)) (inv@10@01 r)))
        (- (- $Perm.Write (pTaken@36@01 r)) (pTaken@50@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@70@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length S@3@01)) (inv@67@01 r))
      (img@68@01 r)
      (= r (Seq_index S@3@01 (inv@67@01 r))))
    ($Perm.min
      (ite
        (and
          (img@42@01 r)
          (Seq_contains
            (Seq_range 0 (Seq_length (Seq_take S@3@01 k@27@01)))
            (inv@41@01 r)))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@69@01 r)))
    $Perm.No))
(define-fun pTaken@71@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length S@3@01)) (inv@67@01 r))
      (img@68@01 r)
      (= r (Seq_index S@3@01 (inv@67@01 r))))
    ($Perm.min
      (ite
        (and
          (img@56@01 r)
          (Seq_contains
            (Seq_range 0 (Seq_length (Seq_drop S@3@01 k@27@01)))
            (inv@55@01 r)))
        $Perm.Write
        $Perm.No)
      (- (- $Perm.Write (pTaken@69@01 r)) (pTaken@70@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
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
          (img@11@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@3@01)) (inv@10@01 r)))
        (- (- $Perm.Write (pTaken@36@01 r)) (pTaken@50@01 r))
        $Perm.No)
      (pTaken@69@01 r))
    $Perm.No)
  
  :qid |quant-u-46|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length S@3@01)) (inv@67@01 r))
      (img@68@01 r)
      (= r (Seq_index S@3@01 (inv@67@01 r))))
    (= (- $Perm.Write (pTaken@69@01 r)) $Perm.No))
  
  :qid |quant-u-47|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@42@01 r)
          (Seq_contains
            (Seq_range 0 (Seq_length (Seq_take S@3@01 k@27@01)))
            (inv@41@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@70@01 r))
    $Perm.No)
  
  :qid |quant-u-48|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length S@3@01)) (inv@67@01 r))
      (img@68@01 r)
      (= r (Seq_index S@3@01 (inv@67@01 r))))
    (= (- (- $Perm.Write (pTaken@69@01 r)) (pTaken@70@01 r)) $Perm.No))
  
  :qid |quant-u-49|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@56@01 r)
          (Seq_contains
            (Seq_range 0 (Seq_length (Seq_drop S@3@01 k@27@01)))
            (inv@55@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@71@01 r))
    $Perm.No)
  
  :qid |quant-u-50|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length S@3@01)) (inv@67@01 r))
      (img@68@01 r)
      (= r (Seq_index S@3@01 (inv@67@01 r))))
    (=
      (- (- (- $Perm.Write (pTaken@69@01 r)) (pTaken@70@01 r)) (pTaken@71@01 r))
      $Perm.No))
  
  :qid |quant-u-51|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@42@01 r)
      (Seq_contains
        (Seq_range 0 (Seq_length (Seq_take S@3@01 k@27@01)))
        (inv@41@01 r)))
    (=
      ($FVF.lookup_f (as sm@57@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@39@01)) r)))
  :pattern (($FVF.lookup_f (as sm@57@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@39@01)) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@11@01 r)
        (Seq_contains (Seq_range 0 (Seq_length S@3@01)) (inv@10@01 r)))
      (< $Perm.No (- (- $Perm.Write (pTaken@36@01 r)) (pTaken@50@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@57@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@6@01)) r)))
  :pattern (($FVF.lookup_f (as sm@57@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@6@01)) r))
  :qid |qp.fvfValDef7|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@56@01 r)
      (Seq_contains
        (Seq_range 0 (Seq_length (Seq_drop S@3@01 k@27@01)))
        (inv@55@01 r)))
    (=
      ($FVF.lookup_f (as sm@57@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@53@01)) r)))
  :pattern (($FVF.lookup_f (as sm@57@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@53@01)) r))
  :qid |qp.fvfValDef8|)))
; [eval] 0 <= index
(set-option :timeout 0)
(push) ; 6
(assert (not (<= 0 index@65@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 index@65@01))
; [eval] index <= |S|
; [eval] |S|
(push) ; 6
(assert (not (<= index@65@01 (Seq_length S@3@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (<= index@65@01 (Seq_length S@3@01)))
; [eval] 0 <= index && index < |S| ==> S[index].f == x
; [eval] 0 <= index && index < |S|
; [eval] 0 <= index
(push) ; 6
; [then-branch: 28 | !(0 <= index@65@01) | live]
; [else-branch: 28 | 0 <= index@65@01 | live]
(push) ; 7
; [then-branch: 28 | !(0 <= index@65@01)]
(assert (not (<= 0 index@65@01)))
(pop) ; 7
(push) ; 7
; [else-branch: 28 | 0 <= index@65@01]
; [eval] index < |S|
; [eval] |S|
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 index@65@01) (not (<= 0 index@65@01))))
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (not (and (<= 0 index@65@01) (< index@65@01 (Seq_length S@3@01))))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (and (<= 0 index@65@01) (< index@65@01 (Seq_length S@3@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 29 | 0 <= index@65@01 && index@65@01 < |S@3@01| | live]
; [else-branch: 29 | !(0 <= index@65@01 && index@65@01 < |S@3@01|) | live]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 29 | 0 <= index@65@01 && index@65@01 < |S@3@01|]
(assert (and (<= 0 index@65@01) (< index@65@01 (Seq_length S@3@01))))
; [eval] S[index].f == x
; [eval] S[index]
(push) ; 8
(assert (not (>= index@65@01 0)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@42@01 r)
        (Seq_contains
          (Seq_range 0 (Seq_length (Seq_take S@3@01 k@27@01)))
          (inv@41@01 r)))
      (=
        ($FVF.lookup_f (as sm@57@01  $FVF<f>) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@39@01)) r)))
    :pattern (($FVF.lookup_f (as sm@57@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@39@01)) r))
    :qid |qp.fvfValDef6|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and
          (img@11@01 r)
          (Seq_contains (Seq_range 0 (Seq_length S@3@01)) (inv@10@01 r)))
        (< $Perm.No (- (- $Perm.Write (pTaken@36@01 r)) (pTaken@50@01 r)))
        false)
      (=
        ($FVF.lookup_f (as sm@57@01  $FVF<f>) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@6@01)) r)))
    :pattern (($FVF.lookup_f (as sm@57@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@6@01)) r))
    :qid |qp.fvfValDef7|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@56@01 r)
        (Seq_contains
          (Seq_range 0 (Seq_length (Seq_drop S@3@01 k@27@01)))
          (inv@55@01 r)))
      (=
        ($FVF.lookup_f (as sm@57@01  $FVF<f>) r)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@53@01)) r)))
    :pattern (($FVF.lookup_f (as sm@57@01  $FVF<f>) r))
    :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@53@01)) r))
    :qid |qp.fvfValDef8|))))
(push) ; 8
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and
          (img@42@01 (Seq_index S@3@01 index@65@01))
          (Seq_contains
            (Seq_range 0 (Seq_length (Seq_take S@3@01 k@27@01)))
            (inv@41@01 (Seq_index S@3@01 index@65@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@11@01 (Seq_index S@3@01 index@65@01))
          (Seq_contains
            (Seq_range 0 (Seq_length S@3@01))
            (inv@10@01 (Seq_index S@3@01 index@65@01))))
        (-
          (- $Perm.Write (pTaken@36@01 (Seq_index S@3@01 index@65@01)))
          (pTaken@50@01 (Seq_index S@3@01 index@65@01)))
        $Perm.No))
    (ite
      (and
        (img@56@01 (Seq_index S@3@01 index@65@01))
        (Seq_contains
          (Seq_range 0 (Seq_length (Seq_drop S@3@01 k@27@01)))
          (inv@55@01 (Seq_index S@3@01 index@65@01))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(pop) ; 7
(push) ; 7
; [else-branch: 29 | !(0 <= index@65@01 && index@65@01 < |S@3@01|)]
(assert (not (and (<= 0 index@65@01) (< index@65@01 (Seq_length S@3@01)))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@42@01 r)
      (Seq_contains
        (Seq_range 0 (Seq_length (Seq_take S@3@01 k@27@01)))
        (inv@41@01 r)))
    (=
      ($FVF.lookup_f (as sm@57@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@39@01)) r)))
  :pattern (($FVF.lookup_f (as sm@57@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@39@01)) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@11@01 r)
        (Seq_contains (Seq_range 0 (Seq_length S@3@01)) (inv@10@01 r)))
      (< $Perm.No (- (- $Perm.Write (pTaken@36@01 r)) (pTaken@50@01 r)))
      false)
    (=
      ($FVF.lookup_f (as sm@57@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@6@01)) r)))
  :pattern (($FVF.lookup_f (as sm@57@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.second $t@6@01)) r))
  :qid |qp.fvfValDef7|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@56@01 r)
      (Seq_contains
        (Seq_range 0 (Seq_length (Seq_drop S@3@01 k@27@01)))
        (inv@55@01 r)))
    (=
      ($FVF.lookup_f (as sm@57@01  $FVF<f>) r)
      ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@53@01)) r)))
  :pattern (($FVF.lookup_f (as sm@57@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first $t@53@01)) r))
  :qid |qp.fvfValDef8|)))
; Joined path conditions
(assert (or
  (not (and (<= 0 index@65@01) (< index@65@01 (Seq_length S@3@01))))
  (and (<= 0 index@65@01) (< index@65@01 (Seq_length S@3@01)))))
(push) ; 6
(assert (not (=>
  (and (<= 0 index@65@01) (< index@65@01 (Seq_length S@3@01)))
  (=
    ($FVF.lookup_f (as sm@57@01  $FVF<f>) (Seq_index S@3@01 index@65@01))
    x@4@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (=>
  (and (<= 0 index@65@01) (< index@65@01 (Seq_length S@3@01)))
  (=
    ($FVF.lookup_f (as sm@57@01  $FVF<f>) (Seq_index S@3@01 index@65@01))
    x@4@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 27 | index@38@01 != k@27@01]
(assert (not (= index@38@01 k@27@01)))
(pop) ; 5
(pop) ; 4
(push) ; 4
; [else-branch: 13 | |S@3@01| == 1]
(assert (= (Seq_length S@3@01) 1))
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 8 | |S@3@01| == 0]
(assert (= (Seq_length S@3@01) 0))
(pop) ; 3
(pop) ; 2
(pop) ; 1
