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
; ---------- FUNCTION fun01----------
(declare-fun xs@0@00 () Set<$Ref>)
(declare-fun y@1@00 () $Ref)
(declare-fun result@2@00 () Int)
; ----- Well-definedness of specifications -----
(set-option :timeout 0)
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(declare-const x@6@00 $Ref)
(push) ; 2
; [eval] (x in xs)
(assert (Set_in x@6@00 xs@0@00))
(pop) ; 2
(declare-fun inv@7@00 ($Snap Set<$Ref> $Ref $Ref) $Ref)
(declare-fun img@8@00 ($Snap Set<$Ref> $Ref $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((x1@6@00 $Ref) (x2@6@00 $Ref)) (!
  (=>
    (and (Set_in x1@6@00 xs@0@00) (Set_in x2@6@00 xs@0@00) (= x1@6@00 x2@6@00))
    (= x1@6@00 x2@6@00))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((x@6@00 $Ref)) (!
  (=>
    (Set_in x@6@00 xs@0@00)
    (and
      (= (inv@7@00 s@$ xs@0@00 y@1@00 x@6@00) x@6@00)
      (img@8@00 s@$ xs@0@00 y@1@00 x@6@00)))
  :pattern ((Set_in x@6@00 xs@0@00))
  :pattern ((inv@7@00 s@$ xs@0@00 y@1@00 x@6@00))
  :pattern ((img@8@00 s@$ xs@0@00 y@1@00 x@6@00))
  :qid |quant-u-5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@8@00 s@$ xs@0@00 y@1@00 r)
      (Set_in (inv@7@00 s@$ xs@0@00 y@1@00 r) xs@0@00))
    (= (inv@7@00 s@$ xs@0@00 y@1@00 r) r))
  :pattern ((inv@7@00 s@$ xs@0@00 y@1@00 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((x@6@00 $Ref)) (!
  (=> (Set_in x@6@00 xs@0@00) (not (= x@6@00 $Ref.null)))
  :pattern ((Set_in x@6@00 xs@0@00))
  :pattern ((inv@7@00 s@$ xs@0@00 y@1@00 x@6@00))
  :pattern ((img@8@00 s@$ xs@0@00 y@1@00 x@6@00))
  :qid |f-permImpliesNonNull|)))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (= ($Snap.first ($Snap.second s@$)) $Snap.unit))
; [eval] (forall x: Ref :: { (x in xs) } (x in xs) ==> x.f > 0)
(declare-const x@9@00 $Ref)
(push) ; 2
; [eval] (x in xs) ==> x.f > 0
; [eval] (x in xs)
(push) ; 3
; [then-branch: 0 | x@9@00 in xs@0@00 | live]
; [else-branch: 0 | !(x@9@00 in xs@0@00) | live]
(push) ; 4
; [then-branch: 0 | x@9@00 in xs@0@00]
(assert (Set_in x@9@00 xs@0@00))
; [eval] x.f > 0
(push) ; 5
(assert (not (and
  (img@8@00 s@$ xs@0@00 y@1@00 x@9@00)
  (Set_in (inv@7@00 s@$ xs@0@00 y@1@00 x@9@00) xs@0@00))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 0 | !(x@9@00 in xs@0@00)]
(assert (not (Set_in x@9@00 xs@0@00)))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (not (Set_in x@9@00 xs@0@00)) (Set_in x@9@00 xs@0@00)))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((x@9@00 $Ref)) (!
  (or (not (Set_in x@9@00 xs@0@00)) (Set_in x@9@00 xs@0@00))
  :pattern ((Set_in x@9@00 xs@0@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions2.vpr@8@12@8@48-aux|)))
(assert (forall ((x@9@00 $Ref)) (!
  (=>
    (Set_in x@9@00 xs@0@00)
    (> ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first s@$)) x@9@00) 0))
  :pattern ((Set_in x@9@00 xs@0@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions2.vpr@8@12@8@48|)))
(assert (= ($Snap.second ($Snap.second s@$)) $Snap.unit))
; [eval] (y in xs)
(assert (Set_in y@1@00 xs@0@00))
(pop) ; 1
(assert (forall ((s@$ $Snap) (xs@0@00 Set<$Ref>) (y@1@00 $Ref)) (!
  (= (fun01%limited s@$ xs@0@00 y@1@00) (fun01 s@$ xs@0@00 y@1@00))
  :pattern ((fun01 s@$ xs@0@00 y@1@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (xs@0@00 Set<$Ref>) (y@1@00 $Ref)) (!
  (fun01%stateless xs@0@00 y@1@00)
  :pattern ((fun01%limited s@$ xs@0@00 y@1@00))
  :qid |quant-u-1|)))
; ----- Verification of function body and postcondition -----
(push) ; 1
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@8@00 s@$ xs@0@00 y@1@00 r)
      (Set_in (inv@7@00 s@$ xs@0@00 y@1@00 r) xs@0@00))
    (= (inv@7@00 s@$ xs@0@00 y@1@00 r) r))
  :pattern ((inv@7@00 s@$ xs@0@00 y@1@00 r))
  :qid |f-fctOfInv|)))
(assert (forall ((x@6@00 $Ref)) (!
  (=>
    (Set_in x@6@00 xs@0@00)
    (and
      (= (inv@7@00 s@$ xs@0@00 y@1@00 x@6@00) x@6@00)
      (img@8@00 s@$ xs@0@00 y@1@00 x@6@00)))
  :pattern ((Set_in x@6@00 xs@0@00))
  :pattern ((inv@7@00 s@$ xs@0@00 y@1@00 x@6@00))
  :pattern ((img@8@00 s@$ xs@0@00 y@1@00 x@6@00))
  :qid |quant-u-5|)))
