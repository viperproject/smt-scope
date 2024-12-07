(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:21:15
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr
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
; ---------- Exercise4__zip ----------
(declare-const diz@0@01 $Ref)
(declare-const a@1@01 Seq<$Ref>)
(declare-const b@2@01 Seq<$Ref>)
(declare-const res@3@01 Seq<$Ref>)
(declare-const diz@4@01 $Ref)
(declare-const a@5@01 Seq<$Ref>)
(declare-const b@6@01 Seq<$Ref>)
(declare-const res@7@01 Seq<$Ref>)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@8@01 $Snap)
(assert (= $t@8@01 ($Snap.combine ($Snap.first $t@8@01) ($Snap.second $t@8@01))))
(assert (= ($Snap.first $t@8@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@4@01 $Ref.null)))
(assert (=
  ($Snap.second $t@8@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@8@01))
    ($Snap.second ($Snap.second $t@8@01)))))
(assert (= ($Snap.first ($Snap.second $t@8@01)) $Snap.unit))
; [eval] |a| == |b|
; [eval] |a|
; [eval] |b|
(assert (= (Seq_length a@5@01) (Seq_length b@6@01)))
(assert (=
  ($Snap.second ($Snap.second $t@8@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@8@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@8@01))) $Snap.unit))
; [eval] |res| == 2 * |a|
; [eval] |res|
; [eval] 2 * |a|
; [eval] |a|
(assert (= (Seq_length res@7@01) (* 2 (Seq_length a@5@01))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@8@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@8@01)))) $Snap.unit))
; [eval] (forall i: Int, j: Int :: { a[i], a[j] } 0 <= i && (i < |a| && (0 <= j && (j < |a| && i != j))) ==> a[i] != a[j])
(declare-const i@9@01 Int)
(declare-const j@10@01 Int)
(push) ; 2
; [eval] 0 <= i && (i < |a| && (0 <= j && (j < |a| && i != j))) ==> a[i] != a[j]
; [eval] 0 <= i && (i < |a| && (0 <= j && (j < |a| && i != j)))
; [eval] 0 <= i
(push) ; 3
; [then-branch: 0 | !(0 <= i@9@01) | live]
; [else-branch: 0 | 0 <= i@9@01 | live]
(push) ; 4
; [then-branch: 0 | !(0 <= i@9@01)]
(assert (not (<= 0 i@9@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | 0 <= i@9@01]
(assert (<= 0 i@9@01))
; [eval] i < |a|
; [eval] |a|
(push) ; 5
; [then-branch: 1 | !(i@9@01 < |a@5@01|) | live]
; [else-branch: 1 | i@9@01 < |a@5@01| | live]
(push) ; 6
; [then-branch: 1 | !(i@9@01 < |a@5@01|)]
(assert (not (< i@9@01 (Seq_length a@5@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 1 | i@9@01 < |a@5@01|]
(assert (< i@9@01 (Seq_length a@5@01)))
; [eval] 0 <= j
(push) ; 7
; [then-branch: 2 | !(0 <= j@10@01) | live]
; [else-branch: 2 | 0 <= j@10@01 | live]
(push) ; 8
; [then-branch: 2 | !(0 <= j@10@01)]
(assert (not (<= 0 j@10@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 2 | 0 <= j@10@01]
(assert (<= 0 j@10@01))
; [eval] j < |a|
; [eval] |a|
(push) ; 9
; [then-branch: 3 | !(j@10@01 < |a@5@01|) | live]
; [else-branch: 3 | j@10@01 < |a@5@01| | live]
(push) ; 10
; [then-branch: 3 | !(j@10@01 < |a@5@01|)]
(assert (not (< j@10@01 (Seq_length a@5@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 3 | j@10@01 < |a@5@01|]
(assert (< j@10@01 (Seq_length a@5@01)))
; [eval] i != j
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< j@10@01 (Seq_length a@5@01)) (not (< j@10@01 (Seq_length a@5@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j@10@01)
  (and
    (<= 0 j@10@01)
    (or (< j@10@01 (Seq_length a@5@01)) (not (< j@10@01 (Seq_length a@5@01)))))))
(assert (or (<= 0 j@10@01) (not (<= 0 j@10@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i@9@01 (Seq_length a@5@01))
  (and
    (< i@9@01 (Seq_length a@5@01))
    (=>
      (<= 0 j@10@01)
      (and
        (<= 0 j@10@01)
        (or
          (< j@10@01 (Seq_length a@5@01))
          (not (< j@10@01 (Seq_length a@5@01))))))
    (or (<= 0 j@10@01) (not (<= 0 j@10@01))))))
(assert (or (< i@9@01 (Seq_length a@5@01)) (not (< i@9@01 (Seq_length a@5@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i@9@01)
  (and
    (<= 0 i@9@01)
    (=>
      (< i@9@01 (Seq_length a@5@01))
      (and
        (< i@9@01 (Seq_length a@5@01))
        (=>
          (<= 0 j@10@01)
          (and
            (<= 0 j@10@01)
            (or
              (< j@10@01 (Seq_length a@5@01))
              (not (< j@10@01 (Seq_length a@5@01))))))
        (or (<= 0 j@10@01) (not (<= 0 j@10@01)))))
    (or (< i@9@01 (Seq_length a@5@01)) (not (< i@9@01 (Seq_length a@5@01)))))))
(assert (or (<= 0 i@9@01) (not (<= 0 i@9@01))))
(push) ; 3
; [then-branch: 4 | 0 <= i@9@01 && i@9@01 < |a@5@01| && 0 <= j@10@01 && j@10@01 < |a@5@01| && i@9@01 != j@10@01 | live]
; [else-branch: 4 | !(0 <= i@9@01 && i@9@01 < |a@5@01| && 0 <= j@10@01 && j@10@01 < |a@5@01| && i@9@01 != j@10@01) | live]
(push) ; 4
; [then-branch: 4 | 0 <= i@9@01 && i@9@01 < |a@5@01| && 0 <= j@10@01 && j@10@01 < |a@5@01| && i@9@01 != j@10@01]
(assert (and
  (<= 0 i@9@01)
  (and
    (< i@9@01 (Seq_length a@5@01))
    (and
      (<= 0 j@10@01)
      (and (< j@10@01 (Seq_length a@5@01)) (not (= i@9@01 j@10@01)))))))
; [eval] a[i] != a[j]
; [eval] a[i]
(push) ; 5
(assert (not (>= i@9@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] a[j]
(push) ; 5
(assert (not (>= j@10@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 4 | !(0 <= i@9@01 && i@9@01 < |a@5@01| && 0 <= j@10@01 && j@10@01 < |a@5@01| && i@9@01 != j@10@01)]
(assert (not
  (and
    (<= 0 i@9@01)
    (and
      (< i@9@01 (Seq_length a@5@01))
      (and
        (<= 0 j@10@01)
        (and (< j@10@01 (Seq_length a@5@01)) (not (= i@9@01 j@10@01))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (<= 0 i@9@01)
    (and
      (< i@9@01 (Seq_length a@5@01))
      (and
        (<= 0 j@10@01)
        (and (< j@10@01 (Seq_length a@5@01)) (not (= i@9@01 j@10@01))))))
  (and
    (<= 0 i@9@01)
    (< i@9@01 (Seq_length a@5@01))
    (<= 0 j@10@01)
    (< j@10@01 (Seq_length a@5@01))
    (not (= i@9@01 j@10@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i@9@01)
      (and
        (< i@9@01 (Seq_length a@5@01))
        (and
          (<= 0 j@10@01)
          (and (< j@10@01 (Seq_length a@5@01)) (not (= i@9@01 j@10@01)))))))
  (and
    (<= 0 i@9@01)
    (and
      (< i@9@01 (Seq_length a@5@01))
      (and
        (<= 0 j@10@01)
        (and (< j@10@01 (Seq_length a@5@01)) (not (= i@9@01 j@10@01))))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@9@01 Int) (j@10@01 Int)) (!
  (and
    (=>
      (<= 0 i@9@01)
      (and
        (<= 0 i@9@01)
        (=>
          (< i@9@01 (Seq_length a@5@01))
          (and
            (< i@9@01 (Seq_length a@5@01))
            (=>
              (<= 0 j@10@01)
              (and
                (<= 0 j@10@01)
                (or
                  (< j@10@01 (Seq_length a@5@01))
                  (not (< j@10@01 (Seq_length a@5@01))))))
            (or (<= 0 j@10@01) (not (<= 0 j@10@01)))))
        (or (< i@9@01 (Seq_length a@5@01)) (not (< i@9@01 (Seq_length a@5@01))))))
    (or (<= 0 i@9@01) (not (<= 0 i@9@01)))
    (=>
      (and
        (<= 0 i@9@01)
        (and
          (< i@9@01 (Seq_length a@5@01))
          (and
            (<= 0 j@10@01)
            (and (< j@10@01 (Seq_length a@5@01)) (not (= i@9@01 j@10@01))))))
      (and
        (<= 0 i@9@01)
        (< i@9@01 (Seq_length a@5@01))
        (<= 0 j@10@01)
        (< j@10@01 (Seq_length a@5@01))
        (not (= i@9@01 j@10@01))))
    (or
      (not
        (and
          (<= 0 i@9@01)
          (and
            (< i@9@01 (Seq_length a@5@01))
            (and
              (<= 0 j@10@01)
              (and (< j@10@01 (Seq_length a@5@01)) (not (= i@9@01 j@10@01)))))))
      (and
        (<= 0 i@9@01)
        (and
          (< i@9@01 (Seq_length a@5@01))
          (and
            (<= 0 j@10@01)
            (and (< j@10@01 (Seq_length a@5@01)) (not (= i@9@01 j@10@01))))))))
  :pattern ((Seq_index a@5@01 i@9@01) (Seq_index a@5@01 j@10@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@15@12@15@102-aux|)))
(assert (forall ((i@9@01 Int) (j@10@01 Int)) (!
  (=>
    (and
      (<= 0 i@9@01)
      (and
        (< i@9@01 (Seq_length a@5@01))
        (and
          (<= 0 j@10@01)
          (and (< j@10@01 (Seq_length a@5@01)) (not (= i@9@01 j@10@01))))))
    (not (= (Seq_index a@5@01 i@9@01) (Seq_index a@5@01 j@10@01))))
  :pattern ((Seq_index a@5@01 i@9@01) (Seq_index a@5@01 j@10@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@15@12@15@102|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))
(declare-const i@11@01 Int)
(push) ; 2
; [eval] (i in [0..|a|))
; [eval] [0..|a|)
; [eval] |a|
(assert (Seq_contains (Seq_range 0 (Seq_length a@5@01)) i@11@01))
; [eval] a[i]
(push) ; 3
(assert (not (>= i@11@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@11@01 (Seq_length a@5@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@12@01 ($Ref) Int)
(declare-fun img@13@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@11@01 Int) (i2@11@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length a@5@01)) i1@11@01)
      (Seq_contains (Seq_range 0 (Seq_length a@5@01)) i2@11@01)
      (= (Seq_index a@5@01 i1@11@01) (Seq_index a@5@01 i2@11@01)))
    (= i1@11@01 i2@11@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@11@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length a@5@01)) i@11@01)
    (and
      (= (inv@12@01 (Seq_index a@5@01 i@11@01)) i@11@01)
      (img@13@01 (Seq_index a@5@01 i@11@01))))
  :pattern ((Seq_index a@5@01 i@11@01))
  :qid |quant-u-1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@13@01 r)
      (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@12@01 r)))
    (= (Seq_index a@5@01 (inv@12@01 r)) r))
  :pattern ((inv@12@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@11@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length a@5@01)) i@11@01)
    (not (= (Seq_index a@5@01 i@11@01) $Ref.null)))
  :pattern ((Seq_index a@5@01 i@11@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))
  $Snap.unit))
; [eval] (forall i: Int, j: Int :: { b[i], b[j] } 0 <= i && (i < |b| && (0 <= j && (j < |b| && i != j))) ==> b[i] != b[j])
(declare-const i@14@01 Int)
(declare-const j@15@01 Int)
(push) ; 2
; [eval] 0 <= i && (i < |b| && (0 <= j && (j < |b| && i != j))) ==> b[i] != b[j]
; [eval] 0 <= i && (i < |b| && (0 <= j && (j < |b| && i != j)))
; [eval] 0 <= i
(push) ; 3
; [then-branch: 5 | !(0 <= i@14@01) | live]
; [else-branch: 5 | 0 <= i@14@01 | live]
(push) ; 4
; [then-branch: 5 | !(0 <= i@14@01)]
(assert (not (<= 0 i@14@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 5 | 0 <= i@14@01]
(assert (<= 0 i@14@01))
; [eval] i < |b|
; [eval] |b|
(push) ; 5
; [then-branch: 6 | !(i@14@01 < |b@6@01|) | live]
; [else-branch: 6 | i@14@01 < |b@6@01| | live]
(push) ; 6
; [then-branch: 6 | !(i@14@01 < |b@6@01|)]
(assert (not (< i@14@01 (Seq_length b@6@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 6 | i@14@01 < |b@6@01|]
(assert (< i@14@01 (Seq_length b@6@01)))
; [eval] 0 <= j
(push) ; 7
; [then-branch: 7 | !(0 <= j@15@01) | live]
; [else-branch: 7 | 0 <= j@15@01 | live]
(push) ; 8
; [then-branch: 7 | !(0 <= j@15@01)]
(assert (not (<= 0 j@15@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 7 | 0 <= j@15@01]
(assert (<= 0 j@15@01))
; [eval] j < |b|
; [eval] |b|
(push) ; 9
; [then-branch: 8 | !(j@15@01 < |b@6@01|) | live]
; [else-branch: 8 | j@15@01 < |b@6@01| | live]
(push) ; 10
; [then-branch: 8 | !(j@15@01 < |b@6@01|)]
(assert (not (< j@15@01 (Seq_length b@6@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 8 | j@15@01 < |b@6@01|]
(assert (< j@15@01 (Seq_length b@6@01)))
; [eval] i != j
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< j@15@01 (Seq_length b@6@01)) (not (< j@15@01 (Seq_length b@6@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j@15@01)
  (and
    (<= 0 j@15@01)
    (or (< j@15@01 (Seq_length b@6@01)) (not (< j@15@01 (Seq_length b@6@01)))))))
(assert (or (<= 0 j@15@01) (not (<= 0 j@15@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i@14@01 (Seq_length b@6@01))
  (and
    (< i@14@01 (Seq_length b@6@01))
    (=>
      (<= 0 j@15@01)
      (and
        (<= 0 j@15@01)
        (or
          (< j@15@01 (Seq_length b@6@01))
          (not (< j@15@01 (Seq_length b@6@01))))))
    (or (<= 0 j@15@01) (not (<= 0 j@15@01))))))
(assert (or (< i@14@01 (Seq_length b@6@01)) (not (< i@14@01 (Seq_length b@6@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i@14@01)
  (and
    (<= 0 i@14@01)
    (=>
      (< i@14@01 (Seq_length b@6@01))
      (and
        (< i@14@01 (Seq_length b@6@01))
        (=>
          (<= 0 j@15@01)
          (and
            (<= 0 j@15@01)
            (or
              (< j@15@01 (Seq_length b@6@01))
              (not (< j@15@01 (Seq_length b@6@01))))))
        (or (<= 0 j@15@01) (not (<= 0 j@15@01)))))
    (or (< i@14@01 (Seq_length b@6@01)) (not (< i@14@01 (Seq_length b@6@01)))))))
(assert (or (<= 0 i@14@01) (not (<= 0 i@14@01))))
(push) ; 3
; [then-branch: 9 | 0 <= i@14@01 && i@14@01 < |b@6@01| && 0 <= j@15@01 && j@15@01 < |b@6@01| && i@14@01 != j@15@01 | live]
; [else-branch: 9 | !(0 <= i@14@01 && i@14@01 < |b@6@01| && 0 <= j@15@01 && j@15@01 < |b@6@01| && i@14@01 != j@15@01) | live]
(push) ; 4
; [then-branch: 9 | 0 <= i@14@01 && i@14@01 < |b@6@01| && 0 <= j@15@01 && j@15@01 < |b@6@01| && i@14@01 != j@15@01]
(assert (and
  (<= 0 i@14@01)
  (and
    (< i@14@01 (Seq_length b@6@01))
    (and
      (<= 0 j@15@01)
      (and (< j@15@01 (Seq_length b@6@01)) (not (= i@14@01 j@15@01)))))))
; [eval] b[i] != b[j]
; [eval] b[i]
(push) ; 5
(assert (not (>= i@14@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] b[j]
(push) ; 5
(assert (not (>= j@15@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 9 | !(0 <= i@14@01 && i@14@01 < |b@6@01| && 0 <= j@15@01 && j@15@01 < |b@6@01| && i@14@01 != j@15@01)]
(assert (not
  (and
    (<= 0 i@14@01)
    (and
      (< i@14@01 (Seq_length b@6@01))
      (and
        (<= 0 j@15@01)
        (and (< j@15@01 (Seq_length b@6@01)) (not (= i@14@01 j@15@01))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (<= 0 i@14@01)
    (and
      (< i@14@01 (Seq_length b@6@01))
      (and
        (<= 0 j@15@01)
        (and (< j@15@01 (Seq_length b@6@01)) (not (= i@14@01 j@15@01))))))
  (and
    (<= 0 i@14@01)
    (< i@14@01 (Seq_length b@6@01))
    (<= 0 j@15@01)
    (< j@15@01 (Seq_length b@6@01))
    (not (= i@14@01 j@15@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i@14@01)
      (and
        (< i@14@01 (Seq_length b@6@01))
        (and
          (<= 0 j@15@01)
          (and (< j@15@01 (Seq_length b@6@01)) (not (= i@14@01 j@15@01)))))))
  (and
    (<= 0 i@14@01)
    (and
      (< i@14@01 (Seq_length b@6@01))
      (and
        (<= 0 j@15@01)
        (and (< j@15@01 (Seq_length b@6@01)) (not (= i@14@01 j@15@01))))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@14@01 Int) (j@15@01 Int)) (!
  (and
    (=>
      (<= 0 i@14@01)
      (and
        (<= 0 i@14@01)
        (=>
          (< i@14@01 (Seq_length b@6@01))
          (and
            (< i@14@01 (Seq_length b@6@01))
            (=>
              (<= 0 j@15@01)
              (and
                (<= 0 j@15@01)
                (or
                  (< j@15@01 (Seq_length b@6@01))
                  (not (< j@15@01 (Seq_length b@6@01))))))
            (or (<= 0 j@15@01) (not (<= 0 j@15@01)))))
        (or
          (< i@14@01 (Seq_length b@6@01))
          (not (< i@14@01 (Seq_length b@6@01))))))
    (or (<= 0 i@14@01) (not (<= 0 i@14@01)))
    (=>
      (and
        (<= 0 i@14@01)
        (and
          (< i@14@01 (Seq_length b@6@01))
          (and
            (<= 0 j@15@01)
            (and (< j@15@01 (Seq_length b@6@01)) (not (= i@14@01 j@15@01))))))
      (and
        (<= 0 i@14@01)
        (< i@14@01 (Seq_length b@6@01))
        (<= 0 j@15@01)
        (< j@15@01 (Seq_length b@6@01))
        (not (= i@14@01 j@15@01))))
    (or
      (not
        (and
          (<= 0 i@14@01)
          (and
            (< i@14@01 (Seq_length b@6@01))
            (and
              (<= 0 j@15@01)
              (and (< j@15@01 (Seq_length b@6@01)) (not (= i@14@01 j@15@01)))))))
      (and
        (<= 0 i@14@01)
        (and
          (< i@14@01 (Seq_length b@6@01))
          (and
            (<= 0 j@15@01)
            (and (< j@15@01 (Seq_length b@6@01)) (not (= i@14@01 j@15@01))))))))
  :pattern ((Seq_index b@6@01 i@14@01) (Seq_index b@6@01 j@15@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@17@12@17@102-aux|)))
(assert (forall ((i@14@01 Int) (j@15@01 Int)) (!
  (=>
    (and
      (<= 0 i@14@01)
      (and
        (< i@14@01 (Seq_length b@6@01))
        (and
          (<= 0 j@15@01)
          (and (< j@15@01 (Seq_length b@6@01)) (not (= i@14@01 j@15@01))))))
    (not (= (Seq_index b@6@01 i@14@01) (Seq_index b@6@01 j@15@01))))
  :pattern ((Seq_index b@6@01 i@14@01) (Seq_index b@6@01 j@15@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@17@12@17@102|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))))
(declare-const i@16@01 Int)
(push) ; 2
; [eval] (i in [0..|b|))
; [eval] [0..|b|)
; [eval] |b|
(assert (Seq_contains (Seq_range 0 (Seq_length b@6@01)) i@16@01))
; [eval] b[i]
(push) ; 3
(assert (not (>= i@16@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@16@01 (Seq_length b@6@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@17@01 ($Ref) Int)
(declare-fun img@18@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@16@01 Int) (i2@16@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length b@6@01)) i1@16@01)
      (Seq_contains (Seq_range 0 (Seq_length b@6@01)) i2@16@01)
      (= (Seq_index b@6@01 i1@16@01) (Seq_index b@6@01 i2@16@01)))
    (= i1@16@01 i2@16@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@16@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length b@6@01)) i@16@01)
    (and
      (= (inv@17@01 (Seq_index b@6@01 i@16@01)) i@16@01)
      (img@18@01 (Seq_index b@6@01 i@16@01))))
  :pattern ((Seq_index b@6@01 i@16@01))
  :qid |quant-u-3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@18@01 r)
      (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@17@01 r)))
    (= (Seq_index b@6@01 (inv@17@01 r)) r))
  :pattern ((inv@17@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@16@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length b@6@01)) i@16@01)
    (not (= (Seq_index b@6@01 i@16@01) $Ref.null)))
  :pattern ((Seq_index b@6@01 i@16@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 2
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index b@6@01 i@16@01) (Seq_index a@5@01 i@11@01))
    (=
      (and
        (img@18@01 r)
        (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@17@01 r)))
      (and
        (img@13@01 r)
        (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@12@01 r)))))
  
  :qid |quant-u-4|))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))
  $Snap.unit))
; [eval] (forall i: Int, j: Int :: { res[i], res[j] } 0 <= i && (i < |res| && (0 <= j && (j < |res| && i != j))) ==> res[i] != res[j])
(declare-const i@19@01 Int)
(declare-const j@20@01 Int)
(set-option :timeout 0)
(push) ; 2
; [eval] 0 <= i && (i < |res| && (0 <= j && (j < |res| && i != j))) ==> res[i] != res[j]
; [eval] 0 <= i && (i < |res| && (0 <= j && (j < |res| && i != j)))
; [eval] 0 <= i
(push) ; 3
; [then-branch: 10 | !(0 <= i@19@01) | live]
; [else-branch: 10 | 0 <= i@19@01 | live]
(push) ; 4
; [then-branch: 10 | !(0 <= i@19@01)]
(assert (not (<= 0 i@19@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 10 | 0 <= i@19@01]
(assert (<= 0 i@19@01))
; [eval] i < |res|
; [eval] |res|
(push) ; 5
; [then-branch: 11 | !(i@19@01 < |res@7@01|) | live]
; [else-branch: 11 | i@19@01 < |res@7@01| | live]
(push) ; 6
; [then-branch: 11 | !(i@19@01 < |res@7@01|)]
(assert (not (< i@19@01 (Seq_length res@7@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 11 | i@19@01 < |res@7@01|]
(assert (< i@19@01 (Seq_length res@7@01)))
; [eval] 0 <= j
(push) ; 7
; [then-branch: 12 | !(0 <= j@20@01) | live]
; [else-branch: 12 | 0 <= j@20@01 | live]
(push) ; 8
; [then-branch: 12 | !(0 <= j@20@01)]
(assert (not (<= 0 j@20@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 12 | 0 <= j@20@01]
(assert (<= 0 j@20@01))
; [eval] j < |res|
; [eval] |res|
(push) ; 9
; [then-branch: 13 | !(j@20@01 < |res@7@01|) | live]
; [else-branch: 13 | j@20@01 < |res@7@01| | live]
(push) ; 10
; [then-branch: 13 | !(j@20@01 < |res@7@01|)]
(assert (not (< j@20@01 (Seq_length res@7@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 13 | j@20@01 < |res@7@01|]
(assert (< j@20@01 (Seq_length res@7@01)))
; [eval] i != j
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< j@20@01 (Seq_length res@7@01)) (not (< j@20@01 (Seq_length res@7@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j@20@01)
  (and
    (<= 0 j@20@01)
    (or
      (< j@20@01 (Seq_length res@7@01))
      (not (< j@20@01 (Seq_length res@7@01)))))))
(assert (or (<= 0 j@20@01) (not (<= 0 j@20@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< i@19@01 (Seq_length res@7@01))
  (and
    (< i@19@01 (Seq_length res@7@01))
    (=>
      (<= 0 j@20@01)
      (and
        (<= 0 j@20@01)
        (or
          (< j@20@01 (Seq_length res@7@01))
          (not (< j@20@01 (Seq_length res@7@01))))))
    (or (<= 0 j@20@01) (not (<= 0 j@20@01))))))
(assert (or (< i@19@01 (Seq_length res@7@01)) (not (< i@19@01 (Seq_length res@7@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i@19@01)
  (and
    (<= 0 i@19@01)
    (=>
      (< i@19@01 (Seq_length res@7@01))
      (and
        (< i@19@01 (Seq_length res@7@01))
        (=>
          (<= 0 j@20@01)
          (and
            (<= 0 j@20@01)
            (or
              (< j@20@01 (Seq_length res@7@01))
              (not (< j@20@01 (Seq_length res@7@01))))))
        (or (<= 0 j@20@01) (not (<= 0 j@20@01)))))
    (or
      (< i@19@01 (Seq_length res@7@01))
      (not (< i@19@01 (Seq_length res@7@01)))))))
(assert (or (<= 0 i@19@01) (not (<= 0 i@19@01))))
(push) ; 3
; [then-branch: 14 | 0 <= i@19@01 && i@19@01 < |res@7@01| && 0 <= j@20@01 && j@20@01 < |res@7@01| && i@19@01 != j@20@01 | live]
; [else-branch: 14 | !(0 <= i@19@01 && i@19@01 < |res@7@01| && 0 <= j@20@01 && j@20@01 < |res@7@01| && i@19@01 != j@20@01) | live]
(push) ; 4
; [then-branch: 14 | 0 <= i@19@01 && i@19@01 < |res@7@01| && 0 <= j@20@01 && j@20@01 < |res@7@01| && i@19@01 != j@20@01]
(assert (and
  (<= 0 i@19@01)
  (and
    (< i@19@01 (Seq_length res@7@01))
    (and
      (<= 0 j@20@01)
      (and (< j@20@01 (Seq_length res@7@01)) (not (= i@19@01 j@20@01)))))))
; [eval] res[i] != res[j]
; [eval] res[i]
(push) ; 5
(assert (not (>= i@19@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] res[j]
(push) ; 5
(assert (not (>= j@20@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 14 | !(0 <= i@19@01 && i@19@01 < |res@7@01| && 0 <= j@20@01 && j@20@01 < |res@7@01| && i@19@01 != j@20@01)]
(assert (not
  (and
    (<= 0 i@19@01)
    (and
      (< i@19@01 (Seq_length res@7@01))
      (and
        (<= 0 j@20@01)
        (and (< j@20@01 (Seq_length res@7@01)) (not (= i@19@01 j@20@01))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (<= 0 i@19@01)
    (and
      (< i@19@01 (Seq_length res@7@01))
      (and
        (<= 0 j@20@01)
        (and (< j@20@01 (Seq_length res@7@01)) (not (= i@19@01 j@20@01))))))
  (and
    (<= 0 i@19@01)
    (< i@19@01 (Seq_length res@7@01))
    (<= 0 j@20@01)
    (< j@20@01 (Seq_length res@7@01))
    (not (= i@19@01 j@20@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i@19@01)
      (and
        (< i@19@01 (Seq_length res@7@01))
        (and
          (<= 0 j@20@01)
          (and (< j@20@01 (Seq_length res@7@01)) (not (= i@19@01 j@20@01)))))))
  (and
    (<= 0 i@19@01)
    (and
      (< i@19@01 (Seq_length res@7@01))
      (and
        (<= 0 j@20@01)
        (and (< j@20@01 (Seq_length res@7@01)) (not (= i@19@01 j@20@01))))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@19@01 Int) (j@20@01 Int)) (!
  (and
    (=>
      (<= 0 i@19@01)
      (and
        (<= 0 i@19@01)
        (=>
          (< i@19@01 (Seq_length res@7@01))
          (and
            (< i@19@01 (Seq_length res@7@01))
            (=>
              (<= 0 j@20@01)
              (and
                (<= 0 j@20@01)
                (or
                  (< j@20@01 (Seq_length res@7@01))
                  (not (< j@20@01 (Seq_length res@7@01))))))
            (or (<= 0 j@20@01) (not (<= 0 j@20@01)))))
        (or
          (< i@19@01 (Seq_length res@7@01))
          (not (< i@19@01 (Seq_length res@7@01))))))
    (or (<= 0 i@19@01) (not (<= 0 i@19@01)))
    (=>
      (and
        (<= 0 i@19@01)
        (and
          (< i@19@01 (Seq_length res@7@01))
          (and
            (<= 0 j@20@01)
            (and (< j@20@01 (Seq_length res@7@01)) (not (= i@19@01 j@20@01))))))
      (and
        (<= 0 i@19@01)
        (< i@19@01 (Seq_length res@7@01))
        (<= 0 j@20@01)
        (< j@20@01 (Seq_length res@7@01))
        (not (= i@19@01 j@20@01))))
    (or
      (not
        (and
          (<= 0 i@19@01)
          (and
            (< i@19@01 (Seq_length res@7@01))
            (and
              (<= 0 j@20@01)
              (and (< j@20@01 (Seq_length res@7@01)) (not (= i@19@01 j@20@01)))))))
      (and
        (<= 0 i@19@01)
        (and
          (< i@19@01 (Seq_length res@7@01))
          (and
            (<= 0 j@20@01)
            (and (< j@20@01 (Seq_length res@7@01)) (not (= i@19@01 j@20@01))))))))
  :pattern ((Seq_index res@7@01 i@19@01) (Seq_index res@7@01 j@20@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@19@12@19@110-aux|)))
(assert (forall ((i@19@01 Int) (j@20@01 Int)) (!
  (=>
    (and
      (<= 0 i@19@01)
      (and
        (< i@19@01 (Seq_length res@7@01))
        (and
          (<= 0 j@20@01)
          (and (< j@20@01 (Seq_length res@7@01)) (not (= i@19@01 j@20@01))))))
    (not (= (Seq_index res@7@01 i@19@01) (Seq_index res@7@01 j@20@01))))
  :pattern ((Seq_index res@7@01 i@19@01) (Seq_index res@7@01 j@20@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@19@12@19@110|)))
(declare-const i@21@01 Int)
(push) ; 2
; [eval] (i in [0..|res|))
; [eval] [0..|res|)
; [eval] |res|
(assert (Seq_contains (Seq_range 0 (Seq_length res@7@01)) i@21@01))
; [eval] res[i]
(push) ; 3
(assert (not (>= i@21@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@21@01 (Seq_length res@7@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@22@01 ($Ref) Int)
(declare-fun img@23@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@21@01 Int) (i2@21@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length res@7@01)) i1@21@01)
      (Seq_contains (Seq_range 0 (Seq_length res@7@01)) i2@21@01)
      (= (Seq_index res@7@01 i1@21@01) (Seq_index res@7@01 i2@21@01)))
    (= i1@21@01 i2@21@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@21@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length res@7@01)) i@21@01)
    (and
      (= (inv@22@01 (Seq_index res@7@01 i@21@01)) i@21@01)
      (img@23@01 (Seq_index res@7@01 i@21@01))))
  :pattern ((Seq_index res@7@01 i@21@01))
  :qid |quant-u-6|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@23@01 r)
      (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@22@01 r)))
    (= (Seq_index res@7@01 (inv@22@01 r)) r))
  :pattern ((inv@22@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@21@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length res@7@01)) i@21@01)
    (not (= (Seq_index res@7@01 i@21@01) $Ref.null)))
  :pattern ((Seq_index res@7@01 i@21@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 2
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index res@7@01 i@21@01) (Seq_index b@6@01 i@16@01))
    (=
      (and
        (img@23@01 r)
        (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@22@01 r)))
      (and
        (img@18@01 r)
        (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@17@01 r)))))
  
  :qid |quant-u-7|))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index res@7@01 i@21@01) (Seq_index a@5@01 i@11@01))
    (=
      (and
        (img@23@01 r)
        (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@22@01 r)))
      (and
        (img@13@01 r)
        (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@12@01 r)))))
  
  :qid |quant-u-8|))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@24@01 $Snap)
(assert (= $t@24@01 ($Snap.combine ($Snap.first $t@24@01) ($Snap.second $t@24@01))))
(assert (= ($Snap.first $t@24@01) $Snap.unit))
; [eval] |res| == 2 * |a|
; [eval] |res|
; [eval] 2 * |a|
; [eval] |a|
(assert (=
  ($Snap.second $t@24@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@24@01))
    ($Snap.second ($Snap.second $t@24@01)))))
(assert (= ($Snap.first ($Snap.second $t@24@01)) $Snap.unit))
; [eval] |a| == |b|
; [eval] |a|
; [eval] |b|
(assert (=
  ($Snap.second ($Snap.second $t@24@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@24@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@24@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@24@01))) $Snap.unit))
; [eval] |res| == 2 * |b|
; [eval] |res|
; [eval] 2 * |b|
; [eval] |b|
(assert (= (Seq_length res@7@01) (* 2 (Seq_length b@6@01))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@24@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@24@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01)))))))
(declare-const i@25@01 Int)
(push) ; 3
; [eval] (i in [0..|a|))
; [eval] [0..|a|)
; [eval] |a|
(assert (Seq_contains (Seq_range 0 (Seq_length a@5@01)) i@25@01))
; [eval] a[i]
(push) ; 4
(assert (not (>= i@25@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@25@01 (Seq_length a@5@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@26@01 ($Ref) Int)
(declare-fun img@27@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@25@01 Int) (i2@25@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length a@5@01)) i1@25@01)
      (Seq_contains (Seq_range 0 (Seq_length a@5@01)) i2@25@01)
      (= (Seq_index a@5@01 i1@25@01) (Seq_index a@5@01 i2@25@01)))
    (= i1@25@01 i2@25@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@25@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length a@5@01)) i@25@01)
    (and
      (= (inv@26@01 (Seq_index a@5@01 i@25@01)) i@25@01)
      (img@27@01 (Seq_index a@5@01 i@25@01))))
  :pattern ((Seq_index a@5@01 i@25@01))
  :qid |quant-u-10|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@27@01 r)
      (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@26@01 r)))
    (= (Seq_index a@5@01 (inv@26@01 r)) r))
  :pattern ((inv@26@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@25@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length a@5@01)) i@25@01)
    (not (= (Seq_index a@5@01 i@25@01) $Ref.null)))
  :pattern ((Seq_index a@5@01 i@25@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01))))))))
