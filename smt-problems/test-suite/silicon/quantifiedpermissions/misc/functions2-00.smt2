(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:18:43
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/quantifiedpermissions/misc/functions2.vpr
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
(declare-sort Set<$Ref> 0)
(declare-sort Set<Int> 0)
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
; Declaring additional sort wrappers
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
; /field_value_functions_declarations.smt2 [f: Int]
(declare-fun $FVF.domain_f ($FVF<f>) Set<$Ref>)
(declare-fun $FVF.lookup_f ($FVF<f> $Ref) Int)
(declare-fun $FVF.after_f ($FVF<f> $FVF<f>) Bool)
(declare-fun $FVF.loc_f (Int $Ref) Bool)
(declare-fun $FVF.perm_f ($FPM $Ref) $Perm)
(declare-const $fvfTOP_f $FVF<f>)
; Declaring symbols related to program functions (from program analysis)
(declare-fun fun01 ($Snap Set<$Ref> $Ref) Int)
(declare-fun fun01%limited ($Snap Set<$Ref> $Ref) Int)
(declare-fun fun01%stateless (Set<$Ref> $Ref) Bool)
(declare-fun fun01%precondition ($Snap Set<$Ref> $Ref) Bool)
(declare-fun fun02 ($Snap Seq<$Ref> Seq<$Ref>) Bool)
(declare-fun fun02%limited ($Snap Seq<$Ref> Seq<$Ref>) Bool)
(declare-fun fun02%stateless (Seq<$Ref> Seq<$Ref>) Bool)
(declare-fun fun02%precondition ($Snap Seq<$Ref> Seq<$Ref>) Bool)
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
(declare-fun inv@7@00 ($Snap Set<$Ref> $Ref $Ref) $Ref)
(declare-fun img@8@00 ($Snap Set<$Ref> $Ref $Ref) Bool)
(declare-fun inv@13@00 ($Snap Seq<$Ref> Seq<$Ref> $Ref) Int)
(declare-fun img@14@00 ($Snap Seq<$Ref> Seq<$Ref> $Ref) Bool)
(declare-fun inv@18@00 ($Snap Seq<$Ref> Seq<$Ref> $Ref) Int)
(declare-fun img@19@00 ($Snap Seq<$Ref> Seq<$Ref> $Ref) Bool)
(declare-fun sm@20@00 ($Snap Seq<$Ref> Seq<$Ref>) $FVF<f>)
(assert (forall ((s@$ $Snap) (xs@0@00 Set<$Ref>) (y@1@00 $Ref)) (!
  (= (fun01%limited s@$ xs@0@00 y@1@00) (fun01 s@$ xs@0@00 y@1@00))
  :pattern ((fun01 s@$ xs@0@00 y@1@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (xs@0@00 Set<$Ref>) (y@1@00 $Ref)) (!
  (fun01%stateless xs@0@00 y@1@00)
  :pattern ((fun01%limited s@$ xs@0@00 y@1@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (xs@0@00 Set<$Ref>) (y@1@00 $Ref)) (!
  (and
    (forall ((x@6@00 $Ref)) (!
      (=>
        (Set_in x@6@00 xs@0@00)
        (and
          (= (inv@7@00 s@$ xs@0@00 y@1@00 x@6@00) x@6@00)
          (img@8@00 s@$ xs@0@00 y@1@00 x@6@00)))
      :pattern ((Set_in x@6@00 xs@0@00))
      :pattern ((inv@7@00 s@$ xs@0@00 y@1@00 x@6@00))
      :pattern ((img@8@00 s@$ xs@0@00 y@1@00 x@6@00))
      :qid |quant-u-5|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@8@00 s@$ xs@0@00 y@1@00 r)
          (Set_in (inv@7@00 s@$ xs@0@00 y@1@00 r) xs@0@00))
        (= (inv@7@00 s@$ xs@0@00 y@1@00 r) r))
      :pattern ((inv@7@00 s@$ xs@0@00 y@1@00 r))
      :qid |f-fctOfInv|))
    (=>
      (fun01%precondition s@$ xs@0@00 y@1@00)
      (=
        (fun01 s@$ xs@0@00 y@1@00)
        ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first s@$)) y@1@00))))
  :pattern ((fun01 s@$ xs@0@00 y@1@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (xs@0@00 Set<$Ref>) (y@1@00 $Ref)) (!
  true
  :pattern ((fun01 s@$ xs@0@00 y@1@00))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap) (xs@3@00 Seq<$Ref>) (ys@4@00 Seq<$Ref>)) (!
  (= (fun02%limited s@$ xs@3@00 ys@4@00) (fun02 s@$ xs@3@00 ys@4@00))
  :pattern ((fun02 s@$ xs@3@00 ys@4@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (xs@3@00 Seq<$Ref>) (ys@4@00 Seq<$Ref>)) (!
  (fun02%stateless xs@3@00 ys@4@00)
  :pattern ((fun02%limited s@$ xs@3@00 ys@4@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (xs@3@00 Seq<$Ref>) (ys@4@00 Seq<$Ref>)) (!
  (and
    (forall ((i@12@00 Int)) (!
      (=>
        (and (<= 0 i@12@00) (< i@12@00 (Seq_length xs@3@00)))
        (and
          (= (inv@13@00 s@$ xs@3@00 ys@4@00 (Seq_index xs@3@00 i@12@00)) i@12@00)
          (img@14@00 s@$ xs@3@00 ys@4@00 (Seq_index xs@3@00 i@12@00))))
      :pattern ((Seq_index xs@3@00 i@12@00))
      :qid |quant-u-9|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@14@00 s@$ xs@3@00 ys@4@00 r)
          (and
            (<= 0 (inv@13@00 s@$ xs@3@00 ys@4@00 r))
            (< (inv@13@00 s@$ xs@3@00 ys@4@00 r) (Seq_length xs@3@00))))
        (= (Seq_index xs@3@00 (inv@13@00 s@$ xs@3@00 ys@4@00 r)) r))
      :pattern ((inv@13@00 s@$ xs@3@00 ys@4@00 r))
      :qid |f-fctOfInv|))
    (forall ((i@17@00 Int)) (!
      (=>
        (and (<= 0 i@17@00) (< i@17@00 (Seq_length ys@4@00)))
        (and
          (= (inv@18@00 s@$ xs@3@00 ys@4@00 (Seq_index ys@4@00 i@17@00)) i@17@00)
          (img@19@00 s@$ xs@3@00 ys@4@00 (Seq_index ys@4@00 i@17@00))))
      :pattern ((Seq_index ys@4@00 i@17@00))
      :qid |quant-u-11|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@19@00 s@$ xs@3@00 ys@4@00 r)
          (and
            (<= 0 (inv@18@00 s@$ xs@3@00 ys@4@00 r))
            (< (inv@18@00 s@$ xs@3@00 ys@4@00 r) (Seq_length ys@4@00))))
        (= (Seq_index ys@4@00 (inv@18@00 s@$ xs@3@00 ys@4@00 r)) r))
      :pattern ((inv@18@00 s@$ xs@3@00 ys@4@00 r))
      :qid |f-fctOfInv|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@14@00 s@$ xs@3@00 ys@4@00 r)
          (and
            (<= 0 (inv@13@00 s@$ xs@3@00 ys@4@00 r))
            (< (inv@13@00 s@$ xs@3@00 ys@4@00 r) (Seq_length xs@3@00))))
        (=
          ($FVF.lookup_f (sm@20@00 s@$ xs@3@00 ys@4@00) r)
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second s@$))) r)))
      :pattern (($FVF.lookup_f (sm@20@00 s@$ xs@3@00 ys@4@00) r))
      :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second s@$))) r))
      :qid |qp.fvfValDef0|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@19@00 s@$ xs@3@00 ys@4@00 r)
          (and
            (<= 0 (inv@18@00 s@$ xs@3@00 ys@4@00 r))
            (< (inv@18@00 s@$ xs@3@00 ys@4@00 r) (Seq_length ys@4@00))))
        (=
          ($FVF.lookup_f (sm@20@00 s@$ xs@3@00 ys@4@00) r)
          ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
      :pattern (($FVF.lookup_f (sm@20@00 s@$ xs@3@00 ys@4@00) r))
      :pattern (($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
      :qid |qp.fvfValDef1|))
    (=>
      (fun02%precondition s@$ xs@3@00 ys@4@00)
      (=
        (fun02 s@$ xs@3@00 ys@4@00)
        (=
          ($FVF.lookup_f (sm@20@00 s@$ xs@3@00 ys@4@00) (Seq_index xs@3@00 0))
          ($FVF.lookup_f (sm@20@00 s@$ xs@3@00 ys@4@00) (Seq_index ys@4@00 0))))))
  :pattern ((fun02 s@$ xs@3@00 ys@4@00))
  :qid |quant-u-13|)))
(assert (forall ((s@$ $Snap) (xs@3@00 Seq<$Ref>) (ys@4@00 Seq<$Ref>)) (!
  true
  :pattern ((fun02 s@$ xs@3@00 ys@4@00))
  :qid |quant-u-14|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- test01 ----------
(declare-const xs@0@01 Set<$Ref>)
(declare-const y@1@01 $Ref)
(declare-const xs@2@01 Set<$Ref>)
(declare-const y@3@01 $Ref)
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
; inhale (forall x: Ref ::(x in xs) ==> acc(x.f, write))
(declare-const x@4@01 $Ref)
(push) ; 3
; [eval] (x in xs)
(assert (Set_in x@4@01 xs@2@01))
(pop) ; 3
(declare-const $t@5@01 $FVF<f>)
(declare-fun inv@6@01 ($Ref) $Ref)
(declare-fun img@7@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((x1@4@01 $Ref) (x2@4@01 $Ref)) (!
  (=>
    (and (Set_in x1@4@01 xs@2@01) (Set_in x2@4@01 xs@2@01) (= x1@4@01 x2@4@01))
    (= x1@4@01 x2@4@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@4@01 $Ref)) (!
  (=>
    (Set_in x@4@01 xs@2@01)
    (and (= (inv@6@01 x@4@01) x@4@01) (img@7@01 x@4@01)))
  :pattern ((Set_in x@4@01 xs@2@01))
  :pattern ((inv@6@01 x@4@01))
  :pattern ((img@7@01 x@4@01))
  :qid |quant-u-16|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@7@01 r) (Set_in (inv@6@01 r) xs@2@01)) (= (inv@6@01 r) r))
  :pattern ((inv@6@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@4@01 $Ref)) (!
  (=> (Set_in x@4@01 xs@2@01) (not (= x@4@01 $Ref.null)))
  :pattern ((Set_in x@4@01 xs@2@01))
  :pattern ((inv@6@01 x@4@01))
  :pattern ((img@7@01 x@4@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall x: Ref :: { (x in xs) } (x in xs) ==> x.f > 0)
(declare-const $t@8@01 $Snap)
(assert (= $t@8@01 $Snap.unit))
; [eval] (forall x: Ref :: { (x in xs) } (x in xs) ==> x.f > 0)
(declare-const x@9@01 $Ref)
(set-option :timeout 0)
(push) ; 3
; [eval] (x in xs) ==> x.f > 0
; [eval] (x in xs)
(push) ; 4
; [then-branch: 0 | x@9@01 in xs@2@01 | live]
; [else-branch: 0 | !(x@9@01 in xs@2@01) | live]
(push) ; 5
; [then-branch: 0 | x@9@01 in xs@2@01]
(assert (Set_in x@9@01 xs@2@01))
; [eval] x.f > 0
(push) ; 6
(assert (not (and (img@7@01 x@9@01) (Set_in (inv@6@01 x@9@01) xs@2@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 0 | !(x@9@01 in xs@2@01)]
(assert (not (Set_in x@9@01 xs@2@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in x@9@01 xs@2@01)) (Set_in x@9@01 xs@2@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@9@01 $Ref)) (!
  (or (not (Set_in x@9@01 xs@2@01)) (Set_in x@9@01 xs@2@01))
  :pattern ((Set_in x@9@01 xs@2@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions2.vpr@14@10@14@46-aux|)))
(assert (forall ((x@9@01 $Ref)) (!
  (=> (Set_in x@9@01 xs@2@01) (> ($FVF.lookup_f $t@5@01 x@9@01) 0))
  :pattern ((Set_in x@9@01 xs@2@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions2.vpr@14@10@14@46|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (y in xs)
(declare-const $t@10@01 $Snap)
(assert (= $t@10@01 $Snap.unit))
; [eval] (y in xs)
(assert (Set_in y@3@01 xs@2@01))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; label pre
; [exec]
; assert fun01(xs, y) == y.f
; [eval] fun01(xs, y) == y.f
; [eval] fun01(xs, y)
(set-option :timeout 0)
(push) ; 3
(declare-const x@11@01 $Ref)
(push) ; 4
; [eval] (x in xs)
(assert (Set_in x@11@01 xs@2@01))
(pop) ; 4
(declare-fun inv@12@01 ($Ref) $Ref)
(declare-fun img@13@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((x1@11@01 $Ref) (x2@11@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@11@01 xs@2@01)
      (Set_in x2@11@01 xs@2@01)
      (= x1@11@01 x2@11@01))
    (= x1@11@01 x2@11@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@11@01 $Ref)) (!
  (=>
    (Set_in x@11@01 xs@2@01)
    (and (= (inv@12@01 x@11@01) x@11@01) (img@13@01 x@11@01)))
  :pattern ((Set_in x@11@01 xs@2@01))
  :pattern ((inv@12@01 x@11@01))
  :pattern ((img@13@01 x@11@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@13@01 r) (Set_in (inv@12@01 r) xs@2@01)) (= (inv@12@01 r) r))
  :pattern ((inv@12@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@14@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@12@01 r) xs@2@01) (img@13@01 r) (= r (inv@12@01 r)))
    ($Perm.min
      (ite (and (img@7@01 r) (Set_in (inv@6@01 r) xs@2@01)) $Perm.Write $Perm.No)
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
      (ite (and (img@7@01 r) (Set_in (inv@6@01 r) xs@2@01)) $Perm.Write $Perm.No)
      (pTaken@14@01 r))
    $Perm.No)
  
  :qid |quant-u-19|))))
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
    (and (Set_in (inv@12@01 r) xs@2@01) (img@13@01 r) (= r (inv@12@01 r)))
    (= (- $Perm.Write (pTaken@14@01 r)) $Perm.No))
  
  :qid |quant-u-20|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@15@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@15@01  $FVF<f>)))
      (and (Set_in (inv@12@01 r) xs@2@01) (img@13@01 r)))
    (=>
      (and (Set_in (inv@12@01 r) xs@2@01) (img@13@01 r))
      (Set_in r ($FVF.domain_f (as sm@15@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@15@01  $FVF<f>))))
  :qid |qp.fvfDomDef1|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@12@01 r) xs@2@01) (img@13@01 r))
      (and (img@7@01 r) (Set_in (inv@6@01 r) xs@2@01)))
    (= ($FVF.lookup_f (as sm@15@01  $FVF<f>) r) ($FVF.lookup_f $t@5@01 r)))
  :pattern (($FVF.lookup_f (as sm@15@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@5@01 r))
  :qid |qp.fvfValDef0|)))
; [eval] (forall x: Ref ::(x in xs) ==> x.f > 0)
(declare-const x@16@01 $Ref)
(set-option :timeout 0)
(push) ; 4
; [eval] (x in xs) ==> x.f > 0
; [eval] (x in xs)
(push) ; 5
; [then-branch: 1 | x@16@01 in xs@2@01 | live]
; [else-branch: 1 | !(x@16@01 in xs@2@01) | live]
(push) ; 6
; [then-branch: 1 | x@16@01 in xs@2@01]
(assert (Set_in x@16@01 xs@2@01))
; [eval] x.f > 0
(push) ; 7
(assert (not (and (img@7@01 x@16@01) (Set_in (inv@6@01 x@16@01) xs@2@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 1 | !(x@16@01 in xs@2@01)]
(assert (not (Set_in x@16@01 xs@2@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in x@16@01 xs@2@01)) (Set_in x@16@01 xs@2@01)))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 4
(assert (not (forall ((x@16@01 $Ref)) (!
  (=> (Set_in x@16@01 xs@2@01) (> ($FVF.lookup_f $t@5@01 x@16@01) 0))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions2.vpr@8@12@8@48|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((x@16@01 $Ref)) (!
  (=> (Set_in x@16@01 xs@2@01) (> ($FVF.lookup_f $t@5@01 x@16@01) 0))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions2.vpr@8@12@8@48|)))
; [eval] (y in xs)
(assert (fun01%precondition ($Snap.combine
  ($SortWrappers.$FVF<f>To$Snap (as sm@15@01  $FVF<f>))
  ($Snap.combine $Snap.unit $Snap.unit)) xs@2@01 y@3@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((x@11@01 $Ref)) (!
  (=>
    (Set_in x@11@01 xs@2@01)
    (and (= (inv@12@01 x@11@01) x@11@01) (img@13@01 x@11@01)))
  :pattern ((Set_in x@11@01 xs@2@01))
  :pattern ((inv@12@01 x@11@01))
  :pattern ((img@13@01 x@11@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@13@01 r) (Set_in (inv@12@01 r) xs@2@01)) (= (inv@12@01 r) r))
  :pattern ((inv@12@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@15@01  $FVF<f>)))
      (and (Set_in (inv@12@01 r) xs@2@01) (img@13@01 r)))
    (=>
      (and (Set_in (inv@12@01 r) xs@2@01) (img@13@01 r))
      (Set_in r ($FVF.domain_f (as sm@15@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@15@01  $FVF<f>))))
  :qid |qp.fvfDomDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@12@01 r) xs@2@01) (img@13@01 r))
      (and (img@7@01 r) (Set_in (inv@6@01 r) xs@2@01)))
    (= ($FVF.lookup_f (as sm@15@01  $FVF<f>) r) ($FVF.lookup_f $t@5@01 r)))
  :pattern (($FVF.lookup_f (as sm@15@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@5@01 r))
  :qid |qp.fvfValDef0|)))
(assert (and
  (forall ((x@16@01 $Ref)) (!
    (=> (Set_in x@16@01 xs@2@01) (> ($FVF.lookup_f $t@5@01 x@16@01) 0))
    
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions2.vpr@8@12@8@48|))
  (fun01%precondition ($Snap.combine
    ($SortWrappers.$FVF<f>To$Snap (as sm@15@01  $FVF<f>))
    ($Snap.combine $Snap.unit $Snap.unit)) xs@2@01 y@3@01)))
(push) ; 3
(assert (not (and (img@7@01 y@3@01) (Set_in (inv@6@01 y@3@01) xs@2@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (=
  (fun01 ($Snap.combine
    ($SortWrappers.$FVF<f>To$Snap (as sm@15@01  $FVF<f>))
    ($Snap.combine $Snap.unit $Snap.unit)) xs@2@01 y@3@01)
  ($FVF.lookup_f $t@5@01 y@3@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  (fun01 ($Snap.combine
    ($SortWrappers.$FVF<f>To$Snap (as sm@15@01  $FVF<f>))
    ($Snap.combine $Snap.unit $Snap.unit)) xs@2@01 y@3@01)
  ($FVF.lookup_f $t@5@01 y@3@01)))
; [exec]
; assert fun01(xs, y) == old[pre](fun01(xs, y))
; [eval] fun01(xs, y) == old[pre](fun01(xs, y))
; [eval] fun01(xs, y)
(push) ; 3
(declare-const x@17@01 $Ref)
(push) ; 4
; [eval] (x in xs)
(assert (Set_in x@17@01 xs@2@01))
(pop) ; 4
(declare-fun inv@18@01 ($Ref) $Ref)
(declare-fun img@19@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((x1@17@01 $Ref) (x2@17@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@17@01 xs@2@01)
      (Set_in x2@17@01 xs@2@01)
      (= x1@17@01 x2@17@01))
    (= x1@17@01 x2@17@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@17@01 $Ref)) (!
  (=>
    (Set_in x@17@01 xs@2@01)
    (and (= (inv@18@01 x@17@01) x@17@01) (img@19@01 x@17@01)))
  :pattern ((Set_in x@17@01 xs@2@01))
  :pattern ((inv@18@01 x@17@01))
  :pattern ((img@19@01 x@17@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@19@01 r) (Set_in (inv@18@01 r) xs@2@01)) (= (inv@18@01 r) r))
  :pattern ((inv@18@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@20@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@18@01 r) xs@2@01) (img@19@01 r) (= r (inv@18@01 r)))
    ($Perm.min
      (ite (and (img@7@01 r) (Set_in (inv@6@01 r) xs@2@01)) $Perm.Write $Perm.No)
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
      (ite (and (img@7@01 r) (Set_in (inv@6@01 r) xs@2@01)) $Perm.Write $Perm.No)
      (pTaken@20@01 r))
    $Perm.No)
  
  :qid |quant-u-23|))))
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
    (and (Set_in (inv@18@01 r) xs@2@01) (img@19@01 r) (= r (inv@18@01 r)))
    (= (- $Perm.Write (pTaken@20@01 r)) $Perm.No))
  
  :qid |quant-u-24|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@21@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@21@01  $FVF<f>)))
      (and (Set_in (inv@18@01 r) xs@2@01) (img@19@01 r)))
    (=>
      (and (Set_in (inv@18@01 r) xs@2@01) (img@19@01 r))
      (Set_in r ($FVF.domain_f (as sm@21@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@21@01  $FVF<f>))))
  :qid |qp.fvfDomDef3|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@18@01 r) xs@2@01) (img@19@01 r))
      (and (img@7@01 r) (Set_in (inv@6@01 r) xs@2@01)))
    (= ($FVF.lookup_f (as sm@21@01  $FVF<f>) r) ($FVF.lookup_f $t@5@01 r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@5@01 r))
  :qid |qp.fvfValDef2|)))
; [eval] (forall x: Ref ::(x in xs) ==> x.f > 0)
(declare-const x@22@01 $Ref)
(set-option :timeout 0)
(push) ; 4
; [eval] (x in xs) ==> x.f > 0
; [eval] (x in xs)
(push) ; 5
; [then-branch: 2 | x@22@01 in xs@2@01 | live]
; [else-branch: 2 | !(x@22@01 in xs@2@01) | live]
(push) ; 6
; [then-branch: 2 | x@22@01 in xs@2@01]
(assert (Set_in x@22@01 xs@2@01))
; [eval] x.f > 0
(push) ; 7
(assert (not (and (img@7@01 x@22@01) (Set_in (inv@6@01 x@22@01) xs@2@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 2 | !(x@22@01 in xs@2@01)]
(assert (not (Set_in x@22@01 xs@2@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in x@22@01 xs@2@01)) (Set_in x@22@01 xs@2@01)))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 4
(assert (not (forall ((x@22@01 $Ref)) (!
  (=> (Set_in x@22@01 xs@2@01) (> ($FVF.lookup_f $t@5@01 x@22@01) 0))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions2.vpr@8@12@8@48|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((x@22@01 $Ref)) (!
  (=> (Set_in x@22@01 xs@2@01) (> ($FVF.lookup_f $t@5@01 x@22@01) 0))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions2.vpr@8@12@8@48|)))
; [eval] (y in xs)
(assert (fun01%precondition ($Snap.combine
  ($SortWrappers.$FVF<f>To$Snap (as sm@21@01  $FVF<f>))
  ($Snap.combine $Snap.unit $Snap.unit)) xs@2@01 y@3@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((x@17@01 $Ref)) (!
  (=>
    (Set_in x@17@01 xs@2@01)
    (and (= (inv@18@01 x@17@01) x@17@01) (img@19@01 x@17@01)))
  :pattern ((Set_in x@17@01 xs@2@01))
  :pattern ((inv@18@01 x@17@01))
  :pattern ((img@19@01 x@17@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@19@01 r) (Set_in (inv@18@01 r) xs@2@01)) (= (inv@18@01 r) r))
  :pattern ((inv@18@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@21@01  $FVF<f>)))
      (and (Set_in (inv@18@01 r) xs@2@01) (img@19@01 r)))
    (=>
      (and (Set_in (inv@18@01 r) xs@2@01) (img@19@01 r))
      (Set_in r ($FVF.domain_f (as sm@21@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@21@01  $FVF<f>))))
  :qid |qp.fvfDomDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@18@01 r) xs@2@01) (img@19@01 r))
      (and (img@7@01 r) (Set_in (inv@6@01 r) xs@2@01)))
    (= ($FVF.lookup_f (as sm@21@01  $FVF<f>) r) ($FVF.lookup_f $t@5@01 r)))
  :pattern (($FVF.lookup_f (as sm@21@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@5@01 r))
  :qid |qp.fvfValDef2|)))
(assert (and
  (forall ((x@22@01 $Ref)) (!
    (=> (Set_in x@22@01 xs@2@01) (> ($FVF.lookup_f $t@5@01 x@22@01) 0))
    
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions2.vpr@8@12@8@48|))
  (fun01%precondition ($Snap.combine
    ($SortWrappers.$FVF<f>To$Snap (as sm@21@01  $FVF<f>))
    ($Snap.combine $Snap.unit $Snap.unit)) xs@2@01 y@3@01)))
; [eval] old[pre](fun01(xs, y))
; [eval] fun01(xs, y)
(push) ; 3
(declare-const x@23@01 $Ref)
(push) ; 4
; [eval] (x in xs)
(assert (Set_in x@23@01 xs@2@01))
(pop) ; 4
(declare-fun inv@24@01 ($Ref) $Ref)
(declare-fun img@25@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((x1@23@01 $Ref) (x2@23@01 $Ref)) (!
  (=>
    (and
      (Set_in x1@23@01 xs@2@01)
      (Set_in x2@23@01 xs@2@01)
      (= x1@23@01 x2@23@01))
    (= x1@23@01 x2@23@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@23@01 $Ref)) (!
  (=>
    (Set_in x@23@01 xs@2@01)
    (and (= (inv@24@01 x@23@01) x@23@01) (img@25@01 x@23@01)))
  :pattern ((Set_in x@23@01 xs@2@01))
  :pattern ((inv@24@01 x@23@01))
  :pattern ((img@25@01 x@23@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@25@01 r) (Set_in (inv@24@01 r) xs@2@01)) (= (inv@24@01 r) r))
  :pattern ((inv@24@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@26@01 ((r $Ref)) $Perm
  (ite
    (and (Set_in (inv@24@01 r) xs@2@01) (img@25@01 r) (= r (inv@24@01 r)))
    ($Perm.min
      (ite (and (img@7@01 r) (Set_in (inv@6@01 r) xs@2@01)) $Perm.Write $Perm.No)
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
      (ite (and (img@7@01 r) (Set_in (inv@6@01 r) xs@2@01)) $Perm.Write $Perm.No)
      (pTaken@26@01 r))
    $Perm.No)
  
  :qid |quant-u-27|))))
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
    (and (Set_in (inv@24@01 r) xs@2@01) (img@25@01 r) (= r (inv@24@01 r)))
    (= (- $Perm.Write (pTaken@26@01 r)) $Perm.No))
  
  :qid |quant-u-28|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@27@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@27@01  $FVF<f>)))
      (and (Set_in (inv@24@01 r) xs@2@01) (img@25@01 r)))
    (=>
      (and (Set_in (inv@24@01 r) xs@2@01) (img@25@01 r))
      (Set_in r ($FVF.domain_f (as sm@27@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@27@01  $FVF<f>))))
  :qid |qp.fvfDomDef5|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@24@01 r) xs@2@01) (img@25@01 r))
      (and (img@7@01 r) (Set_in (inv@6@01 r) xs@2@01)))
    (= ($FVF.lookup_f (as sm@27@01  $FVF<f>) r) ($FVF.lookup_f $t@5@01 r)))
  :pattern (($FVF.lookup_f (as sm@27@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@5@01 r))
  :qid |qp.fvfValDef4|)))
; [eval] (forall x: Ref ::(x in xs) ==> x.f > 0)
(declare-const x@28@01 $Ref)
(set-option :timeout 0)
(push) ; 4
; [eval] (x in xs) ==> x.f > 0
; [eval] (x in xs)
(push) ; 5
; [then-branch: 3 | x@28@01 in xs@2@01 | live]
; [else-branch: 3 | !(x@28@01 in xs@2@01) | live]
(push) ; 6
; [then-branch: 3 | x@28@01 in xs@2@01]
(assert (Set_in x@28@01 xs@2@01))
; [eval] x.f > 0
(push) ; 7
(assert (not (and (img@7@01 x@28@01) (Set_in (inv@6@01 x@28@01) xs@2@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 3 | !(x@28@01 in xs@2@01)]
(assert (not (Set_in x@28@01 xs@2@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in x@28@01 xs@2@01)) (Set_in x@28@01 xs@2@01)))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 4
(assert (not (forall ((x@28@01 $Ref)) (!
  (=> (Set_in x@28@01 xs@2@01) (> ($FVF.lookup_f $t@5@01 x@28@01) 0))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions2.vpr@8@12@8@48|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((x@28@01 $Ref)) (!
  (=> (Set_in x@28@01 xs@2@01) (> ($FVF.lookup_f $t@5@01 x@28@01) 0))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions2.vpr@8@12@8@48|)))
; [eval] (y in xs)
(assert (fun01%precondition ($Snap.combine
  ($SortWrappers.$FVF<f>To$Snap (as sm@27@01  $FVF<f>))
  ($Snap.combine $Snap.unit $Snap.unit)) xs@2@01 y@3@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((x@23@01 $Ref)) (!
  (=>
    (Set_in x@23@01 xs@2@01)
    (and (= (inv@24@01 x@23@01) x@23@01) (img@25@01 x@23@01)))
  :pattern ((Set_in x@23@01 xs@2@01))
  :pattern ((inv@24@01 x@23@01))
  :pattern ((img@25@01 x@23@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=> (and (img@25@01 r) (Set_in (inv@24@01 r) xs@2@01)) (= (inv@24@01 r) r))
  :pattern ((inv@24@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@27@01  $FVF<f>)))
      (and (Set_in (inv@24@01 r) xs@2@01) (img@25@01 r)))
    (=>
      (and (Set_in (inv@24@01 r) xs@2@01) (img@25@01 r))
      (Set_in r ($FVF.domain_f (as sm@27@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@27@01  $FVF<f>))))
  :qid |qp.fvfDomDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and (Set_in (inv@24@01 r) xs@2@01) (img@25@01 r))
      (and (img@7@01 r) (Set_in (inv@6@01 r) xs@2@01)))
    (= ($FVF.lookup_f (as sm@27@01  $FVF<f>) r) ($FVF.lookup_f $t@5@01 r)))
  :pattern (($FVF.lookup_f (as sm@27@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@5@01 r))
  :qid |qp.fvfValDef4|)))
(assert (and
  (forall ((x@28@01 $Ref)) (!
    (=> (Set_in x@28@01 xs@2@01) (> ($FVF.lookup_f $t@5@01 x@28@01) 0))
    
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions2.vpr@8@12@8@48|))
  (fun01%precondition ($Snap.combine
    ($SortWrappers.$FVF<f>To$Snap (as sm@27@01  $FVF<f>))
    ($Snap.combine $Snap.unit $Snap.unit)) xs@2@01 y@3@01)))
(push) ; 3
(assert (not (=
  (fun01 ($Snap.combine
    ($SortWrappers.$FVF<f>To$Snap (as sm@21@01  $FVF<f>))
    ($Snap.combine $Snap.unit $Snap.unit)) xs@2@01 y@3@01)
  (fun01 ($Snap.combine
    ($SortWrappers.$FVF<f>To$Snap (as sm@27@01  $FVF<f>))
    ($Snap.combine $Snap.unit $Snap.unit)) xs@2@01 y@3@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  (fun01 ($Snap.combine
    ($SortWrappers.$FVF<f>To$Snap (as sm@21@01  $FVF<f>))
    ($Snap.combine $Snap.unit $Snap.unit)) xs@2@01 y@3@01)
  (fun01 ($Snap.combine
    ($SortWrappers.$FVF<f>To$Snap (as sm@27@01  $FVF<f>))
    ($Snap.combine $Snap.unit $Snap.unit)) xs@2@01 y@3@01)))
; [exec]
; assert false
(check-sat)
; unknown
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(declare-const sm@29@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@7@01 r) (Set_in (inv@6@01 r) xs@2@01))
    (= ($FVF.lookup_f (as sm@29@01  $FVF<f>) r) ($FVF.lookup_f $t@5@01 r)))
  :pattern (($FVF.lookup_f (as sm@29@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@5@01 r))
  :qid |qp.fvfValDef6|)))
