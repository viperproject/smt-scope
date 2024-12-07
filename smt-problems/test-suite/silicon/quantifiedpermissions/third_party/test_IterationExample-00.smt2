(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:22:52
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_IterationExample.vpr
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
(declare-fun count_list ($Snap Int Int Seq<Int> Int) Int)
(declare-fun count_list%limited ($Snap Int Int Seq<Int> Int) Int)
(declare-fun count_list%stateless (Int Int Seq<Int> Int) Bool)
(declare-fun count_list%precondition ($Snap Int Int Seq<Int> Int) Bool)
(declare-fun sum_square ($Snap Int Int Int Int Int Int Seq<$Ref>) Int)
(declare-fun sum_square%limited ($Snap Int Int Int Int Int Int Seq<$Ref>) Int)
(declare-fun sum_square%stateless (Int Int Int Int Int Int Seq<$Ref>) Bool)
(declare-fun sum_square%precondition ($Snap Int Int Int Int Int Int Seq<$Ref>) Bool)
(declare-fun sum_array ($Snap Int Int Int Seq<$Ref>) Int)
(declare-fun sum_array%limited ($Snap Int Int Int Seq<$Ref>) Int)
(declare-fun sum_array%stateless (Int Int Int Seq<$Ref>) Bool)
(declare-fun sum_array%precondition ($Snap Int Int Int Seq<$Ref>) Bool)
(declare-fun sum_list ($Snap Int Int Seq<Int>) Int)
(declare-fun sum_list%limited ($Snap Int Int Seq<Int>) Int)
(declare-fun sum_list%stateless (Int Int Seq<Int>) Bool)
(declare-fun sum_list%precondition ($Snap Int Int Seq<Int>) Bool)
(declare-fun count_array ($Snap Int Int Seq<$Ref> Int) Int)
(declare-fun count_array%limited ($Snap Int Int Seq<$Ref> Int) Int)
(declare-fun count_array%stateless (Int Int Seq<$Ref> Int) Bool)
(declare-fun count_array%precondition ($Snap Int Int Seq<$Ref> Int) Bool)
(declare-fun count_square ($Snap Int Int Int Int Int Int Seq<$Ref> Int) Int)
(declare-fun count_square%limited ($Snap Int Int Int Int Int Int Seq<$Ref> Int) Int)
(declare-fun count_square%stateless (Int Int Int Int Int Int Seq<$Ref> Int) Bool)
(declare-fun count_square%precondition ($Snap Int Int Int Int Int Int Seq<$Ref> Int) Bool)
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
(declare-fun $k@39@00 () $Perm)
(declare-fun inv@40@00 ($Snap Int Int Int Int Int Int Seq<$Ref> $Ref) Int)
(declare-fun img@41@00 ($Snap Int Int Int Int Int Int Seq<$Ref> $Ref) Bool)
(declare-fun $k@45@00 () $Perm)
(declare-fun inv@46@00 ($Snap Int Int Int Int Int Int Seq<$Ref> $Ref) Int)
(declare-fun img@47@00 ($Snap Int Int Int Int Int Int Seq<$Ref> $Ref) Bool)
(declare-fun sm@48@00 ($Snap Int Int Int Int Int Int Seq<$Ref>) $FVF<Ref__Integer_value>)
(declare-fun $k@52@00 () $Perm)
(declare-fun inv@53@00 ($Snap Int Int Int Seq<$Ref> $Ref) Int)
(declare-fun img@54@00 ($Snap Int Int Int Seq<$Ref> $Ref) Bool)
(declare-fun $k@58@00 () $Perm)
(declare-fun inv@59@00 ($Snap Int Int Int Seq<$Ref> $Ref) Int)
(declare-fun img@60@00 ($Snap Int Int Int Seq<$Ref> $Ref) Bool)
(declare-fun sm@61@00 ($Snap Int Int Int Seq<$Ref>) $FVF<Ref__Integer_value>)
(declare-fun $k@65@00 () $Perm)
(declare-fun inv@66@00 ($Snap Int Int Seq<$Ref> Int $Ref) Int)
(declare-fun img@67@00 ($Snap Int Int Seq<$Ref> Int $Ref) Bool)
(declare-fun $k@71@00 () $Perm)
(declare-fun inv@72@00 ($Snap Int Int Seq<$Ref> Int $Ref) Int)
(declare-fun img@73@00 ($Snap Int Int Seq<$Ref> Int $Ref) Bool)
(declare-fun sm@74@00 ($Snap Int Int Seq<$Ref> Int) $FVF<Ref__Integer_value>)
(declare-fun $k@78@00 () $Perm)
(declare-fun inv@79@00 ($Snap Int Int Int Int Int Int Seq<$Ref> Int $Ref) Int)
(declare-fun img@80@00 ($Snap Int Int Int Int Int Int Seq<$Ref> Int $Ref) Bool)
(declare-fun $k@84@00 () $Perm)
(declare-fun inv@85@00 ($Snap Int Int Int Int Int Int Seq<$Ref> Int $Ref) Int)
(declare-fun img@86@00 ($Snap Int Int Int Int Int Int Seq<$Ref> Int $Ref) Bool)
(declare-fun sm@87@00 ($Snap Int Int Int Int Int Int Seq<$Ref> Int) $FVF<Ref__Integer_value>)
(assert (forall ((s@$ $Snap) (i@0@00 Int) (hi@1@00 Int) (ar@2@00 Seq<Int>) (v@3@00 Int)) (!
  (=
    (count_list%limited s@$ i@0@00 hi@1@00 ar@2@00 v@3@00)
    (count_list s@$ i@0@00 hi@1@00 ar@2@00 v@3@00))
  :pattern ((count_list s@$ i@0@00 hi@1@00 ar@2@00 v@3@00))
  :qid |quant-u-0|)))
(assert (forall ((s@$ $Snap) (i@0@00 Int) (hi@1@00 Int) (ar@2@00 Seq<Int>) (v@3@00 Int)) (!
  (count_list%stateless i@0@00 hi@1@00 ar@2@00 v@3@00)
  :pattern ((count_list%limited s@$ i@0@00 hi@1@00 ar@2@00 v@3@00))
  :qid |quant-u-1|)))
(assert (forall ((s@$ $Snap) (i@0@00 Int) (hi@1@00 Int) (ar@2@00 Seq<Int>) (v@3@00 Int)) (!
  (=>
    (count_list%precondition s@$ i@0@00 hi@1@00 ar@2@00 v@3@00)
    (=
      (count_list s@$ i@0@00 hi@1@00 ar@2@00 v@3@00)
      (ite
        (< i@0@00 hi@1@00)
        (+
          (ite (= (Seq_index ar@2@00 i@0@00) v@3@00) 1 0)
          (count_list%limited ($Snap.combine
            $Snap.unit
            ($Snap.combine $Snap.unit $Snap.unit)) (+ i@0@00 1) hi@1@00 ar@2@00 v@3@00))
        0)))
  :pattern ((count_list s@$ i@0@00 hi@1@00 ar@2@00 v@3@00))
  :qid |quant-u-12|)))
(assert (forall ((s@$ $Snap) (i@0@00 Int) (hi@1@00 Int) (ar@2@00 Seq<Int>) (v@3@00 Int)) (!
  (=>
    (count_list%precondition s@$ i@0@00 hi@1@00 ar@2@00 v@3@00)
    (ite
      (< i@0@00 hi@1@00)
      (count_list%precondition ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit $Snap.unit)) (+ i@0@00 1) hi@1@00 ar@2@00 v@3@00)
      true))
  :pattern ((count_list s@$ i@0@00 hi@1@00 ar@2@00 v@3@00))
  :qid |quant-u-13|)))
(assert (forall ((s@$ $Snap) (i@5@00 Int) (lo@6@00 Int) (hi@7@00 Int) (step@8@00 Int) (min@9@00 Int) (max@10@00 Int) (ar@11@00 Seq<$Ref>)) (!
  (=
    (sum_square%limited s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00)
    (sum_square s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00))
  :pattern ((sum_square s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (i@5@00 Int) (lo@6@00 Int) (hi@7@00 Int) (step@8@00 Int) (min@9@00 Int) (max@10@00 Int) (ar@11@00 Seq<$Ref>)) (!
  (sum_square%stateless i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00)
  :pattern ((sum_square%limited s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (i@5@00 Int) (lo@6@00 Int) (hi@7@00 Int) (step@8@00 Int) (min@9@00 Int) (max@10@00 Int) (ar@11@00 Seq<$Ref>)) (!
  (and
    (forall ((k@38@00 Int)) (!
      (=>
        (and
          (and
            (<= min@9@00 k@38@00)
            (and
              (< k@38@00 max@10@00)
              (and
                (<= lo@6@00 (mod k@38@00 step@8@00))
                (< (mod k@38@00 step@8@00) hi@7@00))))
          (< $Perm.No $k@39@00))
        (and
          (=
            (inv@40@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00 (Seq_index
              ar@11@00
              k@38@00))
            k@38@00)
          (img@41@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00 (Seq_index
            ar@11@00
            k@38@00))))
      :pattern ((Seq_index ar@11@00 k@38@00))
      :qid |quant-u-15|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@41@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00 r)
          (and
            (and
              (<=
                min@9@00
                (inv@40@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00 r))
              (and
                (<
                  (inv@40@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00 r)
                  max@10@00)
                (and
                  (<=
                    lo@6@00
                    (mod
                      (inv@40@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00 r)
                      step@8@00))
                  (<
                    (mod
                      (inv@40@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00 r)
                      step@8@00)
                    hi@7@00))))
            (< $Perm.No $k@39@00)))
        (=
          (Seq_index
            ar@11@00
            (inv@40@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00 r))
          r))
      :pattern ((inv@40@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00 r))
      :qid |Ref__Integer_value-fctOfInv|))
    (forall ((k@44@00 Int)) (!
      (=>
        (and
          (and
            (<= min@9@00 k@44@00)
            (and
              (< k@44@00 max@10@00)
              (and
                (<= lo@6@00 (mod k@44@00 step@8@00))
                (< (mod k@44@00 step@8@00) hi@7@00))))
          (< $Perm.No $k@45@00))
        (and
          (=
            (inv@46@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00 (Seq_index
              ar@11@00
              k@44@00))
            k@44@00)
          (img@47@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00 (Seq_index
            ar@11@00
            k@44@00))))
      :pattern ((Seq_index ar@11@00 k@44@00))
      :qid |Ref__Integer_value-invOfFct|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@47@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00 r)
          (and
            (and
              (<=
                min@9@00
                (inv@46@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00 r))
              (and
                (<
                  (inv@46@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00 r)
                  max@10@00)
                (and
                  (<=
                    lo@6@00
                    (mod
                      (inv@46@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00 r)
                      step@8@00))
                  (<
                    (mod
                      (inv@46@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00 r)
                      step@8@00)
                    hi@7@00))))
            (< $Perm.No $k@45@00)))
        (=
          (Seq_index
            ar@11@00
            (inv@46@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00 r))
          r))
      :pattern ((inv@46@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00 r))
      :qid |Ref__Integer_value-fctOfInv|))
    (forall ((r $Ref)) (!
      (and
        (=>
          (Set_in r ($FVF.domain_Ref__Integer_value (sm@48@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00)))
          (and
            (and
              (<=
                min@9@00
                (inv@46@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00 r))
              (and
                (<
                  (inv@46@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00 r)
                  max@10@00)
                (and
                  (<=
                    lo@6@00
                    (mod
                      (inv@46@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00 r)
                      step@8@00))
                  (<
                    (mod
                      (inv@46@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00 r)
                      step@8@00)
                    hi@7@00))))
            (< $Perm.No $k@45@00)
            (img@47@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00 r)))
        (=>
          (and
            (and
              (<=
                min@9@00
                (inv@46@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00 r))
              (and
                (<
                  (inv@46@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00 r)
                  max@10@00)
                (and
                  (<=
                    lo@6@00
                    (mod
                      (inv@46@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00 r)
                      step@8@00))
                  (<
                    (mod
                      (inv@46@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00 r)
                      step@8@00)
                    hi@7@00))))
            (< $Perm.No $k@45@00)
            (img@47@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00 r))
          (Set_in r ($FVF.domain_Ref__Integer_value (sm@48@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00)))))
      :pattern ((Set_in r ($FVF.domain_Ref__Integer_value (sm@48@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00))))
      :qid |qp.fvfDomDef2|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (and
              (<=
                min@9@00
                (inv@46@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00 r))
              (and
                (<
                  (inv@46@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00 r)
                  max@10@00)
                (and
                  (<=
                    lo@6@00
                    (mod
                      (inv@46@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00 r)
                      step@8@00))
                  (<
                    (mod
                      (inv@46@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00 r)
                      step@8@00)
                    hi@7@00))))
            (< $Perm.No $k@45@00)
            (img@47@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00 r))
          (ite
            (and
              (img@41@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00 r)
              (and
                (<=
                  min@9@00
                  (inv@40@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00 r))
                (and
                  (<
                    (inv@40@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00 r)
                    max@10@00)
                  (and
                    (<=
                      lo@6@00
                      (mod
                        (inv@40@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00 r)
                        step@8@00))
                    (<
                      (mod
                        (inv@40@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00 r)
                        step@8@00)
                      hi@7@00)))))
            (< $Perm.No $k@39@00)
            false))
        (=
          ($FVF.lookup_Ref__Integer_value (sm@48@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00) r)
          ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))) r)))
      :pattern (($FVF.lookup_Ref__Integer_value (sm@48@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00) r))
      :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))) r))
      :qid |qp.fvfValDef1|))
    ($Perm.isReadVar $k@39@00)
    ($Perm.isReadVar $k@45@00)
    (=>
      (sum_square%precondition s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00)
      (=
        (sum_square s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00)
        (ite
          (< i@5@00 max@10@00)
          (+
            (ite
              (and
                (<= lo@6@00 (mod i@5@00 step@8@00))
                (< (mod i@5@00 step@8@00) hi@7@00))
              ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))) (Seq_index
                ar@11@00
                i@5@00))
              0)
            (sum_square%limited ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine
                        $Snap.unit
                        ($Snap.combine
                          $Snap.unit
                          ($Snap.combine
                            $Snap.unit
                            ($Snap.combine
                              $Snap.unit
                              ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (sm@48@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00))))))))))) (+
              i@5@00
              1) lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00))
          0))))
  :pattern ((sum_square s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00))
  :qid |quant-u-20|)))
(assert (forall ((s@$ $Snap) (i@5@00 Int) (lo@6@00 Int) (hi@7@00 Int) (step@8@00 Int) (min@9@00 Int) (max@10@00 Int) (ar@11@00 Seq<$Ref>)) (!
  (=>
    (sum_square%precondition s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00)
    (ite
      (< i@5@00 max@10@00)
      (sum_square%precondition ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine
                        $Snap.unit
                        ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (sm@48@00 s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00))))))))))) (+
        i@5@00
        1) lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00)
      true))
  :pattern ((sum_square s@$ i@5@00 lo@6@00 hi@7@00 step@8@00 min@9@00 max@10@00 ar@11@00))
  :qid |quant-u-21|)))
