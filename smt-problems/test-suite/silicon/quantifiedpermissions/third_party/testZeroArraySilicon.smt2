(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:22:41
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/quantifiedpermissions/third_party/testZeroArraySilicon.vpr
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
(declare-sort Set<Int> 0)
(declare-sort Set<$Ref> 0)
(declare-sort Set<$Snap> 0)
(declare-sort $FVF<Ref__Integer_value> 0)
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
(declare-fun $SortWrappers.$FVF<Ref__Integer_value>To$Snap ($FVF<Ref__Integer_value>) $Snap)
(declare-fun $SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap) $FVF<Ref__Integer_value>)
(assert (forall ((x $FVF<Ref__Integer_value>)) (!
    (= x ($SortWrappers.$SnapTo$FVF<Ref__Integer_value>($SortWrappers.$FVF<Ref__Integer_value>To$Snap x)))
    :pattern (($SortWrappers.$FVF<Ref__Integer_value>To$Snap x))
    :qid |$Snap.$SnapTo$FVF<Ref__Integer_value>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$FVF<Ref__Integer_value>To$Snap($SortWrappers.$SnapTo$FVF<Ref__Integer_value> x)))
    :pattern (($SortWrappers.$SnapTo$FVF<Ref__Integer_value> x))
    :qid |$Snap.$FVF<Ref__Integer_value>To$SnapTo$FVF<Ref__Integer_value>|
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
; /field_value_functions_declarations.smt2 [Ref__Integer_value: Int]
(declare-fun $FVF.domain_Ref__Integer_value ($FVF<Ref__Integer_value>) Set<$Ref>)
(declare-fun $FVF.lookup_Ref__Integer_value ($FVF<Ref__Integer_value> $Ref) Int)
(declare-fun $FVF.after_Ref__Integer_value ($FVF<Ref__Integer_value> $FVF<Ref__Integer_value>) Bool)
(declare-fun $FVF.loc_Ref__Integer_value (Int $Ref) Bool)
(declare-fun $FVF.perm_Ref__Integer_value ($FPM $Ref) $Perm)
(declare-const $fvfTOP_Ref__Integer_value $FVF<Ref__Integer_value>)
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
; /field_value_functions_axioms.smt2 [Ref__Integer_value: Int]
(assert (forall ((vs $FVF<Ref__Integer_value>) (ws $FVF<Ref__Integer_value>)) (!
    (=>
      (and
        (Set_equal ($FVF.domain_Ref__Integer_value vs) ($FVF.domain_Ref__Integer_value ws))
        (forall ((x $Ref)) (!
          (=>
            (Set_in x ($FVF.domain_Ref__Integer_value vs))
            (= ($FVF.lookup_Ref__Integer_value vs x) ($FVF.lookup_Ref__Integer_value ws x)))
          :pattern (($FVF.lookup_Ref__Integer_value vs x) ($FVF.lookup_Ref__Integer_value ws x))
          :qid |qp.$FVF<Ref__Integer_value>-eq-inner|
          )))
      (= vs ws))
    :pattern (($SortWrappers.$FVF<Ref__Integer_value>To$Snap vs)
              ($SortWrappers.$FVF<Ref__Integer_value>To$Snap ws)
              )
    :qid |qp.$FVF<Ref__Integer_value>-eq-outer|
    )))
(assert (forall ((r $Ref) (pm $FPM)) (!
    ($Perm.isValidVar ($FVF.perm_Ref__Integer_value pm r))
    :pattern (($FVF.perm_Ref__Integer_value pm r)))))
(assert (forall ((r $Ref) (f Int)) (!
    (= ($FVF.loc_Ref__Integer_value f r) true)
    :pattern (($FVF.loc_Ref__Integer_value f r)))))
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
; ---------- ZeroArray__zero_array ----------
(declare-const diz@0@01 $Ref)
(declare-const current_thread_id@1@01 Int)
(declare-const ar@2@01 Seq<$Ref>)
(declare-const diz@3@01 $Ref)
(declare-const current_thread_id@4@01 Int)
(declare-const ar@5@01 Seq<$Ref>)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@6@01 $Snap)
(assert (= $t@6@01 ($Snap.combine ($Snap.first $t@6@01) ($Snap.second $t@6@01))))
(assert (= ($Snap.first $t@6@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@3@01 $Ref.null)))
(assert (=
  ($Snap.second $t@6@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@6@01))
    ($Snap.second ($Snap.second $t@6@01)))))