(declare-const pm@30@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@30@01  $FPM) r)
    (ite (and (img@7@01 r) (Set_in (inv@6@01 r) xs@2@01)) $Perm.Write $Perm.No))
  :pattern (($FVF.perm_f (as pm@30@01  $FPM) r))
  :qid |qp.resPrmSumDef7|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@30@01  $FPM) r) $Perm.Write)
  :pattern ((inv@6@01 r))
  :qid |qp-fld-prm-bnd|)))
(set-option :timeout 0)
(check-sat)
; unknown
(pop) ; 2
(pop) ; 1
; ---------- test02 ----------
(declare-const xs@31@01 Seq<$Ref>)
(declare-const ys@32@01 Seq<$Ref>)
(declare-const xs@33@01 Seq<$Ref>)
(declare-const ys@34@01 Seq<$Ref>)
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
; inhale (forall i: Int, j: Int ::
;     { xs[i], xs[j] }
;     i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==>
;     xs[i] != xs[j])
(declare-const $t@35@01 $Snap)
(assert (= $t@35@01 $Snap.unit))
; [eval] (forall i: Int, j: Int :: { xs[i], xs[j] } i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==> xs[i] != xs[j])
(declare-const i@36@01 Int)
(declare-const j@37@01 Int)
(push) ; 3
; [eval] i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==> xs[i] != xs[j]
; [eval] i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j)))
; [eval] i >= 0
(push) ; 4
; [then-branch: 4 | !(i@36@01 >= 0) | live]
; [else-branch: 4 | i@36@01 >= 0 | live]
(push) ; 5
; [then-branch: 4 | !(i@36@01 >= 0)]
(assert (not (>= i@36@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 4 | i@36@01 >= 0]
(assert (>= i@36@01 0))
; [eval] i < |xs|
; [eval] |xs|
(push) ; 6
; [then-branch: 5 | !(i@36@01 < |xs@33@01|) | live]
; [else-branch: 5 | i@36@01 < |xs@33@01| | live]
(push) ; 7
; [then-branch: 5 | !(i@36@01 < |xs@33@01|)]
(assert (not (< i@36@01 (Seq_length xs@33@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 5 | i@36@01 < |xs@33@01|]
(assert (< i@36@01 (Seq_length xs@33@01)))
; [eval] j >= 0
(push) ; 8
; [then-branch: 6 | !(j@37@01 >= 0) | live]
; [else-branch: 6 | j@37@01 >= 0 | live]
(push) ; 9
; [then-branch: 6 | !(j@37@01 >= 0)]
(assert (not (>= j@37@01 0)))
(pop) ; 9
(push) ; 9
; [else-branch: 6 | j@37@01 >= 0]
(assert (>= j@37@01 0))
; [eval] j < |xs|
; [eval] |xs|
(push) ; 10
; [then-branch: 7 | !(j@37@01 < |xs@33@01|) | live]
; [else-branch: 7 | j@37@01 < |xs@33@01| | live]
(push) ; 11
; [then-branch: 7 | !(j@37@01 < |xs@33@01|)]
(assert (not (< j@37@01 (Seq_length xs@33@01))))
(pop) ; 11
(push) ; 11
; [else-branch: 7 | j@37@01 < |xs@33@01|]
(assert (< j@37@01 (Seq_length xs@33@01)))
; [eval] i != j
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or (< j@37@01 (Seq_length xs@33@01)) (not (< j@37@01 (Seq_length xs@33@01)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@37@01 0)
  (and
    (>= j@37@01 0)
    (or
      (< j@37@01 (Seq_length xs@33@01))
      (not (< j@37@01 (Seq_length xs@33@01)))))))
(assert (or (>= j@37@01 0) (not (>= j@37@01 0))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i@36@01 (Seq_length xs@33@01))
  (and
    (< i@36@01 (Seq_length xs@33@01))
    (=>
      (>= j@37@01 0)
      (and
        (>= j@37@01 0)
        (or
          (< j@37@01 (Seq_length xs@33@01))
          (not (< j@37@01 (Seq_length xs@33@01))))))
    (or (>= j@37@01 0) (not (>= j@37@01 0))))))
(assert (or (< i@36@01 (Seq_length xs@33@01)) (not (< i@36@01 (Seq_length xs@33@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= i@36@01 0)
  (and
    (>= i@36@01 0)
    (=>
      (< i@36@01 (Seq_length xs@33@01))
      (and
        (< i@36@01 (Seq_length xs@33@01))
        (=>
          (>= j@37@01 0)
          (and
            (>= j@37@01 0)
            (or
              (< j@37@01 (Seq_length xs@33@01))
              (not (< j@37@01 (Seq_length xs@33@01))))))
        (or (>= j@37@01 0) (not (>= j@37@01 0)))))
    (or
      (< i@36@01 (Seq_length xs@33@01))
      (not (< i@36@01 (Seq_length xs@33@01)))))))
(assert (or (>= i@36@01 0) (not (>= i@36@01 0))))
(push) ; 4
; [then-branch: 8 | i@36@01 >= 0 && i@36@01 < |xs@33@01| && j@37@01 >= 0 && j@37@01 < |xs@33@01| && i@36@01 != j@37@01 | live]
; [else-branch: 8 | !(i@36@01 >= 0 && i@36@01 < |xs@33@01| && j@37@01 >= 0 && j@37@01 < |xs@33@01| && i@36@01 != j@37@01) | live]
(push) ; 5
; [then-branch: 8 | i@36@01 >= 0 && i@36@01 < |xs@33@01| && j@37@01 >= 0 && j@37@01 < |xs@33@01| && i@36@01 != j@37@01]
(assert (and
  (>= i@36@01 0)
  (and
    (< i@36@01 (Seq_length xs@33@01))
    (and
      (>= j@37@01 0)
      (and (< j@37@01 (Seq_length xs@33@01)) (not (= i@36@01 j@37@01)))))))
; [eval] xs[i] != xs[j]
; [eval] xs[i]
; [eval] xs[j]
(pop) ; 5
(push) ; 5
; [else-branch: 8 | !(i@36@01 >= 0 && i@36@01 < |xs@33@01| && j@37@01 >= 0 && j@37@01 < |xs@33@01| && i@36@01 != j@37@01)]
(assert (not
  (and
    (>= i@36@01 0)
    (and
      (< i@36@01 (Seq_length xs@33@01))
      (and
        (>= j@37@01 0)
        (and (< j@37@01 (Seq_length xs@33@01)) (not (= i@36@01 j@37@01))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (>= i@36@01 0)
    (and
      (< i@36@01 (Seq_length xs@33@01))
      (and
        (>= j@37@01 0)
        (and (< j@37@01 (Seq_length xs@33@01)) (not (= i@36@01 j@37@01))))))
  (and
    (>= i@36@01 0)
    (< i@36@01 (Seq_length xs@33@01))
    (>= j@37@01 0)
    (< j@37@01 (Seq_length xs@33@01))
    (not (= i@36@01 j@37@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= i@36@01 0)
      (and
        (< i@36@01 (Seq_length xs@33@01))
        (and
          (>= j@37@01 0)
          (and (< j@37@01 (Seq_length xs@33@01)) (not (= i@36@01 j@37@01)))))))
  (and
    (>= i@36@01 0)
    (and
      (< i@36@01 (Seq_length xs@33@01))
      (and
        (>= j@37@01 0)
        (and (< j@37@01 (Seq_length xs@33@01)) (not (= i@36@01 j@37@01))))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@36@01 Int) (j@37@01 Int)) (!
  (and
    (=>
      (>= i@36@01 0)
      (and
        (>= i@36@01 0)
        (=>
          (< i@36@01 (Seq_length xs@33@01))
          (and
            (< i@36@01 (Seq_length xs@33@01))
            (=>
              (>= j@37@01 0)
              (and
                (>= j@37@01 0)
                (or
                  (< j@37@01 (Seq_length xs@33@01))
                  (not (< j@37@01 (Seq_length xs@33@01))))))
            (or (>= j@37@01 0) (not (>= j@37@01 0)))))
        (or
          (< i@36@01 (Seq_length xs@33@01))
          (not (< i@36@01 (Seq_length xs@33@01))))))
    (or (>= i@36@01 0) (not (>= i@36@01 0)))
    (=>
      (and
        (>= i@36@01 0)
        (and
          (< i@36@01 (Seq_length xs@33@01))
          (and
            (>= j@37@01 0)
            (and (< j@37@01 (Seq_length xs@33@01)) (not (= i@36@01 j@37@01))))))
      (and
        (>= i@36@01 0)
        (< i@36@01 (Seq_length xs@33@01))
        (>= j@37@01 0)
        (< j@37@01 (Seq_length xs@33@01))
        (not (= i@36@01 j@37@01))))
    (or
      (not
        (and
          (>= i@36@01 0)
          (and
            (< i@36@01 (Seq_length xs@33@01))
            (and
              (>= j@37@01 0)
              (and (< j@37@01 (Seq_length xs@33@01)) (not (= i@36@01 j@37@01)))))))
      (and
        (>= i@36@01 0)
        (and
          (< i@36@01 (Seq_length xs@33@01))
          (and
            (>= j@37@01 0)
            (and (< j@37@01 (Seq_length xs@33@01)) (not (= i@36@01 j@37@01))))))))
  :pattern ((Seq_index xs@33@01 i@36@01) (Seq_index xs@33@01 j@37@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions2.vpr@34@10@34@104-aux|)))
(assert (forall ((i@36@01 Int) (j@37@01 Int)) (!
  (=>
    (and
      (>= i@36@01 0)
      (and
        (< i@36@01 (Seq_length xs@33@01))
        (and
          (>= j@37@01 0)
          (and (< j@37@01 (Seq_length xs@33@01)) (not (= i@36@01 j@37@01))))))
    (not (= (Seq_index xs@33@01 i@36@01) (Seq_index xs@33@01 j@37@01))))
  :pattern ((Seq_index xs@33@01 i@36@01) (Seq_index xs@33@01 j@37@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions2.vpr@34@10@34@104|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall i: Int ::0 <= i && i < |xs| ==> acc(xs[i].f, write))
(declare-const i@38@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i && i < |xs|
; [eval] 0 <= i
(push) ; 4
; [then-branch: 9 | !(0 <= i@38@01) | live]
; [else-branch: 9 | 0 <= i@38@01 | live]
(push) ; 5
; [then-branch: 9 | !(0 <= i@38@01)]
(assert (not (<= 0 i@38@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 9 | 0 <= i@38@01]
(assert (<= 0 i@38@01))
; [eval] i < |xs|
; [eval] |xs|
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@38@01) (not (<= 0 i@38@01))))
(assert (and (<= 0 i@38@01) (< i@38@01 (Seq_length xs@33@01))))
; [eval] xs[i]
(push) ; 4
(assert (not (>= i@38@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-const $t@39@01 $FVF<f>)
(declare-fun inv@40@01 ($Ref) Int)
(declare-fun img@41@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@38@01 Int)) (!
  (=>
    (and (<= 0 i@38@01) (< i@38@01 (Seq_length xs@33@01)))
    (or (<= 0 i@38@01) (not (<= 0 i@38@01))))
  :pattern ((Seq_index xs@33@01 i@38@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@38@01 Int) (i2@38@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@38@01) (< i1@38@01 (Seq_length xs@33@01)))
      (and (<= 0 i2@38@01) (< i2@38@01 (Seq_length xs@33@01)))
      (= (Seq_index xs@33@01 i1@38@01) (Seq_index xs@33@01 i2@38@01)))
    (= i1@38@01 i2@38@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@38@01 Int)) (!
  (=>
    (and (<= 0 i@38@01) (< i@38@01 (Seq_length xs@33@01)))
    (and
      (= (inv@40@01 (Seq_index xs@33@01 i@38@01)) i@38@01)
      (img@41@01 (Seq_index xs@33@01 i@38@01))))
  :pattern ((Seq_index xs@33@01 i@38@01))
  :qid |quant-u-30|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@41@01 r)
      (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
    (= (Seq_index xs@33@01 (inv@40@01 r)) r))
  :pattern ((inv@40@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@38@01 Int)) (!
  (=>
    (and (<= 0 i@38@01) (< i@38@01 (Seq_length xs@33@01)))
    (not (= (Seq_index xs@33@01 i@38@01) $Ref.null)))
  :pattern ((Seq_index xs@33@01 i@38@01))
  :qid |f-permImpliesNonNull|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall i: Int, j: Int ::
;     { ys[i], ys[j] }
;     i >= 0 && (i < |ys| && (j >= 0 && (j < |ys| && i != j))) ==>
;     ys[i] != ys[j])
(declare-const $t@42@01 $Snap)
(assert (= $t@42@01 $Snap.unit))
; [eval] (forall i: Int, j: Int :: { ys[i], ys[j] } i >= 0 && (i < |ys| && (j >= 0 && (j < |ys| && i != j))) ==> ys[i] != ys[j])
(declare-const i@43@01 Int)
(declare-const j@44@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] i >= 0 && (i < |ys| && (j >= 0 && (j < |ys| && i != j))) ==> ys[i] != ys[j]
; [eval] i >= 0 && (i < |ys| && (j >= 0 && (j < |ys| && i != j)))
; [eval] i >= 0
(push) ; 4
; [then-branch: 10 | !(i@43@01 >= 0) | live]
; [else-branch: 10 | i@43@01 >= 0 | live]
(push) ; 5
; [then-branch: 10 | !(i@43@01 >= 0)]
(assert (not (>= i@43@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 10 | i@43@01 >= 0]
(assert (>= i@43@01 0))
; [eval] i < |ys|
; [eval] |ys|
(push) ; 6
; [then-branch: 11 | !(i@43@01 < |ys@34@01|) | live]
; [else-branch: 11 | i@43@01 < |ys@34@01| | live]
(push) ; 7
; [then-branch: 11 | !(i@43@01 < |ys@34@01|)]
(assert (not (< i@43@01 (Seq_length ys@34@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 11 | i@43@01 < |ys@34@01|]
(assert (< i@43@01 (Seq_length ys@34@01)))
; [eval] j >= 0
(push) ; 8
; [then-branch: 12 | !(j@44@01 >= 0) | live]
; [else-branch: 12 | j@44@01 >= 0 | live]
(push) ; 9
; [then-branch: 12 | !(j@44@01 >= 0)]
(assert (not (>= j@44@01 0)))
(pop) ; 9
(push) ; 9
; [else-branch: 12 | j@44@01 >= 0]
(assert (>= j@44@01 0))
; [eval] j < |ys|
; [eval] |ys|
(push) ; 10
; [then-branch: 13 | !(j@44@01 < |ys@34@01|) | live]
; [else-branch: 13 | j@44@01 < |ys@34@01| | live]
(push) ; 11
; [then-branch: 13 | !(j@44@01 < |ys@34@01|)]
(assert (not (< j@44@01 (Seq_length ys@34@01))))
(pop) ; 11
(push) ; 11
; [else-branch: 13 | j@44@01 < |ys@34@01|]
(assert (< j@44@01 (Seq_length ys@34@01)))
; [eval] i != j
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or (< j@44@01 (Seq_length ys@34@01)) (not (< j@44@01 (Seq_length ys@34@01)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@44@01 0)
  (and
    (>= j@44@01 0)
    (or
      (< j@44@01 (Seq_length ys@34@01))
      (not (< j@44@01 (Seq_length ys@34@01)))))))
(assert (or (>= j@44@01 0) (not (>= j@44@01 0))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i@43@01 (Seq_length ys@34@01))
  (and
    (< i@43@01 (Seq_length ys@34@01))
    (=>
      (>= j@44@01 0)
      (and
        (>= j@44@01 0)
        (or
          (< j@44@01 (Seq_length ys@34@01))
          (not (< j@44@01 (Seq_length ys@34@01))))))
    (or (>= j@44@01 0) (not (>= j@44@01 0))))))
(assert (or (< i@43@01 (Seq_length ys@34@01)) (not (< i@43@01 (Seq_length ys@34@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= i@43@01 0)
  (and
    (>= i@43@01 0)
    (=>
      (< i@43@01 (Seq_length ys@34@01))
      (and
        (< i@43@01 (Seq_length ys@34@01))
        (=>
          (>= j@44@01 0)
          (and
            (>= j@44@01 0)
            (or
              (< j@44@01 (Seq_length ys@34@01))
              (not (< j@44@01 (Seq_length ys@34@01))))))
        (or (>= j@44@01 0) (not (>= j@44@01 0)))))
    (or
      (< i@43@01 (Seq_length ys@34@01))
      (not (< i@43@01 (Seq_length ys@34@01)))))))
(assert (or (>= i@43@01 0) (not (>= i@43@01 0))))
(push) ; 4
; [then-branch: 14 | i@43@01 >= 0 && i@43@01 < |ys@34@01| && j@44@01 >= 0 && j@44@01 < |ys@34@01| && i@43@01 != j@44@01 | live]
; [else-branch: 14 | !(i@43@01 >= 0 && i@43@01 < |ys@34@01| && j@44@01 >= 0 && j@44@01 < |ys@34@01| && i@43@01 != j@44@01) | live]
(push) ; 5
; [then-branch: 14 | i@43@01 >= 0 && i@43@01 < |ys@34@01| && j@44@01 >= 0 && j@44@01 < |ys@34@01| && i@43@01 != j@44@01]
(assert (and
  (>= i@43@01 0)
  (and
    (< i@43@01 (Seq_length ys@34@01))
    (and
      (>= j@44@01 0)
      (and (< j@44@01 (Seq_length ys@34@01)) (not (= i@43@01 j@44@01)))))))
; [eval] ys[i] != ys[j]
; [eval] ys[i]
; [eval] ys[j]
(pop) ; 5
(push) ; 5
; [else-branch: 14 | !(i@43@01 >= 0 && i@43@01 < |ys@34@01| && j@44@01 >= 0 && j@44@01 < |ys@34@01| && i@43@01 != j@44@01)]
(assert (not
  (and
    (>= i@43@01 0)
    (and
      (< i@43@01 (Seq_length ys@34@01))
      (and
        (>= j@44@01 0)
        (and (< j@44@01 (Seq_length ys@34@01)) (not (= i@43@01 j@44@01))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (>= i@43@01 0)
    (and
      (< i@43@01 (Seq_length ys@34@01))
      (and
        (>= j@44@01 0)
        (and (< j@44@01 (Seq_length ys@34@01)) (not (= i@43@01 j@44@01))))))
  (and
    (>= i@43@01 0)
    (< i@43@01 (Seq_length ys@34@01))
    (>= j@44@01 0)
    (< j@44@01 (Seq_length ys@34@01))
    (not (= i@43@01 j@44@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= i@43@01 0)
      (and
        (< i@43@01 (Seq_length ys@34@01))
        (and
          (>= j@44@01 0)
          (and (< j@44@01 (Seq_length ys@34@01)) (not (= i@43@01 j@44@01)))))))
  (and
    (>= i@43@01 0)
    (and
      (< i@43@01 (Seq_length ys@34@01))
      (and
        (>= j@44@01 0)
        (and (< j@44@01 (Seq_length ys@34@01)) (not (= i@43@01 j@44@01))))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@43@01 Int) (j@44@01 Int)) (!
  (and
    (=>
      (>= i@43@01 0)
      (and
        (>= i@43@01 0)
        (=>
          (< i@43@01 (Seq_length ys@34@01))
          (and
            (< i@43@01 (Seq_length ys@34@01))
            (=>
              (>= j@44@01 0)
              (and
                (>= j@44@01 0)
                (or
                  (< j@44@01 (Seq_length ys@34@01))
                  (not (< j@44@01 (Seq_length ys@34@01))))))
            (or (>= j@44@01 0) (not (>= j@44@01 0)))))
        (or
          (< i@43@01 (Seq_length ys@34@01))
          (not (< i@43@01 (Seq_length ys@34@01))))))
    (or (>= i@43@01 0) (not (>= i@43@01 0)))
    (=>
      (and
        (>= i@43@01 0)
        (and
          (< i@43@01 (Seq_length ys@34@01))
          (and
            (>= j@44@01 0)
            (and (< j@44@01 (Seq_length ys@34@01)) (not (= i@43@01 j@44@01))))))
      (and
        (>= i@43@01 0)
        (< i@43@01 (Seq_length ys@34@01))
        (>= j@44@01 0)
        (< j@44@01 (Seq_length ys@34@01))
        (not (= i@43@01 j@44@01))))
    (or
      (not
        (and
          (>= i@43@01 0)
          (and
            (< i@43@01 (Seq_length ys@34@01))
            (and
              (>= j@44@01 0)
              (and (< j@44@01 (Seq_length ys@34@01)) (not (= i@43@01 j@44@01)))))))
      (and
        (>= i@43@01 0)
        (and
          (< i@43@01 (Seq_length ys@34@01))
          (and
            (>= j@44@01 0)
            (and (< j@44@01 (Seq_length ys@34@01)) (not (= i@43@01 j@44@01))))))))
  :pattern ((Seq_index ys@34@01 i@43@01) (Seq_index ys@34@01 j@44@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions2.vpr@36@10@36@104-aux|)))
(assert (forall ((i@43@01 Int) (j@44@01 Int)) (!
  (=>
    (and
      (>= i@43@01 0)
      (and
        (< i@43@01 (Seq_length ys@34@01))
        (and
          (>= j@44@01 0)
          (and (< j@44@01 (Seq_length ys@34@01)) (not (= i@43@01 j@44@01))))))
    (not (= (Seq_index ys@34@01 i@43@01) (Seq_index ys@34@01 j@44@01))))
  :pattern ((Seq_index ys@34@01 i@43@01) (Seq_index ys@34@01 j@44@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions2.vpr@36@10@36@104|)))
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale (forall i: Int ::0 <= i && i < |ys| ==> acc(ys[i].f, write))
(declare-const i@45@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i && i < |ys|
; [eval] 0 <= i
(push) ; 4
; [then-branch: 15 | !(0 <= i@45@01) | live]
; [else-branch: 15 | 0 <= i@45@01 | live]
(push) ; 5
; [then-branch: 15 | !(0 <= i@45@01)]
(assert (not (<= 0 i@45@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 15 | 0 <= i@45@01]
(assert (<= 0 i@45@01))
; [eval] i < |ys|
; [eval] |ys|
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@45@01) (not (<= 0 i@45@01))))
(assert (and (<= 0 i@45@01) (< i@45@01 (Seq_length ys@34@01))))
; [eval] ys[i]
(push) ; 4
(assert (not (>= i@45@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-const $t@46@01 $FVF<f>)
(declare-fun inv@47@01 ($Ref) Int)
(declare-fun img@48@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@45@01 Int)) (!
  (=>
    (and (<= 0 i@45@01) (< i@45@01 (Seq_length ys@34@01)))
    (or (<= 0 i@45@01) (not (<= 0 i@45@01))))
  :pattern ((Seq_index ys@34@01 i@45@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@45@01 Int) (i2@45@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@45@01) (< i1@45@01 (Seq_length ys@34@01)))
      (and (<= 0 i2@45@01) (< i2@45@01 (Seq_length ys@34@01)))
      (= (Seq_index ys@34@01 i1@45@01) (Seq_index ys@34@01 i2@45@01)))
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
    (and (<= 0 i@45@01) (< i@45@01 (Seq_length ys@34@01)))
    (and
      (= (inv@47@01 (Seq_index ys@34@01 i@45@01)) i@45@01)
      (img@48@01 (Seq_index ys@34@01 i@45@01))))
  :pattern ((Seq_index ys@34@01 i@45@01))
  :qid |quant-u-32|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@48@01 r)
      (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
    (= (Seq_index ys@34@01 (inv@47@01 r)) r))
  :pattern ((inv@47@01 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@45@01 Int)) (!
  (=>
    (and (<= 0 i@45@01) (< i@45@01 (Seq_length ys@34@01)))
    (not (= (Seq_index ys@34@01 i@45@01) $Ref.null)))
  :pattern ((Seq_index ys@34@01 i@45@01))
  :qid |f-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index ys@34@01 i@45@01) (Seq_index xs@33@01 i@38@01))
    (=
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))))
  
  :qid |quant-u-33|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; State saturation: after inhale
(set-option :timeout 20)
(check-sat)
; unknown
; [exec]
; inhale 10 < |xs| && |xs| == |ys|
(declare-const $t@49@01 $Snap)
(assert (= $t@49@01 ($Snap.combine ($Snap.first $t@49@01) ($Snap.second $t@49@01))))
(assert (= ($Snap.first $t@49@01) $Snap.unit))
; [eval] 10 < |xs|
; [eval] |xs|
(assert (< 10 (Seq_length xs@33@01)))
(assert (= ($Snap.second $t@49@01) $Snap.unit))
; [eval] |xs| == |ys|
; [eval] |xs|
; [eval] |ys|
(assert (= (Seq_length xs@33@01) (Seq_length ys@34@01)))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; assert fun02(xs, ys)
; [eval] fun02(xs, ys)
(set-option :timeout 0)
(push) ; 3
; [eval] (forall i: Int, j: Int ::i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==> xs[i] != xs[j])
(declare-const i@50@01 Int)
(declare-const j@51@01 Int)
(push) ; 4
; [eval] i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==> xs[i] != xs[j]
; [eval] i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j)))
; [eval] i >= 0
(push) ; 5
; [then-branch: 16 | !(i@50@01 >= 0) | live]
; [else-branch: 16 | i@50@01 >= 0 | live]
(push) ; 6
; [then-branch: 16 | !(i@50@01 >= 0)]
(assert (not (>= i@50@01 0)))
(pop) ; 6
(push) ; 6
; [else-branch: 16 | i@50@01 >= 0]
(assert (>= i@50@01 0))
; [eval] i < |xs|
; [eval] |xs|
(push) ; 7
; [then-branch: 17 | !(i@50@01 < |xs@33@01|) | live]
; [else-branch: 17 | i@50@01 < |xs@33@01| | live]
(push) ; 8
; [then-branch: 17 | !(i@50@01 < |xs@33@01|)]
(assert (not (< i@50@01 (Seq_length xs@33@01))))
(pop) ; 8
(push) ; 8
; [else-branch: 17 | i@50@01 < |xs@33@01|]
(assert (< i@50@01 (Seq_length xs@33@01)))
; [eval] j >= 0
(push) ; 9
; [then-branch: 18 | !(j@51@01 >= 0) | live]
; [else-branch: 18 | j@51@01 >= 0 | live]
(push) ; 10
; [then-branch: 18 | !(j@51@01 >= 0)]
(assert (not (>= j@51@01 0)))
(pop) ; 10
(push) ; 10
; [else-branch: 18 | j@51@01 >= 0]
(assert (>= j@51@01 0))
; [eval] j < |xs|
; [eval] |xs|
(push) ; 11
; [then-branch: 19 | !(j@51@01 < |xs@33@01|) | live]
; [else-branch: 19 | j@51@01 < |xs@33@01| | live]
(push) ; 12
; [then-branch: 19 | !(j@51@01 < |xs@33@01|)]
(assert (not (< j@51@01 (Seq_length xs@33@01))))
(pop) ; 12
(push) ; 12
; [else-branch: 19 | j@51@01 < |xs@33@01|]
(assert (< j@51@01 (Seq_length xs@33@01)))
; [eval] i != j
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or (< j@51@01 (Seq_length xs@33@01)) (not (< j@51@01 (Seq_length xs@33@01)))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@51@01 0)
  (and
    (>= j@51@01 0)
    (or
      (< j@51@01 (Seq_length xs@33@01))
      (not (< j@51@01 (Seq_length xs@33@01)))))))
(assert (or (>= j@51@01 0) (not (>= j@51@01 0))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i@50@01 (Seq_length xs@33@01))
  (and
    (< i@50@01 (Seq_length xs@33@01))
    (=>
      (>= j@51@01 0)
      (and
        (>= j@51@01 0)
        (or
          (< j@51@01 (Seq_length xs@33@01))
          (not (< j@51@01 (Seq_length xs@33@01))))))
    (or (>= j@51@01 0) (not (>= j@51@01 0))))))
(assert (or (< i@50@01 (Seq_length xs@33@01)) (not (< i@50@01 (Seq_length xs@33@01)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= i@50@01 0)
  (and
    (>= i@50@01 0)
    (=>
      (< i@50@01 (Seq_length xs@33@01))
      (and
        (< i@50@01 (Seq_length xs@33@01))
        (=>
          (>= j@51@01 0)
          (and
            (>= j@51@01 0)
            (or
              (< j@51@01 (Seq_length xs@33@01))
              (not (< j@51@01 (Seq_length xs@33@01))))))
        (or (>= j@51@01 0) (not (>= j@51@01 0)))))
    (or
      (< i@50@01 (Seq_length xs@33@01))
      (not (< i@50@01 (Seq_length xs@33@01)))))))
(assert (or (>= i@50@01 0) (not (>= i@50@01 0))))
(push) ; 5
; [then-branch: 20 | i@50@01 >= 0 && i@50@01 < |xs@33@01| && j@51@01 >= 0 && j@51@01 < |xs@33@01| && i@50@01 != j@51@01 | live]
; [else-branch: 20 | !(i@50@01 >= 0 && i@50@01 < |xs@33@01| && j@51@01 >= 0 && j@51@01 < |xs@33@01| && i@50@01 != j@51@01) | live]
(push) ; 6
; [then-branch: 20 | i@50@01 >= 0 && i@50@01 < |xs@33@01| && j@51@01 >= 0 && j@51@01 < |xs@33@01| && i@50@01 != j@51@01]
(assert (and
  (>= i@50@01 0)
  (and
    (< i@50@01 (Seq_length xs@33@01))
    (and
      (>= j@51@01 0)
      (and (< j@51@01 (Seq_length xs@33@01)) (not (= i@50@01 j@51@01)))))))
; [eval] xs[i] != xs[j]
; [eval] xs[i]
; [eval] xs[j]
(pop) ; 6
(push) ; 6
; [else-branch: 20 | !(i@50@01 >= 0 && i@50@01 < |xs@33@01| && j@51@01 >= 0 && j@51@01 < |xs@33@01| && i@50@01 != j@51@01)]
(assert (not
  (and
    (>= i@50@01 0)
    (and
      (< i@50@01 (Seq_length xs@33@01))
      (and
        (>= j@51@01 0)
        (and (< j@51@01 (Seq_length xs@33@01)) (not (= i@50@01 j@51@01))))))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (>= i@50@01 0)
    (and
      (< i@50@01 (Seq_length xs@33@01))
      (and
        (>= j@51@01 0)
        (and (< j@51@01 (Seq_length xs@33@01)) (not (= i@50@01 j@51@01))))))
  (and
    (>= i@50@01 0)
    (< i@50@01 (Seq_length xs@33@01))
    (>= j@51@01 0)
    (< j@51@01 (Seq_length xs@33@01))
    (not (= i@50@01 j@51@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= i@50@01 0)
      (and
        (< i@50@01 (Seq_length xs@33@01))
        (and
          (>= j@51@01 0)
          (and (< j@51@01 (Seq_length xs@33@01)) (not (= i@50@01 j@51@01)))))))
  (and
    (>= i@50@01 0)
    (and
      (< i@50@01 (Seq_length xs@33@01))
      (and
        (>= j@51@01 0)
        (and (< j@51@01 (Seq_length xs@33@01)) (not (= i@50@01 j@51@01))))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 4
(assert (not (forall ((i@50@01 Int) (j@51@01 Int)) (!
  (=>
    (and
      (>= i@50@01 0)
      (and
        (< i@50@01 (Seq_length xs@33@01))
        (and
          (>= j@51@01 0)
          (and (< j@51@01 (Seq_length xs@33@01)) (not (= i@50@01 j@51@01))))))
    (not (= (Seq_index xs@33@01 i@50@01) (Seq_index xs@33@01 j@51@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions2.vpr@26@12@26@106|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@50@01 Int) (j@51@01 Int)) (!
  (=>
    (and
      (>= i@50@01 0)
      (and
        (< i@50@01 (Seq_length xs@33@01))
        (and
          (>= j@51@01 0)
          (and (< j@51@01 (Seq_length xs@33@01)) (not (= i@50@01 j@51@01))))))
    (not (= (Seq_index xs@33@01 i@50@01) (Seq_index xs@33@01 j@51@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions2.vpr@26@12@26@106|)))
(declare-const i@52@01 Int)
(push) ; 4
; [eval] 0 <= i && i < |xs|
; [eval] 0 <= i
(push) ; 5
; [then-branch: 21 | !(0 <= i@52@01) | live]
; [else-branch: 21 | 0 <= i@52@01 | live]
(push) ; 6
; [then-branch: 21 | !(0 <= i@52@01)]
(assert (not (<= 0 i@52@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 21 | 0 <= i@52@01]
(assert (<= 0 i@52@01))
; [eval] i < |xs|
; [eval] |xs|
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@52@01) (not (<= 0 i@52@01))))
(assert (and (<= 0 i@52@01) (< i@52@01 (Seq_length xs@33@01))))
; [eval] xs[i]
(push) ; 5
(assert (not (>= i@52@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@53@01 ($Ref) Int)
(declare-fun img@54@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@52@01 Int)) (!
  (=>
    (and (<= 0 i@52@01) (< i@52@01 (Seq_length xs@33@01)))
    (or (<= 0 i@52@01) (not (<= 0 i@52@01))))
  :pattern ((Seq_index xs@33@01 i@52@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@52@01 Int) (i2@52@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@52@01) (< i1@52@01 (Seq_length xs@33@01)))
      (and (<= 0 i2@52@01) (< i2@52@01 (Seq_length xs@33@01)))
      (= (Seq_index xs@33@01 i1@52@01) (Seq_index xs@33@01 i2@52@01)))
    (= i1@52@01 i2@52@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@52@01 Int)) (!
  (=>
    (and (<= 0 i@52@01) (< i@52@01 (Seq_length xs@33@01)))
    (and
      (= (inv@53@01 (Seq_index xs@33@01 i@52@01)) i@52@01)
      (img@54@01 (Seq_index xs@33@01 i@52@01))))
  :pattern ((Seq_index xs@33@01 i@52@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@54@01 r)
      (and (<= 0 (inv@53@01 r)) (< (inv@53@01 r) (Seq_length xs@33@01))))
    (= (Seq_index xs@33@01 (inv@53@01 r)) r))
  :pattern ((inv@53@01 r))
  :qid |f-fctOfInv|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((i@52@01 Int)) (!
  (= (Seq_index xs@33@01 i@52@01) (Seq_index ys@34@01 i@52@01))
  
  :qid |quant-u-35|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@55@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@53@01 r)) (< (inv@53@01 r) (Seq_length xs@33@01)))
      (img@54@01 r)
      (= r (Seq_index xs@33@01 (inv@53@01 r))))
    ($Perm.min
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@56@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@53@01 r)) (< (inv@53@01 r) (Seq_length xs@33@01)))
      (img@54@01 r)
      (= r (Seq_index xs@33@01 (inv@53@01 r))))
    ($Perm.min
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@55@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
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
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@55@01 r))
    $Perm.No)
  
  :qid |quant-u-37|))))
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
      (and (<= 0 (inv@53@01 r)) (< (inv@53@01 r) (Seq_length xs@33@01)))
      (img@54@01 r)
      (= r (Seq_index xs@33@01 (inv@53@01 r))))
    (= (- $Perm.Write (pTaken@55@01 r)) $Perm.No))
  
  :qid |quant-u-38|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@57@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@57@01  $FVF<f>)))
      (and
        (and (<= 0 (inv@53@01 r)) (< (inv@53@01 r) (Seq_length xs@33@01)))
        (img@54@01 r)))
    (=>
      (and
        (and (<= 0 (inv@53@01 r)) (< (inv@53@01 r) (Seq_length xs@33@01)))
        (img@54@01 r))
      (Set_in r ($FVF.domain_f (as sm@57@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@57@01  $FVF<f>))))
  :qid |qp.fvfDomDef10|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@53@01 r)) (< (inv@53@01 r) (Seq_length xs@33@01)))
        (img@54@01 r))
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01)))))
    (= ($FVF.lookup_f (as sm@57@01  $FVF<f>) r) ($FVF.lookup_f $t@39@01 r)))
  :pattern (($FVF.lookup_f (as sm@57@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@39@01 r))
  :qid |qp.fvfValDef8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@53@01 r)) (< (inv@53@01 r) (Seq_length xs@33@01)))
        (img@54@01 r))
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01)))))
    (= ($FVF.lookup_f (as sm@57@01  $FVF<f>) r) ($FVF.lookup_f $t@46@01 r)))
  :pattern (($FVF.lookup_f (as sm@57@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@46@01 r))
  :qid |qp.fvfValDef9|)))