(assert (forall ((x@6@00 $Ref)) (!
  (=> (Set_in x@6@00 xs@0@00) (not (= x@6@00 $Ref.null)))
  :pattern ((Set_in x@6@00 xs@0@00))
  :pattern ((inv@7@00 s@$ xs@0@00 y@1@00 x@6@00))
  :pattern ((img@8@00 s@$ xs@0@00 y@1@00 x@6@00))
  :qid |f-permImpliesNonNull|)))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (= ($Snap.first ($Snap.second s@$)) $Snap.unit))
(assert (forall ((x@9@00 $Ref)) (!
  (or (not (Set_in x@9@00 xs@0@00)) (Set_in x@9@00 xs@0@00))
  :pattern ((Set_in x@9@00 xs@0@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions2.vpr@8@12@8@48-aux|)))
(assert (forall ((x@9@00 $Ref)) (!
  (=>
    (Set_in x@9@00 xs@0@00)
    (> ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first s@$)) x@9@00) 0))
  :pattern ((Set_in x@9@00 xs@0@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions2.vpr@8@12@8@48|)))
(assert (= ($Snap.second ($Snap.second s@$)) $Snap.unit))
(assert (Set_in y@1@00 xs@0@00))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(assert (not (and
  (img@8@00 s@$ xs@0@00 y@1@00 y@1@00)
  (Set_in (inv@7@00 s@$ xs@0@00 y@1@00 y@1@00) xs@0@00))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (=
  result@2@00
  ($FVF.lookup_f ($SortWrappers.$SnapTo$FVF<f> ($Snap.first s@$)) y@1@00)))
(pop) ; 1
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
; ---------- FUNCTION fun02----------
(declare-fun xs@3@00 () Seq<$Ref>)
(declare-fun ys@4@00 () Seq<$Ref>)
(declare-fun result@5@00 () Bool)
; ----- Well-definedness of specifications -----
(push) ; 1
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
; [eval] (forall i: Int, j: Int :: { xs[i], xs[j] } i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==> xs[i] != xs[j])
(declare-const i@10@00 Int)
(declare-const j@11@00 Int)
(push) ; 2
; [eval] i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j))) ==> xs[i] != xs[j]
; [eval] i >= 0 && (i < |xs| && (j >= 0 && (j < |xs| && i != j)))
; [eval] i >= 0
(push) ; 3
; [then-branch: 1 | !(i@10@00 >= 0) | live]
; [else-branch: 1 | i@10@00 >= 0 | live]
(push) ; 4
; [then-branch: 1 | !(i@10@00 >= 0)]
(assert (not (>= i@10@00 0)))
(pop) ; 4
(push) ; 4
; [else-branch: 1 | i@10@00 >= 0]
(assert (>= i@10@00 0))
; [eval] i < |xs|
; [eval] |xs|
(push) ; 5
; [then-branch: 2 | !(i@10@00 < |xs@3@00|) | live]
; [else-branch: 2 | i@10@00 < |xs@3@00| | live]
(push) ; 6
; [then-branch: 2 | !(i@10@00 < |xs@3@00|)]
(assert (not (< i@10@00 (Seq_length xs@3@00))))
(pop) ; 6
(push) ; 6
; [else-branch: 2 | i@10@00 < |xs@3@00|]
(assert (< i@10@00 (Seq_length xs@3@00)))
; [eval] j >= 0
(push) ; 7
; [then-branch: 3 | !(j@11@00 >= 0) | live]
; [else-branch: 3 | j@11@00 >= 0 | live]
(push) ; 8
; [then-branch: 3 | !(j@11@00 >= 0)]
(assert (not (>= j@11@00 0)))
(pop) ; 8
(push) ; 8
; [else-branch: 3 | j@11@00 >= 0]
(assert (>= j@11@00 0))
; [eval] j < |xs|
; [eval] |xs|
(push) ; 9
; [then-branch: 4 | !(j@11@00 < |xs@3@00|) | live]
; [else-branch: 4 | j@11@00 < |xs@3@00| | live]
(push) ; 10
; [then-branch: 4 | !(j@11@00 < |xs@3@00|)]
(assert (not (< j@11@00 (Seq_length xs@3@00))))
(pop) ; 10
(push) ; 10
; [else-branch: 4 | j@11@00 < |xs@3@00|]
(assert (< j@11@00 (Seq_length xs@3@00)))
; [eval] i != j
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< j@11@00 (Seq_length xs@3@00)) (not (< j@11@00 (Seq_length xs@3@00)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@11@00 0)
  (and
    (>= j@11@00 0)
    (or (< j@11@00 (Seq_length xs@3@00)) (not (< j@11@00 (Seq_length xs@3@00)))))))
(assert (or (>= j@11@00 0) (not (>= j@11@00 0))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i@10@00 (Seq_length xs@3@00))
  (and
    (< i@10@00 (Seq_length xs@3@00))
    (=>
      (>= j@11@00 0)
      (and
        (>= j@11@00 0)
        (or
          (< j@11@00 (Seq_length xs@3@00))
          (not (< j@11@00 (Seq_length xs@3@00))))))
    (or (>= j@11@00 0) (not (>= j@11@00 0))))))