(assert (= ($Snap.first ($Snap.second $t@6@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@4@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@6@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@6@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@6@01))) $Snap.unit))
; [eval] (forall j: Int, k: Int :: { ar[j], ar[k] } 0 <= j && (j < |ar| && (0 <= k && (k < |ar| && j != k))) ==> ar[j] != ar[k])
(declare-const j@7@01 Int)
(declare-const k@8@01 Int)
(push) ; 2
; [eval] 0 <= j && (j < |ar| && (0 <= k && (k < |ar| && j != k))) ==> ar[j] != ar[k]
; [eval] 0 <= j && (j < |ar| && (0 <= k && (k < |ar| && j != k)))
; [eval] 0 <= j
(push) ; 3
; [then-branch: 0 | !(0 <= j@7@01) | live]
; [else-branch: 0 | 0 <= j@7@01 | live]
(push) ; 4
; [then-branch: 0 | !(0 <= j@7@01)]
(assert (not (<= 0 j@7@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | 0 <= j@7@01]
(assert (<= 0 j@7@01))
; [eval] j < |ar|
; [eval] |ar|
(push) ; 5
; [then-branch: 1 | !(j@7@01 < |ar@5@01|) | live]
; [else-branch: 1 | j@7@01 < |ar@5@01| | live]
(push) ; 6
; [then-branch: 1 | !(j@7@01 < |ar@5@01|)]
(assert (not (< j@7@01 (Seq_length ar@5@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 1 | j@7@01 < |ar@5@01|]
(assert (< j@7@01 (Seq_length ar@5@01)))
; [eval] 0 <= k
(push) ; 7
; [then-branch: 2 | !(0 <= k@8@01) | live]
; [else-branch: 2 | 0 <= k@8@01 | live]
(push) ; 8
; [then-branch: 2 | !(0 <= k@8@01)]
(assert (not (<= 0 k@8@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 2 | 0 <= k@8@01]
(assert (<= 0 k@8@01))
; [eval] k < |ar|
; [eval] |ar|
(push) ; 9
; [then-branch: 3 | !(k@8@01 < |ar@5@01|) | live]
; [else-branch: 3 | k@8@01 < |ar@5@01| | live]
(push) ; 10
; [then-branch: 3 | !(k@8@01 < |ar@5@01|)]
(assert (not (< k@8@01 (Seq_length ar@5@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 3 | k@8@01 < |ar@5@01|]
(assert (< k@8@01 (Seq_length ar@5@01)))
; [eval] j != k
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< k@8@01 (Seq_length ar@5@01)) (not (< k@8@01 (Seq_length ar@5@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 k@8@01)
  (and
    (<= 0 k@8@01)
    (or (< k@8@01 (Seq_length ar@5@01)) (not (< k@8@01 (Seq_length ar@5@01)))))))
(assert (or (<= 0 k@8@01) (not (<= 0 k@8@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< j@7@01 (Seq_length ar@5@01))
  (and
    (< j@7@01 (Seq_length ar@5@01))
    (=>
      (<= 0 k@8@01)
      (and
        (<= 0 k@8@01)
        (or
          (< k@8@01 (Seq_length ar@5@01))
          (not (< k@8@01 (Seq_length ar@5@01))))))
    (or (<= 0 k@8@01) (not (<= 0 k@8@01))))))
(assert (or (< j@7@01 (Seq_length ar@5@01)) (not (< j@7@01 (Seq_length ar@5@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j@7@01)
  (and
    (<= 0 j@7@01)
    (=>
      (< j@7@01 (Seq_length ar@5@01))
      (and
        (< j@7@01 (Seq_length ar@5@01))
        (=>
          (<= 0 k@8@01)
          (and
            (<= 0 k@8@01)
            (or
              (< k@8@01 (Seq_length ar@5@01))
              (not (< k@8@01 (Seq_length ar@5@01))))))
        (or (<= 0 k@8@01) (not (<= 0 k@8@01)))))
    (or (< j@7@01 (Seq_length ar@5@01)) (not (< j@7@01 (Seq_length ar@5@01)))))))
(assert (or (<= 0 j@7@01) (not (<= 0 j@7@01))))
(push) ; 3
; [then-branch: 4 | 0 <= j@7@01 && j@7@01 < |ar@5@01| && 0 <= k@8@01 && k@8@01 < |ar@5@01| && j@7@01 != k@8@01 | live]
; [else-branch: 4 | !(0 <= j@7@01 && j@7@01 < |ar@5@01| && 0 <= k@8@01 && k@8@01 < |ar@5@01| && j@7@01 != k@8@01) | live]
(push) ; 4
; [then-branch: 4 | 0 <= j@7@01 && j@7@01 < |ar@5@01| && 0 <= k@8@01 && k@8@01 < |ar@5@01| && j@7@01 != k@8@01]
(assert (and
  (<= 0 j@7@01)
  (and
    (< j@7@01 (Seq_length ar@5@01))
    (and
      (<= 0 k@8@01)
      (and (< k@8@01 (Seq_length ar@5@01)) (not (= j@7@01 k@8@01)))))))
; [eval] ar[j] != ar[k]
; [eval] ar[j]
(push) ; 5
(assert (not (>= j@7@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] ar[k]
(push) ; 5
(assert (not (>= k@8@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 4 | !(0 <= j@7@01 && j@7@01 < |ar@5@01| && 0 <= k@8@01 && k@8@01 < |ar@5@01| && j@7@01 != k@8@01)]
(assert (not
  (and
    (<= 0 j@7@01)
    (and
      (< j@7@01 (Seq_length ar@5@01))
      (and
        (<= 0 k@8@01)
        (and (< k@8@01 (Seq_length ar@5@01)) (not (= j@7@01 k@8@01))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (<= 0 j@7@01)
    (and
      (< j@7@01 (Seq_length ar@5@01))
      (and
        (<= 0 k@8@01)
        (and (< k@8@01 (Seq_length ar@5@01)) (not (= j@7@01 k@8@01))))))
  (and
    (<= 0 j@7@01)
    (< j@7@01 (Seq_length ar@5@01))
    (<= 0 k@8@01)
    (< k@8@01 (Seq_length ar@5@01))
    (not (= j@7@01 k@8@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 j@7@01)
      (and
        (< j@7@01 (Seq_length ar@5@01))
        (and
          (<= 0 k@8@01)
          (and (< k@8@01 (Seq_length ar@5@01)) (not (= j@7@01 k@8@01)))))))
  (and
    (<= 0 j@7@01)
    (and
      (< j@7@01 (Seq_length ar@5@01))
      (and
        (<= 0 k@8@01)
        (and (< k@8@01 (Seq_length ar@5@01)) (not (= j@7@01 k@8@01))))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@7@01 Int) (k@8@01 Int)) (!
  (and
    (=>
      (<= 0 j@7@01)
      (and
        (<= 0 j@7@01)
        (=>
          (< j@7@01 (Seq_length ar@5@01))
          (and
            (< j@7@01 (Seq_length ar@5@01))
            (=>
              (<= 0 k@8@01)
              (and
                (<= 0 k@8@01)
                (or
                  (< k@8@01 (Seq_length ar@5@01))
                  (not (< k@8@01 (Seq_length ar@5@01))))))
            (or (<= 0 k@8@01) (not (<= 0 k@8@01)))))
        (or
          (< j@7@01 (Seq_length ar@5@01))
          (not (< j@7@01 (Seq_length ar@5@01))))))
    (or (<= 0 j@7@01) (not (<= 0 j@7@01)))
    (=>
      (and
        (<= 0 j@7@01)
        (and
          (< j@7@01 (Seq_length ar@5@01))
          (and
            (<= 0 k@8@01)
            (and (< k@8@01 (Seq_length ar@5@01)) (not (= j@7@01 k@8@01))))))
      (and
        (<= 0 j@7@01)
        (< j@7@01 (Seq_length ar@5@01))
        (<= 0 k@8@01)
        (< k@8@01 (Seq_length ar@5@01))
        (not (= j@7@01 k@8@01))))
    (or
      (not
        (and
          (<= 0 j@7@01)
          (and
            (< j@7@01 (Seq_length ar@5@01))
            (and
              (<= 0 k@8@01)
              (and (< k@8@01 (Seq_length ar@5@01)) (not (= j@7@01 k@8@01)))))))
      (and
        (<= 0 j@7@01)
        (and
          (< j@7@01 (Seq_length ar@5@01))
          (and
            (<= 0 k@8@01)
            (and (< k@8@01 (Seq_length ar@5@01)) (not (= j@7@01 k@8@01))))))))
  :pattern ((Seq_index ar@5@01 j@7@01) (Seq_index ar@5@01 k@8@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testZeroArraySilicon.vpr@9@12@9@106-aux|)))
(assert (forall ((j@7@01 Int) (k@8@01 Int)) (!
  (=>
    (and
      (<= 0 j@7@01)
      (and
        (< j@7@01 (Seq_length ar@5@01))
        (and
          (<= 0 k@8@01)
          (and (< k@8@01 (Seq_length ar@5@01)) (not (= j@7@01 k@8@01))))))
    (not (= (Seq_index ar@5@01 j@7@01) (Seq_index ar@5@01 k@8@01))))
  :pattern ((Seq_index ar@5@01 j@7@01) (Seq_index ar@5@01 k@8@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testZeroArraySilicon.vpr@9@12@9@106|)))
(declare-const k@9@01 Int)
(push) ; 2
; [eval] 0 <= k && k < |ar|
; [eval] 0 <= k
(push) ; 3
; [then-branch: 5 | !(0 <= k@9@01) | live]
; [else-branch: 5 | 0 <= k@9@01 | live]
(push) ; 4
; [then-branch: 5 | !(0 <= k@9@01)]
(assert (not (<= 0 k@9@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 5 | 0 <= k@9@01]
(assert (<= 0 k@9@01))
; [eval] k < |ar|
; [eval] |ar|
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@9@01) (not (<= 0 k@9@01))))
(assert (and (<= 0 k@9@01) (< k@9@01 (Seq_length ar@5@01))))
; [eval] ar[k]
(push) ; 3
(assert (not (>= k@9@01 0)))
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
(assert (forall ((k@9@01 Int)) (!
  (=>
    (and (<= 0 k@9@01) (< k@9@01 (Seq_length ar@5@01)))
    (or (<= 0 k@9@01) (not (<= 0 k@9@01))))
  :pattern ((Seq_index ar@5@01 k@9@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((k1@9@01 Int) (k2@9@01 Int)) (!
  (=>
    (and
      (and (<= 0 k1@9@01) (< k1@9@01 (Seq_length ar@5@01)))
      (and (<= 0 k2@9@01) (< k2@9@01 (Seq_length ar@5@01)))
      (= (Seq_index ar@5@01 k1@9@01) (Seq_index ar@5@01 k2@9@01)))
    (= k1@9@01 k2@9@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@9@01 Int)) (!
  (=>
    (and (<= 0 k@9@01) (< k@9@01 (Seq_length ar@5@01)))
    (and
      (= (inv@10@01 (Seq_index ar@5@01 k@9@01)) k@9@01)
      (img@11@01 (Seq_index ar@5@01 k@9@01))))
  :pattern ((Seq_index ar@5@01 k@9@01))
  :qid |quant-u-1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@11@01 r)
      (and (<= 0 (inv@10@01 r)) (< (inv@10@01 r) (Seq_length ar@5@01))))
    (= (Seq_index ar@5@01 (inv@10@01 r)) r))
  :pattern ((inv@10@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((k@9@01 Int)) (!
  (=>
    (and (<= 0 k@9@01) (< k@9@01 (Seq_length ar@5@01)))
    (not (= (Seq_index ar@5@01 k@9@01) $Ref.null)))
  :pattern ((Seq_index ar@5@01 k@9@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@12@01 $Snap)
(assert (= $t@12@01 ($Snap.combine ($Snap.first $t@12@01) ($Snap.second $t@12@01))))
(declare-const k@13@01 Int)
(push) ; 3
; [eval] 0 <= k && k < |ar|
; [eval] 0 <= k
(push) ; 4
; [then-branch: 6 | !(0 <= k@13@01) | live]
; [else-branch: 6 | 0 <= k@13@01 | live]
(push) ; 5
; [then-branch: 6 | !(0 <= k@13@01)]
(assert (not (<= 0 k@13@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 6 | 0 <= k@13@01]
(assert (<= 0 k@13@01))
; [eval] k < |ar|
; [eval] |ar|
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@13@01) (not (<= 0 k@13@01))))
(assert (and (<= 0 k@13@01) (< k@13@01 (Seq_length ar@5@01))))
; [eval] ar[k]
(push) ; 4
(assert (not (>= k@13@01 0)))
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
(assert (forall ((k@13@01 Int)) (!
  (=>
    (and (<= 0 k@13@01) (< k@13@01 (Seq_length ar@5@01)))
    (or (<= 0 k@13@01) (not (<= 0 k@13@01))))
  :pattern ((Seq_index ar@5@01 k@13@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((k1@13@01 Int) (k2@13@01 Int)) (!
  (=>
    (and
      (and (<= 0 k1@13@01) (< k1@13@01 (Seq_length ar@5@01)))
      (and (<= 0 k2@13@01) (< k2@13@01 (Seq_length ar@5@01)))
      (= (Seq_index ar@5@01 k1@13@01) (Seq_index ar@5@01 k2@13@01)))
    (= k1@13@01 k2@13@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@13@01 Int)) (!
  (=>
    (and (<= 0 k@13@01) (< k@13@01 (Seq_length ar@5@01)))
    (and
      (= (inv@14@01 (Seq_index ar@5@01 k@13@01)) k@13@01)
      (img@15@01 (Seq_index ar@5@01 k@13@01))))
  :pattern ((Seq_index ar@5@01 k@13@01))
  :qid |quant-u-3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@15@01 r)
      (and (<= 0 (inv@14@01 r)) (< (inv@14@01 r) (Seq_length ar@5@01))))
    (= (Seq_index ar@5@01 (inv@14@01 r)) r))
  :pattern ((inv@14@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((k@13@01 Int)) (!
  (=>
    (and (<= 0 k@13@01) (< k@13@01 (Seq_length ar@5@01)))
    (not (= (Seq_index ar@5@01 k@13@01) $Ref.null)))
  :pattern ((Seq_index ar@5@01 k@13@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(assert (= ($Snap.second $t@12@01) $Snap.unit))
; [eval] (forall k: Int :: { ar[k] } 0 <= k && k < |ar| ==> ar[k].Ref__Integer_value == 0)
(declare-const k@16@01 Int)
(push) ; 3
; [eval] 0 <= k && k < |ar| ==> ar[k].Ref__Integer_value == 0
; [eval] 0 <= k && k < |ar|
; [eval] 0 <= k
(push) ; 4
; [then-branch: 7 | !(0 <= k@16@01) | live]
; [else-branch: 7 | 0 <= k@16@01 | live]
(push) ; 5
; [then-branch: 7 | !(0 <= k@16@01)]
(assert (not (<= 0 k@16@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 7 | 0 <= k@16@01]
(assert (<= 0 k@16@01))
; [eval] k < |ar|
; [eval] |ar|
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@16@01) (not (<= 0 k@16@01))))
(push) ; 4
; [then-branch: 8 | 0 <= k@16@01 && k@16@01 < |ar@5@01| | live]
; [else-branch: 8 | !(0 <= k@16@01 && k@16@01 < |ar@5@01|) | live]
(push) ; 5
; [then-branch: 8 | 0 <= k@16@01 && k@16@01 < |ar@5@01|]
(assert (and (<= 0 k@16@01) (< k@16@01 (Seq_length ar@5@01))))
; [eval] ar[k].Ref__Integer_value == 0
; [eval] ar[k]
(push) ; 6
(assert (not (>= k@16@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (and
  (img@15@01 (Seq_index ar@5@01 k@16@01))
  (and
    (<= 0 (inv@14@01 (Seq_index ar@5@01 k@16@01)))
    (< (inv@14@01 (Seq_index ar@5@01 k@16@01)) (Seq_length ar@5@01))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 8 | !(0 <= k@16@01 && k@16@01 < |ar@5@01|)]
(assert (not (and (<= 0 k@16@01) (< k@16@01 (Seq_length ar@5@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (<= 0 k@16@01) (< k@16@01 (Seq_length ar@5@01))))
  (and (<= 0 k@16@01) (< k@16@01 (Seq_length ar@5@01)))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@16@01 Int)) (!
  (and
    (or (<= 0 k@16@01) (not (<= 0 k@16@01)))
    (or
      (not (and (<= 0 k@16@01) (< k@16@01 (Seq_length ar@5@01))))
      (and (<= 0 k@16@01) (< k@16@01 (Seq_length ar@5@01)))))
  :pattern ((Seq_index ar@5@01 k@16@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testZeroArraySilicon.vpr@12@12@12@87-aux|)))
(assert (forall ((k@16@01 Int)) (!
  (=>
    (and (<= 0 k@16@01) (< k@16@01 (Seq_length ar@5@01)))
    (=
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first $t@12@01)) (Seq_index
        ar@5@01
        k@16@01))
      0))
  :pattern ((Seq_index ar@5@01 k@16@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testZeroArraySilicon.vpr@12@12@12@87|)))
(pop) ; 2
(push) ; 2
; [exec]
; var i: Int
(declare-const i@17@01 Int)
; [exec]
; var N: Int
(declare-const N@18@01 Int)
; [exec]
; var __flatten_1: Ref
(declare-const __flatten_1@19@01 $Ref)
; [exec]
; var __flatten_2: Int
(declare-const __flatten_2@20@01 Int)
; [exec]
; i := 0
; [exec]
; N := |ar|
; [eval] |ar|
(declare-const N@21@01 Int)
(assert (= N@21@01 (Seq_length ar@5@01)))
(declare-const __flatten_1@22@01 $Ref)
(declare-const __flatten_2@23@01 Int)
(declare-const i@24@01 Int)
(push) ; 3
; Loop head block: Check well-definedness of invariant
(declare-const $t@25@01 $Snap)
(assert (= $t@25@01 ($Snap.combine ($Snap.first $t@25@01) ($Snap.second $t@25@01))))
(assert (= ($Snap.first $t@25@01) $Snap.unit))
; [eval] 0 <= i
(assert (<= 0 i@24@01))
(assert (=
  ($Snap.second $t@25@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@25@01))
    ($Snap.second ($Snap.second $t@25@01)))))
(assert (= ($Snap.first ($Snap.second $t@25@01)) $Snap.unit))
; [eval] i <= N
(assert (<= i@24@01 N@21@01))
(assert (=
  ($Snap.second ($Snap.second $t@25@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@25@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@25@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@25@01))) $Snap.unit))
; [eval] N == |ar|
; [eval] |ar|
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@25@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@25@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@25@01)))))))
(declare-const k@26@01 Int)
(push) ; 4
; [eval] 0 <= k && k < |ar|
; [eval] 0 <= k
(push) ; 5
; [then-branch: 9 | !(0 <= k@26@01) | live]
; [else-branch: 9 | 0 <= k@26@01 | live]
(push) ; 6
; [then-branch: 9 | !(0 <= k@26@01)]
(assert (not (<= 0 k@26@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 9 | 0 <= k@26@01]
(assert (<= 0 k@26@01))
; [eval] k < |ar|
; [eval] |ar|
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@26@01) (not (<= 0 k@26@01))))
(assert (and (<= 0 k@26@01) (< k@26@01 (Seq_length ar@5@01))))
; [eval] ar[k]
(push) ; 5
(assert (not (>= k@26@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@27@01 ($Ref) Int)
(declare-fun img@28@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((k@26@01 Int)) (!
  (=>
    (and (<= 0 k@26@01) (< k@26@01 (Seq_length ar@5@01)))
    (or (<= 0 k@26@01) (not (<= 0 k@26@01))))
  :pattern ((Seq_index ar@5@01 k@26@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((k1@26@01 Int) (k2@26@01 Int)) (!
  (=>
    (and
      (and (<= 0 k1@26@01) (< k1@26@01 (Seq_length ar@5@01)))
      (and (<= 0 k2@26@01) (< k2@26@01 (Seq_length ar@5@01)))
      (= (Seq_index ar@5@01 k1@26@01) (Seq_index ar@5@01 k2@26@01)))
    (= k1@26@01 k2@26@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@26@01 Int)) (!
  (=>
    (and (<= 0 k@26@01) (< k@26@01 (Seq_length ar@5@01)))
    (and
      (= (inv@27@01 (Seq_index ar@5@01 k@26@01)) k@26@01)
      (img@28@01 (Seq_index ar@5@01 k@26@01))))
  :pattern ((Seq_index ar@5@01 k@26@01))
  :qid |quant-u-5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@28@01 r)
      (and (<= 0 (inv@27@01 r)) (< (inv@27@01 r) (Seq_length ar@5@01))))
    (= (Seq_index ar@5@01 (inv@27@01 r)) r))
  :pattern ((inv@27@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((k@26@01 Int)) (!
  (=>
    (and (<= 0 k@26@01) (< k@26@01 (Seq_length ar@5@01)))
    (not (= (Seq_index ar@5@01 k@26@01) $Ref.null)))
  :pattern ((Seq_index ar@5@01 k@26@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@25@01))))
  $Snap.unit))
; [eval] (forall k: Int :: { ar[k] } 0 <= k && k < i ==> ar[k].Ref__Integer_value == 0)
(declare-const k@29@01 Int)
(push) ; 4
; [eval] 0 <= k && k < i ==> ar[k].Ref__Integer_value == 0
; [eval] 0 <= k && k < i
; [eval] 0 <= k
(push) ; 5
; [then-branch: 10 | !(0 <= k@29@01) | live]
; [else-branch: 10 | 0 <= k@29@01 | live]
(push) ; 6
; [then-branch: 10 | !(0 <= k@29@01)]
(assert (not (<= 0 k@29@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 10 | 0 <= k@29@01]
(assert (<= 0 k@29@01))
; [eval] k < i
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@29@01) (not (<= 0 k@29@01))))
(push) ; 5
; [then-branch: 11 | 0 <= k@29@01 && k@29@01 < i@24@01 | live]
; [else-branch: 11 | !(0 <= k@29@01 && k@29@01 < i@24@01) | live]
(push) ; 6
; [then-branch: 11 | 0 <= k@29@01 && k@29@01 < i@24@01]
(assert (and (<= 0 k@29@01) (< k@29@01 i@24@01)))
; [eval] ar[k].Ref__Integer_value == 0
; [eval] ar[k]
(push) ; 7
(assert (not (>= k@29@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< k@29@01 (Seq_length ar@5@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (and
  (img@28@01 (Seq_index ar@5@01 k@29@01))
  (and
    (<= 0 (inv@27@01 (Seq_index ar@5@01 k@29@01)))
    (< (inv@27@01 (Seq_index ar@5@01 k@29@01)) (Seq_length ar@5@01))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 11 | !(0 <= k@29@01 && k@29@01 < i@24@01)]
(assert (not (and (<= 0 k@29@01) (< k@29@01 i@24@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (<= 0 k@29@01) (< k@29@01 i@24@01)))
  (and (<= 0 k@29@01) (< k@29@01 i@24@01))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@29@01 Int)) (!
  (and
    (or (<= 0 k@29@01) (not (<= 0 k@29@01)))
    (or
      (not (and (<= 0 k@29@01) (< k@29@01 i@24@01)))
      (and (<= 0 k@29@01) (< k@29@01 i@24@01))))
  :pattern ((Seq_index ar@5@01 k@29@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testZeroArraySilicon.vpr@23@16@23@88-aux|)))
(assert (forall ((k@29@01 Int)) (!
  (=>
    (and (<= 0 k@29@01) (< k@29@01 i@24@01))
    (=
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@25@01))))) (Seq_index
        ar@5@01
        k@29@01))
      0))
  :pattern ((Seq_index ar@5@01 k@29@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testZeroArraySilicon.vpr@23@16@23@88|)))
(pop) ; 3
(push) ; 3
; Loop head block: Establish invariant
; [eval] 0 <= i
; [eval] i <= N
(push) ; 4
(assert (not (<= 0 N@21@01)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 N@21@01))
; [eval] N == |ar|
; [eval] |ar|
(declare-const k@30@01 Int)
(push) ; 4
; [eval] 0 <= k && k < |ar|
; [eval] 0 <= k
(push) ; 5
; [then-branch: 12 | !(0 <= k@30@01) | live]
; [else-branch: 12 | 0 <= k@30@01 | live]
(push) ; 6
; [then-branch: 12 | !(0 <= k@30@01)]
(assert (not (<= 0 k@30@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 12 | 0 <= k@30@01]
(assert (<= 0 k@30@01))
; [eval] k < |ar|
; [eval] |ar|
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@30@01) (not (<= 0 k@30@01))))
(assert (and (<= 0 k@30@01) (< k@30@01 (Seq_length ar@5@01))))
; [eval] ar[k]
(push) ; 5
(assert (not (>= k@30@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@31@01 ($Ref) Int)
(declare-fun img@32@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((k@30@01 Int)) (!
  (=>
    (and (<= 0 k@30@01) (< k@30@01 (Seq_length ar@5@01)))
    (or (<= 0 k@30@01) (not (<= 0 k@30@01))))
  :pattern ((Seq_index ar@5@01 k@30@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((k1@30@01 Int) (k2@30@01 Int)) (!
  (=>
    (and
      (and (<= 0 k1@30@01) (< k1@30@01 (Seq_length ar@5@01)))
      (and (<= 0 k2@30@01) (< k2@30@01 (Seq_length ar@5@01)))
      (= (Seq_index ar@5@01 k1@30@01) (Seq_index ar@5@01 k2@30@01)))
    (= k1@30@01 k2@30@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@30@01 Int)) (!
  (=>
    (and (<= 0 k@30@01) (< k@30@01 (Seq_length ar@5@01)))
    (and
      (= (inv@31@01 (Seq_index ar@5@01 k@30@01)) k@30@01)
      (img@32@01 (Seq_index ar@5@01 k@30@01))))
  :pattern ((Seq_index ar@5@01 k@30@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@32@01 r)
      (and (<= 0 (inv@31@01 r)) (< (inv@31@01 r) (Seq_length ar@5@01))))
    (= (Seq_index ar@5@01 (inv@31@01 r)) r))
  :pattern ((inv@31@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@33@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@31@01 r)) (< (inv@31@01 r) (Seq_length ar@5@01)))
      (img@32@01 r)
      (= r (Seq_index ar@5@01 (inv@31@01 r))))
    ($Perm.min
      (ite
        (and
          (img@11@01 r)
          (and (<= 0 (inv@10@01 r)) (< (inv@10@01 r) (Seq_length ar@5@01))))
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
          (and (<= 0 (inv@10@01 r)) (< (inv@10@01 r) (Seq_length ar@5@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@33@01 r))
    $Perm.No)
  
  :qid |quant-u-8|))))
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
      (and (<= 0 (inv@31@01 r)) (< (inv@31@01 r) (Seq_length ar@5@01)))
      (img@32@01 r)
      (= r (Seq_index ar@5@01 (inv@31@01 r))))
    (= (- $Perm.Write (pTaken@33@01 r)) $Perm.No))
  
  :qid |quant-u-9|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@34@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@11@01 r)
      (and (<= 0 (inv@10@01 r)) (< (inv@10@01 r) (Seq_length ar@5@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@34@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second $t@6@01)))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@34@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second $t@6@01)))) r))
  :qid |qp.fvfValDef0|)))
; [eval] (forall k: Int :: { ar[k] } 0 <= k && k < i ==> ar[k].Ref__Integer_value == 0)
(declare-const k@35@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] 0 <= k && k < i ==> ar[k].Ref__Integer_value == 0
; [eval] 0 <= k && k < i
; [eval] 0 <= k
(push) ; 5
; [then-branch: 13 | !(0 <= k@35@01) | live]
; [else-branch: 13 | 0 <= k@35@01 | live]
(push) ; 6
; [then-branch: 13 | !(0 <= k@35@01)]
(assert (not (<= 0 k@35@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 13 | 0 <= k@35@01]
(assert (<= 0 k@35@01))
; [eval] k < i
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@35@01) (not (<= 0 k@35@01))))
(push) ; 5
; [then-branch: 14 | 0 <= k@35@01 && k@35@01 < 0 | live]
; [else-branch: 14 | !(0 <= k@35@01 && k@35@01 < 0) | live]
(push) ; 6
; [then-branch: 14 | 0 <= k@35@01 && k@35@01 < 0]
(assert (and (<= 0 k@35@01) (< k@35@01 0)))
; [eval] ar[k].Ref__Integer_value == 0
; [eval] ar[k]
(push) ; 7
(assert (not (>= k@35@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< k@35@01 (Seq_length ar@5@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (and
  (img@11@01 (Seq_index ar@5@01 k@35@01))
  (and
    (<= 0 (inv@10@01 (Seq_index ar@5@01 k@35@01)))
    (< (inv@10@01 (Seq_index ar@5@01 k@35@01)) (Seq_length ar@5@01))))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 14 | !(0 <= k@35@01 && k@35@01 < 0)]
(assert (not (and (<= 0 k@35@01) (< k@35@01 0))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (not (and (<= 0 k@35@01) (< k@35@01 0))) (and (<= 0 k@35@01) (< k@35@01 0))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@35@01 Int)) (!
  (and
    (or (<= 0 k@35@01) (not (<= 0 k@35@01)))
    (or
      (not (and (<= 0 k@35@01) (< k@35@01 0)))
      (and (<= 0 k@35@01) (< k@35@01 0))))
  :pattern ((Seq_index ar@5@01 k@35@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testZeroArraySilicon.vpr@23@16@23@88-aux|)))
(push) ; 4
(assert (not (forall ((k@35@01 Int)) (!
  (=>
    (and (<= 0 k@35@01) (< k@35@01 0))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@34@01  $FVF<Ref__Integer_value>) (Seq_index
        ar@5@01
        k@35@01))
      0))
  :pattern ((Seq_index ar@5@01 k@35@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testZeroArraySilicon.vpr@23@16@23@88|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((k@35@01 Int)) (!
  (=>
    (and (<= 0 k@35@01) (< k@35@01 0))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@34@01  $FVF<Ref__Integer_value>) (Seq_index
        ar@5@01
        k@35@01))
      0))
  :pattern ((Seq_index ar@5@01 k@35@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testZeroArraySilicon.vpr@23@16@23@88|)))
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 4
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@28@01 r)
      (and (<= 0 (inv@27@01 r)) (< (inv@27@01 r) (Seq_length ar@5@01))))
    (= (Seq_index ar@5@01 (inv@27@01 r)) r))
  :pattern ((inv@27@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(assert (forall ((k@26@01 Int)) (!
  (=>
    (and (<= 0 k@26@01) (< k@26@01 (Seq_length ar@5@01)))
    (and
      (= (inv@27@01 (Seq_index ar@5@01 k@26@01)) k@26@01)
      (img@28@01 (Seq_index ar@5@01 k@26@01))))
  :pattern ((Seq_index ar@5@01 k@26@01))
  :qid |quant-u-5|)))
(assert (forall ((k@26@01 Int)) (!
  (=>
    (and (<= 0 k@26@01) (< k@26@01 (Seq_length ar@5@01)))
    (not (= (Seq_index ar@5@01 k@26@01) $Ref.null)))
  :pattern ((Seq_index ar@5@01 k@26@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@25@01))))
  $Snap.unit))
(assert (forall ((k@29@01 Int)) (!
  (and
    (or (<= 0 k@29@01) (not (<= 0 k@29@01)))
    (or
      (not (and (<= 0 k@29@01) (< k@29@01 i@24@01)))
      (and (<= 0 k@29@01) (< k@29@01 i@24@01))))
  :pattern ((Seq_index ar@5@01 k@29@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testZeroArraySilicon.vpr@23@16@23@88-aux|)))
(assert (forall ((k@29@01 Int)) (!
  (=>
    (and (<= 0 k@29@01) (< k@29@01 i@24@01))
    (=
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@25@01))))) (Seq_index
        ar@5@01
        k@29@01))
      0))
  :pattern ((Seq_index ar@5@01 k@29@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testZeroArraySilicon.vpr@23@16@23@88|)))
(assert (= $t@25@01 ($Snap.combine ($Snap.first $t@25@01) ($Snap.second $t@25@01))))
(assert (= ($Snap.first $t@25@01) $Snap.unit))
(assert (<= 0 i@24@01))
(assert (=
  ($Snap.second $t@25@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@25@01))
    ($Snap.second ($Snap.second $t@25@01)))))
(assert (= ($Snap.first ($Snap.second $t@25@01)) $Snap.unit))
(assert (<= i@24@01 N@21@01))
(assert (=
  ($Snap.second ($Snap.second $t@25@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@25@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@25@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@25@01))) $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@25@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@25@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@25@01)))))))
(assert (forall ((k@26@01 Int)) (!
  (=>
    (and (<= 0 k@26@01) (< k@26@01 (Seq_length ar@5@01)))
    (or (<= 0 k@26@01) (not (<= 0 k@26@01))))
  :pattern ((Seq_index ar@5@01 k@26@01))
  :qid |Ref__Integer_value-aux|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 10)
(check-sat)
; unknown
; Loop head block: Check well-definedness of edge conditions
(set-option :timeout 0)
(push) ; 5
; [eval] i < N
(pop) ; 5
(push) ; 5
; [eval] !(i < N)
; [eval] i < N
(pop) ; 5
; Loop head block: Follow loop-internal edges
; [eval] i < N
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< i@24@01 N@21@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< i@24@01 N@21@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 15 | i@24@01 < N@21@01 | live]
; [else-branch: 15 | !(i@24@01 < N@21@01) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 15 | i@24@01 < N@21@01]
(assert (< i@24@01 N@21@01))
; [exec]
; __flatten_1 := ar[i]
; [eval] ar[i]
(push) ; 6
(assert (not (>= i@24@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@24@01 (Seq_length ar@5@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_1@36@01 $Ref)
(assert (= __flatten_1@36@01 (Seq_index ar@5@01 i@24@01)))
; [exec]
; __flatten_2 := 0
; [exec]
; __flatten_1.Ref__Integer_value := __flatten_2
; Precomputing data for removing quantified permissions
(define-fun pTaken@37@01 ((r $Ref)) $Perm
  (ite
    (= r __flatten_1@36@01)
    ($Perm.min
      (ite
        (and
          (img@28@01 r)
          (and (<= 0 (inv@27@01 r)) (< (inv@27@01 r) (Seq_length ar@5@01))))
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
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@28@01 r)
          (and (<= 0 (inv@27@01 r)) (< (inv@27@01 r) (Seq_length ar@5@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@37@01 r))
    $Perm.No)
  
  :qid |quant-u-11|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@37@01 r) $Perm.No)
  
  :qid |quant-u-12|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=> (= r __flatten_1@36@01) (= (- $Perm.Write (pTaken@37@01 r)) $Perm.No))
  
  :qid |quant-u-13|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@38@01 $FVF<Ref__Integer_value>)
; Definitional axioms for singleton-FVF's value
(assert (=
  ($FVF.lookup_Ref__Integer_value (as sm@38@01  $FVF<Ref__Integer_value>) __flatten_1@36@01)
  0))
; [exec]
; i := i + 1
; [eval] i + 1
(declare-const i@39@01 Int)
(assert (= i@39@01 (+ i@24@01 1)))
; Loop head block: Re-establish invariant
; [eval] 0 <= i
(set-option :timeout 0)
(push) ; 6
(assert (not (<= 0 i@39@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 i@39@01))
; [eval] i <= N
(push) ; 6
(assert (not (<= i@39@01 N@21@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (<= i@39@01 N@21@01))
; [eval] N == |ar|
; [eval] |ar|
(declare-const k@40@01 Int)
(push) ; 6
; [eval] 0 <= k && k < |ar|
; [eval] 0 <= k
(push) ; 7
; [then-branch: 16 | !(0 <= k@40@01) | live]
; [else-branch: 16 | 0 <= k@40@01 | live]
(push) ; 8
; [then-branch: 16 | !(0 <= k@40@01)]
(assert (not (<= 0 k@40@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 16 | 0 <= k@40@01]
(assert (<= 0 k@40@01))
; [eval] k < |ar|
; [eval] |ar|
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@40@01) (not (<= 0 k@40@01))))
(assert (and (<= 0 k@40@01) (< k@40@01 (Seq_length ar@5@01))))
; [eval] ar[k]
(push) ; 7
(assert (not (>= k@40@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(declare-fun inv@41@01 ($Ref) Int)
(declare-fun img@42@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((k@40@01 Int)) (!
  (=>
    (and (<= 0 k@40@01) (< k@40@01 (Seq_length ar@5@01)))
    (or (<= 0 k@40@01) (not (<= 0 k@40@01))))
  :pattern ((Seq_index ar@5@01 k@40@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 6
(assert (not (forall ((k1@40@01 Int) (k2@40@01 Int)) (!
  (=>
    (and
      (and (<= 0 k1@40@01) (< k1@40@01 (Seq_length ar@5@01)))
      (and (<= 0 k2@40@01) (< k2@40@01 (Seq_length ar@5@01)))
      (= (Seq_index ar@5@01 k1@40@01) (Seq_index ar@5@01 k2@40@01)))
    (= k1@40@01 k2@40@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@40@01 Int)) (!
  (=>
    (and (<= 0 k@40@01) (< k@40@01 (Seq_length ar@5@01)))
    (and
      (= (inv@41@01 (Seq_index ar@5@01 k@40@01)) k@40@01)
      (img@42@01 (Seq_index ar@5@01 k@40@01))))
  :pattern ((Seq_index ar@5@01 k@40@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@42@01 r)
      (and (<= 0 (inv@41@01 r)) (< (inv@41@01 r) (Seq_length ar@5@01))))
    (= (Seq_index ar@5@01 (inv@41@01 r)) r))
  :pattern ((inv@41@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@43@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@41@01 r)) (< (inv@41@01 r) (Seq_length ar@5@01)))
      (img@42@01 r)
      (= r (Seq_index ar@5@01 (inv@41@01 r))))
    ($Perm.min
      (ite
        (and
          (img@28@01 r)
          (and (<= 0 (inv@27@01 r)) (< (inv@27@01 r) (Seq_length ar@5@01))))
        (- $Perm.Write (pTaken@37@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@44@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@41@01 r)) (< (inv@41@01 r) (Seq_length ar@5@01)))
      (img@42@01 r)
      (= r (Seq_index ar@5@01 (inv@41@01 r))))
    ($Perm.min
      (ite (= r __flatten_1@36@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@43@01 r)))
    $Perm.No))
; Done precomputing, updating quantified chunks
; State saturation: before repetition
(set-option :timeout 10)
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
          (img@28@01 r)
          (and (<= 0 (inv@27@01 r)) (< (inv@27@01 r) (Seq_length ar@5@01))))
        (- $Perm.Write (pTaken@37@01 r))
        $Perm.No)
      (pTaken@43@01 r))
    $Perm.No)
  
  :qid |quant-u-16|))))
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
      (and (<= 0 (inv@41@01 r)) (< (inv@41@01 r) (Seq_length ar@5@01)))
      (img@42@01 r)
      (= r (Seq_index ar@5@01 (inv@41@01 r))))
    (= (- $Perm.Write (pTaken@43@01 r)) $Perm.No))
  
  :qid |quant-u-17|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@44@01 __flatten_1@36@01)) $Perm.No)))
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
      (and (<= 0 (inv@41@01 r)) (< (inv@41@01 r) (Seq_length ar@5@01)))
      (img@42@01 r)
      (= r (Seq_index ar@5@01 (inv@41@01 r))))
    (= (- (- $Perm.Write (pTaken@43@01 r)) (pTaken@44@01 r)) $Perm.No))
  
  :qid |quant-u-19|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@45@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r __flatten_1@36@01)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@45@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value (as sm@38@01  $FVF<Ref__Integer_value>) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@45@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@38@01  $FVF<Ref__Integer_value>) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@28@01 r)
        (and (<= 0 (inv@27@01 r)) (< (inv@27@01 r) (Seq_length ar@5@01))))
      (< $Perm.No (- $Perm.Write (pTaken@37@01 r)))
      false)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@45@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@25@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@45@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@25@01))))) r))
  :qid |qp.fvfValDef2|)))