(declare-const i@28@01 Int)
(push) ; 3
; [eval] (i in [0..|b|))
; [eval] [0..|b|)
; [eval] |b|
(assert (Seq_contains (Seq_range 0 (Seq_length b@6@01)) i@28@01))
; [eval] b[i]
(push) ; 4
(assert (not (>= i@28@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@28@01 (Seq_length b@6@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@29@01 ($Ref) Int)
(declare-fun img@30@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@28@01 Int) (i2@28@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length b@6@01)) i1@28@01)
      (Seq_contains (Seq_range 0 (Seq_length b@6@01)) i2@28@01)
      (= (Seq_index b@6@01 i1@28@01) (Seq_index b@6@01 i2@28@01)))
    (= i1@28@01 i2@28@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@28@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length b@6@01)) i@28@01)
    (and
      (= (inv@29@01 (Seq_index b@6@01 i@28@01)) i@28@01)
      (img@30@01 (Seq_index b@6@01 i@28@01))))
  :pattern ((Seq_index b@6@01 i@28@01))
  :qid |quant-u-12|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@30@01 r)
      (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@29@01 r)))
    (= (Seq_index b@6@01 (inv@29@01 r)) r))
  :pattern ((inv@29@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@28@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length b@6@01)) i@28@01)
    (not (= (Seq_index b@6@01 i@28@01) $Ref.null)))
  :pattern ((Seq_index b@6@01 i@28@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index b@6@01 i@28@01) (Seq_index a@5@01 i@25@01))
    (=
      (and
        (img@30@01 r)
        (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@29@01 r)))
      (and
        (img@27@01 r)
        (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@26@01 r)))))
  
  :qid |quant-u-13|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01)))))))))
(declare-const i@31@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (i in [0..|res|))
; [eval] [0..|res|)
; [eval] |res|
(assert (Seq_contains (Seq_range 0 (Seq_length res@7@01)) i@31@01))
; [eval] res[i]
(push) ; 4
(assert (not (>= i@31@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@31@01 (Seq_length res@7@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@32@01 ($Ref) Int)
(declare-fun img@33@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@31@01 Int) (i2@31@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length res@7@01)) i1@31@01)
      (Seq_contains (Seq_range 0 (Seq_length res@7@01)) i2@31@01)
      (= (Seq_index res@7@01 i1@31@01) (Seq_index res@7@01 i2@31@01)))
    (= i1@31@01 i2@31@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@31@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length res@7@01)) i@31@01)
    (and
      (= (inv@32@01 (Seq_index res@7@01 i@31@01)) i@31@01)
      (img@33@01 (Seq_index res@7@01 i@31@01))))
  :pattern ((Seq_index res@7@01 i@31@01))
  :qid |quant-u-15|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@33@01 r)
      (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@32@01 r)))
    (= (Seq_index res@7@01 (inv@32@01 r)) r))
  :pattern ((inv@32@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@31@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length res@7@01)) i@31@01)
    (not (= (Seq_index res@7@01 i@31@01) $Ref.null)))
  :pattern ((Seq_index res@7@01 i@31@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index res@7@01 i@31@01) (Seq_index b@6@01 i@28@01))
    (=
      (and
        (img@33@01 r)
        (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@32@01 r)))
      (and
        (img@30@01 r)
        (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@29@01 r)))))
  
  :qid |quant-u-16|))))
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
    (= (Seq_index res@7@01 i@31@01) (Seq_index a@5@01 i@25@01))
    (=
      (and
        (img@33@01 r)
        (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@32@01 r)))
      (and
        (img@27@01 r)
        (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@26@01 r)))))
  
  :qid |quant-u-17|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01)))))))
  $Snap.unit))
; [eval] (forall i: Int :: { (i in [0..|a|)) } { a[i] } (i in [0..|a|)) ==> res[2 * i].Ref__Integer_value == a[i].Ref__Integer_value)
(declare-const i@34@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] (i in [0..|a|)) ==> res[2 * i].Ref__Integer_value == a[i].Ref__Integer_value
; [eval] (i in [0..|a|))
; [eval] [0..|a|)
; [eval] |a|
(push) ; 4
; [then-branch: 15 | i@34@01 in [0..|a@5@01|] | live]
; [else-branch: 15 | !(i@34@01 in [0..|a@5@01|]) | live]
(push) ; 5
; [then-branch: 15 | i@34@01 in [0..|a@5@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length a@5@01)) i@34@01))
; [eval] res[2 * i].Ref__Integer_value == a[i].Ref__Integer_value
; [eval] res[2 * i]
; [eval] 2 * i
(push) ; 6
(assert (not (>= (* 2 i@34@01) 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< (* 2 i@34@01) (Seq_length res@7@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(declare-const sm@35@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@27@01 r)
      (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@26@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@24@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@24@01))))) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@30@01 r)
      (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@29@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01)))))) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@33@01 r)
      (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@32@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01))))))) r))
  :qid |qp.fvfValDef2|)))
(declare-const pm@36@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@36@01  $FPM) r)
    (+
      (+
        (ite
          (and
            (img@27@01 r)
            (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@26@01 r)))
          $Perm.Write
          $Perm.No)
        (ite
          (and
            (img@30@01 r)
            (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@29@01 r)))
          $Perm.Write
          $Perm.No))
      (ite
        (and
          (img@33@01 r)
          (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@32@01 r)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@36@01  $FPM) r))
  :qid |qp.resPrmSumDef3|)))
(push) ; 6
(assert (not (<
  $Perm.No
  ($FVF.perm_Ref__Integer_value (as pm@36@01  $FPM) (Seq_index
    res@7@01
    (* 2 i@34@01))))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] a[i]
(push) ; 6
(assert (not (>= i@34@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@34@01 (Seq_length a@5@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@27@01 r)
        (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@26@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@24@01))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@24@01))))) r))
    :qid |qp.fvfValDef0|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@30@01 r)
        (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@29@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01)))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01)))))) r))
    :qid |qp.fvfValDef1|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@33@01 r)
        (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@32@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01))))))) r))
    :qid |qp.fvfValDef2|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and
          (img@27@01 (Seq_index a@5@01 i@34@01))
          (Seq_contains
            (Seq_range 0 (Seq_length a@5@01))
            (inv@26@01 (Seq_index a@5@01 i@34@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@30@01 (Seq_index a@5@01 i@34@01))
          (Seq_contains
            (Seq_range 0 (Seq_length b@6@01))
            (inv@29@01 (Seq_index a@5@01 i@34@01))))
        $Perm.Write
        $Perm.No))
    (ite
      (and
        (img@33@01 (Seq_index a@5@01 i@34@01))
        (Seq_contains
          (Seq_range 0 (Seq_length res@7@01))
          (inv@32@01 (Seq_index a@5@01 i@34@01))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 15 | !(i@34@01 in [0..|a@5@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length a@5@01)) i@34@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@27@01 r)
      (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@26@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@24@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@24@01))))) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@30@01 r)
      (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@29@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01)))))) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@33@01 r)
      (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@32@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01))))))) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@36@01  $FPM) r)
    (+
      (+
        (ite
          (and
            (img@27@01 r)
            (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@26@01 r)))
          $Perm.Write
          $Perm.No)
        (ite
          (and
            (img@30@01 r)
            (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@29@01 r)))
          $Perm.Write
          $Perm.No))
      (ite
        (and
          (img@33@01 r)
          (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@32@01 r)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@36@01  $FPM) r))
  :qid |qp.resPrmSumDef3|)))
; Joined path conditions
(assert (or
  (not (Seq_contains (Seq_range 0 (Seq_length a@5@01)) i@34@01))
  (Seq_contains (Seq_range 0 (Seq_length a@5@01)) i@34@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@27@01 r)
      (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@26@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@24@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@24@01))))) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@30@01 r)
      (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@29@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01)))))) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@33@01 r)
      (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@32@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01))))))) r))
  :qid |qp.fvfValDef2|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@36@01  $FPM) r)
    (+
      (+
        (ite
          (and
            (img@27@01 r)
            (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@26@01 r)))
          $Perm.Write
          $Perm.No)
        (ite
          (and
            (img@30@01 r)
            (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@29@01 r)))
          $Perm.Write
          $Perm.No))
      (ite
        (and
          (img@33@01 r)
          (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@32@01 r)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@36@01  $FPM) r))
  :qid |qp.resPrmSumDef3|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@34@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 (Seq_length a@5@01)) i@34@01))
    (Seq_contains (Seq_range 0 (Seq_length a@5@01)) i@34@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length a@5@01)) i@34@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length a@5@01)) i@34@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@27@12@27@107-aux|)))
(assert (forall ((i@34@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 (Seq_length a@5@01)) i@34@01))
    (Seq_contains (Seq_range 0 (Seq_length a@5@01)) i@34@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length a@5@01)) i@34@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@27@12@27@107-aux|)))
(assert (forall ((i@34@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 (Seq_length a@5@01)) i@34@01))
    (Seq_contains (Seq_range 0 (Seq_length a@5@01)) i@34@01))
  :pattern ((Seq_index a@5@01 i@34@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@27@12@27@107-aux|)))
(assert (forall ((i@34@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length a@5@01)) i@34@01)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) (Seq_index
        res@7@01
        (* 2 i@34@01)))
      ($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) (Seq_index
        a@5@01
        i@34@01))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length a@5@01)) i@34@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length a@5@01)) i@34@01))
  :pattern ((Seq_index a@5@01 i@34@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@27@12@27@107|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01)))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01))))))))
  $Snap.unit))
; [eval] (forall i: Int :: { res[i] } 0 <= i && (i % 2 == 1 && i < |res|) ==> res[i].Ref__Integer_value == b[i / 2].Ref__Integer_value)
(declare-const i@37@01 Int)
(push) ; 3
; [eval] 0 <= i && (i % 2 == 1 && i < |res|) ==> res[i].Ref__Integer_value == b[i / 2].Ref__Integer_value
; [eval] 0 <= i && (i % 2 == 1 && i < |res|)
; [eval] 0 <= i
(push) ; 4
; [then-branch: 16 | !(0 <= i@37@01) | live]
; [else-branch: 16 | 0 <= i@37@01 | live]
(push) ; 5
; [then-branch: 16 | !(0 <= i@37@01)]
(assert (not (<= 0 i@37@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 16 | 0 <= i@37@01]
(assert (<= 0 i@37@01))
; [eval] i % 2 == 1
; [eval] i % 2
(push) ; 6
; [then-branch: 17 | i@37@01 % 2 != 1 | live]
; [else-branch: 17 | i@37@01 % 2 == 1 | live]
(push) ; 7
; [then-branch: 17 | i@37@01 % 2 != 1]
(assert (not (= (mod i@37@01 2) 1)))
(pop) ; 7
(push) ; 7
; [else-branch: 17 | i@37@01 % 2 == 1]
(assert (= (mod i@37@01 2) 1))
; [eval] i < |res|
; [eval] |res|
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (= (mod i@37@01 2) 1) (not (= (mod i@37@01 2) 1))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i@37@01)
  (and (<= 0 i@37@01) (or (= (mod i@37@01 2) 1) (not (= (mod i@37@01 2) 1))))))
(assert (or (<= 0 i@37@01) (not (<= 0 i@37@01))))
(push) ; 4
; [then-branch: 18 | 0 <= i@37@01 && i@37@01 % 2 == 1 && i@37@01 < |res@7@01| | live]
; [else-branch: 18 | !(0 <= i@37@01 && i@37@01 % 2 == 1 && i@37@01 < |res@7@01|) | live]
(push) ; 5
; [then-branch: 18 | 0 <= i@37@01 && i@37@01 % 2 == 1 && i@37@01 < |res@7@01|]
(assert (and
  (<= 0 i@37@01)
  (and (= (mod i@37@01 2) 1) (< i@37@01 (Seq_length res@7@01)))))
; [eval] res[i].Ref__Integer_value == b[i / 2].Ref__Integer_value
; [eval] res[i]
(push) ; 6
(assert (not (>= i@37@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@27@01 r)
        (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@26@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@24@01))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@24@01))))) r))
    :qid |qp.fvfValDef0|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@30@01 r)
        (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@29@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01)))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01)))))) r))
    :qid |qp.fvfValDef1|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@33@01 r)
        (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@32@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01))))))) r))
    :qid |qp.fvfValDef2|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and
          (img@27@01 (Seq_index res@7@01 i@37@01))
          (Seq_contains
            (Seq_range 0 (Seq_length a@5@01))
            (inv@26@01 (Seq_index res@7@01 i@37@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@30@01 (Seq_index res@7@01 i@37@01))
          (Seq_contains
            (Seq_range 0 (Seq_length b@6@01))
            (inv@29@01 (Seq_index res@7@01 i@37@01))))
        $Perm.Write
        $Perm.No))
    (ite
      (and
        (img@33@01 (Seq_index res@7@01 i@37@01))
        (Seq_contains
          (Seq_range 0 (Seq_length res@7@01))
          (inv@32@01 (Seq_index res@7@01 i@37@01))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] b[i / 2]
; [eval] i / 2
(push) ; 6
(assert (not (>= (div i@37@01 2) 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< (div i@37@01 2) (Seq_length b@6@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@27@01 r)
        (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@26@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@24@01))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@24@01))))) r))
    :qid |qp.fvfValDef0|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@30@01 r)
        (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@29@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01)))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01)))))) r))
    :qid |qp.fvfValDef1|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@33@01 r)
        (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@32@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01))))))) r))
    :qid |qp.fvfValDef2|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and
          (img@27@01 (Seq_index b@6@01 (div i@37@01 2)))
          (Seq_contains
            (Seq_range 0 (Seq_length a@5@01))
            (inv@26@01 (Seq_index b@6@01 (div i@37@01 2)))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@30@01 (Seq_index b@6@01 (div i@37@01 2)))
          (Seq_contains
            (Seq_range 0 (Seq_length b@6@01))
            (inv@29@01 (Seq_index b@6@01 (div i@37@01 2)))))
        $Perm.Write
        $Perm.No))
    (ite
      (and
        (img@33@01 (Seq_index b@6@01 (div i@37@01 2)))
        (Seq_contains
          (Seq_range 0 (Seq_length res@7@01))
          (inv@32@01 (Seq_index b@6@01 (div i@37@01 2)))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 18 | !(0 <= i@37@01 && i@37@01 % 2 == 1 && i@37@01 < |res@7@01|)]
(assert (not
  (and
    (<= 0 i@37@01)
    (and (= (mod i@37@01 2) 1) (< i@37@01 (Seq_length res@7@01))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@27@01 r)
      (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@26@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@24@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@24@01))))) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@30@01 r)
      (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@29@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01)))))) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@33@01 r)
      (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@32@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01))))))) r))
  :qid |qp.fvfValDef2|)))
(assert (=>
  (and
    (<= 0 i@37@01)
    (and (= (mod i@37@01 2) 1) (< i@37@01 (Seq_length res@7@01))))
  (and (<= 0 i@37@01) (= (mod i@37@01 2) 1) (< i@37@01 (Seq_length res@7@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i@37@01)
      (and (= (mod i@37@01 2) 1) (< i@37@01 (Seq_length res@7@01)))))
  (and
    (<= 0 i@37@01)
    (and (= (mod i@37@01 2) 1) (< i@37@01 (Seq_length res@7@01))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@27@01 r)
      (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@26@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@24@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@24@01))))) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@30@01 r)
      (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@29@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01)))))) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@33@01 r)
      (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@32@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01))))))) r))
  :qid |qp.fvfValDef2|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@37@01 Int)) (!
  (and
    (=>
      (<= 0 i@37@01)
      (and (<= 0 i@37@01) (or (= (mod i@37@01 2) 1) (not (= (mod i@37@01 2) 1)))))
    (or (<= 0 i@37@01) (not (<= 0 i@37@01)))
    (=>
      (and
        (<= 0 i@37@01)
        (and (= (mod i@37@01 2) 1) (< i@37@01 (Seq_length res@7@01))))
      (and
        (<= 0 i@37@01)
        (= (mod i@37@01 2) 1)
        (< i@37@01 (Seq_length res@7@01))))
    (or
      (not
        (and
          (<= 0 i@37@01)
          (and (= (mod i@37@01 2) 1) (< i@37@01 (Seq_length res@7@01)))))
      (and
        (<= 0 i@37@01)
        (and (= (mod i@37@01 2) 1) (< i@37@01 (Seq_length res@7@01))))))
  :pattern ((Seq_index res@7@01 i@37@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@49@12@49@131-aux|)))
(assert (forall ((i@37@01 Int)) (!
  (=>
    (and
      (<= 0 i@37@01)
      (and (= (mod i@37@01 2) 1) (< i@37@01 (Seq_length res@7@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) (Seq_index
        res@7@01
        i@37@01))
      ($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) (Seq_index
        b@6@01
        (div i@37@01 2)))))
  :pattern ((Seq_index res@7@01 i@37@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@49@12@49@131|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01)))))))))
  $Snap.unit))
; [eval] (forall i: Int :: { (i in [0..|b|)) } { b[i] } (i in [0..|b|)) ==> res[2 * i + 1].Ref__Integer_value == b[i].Ref__Integer_value)
(declare-const i@38@01 Int)
(push) ; 3
; [eval] (i in [0..|b|)) ==> res[2 * i + 1].Ref__Integer_value == b[i].Ref__Integer_value
; [eval] (i in [0..|b|))
; [eval] [0..|b|)
; [eval] |b|
(push) ; 4
; [then-branch: 19 | i@38@01 in [0..|b@6@01|] | live]
; [else-branch: 19 | !(i@38@01 in [0..|b@6@01|]) | live]
(push) ; 5
; [then-branch: 19 | i@38@01 in [0..|b@6@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length b@6@01)) i@38@01))
; [eval] res[2 * i + 1].Ref__Integer_value == b[i].Ref__Integer_value
; [eval] res[2 * i + 1]
; [eval] 2 * i + 1
; [eval] 2 * i
(push) ; 6
(assert (not (>= (+ (* 2 i@38@01) 1) 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< (+ (* 2 i@38@01) 1) (Seq_length res@7@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@27@01 r)
        (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@26@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@24@01))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@24@01))))) r))
    :qid |qp.fvfValDef0|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@30@01 r)
        (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@29@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01)))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01)))))) r))
    :qid |qp.fvfValDef1|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@33@01 r)
        (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@32@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01))))))) r))
    :qid |qp.fvfValDef2|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and
          (img@27@01 (Seq_index res@7@01 (+ (* 2 i@38@01) 1)))
          (Seq_contains
            (Seq_range 0 (Seq_length a@5@01))
            (inv@26@01 (Seq_index res@7@01 (+ (* 2 i@38@01) 1)))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@30@01 (Seq_index res@7@01 (+ (* 2 i@38@01) 1)))
          (Seq_contains
            (Seq_range 0 (Seq_length b@6@01))
            (inv@29@01 (Seq_index res@7@01 (+ (* 2 i@38@01) 1)))))
        $Perm.Write
        $Perm.No))
    (ite
      (and
        (img@33@01 (Seq_index res@7@01 (+ (* 2 i@38@01) 1)))
        (Seq_contains
          (Seq_range 0 (Seq_length res@7@01))
          (inv@32@01 (Seq_index res@7@01 (+ (* 2 i@38@01) 1)))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] b[i]
(push) ; 6
(assert (not (>= i@38@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@38@01 (Seq_length b@6@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@27@01 r)
        (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@26@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@24@01))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@24@01))))) r))
    :qid |qp.fvfValDef0|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@30@01 r)
        (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@29@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01)))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01)))))) r))
    :qid |qp.fvfValDef1|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@33@01 r)
        (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@32@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01))))))) r))
    :qid |qp.fvfValDef2|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and
          (img@27@01 (Seq_index b@6@01 i@38@01))
          (Seq_contains
            (Seq_range 0 (Seq_length a@5@01))
            (inv@26@01 (Seq_index b@6@01 i@38@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@30@01 (Seq_index b@6@01 i@38@01))
          (Seq_contains
            (Seq_range 0 (Seq_length b@6@01))
            (inv@29@01 (Seq_index b@6@01 i@38@01))))
        $Perm.Write
        $Perm.No))
    (ite
      (and
        (img@33@01 (Seq_index b@6@01 i@38@01))
        (Seq_contains
          (Seq_range 0 (Seq_length res@7@01))
          (inv@32@01 (Seq_index b@6@01 i@38@01))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 19 | !(i@38@01 in [0..|b@6@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length b@6@01)) i@38@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@27@01 r)
      (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@26@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@24@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@24@01))))) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@30@01 r)
      (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@29@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01)))))) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@33@01 r)
      (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@32@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01))))))) r))
  :qid |qp.fvfValDef2|)))
; Joined path conditions
(assert (or
  (not (Seq_contains (Seq_range 0 (Seq_length b@6@01)) i@38@01))
  (Seq_contains (Seq_range 0 (Seq_length b@6@01)) i@38@01)))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@27@01 r)
      (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@26@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@24@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@24@01))))) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@30@01 r)
      (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@29@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01)))))) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@33@01 r)
      (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@32@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01))))))) r))
  :qid |qp.fvfValDef2|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@38@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 (Seq_length b@6@01)) i@38@01))
    (Seq_contains (Seq_range 0 (Seq_length b@6@01)) i@38@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length b@6@01)) i@38@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length b@6@01)) i@38@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@50@12@50@111-aux|)))
(assert (forall ((i@38@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 (Seq_length b@6@01)) i@38@01))
    (Seq_contains (Seq_range 0 (Seq_length b@6@01)) i@38@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length b@6@01)) i@38@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@50@12@50@111-aux|)))
(assert (forall ((i@38@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 (Seq_length b@6@01)) i@38@01))
    (Seq_contains (Seq_range 0 (Seq_length b@6@01)) i@38@01))
  :pattern ((Seq_index b@6@01 i@38@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@50@12@50@111-aux|)))
(assert (forall ((i@38@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length b@6@01)) i@38@01)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) (Seq_index
        res@7@01
        (+ (* 2 i@38@01) 1)))
      ($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) (Seq_index
        b@6@01
        i@38@01))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length b@6@01)) i@38@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length b@6@01)) i@38@01))
  :pattern ((Seq_index b@6@01 i@38@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@50@12@50@111|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01)))))))))
  $Snap.unit))
; [eval] (forall i: Int :: { res[i] } 0 <= i && (i % 2 == 0 && i < |res|) ==> res[i].Ref__Integer_value == a[i / 2].Ref__Integer_value)
(declare-const i@39@01 Int)
(push) ; 3
; [eval] 0 <= i && (i % 2 == 0 && i < |res|) ==> res[i].Ref__Integer_value == a[i / 2].Ref__Integer_value
; [eval] 0 <= i && (i % 2 == 0 && i < |res|)
; [eval] 0 <= i
(push) ; 4
; [then-branch: 20 | !(0 <= i@39@01) | live]
; [else-branch: 20 | 0 <= i@39@01 | live]
(push) ; 5
; [then-branch: 20 | !(0 <= i@39@01)]
(assert (not (<= 0 i@39@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 20 | 0 <= i@39@01]
(assert (<= 0 i@39@01))
; [eval] i % 2 == 0
; [eval] i % 2
(push) ; 6
; [then-branch: 21 | i@39@01 % 2 != 0 | live]
; [else-branch: 21 | i@39@01 % 2 == 0 | live]
(push) ; 7
; [then-branch: 21 | i@39@01 % 2 != 0]
(assert (not (= (mod i@39@01 2) 0)))
(pop) ; 7
(push) ; 7
; [else-branch: 21 | i@39@01 % 2 == 0]
(assert (= (mod i@39@01 2) 0))
; [eval] i < |res|
; [eval] |res|
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (or (= (mod i@39@01 2) 0) (not (= (mod i@39@01 2) 0))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i@39@01)
  (and (<= 0 i@39@01) (or (= (mod i@39@01 2) 0) (not (= (mod i@39@01 2) 0))))))
(assert (or (<= 0 i@39@01) (not (<= 0 i@39@01))))
(push) ; 4
; [then-branch: 22 | 0 <= i@39@01 && i@39@01 % 2 == 0 && i@39@01 < |res@7@01| | live]
; [else-branch: 22 | !(0 <= i@39@01 && i@39@01 % 2 == 0 && i@39@01 < |res@7@01|) | live]
(push) ; 5
; [then-branch: 22 | 0 <= i@39@01 && i@39@01 % 2 == 0 && i@39@01 < |res@7@01|]
(assert (and
  (<= 0 i@39@01)
  (and (= (mod i@39@01 2) 0) (< i@39@01 (Seq_length res@7@01)))))
; [eval] res[i].Ref__Integer_value == a[i / 2].Ref__Integer_value
; [eval] res[i]
(push) ; 6
(assert (not (>= i@39@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@27@01 r)
        (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@26@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@24@01))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@24@01))))) r))
    :qid |qp.fvfValDef0|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@30@01 r)
        (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@29@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01)))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01)))))) r))
    :qid |qp.fvfValDef1|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@33@01 r)
        (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@32@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01))))))) r))
    :qid |qp.fvfValDef2|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and
          (img@27@01 (Seq_index res@7@01 i@39@01))
          (Seq_contains
            (Seq_range 0 (Seq_length a@5@01))
            (inv@26@01 (Seq_index res@7@01 i@39@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@30@01 (Seq_index res@7@01 i@39@01))
          (Seq_contains
            (Seq_range 0 (Seq_length b@6@01))
            (inv@29@01 (Seq_index res@7@01 i@39@01))))
        $Perm.Write
        $Perm.No))
    (ite
      (and
        (img@33@01 (Seq_index res@7@01 i@39@01))
        (Seq_contains
          (Seq_range 0 (Seq_length res@7@01))
          (inv@32@01 (Seq_index res@7@01 i@39@01))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] a[i / 2]
; [eval] i / 2
(push) ; 6
(assert (not (>= (div i@39@01 2) 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< (div i@39@01 2) (Seq_length a@5@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@27@01 r)
        (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@26@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@24@01))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@24@01))))) r))
    :qid |qp.fvfValDef0|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@30@01 r)
        (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@29@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01)))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01)))))) r))
    :qid |qp.fvfValDef1|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@33@01 r)
        (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@32@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01))))))) r))
    :qid |qp.fvfValDef2|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and
          (img@27@01 (Seq_index a@5@01 (div i@39@01 2)))
          (Seq_contains
            (Seq_range 0 (Seq_length a@5@01))
            (inv@26@01 (Seq_index a@5@01 (div i@39@01 2)))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@30@01 (Seq_index a@5@01 (div i@39@01 2)))
          (Seq_contains
            (Seq_range 0 (Seq_length b@6@01))
            (inv@29@01 (Seq_index a@5@01 (div i@39@01 2)))))
        $Perm.Write
        $Perm.No))
    (ite
      (and
        (img@33@01 (Seq_index a@5@01 (div i@39@01 2)))
        (Seq_contains
          (Seq_range 0 (Seq_length res@7@01))
          (inv@32@01 (Seq_index a@5@01 (div i@39@01 2)))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 22 | !(0 <= i@39@01 && i@39@01 % 2 == 0 && i@39@01 < |res@7@01|)]
(assert (not
  (and
    (<= 0 i@39@01)
    (and (= (mod i@39@01 2) 0) (< i@39@01 (Seq_length res@7@01))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@27@01 r)
      (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@26@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@24@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@24@01))))) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@30@01 r)
      (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@29@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01)))))) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@33@01 r)
      (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@32@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01))))))) r))
  :qid |qp.fvfValDef2|)))
(assert (=>
  (and
    (<= 0 i@39@01)
    (and (= (mod i@39@01 2) 0) (< i@39@01 (Seq_length res@7@01))))
  (and (<= 0 i@39@01) (= (mod i@39@01 2) 0) (< i@39@01 (Seq_length res@7@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i@39@01)
      (and (= (mod i@39@01 2) 0) (< i@39@01 (Seq_length res@7@01)))))
  (and
    (<= 0 i@39@01)
    (and (= (mod i@39@01 2) 0) (< i@39@01 (Seq_length res@7@01))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@27@01 r)
      (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@26@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@24@01))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@24@01))))) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@30@01 r)
      (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@29@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01)))))) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@33@01 r)
      (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@32@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@24@01))))))) r))
  :qid |qp.fvfValDef2|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@39@01 Int)) (!
  (and
    (=>
      (<= 0 i@39@01)
      (and (<= 0 i@39@01) (or (= (mod i@39@01 2) 0) (not (= (mod i@39@01 2) 0)))))
    (or (<= 0 i@39@01) (not (<= 0 i@39@01)))
    (=>
      (and
        (<= 0 i@39@01)
        (and (= (mod i@39@01 2) 0) (< i@39@01 (Seq_length res@7@01))))
      (and
        (<= 0 i@39@01)
        (= (mod i@39@01 2) 0)
        (< i@39@01 (Seq_length res@7@01))))
    (or
      (not
        (and
          (<= 0 i@39@01)
          (and (= (mod i@39@01 2) 0) (< i@39@01 (Seq_length res@7@01)))))
      (and
        (<= 0 i@39@01)
        (and (= (mod i@39@01 2) 0) (< i@39@01 (Seq_length res@7@01))))))
  :pattern ((Seq_index res@7@01 i@39@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@51@12@51@131-aux|)))
(assert (forall ((i@39@01 Int)) (!
  (=>
    (and
      (<= 0 i@39@01)
      (and (= (mod i@39@01 2) 0) (< i@39@01 (Seq_length res@7@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) (Seq_index
        res@7@01
        i@39@01))
      ($FVF.lookup_Ref__Integer_value (as sm@35@01  $FVF<Ref__Integer_value>) (Seq_index
        a@5@01
        (div i@39@01 2)))))
  :pattern ((Seq_index res@7@01 i@39@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@51@12@51@131|)))
(pop) ; 2
(push) ; 2
; [exec]
; var k: Int
(declare-const k@40@01 Int)
; [exec]
; var __flatten_1: Int
(declare-const __flatten_1@41@01 Int)
; [exec]
; var __flatten_2: Int
(declare-const __flatten_2@42@01 Int)
; [exec]
; var __flatten_3: Int
(declare-const __flatten_3@43@01 Int)
; [exec]
; var __flatten_4: Int
(declare-const __flatten_4@44@01 Int)
; [exec]
; var __flatten_5: Ref
(declare-const __flatten_5@45@01 $Ref)
; [exec]
; var __flatten_6: Ref
(declare-const __flatten_6@46@01 $Ref)
; [exec]
; var __flatten_7: Int
(declare-const __flatten_7@47@01 Int)
; [exec]
; var __flatten_8: Ref
(declare-const __flatten_8@48@01 $Ref)
; [exec]
; var __flatten_9: Ref
(declare-const __flatten_9@49@01 $Ref)
; [exec]
; var __flatten_10: Int
(declare-const __flatten_10@50@01 Int)
; [exec]
; k := 0
(declare-const __flatten_5@51@01 $Ref)
(declare-const __flatten_4@52@01 Int)
(declare-const __flatten_1@53@01 Int)
(declare-const __flatten_6@54@01 $Ref)
(declare-const __flatten_8@55@01 $Ref)
(declare-const __flatten_7@56@01 Int)
(declare-const __flatten_2@57@01 Int)
(declare-const __flatten_9@58@01 $Ref)
(declare-const __flatten_10@59@01 Int)
(declare-const __flatten_3@60@01 Int)
(declare-const k@61@01 Int)
(push) ; 3
; Loop head block: Check well-definedness of invariant
(declare-const $t@62@01 $Snap)
(assert (= $t@62@01 ($Snap.combine ($Snap.first $t@62@01) ($Snap.second $t@62@01))))
(assert (= ($Snap.first $t@62@01) $Snap.unit))
; [eval] 0 <= k
(assert (<= 0 k@61@01))
(assert (=
  ($Snap.second $t@62@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@62@01))
    ($Snap.second ($Snap.second $t@62@01)))))
(assert (= ($Snap.first ($Snap.second $t@62@01)) $Snap.unit))
; [eval] k % 2 == 0
; [eval] k % 2
(assert (= (mod k@61@01 2) 0))
(assert (=
  ($Snap.second ($Snap.second $t@62@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@62@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@62@01))) $Snap.unit))
; [eval] k <= |res|
; [eval] |res|
(assert (<= k@61@01 (Seq_length res@7@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@62@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@62@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@62@01))))
  $Snap.unit))
; [eval] |a| == |b|
; [eval] |a|
; [eval] |b|
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))
  $Snap.unit))