(assert (or (< i@10@00 (Seq_length xs@3@00)) (not (< i@10@00 (Seq_length xs@3@00)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= i@10@00 0)
  (and
    (>= i@10@00 0)
    (=>
      (< i@10@00 (Seq_length xs@3@00))
      (and
        (< i@10@00 (Seq_length xs@3@00))
        (=>
          (>= j@11@00 0)
          (and
            (>= j@11@00 0)
            (or
              (< j@11@00 (Seq_length xs@3@00))
              (not (< j@11@00 (Seq_length xs@3@00))))))
        (or (>= j@11@00 0) (not (>= j@11@00 0)))))
    (or (< i@10@00 (Seq_length xs@3@00)) (not (< i@10@00 (Seq_length xs@3@00)))))))
(assert (or (>= i@10@00 0) (not (>= i@10@00 0))))
(push) ; 3
; [then-branch: 5 | i@10@00 >= 0 && i@10@00 < |xs@3@00| && j@11@00 >= 0 && j@11@00 < |xs@3@00| && i@10@00 != j@11@00 | live]
; [else-branch: 5 | !(i@10@00 >= 0 && i@10@00 < |xs@3@00| && j@11@00 >= 0 && j@11@00 < |xs@3@00| && i@10@00 != j@11@00) | live]
(push) ; 4
; [then-branch: 5 | i@10@00 >= 0 && i@10@00 < |xs@3@00| && j@11@00 >= 0 && j@11@00 < |xs@3@00| && i@10@00 != j@11@00]
(assert (and
  (>= i@10@00 0)
  (and
    (< i@10@00 (Seq_length xs@3@00))
    (and
      (>= j@11@00 0)
      (and (< j@11@00 (Seq_length xs@3@00)) (not (= i@10@00 j@11@00)))))))
; [eval] xs[i] != xs[j]
; [eval] xs[i]
; [eval] xs[j]
(pop) ; 4
(push) ; 4
; [else-branch: 5 | !(i@10@00 >= 0 && i@10@00 < |xs@3@00| && j@11@00 >= 0 && j@11@00 < |xs@3@00| && i@10@00 != j@11@00)]
(assert (not
  (and
    (>= i@10@00 0)
    (and
      (< i@10@00 (Seq_length xs@3@00))
      (and
        (>= j@11@00 0)
        (and (< j@11@00 (Seq_length xs@3@00)) (not (= i@10@00 j@11@00))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (>= i@10@00 0)
    (and
      (< i@10@00 (Seq_length xs@3@00))
      (and
        (>= j@11@00 0)
        (and (< j@11@00 (Seq_length xs@3@00)) (not (= i@10@00 j@11@00))))))
  (and
    (>= i@10@00 0)
    (< i@10@00 (Seq_length xs@3@00))
    (>= j@11@00 0)
    (< j@11@00 (Seq_length xs@3@00))
    (not (= i@10@00 j@11@00)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= i@10@00 0)
      (and
        (< i@10@00 (Seq_length xs@3@00))
        (and
          (>= j@11@00 0)
          (and (< j@11@00 (Seq_length xs@3@00)) (not (= i@10@00 j@11@00)))))))
  (and
    (>= i@10@00 0)
    (and
      (< i@10@00 (Seq_length xs@3@00))
      (and
        (>= j@11@00 0)
        (and (< j@11@00 (Seq_length xs@3@00)) (not (= i@10@00 j@11@00))))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@10@00 Int) (j@11@00 Int)) (!
  (and
    (=>
      (>= i@10@00 0)
      (and
        (>= i@10@00 0)
        (=>
          (< i@10@00 (Seq_length xs@3@00))
          (and
            (< i@10@00 (Seq_length xs@3@00))
            (=>
              (>= j@11@00 0)
              (and
                (>= j@11@00 0)
                (or
                  (< j@11@00 (Seq_length xs@3@00))
                  (not (< j@11@00 (Seq_length xs@3@00))))))
            (or (>= j@11@00 0) (not (>= j@11@00 0)))))
        (or
          (< i@10@00 (Seq_length xs@3@00))
          (not (< i@10@00 (Seq_length xs@3@00))))))
    (or (>= i@10@00 0) (not (>= i@10@00 0)))
    (=>
      (and
        (>= i@10@00 0)
        (and
          (< i@10@00 (Seq_length xs@3@00))
          (and
            (>= j@11@00 0)
            (and (< j@11@00 (Seq_length xs@3@00)) (not (= i@10@00 j@11@00))))))
      (and
        (>= i@10@00 0)
        (< i@10@00 (Seq_length xs@3@00))
        (>= j@11@00 0)
        (< j@11@00 (Seq_length xs@3@00))
        (not (= i@10@00 j@11@00))))
    (or
      (not
        (and
          (>= i@10@00 0)
          (and
            (< i@10@00 (Seq_length xs@3@00))
            (and
              (>= j@11@00 0)
              (and (< j@11@00 (Seq_length xs@3@00)) (not (= i@10@00 j@11@00)))))))
      (and
        (>= i@10@00 0)
        (and
          (< i@10@00 (Seq_length xs@3@00))
          (and
            (>= j@11@00 0)
            (and (< j@11@00 (Seq_length xs@3@00)) (not (= i@10@00 j@11@00))))))))
  :pattern ((Seq_index xs@3@00 i@10@00) (Seq_index xs@3@00 j@11@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions2.vpr@26@12@26@106-aux|)))
(assert (forall ((i@10@00 Int) (j@11@00 Int)) (!
  (=>
    (and
      (>= i@10@00 0)
      (and
        (< i@10@00 (Seq_length xs@3@00))
        (and
          (>= j@11@00 0)
          (and (< j@11@00 (Seq_length xs@3@00)) (not (= i@10@00 j@11@00))))))
    (not (= (Seq_index xs@3@00 i@10@00) (Seq_index xs@3@00 j@11@00))))
  :pattern ((Seq_index xs@3@00 i@10@00) (Seq_index xs@3@00 j@11@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions2.vpr@26@12@26@106|)))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(declare-const i@12@00 Int)
(push) ; 2
; [eval] 0 <= i && i < |xs|
; [eval] 0 <= i
(push) ; 3
; [then-branch: 6 | !(0 <= i@12@00) | live]
; [else-branch: 6 | 0 <= i@12@00 | live]
(push) ; 4
; [then-branch: 6 | !(0 <= i@12@00)]
(assert (not (<= 0 i@12@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 6 | 0 <= i@12@00]
(assert (<= 0 i@12@00))
; [eval] i < |xs|
; [eval] |xs|
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@12@00) (not (<= 0 i@12@00))))
(assert (and (<= 0 i@12@00) (< i@12@00 (Seq_length xs@3@00))))
; [eval] xs[i]
(push) ; 3
(assert (not (>= i@12@00 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@13@00 ($Snap Seq<$Ref> Seq<$Ref> $Ref) Int)
(declare-fun img@14@00 ($Snap Seq<$Ref> Seq<$Ref> $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@12@00 Int)) (!
  (=>
    (and (<= 0 i@12@00) (< i@12@00 (Seq_length xs@3@00)))
    (or (<= 0 i@12@00) (not (<= 0 i@12@00))))
  :pattern ((Seq_index xs@3@00 i@12@00))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@12@00 Int) (i2@12@00 Int)) (!
  (=>
    (and
      (and (<= 0 i1@12@00) (< i1@12@00 (Seq_length xs@3@00)))
      (and (<= 0 i2@12@00) (< i2@12@00 (Seq_length xs@3@00)))
      (= (Seq_index xs@3@00 i1@12@00) (Seq_index xs@3@00 i2@12@00)))
    (= i1@12@00 i2@12@00))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@12@00 Int)) (!
  (=>
    (and (<= 0 i@12@00) (< i@12@00 (Seq_length xs@3@00)))
    (and
      (= (inv@13@00 s@$ xs@3@00 ys@4@00 (Seq_index xs@3@00 i@12@00)) i@12@00)
      (img@14@00 s@$ xs@3@00 ys@4@00 (Seq_index xs@3@00 i@12@00))))
  :pattern ((Seq_index xs@3@00 i@12@00))
  :qid |quant-u-9|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@14@00 s@$ xs@3@00 ys@4@00 r)
      (and
        (<= 0 (inv@13@00 s@$ xs@3@00 ys@4@00 r))
        (< (inv@13@00 s@$ xs@3@00 ys@4@00 r) (Seq_length xs@3@00))))
    (= (Seq_index xs@3@00 (inv@13@00 s@$ xs@3@00 ys@4@00 r)) r))
  :pattern ((inv@13@00 s@$ xs@3@00 ys@4@00 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@12@00 Int)) (!
  (=>
    (and (<= 0 i@12@00) (< i@12@00 (Seq_length xs@3@00)))
    (not (= (Seq_index xs@3@00 i@12@00) $Ref.null)))
  :pattern ((Seq_index xs@3@00 i@12@00))
  :qid |f-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit))
; [eval] (forall i: Int, j: Int :: { ys[i], ys[j] } i >= 0 && (i < |ys| && (j >= 0 && (j < |ys| && i != j))) ==> ys[i] != ys[j])
(declare-const i@15@00 Int)
(declare-const j@16@00 Int)
(push) ; 2
; [eval] i >= 0 && (i < |ys| && (j >= 0 && (j < |ys| && i != j))) ==> ys[i] != ys[j]
; [eval] i >= 0 && (i < |ys| && (j >= 0 && (j < |ys| && i != j)))
; [eval] i >= 0
(push) ; 3
; [then-branch: 7 | !(i@15@00 >= 0) | live]
; [else-branch: 7 | i@15@00 >= 0 | live]
(push) ; 4
; [then-branch: 7 | !(i@15@00 >= 0)]
(assert (not (>= i@15@00 0)))
(pop) ; 4
(push) ; 4
; [else-branch: 7 | i@15@00 >= 0]
(assert (>= i@15@00 0))
; [eval] i < |ys|
; [eval] |ys|
(push) ; 5
; [then-branch: 8 | !(i@15@00 < |ys@4@00|) | live]
; [else-branch: 8 | i@15@00 < |ys@4@00| | live]
(push) ; 6
; [then-branch: 8 | !(i@15@00 < |ys@4@00|)]
(assert (not (< i@15@00 (Seq_length ys@4@00))))
(pop) ; 6
(push) ; 6
; [else-branch: 8 | i@15@00 < |ys@4@00|]
(assert (< i@15@00 (Seq_length ys@4@00)))
; [eval] j >= 0
(push) ; 7
; [then-branch: 9 | !(j@16@00 >= 0) | live]
; [else-branch: 9 | j@16@00 >= 0 | live]
(push) ; 8
; [then-branch: 9 | !(j@16@00 >= 0)]
(assert (not (>= j@16@00 0)))
(pop) ; 8
(push) ; 8
; [else-branch: 9 | j@16@00 >= 0]
(assert (>= j@16@00 0))
; [eval] j < |ys|
; [eval] |ys|
(push) ; 9
; [then-branch: 10 | !(j@16@00 < |ys@4@00|) | live]
; [else-branch: 10 | j@16@00 < |ys@4@00| | live]
(push) ; 10
; [then-branch: 10 | !(j@16@00 < |ys@4@00|)]
(assert (not (< j@16@00 (Seq_length ys@4@00))))
(pop) ; 10
(push) ; 10
; [else-branch: 10 | j@16@00 < |ys@4@00|]
(assert (< j@16@00 (Seq_length ys@4@00)))
; [eval] i != j
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< j@16@00 (Seq_length ys@4@00)) (not (< j@16@00 (Seq_length ys@4@00)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@16@00 0)
  (and
    (>= j@16@00 0)
    (or (< j@16@00 (Seq_length ys@4@00)) (not (< j@16@00 (Seq_length ys@4@00)))))))
(assert (or (>= j@16@00 0) (not (>= j@16@00 0))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i@15@00 (Seq_length ys@4@00))
  (and
    (< i@15@00 (Seq_length ys@4@00))
    (=>
      (>= j@16@00 0)
      (and
        (>= j@16@00 0)
        (or
          (< j@16@00 (Seq_length ys@4@00))
          (not (< j@16@00 (Seq_length ys@4@00))))))
    (or (>= j@16@00 0) (not (>= j@16@00 0))))))