; [eval] (forall i: Int, j: Int ::i >= 0 && (i < |ys| && (j >= 0 && (j < |ys| && i != j))) ==> ys[i] != ys[j])
(declare-const i@58@01 Int)
(declare-const j@59@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] i >= 0 && (i < |ys| && (j >= 0 && (j < |ys| && i != j))) ==> ys[i] != ys[j]
; [eval] i >= 0 && (i < |ys| && (j >= 0 && (j < |ys| && i != j)))
; [eval] i >= 0
(push) ; 5
; [then-branch: 22 | !(i@58@01 >= 0) | live]
; [else-branch: 22 | i@58@01 >= 0 | live]
(push) ; 6
; [then-branch: 22 | !(i@58@01 >= 0)]
(assert (not (>= i@58@01 0)))
(pop) ; 6
(push) ; 6
; [else-branch: 22 | i@58@01 >= 0]
(assert (>= i@58@01 0))
; [eval] i < |ys|
; [eval] |ys|
(push) ; 7
; [then-branch: 23 | !(i@58@01 < |ys@34@01|) | live]
; [else-branch: 23 | i@58@01 < |ys@34@01| | live]
(push) ; 8
; [then-branch: 23 | !(i@58@01 < |ys@34@01|)]
(assert (not (< i@58@01 (Seq_length ys@34@01))))
(pop) ; 8
(push) ; 8
; [else-branch: 23 | i@58@01 < |ys@34@01|]
(assert (< i@58@01 (Seq_length ys@34@01)))
; [eval] j >= 0
(push) ; 9
; [then-branch: 24 | !(j@59@01 >= 0) | live]
; [else-branch: 24 | j@59@01 >= 0 | live]
(push) ; 10
; [then-branch: 24 | !(j@59@01 >= 0)]
(assert (not (>= j@59@01 0)))
(pop) ; 10
(push) ; 10
; [else-branch: 24 | j@59@01 >= 0]
(assert (>= j@59@01 0))
; [eval] j < |ys|
; [eval] |ys|
(push) ; 11
; [then-branch: 25 | !(j@59@01 < |ys@34@01|) | live]
; [else-branch: 25 | j@59@01 < |ys@34@01| | live]
(push) ; 12
; [then-branch: 25 | !(j@59@01 < |ys@34@01|)]
(assert (not (< j@59@01 (Seq_length ys@34@01))))
(pop) ; 12
(push) ; 12
; [else-branch: 25 | j@59@01 < |ys@34@01|]
(assert (< j@59@01 (Seq_length ys@34@01)))
; [eval] i != j
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or (< j@59@01 (Seq_length ys@34@01)) (not (< j@59@01 (Seq_length ys@34@01)))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@59@01 0)
  (and
    (>= j@59@01 0)
    (or
      (< j@59@01 (Seq_length ys@34@01))
      (not (< j@59@01 (Seq_length ys@34@01)))))))
(assert (or (>= j@59@01 0) (not (>= j@59@01 0))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i@58@01 (Seq_length ys@34@01))
  (and
    (< i@58@01 (Seq_length ys@34@01))
    (=>
      (>= j@59@01 0)
      (and
        (>= j@59@01 0)
        (or
          (< j@59@01 (Seq_length ys@34@01))
          (not (< j@59@01 (Seq_length ys@34@01))))))
    (or (>= j@59@01 0) (not (>= j@59@01 0))))))
(assert (or (< i@58@01 (Seq_length ys@34@01)) (not (< i@58@01 (Seq_length ys@34@01)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= i@58@01 0)
  (and
    (>= i@58@01 0)
    (=>
      (< i@58@01 (Seq_length ys@34@01))
      (and
        (< i@58@01 (Seq_length ys@34@01))
        (=>
          (>= j@59@01 0)
          (and
            (>= j@59@01 0)
            (or
              (< j@59@01 (Seq_length ys@34@01))
              (not (< j@59@01 (Seq_length ys@34@01))))))
        (or (>= j@59@01 0) (not (>= j@59@01 0)))))
    (or
      (< i@58@01 (Seq_length ys@34@01))
      (not (< i@58@01 (Seq_length ys@34@01)))))))
(assert (or (>= i@58@01 0) (not (>= i@58@01 0))))
(push) ; 5
; [then-branch: 26 | i@58@01 >= 0 && i@58@01 < |ys@34@01| && j@59@01 >= 0 && j@59@01 < |ys@34@01| && i@58@01 != j@59@01 | live]
; [else-branch: 26 | !(i@58@01 >= 0 && i@58@01 < |ys@34@01| && j@59@01 >= 0 && j@59@01 < |ys@34@01| && i@58@01 != j@59@01) | live]
(push) ; 6
; [then-branch: 26 | i@58@01 >= 0 && i@58@01 < |ys@34@01| && j@59@01 >= 0 && j@59@01 < |ys@34@01| && i@58@01 != j@59@01]
(assert (and
  (>= i@58@01 0)
  (and
    (< i@58@01 (Seq_length ys@34@01))
    (and
      (>= j@59@01 0)
      (and (< j@59@01 (Seq_length ys@34@01)) (not (= i@58@01 j@59@01)))))))
; [eval] ys[i] != ys[j]
; [eval] ys[i]
; [eval] ys[j]
(pop) ; 6
(push) ; 6
; [else-branch: 26 | !(i@58@01 >= 0 && i@58@01 < |ys@34@01| && j@59@01 >= 0 && j@59@01 < |ys@34@01| && i@58@01 != j@59@01)]
(assert (not
  (and
    (>= i@58@01 0)
    (and
      (< i@58@01 (Seq_length ys@34@01))
      (and
        (>= j@59@01 0)
        (and (< j@59@01 (Seq_length ys@34@01)) (not (= i@58@01 j@59@01))))))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (>= i@58@01 0)
    (and
      (< i@58@01 (Seq_length ys@34@01))
      (and
        (>= j@59@01 0)
        (and (< j@59@01 (Seq_length ys@34@01)) (not (= i@58@01 j@59@01))))))
  (and
    (>= i@58@01 0)
    (< i@58@01 (Seq_length ys@34@01))
    (>= j@59@01 0)
    (< j@59@01 (Seq_length ys@34@01))
    (not (= i@58@01 j@59@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= i@58@01 0)
      (and
        (< i@58@01 (Seq_length ys@34@01))
        (and
          (>= j@59@01 0)
          (and (< j@59@01 (Seq_length ys@34@01)) (not (= i@58@01 j@59@01)))))))
  (and
    (>= i@58@01 0)
    (and
      (< i@58@01 (Seq_length ys@34@01))
      (and
        (>= j@59@01 0)
        (and (< j@59@01 (Seq_length ys@34@01)) (not (= i@58@01 j@59@01))))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(push) ; 4
(assert (not (forall ((i@58@01 Int) (j@59@01 Int)) (!
  (=>
    (and
      (>= i@58@01 0)
      (and
        (< i@58@01 (Seq_length ys@34@01))
        (and
          (>= j@59@01 0)
          (and (< j@59@01 (Seq_length ys@34@01)) (not (= i@58@01 j@59@01))))))
    (not (= (Seq_index ys@34@01 i@58@01) (Seq_index ys@34@01 j@59@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions2.vpr@28@12@28@106|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@58@01 Int) (j@59@01 Int)) (!
  (=>
    (and
      (>= i@58@01 0)
      (and
        (< i@58@01 (Seq_length ys@34@01))
        (and
          (>= j@59@01 0)
          (and (< j@59@01 (Seq_length ys@34@01)) (not (= i@58@01 j@59@01))))))
    (not (= (Seq_index ys@34@01 i@58@01) (Seq_index ys@34@01 j@59@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions2.vpr@28@12@28@106|)))
(declare-const i@60@01 Int)
(push) ; 4
; [eval] 0 <= i && i < |ys|
; [eval] 0 <= i
(push) ; 5
; [then-branch: 27 | !(0 <= i@60@01) | live]
; [else-branch: 27 | 0 <= i@60@01 | live]
(push) ; 6
; [then-branch: 27 | !(0 <= i@60@01)]
(assert (not (<= 0 i@60@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 27 | 0 <= i@60@01]
(assert (<= 0 i@60@01))
; [eval] i < |ys|
; [eval] |ys|
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@60@01) (not (<= 0 i@60@01))))
(assert (and (<= 0 i@60@01) (< i@60@01 (Seq_length ys@34@01))))
; [eval] ys[i]
(push) ; 5
(assert (not (>= i@60@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@61@01 ($Ref) Int)
(declare-fun img@62@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@60@01 Int)) (!
  (=>
    (and (<= 0 i@60@01) (< i@60@01 (Seq_length ys@34@01)))
    (or (<= 0 i@60@01) (not (<= 0 i@60@01))))
  :pattern ((Seq_index ys@34@01 i@60@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@60@01 Int) (i2@60@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@60@01) (< i1@60@01 (Seq_length ys@34@01)))
      (and (<= 0 i2@60@01) (< i2@60@01 (Seq_length ys@34@01)))
      (= (Seq_index ys@34@01 i1@60@01) (Seq_index ys@34@01 i2@60@01)))
    (= i1@60@01 i2@60@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@60@01 Int)) (!
  (=>
    (and (<= 0 i@60@01) (< i@60@01 (Seq_length ys@34@01)))
    (and
      (= (inv@61@01 (Seq_index ys@34@01 i@60@01)) i@60@01)
      (img@62@01 (Seq_index ys@34@01 i@60@01))))
  :pattern ((Seq_index ys@34@01 i@60@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@62@01 r)
      (and (<= 0 (inv@61@01 r)) (< (inv@61@01 r) (Seq_length ys@34@01))))
    (= (Seq_index ys@34@01 (inv@61@01 r)) r))
  :pattern ((inv@61@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@63@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@61@01 r)) (< (inv@61@01 r) (Seq_length ys@34@01)))
      (img@62@01 r)
      (= r (Seq_index ys@34@01 (inv@61@01 r))))
    ($Perm.min
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
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
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@63@01 r))
    $Perm.No)
  
  :qid |quant-u-41|))))
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
      (and (<= 0 (inv@61@01 r)) (< (inv@61@01 r) (Seq_length ys@34@01)))
      (img@62@01 r)
      (= r (Seq_index ys@34@01 (inv@61@01 r))))
    (= (- $Perm.Write (pTaken@63@01 r)) $Perm.No))
  
  :qid |quant-u-42|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@64@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@64@01  $FVF<f>)))
      (and
        (and (<= 0 (inv@61@01 r)) (< (inv@61@01 r) (Seq_length ys@34@01)))
        (img@62@01 r)))
    (=>
      (and
        (and (<= 0 (inv@61@01 r)) (< (inv@61@01 r) (Seq_length ys@34@01)))
        (img@62@01 r))
      (Set_in r ($FVF.domain_f (as sm@64@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@64@01  $FVF<f>))))
  :qid |qp.fvfDomDef12|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@61@01 r)) (< (inv@61@01 r) (Seq_length ys@34@01)))
        (img@62@01 r))
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01)))))
    (= ($FVF.lookup_f (as sm@64@01  $FVF<f>) r) ($FVF.lookup_f $t@46@01 r)))
  :pattern (($FVF.lookup_f (as sm@64@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@46@01 r))
  :qid |qp.fvfValDef11|)))
; [eval] 10 < |xs|
; [eval] |xs|
; [eval] |xs| == |ys|
; [eval] |xs|
; [eval] |ys|
(assert (fun02%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$FVF<f>To$Snap (as sm@57@01  $FVF<f>))
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$FVF<f>To$Snap (as sm@64@01  $FVF<f>))
        ($Snap.combine $Snap.unit $Snap.unit))))) xs@33@01 ys@34@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((i@52@01 Int)) (!
  (=>
    (and (<= 0 i@52@01) (< i@52@01 (Seq_length xs@33@01)))
    (and
      (= (inv@53@01 (Seq_index xs@33@01 i@52@01)) i@52@01)
      (img@54@01 (Seq_index xs@33@01 i@52@01))))
  :pattern ((Seq_index xs@33@01 i@52@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@54@01 r)
      (and (<= 0 (inv@53@01 r)) (< (inv@53@01 r) (Seq_length xs@33@01))))
    (= (Seq_index xs@33@01 (inv@53@01 r)) r))
  :pattern ((inv@53@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@57@01  $FVF<f>)))
      (and
        (and (<= 0 (inv@53@01 r)) (< (inv@53@01 r) (Seq_length xs@33@01)))
        (img@54@01 r)))
    (=>
      (and
        (and (<= 0 (inv@53@01 r)) (< (inv@53@01 r) (Seq_length xs@33@01)))
        (img@54@01 r))
      (Set_in r ($FVF.domain_f (as sm@57@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@57@01  $FVF<f>))))
  :qid |qp.fvfDomDef10|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@53@01 r)) (< (inv@53@01 r) (Seq_length xs@33@01)))
        (img@54@01 r))
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01)))))
    (= ($FVF.lookup_f (as sm@57@01  $FVF<f>) r) ($FVF.lookup_f $t@39@01 r)))
  :pattern (($FVF.lookup_f (as sm@57@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@39@01 r))
  :qid |qp.fvfValDef8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@53@01 r)) (< (inv@53@01 r) (Seq_length xs@33@01)))
        (img@54@01 r))
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01)))))
    (= ($FVF.lookup_f (as sm@57@01  $FVF<f>) r) ($FVF.lookup_f $t@46@01 r)))
  :pattern (($FVF.lookup_f (as sm@57@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@46@01 r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((i@60@01 Int)) (!
  (=>
    (and (<= 0 i@60@01) (< i@60@01 (Seq_length ys@34@01)))
    (and
      (= (inv@61@01 (Seq_index ys@34@01 i@60@01)) i@60@01)
      (img@62@01 (Seq_index ys@34@01 i@60@01))))
  :pattern ((Seq_index ys@34@01 i@60@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@62@01 r)
      (and (<= 0 (inv@61@01 r)) (< (inv@61@01 r) (Seq_length ys@34@01))))
    (= (Seq_index ys@34@01 (inv@61@01 r)) r))
  :pattern ((inv@61@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@64@01  $FVF<f>)))
      (and
        (and (<= 0 (inv@61@01 r)) (< (inv@61@01 r) (Seq_length ys@34@01)))
        (img@62@01 r)))
    (=>
      (and
        (and (<= 0 (inv@61@01 r)) (< (inv@61@01 r) (Seq_length ys@34@01)))
        (img@62@01 r))
      (Set_in r ($FVF.domain_f (as sm@64@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@64@01  $FVF<f>))))
  :qid |qp.fvfDomDef12|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@61@01 r)) (< (inv@61@01 r) (Seq_length ys@34@01)))
        (img@62@01 r))
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01)))))
    (= ($FVF.lookup_f (as sm@64@01  $FVF<f>) r) ($FVF.lookup_f $t@46@01 r)))
  :pattern (($FVF.lookup_f (as sm@64@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@46@01 r))
  :qid |qp.fvfValDef11|)))
(assert (and
  (forall ((i@50@01 Int) (j@51@01 Int)) (!
    (=>
      (and
        (>= i@50@01 0)
        (and
          (< i@50@01 (Seq_length xs@33@01))
          (and
            (>= j@51@01 0)
            (and (< j@51@01 (Seq_length xs@33@01)) (not (= i@50@01 j@51@01))))))
      (not (= (Seq_index xs@33@01 i@50@01) (Seq_index xs@33@01 j@51@01))))
    
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions2.vpr@26@12@26@106|))
  (forall ((i@52@01 Int)) (!
    (=>
      (and (<= 0 i@52@01) (< i@52@01 (Seq_length xs@33@01)))
      (or (<= 0 i@52@01) (not (<= 0 i@52@01))))
    :pattern ((Seq_index xs@33@01 i@52@01))
    :qid |f-aux|))
  (forall ((i@58@01 Int) (j@59@01 Int)) (!
    (=>
      (and
        (>= i@58@01 0)
        (and
          (< i@58@01 (Seq_length ys@34@01))
          (and
            (>= j@59@01 0)
            (and (< j@59@01 (Seq_length ys@34@01)) (not (= i@58@01 j@59@01))))))
      (not (= (Seq_index ys@34@01 i@58@01) (Seq_index ys@34@01 j@59@01))))
    
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions2.vpr@28@12@28@106|))
  (forall ((i@60@01 Int)) (!
    (=>
      (and (<= 0 i@60@01) (< i@60@01 (Seq_length ys@34@01)))
      (or (<= 0 i@60@01) (not (<= 0 i@60@01))))
    :pattern ((Seq_index ys@34@01 i@60@01))
    :qid |f-aux|))
  (fun02%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<f>To$Snap (as sm@57@01  $FVF<f>))
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$FVF<f>To$Snap (as sm@64@01  $FVF<f>))
          ($Snap.combine $Snap.unit $Snap.unit))))) xs@33@01 ys@34@01)))
(set-option :timeout 0)
(push) ; 3
(assert (not (fun02 ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$FVF<f>To$Snap (as sm@57@01  $FVF<f>))
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$FVF<f>To$Snap (as sm@64@01  $FVF<f>))
        ($Snap.combine $Snap.unit $Snap.unit))))) xs@33@01 ys@34@01)))
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
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@33@01 i@38@01) (Seq_index ys@34@01 i@45@01))
    (=
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))))
  
  :qid |quant-u-43|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const sm@65@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@41@01 r)
      (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
    (= ($FVF.lookup_f (as sm@65@01  $FVF<f>) r) ($FVF.lookup_f $t@39@01 r)))
  :pattern (($FVF.lookup_f (as sm@65@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@39@01 r))
  :qid |qp.fvfValDef13|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@48@01 r)
      (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
    (= ($FVF.lookup_f (as sm@65@01  $FVF<f>) r) ($FVF.lookup_f $t@46@01 r)))
  :pattern (($FVF.lookup_f (as sm@65@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@46@01 r))
  :qid |qp.fvfValDef14|)))
(declare-const pm@66@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@66@01  $FPM) r)
    (+
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@66@01  $FPM) r))
  :qid |qp.resPrmSumDef15|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@66@01  $FPM) r) $Perm.Write)
  :pattern ((inv@40@01 r))
  :qid |qp-fld-prm-bnd|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@66@01  $FPM) r) $Perm.Write)
  :pattern ((inv@47@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] fun02(xs, ys)
(set-option :timeout 0)
(push) ; 3
; [eval] (forall i: Int, j: Int ::i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==> xs[i] != xs[j])
(declare-const i@67@01 Int)
(declare-const j@68@01 Int)
(push) ; 4
; [eval] i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==> xs[i] != xs[j]
; [eval] i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j)))
; [eval] i >= 0
(push) ; 5
; [then-branch: 28 | !(i@67@01 >= 0) | live]
; [else-branch: 28 | i@67@01 >= 0 | live]
(push) ; 6
; [then-branch: 28 | !(i@67@01 >= 0)]
(assert (not (>= i@67@01 0)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index ys@34@01 i@45@01) (Seq_index xs@33@01 i@38@01))
    (=
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))))
  
  :qid |quant-u-44|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(declare-const sm@69@01 $FVF<f>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@48@01 r)
      (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
    (= ($FVF.lookup_f (as sm@69@01  $FVF<f>) r) ($FVF.lookup_f $t@46@01 r)))
  :pattern (($FVF.lookup_f (as sm@69@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@46@01 r))
  :qid |qp.fvfValDef16|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@41@01 r)
      (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
    (= ($FVF.lookup_f (as sm@69@01  $FVF<f>) r) ($FVF.lookup_f $t@39@01 r)))
  :pattern (($FVF.lookup_f (as sm@69@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@39@01 r))
  :qid |qp.fvfValDef17|)))
(declare-const pm@70@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@70@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@70@01  $FPM) r))
  :qid |qp.resPrmSumDef18|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@70@01  $FPM) r) $Perm.Write)
  :pattern ((inv@47@01 r))
  :qid |qp-fld-prm-bnd|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@70@01  $FPM) r) $Perm.Write)
  :pattern ((inv@40@01 r))
  :qid |qp-fld-prm-bnd|)))
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 28 | i@67@01 >= 0]
(assert (>= i@67@01 0))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index ys@34@01 i@45@01) (Seq_index xs@33@01 i@38@01))
    (=
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))))
  
  :qid |quant-u-45|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(declare-const sm@71@01 $FVF<f>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@48@01 r)
      (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
    (= ($FVF.lookup_f (as sm@71@01  $FVF<f>) r) ($FVF.lookup_f $t@46@01 r)))
  :pattern (($FVF.lookup_f (as sm@71@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@46@01 r))
  :qid |qp.fvfValDef19|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@41@01 r)
      (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
    (= ($FVF.lookup_f (as sm@71@01  $FVF<f>) r) ($FVF.lookup_f $t@39@01 r)))
  :pattern (($FVF.lookup_f (as sm@71@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@39@01 r))
  :qid |qp.fvfValDef20|)))
(declare-const pm@72@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@72@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@72@01  $FPM) r))
  :qid |qp.resPrmSumDef21|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@72@01  $FPM) r) $Perm.Write)
  :pattern ((inv@47@01 r))
  :qid |qp-fld-prm-bnd|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@72@01  $FPM) r) $Perm.Write)
  :pattern ((inv@40@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] i < |xs|
; [eval] |xs|
(set-option :timeout 0)
(push) ; 7
; [then-branch: 29 | !(i@67@01 < |xs@33@01|) | live]
; [else-branch: 29 | i@67@01 < |xs@33@01| | live]
(push) ; 8
; [then-branch: 29 | !(i@67@01 < |xs@33@01|)]
(assert (not (< i@67@01 (Seq_length xs@33@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@33@01 i@38@01) (Seq_index ys@34@01 i@45@01))
    (=
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))))
  
  :qid |quant-u-46|))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; Assume upper permission bound for field f
(pop) ; 8
(set-option :timeout 0)
(push) ; 8
; [else-branch: 29 | i@67@01 < |xs@33@01|]
(assert (< i@67@01 (Seq_length xs@33@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@33@01 i@38@01) (Seq_index ys@34@01 i@45@01))
    (=
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))))
  
  :qid |quant-u-47|))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; Assume upper permission bound for field f
; [eval] j >= 0
(set-option :timeout 0)
(push) ; 9
; [then-branch: 30 | !(j@68@01 >= 0) | live]
; [else-branch: 30 | j@68@01 >= 0 | live]
(push) ; 10
; [then-branch: 30 | !(j@68@01 >= 0)]
(assert (not (>= j@68@01 0)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index ys@34@01 i@45@01) (Seq_index xs@33@01 i@38@01))
    (=
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))))
  
  :qid |quant-u-48|))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; Assume upper permission bound for field f
(pop) ; 10
(set-option :timeout 0)
(push) ; 10
; [else-branch: 30 | j@68@01 >= 0]
(assert (>= j@68@01 0))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index ys@34@01 i@45@01) (Seq_index xs@33@01 i@38@01))
    (=
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))))
  
  :qid |quant-u-49|))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; Assume upper permission bound for field f
; [eval] j < |xs|
; [eval] |xs|
(set-option :timeout 0)
(push) ; 11
; [then-branch: 31 | !(j@68@01 < |xs@33@01|) | live]
; [else-branch: 31 | j@68@01 < |xs@33@01| | live]
(push) ; 12
; [then-branch: 31 | !(j@68@01 < |xs@33@01|)]
(assert (not (< j@68@01 (Seq_length xs@33@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@33@01 i@38@01) (Seq_index ys@34@01 i@45@01))
    (=
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))))
  
  :qid |quant-u-50|))))
(check-sat)
; unknown
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; Assume upper permission bound for field f
(pop) ; 12
(set-option :timeout 0)
(push) ; 12
; [else-branch: 31 | j@68@01 < |xs@33@01|]
(assert (< j@68@01 (Seq_length xs@33@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@33@01 i@38@01) (Seq_index ys@34@01 i@45@01))
    (=
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))))
  
  :qid |quant-u-51|))))
(check-sat)
; unknown
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; Assume upper permission bound for field f
; [eval] i != j
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or (< j@68@01 (Seq_length xs@33@01)) (not (< j@68@01 (Seq_length xs@33@01)))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@68@01 0)
  (and
    (>= j@68@01 0)
    (or
      (< j@68@01 (Seq_length xs@33@01))
      (not (< j@68@01 (Seq_length xs@33@01)))))))
(assert (or (>= j@68@01 0) (not (>= j@68@01 0))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i@67@01 (Seq_length xs@33@01))
  (and
    (< i@67@01 (Seq_length xs@33@01))
    (=>
      (>= j@68@01 0)
      (and
        (>= j@68@01 0)
        (or
          (< j@68@01 (Seq_length xs@33@01))
          (not (< j@68@01 (Seq_length xs@33@01))))))
    (or (>= j@68@01 0) (not (>= j@68@01 0))))))
(assert (or (< i@67@01 (Seq_length xs@33@01)) (not (< i@67@01 (Seq_length xs@33@01)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@48@01 r)
      (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
    (= ($FVF.lookup_f (as sm@69@01  $FVF<f>) r) ($FVF.lookup_f $t@46@01 r)))
  :pattern (($FVF.lookup_f (as sm@69@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@46@01 r))
  :qid |qp.fvfValDef16|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@41@01 r)
      (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
    (= ($FVF.lookup_f (as sm@69@01  $FVF<f>) r) ($FVF.lookup_f $t@39@01 r)))
  :pattern (($FVF.lookup_f (as sm@69@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@39@01 r))
  :qid |qp.fvfValDef17|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@70@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@70@01  $FPM) r))
  :qid |qp.resPrmSumDef18|)))
(assert (=>
  (not (>= i@67@01 0))
  (and
    (not (>= i@67@01 0))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@70@01  $FPM) r) $Perm.Write)
      :pattern ((inv@47@01 r))
      :qid |qp-fld-prm-bnd|))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@70@01  $FPM) r) $Perm.Write)
      :pattern ((inv@40@01 r))
      :qid |qp-fld-prm-bnd|)))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@48@01 r)
      (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
    (= ($FVF.lookup_f (as sm@71@01  $FVF<f>) r) ($FVF.lookup_f $t@46@01 r)))
  :pattern (($FVF.lookup_f (as sm@71@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@46@01 r))
  :qid |qp.fvfValDef19|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@41@01 r)
      (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
    (= ($FVF.lookup_f (as sm@71@01  $FVF<f>) r) ($FVF.lookup_f $t@39@01 r)))
  :pattern (($FVF.lookup_f (as sm@71@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@39@01 r))
  :qid |qp.fvfValDef20|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@72@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@72@01  $FPM) r))
  :qid |qp.resPrmSumDef21|)))
(assert (=>
  (>= i@67@01 0)
  (and
    (>= i@67@01 0)
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@72@01  $FPM) r) $Perm.Write)
      :pattern ((inv@47@01 r))
      :qid |qp-fld-prm-bnd|))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@72@01  $FPM) r) $Perm.Write)
      :pattern ((inv@40@01 r))
      :qid |qp-fld-prm-bnd|))
    (=>
      (< i@67@01 (Seq_length xs@33@01))
      (and
        (< i@67@01 (Seq_length xs@33@01))
        (=>
          (>= j@68@01 0)
          (and
            (>= j@68@01 0)
            (or
              (< j@68@01 (Seq_length xs@33@01))
              (not (< j@68@01 (Seq_length xs@33@01))))))
        (or (>= j@68@01 0) (not (>= j@68@01 0)))))
    (or
      (< i@67@01 (Seq_length xs@33@01))
      (not (< i@67@01 (Seq_length xs@33@01)))))))