; [eval] |res| == 2 * |a|
; [eval] |res|
; [eval] 2 * |a|
; [eval] |a|
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))))
(declare-const i@63@01 Int)
(push) ; 4
; [eval] (i in [0..|a|))
; [eval] [0..|a|)
; [eval] |a|
(assert (Seq_contains (Seq_range 0 (Seq_length a@5@01)) i@63@01))
; [eval] a[i]
(push) ; 5
(assert (not (>= i@63@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@63@01 (Seq_length a@5@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@64@01 ($Ref) Int)
(declare-fun img@65@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@63@01 Int) (i2@63@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length a@5@01)) i1@63@01)
      (Seq_contains (Seq_range 0 (Seq_length a@5@01)) i2@63@01)
      (= (Seq_index a@5@01 i1@63@01) (Seq_index a@5@01 i2@63@01)))
    (= i1@63@01 i2@63@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@63@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length a@5@01)) i@63@01)
    (and
      (= (inv@64@01 (Seq_index a@5@01 i@63@01)) i@63@01)
      (img@65@01 (Seq_index a@5@01 i@63@01))))
  :pattern ((Seq_index a@5@01 i@63@01))
  :qid |quant-u-19|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@65@01 r)
      (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
    (= (Seq_index a@5@01 (inv@64@01 r)) r))
  :pattern ((inv@64@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@63@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length a@5@01)) i@63@01)
    (not (= (Seq_index a@5@01 i@63@01) $Ref.null)))
  :pattern ((Seq_index a@5@01 i@63@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))))
(declare-const i@66@01 Int)
(push) ; 4
; [eval] (i in [0..|b|))
; [eval] [0..|b|)
; [eval] |b|
(assert (Seq_contains (Seq_range 0 (Seq_length b@6@01)) i@66@01))
; [eval] b[i]
(push) ; 5
(assert (not (>= i@66@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@66@01 (Seq_length b@6@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@67@01 ($Ref) Int)
(declare-fun img@68@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@66@01 Int) (i2@66@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length b@6@01)) i1@66@01)
      (Seq_contains (Seq_range 0 (Seq_length b@6@01)) i2@66@01)
      (= (Seq_index b@6@01 i1@66@01) (Seq_index b@6@01 i2@66@01)))
    (= i1@66@01 i2@66@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@66@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length b@6@01)) i@66@01)
    (and
      (= (inv@67@01 (Seq_index b@6@01 i@66@01)) i@66@01)
      (img@68@01 (Seq_index b@6@01 i@66@01))))
  :pattern ((Seq_index b@6@01 i@66@01))
  :qid |quant-u-21|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@68@01 r)
      (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
    (= (Seq_index b@6@01 (inv@67@01 r)) r))
  :pattern ((inv@67@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@66@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length b@6@01)) i@66@01)
    (not (= (Seq_index b@6@01 i@66@01) $Ref.null)))
  :pattern ((Seq_index b@6@01 i@66@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index b@6@01 i@66@01) (Seq_index a@5@01 i@63@01))
    (=
      (and
        (img@68@01 r)
        (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
      (and
        (img@65@01 r)
        (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))))
  
  :qid |quant-u-22|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))))))
(declare-const i@69@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] (i in [0..|res|))
; [eval] [0..|res|)
; [eval] |res|
(assert (Seq_contains (Seq_range 0 (Seq_length res@7@01)) i@69@01))
; [eval] res[i]
(push) ; 5
(assert (not (>= i@69@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@69@01 (Seq_length res@7@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@70@01 ($Ref) Int)
(declare-fun img@71@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@69@01 Int) (i2@69@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length res@7@01)) i1@69@01)
      (Seq_contains (Seq_range 0 (Seq_length res@7@01)) i2@69@01)
      (= (Seq_index res@7@01 i1@69@01) (Seq_index res@7@01 i2@69@01)))
    (= i1@69@01 i2@69@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@69@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length res@7@01)) i@69@01)
    (and
      (= (inv@70@01 (Seq_index res@7@01 i@69@01)) i@69@01)
      (img@71@01 (Seq_index res@7@01 i@69@01))))
  :pattern ((Seq_index res@7@01 i@69@01))
  :qid |quant-u-24|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@71@01 r)
      (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
    (= (Seq_index res@7@01 (inv@70@01 r)) r))
  :pattern ((inv@70@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@69@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length res@7@01)) i@69@01)
    (not (= (Seq_index res@7@01 i@69@01) $Ref.null)))
  :pattern ((Seq_index res@7@01 i@69@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index res@7@01 i@69@01) (Seq_index b@6@01 i@66@01))
    (=
      (and
        (img@71@01 r)
        (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
      (and
        (img@68@01 r)
        (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))))
  
  :qid |quant-u-25|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index res@7@01 i@69@01) (Seq_index a@5@01 i@63@01))
    (=
      (and
        (img@71@01 r)
        (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
      (and
        (img@65@01 r)
        (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))))
  
  :qid |quant-u-26|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))))
  $Snap.unit))
; [eval] (forall i: Int :: { res[i] } 0 <= i && (i % 2 == 0 && i < k) ==> res[i].Ref__Integer_value == a[i / 2].Ref__Integer_value)
(declare-const i@72@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] 0 <= i && (i % 2 == 0 && i < k) ==> res[i].Ref__Integer_value == a[i / 2].Ref__Integer_value
; [eval] 0 <= i && (i % 2 == 0 && i < k)
; [eval] 0 <= i
(push) ; 5
; [then-branch: 23 | !(0 <= i@72@01) | live]
; [else-branch: 23 | 0 <= i@72@01 | live]
(push) ; 6
; [then-branch: 23 | !(0 <= i@72@01)]
(assert (not (<= 0 i@72@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 23 | 0 <= i@72@01]
(assert (<= 0 i@72@01))
; [eval] i % 2 == 0
; [eval] i % 2
(push) ; 7
; [then-branch: 24 | i@72@01 % 2 != 0 | live]
; [else-branch: 24 | i@72@01 % 2 == 0 | live]
(push) ; 8
; [then-branch: 24 | i@72@01 % 2 != 0]
(assert (not (= (mod i@72@01 2) 0)))
(pop) ; 8
(push) ; 8
; [else-branch: 24 | i@72@01 % 2 == 0]
(assert (= (mod i@72@01 2) 0))
; [eval] i < k
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or (= (mod i@72@01 2) 0) (not (= (mod i@72@01 2) 0))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i@72@01)
  (and (<= 0 i@72@01) (or (= (mod i@72@01 2) 0) (not (= (mod i@72@01 2) 0))))))
(assert (or (<= 0 i@72@01) (not (<= 0 i@72@01))))
(push) ; 5
; [then-branch: 25 | 0 <= i@72@01 && i@72@01 % 2 == 0 && i@72@01 < k@61@01 | live]
; [else-branch: 25 | !(0 <= i@72@01 && i@72@01 % 2 == 0 && i@72@01 < k@61@01) | live]
(push) ; 6
; [then-branch: 25 | 0 <= i@72@01 && i@72@01 % 2 == 0 && i@72@01 < k@61@01]
(assert (and (<= 0 i@72@01) (and (= (mod i@72@01 2) 0) (< i@72@01 k@61@01))))
; [eval] res[i].Ref__Integer_value == a[i / 2].Ref__Integer_value
; [eval] res[i]
(push) ; 7
(assert (not (>= i@72@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@72@01 (Seq_length res@7@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(declare-const sm@73@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@65@01 r)
      (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@68@01 r)
      (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@71@01 r)
      (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r))
  :qid |qp.fvfValDef6|)))
(declare-const pm@74@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@74@01  $FPM) r)
    (+
      (+
        (ite
          (and
            (img@65@01 r)
            (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
          $Perm.Write
          $Perm.No)
        (ite
          (and
            (img@68@01 r)
            (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
          $Perm.Write
          $Perm.No))
      (ite
        (and
          (img@71@01 r)
          (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@74@01  $FPM) r))
  :qid |qp.resPrmSumDef7|)))
(push) ; 7
(assert (not (<
  $Perm.No
  ($FVF.perm_Ref__Integer_value (as pm@74@01  $FPM) (Seq_index res@7@01 i@72@01)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] a[i / 2]
; [eval] i / 2
(push) ; 7
(assert (not (>= (div i@72@01 2) 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< (div i@72@01 2) (Seq_length a@5@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@65@01 r)
        (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r))
    :qid |qp.fvfValDef4|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@68@01 r)
        (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r))
    :qid |qp.fvfValDef5|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@71@01 r)
        (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r))
    :qid |qp.fvfValDef6|))))
(push) ; 7
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and
          (img@65@01 (Seq_index a@5@01 (div i@72@01 2)))
          (Seq_contains
            (Seq_range 0 (Seq_length a@5@01))
            (inv@64@01 (Seq_index a@5@01 (div i@72@01 2)))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@68@01 (Seq_index a@5@01 (div i@72@01 2)))
          (Seq_contains
            (Seq_range 0 (Seq_length b@6@01))
            (inv@67@01 (Seq_index a@5@01 (div i@72@01 2)))))
        $Perm.Write
        $Perm.No))
    (ite
      (and
        (img@71@01 (Seq_index a@5@01 (div i@72@01 2)))
        (Seq_contains
          (Seq_range 0 (Seq_length res@7@01))
          (inv@70@01 (Seq_index a@5@01 (div i@72@01 2)))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 25 | !(0 <= i@72@01 && i@72@01 % 2 == 0 && i@72@01 < k@61@01)]
(assert (not (and (<= 0 i@72@01) (and (= (mod i@72@01 2) 0) (< i@72@01 k@61@01)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@65@01 r)
      (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@68@01 r)
      (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@71@01 r)
      (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@74@01  $FPM) r)
    (+
      (+
        (ite
          (and
            (img@65@01 r)
            (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
          $Perm.Write
          $Perm.No)
        (ite
          (and
            (img@68@01 r)
            (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
          $Perm.Write
          $Perm.No))
      (ite
        (and
          (img@71@01 r)
          (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@74@01  $FPM) r))
  :qid |qp.resPrmSumDef7|)))
(assert (=>
  (and (<= 0 i@72@01) (and (= (mod i@72@01 2) 0) (< i@72@01 k@61@01)))
  (and (<= 0 i@72@01) (= (mod i@72@01 2) 0) (< i@72@01 k@61@01))))
; Joined path conditions
(assert (or
  (not (and (<= 0 i@72@01) (and (= (mod i@72@01 2) 0) (< i@72@01 k@61@01))))
  (and (<= 0 i@72@01) (and (= (mod i@72@01 2) 0) (< i@72@01 k@61@01)))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@65@01 r)
      (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@68@01 r)
      (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@71@01 r)
      (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@74@01  $FPM) r)
    (+
      (+
        (ite
          (and
            (img@65@01 r)
            (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
          $Perm.Write
          $Perm.No)
        (ite
          (and
            (img@68@01 r)
            (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
          $Perm.Write
          $Perm.No))
      (ite
        (and
          (img@71@01 r)
          (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@74@01  $FPM) r))
  :qid |qp.resPrmSumDef7|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@72@01 Int)) (!
  (and
    (=>
      (<= 0 i@72@01)
      (and (<= 0 i@72@01) (or (= (mod i@72@01 2) 0) (not (= (mod i@72@01 2) 0)))))
    (or (<= 0 i@72@01) (not (<= 0 i@72@01)))
    (=>
      (and (<= 0 i@72@01) (and (= (mod i@72@01 2) 0) (< i@72@01 k@61@01)))
      (and (<= 0 i@72@01) (= (mod i@72@01 2) 0) (< i@72@01 k@61@01)))
    (or
      (not (and (<= 0 i@72@01) (and (= (mod i@72@01 2) 0) (< i@72@01 k@61@01))))
      (and (<= 0 i@72@01) (and (= (mod i@72@01 2) 0) (< i@72@01 k@61@01)))))
  :pattern ((Seq_index res@7@01 i@72@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@74@16@74@131-aux|)))
(assert (forall ((i@72@01 Int)) (!
  (=>
    (and (<= 0 i@72@01) (and (= (mod i@72@01 2) 0) (< i@72@01 k@61@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) (Seq_index
        res@7@01
        i@72@01))
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) (Seq_index
        a@5@01
        (div i@72@01 2)))))
  :pattern ((Seq_index res@7@01 i@72@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@74@16@74@131|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))))
  $Snap.unit))
; [eval] (forall i: Int :: { res[i] } 0 <= i && (i % 2 == 1 && i < k) ==> res[i].Ref__Integer_value == b[i / 2].Ref__Integer_value)
(declare-const i@75@01 Int)
(push) ; 4
; [eval] 0 <= i && (i % 2 == 1 && i < k) ==> res[i].Ref__Integer_value == b[i / 2].Ref__Integer_value
; [eval] 0 <= i && (i % 2 == 1 && i < k)
; [eval] 0 <= i
(push) ; 5
; [then-branch: 26 | !(0 <= i@75@01) | live]
; [else-branch: 26 | 0 <= i@75@01 | live]
(push) ; 6
; [then-branch: 26 | !(0 <= i@75@01)]
(assert (not (<= 0 i@75@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 26 | 0 <= i@75@01]
(assert (<= 0 i@75@01))
; [eval] i % 2 == 1
; [eval] i % 2
(push) ; 7
; [then-branch: 27 | i@75@01 % 2 != 1 | live]
; [else-branch: 27 | i@75@01 % 2 == 1 | live]
(push) ; 8
; [then-branch: 27 | i@75@01 % 2 != 1]
(assert (not (= (mod i@75@01 2) 1)))
(pop) ; 8
(push) ; 8
; [else-branch: 27 | i@75@01 % 2 == 1]
(assert (= (mod i@75@01 2) 1))
; [eval] i < k
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or (= (mod i@75@01 2) 1) (not (= (mod i@75@01 2) 1))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i@75@01)
  (and (<= 0 i@75@01) (or (= (mod i@75@01 2) 1) (not (= (mod i@75@01 2) 1))))))
(assert (or (<= 0 i@75@01) (not (<= 0 i@75@01))))
(push) ; 5
; [then-branch: 28 | 0 <= i@75@01 && i@75@01 % 2 == 1 && i@75@01 < k@61@01 | live]
; [else-branch: 28 | !(0 <= i@75@01 && i@75@01 % 2 == 1 && i@75@01 < k@61@01) | live]
(push) ; 6
; [then-branch: 28 | 0 <= i@75@01 && i@75@01 % 2 == 1 && i@75@01 < k@61@01]
(assert (and (<= 0 i@75@01) (and (= (mod i@75@01 2) 1) (< i@75@01 k@61@01))))
; [eval] res[i].Ref__Integer_value == b[i / 2].Ref__Integer_value
; [eval] res[i]
(push) ; 7
(assert (not (>= i@75@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@75@01 (Seq_length res@7@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@65@01 r)
        (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r))
    :qid |qp.fvfValDef4|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@68@01 r)
        (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r))
    :qid |qp.fvfValDef5|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@71@01 r)
        (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r))
    :qid |qp.fvfValDef6|))))
(push) ; 7
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and
          (img@65@01 (Seq_index res@7@01 i@75@01))
          (Seq_contains
            (Seq_range 0 (Seq_length a@5@01))
            (inv@64@01 (Seq_index res@7@01 i@75@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@68@01 (Seq_index res@7@01 i@75@01))
          (Seq_contains
            (Seq_range 0 (Seq_length b@6@01))
            (inv@67@01 (Seq_index res@7@01 i@75@01))))
        $Perm.Write
        $Perm.No))
    (ite
      (and
        (img@71@01 (Seq_index res@7@01 i@75@01))
        (Seq_contains
          (Seq_range 0 (Seq_length res@7@01))
          (inv@70@01 (Seq_index res@7@01 i@75@01))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] b[i / 2]
; [eval] i / 2
(push) ; 7
(assert (not (>= (div i@75@01 2) 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< (div i@75@01 2) (Seq_length b@6@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@65@01 r)
        (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r))
    :qid |qp.fvfValDef4|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@68@01 r)
        (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r))
    :qid |qp.fvfValDef5|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@71@01 r)
        (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r))
    :qid |qp.fvfValDef6|))))
(push) ; 7
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and
          (img@65@01 (Seq_index b@6@01 (div i@75@01 2)))
          (Seq_contains
            (Seq_range 0 (Seq_length a@5@01))
            (inv@64@01 (Seq_index b@6@01 (div i@75@01 2)))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@68@01 (Seq_index b@6@01 (div i@75@01 2)))
          (Seq_contains
            (Seq_range 0 (Seq_length b@6@01))
            (inv@67@01 (Seq_index b@6@01 (div i@75@01 2)))))
        $Perm.Write
        $Perm.No))
    (ite
      (and
        (img@71@01 (Seq_index b@6@01 (div i@75@01 2)))
        (Seq_contains
          (Seq_range 0 (Seq_length res@7@01))
          (inv@70@01 (Seq_index b@6@01 (div i@75@01 2)))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 28 | !(0 <= i@75@01 && i@75@01 % 2 == 1 && i@75@01 < k@61@01)]
(assert (not (and (<= 0 i@75@01) (and (= (mod i@75@01 2) 1) (< i@75@01 k@61@01)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@65@01 r)
      (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@68@01 r)
      (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@71@01 r)
      (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r))
  :qid |qp.fvfValDef6|)))
(assert (=>
  (and (<= 0 i@75@01) (and (= (mod i@75@01 2) 1) (< i@75@01 k@61@01)))
  (and (<= 0 i@75@01) (= (mod i@75@01 2) 1) (< i@75@01 k@61@01))))
; Joined path conditions
(assert (or
  (not (and (<= 0 i@75@01) (and (= (mod i@75@01 2) 1) (< i@75@01 k@61@01))))
  (and (<= 0 i@75@01) (and (= (mod i@75@01 2) 1) (< i@75@01 k@61@01)))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@65@01 r)
      (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@68@01 r)
      (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@71@01 r)
      (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r))
  :qid |qp.fvfValDef6|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@75@01 Int)) (!
  (and
    (=>
      (<= 0 i@75@01)
      (and (<= 0 i@75@01) (or (= (mod i@75@01 2) 1) (not (= (mod i@75@01 2) 1)))))
    (or (<= 0 i@75@01) (not (<= 0 i@75@01)))
    (=>
      (and (<= 0 i@75@01) (and (= (mod i@75@01 2) 1) (< i@75@01 k@61@01)))
      (and (<= 0 i@75@01) (= (mod i@75@01 2) 1) (< i@75@01 k@61@01)))
    (or
      (not (and (<= 0 i@75@01) (and (= (mod i@75@01 2) 1) (< i@75@01 k@61@01))))
      (and (<= 0 i@75@01) (and (= (mod i@75@01 2) 1) (< i@75@01 k@61@01)))))
  :pattern ((Seq_index res@7@01 i@75@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@75@16@75@131-aux|)))
(assert (forall ((i@75@01 Int)) (!
  (=>
    (and (<= 0 i@75@01) (and (= (mod i@75@01 2) 1) (< i@75@01 k@61@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) (Seq_index
        res@7@01
        i@75@01))
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) (Seq_index
        b@6@01
        (div i@75@01 2)))))
  :pattern ((Seq_index res@7@01 i@75@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@75@16@75@131|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))))))
  $Snap.unit))
; [eval] (forall i: Int :: { a[i] } (i in [0..k / 2)) ==> res[2 * i].Ref__Integer_value == a[i].Ref__Integer_value)
(declare-const i@76@01 Int)
(push) ; 4
; [eval] (i in [0..k / 2)) ==> res[2 * i].Ref__Integer_value == a[i].Ref__Integer_value
; [eval] (i in [0..k / 2))
; [eval] [0..k / 2)
; [eval] k / 2
(push) ; 5
; [then-branch: 29 | i@76@01 in [0..k@61@01 / 2] | live]
; [else-branch: 29 | !(i@76@01 in [0..k@61@01 / 2]) | live]
(push) ; 6
; [then-branch: 29 | i@76@01 in [0..k@61@01 / 2]]
(assert (Seq_contains (Seq_range 0 (div k@61@01 2)) i@76@01))
; [eval] res[2 * i].Ref__Integer_value == a[i].Ref__Integer_value
; [eval] res[2 * i]
; [eval] 2 * i
(push) ; 7
(assert (not (>= (* 2 i@76@01) 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< (* 2 i@76@01) (Seq_length res@7@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@65@01 r)
        (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r))
    :qid |qp.fvfValDef4|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@68@01 r)
        (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r))
    :qid |qp.fvfValDef5|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@71@01 r)
        (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r))
    :qid |qp.fvfValDef6|))))
(push) ; 7
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and
          (img@65@01 (Seq_index res@7@01 (* 2 i@76@01)))
          (Seq_contains
            (Seq_range 0 (Seq_length a@5@01))
            (inv@64@01 (Seq_index res@7@01 (* 2 i@76@01)))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@68@01 (Seq_index res@7@01 (* 2 i@76@01)))
          (Seq_contains
            (Seq_range 0 (Seq_length b@6@01))
            (inv@67@01 (Seq_index res@7@01 (* 2 i@76@01)))))
        $Perm.Write
        $Perm.No))
    (ite
      (and
        (img@71@01 (Seq_index res@7@01 (* 2 i@76@01)))
        (Seq_contains
          (Seq_range 0 (Seq_length res@7@01))
          (inv@70@01 (Seq_index res@7@01 (* 2 i@76@01)))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] a[i]
(push) ; 7
(assert (not (>= i@76@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@76@01 (Seq_length a@5@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@65@01 r)
        (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r))
    :qid |qp.fvfValDef4|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@68@01 r)
        (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r))
    :qid |qp.fvfValDef5|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@71@01 r)
        (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r))
    :qid |qp.fvfValDef6|))))
(push) ; 7
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and
          (img@65@01 (Seq_index a@5@01 i@76@01))
          (Seq_contains
            (Seq_range 0 (Seq_length a@5@01))
            (inv@64@01 (Seq_index a@5@01 i@76@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@68@01 (Seq_index a@5@01 i@76@01))
          (Seq_contains
            (Seq_range 0 (Seq_length b@6@01))
            (inv@67@01 (Seq_index a@5@01 i@76@01))))
        $Perm.Write
        $Perm.No))
    (ite
      (and
        (img@71@01 (Seq_index a@5@01 i@76@01))
        (Seq_contains
          (Seq_range 0 (Seq_length res@7@01))
          (inv@70@01 (Seq_index a@5@01 i@76@01))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 29 | !(i@76@01 in [0..k@61@01 / 2])]
(assert (not (Seq_contains (Seq_range 0 (div k@61@01 2)) i@76@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@65@01 r)
      (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@68@01 r)
      (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@71@01 r)
      (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r))
  :qid |qp.fvfValDef6|)))
; Joined path conditions
(assert (or
  (not (Seq_contains (Seq_range 0 (div k@61@01 2)) i@76@01))
  (Seq_contains (Seq_range 0 (div k@61@01 2)) i@76@01)))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@65@01 r)
      (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@68@01 r)
      (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@71@01 r)
      (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r))
  :qid |qp.fvfValDef6|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@76@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 (div k@61@01 2)) i@76@01))
    (Seq_contains (Seq_range 0 (div k@61@01 2)) i@76@01))
  :pattern ((Seq_index a@5@01 i@76@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@76@16@76@113-aux|)))
(assert (forall ((i@76@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (div k@61@01 2)) i@76@01)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) (Seq_index
        res@7@01
        (* 2 i@76@01)))
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) (Seq_index
        a@5@01
        i@76@01))))
  :pattern ((Seq_index a@5@01 i@76@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@76@16@76@113|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))))))
  $Snap.unit))
; [eval] (forall i: Int :: { b[i] } (i in [0..k / 2)) ==> res[2 * i + 1].Ref__Integer_value == b[i].Ref__Integer_value)
(declare-const i@77@01 Int)
(push) ; 4
; [eval] (i in [0..k / 2)) ==> res[2 * i + 1].Ref__Integer_value == b[i].Ref__Integer_value
; [eval] (i in [0..k / 2))
; [eval] [0..k / 2)
; [eval] k / 2
(push) ; 5
; [then-branch: 30 | i@77@01 in [0..k@61@01 / 2] | live]
; [else-branch: 30 | !(i@77@01 in [0..k@61@01 / 2]) | live]
(push) ; 6
; [then-branch: 30 | i@77@01 in [0..k@61@01 / 2]]
(assert (Seq_contains (Seq_range 0 (div k@61@01 2)) i@77@01))
; [eval] res[2 * i + 1].Ref__Integer_value == b[i].Ref__Integer_value
; [eval] res[2 * i + 1]
; [eval] 2 * i + 1
; [eval] 2 * i
(push) ; 7
(assert (not (>= (+ (* 2 i@77@01) 1) 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< (+ (* 2 i@77@01) 1) (Seq_length res@7@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@65@01 r)
        (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r))
    :qid |qp.fvfValDef4|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@68@01 r)
        (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r))
    :qid |qp.fvfValDef5|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@71@01 r)
        (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r))
    :qid |qp.fvfValDef6|))))
(push) ; 7
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and
          (img@65@01 (Seq_index res@7@01 (+ (* 2 i@77@01) 1)))
          (Seq_contains
            (Seq_range 0 (Seq_length a@5@01))
            (inv@64@01 (Seq_index res@7@01 (+ (* 2 i@77@01) 1)))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@68@01 (Seq_index res@7@01 (+ (* 2 i@77@01) 1)))
          (Seq_contains
            (Seq_range 0 (Seq_length b@6@01))
            (inv@67@01 (Seq_index res@7@01 (+ (* 2 i@77@01) 1)))))
        $Perm.Write
        $Perm.No))
    (ite
      (and
        (img@71@01 (Seq_index res@7@01 (+ (* 2 i@77@01) 1)))
        (Seq_contains
          (Seq_range 0 (Seq_length res@7@01))
          (inv@70@01 (Seq_index res@7@01 (+ (* 2 i@77@01) 1)))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] b[i]
(push) ; 7
(assert (not (>= i@77@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@77@01 (Seq_length b@6@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@65@01 r)
        (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r))
    :qid |qp.fvfValDef4|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@68@01 r)
        (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r))
    :qid |qp.fvfValDef5|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@71@01 r)
        (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r))
    :qid |qp.fvfValDef6|))))
(push) ; 7
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and
          (img@65@01 (Seq_index b@6@01 i@77@01))
          (Seq_contains
            (Seq_range 0 (Seq_length a@5@01))
            (inv@64@01 (Seq_index b@6@01 i@77@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@68@01 (Seq_index b@6@01 i@77@01))
          (Seq_contains
            (Seq_range 0 (Seq_length b@6@01))
            (inv@67@01 (Seq_index b@6@01 i@77@01))))
        $Perm.Write
        $Perm.No))
    (ite
      (and
        (img@71@01 (Seq_index b@6@01 i@77@01))
        (Seq_contains
          (Seq_range 0 (Seq_length res@7@01))
          (inv@70@01 (Seq_index b@6@01 i@77@01))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 30 | !(i@77@01 in [0..k@61@01 / 2])]
(assert (not (Seq_contains (Seq_range 0 (div k@61@01 2)) i@77@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@65@01 r)
      (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@68@01 r)
      (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@71@01 r)
      (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r))
  :qid |qp.fvfValDef6|)))
; Joined path conditions
(assert (or
  (not (Seq_contains (Seq_range 0 (div k@61@01 2)) i@77@01))
  (Seq_contains (Seq_range 0 (div k@61@01 2)) i@77@01)))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@65@01 r)
      (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@68@01 r)
      (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@71@01 r)
      (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r))
  :qid |qp.fvfValDef6|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@77@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 (div k@61@01 2)) i@77@01))
    (Seq_contains (Seq_range 0 (div k@61@01 2)) i@77@01))
  :pattern ((Seq_index b@6@01 i@77@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@77@16@77@117-aux|)))
(assert (forall ((i@77@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (div k@61@01 2)) i@77@01)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) (Seq_index
        res@7@01
        (+ (* 2 i@77@01) 1)))
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) (Seq_index
        b@6@01
        i@77@01))))
  :pattern ((Seq_index b@6@01 i@77@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@77@16@77@117|)))
(pop) ; 3
(push) ; 3
; Loop head block: Establish invariant
; [eval] 0 <= k
; [eval] k % 2 == 0
; [eval] k % 2
(push) ; 4
(assert (not (= (mod 0 2) 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (= (mod 0 2) 0))
; [eval] k <= |res|
; [eval] |res|
(push) ; 4
(assert (not (<= 0 (Seq_length res@7@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 (Seq_length res@7@01)))
; [eval] |a| == |b|
; [eval] |a|
; [eval] |b|
; [eval] |res| == 2 * |a|
; [eval] |res|
; [eval] 2 * |a|
; [eval] |a|
(declare-const i@78@01 Int)
(push) ; 4
; [eval] (i in [0..|a|))
; [eval] [0..|a|)
; [eval] |a|
(assert (Seq_contains (Seq_range 0 (Seq_length a@5@01)) i@78@01))
; [eval] a[i]
(push) ; 5
(assert (not (>= i@78@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@78@01 (Seq_length a@5@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@79@01 ($Ref) Int)
(declare-fun img@80@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@78@01 Int) (i2@78@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length a@5@01)) i1@78@01)
      (Seq_contains (Seq_range 0 (Seq_length a@5@01)) i2@78@01)
      (= (Seq_index a@5@01 i1@78@01) (Seq_index a@5@01 i2@78@01)))
    (= i1@78@01 i2@78@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@78@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length a@5@01)) i@78@01)
    (and
      (= (inv@79@01 (Seq_index a@5@01 i@78@01)) i@78@01)
      (img@80@01 (Seq_index a@5@01 i@78@01))))
  :pattern ((Seq_index a@5@01 i@78@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@80@01 r)
      (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@79@01 r)))
    (= (Seq_index a@5@01 (inv@79@01 r)) r))
  :pattern ((inv@79@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((i@78@01 Int)) (!
  (= (Seq_index a@5@01 i@78@01) (Seq_index b@6@01 i@78@01))
  
  :qid |quant-u-28|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((i@78@01 Int)) (!
  (= (Seq_index a@5@01 i@78@01) (Seq_index res@7@01 i@78@01))
  
  :qid |quant-u-29|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@81@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@79@01 r))
      (img@80@01 r)
      (= r (Seq_index a@5@01 (inv@79@01 r))))
    ($Perm.min
      (ite
        (and
          (img@13@01 r)
          (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@12@01 r)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@82@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@79@01 r))
      (img@80@01 r)
      (= r (Seq_index a@5@01 (inv@79@01 r))))
    ($Perm.min
      (ite
        (and
          (img@18@01 r)
          (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@17@01 r)))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@81@01 r)))
    $Perm.No))
(define-fun pTaken@83@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@79@01 r))
      (img@80@01 r)
      (= r (Seq_index a@5@01 (inv@79@01 r))))
    ($Perm.min
      (ite
        (and
          (img@23@01 r)
          (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@22@01 r)))
        $Perm.Write
        $Perm.No)
      (- (- $Perm.Write (pTaken@81@01 r)) (pTaken@82@01 r)))
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
          (img@13@01 r)
          (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@12@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@81@01 r))
    $Perm.No)
  
  :qid |quant-u-31|))))
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
      (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@79@01 r))
      (img@80@01 r)
      (= r (Seq_index a@5@01 (inv@79@01 r))))
    (= (- $Perm.Write (pTaken@81@01 r)) $Perm.No))
  
  :qid |quant-u-32|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@84@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@13@01 r)
      (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@12@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))) r))
  :qid |qp.fvfValDef8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@18@01 r)
      (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@17@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))) r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@23@01 r)
      (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@22@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))) r))
  :qid |qp.fvfValDef10|)))
(declare-const i@85@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] (i in [0..|b|))
; [eval] [0..|b|)
; [eval] |b|
(assert (Seq_contains (Seq_range 0 (Seq_length b@6@01)) i@85@01))
; [eval] b[i]
(push) ; 5
(assert (not (>= i@85@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@85@01 (Seq_length b@6@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@86@01 ($Ref) Int)
(declare-fun img@87@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@85@01 Int) (i2@85@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length b@6@01)) i1@85@01)
      (Seq_contains (Seq_range 0 (Seq_length b@6@01)) i2@85@01)
      (= (Seq_index b@6@01 i1@85@01) (Seq_index b@6@01 i2@85@01)))
    (= i1@85@01 i2@85@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@85@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length b@6@01)) i@85@01)
    (and
      (= (inv@86@01 (Seq_index b@6@01 i@85@01)) i@85@01)
      (img@87@01 (Seq_index b@6@01 i@85@01))))
  :pattern ((Seq_index b@6@01 i@85@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@87@01 r)
      (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@86@01 r)))
    (= (Seq_index b@6@01 (inv@86@01 r)) r))
  :pattern ((inv@86@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((i@85@01 Int)) (!
  (= (Seq_index b@6@01 i@85@01) (Seq_index res@7@01 i@85@01))
  
  :qid |quant-u-34|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@88@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@86@01 r))
      (img@87@01 r)
      (= r (Seq_index b@6@01 (inv@86@01 r))))
    ($Perm.min
      (ite
        (and
          (img@18@01 r)
          (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@17@01 r)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@89@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@86@01 r))
      (img@87@01 r)
      (= r (Seq_index b@6@01 (inv@86@01 r))))
    ($Perm.min
      (ite
        (and
          (img@23@01 r)
          (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@22@01 r)))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@88@01 r)))
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
          (img@18@01 r)
          (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@17@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@88@01 r))
    $Perm.No)
  
  :qid |quant-u-36|))))
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
      (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@86@01 r))
      (img@87@01 r)
      (= r (Seq_index b@6@01 (inv@86@01 r))))
    (= (- $Perm.Write (pTaken@88@01 r)) $Perm.No))
  
  :qid |quant-u-37|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@90@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@23@01 r)
      (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@22@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@90@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@90@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))) r))
  :qid |qp.fvfValDef11|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@18@01 r)
      (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@17@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@90@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@90@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))) r))
  :qid |qp.fvfValDef12|)))