(assert (or (< i@15@00 (Seq_length ys@4@00)) (not (< i@15@00 (Seq_length ys@4@00)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= i@15@00 0)
  (and
    (>= i@15@00 0)
    (=>
      (< i@15@00 (Seq_length ys@4@00))
      (and
        (< i@15@00 (Seq_length ys@4@00))
        (=>
          (>= j@16@00 0)
          (and
            (>= j@16@00 0)
            (or
              (< j@16@00 (Seq_length ys@4@00))
              (not (< j@16@00 (Seq_length ys@4@00))))))
        (or (>= j@16@00 0) (not (>= j@16@00 0)))))
    (or (< i@15@00 (Seq_length ys@4@00)) (not (< i@15@00 (Seq_length ys@4@00)))))))
(assert (or (>= i@15@00 0) (not (>= i@15@00 0))))
(push) ; 3
; [then-branch: 11 | i@15@00 >= 0 && i@15@00 < |ys@4@00| && j@16@00 >= 0 && j@16@00 < |ys@4@00| && i@15@00 != j@16@00 | live]
; [else-branch: 11 | !(i@15@00 >= 0 && i@15@00 < |ys@4@00| && j@16@00 >= 0 && j@16@00 < |ys@4@00| && i@15@00 != j@16@00) | live]
(push) ; 4
; [then-branch: 11 | i@15@00 >= 0 && i@15@00 < |ys@4@00| && j@16@00 >= 0 && j@16@00 < |ys@4@00| && i@15@00 != j@16@00]
(assert (and
  (>= i@15@00 0)
  (and
    (< i@15@00 (Seq_length ys@4@00))
    (and
      (>= j@16@00 0)
      (and (< j@16@00 (Seq_length ys@4@00)) (not (= i@15@00 j@16@00)))))))
; [eval] ys[i] != ys[j]
; [eval] ys[i]
; [eval] ys[j]
(pop) ; 4
(push) ; 4
; [else-branch: 11 | !(i@15@00 >= 0 && i@15@00 < |ys@4@00| && j@16@00 >= 0 && j@16@00 < |ys@4@00| && i@15@00 != j@16@00)]
(assert (not
  (and
    (>= i@15@00 0)
    (and
      (< i@15@00 (Seq_length ys@4@00))
      (and
        (>= j@16@00 0)
        (and (< j@16@00 (Seq_length ys@4@00)) (not (= i@15@00 j@16@00))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (>= i@15@00 0)
    (and
      (< i@15@00 (Seq_length ys@4@00))
      (and
        (>= j@16@00 0)
        (and (< j@16@00 (Seq_length ys@4@00)) (not (= i@15@00 j@16@00))))))
  (and
    (>= i@15@00 0)
    (< i@15@00 (Seq_length ys@4@00))
    (>= j@16@00 0)
    (< j@16@00 (Seq_length ys@4@00))
    (not (= i@15@00 j@16@00)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= i@15@00 0)
      (and
        (< i@15@00 (Seq_length ys@4@00))
        (and
          (>= j@16@00 0)
          (and (< j@16@00 (Seq_length ys@4@00)) (not (= i@15@00 j@16@00)))))))
  (and
    (>= i@15@00 0)
    (and
      (< i@15@00 (Seq_length ys@4@00))
      (and
        (>= j@16@00 0)
        (and (< j@16@00 (Seq_length ys@4@00)) (not (= i@15@00 j@16@00))))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@15@00 Int) (j@16@00 Int)) (!
  (and
    (=>
      (>= i@15@00 0)
      (and
        (>= i@15@00 0)
        (=>
          (< i@15@00 (Seq_length ys@4@00))
          (and
            (< i@15@00 (Seq_length ys@4@00))
            (=>
              (>= j@16@00 0)
              (and
                (>= j@16@00 0)
                (or
                  (< j@16@00 (Seq_length ys@4@00))
                  (not (< j@16@00 (Seq_length ys@4@00))))))
            (or (>= j@16@00 0) (not (>= j@16@00 0)))))
        (or
          (< i@15@00 (Seq_length ys@4@00))
          (not (< i@15@00 (Seq_length ys@4@00))))))
    (or (>= i@15@00 0) (not (>= i@15@00 0)))
    (=>
      (and
        (>= i@15@00 0)
        (and
          (< i@15@00 (Seq_length ys@4@00))
          (and
            (>= j@16@00 0)
            (and (< j@16@00 (Seq_length ys@4@00)) (not (= i@15@00 j@16@00))))))
      (and
        (>= i@15@00 0)
        (< i@15@00 (Seq_length ys@4@00))
        (>= j@16@00 0)
        (< j@16@00 (Seq_length ys@4@00))
        (not (= i@15@00 j@16@00))))
    (or
      (not
        (and
          (>= i@15@00 0)
          (and
            (< i@15@00 (Seq_length ys@4@00))
            (and
              (>= j@16@00 0)
              (and (< j@16@00 (Seq_length ys@4@00)) (not (= i@15@00 j@16@00)))))))
      (and
        (>= i@15@00 0)
        (and
          (< i@15@00 (Seq_length ys@4@00))
          (and
            (>= j@16@00 0)
            (and (< j@16@00 (Seq_length ys@4@00)) (not (= i@15@00 j@16@00))))))))
  :pattern ((Seq_index ys@4@00 i@15@00) (Seq_index ys@4@00 j@16@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions2.vpr@28@12@28@106-aux|)))
(assert (forall ((i@15@00 Int) (j@16@00 Int)) (!
  (=>
    (and
      (>= i@15@00 0)
      (and
        (< i@15@00 (Seq_length ys@4@00))
        (and
          (>= j@16@00 0)
          (and (< j@16@00 (Seq_length ys@4@00)) (not (= i@15@00 j@16@00))))))
    (not (= (Seq_index ys@4@00 i@15@00) (Seq_index ys@4@00 j@16@00))))
  :pattern ((Seq_index ys@4@00 i@15@00) (Seq_index ys@4@00 j@16@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions2.vpr@28@12@28@106|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second s@$)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
(declare-const i@17@00 Int)
(push) ; 2
; [eval] 0 <= i && i < |ys|
; [eval] 0 <= i
(push) ; 3
; [then-branch: 12 | !(0 <= i@17@00) | live]
; [else-branch: 12 | 0 <= i@17@00 | live]
(push) ; 4
; [then-branch: 12 | !(0 <= i@17@00)]
(assert (not (<= 0 i@17@00)))
(pop) ; 4
(push) ; 4
; [else-branch: 12 | 0 <= i@17@00]
(assert (<= 0 i@17@00))
; [eval] i < |ys|
; [eval] |ys|
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@17@00) (not (<= 0 i@17@00))))
(assert (and (<= 0 i@17@00) (< i@17@00 (Seq_length ys@4@00))))
; [eval] ys[i]
(push) ; 3
(assert (not (>= i@17@00 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@18@00 ($Snap Seq<$Ref> Seq<$Ref> $Ref) Int)
(declare-fun img@19@00 ($Snap Seq<$Ref> Seq<$Ref> $Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@17@00 Int)) (!
  (=>
    (and (<= 0 i@17@00) (< i@17@00 (Seq_length ys@4@00)))
    (or (<= 0 i@17@00) (not (<= 0 i@17@00))))
  :pattern ((Seq_index ys@4@00 i@17@00))
  :qid |f-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@17@00 Int) (i2@17@00 Int)) (!
  (=>
    (and
      (and (<= 0 i1@17@00) (< i1@17@00 (Seq_length ys@4@00)))
      (and (<= 0 i2@17@00) (< i2@17@00 (Seq_length ys@4@00)))
      (= (Seq_index ys@4@00 i1@17@00) (Seq_index ys@4@00 i2@17@00)))
    (= i1@17@00 i2@17@00))
  
  :qid |f-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@17@00 Int)) (!
  (=>
    (and (<= 0 i@17@00) (< i@17@00 (Seq_length ys@4@00)))
    (and
      (= (inv@18@00 s@$ xs@3@00 ys@4@00 (Seq_index ys@4@00 i@17@00)) i@17@00)
      (img@19@00 s@$ xs@3@00 ys@4@00 (Seq_index ys@4@00 i@17@00))))
  :pattern ((Seq_index ys@4@00 i@17@00))
  :qid |quant-u-11|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@19@00 s@$ xs@3@00 ys@4@00 r)
      (and
        (<= 0 (inv@18@00 s@$ xs@3@00 ys@4@00 r))
        (< (inv@18@00 s@$ xs@3@00 ys@4@00 r) (Seq_length ys@4@00))))
    (= (Seq_index ys@4@00 (inv@18@00 s@$ xs@3@00 ys@4@00 r)) r))
  :pattern ((inv@18@00 s@$ xs@3@00 ys@4@00 r))
  :qid |f-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@17@00 Int)) (!
  (=>
    (and (<= 0 i@17@00) (< i@17@00 (Seq_length ys@4@00)))
    (not (= (Seq_index ys@4@00 i@17@00) $Ref.null)))
  :pattern ((Seq_index ys@4@00 i@17@00))
  :qid |f-permImpliesNonNull|)))