(assert (forall ((s@$ $Snap) (i@13@00 Int) (lo@14@00 Int) (hi@15@00 Int) (ar@16@00 Seq<$Ref>)) (!
  (=
    (sum_array%limited s@$ i@13@00 lo@14@00 hi@15@00 ar@16@00)
    (sum_array s@$ i@13@00 lo@14@00 hi@15@00 ar@16@00))
  :pattern ((sum_array s@$ i@13@00 lo@14@00 hi@15@00 ar@16@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (i@13@00 Int) (lo@14@00 Int) (hi@15@00 Int) (ar@16@00 Seq<$Ref>)) (!
  (sum_array%stateless i@13@00 lo@14@00 hi@15@00 ar@16@00)
  :pattern ((sum_array%limited s@$ i@13@00 lo@14@00 hi@15@00 ar@16@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (i@13@00 Int) (lo@14@00 Int) (hi@15@00 Int) (ar@16@00 Seq<$Ref>)) (!
  (and
    (forall ((k@51@00 Int)) (!
      (=>
        (and
          (and (<= lo@14@00 k@51@00) (< k@51@00 hi@15@00))
          (< $Perm.No $k@52@00))
        (and
          (=
            (inv@53@00 s@$ i@13@00 lo@14@00 hi@15@00 ar@16@00 (Seq_index
              ar@16@00
              k@51@00))
            k@51@00)
          (img@54@00 s@$ i@13@00 lo@14@00 hi@15@00 ar@16@00 (Seq_index
            ar@16@00
            k@51@00))))
      :pattern ((Seq_index ar@16@00 k@51@00))
      :qid |quant-u-23|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@54@00 s@$ i@13@00 lo@14@00 hi@15@00 ar@16@00 r)
          (and
            (and
              (<= lo@14@00 (inv@53@00 s@$ i@13@00 lo@14@00 hi@15@00 ar@16@00 r))
              (< (inv@53@00 s@$ i@13@00 lo@14@00 hi@15@00 ar@16@00 r) hi@15@00))
            (< $Perm.No $k@52@00)))
        (=
          (Seq_index
            ar@16@00
            (inv@53@00 s@$ i@13@00 lo@14@00 hi@15@00 ar@16@00 r))
          r))
      :pattern ((inv@53@00 s@$ i@13@00 lo@14@00 hi@15@00 ar@16@00 r))
      :qid |Ref__Integer_value-fctOfInv|))
    (forall ((k@57@00 Int)) (!
      (=>
        (and
          (and (<= lo@14@00 k@57@00) (< k@57@00 hi@15@00))
          (< $Perm.No $k@58@00))
        (and
          (=
            (inv@59@00 s@$ i@13@00 lo@14@00 hi@15@00 ar@16@00 (Seq_index
              ar@16@00
              k@57@00))
            k@57@00)
          (img@60@00 s@$ i@13@00 lo@14@00 hi@15@00 ar@16@00 (Seq_index
            ar@16@00
            k@57@00))))
      :pattern ((Seq_index ar@16@00 k@57@00))
      :qid |Ref__Integer_value-invOfFct|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@60@00 s@$ i@13@00 lo@14@00 hi@15@00 ar@16@00 r)
          (and
            (and
              (<= lo@14@00 (inv@59@00 s@$ i@13@00 lo@14@00 hi@15@00 ar@16@00 r))
              (< (inv@59@00 s@$ i@13@00 lo@14@00 hi@15@00 ar@16@00 r) hi@15@00))
            (< $Perm.No $k@58@00)))
        (=
          (Seq_index
            ar@16@00
            (inv@59@00 s@$ i@13@00 lo@14@00 hi@15@00 ar@16@00 r))
          r))
      :pattern ((inv@59@00 s@$ i@13@00 lo@14@00 hi@15@00 ar@16@00 r))
      :qid |Ref__Integer_value-fctOfInv|))
    (forall ((r $Ref)) (!
      (and
        (=>
          (Set_in r ($FVF.domain_Ref__Integer_value (sm@61@00 s@$ i@13@00 lo@14@00 hi@15@00 ar@16@00)))
          (and
            (and
              (<= lo@14@00 (inv@59@00 s@$ i@13@00 lo@14@00 hi@15@00 ar@16@00 r))
              (< (inv@59@00 s@$ i@13@00 lo@14@00 hi@15@00 ar@16@00 r) hi@15@00))
            (< $Perm.No $k@58@00)
            (img@60@00 s@$ i@13@00 lo@14@00 hi@15@00 ar@16@00 r)))
        (=>
          (and
            (and
              (<= lo@14@00 (inv@59@00 s@$ i@13@00 lo@14@00 hi@15@00 ar@16@00 r))
              (< (inv@59@00 s@$ i@13@00 lo@14@00 hi@15@00 ar@16@00 r) hi@15@00))
            (< $Perm.No $k@58@00)
            (img@60@00 s@$ i@13@00 lo@14@00 hi@15@00 ar@16@00 r))
          (Set_in r ($FVF.domain_Ref__Integer_value (sm@61@00 s@$ i@13@00 lo@14@00 hi@15@00 ar@16@00)))))
      :pattern ((Set_in r ($FVF.domain_Ref__Integer_value (sm@61@00 s@$ i@13@00 lo@14@00 hi@15@00 ar@16@00))))
      :qid |qp.fvfDomDef5|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (and
              (<= lo@14@00 (inv@59@00 s@$ i@13@00 lo@14@00 hi@15@00 ar@16@00 r))
              (< (inv@59@00 s@$ i@13@00 lo@14@00 hi@15@00 ar@16@00 r) hi@15@00))
            (< $Perm.No $k@58@00)
            (img@60@00 s@$ i@13@00 lo@14@00 hi@15@00 ar@16@00 r))
          (ite
            (and
              (img@54@00 s@$ i@13@00 lo@14@00 hi@15@00 ar@16@00 r)
              (and
                (<=
                  lo@14@00
                  (inv@53@00 s@$ i@13@00 lo@14@00 hi@15@00 ar@16@00 r))
                (< (inv@53@00 s@$ i@13@00 lo@14@00 hi@15@00 ar@16@00 r) hi@15@00)))
            (< $Perm.No $k@52@00)
            false))
        (=
          ($FVF.lookup_Ref__Integer_value (sm@61@00 s@$ i@13@00 lo@14@00 hi@15@00 ar@16@00) r)
          ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) r)))
      :pattern (($FVF.lookup_Ref__Integer_value (sm@61@00 s@$ i@13@00 lo@14@00 hi@15@00 ar@16@00) r))
      :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) r))
      :qid |qp.fvfValDef4|))
    ($Perm.isReadVar $k@52@00)
    ($Perm.isReadVar $k@58@00)
    (=>
      (sum_array%precondition s@$ i@13@00 lo@14@00 hi@15@00 ar@16@00)
      (=
        (sum_array s@$ i@13@00 lo@14@00 hi@15@00 ar@16@00)
        (ite
          (< i@13@00 hi@15@00)
          (+
            ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) (Seq_index
              ar@16@00
              i@13@00))
            (sum_array%limited ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (sm@61@00 s@$ i@13@00 lo@14@00 hi@15@00 ar@16@00))))))) (+
              i@13@00
              1) lo@14@00 hi@15@00 ar@16@00))
          0))))
  :pattern ((sum_array s@$ i@13@00 lo@14@00 hi@15@00 ar@16@00))
  :qid |quant-u-28|)))
(assert (forall ((s@$ $Snap) (i@13@00 Int) (lo@14@00 Int) (hi@15@00 Int) (ar@16@00 Seq<$Ref>)) (!
  (=>
    (sum_array%precondition s@$ i@13@00 lo@14@00 hi@15@00 ar@16@00)
    (ite
      (< i@13@00 hi@15@00)
      (sum_array%precondition ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (sm@61@00 s@$ i@13@00 lo@14@00 hi@15@00 ar@16@00))))))) (+
        i@13@00
        1) lo@14@00 hi@15@00 ar@16@00)
      true))
  :pattern ((sum_array s@$ i@13@00 lo@14@00 hi@15@00 ar@16@00))
  :qid |quant-u-29|)))
(assert (forall ((s@$ $Snap) (i@18@00 Int) (hi@19@00 Int) (ar@20@00 Seq<Int>)) (!
  (=
    (sum_list%limited s@$ i@18@00 hi@19@00 ar@20@00)
    (sum_list s@$ i@18@00 hi@19@00 ar@20@00))
  :pattern ((sum_list s@$ i@18@00 hi@19@00 ar@20@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (i@18@00 Int) (hi@19@00 Int) (ar@20@00 Seq<Int>)) (!
  (sum_list%stateless i@18@00 hi@19@00 ar@20@00)
  :pattern ((sum_list%limited s@$ i@18@00 hi@19@00 ar@20@00))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap) (i@18@00 Int) (hi@19@00 Int) (ar@20@00 Seq<Int>)) (!
  (=>
    (sum_list%precondition s@$ i@18@00 hi@19@00 ar@20@00)
    (=
      (sum_list s@$ i@18@00 hi@19@00 ar@20@00)
      (ite
        (< i@18@00 hi@19@00)
        (+
          (Seq_index ar@20@00 i@18@00)
          (sum_list%limited ($Snap.combine
            $Snap.unit
            ($Snap.combine $Snap.unit $Snap.unit)) (+ i@18@00 1) hi@19@00 ar@20@00))
        0)))
  :pattern ((sum_list s@$ i@18@00 hi@19@00 ar@20@00))
  :qid |quant-u-30|)))
(assert (forall ((s@$ $Snap) (i@18@00 Int) (hi@19@00 Int) (ar@20@00 Seq<Int>)) (!
  (=>
    (sum_list%precondition s@$ i@18@00 hi@19@00 ar@20@00)
    (ite
      (< i@18@00 hi@19@00)
      (sum_list%precondition ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit $Snap.unit)) (+ i@18@00 1) hi@19@00 ar@20@00)
      true))
  :pattern ((sum_list s@$ i@18@00 hi@19@00 ar@20@00))
  :qid |quant-u-31|)))
(assert (forall ((s@$ $Snap) (i@22@00 Int) (hi@23@00 Int) (ar@24@00 Seq<$Ref>) (v@25@00 Int)) (!
  (=
    (count_array%limited s@$ i@22@00 hi@23@00 ar@24@00 v@25@00)
    (count_array s@$ i@22@00 hi@23@00 ar@24@00 v@25@00))
  :pattern ((count_array s@$ i@22@00 hi@23@00 ar@24@00 v@25@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (i@22@00 Int) (hi@23@00 Int) (ar@24@00 Seq<$Ref>) (v@25@00 Int)) (!
  (count_array%stateless i@22@00 hi@23@00 ar@24@00 v@25@00)
  :pattern ((count_array%limited s@$ i@22@00 hi@23@00 ar@24@00 v@25@00))
  :qid |quant-u-9|)))
(assert (forall ((s@$ $Snap) (i@22@00 Int) (hi@23@00 Int) (ar@24@00 Seq<$Ref>) (v@25@00 Int)) (!
  (and
    (forall ((k@64@00 Int)) (!
      (=>
        (and (and (<= 0 k@64@00) (< k@64@00 hi@23@00)) (< $Perm.No $k@65@00))
        (and
          (=
            (inv@66@00 s@$ i@22@00 hi@23@00 ar@24@00 v@25@00 (Seq_index
              ar@24@00
              k@64@00))
            k@64@00)
          (img@67@00 s@$ i@22@00 hi@23@00 ar@24@00 v@25@00 (Seq_index
            ar@24@00
            k@64@00))))
      :pattern ((Seq_index ar@24@00 k@64@00))
      :qid |quant-u-33|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@67@00 s@$ i@22@00 hi@23@00 ar@24@00 v@25@00 r)
          (and
            (and
              (<= 0 (inv@66@00 s@$ i@22@00 hi@23@00 ar@24@00 v@25@00 r))
              (< (inv@66@00 s@$ i@22@00 hi@23@00 ar@24@00 v@25@00 r) hi@23@00))
            (< $Perm.No $k@65@00)))
        (=
          (Seq_index
            ar@24@00
            (inv@66@00 s@$ i@22@00 hi@23@00 ar@24@00 v@25@00 r))
          r))
      :pattern ((inv@66@00 s@$ i@22@00 hi@23@00 ar@24@00 v@25@00 r))
      :qid |Ref__Integer_value-fctOfInv|))
    (forall ((k@70@00 Int)) (!
      (=>
        (and (and (<= 0 k@70@00) (< k@70@00 hi@23@00)) (< $Perm.No $k@71@00))
        (and
          (=
            (inv@72@00 s@$ i@22@00 hi@23@00 ar@24@00 v@25@00 (Seq_index
              ar@24@00
              k@70@00))
            k@70@00)
          (img@73@00 s@$ i@22@00 hi@23@00 ar@24@00 v@25@00 (Seq_index
            ar@24@00
            k@70@00))))
      :pattern ((Seq_index ar@24@00 k@70@00))
      :qid |Ref__Integer_value-invOfFct|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@73@00 s@$ i@22@00 hi@23@00 ar@24@00 v@25@00 r)
          (and
            (and
              (<= 0 (inv@72@00 s@$ i@22@00 hi@23@00 ar@24@00 v@25@00 r))
              (< (inv@72@00 s@$ i@22@00 hi@23@00 ar@24@00 v@25@00 r) hi@23@00))
            (< $Perm.No $k@71@00)))
        (=
          (Seq_index
            ar@24@00
            (inv@72@00 s@$ i@22@00 hi@23@00 ar@24@00 v@25@00 r))
          r))
      :pattern ((inv@72@00 s@$ i@22@00 hi@23@00 ar@24@00 v@25@00 r))
      :qid |Ref__Integer_value-fctOfInv|))
    (forall ((r $Ref)) (!
      (and
        (=>
          (Set_in r ($FVF.domain_Ref__Integer_value (sm@74@00 s@$ i@22@00 hi@23@00 ar@24@00 v@25@00)))
          (and
            (and
              (<= 0 (inv@72@00 s@$ i@22@00 hi@23@00 ar@24@00 v@25@00 r))
              (< (inv@72@00 s@$ i@22@00 hi@23@00 ar@24@00 v@25@00 r) hi@23@00))
            (< $Perm.No $k@71@00)
            (img@73@00 s@$ i@22@00 hi@23@00 ar@24@00 v@25@00 r)))
        (=>
          (and
            (and
              (<= 0 (inv@72@00 s@$ i@22@00 hi@23@00 ar@24@00 v@25@00 r))
              (< (inv@72@00 s@$ i@22@00 hi@23@00 ar@24@00 v@25@00 r) hi@23@00))
            (< $Perm.No $k@71@00)
            (img@73@00 s@$ i@22@00 hi@23@00 ar@24@00 v@25@00 r))
          (Set_in r ($FVF.domain_Ref__Integer_value (sm@74@00 s@$ i@22@00 hi@23@00 ar@24@00 v@25@00)))))
      :pattern ((Set_in r ($FVF.domain_Ref__Integer_value (sm@74@00 s@$ i@22@00 hi@23@00 ar@24@00 v@25@00))))
      :qid |qp.fvfDomDef8|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (and
              (<= 0 (inv@72@00 s@$ i@22@00 hi@23@00 ar@24@00 v@25@00 r))
              (< (inv@72@00 s@$ i@22@00 hi@23@00 ar@24@00 v@25@00 r) hi@23@00))
            (< $Perm.No $k@71@00)
            (img@73@00 s@$ i@22@00 hi@23@00 ar@24@00 v@25@00 r))
          (ite
            (and
              (img@67@00 s@$ i@22@00 hi@23@00 ar@24@00 v@25@00 r)
              (and
                (<= 0 (inv@66@00 s@$ i@22@00 hi@23@00 ar@24@00 v@25@00 r))
                (< (inv@66@00 s@$ i@22@00 hi@23@00 ar@24@00 v@25@00 r) hi@23@00)))
            (< $Perm.No $k@65@00)
            false))
        (=
          ($FVF.lookup_Ref__Integer_value (sm@74@00 s@$ i@22@00 hi@23@00 ar@24@00 v@25@00) r)
          ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
      :pattern (($FVF.lookup_Ref__Integer_value (sm@74@00 s@$ i@22@00 hi@23@00 ar@24@00 v@25@00) r))
      :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
      :qid |qp.fvfValDef7|))
    ($Perm.isReadVar $k@65@00)
    ($Perm.isReadVar $k@71@00)
    (=>
      (count_array%precondition s@$ i@22@00 hi@23@00 ar@24@00 v@25@00)
      (=
        (count_array s@$ i@22@00 hi@23@00 ar@24@00 v@25@00)
        (ite
          (< i@22@00 hi@23@00)
          (+
            (ite
              (=
                ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))) (Seq_index
                  ar@24@00
                  i@22@00))
                v@25@00)
              1
              0)
            (count_array%limited ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (sm@74@00 s@$ i@22@00 hi@23@00 ar@24@00 v@25@00)))))) (+
              i@22@00
              1) hi@23@00 ar@24@00 v@25@00))
          0))))
  :pattern ((count_array s@$ i@22@00 hi@23@00 ar@24@00 v@25@00))
  :qid |quant-u-38|)))
(assert (forall ((s@$ $Snap) (i@22@00 Int) (hi@23@00 Int) (ar@24@00 Seq<$Ref>) (v@25@00 Int)) (!
  (=>
    (count_array%precondition s@$ i@22@00 hi@23@00 ar@24@00 v@25@00)
    (ite
      (< i@22@00 hi@23@00)
      (count_array%precondition ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (sm@74@00 s@$ i@22@00 hi@23@00 ar@24@00 v@25@00)))))) (+
        i@22@00
        1) hi@23@00 ar@24@00 v@25@00)
      true))
  :pattern ((count_array s@$ i@22@00 hi@23@00 ar@24@00 v@25@00))
  :qid |quant-u-39|)))
(assert (forall ((s@$ $Snap) (i@27@00 Int) (lo@28@00 Int) (hi@29@00 Int) (step@30@00 Int) (min@31@00 Int) (max@32@00 Int) (ar@33@00 Seq<$Ref>) (v@34@00 Int)) (!
  (=
    (count_square%limited s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00)
    (count_square s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00))
  :pattern ((count_square s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (i@27@00 Int) (lo@28@00 Int) (hi@29@00 Int) (step@30@00 Int) (min@31@00 Int) (max@32@00 Int) (ar@33@00 Seq<$Ref>) (v@34@00 Int)) (!
  (count_square%stateless i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00)
  :pattern ((count_square%limited s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00))
  :qid |quant-u-11|)))
(assert (forall ((s@$ $Snap) (i@27@00 Int) (lo@28@00 Int) (hi@29@00 Int) (step@30@00 Int) (min@31@00 Int) (max@32@00 Int) (ar@33@00 Seq<$Ref>) (v@34@00 Int)) (!
  (and
    (forall ((k@77@00 Int)) (!
      (=>
        (and
          (and
            (<= min@31@00 k@77@00)
            (and
              (< k@77@00 max@32@00)
              (and
                (<= lo@28@00 (mod k@77@00 step@30@00))
                (< (mod k@77@00 step@30@00) hi@29@00))))
          (< $Perm.No $k@78@00))
        (and
          (=
            (inv@79@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00 (Seq_index
              ar@33@00
              k@77@00))
            k@77@00)
          (img@80@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00 (Seq_index
            ar@33@00
            k@77@00))))
      :pattern ((Seq_index ar@33@00 k@77@00))
      :qid |quant-u-41|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@80@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00 r)
          (and
            (and
              (<=
                min@31@00
                (inv@79@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00 r))
              (and
                (<
                  (inv@79@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00 r)
                  max@32@00)
                (and
                  (<=
                    lo@28@00
                    (mod
                      (inv@79@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00 r)
                      step@30@00))
                  (<
                    (mod
                      (inv@79@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00 r)
                      step@30@00)
                    hi@29@00))))
            (< $Perm.No $k@78@00)))
        (=
          (Seq_index
            ar@33@00
            (inv@79@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00 r))
          r))
      :pattern ((inv@79@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00 r))
      :qid |Ref__Integer_value-fctOfInv|))
    (forall ((k@83@00 Int)) (!
      (=>
        (and
          (and
            (<= min@31@00 k@83@00)
            (and
              (< k@83@00 max@32@00)
              (and
                (<= lo@28@00 (mod k@83@00 step@30@00))
                (< (mod k@83@00 step@30@00) hi@29@00))))
          (< $Perm.No $k@84@00))
        (and
          (=
            (inv@85@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00 (Seq_index
              ar@33@00
              k@83@00))
            k@83@00)
          (img@86@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00 (Seq_index
            ar@33@00
            k@83@00))))
      :pattern ((Seq_index ar@33@00 k@83@00))
      :qid |Ref__Integer_value-invOfFct|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@86@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00 r)
          (and
            (and
              (<=
                min@31@00
                (inv@85@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00 r))
              (and
                (<
                  (inv@85@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00 r)
                  max@32@00)
                (and
                  (<=
                    lo@28@00
                    (mod
                      (inv@85@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00 r)
                      step@30@00))
                  (<
                    (mod
                      (inv@85@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00 r)
                      step@30@00)
                    hi@29@00))))
            (< $Perm.No $k@84@00)))
        (=
          (Seq_index
            ar@33@00
            (inv@85@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00 r))
          r))
      :pattern ((inv@85@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00 r))
      :qid |Ref__Integer_value-fctOfInv|))
    (forall ((r $Ref)) (!
      (and
        (=>
          (Set_in r ($FVF.domain_Ref__Integer_value (sm@87@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00)))
          (and
            (and
              (<=
                min@31@00
                (inv@85@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00 r))
              (and
                (<
                  (inv@85@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00 r)
                  max@32@00)
                (and
                  (<=
                    lo@28@00
                    (mod
                      (inv@85@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00 r)
                      step@30@00))
                  (<
                    (mod
                      (inv@85@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00 r)
                      step@30@00)
                    hi@29@00))))
            (< $Perm.No $k@84@00)
            (img@86@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00 r)))
        (=>
          (and
            (and
              (<=
                min@31@00
                (inv@85@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00 r))
              (and
                (<
                  (inv@85@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00 r)
                  max@32@00)
                (and
                  (<=
                    lo@28@00
                    (mod
                      (inv@85@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00 r)
                      step@30@00))
                  (<
                    (mod
                      (inv@85@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00 r)
                      step@30@00)
                    hi@29@00))))
            (< $Perm.No $k@84@00)
            (img@86@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00 r))
          (Set_in r ($FVF.domain_Ref__Integer_value (sm@87@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00)))))
      :pattern ((Set_in r ($FVF.domain_Ref__Integer_value (sm@87@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00))))
      :qid |qp.fvfDomDef11|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (and
              (<=
                min@31@00
                (inv@85@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00 r))
              (and
                (<
                  (inv@85@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00 r)
                  max@32@00)
                (and
                  (<=
                    lo@28@00
                    (mod
                      (inv@85@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00 r)
                      step@30@00))
                  (<
                    (mod
                      (inv@85@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00 r)
                      step@30@00)
                    hi@29@00))))
            (< $Perm.No $k@84@00)
            (img@86@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00 r))
          (ite
            (and
              (img@80@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00 r)
              (and
                (<=
                  min@31@00
                  (inv@79@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00 r))
                (and
                  (<
                    (inv@79@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00 r)
                    max@32@00)
                  (and
                    (<=
                      lo@28@00
                      (mod
                        (inv@79@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00 r)
                        step@30@00))
                    (<
                      (mod
                        (inv@79@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00 r)
                        step@30@00)
                      hi@29@00)))))
            (< $Perm.No $k@78@00)
            false))
        (=
          ($FVF.lookup_Ref__Integer_value (sm@87@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00) r)
          ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))) r)))
      :pattern (($FVF.lookup_Ref__Integer_value (sm@87@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00) r))
      :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))) r))
      :qid |qp.fvfValDef10|))
    ($Perm.isReadVar $k@78@00)
    ($Perm.isReadVar $k@84@00)
    (=>
      (count_square%precondition s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00)
      (=
        (count_square s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00)
        (ite
          (< i@27@00 max@32@00)
          (+
            (ite
              (and
                (<= lo@28@00 (mod i@27@00 step@30@00))
                (and
                  (< (mod i@27@00 step@30@00) hi@29@00)
                  (=
                    ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))) (Seq_index
                      ar@33@00
                      i@27@00))
                    v@34@00)))
              1
              0)
            (count_square%limited ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine
                        $Snap.unit
                        ($Snap.combine
                          $Snap.unit
                          ($Snap.combine
                            $Snap.unit
                            ($Snap.combine
                              $Snap.unit
                              ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (sm@87@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00))))))))))) (+
              i@27@00
              1) lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00))
          0))))
  :pattern ((count_square s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00))
  :qid |quant-u-46|)))