(declare-const i@91@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] (i in [0..|res|))
; [eval] [0..|res|)
; [eval] |res|
(assert (Seq_contains (Seq_range 0 (Seq_length res@7@01)) i@91@01))
; [eval] res[i]
(push) ; 5
(assert (not (>= i@91@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@91@01 (Seq_length res@7@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@92@01 ($Ref) Int)
(declare-fun img@93@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@91@01 Int) (i2@91@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length res@7@01)) i1@91@01)
      (Seq_contains (Seq_range 0 (Seq_length res@7@01)) i2@91@01)
      (= (Seq_index res@7@01 i1@91@01) (Seq_index res@7@01 i2@91@01)))
    (= i1@91@01 i2@91@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@91@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length res@7@01)) i@91@01)
    (and
      (= (inv@92@01 (Seq_index res@7@01 i@91@01)) i@91@01)
      (img@93@01 (Seq_index res@7@01 i@91@01))))
  :pattern ((Seq_index res@7@01 i@91@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@93@01 r)
      (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@92@01 r)))
    (= (Seq_index res@7@01 (inv@92@01 r)) r))
  :pattern ((inv@92@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@94@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@92@01 r))
      (img@93@01 r)
      (= r (Seq_index res@7@01 (inv@92@01 r))))
    ($Perm.min
      (ite
        (and
          (img@23@01 r)
          (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@22@01 r)))
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
          (img@23@01 r)
          (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@22@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@94@01 r))
    $Perm.No)
  
  :qid |quant-u-40|))))
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
      (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@92@01 r))
      (img@93@01 r)
      (= r (Seq_index res@7@01 (inv@92@01 r))))
    (= (- $Perm.Write (pTaken@94@01 r)) $Perm.No))
  
  :qid |quant-u-41|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@95@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@23@01 r)
      (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@22@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@95@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@95@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))) r))
  :qid |qp.fvfValDef13|)))
; [eval] (forall i: Int :: { res[i] } 0 <= i && (i % 2 == 0 && i < k) ==> res[i].Ref__Integer_value == a[i / 2].Ref__Integer_value)
(declare-const i@96@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] 0 <= i && (i % 2 == 0 && i < k) ==> res[i].Ref__Integer_value == a[i / 2].Ref__Integer_value
; [eval] 0 <= i && (i % 2 == 0 && i < k)
; [eval] 0 <= i
(push) ; 5
; [then-branch: 31 | !(0 <= i@96@01) | live]
; [else-branch: 31 | 0 <= i@96@01 | live]
(push) ; 6
; [then-branch: 31 | !(0 <= i@96@01)]
(assert (not (<= 0 i@96@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 31 | 0 <= i@96@01]
(assert (<= 0 i@96@01))
; [eval] i % 2 == 0
; [eval] i % 2
(push) ; 7
; [then-branch: 32 | i@96@01 % 2 != 0 | live]
; [else-branch: 32 | i@96@01 % 2 == 0 | live]
(push) ; 8
; [then-branch: 32 | i@96@01 % 2 != 0]
(assert (not (= (mod i@96@01 2) 0)))
(pop) ; 8
(push) ; 8
; [else-branch: 32 | i@96@01 % 2 == 0]
(assert (= (mod i@96@01 2) 0))
; [eval] i < k
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or (= (mod i@96@01 2) 0) (not (= (mod i@96@01 2) 0))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i@96@01)
  (and (<= 0 i@96@01) (or (= (mod i@96@01 2) 0) (not (= (mod i@96@01 2) 0))))))
(assert (or (<= 0 i@96@01) (not (<= 0 i@96@01))))
(push) ; 5
; [then-branch: 33 | 0 <= i@96@01 && i@96@01 % 2 == 0 && i@96@01 < 0 | live]
; [else-branch: 33 | !(0 <= i@96@01 && i@96@01 % 2 == 0 && i@96@01 < 0) | live]
(push) ; 6
; [then-branch: 33 | 0 <= i@96@01 && i@96@01 % 2 == 0 && i@96@01 < 0]
(assert (and (<= 0 i@96@01) (and (= (mod i@96@01 2) 0) (< i@96@01 0))))
; [eval] res[i].Ref__Integer_value == a[i / 2].Ref__Integer_value
; [eval] res[i]
(push) ; 7
(assert (not (>= i@96@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@96@01 (Seq_length res@7@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@13@01 r)
        (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@12@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))) r))
    :qid |qp.fvfValDef8|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@18@01 r)
        (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@17@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))) r))
    :qid |qp.fvfValDef9|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@23@01 r)
        (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@22@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))) r))
    :qid |qp.fvfValDef10|))))
(push) ; 7
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and
          (img@13@01 (Seq_index res@7@01 i@96@01))
          (Seq_contains
            (Seq_range 0 (Seq_length a@5@01))
            (inv@12@01 (Seq_index res@7@01 i@96@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@18@01 (Seq_index res@7@01 i@96@01))
          (Seq_contains
            (Seq_range 0 (Seq_length b@6@01))
            (inv@17@01 (Seq_index res@7@01 i@96@01))))
        $Perm.Write
        $Perm.No))
    (ite
      (and
        (img@23@01 (Seq_index res@7@01 i@96@01))
        (Seq_contains
          (Seq_range 0 (Seq_length res@7@01))
          (inv@22@01 (Seq_index res@7@01 i@96@01))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] a[i / 2]
; [eval] i / 2
(push) ; 7
(assert (not (>= (div i@96@01 2) 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< (div i@96@01 2) (Seq_length a@5@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@13@01 r)
        (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@12@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))) r))
    :qid |qp.fvfValDef8|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@18@01 r)
        (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@17@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))) r))
    :qid |qp.fvfValDef9|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@23@01 r)
        (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@22@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))) r))
    :qid |qp.fvfValDef10|))))
(push) ; 7
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and
          (img@13@01 (Seq_index a@5@01 (div i@96@01 2)))
          (Seq_contains
            (Seq_range 0 (Seq_length a@5@01))
            (inv@12@01 (Seq_index a@5@01 (div i@96@01 2)))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@18@01 (Seq_index a@5@01 (div i@96@01 2)))
          (Seq_contains
            (Seq_range 0 (Seq_length b@6@01))
            (inv@17@01 (Seq_index a@5@01 (div i@96@01 2)))))
        $Perm.Write
        $Perm.No))
    (ite
      (and
        (img@23@01 (Seq_index a@5@01 (div i@96@01 2)))
        (Seq_contains
          (Seq_range 0 (Seq_length res@7@01))
          (inv@22@01 (Seq_index a@5@01 (div i@96@01 2)))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 33 | !(0 <= i@96@01 && i@96@01 % 2 == 0 && i@96@01 < 0)]
(assert (not (and (<= 0 i@96@01) (and (= (mod i@96@01 2) 0) (< i@96@01 0)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@13@01 r)
      (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@12@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))) r))
  :qid |qp.fvfValDef8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@18@01 r)
      (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@17@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))) r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@23@01 r)
      (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@22@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))) r))
  :qid |qp.fvfValDef10|)))
(assert (=>
  (and (<= 0 i@96@01) (and (= (mod i@96@01 2) 0) (< i@96@01 0)))
  (and (<= 0 i@96@01) (= (mod i@96@01 2) 0) (< i@96@01 0))))
; Joined path conditions
(assert (or
  (not (and (<= 0 i@96@01) (and (= (mod i@96@01 2) 0) (< i@96@01 0))))
  (and (<= 0 i@96@01) (and (= (mod i@96@01 2) 0) (< i@96@01 0)))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@13@01 r)
      (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@12@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))) r))
  :qid |qp.fvfValDef8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@18@01 r)
      (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@17@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))) r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@23@01 r)
      (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@22@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))) r))
  :qid |qp.fvfValDef10|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@96@01 Int)) (!
  (and
    (=>
      (<= 0 i@96@01)
      (and (<= 0 i@96@01) (or (= (mod i@96@01 2) 0) (not (= (mod i@96@01 2) 0)))))
    (or (<= 0 i@96@01) (not (<= 0 i@96@01)))
    (=>
      (and (<= 0 i@96@01) (and (= (mod i@96@01 2) 0) (< i@96@01 0)))
      (and (<= 0 i@96@01) (= (mod i@96@01 2) 0) (< i@96@01 0)))
    (or
      (not (and (<= 0 i@96@01) (and (= (mod i@96@01 2) 0) (< i@96@01 0))))
      (and (<= 0 i@96@01) (and (= (mod i@96@01 2) 0) (< i@96@01 0)))))
  :pattern ((Seq_index res@7@01 i@96@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@74@16@74@131-aux|)))
(push) ; 4
(assert (not (forall ((i@96@01 Int)) (!
  (=>
    (and (<= 0 i@96@01) (and (= (mod i@96@01 2) 0) (< i@96@01 0)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) (Seq_index
        res@7@01
        i@96@01))
      ($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) (Seq_index
        a@5@01
        (div i@96@01 2)))))
  :pattern ((Seq_index res@7@01 i@96@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@74@16@74@131|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@96@01 Int)) (!
  (=>
    (and (<= 0 i@96@01) (and (= (mod i@96@01 2) 0) (< i@96@01 0)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) (Seq_index
        res@7@01
        i@96@01))
      ($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) (Seq_index
        a@5@01
        (div i@96@01 2)))))
  :pattern ((Seq_index res@7@01 i@96@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@74@16@74@131|)))
; [eval] (forall i: Int :: { res[i] } 0 <= i && (i % 2 == 1 && i < k) ==> res[i].Ref__Integer_value == b[i / 2].Ref__Integer_value)
(declare-const i@97@01 Int)
(push) ; 4
; [eval] 0 <= i && (i % 2 == 1 && i < k) ==> res[i].Ref__Integer_value == b[i / 2].Ref__Integer_value
; [eval] 0 <= i && (i % 2 == 1 && i < k)
; [eval] 0 <= i
(push) ; 5
; [then-branch: 34 | !(0 <= i@97@01) | live]
; [else-branch: 34 | 0 <= i@97@01 | live]
(push) ; 6
; [then-branch: 34 | !(0 <= i@97@01)]
(assert (not (<= 0 i@97@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 34 | 0 <= i@97@01]
(assert (<= 0 i@97@01))
; [eval] i % 2 == 1
; [eval] i % 2
(push) ; 7
; [then-branch: 35 | i@97@01 % 2 != 1 | live]
; [else-branch: 35 | i@97@01 % 2 == 1 | live]
(push) ; 8
; [then-branch: 35 | i@97@01 % 2 != 1]
(assert (not (= (mod i@97@01 2) 1)))
(pop) ; 8
(push) ; 8
; [else-branch: 35 | i@97@01 % 2 == 1]
(assert (= (mod i@97@01 2) 1))
; [eval] i < k
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (or (= (mod i@97@01 2) 1) (not (= (mod i@97@01 2) 1))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i@97@01)
  (and (<= 0 i@97@01) (or (= (mod i@97@01 2) 1) (not (= (mod i@97@01 2) 1))))))
(assert (or (<= 0 i@97@01) (not (<= 0 i@97@01))))
(push) ; 5
; [then-branch: 36 | 0 <= i@97@01 && i@97@01 % 2 == 1 && i@97@01 < 0 | live]
; [else-branch: 36 | !(0 <= i@97@01 && i@97@01 % 2 == 1 && i@97@01 < 0) | live]
(push) ; 6
; [then-branch: 36 | 0 <= i@97@01 && i@97@01 % 2 == 1 && i@97@01 < 0]
(assert (and (<= 0 i@97@01) (and (= (mod i@97@01 2) 1) (< i@97@01 0))))
; [eval] res[i].Ref__Integer_value == b[i / 2].Ref__Integer_value
; [eval] res[i]
(push) ; 7
(assert (not (>= i@97@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@97@01 (Seq_length res@7@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@13@01 r)
        (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@12@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))) r))
    :qid |qp.fvfValDef8|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@18@01 r)
        (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@17@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))) r))
    :qid |qp.fvfValDef9|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@23@01 r)
        (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@22@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))) r))
    :qid |qp.fvfValDef10|))))
(push) ; 7
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and
          (img@13@01 (Seq_index res@7@01 i@97@01))
          (Seq_contains
            (Seq_range 0 (Seq_length a@5@01))
            (inv@12@01 (Seq_index res@7@01 i@97@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@18@01 (Seq_index res@7@01 i@97@01))
          (Seq_contains
            (Seq_range 0 (Seq_length b@6@01))
            (inv@17@01 (Seq_index res@7@01 i@97@01))))
        $Perm.Write
        $Perm.No))
    (ite
      (and
        (img@23@01 (Seq_index res@7@01 i@97@01))
        (Seq_contains
          (Seq_range 0 (Seq_length res@7@01))
          (inv@22@01 (Seq_index res@7@01 i@97@01))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] b[i / 2]
; [eval] i / 2
(push) ; 7
(assert (not (>= (div i@97@01 2) 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< (div i@97@01 2) (Seq_length b@6@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@13@01 r)
        (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@12@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))) r))
    :qid |qp.fvfValDef8|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@18@01 r)
        (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@17@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))) r))
    :qid |qp.fvfValDef9|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@23@01 r)
        (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@22@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))) r))
    :qid |qp.fvfValDef10|))))
(push) ; 7
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and
          (img@13@01 (Seq_index b@6@01 (div i@97@01 2)))
          (Seq_contains
            (Seq_range 0 (Seq_length a@5@01))
            (inv@12@01 (Seq_index b@6@01 (div i@97@01 2)))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@18@01 (Seq_index b@6@01 (div i@97@01 2)))
          (Seq_contains
            (Seq_range 0 (Seq_length b@6@01))
            (inv@17@01 (Seq_index b@6@01 (div i@97@01 2)))))
        $Perm.Write
        $Perm.No))
    (ite
      (and
        (img@23@01 (Seq_index b@6@01 (div i@97@01 2)))
        (Seq_contains
          (Seq_range 0 (Seq_length res@7@01))
          (inv@22@01 (Seq_index b@6@01 (div i@97@01 2)))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 36 | !(0 <= i@97@01 && i@97@01 % 2 == 1 && i@97@01 < 0)]
(assert (not (and (<= 0 i@97@01) (and (= (mod i@97@01 2) 1) (< i@97@01 0)))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@13@01 r)
      (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@12@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))) r))
  :qid |qp.fvfValDef8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@18@01 r)
      (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@17@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))) r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@23@01 r)
      (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@22@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))) r))
  :qid |qp.fvfValDef10|)))
(assert (=>
  (and (<= 0 i@97@01) (and (= (mod i@97@01 2) 1) (< i@97@01 0)))
  (and (<= 0 i@97@01) (= (mod i@97@01 2) 1) (< i@97@01 0))))
; Joined path conditions
(assert (or
  (not (and (<= 0 i@97@01) (and (= (mod i@97@01 2) 1) (< i@97@01 0))))
  (and (<= 0 i@97@01) (and (= (mod i@97@01 2) 1) (< i@97@01 0)))))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@13@01 r)
      (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@12@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))) r))
  :qid |qp.fvfValDef8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@18@01 r)
      (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@17@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))) r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@23@01 r)
      (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@22@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))) r))
  :qid |qp.fvfValDef10|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@97@01 Int)) (!
  (and
    (=>
      (<= 0 i@97@01)
      (and (<= 0 i@97@01) (or (= (mod i@97@01 2) 1) (not (= (mod i@97@01 2) 1)))))
    (or (<= 0 i@97@01) (not (<= 0 i@97@01)))
    (=>
      (and (<= 0 i@97@01) (and (= (mod i@97@01 2) 1) (< i@97@01 0)))
      (and (<= 0 i@97@01) (= (mod i@97@01 2) 1) (< i@97@01 0)))
    (or
      (not (and (<= 0 i@97@01) (and (= (mod i@97@01 2) 1) (< i@97@01 0))))
      (and (<= 0 i@97@01) (and (= (mod i@97@01 2) 1) (< i@97@01 0)))))
  :pattern ((Seq_index res@7@01 i@97@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@75@16@75@131-aux|)))
(push) ; 4
(assert (not (forall ((i@97@01 Int)) (!
  (=>
    (and (<= 0 i@97@01) (and (= (mod i@97@01 2) 1) (< i@97@01 0)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) (Seq_index
        res@7@01
        i@97@01))
      ($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) (Seq_index
        b@6@01
        (div i@97@01 2)))))
  :pattern ((Seq_index res@7@01 i@97@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@75@16@75@131|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@97@01 Int)) (!
  (=>
    (and (<= 0 i@97@01) (and (= (mod i@97@01 2) 1) (< i@97@01 0)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) (Seq_index
        res@7@01
        i@97@01))
      ($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) (Seq_index
        b@6@01
        (div i@97@01 2)))))
  :pattern ((Seq_index res@7@01 i@97@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@75@16@75@131|)))
; [eval] (forall i: Int :: { a[i] } (i in [0..k / 2)) ==> res[2 * i].Ref__Integer_value == a[i].Ref__Integer_value)
(declare-const i@98@01 Int)
(push) ; 4
; [eval] (i in [0..k / 2)) ==> res[2 * i].Ref__Integer_value == a[i].Ref__Integer_value
; [eval] (i in [0..k / 2))
; [eval] [0..k / 2)
; [eval] k / 2
(push) ; 5
; [then-branch: 37 | i@98@01 in [0..0 / 2] | live]
; [else-branch: 37 | !(i@98@01 in [0..0 / 2]) | live]
(push) ; 6
; [then-branch: 37 | i@98@01 in [0..0 / 2]]
(assert (Seq_contains (Seq_range 0 (div 0 2)) i@98@01))
; [eval] res[2 * i].Ref__Integer_value == a[i].Ref__Integer_value
; [eval] res[2 * i]
; [eval] 2 * i
(push) ; 7
(assert (not (>= (* 2 i@98@01) 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< (* 2 i@98@01) (Seq_length res@7@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@13@01 r)
        (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@12@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))) r))
    :qid |qp.fvfValDef8|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@18@01 r)
        (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@17@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))) r))
    :qid |qp.fvfValDef9|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@23@01 r)
        (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@22@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))) r))
    :qid |qp.fvfValDef10|))))
(push) ; 7
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and
          (img@13@01 (Seq_index res@7@01 (* 2 i@98@01)))
          (Seq_contains
            (Seq_range 0 (Seq_length a@5@01))
            (inv@12@01 (Seq_index res@7@01 (* 2 i@98@01)))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@18@01 (Seq_index res@7@01 (* 2 i@98@01)))
          (Seq_contains
            (Seq_range 0 (Seq_length b@6@01))
            (inv@17@01 (Seq_index res@7@01 (* 2 i@98@01)))))
        $Perm.Write
        $Perm.No))
    (ite
      (and
        (img@23@01 (Seq_index res@7@01 (* 2 i@98@01)))
        (Seq_contains
          (Seq_range 0 (Seq_length res@7@01))
          (inv@22@01 (Seq_index res@7@01 (* 2 i@98@01)))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] a[i]
(push) ; 7
(assert (not (>= i@98@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@98@01 (Seq_length a@5@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@13@01 r)
        (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@12@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))) r))
    :qid |qp.fvfValDef8|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@18@01 r)
        (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@17@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))) r))
    :qid |qp.fvfValDef9|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@23@01 r)
        (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@22@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))) r))
    :qid |qp.fvfValDef10|))))
(push) ; 7
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and
          (img@13@01 (Seq_index a@5@01 i@98@01))
          (Seq_contains
            (Seq_range 0 (Seq_length a@5@01))
            (inv@12@01 (Seq_index a@5@01 i@98@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@18@01 (Seq_index a@5@01 i@98@01))
          (Seq_contains
            (Seq_range 0 (Seq_length b@6@01))
            (inv@17@01 (Seq_index a@5@01 i@98@01))))
        $Perm.Write
        $Perm.No))
    (ite
      (and
        (img@23@01 (Seq_index a@5@01 i@98@01))
        (Seq_contains
          (Seq_range 0 (Seq_length res@7@01))
          (inv@22@01 (Seq_index a@5@01 i@98@01))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 37 | !(i@98@01 in [0..0 / 2])]
(assert (not (Seq_contains (Seq_range 0 (div 0 2)) i@98@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@13@01 r)
      (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@12@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))) r))
  :qid |qp.fvfValDef8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@18@01 r)
      (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@17@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))) r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@23@01 r)
      (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@22@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))) r))
  :qid |qp.fvfValDef10|)))
; Joined path conditions
(assert (or
  (not (Seq_contains (Seq_range 0 (div 0 2)) i@98@01))
  (Seq_contains (Seq_range 0 (div 0 2)) i@98@01)))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@13@01 r)
      (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@12@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))) r))
  :qid |qp.fvfValDef8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@18@01 r)
      (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@17@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))) r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@23@01 r)
      (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@22@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))) r))
  :qid |qp.fvfValDef10|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@98@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 (div 0 2)) i@98@01))
    (Seq_contains (Seq_range 0 (div 0 2)) i@98@01))
  :pattern ((Seq_index a@5@01 i@98@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@76@16@76@113-aux|)))
(push) ; 4
(assert (not (forall ((i@98@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (div 0 2)) i@98@01)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) (Seq_index
        res@7@01
        (* 2 i@98@01)))
      ($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) (Seq_index
        a@5@01
        i@98@01))))
  :pattern ((Seq_index a@5@01 i@98@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@76@16@76@113|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@98@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (div 0 2)) i@98@01)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) (Seq_index
        res@7@01
        (* 2 i@98@01)))
      ($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) (Seq_index
        a@5@01
        i@98@01))))
  :pattern ((Seq_index a@5@01 i@98@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@76@16@76@113|)))
; [eval] (forall i: Int :: { b[i] } (i in [0..k / 2)) ==> res[2 * i + 1].Ref__Integer_value == b[i].Ref__Integer_value)
(declare-const i@99@01 Int)
(push) ; 4
; [eval] (i in [0..k / 2)) ==> res[2 * i + 1].Ref__Integer_value == b[i].Ref__Integer_value
; [eval] (i in [0..k / 2))
; [eval] [0..k / 2)
; [eval] k / 2
(push) ; 5
; [then-branch: 38 | i@99@01 in [0..0 / 2] | live]
; [else-branch: 38 | !(i@99@01 in [0..0 / 2]) | live]
(push) ; 6
; [then-branch: 38 | i@99@01 in [0..0 / 2]]
(assert (Seq_contains (Seq_range 0 (div 0 2)) i@99@01))
; [eval] res[2 * i + 1].Ref__Integer_value == b[i].Ref__Integer_value
; [eval] res[2 * i + 1]
; [eval] 2 * i + 1
; [eval] 2 * i
(push) ; 7
(assert (not (>= (+ (* 2 i@99@01) 1) 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< (+ (* 2 i@99@01) 1) (Seq_length res@7@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@13@01 r)
        (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@12@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))) r))
    :qid |qp.fvfValDef8|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@18@01 r)
        (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@17@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))) r))
    :qid |qp.fvfValDef9|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@23@01 r)
        (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@22@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))) r))
    :qid |qp.fvfValDef10|))))
(push) ; 7
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and
          (img@13@01 (Seq_index res@7@01 (+ (* 2 i@99@01) 1)))
          (Seq_contains
            (Seq_range 0 (Seq_length a@5@01))
            (inv@12@01 (Seq_index res@7@01 (+ (* 2 i@99@01) 1)))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@18@01 (Seq_index res@7@01 (+ (* 2 i@99@01) 1)))
          (Seq_contains
            (Seq_range 0 (Seq_length b@6@01))
            (inv@17@01 (Seq_index res@7@01 (+ (* 2 i@99@01) 1)))))
        $Perm.Write
        $Perm.No))
    (ite
      (and
        (img@23@01 (Seq_index res@7@01 (+ (* 2 i@99@01) 1)))
        (Seq_contains
          (Seq_range 0 (Seq_length res@7@01))
          (inv@22@01 (Seq_index res@7@01 (+ (* 2 i@99@01) 1)))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] b[i]
(push) ; 7
(assert (not (>= i@99@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@99@01 (Seq_length b@6@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@13@01 r)
        (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@12@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))) r))
    :qid |qp.fvfValDef8|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@18@01 r)
        (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@17@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))) r))
    :qid |qp.fvfValDef9|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@23@01 r)
        (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@22@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))) r))
    :qid |qp.fvfValDef10|))))
(push) ; 7
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and
          (img@13@01 (Seq_index b@6@01 i@99@01))
          (Seq_contains
            (Seq_range 0 (Seq_length a@5@01))
            (inv@12@01 (Seq_index b@6@01 i@99@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@18@01 (Seq_index b@6@01 i@99@01))
          (Seq_contains
            (Seq_range 0 (Seq_length b@6@01))
            (inv@17@01 (Seq_index b@6@01 i@99@01))))
        $Perm.Write
        $Perm.No))
    (ite
      (and
        (img@23@01 (Seq_index b@6@01 i@99@01))
        (Seq_contains
          (Seq_range 0 (Seq_length res@7@01))
          (inv@22@01 (Seq_index b@6@01 i@99@01))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(push) ; 6
; [else-branch: 38 | !(i@99@01 in [0..0 / 2])]
(assert (not (Seq_contains (Seq_range 0 (div 0 2)) i@99@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@13@01 r)
      (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@12@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))) r))
  :qid |qp.fvfValDef8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@18@01 r)
      (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@17@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))) r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@23@01 r)
      (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@22@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))) r))
  :qid |qp.fvfValDef10|)))
; Joined path conditions
(assert (or
  (not (Seq_contains (Seq_range 0 (div 0 2)) i@99@01))
  (Seq_contains (Seq_range 0 (div 0 2)) i@99@01)))
(pop) ; 4
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@13@01 r)
      (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@12@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))) r))
  :qid |qp.fvfValDef8|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@18@01 r)
      (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@17@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01)))))))) r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@23@01 r)
      (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@22@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@8@01))))))))) r))
  :qid |qp.fvfValDef10|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@99@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 (div 0 2)) i@99@01))
    (Seq_contains (Seq_range 0 (div 0 2)) i@99@01))
  :pattern ((Seq_index b@6@01 i@99@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@77@16@77@117-aux|)))
(push) ; 4
(assert (not (forall ((i@99@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (div 0 2)) i@99@01)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) (Seq_index
        res@7@01
        (+ (* 2 i@99@01) 1)))
      ($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) (Seq_index
        b@6@01
        i@99@01))))
  :pattern ((Seq_index b@6@01 i@99@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@77@16@77@117|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@99@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (div 0 2)) i@99@01)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) (Seq_index
        res@7@01
        (+ (* 2 i@99@01) 1)))
      ($FVF.lookup_Ref__Integer_value (as sm@84@01  $FVF<Ref__Integer_value>) (Seq_index
        b@6@01
        i@99@01))))
  :pattern ((Seq_index b@6@01 i@99@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@77@16@77@117|)))
; Loop head block: Execute statements of loop head block (in invariant state)
(push) ; 4
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@71@01 r)
      (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
    (= (Seq_index res@7@01 (inv@70@01 r)) r))
  :pattern ((inv@70@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@65@01 r)
      (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@68@01 r)
      (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@71@01 r)
      (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@74@01  $FPM) r)
    (+
      (+
        (ite
          (and
            (img@65@01 r)
            (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
          $Perm.Write
          $Perm.No)
        (ite
          (and
            (img@68@01 r)
            (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
          $Perm.Write
          $Perm.No))
      (ite
        (and
          (img@71@01 r)
          (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
        $Perm.Write
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@74@01  $FPM) r))
  :qid |qp.resPrmSumDef7|)))
(assert (forall ((i@69@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length res@7@01)) i@69@01)
    (and
      (= (inv@70@01 (Seq_index res@7@01 i@69@01)) i@69@01)
      (img@71@01 (Seq_index res@7@01 i@69@01))))
  :pattern ((Seq_index res@7@01 i@69@01))
  :qid |quant-u-24|)))
(assert (forall ((i@69@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length res@7@01)) i@69@01)
    (not (= (Seq_index res@7@01 i@69@01) $Ref.null)))
  :pattern ((Seq_index res@7@01 i@69@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))))
  $Snap.unit))
(assert (forall ((i@72@01 Int)) (!
  (and
    (=>
      (<= 0 i@72@01)
      (and (<= 0 i@72@01) (or (= (mod i@72@01 2) 0) (not (= (mod i@72@01 2) 0)))))
    (or (<= 0 i@72@01) (not (<= 0 i@72@01)))
    (=>
      (and (<= 0 i@72@01) (and (= (mod i@72@01 2) 0) (< i@72@01 k@61@01)))
      (and (<= 0 i@72@01) (= (mod i@72@01 2) 0) (< i@72@01 k@61@01)))
    (or
      (not (and (<= 0 i@72@01) (and (= (mod i@72@01 2) 0) (< i@72@01 k@61@01))))
      (and (<= 0 i@72@01) (and (= (mod i@72@01 2) 0) (< i@72@01 k@61@01)))))
  :pattern ((Seq_index res@7@01 i@72@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@74@16@74@131-aux|)))
(assert (forall ((i@72@01 Int)) (!
  (=>
    (and (<= 0 i@72@01) (and (= (mod i@72@01 2) 0) (< i@72@01 k@61@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) (Seq_index
        res@7@01
        i@72@01))
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) (Seq_index
        a@5@01
        (div i@72@01 2)))))
  :pattern ((Seq_index res@7@01 i@72@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@74@16@74@131|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))))
  $Snap.unit))
(assert (forall ((i@75@01 Int)) (!
  (and
    (=>
      (<= 0 i@75@01)
      (and (<= 0 i@75@01) (or (= (mod i@75@01 2) 1) (not (= (mod i@75@01 2) 1)))))
    (or (<= 0 i@75@01) (not (<= 0 i@75@01)))
    (=>
      (and (<= 0 i@75@01) (and (= (mod i@75@01 2) 1) (< i@75@01 k@61@01)))
      (and (<= 0 i@75@01) (= (mod i@75@01 2) 1) (< i@75@01 k@61@01)))
    (or
      (not (and (<= 0 i@75@01) (and (= (mod i@75@01 2) 1) (< i@75@01 k@61@01))))
      (and (<= 0 i@75@01) (and (= (mod i@75@01 2) 1) (< i@75@01 k@61@01)))))
  :pattern ((Seq_index res@7@01 i@75@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@75@16@75@131-aux|)))
(assert (forall ((i@75@01 Int)) (!
  (=>
    (and (<= 0 i@75@01) (and (= (mod i@75@01 2) 1) (< i@75@01 k@61@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) (Seq_index
        res@7@01
        i@75@01))
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) (Seq_index
        b@6@01
        (div i@75@01 2)))))
  :pattern ((Seq_index res@7@01 i@75@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@75@16@75@131|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))))))
  $Snap.unit))
(assert (forall ((i@76@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 (div k@61@01 2)) i@76@01))
    (Seq_contains (Seq_range 0 (div k@61@01 2)) i@76@01))
  :pattern ((Seq_index a@5@01 i@76@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@76@16@76@113-aux|)))
(assert (forall ((i@76@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (div k@61@01 2)) i@76@01)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) (Seq_index
        res@7@01
        (* 2 i@76@01)))
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) (Seq_index
        a@5@01
        i@76@01))))
  :pattern ((Seq_index a@5@01 i@76@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@76@16@76@113|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))))))
  $Snap.unit))
(assert (forall ((i@77@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 (div k@61@01 2)) i@77@01))
    (Seq_contains (Seq_range 0 (div k@61@01 2)) i@77@01))
  :pattern ((Seq_index b@6@01 i@77@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@77@16@77@117-aux|)))
(assert (forall ((i@77@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (div k@61@01 2)) i@77@01)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) (Seq_index
        res@7@01
        (+ (* 2 i@77@01) 1)))
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) (Seq_index
        b@6@01
        i@77@01))))
  :pattern ((Seq_index b@6@01 i@77@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@77@16@77@117|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@68@01 r)
      (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
    (= (Seq_index b@6@01 (inv@67@01 r)) r))
  :pattern ((inv@67@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(assert (forall ((i@66@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length b@6@01)) i@66@01)
    (and
      (= (inv@67@01 (Seq_index b@6@01 i@66@01)) i@66@01)
      (img@68@01 (Seq_index b@6@01 i@66@01))))
  :pattern ((Seq_index b@6@01 i@66@01))
  :qid |quant-u-21|)))
(assert (forall ((i@66@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length b@6@01)) i@66@01)
    (not (= (Seq_index b@6@01 i@66@01) $Ref.null)))
  :pattern ((Seq_index b@6@01 i@66@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))))))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@65@01 r)
      (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
    (= (Seq_index a@5@01 (inv@64@01 r)) r))
  :pattern ((inv@64@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(assert (forall ((i@63@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length a@5@01)) i@63@01)
    (and
      (= (inv@64@01 (Seq_index a@5@01 i@63@01)) i@63@01)
      (img@65@01 (Seq_index a@5@01 i@63@01))))
  :pattern ((Seq_index a@5@01 i@63@01))
  :qid |quant-u-19|)))
(assert (forall ((i@63@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length a@5@01)) i@63@01)
    (not (= (Seq_index a@5@01 i@63@01) $Ref.null)))
  :pattern ((Seq_index a@5@01 i@63@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))))
(assert (= $t@62@01 ($Snap.combine ($Snap.first $t@62@01) ($Snap.second $t@62@01))))
(assert (= ($Snap.first $t@62@01) $Snap.unit))
(assert (<= 0 k@61@01))
(assert (=
  ($Snap.second $t@62@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@62@01))
    ($Snap.second ($Snap.second $t@62@01)))))
(assert (= ($Snap.first ($Snap.second $t@62@01)) $Snap.unit))
(assert (= (mod k@61@01 2) 0))
(assert (=
  ($Snap.second ($Snap.second $t@62@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@62@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@62@01))) $Snap.unit))