(push) ; 2
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index ys@4@00 i@17@00) (Seq_index xs@3@00 i@12@00))
    (=
      (and
        (img@19@00 s@$ xs@3@00 ys@4@00 r)
        (and
          (<= 0 (inv@18@00 s@$ xs@3@00 ys@4@00 r))
          (< (inv@18@00 s@$ xs@3@00 ys@4@00 r) (Seq_length ys@4@00))))
      (and
        (img@14@00 s@$ xs@3@00 ys@4@00 r)
        (and
          (<= 0 (inv@13@00 s@$ xs@3@00 ys@4@00 r))
          (< (inv@13@00 s@$ xs@3@00 ys@4@00 r) (Seq_length xs@3@00))))))
  
  :qid |quant-u-12|))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
  $Snap.unit))
; [eval] 10 < |xs|
; [eval] |xs|
(assert (< 10 (Seq_length xs@3@00)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
  $Snap.unit))
; [eval] |xs| == |ys|
; [eval] |xs|
; [eval] |ys|
(assert (= (Seq_length xs@3@00) (Seq_length ys@4@00)))
(pop) ; 1
(assert (forall ((s@$ $Snap) (xs@3@00 Seq<$Ref>) (ys@4@00 Seq<$Ref>)) (!
  (= (fun02%limited s@$ xs@3@00 ys@4@00) (fun02 s@$ xs@3@00 ys@4@00))
  :pattern ((fun02 s@$ xs@3@00 ys@4@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (xs@3@00 Seq<$Ref>) (ys@4@00 Seq<$Ref>)) (!
  (fun02%stateless xs@3@00 ys@4@00)
  :pattern ((fun02%limited s@$ xs@3@00 ys@4@00))
  :qid |quant-u-3|)))
; ----- Verification of function body and postcondition -----
(set-option :timeout 0)
(push) ; 1
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@19@00 s@$ xs@3@00 ys@4@00 r)
      (and
        (<= 0 (inv@18@00 s@$ xs@3@00 ys@4@00 r))
        (< (inv@18@00 s@$ xs@3@00 ys@4@00 r) (Seq_length ys@4@00))))
    (= (Seq_index ys@4@00 (inv@18@00 s@$ xs@3@00 ys@4@00 r)) r))
  :pattern ((inv@18@00 s@$ xs@3@00 ys@4@00 r))
  :qid |f-fctOfInv|)))