(assert (forall ((s@$ $Snap) (i@27@00 Int) (lo@28@00 Int) (hi@29@00 Int) (step@30@00 Int) (min@31@00 Int) (max@32@00 Int) (ar@33@00 Seq<$Ref>) (v@34@00 Int)) (!
  (=>
    (count_square%precondition s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00)
    (ite
      (< i@27@00 max@32@00)
      (count_square%precondition ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($Snap.combine
                $Snap.unit
                ($Snap.combine
                  $Snap.unit
                  ($Snap.combine
                    $Snap.unit
                    ($Snap.combine
                      $Snap.unit
                      ($Snap.combine
                        $Snap.unit
                        ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (sm@87@00 s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00))))))))))) (+
        i@27@00
        1) lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00)
      true))
  :pattern ((count_square s@$ i@27@00 lo@28@00 hi@29@00 step@30@00 min@31@00 max@32@00 ar@33@00 v@34@00))
  :qid |quant-u-47|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- Ref__loop_main_11 ----------
(declare-const diz@0@01 $Ref)
(declare-const current_thread_id@1@01 Int)
(declare-const a@2@01 Seq<$Ref>)
(declare-const diz@3@01 $Ref)
(declare-const current_thread_id@4@01 Int)
(declare-const a@5@01 Seq<$Ref>)
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
; [eval] (forall j: Int, k: Int :: { a[j], a[k] } 0 <= j && (j < |a| && (0 <= k && (k < |a| && j != k))) ==> a[j] != a[k])
(declare-const j@7@01 Int)
(declare-const k@8@01 Int)
(push) ; 2
; [eval] 0 <= j && (j < |a| && (0 <= k && (k < |a| && j != k))) ==> a[j] != a[k]
; [eval] 0 <= j && (j < |a| && (0 <= k && (k < |a| && j != k)))
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
; [eval] j < |a|
; [eval] |a|
(push) ; 5
; [then-branch: 1 | !(j@7@01 < |a@5@01|) | live]
; [else-branch: 1 | j@7@01 < |a@5@01| | live]
(push) ; 6
; [then-branch: 1 | !(j@7@01 < |a@5@01|)]
(assert (not (< j@7@01 (Seq_length a@5@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 1 | j@7@01 < |a@5@01|]
(assert (< j@7@01 (Seq_length a@5@01)))
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
; [eval] k < |a|
; [eval] |a|
(push) ; 9
; [then-branch: 3 | !(k@8@01 < |a@5@01|) | live]
; [else-branch: 3 | k@8@01 < |a@5@01| | live]
(push) ; 10
; [then-branch: 3 | !(k@8@01 < |a@5@01|)]
(assert (not (< k@8@01 (Seq_length a@5@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 3 | k@8@01 < |a@5@01|]
(assert (< k@8@01 (Seq_length a@5@01)))
; [eval] j != k
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< k@8@01 (Seq_length a@5@01)) (not (< k@8@01 (Seq_length a@5@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 k@8@01)
  (and
    (<= 0 k@8@01)
    (or (< k@8@01 (Seq_length a@5@01)) (not (< k@8@01 (Seq_length a@5@01)))))))
(assert (or (<= 0 k@8@01) (not (<= 0 k@8@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< j@7@01 (Seq_length a@5@01))
  (and
    (< j@7@01 (Seq_length a@5@01))
    (=>
      (<= 0 k@8@01)
      (and
        (<= 0 k@8@01)
        (or (< k@8@01 (Seq_length a@5@01)) (not (< k@8@01 (Seq_length a@5@01))))))
    (or (<= 0 k@8@01) (not (<= 0 k@8@01))))))
(assert (or (< j@7@01 (Seq_length a@5@01)) (not (< j@7@01 (Seq_length a@5@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j@7@01)
  (and
    (<= 0 j@7@01)
    (=>
      (< j@7@01 (Seq_length a@5@01))
      (and
        (< j@7@01 (Seq_length a@5@01))
        (=>
          (<= 0 k@8@01)
          (and
            (<= 0 k@8@01)
            (or
              (< k@8@01 (Seq_length a@5@01))
              (not (< k@8@01 (Seq_length a@5@01))))))
        (or (<= 0 k@8@01) (not (<= 0 k@8@01)))))
    (or (< j@7@01 (Seq_length a@5@01)) (not (< j@7@01 (Seq_length a@5@01)))))))
(assert (or (<= 0 j@7@01) (not (<= 0 j@7@01))))
(push) ; 3
; [then-branch: 4 | 0 <= j@7@01 && j@7@01 < |a@5@01| && 0 <= k@8@01 && k@8@01 < |a@5@01| && j@7@01 != k@8@01 | live]
; [else-branch: 4 | !(0 <= j@7@01 && j@7@01 < |a@5@01| && 0 <= k@8@01 && k@8@01 < |a@5@01| && j@7@01 != k@8@01) | live]
(push) ; 4
; [then-branch: 4 | 0 <= j@7@01 && j@7@01 < |a@5@01| && 0 <= k@8@01 && k@8@01 < |a@5@01| && j@7@01 != k@8@01]
(assert (and
  (<= 0 j@7@01)
  (and
    (< j@7@01 (Seq_length a@5@01))
    (and
      (<= 0 k@8@01)
      (and (< k@8@01 (Seq_length a@5@01)) (not (= j@7@01 k@8@01)))))))
; [eval] a[j] != a[k]
; [eval] a[j]
(push) ; 5
(assert (not (>= j@7@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] a[k]
(push) ; 5
(assert (not (>= k@8@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 4 | !(0 <= j@7@01 && j@7@01 < |a@5@01| && 0 <= k@8@01 && k@8@01 < |a@5@01| && j@7@01 != k@8@01)]
(assert (not
  (and
    (<= 0 j@7@01)
    (and
      (< j@7@01 (Seq_length a@5@01))
      (and
        (<= 0 k@8@01)
        (and (< k@8@01 (Seq_length a@5@01)) (not (= j@7@01 k@8@01))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (<= 0 j@7@01)
    (and
      (< j@7@01 (Seq_length a@5@01))
      (and
        (<= 0 k@8@01)
        (and (< k@8@01 (Seq_length a@5@01)) (not (= j@7@01 k@8@01))))))
  (and
    (<= 0 j@7@01)
    (< j@7@01 (Seq_length a@5@01))
    (<= 0 k@8@01)
    (< k@8@01 (Seq_length a@5@01))
    (not (= j@7@01 k@8@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 j@7@01)
      (and
        (< j@7@01 (Seq_length a@5@01))
        (and
          (<= 0 k@8@01)
          (and (< k@8@01 (Seq_length a@5@01)) (not (= j@7@01 k@8@01)))))))
  (and
    (<= 0 j@7@01)
    (and
      (< j@7@01 (Seq_length a@5@01))
      (and
        (<= 0 k@8@01)
        (and (< k@8@01 (Seq_length a@5@01)) (not (= j@7@01 k@8@01))))))))
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
          (< j@7@01 (Seq_length a@5@01))
          (and
            (< j@7@01 (Seq_length a@5@01))
            (=>
              (<= 0 k@8@01)
              (and
                (<= 0 k@8@01)
                (or
                  (< k@8@01 (Seq_length a@5@01))
                  (not (< k@8@01 (Seq_length a@5@01))))))
            (or (<= 0 k@8@01) (not (<= 0 k@8@01)))))
        (or (< j@7@01 (Seq_length a@5@01)) (not (< j@7@01 (Seq_length a@5@01))))))
    (or (<= 0 j@7@01) (not (<= 0 j@7@01)))
    (=>
      (and
        (<= 0 j@7@01)
        (and
          (< j@7@01 (Seq_length a@5@01))
          (and
            (<= 0 k@8@01)
            (and (< k@8@01 (Seq_length a@5@01)) (not (= j@7@01 k@8@01))))))
      (and
        (<= 0 j@7@01)
        (< j@7@01 (Seq_length a@5@01))
        (<= 0 k@8@01)
        (< k@8@01 (Seq_length a@5@01))
        (not (= j@7@01 k@8@01))))
    (or
      (not
        (and
          (<= 0 j@7@01)
          (and
            (< j@7@01 (Seq_length a@5@01))
            (and
              (<= 0 k@8@01)
              (and (< k@8@01 (Seq_length a@5@01)) (not (= j@7@01 k@8@01)))))))
      (and
        (<= 0 j@7@01)
        (and
          (< j@7@01 (Seq_length a@5@01))
          (and
            (<= 0 k@8@01)
            (and (< k@8@01 (Seq_length a@5@01)) (not (= j@7@01 k@8@01))))))))
  :pattern ((Seq_index a@5@01 j@7@01) (Seq_index a@5@01 k@8@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_IterationExample.vpr@61@12@61@102-aux|)))
(assert (forall ((j@7@01 Int) (k@8@01 Int)) (!
  (=>
    (and
      (<= 0 j@7@01)
      (and
        (< j@7@01 (Seq_length a@5@01))
        (and
          (<= 0 k@8@01)
          (and (< k@8@01 (Seq_length a@5@01)) (not (= j@7@01 k@8@01))))))
    (not (= (Seq_index a@5@01 j@7@01) (Seq_index a@5@01 k@8@01))))
  :pattern ((Seq_index a@5@01 j@7@01) (Seq_index a@5@01 k@8@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_IterationExample.vpr@61@12@61@102|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@6@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@6@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01)))))))
(declare-const i@9@01 Int)
(push) ; 2
; [eval] 0 <= i && i < |a|
; [eval] 0 <= i
(push) ; 3
; [then-branch: 5 | !(0 <= i@9@01) | live]
; [else-branch: 5 | 0 <= i@9@01 | live]
(push) ; 4
; [then-branch: 5 | !(0 <= i@9@01)]
(assert (not (<= 0 i@9@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 5 | 0 <= i@9@01]
(assert (<= 0 i@9@01))
; [eval] i < |a|
; [eval] |a|
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@9@01) (not (<= 0 i@9@01))))
(assert (and (<= 0 i@9@01) (< i@9@01 (Seq_length a@5@01))))
; [eval] a[i]
(push) ; 3
(assert (not (>= i@9@01 0)))
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
(assert (forall ((i@9@01 Int)) (!
  (=>
    (and (<= 0 i@9@01) (< i@9@01 (Seq_length a@5@01)))
    (or (<= 0 i@9@01) (not (<= 0 i@9@01))))
  :pattern ((Seq_index a@5@01 i@9@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@9@01 Int) (i2@9@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@9@01) (< i1@9@01 (Seq_length a@5@01)))
      (and (<= 0 i2@9@01) (< i2@9@01 (Seq_length a@5@01)))
      (= (Seq_index a@5@01 i1@9@01) (Seq_index a@5@01 i2@9@01)))
    (= i1@9@01 i2@9@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@9@01 Int)) (!
  (=>
    (and (<= 0 i@9@01) (< i@9@01 (Seq_length a@5@01)))
    (and
      (= (inv@10@01 (Seq_index a@5@01 i@9@01)) i@9@01)
      (img@11@01 (Seq_index a@5@01 i@9@01))))
  :pattern ((Seq_index a@5@01 i@9@01))
  :qid |quant-u-49|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@11@01 r)
      (and (<= 0 (inv@10@01 r)) (< (inv@10@01 r) (Seq_length a@5@01))))
    (= (Seq_index a@5@01 (inv@10@01 r)) r))
  :pattern ((inv@10@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@9@01 Int)) (!
  (=>
    (and (<= 0 i@9@01) (< i@9@01 (Seq_length a@5@01)))
    (not (= (Seq_index a@5@01 i@9@01) $Ref.null)))
  :pattern ((Seq_index a@5@01 i@9@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))))
; [eval] 0 <= 0 && 0 < |a|
; [eval] 0 <= 0
(push) ; 2
; [then-branch: 6 | False | live]
; [else-branch: 6 | True | live]
(push) ; 3
; [then-branch: 6 | False]
(assert false)
(pop) ; 3
(push) ; 3
; [else-branch: 6 | True]
; [eval] 0 < |a|
; [eval] |a|
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(push) ; 2
(set-option :timeout 10)
(assert (not (not (< 0 (Seq_length a@5@01)))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (< 0 (Seq_length a@5@01))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [then-branch: 7 | 0 < |a@5@01| | live]
; [else-branch: 7 | !(0 < |a@5@01|) | live]
(set-option :timeout 0)
(push) ; 2
; [then-branch: 7 | 0 < |a@5@01|]
(assert (< 0 (Seq_length a@5@01)))
; [eval] a[0]
(declare-const sm@12@01 $FVF<Ref__Integer_value>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_Ref__Integer_value (as sm@12@01  $FVF<Ref__Integer_value>) (Seq_index
    a@5@01
    0))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01))))))))
(assert (<=
  $Perm.No
  (ite
    (= (Seq_index a@5@01 0) (Seq_index a@5@01 0))
    (/ (to_real 1) (to_real 2))
    $Perm.No)))
(assert (<=
  (ite
    (= (Seq_index a@5@01 0) (Seq_index a@5@01 0))
    (/ (to_real 1) (to_real 2))
    $Perm.No)
  $Perm.Write))
(assert (=>
  (= (Seq_index a@5@01 0) (Seq_index a@5@01 0))
  (not (= (Seq_index a@5@01 0) $Ref.null))))