; [eval] (forall k: Int :: { ar[k] } 0 <= k && k < i ==> ar[k].Ref__Integer_value == 0)
(declare-const k@46@01 Int)
(set-option :timeout 0)
(push) ; 6
; [eval] 0 <= k && k < i ==> ar[k].Ref__Integer_value == 0
; [eval] 0 <= k && k < i
; [eval] 0 <= k
(push) ; 7
; [then-branch: 17 | !(0 <= k@46@01) | live]
; [else-branch: 17 | 0 <= k@46@01 | live]
(push) ; 8
; [then-branch: 17 | !(0 <= k@46@01)]
(assert (not (<= 0 k@46@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 17 | 0 <= k@46@01]
(assert (<= 0 k@46@01))
; [eval] k < i
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@46@01) (not (<= 0 k@46@01))))
(push) ; 7
; [then-branch: 18 | 0 <= k@46@01 && k@46@01 < i@39@01 | live]
; [else-branch: 18 | !(0 <= k@46@01 && k@46@01 < i@39@01) | live]
(push) ; 8
; [then-branch: 18 | 0 <= k@46@01 && k@46@01 < i@39@01]
(assert (and (<= 0 k@46@01) (< k@46@01 i@39@01)))
; [eval] ar[k].Ref__Integer_value == 0
; [eval] ar[k]
(push) ; 9
(assert (not (>= k@46@01 0)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(push) ; 9
(assert (not (< k@46@01 (Seq_length ar@5@01))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r __flatten_1@36@01)
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@45@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value (as sm@38@01  $FVF<Ref__Integer_value>) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@45@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@38@01  $FVF<Ref__Integer_value>) r))
    :qid |qp.fvfValDef1|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and
          (img@28@01 r)
          (and (<= 0 (inv@27@01 r)) (< (inv@27@01 r) (Seq_length ar@5@01))))
        (< $Perm.No (- $Perm.Write (pTaken@37@01 r)))
        false)
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@45@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@25@01))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@45@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@25@01))))) r))
    :qid |qp.fvfValDef2|))))