(assert (or (>= i@67@01 0) (not (>= i@67@01 0))))
(set-option :timeout 0)
(push) ; 5
; [then-branch: 32 | i@67@01 >= 0 && i@67@01 < |xs@33@01| && j@68@01 >= 0 && j@68@01 < |xs@33@01| && i@67@01 != j@68@01 | live]
; [else-branch: 32 | !(i@67@01 >= 0 && i@67@01 < |xs@33@01| && j@68@01 >= 0 && j@68@01 < |xs@33@01| && i@67@01 != j@68@01) | live]
(push) ; 6
; [then-branch: 32 | i@67@01 >= 0 && i@67@01 < |xs@33@01| && j@68@01 >= 0 && j@68@01 < |xs@33@01| && i@67@01 != j@68@01]
(assert (and
  (>= i@67@01 0)
  (and
    (< i@67@01 (Seq_length xs@33@01))
    (and
      (>= j@68@01 0)
      (and (< j@68@01 (Seq_length xs@33@01)) (not (= i@67@01 j@68@01)))))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index ys@34@01 i@45@01) (Seq_index xs@33@01 i@38@01))
    (=
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))))
  
  :qid |quant-u-52|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@72@01  $FPM) r) $Perm.Write)
  :pattern ((inv@47@01 r))
  :qid |qp-fld-prm-bnd|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@72@01  $FPM) r) $Perm.Write)
  :pattern ((inv@40@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] xs[i] != xs[j]
; [eval] xs[i]
; [eval] xs[j]
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 32 | !(i@67@01 >= 0 && i@67@01 < |xs@33@01| && j@68@01 >= 0 && j@68@01 < |xs@33@01| && i@67@01 != j@68@01)]
(assert (not
  (and
    (>= i@67@01 0)
    (and
      (< i@67@01 (Seq_length xs@33@01))
      (and
        (>= j@68@01 0)
        (and (< j@68@01 (Seq_length xs@33@01)) (not (= i@67@01 j@68@01))))))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index ys@34@01 i@45@01) (Seq_index xs@33@01 i@38@01))
    (=
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))))
  
  :qid |quant-u-53|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@72@01  $FPM) r) $Perm.Write)
  :pattern ((inv@47@01 r))
  :qid |qp-fld-prm-bnd|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@72@01  $FPM) r) $Perm.Write)
  :pattern ((inv@40@01 r))
  :qid |qp-fld-prm-bnd|)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (>= i@67@01 0)
    (and
      (< i@67@01 (Seq_length xs@33@01))
      (and
        (>= j@68@01 0)
        (and (< j@68@01 (Seq_length xs@33@01)) (not (= i@67@01 j@68@01))))))
  (and
    (>= i@67@01 0)
    (< i@67@01 (Seq_length xs@33@01))
    (>= j@68@01 0)
    (< j@68@01 (Seq_length xs@33@01))
    (not (= i@67@01 j@68@01))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@72@01  $FPM) r) $Perm.Write)
      :pattern ((inv@47@01 r))
      :qid |qp-fld-prm-bnd|))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@72@01  $FPM) r) $Perm.Write)
      :pattern ((inv@40@01 r))
      :qid |qp-fld-prm-bnd|)))))
; Joined path conditions
(assert (=>
  (not
    (and
      (>= i@67@01 0)
      (and
        (< i@67@01 (Seq_length xs@33@01))
        (and
          (>= j@68@01 0)
          (and (< j@68@01 (Seq_length xs@33@01)) (not (= i@67@01 j@68@01)))))))
  (and
    (not
      (and
        (>= i@67@01 0)
        (and
          (< i@67@01 (Seq_length xs@33@01))
          (and
            (>= j@68@01 0)
            (and (< j@68@01 (Seq_length xs@33@01)) (not (= i@67@01 j@68@01)))))))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@72@01  $FPM) r) $Perm.Write)
      :pattern ((inv@47@01 r))
      :qid |qp-fld-prm-bnd|))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@72@01  $FPM) r) $Perm.Write)
      :pattern ((inv@40@01 r))
      :qid |qp-fld-prm-bnd|)))))
(assert (or
  (not
    (and
      (>= i@67@01 0)
      (and
        (< i@67@01 (Seq_length xs@33@01))
        (and
          (>= j@68@01 0)
          (and (< j@68@01 (Seq_length xs@33@01)) (not (= i@67@01 j@68@01)))))))
  (and
    (>= i@67@01 0)
    (and
      (< i@67@01 (Seq_length xs@33@01))
      (and
        (>= j@68@01 0)
        (and (< j@68@01 (Seq_length xs@33@01)) (not (= i@67@01 j@68@01))))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@48@01 r)
      (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
    (= ($FVF.lookup_f (as sm@69@01  $FVF<f>) r) ($FVF.lookup_f $t@46@01 r)))
  :pattern (($FVF.lookup_f (as sm@69@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@46@01 r))
  :qid |qp.fvfValDef16|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@41@01 r)
      (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
    (= ($FVF.lookup_f (as sm@69@01  $FVF<f>) r) ($FVF.lookup_f $t@39@01 r)))
  :pattern (($FVF.lookup_f (as sm@69@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@39@01 r))
  :qid |qp.fvfValDef17|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@70@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@70@01  $FPM) r))
  :qid |qp.resPrmSumDef18|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@48@01 r)
      (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
    (= ($FVF.lookup_f (as sm@71@01  $FVF<f>) r) ($FVF.lookup_f $t@46@01 r)))
  :pattern (($FVF.lookup_f (as sm@71@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@46@01 r))
  :qid |qp.fvfValDef19|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@41@01 r)
      (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
    (= ($FVF.lookup_f (as sm@71@01  $FVF<f>) r) ($FVF.lookup_f $t@39@01 r)))
  :pattern (($FVF.lookup_f (as sm@71@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@39@01 r))
  :qid |qp.fvfValDef20|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@72@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@72@01  $FPM) r))
  :qid |qp.resPrmSumDef21|)))
; Nested auxiliary terms: non-globals (aux)
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((i@67@01 Int) (j@68@01 Int)) (!
  (=>
    (and
      (>= i@67@01 0)
      (and
        (< i@67@01 (Seq_length xs@33@01))
        (and
          (>= j@68@01 0)
          (and (< j@68@01 (Seq_length xs@33@01)) (not (= i@67@01 j@68@01))))))
    (not (= (Seq_index xs@33@01 i@67@01) (Seq_index xs@33@01 j@68@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions2.vpr@26@12@26@106|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@67@01 Int) (j@68@01 Int)) (!
  (=>
    (and
      (>= i@67@01 0)
      (and
        (< i@67@01 (Seq_length xs@33@01))
        (and
          (>= j@68@01 0)
          (and (< j@68@01 (Seq_length xs@33@01)) (not (= i@67@01 j@68@01))))))
    (not (= (Seq_index xs@33@01 i@67@01) (Seq_index xs@33@01 j@68@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions2.vpr@26@12@26@106|)))
(declare-const i@73@01 Int)
(push) ; 4
; [eval] 0 <= i && i < |xs|
; [eval] 0 <= i
(push) ; 5
; [then-branch: 33 | !(0 <= i@73@01) | live]
; [else-branch: 33 | 0 <= i@73@01 | live]
(push) ; 6
; [then-branch: 33 | !(0 <= i@73@01)]
(assert (not (<= 0 i@73@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index ys@34@01 i@45@01) (Seq_index xs@33@01 i@38@01))
    (=
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))))
  
  :qid |quant-u-54|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(declare-const pm@74@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@74@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@74@01  $FPM) r))
  :qid |qp.resPrmSumDef22|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@74@01  $FPM) r) $Perm.Write)
  :pattern ((inv@47@01 r))
  :qid |qp-fld-prm-bnd|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@74@01  $FPM) r) $Perm.Write)
  :pattern ((inv@40@01 r))
  :qid |qp-fld-prm-bnd|)))
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 33 | 0 <= i@73@01]
(assert (<= 0 i@73@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index ys@34@01 i@45@01) (Seq_index xs@33@01 i@38@01))
    (=
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))))
  
  :qid |quant-u-55|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(declare-const pm@75@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@75@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@75@01  $FPM) r))
  :qid |qp.resPrmSumDef23|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@75@01  $FPM) r) $Perm.Write)
  :pattern ((inv@47@01 r))
  :qid |qp-fld-prm-bnd|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@75@01  $FPM) r) $Perm.Write)
  :pattern ((inv@40@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] i < |xs|
; [eval] |xs|
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@74@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@74@01  $FPM) r))
  :qid |qp.resPrmSumDef22|)))
(assert (=>
  (not (<= 0 i@73@01))
  (and
    (not (<= 0 i@73@01))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@74@01  $FPM) r) $Perm.Write)
      :pattern ((inv@47@01 r))
      :qid |qp-fld-prm-bnd|))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@74@01  $FPM) r) $Perm.Write)
      :pattern ((inv@40@01 r))
      :qid |qp-fld-prm-bnd|)))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@75@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@75@01  $FPM) r))
  :qid |qp.resPrmSumDef23|)))
(assert (=>
  (<= 0 i@73@01)
  (and
    (<= 0 i@73@01)
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@75@01  $FPM) r) $Perm.Write)
      :pattern ((inv@47@01 r))
      :qid |qp-fld-prm-bnd|))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@75@01  $FPM) r) $Perm.Write)
      :pattern ((inv@40@01 r))
      :qid |qp-fld-prm-bnd|)))))
(assert (or (<= 0 i@73@01) (not (<= 0 i@73@01))))
(assert (and (<= 0 i@73@01) (< i@73@01 (Seq_length xs@33@01))))
; [eval] xs[i]
(set-option :timeout 0)
(push) ; 5
(assert (not (>= i@73@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@76@01 ($Ref) Int)
(declare-fun img@77@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@74@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@74@01  $FPM) r))
  :qid |qp.resPrmSumDef22|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@75@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@75@01  $FPM) r))
  :qid |qp.resPrmSumDef23|)))
; Nested auxiliary terms: non-globals
(assert (forall ((i@73@01 Int)) (!
  (=>
    (and (<= 0 i@73@01) (< i@73@01 (Seq_length xs@33@01)))
    (and
      (=>
        (not (<= 0 i@73@01))
        (and
          (not (<= 0 i@73@01))
          (forall ((r $Ref)) (!
            (<= ($FVF.perm_f (as pm@74@01  $FPM) r) $Perm.Write)
            :pattern ((inv@47@01 r))
            :qid |qp-fld-prm-bnd|))
          (forall ((r $Ref)) (!
            (<= ($FVF.perm_f (as pm@74@01  $FPM) r) $Perm.Write)
            :pattern ((inv@40@01 r))
            :qid |qp-fld-prm-bnd|))))
      (=>
        (<= 0 i@73@01)
        (and
          (<= 0 i@73@01)
          (forall ((r $Ref)) (!
            (<= ($FVF.perm_f (as pm@75@01  $FPM) r) $Perm.Write)
            :pattern ((inv@47@01 r))
            :qid |qp-fld-prm-bnd|))
          (forall ((r $Ref)) (!
            (<= ($FVF.perm_f (as pm@75@01  $FPM) r) $Perm.Write)
            :pattern ((inv@40@01 r))
            :qid |qp-fld-prm-bnd|))))
      (or (<= 0 i@73@01) (not (<= 0 i@73@01)))))
  :pattern ((Seq_index xs@33@01 i@73@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@73@01 Int) (i2@73@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@73@01) (< i1@73@01 (Seq_length xs@33@01)))
      (and (<= 0 i2@73@01) (< i2@73@01 (Seq_length xs@33@01)))
      (= (Seq_index xs@33@01 i1@73@01) (Seq_index xs@33@01 i2@73@01)))
    (= i1@73@01 i2@73@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@73@01 Int)) (!
  (=>
    (and (<= 0 i@73@01) (< i@73@01 (Seq_length xs@33@01)))
    (and
      (= (inv@76@01 (Seq_index xs@33@01 i@73@01)) i@73@01)
      (img@77@01 (Seq_index xs@33@01 i@73@01))))
  :pattern ((Seq_index xs@33@01 i@73@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@77@01 r)
      (and (<= 0 (inv@76@01 r)) (< (inv@76@01 r) (Seq_length xs@33@01))))
    (= (Seq_index xs@33@01 (inv@76@01 r)) r))
  :pattern ((inv@76@01 r))
  :qid |f-fctOfInv|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((i@73@01 Int)) (!
  (= (Seq_index xs@33@01 i@73@01) (Seq_index ys@34@01 i@73@01))
  
  :qid |quant-u-57|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@78@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@76@01 r)) (< (inv@76@01 r) (Seq_length xs@33@01)))
      (img@77@01 r)
      (= r (Seq_index xs@33@01 (inv@76@01 r))))
    ($Perm.min
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@79@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@76@01 r)) (< (inv@76@01 r) (Seq_length xs@33@01)))
      (img@77@01 r)
      (= r (Seq_index xs@33@01 (inv@76@01 r))))
    ($Perm.min
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@78@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
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
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@78@01 r))
    $Perm.No)
  
  :qid |quant-u-59|))))
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
      (and (<= 0 (inv@76@01 r)) (< (inv@76@01 r) (Seq_length xs@33@01)))
      (img@77@01 r)
      (= r (Seq_index xs@33@01 (inv@76@01 r))))
    (= (- $Perm.Write (pTaken@78@01 r)) $Perm.No))
  
  :qid |quant-u-60|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@80@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@80@01  $FVF<f>)))
      (and
        (and (<= 0 (inv@76@01 r)) (< (inv@76@01 r) (Seq_length xs@33@01)))
        (img@77@01 r)))
    (=>
      (and
        (and (<= 0 (inv@76@01 r)) (< (inv@76@01 r) (Seq_length xs@33@01)))
        (img@77@01 r))
      (Set_in r ($FVF.domain_f (as sm@80@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@80@01  $FVF<f>))))
  :qid |qp.fvfDomDef26|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@76@01 r)) (< (inv@76@01 r) (Seq_length xs@33@01)))
        (img@77@01 r))
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01)))))
    (= ($FVF.lookup_f (as sm@80@01  $FVF<f>) r) ($FVF.lookup_f $t@46@01 r)))
  :pattern (($FVF.lookup_f (as sm@80@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@46@01 r))
  :qid |qp.fvfValDef24|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@76@01 r)) (< (inv@76@01 r) (Seq_length xs@33@01)))
        (img@77@01 r))
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01)))))
    (= ($FVF.lookup_f (as sm@80@01  $FVF<f>) r) ($FVF.lookup_f $t@39@01 r)))
  :pattern (($FVF.lookup_f (as sm@80@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@39@01 r))
  :qid |qp.fvfValDef25|)))
; [eval] (forall i: Int, j: Int ::i >= 0 && (i < |ys| && (j >= 0 && (j < |ys| && i != j))) ==> ys[i] != ys[j])
(declare-const i@81@01 Int)
(declare-const j@82@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] i >= 0 && (i < |ys| && (j >= 0 && (j < |ys| && i != j))) ==> ys[i] != ys[j]
; [eval] i >= 0 && (i < |ys| && (j >= 0 && (j < |ys| && i != j)))
; [eval] i >= 0
(push) ; 5
; [then-branch: 34 | !(i@81@01 >= 0) | live]
; [else-branch: 34 | i@81@01 >= 0 | live]
(push) ; 6
; [then-branch: 34 | !(i@81@01 >= 0)]
(assert (not (>= i@81@01 0)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index ys@34@01 i@45@01) (Seq_index xs@33@01 i@38@01))
    (=
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))))
  
  :qid |quant-u-61|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(declare-const sm@83@01 $FVF<f>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@48@01 r)
      (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
    (= ($FVF.lookup_f (as sm@83@01  $FVF<f>) r) ($FVF.lookup_f $t@46@01 r)))
  :pattern (($FVF.lookup_f (as sm@83@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@46@01 r))
  :qid |qp.fvfValDef27|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@41@01 r)
      (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
    (= ($FVF.lookup_f (as sm@83@01  $FVF<f>) r) ($FVF.lookup_f $t@39@01 r)))
  :pattern (($FVF.lookup_f (as sm@83@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@39@01 r))
  :qid |qp.fvfValDef28|)))
(declare-const pm@84@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@84@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@84@01  $FPM) r))
  :qid |qp.resPrmSumDef29|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@84@01  $FPM) r) $Perm.Write)
  :pattern ((inv@47@01 r))
  :qid |qp-fld-prm-bnd|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@84@01  $FPM) r) $Perm.Write)
  :pattern ((inv@40@01 r))
  :qid |qp-fld-prm-bnd|)))
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 34 | i@81@01 >= 0]
(assert (>= i@81@01 0))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index ys@34@01 i@45@01) (Seq_index xs@33@01 i@38@01))
    (=
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))))
  
  :qid |quant-u-62|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(declare-const sm@85@01 $FVF<f>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@48@01 r)
      (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
    (= ($FVF.lookup_f (as sm@85@01  $FVF<f>) r) ($FVF.lookup_f $t@46@01 r)))
  :pattern (($FVF.lookup_f (as sm@85@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@46@01 r))
  :qid |qp.fvfValDef30|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@41@01 r)
      (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
    (= ($FVF.lookup_f (as sm@85@01  $FVF<f>) r) ($FVF.lookup_f $t@39@01 r)))
  :pattern (($FVF.lookup_f (as sm@85@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@39@01 r))
  :qid |qp.fvfValDef31|)))
(declare-const pm@86@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@86@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@86@01  $FPM) r))
  :qid |qp.resPrmSumDef32|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@86@01  $FPM) r) $Perm.Write)
  :pattern ((inv@47@01 r))
  :qid |qp-fld-prm-bnd|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@86@01  $FPM) r) $Perm.Write)
  :pattern ((inv@40@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] i < |ys|
; [eval] |ys|
(set-option :timeout 0)
(push) ; 7
; [then-branch: 35 | !(i@81@01 < |ys@34@01|) | live]
; [else-branch: 35 | i@81@01 < |ys@34@01| | live]
(push) ; 8
; [then-branch: 35 | !(i@81@01 < |ys@34@01|)]
(assert (not (< i@81@01 (Seq_length ys@34@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@33@01 i@38@01) (Seq_index ys@34@01 i@45@01))
    (=
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))))
  
  :qid |quant-u-63|))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; Assume upper permission bound for field f
(pop) ; 8
(set-option :timeout 0)
(push) ; 8
; [else-branch: 35 | i@81@01 < |ys@34@01|]
(assert (< i@81@01 (Seq_length ys@34@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@33@01 i@38@01) (Seq_index ys@34@01 i@45@01))
    (=
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))))
  
  :qid |quant-u-64|))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; Assume upper permission bound for field f
; [eval] j >= 0
(set-option :timeout 0)
(push) ; 9
; [then-branch: 36 | !(j@82@01 >= 0) | live]
; [else-branch: 36 | j@82@01 >= 0 | live]
(push) ; 10
; [then-branch: 36 | !(j@82@01 >= 0)]
(assert (not (>= j@82@01 0)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index ys@34@01 i@45@01) (Seq_index xs@33@01 i@38@01))
    (=
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))))
  
  :qid |quant-u-65|))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; Assume upper permission bound for field f
(pop) ; 10
(set-option :timeout 0)
(push) ; 10
; [else-branch: 36 | j@82@01 >= 0]
(assert (>= j@82@01 0))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index ys@34@01 i@45@01) (Seq_index xs@33@01 i@38@01))
    (=
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))))
  
  :qid |quant-u-66|))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; Assume upper permission bound for field f
; [eval] j < |ys|
; [eval] |ys|
(set-option :timeout 0)
(push) ; 11
; [then-branch: 37 | !(j@82@01 < |ys@34@01|) | live]
; [else-branch: 37 | j@82@01 < |ys@34@01| | live]
(push) ; 12
; [then-branch: 37 | !(j@82@01 < |ys@34@01|)]
(assert (not (< j@82@01 (Seq_length ys@34@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@33@01 i@38@01) (Seq_index ys@34@01 i@45@01))
    (=
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))))
  
  :qid |quant-u-67|))))
(check-sat)
; unknown
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; Assume upper permission bound for field f
(pop) ; 12
(set-option :timeout 0)
(push) ; 12
; [else-branch: 37 | j@82@01 < |ys@34@01|]
(assert (< j@82@01 (Seq_length ys@34@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@33@01 i@38@01) (Seq_index ys@34@01 i@45@01))
    (=
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))))
  
  :qid |quant-u-68|))))
(check-sat)
; unknown
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; Assume upper permission bound for field f
; [eval] i != j
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or (< j@82@01 (Seq_length ys@34@01)) (not (< j@82@01 (Seq_length ys@34@01)))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@82@01 0)
  (and
    (>= j@82@01 0)
    (or
      (< j@82@01 (Seq_length ys@34@01))
      (not (< j@82@01 (Seq_length ys@34@01)))))))
(assert (or (>= j@82@01 0) (not (>= j@82@01 0))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i@81@01 (Seq_length ys@34@01))
  (and
    (< i@81@01 (Seq_length ys@34@01))
    (=>
      (>= j@82@01 0)
      (and
        (>= j@82@01 0)
        (or
          (< j@82@01 (Seq_length ys@34@01))
          (not (< j@82@01 (Seq_length ys@34@01))))))
    (or (>= j@82@01 0) (not (>= j@82@01 0))))))
(assert (or (< i@81@01 (Seq_length ys@34@01)) (not (< i@81@01 (Seq_length ys@34@01)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@48@01 r)
      (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
    (= ($FVF.lookup_f (as sm@83@01  $FVF<f>) r) ($FVF.lookup_f $t@46@01 r)))
  :pattern (($FVF.lookup_f (as sm@83@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@46@01 r))
  :qid |qp.fvfValDef27|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@41@01 r)
      (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
    (= ($FVF.lookup_f (as sm@83@01  $FVF<f>) r) ($FVF.lookup_f $t@39@01 r)))
  :pattern (($FVF.lookup_f (as sm@83@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@39@01 r))
  :qid |qp.fvfValDef28|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@84@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@84@01  $FPM) r))
  :qid |qp.resPrmSumDef29|)))
(assert (=>
  (not (>= i@81@01 0))
  (and
    (not (>= i@81@01 0))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@84@01  $FPM) r) $Perm.Write)
      :pattern ((inv@47@01 r))
      :qid |qp-fld-prm-bnd|))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@84@01  $FPM) r) $Perm.Write)
      :pattern ((inv@40@01 r))
      :qid |qp-fld-prm-bnd|)))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@48@01 r)
      (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
    (= ($FVF.lookup_f (as sm@85@01  $FVF<f>) r) ($FVF.lookup_f $t@46@01 r)))
  :pattern (($FVF.lookup_f (as sm@85@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@46@01 r))
  :qid |qp.fvfValDef30|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@41@01 r)
      (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
    (= ($FVF.lookup_f (as sm@85@01  $FVF<f>) r) ($FVF.lookup_f $t@39@01 r)))
  :pattern (($FVF.lookup_f (as sm@85@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@39@01 r))
  :qid |qp.fvfValDef31|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@86@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@86@01  $FPM) r))
  :qid |qp.resPrmSumDef32|)))
(assert (=>
  (>= i@81@01 0)
  (and
    (>= i@81@01 0)
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@86@01  $FPM) r) $Perm.Write)
      :pattern ((inv@47@01 r))
      :qid |qp-fld-prm-bnd|))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@86@01  $FPM) r) $Perm.Write)
      :pattern ((inv@40@01 r))
      :qid |qp-fld-prm-bnd|))
    (=>
      (< i@81@01 (Seq_length ys@34@01))
      (and
        (< i@81@01 (Seq_length ys@34@01))
        (=>
          (>= j@82@01 0)
          (and
            (>= j@82@01 0)
            (or
              (< j@82@01 (Seq_length ys@34@01))
              (not (< j@82@01 (Seq_length ys@34@01))))))
        (or (>= j@82@01 0) (not (>= j@82@01 0)))))
    (or
      (< i@81@01 (Seq_length ys@34@01))
      (not (< i@81@01 (Seq_length ys@34@01)))))))
(assert (or (>= i@81@01 0) (not (>= i@81@01 0))))
(set-option :timeout 0)
(push) ; 5
; [then-branch: 38 | i@81@01 >= 0 && i@81@01 < |ys@34@01| && j@82@01 >= 0 && j@82@01 < |ys@34@01| && i@81@01 != j@82@01 | live]
; [else-branch: 38 | !(i@81@01 >= 0 && i@81@01 < |ys@34@01| && j@82@01 >= 0 && j@82@01 < |ys@34@01| && i@81@01 != j@82@01) | live]
(push) ; 6
; [then-branch: 38 | i@81@01 >= 0 && i@81@01 < |ys@34@01| && j@82@01 >= 0 && j@82@01 < |ys@34@01| && i@81@01 != j@82@01]
(assert (and
  (>= i@81@01 0)
  (and
    (< i@81@01 (Seq_length ys@34@01))
    (and
      (>= j@82@01 0)
      (and (< j@82@01 (Seq_length ys@34@01)) (not (= i@81@01 j@82@01)))))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index ys@34@01 i@45@01) (Seq_index xs@33@01 i@38@01))
    (=
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))))
  
  :qid |quant-u-69|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@86@01  $FPM) r) $Perm.Write)
  :pattern ((inv@47@01 r))
  :qid |qp-fld-prm-bnd|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@86@01  $FPM) r) $Perm.Write)
  :pattern ((inv@40@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] ys[i] != ys[j]
; [eval] ys[i]
; [eval] ys[j]
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 38 | !(i@81@01 >= 0 && i@81@01 < |ys@34@01| && j@82@01 >= 0 && j@82@01 < |ys@34@01| && i@81@01 != j@82@01)]
(assert (not
  (and
    (>= i@81@01 0)
    (and
      (< i@81@01 (Seq_length ys@34@01))
      (and
        (>= j@82@01 0)
        (and (< j@82@01 (Seq_length ys@34@01)) (not (= i@81@01 j@82@01))))))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index ys@34@01 i@45@01) (Seq_index xs@33@01 i@38@01))
    (=
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))))
  
  :qid |quant-u-70|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@86@01  $FPM) r) $Perm.Write)
  :pattern ((inv@47@01 r))
  :qid |qp-fld-prm-bnd|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@86@01  $FPM) r) $Perm.Write)
  :pattern ((inv@40@01 r))
  :qid |qp-fld-prm-bnd|)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (>= i@81@01 0)
    (and
      (< i@81@01 (Seq_length ys@34@01))
      (and
        (>= j@82@01 0)
        (and (< j@82@01 (Seq_length ys@34@01)) (not (= i@81@01 j@82@01))))))
  (and
    (>= i@81@01 0)
    (< i@81@01 (Seq_length ys@34@01))
    (>= j@82@01 0)
    (< j@82@01 (Seq_length ys@34@01))
    (not (= i@81@01 j@82@01))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@86@01  $FPM) r) $Perm.Write)
      :pattern ((inv@47@01 r))
      :qid |qp-fld-prm-bnd|))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@86@01  $FPM) r) $Perm.Write)
      :pattern ((inv@40@01 r))
      :qid |qp-fld-prm-bnd|)))))
; Joined path conditions
(assert (=>
  (not
    (and
      (>= i@81@01 0)
      (and
        (< i@81@01 (Seq_length ys@34@01))
        (and
          (>= j@82@01 0)
          (and (< j@82@01 (Seq_length ys@34@01)) (not (= i@81@01 j@82@01)))))))
  (and
    (not
      (and
        (>= i@81@01 0)
        (and
          (< i@81@01 (Seq_length ys@34@01))
          (and
            (>= j@82@01 0)
            (and (< j@82@01 (Seq_length ys@34@01)) (not (= i@81@01 j@82@01)))))))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@86@01  $FPM) r) $Perm.Write)
      :pattern ((inv@47@01 r))
      :qid |qp-fld-prm-bnd|))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@86@01  $FPM) r) $Perm.Write)
      :pattern ((inv@40@01 r))
      :qid |qp-fld-prm-bnd|)))))
(assert (or
  (not
    (and
      (>= i@81@01 0)
      (and
        (< i@81@01 (Seq_length ys@34@01))
        (and
          (>= j@82@01 0)
          (and (< j@82@01 (Seq_length ys@34@01)) (not (= i@81@01 j@82@01)))))))
  (and
    (>= i@81@01 0)
    (and
      (< i@81@01 (Seq_length ys@34@01))
      (and
        (>= j@82@01 0)
        (and (< j@82@01 (Seq_length ys@34@01)) (not (= i@81@01 j@82@01))))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@48@01 r)
      (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
    (= ($FVF.lookup_f (as sm@83@01  $FVF<f>) r) ($FVF.lookup_f $t@46@01 r)))
  :pattern (($FVF.lookup_f (as sm@83@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@46@01 r))
  :qid |qp.fvfValDef27|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@41@01 r)
      (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
    (= ($FVF.lookup_f (as sm@83@01  $FVF<f>) r) ($FVF.lookup_f $t@39@01 r)))
  :pattern (($FVF.lookup_f (as sm@83@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@39@01 r))
  :qid |qp.fvfValDef28|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@84@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@84@01  $FPM) r))
  :qid |qp.resPrmSumDef29|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@48@01 r)
      (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
    (= ($FVF.lookup_f (as sm@85@01  $FVF<f>) r) ($FVF.lookup_f $t@46@01 r)))
  :pattern (($FVF.lookup_f (as sm@85@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@46@01 r))
  :qid |qp.fvfValDef30|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@41@01 r)
      (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
    (= ($FVF.lookup_f (as sm@85@01  $FVF<f>) r) ($FVF.lookup_f $t@39@01 r)))
  :pattern (($FVF.lookup_f (as sm@85@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@39@01 r))
  :qid |qp.fvfValDef31|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@86@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@86@01  $FPM) r))
  :qid |qp.resPrmSumDef32|)))
; Nested auxiliary terms: non-globals (aux)
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((i@81@01 Int) (j@82@01 Int)) (!
  (=>
    (and
      (>= i@81@01 0)
      (and
        (< i@81@01 (Seq_length ys@34@01))
        (and
          (>= j@82@01 0)
          (and (< j@82@01 (Seq_length ys@34@01)) (not (= i@81@01 j@82@01))))))
    (not (= (Seq_index ys@34@01 i@81@01) (Seq_index ys@34@01 j@82@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions2.vpr@28@12@28@106|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@81@01 Int) (j@82@01 Int)) (!
  (=>
    (and
      (>= i@81@01 0)
      (and
        (< i@81@01 (Seq_length ys@34@01))
        (and
          (>= j@82@01 0)
          (and (< j@82@01 (Seq_length ys@34@01)) (not (= i@81@01 j@82@01))))))
    (not (= (Seq_index ys@34@01 i@81@01) (Seq_index ys@34@01 j@82@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions2.vpr@28@12@28@106|)))
(declare-const i@87@01 Int)
(push) ; 4
; [eval] 0 <= i && i < |ys|
; [eval] 0 <= i
(push) ; 5
; [then-branch: 39 | !(0 <= i@87@01) | live]
; [else-branch: 39 | 0 <= i@87@01 | live]
(push) ; 6
; [then-branch: 39 | !(0 <= i@87@01)]
(assert (not (<= 0 i@87@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index ys@34@01 i@45@01) (Seq_index xs@33@01 i@38@01))
    (=
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))))
  
  :qid |quant-u-71|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(declare-const pm@88@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@88@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@88@01  $FPM) r))
  :qid |qp.resPrmSumDef33|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@88@01  $FPM) r) $Perm.Write)
  :pattern ((inv@47@01 r))
  :qid |qp-fld-prm-bnd|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@88@01  $FPM) r) $Perm.Write)
  :pattern ((inv@40@01 r))
  :qid |qp-fld-prm-bnd|)))
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 39 | 0 <= i@87@01]
(assert (<= 0 i@87@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index ys@34@01 i@45@01) (Seq_index xs@33@01 i@38@01))
    (=
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))))
  
  :qid |quant-u-72|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(declare-const pm@89@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@89@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@89@01  $FPM) r))
  :qid |qp.resPrmSumDef34|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@89@01  $FPM) r) $Perm.Write)
  :pattern ((inv@47@01 r))
  :qid |qp-fld-prm-bnd|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@89@01  $FPM) r) $Perm.Write)
  :pattern ((inv@40@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] i < |ys|
; [eval] |ys|
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@88@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@88@01  $FPM) r))
  :qid |qp.resPrmSumDef33|)))