(declare-const i@13@01 Int)
(push) ; 3
; [eval] 1 <= i && i < (|a| - 1 < |a| ? |a| - 1 : |a|) + 1
; [eval] 1 <= i
(push) ; 4
; [then-branch: 8 | !(1 <= i@13@01) | live]
; [else-branch: 8 | 1 <= i@13@01 | live]
(push) ; 5
; [then-branch: 8 | !(1 <= i@13@01)]
(assert (not (<= 1 i@13@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 8 | 1 <= i@13@01]
(assert (<= 1 i@13@01))
; [eval] i < (|a| - 1 < |a| ? |a| - 1 : |a|) + 1
; [eval] (|a| - 1 < |a| ? |a| - 1 : |a|) + 1
; [eval] (|a| - 1 < |a| ? |a| - 1 : |a|)
; [eval] |a| - 1 < |a|
; [eval] |a| - 1
; [eval] |a|
; [eval] |a|
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (not (< (- (Seq_length a@5@01) 1) (Seq_length a@5@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< (- (Seq_length a@5@01) 1) (Seq_length a@5@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 9 | |a@5@01| - 1 < |a@5@01| | live]
; [else-branch: 9 | !(|a@5@01| - 1 < |a@5@01|) | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 9 | |a@5@01| - 1 < |a@5@01|]
(assert (< (- (Seq_length a@5@01) 1) (Seq_length a@5@01)))
; [eval] |a| - 1
; [eval] |a|
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (< (- (Seq_length a@5@01) 1) (Seq_length a@5@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 1 i@13@01)
  (and (<= 1 i@13@01) (< (- (Seq_length a@5@01) 1) (Seq_length a@5@01)))))
(assert (or (<= 1 i@13@01) (not (<= 1 i@13@01))))
(assert (and (<= 1 i@13@01) (< i@13@01 (+ (- (Seq_length a@5@01) 1) 1))))
; [eval] a[i]
(push) ; 4
(assert (not (>= i@13@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@13@01 (Seq_length a@5@01))))
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
(assert (forall ((i@13@01 Int)) (!
  (=>
    (and (<= 1 i@13@01) (< i@13@01 (+ (- (Seq_length a@5@01) 1) 1)))
    (and
      (=>
        (<= 1 i@13@01)
        (and (<= 1 i@13@01) (< (- (Seq_length a@5@01) 1) (Seq_length a@5@01))))
      (or (<= 1 i@13@01) (not (<= 1 i@13@01)))))
  :pattern ((Seq_index a@5@01 i@13@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@13@01 Int) (i2@13@01 Int)) (!
  (=>
    (and
      (and (<= 1 i1@13@01) (< i1@13@01 (+ (- (Seq_length a@5@01) 1) 1)))
      (and (<= 1 i2@13@01) (< i2@13@01 (+ (- (Seq_length a@5@01) 1) 1)))
      (= (Seq_index a@5@01 i1@13@01) (Seq_index a@5@01 i2@13@01)))
    (= i1@13@01 i2@13@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@13@01 Int)) (!
  (=>
    (and (<= 1 i@13@01) (< i@13@01 (+ (- (Seq_length a@5@01) 1) 1)))
    (and
      (= (inv@14@01 (Seq_index a@5@01 i@13@01)) i@13@01)
      (img@15@01 (Seq_index a@5@01 i@13@01))))
  :pattern ((Seq_index a@5@01 i@13@01))
  :qid |quant-u-51|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@15@01 r)
      (and
        (<= 1 (inv@14@01 r))
        (< (inv@14@01 r) (+ (- (Seq_length a@5@01) 1) 1))))
    (= (Seq_index a@5@01 (inv@14@01 r)) r))
  :pattern ((inv@14@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@13@01 Int)) (!
  (=>
    (and (<= 1 i@13@01) (< i@13@01 (+ (- (Seq_length a@5@01) 1) 1)))
    (not (= (Seq_index a@5@01 i@13@01) $Ref.null)))
  :pattern ((Seq_index a@5@01 i@13@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index a@5@01 i@13@01) (Seq_index a@5@01 i@9@01))
    (=
      (and
        (img@15@01 r)
        (and
          (<= 1 (inv@14@01 r))
          (< (inv@14@01 r) (+ (- (Seq_length a@5@01) 1) 1))))
      (and
        (img@11@01 r)
        (and (<= 0 (inv@10@01 r)) (< (inv@10@01 r) (Seq_length a@5@01))))))
  
  :qid |quant-u-52|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
(declare-const i@16@01 Int)
(push) ; 4
; [eval] 0 <= i && i < |a|
; [eval] 0 <= i
(push) ; 5
; [then-branch: 10 | !(0 <= i@16@01) | live]
; [else-branch: 10 | 0 <= i@16@01 | live]
(push) ; 6
; [then-branch: 10 | !(0 <= i@16@01)]
(assert (not (<= 0 i@16@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 10 | 0 <= i@16@01]
(assert (<= 0 i@16@01))
; [eval] i < |a|
; [eval] |a|
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@16@01) (not (<= 0 i@16@01))))
(assert (and (<= 0 i@16@01) (< i@16@01 (Seq_length a@5@01))))
; [eval] a[i]
(push) ; 5
(assert (not (>= i@16@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-const $t@17@01 $FVF<Ref__Integer_value>)
(declare-fun inv@18@01 ($Ref) Int)
(declare-fun img@19@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@16@01 Int)) (!
  (=>
    (and (<= 0 i@16@01) (< i@16@01 (Seq_length a@5@01)))
    (or (<= 0 i@16@01) (not (<= 0 i@16@01))))
  :pattern ((Seq_index a@5@01 i@16@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@16@01 Int) (i2@16@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@16@01) (< i1@16@01 (Seq_length a@5@01)))
      (and (<= 0 i2@16@01) (< i2@16@01 (Seq_length a@5@01)))
      (= (Seq_index a@5@01 i1@16@01) (Seq_index a@5@01 i2@16@01)))
    (= i1@16@01 i2@16@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@16@01 Int)) (!
  (=>
    (and (<= 0 i@16@01) (< i@16@01 (Seq_length a@5@01)))
    (and
      (= (inv@18@01 (Seq_index a@5@01 i@16@01)) i@16@01)
      (img@19@01 (Seq_index a@5@01 i@16@01))))
  :pattern ((Seq_index a@5@01 i@16@01))
  :qid |quant-u-54|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@19@01 r)
      (and (<= 0 (inv@18@01 r)) (< (inv@18@01 r) (Seq_length a@5@01))))
    (= (Seq_index a@5@01 (inv@18@01 r)) r))
  :pattern ((inv@18@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@16@01 Int)) (!
  (=>
    (and (<= 0 i@16@01) (< i@16@01 (Seq_length a@5@01)))
    (not (= (Seq_index a@5@01 i@16@01) $Ref.null)))
  :pattern ((Seq_index a@5@01 i@16@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(pop) ; 3
(push) ; 3
; [exec]
; inhale false
(pop) ; 3
(pop) ; 2
(push) ; 2
; [else-branch: 7 | !(0 < |a@5@01|)]
(assert (not (< 0 (Seq_length a@5@01))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@6@01)))))
  $Snap.unit))
(declare-const i@20@01 Int)
(push) ; 3
; [eval] 1 <= i && i < (|a| - 1 < |a| ? |a| - 1 : |a|) + 1
; [eval] 1 <= i
(push) ; 4
; [then-branch: 11 | !(1 <= i@20@01) | live]
; [else-branch: 11 | 1 <= i@20@01 | live]
(push) ; 5
; [then-branch: 11 | !(1 <= i@20@01)]
(assert (not (<= 1 i@20@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 11 | 1 <= i@20@01]
(assert (<= 1 i@20@01))
; [eval] i < (|a| - 1 < |a| ? |a| - 1 : |a|) + 1
; [eval] (|a| - 1 < |a| ? |a| - 1 : |a|) + 1
; [eval] (|a| - 1 < |a| ? |a| - 1 : |a|)
; [eval] |a| - 1 < |a|
; [eval] |a| - 1
; [eval] |a|
; [eval] |a|
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (not (< (- (Seq_length a@5@01) 1) (Seq_length a@5@01)))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< (- (Seq_length a@5@01) 1) (Seq_length a@5@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 12 | |a@5@01| - 1 < |a@5@01| | live]
; [else-branch: 12 | !(|a@5@01| - 1 < |a@5@01|) | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 12 | |a@5@01| - 1 < |a@5@01|]
(assert (< (- (Seq_length a@5@01) 1) (Seq_length a@5@01)))
; [eval] |a| - 1
; [eval] |a|
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (< (- (Seq_length a@5@01) 1) (Seq_length a@5@01)))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 1 i@20@01)
  (and (<= 1 i@20@01) (< (- (Seq_length a@5@01) 1) (Seq_length a@5@01)))))
(assert (or (<= 1 i@20@01) (not (<= 1 i@20@01))))
(assert (and (<= 1 i@20@01) (< i@20@01 (+ (- (Seq_length a@5@01) 1) 1))))
; [eval] a[i]
(push) ; 4
(assert (not (>= i@20@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@20@01 (Seq_length a@5@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@21@01 ($Ref) Int)
(declare-fun img@22@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@20@01 Int)) (!
  (=>
    (and (<= 1 i@20@01) (< i@20@01 (+ (- (Seq_length a@5@01) 1) 1)))
    (and
      (=>
        (<= 1 i@20@01)
        (and (<= 1 i@20@01) (< (- (Seq_length a@5@01) 1) (Seq_length a@5@01))))
      (or (<= 1 i@20@01) (not (<= 1 i@20@01)))))
  :pattern ((Seq_index a@5@01 i@20@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@20@01 Int) (i2@20@01 Int)) (!
  (=>
    (and
      (and (<= 1 i1@20@01) (< i1@20@01 (+ (- (Seq_length a@5@01) 1) 1)))
      (and (<= 1 i2@20@01) (< i2@20@01 (+ (- (Seq_length a@5@01) 1) 1)))
      (= (Seq_index a@5@01 i1@20@01) (Seq_index a@5@01 i2@20@01)))
    (= i1@20@01 i2@20@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@20@01 Int)) (!
  (=>
    (and (<= 1 i@20@01) (< i@20@01 (+ (- (Seq_length a@5@01) 1) 1)))
    (and
      (= (inv@21@01 (Seq_index a@5@01 i@20@01)) i@20@01)
      (img@22@01 (Seq_index a@5@01 i@20@01))))
  :pattern ((Seq_index a@5@01 i@20@01))
  :qid |quant-u-56|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@22@01 r)
      (and
        (<= 1 (inv@21@01 r))
        (< (inv@21@01 r) (+ (- (Seq_length a@5@01) 1) 1))))
    (= (Seq_index a@5@01 (inv@21@01 r)) r))
  :pattern ((inv@21@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@20@01 Int)) (!
  (=>
    (and (<= 1 i@20@01) (< i@20@01 (+ (- (Seq_length a@5@01) 1) 1)))
    (not (= (Seq_index a@5@01 i@20@01) $Ref.null)))
  :pattern ((Seq_index a@5@01 i@20@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index a@5@01 i@20@01) (Seq_index a@5@01 i@9@01))
    (=
      (and
        (img@22@01 r)
        (and
          (<= 1 (inv@21@01 r))
          (< (inv@21@01 r) (+ (- (Seq_length a@5@01) 1) 1))))
      (and
        (img@11@01 r)
        (and (<= 0 (inv@10@01 r)) (< (inv@10@01 r) (Seq_length a@5@01))))))
  
  :qid |quant-u-57|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 3
(declare-const i@23@01 Int)
(push) ; 4
; [eval] 0 <= i && i < |a|
; [eval] 0 <= i
(push) ; 5
; [then-branch: 13 | !(0 <= i@23@01) | live]
; [else-branch: 13 | 0 <= i@23@01 | live]
(push) ; 6
; [then-branch: 13 | !(0 <= i@23@01)]
(assert (not (<= 0 i@23@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 13 | 0 <= i@23@01]
(assert (<= 0 i@23@01))
; [eval] i < |a|
; [eval] |a|
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@23@01) (not (<= 0 i@23@01))))
(assert (and (<= 0 i@23@01) (< i@23@01 (Seq_length a@5@01))))
; [eval] a[i]
(push) ; 5
(assert (not (>= i@23@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-const $t@24@01 $FVF<Ref__Integer_value>)
(declare-fun inv@25@01 ($Ref) Int)
(declare-fun img@26@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@23@01 Int)) (!
  (=>
    (and (<= 0 i@23@01) (< i@23@01 (Seq_length a@5@01)))
    (or (<= 0 i@23@01) (not (<= 0 i@23@01))))
  :pattern ((Seq_index a@5@01 i@23@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@23@01 Int) (i2@23@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@23@01) (< i1@23@01 (Seq_length a@5@01)))
      (and (<= 0 i2@23@01) (< i2@23@01 (Seq_length a@5@01)))
      (= (Seq_index a@5@01 i1@23@01) (Seq_index a@5@01 i2@23@01)))
    (= i1@23@01 i2@23@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@23@01 Int)) (!
  (=>
    (and (<= 0 i@23@01) (< i@23@01 (Seq_length a@5@01)))
    (and
      (= (inv@25@01 (Seq_index a@5@01 i@23@01)) i@23@01)
      (img@26@01 (Seq_index a@5@01 i@23@01))))
  :pattern ((Seq_index a@5@01 i@23@01))
  :qid |quant-u-59|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@26@01 r)
      (and (<= 0 (inv@25@01 r)) (< (inv@25@01 r) (Seq_length a@5@01))))
    (= (Seq_index a@5@01 (inv@25@01 r)) r))
  :pattern ((inv@25@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@23@01 Int)) (!
  (=>
    (and (<= 0 i@23@01) (< i@23@01 (Seq_length a@5@01)))
    (not (= (Seq_index a@5@01 i@23@01) $Ref.null)))
  :pattern ((Seq_index a@5@01 i@23@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(pop) ; 3
(push) ; 3
; [exec]
; inhale false
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- Ref__recv_body_53 ----------
(declare-const diz@27@01 $Ref)
(declare-const current_thread_id@28@01 Int)
(declare-const a@29@01 Seq<$Ref>)
(declare-const i@30@01 Int)
(declare-const diz@31@01 $Ref)
(declare-const current_thread_id@32@01 Int)
(declare-const a@33@01 Seq<$Ref>)
(declare-const i@34@01 Int)
(push) ; 1
(declare-const $t@35@01 $Snap)
(assert (= $t@35@01 ($Snap.combine ($Snap.first $t@35@01) ($Snap.second $t@35@01))))
(assert (= ($Snap.first $t@35@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@31@01 $Ref.null)))
(assert (=
  ($Snap.second $t@35@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@35@01))
    ($Snap.second ($Snap.second $t@35@01)))))
(assert (= ($Snap.first ($Snap.second $t@35@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@32@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@35@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@35@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@35@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@35@01))) $Snap.unit))
; [eval] 0 <= i
(assert (<= 0 i@34@01))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@35@01))) $Snap.unit))
; [eval] i < |a|
; [eval] |a|
(assert (< i@34@01 (Seq_length a@33@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
; [eval] a[i]
(push) ; 3
(assert (not (>= i@34@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const $t@36@01 Int)
(assert (not (= (Seq_index a@33@01 i@34@01) $Ref.null)))
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Ref__send_body_59 ----------
(declare-const diz@37@01 $Ref)
(declare-const current_thread_id@38@01 Int)
(declare-const a@39@01 Seq<$Ref>)
(declare-const i@40@01 Int)
(declare-const diz@41@01 $Ref)
(declare-const current_thread_id@42@01 Int)
(declare-const a@43@01 Seq<$Ref>)
(declare-const i@44@01 Int)
(push) ; 1
(declare-const $t@45@01 $Snap)
(assert (= $t@45@01 ($Snap.combine ($Snap.first $t@45@01) ($Snap.second $t@45@01))))
(assert (= ($Snap.first $t@45@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@41@01 $Ref.null)))
(assert (=
  ($Snap.second $t@45@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@45@01))
    ($Snap.second ($Snap.second $t@45@01)))))
(assert (= ($Snap.first ($Snap.second $t@45@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@42@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@45@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@45@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@45@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@45@01))) $Snap.unit))
; [eval] 0 <= i
(assert (<= 0 i@44@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@45@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@45@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@45@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@45@01))))
  $Snap.unit))
; [eval] i + 1 < |a|
; [eval] i + 1
; [eval] |a|
(assert (< (+ i@44@01 1) (Seq_length a@43@01)))
; [eval] a[i + 1]
; [eval] i + 1
(push) ; 2
(assert (not (>= (+ i@44@01 1) 0)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= (Seq_index a@43@01 (+ i@44@01 1)) $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Ref__loop_body_11 ----------
(declare-const diz@46@01 $Ref)
(declare-const current_thread_id@47@01 Int)
(declare-const a@48@01 Seq<$Ref>)
(declare-const i@49@01 Int)
(declare-const diz@50@01 $Ref)
(declare-const current_thread_id@51@01 Int)
(declare-const a@52@01 Seq<$Ref>)
(declare-const i@53@01 Int)
(push) ; 1
(declare-const $t@54@01 $Snap)
(assert (= $t@54@01 ($Snap.combine ($Snap.first $t@54@01) ($Snap.second $t@54@01))))
(assert (= ($Snap.first $t@54@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@50@01 $Ref.null)))
(assert (=
  ($Snap.second $t@54@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@54@01))
    ($Snap.second ($Snap.second $t@54@01)))))
(assert (= ($Snap.first ($Snap.second $t@54@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@51@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@54@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@54@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@54@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@54@01))) $Snap.unit))
; [eval] 0 <= i
(assert (<= 0 i@53@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@54@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@54@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@54@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@54@01))))
  $Snap.unit))