(push) ; 9
(assert (not (<
  $Perm.No
  (+
    (ite (= (Seq_index ar@5@01 k@46@01) __flatten_1@36@01) $Perm.Write $Perm.No)
    (ite
      (and
        (img@28@01 (Seq_index ar@5@01 k@46@01))
        (and
          (<= 0 (inv@27@01 (Seq_index ar@5@01 k@46@01)))
          (< (inv@27@01 (Seq_index ar@5@01 k@46@01)) (Seq_length ar@5@01))))
      (- $Perm.Write (pTaken@37@01 (Seq_index ar@5@01 k@46@01)))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(pop) ; 8
(push) ; 8
; [else-branch: 18 | !(0 <= k@46@01 && k@46@01 < i@39@01)]
(assert (not (and (<= 0 k@46@01) (< k@46@01 i@39@01))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r __flatten_1@36@01)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@45@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value (as sm@38@01  $FVF<Ref__Integer_value>) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@45@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@38@01  $FVF<Ref__Integer_value>) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@28@01 r)
        (and (<= 0 (inv@27@01 r)) (< (inv@27@01 r) (Seq_length ar@5@01))))
      (< $Perm.No (- $Perm.Write (pTaken@37@01 r)))
      false)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@45@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@25@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@45@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@25@01))))) r))
  :qid |qp.fvfValDef2|)))