(assert (<= k@61@01 (Seq_length res@7@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@62@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@62@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@62@01))))
  $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))
  $Snap.unit))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))))
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
; [eval] k < |res|
; [eval] |res|
(pop) ; 5
(push) ; 5
; [eval] !(k < |res|)
; [eval] k < |res|
; [eval] |res|
(pop) ; 5
; Loop head block: Follow loop-internal edges
; [eval] k < |res|
; [eval] |res|
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< k@61@01 (Seq_length res@7@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (< k@61@01 (Seq_length res@7@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 39 | k@61@01 < |res@7@01| | live]
; [else-branch: 39 | !(k@61@01 < |res@7@01|) | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 39 | k@61@01 < |res@7@01|]
(assert (< k@61@01 (Seq_length res@7@01)))
; [exec]
; __flatten_5 := a[k / 2]
; [eval] a[k / 2]
; [eval] k / 2
(push) ; 6
(assert (not (>= (div k@61@01 2) 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< (div k@61@01 2) (Seq_length a@5@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_5@100@01 $Ref)
(assert (= __flatten_5@100@01 (Seq_index a@5@01 (div k@61@01 2))))
; [exec]
; __flatten_4 := __flatten_5.Ref__Integer_value
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@65@01 r)
        (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r))
    :qid |qp.fvfValDef4|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@68@01 r)
        (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r))
    :qid |qp.fvfValDef5|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@71@01 r)
        (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r))
    :qid |qp.fvfValDef6|))))
(push) ; 6
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and
          (img@65@01 __flatten_5@100@01)
          (Seq_contains
            (Seq_range 0 (Seq_length a@5@01))
            (inv@64@01 __flatten_5@100@01)))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@68@01 __flatten_5@100@01)
          (Seq_contains
            (Seq_range 0 (Seq_length b@6@01))
            (inv@67@01 __flatten_5@100@01)))
        $Perm.Write
        $Perm.No))
    (ite
      (and
        (img@71@01 __flatten_5@100@01)
        (Seq_contains
          (Seq_range 0 (Seq_length res@7@01))
          (inv@70@01 __flatten_5@100@01)))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_4@101@01 Int)
(assert (=
  __flatten_4@101@01
  ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) __flatten_5@100@01)))
; [exec]
; __flatten_1 := __flatten_4
; [exec]
; __flatten_6 := res[k]
; [eval] res[k]
(push) ; 6
(assert (not (>= k@61@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_6@102@01 $Ref)
(assert (= __flatten_6@102@01 (Seq_index res@7@01 k@61@01)))
; [exec]
; __flatten_6.Ref__Integer_value := __flatten_1
; Precomputing data for removing quantified permissions
(define-fun pTaken@103@01 ((r $Ref)) $Perm
  (ite
    (= r __flatten_6@102@01)
    ($Perm.min
      (ite
        (and
          (img@65@01 r)
          (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@104@01 ((r $Ref)) $Perm
  (ite
    (= r __flatten_6@102@01)
    ($Perm.min
      (ite
        (and
          (img@68@01 r)
          (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@103@01 r)))
    $Perm.No))
(define-fun pTaken@105@01 ((r $Ref)) $Perm
  (ite
    (= r __flatten_6@102@01)
    ($Perm.min
      (ite
        (and
          (img@71@01 r)
          (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
        $Perm.Write
        $Perm.No)
      (- (- $Perm.Write (pTaken@103@01 r)) (pTaken@104@01 r)))
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
          (img@65@01 r)
          (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@103@01 r))
    $Perm.No)
  
  :qid |quant-u-43|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@103@01 r) $Perm.No)
  
  :qid |quant-u-44|))))
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
  (=> (= r __flatten_6@102@01) (= (- $Perm.Write (pTaken@103@01 r)) $Perm.No))
  
  :qid |quant-u-45|))))
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
          (img@68@01 r)
          (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@104@01 r))
    $Perm.No)
  
  :qid |quant-u-46|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@104@01 r) $Perm.No)
  
  :qid |quant-u-47|))))
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
  (=>
    (= r __flatten_6@102@01)
    (= (- (- $Perm.Write (pTaken@103@01 r)) (pTaken@104@01 r)) $Perm.No))
  
  :qid |quant-u-48|))))
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
          (img@71@01 r)
          (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@105@01 r))
    $Perm.No)
  
  :qid |quant-u-49|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@105@01 r) $Perm.No)
  
  :qid |quant-u-50|))))
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
  (=>
    (= r __flatten_6@102@01)
    (=
      (-
        (- (- $Perm.Write (pTaken@103@01 r)) (pTaken@104@01 r))
        (pTaken@105@01 r))
      $Perm.No))
  
  :qid |quant-u-51|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@106@01 $FVF<Ref__Integer_value>)
; Definitional axioms for singleton-FVF's value
(assert (=
  ($FVF.lookup_Ref__Integer_value (as sm@106@01  $FVF<Ref__Integer_value>) __flatten_6@102@01)
  __flatten_4@101@01))
; [exec]
; __flatten_8 := b[k / 2]
; [eval] b[k / 2]
; [eval] k / 2
(set-option :timeout 0)
(push) ; 6
(assert (not (>= (div k@61@01 2) 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< (div k@61@01 2) (Seq_length b@6@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_8@107@01 $Ref)
(assert (= __flatten_8@107@01 (Seq_index b@6@01 (div k@61@01 2))))
; [exec]
; __flatten_7 := __flatten_8.Ref__Integer_value
(declare-const sm@108@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r __flatten_6@102@01)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@108@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value (as sm@106@01  $FVF<Ref__Integer_value>) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@108@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@106@01  $FVF<Ref__Integer_value>) r))
  :qid |qp.fvfValDef14|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@71@01 r)
        (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@105@01 r)))
      false)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@108@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@108@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r))
  :qid |qp.fvfValDef15|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@68@01 r)
        (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@104@01 r)))
      false)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@108@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@108@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r))
  :qid |qp.fvfValDef16|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@65@01 r)
        (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@103@01 r)))
      false)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@108@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@108@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r))
  :qid |qp.fvfValDef17|)))
(declare-const pm@109@01 $FPM)
(assert (forall ((r $Ref)) (!
  (=
    ($FVF.perm_Ref__Integer_value (as pm@109@01  $FPM) r)
    (+
      (+
        (+
          (ite (= r __flatten_6@102@01) $Perm.Write $Perm.No)
          (ite
            (and
              (img@71@01 r)
              (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
            (- $Perm.Write (pTaken@105@01 r))
            $Perm.No))
        (ite
          (and
            (img@68@01 r)
            (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
          (- $Perm.Write (pTaken@104@01 r))
          $Perm.No))
      (ite
        (and
          (img@65@01 r)
          (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
        (- $Perm.Write (pTaken@103@01 r))
        $Perm.No)))
  :pattern (($FVF.perm_Ref__Integer_value (as pm@109@01  $FPM) r))
  :qid |qp.resPrmSumDef18|)))
(push) ; 6
(assert (not (<
  $Perm.No
  ($FVF.perm_Ref__Integer_value (as pm@109@01  $FPM) __flatten_8@107@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_7@110@01 Int)
(assert (=
  __flatten_7@110@01
  ($FVF.lookup_Ref__Integer_value (as sm@108@01  $FVF<Ref__Integer_value>) __flatten_8@107@01)))
; [exec]
; __flatten_2 := __flatten_7
; [exec]
; __flatten_9 := res[k + 1]
; [eval] res[k + 1]
; [eval] k + 1
(push) ; 6
(assert (not (>= (+ k@61@01 1) 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< (+ k@61@01 1) (Seq_length res@7@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_9@111@01 $Ref)
(assert (= __flatten_9@111@01 (Seq_index res@7@01 (+ k@61@01 1))))
; [exec]
; __flatten_9.Ref__Integer_value := __flatten_2
(push) ; 6
(set-option :timeout 10)
(assert (not (= __flatten_6@102@01 __flatten_9@111@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@112@01 ((r $Ref)) $Perm
  (ite
    (= r __flatten_9@111@01)
    ($Perm.min
      (ite
        (and
          (img@71@01 r)
          (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
        (- $Perm.Write (pTaken@105@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@113@01 ((r $Ref)) $Perm
  (ite
    (= r __flatten_9@111@01)
    ($Perm.min
      (ite
        (and
          (img@68@01 r)
          (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
        (- $Perm.Write (pTaken@104@01 r))
        $Perm.No)
      (- $Perm.Write (pTaken@112@01 r)))
    $Perm.No))
(define-fun pTaken@114@01 ((r $Ref)) $Perm
  (ite
    (= r __flatten_9@111@01)
    ($Perm.min
      (ite
        (and
          (img@65@01 r)
          (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
        (- $Perm.Write (pTaken@103@01 r))
        $Perm.No)
      (- (- $Perm.Write (pTaken@112@01 r)) (pTaken@113@01 r)))
    $Perm.No))
(define-fun pTaken@115@01 ((r $Ref)) $Perm
  (ite
    (= r __flatten_9@111@01)
    ($Perm.min
      (ite (= r __flatten_6@102@01) $Perm.Write $Perm.No)
      (-
        (- (- $Perm.Write (pTaken@112@01 r)) (pTaken@113@01 r))
        (pTaken@114@01 r)))
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
          (img@71@01 r)
          (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
        (- $Perm.Write (pTaken@105@01 r))
        $Perm.No)
      (pTaken@112@01 r))
    $Perm.No)
  
  :qid |quant-u-53|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@112@01 r) $Perm.No)
  
  :qid |quant-u-54|))))
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
  (=> (= r __flatten_9@111@01) (= (- $Perm.Write (pTaken@112@01 r)) $Perm.No))
  
  :qid |quant-u-55|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@116@01 $FVF<Ref__Integer_value>)
; Definitional axioms for singleton-FVF's value
(assert (=
  ($FVF.lookup_Ref__Integer_value (as sm@116@01  $FVF<Ref__Integer_value>) __flatten_9@111@01)
  __flatten_7@110@01))
; [exec]
; __flatten_10 := k + 2
; [eval] k + 2
(declare-const __flatten_10@117@01 Int)
(assert (= __flatten_10@117@01 (+ k@61@01 2)))
; [exec]
; __flatten_3 := __flatten_10
; [exec]
; k := __flatten_3
; Loop head block: Re-establish invariant
; [eval] 0 <= k
(set-option :timeout 0)
(push) ; 6
(assert (not (<= 0 __flatten_10@117@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (<= 0 __flatten_10@117@01))
; [eval] k % 2 == 0
; [eval] k % 2
(push) ; 6
(assert (not (= (mod __flatten_10@117@01 2) 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (= (mod __flatten_10@117@01 2) 0))
; [eval] k <= |res|
; [eval] |res|
(push) ; 6
(assert (not (<= __flatten_10@117@01 (Seq_length res@7@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (<= __flatten_10@117@01 (Seq_length res@7@01)))
; [eval] |a| == |b|
; [eval] |a|
; [eval] |b|
; [eval] |res| == 2 * |a|
; [eval] |res|
; [eval] 2 * |a|
; [eval] |a|
(declare-const i@118@01 Int)
(push) ; 6
; [eval] (i in [0..|a|))
; [eval] [0..|a|)
; [eval] |a|
(assert (Seq_contains (Seq_range 0 (Seq_length a@5@01)) i@118@01))
; [eval] a[i]
(push) ; 7
(assert (not (>= i@118@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@118@01 (Seq_length a@5@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(declare-fun inv@119@01 ($Ref) Int)
(declare-fun img@120@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 6
(assert (not (forall ((i1@118@01 Int) (i2@118@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length a@5@01)) i1@118@01)
      (Seq_contains (Seq_range 0 (Seq_length a@5@01)) i2@118@01)
      (= (Seq_index a@5@01 i1@118@01) (Seq_index a@5@01 i2@118@01)))
    (= i1@118@01 i2@118@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@118@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length a@5@01)) i@118@01)
    (and
      (= (inv@119@01 (Seq_index a@5@01 i@118@01)) i@118@01)
      (img@120@01 (Seq_index a@5@01 i@118@01))))
  :pattern ((Seq_index a@5@01 i@118@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@120@01 r)
      (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@119@01 r)))
    (= (Seq_index a@5@01 (inv@119@01 r)) r))
  :pattern ((inv@119@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(push) ; 6
(set-option :timeout 10)
(assert (not (forall ((i@118@01 Int)) (!
  (= (Seq_index a@5@01 i@118@01) (Seq_index b@6@01 i@118@01))
  
  :qid |quant-u-57|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (forall ((i@118@01 Int)) (!
  (= (Seq_index a@5@01 i@118@01) (Seq_index res@7@01 i@118@01))
  
  :qid |quant-u-58|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@121@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@119@01 r))
      (img@120@01 r)
      (= r (Seq_index a@5@01 (inv@119@01 r))))
    ($Perm.min
      (ite
        (and
          (img@65@01 r)
          (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
        (- $Perm.Write (pTaken@103@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@122@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@119@01 r))
      (img@120@01 r)
      (= r (Seq_index a@5@01 (inv@119@01 r))))
    ($Perm.min
      (ite (= r __flatten_9@111@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@121@01 r)))
    $Perm.No))
(define-fun pTaken@123@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@119@01 r))
      (img@120@01 r)
      (= r (Seq_index a@5@01 (inv@119@01 r))))
    ($Perm.min
      (ite (= r __flatten_6@102@01) $Perm.Write $Perm.No)
      (- (- $Perm.Write (pTaken@121@01 r)) (pTaken@122@01 r)))
    $Perm.No))
(define-fun pTaken@124@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@119@01 r))
      (img@120@01 r)
      (= r (Seq_index a@5@01 (inv@119@01 r))))
    ($Perm.min
      (ite
        (and
          (img@68@01 r)
          (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
        (- $Perm.Write (pTaken@104@01 r))
        $Perm.No)
      (-
        (- (- $Perm.Write (pTaken@121@01 r)) (pTaken@122@01 r))
        (pTaken@123@01 r)))
    $Perm.No))
(define-fun pTaken@125@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@119@01 r))
      (img@120@01 r)
      (= r (Seq_index a@5@01 (inv@119@01 r))))
    ($Perm.min
      (ite
        (and
          (img@71@01 r)
          (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
        (- (- $Perm.Write (pTaken@105@01 r)) (pTaken@112@01 r))
        $Perm.No)
      (-
        (-
          (- (- $Perm.Write (pTaken@121@01 r)) (pTaken@122@01 r))
          (pTaken@123@01 r))
        (pTaken@124@01 r)))
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
          (img@65@01 r)
          (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
        (- $Perm.Write (pTaken@103@01 r))
        $Perm.No)
      (pTaken@121@01 r))
    $Perm.No)
  
  :qid |quant-u-60|))))
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
      (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@119@01 r))
      (img@120@01 r)
      (= r (Seq_index a@5@01 (inv@119@01 r))))
    (= (- $Perm.Write (pTaken@121@01 r)) $Perm.No))
  
  :qid |quant-u-61|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@122@01 __flatten_9@111@01)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@122@01 r) $Perm.No)
  
  :qid |quant-u-63|))))
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
      (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@119@01 r))
      (img@120@01 r)
      (= r (Seq_index a@5@01 (inv@119@01 r))))
    (= (- (- $Perm.Write (pTaken@121@01 r)) (pTaken@122@01 r)) $Perm.No))
  
  :qid |quant-u-64|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@123@01 __flatten_6@102@01)) $Perm.No)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@123@01 r) $Perm.No)
  
  :qid |quant-u-66|))))
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
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@119@01 r))
      (img@120@01 r)
      (= r (Seq_index a@5@01 (inv@119@01 r))))
    (=
      (-
        (- (- $Perm.Write (pTaken@121@01 r)) (pTaken@122@01 r))
        (pTaken@123@01 r))
      $Perm.No))
  
  :qid |quant-u-67|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@126@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r __flatten_9@111@01)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value (as sm@116@01  $FVF<Ref__Integer_value>) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@116@01  $FVF<Ref__Integer_value>) r))
  :qid |qp.fvfValDef19|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r __flatten_6@102@01)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value (as sm@106@01  $FVF<Ref__Integer_value>) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@106@01  $FVF<Ref__Integer_value>) r))
  :qid |qp.fvfValDef20|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@65@01 r)
        (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@103@01 r)))
      false)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r))
  :qid |qp.fvfValDef21|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@68@01 r)
        (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@104@01 r)))
      false)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r))
  :qid |qp.fvfValDef22|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@71@01 r)
        (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
      (< $Perm.No (- (- $Perm.Write (pTaken@105@01 r)) (pTaken@112@01 r)))
      false)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r))
  :qid |qp.fvfValDef23|)))
(declare-const i@127@01 Int)
(set-option :timeout 0)
(push) ; 6
; [eval] (i in [0..|b|))
; [eval] [0..|b|)
; [eval] |b|
(assert (Seq_contains (Seq_range 0 (Seq_length b@6@01)) i@127@01))
; [eval] b[i]
(push) ; 7
(assert (not (>= i@127@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@127@01 (Seq_length b@6@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(declare-fun inv@128@01 ($Ref) Int)
(declare-fun img@129@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 6
(assert (not (forall ((i1@127@01 Int) (i2@127@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length b@6@01)) i1@127@01)
      (Seq_contains (Seq_range 0 (Seq_length b@6@01)) i2@127@01)
      (= (Seq_index b@6@01 i1@127@01) (Seq_index b@6@01 i2@127@01)))
    (= i1@127@01 i2@127@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@127@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length b@6@01)) i@127@01)
    (and
      (= (inv@128@01 (Seq_index b@6@01 i@127@01)) i@127@01)
      (img@129@01 (Seq_index b@6@01 i@127@01))))
  :pattern ((Seq_index b@6@01 i@127@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@129@01 r)
      (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@128@01 r)))
    (= (Seq_index b@6@01 (inv@128@01 r)) r))
  :pattern ((inv@128@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(push) ; 6
(set-option :timeout 10)
(assert (not (forall ((i@127@01 Int)) (!
  (= (Seq_index b@6@01 i@127@01) (Seq_index res@7@01 i@127@01))
  
  :qid |quant-u-69|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@130@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@128@01 r))
      (img@129@01 r)
      (= r (Seq_index b@6@01 (inv@128@01 r))))
    ($Perm.min
      (ite
        (and
          (img@68@01 r)
          (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
        (- $Perm.Write (pTaken@104@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@131@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@128@01 r))
      (img@129@01 r)
      (= r (Seq_index b@6@01 (inv@128@01 r))))
    ($Perm.min
      (ite
        (and
          (img@71@01 r)
          (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
        (- (- $Perm.Write (pTaken@105@01 r)) (pTaken@112@01 r))
        $Perm.No)
      (- $Perm.Write (pTaken@130@01 r)))
    $Perm.No))
(define-fun pTaken@132@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@128@01 r))
      (img@129@01 r)
      (= r (Seq_index b@6@01 (inv@128@01 r))))
    ($Perm.min
      (ite (= r __flatten_6@102@01) (- $Perm.Write (pTaken@123@01 r)) $Perm.No)
      (- (- $Perm.Write (pTaken@130@01 r)) (pTaken@131@01 r)))
    $Perm.No))
(define-fun pTaken@133@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@128@01 r))
      (img@129@01 r)
      (= r (Seq_index b@6@01 (inv@128@01 r))))
    ($Perm.min
      (ite (= r __flatten_9@111@01) $Perm.Write $Perm.No)
      (-
        (- (- $Perm.Write (pTaken@130@01 r)) (pTaken@131@01 r))
        (pTaken@132@01 r)))
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
          (img@68@01 r)
          (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
        (- $Perm.Write (pTaken@104@01 r))
        $Perm.No)
      (pTaken@130@01 r))
    $Perm.No)
  
  :qid |quant-u-71|))))
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
      (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@128@01 r))
      (img@129@01 r)
      (= r (Seq_index b@6@01 (inv@128@01 r))))
    (= (- $Perm.Write (pTaken@130@01 r)) $Perm.No))
  
  :qid |quant-u-72|))))
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
          (img@71@01 r)
          (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
        (- (- $Perm.Write (pTaken@105@01 r)) (pTaken@112@01 r))
        $Perm.No)
      (pTaken@131@01 r))
    $Perm.No)
  
  :qid |quant-u-73|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@131@01 r) $Perm.No)
  
  :qid |quant-u-74|))))
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
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@128@01 r))
      (img@129@01 r)
      (= r (Seq_index b@6@01 (inv@128@01 r))))
    (= (- (- $Perm.Write (pTaken@130@01 r)) (pTaken@131@01 r)) $Perm.No))
  
  :qid |quant-u-75|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@134@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@71@01 r)
        (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
      (< $Perm.No (- (- $Perm.Write (pTaken@105@01 r)) (pTaken@112@01 r)))
      false)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@134@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@134@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r))
  :qid |qp.fvfValDef24|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@68@01 r)
        (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@104@01 r)))
      false)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@134@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@134@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r))
  :qid |qp.fvfValDef25|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (= r __flatten_6@102@01)
      (< $Perm.No (- $Perm.Write (pTaken@123@01 r)))
      false)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@134@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value (as sm@106@01  $FVF<Ref__Integer_value>) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@134@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@106@01  $FVF<Ref__Integer_value>) r))
  :qid |qp.fvfValDef26|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r __flatten_9@111@01)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@134@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value (as sm@116@01  $FVF<Ref__Integer_value>) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@134@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@116@01  $FVF<Ref__Integer_value>) r))
  :qid |qp.fvfValDef27|)))
(declare-const i@135@01 Int)
(set-option :timeout 0)
(push) ; 6
; [eval] (i in [0..|res|))
; [eval] [0..|res|)
; [eval] |res|
(assert (Seq_contains (Seq_range 0 (Seq_length res@7@01)) i@135@01))
; [eval] res[i]
(push) ; 7
(assert (not (>= i@135@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@135@01 (Seq_length res@7@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(declare-fun inv@136@01 ($Ref) Int)
(declare-fun img@137@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 6
(assert (not (forall ((i1@135@01 Int) (i2@135@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length res@7@01)) i1@135@01)
      (Seq_contains (Seq_range 0 (Seq_length res@7@01)) i2@135@01)
      (= (Seq_index res@7@01 i1@135@01) (Seq_index res@7@01 i2@135@01)))
    (= i1@135@01 i2@135@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@135@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length res@7@01)) i@135@01)
    (and
      (= (inv@136@01 (Seq_index res@7@01 i@135@01)) i@135@01)
      (img@137@01 (Seq_index res@7@01 i@135@01))))
  :pattern ((Seq_index res@7@01 i@135@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@137@01 r)
      (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@136@01 r)))
    (= (Seq_index res@7@01 (inv@136@01 r)) r))
  :pattern ((inv@136@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@138@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@136@01 r))
      (img@137@01 r)
      (= r (Seq_index res@7@01 (inv@136@01 r))))
    ($Perm.min
      (ite
        (and
          (img@71@01 r)
          (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
        (-
          (- (- $Perm.Write (pTaken@105@01 r)) (pTaken@112@01 r))
          (pTaken@131@01 r))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@139@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@136@01 r))
      (img@137@01 r)
      (= r (Seq_index res@7@01 (inv@136@01 r))))
    ($Perm.min
      (ite (= r __flatten_9@111@01) $Perm.Write $Perm.No)
      (- $Perm.Write (pTaken@138@01 r)))
    $Perm.No))
(define-fun pTaken@140@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@136@01 r))
      (img@137@01 r)
      (= r (Seq_index res@7@01 (inv@136@01 r))))
    ($Perm.min
      (ite (= r __flatten_6@102@01) (- $Perm.Write (pTaken@123@01 r)) $Perm.No)
      (- (- $Perm.Write (pTaken@138@01 r)) (pTaken@139@01 r)))
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
          (img@71@01 r)
          (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
        (-
          (- (- $Perm.Write (pTaken@105@01 r)) (pTaken@112@01 r))
          (pTaken@131@01 r))
        $Perm.No)
      (pTaken@138@01 r))
    $Perm.No)
  
  :qid |quant-u-78|))))
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
      (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@136@01 r))
      (img@137@01 r)
      (= r (Seq_index res@7@01 (inv@136@01 r))))
    (= (- $Perm.Write (pTaken@138@01 r)) $Perm.No))
  
  :qid |quant-u-79|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (= (- $Perm.Write (pTaken@139@01 __flatten_9@111@01)) $Perm.No)))
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
      (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@136@01 r))
      (img@137@01 r)
      (= r (Seq_index res@7@01 (inv@136@01 r))))
    (= (- (- $Perm.Write (pTaken@138@01 r)) (pTaken@139@01 r)) $Perm.No))
  
  :qid |quant-u-81|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 500)
(assert (not (=
  (-
    (- $Perm.Write (pTaken@123@01 __flatten_6@102@01))
    (pTaken@140@01 __flatten_6@102@01))
  $Perm.No)))
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
      (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@136@01 r))
      (img@137@01 r)
      (= r (Seq_index res@7@01 (inv@136@01 r))))
    (=
      (-
        (- (- $Perm.Write (pTaken@138@01 r)) (pTaken@139@01 r))
        (pTaken@140@01 r))
      $Perm.No))
  
  :qid |quant-u-83|))))
(check-sat)
; unsat
(pop) ; 6
; 0,01s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@141@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (= r __flatten_9@111@01)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@141@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value (as sm@116@01  $FVF<Ref__Integer_value>) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@141@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@116@01  $FVF<Ref__Integer_value>) r))
  :qid |qp.fvfValDef28|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (= r __flatten_6@102@01)
      (< $Perm.No (- $Perm.Write (pTaken@123@01 r)))
      false)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@141@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value (as sm@106@01  $FVF<Ref__Integer_value>) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@141@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@106@01  $FVF<Ref__Integer_value>) r))
  :qid |qp.fvfValDef29|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@71@01 r)
        (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
      (<
        $Perm.No
        (-
          (- (- $Perm.Write (pTaken@105@01 r)) (pTaken@112@01 r))
          (pTaken@131@01 r)))
      false)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@141@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@141@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r))
  :qid |qp.fvfValDef30|)))
; [eval] (forall i: Int :: { res[i] } 0 <= i && (i % 2 == 0 && i < k) ==> res[i].Ref__Integer_value == a[i / 2].Ref__Integer_value)
(declare-const i@142@01 Int)
(set-option :timeout 0)
(push) ; 6
; [eval] 0 <= i && (i % 2 == 0 && i < k) ==> res[i].Ref__Integer_value == a[i / 2].Ref__Integer_value
; [eval] 0 <= i && (i % 2 == 0 && i < k)
; [eval] 0 <= i
(push) ; 7
; [then-branch: 40 | !(0 <= i@142@01) | live]
; [else-branch: 40 | 0 <= i@142@01 | live]
(push) ; 8
; [then-branch: 40 | !(0 <= i@142@01)]
(assert (not (<= 0 i@142@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 40 | 0 <= i@142@01]
(assert (<= 0 i@142@01))
; [eval] i % 2 == 0
; [eval] i % 2
(push) ; 9
; [then-branch: 41 | i@142@01 % 2 != 0 | live]
; [else-branch: 41 | i@142@01 % 2 == 0 | live]
(push) ; 10
; [then-branch: 41 | i@142@01 % 2 != 0]
(assert (not (= (mod i@142@01 2) 0)))
(pop) ; 10
(push) ; 10
; [else-branch: 41 | i@142@01 % 2 == 0]
(assert (= (mod i@142@01 2) 0))
; [eval] i < k
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (= (mod i@142@01 2) 0) (not (= (mod i@142@01 2) 0))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i@142@01)
  (and (<= 0 i@142@01) (or (= (mod i@142@01 2) 0) (not (= (mod i@142@01 2) 0))))))
(assert (or (<= 0 i@142@01) (not (<= 0 i@142@01))))
(push) ; 7
; [then-branch: 42 | 0 <= i@142@01 && i@142@01 % 2 == 0 && i@142@01 < __flatten_10@117@01 | live]
; [else-branch: 42 | !(0 <= i@142@01 && i@142@01 % 2 == 0 && i@142@01 < __flatten_10@117@01) | live]
(push) ; 8
; [then-branch: 42 | 0 <= i@142@01 && i@142@01 % 2 == 0 && i@142@01 < __flatten_10@117@01]
(assert (and
  (<= 0 i@142@01)
  (and (= (mod i@142@01 2) 0) (< i@142@01 __flatten_10@117@01))))
; [eval] res[i].Ref__Integer_value == a[i / 2].Ref__Integer_value
; [eval] res[i]
(push) ; 9
(assert (not (>= i@142@01 0)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(push) ; 9
(assert (not (< i@142@01 (Seq_length res@7@01))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r __flatten_9@111@01)
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value (as sm@116@01  $FVF<Ref__Integer_value>) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@116@01  $FVF<Ref__Integer_value>) r))
    :qid |qp.fvfValDef19|))
  (forall ((r $Ref)) (!
    (=>
      (= r __flatten_6@102@01)
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value (as sm@106@01  $FVF<Ref__Integer_value>) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@106@01  $FVF<Ref__Integer_value>) r))
    :qid |qp.fvfValDef20|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and
          (img@65@01 r)
          (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
        (< $Perm.No (- $Perm.Write (pTaken@103@01 r)))
        false)
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r))
    :qid |qp.fvfValDef21|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and
          (img@68@01 r)
          (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
        (< $Perm.No (- $Perm.Write (pTaken@104@01 r)))
        false)
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r))
    :qid |qp.fvfValDef22|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and
          (img@71@01 r)
          (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
        (< $Perm.No (- (- $Perm.Write (pTaken@105@01 r)) (pTaken@112@01 r)))
        false)
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r))
    :qid |qp.fvfValDef23|))))
(push) ; 9
(assert (not (<
  $Perm.No
  (+
    (+
      (+
        (+
          (ite
            (= (Seq_index res@7@01 i@142@01) __flatten_9@111@01)
            $Perm.Write
            $Perm.No)
          (ite
            (= (Seq_index res@7@01 i@142@01) __flatten_6@102@01)
            $Perm.Write
            $Perm.No))
        (ite
          (and
            (img@65@01 (Seq_index res@7@01 i@142@01))
            (Seq_contains
              (Seq_range 0 (Seq_length a@5@01))
              (inv@64@01 (Seq_index res@7@01 i@142@01))))
          (- $Perm.Write (pTaken@103@01 (Seq_index res@7@01 i@142@01)))
          $Perm.No))
      (ite
        (and
          (img@68@01 (Seq_index res@7@01 i@142@01))
          (Seq_contains
            (Seq_range 0 (Seq_length b@6@01))
            (inv@67@01 (Seq_index res@7@01 i@142@01))))
        (- $Perm.Write (pTaken@104@01 (Seq_index res@7@01 i@142@01)))
        $Perm.No))
    (ite
      (and
        (img@71@01 (Seq_index res@7@01 i@142@01))
        (Seq_contains
          (Seq_range 0 (Seq_length res@7@01))
          (inv@70@01 (Seq_index res@7@01 i@142@01))))
      (-
        (- $Perm.Write (pTaken@105@01 (Seq_index res@7@01 i@142@01)))
        (pTaken@112@01 (Seq_index res@7@01 i@142@01)))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [eval] a[i / 2]
; [eval] i / 2
(push) ; 9
(assert (not (>= (div i@142@01 2) 0)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(push) ; 9
(assert (not (< (div i@142@01 2) (Seq_length a@5@01))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r __flatten_9@111@01)
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value (as sm@116@01  $FVF<Ref__Integer_value>) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@116@01  $FVF<Ref__Integer_value>) r))
    :qid |qp.fvfValDef19|))
  (forall ((r $Ref)) (!
    (=>
      (= r __flatten_6@102@01)
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value (as sm@106@01  $FVF<Ref__Integer_value>) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@106@01  $FVF<Ref__Integer_value>) r))
    :qid |qp.fvfValDef20|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and
          (img@65@01 r)
          (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
        (< $Perm.No (- $Perm.Write (pTaken@103@01 r)))
        false)
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r))
    :qid |qp.fvfValDef21|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and
          (img@68@01 r)
          (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
        (< $Perm.No (- $Perm.Write (pTaken@104@01 r)))
        false)
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r))
    :qid |qp.fvfValDef22|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and
          (img@71@01 r)
          (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
        (< $Perm.No (- (- $Perm.Write (pTaken@105@01 r)) (pTaken@112@01 r)))
        false)
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r))
    :qid |qp.fvfValDef23|))))
(push) ; 9
(assert (not (<
  $Perm.No
  (+
    (+
      (+
        (+
          (ite
            (= (Seq_index a@5@01 (div i@142@01 2)) __flatten_9@111@01)
            $Perm.Write
            $Perm.No)
          (ite
            (= (Seq_index a@5@01 (div i@142@01 2)) __flatten_6@102@01)
            $Perm.Write
            $Perm.No))
        (ite
          (and
            (img@65@01 (Seq_index a@5@01 (div i@142@01 2)))
            (Seq_contains
              (Seq_range 0 (Seq_length a@5@01))
              (inv@64@01 (Seq_index a@5@01 (div i@142@01 2)))))
          (- $Perm.Write (pTaken@103@01 (Seq_index a@5@01 (div i@142@01 2))))
          $Perm.No))
      (ite
        (and
          (img@68@01 (Seq_index a@5@01 (div i@142@01 2)))
          (Seq_contains
            (Seq_range 0 (Seq_length b@6@01))
            (inv@67@01 (Seq_index a@5@01 (div i@142@01 2)))))
        (- $Perm.Write (pTaken@104@01 (Seq_index a@5@01 (div i@142@01 2))))
        $Perm.No))
    (ite
      (and
        (img@71@01 (Seq_index a@5@01 (div i@142@01 2)))
        (Seq_contains
          (Seq_range 0 (Seq_length res@7@01))
          (inv@70@01 (Seq_index a@5@01 (div i@142@01 2)))))
      (-
        (- $Perm.Write (pTaken@105@01 (Seq_index a@5@01 (div i@142@01 2))))
        (pTaken@112@01 (Seq_index a@5@01 (div i@142@01 2))))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(pop) ; 8
(push) ; 8
; [else-branch: 42 | !(0 <= i@142@01 && i@142@01 % 2 == 0 && i@142@01 < __flatten_10@117@01)]
(assert (not
  (and
    (<= 0 i@142@01)
    (and (= (mod i@142@01 2) 0) (< i@142@01 __flatten_10@117@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r __flatten_9@111@01)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value (as sm@116@01  $FVF<Ref__Integer_value>) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@116@01  $FVF<Ref__Integer_value>) r))
  :qid |qp.fvfValDef19|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r __flatten_6@102@01)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value (as sm@106@01  $FVF<Ref__Integer_value>) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@106@01  $FVF<Ref__Integer_value>) r))
  :qid |qp.fvfValDef20|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@65@01 r)
        (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@103@01 r)))
      false)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r))
  :qid |qp.fvfValDef21|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@68@01 r)
        (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@104@01 r)))
      false)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r))
  :qid |qp.fvfValDef22|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@71@01 r)
        (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
      (< $Perm.No (- (- $Perm.Write (pTaken@105@01 r)) (pTaken@112@01 r)))
      false)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r))
  :qid |qp.fvfValDef23|)))