(assert (forall ((i@17@00 Int)) (!
  (=>
    (and (<= 0 i@17@00) (< i@17@00 (Seq_length ys@4@00)))
    (and
      (= (inv@18@00 s@$ xs@3@00 ys@4@00 (Seq_index ys@4@00 i@17@00)) i@17@00)
      (img@19@00 s@$ xs@3@00 ys@4@00 (Seq_index ys@4@00 i@17@00))))
  :pattern ((Seq_index ys@4@00 i@17@00))
  :qid |quant-u-11|)))
(assert (forall ((i@17@00 Int)) (!
  (=>
    (and (<= 0 i@17@00) (< i@17@00 (Seq_length ys@4@00)))
    (not (= (Seq_index ys@4@00 i@17@00) $Ref.null)))
  :pattern ((Seq_index ys@4@00 i@17@00))
  :qid |f-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
  $Snap.unit))
(assert (< 10 (Seq_length xs@3@00)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))
  $Snap.unit))
(assert (= (Seq_length xs@3@00) (Seq_length ys@4@00)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@14@00 s@$ xs@3@00 ys@4@00 r)
      (and
        (<= 0 (inv@13@00 s@$ xs@3@00 ys@4@00 r))
        (< (inv@13@00 s@$ xs@3@00 ys@4@00 r) (Seq_length xs@3@00))))
    (= (Seq_index xs@3@00 (inv@13@00 s@$ xs@3@00 ys@4@00 r)) r))
  :pattern ((inv@13@00 s@$ xs@3@00 ys@4@00 r))
  :qid |f-fctOfInv|)))