; [eval] i < |a|
; [eval] |a|
(assert (< i@53@01 (Seq_length a@52@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@54@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@54@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@54@01))))))))
; [eval] a[i]
(push) ; 2
(assert (not (>= i@53@01 0)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= (Seq_index a@52@01 i@53@01) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@54@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@54@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@54@01)))))))))
; [eval] i == 0
(push) ; 2
(set-option :timeout 10)
(assert (not (not (= i@53@01 0))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (= i@53@01 0)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [then-branch: 14 | i@53@01 == 0 | live]
; [else-branch: 14 | i@53@01 != 0 | live]
(set-option :timeout 0)
(push) ; 2
; [then-branch: 14 | i@53@01 == 0]
(assert (= i@53@01 0))
; [eval] a[i]
(push) ; 3
(assert (not (>= i@53@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@54@01))))))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@54@01)))))))))
; [eval] i < |a| - 1
; [eval] |a| - 1
; [eval] |a|
(push) ; 3
(set-option :timeout 10)
(assert (not (not (< i@53@01 (- (Seq_length a@52@01) 1)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< i@53@01 (- (Seq_length a@52@01) 1))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 15 | i@53@01 < |a@52@01| - 1 | live]
; [else-branch: 15 | !(i@53@01 < |a@52@01| - 1) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 15 | i@53@01 < |a@52@01| - 1]
(assert (< i@53@01 (- (Seq_length a@52@01) 1)))
; [eval] a[i + 1]
; [eval] i + 1
(push) ; 4
(assert (not (>= (+ i@53@01 1) 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< (+ i@53@01 1) (Seq_length a@52@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (Seq_index a@52@01 i@53@01) (Seq_index a@52@01 (+ i@53@01 1)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (not (= (Seq_index a@52@01 (+ i@53@01 1)) $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(declare-const $t@55@01 $Snap)
(assert (= $t@55@01 ($Snap.combine ($Snap.first $t@55@01) ($Snap.second $t@55@01))))
(assert (= ($Snap.first $t@55@01) $Snap.unit))
; [eval] 0 <= i
(assert (=
  ($Snap.second $t@55@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@55@01))
    ($Snap.second ($Snap.second $t@55@01)))))
(assert (= ($Snap.first ($Snap.second $t@55@01)) $Snap.unit))
; [eval] i < |a|
; [eval] |a|
; [eval] a[i]
(push) ; 5
(assert (not (>= i@53@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [exec]
; var __flatten_5: Ref
(declare-const __flatten_5@56@01 $Ref)
; [exec]
; var __flatten_6: Int
(declare-const __flatten_6@57@01 Int)
; [exec]
; var __flatten_7: Ref
(declare-const __flatten_7@58@01 $Ref)
; [eval] i > 0
(push) ; 5
(set-option :timeout 10)
(assert (not (not (> i@53@01 0))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 16 | i@53@01 > 0 | dead]
; [else-branch: 16 | !(i@53@01 > 0) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 16 | !(i@53@01 > 0)]
(assert (not (> i@53@01 0)))
(pop) ; 5
; [eval] !(i > 0)
; [eval] i > 0
(push) ; 5
(set-option :timeout 10)
(assert (not (> i@53@01 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (> i@53@01 0))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 17 | !(i@53@01 > 0) | live]
; [else-branch: 17 | i@53@01 > 0 | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 17 | !(i@53@01 > 0)]
(assert (not (> i@53@01 0)))
; [eval] i < |a| - 1
; [eval] |a| - 1
; [eval] |a|
(push) ; 6
(set-option :timeout 10)
(assert (not (not (< i@53@01 (- (Seq_length a@52@01) 1)))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 18 | i@53@01 < |a@52@01| - 1 | live]
; [else-branch: 18 | !(i@53@01 < |a@52@01| - 1) | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 18 | i@53@01 < |a@52@01| - 1]
; [exec]
; __flatten_5 := a[i]
; [eval] a[i]
(push) ; 7
(assert (not (>= i@53@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_5@59@01 $Ref)
(assert (= __flatten_5@59@01 (Seq_index a@52@01 i@53@01)))
; [exec]
; __flatten_7 := a[i + 1]
; [eval] a[i + 1]
; [eval] i + 1
(push) ; 7
(assert (not (>= (+ i@53@01 1) 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< (+ i@53@01 1) (Seq_length a@52@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_7@60@01 $Ref)
(assert (= __flatten_7@60@01 (Seq_index a@52@01 (+ i@53@01 1))))
; [exec]
; __flatten_6 := __flatten_7.Ref__Integer_value
(push) ; 7
(set-option :timeout 10)
(assert (not (= (Seq_index a@52@01 (+ i@53@01 1)) __flatten_7@60@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_6@61@01 Int)
(assert (=
  __flatten_6@61@01
  ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@54@01)))))))))
; [exec]
; __flatten_5.Ref__Integer_value := __flatten_6
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= (Seq_index a@52@01 (+ i@53@01 1)) __flatten_5@59@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= (Seq_index a@52@01 i@53@01) __flatten_5@59@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= (Seq_index a@52@01 (+ i@53@01 1)) __flatten_5@59@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (not (= __flatten_5@59@01 $Ref.null)))
; [exec]
; Ref__send_body_59(diz, current_thread_id, a, i)
; [eval] diz != null
; [eval] current_thread_id >= 0
; [eval] 0 <= i
; [eval] i + 1 < |a|
; [eval] i + 1
; [eval] |a|
(set-option :timeout 0)
(push) ; 7
(assert (not (< (+ i@53@01 1) (Seq_length a@52@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (< (+ i@53@01 1) (Seq_length a@52@01)))
; [eval] a[i + 1]
; [eval] i + 1
(push) ; 7
(assert (not (>= (+ i@53@01 1) 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] 0 <= i
; [eval] i < |a|
; [eval] |a|
; [eval] a[i]
(set-option :timeout 0)
(push) ; 7
(assert (not (>= i@53@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
; [eval] !(i < |a| - 1)
; [eval] i < |a| - 1
; [eval] |a| - 1
; [eval] |a|
; [then-branch: 19 | !(i@53@01 < |a@52@01| - 1) | dead]
; [else-branch: 19 | i@53@01 < |a@52@01| - 1 | live]
(push) ; 6
; [else-branch: 19 | i@53@01 < |a@52@01| - 1]
(pop) ; 6
(pop) ; 5
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 15 | !(i@53@01 < |a@52@01| - 1)]
(assert (not (< i@53@01 (- (Seq_length a@52@01) 1))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@54@01))))))
  $Snap.unit))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(declare-const $t@62@01 $Snap)
(assert (= $t@62@01 ($Snap.combine ($Snap.first $t@62@01) ($Snap.second $t@62@01))))
(assert (= ($Snap.first $t@62@01) $Snap.unit))
; [eval] 0 <= i
(assert (=
  ($Snap.second $t@62@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@62@01))
    ($Snap.second ($Snap.second $t@62@01)))))
(assert (= ($Snap.first ($Snap.second $t@62@01)) $Snap.unit))
; [eval] i < |a|
; [eval] |a|
; [eval] a[i]
(push) ; 5
(assert (not (>= i@53@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [exec]
; var __flatten_5: Ref
(declare-const __flatten_5@63@01 $Ref)
; [exec]
; var __flatten_6: Int
(declare-const __flatten_6@64@01 Int)
; [exec]
; var __flatten_7: Ref
(declare-const __flatten_7@65@01 $Ref)
; [eval] i > 0
(push) ; 5
(set-option :timeout 10)
(assert (not (not (> i@53@01 0))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 20 | i@53@01 > 0 | dead]
; [else-branch: 20 | !(i@53@01 > 0) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 20 | !(i@53@01 > 0)]
(assert (not (> i@53@01 0)))
(pop) ; 5
; [eval] !(i > 0)
; [eval] i > 0
(push) ; 5
(set-option :timeout 10)
(assert (not (> i@53@01 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (> i@53@01 0))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 21 | !(i@53@01 > 0) | live]
; [else-branch: 21 | i@53@01 > 0 | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 21 | !(i@53@01 > 0)]
(assert (not (> i@53@01 0)))
; [eval] i < |a| - 1
; [eval] |a| - 1
; [eval] |a|
; [then-branch: 22 | i@53@01 < |a@52@01| - 1 | dead]
; [else-branch: 22 | !(i@53@01 < |a@52@01| - 1) | live]
(push) ; 6
; [else-branch: 22 | !(i@53@01 < |a@52@01| - 1)]
(pop) ; 6
; [eval] !(i < |a| - 1)
; [eval] i < |a| - 1
; [eval] |a| - 1
; [eval] |a|
(push) ; 6
(set-option :timeout 10)
(assert (not (< i@53@01 (- (Seq_length a@52@01) 1))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 23 | !(i@53@01 < |a@52@01| - 1) | live]
; [else-branch: 23 | i@53@01 < |a@52@01| - 1 | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 23 | !(i@53@01 < |a@52@01| - 1)]
; [eval] 0 <= i
; [eval] i < |a|
; [eval] |a|
; [eval] a[i]
(push) ; 7
(assert (not (>= i@53@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(push) ; 2
; [else-branch: 14 | i@53@01 != 0]
(assert (not (= i@53@01 0)))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@54@01))))))
  $Snap.unit))
; [eval] i < |a| - 1
; [eval] |a| - 1
; [eval] |a|
(push) ; 3
(set-option :timeout 10)
(assert (not (not (< i@53@01 (- (Seq_length a@52@01) 1)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< i@53@01 (- (Seq_length a@52@01) 1))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 24 | i@53@01 < |a@52@01| - 1 | live]
; [else-branch: 24 | !(i@53@01 < |a@52@01| - 1) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 24 | i@53@01 < |a@52@01| - 1]
(assert (< i@53@01 (- (Seq_length a@52@01) 1)))
; [eval] a[i + 1]
; [eval] i + 1
(push) ; 4
(assert (not (>= (+ i@53@01 1) 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< (+ i@53@01 1) (Seq_length a@52@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (Seq_index a@52@01 i@53@01) (Seq_index a@52@01 (+ i@53@01 1)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (not (= (Seq_index a@52@01 (+ i@53@01 1)) $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(declare-const $t@66@01 $Snap)
(assert (= $t@66@01 ($Snap.combine ($Snap.first $t@66@01) ($Snap.second $t@66@01))))
(assert (= ($Snap.first $t@66@01) $Snap.unit))
; [eval] 0 <= i
(assert (=
  ($Snap.second $t@66@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@66@01))
    ($Snap.second ($Snap.second $t@66@01)))))
(assert (= ($Snap.first ($Snap.second $t@66@01)) $Snap.unit))
; [eval] i < |a|
; [eval] |a|
; [eval] a[i]
(push) ; 5
(assert (not (>= i@53@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [exec]
; var __flatten_5: Ref
(declare-const __flatten_5@67@01 $Ref)
; [exec]
; var __flatten_6: Int
(declare-const __flatten_6@68@01 Int)
; [exec]
; var __flatten_7: Ref
(declare-const __flatten_7@69@01 $Ref)
; [eval] i > 0
(push) ; 5
(set-option :timeout 10)
(assert (not (not (> i@53@01 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (> i@53@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 25 | i@53@01 > 0 | live]
; [else-branch: 25 | !(i@53@01 > 0) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 25 | i@53@01 > 0]
(assert (> i@53@01 0))
; [exec]
; Ref__recv_body_53(diz, current_thread_id, a, i)
; [eval] diz != null
; [eval] current_thread_id >= 0
; [eval] 0 <= i
; [eval] i < |a|
; [eval] |a|
; [eval] a[i]
(push) ; 6
(assert (not (>= i@53@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(declare-const $t@70@01 Int)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@54@01))))))
  $t@70@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] i < |a| - 1
; [eval] |a| - 1
; [eval] |a|
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (< i@53@01 (- (Seq_length a@52@01) 1)))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 26 | i@53@01 < |a@52@01| - 1 | live]
; [else-branch: 26 | !(i@53@01 < |a@52@01| - 1) | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 26 | i@53@01 < |a@52@01| - 1]
; [exec]
; __flatten_5 := a[i]
; [eval] a[i]
(push) ; 7
(assert (not (>= i@53@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_5@71@01 $Ref)
(assert (= __flatten_5@71@01 (Seq_index a@52@01 i@53@01)))
; [exec]
; __flatten_7 := a[i + 1]
; [eval] a[i + 1]
; [eval] i + 1
(push) ; 7
(assert (not (>= (+ i@53@01 1) 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< (+ i@53@01 1) (Seq_length a@52@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_7@72@01 $Ref)
(assert (= __flatten_7@72@01 (Seq_index a@52@01 (+ i@53@01 1))))
; [exec]
; __flatten_6 := __flatten_7.Ref__Integer_value
(push) ; 7
(set-option :timeout 10)
(assert (not (= (Seq_index a@52@01 i@53@01) __flatten_7@72@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= (Seq_index a@52@01 (+ i@53@01 1)) __flatten_7@72@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_6@73@01 Int)
(assert (=
  __flatten_6@73@01
  ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@54@01)))))))))
; [exec]
; __flatten_5.Ref__Integer_value := __flatten_6
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= (Seq_index a@52@01 i@53@01) __flatten_5@71@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= (Seq_index a@52@01 (+ i@53@01 1)) __flatten_5@71@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (not (= __flatten_5@71@01 $Ref.null)))
; [exec]
; Ref__send_body_59(diz, current_thread_id, a, i)
; [eval] diz != null
; [eval] current_thread_id >= 0
; [eval] 0 <= i
; [eval] i + 1 < |a|
; [eval] i + 1
; [eval] |a|
(set-option :timeout 0)
(push) ; 7
(assert (not (< (+ i@53@01 1) (Seq_length a@52@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (< (+ i@53@01 1) (Seq_length a@52@01)))
; [eval] a[i + 1]
; [eval] i + 1
(push) ; 7
(assert (not (>= (+ i@53@01 1) 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] 0 <= i
; [eval] i < |a|
; [eval] |a|
; [eval] a[i]
(set-option :timeout 0)
(push) ; 7
(assert (not (>= i@53@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
; [eval] !(i < |a| - 1)
; [eval] i < |a| - 1
; [eval] |a| - 1
; [eval] |a|
; [then-branch: 27 | !(i@53@01 < |a@52@01| - 1) | dead]
; [else-branch: 27 | i@53@01 < |a@52@01| - 1 | live]
(push) ; 6
; [else-branch: 27 | i@53@01 < |a@52@01| - 1]
(pop) ; 6
(pop) ; 5
; [eval] !(i > 0)
; [eval] i > 0
(push) ; 5
(set-option :timeout 10)
(assert (not (> i@53@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 28 | !(i@53@01 > 0) | dead]
; [else-branch: 28 | i@53@01 > 0 | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 28 | i@53@01 > 0]
(assert (> i@53@01 0))
(pop) ; 5
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 24 | !(i@53@01 < |a@52@01| - 1)]
(assert (not (< i@53@01 (- (Seq_length a@52@01) 1))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@54@01))))))
  $Snap.unit))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(declare-const $t@74@01 $Snap)
(assert (= $t@74@01 ($Snap.combine ($Snap.first $t@74@01) ($Snap.second $t@74@01))))
(assert (= ($Snap.first $t@74@01) $Snap.unit))
; [eval] 0 <= i
(assert (=
  ($Snap.second $t@74@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@74@01))
    ($Snap.second ($Snap.second $t@74@01)))))
(assert (= ($Snap.first ($Snap.second $t@74@01)) $Snap.unit))
; [eval] i < |a|
; [eval] |a|
; [eval] a[i]
(push) ; 5
(assert (not (>= i@53@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [exec]
; var __flatten_5: Ref
(declare-const __flatten_5@75@01 $Ref)
; [exec]
; var __flatten_6: Int
(declare-const __flatten_6@76@01 Int)
; [exec]
; var __flatten_7: Ref
(declare-const __flatten_7@77@01 $Ref)
; [eval] i > 0
(push) ; 5
(set-option :timeout 10)
(assert (not (not (> i@53@01 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (> i@53@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 29 | i@53@01 > 0 | live]
; [else-branch: 29 | !(i@53@01 > 0) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 29 | i@53@01 > 0]
(assert (> i@53@01 0))
; [exec]
; Ref__recv_body_53(diz, current_thread_id, a, i)
; [eval] diz != null
; [eval] current_thread_id >= 0
; [eval] 0 <= i
; [eval] i < |a|
; [eval] |a|
; [eval] a[i]
(push) ; 6
(assert (not (>= i@53@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(declare-const $t@78@01 Int)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@54@01))))))
  $t@78@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] i < |a| - 1
; [eval] |a| - 1
; [eval] |a|
; [then-branch: 30 | i@53@01 < |a@52@01| - 1 | dead]
; [else-branch: 30 | !(i@53@01 < |a@52@01| - 1) | live]
(set-option :timeout 0)
(push) ; 6
; [else-branch: 30 | !(i@53@01 < |a@52@01| - 1)]
(pop) ; 6
; [eval] !(i < |a| - 1)
; [eval] i < |a| - 1
; [eval] |a| - 1
; [eval] |a|
(push) ; 6
(set-option :timeout 10)
(assert (not (< i@53@01 (- (Seq_length a@52@01) 1))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 31 | !(i@53@01 < |a@52@01| - 1) | live]
; [else-branch: 31 | i@53@01 < |a@52@01| - 1 | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 31 | !(i@53@01 < |a@52@01| - 1)]
; [eval] 0 <= i
; [eval] i < |a|
; [eval] |a|
; [eval] a[i]
(push) ; 7
(assert (not (>= i@53@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
(pop) ; 5
; [eval] !(i > 0)
; [eval] i > 0
(push) ; 5
(set-option :timeout 10)
(assert (not (> i@53@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 32 | !(i@53@01 > 0) | dead]
; [else-branch: 32 | i@53@01 > 0 | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 32 | i@53@01 > 0]
(assert (> i@53@01 0))
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- Ref__guard_check_S2_S1 ----------
(declare-const diz@79@01 $Ref)
(declare-const current_thread_id@80@01 Int)
(declare-const a@81@01 Seq<$Ref>)
(declare-const i@82@01 Int)
(declare-const diz@83@01 $Ref)
(declare-const current_thread_id@84@01 Int)
(declare-const a@85@01 Seq<$Ref>)
(declare-const i@86@01 Int)
(push) ; 1
(declare-const $t@87@01 $Snap)
(assert (= $t@87@01 ($Snap.combine ($Snap.first $t@87@01) ($Snap.second $t@87@01))))
(assert (= ($Snap.first $t@87@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@83@01 $Ref.null)))
(assert (=
  ($Snap.second $t@87@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@87@01))
    ($Snap.second ($Snap.second $t@87@01)))))
(assert (= ($Snap.first ($Snap.second $t@87@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@84@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@87@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@87@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@87@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@87@01))) $Snap.unit))
; [eval] 0 <= i
(assert (<= 0 i@86@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@87@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@87@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@87@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@87@01))))
  $Snap.unit))
; [eval] i < |a|
; [eval] |a|
(assert (< i@86@01 (Seq_length a@85@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@87@01))))
  $Snap.unit))
; [eval] i > 0
(assert (> i@86@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@88@01 $Snap)
(assert (= $t@88@01 ($Snap.combine ($Snap.first $t@88@01) ($Snap.second $t@88@01))))
(assert (= ($Snap.first $t@88@01) $Snap.unit))
; [eval] 1 <= i
(assert (<= 1 i@86@01))
(assert (= ($Snap.second $t@88@01) $Snap.unit))
; [eval] i - 1 < |a| - 1
; [eval] i - 1
; [eval] |a| - 1
; [eval] |a|
(assert (< (- i@86@01 1) (- (Seq_length a@85@01) 1)))
(pop) ; 2
(push) ; 2
; [eval] 1 <= i
(push) ; 3
(assert (not (<= 1 i@86@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (<= 1 i@86@01))
; [eval] i - 1 < |a| - 1
; [eval] i - 1
; [eval] |a| - 1
; [eval] |a|
(push) ; 3
(assert (not (< (- i@86@01 1) (- (Seq_length a@85@01) 1))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< (- i@86@01 1) (- (Seq_length a@85@01) 1)))
(pop) ; 2
(pop) ; 1
; ---------- Ref__resource_check_S2_S1 ----------
(declare-const diz@89@01 $Ref)
(declare-const current_thread_id@90@01 Int)
(declare-const a@91@01 Seq<$Ref>)
(declare-const i@92@01 Int)
(declare-const diz@93@01 $Ref)
(declare-const current_thread_id@94@01 Int)
(declare-const a@95@01 Seq<$Ref>)
(declare-const i@96@01 Int)
(push) ; 1
(declare-const $t@97@01 $Snap)
(assert (= $t@97@01 ($Snap.combine ($Snap.first $t@97@01) ($Snap.second $t@97@01))))
(assert (= ($Snap.first $t@97@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@93@01 $Ref.null)))
(assert (=
  ($Snap.second $t@97@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@97@01))
    ($Snap.second ($Snap.second $t@97@01)))))
(assert (= ($Snap.first ($Snap.second $t@97@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@94@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@97@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@97@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@97@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@97@01))) $Snap.unit))
; [eval] 0 <= i
(assert (<= 0 i@96@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@97@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@97@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@97@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@97@01))))
  $Snap.unit))
; [eval] i < |a|
; [eval] |a|
(assert (< i@96@01 (Seq_length a@95@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@97@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@97@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@97@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@97@01)))))
  $Snap.unit))
; [eval] i - 1 < |a| - 1
; [eval] i - 1
; [eval] |a| - 1
; [eval] |a|
(assert (< (- i@96@01 1) (- (Seq_length a@95@01) 1)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@97@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@97@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@97@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@97@01))))))
  $Snap.unit))
; [eval] i > 0
(assert (> i@96@01 0))
; [eval] a[i - 1 + 1]
; [eval] i - 1 + 1
; [eval] i - 1
(push) ; 2
(assert (not (>= (+ (- i@96@01 1) 1) 0)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(push) ; 2
(assert (not (< (+ (- i@96@01 1) 1) (Seq_length a@95@01))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= (Seq_index a@95@01 (+ (- i@96@01 1) 1)) $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@98@01 $Snap)
(assert (= $t@98@01 ($Snap.combine ($Snap.first $t@98@01) ($Snap.second $t@98@01))))
(assert (= ($Snap.first $t@98@01) $Snap.unit))
; [eval] i - 1 < |a| - 1
; [eval] i - 1
; [eval] |a| - 1
; [eval] |a|
; [eval] a[i]
(push) ; 3
(assert (not (>= i@96@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not (= (Seq_index a@95@01 i@96@01) $Ref.null)))
(pop) ; 2
(push) ; 2
; [eval] i - 1 < |a| - 1
; [eval] i - 1
; [eval] |a| - 1
; [eval] |a|
; [eval] a[i]
(push) ; 3
(assert (not (>= i@96@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (Seq_index a@95@01 (+ (- i@96@01 1) 1)) (Seq_index a@95@01 i@96@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- Ref__main ----------
(declare-const diz@99@01 $Ref)
(declare-const current_thread_id@100@01 Int)
(declare-const a@101@01 Seq<$Ref>)
(declare-const diz@102@01 $Ref)
(declare-const current_thread_id@103@01 Int)
(declare-const a@104@01 Seq<$Ref>)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@105@01 $Snap)
(assert (= $t@105@01 ($Snap.combine ($Snap.first $t@105@01) ($Snap.second $t@105@01))))
(assert (= ($Snap.first $t@105@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@102@01 $Ref.null)))
(assert (=
  ($Snap.second $t@105@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@105@01))
    ($Snap.second ($Snap.second $t@105@01)))))
(assert (= ($Snap.first ($Snap.second $t@105@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@103@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@105@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@105@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@105@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@105@01))) $Snap.unit))
; [eval] (forall j: Int, k: Int :: { a[j], a[k] } 0 <= j && (j < |a| && (0 <= k && (k < |a| && j != k))) ==> a[j] != a[k])
(declare-const j@106@01 Int)
(declare-const k@107@01 Int)
(push) ; 2
; [eval] 0 <= j && (j < |a| && (0 <= k && (k < |a| && j != k))) ==> a[j] != a[k]
; [eval] 0 <= j && (j < |a| && (0 <= k && (k < |a| && j != k)))
; [eval] 0 <= j
(push) ; 3
; [then-branch: 33 | !(0 <= j@106@01) | live]
; [else-branch: 33 | 0 <= j@106@01 | live]
(push) ; 4
; [then-branch: 33 | !(0 <= j@106@01)]
(assert (not (<= 0 j@106@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 33 | 0 <= j@106@01]
(assert (<= 0 j@106@01))
; [eval] j < |a|
; [eval] |a|
(push) ; 5
; [then-branch: 34 | !(j@106@01 < |a@104@01|) | live]
; [else-branch: 34 | j@106@01 < |a@104@01| | live]
(push) ; 6
; [then-branch: 34 | !(j@106@01 < |a@104@01|)]
(assert (not (< j@106@01 (Seq_length a@104@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 34 | j@106@01 < |a@104@01|]
(assert (< j@106@01 (Seq_length a@104@01)))
; [eval] 0 <= k
(push) ; 7
; [then-branch: 35 | !(0 <= k@107@01) | live]
; [else-branch: 35 | 0 <= k@107@01 | live]
(push) ; 8
; [then-branch: 35 | !(0 <= k@107@01)]
(assert (not (<= 0 k@107@01)))
(pop) ; 8
(push) ; 8
; [else-branch: 35 | 0 <= k@107@01]
(assert (<= 0 k@107@01))
; [eval] k < |a|
; [eval] |a|
(push) ; 9
; [then-branch: 36 | !(k@107@01 < |a@104@01|) | live]
; [else-branch: 36 | k@107@01 < |a@104@01| | live]
(push) ; 10
; [then-branch: 36 | !(k@107@01 < |a@104@01|)]
(assert (not (< k@107@01 (Seq_length a@104@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 36 | k@107@01 < |a@104@01|]
(assert (< k@107@01 (Seq_length a@104@01)))
; [eval] j != k
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< k@107@01 (Seq_length a@104@01)) (not (< k@107@01 (Seq_length a@104@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 k@107@01)
  (and
    (<= 0 k@107@01)
    (or
      (< k@107@01 (Seq_length a@104@01))
      (not (< k@107@01 (Seq_length a@104@01)))))))
(assert (or (<= 0 k@107@01) (not (<= 0 k@107@01))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< j@106@01 (Seq_length a@104@01))
  (and
    (< j@106@01 (Seq_length a@104@01))
    (=>
      (<= 0 k@107@01)
      (and
        (<= 0 k@107@01)
        (or
          (< k@107@01 (Seq_length a@104@01))
          (not (< k@107@01 (Seq_length a@104@01))))))
    (or (<= 0 k@107@01) (not (<= 0 k@107@01))))))
(assert (or (< j@106@01 (Seq_length a@104@01)) (not (< j@106@01 (Seq_length a@104@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j@106@01)
  (and
    (<= 0 j@106@01)
    (=>
      (< j@106@01 (Seq_length a@104@01))
      (and
        (< j@106@01 (Seq_length a@104@01))
        (=>
          (<= 0 k@107@01)
          (and
            (<= 0 k@107@01)
            (or
              (< k@107@01 (Seq_length a@104@01))
              (not (< k@107@01 (Seq_length a@104@01))))))
        (or (<= 0 k@107@01) (not (<= 0 k@107@01)))))
    (or
      (< j@106@01 (Seq_length a@104@01))
      (not (< j@106@01 (Seq_length a@104@01)))))))
(assert (or (<= 0 j@106@01) (not (<= 0 j@106@01))))
(push) ; 3
; [then-branch: 37 | 0 <= j@106@01 && j@106@01 < |a@104@01| && 0 <= k@107@01 && k@107@01 < |a@104@01| && j@106@01 != k@107@01 | live]
; [else-branch: 37 | !(0 <= j@106@01 && j@106@01 < |a@104@01| && 0 <= k@107@01 && k@107@01 < |a@104@01| && j@106@01 != k@107@01) | live]
(push) ; 4
; [then-branch: 37 | 0 <= j@106@01 && j@106@01 < |a@104@01| && 0 <= k@107@01 && k@107@01 < |a@104@01| && j@106@01 != k@107@01]
(assert (and
  (<= 0 j@106@01)
  (and
    (< j@106@01 (Seq_length a@104@01))
    (and
      (<= 0 k@107@01)
      (and (< k@107@01 (Seq_length a@104@01)) (not (= j@106@01 k@107@01)))))))
; [eval] a[j] != a[k]
; [eval] a[j]
(push) ; 5
(assert (not (>= j@106@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] a[k]
(push) ; 5
(assert (not (>= k@107@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(push) ; 4
; [else-branch: 37 | !(0 <= j@106@01 && j@106@01 < |a@104@01| && 0 <= k@107@01 && k@107@01 < |a@104@01| && j@106@01 != k@107@01)]
(assert (not
  (and
    (<= 0 j@106@01)
    (and
      (< j@106@01 (Seq_length a@104@01))
      (and
        (<= 0 k@107@01)
        (and (< k@107@01 (Seq_length a@104@01)) (not (= j@106@01 k@107@01))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (<= 0 j@106@01)
    (and
      (< j@106@01 (Seq_length a@104@01))
      (and
        (<= 0 k@107@01)
        (and (< k@107@01 (Seq_length a@104@01)) (not (= j@106@01 k@107@01))))))
  (and
    (<= 0 j@106@01)
    (< j@106@01 (Seq_length a@104@01))
    (<= 0 k@107@01)
    (< k@107@01 (Seq_length a@104@01))
    (not (= j@106@01 k@107@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 j@106@01)
      (and
        (< j@106@01 (Seq_length a@104@01))
        (and
          (<= 0 k@107@01)
          (and (< k@107@01 (Seq_length a@104@01)) (not (= j@106@01 k@107@01)))))))
  (and
    (<= 0 j@106@01)
    (and
      (< j@106@01 (Seq_length a@104@01))
      (and
        (<= 0 k@107@01)
        (and (< k@107@01 (Seq_length a@104@01)) (not (= j@106@01 k@107@01))))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@106@01 Int) (k@107@01 Int)) (!
  (and
    (=>
      (<= 0 j@106@01)
      (and
        (<= 0 j@106@01)
        (=>
          (< j@106@01 (Seq_length a@104@01))
          (and
            (< j@106@01 (Seq_length a@104@01))
            (=>
              (<= 0 k@107@01)
              (and
                (<= 0 k@107@01)
                (or
                  (< k@107@01 (Seq_length a@104@01))
                  (not (< k@107@01 (Seq_length a@104@01))))))
            (or (<= 0 k@107@01) (not (<= 0 k@107@01)))))
        (or
          (< j@106@01 (Seq_length a@104@01))
          (not (< j@106@01 (Seq_length a@104@01))))))
    (or (<= 0 j@106@01) (not (<= 0 j@106@01)))
    (=>
      (and
        (<= 0 j@106@01)
        (and
          (< j@106@01 (Seq_length a@104@01))
          (and
            (<= 0 k@107@01)
            (and (< k@107@01 (Seq_length a@104@01)) (not (= j@106@01 k@107@01))))))
      (and
        (<= 0 j@106@01)
        (< j@106@01 (Seq_length a@104@01))
        (<= 0 k@107@01)
        (< k@107@01 (Seq_length a@104@01))
        (not (= j@106@01 k@107@01))))
    (or
      (not
        (and
          (<= 0 j@106@01)
          (and
            (< j@106@01 (Seq_length a@104@01))
            (and
              (<= 0 k@107@01)
              (and
                (< k@107@01 (Seq_length a@104@01))
                (not (= j@106@01 k@107@01)))))))
      (and
        (<= 0 j@106@01)
        (and
          (< j@106@01 (Seq_length a@104@01))
          (and
            (<= 0 k@107@01)
            (and (< k@107@01 (Seq_length a@104@01)) (not (= j@106@01 k@107@01))))))))
  :pattern ((Seq_index a@104@01 j@106@01) (Seq_index a@104@01 k@107@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_IterationExample.vpr@138@12@138@102-aux|)))
(assert (forall ((j@106@01 Int) (k@107@01 Int)) (!
  (=>
    (and
      (<= 0 j@106@01)
      (and
        (< j@106@01 (Seq_length a@104@01))
        (and
          (<= 0 k@107@01)
          (and (< k@107@01 (Seq_length a@104@01)) (not (= j@106@01 k@107@01))))))
    (not (= (Seq_index a@104@01 j@106@01) (Seq_index a@104@01 k@107@01))))
  :pattern ((Seq_index a@104@01 j@106@01) (Seq_index a@104@01 k@107@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_IterationExample.vpr@138@12@138@102|)))
(declare-const i@108@01 Int)
(push) ; 2
; [eval] 0 <= i && i < |a|
; [eval] 0 <= i
(push) ; 3
; [then-branch: 38 | !(0 <= i@108@01) | live]
; [else-branch: 38 | 0 <= i@108@01 | live]
(push) ; 4
; [then-branch: 38 | !(0 <= i@108@01)]
(assert (not (<= 0 i@108@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 38 | 0 <= i@108@01]
(assert (<= 0 i@108@01))
; [eval] i < |a|
; [eval] |a|
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@108@01) (not (<= 0 i@108@01))))
(assert (and (<= 0 i@108@01) (< i@108@01 (Seq_length a@104@01))))
; [eval] a[i]
(push) ; 3
(assert (not (>= i@108@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@109@01 ($Ref) Int)
(declare-fun img@110@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@108@01 Int)) (!
  (=>
    (and (<= 0 i@108@01) (< i@108@01 (Seq_length a@104@01)))
    (or (<= 0 i@108@01) (not (<= 0 i@108@01))))
  :pattern ((Seq_index a@104@01 i@108@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@108@01 Int) (i2@108@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@108@01) (< i1@108@01 (Seq_length a@104@01)))
      (and (<= 0 i2@108@01) (< i2@108@01 (Seq_length a@104@01)))
      (= (Seq_index a@104@01 i1@108@01) (Seq_index a@104@01 i2@108@01)))
    (= i1@108@01 i2@108@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@108@01 Int)) (!
  (=>
    (and (<= 0 i@108@01) (< i@108@01 (Seq_length a@104@01)))
    (and
      (= (inv@109@01 (Seq_index a@104@01 i@108@01)) i@108@01)
      (img@110@01 (Seq_index a@104@01 i@108@01))))
  :pattern ((Seq_index a@104@01 i@108@01))
  :qid |quant-u-61|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@110@01 r)
      (and (<= 0 (inv@109@01 r)) (< (inv@109@01 r) (Seq_length a@104@01))))
    (= (Seq_index a@104@01 (inv@109@01 r)) r))
  :pattern ((inv@109@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@108@01 Int)) (!
  (=>
    (and (<= 0 i@108@01) (< i@108@01 (Seq_length a@104@01)))
    (not (= (Seq_index a@104@01 i@108@01) $Ref.null)))
  :pattern ((Seq_index a@104@01 i@108@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const i@111@01 Int)
(push) ; 3
; [eval] 0 <= i && i < |a|
; [eval] 0 <= i
(push) ; 4
; [then-branch: 39 | !(0 <= i@111@01) | live]
; [else-branch: 39 | 0 <= i@111@01 | live]
(push) ; 5
; [then-branch: 39 | !(0 <= i@111@01)]
(assert (not (<= 0 i@111@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 39 | 0 <= i@111@01]
(assert (<= 0 i@111@01))
; [eval] i < |a|
; [eval] |a|
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@111@01) (not (<= 0 i@111@01))))
(assert (and (<= 0 i@111@01) (< i@111@01 (Seq_length a@104@01))))
; [eval] a[i]
(push) ; 4
(assert (not (>= i@111@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-const $t@112@01 $FVF<Ref__Integer_value>)
(declare-fun inv@113@01 ($Ref) Int)
(declare-fun img@114@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@111@01 Int)) (!
  (=>
    (and (<= 0 i@111@01) (< i@111@01 (Seq_length a@104@01)))
    (or (<= 0 i@111@01) (not (<= 0 i@111@01))))
  :pattern ((Seq_index a@104@01 i@111@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@111@01 Int) (i2@111@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@111@01) (< i1@111@01 (Seq_length a@104@01)))
      (and (<= 0 i2@111@01) (< i2@111@01 (Seq_length a@104@01)))
      (= (Seq_index a@104@01 i1@111@01) (Seq_index a@104@01 i2@111@01)))
    (= i1@111@01 i2@111@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@111@01 Int)) (!
  (=>
    (and (<= 0 i@111@01) (< i@111@01 (Seq_length a@104@01)))
    (and
      (= (inv@113@01 (Seq_index a@104@01 i@111@01)) i@111@01)
      (img@114@01 (Seq_index a@104@01 i@111@01))))
  :pattern ((Seq_index a@104@01 i@111@01))
  :qid |quant-u-63|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@114@01 r)
      (and (<= 0 (inv@113@01 r)) (< (inv@113@01 r) (Seq_length a@104@01))))
    (= (Seq_index a@104@01 (inv@113@01 r)) r))
  :pattern ((inv@113@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@111@01 Int)) (!
  (=>
    (and (<= 0 i@111@01) (< i@111@01 (Seq_length a@104@01)))
    (not (= (Seq_index a@104@01 i@111@01) $Ref.null)))
  :pattern ((Seq_index a@104@01 i@111@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(pop) ; 2
(push) ; 2
; [exec]
; Ref__loop_main_11(diz, current_thread_id, a)
; [eval] diz != null
; [eval] current_thread_id >= 0
; [eval] (forall j: Int, k: Int :: { a[j], a[k] } 0 <= j && (j < |a| && (0 <= k && (k < |a| && j != k))) ==> a[j] != a[k])
(declare-const j@115@01 Int)
(declare-const k@116@01 Int)
(push) ; 3
; [eval] 0 <= j && (j < |a| && (0 <= k && (k < |a| && j != k))) ==> a[j] != a[k]
; [eval] 0 <= j && (j < |a| && (0 <= k && (k < |a| && j != k)))
; [eval] 0 <= j
(push) ; 4
; [then-branch: 40 | !(0 <= j@115@01) | live]
; [else-branch: 40 | 0 <= j@115@01 | live]
(push) ; 5
; [then-branch: 40 | !(0 <= j@115@01)]
(assert (not (<= 0 j@115@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 40 | 0 <= j@115@01]
(assert (<= 0 j@115@01))
; [eval] j < |a|
; [eval] |a|
(push) ; 6
; [then-branch: 41 | !(j@115@01 < |a@104@01|) | live]
; [else-branch: 41 | j@115@01 < |a@104@01| | live]
(push) ; 7
; [then-branch: 41 | !(j@115@01 < |a@104@01|)]
(assert (not (< j@115@01 (Seq_length a@104@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 41 | j@115@01 < |a@104@01|]
(assert (< j@115@01 (Seq_length a@104@01)))
; [eval] 0 <= k
(push) ; 8
; [then-branch: 42 | !(0 <= k@116@01) | live]
; [else-branch: 42 | 0 <= k@116@01 | live]
(push) ; 9
; [then-branch: 42 | !(0 <= k@116@01)]
(assert (not (<= 0 k@116@01)))
(pop) ; 9
(push) ; 9
; [else-branch: 42 | 0 <= k@116@01]
(assert (<= 0 k@116@01))
; [eval] k < |a|
; [eval] |a|
(push) ; 10
; [then-branch: 43 | !(k@116@01 < |a@104@01|) | live]
; [else-branch: 43 | k@116@01 < |a@104@01| | live]
(push) ; 11
; [then-branch: 43 | !(k@116@01 < |a@104@01|)]
(assert (not (< k@116@01 (Seq_length a@104@01))))
(pop) ; 11
(push) ; 11
; [else-branch: 43 | k@116@01 < |a@104@01|]
(assert (< k@116@01 (Seq_length a@104@01)))
; [eval] j != k
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or (< k@116@01 (Seq_length a@104@01)) (not (< k@116@01 (Seq_length a@104@01)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 k@116@01)
  (and
    (<= 0 k@116@01)
    (or
      (< k@116@01 (Seq_length a@104@01))
      (not (< k@116@01 (Seq_length a@104@01)))))))
(assert (or (<= 0 k@116@01) (not (<= 0 k@116@01))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< j@115@01 (Seq_length a@104@01))
  (and
    (< j@115@01 (Seq_length a@104@01))
    (=>
      (<= 0 k@116@01)
      (and
        (<= 0 k@116@01)
        (or
          (< k@116@01 (Seq_length a@104@01))
          (not (< k@116@01 (Seq_length a@104@01))))))
    (or (<= 0 k@116@01) (not (<= 0 k@116@01))))))
(assert (or (< j@115@01 (Seq_length a@104@01)) (not (< j@115@01 (Seq_length a@104@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 0 j@115@01)
  (and
    (<= 0 j@115@01)
    (=>
      (< j@115@01 (Seq_length a@104@01))
      (and
        (< j@115@01 (Seq_length a@104@01))
        (=>
          (<= 0 k@116@01)
          (and
            (<= 0 k@116@01)
            (or
              (< k@116@01 (Seq_length a@104@01))
              (not (< k@116@01 (Seq_length a@104@01))))))
        (or (<= 0 k@116@01) (not (<= 0 k@116@01)))))
    (or
      (< j@115@01 (Seq_length a@104@01))
      (not (< j@115@01 (Seq_length a@104@01)))))))
(assert (or (<= 0 j@115@01) (not (<= 0 j@115@01))))
(push) ; 4
; [then-branch: 44 | 0 <= j@115@01 && j@115@01 < |a@104@01| && 0 <= k@116@01 && k@116@01 < |a@104@01| && j@115@01 != k@116@01 | live]
; [else-branch: 44 | !(0 <= j@115@01 && j@115@01 < |a@104@01| && 0 <= k@116@01 && k@116@01 < |a@104@01| && j@115@01 != k@116@01) | live]
(push) ; 5
; [then-branch: 44 | 0 <= j@115@01 && j@115@01 < |a@104@01| && 0 <= k@116@01 && k@116@01 < |a@104@01| && j@115@01 != k@116@01]
(assert (and
  (<= 0 j@115@01)
  (and
    (< j@115@01 (Seq_length a@104@01))
    (and
      (<= 0 k@116@01)
      (and (< k@116@01 (Seq_length a@104@01)) (not (= j@115@01 k@116@01)))))))
; [eval] a[j] != a[k]
; [eval] a[j]
(push) ; 6
(assert (not (>= j@115@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [eval] a[k]
(push) ; 6
(assert (not (>= k@116@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(pop) ; 5
(push) ; 5
; [else-branch: 44 | !(0 <= j@115@01 && j@115@01 < |a@104@01| && 0 <= k@116@01 && k@116@01 < |a@104@01| && j@115@01 != k@116@01)]
(assert (not
  (and
    (<= 0 j@115@01)
    (and
      (< j@115@01 (Seq_length a@104@01))
      (and
        (<= 0 k@116@01)
        (and (< k@116@01 (Seq_length a@104@01)) (not (= j@115@01 k@116@01))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (<= 0 j@115@01)
    (and
      (< j@115@01 (Seq_length a@104@01))
      (and
        (<= 0 k@116@01)
        (and (< k@116@01 (Seq_length a@104@01)) (not (= j@115@01 k@116@01))))))
  (and
    (<= 0 j@115@01)
    (< j@115@01 (Seq_length a@104@01))
    (<= 0 k@116@01)
    (< k@116@01 (Seq_length a@104@01))
    (not (= j@115@01 k@116@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (<= 0 j@115@01)
      (and
        (< j@115@01 (Seq_length a@104@01))
        (and
          (<= 0 k@116@01)
          (and (< k@116@01 (Seq_length a@104@01)) (not (= j@115@01 k@116@01)))))))
  (and
    (<= 0 j@115@01)
    (and
      (< j@115@01 (Seq_length a@104@01))
      (and
        (<= 0 k@116@01)
        (and (< k@116@01 (Seq_length a@104@01)) (not (= j@115@01 k@116@01))))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((j@115@01 Int) (k@116@01 Int)) (!
  (and
    (=>
      (<= 0 j@115@01)
      (and
        (<= 0 j@115@01)
        (=>
          (< j@115@01 (Seq_length a@104@01))
          (and
            (< j@115@01 (Seq_length a@104@01))
            (=>
              (<= 0 k@116@01)
              (and
                (<= 0 k@116@01)
                (or
                  (< k@116@01 (Seq_length a@104@01))
                  (not (< k@116@01 (Seq_length a@104@01))))))
            (or (<= 0 k@116@01) (not (<= 0 k@116@01)))))
        (or
          (< j@115@01 (Seq_length a@104@01))
          (not (< j@115@01 (Seq_length a@104@01))))))
    (or (<= 0 j@115@01) (not (<= 0 j@115@01)))
    (=>
      (and
        (<= 0 j@115@01)
        (and
          (< j@115@01 (Seq_length a@104@01))
          (and
            (<= 0 k@116@01)
            (and (< k@116@01 (Seq_length a@104@01)) (not (= j@115@01 k@116@01))))))
      (and
        (<= 0 j@115@01)
        (< j@115@01 (Seq_length a@104@01))
        (<= 0 k@116@01)
        (< k@116@01 (Seq_length a@104@01))
        (not (= j@115@01 k@116@01))))
    (or
      (not
        (and
          (<= 0 j@115@01)
          (and
            (< j@115@01 (Seq_length a@104@01))
            (and
              (<= 0 k@116@01)
              (and
                (< k@116@01 (Seq_length a@104@01))
                (not (= j@115@01 k@116@01)))))))
      (and
        (<= 0 j@115@01)
        (and
          (< j@115@01 (Seq_length a@104@01))
          (and
            (<= 0 k@116@01)
            (and (< k@116@01 (Seq_length a@104@01)) (not (= j@115@01 k@116@01))))))))
  :pattern ((Seq_index a@104@01 j@115@01) (Seq_index a@104@01 k@116@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_IterationExample.vpr@61@12@61@102-aux|)))
(push) ; 3
(assert (not (forall ((j@115@01 Int) (k@116@01 Int)) (!
  (=>
    (and
      (<= 0 j@115@01)
      (and
        (< j@115@01 (Seq_length a@104@01))
        (and
          (<= 0 k@116@01)
          (and (< k@116@01 (Seq_length a@104@01)) (not (= j@115@01 k@116@01))))))
    (not (= (Seq_index a@104@01 j@115@01) (Seq_index a@104@01 k@116@01))))
  :pattern ((Seq_index a@104@01 j@115@01) (Seq_index a@104@01 k@116@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_IterationExample.vpr@61@12@61@102|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((j@115@01 Int) (k@116@01 Int)) (!
  (=>
    (and
      (<= 0 j@115@01)
      (and
        (< j@115@01 (Seq_length a@104@01))
        (and
          (<= 0 k@116@01)
          (and (< k@116@01 (Seq_length a@104@01)) (not (= j@115@01 k@116@01))))))
    (not (= (Seq_index a@104@01 j@115@01) (Seq_index a@104@01 k@116@01))))
  :pattern ((Seq_index a@104@01 j@115@01) (Seq_index a@104@01 k@116@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_IterationExample.vpr@61@12@61@102|)))
(declare-const i@117@01 Int)
(push) ; 3
; [eval] 0 <= i && i < |a|
; [eval] 0 <= i
(push) ; 4
; [then-branch: 45 | !(0 <= i@117@01) | live]
; [else-branch: 45 | 0 <= i@117@01 | live]
(push) ; 5
; [then-branch: 45 | !(0 <= i@117@01)]
(assert (not (<= 0 i@117@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 45 | 0 <= i@117@01]
(assert (<= 0 i@117@01))
; [eval] i < |a|
; [eval] |a|
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@117@01) (not (<= 0 i@117@01))))
(assert (and (<= 0 i@117@01) (< i@117@01 (Seq_length a@104@01))))
; [eval] a[i]
(push) ; 4
(assert (not (>= i@117@01 0)))
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
(assert (forall ((i@117@01 Int)) (!
  (=>
    (and (<= 0 i@117@01) (< i@117@01 (Seq_length a@104@01)))
    (or (<= 0 i@117@01) (not (<= 0 i@117@01))))
  :pattern ((Seq_index a@104@01 i@117@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@117@01 Int) (i2@117@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@117@01) (< i1@117@01 (Seq_length a@104@01)))
      (and (<= 0 i2@117@01) (< i2@117@01 (Seq_length a@104@01)))
      (= (Seq_index a@104@01 i1@117@01) (Seq_index a@104@01 i2@117@01)))
    (= i1@117@01 i2@117@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@117@01 Int)) (!
  (=>
    (and (<= 0 i@117@01) (< i@117@01 (Seq_length a@104@01)))
    (and
      (= (inv@118@01 (Seq_index a@104@01 i@117@01)) i@117@01)
      (img@119@01 (Seq_index a@104@01 i@117@01))))
  :pattern ((Seq_index a@104@01 i@117@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@119@01 r)
      (and (<= 0 (inv@118@01 r)) (< (inv@118@01 r) (Seq_length a@104@01))))
    (= (Seq_index a@104@01 (inv@118@01 r)) r))
  :pattern ((inv@118@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@120@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@118@01 r)) (< (inv@118@01 r) (Seq_length a@104@01)))
      (img@119@01 r)
      (= r (Seq_index a@104@01 (inv@118@01 r))))
    ($Perm.min
      (ite
        (and
          (img@110@01 r)
          (and (<= 0 (inv@109@01 r)) (< (inv@109@01 r) (Seq_length a@104@01))))
        $Perm.Write
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
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
          (img@110@01 r)
          (and (<= 0 (inv@109@01 r)) (< (inv@109@01 r) (Seq_length a@104@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@120@01 r))
    $Perm.No)
  
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
  (= (pTaken@120@01 r) $Perm.No)
  
  :qid |quant-u-67|))))
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
      (and (<= 0 (inv@118@01 r)) (< (inv@118@01 r) (Seq_length a@104@01)))
      (img@119@01 r)
      (= r (Seq_index a@104@01 (inv@118@01 r))))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@120@01 r)) $Perm.No))
  
  :qid |quant-u-68|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@121@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@110@01 r)
      (and (<= 0 (inv@109@01 r)) (< (inv@109@01 r) (Seq_length a@104@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@121@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second $t@105@01)))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@121@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second $t@105@01)))) r))
  :qid |qp.fvfValDef0|)))
; [eval] 0 <= 0 && 0 < |a|
; [eval] 0 <= 0
(set-option :timeout 0)
(push) ; 3
; [then-branch: 46 | False | live]
; [else-branch: 46 | True | live]
(push) ; 4
; [then-branch: 46 | False]
(assert false)
(pop) ; 4
(push) ; 4
; [else-branch: 46 | True]
; [eval] 0 < |a|
; [eval] |a|
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(push) ; 3
(set-option :timeout 10)
(assert (not (not (< 0 (Seq_length a@104@01)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< 0 (Seq_length a@104@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 47 | 0 < |a@104@01| | live]
; [else-branch: 47 | !(0 < |a@104@01|) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 47 | 0 < |a@104@01|]
(assert (< 0 (Seq_length a@104@01)))
; [eval] a[0]
; Precomputing data for removing quantified permissions
(define-fun pTaken@122@01 ((r $Ref)) $Perm
  (ite
    (= r (Seq_index a@104@01 0))
    ($Perm.min
      (ite
        (and
          (img@110@01 r)
          (and (<= 0 (inv@109@01 r)) (< (inv@109@01 r) (Seq_length a@104@01))))
        (- $Perm.Write (pTaken@120@01 r))
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
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
          (img@110@01 r)
          (and (<= 0 (inv@109@01 r)) (< (inv@109@01 r) (Seq_length a@104@01))))
        (- $Perm.Write (pTaken@120@01 r))
        $Perm.No)
      (pTaken@122@01 r))
    $Perm.No)
  
  :qid |quant-u-70|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@122@01 r) $Perm.No)
  
  :qid |quant-u-71|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Intermediate check if already taken enough permissions
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=>
    (= r (Seq_index a@104@01 0))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@122@01 r)) $Perm.No))
  
  :qid |quant-u-72|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@123@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (ite
    (and
      (img@110@01 (Seq_index a@104@01 0))
      (and
        (<= 0 (inv@109@01 (Seq_index a@104@01 0)))
        (< (inv@109@01 (Seq_index a@104@01 0)) (Seq_length a@104@01))))
    (< $Perm.No (- $Perm.Write (pTaken@120@01 (Seq_index a@104@01 0))))
    false)
  (=
    ($FVF.lookup_Ref__Integer_value (as sm@123@01  $FVF<Ref__Integer_value>) (Seq_index
      a@104@01
      0))
    ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second $t@105@01)))) (Seq_index
      a@104@01
      0)))))
(declare-const i@124@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] 1 <= i && i < (|a| - 1 < |a| ? |a| - 1 : |a|) + 1
; [eval] 1 <= i
(push) ; 5
; [then-branch: 48 | !(1 <= i@124@01) | live]
; [else-branch: 48 | 1 <= i@124@01 | live]
(push) ; 6
; [then-branch: 48 | !(1 <= i@124@01)]
(assert (not (<= 1 i@124@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 48 | 1 <= i@124@01]
(assert (<= 1 i@124@01))
; [eval] i < (|a| - 1 < |a| ? |a| - 1 : |a|) + 1
; [eval] (|a| - 1 < |a| ? |a| - 1 : |a|) + 1
; [eval] (|a| - 1 < |a| ? |a| - 1 : |a|)
; [eval] |a| - 1 < |a|
; [eval] |a| - 1
; [eval] |a|
; [eval] |a|
(push) ; 7
(push) ; 8
(set-option :timeout 10)
(assert (not (not (< (- (Seq_length a@104@01) 1) (Seq_length a@104@01)))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (< (- (Seq_length a@104@01) 1) (Seq_length a@104@01))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 49 | |a@104@01| - 1 < |a@104@01| | live]
; [else-branch: 49 | !(|a@104@01| - 1 < |a@104@01|) | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 49 | |a@104@01| - 1 < |a@104@01|]
(assert (< (- (Seq_length a@104@01) 1) (Seq_length a@104@01)))
; [eval] |a| - 1
; [eval] |a|
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (< (- (Seq_length a@104@01) 1) (Seq_length a@104@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 1 i@124@01)
  (and (<= 1 i@124@01) (< (- (Seq_length a@104@01) 1) (Seq_length a@104@01)))))
(assert (or (<= 1 i@124@01) (not (<= 1 i@124@01))))
(assert (and (<= 1 i@124@01) (< i@124@01 (+ (- (Seq_length a@104@01) 1) 1))))
; [eval] a[i]
(push) ; 5
(assert (not (>= i@124@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@124@01 (Seq_length a@104@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@125@01 ($Ref) Int)
(declare-fun img@126@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@124@01 Int)) (!
  (=>
    (and (<= 1 i@124@01) (< i@124@01 (+ (- (Seq_length a@104@01) 1) 1)))
    (and
      (=>
        (<= 1 i@124@01)
        (and
          (<= 1 i@124@01)
          (< (- (Seq_length a@104@01) 1) (Seq_length a@104@01))))
      (or (<= 1 i@124@01) (not (<= 1 i@124@01)))))
  :pattern ((Seq_index a@104@01 i@124@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@124@01 Int) (i2@124@01 Int)) (!
  (=>
    (and
      (and (<= 1 i1@124@01) (< i1@124@01 (+ (- (Seq_length a@104@01) 1) 1)))
      (and (<= 1 i2@124@01) (< i2@124@01 (+ (- (Seq_length a@104@01) 1) 1)))
      (= (Seq_index a@104@01 i1@124@01) (Seq_index a@104@01 i2@124@01)))
    (= i1@124@01 i2@124@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@124@01 Int)) (!
  (=>
    (and (<= 1 i@124@01) (< i@124@01 (+ (- (Seq_length a@104@01) 1) 1)))
    (and
      (= (inv@125@01 (Seq_index a@104@01 i@124@01)) i@124@01)
      (img@126@01 (Seq_index a@104@01 i@124@01))))
  :pattern ((Seq_index a@104@01 i@124@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@126@01 r)
      (and
        (<= 1 (inv@125@01 r))
        (< (inv@125@01 r) (+ (- (Seq_length a@104@01) 1) 1))))
    (= (Seq_index a@104@01 (inv@125@01 r)) r))
  :pattern ((inv@125@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@127@01 ((r $Ref)) $Perm
  (ite
    (and
      (and
        (<= 1 (inv@125@01 r))
        (< (inv@125@01 r) (+ (- (Seq_length a@104@01) 1) 1)))
      (img@126@01 r)
      (= r (Seq_index a@104@01 (inv@125@01 r))))
    ($Perm.min
      (ite
        (and
          (img@110@01 r)
          (and (<= 0 (inv@109@01 r)) (< (inv@109@01 r) (Seq_length a@104@01))))
        (- (- $Perm.Write (pTaken@120@01 r)) (pTaken@122@01 r))
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
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
          (img@110@01 r)
          (and (<= 0 (inv@109@01 r)) (< (inv@109@01 r) (Seq_length a@104@01))))
        (- (- $Perm.Write (pTaken@120@01 r)) (pTaken@122@01 r))
        $Perm.No)
      (pTaken@127@01 r))
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
      (and
        (<= 1 (inv@125@01 r))
        (< (inv@125@01 r) (+ (- (Seq_length a@104@01) 1) 1)))
      (img@126@01 r)
      (= r (Seq_index a@104@01 (inv@125@01 r))))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@127@01 r)) $Perm.No))
  
  :qid |quant-u-76|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@128@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@110@01 r)
        (and (<= 0 (inv@109@01 r)) (< (inv@109@01 r) (Seq_length a@104@01))))
      (< $Perm.No (- (- $Perm.Write (pTaken@120@01 r)) (pTaken@122@01 r)))
      false)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@128@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second $t@105@01)))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@128@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second $t@105@01)))) r))
  :qid |qp.fvfValDef2|)))
(declare-const i@129@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] 0 <= i && i < |a|
; [eval] 0 <= i
(push) ; 5
; [then-branch: 50 | !(0 <= i@129@01) | live]
; [else-branch: 50 | 0 <= i@129@01 | live]
(push) ; 6
; [then-branch: 50 | !(0 <= i@129@01)]
(assert (not (<= 0 i@129@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 50 | 0 <= i@129@01]
(assert (<= 0 i@129@01))
; [eval] i < |a|
; [eval] |a|
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@129@01) (not (<= 0 i@129@01))))
(assert (and (<= 0 i@129@01) (< i@129@01 (Seq_length a@104@01))))
; [eval] a[i]
(push) ; 5
(assert (not (>= i@129@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-const $t@130@01 $FVF<Ref__Integer_value>)
(declare-fun inv@131@01 ($Ref) Int)
(declare-fun img@132@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@129@01 Int)) (!
  (=>
    (and (<= 0 i@129@01) (< i@129@01 (Seq_length a@104@01)))
    (or (<= 0 i@129@01) (not (<= 0 i@129@01))))
  :pattern ((Seq_index a@104@01 i@129@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@129@01 Int) (i2@129@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@129@01) (< i1@129@01 (Seq_length a@104@01)))
      (and (<= 0 i2@129@01) (< i2@129@01 (Seq_length a@104@01)))
      (= (Seq_index a@104@01 i1@129@01) (Seq_index a@104@01 i2@129@01)))
    (= i1@129@01 i2@129@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@129@01 Int)) (!
  (=>
    (and (<= 0 i@129@01) (< i@129@01 (Seq_length a@104@01)))
    (and
      (= (inv@131@01 (Seq_index a@104@01 i@129@01)) i@129@01)
      (img@132@01 (Seq_index a@104@01 i@129@01))))
  :pattern ((Seq_index a@104@01 i@129@01))
  :qid |quant-u-78|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@132@01 r)
      (and (<= 0 (inv@131@01 r)) (< (inv@131@01 r) (Seq_length a@104@01))))
    (= (Seq_index a@104@01 (inv@131@01 r)) r))
  :pattern ((inv@131@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@129@01 Int)) (!
  (=>
    (and (<= 0 i@129@01) (< i@129@01 (Seq_length a@104@01)))
    (not (= (Seq_index a@104@01 i@129@01) $Ref.null)))
  :pattern ((Seq_index a@104@01 i@129@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(declare-const i@133@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] 0 <= i && i < |a|
; [eval] 0 <= i
(push) ; 5
; [then-branch: 51 | !(0 <= i@133@01) | live]
; [else-branch: 51 | 0 <= i@133@01 | live]
(push) ; 6
; [then-branch: 51 | !(0 <= i@133@01)]
(assert (not (<= 0 i@133@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 51 | 0 <= i@133@01]
(assert (<= 0 i@133@01))
; [eval] i < |a|
; [eval] |a|
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@133@01) (not (<= 0 i@133@01))))
(assert (and (<= 0 i@133@01) (< i@133@01 (Seq_length a@104@01))))
; [eval] a[i]
(push) ; 5
(assert (not (>= i@133@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@134@01 ($Ref) Int)
(declare-fun img@135@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@133@01 Int)) (!
  (=>
    (and (<= 0 i@133@01) (< i@133@01 (Seq_length a@104@01)))
    (or (<= 0 i@133@01) (not (<= 0 i@133@01))))
  :pattern ((Seq_index a@104@01 i@133@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@133@01 Int) (i2@133@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@133@01) (< i1@133@01 (Seq_length a@104@01)))
      (and (<= 0 i2@133@01) (< i2@133@01 (Seq_length a@104@01)))
      (= (Seq_index a@104@01 i1@133@01) (Seq_index a@104@01 i2@133@01)))
    (= i1@133@01 i2@133@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@133@01 Int)) (!
  (=>
    (and (<= 0 i@133@01) (< i@133@01 (Seq_length a@104@01)))
    (and
      (= (inv@134@01 (Seq_index a@104@01 i@133@01)) i@133@01)
      (img@135@01 (Seq_index a@104@01 i@133@01))))
  :pattern ((Seq_index a@104@01 i@133@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@135@01 r)
      (and (<= 0 (inv@134@01 r)) (< (inv@134@01 r) (Seq_length a@104@01))))
    (= (Seq_index a@104@01 (inv@134@01 r)) r))
  :pattern ((inv@134@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@136@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@134@01 r)) (< (inv@134@01 r) (Seq_length a@104@01)))
      (img@135@01 r)
      (= r (Seq_index a@104@01 (inv@134@01 r))))
    ($Perm.min
      (ite
        (and
          (img@132@01 r)
          (and (<= 0 (inv@131@01 r)) (< (inv@131@01 r) (Seq_length a@104@01))))
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
          (img@132@01 r)
          (and (<= 0 (inv@131@01 r)) (< (inv@131@01 r) (Seq_length a@104@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@136@01 r))
    $Perm.No)
  
  :qid |quant-u-81|))))
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
      (and (<= 0 (inv@134@01 r)) (< (inv@134@01 r) (Seq_length a@104@01)))
      (img@135@01 r)
      (= r (Seq_index a@104@01 (inv@134@01 r))))
    (= (- $Perm.Write (pTaken@136@01 r)) $Perm.No))
  
  :qid |quant-u-82|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@137@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@132@01 r)
      (and (<= 0 (inv@131@01 r)) (< (inv@131@01 r) (Seq_length a@104@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@137@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value $t@130@01 r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@137@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value $t@130@01 r))
  :qid |qp.fvfValDef3|)))
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
; [else-branch: 47 | !(0 < |a@104@01|)]
(assert (not (< 0 (Seq_length a@104@01))))
(declare-const i@138@01 Int)
(push) ; 4
; [eval] 1 <= i && i < (|a| - 1 < |a| ? |a| - 1 : |a|) + 1
; [eval] 1 <= i
(push) ; 5
; [then-branch: 52 | !(1 <= i@138@01) | live]
; [else-branch: 52 | 1 <= i@138@01 | live]
(push) ; 6
; [then-branch: 52 | !(1 <= i@138@01)]
(assert (not (<= 1 i@138@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 52 | 1 <= i@138@01]
(assert (<= 1 i@138@01))
; [eval] i < (|a| - 1 < |a| ? |a| - 1 : |a|) + 1
; [eval] (|a| - 1 < |a| ? |a| - 1 : |a|) + 1
; [eval] (|a| - 1 < |a| ? |a| - 1 : |a|)
; [eval] |a| - 1 < |a|
; [eval] |a| - 1
; [eval] |a|
; [eval] |a|
(push) ; 7
(push) ; 8
(set-option :timeout 10)
(assert (not (not (< (- (Seq_length a@104@01) 1) (Seq_length a@104@01)))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (< (- (Seq_length a@104@01) 1) (Seq_length a@104@01))))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 53 | |a@104@01| - 1 < |a@104@01| | live]
; [else-branch: 53 | !(|a@104@01| - 1 < |a@104@01|) | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 53 | |a@104@01| - 1 < |a@104@01|]
(assert (< (- (Seq_length a@104@01) 1) (Seq_length a@104@01)))
; [eval] |a| - 1
; [eval] |a|
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (< (- (Seq_length a@104@01) 1) (Seq_length a@104@01)))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (<= 1 i@138@01)
  (and (<= 1 i@138@01) (< (- (Seq_length a@104@01) 1) (Seq_length a@104@01)))))
(assert (or (<= 1 i@138@01) (not (<= 1 i@138@01))))
(assert (and (<= 1 i@138@01) (< i@138@01 (+ (- (Seq_length a@104@01) 1) 1))))
; [eval] a[i]
(push) ; 5
(assert (not (>= i@138@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@138@01 (Seq_length a@104@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@139@01 ($Ref) Int)
(declare-fun img@140@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@138@01 Int)) (!
  (=>
    (and (<= 1 i@138@01) (< i@138@01 (+ (- (Seq_length a@104@01) 1) 1)))
    (and
      (=>
        (<= 1 i@138@01)
        (and
          (<= 1 i@138@01)
          (< (- (Seq_length a@104@01) 1) (Seq_length a@104@01))))
      (or (<= 1 i@138@01) (not (<= 1 i@138@01)))))
  :pattern ((Seq_index a@104@01 i@138@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@138@01 Int) (i2@138@01 Int)) (!
  (=>
    (and
      (and (<= 1 i1@138@01) (< i1@138@01 (+ (- (Seq_length a@104@01) 1) 1)))
      (and (<= 1 i2@138@01) (< i2@138@01 (+ (- (Seq_length a@104@01) 1) 1)))
      (= (Seq_index a@104@01 i1@138@01) (Seq_index a@104@01 i2@138@01)))
    (= i1@138@01 i2@138@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@138@01 Int)) (!
  (=>
    (and (<= 1 i@138@01) (< i@138@01 (+ (- (Seq_length a@104@01) 1) 1)))
    (and
      (= (inv@139@01 (Seq_index a@104@01 i@138@01)) i@138@01)
      (img@140@01 (Seq_index a@104@01 i@138@01))))
  :pattern ((Seq_index a@104@01 i@138@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@140@01 r)
      (and
        (<= 1 (inv@139@01 r))
        (< (inv@139@01 r) (+ (- (Seq_length a@104@01) 1) 1))))
    (= (Seq_index a@104@01 (inv@139@01 r)) r))
  :pattern ((inv@139@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@141@01 ((r $Ref)) $Perm
  (ite
    (and
      (and
        (<= 1 (inv@139@01 r))
        (< (inv@139@01 r) (+ (- (Seq_length a@104@01) 1) 1)))
      (img@140@01 r)
      (= r (Seq_index a@104@01 (inv@139@01 r))))
    ($Perm.min
      (ite
        (and
          (img@110@01 r)
          (and (<= 0 (inv@109@01 r)) (< (inv@109@01 r) (Seq_length a@104@01))))
        (- $Perm.Write (pTaken@120@01 r))
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
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
          (img@110@01 r)
          (and (<= 0 (inv@109@01 r)) (< (inv@109@01 r) (Seq_length a@104@01))))
        (- $Perm.Write (pTaken@120@01 r))
        $Perm.No)
      (pTaken@141@01 r))
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
      (and
        (<= 1 (inv@139@01 r))
        (< (inv@139@01 r) (+ (- (Seq_length a@104@01) 1) 1)))
      (img@140@01 r)
      (= r (Seq_index a@104@01 (inv@139@01 r))))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@141@01 r)) $Perm.No))
  
  :qid |quant-u-86|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@142@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@110@01 r)
        (and (<= 0 (inv@109@01 r)) (< (inv@109@01 r) (Seq_length a@104@01))))
      (< $Perm.No (- $Perm.Write (pTaken@120@01 r)))
      false)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@142@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second $t@105@01)))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@142@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second $t@105@01)))) r))
  :qid |qp.fvfValDef4|)))