(assert (=>
  (and
    (<= 0 i@142@01)
    (and (= (mod i@142@01 2) 0) (< i@142@01 __flatten_10@117@01)))
  (and (<= 0 i@142@01) (= (mod i@142@01 2) 0) (< i@142@01 __flatten_10@117@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i@142@01)
      (and (= (mod i@142@01 2) 0) (< i@142@01 __flatten_10@117@01))))
  (and
    (<= 0 i@142@01)
    (and (= (mod i@142@01 2) 0) (< i@142@01 __flatten_10@117@01)))))
(pop) ; 6
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (= r __flatten_9@111@01)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value (as sm@116@01  $FVF<Ref__Integer_value>) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@116@01  $FVF<Ref__Integer_value>) r))
  :qid |qp.fvfValDef19|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r __flatten_6@102@01)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value (as sm@106@01  $FVF<Ref__Integer_value>) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@106@01  $FVF<Ref__Integer_value>) r))
  :qid |qp.fvfValDef20|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@65@01 r)
        (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@103@01 r)))
      false)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r))
  :qid |qp.fvfValDef21|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@68@01 r)
        (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@104@01 r)))
      false)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r))
  :qid |qp.fvfValDef22|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@71@01 r)
        (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
      (< $Perm.No (- (- $Perm.Write (pTaken@105@01 r)) (pTaken@112@01 r)))
      false)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r))
  :qid |qp.fvfValDef23|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@142@01 Int)) (!
  (and
    (=>
      (<= 0 i@142@01)
      (and
        (<= 0 i@142@01)
        (or (= (mod i@142@01 2) 0) (not (= (mod i@142@01 2) 0)))))
    (or (<= 0 i@142@01) (not (<= 0 i@142@01)))
    (=>
      (and
        (<= 0 i@142@01)
        (and (= (mod i@142@01 2) 0) (< i@142@01 __flatten_10@117@01)))
      (and
        (<= 0 i@142@01)
        (= (mod i@142@01 2) 0)
        (< i@142@01 __flatten_10@117@01)))
    (or
      (not
        (and
          (<= 0 i@142@01)
          (and (= (mod i@142@01 2) 0) (< i@142@01 __flatten_10@117@01))))
      (and
        (<= 0 i@142@01)
        (and (= (mod i@142@01 2) 0) (< i@142@01 __flatten_10@117@01)))))
  :pattern ((Seq_index res@7@01 i@142@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@74@16@74@131-aux|)))
(push) ; 6
(assert (not (forall ((i@142@01 Int)) (!
  (=>
    (and
      (<= 0 i@142@01)
      (and (= (mod i@142@01 2) 0) (< i@142@01 __flatten_10@117@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) (Seq_index
        res@7@01
        i@142@01))
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) (Seq_index
        a@5@01
        (div i@142@01 2)))))
  :pattern ((Seq_index res@7@01 i@142@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@74@16@74@131|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@142@01 Int)) (!
  (=>
    (and
      (<= 0 i@142@01)
      (and (= (mod i@142@01 2) 0) (< i@142@01 __flatten_10@117@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) (Seq_index
        res@7@01
        i@142@01))
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) (Seq_index
        a@5@01
        (div i@142@01 2)))))
  :pattern ((Seq_index res@7@01 i@142@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@74@16@74@131|)))
; [eval] (forall i: Int :: { res[i] } 0 <= i && (i % 2 == 1 && i < k) ==> res[i].Ref__Integer_value == b[i / 2].Ref__Integer_value)
(declare-const i@143@01 Int)
(push) ; 6
; [eval] 0 <= i && (i % 2 == 1 && i < k) ==> res[i].Ref__Integer_value == b[i / 2].Ref__Integer_value
; [eval] 0 <= i && (i % 2 == 1 && i < k)
; [eval] 0 <= i
(push) ; 7
; [then-branch: 43 | !(0 <= i@143@01) | live]
; [else-branch: 43 | 0 <= i@143@01 | live]
(push) ; 8
; [then-branch: 43 | !(0 <= i@143@01)]
(assert (not (<= 0 i@143@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 43 | 0 <= i@143@01]
(assert (<= 0 i@143@01))
; [eval] i % 2 == 1
; [eval] i % 2
(push) ; 9
; [then-branch: 44 | i@143@01 % 2 != 1 | live]
; [else-branch: 44 | i@143@01 % 2 == 1 | live]
(push) ; 10
; [then-branch: 44 | i@143@01 % 2 != 1]
(assert (not (= (mod i@143@01 2) 1)))
(pop) ; 10
(push) ; 10
; [else-branch: 44 | i@143@01 % 2 == 1]
(assert (= (mod i@143@01 2) 1))
; [eval] i < k
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (= (mod i@143@01 2) 1) (not (= (mod i@143@01 2) 1))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i@143@01)
  (and (<= 0 i@143@01) (or (= (mod i@143@01 2) 1) (not (= (mod i@143@01 2) 1))))))
(assert (or (<= 0 i@143@01) (not (<= 0 i@143@01))))
(push) ; 7
; [then-branch: 45 | 0 <= i@143@01 && i@143@01 % 2 == 1 && i@143@01 < __flatten_10@117@01 | live]
; [else-branch: 45 | !(0 <= i@143@01 && i@143@01 % 2 == 1 && i@143@01 < __flatten_10@117@01) | live]
(push) ; 8
; [then-branch: 45 | 0 <= i@143@01 && i@143@01 % 2 == 1 && i@143@01 < __flatten_10@117@01]
(assert (and
  (<= 0 i@143@01)
  (and (= (mod i@143@01 2) 1) (< i@143@01 __flatten_10@117@01))))
; [eval] res[i].Ref__Integer_value == b[i / 2].Ref__Integer_value
; [eval] res[i]
(push) ; 9
(assert (not (>= i@143@01 0)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(push) ; 9
(assert (not (< i@143@01 (Seq_length res@7@01))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r __flatten_9@111@01)
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value (as sm@116@01  $FVF<Ref__Integer_value>) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@116@01  $FVF<Ref__Integer_value>) r))
    :qid |qp.fvfValDef19|))
  (forall ((r $Ref)) (!
    (=>
      (= r __flatten_6@102@01)
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value (as sm@106@01  $FVF<Ref__Integer_value>) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@106@01  $FVF<Ref__Integer_value>) r))
    :qid |qp.fvfValDef20|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and
          (img@65@01 r)
          (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
        (< $Perm.No (- $Perm.Write (pTaken@103@01 r)))
        false)
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r))
    :qid |qp.fvfValDef21|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and
          (img@68@01 r)
          (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
        (< $Perm.No (- $Perm.Write (pTaken@104@01 r)))
        false)
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r))
    :qid |qp.fvfValDef22|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and
          (img@71@01 r)
          (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
        (< $Perm.No (- (- $Perm.Write (pTaken@105@01 r)) (pTaken@112@01 r)))
        false)
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r))
    :qid |qp.fvfValDef23|))))
(push) ; 9
(assert (not (<
  $Perm.No
  (+
    (+
      (+
        (+
          (ite
            (= (Seq_index res@7@01 i@143@01) __flatten_9@111@01)
            $Perm.Write
            $Perm.No)
          (ite
            (= (Seq_index res@7@01 i@143@01) __flatten_6@102@01)
            $Perm.Write
            $Perm.No))
        (ite
          (and
            (img@65@01 (Seq_index res@7@01 i@143@01))
            (Seq_contains
              (Seq_range 0 (Seq_length a@5@01))
              (inv@64@01 (Seq_index res@7@01 i@143@01))))
          (- $Perm.Write (pTaken@103@01 (Seq_index res@7@01 i@143@01)))
          $Perm.No))
      (ite
        (and
          (img@68@01 (Seq_index res@7@01 i@143@01))
          (Seq_contains
            (Seq_range 0 (Seq_length b@6@01))
            (inv@67@01 (Seq_index res@7@01 i@143@01))))
        (- $Perm.Write (pTaken@104@01 (Seq_index res@7@01 i@143@01)))
        $Perm.No))
    (ite
      (and
        (img@71@01 (Seq_index res@7@01 i@143@01))
        (Seq_contains
          (Seq_range 0 (Seq_length res@7@01))
          (inv@70@01 (Seq_index res@7@01 i@143@01))))
      (-
        (- $Perm.Write (pTaken@105@01 (Seq_index res@7@01 i@143@01)))
        (pTaken@112@01 (Seq_index res@7@01 i@143@01)))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [eval] b[i / 2]
; [eval] i / 2
(push) ; 9
(assert (not (>= (div i@143@01 2) 0)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(push) ; 9
(assert (not (< (div i@143@01 2) (Seq_length b@6@01))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r __flatten_9@111@01)
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value (as sm@116@01  $FVF<Ref__Integer_value>) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@116@01  $FVF<Ref__Integer_value>) r))
    :qid |qp.fvfValDef19|))
  (forall ((r $Ref)) (!
    (=>
      (= r __flatten_6@102@01)
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value (as sm@106@01  $FVF<Ref__Integer_value>) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@106@01  $FVF<Ref__Integer_value>) r))
    :qid |qp.fvfValDef20|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and
          (img@65@01 r)
          (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
        (< $Perm.No (- $Perm.Write (pTaken@103@01 r)))
        false)
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r))
    :qid |qp.fvfValDef21|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and
          (img@68@01 r)
          (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
        (< $Perm.No (- $Perm.Write (pTaken@104@01 r)))
        false)
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r))
    :qid |qp.fvfValDef22|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and
          (img@71@01 r)
          (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
        (< $Perm.No (- (- $Perm.Write (pTaken@105@01 r)) (pTaken@112@01 r)))
        false)
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r))
    :qid |qp.fvfValDef23|))))
(push) ; 9
(assert (not (<
  $Perm.No
  (+
    (+
      (+
        (+
          (ite
            (= (Seq_index b@6@01 (div i@143@01 2)) __flatten_9@111@01)
            $Perm.Write
            $Perm.No)
          (ite
            (= (Seq_index b@6@01 (div i@143@01 2)) __flatten_6@102@01)
            $Perm.Write
            $Perm.No))
        (ite
          (and
            (img@65@01 (Seq_index b@6@01 (div i@143@01 2)))
            (Seq_contains
              (Seq_range 0 (Seq_length a@5@01))
              (inv@64@01 (Seq_index b@6@01 (div i@143@01 2)))))
          (- $Perm.Write (pTaken@103@01 (Seq_index b@6@01 (div i@143@01 2))))
          $Perm.No))
      (ite
        (and
          (img@68@01 (Seq_index b@6@01 (div i@143@01 2)))
          (Seq_contains
            (Seq_range 0 (Seq_length b@6@01))
            (inv@67@01 (Seq_index b@6@01 (div i@143@01 2)))))
        (- $Perm.Write (pTaken@104@01 (Seq_index b@6@01 (div i@143@01 2))))
        $Perm.No))
    (ite
      (and
        (img@71@01 (Seq_index b@6@01 (div i@143@01 2)))
        (Seq_contains
          (Seq_range 0 (Seq_length res@7@01))
          (inv@70@01 (Seq_index b@6@01 (div i@143@01 2)))))
      (-
        (- $Perm.Write (pTaken@105@01 (Seq_index b@6@01 (div i@143@01 2))))
        (pTaken@112@01 (Seq_index b@6@01 (div i@143@01 2))))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(pop) ; 8
(push) ; 8
; [else-branch: 45 | !(0 <= i@143@01 && i@143@01 % 2 == 1 && i@143@01 < __flatten_10@117@01)]
(assert (not
  (and
    (<= 0 i@143@01)
    (and (= (mod i@143@01 2) 1) (< i@143@01 __flatten_10@117@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r __flatten_9@111@01)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value (as sm@116@01  $FVF<Ref__Integer_value>) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@116@01  $FVF<Ref__Integer_value>) r))
  :qid |qp.fvfValDef19|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r __flatten_6@102@01)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value (as sm@106@01  $FVF<Ref__Integer_value>) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@106@01  $FVF<Ref__Integer_value>) r))
  :qid |qp.fvfValDef20|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@65@01 r)
        (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@103@01 r)))
      false)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r))
  :qid |qp.fvfValDef21|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@68@01 r)
        (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@104@01 r)))
      false)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r))
  :qid |qp.fvfValDef22|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@71@01 r)
        (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
      (< $Perm.No (- (- $Perm.Write (pTaken@105@01 r)) (pTaken@112@01 r)))
      false)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r))
  :qid |qp.fvfValDef23|)))
(assert (=>
  (and
    (<= 0 i@143@01)
    (and (= (mod i@143@01 2) 1) (< i@143@01 __flatten_10@117@01)))
  (and (<= 0 i@143@01) (= (mod i@143@01 2) 1) (< i@143@01 __flatten_10@117@01))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i@143@01)
      (and (= (mod i@143@01 2) 1) (< i@143@01 __flatten_10@117@01))))
  (and
    (<= 0 i@143@01)
    (and (= (mod i@143@01 2) 1) (< i@143@01 __flatten_10@117@01)))))
(pop) ; 6
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (= r __flatten_9@111@01)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value (as sm@116@01  $FVF<Ref__Integer_value>) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@116@01  $FVF<Ref__Integer_value>) r))
  :qid |qp.fvfValDef19|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r __flatten_6@102@01)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value (as sm@106@01  $FVF<Ref__Integer_value>) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@106@01  $FVF<Ref__Integer_value>) r))
  :qid |qp.fvfValDef20|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@65@01 r)
        (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@103@01 r)))
      false)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r))
  :qid |qp.fvfValDef21|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@68@01 r)
        (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@104@01 r)))
      false)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r))
  :qid |qp.fvfValDef22|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@71@01 r)
        (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
      (< $Perm.No (- (- $Perm.Write (pTaken@105@01 r)) (pTaken@112@01 r)))
      false)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r))
  :qid |qp.fvfValDef23|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@143@01 Int)) (!
  (and
    (=>
      (<= 0 i@143@01)
      (and
        (<= 0 i@143@01)
        (or (= (mod i@143@01 2) 1) (not (= (mod i@143@01 2) 1)))))
    (or (<= 0 i@143@01) (not (<= 0 i@143@01)))
    (=>
      (and
        (<= 0 i@143@01)
        (and (= (mod i@143@01 2) 1) (< i@143@01 __flatten_10@117@01)))
      (and
        (<= 0 i@143@01)
        (= (mod i@143@01 2) 1)
        (< i@143@01 __flatten_10@117@01)))
    (or
      (not
        (and
          (<= 0 i@143@01)
          (and (= (mod i@143@01 2) 1) (< i@143@01 __flatten_10@117@01))))
      (and
        (<= 0 i@143@01)
        (and (= (mod i@143@01 2) 1) (< i@143@01 __flatten_10@117@01)))))
  :pattern ((Seq_index res@7@01 i@143@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@75@16@75@131-aux|)))
(push) ; 6
(assert (not (forall ((i@143@01 Int)) (!
  (=>
    (and
      (<= 0 i@143@01)
      (and (= (mod i@143@01 2) 1) (< i@143@01 __flatten_10@117@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) (Seq_index
        res@7@01
        i@143@01))
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) (Seq_index
        b@6@01
        (div i@143@01 2)))))
  :pattern ((Seq_index res@7@01 i@143@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@75@16@75@131|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@143@01 Int)) (!
  (=>
    (and
      (<= 0 i@143@01)
      (and (= (mod i@143@01 2) 1) (< i@143@01 __flatten_10@117@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) (Seq_index
        res@7@01
        i@143@01))
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) (Seq_index
        b@6@01
        (div i@143@01 2)))))
  :pattern ((Seq_index res@7@01 i@143@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@75@16@75@131|)))
; [eval] (forall i: Int :: { a[i] } (i in [0..k / 2)) ==> res[2 * i].Ref__Integer_value == a[i].Ref__Integer_value)
(declare-const i@144@01 Int)
(push) ; 6
; [eval] (i in [0..k / 2)) ==> res[2 * i].Ref__Integer_value == a[i].Ref__Integer_value
; [eval] (i in [0..k / 2))
; [eval] [0..k / 2)
; [eval] k / 2
(push) ; 7
; [then-branch: 46 | i@144@01 in [0..__flatten_10@117@01 / 2] | live]
; [else-branch: 46 | !(i@144@01 in [0..__flatten_10@117@01 / 2]) | live]
(push) ; 8
; [then-branch: 46 | i@144@01 in [0..__flatten_10@117@01 / 2]]
(assert (Seq_contains (Seq_range 0 (div __flatten_10@117@01 2)) i@144@01))
; [eval] res[2 * i].Ref__Integer_value == a[i].Ref__Integer_value
; [eval] res[2 * i]
; [eval] 2 * i
(push) ; 9
(assert (not (>= (* 2 i@144@01) 0)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(push) ; 9
(assert (not (< (* 2 i@144@01) (Seq_length res@7@01))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r __flatten_9@111@01)
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value (as sm@116@01  $FVF<Ref__Integer_value>) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@116@01  $FVF<Ref__Integer_value>) r))
    :qid |qp.fvfValDef19|))
  (forall ((r $Ref)) (!
    (=>
      (= r __flatten_6@102@01)
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value (as sm@106@01  $FVF<Ref__Integer_value>) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@106@01  $FVF<Ref__Integer_value>) r))
    :qid |qp.fvfValDef20|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and
          (img@65@01 r)
          (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
        (< $Perm.No (- $Perm.Write (pTaken@103@01 r)))
        false)
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r))
    :qid |qp.fvfValDef21|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and
          (img@68@01 r)
          (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
        (< $Perm.No (- $Perm.Write (pTaken@104@01 r)))
        false)
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r))
    :qid |qp.fvfValDef22|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and
          (img@71@01 r)
          (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
        (< $Perm.No (- (- $Perm.Write (pTaken@105@01 r)) (pTaken@112@01 r)))
        false)
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r))
    :qid |qp.fvfValDef23|))))
(push) ; 9
(assert (not (<
  $Perm.No
  (+
    (+
      (+
        (+
          (ite
            (= (Seq_index res@7@01 (* 2 i@144@01)) __flatten_9@111@01)
            $Perm.Write
            $Perm.No)
          (ite
            (= (Seq_index res@7@01 (* 2 i@144@01)) __flatten_6@102@01)
            $Perm.Write
            $Perm.No))
        (ite
          (and
            (img@65@01 (Seq_index res@7@01 (* 2 i@144@01)))
            (Seq_contains
              (Seq_range 0 (Seq_length a@5@01))
              (inv@64@01 (Seq_index res@7@01 (* 2 i@144@01)))))
          (- $Perm.Write (pTaken@103@01 (Seq_index res@7@01 (* 2 i@144@01))))
          $Perm.No))
      (ite
        (and
          (img@68@01 (Seq_index res@7@01 (* 2 i@144@01)))
          (Seq_contains
            (Seq_range 0 (Seq_length b@6@01))
            (inv@67@01 (Seq_index res@7@01 (* 2 i@144@01)))))
        (- $Perm.Write (pTaken@104@01 (Seq_index res@7@01 (* 2 i@144@01))))
        $Perm.No))
    (ite
      (and
        (img@71@01 (Seq_index res@7@01 (* 2 i@144@01)))
        (Seq_contains
          (Seq_range 0 (Seq_length res@7@01))
          (inv@70@01 (Seq_index res@7@01 (* 2 i@144@01)))))
      (-
        (- $Perm.Write (pTaken@105@01 (Seq_index res@7@01 (* 2 i@144@01))))
        (pTaken@112@01 (Seq_index res@7@01 (* 2 i@144@01))))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 9
; 0,01s
; (get-info :all-statistics)
; [eval] a[i]
(push) ; 9
(assert (not (>= i@144@01 0)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(push) ; 9
(assert (not (< i@144@01 (Seq_length a@5@01))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r __flatten_9@111@01)
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value (as sm@116@01  $FVF<Ref__Integer_value>) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@116@01  $FVF<Ref__Integer_value>) r))
    :qid |qp.fvfValDef19|))
  (forall ((r $Ref)) (!
    (=>
      (= r __flatten_6@102@01)
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value (as sm@106@01  $FVF<Ref__Integer_value>) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@106@01  $FVF<Ref__Integer_value>) r))
    :qid |qp.fvfValDef20|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and
          (img@65@01 r)
          (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
        (< $Perm.No (- $Perm.Write (pTaken@103@01 r)))
        false)
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r))
    :qid |qp.fvfValDef21|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and
          (img@68@01 r)
          (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
        (< $Perm.No (- $Perm.Write (pTaken@104@01 r)))
        false)
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r))
    :qid |qp.fvfValDef22|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and
          (img@71@01 r)
          (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
        (< $Perm.No (- (- $Perm.Write (pTaken@105@01 r)) (pTaken@112@01 r)))
        false)
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r))
    :qid |qp.fvfValDef23|))))
(push) ; 9
(assert (not (<
  $Perm.No
  (+
    (+
      (+
        (+
          (ite
            (= (Seq_index a@5@01 i@144@01) __flatten_9@111@01)
            $Perm.Write
            $Perm.No)
          (ite
            (= (Seq_index a@5@01 i@144@01) __flatten_6@102@01)
            $Perm.Write
            $Perm.No))
        (ite
          (and
            (img@65@01 (Seq_index a@5@01 i@144@01))
            (Seq_contains
              (Seq_range 0 (Seq_length a@5@01))
              (inv@64@01 (Seq_index a@5@01 i@144@01))))
          (- $Perm.Write (pTaken@103@01 (Seq_index a@5@01 i@144@01)))
          $Perm.No))
      (ite
        (and
          (img@68@01 (Seq_index a@5@01 i@144@01))
          (Seq_contains
            (Seq_range 0 (Seq_length b@6@01))
            (inv@67@01 (Seq_index a@5@01 i@144@01))))
        (- $Perm.Write (pTaken@104@01 (Seq_index a@5@01 i@144@01)))
        $Perm.No))
    (ite
      (and
        (img@71@01 (Seq_index a@5@01 i@144@01))
        (Seq_contains
          (Seq_range 0 (Seq_length res@7@01))
          (inv@70@01 (Seq_index a@5@01 i@144@01))))
      (-
        (- $Perm.Write (pTaken@105@01 (Seq_index a@5@01 i@144@01)))
        (pTaken@112@01 (Seq_index a@5@01 i@144@01)))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(pop) ; 8
(push) ; 8
; [else-branch: 46 | !(i@144@01 in [0..__flatten_10@117@01 / 2])]
(assert (not (Seq_contains (Seq_range 0 (div __flatten_10@117@01 2)) i@144@01)))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r __flatten_9@111@01)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value (as sm@116@01  $FVF<Ref__Integer_value>) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@116@01  $FVF<Ref__Integer_value>) r))
  :qid |qp.fvfValDef19|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r __flatten_6@102@01)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value (as sm@106@01  $FVF<Ref__Integer_value>) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@106@01  $FVF<Ref__Integer_value>) r))
  :qid |qp.fvfValDef20|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@65@01 r)
        (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@103@01 r)))
      false)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r))
  :qid |qp.fvfValDef21|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@68@01 r)
        (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@104@01 r)))
      false)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r))
  :qid |qp.fvfValDef22|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@71@01 r)
        (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
      (< $Perm.No (- (- $Perm.Write (pTaken@105@01 r)) (pTaken@112@01 r)))
      false)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r))
  :qid |qp.fvfValDef23|)))
; Joined path conditions
(assert (or
  (not (Seq_contains (Seq_range 0 (div __flatten_10@117@01 2)) i@144@01))
  (Seq_contains (Seq_range 0 (div __flatten_10@117@01 2)) i@144@01)))
(pop) ; 6
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (= r __flatten_9@111@01)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value (as sm@116@01  $FVF<Ref__Integer_value>) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@116@01  $FVF<Ref__Integer_value>) r))
  :qid |qp.fvfValDef19|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r __flatten_6@102@01)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value (as sm@106@01  $FVF<Ref__Integer_value>) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@106@01  $FVF<Ref__Integer_value>) r))
  :qid |qp.fvfValDef20|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@65@01 r)
        (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@103@01 r)))
      false)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r))
  :qid |qp.fvfValDef21|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@68@01 r)
        (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@104@01 r)))
      false)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r))
  :qid |qp.fvfValDef22|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@71@01 r)
        (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
      (< $Perm.No (- (- $Perm.Write (pTaken@105@01 r)) (pTaken@112@01 r)))
      false)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r))
  :qid |qp.fvfValDef23|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@144@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 (div __flatten_10@117@01 2)) i@144@01))
    (Seq_contains (Seq_range 0 (div __flatten_10@117@01 2)) i@144@01))
  :pattern ((Seq_index a@5@01 i@144@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@76@16@76@113-aux|)))
(push) ; 6
(assert (not (forall ((i@144@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (div __flatten_10@117@01 2)) i@144@01)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) (Seq_index
        res@7@01
        (* 2 i@144@01)))
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) (Seq_index
        a@5@01
        i@144@01))))
  :pattern ((Seq_index a@5@01 i@144@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@76@16@76@113|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@144@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (div __flatten_10@117@01 2)) i@144@01)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) (Seq_index
        res@7@01
        (* 2 i@144@01)))
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) (Seq_index
        a@5@01
        i@144@01))))
  :pattern ((Seq_index a@5@01 i@144@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@76@16@76@113|)))
; [eval] (forall i: Int :: { b[i] } (i in [0..k / 2)) ==> res[2 * i + 1].Ref__Integer_value == b[i].Ref__Integer_value)
(declare-const i@145@01 Int)
(push) ; 6
; [eval] (i in [0..k / 2)) ==> res[2 * i + 1].Ref__Integer_value == b[i].Ref__Integer_value
; [eval] (i in [0..k / 2))
; [eval] [0..k / 2)
; [eval] k / 2
(push) ; 7
; [then-branch: 47 | i@145@01 in [0..__flatten_10@117@01 / 2] | live]
; [else-branch: 47 | !(i@145@01 in [0..__flatten_10@117@01 / 2]) | live]
(push) ; 8
; [then-branch: 47 | i@145@01 in [0..__flatten_10@117@01 / 2]]
(assert (Seq_contains (Seq_range 0 (div __flatten_10@117@01 2)) i@145@01))
; [eval] res[2 * i + 1].Ref__Integer_value == b[i].Ref__Integer_value
; [eval] res[2 * i + 1]
; [eval] 2 * i + 1
; [eval] 2 * i
(push) ; 9
(assert (not (>= (+ (* 2 i@145@01) 1) 0)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(push) ; 9
(assert (not (< (+ (* 2 i@145@01) 1) (Seq_length res@7@01))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r __flatten_9@111@01)
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value (as sm@116@01  $FVF<Ref__Integer_value>) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@116@01  $FVF<Ref__Integer_value>) r))
    :qid |qp.fvfValDef19|))
  (forall ((r $Ref)) (!
    (=>
      (= r __flatten_6@102@01)
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value (as sm@106@01  $FVF<Ref__Integer_value>) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@106@01  $FVF<Ref__Integer_value>) r))
    :qid |qp.fvfValDef20|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and
          (img@65@01 r)
          (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
        (< $Perm.No (- $Perm.Write (pTaken@103@01 r)))
        false)
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r))
    :qid |qp.fvfValDef21|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and
          (img@68@01 r)
          (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
        (< $Perm.No (- $Perm.Write (pTaken@104@01 r)))
        false)
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r))
    :qid |qp.fvfValDef22|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and
          (img@71@01 r)
          (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
        (< $Perm.No (- (- $Perm.Write (pTaken@105@01 r)) (pTaken@112@01 r)))
        false)
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r))
    :qid |qp.fvfValDef23|))))
(push) ; 9
(assert (not (<
  $Perm.No
  (+
    (+
      (+
        (+
          (ite
            (= (Seq_index res@7@01 (+ (* 2 i@145@01) 1)) __flatten_9@111@01)
            $Perm.Write
            $Perm.No)
          (ite
            (= (Seq_index res@7@01 (+ (* 2 i@145@01) 1)) __flatten_6@102@01)
            $Perm.Write
            $Perm.No))
        (ite
          (and
            (img@65@01 (Seq_index res@7@01 (+ (* 2 i@145@01) 1)))
            (Seq_contains
              (Seq_range 0 (Seq_length a@5@01))
              (inv@64@01 (Seq_index res@7@01 (+ (* 2 i@145@01) 1)))))
          (-
            $Perm.Write
            (pTaken@103@01 (Seq_index res@7@01 (+ (* 2 i@145@01) 1))))
          $Perm.No))
      (ite
        (and
          (img@68@01 (Seq_index res@7@01 (+ (* 2 i@145@01) 1)))
          (Seq_contains
            (Seq_range 0 (Seq_length b@6@01))
            (inv@67@01 (Seq_index res@7@01 (+ (* 2 i@145@01) 1)))))
        (- $Perm.Write (pTaken@104@01 (Seq_index res@7@01 (+ (* 2 i@145@01) 1))))
        $Perm.No))
    (ite
      (and
        (img@71@01 (Seq_index res@7@01 (+ (* 2 i@145@01) 1)))
        (Seq_contains
          (Seq_range 0 (Seq_length res@7@01))
          (inv@70@01 (Seq_index res@7@01 (+ (* 2 i@145@01) 1)))))
      (-
        (- $Perm.Write (pTaken@105@01 (Seq_index res@7@01 (+ (* 2 i@145@01) 1))))
        (pTaken@112@01 (Seq_index res@7@01 (+ (* 2 i@145@01) 1))))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 9
; 0,01s
; (get-info :all-statistics)
; [eval] b[i]
(push) ; 9
(assert (not (>= i@145@01 0)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(push) ; 9
(assert (not (< i@145@01 (Seq_length b@6@01))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (= r __flatten_9@111@01)
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value (as sm@116@01  $FVF<Ref__Integer_value>) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@116@01  $FVF<Ref__Integer_value>) r))
    :qid |qp.fvfValDef19|))
  (forall ((r $Ref)) (!
    (=>
      (= r __flatten_6@102@01)
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value (as sm@106@01  $FVF<Ref__Integer_value>) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@106@01  $FVF<Ref__Integer_value>) r))
    :qid |qp.fvfValDef20|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and
          (img@65@01 r)
          (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
        (< $Perm.No (- $Perm.Write (pTaken@103@01 r)))
        false)
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r))
    :qid |qp.fvfValDef21|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and
          (img@68@01 r)
          (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
        (< $Perm.No (- $Perm.Write (pTaken@104@01 r)))
        false)
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r))
    :qid |qp.fvfValDef22|))
  (forall ((r $Ref)) (!
    (=>
      (ite
        (and
          (img@71@01 r)
          (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
        (< $Perm.No (- (- $Perm.Write (pTaken@105@01 r)) (pTaken@112@01 r)))
        false)
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r))
    :qid |qp.fvfValDef23|))))
(push) ; 9
(assert (not (<
  $Perm.No
  (+
    (+
      (+
        (+
          (ite
            (= (Seq_index b@6@01 i@145@01) __flatten_9@111@01)
            $Perm.Write
            $Perm.No)
          (ite
            (= (Seq_index b@6@01 i@145@01) __flatten_6@102@01)
            $Perm.Write
            $Perm.No))
        (ite
          (and
            (img@65@01 (Seq_index b@6@01 i@145@01))
            (Seq_contains
              (Seq_range 0 (Seq_length a@5@01))
              (inv@64@01 (Seq_index b@6@01 i@145@01))))
          (- $Perm.Write (pTaken@103@01 (Seq_index b@6@01 i@145@01)))
          $Perm.No))
      (ite
        (and
          (img@68@01 (Seq_index b@6@01 i@145@01))
          (Seq_contains
            (Seq_range 0 (Seq_length b@6@01))
            (inv@67@01 (Seq_index b@6@01 i@145@01))))
        (- $Perm.Write (pTaken@104@01 (Seq_index b@6@01 i@145@01)))
        $Perm.No))
    (ite
      (and
        (img@71@01 (Seq_index b@6@01 i@145@01))
        (Seq_contains
          (Seq_range 0 (Seq_length res@7@01))
          (inv@70@01 (Seq_index b@6@01 i@145@01))))
      (-
        (- $Perm.Write (pTaken@105@01 (Seq_index b@6@01 i@145@01)))
        (pTaken@112@01 (Seq_index b@6@01 i@145@01)))
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(pop) ; 8
(push) ; 8
; [else-branch: 47 | !(i@145@01 in [0..__flatten_10@117@01 / 2])]
(assert (not (Seq_contains (Seq_range 0 (div __flatten_10@117@01 2)) i@145@01)))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (= r __flatten_9@111@01)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value (as sm@116@01  $FVF<Ref__Integer_value>) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@116@01  $FVF<Ref__Integer_value>) r))
  :qid |qp.fvfValDef19|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r __flatten_6@102@01)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value (as sm@106@01  $FVF<Ref__Integer_value>) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@106@01  $FVF<Ref__Integer_value>) r))
  :qid |qp.fvfValDef20|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@65@01 r)
        (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@103@01 r)))
      false)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r))
  :qid |qp.fvfValDef21|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@68@01 r)
        (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@104@01 r)))
      false)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r))
  :qid |qp.fvfValDef22|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@71@01 r)
        (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
      (< $Perm.No (- (- $Perm.Write (pTaken@105@01 r)) (pTaken@112@01 r)))
      false)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r))
  :qid |qp.fvfValDef23|)))