(assert (forall ((i@12@00 Int)) (!
  (=>
    (and (<= 0 i@12@00) (< i@12@00 (Seq_length xs@3@00)))
    (and
      (= (inv@13@00 s@$ xs@3@00 ys@4@00 (Seq_index xs@3@00 i@12@00)) i@12@00)
      (img@14@00 s@$ xs@3@00 ys@4@00 (Seq_index xs@3@00 i@12@00))))
  :pattern ((Seq_index xs@3@00 i@12@00))
  :qid |quant-u-9|)))
(assert (forall ((i@12@00 Int)) (!
  (=>
    (and (<= 0 i@12@00) (< i@12@00 (Seq_length xs@3@00)))
    (not (= (Seq_index xs@3@00 i@12@00) $Ref.null)))
  :pattern ((Seq_index xs@3@00 i@12@00))
  :qid |f-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second s@$))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second s@$)))
    ($Snap.second ($Snap.second ($Snap.second s@$))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second s@$))) $Snap.unit))
(assert (forall ((i@15@00 Int) (j@16@00 Int)) (!
  (and
    (=>
      (>= i@15@00 0)
      (and
        (>= i@15@00 0)
        (=>
          (< i@15@00 (Seq_length ys@4@00))
          (and
            (< i@15@00 (Seq_length ys@4@00))
            (=>
              (>= j@16@00 0)
              (and
                (>= j@16@00 0)
                (or
                  (< j@16@00 (Seq_length ys@4@00))
                  (not (< j@16@00 (Seq_length ys@4@00))))))
            (or (>= j@16@00 0) (not (>= j@16@00 0)))))
        (or
          (< i@15@00 (Seq_length ys@4@00))
          (not (< i@15@00 (Seq_length ys@4@00))))))
    (or (>= i@15@00 0) (not (>= i@15@00 0)))
    (=>
      (and
        (>= i@15@00 0)
        (and
          (< i@15@00 (Seq_length ys@4@00))
          (and
            (>= j@16@00 0)
            (and (< j@16@00 (Seq_length ys@4@00)) (not (= i@15@00 j@16@00))))))
      (and
        (>= i@15@00 0)
        (< i@15@00 (Seq_length ys@4@00))
        (>= j@16@00 0)
        (< j@16@00 (Seq_length ys@4@00))
        (not (= i@15@00 j@16@00))))
    (or
      (not
        (and
          (>= i@15@00 0)
          (and
            (< i@15@00 (Seq_length ys@4@00))
            (and
              (>= j@16@00 0)
              (and (< j@16@00 (Seq_length ys@4@00)) (not (= i@15@00 j@16@00)))))))
      (and
        (>= i@15@00 0)
        (and
          (< i@15@00 (Seq_length ys@4@00))
          (and
            (>= j@16@00 0)
            (and (< j@16@00 (Seq_length ys@4@00)) (not (= i@15@00 j@16@00))))))))
  :pattern ((Seq_index ys@4@00 i@15@00) (Seq_index ys@4@00 j@16@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions2.vpr@28@12@28@106-aux|)))
(assert (forall ((i@15@00 Int) (j@16@00 Int)) (!
  (=>
    (and
      (>= i@15@00 0)
      (and
        (< i@15@00 (Seq_length ys@4@00))
        (and
          (>= j@16@00 0)
          (and (< j@16@00 (Seq_length ys@4@00)) (not (= i@15@00 j@16@00))))))
    (not (= (Seq_index ys@4@00 i@15@00) (Seq_index ys@4@00 j@16@00))))
  :pattern ((Seq_index ys@4@00 i@15@00) (Seq_index ys@4@00 j@16@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions2.vpr@28@12@28@106|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second s@$)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second s@$))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))
(assert (forall ((i@17@00 Int)) (!
  (=>
    (and (<= 0 i@17@00) (< i@17@00 (Seq_length ys@4@00)))
    (or (<= 0 i@17@00) (not (<= 0 i@17@00))))
  :pattern ((Seq_index ys@4@00 i@17@00))
  :qid |f-aux|)))
(assert (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))))
(assert (= ($Snap.first s@$) $Snap.unit))
(assert (forall ((i@10@00 Int) (j@11@00 Int)) (!
  (and
    (=>
      (>= i@10@00 0)
      (and
        (>= i@10@00 0)
        (=>
          (< i@10@00 (Seq_length xs@3@00))
          (and
            (< i@10@00 (Seq_length xs@3@00))
            (=>
              (>= j@11@00 0)
              (and
                (>= j@11@00 0)
                (or
                  (< j@11@00 (Seq_length xs@3@00))
                  (not (< j@11@00 (Seq_length xs@3@00))))))
            (or (>= j@11@00 0) (not (>= j@11@00 0)))))
        (or
          (< i@10@00 (Seq_length xs@3@00))
          (not (< i@10@00 (Seq_length xs@3@00))))))
    (or (>= i@10@00 0) (not (>= i@10@00 0)))
    (=>
      (and
        (>= i@10@00 0)
        (and
          (< i@10@00 (Seq_length xs@3@00))
          (and
            (>= j@11@00 0)
            (and (< j@11@00 (Seq_length xs@3@00)) (not (= i@10@00 j@11@00))))))
      (and
        (>= i@10@00 0)
        (< i@10@00 (Seq_length xs@3@00))
        (>= j@11@00 0)
        (< j@11@00 (Seq_length xs@3@00))
        (not (= i@10@00 j@11@00))))
    (or
      (not
        (and
          (>= i@10@00 0)
          (and
            (< i@10@00 (Seq_length xs@3@00))
            (and
              (>= j@11@00 0)
              (and (< j@11@00 (Seq_length xs@3@00)) (not (= i@10@00 j@11@00)))))))
      (and
        (>= i@10@00 0)
        (and
          (< i@10@00 (Seq_length xs@3@00))
          (and
            (>= j@11@00 0)
            (and (< j@11@00 (Seq_length xs@3@00)) (not (= i@10@00 j@11@00))))))))
  :pattern ((Seq_index xs@3@00 i@10@00) (Seq_index xs@3@00 j@11@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions2.vpr@26@12@26@106-aux|)))
(assert (forall ((i@10@00 Int) (j@11@00 Int)) (!
  (=>
    (and
      (>= i@10@00 0)
      (and
        (< i@10@00 (Seq_length xs@3@00))
        (and
          (>= j@11@00 0)
          (and (< j@11@00 (Seq_length xs@3@00)) (not (= i@10@00 j@11@00))))))
    (not (= (Seq_index xs@3@00 i@10@00) (Seq_index xs@3@00 j@11@00))))
  :pattern ((Seq_index xs@3@00 i@10@00) (Seq_index xs@3@00 j@11@00))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/misc/functions2.vpr@26@12@26@106|)))
(assert (=
  ($Snap.second s@$)
  ($Snap.combine
    ($Snap.first ($Snap.second s@$))
    ($Snap.second ($Snap.second s@$)))))
(assert (forall ((i@12@00 Int)) (!
  (=>
    (and (<= 0 i@12@00) (< i@12@00 (Seq_length xs@3@00)))
    (or (<= 0 i@12@00) (not (<= 0 i@12@00))))
  :pattern ((Seq_index xs@3@00 i@12@00))
  :qid |f-aux|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] xs[0].f == ys[0].f
; [eval] xs[0]
(set-option :timeout 0)
(push) ; 2
(assert (not (< 0 (Seq_length xs@3@00))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(declare-fun sm@20@00 ($Snap Seq<$Ref> Seq<$Ref>) $FVF<f>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
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
  :qid |qp.fvfValDef1|)))
(declare-const pm@21@00 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_f (as pm@21@00  $FPM) r)
    (+
      (ite
        (and
          (img@14@00 s@$ xs@3@00 ys@4@00 r)
          (and
            (<= 0 (inv@13@00 s@$ xs@3@00 ys@4@00 r))
            (< (inv@13@00 s@$ xs@3@00 ys@4@00 r) (Seq_length xs@3@00))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@19@00 s@$ xs@3@00 ys@4@00 r)
          (and
            (<= 0 (inv@18@00 s@$ xs@3@00 ys@4@00 r))
            (< (inv@18@00 s@$ xs@3@00 ys@4@00 r) (Seq_length ys@4@00))))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_f (as pm@21@00  $FPM) r))
  :qid |qp.resPrmSumDef2|)))
(push) ; 2
(assert (not (< $Perm.No ($FVF.perm_f (as pm@21@00  $FPM) (Seq_index xs@3@00 0)))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [eval] ys[0]
(push) ; 2
(assert (not (< 0 (Seq_length ys@4@00))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (and
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
    :qid |qp.fvfValDef1|))))
(push) ; 2
(assert (not (<
  $Perm.No
  (+
    (ite
      (and
        (img@14@00 s@$ xs@3@00 ys@4@00 (Seq_index ys@4@00 0))
        (and
          (<= 0 (inv@13@00 s@$ xs@3@00 ys@4@00 (Seq_index ys@4@00 0)))
          (<
            (inv@13@00 s@$ xs@3@00 ys@4@00 (Seq_index ys@4@00 0))
            (Seq_length xs@3@00))))
      $Perm.Write
      $Perm.No)
    (ite
      (and
        (img@19@00 s@$ xs@3@00 ys@4@00 (Seq_index ys@4@00 0))
        (and
          (<= 0 (inv@18@00 s@$ xs@3@00 ys@4@00 (Seq_index ys@4@00 0)))
          (<
            (inv@18@00 s@$ xs@3@00 ys@4@00 (Seq_index ys@4@00 0))
            (Seq_length ys@4@00))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (=
  result@5@00
  (=
    ($FVF.lookup_f (sm@20@00 s@$ xs@3@00 ys@4@00) (Seq_index xs@3@00 0))
    ($FVF.lookup_f (sm@20@00 s@$ xs@3@00 ys@4@00) (Seq_index ys@4@00 0)))))
(pop) ; 1
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