; Joined path conditions
(assert (or
  (not (and (<= 0 k@46@01) (< k@46@01 i@39@01)))
  (and (<= 0 k@46@01) (< k@46@01 i@39@01))))
(pop) ; 6
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (= r __flatten_1@36@01)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@45@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value (as sm@38@01  $FVF<Ref__Integer_value>) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@45@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@38@01  $FVF<Ref__Integer_value>) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@28@01 r)
        (and (<= 0 (inv@27@01 r)) (< (inv@27@01 r) (Seq_length ar@5@01))))
      (< $Perm.No (- $Perm.Write (pTaken@37@01 r)))
      false)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@45@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@25@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@45@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@25@01))))) r))
  :qid |qp.fvfValDef2|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@46@01 Int)) (!
  (and
    (or (<= 0 k@46@01) (not (<= 0 k@46@01)))
    (or
      (not (and (<= 0 k@46@01) (< k@46@01 i@39@01)))
      (and (<= 0 k@46@01) (< k@46@01 i@39@01))))
  :pattern ((Seq_index ar@5@01 k@46@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testZeroArraySilicon.vpr@23@16@23@88-aux|)))
(push) ; 6
(assert (not (forall ((k@46@01 Int)) (!
  (=>
    (and (<= 0 k@46@01) (< k@46@01 i@39@01))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@45@01  $FVF<Ref__Integer_value>) (Seq_index
        ar@5@01
        k@46@01))
      0))
  :pattern ((Seq_index ar@5@01 k@46@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testZeroArraySilicon.vpr@23@16@23@88|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (forall ((k@46@01 Int)) (!
  (=>
    (and (<= 0 k@46@01) (< k@46@01 i@39@01))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@45@01  $FVF<Ref__Integer_value>) (Seq_index
        ar@5@01
        k@46@01))
      0))
  :pattern ((Seq_index ar@5@01 k@46@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testZeroArraySilicon.vpr@23@16@23@88|)))
(pop) ; 5
(push) ; 5
; [else-branch: 15 | !(i@24@01 < N@21@01)]
(assert (not (< i@24@01 N@21@01)))
(pop) ; 5
; [eval] !(i < N)
; [eval] i < N
(push) ; 5
(set-option :timeout 10)
(assert (not (< i@24@01 N@21@01)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< i@24@01 N@21@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 19 | !(i@24@01 < N@21@01) | live]
; [else-branch: 19 | i@24@01 < N@21@01 | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 19 | !(i@24@01 < N@21@01)]
(assert (not (< i@24@01 N@21@01)))
(declare-const k@47@01 Int)
(push) ; 6
; [eval] 0 <= k && k < |ar|
; [eval] 0 <= k
(push) ; 7
; [then-branch: 20 | !(0 <= k@47@01) | live]
; [else-branch: 20 | 0 <= k@47@01 | live]
(push) ; 8
; [then-branch: 20 | !(0 <= k@47@01)]
(assert (not (<= 0 k@47@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 20 | 0 <= k@47@01]
(assert (<= 0 k@47@01))
; [eval] k < |ar|
; [eval] |ar|
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@47@01) (not (<= 0 k@47@01))))
(assert (and (<= 0 k@47@01) (< k@47@01 (Seq_length ar@5@01))))
; [eval] ar[k]
(push) ; 7
(assert (not (>= k@47@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(declare-fun inv@48@01 ($Ref) Int)
(declare-fun img@49@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((k@47@01 Int)) (!
  (=>
    (and (<= 0 k@47@01) (< k@47@01 (Seq_length ar@5@01)))
    (or (<= 0 k@47@01) (not (<= 0 k@47@01))))
  :pattern ((Seq_index ar@5@01 k@47@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 6
(assert (not (forall ((k1@47@01 Int) (k2@47@01 Int)) (!
  (=>
    (and
      (and (<= 0 k1@47@01) (< k1@47@01 (Seq_length ar@5@01)))
      (and (<= 0 k2@47@01) (< k2@47@01 (Seq_length ar@5@01)))
      (= (Seq_index ar@5@01 k1@47@01) (Seq_index ar@5@01 k2@47@01)))
    (= k1@47@01 k2@47@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((k@47@01 Int)) (!
  (=>
    (and (<= 0 k@47@01) (< k@47@01 (Seq_length ar@5@01)))
    (and
      (= (inv@48@01 (Seq_index ar@5@01 k@47@01)) k@47@01)
      (img@49@01 (Seq_index ar@5@01 k@47@01))))
  :pattern ((Seq_index ar@5@01 k@47@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@49@01 r)
      (and (<= 0 (inv@48@01 r)) (< (inv@48@01 r) (Seq_length ar@5@01))))
    (= (Seq_index ar@5@01 (inv@48@01 r)) r))
  :pattern ((inv@48@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@50@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@48@01 r)) (< (inv@48@01 r) (Seq_length ar@5@01)))
      (img@49@01 r)
      (= r (Seq_index ar@5@01 (inv@48@01 r))))
    ($Perm.min
      (ite
        (and
          (img@28@01 r)
          (and (<= 0 (inv@27@01 r)) (< (inv@27@01 r) (Seq_length ar@5@01))))
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
(push) ; 6
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@28@01 r)
          (and (<= 0 (inv@27@01 r)) (< (inv@27@01 r) (Seq_length ar@5@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@50@01 r))
    $Perm.No)
  
  :qid |quant-u-22|))))
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
      (and (<= 0 (inv@48@01 r)) (< (inv@48@01 r) (Seq_length ar@5@01)))
      (img@49@01 r)
      (= r (Seq_index ar@5@01 (inv@48@01 r))))
    (= (- $Perm.Write (pTaken@50@01 r)) $Perm.No))
  
  :qid |quant-u-23|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@51@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@28@01 r)
      (and (<= 0 (inv@27@01 r)) (< (inv@27@01 r) (Seq_length ar@5@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@51@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@25@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@51@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@25@01))))) r))
  :qid |qp.fvfValDef3|)))