; Joined path conditions
(assert (or
  (not (Seq_contains (Seq_range 0 (div __flatten_10@117@01 2)) i@145@01))
  (Seq_contains (Seq_range 0 (div __flatten_10@117@01 2)) i@145@01)))
(pop) ; 6
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (= r __flatten_9@111@01)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value (as sm@116@01  $FVF<Ref__Integer_value>) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@116@01  $FVF<Ref__Integer_value>) r))
  :qid |qp.fvfValDef19|)))
(assert (forall ((r $Ref)) (!
  (=>
    (= r __flatten_6@102@01)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value (as sm@106@01  $FVF<Ref__Integer_value>) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@106@01  $FVF<Ref__Integer_value>) r))
  :qid |qp.fvfValDef20|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@65@01 r)
        (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@103@01 r)))
      false)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r))
  :qid |qp.fvfValDef21|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@68@01 r)
        (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
      (< $Perm.No (- $Perm.Write (pTaken@104@01 r)))
      false)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r))
  :qid |qp.fvfValDef22|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@71@01 r)
        (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
      (< $Perm.No (- (- $Perm.Write (pTaken@105@01 r)) (pTaken@112@01 r)))
      false)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r))
  :qid |qp.fvfValDef23|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@145@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 (div __flatten_10@117@01 2)) i@145@01))
    (Seq_contains (Seq_range 0 (div __flatten_10@117@01 2)) i@145@01))
  :pattern ((Seq_index b@6@01 i@145@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@77@16@77@117-aux|)))
(push) ; 6
(assert (not (forall ((i@145@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (div __flatten_10@117@01 2)) i@145@01)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) (Seq_index
        res@7@01
        (+ (* 2 i@145@01) 1)))
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) (Seq_index
        b@6@01
        i@145@01))))
  :pattern ((Seq_index b@6@01 i@145@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@77@16@77@117|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@145@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (div __flatten_10@117@01 2)) i@145@01)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) (Seq_index
        res@7@01
        (+ (* 2 i@145@01) 1)))
      ($FVF.lookup_Ref__Integer_value (as sm@126@01  $FVF<Ref__Integer_value>) (Seq_index
        b@6@01
        i@145@01))))
  :pattern ((Seq_index b@6@01 i@145@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@77@16@77@117|)))
(pop) ; 5
(push) ; 5
; [else-branch: 39 | !(k@61@01 < |res@7@01|)]
(assert (not (< k@61@01 (Seq_length res@7@01))))
(pop) ; 5
; [eval] !(k < |res|)
; [eval] k < |res|
; [eval] |res|
(push) ; 5
(set-option :timeout 10)
(assert (not (< k@61@01 (Seq_length res@7@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (< k@61@01 (Seq_length res@7@01)))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 48 | !(k@61@01 < |res@7@01|) | live]
; [else-branch: 48 | k@61@01 < |res@7@01| | live]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 48 | !(k@61@01 < |res@7@01|)]
(assert (not (< k@61@01 (Seq_length res@7@01))))
; [exec]
; assert k == |res|
; [eval] k == |res|
; [eval] |res|
(push) ; 6
(assert (not (= k@61@01 (Seq_length res@7@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (= k@61@01 (Seq_length res@7@01)))
; [exec]
; assert |res| / 2 == k / 2
; [eval] |res| / 2 == k / 2
; [eval] |res| / 2
; [eval] |res|
; [eval] k / 2
(push) ; 6
(assert (not (= (div (Seq_length res@7@01) 2) (div k@61@01 2))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (= (div (Seq_length res@7@01) 2) (div k@61@01 2)))
; [exec]
; assert (forall i: Int ::
;     { a[i] }
;     (i in [0..|res| / 2)) ==>
;     res[2 * i].Ref__Integer_value == a[i].Ref__Integer_value)
; [eval] (forall i: Int :: { a[i] } (i in [0..|res| / 2)) ==> res[2 * i].Ref__Integer_value == a[i].Ref__Integer_value)
(declare-const i@146@01 Int)
(push) ; 6
; [eval] (i in [0..|res| / 2)) ==> res[2 * i].Ref__Integer_value == a[i].Ref__Integer_value
; [eval] (i in [0..|res| / 2))
; [eval] [0..|res| / 2)
; [eval] |res| / 2
; [eval] |res|
(push) ; 7
; [then-branch: 49 | i@146@01 in [0..|res@7@01| / 2] | live]
; [else-branch: 49 | !(i@146@01 in [0..|res@7@01| / 2]) | live]
(push) ; 8
; [then-branch: 49 | i@146@01 in [0..|res@7@01| / 2]]
(assert (Seq_contains (Seq_range 0 (div (Seq_length res@7@01) 2)) i@146@01))
; [eval] res[2 * i].Ref__Integer_value == a[i].Ref__Integer_value
; [eval] res[2 * i]
; [eval] 2 * i
(push) ; 9
(assert (not (>= (* 2 i@146@01) 0)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(push) ; 9
(assert (not (< (* 2 i@146@01) (Seq_length res@7@01))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@65@01 r)
        (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r))
    :qid |qp.fvfValDef4|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@68@01 r)
        (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r))
    :qid |qp.fvfValDef5|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@71@01 r)
        (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r))
    :qid |qp.fvfValDef6|))))
(push) ; 9
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and
          (img@65@01 (Seq_index res@7@01 (* 2 i@146@01)))
          (Seq_contains
            (Seq_range 0 (Seq_length a@5@01))
            (inv@64@01 (Seq_index res@7@01 (* 2 i@146@01)))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@68@01 (Seq_index res@7@01 (* 2 i@146@01)))
          (Seq_contains
            (Seq_range 0 (Seq_length b@6@01))
            (inv@67@01 (Seq_index res@7@01 (* 2 i@146@01)))))
        $Perm.Write
        $Perm.No))
    (ite
      (and
        (img@71@01 (Seq_index res@7@01 (* 2 i@146@01)))
        (Seq_contains
          (Seq_range 0 (Seq_length res@7@01))
          (inv@70@01 (Seq_index res@7@01 (* 2 i@146@01)))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [eval] a[i]
(push) ; 9
(assert (not (>= i@146@01 0)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(push) ; 9
(assert (not (< i@146@01 (Seq_length a@5@01))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@65@01 r)
        (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r))
    :qid |qp.fvfValDef4|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@68@01 r)
        (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r))
    :qid |qp.fvfValDef5|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@71@01 r)
        (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r))
    :qid |qp.fvfValDef6|))))
(push) ; 9
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and
          (img@65@01 (Seq_index a@5@01 i@146@01))
          (Seq_contains
            (Seq_range 0 (Seq_length a@5@01))
            (inv@64@01 (Seq_index a@5@01 i@146@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@68@01 (Seq_index a@5@01 i@146@01))
          (Seq_contains
            (Seq_range 0 (Seq_length b@6@01))
            (inv@67@01 (Seq_index a@5@01 i@146@01))))
        $Perm.Write
        $Perm.No))
    (ite
      (and
        (img@71@01 (Seq_index a@5@01 i@146@01))
        (Seq_contains
          (Seq_range 0 (Seq_length res@7@01))
          (inv@70@01 (Seq_index a@5@01 i@146@01))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(pop) ; 8
(push) ; 8
; [else-branch: 49 | !(i@146@01 in [0..|res@7@01| / 2])]
(assert (not (Seq_contains (Seq_range 0 (div (Seq_length res@7@01) 2)) i@146@01)))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@65@01 r)
      (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@68@01 r)
      (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@71@01 r)
      (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r))
  :qid |qp.fvfValDef6|)))
; Joined path conditions
(assert (or
  (not (Seq_contains (Seq_range 0 (div (Seq_length res@7@01) 2)) i@146@01))
  (Seq_contains (Seq_range 0 (div (Seq_length res@7@01) 2)) i@146@01)))
(pop) ; 6
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@65@01 r)
      (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@68@01 r)
      (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@71@01 r)
      (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r))
  :qid |qp.fvfValDef6|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@146@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 (div (Seq_length res@7@01) 2)) i@146@01))
    (Seq_contains (Seq_range 0 (div (Seq_length res@7@01) 2)) i@146@01))
  :pattern ((Seq_index a@5@01 i@146@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@95@11@95@112-aux|)))
(push) ; 6
(assert (not (forall ((i@146@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (div (Seq_length res@7@01) 2)) i@146@01)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) (Seq_index
        res@7@01
        (* 2 i@146@01)))
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) (Seq_index
        a@5@01
        i@146@01))))
  :pattern ((Seq_index a@5@01 i@146@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@95@11@95@112|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@146@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (div (Seq_length res@7@01) 2)) i@146@01)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) (Seq_index
        res@7@01
        (* 2 i@146@01)))
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) (Seq_index
        a@5@01
        i@146@01))))
  :pattern ((Seq_index a@5@01 i@146@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@95@11@95@112|)))
; [exec]
; assert (forall i: Int ::
;     { res[i] }
;     0 <= i && (i % 2 == 1 && i < |res|) ==>
;     res[i].Ref__Integer_value == b[i / 2].Ref__Integer_value)
; [eval] (forall i: Int :: { res[i] } 0 <= i && (i % 2 == 1 && i < |res|) ==> res[i].Ref__Integer_value == b[i / 2].Ref__Integer_value)
(declare-const i@147@01 Int)
(push) ; 6
; [eval] 0 <= i && (i % 2 == 1 && i < |res|) ==> res[i].Ref__Integer_value == b[i / 2].Ref__Integer_value
; [eval] 0 <= i && (i % 2 == 1 && i < |res|)
; [eval] 0 <= i
(push) ; 7
; [then-branch: 50 | !(0 <= i@147@01) | live]
; [else-branch: 50 | 0 <= i@147@01 | live]
(push) ; 8
; [then-branch: 50 | !(0 <= i@147@01)]
(assert (not (<= 0 i@147@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 50 | 0 <= i@147@01]
(assert (<= 0 i@147@01))
; [eval] i % 2 == 1
; [eval] i % 2
(push) ; 9
; [then-branch: 51 | i@147@01 % 2 != 1 | live]
; [else-branch: 51 | i@147@01 % 2 == 1 | live]
(push) ; 10
; [then-branch: 51 | i@147@01 % 2 != 1]
(assert (not (= (mod i@147@01 2) 1)))
(pop) ; 10
(push) ; 10
; [else-branch: 51 | i@147@01 % 2 == 1]
(assert (= (mod i@147@01 2) 1))
; [eval] i < |res|
; [eval] |res|
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (= (mod i@147@01 2) 1) (not (= (mod i@147@01 2) 1))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i@147@01)
  (and (<= 0 i@147@01) (or (= (mod i@147@01 2) 1) (not (= (mod i@147@01 2) 1))))))
(assert (or (<= 0 i@147@01) (not (<= 0 i@147@01))))
(push) ; 7
; [then-branch: 52 | 0 <= i@147@01 && i@147@01 % 2 == 1 && i@147@01 < |res@7@01| | live]
; [else-branch: 52 | !(0 <= i@147@01 && i@147@01 % 2 == 1 && i@147@01 < |res@7@01|) | live]
(push) ; 8
; [then-branch: 52 | 0 <= i@147@01 && i@147@01 % 2 == 1 && i@147@01 < |res@7@01|]
(assert (and
  (<= 0 i@147@01)
  (and (= (mod i@147@01 2) 1) (< i@147@01 (Seq_length res@7@01)))))
; [eval] res[i].Ref__Integer_value == b[i / 2].Ref__Integer_value
; [eval] res[i]
(push) ; 9
(assert (not (>= i@147@01 0)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@65@01 r)
        (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r))
    :qid |qp.fvfValDef4|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@68@01 r)
        (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r))
    :qid |qp.fvfValDef5|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@71@01 r)
        (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r))
    :qid |qp.fvfValDef6|))))
(push) ; 9
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and
          (img@65@01 (Seq_index res@7@01 i@147@01))
          (Seq_contains
            (Seq_range 0 (Seq_length a@5@01))
            (inv@64@01 (Seq_index res@7@01 i@147@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@68@01 (Seq_index res@7@01 i@147@01))
          (Seq_contains
            (Seq_range 0 (Seq_length b@6@01))
            (inv@67@01 (Seq_index res@7@01 i@147@01))))
        $Perm.Write
        $Perm.No))
    (ite
      (and
        (img@71@01 (Seq_index res@7@01 i@147@01))
        (Seq_contains
          (Seq_range 0 (Seq_length res@7@01))
          (inv@70@01 (Seq_index res@7@01 i@147@01))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [eval] b[i / 2]
; [eval] i / 2
(push) ; 9
(assert (not (>= (div i@147@01 2) 0)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(push) ; 9
(assert (not (< (div i@147@01 2) (Seq_length b@6@01))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@65@01 r)
        (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r))
    :qid |qp.fvfValDef4|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@68@01 r)
        (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r))
    :qid |qp.fvfValDef5|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@71@01 r)
        (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r))
    :qid |qp.fvfValDef6|))))
(push) ; 9
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and
          (img@65@01 (Seq_index b@6@01 (div i@147@01 2)))
          (Seq_contains
            (Seq_range 0 (Seq_length a@5@01))
            (inv@64@01 (Seq_index b@6@01 (div i@147@01 2)))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@68@01 (Seq_index b@6@01 (div i@147@01 2)))
          (Seq_contains
            (Seq_range 0 (Seq_length b@6@01))
            (inv@67@01 (Seq_index b@6@01 (div i@147@01 2)))))
        $Perm.Write
        $Perm.No))
    (ite
      (and
        (img@71@01 (Seq_index b@6@01 (div i@147@01 2)))
        (Seq_contains
          (Seq_range 0 (Seq_length res@7@01))
          (inv@70@01 (Seq_index b@6@01 (div i@147@01 2)))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(pop) ; 8
(push) ; 8
; [else-branch: 52 | !(0 <= i@147@01 && i@147@01 % 2 == 1 && i@147@01 < |res@7@01|)]
(assert (not
  (and
    (<= 0 i@147@01)
    (and (= (mod i@147@01 2) 1) (< i@147@01 (Seq_length res@7@01))))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@65@01 r)
      (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@68@01 r)
      (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@71@01 r)
      (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r))
  :qid |qp.fvfValDef6|)))
(assert (=>
  (and
    (<= 0 i@147@01)
    (and (= (mod i@147@01 2) 1) (< i@147@01 (Seq_length res@7@01))))
  (and (<= 0 i@147@01) (= (mod i@147@01 2) 1) (< i@147@01 (Seq_length res@7@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i@147@01)
      (and (= (mod i@147@01 2) 1) (< i@147@01 (Seq_length res@7@01)))))
  (and
    (<= 0 i@147@01)
    (and (= (mod i@147@01 2) 1) (< i@147@01 (Seq_length res@7@01))))))
(pop) ; 6
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@65@01 r)
      (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@68@01 r)
      (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@71@01 r)
      (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r))
  :qid |qp.fvfValDef6|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@147@01 Int)) (!
  (and
    (=>
      (<= 0 i@147@01)
      (and
        (<= 0 i@147@01)
        (or (= (mod i@147@01 2) 1) (not (= (mod i@147@01 2) 1)))))
    (or (<= 0 i@147@01) (not (<= 0 i@147@01)))
    (=>
      (and
        (<= 0 i@147@01)
        (and (= (mod i@147@01 2) 1) (< i@147@01 (Seq_length res@7@01))))
      (and
        (<= 0 i@147@01)
        (= (mod i@147@01 2) 1)
        (< i@147@01 (Seq_length res@7@01))))
    (or
      (not
        (and
          (<= 0 i@147@01)
          (and (= (mod i@147@01 2) 1) (< i@147@01 (Seq_length res@7@01)))))
      (and
        (<= 0 i@147@01)
        (and (= (mod i@147@01 2) 1) (< i@147@01 (Seq_length res@7@01))))))
  :pattern ((Seq_index res@7@01 i@147@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@96@11@96@130-aux|)))
(push) ; 6
(assert (not (forall ((i@147@01 Int)) (!
  (=>
    (and
      (<= 0 i@147@01)
      (and (= (mod i@147@01 2) 1) (< i@147@01 (Seq_length res@7@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) (Seq_index
        res@7@01
        i@147@01))
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) (Seq_index
        b@6@01
        (div i@147@01 2)))))
  :pattern ((Seq_index res@7@01 i@147@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@96@11@96@130|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@147@01 Int)) (!
  (=>
    (and
      (<= 0 i@147@01)
      (and (= (mod i@147@01 2) 1) (< i@147@01 (Seq_length res@7@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) (Seq_index
        res@7@01
        i@147@01))
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) (Seq_index
        b@6@01
        (div i@147@01 2)))))
  :pattern ((Seq_index res@7@01 i@147@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@96@11@96@130|)))
; [exec]
; assert (forall i: Int ::
;     { b[i] }
;     (i in [0..|res| / 2)) ==>
;     res[2 * i + 1].Ref__Integer_value == b[i].Ref__Integer_value)
; [eval] (forall i: Int :: { b[i] } (i in [0..|res| / 2)) ==> res[2 * i + 1].Ref__Integer_value == b[i].Ref__Integer_value)
(declare-const i@148@01 Int)
(push) ; 6
; [eval] (i in [0..|res| / 2)) ==> res[2 * i + 1].Ref__Integer_value == b[i].Ref__Integer_value
; [eval] (i in [0..|res| / 2))
; [eval] [0..|res| / 2)
; [eval] |res| / 2
; [eval] |res|
(push) ; 7
; [then-branch: 53 | i@148@01 in [0..|res@7@01| / 2] | live]
; [else-branch: 53 | !(i@148@01 in [0..|res@7@01| / 2]) | live]
(push) ; 8
; [then-branch: 53 | i@148@01 in [0..|res@7@01| / 2]]
(assert (Seq_contains (Seq_range 0 (div (Seq_length res@7@01) 2)) i@148@01))
; [eval] res[2 * i + 1].Ref__Integer_value == b[i].Ref__Integer_value
; [eval] res[2 * i + 1]
; [eval] 2 * i + 1
; [eval] 2 * i
(push) ; 9
(assert (not (>= (+ (* 2 i@148@01) 1) 0)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(push) ; 9
(assert (not (< (+ (* 2 i@148@01) 1) (Seq_length res@7@01))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@65@01 r)
        (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r))
    :qid |qp.fvfValDef4|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@68@01 r)
        (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r))
    :qid |qp.fvfValDef5|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@71@01 r)
        (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r))
    :qid |qp.fvfValDef6|))))
(push) ; 9
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and
          (img@65@01 (Seq_index res@7@01 (+ (* 2 i@148@01) 1)))
          (Seq_contains
            (Seq_range 0 (Seq_length a@5@01))
            (inv@64@01 (Seq_index res@7@01 (+ (* 2 i@148@01) 1)))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@68@01 (Seq_index res@7@01 (+ (* 2 i@148@01) 1)))
          (Seq_contains
            (Seq_range 0 (Seq_length b@6@01))
            (inv@67@01 (Seq_index res@7@01 (+ (* 2 i@148@01) 1)))))
        $Perm.Write
        $Perm.No))
    (ite
      (and
        (img@71@01 (Seq_index res@7@01 (+ (* 2 i@148@01) 1)))
        (Seq_contains
          (Seq_range 0 (Seq_length res@7@01))
          (inv@70@01 (Seq_index res@7@01 (+ (* 2 i@148@01) 1)))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [eval] b[i]
(push) ; 9
(assert (not (>= i@148@01 0)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(push) ; 9
(assert (not (< i@148@01 (Seq_length b@6@01))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@65@01 r)
        (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r))
    :qid |qp.fvfValDef4|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@68@01 r)
        (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r))
    :qid |qp.fvfValDef5|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@71@01 r)
        (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r))
    :qid |qp.fvfValDef6|))))
(push) ; 9
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and
          (img@65@01 (Seq_index b@6@01 i@148@01))
          (Seq_contains
            (Seq_range 0 (Seq_length a@5@01))
            (inv@64@01 (Seq_index b@6@01 i@148@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@68@01 (Seq_index b@6@01 i@148@01))
          (Seq_contains
            (Seq_range 0 (Seq_length b@6@01))
            (inv@67@01 (Seq_index b@6@01 i@148@01))))
        $Perm.Write
        $Perm.No))
    (ite
      (and
        (img@71@01 (Seq_index b@6@01 i@148@01))
        (Seq_contains
          (Seq_range 0 (Seq_length res@7@01))
          (inv@70@01 (Seq_index b@6@01 i@148@01))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(pop) ; 8
(push) ; 8
; [else-branch: 53 | !(i@148@01 in [0..|res@7@01| / 2])]
(assert (not (Seq_contains (Seq_range 0 (div (Seq_length res@7@01) 2)) i@148@01)))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@65@01 r)
      (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@68@01 r)
      (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@71@01 r)
      (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r))
  :qid |qp.fvfValDef6|)))
; Joined path conditions
(assert (or
  (not (Seq_contains (Seq_range 0 (div (Seq_length res@7@01) 2)) i@148@01))
  (Seq_contains (Seq_range 0 (div (Seq_length res@7@01) 2)) i@148@01)))
(pop) ; 6
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@65@01 r)
      (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@68@01 r)
      (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@71@01 r)
      (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r))
  :qid |qp.fvfValDef6|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@148@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 (div (Seq_length res@7@01) 2)) i@148@01))
    (Seq_contains (Seq_range 0 (div (Seq_length res@7@01) 2)) i@148@01))
  :pattern ((Seq_index b@6@01 i@148@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@97@11@97@116-aux|)))
(push) ; 6
(assert (not (forall ((i@148@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (div (Seq_length res@7@01) 2)) i@148@01)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) (Seq_index
        res@7@01
        (+ (* 2 i@148@01) 1)))
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) (Seq_index
        b@6@01
        i@148@01))))
  :pattern ((Seq_index b@6@01 i@148@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@97@11@97@116|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@148@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (div (Seq_length res@7@01) 2)) i@148@01)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) (Seq_index
        res@7@01
        (+ (* 2 i@148@01) 1)))
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) (Seq_index
        b@6@01
        i@148@01))))
  :pattern ((Seq_index b@6@01 i@148@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@97@11@97@116|)))
; [exec]
; assert (forall i: Int ::
;     { res[i] }
;     0 <= i && (i % 2 == 0 && i < |res|) ==>
;     res[i].Ref__Integer_value == a[i / 2].Ref__Integer_value)
; [eval] (forall i: Int :: { res[i] } 0 <= i && (i % 2 == 0 && i < |res|) ==> res[i].Ref__Integer_value == a[i / 2].Ref__Integer_value)
(declare-const i@149@01 Int)
(push) ; 6
; [eval] 0 <= i && (i % 2 == 0 && i < |res|) ==> res[i].Ref__Integer_value == a[i / 2].Ref__Integer_value
; [eval] 0 <= i && (i % 2 == 0 && i < |res|)
; [eval] 0 <= i
(push) ; 7
; [then-branch: 54 | !(0 <= i@149@01) | live]
; [else-branch: 54 | 0 <= i@149@01 | live]
(push) ; 8
; [then-branch: 54 | !(0 <= i@149@01)]
(assert (not (<= 0 i@149@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 54 | 0 <= i@149@01]
(assert (<= 0 i@149@01))
; [eval] i % 2 == 0
; [eval] i % 2
(push) ; 9
; [then-branch: 55 | i@149@01 % 2 != 0 | live]
; [else-branch: 55 | i@149@01 % 2 == 0 | live]
(push) ; 10
; [then-branch: 55 | i@149@01 % 2 != 0]
(assert (not (= (mod i@149@01 2) 0)))
(pop) ; 10
(push) ; 10
; [else-branch: 55 | i@149@01 % 2 == 0]
(assert (= (mod i@149@01 2) 0))
; [eval] i < |res|
; [eval] |res|
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (= (mod i@149@01 2) 0) (not (= (mod i@149@01 2) 0))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i@149@01)
  (and (<= 0 i@149@01) (or (= (mod i@149@01 2) 0) (not (= (mod i@149@01 2) 0))))))
(assert (or (<= 0 i@149@01) (not (<= 0 i@149@01))))
(push) ; 7
; [then-branch: 56 | 0 <= i@149@01 && i@149@01 % 2 == 0 && i@149@01 < |res@7@01| | live]
; [else-branch: 56 | !(0 <= i@149@01 && i@149@01 % 2 == 0 && i@149@01 < |res@7@01|) | live]
(push) ; 8
; [then-branch: 56 | 0 <= i@149@01 && i@149@01 % 2 == 0 && i@149@01 < |res@7@01|]
(assert (and
  (<= 0 i@149@01)
  (and (= (mod i@149@01 2) 0) (< i@149@01 (Seq_length res@7@01)))))
; [eval] res[i].Ref__Integer_value == a[i / 2].Ref__Integer_value
; [eval] res[i]
(push) ; 9
(assert (not (>= i@149@01 0)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@65@01 r)
        (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r))
    :qid |qp.fvfValDef4|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@68@01 r)
        (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r))
    :qid |qp.fvfValDef5|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@71@01 r)
        (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r))
    :qid |qp.fvfValDef6|))))
(push) ; 9
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and
          (img@65@01 (Seq_index res@7@01 i@149@01))
          (Seq_contains
            (Seq_range 0 (Seq_length a@5@01))
            (inv@64@01 (Seq_index res@7@01 i@149@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@68@01 (Seq_index res@7@01 i@149@01))
          (Seq_contains
            (Seq_range 0 (Seq_length b@6@01))
            (inv@67@01 (Seq_index res@7@01 i@149@01))))
        $Perm.Write
        $Perm.No))
    (ite
      (and
        (img@71@01 (Seq_index res@7@01 i@149@01))
        (Seq_contains
          (Seq_range 0 (Seq_length res@7@01))
          (inv@70@01 (Seq_index res@7@01 i@149@01))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [eval] a[i / 2]
; [eval] i / 2
(push) ; 9
(assert (not (>= (div i@149@01 2) 0)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(push) ; 9
(assert (not (< (div i@149@01 2) (Seq_length a@5@01))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@65@01 r)
        (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r))
    :qid |qp.fvfValDef4|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@68@01 r)
        (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r))
    :qid |qp.fvfValDef5|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@71@01 r)
        (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r))
    :qid |qp.fvfValDef6|))))
(push) ; 9
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and
          (img@65@01 (Seq_index a@5@01 (div i@149@01 2)))
          (Seq_contains
            (Seq_range 0 (Seq_length a@5@01))
            (inv@64@01 (Seq_index a@5@01 (div i@149@01 2)))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@68@01 (Seq_index a@5@01 (div i@149@01 2)))
          (Seq_contains
            (Seq_range 0 (Seq_length b@6@01))
            (inv@67@01 (Seq_index a@5@01 (div i@149@01 2)))))
        $Perm.Write
        $Perm.No))
    (ite
      (and
        (img@71@01 (Seq_index a@5@01 (div i@149@01 2)))
        (Seq_contains
          (Seq_range 0 (Seq_length res@7@01))
          (inv@70@01 (Seq_index a@5@01 (div i@149@01 2)))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(pop) ; 8
(push) ; 8
; [else-branch: 56 | !(0 <= i@149@01 && i@149@01 % 2 == 0 && i@149@01 < |res@7@01|)]
(assert (not
  (and
    (<= 0 i@149@01)
    (and (= (mod i@149@01 2) 0) (< i@149@01 (Seq_length res@7@01))))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@65@01 r)
      (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@68@01 r)
      (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@71@01 r)
      (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r))
  :qid |qp.fvfValDef6|)))
(assert (=>
  (and
    (<= 0 i@149@01)
    (and (= (mod i@149@01 2) 0) (< i@149@01 (Seq_length res@7@01))))
  (and (<= 0 i@149@01) (= (mod i@149@01 2) 0) (< i@149@01 (Seq_length res@7@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i@149@01)
      (and (= (mod i@149@01 2) 0) (< i@149@01 (Seq_length res@7@01)))))
  (and
    (<= 0 i@149@01)
    (and (= (mod i@149@01 2) 0) (< i@149@01 (Seq_length res@7@01))))))
(pop) ; 6
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@65@01 r)
      (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@68@01 r)
      (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@71@01 r)
      (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r))
  :qid |qp.fvfValDef6|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@149@01 Int)) (!
  (and
    (=>
      (<= 0 i@149@01)
      (and
        (<= 0 i@149@01)
        (or (= (mod i@149@01 2) 0) (not (= (mod i@149@01 2) 0)))))
    (or (<= 0 i@149@01) (not (<= 0 i@149@01)))
    (=>
      (and
        (<= 0 i@149@01)
        (and (= (mod i@149@01 2) 0) (< i@149@01 (Seq_length res@7@01))))
      (and
        (<= 0 i@149@01)
        (= (mod i@149@01 2) 0)
        (< i@149@01 (Seq_length res@7@01))))
    (or
      (not
        (and
          (<= 0 i@149@01)
          (and (= (mod i@149@01 2) 0) (< i@149@01 (Seq_length res@7@01)))))
      (and
        (<= 0 i@149@01)
        (and (= (mod i@149@01 2) 0) (< i@149@01 (Seq_length res@7@01))))))
  :pattern ((Seq_index res@7@01 i@149@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@98@11@98@130-aux|)))
(push) ; 6
(assert (not (forall ((i@149@01 Int)) (!
  (=>
    (and
      (<= 0 i@149@01)
      (and (= (mod i@149@01 2) 0) (< i@149@01 (Seq_length res@7@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) (Seq_index
        res@7@01
        i@149@01))
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) (Seq_index
        a@5@01
        (div i@149@01 2)))))
  :pattern ((Seq_index res@7@01 i@149@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@98@11@98@130|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@149@01 Int)) (!
  (=>
    (and
      (<= 0 i@149@01)
      (and (= (mod i@149@01 2) 0) (< i@149@01 (Seq_length res@7@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) (Seq_index
        res@7@01
        i@149@01))
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) (Seq_index
        a@5@01
        (div i@149@01 2)))))
  :pattern ((Seq_index res@7@01 i@149@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@98@11@98@130|)))
; [eval] |res| == 2 * |a|
; [eval] |res|
; [eval] 2 * |a|
; [eval] |a|
; [eval] |a| == |b|
; [eval] |a|
; [eval] |b|
; [eval] |res| == 2 * |b|
; [eval] |res|
; [eval] 2 * |b|
; [eval] |b|
(push) ; 6
(assert (not (= (Seq_length res@7@01) (* 2 (Seq_length b@6@01)))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (= (Seq_length res@7@01) (* 2 (Seq_length b@6@01))))
(declare-const i@150@01 Int)
(push) ; 6
; [eval] (i in [0..|a|))
; [eval] [0..|a|)
; [eval] |a|
(assert (Seq_contains (Seq_range 0 (Seq_length a@5@01)) i@150@01))
; [eval] a[i]
(push) ; 7
(assert (not (>= i@150@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@150@01 (Seq_length a@5@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(declare-fun inv@151@01 ($Ref) Int)
(declare-fun img@152@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 6
(assert (not (forall ((i1@150@01 Int) (i2@150@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length a@5@01)) i1@150@01)
      (Seq_contains (Seq_range 0 (Seq_length a@5@01)) i2@150@01)
      (= (Seq_index a@5@01 i1@150@01) (Seq_index a@5@01 i2@150@01)))
    (= i1@150@01 i2@150@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@150@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length a@5@01)) i@150@01)
    (and
      (= (inv@151@01 (Seq_index a@5@01 i@150@01)) i@150@01)
      (img@152@01 (Seq_index a@5@01 i@150@01))))
  :pattern ((Seq_index a@5@01 i@150@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@152@01 r)
      (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@151@01 r)))
    (= (Seq_index a@5@01 (inv@151@01 r)) r))
  :pattern ((inv@151@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(push) ; 6
(set-option :timeout 10)
(assert (not (forall ((i@150@01 Int)) (!
  (= (Seq_index a@5@01 i@150@01) (Seq_index b@6@01 i@150@01))
  
  :qid |quant-u-85|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (forall ((i@150@01 Int)) (!
  (= (Seq_index a@5@01 i@150@01) (Seq_index res@7@01 i@150@01))
  
  :qid |quant-u-86|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@153@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@151@01 r))
      (img@152@01 r)
      (= r (Seq_index a@5@01 (inv@151@01 r))))
    ($Perm.min
      (ite
        (and
          (img@65@01 r)
          (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@154@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@151@01 r))
      (img@152@01 r)
      (= r (Seq_index a@5@01 (inv@151@01 r))))
    ($Perm.min
      (ite
        (and
          (img@68@01 r)
          (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@153@01 r)))
    $Perm.No))
(define-fun pTaken@155@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@151@01 r))
      (img@152@01 r)
      (= r (Seq_index a@5@01 (inv@151@01 r))))
    ($Perm.min
      (ite
        (and
          (img@71@01 r)
          (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
        $Perm.Write
        $Perm.No)
      (- (- $Perm.Write (pTaken@153@01 r)) (pTaken@154@01 r)))
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
          (img@65@01 r)
          (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@153@01 r))
    $Perm.No)
  
  :qid |quant-u-88|))))
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
      (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@151@01 r))
      (img@152@01 r)
      (= r (Seq_index a@5@01 (inv@151@01 r))))
    (= (- $Perm.Write (pTaken@153@01 r)) $Perm.No))
  
  :qid |quant-u-89|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