(assert (=>
  (not (<= 0 i@87@01))
  (and
    (not (<= 0 i@87@01))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@88@01  $FPM) r) $Perm.Write)
      :pattern ((inv@47@01 r))
      :qid |qp-fld-prm-bnd|))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@88@01  $FPM) r) $Perm.Write)
      :pattern ((inv@40@01 r))
      :qid |qp-fld-prm-bnd|)))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@89@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@89@01  $FPM) r))
  :qid |qp.resPrmSumDef34|)))
(assert (=>
  (<= 0 i@87@01)
  (and
    (<= 0 i@87@01)
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@89@01  $FPM) r) $Perm.Write)
      :pattern ((inv@47@01 r))
      :qid |qp-fld-prm-bnd|))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@89@01  $FPM) r) $Perm.Write)
      :pattern ((inv@40@01 r))
      :qid |qp-fld-prm-bnd|)))))
(assert (or (<= 0 i@87@01) (not (<= 0 i@87@01))))
(assert (and (<= 0 i@87@01) (< i@87@01 (Seq_length ys@34@01))))
; [eval] ys[i]
(set-option :timeout 0)
(push) ; 5
(assert (not (>= i@87@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@90@01 ($Ref) Int)
(declare-fun img@91@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@88@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@88@01  $FPM) r))
  :qid |qp.resPrmSumDef33|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@89@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@89@01  $FPM) r))
  :qid |qp.resPrmSumDef34|)))
; Nested auxiliary terms: non-globals
(assert (forall ((i@87@01 Int)) (!
  (=>
    (and (<= 0 i@87@01) (< i@87@01 (Seq_length ys@34@01)))
    (and
      (=>
        (not (<= 0 i@87@01))
        (and
          (not (<= 0 i@87@01))
          (forall ((r $Ref)) (!
            (<= ($FVF.perm_f (as pm@88@01  $FPM) r) $Perm.Write)
            :pattern ((inv@47@01 r))
            :qid |qp-fld-prm-bnd|))
          (forall ((r $Ref)) (!
            (<= ($FVF.perm_f (as pm@88@01  $FPM) r) $Perm.Write)
            :pattern ((inv@40@01 r))
            :qid |qp-fld-prm-bnd|))))
      (=>
        (<= 0 i@87@01)
        (and
          (<= 0 i@87@01)
          (forall ((r $Ref)) (!
            (<= ($FVF.perm_f (as pm@89@01  $FPM) r) $Perm.Write)
            :pattern ((inv@47@01 r))
            :qid |qp-fld-prm-bnd|))
          (forall ((r $Ref)) (!
            (<= ($FVF.perm_f (as pm@89@01  $FPM) r) $Perm.Write)
            :pattern ((inv@40@01 r))
            :qid |qp-fld-prm-bnd|))))
      (or (<= 0 i@87@01) (not (<= 0 i@87@01)))))
  :pattern ((Seq_index ys@34@01 i@87@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@87@01 Int) (i2@87@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@87@01) (< i1@87@01 (Seq_length ys@34@01)))
      (and (<= 0 i2@87@01) (< i2@87@01 (Seq_length ys@34@01)))
      (= (Seq_index ys@34@01 i1@87@01) (Seq_index ys@34@01 i2@87@01)))
    (= i1@87@01 i2@87@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@87@01 Int)) (!
  (=>
    (and (<= 0 i@87@01) (< i@87@01 (Seq_length ys@34@01)))
    (and
      (= (inv@90@01 (Seq_index ys@34@01 i@87@01)) i@87@01)
      (img@91@01 (Seq_index ys@34@01 i@87@01))))
  :pattern ((Seq_index ys@34@01 i@87@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@91@01 r)
      (and (<= 0 (inv@90@01 r)) (< (inv@90@01 r) (Seq_length ys@34@01))))
    (= (Seq_index ys@34@01 (inv@90@01 r)) r))
  :pattern ((inv@90@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@92@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@90@01 r)) (< (inv@90@01 r) (Seq_length ys@34@01)))
      (img@91@01 r)
      (= r (Seq_index ys@34@01 (inv@90@01 r))))
    ($Perm.min
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
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
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@92@01 r))
    $Perm.No)
  
  :qid |quant-u-75|))))
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
      (and (<= 0 (inv@90@01 r)) (< (inv@90@01 r) (Seq_length ys@34@01)))
      (img@91@01 r)
      (= r (Seq_index ys@34@01 (inv@90@01 r))))
    (= (- $Perm.Write (pTaken@92@01 r)) $Perm.No))
  
  :qid |quant-u-76|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@93@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@93@01  $FVF<f>)))
      (and
        (and (<= 0 (inv@90@01 r)) (< (inv@90@01 r) (Seq_length ys@34@01)))
        (img@91@01 r)))
    (=>
      (and
        (and (<= 0 (inv@90@01 r)) (< (inv@90@01 r) (Seq_length ys@34@01)))
        (img@91@01 r))
      (Set_in r ($FVF.domain_f (as sm@93@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@93@01  $FVF<f>))))
  :qid |qp.fvfDomDef36|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@90@01 r)) (< (inv@90@01 r) (Seq_length ys@34@01)))
        (img@91@01 r))
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01)))))
    (= ($FVF.lookup_f (as sm@93@01  $FVF<f>) r) ($FVF.lookup_f $t@46@01 r)))
  :pattern (($FVF.lookup_f (as sm@93@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@46@01 r))
  :qid |qp.fvfValDef35|)))
; [eval] 10 < |xs|
; [eval] |xs|
; [eval] |xs| == |ys|
; [eval] |xs|
; [eval] |ys|
(assert (fun02%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$FVF<f>To$Snap (as sm@80@01  $FVF<f>))
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$FVF<f>To$Snap (as sm@93@01  $FVF<f>))
        ($Snap.combine $Snap.unit $Snap.unit))))) xs@33@01 ys@34@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@48@01 r)
      (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
    (= ($FVF.lookup_f (as sm@69@01  $FVF<f>) r) ($FVF.lookup_f $t@46@01 r)))
  :pattern (($FVF.lookup_f (as sm@69@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@46@01 r))
  :qid |qp.fvfValDef16|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@41@01 r)
      (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
    (= ($FVF.lookup_f (as sm@69@01  $FVF<f>) r) ($FVF.lookup_f $t@39@01 r)))
  :pattern (($FVF.lookup_f (as sm@69@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@39@01 r))
  :qid |qp.fvfValDef17|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@70@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@70@01  $FPM) r))
  :qid |qp.resPrmSumDef18|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@48@01 r)
      (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
    (= ($FVF.lookup_f (as sm@71@01  $FVF<f>) r) ($FVF.lookup_f $t@46@01 r)))
  :pattern (($FVF.lookup_f (as sm@71@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@46@01 r))
  :qid |qp.fvfValDef19|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@41@01 r)
      (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
    (= ($FVF.lookup_f (as sm@71@01  $FVF<f>) r) ($FVF.lookup_f $t@39@01 r)))
  :pattern (($FVF.lookup_f (as sm@71@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@39@01 r))
  :qid |qp.fvfValDef20|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@72@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@72@01  $FPM) r))
  :qid |qp.resPrmSumDef21|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@74@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@74@01  $FPM) r))
  :qid |qp.resPrmSumDef22|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@75@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@75@01  $FPM) r))
  :qid |qp.resPrmSumDef23|)))
(assert (forall ((i@73@01 Int)) (!
  (=>
    (and (<= 0 i@73@01) (< i@73@01 (Seq_length xs@33@01)))
    (and
      (= (inv@76@01 (Seq_index xs@33@01 i@73@01)) i@73@01)
      (img@77@01 (Seq_index xs@33@01 i@73@01))))
  :pattern ((Seq_index xs@33@01 i@73@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@77@01 r)
      (and (<= 0 (inv@76@01 r)) (< (inv@76@01 r) (Seq_length xs@33@01))))
    (= (Seq_index xs@33@01 (inv@76@01 r)) r))
  :pattern ((inv@76@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@80@01  $FVF<f>)))
      (and
        (and (<= 0 (inv@76@01 r)) (< (inv@76@01 r) (Seq_length xs@33@01)))
        (img@77@01 r)))
    (=>
      (and
        (and (<= 0 (inv@76@01 r)) (< (inv@76@01 r) (Seq_length xs@33@01)))
        (img@77@01 r))
      (Set_in r ($FVF.domain_f (as sm@80@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@80@01  $FVF<f>))))
  :qid |qp.fvfDomDef26|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@76@01 r)) (< (inv@76@01 r) (Seq_length xs@33@01)))
        (img@77@01 r))
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01)))))
    (= ($FVF.lookup_f (as sm@80@01  $FVF<f>) r) ($FVF.lookup_f $t@46@01 r)))
  :pattern (($FVF.lookup_f (as sm@80@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@46@01 r))
  :qid |qp.fvfValDef24|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@76@01 r)) (< (inv@76@01 r) (Seq_length xs@33@01)))
        (img@77@01 r))
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01)))))
    (= ($FVF.lookup_f (as sm@80@01  $FVF<f>) r) ($FVF.lookup_f $t@39@01 r)))
  :pattern (($FVF.lookup_f (as sm@80@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@39@01 r))
  :qid |qp.fvfValDef25|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@48@01 r)
      (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
    (= ($FVF.lookup_f (as sm@83@01  $FVF<f>) r) ($FVF.lookup_f $t@46@01 r)))
  :pattern (($FVF.lookup_f (as sm@83@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@46@01 r))
  :qid |qp.fvfValDef27|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@41@01 r)
      (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
    (= ($FVF.lookup_f (as sm@83@01  $FVF<f>) r) ($FVF.lookup_f $t@39@01 r)))
  :pattern (($FVF.lookup_f (as sm@83@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@39@01 r))
  :qid |qp.fvfValDef28|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@84@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@84@01  $FPM) r))
  :qid |qp.resPrmSumDef29|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@48@01 r)
      (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
    (= ($FVF.lookup_f (as sm@85@01  $FVF<f>) r) ($FVF.lookup_f $t@46@01 r)))
  :pattern (($FVF.lookup_f (as sm@85@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@46@01 r))
  :qid |qp.fvfValDef30|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@41@01 r)
      (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
    (= ($FVF.lookup_f (as sm@85@01  $FVF<f>) r) ($FVF.lookup_f $t@39@01 r)))
  :pattern (($FVF.lookup_f (as sm@85@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@39@01 r))
  :qid |qp.fvfValDef31|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@86@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@86@01  $FPM) r))
  :qid |qp.resPrmSumDef32|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@88@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@88@01  $FPM) r))
  :qid |qp.resPrmSumDef33|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@89@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@89@01  $FPM) r))
  :qid |qp.resPrmSumDef34|)))
(assert (forall ((i@87@01 Int)) (!
  (=>
    (and (<= 0 i@87@01) (< i@87@01 (Seq_length ys@34@01)))
    (and
      (= (inv@90@01 (Seq_index ys@34@01 i@87@01)) i@87@01)
      (img@91@01 (Seq_index ys@34@01 i@87@01))))
  :pattern ((Seq_index ys@34@01 i@87@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@91@01 r)
      (and (<= 0 (inv@90@01 r)) (< (inv@90@01 r) (Seq_length ys@34@01))))
    (= (Seq_index ys@34@01 (inv@90@01 r)) r))
  :pattern ((inv@90@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@93@01  $FVF<f>)))
      (and
        (and (<= 0 (inv@90@01 r)) (< (inv@90@01 r) (Seq_length ys@34@01)))
        (img@91@01 r)))
    (=>
      (and
        (and (<= 0 (inv@90@01 r)) (< (inv@90@01 r) (Seq_length ys@34@01)))
        (img@91@01 r))
      (Set_in r ($FVF.domain_f (as sm@93@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@93@01  $FVF<f>))))
  :qid |qp.fvfDomDef36|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@90@01 r)) (< (inv@90@01 r) (Seq_length ys@34@01)))
        (img@91@01 r))
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01)))))
    (= ($FVF.lookup_f (as sm@93@01  $FVF<f>) r) ($FVF.lookup_f $t@46@01 r)))
  :pattern (($FVF.lookup_f (as sm@93@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@46@01 r))
  :qid |qp.fvfValDef35|)))
(assert (and
  (forall ((i@67@01 Int) (j@68@01 Int)) (!
    (=>
      (and
        (>= i@67@01 0)
        (and
          (< i@67@01 (Seq_length xs@33@01))
          (and
            (>= j@68@01 0)
            (and (< j@68@01 (Seq_length xs@33@01)) (not (= i@67@01 j@68@01))))))
      (not (= (Seq_index xs@33@01 i@67@01) (Seq_index xs@33@01 j@68@01))))
    
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions2.vpr@26@12@26@106|))
  (forall ((i@73@01 Int)) (!
    (=>
      (and (<= 0 i@73@01) (< i@73@01 (Seq_length xs@33@01)))
      (and
        (=>
          (not (<= 0 i@73@01))
          (and
            (not (<= 0 i@73@01))
            (forall ((r $Ref)) (!
              (<= ($FVF.perm_f (as pm@74@01  $FPM) r) $Perm.Write)
              :pattern ((inv@47@01 r))
              :qid |qp-fld-prm-bnd|))
            (forall ((r $Ref)) (!
              (<= ($FVF.perm_f (as pm@74@01  $FPM) r) $Perm.Write)
              :pattern ((inv@40@01 r))
              :qid |qp-fld-prm-bnd|))))
        (=>
          (<= 0 i@73@01)
          (and
            (<= 0 i@73@01)
            (forall ((r $Ref)) (!
              (<= ($FVF.perm_f (as pm@75@01  $FPM) r) $Perm.Write)
              :pattern ((inv@47@01 r))
              :qid |qp-fld-prm-bnd|))
            (forall ((r $Ref)) (!
              (<= ($FVF.perm_f (as pm@75@01  $FPM) r) $Perm.Write)
              :pattern ((inv@40@01 r))
              :qid |qp-fld-prm-bnd|))))
        (or (<= 0 i@73@01) (not (<= 0 i@73@01)))))
    :pattern ((Seq_index xs@33@01 i@73@01))
    :qid |f-aux|))
  (forall ((i@81@01 Int) (j@82@01 Int)) (!
    (=>
      (and
        (>= i@81@01 0)
        (and
          (< i@81@01 (Seq_length ys@34@01))
          (and
            (>= j@82@01 0)
            (and (< j@82@01 (Seq_length ys@34@01)) (not (= i@81@01 j@82@01))))))
      (not (= (Seq_index ys@34@01 i@81@01) (Seq_index ys@34@01 j@82@01))))
    
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions2.vpr@28@12@28@106|))
  (forall ((i@87@01 Int)) (!
    (=>
      (and (<= 0 i@87@01) (< i@87@01 (Seq_length ys@34@01)))
      (and
        (=>
          (not (<= 0 i@87@01))
          (and
            (not (<= 0 i@87@01))
            (forall ((r $Ref)) (!
              (<= ($FVF.perm_f (as pm@88@01  $FPM) r) $Perm.Write)
              :pattern ((inv@47@01 r))
              :qid |qp-fld-prm-bnd|))
            (forall ((r $Ref)) (!
              (<= ($FVF.perm_f (as pm@88@01  $FPM) r) $Perm.Write)
              :pattern ((inv@40@01 r))
              :qid |qp-fld-prm-bnd|))))
        (=>
          (<= 0 i@87@01)
          (and
            (<= 0 i@87@01)
            (forall ((r $Ref)) (!
              (<= ($FVF.perm_f (as pm@89@01  $FPM) r) $Perm.Write)
              :pattern ((inv@47@01 r))
              :qid |qp-fld-prm-bnd|))
            (forall ((r $Ref)) (!
              (<= ($FVF.perm_f (as pm@89@01  $FPM) r) $Perm.Write)
              :pattern ((inv@40@01 r))
              :qid |qp-fld-prm-bnd|))))
        (or (<= 0 i@87@01) (not (<= 0 i@87@01)))))
    :pattern ((Seq_index ys@34@01 i@87@01))
    :qid |f-aux|))
  (fun02%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<f>To$Snap (as sm@80@01  $FVF<f>))
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$FVF<f>To$Snap (as sm@93@01  $FVF<f>))
          ($Snap.combine $Snap.unit $Snap.unit))))) xs@33@01 ys@34@01)))
(set-option :timeout 0)
(push) ; 3
(assert (not (fun02 ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$FVF<f>To$Snap (as sm@80@01  $FVF<f>))
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$FVF<f>To$Snap (as sm@93@01  $FVF<f>))
        ($Snap.combine $Snap.unit $Snap.unit))))) xs@33@01 ys@34@01)))
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
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@33@01 i@38@01) (Seq_index ys@34@01 i@45@01))
    (=
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))))
  
  :qid |quant-u-77|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const sm@94@01 $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@41@01 r)
      (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
    (= ($FVF.lookup_f (as sm@94@01  $FVF<f>) r) ($FVF.lookup_f $t@39@01 r)))
  :pattern (($FVF.lookup_f (as sm@94@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@39@01 r))
  :qid |qp.fvfValDef37|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@48@01 r)
      (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
    (= ($FVF.lookup_f (as sm@94@01  $FVF<f>) r) ($FVF.lookup_f $t@46@01 r)))
  :pattern (($FVF.lookup_f (as sm@94@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@46@01 r))
  :qid |qp.fvfValDef38|)))
(declare-const pm@95@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@95@01  $FPM) r)
    (+
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@95@01  $FPM) r))
  :qid |qp.resPrmSumDef39|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@95@01  $FPM) r) $Perm.Write)
  :pattern ((inv@40@01 r))
  :qid |qp-fld-prm-bnd|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@95@01  $FPM) r) $Perm.Write)
  :pattern ((inv@47@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] fun02(xs, ys)
(set-option :timeout 0)
(push) ; 3
; [eval] (forall i: Int, j: Int ::i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==> xs[i] != xs[j])
(declare-const i@96@01 Int)
(declare-const j@97@01 Int)
(push) ; 4
; [eval] i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==> xs[i] != xs[j]
; [eval] i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j)))
; [eval] i >= 0
(push) ; 5
; [then-branch: 40 | !(i@96@01 >= 0) | live]
; [else-branch: 40 | i@96@01 >= 0 | live]
(push) ; 6
; [then-branch: 40 | !(i@96@01 >= 0)]
(assert (not (>= i@96@01 0)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@33@01 i@38@01) (Seq_index ys@34@01 i@45@01))
    (=
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))))
  
  :qid |quant-u-78|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; Assume upper permission bound for field f
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 40 | i@96@01 >= 0]
(assert (>= i@96@01 0))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@33@01 i@38@01) (Seq_index ys@34@01 i@45@01))
    (=
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))))
  
  :qid |quant-u-79|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; Assume upper permission bound for field f
; [eval] i < |xs|
; [eval] |xs|
(set-option :timeout 0)
(push) ; 7
; [then-branch: 41 | !(i@96@01 < |xs@33@01|) | live]
; [else-branch: 41 | i@96@01 < |xs@33@01| | live]
(push) ; 8
; [then-branch: 41 | !(i@96@01 < |xs@33@01|)]
(assert (not (< i@96@01 (Seq_length xs@33@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index ys@34@01 i@45@01) (Seq_index xs@33@01 i@38@01))
    (=
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))))
  
  :qid |quant-u-80|))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(declare-const sm@98@01 $FVF<f>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@48@01 r)
      (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
    (= ($FVF.lookup_f (as sm@98@01  $FVF<f>) r) ($FVF.lookup_f $t@46@01 r)))
  :pattern (($FVF.lookup_f (as sm@98@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@46@01 r))
  :qid |qp.fvfValDef40|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@41@01 r)
      (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
    (= ($FVF.lookup_f (as sm@98@01  $FVF<f>) r) ($FVF.lookup_f $t@39@01 r)))
  :pattern (($FVF.lookup_f (as sm@98@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@39@01 r))
  :qid |qp.fvfValDef41|)))
(declare-const pm@99@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@99@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@99@01  $FPM) r))
  :qid |qp.resPrmSumDef42|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@99@01  $FPM) r) $Perm.Write)
  :pattern ((inv@47@01 r))
  :qid |qp-fld-prm-bnd|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@99@01  $FPM) r) $Perm.Write)
  :pattern ((inv@40@01 r))
  :qid |qp-fld-prm-bnd|)))
(pop) ; 8
(set-option :timeout 0)
(push) ; 8
; [else-branch: 41 | i@96@01 < |xs@33@01|]
(assert (< i@96@01 (Seq_length xs@33@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index ys@34@01 i@45@01) (Seq_index xs@33@01 i@38@01))
    (=
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))))
  
  :qid |quant-u-81|))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(declare-const sm@100@01 $FVF<f>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@48@01 r)
      (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
    (= ($FVF.lookup_f (as sm@100@01  $FVF<f>) r) ($FVF.lookup_f $t@46@01 r)))
  :pattern (($FVF.lookup_f (as sm@100@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@46@01 r))
  :qid |qp.fvfValDef43|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@41@01 r)
      (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
    (= ($FVF.lookup_f (as sm@100@01  $FVF<f>) r) ($FVF.lookup_f $t@39@01 r)))
  :pattern (($FVF.lookup_f (as sm@100@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@39@01 r))
  :qid |qp.fvfValDef44|)))
(declare-const pm@101@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@101@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@101@01  $FPM) r))
  :qid |qp.resPrmSumDef45|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@101@01  $FPM) r) $Perm.Write)
  :pattern ((inv@47@01 r))
  :qid |qp-fld-prm-bnd|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@101@01  $FPM) r) $Perm.Write)
  :pattern ((inv@40@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] j >= 0
(set-option :timeout 0)
(push) ; 9
; [then-branch: 42 | !(j@97@01 >= 0) | live]
; [else-branch: 42 | j@97@01 >= 0 | live]
(push) ; 10
; [then-branch: 42 | !(j@97@01 >= 0)]
(assert (not (>= j@97@01 0)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@33@01 i@38@01) (Seq_index ys@34@01 i@45@01))
    (=
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))))
  
  :qid |quant-u-82|))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; Assume upper permission bound for field f
(pop) ; 10
(set-option :timeout 0)
(push) ; 10
; [else-branch: 42 | j@97@01 >= 0]
(assert (>= j@97@01 0))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@33@01 i@38@01) (Seq_index ys@34@01 i@45@01))
    (=
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))))
  
  :qid |quant-u-83|))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; Assume upper permission bound for field f
; [eval] j < |xs|
; [eval] |xs|
(set-option :timeout 0)
(push) ; 11
; [then-branch: 43 | !(j@97@01 < |xs@33@01|) | live]
; [else-branch: 43 | j@97@01 < |xs@33@01| | live]
(push) ; 12
; [then-branch: 43 | !(j@97@01 < |xs@33@01|)]
(assert (not (< j@97@01 (Seq_length xs@33@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index ys@34@01 i@45@01) (Seq_index xs@33@01 i@38@01))
    (=
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))))
  
  :qid |quant-u-84|))))
(check-sat)
; unknown
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; Assume upper permission bound for field f
(pop) ; 12
(set-option :timeout 0)
(push) ; 12
; [else-branch: 43 | j@97@01 < |xs@33@01|]
(assert (< j@97@01 (Seq_length xs@33@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index ys@34@01 i@45@01) (Seq_index xs@33@01 i@38@01))
    (=
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))))
  
  :qid |quant-u-85|))))
(check-sat)
; unknown
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; Assume upper permission bound for field f
; [eval] i != j
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or (< j@97@01 (Seq_length xs@33@01)) (not (< j@97@01 (Seq_length xs@33@01)))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@97@01 0)
  (and
    (>= j@97@01 0)
    (or
      (< j@97@01 (Seq_length xs@33@01))
      (not (< j@97@01 (Seq_length xs@33@01)))))))
(assert (or (>= j@97@01 0) (not (>= j@97@01 0))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@48@01 r)
      (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
    (= ($FVF.lookup_f (as sm@98@01  $FVF<f>) r) ($FVF.lookup_f $t@46@01 r)))
  :pattern (($FVF.lookup_f (as sm@98@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@46@01 r))
  :qid |qp.fvfValDef40|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@41@01 r)
      (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
    (= ($FVF.lookup_f (as sm@98@01  $FVF<f>) r) ($FVF.lookup_f $t@39@01 r)))
  :pattern (($FVF.lookup_f (as sm@98@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@39@01 r))
  :qid |qp.fvfValDef41|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@99@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@99@01  $FPM) r))
  :qid |qp.resPrmSumDef42|)))
(assert (=>
  (not (< i@96@01 (Seq_length xs@33@01)))
  (and
    (not (< i@96@01 (Seq_length xs@33@01)))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@99@01  $FPM) r) $Perm.Write)
      :pattern ((inv@47@01 r))
      :qid |qp-fld-prm-bnd|))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@99@01  $FPM) r) $Perm.Write)
      :pattern ((inv@40@01 r))
      :qid |qp-fld-prm-bnd|)))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@48@01 r)
      (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
    (= ($FVF.lookup_f (as sm@100@01  $FVF<f>) r) ($FVF.lookup_f $t@46@01 r)))
  :pattern (($FVF.lookup_f (as sm@100@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@46@01 r))
  :qid |qp.fvfValDef43|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@41@01 r)
      (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
    (= ($FVF.lookup_f (as sm@100@01  $FVF<f>) r) ($FVF.lookup_f $t@39@01 r)))
  :pattern (($FVF.lookup_f (as sm@100@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@39@01 r))
  :qid |qp.fvfValDef44|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@101@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@101@01  $FPM) r))
  :qid |qp.resPrmSumDef45|)))
(assert (=>
  (< i@96@01 (Seq_length xs@33@01))
  (and
    (< i@96@01 (Seq_length xs@33@01))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@101@01  $FPM) r) $Perm.Write)
      :pattern ((inv@47@01 r))
      :qid |qp-fld-prm-bnd|))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@101@01  $FPM) r) $Perm.Write)
      :pattern ((inv@40@01 r))
      :qid |qp-fld-prm-bnd|))
    (=>
      (>= j@97@01 0)
      (and
        (>= j@97@01 0)
        (or
          (< j@97@01 (Seq_length xs@33@01))
          (not (< j@97@01 (Seq_length xs@33@01))))))
    (or (>= j@97@01 0) (not (>= j@97@01 0))))))
(assert (or (< i@96@01 (Seq_length xs@33@01)) (not (< i@96@01 (Seq_length xs@33@01)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@48@01 r)
      (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
    (= ($FVF.lookup_f (as sm@98@01  $FVF<f>) r) ($FVF.lookup_f $t@46@01 r)))
  :pattern (($FVF.lookup_f (as sm@98@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@46@01 r))
  :qid |qp.fvfValDef40|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@41@01 r)
      (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
    (= ($FVF.lookup_f (as sm@98@01  $FVF<f>) r) ($FVF.lookup_f $t@39@01 r)))
  :pattern (($FVF.lookup_f (as sm@98@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@39@01 r))
  :qid |qp.fvfValDef41|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@99@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@99@01  $FPM) r))
  :qid |qp.resPrmSumDef42|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@48@01 r)
      (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
    (= ($FVF.lookup_f (as sm@100@01  $FVF<f>) r) ($FVF.lookup_f $t@46@01 r)))
  :pattern (($FVF.lookup_f (as sm@100@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@46@01 r))
  :qid |qp.fvfValDef43|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@41@01 r)
      (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
    (= ($FVF.lookup_f (as sm@100@01  $FVF<f>) r) ($FVF.lookup_f $t@39@01 r)))
  :pattern (($FVF.lookup_f (as sm@100@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@39@01 r))
  :qid |qp.fvfValDef44|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@101@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@101@01  $FPM) r))
  :qid |qp.resPrmSumDef45|)))
(assert (=>
  (>= i@96@01 0)
  (and
    (>= i@96@01 0)
    (=>
      (not (< i@96@01 (Seq_length xs@33@01)))
      (and
        (not (< i@96@01 (Seq_length xs@33@01)))
        (forall ((r $Ref)) (!
          (<= ($FVF.perm_f (as pm@99@01  $FPM) r) $Perm.Write)
          :pattern ((inv@47@01 r))
          :qid |qp-fld-prm-bnd|))
        (forall ((r $Ref)) (!
          (<= ($FVF.perm_f (as pm@99@01  $FPM) r) $Perm.Write)
          :pattern ((inv@40@01 r))
          :qid |qp-fld-prm-bnd|))))
    (=>
      (< i@96@01 (Seq_length xs@33@01))
      (and
        (< i@96@01 (Seq_length xs@33@01))
        (forall ((r $Ref)) (!
          (<= ($FVF.perm_f (as pm@101@01  $FPM) r) $Perm.Write)
          :pattern ((inv@47@01 r))
          :qid |qp-fld-prm-bnd|))
        (forall ((r $Ref)) (!
          (<= ($FVF.perm_f (as pm@101@01  $FPM) r) $Perm.Write)
          :pattern ((inv@40@01 r))
          :qid |qp-fld-prm-bnd|))
        (=>
          (>= j@97@01 0)
          (and
            (>= j@97@01 0)
            (or
              (< j@97@01 (Seq_length xs@33@01))
              (not (< j@97@01 (Seq_length xs@33@01))))))
        (or (>= j@97@01 0) (not (>= j@97@01 0)))))
    (or
      (< i@96@01 (Seq_length xs@33@01))
      (not (< i@96@01 (Seq_length xs@33@01)))))))
(assert (or (>= i@96@01 0) (not (>= i@96@01 0))))
(set-option :timeout 0)
(push) ; 5
; [then-branch: 44 | i@96@01 >= 0 && i@96@01 < |xs@33@01| && j@97@01 >= 0 && j@97@01 < |xs@33@01| && i@96@01 != j@97@01 | live]
; [else-branch: 44 | !(i@96@01 >= 0 && i@96@01 < |xs@33@01| && j@97@01 >= 0 && j@97@01 < |xs@33@01| && i@96@01 != j@97@01) | live]
(push) ; 6
; [then-branch: 44 | i@96@01 >= 0 && i@96@01 < |xs@33@01| && j@97@01 >= 0 && j@97@01 < |xs@33@01| && i@96@01 != j@97@01]
(assert (and
  (>= i@96@01 0)
  (and
    (< i@96@01 (Seq_length xs@33@01))
    (and
      (>= j@97@01 0)
      (and (< j@97@01 (Seq_length xs@33@01)) (not (= i@96@01 j@97@01)))))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@33@01 i@38@01) (Seq_index ys@34@01 i@45@01))
    (=
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))))
  
  :qid |quant-u-86|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; Assume upper permission bound for field f