(declare-const i@143@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] 0 <= i && i < |a|
; [eval] 0 <= i
(push) ; 5
; [then-branch: 54 | !(0 <= i@143@01) | live]
; [else-branch: 54 | 0 <= i@143@01 | live]
(push) ; 6
; [then-branch: 54 | !(0 <= i@143@01)]
(assert (not (<= 0 i@143@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 54 | 0 <= i@143@01]
(assert (<= 0 i@143@01))
; [eval] i < |a|
; [eval] |a|
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@143@01) (not (<= 0 i@143@01))))
(assert (and (<= 0 i@143@01) (< i@143@01 (Seq_length a@104@01))))
; [eval] a[i]
(push) ; 5
(assert (not (>= i@143@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-const $t@144@01 $FVF<Ref__Integer_value>)
(declare-fun inv@145@01 ($Ref) Int)
(declare-fun img@146@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@143@01 Int)) (!
  (=>
    (and (<= 0 i@143@01) (< i@143@01 (Seq_length a@104@01)))
    (or (<= 0 i@143@01) (not (<= 0 i@143@01))))
  :pattern ((Seq_index a@104@01 i@143@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@143@01 Int) (i2@143@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@143@01) (< i1@143@01 (Seq_length a@104@01)))
      (and (<= 0 i2@143@01) (< i2@143@01 (Seq_length a@104@01)))
      (= (Seq_index a@104@01 i1@143@01) (Seq_index a@104@01 i2@143@01)))
    (= i1@143@01 i2@143@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@143@01 Int)) (!
  (=>
    (and (<= 0 i@143@01) (< i@143@01 (Seq_length a@104@01)))
    (and
      (= (inv@145@01 (Seq_index a@104@01 i@143@01)) i@143@01)
      (img@146@01 (Seq_index a@104@01 i@143@01))))
  :pattern ((Seq_index a@104@01 i@143@01))
  :qid |quant-u-88|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@146@01 r)
      (and (<= 0 (inv@145@01 r)) (< (inv@145@01 r) (Seq_length a@104@01))))
    (= (Seq_index a@104@01 (inv@145@01 r)) r))
  :pattern ((inv@145@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@143@01 Int)) (!
  (=>
    (and (<= 0 i@143@01) (< i@143@01 (Seq_length a@104@01)))
    (not (= (Seq_index a@104@01 i@143@01) $Ref.null)))
  :pattern ((Seq_index a@104@01 i@143@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(declare-const i@147@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] 0 <= i && i < |a|
; [eval] 0 <= i
(push) ; 5
; [then-branch: 55 | !(0 <= i@147@01) | live]
; [else-branch: 55 | 0 <= i@147@01 | live]
(push) ; 6
; [then-branch: 55 | !(0 <= i@147@01)]
(assert (not (<= 0 i@147@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 55 | 0 <= i@147@01]
(assert (<= 0 i@147@01))
; [eval] i < |a|
; [eval] |a|
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@147@01) (not (<= 0 i@147@01))))
(assert (and (<= 0 i@147@01) (< i@147@01 (Seq_length a@104@01))))
; [eval] a[i]
(push) ; 5
(assert (not (>= i@147@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@148@01 ($Ref) Int)
(declare-fun img@149@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@147@01 Int)) (!
  (=>
    (and (<= 0 i@147@01) (< i@147@01 (Seq_length a@104@01)))
    (or (<= 0 i@147@01) (not (<= 0 i@147@01))))
  :pattern ((Seq_index a@104@01 i@147@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@147@01 Int) (i2@147@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@147@01) (< i1@147@01 (Seq_length a@104@01)))
      (and (<= 0 i2@147@01) (< i2@147@01 (Seq_length a@104@01)))
      (= (Seq_index a@104@01 i1@147@01) (Seq_index a@104@01 i2@147@01)))
    (= i1@147@01 i2@147@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@147@01 Int)) (!
  (=>
    (and (<= 0 i@147@01) (< i@147@01 (Seq_length a@104@01)))
    (and
      (= (inv@148@01 (Seq_index a@104@01 i@147@01)) i@147@01)
      (img@149@01 (Seq_index a@104@01 i@147@01))))
  :pattern ((Seq_index a@104@01 i@147@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@149@01 r)
      (and (<= 0 (inv@148@01 r)) (< (inv@148@01 r) (Seq_length a@104@01))))
    (= (Seq_index a@104@01 (inv@148@01 r)) r))
  :pattern ((inv@148@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@150@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@148@01 r)) (< (inv@148@01 r) (Seq_length a@104@01)))
      (img@149@01 r)
      (= r (Seq_index a@104@01 (inv@148@01 r))))
    ($Perm.min
      (ite
        (and
          (img@146@01 r)
          (and (<= 0 (inv@145@01 r)) (< (inv@145@01 r) (Seq_length a@104@01))))
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
          (img@146@01 r)
          (and (<= 0 (inv@145@01 r)) (< (inv@145@01 r) (Seq_length a@104@01))))
        $Perm.Write
        $Perm.No)
      (pTaken@150@01 r))
    $Perm.No)
  
  :qid |quant-u-91|))))
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
      (and (<= 0 (inv@148@01 r)) (< (inv@148@01 r) (Seq_length a@104@01)))
      (img@149@01 r)
      (= r (Seq_index a@104@01 (inv@148@01 r))))
    (= (- $Perm.Write (pTaken@150@01 r)) $Perm.No))
  
  :qid |quant-u-92|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@151@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@146@01 r)
      (and (<= 0 (inv@145@01 r)) (< (inv@145@01 r) (Seq_length a@104@01))))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@151@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value $t@144@01 r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@151@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value $t@144@01 r))
  :qid |qp.fvfValDef5|)))
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- Ref__Ref ----------
(declare-const current_thread_id@152@01 Int)
(declare-const sys__result@153@01 $Ref)
(declare-const current_thread_id@154@01 Int)
(declare-const sys__result@155@01 $Ref)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@156@01 $Snap)
(assert (= $t@156@01 $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@154@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@157@01 $Snap)
(assert (= $t@157@01 $Snap.unit))
; [eval] sys__result != null
(assert (not (= sys__result@155@01 $Ref.null)))
(pop) ; 2
(push) ; 2
; [exec]
; var diz: Ref
(declare-const diz@158@01 $Ref)
; [exec]
; diz := new(Ref__Integer_value)
(declare-const diz@159@01 $Ref)
(assert (not (= diz@159@01 $Ref.null)))
(declare-const Ref__Integer_value@160@01 Int)
(assert (not (= diz@159@01 diz@158@01)))
(assert (not (= diz@159@01 sys__result@155@01)))
; [exec]
; sys__result := diz
; [exec]
; assert sys__result != null
; [eval] sys__result != null
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