; Definitional axioms for snapshot map values
(declare-const i@156@01 Int)
(set-option :timeout 0)
(push) ; 6
; [eval] (i in [0..|b|))
; [eval] [0..|b|)
; [eval] |b|
(assert (Seq_contains (Seq_range 0 (Seq_length b@6@01)) i@156@01))
; [eval] b[i]
(push) ; 7
(assert (not (>= i@156@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@156@01 (Seq_length b@6@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(declare-fun inv@157@01 ($Ref) Int)
(declare-fun img@158@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 6
(assert (not (forall ((i1@156@01 Int) (i2@156@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length b@6@01)) i1@156@01)
      (Seq_contains (Seq_range 0 (Seq_length b@6@01)) i2@156@01)
      (= (Seq_index b@6@01 i1@156@01) (Seq_index b@6@01 i2@156@01)))
    (= i1@156@01 i2@156@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@156@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length b@6@01)) i@156@01)
    (and
      (= (inv@157@01 (Seq_index b@6@01 i@156@01)) i@156@01)
      (img@158@01 (Seq_index b@6@01 i@156@01))))
  :pattern ((Seq_index b@6@01 i@156@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@158@01 r)
      (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@157@01 r)))
    (= (Seq_index b@6@01 (inv@157@01 r)) r))
  :pattern ((inv@157@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(push) ; 6
(set-option :timeout 10)
(assert (not (forall ((i@156@01 Int)) (!
  (= (Seq_index b@6@01 i@156@01) (Seq_index res@7@01 i@156@01))
  
  :qid |quant-u-91|))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@159@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@157@01 r))
      (img@158@01 r)
      (= r (Seq_index b@6@01 (inv@157@01 r))))
    ($Perm.min
      (ite
        (and
          (img@68@01 r)
          (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@160@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@157@01 r))
      (img@158@01 r)
      (= r (Seq_index b@6@01 (inv@157@01 r))))
    ($Perm.min
      (ite
        (and
          (img@71@01 r)
          (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@159@01 r)))
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
          (img@68@01 r)
          (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@159@01 r))
    $Perm.No)
  
  :qid |quant-u-93|))))
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
      (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@157@01 r))
      (img@158@01 r)
      (= r (Seq_index b@6@01 (inv@157@01 r))))
    (= (- $Perm.Write (pTaken@159@01 r)) $Perm.No))
  
  :qid |quant-u-94|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@161@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@71@01 r)
      (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@161@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@161@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r))
  :qid |qp.fvfValDef31|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@68@01 r)
      (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@161@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@161@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r))
  :qid |qp.fvfValDef32|)))
(declare-const i@162@01 Int)
(set-option :timeout 0)
(push) ; 6
; [eval] (i in [0..|res|))
; [eval] [0..|res|)
; [eval] |res|
(assert (Seq_contains (Seq_range 0 (Seq_length res@7@01)) i@162@01))
; [eval] res[i]
(push) ; 7
(assert (not (>= i@162@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@162@01 (Seq_length res@7@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(declare-fun inv@163@01 ($Ref) Int)
(declare-fun img@164@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
; Check receiver injectivity
(push) ; 6
(assert (not (forall ((i1@162@01 Int) (i2@162@01 Int)) (!
  (=>
    (and
      (Seq_contains (Seq_range 0 (Seq_length res@7@01)) i1@162@01)
      (Seq_contains (Seq_range 0 (Seq_length res@7@01)) i2@162@01)
      (= (Seq_index res@7@01 i1@162@01) (Seq_index res@7@01 i2@162@01)))
    (= i1@162@01 i2@162@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@162@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length res@7@01)) i@162@01)
    (and
      (= (inv@163@01 (Seq_index res@7@01 i@162@01)) i@162@01)
      (img@164@01 (Seq_index res@7@01 i@162@01))))
  :pattern ((Seq_index res@7@01 i@162@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@164@01 r)
      (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@163@01 r)))
    (= (Seq_index res@7@01 (inv@163@01 r)) r))
  :pattern ((inv@163@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@165@01 ((r $Ref)) $Perm
  (ite
    (and
      (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@163@01 r))
      (img@164@01 r)
      (= r (Seq_index res@7@01 (inv@163@01 r))))
    ($Perm.min
      (ite
        (and
          (img@71@01 r)
          (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
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
          (img@71@01 r)
          (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
        $Perm.Write
        $Perm.No)
      (pTaken@165@01 r))
    $Perm.No)
  
  :qid |quant-u-97|))))
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
      (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@163@01 r))
      (img@164@01 r)
      (= r (Seq_index res@7@01 (inv@163@01 r))))
    (= (- $Perm.Write (pTaken@165@01 r)) $Perm.No))
  
  :qid |quant-u-98|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@166@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@71@01 r)
      (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@166@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@166@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r))
  :qid |qp.fvfValDef33|)))
; [eval] (forall i: Int :: { (i in [0..|a|)) } { a[i] } (i in [0..|a|)) ==> res[2 * i].Ref__Integer_value == a[i].Ref__Integer_value)
(declare-const i@167@01 Int)
(set-option :timeout 0)
(push) ; 6
; [eval] (i in [0..|a|)) ==> res[2 * i].Ref__Integer_value == a[i].Ref__Integer_value
; [eval] (i in [0..|a|))
; [eval] [0..|a|)
; [eval] |a|
(push) ; 7
; [then-branch: 57 | i@167@01 in [0..|a@5@01|] | live]
; [else-branch: 57 | !(i@167@01 in [0..|a@5@01|]) | live]
(push) ; 8
; [then-branch: 57 | i@167@01 in [0..|a@5@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length a@5@01)) i@167@01))
; [eval] res[2 * i].Ref__Integer_value == a[i].Ref__Integer_value
; [eval] res[2 * i]
; [eval] 2 * i
(push) ; 9
(assert (not (>= (* 2 i@167@01) 0)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(push) ; 9
(assert (not (< (* 2 i@167@01) (Seq_length res@7@01))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@65@01 r)
        (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r))
    :qid |qp.fvfValDef4|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@68@01 r)
        (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r))
    :qid |qp.fvfValDef5|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@71@01 r)
        (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r))
    :qid |qp.fvfValDef6|))))
(push) ; 9
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and
          (img@65@01 (Seq_index res@7@01 (* 2 i@167@01)))
          (Seq_contains
            (Seq_range 0 (Seq_length a@5@01))
            (inv@64@01 (Seq_index res@7@01 (* 2 i@167@01)))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@68@01 (Seq_index res@7@01 (* 2 i@167@01)))
          (Seq_contains
            (Seq_range 0 (Seq_length b@6@01))
            (inv@67@01 (Seq_index res@7@01 (* 2 i@167@01)))))
        $Perm.Write
        $Perm.No))
    (ite
      (and
        (img@71@01 (Seq_index res@7@01 (* 2 i@167@01)))
        (Seq_contains
          (Seq_range 0 (Seq_length res@7@01))
          (inv@70@01 (Seq_index res@7@01 (* 2 i@167@01)))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [eval] a[i]
(push) ; 9
(assert (not (>= i@167@01 0)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(push) ; 9
(assert (not (< i@167@01 (Seq_length a@5@01))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@65@01 r)
        (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r))
    :qid |qp.fvfValDef4|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@68@01 r)
        (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r))
    :qid |qp.fvfValDef5|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@71@01 r)
        (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r))
    :qid |qp.fvfValDef6|))))
(push) ; 9
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and
          (img@65@01 (Seq_index a@5@01 i@167@01))
          (Seq_contains
            (Seq_range 0 (Seq_length a@5@01))
            (inv@64@01 (Seq_index a@5@01 i@167@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@68@01 (Seq_index a@5@01 i@167@01))
          (Seq_contains
            (Seq_range 0 (Seq_length b@6@01))
            (inv@67@01 (Seq_index a@5@01 i@167@01))))
        $Perm.Write
        $Perm.No))
    (ite
      (and
        (img@71@01 (Seq_index a@5@01 i@167@01))
        (Seq_contains
          (Seq_range 0 (Seq_length res@7@01))
          (inv@70@01 (Seq_index a@5@01 i@167@01))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(pop) ; 8
(push) ; 8
; [else-branch: 57 | !(i@167@01 in [0..|a@5@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length a@5@01)) i@167@01)))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@65@01 r)
      (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@68@01 r)
      (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@71@01 r)
      (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r))
  :qid |qp.fvfValDef6|)))
; Joined path conditions
(assert (or
  (not (Seq_contains (Seq_range 0 (Seq_length a@5@01)) i@167@01))
  (Seq_contains (Seq_range 0 (Seq_length a@5@01)) i@167@01)))
(pop) ; 6
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@65@01 r)
      (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@68@01 r)
      (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@71@01 r)
      (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r))
  :qid |qp.fvfValDef6|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@167@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 (Seq_length a@5@01)) i@167@01))
    (Seq_contains (Seq_range 0 (Seq_length a@5@01)) i@167@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length a@5@01)) i@167@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length a@5@01)) i@167@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@27@12@27@107-aux|)))
(assert (forall ((i@167@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 (Seq_length a@5@01)) i@167@01))
    (Seq_contains (Seq_range 0 (Seq_length a@5@01)) i@167@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length a@5@01)) i@167@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@27@12@27@107-aux|)))
(assert (forall ((i@167@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 (Seq_length a@5@01)) i@167@01))
    (Seq_contains (Seq_range 0 (Seq_length a@5@01)) i@167@01))
  :pattern ((Seq_index a@5@01 i@167@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@27@12@27@107-aux|)))
(push) ; 6
(assert (not (forall ((i@167@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length a@5@01)) i@167@01)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) (Seq_index
        res@7@01
        (* 2 i@167@01)))
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) (Seq_index
        a@5@01
        i@167@01))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length a@5@01)) i@167@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length a@5@01)) i@167@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length a@5@01)) i@167@01))
  :pattern ((Seq_index a@5@01 i@167@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@27@12@27@107|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@167@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length a@5@01)) i@167@01)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) (Seq_index
        res@7@01
        (* 2 i@167@01)))
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) (Seq_index
        a@5@01
        i@167@01))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length a@5@01)) i@167@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length a@5@01)) i@167@01))
  :pattern ((Seq_index a@5@01 i@167@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@27@12@27@107|)))
; [eval] (forall i: Int :: { res[i] } 0 <= i && (i % 2 == 1 && i < |res|) ==> res[i].Ref__Integer_value == b[i / 2].Ref__Integer_value)
(declare-const i@168@01 Int)
(push) ; 6
; [eval] 0 <= i && (i % 2 == 1 && i < |res|) ==> res[i].Ref__Integer_value == b[i / 2].Ref__Integer_value
; [eval] 0 <= i && (i % 2 == 1 && i < |res|)
; [eval] 0 <= i
(push) ; 7
; [then-branch: 58 | !(0 <= i@168@01) | live]
; [else-branch: 58 | 0 <= i@168@01 | live]
(push) ; 8
; [then-branch: 58 | !(0 <= i@168@01)]
(assert (not (<= 0 i@168@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 58 | 0 <= i@168@01]
(assert (<= 0 i@168@01))
; [eval] i % 2 == 1
; [eval] i % 2
(push) ; 9
; [then-branch: 59 | i@168@01 % 2 != 1 | live]
; [else-branch: 59 | i@168@01 % 2 == 1 | live]
(push) ; 10
; [then-branch: 59 | i@168@01 % 2 != 1]
(assert (not (= (mod i@168@01 2) 1)))
(pop) ; 10
(push) ; 10
; [else-branch: 59 | i@168@01 % 2 == 1]
(assert (= (mod i@168@01 2) 1))
; [eval] i < |res|
; [eval] |res|
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (= (mod i@168@01 2) 1) (not (= (mod i@168@01 2) 1))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i@168@01)
  (and (<= 0 i@168@01) (or (= (mod i@168@01 2) 1) (not (= (mod i@168@01 2) 1))))))
(assert (or (<= 0 i@168@01) (not (<= 0 i@168@01))))
(push) ; 7
; [then-branch: 60 | 0 <= i@168@01 && i@168@01 % 2 == 1 && i@168@01 < |res@7@01| | live]
; [else-branch: 60 | !(0 <= i@168@01 && i@168@01 % 2 == 1 && i@168@01 < |res@7@01|) | live]
(push) ; 8
; [then-branch: 60 | 0 <= i@168@01 && i@168@01 % 2 == 1 && i@168@01 < |res@7@01|]
(assert (and
  (<= 0 i@168@01)
  (and (= (mod i@168@01 2) 1) (< i@168@01 (Seq_length res@7@01)))))
; [eval] res[i].Ref__Integer_value == b[i / 2].Ref__Integer_value
; [eval] res[i]
(push) ; 9
(assert (not (>= i@168@01 0)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@65@01 r)
        (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r))
    :qid |qp.fvfValDef4|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@68@01 r)
        (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r))
    :qid |qp.fvfValDef5|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@71@01 r)
        (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r))
    :qid |qp.fvfValDef6|))))
(push) ; 9
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and
          (img@65@01 (Seq_index res@7@01 i@168@01))
          (Seq_contains
            (Seq_range 0 (Seq_length a@5@01))
            (inv@64@01 (Seq_index res@7@01 i@168@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@68@01 (Seq_index res@7@01 i@168@01))
          (Seq_contains
            (Seq_range 0 (Seq_length b@6@01))
            (inv@67@01 (Seq_index res@7@01 i@168@01))))
        $Perm.Write
        $Perm.No))
    (ite
      (and
        (img@71@01 (Seq_index res@7@01 i@168@01))
        (Seq_contains
          (Seq_range 0 (Seq_length res@7@01))
          (inv@70@01 (Seq_index res@7@01 i@168@01))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [eval] b[i / 2]
; [eval] i / 2
(push) ; 9
(assert (not (>= (div i@168@01 2) 0)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(push) ; 9
(assert (not (< (div i@168@01 2) (Seq_length b@6@01))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@65@01 r)
        (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r))
    :qid |qp.fvfValDef4|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@68@01 r)
        (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r))
    :qid |qp.fvfValDef5|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@71@01 r)
        (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r))
    :qid |qp.fvfValDef6|))))
(push) ; 9
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and
          (img@65@01 (Seq_index b@6@01 (div i@168@01 2)))
          (Seq_contains
            (Seq_range 0 (Seq_length a@5@01))
            (inv@64@01 (Seq_index b@6@01 (div i@168@01 2)))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@68@01 (Seq_index b@6@01 (div i@168@01 2)))
          (Seq_contains
            (Seq_range 0 (Seq_length b@6@01))
            (inv@67@01 (Seq_index b@6@01 (div i@168@01 2)))))
        $Perm.Write
        $Perm.No))
    (ite
      (and
        (img@71@01 (Seq_index b@6@01 (div i@168@01 2)))
        (Seq_contains
          (Seq_range 0 (Seq_length res@7@01))
          (inv@70@01 (Seq_index b@6@01 (div i@168@01 2)))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(pop) ; 8
(push) ; 8
; [else-branch: 60 | !(0 <= i@168@01 && i@168@01 % 2 == 1 && i@168@01 < |res@7@01|)]
(assert (not
  (and
    (<= 0 i@168@01)
    (and (= (mod i@168@01 2) 1) (< i@168@01 (Seq_length res@7@01))))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@65@01 r)
      (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@68@01 r)
      (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@71@01 r)
      (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r))
  :qid |qp.fvfValDef6|)))
(assert (=>
  (and
    (<= 0 i@168@01)
    (and (= (mod i@168@01 2) 1) (< i@168@01 (Seq_length res@7@01))))
  (and (<= 0 i@168@01) (= (mod i@168@01 2) 1) (< i@168@01 (Seq_length res@7@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i@168@01)
      (and (= (mod i@168@01 2) 1) (< i@168@01 (Seq_length res@7@01)))))
  (and
    (<= 0 i@168@01)
    (and (= (mod i@168@01 2) 1) (< i@168@01 (Seq_length res@7@01))))))
(pop) ; 6
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@65@01 r)
      (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@68@01 r)
      (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@71@01 r)
      (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r))
  :qid |qp.fvfValDef6|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@168@01 Int)) (!
  (and
    (=>
      (<= 0 i@168@01)
      (and
        (<= 0 i@168@01)
        (or (= (mod i@168@01 2) 1) (not (= (mod i@168@01 2) 1)))))
    (or (<= 0 i@168@01) (not (<= 0 i@168@01)))
    (=>
      (and
        (<= 0 i@168@01)
        (and (= (mod i@168@01 2) 1) (< i@168@01 (Seq_length res@7@01))))
      (and
        (<= 0 i@168@01)
        (= (mod i@168@01 2) 1)
        (< i@168@01 (Seq_length res@7@01))))
    (or
      (not
        (and
          (<= 0 i@168@01)
          (and (= (mod i@168@01 2) 1) (< i@168@01 (Seq_length res@7@01)))))
      (and
        (<= 0 i@168@01)
        (and (= (mod i@168@01 2) 1) (< i@168@01 (Seq_length res@7@01))))))
  :pattern ((Seq_index res@7@01 i@168@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@49@12@49@131-aux|)))
(push) ; 6
(assert (not (forall ((i@168@01 Int)) (!
  (=>
    (and
      (<= 0 i@168@01)
      (and (= (mod i@168@01 2) 1) (< i@168@01 (Seq_length res@7@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) (Seq_index
        res@7@01
        i@168@01))
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) (Seq_index
        b@6@01
        (div i@168@01 2)))))
  :pattern ((Seq_index res@7@01 i@168@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@49@12@49@131|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@168@01 Int)) (!
  (=>
    (and
      (<= 0 i@168@01)
      (and (= (mod i@168@01 2) 1) (< i@168@01 (Seq_length res@7@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) (Seq_index
        res@7@01
        i@168@01))
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) (Seq_index
        b@6@01
        (div i@168@01 2)))))
  :pattern ((Seq_index res@7@01 i@168@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@49@12@49@131|)))
; [eval] (forall i: Int :: { (i in [0..|b|)) } { b[i] } (i in [0..|b|)) ==> res[2 * i + 1].Ref__Integer_value == b[i].Ref__Integer_value)
(declare-const i@169@01 Int)
(push) ; 6
; [eval] (i in [0..|b|)) ==> res[2 * i + 1].Ref__Integer_value == b[i].Ref__Integer_value
; [eval] (i in [0..|b|))
; [eval] [0..|b|)
; [eval] |b|
(push) ; 7
; [then-branch: 61 | i@169@01 in [0..|b@6@01|] | live]
; [else-branch: 61 | !(i@169@01 in [0..|b@6@01|]) | live]
(push) ; 8
; [then-branch: 61 | i@169@01 in [0..|b@6@01|]]
(assert (Seq_contains (Seq_range 0 (Seq_length b@6@01)) i@169@01))
; [eval] res[2 * i + 1].Ref__Integer_value == b[i].Ref__Integer_value
; [eval] res[2 * i + 1]
; [eval] 2 * i + 1
; [eval] 2 * i
(push) ; 9
(assert (not (>= (+ (* 2 i@169@01) 1) 0)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(push) ; 9
(assert (not (< (+ (* 2 i@169@01) 1) (Seq_length res@7@01))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@65@01 r)
        (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r))
    :qid |qp.fvfValDef4|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@68@01 r)
        (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r))
    :qid |qp.fvfValDef5|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@71@01 r)
        (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r))
    :qid |qp.fvfValDef6|))))
(push) ; 9
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and
          (img@65@01 (Seq_index res@7@01 (+ (* 2 i@169@01) 1)))
          (Seq_contains
            (Seq_range 0 (Seq_length a@5@01))
            (inv@64@01 (Seq_index res@7@01 (+ (* 2 i@169@01) 1)))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@68@01 (Seq_index res@7@01 (+ (* 2 i@169@01) 1)))
          (Seq_contains
            (Seq_range 0 (Seq_length b@6@01))
            (inv@67@01 (Seq_index res@7@01 (+ (* 2 i@169@01) 1)))))
        $Perm.Write
        $Perm.No))
    (ite
      (and
        (img@71@01 (Seq_index res@7@01 (+ (* 2 i@169@01) 1)))
        (Seq_contains
          (Seq_range 0 (Seq_length res@7@01))
          (inv@70@01 (Seq_index res@7@01 (+ (* 2 i@169@01) 1)))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [eval] b[i]
(push) ; 9
(assert (not (>= i@169@01 0)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(push) ; 9
(assert (not (< i@169@01 (Seq_length b@6@01))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@65@01 r)
        (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r))
    :qid |qp.fvfValDef4|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@68@01 r)
        (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r))
    :qid |qp.fvfValDef5|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@71@01 r)
        (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r))
    :qid |qp.fvfValDef6|))))
(push) ; 9
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and
          (img@65@01 (Seq_index b@6@01 i@169@01))
          (Seq_contains
            (Seq_range 0 (Seq_length a@5@01))
            (inv@64@01 (Seq_index b@6@01 i@169@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@68@01 (Seq_index b@6@01 i@169@01))
          (Seq_contains
            (Seq_range 0 (Seq_length b@6@01))
            (inv@67@01 (Seq_index b@6@01 i@169@01))))
        $Perm.Write
        $Perm.No))
    (ite
      (and
        (img@71@01 (Seq_index b@6@01 i@169@01))
        (Seq_contains
          (Seq_range 0 (Seq_length res@7@01))
          (inv@70@01 (Seq_index b@6@01 i@169@01))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(pop) ; 8
(push) ; 8
; [else-branch: 61 | !(i@169@01 in [0..|b@6@01|])]
(assert (not (Seq_contains (Seq_range 0 (Seq_length b@6@01)) i@169@01)))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@65@01 r)
      (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@68@01 r)
      (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@71@01 r)
      (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r))
  :qid |qp.fvfValDef6|)))
; Joined path conditions
(assert (or
  (not (Seq_contains (Seq_range 0 (Seq_length b@6@01)) i@169@01))
  (Seq_contains (Seq_range 0 (Seq_length b@6@01)) i@169@01)))
(pop) ; 6
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@65@01 r)
      (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@68@01 r)
      (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@71@01 r)
      (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r))
  :qid |qp.fvfValDef6|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@169@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 (Seq_length b@6@01)) i@169@01))
    (Seq_contains (Seq_range 0 (Seq_length b@6@01)) i@169@01))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length b@6@01)) i@169@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length b@6@01)) i@169@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@50@12@50@111-aux|)))
(assert (forall ((i@169@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 (Seq_length b@6@01)) i@169@01))
    (Seq_contains (Seq_range 0 (Seq_length b@6@01)) i@169@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length b@6@01)) i@169@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@50@12@50@111-aux|)))
(assert (forall ((i@169@01 Int)) (!
  (or
    (not (Seq_contains (Seq_range 0 (Seq_length b@6@01)) i@169@01))
    (Seq_contains (Seq_range 0 (Seq_length b@6@01)) i@169@01))
  :pattern ((Seq_index b@6@01 i@169@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@50@12@50@111-aux|)))
(push) ; 6
(assert (not (forall ((i@169@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length b@6@01)) i@169@01)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) (Seq_index
        res@7@01
        (+ (* 2 i@169@01) 1)))
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) (Seq_index
        b@6@01
        i@169@01))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length b@6@01)) i@169@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length b@6@01)) i@169@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length b@6@01)) i@169@01))
  :pattern ((Seq_index b@6@01 i@169@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@50@12@50@111|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@169@01 Int)) (!
  (=>
    (Seq_contains (Seq_range 0 (Seq_length b@6@01)) i@169@01)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) (Seq_index
        res@7@01
        (+ (* 2 i@169@01) 1)))
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) (Seq_index
        b@6@01
        i@169@01))))
  :pattern ((Seq_contains (Seq_range 0 (Seq_length b@6@01)) i@169@01))
  :pattern ((Seq_contains_trigger (Seq_range 0 (Seq_length b@6@01)) i@169@01))
  :pattern ((Seq_index b@6@01 i@169@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@50@12@50@111|)))
; [eval] (forall i: Int :: { res[i] } 0 <= i && (i % 2 == 0 && i < |res|) ==> res[i].Ref__Integer_value == a[i / 2].Ref__Integer_value)
(declare-const i@170@01 Int)
(push) ; 6
; [eval] 0 <= i && (i % 2 == 0 && i < |res|) ==> res[i].Ref__Integer_value == a[i / 2].Ref__Integer_value
; [eval] 0 <= i && (i % 2 == 0 && i < |res|)
; [eval] 0 <= i
(push) ; 7
; [then-branch: 62 | !(0 <= i@170@01) | live]
; [else-branch: 62 | 0 <= i@170@01 | live]
(push) ; 8
; [then-branch: 62 | !(0 <= i@170@01)]
(assert (not (<= 0 i@170@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 62 | 0 <= i@170@01]
(assert (<= 0 i@170@01))
; [eval] i % 2 == 0
; [eval] i % 2
(push) ; 9
; [then-branch: 63 | i@170@01 % 2 != 0 | live]
; [else-branch: 63 | i@170@01 % 2 == 0 | live]
(push) ; 10
; [then-branch: 63 | i@170@01 % 2 != 0]
(assert (not (= (mod i@170@01 2) 0)))
(pop) ; 10
(push) ; 10
; [else-branch: 63 | i@170@01 % 2 == 0]
(assert (= (mod i@170@01 2) 0))
; [eval] i < |res|
; [eval] |res|
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (= (mod i@170@01 2) 0) (not (= (mod i@170@01 2) 0))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 i@170@01)
  (and (<= 0 i@170@01) (or (= (mod i@170@01 2) 0) (not (= (mod i@170@01 2) 0))))))
(assert (or (<= 0 i@170@01) (not (<= 0 i@170@01))))
(push) ; 7
; [then-branch: 64 | 0 <= i@170@01 && i@170@01 % 2 == 0 && i@170@01 < |res@7@01| | live]
; [else-branch: 64 | !(0 <= i@170@01 && i@170@01 % 2 == 0 && i@170@01 < |res@7@01|) | live]
(push) ; 8
; [then-branch: 64 | 0 <= i@170@01 && i@170@01 % 2 == 0 && i@170@01 < |res@7@01|]
(assert (and
  (<= 0 i@170@01)
  (and (= (mod i@170@01 2) 0) (< i@170@01 (Seq_length res@7@01)))))
; [eval] res[i].Ref__Integer_value == a[i / 2].Ref__Integer_value
; [eval] res[i]
(push) ; 9
(assert (not (>= i@170@01 0)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@65@01 r)
        (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r))
    :qid |qp.fvfValDef4|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@68@01 r)
        (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r))
    :qid |qp.fvfValDef5|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@71@01 r)
        (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r))
    :qid |qp.fvfValDef6|))))
(push) ; 9
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and
          (img@65@01 (Seq_index res@7@01 i@170@01))
          (Seq_contains
            (Seq_range 0 (Seq_length a@5@01))
            (inv@64@01 (Seq_index res@7@01 i@170@01))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@68@01 (Seq_index res@7@01 i@170@01))
          (Seq_contains
            (Seq_range 0 (Seq_length b@6@01))
            (inv@67@01 (Seq_index res@7@01 i@170@01))))
        $Perm.Write
        $Perm.No))
    (ite
      (and
        (img@71@01 (Seq_index res@7@01 i@170@01))
        (Seq_contains
          (Seq_range 0 (Seq_length res@7@01))
          (inv@70@01 (Seq_index res@7@01 i@170@01))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
; [eval] a[i / 2]
; [eval] i / 2
(push) ; 9
(assert (not (>= (div i@170@01 2) 0)))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(push) ; 9
(assert (not (< (div i@170@01 2) (Seq_length a@5@01))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(assert (and
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@65@01 r)
        (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r))
    :qid |qp.fvfValDef4|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@68@01 r)
        (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r))
    :qid |qp.fvfValDef5|))
  (forall ((r $Ref)) (!
    (=>
      (and
        (img@71@01 r)
        (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
      (=
        ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
        ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r)))
    :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
    :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r))
    :qid |qp.fvfValDef6|))))
(push) ; 9
(assert (not (<
  $Perm.No
  (+
    (+
      (ite
        (and
          (img@65@01 (Seq_index a@5@01 (div i@170@01 2)))
          (Seq_contains
            (Seq_range 0 (Seq_length a@5@01))
            (inv@64@01 (Seq_index a@5@01 (div i@170@01 2)))))
        $Perm.Write
        $Perm.No)
      (ite
        (and
          (img@68@01 (Seq_index a@5@01 (div i@170@01 2)))
          (Seq_contains
            (Seq_range 0 (Seq_length b@6@01))
            (inv@67@01 (Seq_index a@5@01 (div i@170@01 2)))))
        $Perm.Write
        $Perm.No))
    (ite
      (and
        (img@71@01 (Seq_index a@5@01 (div i@170@01 2)))
        (Seq_contains
          (Seq_range 0 (Seq_length res@7@01))
          (inv@70@01 (Seq_index a@5@01 (div i@170@01 2)))))
      $Perm.Write
      $Perm.No)))))
(check-sat)
; unsat
(pop) ; 9
; 0,00s
; (get-info :all-statistics)
(pop) ; 8
(push) ; 8
; [else-branch: 64 | !(0 <= i@170@01 && i@170@01 % 2 == 0 && i@170@01 < |res@7@01|)]
(assert (not
  (and
    (<= 0 i@170@01)
    (and (= (mod i@170@01 2) 0) (< i@170@01 (Seq_length res@7@01))))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@65@01 r)
      (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@68@01 r)
      (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@71@01 r)
      (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r))
  :qid |qp.fvfValDef6|)))
(assert (=>
  (and
    (<= 0 i@170@01)
    (and (= (mod i@170@01 2) 0) (< i@170@01 (Seq_length res@7@01))))
  (and (<= 0 i@170@01) (= (mod i@170@01 2) 0) (< i@170@01 (Seq_length res@7@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 i@170@01)
      (and (= (mod i@170@01 2) 0) (< i@170@01 (Seq_length res@7@01)))))
  (and
    (<= 0 i@170@01)
    (and (= (mod i@170@01 2) 0) (< i@170@01 (Seq_length res@7@01))))))
(pop) ; 6
; Nested auxiliary terms: globals (aux)
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@65@01 r)
      (Seq_contains (Seq_range 0 (Seq_length a@5@01)) (inv@64@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@68@01 r)
      (Seq_contains (Seq_range 0 (Seq_length b@6@01)) (inv@67@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01)))))))) r))
  :qid |qp.fvfValDef5|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@71@01 r)
      (Seq_contains (Seq_range 0 (Seq_length res@7@01)) (inv@70@01 r)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@62@01))))))))) r))
  :qid |qp.fvfValDef6|)))
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((i@170@01 Int)) (!
  (and
    (=>
      (<= 0 i@170@01)
      (and
        (<= 0 i@170@01)
        (or (= (mod i@170@01 2) 0) (not (= (mod i@170@01 2) 0)))))
    (or (<= 0 i@170@01) (not (<= 0 i@170@01)))
    (=>
      (and
        (<= 0 i@170@01)
        (and (= (mod i@170@01 2) 0) (< i@170@01 (Seq_length res@7@01))))
      (and
        (<= 0 i@170@01)
        (= (mod i@170@01 2) 0)
        (< i@170@01 (Seq_length res@7@01))))
    (or
      (not
        (and
          (<= 0 i@170@01)
          (and (= (mod i@170@01 2) 0) (< i@170@01 (Seq_length res@7@01)))))
      (and
        (<= 0 i@170@01)
        (and (= (mod i@170@01 2) 0) (< i@170@01 (Seq_length res@7@01))))))
  :pattern ((Seq_index res@7@01 i@170@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@51@12@51@131-aux|)))
(push) ; 6
(assert (not (forall ((i@170@01 Int)) (!
  (=>
    (and
      (<= 0 i@170@01)
      (and (= (mod i@170@01 2) 0) (< i@170@01 (Seq_length res@7@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) (Seq_index
        res@7@01
        i@170@01))
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) (Seq_index
        a@5@01
        (div i@170@01 2)))))
  :pattern ((Seq_index res@7@01 i@170@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@51@12@51@131|))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (forall ((i@170@01 Int)) (!
  (=>
    (and
      (<= 0 i@170@01)
      (and (= (mod i@170@01 2) 0) (< i@170@01 (Seq_length res@7@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) (Seq_index
        res@7@01
        i@170@01))
      ($FVF.lookup_Ref__Integer_value (as sm@73@01  $FVF<Ref__Integer_value>) (Seq_index
        a@5@01
        (div i@170@01 2)))))
  :pattern ((Seq_index res@7@01 i@170@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/fmse-2015-04-16.vpr@51@12@51@131|)))
(pop) ; 5
(push) ; 5
; [else-branch: 48 | k@61@01 < |res@7@01|]
(assert (< k@61@01 (Seq_length res@7@01)))
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- Exercise4__Exercise4 ----------
(declare-const sys__result@171@01 $Ref)
(declare-const sys__result@172@01 $Ref)
(push) ; 1
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@173@01 $Snap)
(assert (= $t@173@01 $Snap.unit))
; [eval] sys__result != null
(assert (not (= sys__result@172@01 $Ref.null)))
(pop) ; 2
(push) ; 2
; [exec]
; var diz: Ref
(declare-const diz@174@01 $Ref)
; [exec]
; var __flatten_11: Ref
(declare-const __flatten_11@175@01 $Ref)
; [exec]
; __flatten_11 := new(Exercise4__Integer_value)
(declare-const __flatten_11@176@01 $Ref)
(assert (not (= __flatten_11@176@01 $Ref.null)))
(declare-const Exercise4__Integer_value@177@01 Int)
(assert (not (= __flatten_11@176@01 __flatten_11@175@01)))
(assert (not (= __flatten_11@176@01 diz@174@01)))
(assert (not (= __flatten_11@176@01 sys__result@172@01)))
; [exec]
; diz := __flatten_11
; [exec]
; sys__result := diz
; [exec]
; assert sys__result != null
; [eval] sys__result != null
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