; [eval] (forall k: Int :: { ar[k] } 0 <= k && k < |ar| ==> ar[k].Ref__Integer_value == 0)
(declare-const k@52@01 Int)
(set-option :timeout 0)
(push) ; 6
; [eval] 0 <= k && k < |ar| ==> ar[k].Ref__Integer_value == 0
; [eval] 0 <= k && k < |ar|
; [eval] 0 <= k
(push) ; 7
; [then-branch: 21 | !(0 <= k@52@01) | live]
; [else-branch: 21 | 0 <= k@52@01 | live]
(push) ; 8
; [then-branch: 21 | !(0 <= k@52@01)]
(assert (not (<= 0 k@52@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 21 | 0 <= k@52@01]
(assert (<= 0 k@52@01))
; [eval] k < |ar|
; [eval] |ar|
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 k@52@01) (not (<= 0 k@52@01))))
(push) ; 7
; [then-branch: 22 | 0 <= k@52@01 && k@52@01 < |ar@5@01| | live]
; [else-branch: 22 | !(0 <= k@52@01 && k@52@01 < |ar@5@01|) | live]
(push) ; 8
; [then-branch: 22 | 0 <= k@52@01 && k@52@01 < |ar@5@01|]
(assert (and (<= 0 k@52@01) (< k@52@01 (Seq_length ar@5@01))))
; [eval] ar[k].Ref__Integer_value == 0
; [eval] ar[k]
(push) ; 9
(assert (not (>= k@52@01 0)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(push) ; 9
(assert (not (and
  (img@28@01 (Seq_index ar@5@01 k@52@01))
  (and
    (<= 0 (inv@27@01 (Seq_index ar@5@01 k@52@01)))
    (< (inv@27@01 (Seq_index ar@5@01 k@52@01)) (Seq_length ar@5@01))))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(pop) ; 8
(push) ; 8
; [else-branch: 22 | !(0 <= k@52@01 && k@52@01 < |ar@5@01|)]
(assert (not (and (<= 0 k@52@01) (< k@52@01 (Seq_length ar@5@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or
  (not (and (<= 0 k@52@01) (< k@52@01 (Seq_length ar@5@01))))
  (and (<= 0 k@52@01) (< k@52@01 (Seq_length ar@5@01)))))
(pop) ; 6
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@52@01 Int)) (!
  (and
    (or (<= 0 k@52@01) (not (<= 0 k@52@01)))
    (or
      (not (and (<= 0 k@52@01) (< k@52@01 (Seq_length ar@5@01))))
      (and (<= 0 k@52@01) (< k@52@01 (Seq_length ar@5@01)))))
  :pattern ((Seq_index ar@5@01 k@52@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testZeroArraySilicon.vpr@12@12@12@87-aux|)))
(push) ; 6
(assert (not (forall ((k@52@01 Int)) (!
  (=>
    (and (<= 0 k@52@01) (< k@52@01 (Seq_length ar@5@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@51@01  $FVF<Ref__Integer_value>) (Seq_index
        ar@5@01
        k@52@01))
      0))
  :pattern ((Seq_index ar@5@01 k@52@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testZeroArraySilicon.vpr@12@12@12@87|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (forall ((k@52@01 Int)) (!
  (=>
    (and (<= 0 k@52@01) (< k@52@01 (Seq_length ar@5@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@51@01  $FVF<Ref__Integer_value>) (Seq_index
        ar@5@01
        k@52@01))
      0))
  :pattern ((Seq_index ar@5@01 k@52@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/testZeroArraySilicon.vpr@12@12@12@87|)))
(pop) ; 5
(push) ; 5
; [else-branch: 19 | i@24@01 < N@21@01]
(assert (< i@24@01 N@21@01))
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- ZeroArray__ZeroArray ----------
(declare-const current_thread_id@53@01 Int)
(declare-const sys__result@54@01 $Ref)
(declare-const current_thread_id@55@01 Int)
(declare-const sys__result@56@01 $Ref)
(push) ; 1
(declare-const $t@57@01 $Snap)
(assert (= $t@57@01 $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@55@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@58@01 $Snap)
(assert (= $t@58@01 $Snap.unit))
; [eval] sys__result != null
(assert (not (= sys__result@56@01 $Ref.null)))
(pop) ; 2
(push) ; 2
; [exec]
; var diz: Ref
(declare-const diz@59@01 $Ref)
; [exec]
; diz := new()
(declare-const diz@60@01 $Ref)
(assert (not (= diz@60@01 $Ref.null)))
(assert (not (= diz@60@01 sys__result@56@01)))
(assert (not (= diz@60@01 diz@59@01)))
; [exec]
; sys__result := diz
; [exec]
; assert sys__result != null
; [eval] sys__result != null
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