; [eval] xs[i] != xs[j]
; [eval] xs[i]
; [eval] xs[j]
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 44 | !(i@96@01 >= 0 && i@96@01 < |xs@33@01| && j@97@01 >= 0 && j@97@01 < |xs@33@01| && i@96@01 != j@97@01)]
(assert (not
  (and
    (>= i@96@01 0)
    (and
      (< i@96@01 (Seq_length xs@33@01))
      (and
        (>= j@97@01 0)
        (and (< j@97@01 (Seq_length xs@33@01)) (not (= i@96@01 j@97@01))))))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@33@01 i@38@01) (Seq_index ys@34@01 i@45@01))
    (=
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))))
  
  :qid |quant-u-87|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; Assume upper permission bound for field f
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (>= i@96@01 0)
    (and
      (< i@96@01 (Seq_length xs@33@01))
      (and
        (>= j@97@01 0)
        (and (< j@97@01 (Seq_length xs@33@01)) (not (= i@96@01 j@97@01))))))
  (and
    (>= i@96@01 0)
    (< i@96@01 (Seq_length xs@33@01))
    (>= j@97@01 0)
    (< j@97@01 (Seq_length xs@33@01))
    (not (= i@96@01 j@97@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= i@96@01 0)
      (and
        (< i@96@01 (Seq_length xs@33@01))
        (and
          (>= j@97@01 0)
          (and (< j@97@01 (Seq_length xs@33@01)) (not (= i@96@01 j@97@01)))))))
  (and
    (>= i@96@01 0)
    (and
      (< i@96@01 (Seq_length xs@33@01))
      (and
        (>= j@97@01 0)
        (and (< j@97@01 (Seq_length xs@33@01)) (not (= i@96@01 j@97@01))))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@48@01 r)
      (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
    (= ($FVF.lookup_f (as sm@98@01  $FVF<f>) r) ($FVF.lookup_f $t@46@01 r)))
  :pattern (($FVF.lookup_f (as sm@98@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@46@01 r))
  :qid |qp.fvfValDef40|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@41@01 r)
      (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
    (= ($FVF.lookup_f (as sm@98@01  $FVF<f>) r) ($FVF.lookup_f $t@39@01 r)))
  :pattern (($FVF.lookup_f (as sm@98@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@39@01 r))
  :qid |qp.fvfValDef41|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@99@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@99@01  $FPM) r))
  :qid |qp.resPrmSumDef42|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@48@01 r)
      (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
    (= ($FVF.lookup_f (as sm@100@01  $FVF<f>) r) ($FVF.lookup_f $t@46@01 r)))
  :pattern (($FVF.lookup_f (as sm@100@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@46@01 r))
  :qid |qp.fvfValDef43|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@41@01 r)
      (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
    (= ($FVF.lookup_f (as sm@100@01  $FVF<f>) r) ($FVF.lookup_f $t@39@01 r)))
  :pattern (($FVF.lookup_f (as sm@100@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@39@01 r))
  :qid |qp.fvfValDef44|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@101@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@101@01  $FPM) r))
  :qid |qp.resPrmSumDef45|)))
; Nested auxiliary terms: non-globals (aux)
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((i@96@01 Int) (j@97@01 Int)) (!
  (=>
    (and
      (>= i@96@01 0)
      (and
        (< i@96@01 (Seq_length xs@33@01))
        (and
          (>= j@97@01 0)
          (and (< j@97@01 (Seq_length xs@33@01)) (not (= i@96@01 j@97@01))))))
    (not (= (Seq_index xs@33@01 i@96@01) (Seq_index xs@33@01 j@97@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions2.vpr@26@12@26@106|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@96@01 Int) (j@97@01 Int)) (!
  (=>
    (and
      (>= i@96@01 0)
      (and
        (< i@96@01 (Seq_length xs@33@01))
        (and
          (>= j@97@01 0)
          (and (< j@97@01 (Seq_length xs@33@01)) (not (= i@96@01 j@97@01))))))
    (not (= (Seq_index xs@33@01 i@96@01) (Seq_index xs@33@01 j@97@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions2.vpr@26@12@26@106|)))
(declare-const i@102@01 Int)
(push) ; 4
; [eval] 0 <= i && i < |xs|
; [eval] 0 <= i
(push) ; 5
; [then-branch: 45 | !(0 <= i@102@01) | live]
; [else-branch: 45 | 0 <= i@102@01 | live]
(push) ; 6
; [then-branch: 45 | !(0 <= i@102@01)]
(assert (not (<= 0 i@102@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@33@01 i@38@01) (Seq_index ys@34@01 i@45@01))
    (=
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))))
  
  :qid |quant-u-88|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; Assume upper permission bound for field f
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 45 | 0 <= i@102@01]
(assert (<= 0 i@102@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@33@01 i@38@01) (Seq_index ys@34@01 i@45@01))
    (=
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))))
  
  :qid |quant-u-89|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; Assume upper permission bound for field f
; [eval] i < |xs|
; [eval] |xs|
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@102@01) (not (<= 0 i@102@01))))
(assert (and (<= 0 i@102@01) (< i@102@01 (Seq_length xs@33@01))))
; [eval] xs[i]
(set-option :timeout 0)
(push) ; 5
(assert (not (>= i@102@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@103@01 ($Ref) Int)
(declare-fun img@104@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@102@01 Int)) (!
  (=>
    (and (<= 0 i@102@01) (< i@102@01 (Seq_length xs@33@01)))
    (or (<= 0 i@102@01) (not (<= 0 i@102@01))))
  :pattern ((Seq_index xs@33@01 i@102@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@102@01 Int) (i2@102@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@102@01) (< i1@102@01 (Seq_length xs@33@01)))
      (and (<= 0 i2@102@01) (< i2@102@01 (Seq_length xs@33@01)))
      (= (Seq_index xs@33@01 i1@102@01) (Seq_index xs@33@01 i2@102@01)))
    (= i1@102@01 i2@102@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@102@01 Int)) (!
  (=>
    (and (<= 0 i@102@01) (< i@102@01 (Seq_length xs@33@01)))
    (and
      (= (inv@103@01 (Seq_index xs@33@01 i@102@01)) i@102@01)
      (img@104@01 (Seq_index xs@33@01 i@102@01))))
  :pattern ((Seq_index xs@33@01 i@102@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@104@01 r)
      (and (<= 0 (inv@103@01 r)) (< (inv@103@01 r) (Seq_length xs@33@01))))
    (= (Seq_index xs@33@01 (inv@103@01 r)) r))
  :pattern ((inv@103@01 r))
  :qid |f-fctOfInv|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((i@102@01 Int)) (!
  (= (Seq_index xs@33@01 i@102@01) (Seq_index ys@34@01 i@102@01))
  
  :qid |quant-u-91|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@105@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@103@01 r)) (< (inv@103@01 r) (Seq_length xs@33@01)))
      (img@104@01 r)
      (= r (Seq_index xs@33@01 (inv@103@01 r))))
    ($Perm.min
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@106@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@103@01 r)) (< (inv@103@01 r) (Seq_length xs@33@01)))
      (img@104@01 r)
      (= r (Seq_index xs@33@01 (inv@103@01 r))))
    ($Perm.min
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@105@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
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
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@105@01 r))
    $Perm.No)
  
  :qid |quant-u-93|))))
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
      (and (<= 0 (inv@103@01 r)) (< (inv@103@01 r) (Seq_length xs@33@01)))
      (img@104@01 r)
      (= r (Seq_index xs@33@01 (inv@103@01 r))))
    (= (- $Perm.Write (pTaken@105@01 r)) $Perm.No))
  
  :qid |quant-u-94|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@107@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@107@01  $FVF<f>)))
      (and
        (and (<= 0 (inv@103@01 r)) (< (inv@103@01 r) (Seq_length xs@33@01)))
        (img@104@01 r)))
    (=>
      (and
        (and (<= 0 (inv@103@01 r)) (< (inv@103@01 r) (Seq_length xs@33@01)))
        (img@104@01 r))
      (Set_in r ($FVF.domain_f (as sm@107@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@107@01  $FVF<f>))))
  :qid |qp.fvfDomDef48|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@103@01 r)) (< (inv@103@01 r) (Seq_length xs@33@01)))
        (img@104@01 r))
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01)))))
    (= ($FVF.lookup_f (as sm@107@01  $FVF<f>) r) ($FVF.lookup_f $t@39@01 r)))
  :pattern (($FVF.lookup_f (as sm@107@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@39@01 r))
  :qid |qp.fvfValDef46|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@103@01 r)) (< (inv@103@01 r) (Seq_length xs@33@01)))
        (img@104@01 r))
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01)))))
    (= ($FVF.lookup_f (as sm@107@01  $FVF<f>) r) ($FVF.lookup_f $t@46@01 r)))
  :pattern (($FVF.lookup_f (as sm@107@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@46@01 r))
  :qid |qp.fvfValDef47|)))
; [eval] (forall i: Int, j: Int ::i >= 0 && (i < |ys| && (j >= 0 && (j < |ys| && i != j))) ==> ys[i] != ys[j])
(declare-const i@108@01 Int)
(declare-const j@109@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] i >= 0 && (i < |ys| && (j >= 0 && (j < |ys| && i != j))) ==> ys[i] != ys[j]
; [eval] i >= 0 && (i < |ys| && (j >= 0 && (j < |ys| && i != j)))
; [eval] i >= 0
(push) ; 5
; [then-branch: 46 | !(i@108@01 >= 0) | live]
; [else-branch: 46 | i@108@01 >= 0 | live]
(push) ; 6
; [then-branch: 46 | !(i@108@01 >= 0)]
(assert (not (>= i@108@01 0)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@33@01 i@38@01) (Seq_index ys@34@01 i@45@01))
    (=
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))))
  
  :qid |quant-u-95|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(declare-const sm@110@01 $FVF<f>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@41@01 r)
      (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
    (= ($FVF.lookup_f (as sm@110@01  $FVF<f>) r) ($FVF.lookup_f $t@39@01 r)))
  :pattern (($FVF.lookup_f (as sm@110@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@39@01 r))
  :qid |qp.fvfValDef49|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@48@01 r)
      (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
    (= ($FVF.lookup_f (as sm@110@01  $FVF<f>) r) ($FVF.lookup_f $t@46@01 r)))
  :pattern (($FVF.lookup_f (as sm@110@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@46@01 r))
  :qid |qp.fvfValDef50|)))
; Assume upper permission bound for field f
; Assume upper permission bound for field f
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 46 | i@108@01 >= 0]
(assert (>= i@108@01 0))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@33@01 i@38@01) (Seq_index ys@34@01 i@45@01))
    (=
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))))
  
  :qid |quant-u-96|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(declare-const sm@111@01 $FVF<f>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@41@01 r)
      (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
    (= ($FVF.lookup_f (as sm@111@01  $FVF<f>) r) ($FVF.lookup_f $t@39@01 r)))
  :pattern (($FVF.lookup_f (as sm@111@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@39@01 r))
  :qid |qp.fvfValDef51|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@48@01 r)
      (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
    (= ($FVF.lookup_f (as sm@111@01  $FVF<f>) r) ($FVF.lookup_f $t@46@01 r)))
  :pattern (($FVF.lookup_f (as sm@111@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@46@01 r))
  :qid |qp.fvfValDef52|)))
; Assume upper permission bound for field f
; Assume upper permission bound for field f
; [eval] i < |ys|
; [eval] |ys|
(set-option :timeout 0)
(push) ; 7
; [then-branch: 47 | !(i@108@01 < |ys@34@01|) | live]
; [else-branch: 47 | i@108@01 < |ys@34@01| | live]
(push) ; 8
; [then-branch: 47 | !(i@108@01 < |ys@34@01|)]
(assert (not (< i@108@01 (Seq_length ys@34@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index ys@34@01 i@45@01) (Seq_index xs@33@01 i@38@01))
    (=
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))))
  
  :qid |quant-u-97|))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(declare-const pm@112@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@112@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@112@01  $FPM) r))
  :qid |qp.resPrmSumDef53|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@112@01  $FPM) r) $Perm.Write)
  :pattern ((inv@47@01 r))
  :qid |qp-fld-prm-bnd|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@112@01  $FPM) r) $Perm.Write)
  :pattern ((inv@40@01 r))
  :qid |qp-fld-prm-bnd|)))
(pop) ; 8
(set-option :timeout 0)
(push) ; 8
; [else-branch: 47 | i@108@01 < |ys@34@01|]
(assert (< i@108@01 (Seq_length ys@34@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index ys@34@01 i@45@01) (Seq_index xs@33@01 i@38@01))
    (=
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))))
  
  :qid |quant-u-98|))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(declare-const pm@113@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@113@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@113@01  $FPM) r))
  :qid |qp.resPrmSumDef54|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@113@01  $FPM) r) $Perm.Write)
  :pattern ((inv@47@01 r))
  :qid |qp-fld-prm-bnd|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@113@01  $FPM) r) $Perm.Write)
  :pattern ((inv@40@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] j >= 0
(set-option :timeout 0)
(push) ; 9
; [then-branch: 48 | !(j@109@01 >= 0) | live]
; [else-branch: 48 | j@109@01 >= 0 | live]
(push) ; 10
; [then-branch: 48 | !(j@109@01 >= 0)]
(assert (not (>= j@109@01 0)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@33@01 i@38@01) (Seq_index ys@34@01 i@45@01))
    (=
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))))
  
  :qid |quant-u-99|))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; Assume upper permission bound for field f
(pop) ; 10
(set-option :timeout 0)
(push) ; 10
; [else-branch: 48 | j@109@01 >= 0]
(assert (>= j@109@01 0))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@33@01 i@38@01) (Seq_index ys@34@01 i@45@01))
    (=
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))))
  
  :qid |quant-u-100|))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; Assume upper permission bound for field f
; [eval] j < |ys|
; [eval] |ys|
(set-option :timeout 0)
(push) ; 11
; [then-branch: 49 | !(j@109@01 < |ys@34@01|) | live]
; [else-branch: 49 | j@109@01 < |ys@34@01| | live]
(push) ; 12
; [then-branch: 49 | !(j@109@01 < |ys@34@01|)]
(assert (not (< j@109@01 (Seq_length ys@34@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index ys@34@01 i@45@01) (Seq_index xs@33@01 i@38@01))
    (=
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))))
  
  :qid |quant-u-101|))))
(check-sat)
; unknown
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; Assume upper permission bound for field f
(pop) ; 12
(set-option :timeout 0)
(push) ; 12
; [else-branch: 49 | j@109@01 < |ys@34@01|]
(assert (< j@109@01 (Seq_length ys@34@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index ys@34@01 i@45@01) (Seq_index xs@33@01 i@38@01))
    (=
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))))
  
  :qid |quant-u-102|))))
(check-sat)
; unknown
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; Assume upper permission bound for field f
; [eval] i != j
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or (< j@109@01 (Seq_length ys@34@01)) (not (< j@109@01 (Seq_length ys@34@01)))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@109@01 0)
  (and
    (>= j@109@01 0)
    (or
      (< j@109@01 (Seq_length ys@34@01))
      (not (< j@109@01 (Seq_length ys@34@01)))))))
(assert (or (>= j@109@01 0) (not (>= j@109@01 0))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@112@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@112@01  $FPM) r))
  :qid |qp.resPrmSumDef53|)))
(assert (=>
  (not (< i@108@01 (Seq_length ys@34@01)))
  (and
    (not (< i@108@01 (Seq_length ys@34@01)))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@112@01  $FPM) r) $Perm.Write)
      :pattern ((inv@47@01 r))
      :qid |qp-fld-prm-bnd|))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@112@01  $FPM) r) $Perm.Write)
      :pattern ((inv@40@01 r))
      :qid |qp-fld-prm-bnd|)))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@113@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@113@01  $FPM) r))
  :qid |qp.resPrmSumDef54|)))
(assert (=>
  (< i@108@01 (Seq_length ys@34@01))
  (and
    (< i@108@01 (Seq_length ys@34@01))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@113@01  $FPM) r) $Perm.Write)
      :pattern ((inv@47@01 r))
      :qid |qp-fld-prm-bnd|))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@113@01  $FPM) r) $Perm.Write)
      :pattern ((inv@40@01 r))
      :qid |qp-fld-prm-bnd|))
    (=>
      (>= j@109@01 0)
      (and
        (>= j@109@01 0)
        (or
          (< j@109@01 (Seq_length ys@34@01))
          (not (< j@109@01 (Seq_length ys@34@01))))))
    (or (>= j@109@01 0) (not (>= j@109@01 0))))))
(assert (or (< i@108@01 (Seq_length ys@34@01)) (not (< i@108@01 (Seq_length ys@34@01)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@41@01 r)
      (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
    (= ($FVF.lookup_f (as sm@110@01  $FVF<f>) r) ($FVF.lookup_f $t@39@01 r)))
  :pattern (($FVF.lookup_f (as sm@110@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@39@01 r))
  :qid |qp.fvfValDef49|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@48@01 r)
      (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
    (= ($FVF.lookup_f (as sm@110@01  $FVF<f>) r) ($FVF.lookup_f $t@46@01 r)))
  :pattern (($FVF.lookup_f (as sm@110@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@46@01 r))
  :qid |qp.fvfValDef50|)))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@41@01 r)
      (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
    (= ($FVF.lookup_f (as sm@111@01  $FVF<f>) r) ($FVF.lookup_f $t@39@01 r)))
  :pattern (($FVF.lookup_f (as sm@111@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@39@01 r))
  :qid |qp.fvfValDef51|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@48@01 r)
      (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
    (= ($FVF.lookup_f (as sm@111@01  $FVF<f>) r) ($FVF.lookup_f $t@46@01 r)))
  :pattern (($FVF.lookup_f (as sm@111@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@46@01 r))
  :qid |qp.fvfValDef52|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@112@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@112@01  $FPM) r))
  :qid |qp.resPrmSumDef53|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@113@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@113@01  $FPM) r))
  :qid |qp.resPrmSumDef54|)))
(assert (=>
  (>= i@108@01 0)
  (and
    (>= i@108@01 0)
    (=>
      (not (< i@108@01 (Seq_length ys@34@01)))
      (and
        (not (< i@108@01 (Seq_length ys@34@01)))
        (forall ((r $Ref)) (!
          (<= ($FVF.perm_f (as pm@112@01  $FPM) r) $Perm.Write)
          :pattern ((inv@47@01 r))
          :qid |qp-fld-prm-bnd|))
        (forall ((r $Ref)) (!
          (<= ($FVF.perm_f (as pm@112@01  $FPM) r) $Perm.Write)
          :pattern ((inv@40@01 r))
          :qid |qp-fld-prm-bnd|))))
    (=>
      (< i@108@01 (Seq_length ys@34@01))
      (and
        (< i@108@01 (Seq_length ys@34@01))
        (forall ((r $Ref)) (!
          (<= ($FVF.perm_f (as pm@113@01  $FPM) r) $Perm.Write)
          :pattern ((inv@47@01 r))
          :qid |qp-fld-prm-bnd|))
        (forall ((r $Ref)) (!
          (<= ($FVF.perm_f (as pm@113@01  $FPM) r) $Perm.Write)
          :pattern ((inv@40@01 r))
          :qid |qp-fld-prm-bnd|))
        (=>
          (>= j@109@01 0)
          (and
            (>= j@109@01 0)
            (or
              (< j@109@01 (Seq_length ys@34@01))
              (not (< j@109@01 (Seq_length ys@34@01))))))
        (or (>= j@109@01 0) (not (>= j@109@01 0)))))
    (or
      (< i@108@01 (Seq_length ys@34@01))
      (not (< i@108@01 (Seq_length ys@34@01)))))))
(assert (or (>= i@108@01 0) (not (>= i@108@01 0))))
(set-option :timeout 0)
(push) ; 5
; [then-branch: 50 | i@108@01 >= 0 && i@108@01 < |ys@34@01| && j@109@01 >= 0 && j@109@01 < |ys@34@01| && i@108@01 != j@109@01 | live]
; [else-branch: 50 | !(i@108@01 >= 0 && i@108@01 < |ys@34@01| && j@109@01 >= 0 && j@109@01 < |ys@34@01| && i@108@01 != j@109@01) | live]
(push) ; 6
; [then-branch: 50 | i@108@01 >= 0 && i@108@01 < |ys@34@01| && j@109@01 >= 0 && j@109@01 < |ys@34@01| && i@108@01 != j@109@01]
(assert (and
  (>= i@108@01 0)
  (and
    (< i@108@01 (Seq_length ys@34@01))
    (and
      (>= j@109@01 0)
      (and (< j@109@01 (Seq_length ys@34@01)) (not (= i@108@01 j@109@01)))))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@33@01 i@38@01) (Seq_index ys@34@01 i@45@01))
    (=
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))))
  
  :qid |quant-u-103|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; Assume upper permission bound for field f
; [eval] ys[i] != ys[j]
; [eval] ys[i]
; [eval] ys[j]
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 50 | !(i@108@01 >= 0 && i@108@01 < |ys@34@01| && j@109@01 >= 0 && j@109@01 < |ys@34@01| && i@108@01 != j@109@01)]
(assert (not
  (and
    (>= i@108@01 0)
    (and
      (< i@108@01 (Seq_length ys@34@01))
      (and
        (>= j@109@01 0)
        (and (< j@109@01 (Seq_length ys@34@01)) (not (= i@108@01 j@109@01))))))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@33@01 i@38@01) (Seq_index ys@34@01 i@45@01))
    (=
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))))
  
  :qid |quant-u-104|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; Assume upper permission bound for field f
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (>= i@108@01 0)
    (and
      (< i@108@01 (Seq_length ys@34@01))
      (and
        (>= j@109@01 0)
        (and (< j@109@01 (Seq_length ys@34@01)) (not (= i@108@01 j@109@01))))))
  (and
    (>= i@108@01 0)
    (< i@108@01 (Seq_length ys@34@01))
    (>= j@109@01 0)
    (< j@109@01 (Seq_length ys@34@01))
    (not (= i@108@01 j@109@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= i@108@01 0)
      (and
        (< i@108@01 (Seq_length ys@34@01))
        (and
          (>= j@109@01 0)
          (and (< j@109@01 (Seq_length ys@34@01)) (not (= i@108@01 j@109@01)))))))
  (and
    (>= i@108@01 0)
    (and
      (< i@108@01 (Seq_length ys@34@01))
      (and
        (>= j@109@01 0)
        (and (< j@109@01 (Seq_length ys@34@01)) (not (= i@108@01 j@109@01))))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@41@01 r)
      (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
    (= ($FVF.lookup_f (as sm@110@01  $FVF<f>) r) ($FVF.lookup_f $t@39@01 r)))
  :pattern (($FVF.lookup_f (as sm@110@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@39@01 r))
  :qid |qp.fvfValDef49|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@48@01 r)
      (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
    (= ($FVF.lookup_f (as sm@110@01  $FVF<f>) r) ($FVF.lookup_f $t@46@01 r)))
  :pattern (($FVF.lookup_f (as sm@110@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@46@01 r))
  :qid |qp.fvfValDef50|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@41@01 r)
      (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
    (= ($FVF.lookup_f (as sm@111@01  $FVF<f>) r) ($FVF.lookup_f $t@39@01 r)))
  :pattern (($FVF.lookup_f (as sm@111@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@39@01 r))
  :qid |qp.fvfValDef51|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@48@01 r)
      (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
    (= ($FVF.lookup_f (as sm@111@01  $FVF<f>) r) ($FVF.lookup_f $t@46@01 r)))
  :pattern (($FVF.lookup_f (as sm@111@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@46@01 r))
  :qid |qp.fvfValDef52|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@112@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@112@01  $FPM) r))
  :qid |qp.resPrmSumDef53|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@113@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@113@01  $FPM) r))
  :qid |qp.resPrmSumDef54|)))
; Nested auxiliary terms: non-globals (aux)
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((i@108@01 Int) (j@109@01 Int)) (!
  (=>
    (and
      (>= i@108@01 0)
      (and
        (< i@108@01 (Seq_length ys@34@01))
        (and
          (>= j@109@01 0)
          (and (< j@109@01 (Seq_length ys@34@01)) (not (= i@108@01 j@109@01))))))
    (not (= (Seq_index ys@34@01 i@108@01) (Seq_index ys@34@01 j@109@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions2.vpr@28@12@28@106|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@108@01 Int) (j@109@01 Int)) (!
  (=>
    (and
      (>= i@108@01 0)
      (and
        (< i@108@01 (Seq_length ys@34@01))
        (and
          (>= j@109@01 0)
          (and (< j@109@01 (Seq_length ys@34@01)) (not (= i@108@01 j@109@01))))))
    (not (= (Seq_index ys@34@01 i@108@01) (Seq_index ys@34@01 j@109@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions2.vpr@28@12@28@106|)))
(declare-const i@114@01 Int)
(push) ; 4
; [eval] 0 <= i && i < |ys|
; [eval] 0 <= i
(push) ; 5
; [then-branch: 51 | !(0 <= i@114@01) | live]
; [else-branch: 51 | 0 <= i@114@01 | live]
(push) ; 6
; [then-branch: 51 | !(0 <= i@114@01)]
(assert (not (<= 0 i@114@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@33@01 i@38@01) (Seq_index ys@34@01 i@45@01))
    (=
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))))
  
  :qid |quant-u-105|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; Assume upper permission bound for field f
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 51 | 0 <= i@114@01]
(assert (<= 0 i@114@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@33@01 i@38@01) (Seq_index ys@34@01 i@45@01))
    (=
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))))
  
  :qid |quant-u-106|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; Assume upper permission bound for field f
; [eval] i < |ys|
; [eval] |ys|
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@114@01) (not (<= 0 i@114@01))))
(assert (and (<= 0 i@114@01) (< i@114@01 (Seq_length ys@34@01))))
; [eval] ys[i]
(set-option :timeout 0)
(push) ; 5
(assert (not (>= i@114@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@115@01 ($Ref) Int)
(declare-fun img@116@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@114@01 Int)) (!
  (=>
    (and (<= 0 i@114@01) (< i@114@01 (Seq_length ys@34@01)))
    (or (<= 0 i@114@01) (not (<= 0 i@114@01))))
  :pattern ((Seq_index ys@34@01 i@114@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@114@01 Int) (i2@114@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@114@01) (< i1@114@01 (Seq_length ys@34@01)))
      (and (<= 0 i2@114@01) (< i2@114@01 (Seq_length ys@34@01)))
      (= (Seq_index ys@34@01 i1@114@01) (Seq_index ys@34@01 i2@114@01)))
    (= i1@114@01 i2@114@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@114@01 Int)) (!
  (=>
    (and (<= 0 i@114@01) (< i@114@01 (Seq_length ys@34@01)))
    (and
      (= (inv@115@01 (Seq_index ys@34@01 i@114@01)) i@114@01)
      (img@116@01 (Seq_index ys@34@01 i@114@01))))
  :pattern ((Seq_index ys@34@01 i@114@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@116@01 r)
      (and (<= 0 (inv@115@01 r)) (< (inv@115@01 r) (Seq_length ys@34@01))))
    (= (Seq_index ys@34@01 (inv@115@01 r)) r))
  :pattern ((inv@115@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@117@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@115@01 r)) (< (inv@115@01 r) (Seq_length ys@34@01)))
      (img@116@01 r)
      (= r (Seq_index ys@34@01 (inv@115@01 r))))
    ($Perm.min
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
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
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@117@01 r))
    $Perm.No)
  
  :qid |quant-u-109|))))
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
      (and (<= 0 (inv@115@01 r)) (< (inv@115@01 r) (Seq_length ys@34@01)))
      (img@116@01 r)
      (= r (Seq_index ys@34@01 (inv@115@01 r))))
    (= (- $Perm.Write (pTaken@117@01 r)) $Perm.No))
  
  :qid |quant-u-110|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@118@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@118@01  $FVF<f>)))
      (and
        (and (<= 0 (inv@115@01 r)) (< (inv@115@01 r) (Seq_length ys@34@01)))
        (img@116@01 r)))
    (=>
      (and
        (and (<= 0 (inv@115@01 r)) (< (inv@115@01 r) (Seq_length ys@34@01)))
        (img@116@01 r))
      (Set_in r ($FVF.domain_f (as sm@118@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@118@01  $FVF<f>))))
  :qid |qp.fvfDomDef56|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@115@01 r)) (< (inv@115@01 r) (Seq_length ys@34@01)))
        (img@116@01 r))
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01)))))
    (= ($FVF.lookup_f (as sm@118@01  $FVF<f>) r) ($FVF.lookup_f $t@46@01 r)))
  :pattern (($FVF.lookup_f (as sm@118@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@46@01 r))
  :qid |qp.fvfValDef55|)))
; [eval] 10 < |xs|
; [eval] |xs|
; [eval] |xs| == |ys|
; [eval] |xs|
; [eval] |ys|
(assert (fun02%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$FVF<f>To$Snap (as sm@107@01  $FVF<f>))
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$FVF<f>To$Snap (as sm@118@01  $FVF<f>))
        ($Snap.combine $Snap.unit $Snap.unit))))) xs@33@01 ys@34@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@48@01 r)
      (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
    (= ($FVF.lookup_f (as sm@98@01  $FVF<f>) r) ($FVF.lookup_f $t@46@01 r)))
  :pattern (($FVF.lookup_f (as sm@98@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@46@01 r))
  :qid |qp.fvfValDef40|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@41@01 r)
      (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
    (= ($FVF.lookup_f (as sm@98@01  $FVF<f>) r) ($FVF.lookup_f $t@39@01 r)))
  :pattern (($FVF.lookup_f (as sm@98@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@39@01 r))
  :qid |qp.fvfValDef41|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@99@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@99@01  $FPM) r))
  :qid |qp.resPrmSumDef42|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@48@01 r)
      (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
    (= ($FVF.lookup_f (as sm@100@01  $FVF<f>) r) ($FVF.lookup_f $t@46@01 r)))
  :pattern (($FVF.lookup_f (as sm@100@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@46@01 r))
  :qid |qp.fvfValDef43|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@41@01 r)
      (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
    (= ($FVF.lookup_f (as sm@100@01  $FVF<f>) r) ($FVF.lookup_f $t@39@01 r)))
  :pattern (($FVF.lookup_f (as sm@100@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@39@01 r))
  :qid |qp.fvfValDef44|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@101@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@101@01  $FPM) r))
  :qid |qp.resPrmSumDef45|)))
(assert (forall ((i@102@01 Int)) (!
  (=>
    (and (<= 0 i@102@01) (< i@102@01 (Seq_length xs@33@01)))
    (and
      (= (inv@103@01 (Seq_index xs@33@01 i@102@01)) i@102@01)
      (img@104@01 (Seq_index xs@33@01 i@102@01))))
  :pattern ((Seq_index xs@33@01 i@102@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@104@01 r)
      (and (<= 0 (inv@103@01 r)) (< (inv@103@01 r) (Seq_length xs@33@01))))
    (= (Seq_index xs@33@01 (inv@103@01 r)) r))
  :pattern ((inv@103@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@107@01  $FVF<f>)))
      (and
        (and (<= 0 (inv@103@01 r)) (< (inv@103@01 r) (Seq_length xs@33@01)))
        (img@104@01 r)))
    (=>
      (and
        (and (<= 0 (inv@103@01 r)) (< (inv@103@01 r) (Seq_length xs@33@01)))
        (img@104@01 r))
      (Set_in r ($FVF.domain_f (as sm@107@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@107@01  $FVF<f>))))
  :qid |qp.fvfDomDef48|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@103@01 r)) (< (inv@103@01 r) (Seq_length xs@33@01)))
        (img@104@01 r))
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01)))))
    (= ($FVF.lookup_f (as sm@107@01  $FVF<f>) r) ($FVF.lookup_f $t@39@01 r)))
  :pattern (($FVF.lookup_f (as sm@107@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@39@01 r))
  :qid |qp.fvfValDef46|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@103@01 r)) (< (inv@103@01 r) (Seq_length xs@33@01)))
        (img@104@01 r))
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01)))))
    (= ($FVF.lookup_f (as sm@107@01  $FVF<f>) r) ($FVF.lookup_f $t@46@01 r)))
  :pattern (($FVF.lookup_f (as sm@107@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@46@01 r))
  :qid |qp.fvfValDef47|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@41@01 r)
      (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
    (= ($FVF.lookup_f (as sm@110@01  $FVF<f>) r) ($FVF.lookup_f $t@39@01 r)))
  :pattern (($FVF.lookup_f (as sm@110@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@39@01 r))
  :qid |qp.fvfValDef49|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@48@01 r)
      (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
    (= ($FVF.lookup_f (as sm@110@01  $FVF<f>) r) ($FVF.lookup_f $t@46@01 r)))
  :pattern (($FVF.lookup_f (as sm@110@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@46@01 r))
  :qid |qp.fvfValDef50|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@41@01 r)
      (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
    (= ($FVF.lookup_f (as sm@111@01  $FVF<f>) r) ($FVF.lookup_f $t@39@01 r)))
  :pattern (($FVF.lookup_f (as sm@111@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@39@01 r))
  :qid |qp.fvfValDef51|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@48@01 r)
      (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
    (= ($FVF.lookup_f (as sm@111@01  $FVF<f>) r) ($FVF.lookup_f $t@46@01 r)))
  :pattern (($FVF.lookup_f (as sm@111@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@46@01 r))
  :qid |qp.fvfValDef52|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@112@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@112@01  $FPM) r))
  :qid |qp.resPrmSumDef53|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@113@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@113@01  $FPM) r))
  :qid |qp.resPrmSumDef54|)))
(assert (forall ((i@114@01 Int)) (!
  (=>
    (and (<= 0 i@114@01) (< i@114@01 (Seq_length ys@34@01)))
    (and
      (= (inv@115@01 (Seq_index ys@34@01 i@114@01)) i@114@01)
      (img@116@01 (Seq_index ys@34@01 i@114@01))))
  :pattern ((Seq_index ys@34@01 i@114@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@116@01 r)
      (and (<= 0 (inv@115@01 r)) (< (inv@115@01 r) (Seq_length ys@34@01))))
    (= (Seq_index ys@34@01 (inv@115@01 r)) r))
  :pattern ((inv@115@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@118@01  $FVF<f>)))
      (and
        (and (<= 0 (inv@115@01 r)) (< (inv@115@01 r) (Seq_length ys@34@01)))
        (img@116@01 r)))
    (=>
      (and
        (and (<= 0 (inv@115@01 r)) (< (inv@115@01 r) (Seq_length ys@34@01)))
        (img@116@01 r))
      (Set_in r ($FVF.domain_f (as sm@118@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@118@01  $FVF<f>))))
  :qid |qp.fvfDomDef56|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@115@01 r)) (< (inv@115@01 r) (Seq_length ys@34@01)))
        (img@116@01 r))
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01)))))
    (= ($FVF.lookup_f (as sm@118@01  $FVF<f>) r) ($FVF.lookup_f $t@46@01 r)))
  :pattern (($FVF.lookup_f (as sm@118@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@46@01 r))
  :qid |qp.fvfValDef55|)))
(assert (and
  (forall ((i@96@01 Int) (j@97@01 Int)) (!
    (=>
      (and
        (>= i@96@01 0)
        (and
          (< i@96@01 (Seq_length xs@33@01))
          (and
            (>= j@97@01 0)
            (and (< j@97@01 (Seq_length xs@33@01)) (not (= i@96@01 j@97@01))))))
      (not (= (Seq_index xs@33@01 i@96@01) (Seq_index xs@33@01 j@97@01))))
    
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions2.vpr@26@12@26@106|))
  (forall ((i@102@01 Int)) (!
    (=>
      (and (<= 0 i@102@01) (< i@102@01 (Seq_length xs@33@01)))
      (or (<= 0 i@102@01) (not (<= 0 i@102@01))))
    :pattern ((Seq_index xs@33@01 i@102@01))
    :qid |f-aux|))
  (forall ((i@108@01 Int) (j@109@01 Int)) (!
    (=>
      (and
        (>= i@108@01 0)
        (and
          (< i@108@01 (Seq_length ys@34@01))
          (and
            (>= j@109@01 0)
            (and (< j@109@01 (Seq_length ys@34@01)) (not (= i@108@01 j@109@01))))))
      (not (= (Seq_index ys@34@01 i@108@01) (Seq_index ys@34@01 j@109@01))))
    
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions2.vpr@28@12@28@106|))
  (forall ((i@114@01 Int)) (!
    (=>
      (and (<= 0 i@114@01) (< i@114@01 (Seq_length ys@34@01)))
      (or (<= 0 i@114@01) (not (<= 0 i@114@01))))
    :pattern ((Seq_index ys@34@01 i@114@01))
    :qid |f-aux|))
  (fun02%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<f>To$Snap (as sm@107@01  $FVF<f>))
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$FVF<f>To$Snap (as sm@118@01  $FVF<f>))
          ($Snap.combine $Snap.unit $Snap.unit))))) xs@33@01 ys@34@01)))
(set-option :timeout 0)
(push) ; 3
(assert (not (fun02 ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$FVF<f>To$Snap (as sm@107@01  $FVF<f>))
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$FVF<f>To$Snap (as sm@118@01  $FVF<f>))
        ($Snap.combine $Snap.unit $Snap.unit))))) xs@33@01 ys@34@01)))
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
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@33@01 i@38@01) (Seq_index ys@34@01 i@45@01))
    (=
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))))
  
  :qid |quant-u-111|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; Assume upper permission bound for field f
; [eval] fun02(xs, ys)
(set-option :timeout 0)
(push) ; 3
; [eval] (forall i: Int, j: Int ::i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==> xs[i] != xs[j])
(declare-const i@119@01 Int)
(declare-const j@120@01 Int)
(push) ; 4
; [eval] i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==> xs[i] != xs[j]
; [eval] i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j)))
; [eval] i >= 0
(push) ; 5
; [then-branch: 52 | !(i@119@01 >= 0) | live]
; [else-branch: 52 | i@119@01 >= 0 | live]
(push) ; 6
; [then-branch: 52 | !(i@119@01 >= 0)]
(assert (not (>= i@119@01 0)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index ys@34@01 i@45@01) (Seq_index xs@33@01 i@38@01))
    (=
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))))
  
  :qid |quant-u-112|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(declare-const sm@121@01 $FVF<f>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@48@01 r)
      (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
    (= ($FVF.lookup_f (as sm@121@01  $FVF<f>) r) ($FVF.lookup_f $t@46@01 r)))
  :pattern (($FVF.lookup_f (as sm@121@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@46@01 r))
  :qid |qp.fvfValDef57|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@41@01 r)
      (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
    (= ($FVF.lookup_f (as sm@121@01  $FVF<f>) r) ($FVF.lookup_f $t@39@01 r)))
  :pattern (($FVF.lookup_f (as sm@121@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@39@01 r))
  :qid |qp.fvfValDef58|)))
(declare-const pm@122@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@122@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@122@01  $FPM) r))
  :qid |qp.resPrmSumDef59|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@122@01  $FPM) r) $Perm.Write)
  :pattern ((inv@47@01 r))
  :qid |qp-fld-prm-bnd|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@122@01  $FPM) r) $Perm.Write)
  :pattern ((inv@40@01 r))
  :qid |qp-fld-prm-bnd|)))
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 52 | i@119@01 >= 0]
(assert (>= i@119@01 0))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index ys@34@01 i@45@01) (Seq_index xs@33@01 i@38@01))
    (=
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))))
  
  :qid |quant-u-113|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(declare-const sm@123@01 $FVF<f>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@48@01 r)
      (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
    (= ($FVF.lookup_f (as sm@123@01  $FVF<f>) r) ($FVF.lookup_f $t@46@01 r)))
  :pattern (($FVF.lookup_f (as sm@123@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@46@01 r))
  :qid |qp.fvfValDef60|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@41@01 r)
      (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
    (= ($FVF.lookup_f (as sm@123@01  $FVF<f>) r) ($FVF.lookup_f $t@39@01 r)))
  :pattern (($FVF.lookup_f (as sm@123@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@39@01 r))
  :qid |qp.fvfValDef61|)))
(declare-const pm@124@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@124@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@124@01  $FPM) r))
  :qid |qp.resPrmSumDef62|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@124@01  $FPM) r) $Perm.Write)
  :pattern ((inv@47@01 r))
  :qid |qp-fld-prm-bnd|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@124@01  $FPM) r) $Perm.Write)
  :pattern ((inv@40@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] i < |xs|
; [eval] |xs|
(set-option :timeout 0)
(push) ; 7
; [then-branch: 53 | !(i@119@01 < |xs@33@01|) | live]
; [else-branch: 53 | i@119@01 < |xs@33@01| | live]
(push) ; 8
; [then-branch: 53 | !(i@119@01 < |xs@33@01|)]
(assert (not (< i@119@01 (Seq_length xs@33@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@33@01 i@38@01) (Seq_index ys@34@01 i@45@01))
    (=
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))))
  
  :qid |quant-u-114|))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; Assume upper permission bound for field f
(pop) ; 8
(set-option :timeout 0)
(push) ; 8
; [else-branch: 53 | i@119@01 < |xs@33@01|]
(assert (< i@119@01 (Seq_length xs@33@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@33@01 i@38@01) (Seq_index ys@34@01 i@45@01))
    (=
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))))
  
  :qid |quant-u-115|))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; Assume upper permission bound for field f
; [eval] j >= 0
(set-option :timeout 0)
(push) ; 9
; [then-branch: 54 | !(j@120@01 >= 0) | live]
; [else-branch: 54 | j@120@01 >= 0 | live]
(push) ; 10
; [then-branch: 54 | !(j@120@01 >= 0)]
(assert (not (>= j@120@01 0)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index ys@34@01 i@45@01) (Seq_index xs@33@01 i@38@01))
    (=
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))))
  
  :qid |quant-u-116|))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; Assume upper permission bound for field f
(pop) ; 10
(set-option :timeout 0)
(push) ; 10
; [else-branch: 54 | j@120@01 >= 0]
(assert (>= j@120@01 0))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index ys@34@01 i@45@01) (Seq_index xs@33@01 i@38@01))
    (=
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))))
  
  :qid |quant-u-117|))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; Assume upper permission bound for field f
; [eval] j < |xs|
; [eval] |xs|
(set-option :timeout 0)
(push) ; 11
; [then-branch: 55 | !(j@120@01 < |xs@33@01|) | live]
; [else-branch: 55 | j@120@01 < |xs@33@01| | live]
(push) ; 12
; [then-branch: 55 | !(j@120@01 < |xs@33@01|)]
(assert (not (< j@120@01 (Seq_length xs@33@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@33@01 i@38@01) (Seq_index ys@34@01 i@45@01))
    (=
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))))
  
  :qid |quant-u-118|))))
(check-sat)
; unknown
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; Assume upper permission bound for field f
(pop) ; 12
(set-option :timeout 0)
(push) ; 12
; [else-branch: 55 | j@120@01 < |xs@33@01|]
(assert (< j@120@01 (Seq_length xs@33@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@33@01 i@38@01) (Seq_index ys@34@01 i@45@01))
    (=
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))))
  
  :qid |quant-u-119|))))
(check-sat)
; unknown
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; Assume upper permission bound for field f
; [eval] i != j
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or (< j@120@01 (Seq_length xs@33@01)) (not (< j@120@01 (Seq_length xs@33@01)))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@120@01 0)
  (and
    (>= j@120@01 0)
    (or
      (< j@120@01 (Seq_length xs@33@01))
      (not (< j@120@01 (Seq_length xs@33@01)))))))
(assert (or (>= j@120@01 0) (not (>= j@120@01 0))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i@119@01 (Seq_length xs@33@01))
  (and
    (< i@119@01 (Seq_length xs@33@01))
    (=>
      (>= j@120@01 0)
      (and
        (>= j@120@01 0)
        (or
          (< j@120@01 (Seq_length xs@33@01))
          (not (< j@120@01 (Seq_length xs@33@01))))))
    (or (>= j@120@01 0) (not (>= j@120@01 0))))))
(assert (or (< i@119@01 (Seq_length xs@33@01)) (not (< i@119@01 (Seq_length xs@33@01)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@48@01 r)
      (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
    (= ($FVF.lookup_f (as sm@121@01  $FVF<f>) r) ($FVF.lookup_f $t@46@01 r)))
  :pattern (($FVF.lookup_f (as sm@121@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@46@01 r))
  :qid |qp.fvfValDef57|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@41@01 r)
      (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
    (= ($FVF.lookup_f (as sm@121@01  $FVF<f>) r) ($FVF.lookup_f $t@39@01 r)))
  :pattern (($FVF.lookup_f (as sm@121@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@39@01 r))
  :qid |qp.fvfValDef58|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@122@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@122@01  $FPM) r))
  :qid |qp.resPrmSumDef59|)))
(assert (=>
  (not (>= i@119@01 0))
  (and
    (not (>= i@119@01 0))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@122@01  $FPM) r) $Perm.Write)
      :pattern ((inv@47@01 r))
      :qid |qp-fld-prm-bnd|))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@122@01  $FPM) r) $Perm.Write)
      :pattern ((inv@40@01 r))
      :qid |qp-fld-prm-bnd|)))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@48@01 r)
      (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
    (= ($FVF.lookup_f (as sm@123@01  $FVF<f>) r) ($FVF.lookup_f $t@46@01 r)))
  :pattern (($FVF.lookup_f (as sm@123@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@46@01 r))
  :qid |qp.fvfValDef60|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@41@01 r)
      (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
    (= ($FVF.lookup_f (as sm@123@01  $FVF<f>) r) ($FVF.lookup_f $t@39@01 r)))
  :pattern (($FVF.lookup_f (as sm@123@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@39@01 r))
  :qid |qp.fvfValDef61|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@124@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@124@01  $FPM) r))
  :qid |qp.resPrmSumDef62|)))
(assert (=>
  (>= i@119@01 0)
  (and
    (>= i@119@01 0)
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@124@01  $FPM) r) $Perm.Write)
      :pattern ((inv@47@01 r))
      :qid |qp-fld-prm-bnd|))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@124@01  $FPM) r) $Perm.Write)
      :pattern ((inv@40@01 r))
      :qid |qp-fld-prm-bnd|))
    (=>
      (< i@119@01 (Seq_length xs@33@01))
      (and
        (< i@119@01 (Seq_length xs@33@01))
        (=>
          (>= j@120@01 0)
          (and
            (>= j@120@01 0)
            (or
              (< j@120@01 (Seq_length xs@33@01))
              (not (< j@120@01 (Seq_length xs@33@01))))))
        (or (>= j@120@01 0) (not (>= j@120@01 0)))))
    (or
      (< i@119@01 (Seq_length xs@33@01))
      (not (< i@119@01 (Seq_length xs@33@01)))))))
(assert (or (>= i@119@01 0) (not (>= i@119@01 0))))
(set-option :timeout 0)
(push) ; 5
; [then-branch: 56 | i@119@01 >= 0 && i@119@01 < |xs@33@01| && j@120@01 >= 0 && j@120@01 < |xs@33@01| && i@119@01 != j@120@01 | live]
; [else-branch: 56 | !(i@119@01 >= 0 && i@119@01 < |xs@33@01| && j@120@01 >= 0 && j@120@01 < |xs@33@01| && i@119@01 != j@120@01) | live]
(push) ; 6
; [then-branch: 56 | i@119@01 >= 0 && i@119@01 < |xs@33@01| && j@120@01 >= 0 && j@120@01 < |xs@33@01| && i@119@01 != j@120@01]
(assert (and
  (>= i@119@01 0)
  (and
    (< i@119@01 (Seq_length xs@33@01))
    (and
      (>= j@120@01 0)
      (and (< j@120@01 (Seq_length xs@33@01)) (not (= i@119@01 j@120@01)))))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index ys@34@01 i@45@01) (Seq_index xs@33@01 i@38@01))
    (=
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))))
  
  :qid |quant-u-120|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@124@01  $FPM) r) $Perm.Write)
  :pattern ((inv@47@01 r))
  :qid |qp-fld-prm-bnd|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@124@01  $FPM) r) $Perm.Write)
  :pattern ((inv@40@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] xs[i] != xs[j]
; [eval] xs[i]
; [eval] xs[j]
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 56 | !(i@119@01 >= 0 && i@119@01 < |xs@33@01| && j@120@01 >= 0 && j@120@01 < |xs@33@01| && i@119@01 != j@120@01)]
(assert (not
  (and
    (>= i@119@01 0)
    (and
      (< i@119@01 (Seq_length xs@33@01))
      (and
        (>= j@120@01 0)
        (and (< j@120@01 (Seq_length xs@33@01)) (not (= i@119@01 j@120@01))))))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index ys@34@01 i@45@01) (Seq_index xs@33@01 i@38@01))
    (=
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))))
  
  :qid |quant-u-121|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@124@01  $FPM) r) $Perm.Write)
  :pattern ((inv@47@01 r))
  :qid |qp-fld-prm-bnd|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@124@01  $FPM) r) $Perm.Write)
  :pattern ((inv@40@01 r))
  :qid |qp-fld-prm-bnd|)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (>= i@119@01 0)
    (and
      (< i@119@01 (Seq_length xs@33@01))
      (and
        (>= j@120@01 0)
        (and (< j@120@01 (Seq_length xs@33@01)) (not (= i@119@01 j@120@01))))))
  (and
    (>= i@119@01 0)
    (< i@119@01 (Seq_length xs@33@01))
    (>= j@120@01 0)
    (< j@120@01 (Seq_length xs@33@01))
    (not (= i@119@01 j@120@01))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@124@01  $FPM) r) $Perm.Write)
      :pattern ((inv@47@01 r))
      :qid |qp-fld-prm-bnd|))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@124@01  $FPM) r) $Perm.Write)
      :pattern ((inv@40@01 r))
      :qid |qp-fld-prm-bnd|)))))
; Joined path conditions
(assert (=>
  (not
    (and
      (>= i@119@01 0)
      (and
        (< i@119@01 (Seq_length xs@33@01))
        (and
          (>= j@120@01 0)
          (and (< j@120@01 (Seq_length xs@33@01)) (not (= i@119@01 j@120@01)))))))
  (and
    (not
      (and
        (>= i@119@01 0)
        (and
          (< i@119@01 (Seq_length xs@33@01))
          (and
            (>= j@120@01 0)
            (and (< j@120@01 (Seq_length xs@33@01)) (not (= i@119@01 j@120@01)))))))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@124@01  $FPM) r) $Perm.Write)
      :pattern ((inv@47@01 r))
      :qid |qp-fld-prm-bnd|))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@124@01  $FPM) r) $Perm.Write)
      :pattern ((inv@40@01 r))
      :qid |qp-fld-prm-bnd|)))))
(assert (or
  (not
    (and
      (>= i@119@01 0)
      (and
        (< i@119@01 (Seq_length xs@33@01))
        (and
          (>= j@120@01 0)
          (and (< j@120@01 (Seq_length xs@33@01)) (not (= i@119@01 j@120@01)))))))
  (and
    (>= i@119@01 0)
    (and
      (< i@119@01 (Seq_length xs@33@01))
      (and
        (>= j@120@01 0)
        (and (< j@120@01 (Seq_length xs@33@01)) (not (= i@119@01 j@120@01))))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@48@01 r)
      (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
    (= ($FVF.lookup_f (as sm@121@01  $FVF<f>) r) ($FVF.lookup_f $t@46@01 r)))
  :pattern (($FVF.lookup_f (as sm@121@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@46@01 r))
  :qid |qp.fvfValDef57|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@41@01 r)
      (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
    (= ($FVF.lookup_f (as sm@121@01  $FVF<f>) r) ($FVF.lookup_f $t@39@01 r)))
  :pattern (($FVF.lookup_f (as sm@121@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@39@01 r))
  :qid |qp.fvfValDef58|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@122@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@122@01  $FPM) r))
  :qid |qp.resPrmSumDef59|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@48@01 r)
      (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
    (= ($FVF.lookup_f (as sm@123@01  $FVF<f>) r) ($FVF.lookup_f $t@46@01 r)))
  :pattern (($FVF.lookup_f (as sm@123@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@46@01 r))
  :qid |qp.fvfValDef60|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@41@01 r)
      (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
    (= ($FVF.lookup_f (as sm@123@01  $FVF<f>) r) ($FVF.lookup_f $t@39@01 r)))
  :pattern (($FVF.lookup_f (as sm@123@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@39@01 r))
  :qid |qp.fvfValDef61|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@124@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@124@01  $FPM) r))
  :qid |qp.resPrmSumDef62|)))
; Nested auxiliary terms: non-globals (aux)
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((i@119@01 Int) (j@120@01 Int)) (!
  (=>
    (and
      (>= i@119@01 0)
      (and
        (< i@119@01 (Seq_length xs@33@01))
        (and
          (>= j@120@01 0)
          (and (< j@120@01 (Seq_length xs@33@01)) (not (= i@119@01 j@120@01))))))
    (not (= (Seq_index xs@33@01 i@119@01) (Seq_index xs@33@01 j@120@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions2.vpr@26@12@26@106|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@119@01 Int) (j@120@01 Int)) (!
  (=>
    (and
      (>= i@119@01 0)
      (and
        (< i@119@01 (Seq_length xs@33@01))
        (and
          (>= j@120@01 0)
          (and (< j@120@01 (Seq_length xs@33@01)) (not (= i@119@01 j@120@01))))))
    (not (= (Seq_index xs@33@01 i@119@01) (Seq_index xs@33@01 j@120@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions2.vpr@26@12@26@106|)))
(declare-const i@125@01 Int)
(push) ; 4
; [eval] 0 <= i && i < |xs|
; [eval] 0 <= i
(push) ; 5
; [then-branch: 57 | !(0 <= i@125@01) | live]
; [else-branch: 57 | 0 <= i@125@01 | live]
(push) ; 6
; [then-branch: 57 | !(0 <= i@125@01)]
(assert (not (<= 0 i@125@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index ys@34@01 i@45@01) (Seq_index xs@33@01 i@38@01))
    (=
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))))
  
  :qid |quant-u-122|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(declare-const pm@126@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@126@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@126@01  $FPM) r))
  :qid |qp.resPrmSumDef63|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@126@01  $FPM) r) $Perm.Write)
  :pattern ((inv@47@01 r))
  :qid |qp-fld-prm-bnd|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@126@01  $FPM) r) $Perm.Write)
  :pattern ((inv@40@01 r))
  :qid |qp-fld-prm-bnd|)))
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 57 | 0 <= i@125@01]
(assert (<= 0 i@125@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index ys@34@01 i@45@01) (Seq_index xs@33@01 i@38@01))
    (=
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))))
  
  :qid |quant-u-123|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(declare-const pm@127@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@127@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@127@01  $FPM) r))
  :qid |qp.resPrmSumDef64|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@127@01  $FPM) r) $Perm.Write)
  :pattern ((inv@47@01 r))
  :qid |qp-fld-prm-bnd|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@127@01  $FPM) r) $Perm.Write)
  :pattern ((inv@40@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] i < |xs|
; [eval] |xs|
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@126@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@126@01  $FPM) r))
  :qid |qp.resPrmSumDef63|)))
(assert (=>
  (not (<= 0 i@125@01))
  (and
    (not (<= 0 i@125@01))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@126@01  $FPM) r) $Perm.Write)
      :pattern ((inv@47@01 r))
      :qid |qp-fld-prm-bnd|))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@126@01  $FPM) r) $Perm.Write)
      :pattern ((inv@40@01 r))
      :qid |qp-fld-prm-bnd|)))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@127@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@127@01  $FPM) r))
  :qid |qp.resPrmSumDef64|)))
(assert (=>
  (<= 0 i@125@01)
  (and
    (<= 0 i@125@01)
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@127@01  $FPM) r) $Perm.Write)
      :pattern ((inv@47@01 r))
      :qid |qp-fld-prm-bnd|))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@127@01  $FPM) r) $Perm.Write)
      :pattern ((inv@40@01 r))
      :qid |qp-fld-prm-bnd|)))))
(assert (or (<= 0 i@125@01) (not (<= 0 i@125@01))))
(assert (and (<= 0 i@125@01) (< i@125@01 (Seq_length xs@33@01))))
; [eval] xs[i]
(set-option :timeout 0)
(push) ; 5
(assert (not (>= i@125@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@128@01 ($Ref) Int)
(declare-fun img@129@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@126@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@126@01  $FPM) r))
  :qid |qp.resPrmSumDef63|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@127@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@127@01  $FPM) r))
  :qid |qp.resPrmSumDef64|)))
; Nested auxiliary terms: non-globals
(assert (forall ((i@125@01 Int)) (!
  (=>
    (and (<= 0 i@125@01) (< i@125@01 (Seq_length xs@33@01)))
    (and
      (=>
        (not (<= 0 i@125@01))
        (and
          (not (<= 0 i@125@01))
          (forall ((r $Ref)) (!
            (<= ($FVF.perm_f (as pm@126@01  $FPM) r) $Perm.Write)
            :pattern ((inv@47@01 r))
            :qid |qp-fld-prm-bnd|))
          (forall ((r $Ref)) (!
            (<= ($FVF.perm_f (as pm@126@01  $FPM) r) $Perm.Write)
            :pattern ((inv@40@01 r))
            :qid |qp-fld-prm-bnd|))))
      (=>
        (<= 0 i@125@01)
        (and
          (<= 0 i@125@01)
          (forall ((r $Ref)) (!
            (<= ($FVF.perm_f (as pm@127@01  $FPM) r) $Perm.Write)
            :pattern ((inv@47@01 r))
            :qid |qp-fld-prm-bnd|))
          (forall ((r $Ref)) (!
            (<= ($FVF.perm_f (as pm@127@01  $FPM) r) $Perm.Write)
            :pattern ((inv@40@01 r))
            :qid |qp-fld-prm-bnd|))))
      (or (<= 0 i@125@01) (not (<= 0 i@125@01)))))
  :pattern ((Seq_index xs@33@01 i@125@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@125@01 Int) (i2@125@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@125@01) (< i1@125@01 (Seq_length xs@33@01)))
      (and (<= 0 i2@125@01) (< i2@125@01 (Seq_length xs@33@01)))
      (= (Seq_index xs@33@01 i1@125@01) (Seq_index xs@33@01 i2@125@01)))
    (= i1@125@01 i2@125@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@125@01 Int)) (!
  (=>
    (and (<= 0 i@125@01) (< i@125@01 (Seq_length xs@33@01)))
    (and
      (= (inv@128@01 (Seq_index xs@33@01 i@125@01)) i@125@01)
      (img@129@01 (Seq_index xs@33@01 i@125@01))))
  :pattern ((Seq_index xs@33@01 i@125@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@129@01 r)
      (and (<= 0 (inv@128@01 r)) (< (inv@128@01 r) (Seq_length xs@33@01))))
    (= (Seq_index xs@33@01 (inv@128@01 r)) r))
  :pattern ((inv@128@01 r))
  :qid |f-fctOfInv|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((i@125@01 Int)) (!
  (= (Seq_index xs@33@01 i@125@01) (Seq_index ys@34@01 i@125@01))
  
  :qid |quant-u-125|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@130@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@128@01 r)) (< (inv@128@01 r) (Seq_length xs@33@01)))
      (img@129@01 r)
      (= r (Seq_index xs@33@01 (inv@128@01 r))))
    ($Perm.min
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@131@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@128@01 r)) (< (inv@128@01 r) (Seq_length xs@33@01)))
      (img@129@01 r)
      (= r (Seq_index xs@33@01 (inv@128@01 r))))
    ($Perm.min
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@130@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
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
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@130@01 r))
    $Perm.No)
  
  :qid |quant-u-127|))))
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
      (and (<= 0 (inv@128@01 r)) (< (inv@128@01 r) (Seq_length xs@33@01)))
      (img@129@01 r)
      (= r (Seq_index xs@33@01 (inv@128@01 r))))
    (= (- $Perm.Write (pTaken@130@01 r)) $Perm.No))
  
  :qid |quant-u-128|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@132@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@132@01  $FVF<f>)))
      (and
        (and (<= 0 (inv@128@01 r)) (< (inv@128@01 r) (Seq_length xs@33@01)))
        (img@129@01 r)))
    (=>
      (and
        (and (<= 0 (inv@128@01 r)) (< (inv@128@01 r) (Seq_length xs@33@01)))
        (img@129@01 r))
      (Set_in r ($FVF.domain_f (as sm@132@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@132@01  $FVF<f>))))
  :qid |qp.fvfDomDef67|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@128@01 r)) (< (inv@128@01 r) (Seq_length xs@33@01)))
        (img@129@01 r))
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01)))))
    (= ($FVF.lookup_f (as sm@132@01  $FVF<f>) r) ($FVF.lookup_f $t@46@01 r)))
  :pattern (($FVF.lookup_f (as sm@132@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@46@01 r))
  :qid |qp.fvfValDef65|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@128@01 r)) (< (inv@128@01 r) (Seq_length xs@33@01)))
        (img@129@01 r))
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01)))))
    (= ($FVF.lookup_f (as sm@132@01  $FVF<f>) r) ($FVF.lookup_f $t@39@01 r)))
  :pattern (($FVF.lookup_f (as sm@132@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@39@01 r))
  :qid |qp.fvfValDef66|)))
; [eval] (forall i: Int, j: Int ::i >= 0 && (i < |ys| && (j >= 0 && (j < |ys| && i != j))) ==> ys[i] != ys[j])
(declare-const i@133@01 Int)
(declare-const j@134@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] i >= 0 && (i < |ys| && (j >= 0 && (j < |ys| && i != j))) ==> ys[i] != ys[j]
; [eval] i >= 0 && (i < |ys| && (j >= 0 && (j < |ys| && i != j)))
; [eval] i >= 0
(push) ; 5
; [then-branch: 58 | !(i@133@01 >= 0) | live]
; [else-branch: 58 | i@133@01 >= 0 | live]
(push) ; 6
; [then-branch: 58 | !(i@133@01 >= 0)]
(assert (not (>= i@133@01 0)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index ys@34@01 i@45@01) (Seq_index xs@33@01 i@38@01))
    (=
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))))
  
  :qid |quant-u-129|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(declare-const sm@135@01 $FVF<f>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@48@01 r)
      (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
    (= ($FVF.lookup_f (as sm@135@01  $FVF<f>) r) ($FVF.lookup_f $t@46@01 r)))
  :pattern (($FVF.lookup_f (as sm@135@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@46@01 r))
  :qid |qp.fvfValDef68|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@41@01 r)
      (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
    (= ($FVF.lookup_f (as sm@135@01  $FVF<f>) r) ($FVF.lookup_f $t@39@01 r)))
  :pattern (($FVF.lookup_f (as sm@135@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@39@01 r))
  :qid |qp.fvfValDef69|)))
(declare-const pm@136@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@136@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@136@01  $FPM) r))
  :qid |qp.resPrmSumDef70|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@136@01  $FPM) r) $Perm.Write)
  :pattern ((inv@47@01 r))
  :qid |qp-fld-prm-bnd|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@136@01  $FPM) r) $Perm.Write)
  :pattern ((inv@40@01 r))
  :qid |qp-fld-prm-bnd|)))
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 58 | i@133@01 >= 0]
(assert (>= i@133@01 0))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index ys@34@01 i@45@01) (Seq_index xs@33@01 i@38@01))
    (=
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))))
  
  :qid |quant-u-130|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(declare-const sm@137@01 $FVF<f>)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@48@01 r)
      (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
    (= ($FVF.lookup_f (as sm@137@01  $FVF<f>) r) ($FVF.lookup_f $t@46@01 r)))
  :pattern (($FVF.lookup_f (as sm@137@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@46@01 r))
  :qid |qp.fvfValDef71|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@41@01 r)
      (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
    (= ($FVF.lookup_f (as sm@137@01  $FVF<f>) r) ($FVF.lookup_f $t@39@01 r)))
  :pattern (($FVF.lookup_f (as sm@137@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@39@01 r))
  :qid |qp.fvfValDef72|)))
(declare-const pm@138@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@138@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@138@01  $FPM) r))
  :qid |qp.resPrmSumDef73|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@138@01  $FPM) r) $Perm.Write)
  :pattern ((inv@47@01 r))
  :qid |qp-fld-prm-bnd|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@138@01  $FPM) r) $Perm.Write)
  :pattern ((inv@40@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] i < |ys|
; [eval] |ys|
(set-option :timeout 0)
(push) ; 7
; [then-branch: 59 | !(i@133@01 < |ys@34@01|) | live]
; [else-branch: 59 | i@133@01 < |ys@34@01| | live]
(push) ; 8
; [then-branch: 59 | !(i@133@01 < |ys@34@01|)]
(assert (not (< i@133@01 (Seq_length ys@34@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@33@01 i@38@01) (Seq_index ys@34@01 i@45@01))
    (=
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))))
  
  :qid |quant-u-131|))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; Assume upper permission bound for field f
(pop) ; 8
(set-option :timeout 0)
(push) ; 8
; [else-branch: 59 | i@133@01 < |ys@34@01|]
(assert (< i@133@01 (Seq_length ys@34@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 9
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@33@01 i@38@01) (Seq_index ys@34@01 i@45@01))
    (=
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))))
  
  :qid |quant-u-132|))))
(check-sat)
; unknown
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; Assume upper permission bound for field f
; [eval] j >= 0
(set-option :timeout 0)
(push) ; 9
; [then-branch: 60 | !(j@134@01 >= 0) | live]
; [else-branch: 60 | j@134@01 >= 0 | live]
(push) ; 10
; [then-branch: 60 | !(j@134@01 >= 0)]
(assert (not (>= j@134@01 0)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index ys@34@01 i@45@01) (Seq_index xs@33@01 i@38@01))
    (=
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))))
  
  :qid |quant-u-133|))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; Assume upper permission bound for field f
(pop) ; 10
(set-option :timeout 0)
(push) ; 10
; [else-branch: 60 | j@134@01 >= 0]
(assert (>= j@134@01 0))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 11
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index ys@34@01 i@45@01) (Seq_index xs@33@01 i@38@01))
    (=
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))))
  
  :qid |quant-u-134|))))
(check-sat)
; unknown
(pop) ; 11
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; Assume upper permission bound for field f
; [eval] j < |ys|
; [eval] |ys|
(set-option :timeout 0)
(push) ; 11
; [then-branch: 61 | !(j@134@01 < |ys@34@01|) | live]
; [else-branch: 61 | j@134@01 < |ys@34@01| | live]
(push) ; 12
; [then-branch: 61 | !(j@134@01 < |ys@34@01|)]
(assert (not (< j@134@01 (Seq_length ys@34@01))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@33@01 i@38@01) (Seq_index ys@34@01 i@45@01))
    (=
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))))
  
  :qid |quant-u-135|))))
(check-sat)
; unknown
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; Assume upper permission bound for field f
(pop) ; 12
(set-option :timeout 0)
(push) ; 12
; [else-branch: 61 | j@134@01 < |ys@34@01|]
(assert (< j@134@01 (Seq_length ys@34@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 13
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index xs@33@01 i@38@01) (Seq_index ys@34@01 i@45@01))
    (=
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))))
  
  :qid |quant-u-136|))))
(check-sat)
; unknown
(pop) ; 13
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
; Assume upper permission bound for field f
; [eval] i != j
(pop) ; 12
(pop) ; 11
; Joined path conditions
; Joined path conditions
(assert (or (< j@134@01 (Seq_length ys@34@01)) (not (< j@134@01 (Seq_length ys@34@01)))))
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@134@01 0)
  (and
    (>= j@134@01 0)
    (or
      (< j@134@01 (Seq_length ys@34@01))
      (not (< j@134@01 (Seq_length ys@34@01)))))))
(assert (or (>= j@134@01 0) (not (>= j@134@01 0))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i@133@01 (Seq_length ys@34@01))
  (and
    (< i@133@01 (Seq_length ys@34@01))
    (=>
      (>= j@134@01 0)
      (and
        (>= j@134@01 0)
        (or
          (< j@134@01 (Seq_length ys@34@01))
          (not (< j@134@01 (Seq_length ys@34@01))))))
    (or (>= j@134@01 0) (not (>= j@134@01 0))))))
(assert (or (< i@133@01 (Seq_length ys@34@01)) (not (< i@133@01 (Seq_length ys@34@01)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@48@01 r)
      (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
    (= ($FVF.lookup_f (as sm@135@01  $FVF<f>) r) ($FVF.lookup_f $t@46@01 r)))
  :pattern (($FVF.lookup_f (as sm@135@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@46@01 r))
  :qid |qp.fvfValDef68|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@41@01 r)
      (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
    (= ($FVF.lookup_f (as sm@135@01  $FVF<f>) r) ($FVF.lookup_f $t@39@01 r)))
  :pattern (($FVF.lookup_f (as sm@135@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@39@01 r))
  :qid |qp.fvfValDef69|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@136@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@136@01  $FPM) r))
  :qid |qp.resPrmSumDef70|)))
(assert (=>
  (not (>= i@133@01 0))
  (and
    (not (>= i@133@01 0))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@136@01  $FPM) r) $Perm.Write)
      :pattern ((inv@47@01 r))
      :qid |qp-fld-prm-bnd|))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@136@01  $FPM) r) $Perm.Write)
      :pattern ((inv@40@01 r))
      :qid |qp-fld-prm-bnd|)))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@48@01 r)
      (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
    (= ($FVF.lookup_f (as sm@137@01  $FVF<f>) r) ($FVF.lookup_f $t@46@01 r)))
  :pattern (($FVF.lookup_f (as sm@137@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@46@01 r))
  :qid |qp.fvfValDef71|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@41@01 r)
      (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
    (= ($FVF.lookup_f (as sm@137@01  $FVF<f>) r) ($FVF.lookup_f $t@39@01 r)))
  :pattern (($FVF.lookup_f (as sm@137@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@39@01 r))
  :qid |qp.fvfValDef72|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@138@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@138@01  $FPM) r))
  :qid |qp.resPrmSumDef73|)))
(assert (=>
  (>= i@133@01 0)
  (and
    (>= i@133@01 0)
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@138@01  $FPM) r) $Perm.Write)
      :pattern ((inv@47@01 r))
      :qid |qp-fld-prm-bnd|))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@138@01  $FPM) r) $Perm.Write)
      :pattern ((inv@40@01 r))
      :qid |qp-fld-prm-bnd|))
    (=>
      (< i@133@01 (Seq_length ys@34@01))
      (and
        (< i@133@01 (Seq_length ys@34@01))
        (=>
          (>= j@134@01 0)
          (and
            (>= j@134@01 0)
            (or
              (< j@134@01 (Seq_length ys@34@01))
              (not (< j@134@01 (Seq_length ys@34@01))))))
        (or (>= j@134@01 0) (not (>= j@134@01 0)))))
    (or
      (< i@133@01 (Seq_length ys@34@01))
      (not (< i@133@01 (Seq_length ys@34@01)))))))
(assert (or (>= i@133@01 0) (not (>= i@133@01 0))))
(set-option :timeout 0)
(push) ; 5
; [then-branch: 62 | i@133@01 >= 0 && i@133@01 < |ys@34@01| && j@134@01 >= 0 && j@134@01 < |ys@34@01| && i@133@01 != j@134@01 | live]
; [else-branch: 62 | !(i@133@01 >= 0 && i@133@01 < |ys@34@01| && j@134@01 >= 0 && j@134@01 < |ys@34@01| && i@133@01 != j@134@01) | live]
(push) ; 6
; [then-branch: 62 | i@133@01 >= 0 && i@133@01 < |ys@34@01| && j@134@01 >= 0 && j@134@01 < |ys@34@01| && i@133@01 != j@134@01]
(assert (and
  (>= i@133@01 0)
  (and
    (< i@133@01 (Seq_length ys@34@01))
    (and
      (>= j@134@01 0)
      (and (< j@134@01 (Seq_length ys@34@01)) (not (= i@133@01 j@134@01)))))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index ys@34@01 i@45@01) (Seq_index xs@33@01 i@38@01))
    (=
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))))
  
  :qid |quant-u-137|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@138@01  $FPM) r) $Perm.Write)
  :pattern ((inv@47@01 r))
  :qid |qp-fld-prm-bnd|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@138@01  $FPM) r) $Perm.Write)
  :pattern ((inv@40@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] ys[i] != ys[j]
; [eval] ys[i]
; [eval] ys[j]
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 62 | !(i@133@01 >= 0 && i@133@01 < |ys@34@01| && j@134@01 >= 0 && j@134@01 < |ys@34@01| && i@133@01 != j@134@01)]
(assert (not
  (and
    (>= i@133@01 0)
    (and
      (< i@133@01 (Seq_length ys@34@01))
      (and
        (>= j@134@01 0)
        (and (< j@134@01 (Seq_length ys@34@01)) (not (= i@133@01 j@134@01))))))))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index ys@34@01 i@45@01) (Seq_index xs@33@01 i@38@01))
    (=
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))))
  
  :qid |quant-u-138|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@138@01  $FPM) r) $Perm.Write)
  :pattern ((inv@47@01 r))
  :qid |qp-fld-prm-bnd|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@138@01  $FPM) r) $Perm.Write)
  :pattern ((inv@40@01 r))
  :qid |qp-fld-prm-bnd|)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (=>
  (and
    (>= i@133@01 0)
    (and
      (< i@133@01 (Seq_length ys@34@01))
      (and
        (>= j@134@01 0)
        (and (< j@134@01 (Seq_length ys@34@01)) (not (= i@133@01 j@134@01))))))
  (and
    (>= i@133@01 0)
    (< i@133@01 (Seq_length ys@34@01))
    (>= j@134@01 0)
    (< j@134@01 (Seq_length ys@34@01))
    (not (= i@133@01 j@134@01))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@138@01  $FPM) r) $Perm.Write)
      :pattern ((inv@47@01 r))
      :qid |qp-fld-prm-bnd|))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@138@01  $FPM) r) $Perm.Write)
      :pattern ((inv@40@01 r))
      :qid |qp-fld-prm-bnd|)))))
; Joined path conditions
(assert (=>
  (not
    (and
      (>= i@133@01 0)
      (and
        (< i@133@01 (Seq_length ys@34@01))
        (and
          (>= j@134@01 0)
          (and (< j@134@01 (Seq_length ys@34@01)) (not (= i@133@01 j@134@01)))))))
  (and
    (not
      (and
        (>= i@133@01 0)
        (and
          (< i@133@01 (Seq_length ys@34@01))
          (and
            (>= j@134@01 0)
            (and (< j@134@01 (Seq_length ys@34@01)) (not (= i@133@01 j@134@01)))))))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@138@01  $FPM) r) $Perm.Write)
      :pattern ((inv@47@01 r))
      :qid |qp-fld-prm-bnd|))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@138@01  $FPM) r) $Perm.Write)
      :pattern ((inv@40@01 r))
      :qid |qp-fld-prm-bnd|)))))
(assert (or
  (not
    (and
      (>= i@133@01 0)
      (and
        (< i@133@01 (Seq_length ys@34@01))
        (and
          (>= j@134@01 0)
          (and (< j@134@01 (Seq_length ys@34@01)) (not (= i@133@01 j@134@01)))))))
  (and
    (>= i@133@01 0)
    (and
      (< i@133@01 (Seq_length ys@34@01))
      (and
        (>= j@134@01 0)
        (and (< j@134@01 (Seq_length ys@34@01)) (not (= i@133@01 j@134@01))))))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@48@01 r)
      (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
    (= ($FVF.lookup_f (as sm@135@01  $FVF<f>) r) ($FVF.lookup_f $t@46@01 r)))
  :pattern (($FVF.lookup_f (as sm@135@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@46@01 r))
  :qid |qp.fvfValDef68|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@41@01 r)
      (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
    (= ($FVF.lookup_f (as sm@135@01  $FVF<f>) r) ($FVF.lookup_f $t@39@01 r)))
  :pattern (($FVF.lookup_f (as sm@135@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@39@01 r))
  :qid |qp.fvfValDef69|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@136@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@136@01  $FPM) r))
  :qid |qp.resPrmSumDef70|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@48@01 r)
      (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
    (= ($FVF.lookup_f (as sm@137@01  $FVF<f>) r) ($FVF.lookup_f $t@46@01 r)))
  :pattern (($FVF.lookup_f (as sm@137@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@46@01 r))
  :qid |qp.fvfValDef71|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@41@01 r)
      (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
    (= ($FVF.lookup_f (as sm@137@01  $FVF<f>) r) ($FVF.lookup_f $t@39@01 r)))
  :pattern (($FVF.lookup_f (as sm@137@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@39@01 r))
  :qid |qp.fvfValDef72|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@138@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@138@01  $FPM) r))
  :qid |qp.resPrmSumDef73|)))
; Nested auxiliary terms: non-globals (aux)
(set-option :timeout 0)
(push) ; 4
(assert (not (forall ((i@133@01 Int) (j@134@01 Int)) (!
  (=>
    (and
      (>= i@133@01 0)
      (and
        (< i@133@01 (Seq_length ys@34@01))
        (and
          (>= j@134@01 0)
          (and (< j@134@01 (Seq_length ys@34@01)) (not (= i@133@01 j@134@01))))))
    (not (= (Seq_index ys@34@01 i@133@01) (Seq_index ys@34@01 j@134@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions2.vpr@28@12@28@106|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@133@01 Int) (j@134@01 Int)) (!
  (=>
    (and
      (>= i@133@01 0)
      (and
        (< i@133@01 (Seq_length ys@34@01))
        (and
          (>= j@134@01 0)
          (and (< j@134@01 (Seq_length ys@34@01)) (not (= i@133@01 j@134@01))))))
    (not (= (Seq_index ys@34@01 i@133@01) (Seq_index ys@34@01 j@134@01))))
  
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions2.vpr@28@12@28@106|)))
(declare-const i@139@01 Int)
(push) ; 4
; [eval] 0 <= i && i < |ys|
; [eval] 0 <= i
(push) ; 5
; [then-branch: 63 | !(0 <= i@139@01) | live]
; [else-branch: 63 | 0 <= i@139@01 | live]
(push) ; 6
; [then-branch: 63 | !(0 <= i@139@01)]
(assert (not (<= 0 i@139@01)))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index ys@34@01 i@45@01) (Seq_index xs@33@01 i@38@01))
    (=
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))))
  
  :qid |quant-u-139|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(declare-const pm@140@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@140@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@140@01  $FPM) r))
  :qid |qp.resPrmSumDef74|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@140@01  $FPM) r) $Perm.Write)
  :pattern ((inv@47@01 r))
  :qid |qp-fld-prm-bnd|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@140@01  $FPM) r) $Perm.Write)
  :pattern ((inv@40@01 r))
  :qid |qp-fld-prm-bnd|)))
(pop) ; 6
(set-option :timeout 0)
(push) ; 6
; [else-branch: 63 | 0 <= i@139@01]
(assert (<= 0 i@139@01))
; [state consolidation]
; State saturation: before repetition
(set-option :timeout 10)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index ys@34@01 i@45@01) (Seq_index xs@33@01 i@38@01))
    (=
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))))
  
  :qid |quant-u-140|))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for snapshot map domain
; Definitional axioms for snapshot map values
(declare-const pm@141@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@141@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@141@01  $FPM) r))
  :qid |qp.resPrmSumDef75|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@141@01  $FPM) r) $Perm.Write)
  :pattern ((inv@47@01 r))
  :qid |qp-fld-prm-bnd|)))
; Assume upper permission bound for field f
(assert (forall ((r $Ref)) (!
  (<= ($FVF.perm_f (as pm@141@01  $FPM) r) $Perm.Write)
  :pattern ((inv@40@01 r))
  :qid |qp-fld-prm-bnd|)))
; [eval] i < |ys|
; [eval] |ys|
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@140@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@140@01  $FPM) r))
  :qid |qp.resPrmSumDef74|)))
(assert (=>
  (not (<= 0 i@139@01))
  (and
    (not (<= 0 i@139@01))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@140@01  $FPM) r) $Perm.Write)
      :pattern ((inv@47@01 r))
      :qid |qp-fld-prm-bnd|))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@140@01  $FPM) r) $Perm.Write)
      :pattern ((inv@40@01 r))
      :qid |qp-fld-prm-bnd|)))))
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@141@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@141@01  $FPM) r))
  :qid |qp.resPrmSumDef75|)))
(assert (=>
  (<= 0 i@139@01)
  (and
    (<= 0 i@139@01)
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@141@01  $FPM) r) $Perm.Write)
      :pattern ((inv@47@01 r))
      :qid |qp-fld-prm-bnd|))
    (forall ((r $Ref)) (!
      (<= ($FVF.perm_f (as pm@141@01  $FPM) r) $Perm.Write)
      :pattern ((inv@40@01 r))
      :qid |qp-fld-prm-bnd|)))))
(assert (or (<= 0 i@139@01) (not (<= 0 i@139@01))))
(assert (and (<= 0 i@139@01) (< i@139@01 (Seq_length ys@34@01))))
; [eval] ys[i]
(set-option :timeout 0)
(push) ; 5
(assert (not (>= i@139@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@142@01 ($Ref) Int)
(declare-fun img@143@01 ($Ref) Bool)
; Nested auxiliary terms: globals
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@140@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@140@01  $FPM) r))
  :qid |qp.resPrmSumDef74|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@141@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@141@01  $FPM) r))
  :qid |qp.resPrmSumDef75|)))
; Nested auxiliary terms: non-globals
(assert (forall ((i@139@01 Int)) (!
  (=>
    (and (<= 0 i@139@01) (< i@139@01 (Seq_length ys@34@01)))
    (and
      (=>
        (not (<= 0 i@139@01))
        (and
          (not (<= 0 i@139@01))
          (forall ((r $Ref)) (!
            (<= ($FVF.perm_f (as pm@140@01  $FPM) r) $Perm.Write)
            :pattern ((inv@47@01 r))
            :qid |qp-fld-prm-bnd|))
          (forall ((r $Ref)) (!
            (<= ($FVF.perm_f (as pm@140@01  $FPM) r) $Perm.Write)
            :pattern ((inv@40@01 r))
            :qid |qp-fld-prm-bnd|))))
      (=>
        (<= 0 i@139@01)
        (and
          (<= 0 i@139@01)
          (forall ((r $Ref)) (!
            (<= ($FVF.perm_f (as pm@141@01  $FPM) r) $Perm.Write)
            :pattern ((inv@47@01 r))
            :qid |qp-fld-prm-bnd|))
          (forall ((r $Ref)) (!
            (<= ($FVF.perm_f (as pm@141@01  $FPM) r) $Perm.Write)
            :pattern ((inv@40@01 r))
            :qid |qp-fld-prm-bnd|))))
      (or (<= 0 i@139@01) (not (<= 0 i@139@01)))))
  :pattern ((Seq_index ys@34@01 i@139@01))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@139@01 Int) (i2@139@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@139@01) (< i1@139@01 (Seq_length ys@34@01)))
      (and (<= 0 i2@139@01) (< i2@139@01 (Seq_length ys@34@01)))
      (= (Seq_index ys@34@01 i1@139@01) (Seq_index ys@34@01 i2@139@01)))
    (= i1@139@01 i2@139@01))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@139@01 Int)) (!
  (=>
    (and (<= 0 i@139@01) (< i@139@01 (Seq_length ys@34@01)))
    (and
      (= (inv@142@01 (Seq_index ys@34@01 i@139@01)) i@139@01)
      (img@143@01 (Seq_index ys@34@01 i@139@01))))
  :pattern ((Seq_index ys@34@01 i@139@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@143@01 r)
      (and (<= 0 (inv@142@01 r)) (< (inv@142@01 r) (Seq_length ys@34@01))))
    (= (Seq_index ys@34@01 (inv@142@01 r)) r))
  :pattern ((inv@142@01 r))
  :qid |f-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@144@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@142@01 r)) (< (inv@142@01 r) (Seq_length ys@34@01)))
      (img@143@01 r)
      (= r (Seq_index ys@34@01 (inv@142@01 r))))
    ($Perm.min
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
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
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@144@01 r))
    $Perm.No)
  
  :qid |quant-u-143|))))
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
      (and (<= 0 (inv@142@01 r)) (< (inv@142@01 r) (Seq_length ys@34@01)))
      (img@143@01 r)
      (= r (Seq_index ys@34@01 (inv@142@01 r))))
    (= (- $Perm.Write (pTaken@144@01 r)) $Perm.No))
  
  :qid |quant-u-144|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@145@01 $FVF<f>)
; Definitional axioms for snapshot map domain
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@145@01  $FVF<f>)))
      (and
        (and (<= 0 (inv@142@01 r)) (< (inv@142@01 r) (Seq_length ys@34@01)))
        (img@143@01 r)))
    (=>
      (and
        (and (<= 0 (inv@142@01 r)) (< (inv@142@01 r) (Seq_length ys@34@01)))
        (img@143@01 r))
      (Set_in r ($FVF.domain_f (as sm@145@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@145@01  $FVF<f>))))
  :qid |qp.fvfDomDef77|)))
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@142@01 r)) (< (inv@142@01 r) (Seq_length ys@34@01)))
        (img@143@01 r))
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01)))))
    (= ($FVF.lookup_f (as sm@145@01  $FVF<f>) r) ($FVF.lookup_f $t@46@01 r)))
  :pattern (($FVF.lookup_f (as sm@145@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@46@01 r))
  :qid |qp.fvfValDef76|)))
; [eval] 10 < |xs|
; [eval] |xs|
; [eval] |xs| == |ys|
; [eval] |xs|
; [eval] |ys|
(assert (fun02%precondition ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$FVF<f>To$Snap (as sm@132@01  $FVF<f>))
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$FVF<f>To$Snap (as sm@145@01  $FVF<f>))
        ($Snap.combine $Snap.unit $Snap.unit))))) xs@33@01 ys@34@01))
(pop) ; 3
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@48@01 r)
      (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
    (= ($FVF.lookup_f (as sm@121@01  $FVF<f>) r) ($FVF.lookup_f $t@46@01 r)))
  :pattern (($FVF.lookup_f (as sm@121@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@46@01 r))
  :qid |qp.fvfValDef57|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@41@01 r)
      (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
    (= ($FVF.lookup_f (as sm@121@01  $FVF<f>) r) ($FVF.lookup_f $t@39@01 r)))
  :pattern (($FVF.lookup_f (as sm@121@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@39@01 r))
  :qid |qp.fvfValDef58|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@122@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@122@01  $FPM) r))
  :qid |qp.resPrmSumDef59|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@48@01 r)
      (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
    (= ($FVF.lookup_f (as sm@123@01  $FVF<f>) r) ($FVF.lookup_f $t@46@01 r)))
  :pattern (($FVF.lookup_f (as sm@123@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@46@01 r))
  :qid |qp.fvfValDef60|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@41@01 r)
      (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
    (= ($FVF.lookup_f (as sm@123@01  $FVF<f>) r) ($FVF.lookup_f $t@39@01 r)))
  :pattern (($FVF.lookup_f (as sm@123@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@39@01 r))
  :qid |qp.fvfValDef61|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@124@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@124@01  $FPM) r))
  :qid |qp.resPrmSumDef62|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@126@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@126@01  $FPM) r))
  :qid |qp.resPrmSumDef63|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@127@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@127@01  $FPM) r))
  :qid |qp.resPrmSumDef64|)))
(assert (forall ((i@125@01 Int)) (!
  (=>
    (and (<= 0 i@125@01) (< i@125@01 (Seq_length xs@33@01)))
    (and
      (= (inv@128@01 (Seq_index xs@33@01 i@125@01)) i@125@01)
      (img@129@01 (Seq_index xs@33@01 i@125@01))))
  :pattern ((Seq_index xs@33@01 i@125@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@129@01 r)
      (and (<= 0 (inv@128@01 r)) (< (inv@128@01 r) (Seq_length xs@33@01))))
    (= (Seq_index xs@33@01 (inv@128@01 r)) r))
  :pattern ((inv@128@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@132@01  $FVF<f>)))
      (and
        (and (<= 0 (inv@128@01 r)) (< (inv@128@01 r) (Seq_length xs@33@01)))
        (img@129@01 r)))
    (=>
      (and
        (and (<= 0 (inv@128@01 r)) (< (inv@128@01 r) (Seq_length xs@33@01)))
        (img@129@01 r))
      (Set_in r ($FVF.domain_f (as sm@132@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@132@01  $FVF<f>))))
  :qid |qp.fvfDomDef67|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@128@01 r)) (< (inv@128@01 r) (Seq_length xs@33@01)))
        (img@129@01 r))
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01)))))
    (= ($FVF.lookup_f (as sm@132@01  $FVF<f>) r) ($FVF.lookup_f $t@46@01 r)))
  :pattern (($FVF.lookup_f (as sm@132@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@46@01 r))
  :qid |qp.fvfValDef65|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@128@01 r)) (< (inv@128@01 r) (Seq_length xs@33@01)))
        (img@129@01 r))
      (and
        (img@41@01 r)
        (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01)))))
    (= ($FVF.lookup_f (as sm@132@01  $FVF<f>) r) ($FVF.lookup_f $t@39@01 r)))
  :pattern (($FVF.lookup_f (as sm@132@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@39@01 r))
  :qid |qp.fvfValDef66|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@48@01 r)
      (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
    (= ($FVF.lookup_f (as sm@135@01  $FVF<f>) r) ($FVF.lookup_f $t@46@01 r)))
  :pattern (($FVF.lookup_f (as sm@135@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@46@01 r))
  :qid |qp.fvfValDef68|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@41@01 r)
      (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
    (= ($FVF.lookup_f (as sm@135@01  $FVF<f>) r) ($FVF.lookup_f $t@39@01 r)))
  :pattern (($FVF.lookup_f (as sm@135@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@39@01 r))
  :qid |qp.fvfValDef69|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@136@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@136@01  $FPM) r))
  :qid |qp.resPrmSumDef70|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@48@01 r)
      (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
    (= ($FVF.lookup_f (as sm@137@01  $FVF<f>) r) ($FVF.lookup_f $t@46@01 r)))
  :pattern (($FVF.lookup_f (as sm@137@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@46@01 r))
  :qid |qp.fvfValDef71|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@41@01 r)
      (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
    (= ($FVF.lookup_f (as sm@137@01  $FVF<f>) r) ($FVF.lookup_f $t@39@01 r)))
  :pattern (($FVF.lookup_f (as sm@137@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@39@01 r))
  :qid |qp.fvfValDef72|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@138@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@138@01  $FPM) r))
  :qid |qp.resPrmSumDef73|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@140@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@140@01  $FPM) r))
  :qid |qp.resPrmSumDef74|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@141@01  $FPM) r)
    (+
      (ite
        (and
          (img@48@01 r)
          (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@41@01 r)
          (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) (Seq_length xs@33@01))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@141@01  $FPM) r))
  :qid |qp.resPrmSumDef75|)))
(assert (forall ((i@139@01 Int)) (!
  (=>
    (and (<= 0 i@139@01) (< i@139@01 (Seq_length ys@34@01)))
    (and
      (= (inv@142@01 (Seq_index ys@34@01 i@139@01)) i@139@01)
      (img@143@01 (Seq_index ys@34@01 i@139@01))))
  :pattern ((Seq_index ys@34@01 i@139@01))
  :qid |f-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@143@01 r)
      (and (<= 0 (inv@142@01 r)) (< (inv@142@01 r) (Seq_length ys@34@01))))
    (= (Seq_index ys@34@01 (inv@142@01 r)) r))
  :pattern ((inv@142@01 r))
  :qid |f-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (and
    (=>
      (Set_in r ($FVF.domain_f (as sm@145@01  $FVF<f>)))
      (and
        (and (<= 0 (inv@142@01 r)) (< (inv@142@01 r) (Seq_length ys@34@01)))
        (img@143@01 r)))
    (=>
      (and
        (and (<= 0 (inv@142@01 r)) (< (inv@142@01 r) (Seq_length ys@34@01)))
        (img@143@01 r))
      (Set_in r ($FVF.domain_f (as sm@145@01  $FVF<f>)))))
  :pattern ((Set_in r ($FVF.domain_f (as sm@145@01  $FVF<f>))))
  :qid |qp.fvfDomDef77|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (and
        (and (<= 0 (inv@142@01 r)) (< (inv@142@01 r) (Seq_length ys@34@01)))
        (img@143@01 r))
      (and
        (img@48@01 r)
        (and (<= 0 (inv@47@01 r)) (< (inv@47@01 r) (Seq_length ys@34@01)))))
    (= ($FVF.lookup_f (as sm@145@01  $FVF<f>) r) ($FVF.lookup_f $t@46@01 r)))
  :pattern (($FVF.lookup_f (as sm@145@01  $FVF<f>) r))
  :pattern (($FVF.lookup_f $t@46@01 r))
  :qid |qp.fvfValDef76|)))
(assert (and
  (forall ((i@119@01 Int) (j@120@01 Int)) (!
    (=>
      (and
        (>= i@119@01 0)
        (and
          (< i@119@01 (Seq_length xs@33@01))
          (and
            (>= j@120@01 0)
            (and (< j@120@01 (Seq_length xs@33@01)) (not (= i@119@01 j@120@01))))))
      (not (= (Seq_index xs@33@01 i@119@01) (Seq_index xs@33@01 j@120@01))))
    
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions2.vpr@26@12@26@106|))
  (forall ((i@125@01 Int)) (!
    (=>
      (and (<= 0 i@125@01) (< i@125@01 (Seq_length xs@33@01)))
      (and
        (=>
          (not (<= 0 i@125@01))
          (and
            (not (<= 0 i@125@01))
            (forall ((r $Ref)) (!
              (<= ($FVF.perm_f (as pm@126@01  $FPM) r) $Perm.Write)
              :pattern ((inv@47@01 r))
              :qid |qp-fld-prm-bnd|))
            (forall ((r $Ref)) (!
              (<= ($FVF.perm_f (as pm@126@01  $FPM) r) $Perm.Write)
              :pattern ((inv@40@01 r))
              :qid |qp-fld-prm-bnd|))))
        (=>
          (<= 0 i@125@01)
          (and
            (<= 0 i@125@01)
            (forall ((r $Ref)) (!
              (<= ($FVF.perm_f (as pm@127@01  $FPM) r) $Perm.Write)
              :pattern ((inv@47@01 r))
              :qid |qp-fld-prm-bnd|))
            (forall ((r $Ref)) (!
              (<= ($FVF.perm_f (as pm@127@01  $FPM) r) $Perm.Write)
              :pattern ((inv@40@01 r))
              :qid |qp-fld-prm-bnd|))))
        (or (<= 0 i@125@01) (not (<= 0 i@125@01)))))
    :pattern ((Seq_index xs@33@01 i@125@01))
    :qid |f-aux|))
  (forall ((i@133@01 Int) (j@134@01 Int)) (!
    (=>
      (and
        (>= i@133@01 0)
        (and
          (< i@133@01 (Seq_length ys@34@01))
          (and
            (>= j@134@01 0)
            (and (< j@134@01 (Seq_length ys@34@01)) (not (= i@133@01 j@134@01))))))
      (not (= (Seq_index ys@34@01 i@133@01) (Seq_index ys@34@01 j@134@01))))
    
    :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions2.vpr@28@12@28@106|))
  (forall ((i@139@01 Int)) (!
    (=>
      (and (<= 0 i@139@01) (< i@139@01 (Seq_length ys@34@01)))
      (and
        (=>
          (not (<= 0 i@139@01))
          (and
            (not (<= 0 i@139@01))
            (forall ((r $Ref)) (!
              (<= ($FVF.perm_f (as pm@140@01  $FPM) r) $Perm.Write)
              :pattern ((inv@47@01 r))
              :qid |qp-fld-prm-bnd|))
            (forall ((r $Ref)) (!
              (<= ($FVF.perm_f (as pm@140@01  $FPM) r) $Perm.Write)
              :pattern ((inv@40@01 r))
              :qid |qp-fld-prm-bnd|))))
        (=>
          (<= 0 i@139@01)
          (and
            (<= 0 i@139@01)
            (forall ((r $Ref)) (!
              (<= ($FVF.perm_f (as pm@141@01  $FPM) r) $Perm.Write)
              :pattern ((inv@47@01 r))
              :qid |qp-fld-prm-bnd|))
            (forall ((r $Ref)) (!
              (<= ($FVF.perm_f (as pm@141@01  $FPM) r) $Perm.Write)
              :pattern ((inv@40@01 r))
              :qid |qp-fld-prm-bnd|))))
        (or (<= 0 i@139@01) (not (<= 0 i@139@01)))))
    :pattern ((Seq_index ys@34@01 i@139@01))
    :qid |f-aux|))
  (fun02%precondition ($Snap.combine
    $Snap.unit
    ($Snap.combine
      ($SortWrappers.$FVF<f>To$Snap (as sm@132@01  $FVF<f>))
      ($Snap.combine
        $Snap.unit
        ($Snap.combine
          ($SortWrappers.$FVF<f>To$Snap (as sm@145@01  $FVF<f>))
          ($Snap.combine $Snap.unit $Snap.unit))))) xs@33@01 ys@34@01)))
(set-option :timeout 0)
(push) ; 3
(assert (not (fun02 ($Snap.combine
  $Snap.unit
  ($Snap.combine
    ($SortWrappers.$FVF<f>To$Snap (as sm@132@01  $FVF<f>))
    ($Snap.combine
      $Snap.unit
      ($Snap.combine
        ($SortWrappers.$FVF<f>To$Snap (as sm@145@01  $FVF<f>))
        ($Snap.combine $Snap.unit $Snap.unit))))) xs@33@01 ys@34@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,02s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
