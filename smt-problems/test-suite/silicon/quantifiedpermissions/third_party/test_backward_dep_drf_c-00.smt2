(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:23:04
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_backward_dep_drf_c.vpr
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
(declare-fun sum_list ($Snap Int Int Seq<Int>) Int)
(declare-fun sum_list%limited ($Snap Int Int Seq<Int>) Int)
(declare-fun sum_list%stateless (Int Int Seq<Int>) Bool)
(declare-fun sum_list%precondition ($Snap Int Int Seq<Int>) Bool)
(declare-fun count_array ($Snap Int Int Seq<$Ref> Int) Int)
(declare-fun count_array%limited ($Snap Int Int Seq<$Ref> Int) Int)
(declare-fun count_array%stateless (Int Int Seq<$Ref> Int) Bool)
(declare-fun count_array%precondition ($Snap Int Int Seq<$Ref> Int) Bool)
(declare-fun sum_square ($Snap Int Int Int Int Int Int Seq<$Ref>) Int)
(declare-fun sum_square%limited ($Snap Int Int Int Int Int Int Seq<$Ref>) Int)
(declare-fun sum_square%stateless (Int Int Int Int Int Int Seq<$Ref>) Bool)
(declare-fun sum_square%precondition ($Snap Int Int Int Int Int Int Seq<$Ref>) Bool)
(declare-fun count_square ($Snap Int Int Int Int Int Int Seq<$Ref> Int) Int)
(declare-fun count_square%limited ($Snap Int Int Int Int Int Int Seq<$Ref> Int) Int)
(declare-fun count_square%stateless (Int Int Int Int Int Int Seq<$Ref> Int) Bool)
(declare-fun count_square%precondition ($Snap Int Int Int Int Int Int Seq<$Ref> Int) Bool)
(declare-fun sum_array ($Snap Int Int Int Seq<$Ref>) Int)
(declare-fun sum_array%limited ($Snap Int Int Int Seq<$Ref>) Int)
(declare-fun sum_array%stateless (Int Int Int Seq<$Ref>) Bool)
(declare-fun sum_array%precondition ($Snap Int Int Int Seq<$Ref>) Bool)
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
(declare-fun inv@40@00 ($Snap Int Int Seq<$Ref> Int $Ref) Int)
(declare-fun img@41@00 ($Snap Int Int Seq<$Ref> Int $Ref) Bool)
(declare-fun $k@45@00 () $Perm)
(declare-fun inv@46@00 ($Snap Int Int Seq<$Ref> Int $Ref) Int)
(declare-fun img@47@00 ($Snap Int Int Seq<$Ref> Int $Ref) Bool)
(declare-fun sm@48@00 ($Snap Int Int Seq<$Ref> Int) $FVF<Ref__Integer_value>)
(declare-fun $k@52@00 () $Perm)
(declare-fun inv@53@00 ($Snap Int Int Int Int Int Int Seq<$Ref> $Ref) Int)
(declare-fun img@54@00 ($Snap Int Int Int Int Int Int Seq<$Ref> $Ref) Bool)
(declare-fun $k@58@00 () $Perm)
(declare-fun inv@59@00 ($Snap Int Int Int Int Int Int Seq<$Ref> $Ref) Int)
(declare-fun img@60@00 ($Snap Int Int Int Int Int Int Seq<$Ref> $Ref) Bool)
(declare-fun sm@61@00 ($Snap Int Int Int Int Int Int Seq<$Ref>) $FVF<Ref__Integer_value>)
(declare-fun $k@65@00 () $Perm)
(declare-fun inv@66@00 ($Snap Int Int Int Int Int Int Seq<$Ref> Int $Ref) Int)
(declare-fun img@67@00 ($Snap Int Int Int Int Int Int Seq<$Ref> Int $Ref) Bool)
(declare-fun $k@71@00 () $Perm)
(declare-fun inv@72@00 ($Snap Int Int Int Int Int Int Seq<$Ref> Int $Ref) Int)
(declare-fun img@73@00 ($Snap Int Int Int Int Int Int Seq<$Ref> Int $Ref) Bool)
(declare-fun sm@74@00 ($Snap Int Int Int Int Int Int Seq<$Ref> Int) $FVF<Ref__Integer_value>)
(declare-fun $k@78@00 () $Perm)
(declare-fun inv@79@00 ($Snap Int Int Int Seq<$Ref> $Ref) Int)
(declare-fun img@80@00 ($Snap Int Int Int Seq<$Ref> $Ref) Bool)
(declare-fun $k@84@00 () $Perm)
(declare-fun inv@85@00 ($Snap Int Int Int Seq<$Ref> $Ref) Int)
(declare-fun img@86@00 ($Snap Int Int Int Seq<$Ref> $Ref) Bool)
(declare-fun sm@87@00 ($Snap Int Int Int Seq<$Ref>) $FVF<Ref__Integer_value>)
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
(assert (forall ((s@$ $Snap) (i@5@00 Int) (hi@6@00 Int) (ar@7@00 Seq<Int>)) (!
  (=
    (sum_list%limited s@$ i@5@00 hi@6@00 ar@7@00)
    (sum_list s@$ i@5@00 hi@6@00 ar@7@00))
  :pattern ((sum_list s@$ i@5@00 hi@6@00 ar@7@00))
  :qid |quant-u-2|)))
(assert (forall ((s@$ $Snap) (i@5@00 Int) (hi@6@00 Int) (ar@7@00 Seq<Int>)) (!
  (sum_list%stateless i@5@00 hi@6@00 ar@7@00)
  :pattern ((sum_list%limited s@$ i@5@00 hi@6@00 ar@7@00))
  :qid |quant-u-3|)))
(assert (forall ((s@$ $Snap) (i@5@00 Int) (hi@6@00 Int) (ar@7@00 Seq<Int>)) (!
  (=>
    (sum_list%precondition s@$ i@5@00 hi@6@00 ar@7@00)
    (=
      (sum_list s@$ i@5@00 hi@6@00 ar@7@00)
      (ite
        (< i@5@00 hi@6@00)
        (+
          (Seq_index ar@7@00 i@5@00)
          (sum_list%limited ($Snap.combine
            $Snap.unit
            ($Snap.combine $Snap.unit $Snap.unit)) (+ i@5@00 1) hi@6@00 ar@7@00))
        0)))
  :pattern ((sum_list s@$ i@5@00 hi@6@00 ar@7@00))
  :qid |quant-u-14|)))
(assert (forall ((s@$ $Snap) (i@5@00 Int) (hi@6@00 Int) (ar@7@00 Seq<Int>)) (!
  (=>
    (sum_list%precondition s@$ i@5@00 hi@6@00 ar@7@00)
    (ite
      (< i@5@00 hi@6@00)
      (sum_list%precondition ($Snap.combine
        $Snap.unit
        ($Snap.combine $Snap.unit $Snap.unit)) (+ i@5@00 1) hi@6@00 ar@7@00)
      true))
  :pattern ((sum_list s@$ i@5@00 hi@6@00 ar@7@00))
  :qid |quant-u-15|)))
(assert (forall ((s@$ $Snap) (i@9@00 Int) (hi@10@00 Int) (ar@11@00 Seq<$Ref>) (v@12@00 Int)) (!
  (=
    (count_array%limited s@$ i@9@00 hi@10@00 ar@11@00 v@12@00)
    (count_array s@$ i@9@00 hi@10@00 ar@11@00 v@12@00))
  :pattern ((count_array s@$ i@9@00 hi@10@00 ar@11@00 v@12@00))
  :qid |quant-u-4|)))
(assert (forall ((s@$ $Snap) (i@9@00 Int) (hi@10@00 Int) (ar@11@00 Seq<$Ref>) (v@12@00 Int)) (!
  (count_array%stateless i@9@00 hi@10@00 ar@11@00 v@12@00)
  :pattern ((count_array%limited s@$ i@9@00 hi@10@00 ar@11@00 v@12@00))
  :qid |quant-u-5|)))
(assert (forall ((s@$ $Snap) (i@9@00 Int) (hi@10@00 Int) (ar@11@00 Seq<$Ref>) (v@12@00 Int)) (!
  (and
    (forall ((k@38@00 Int)) (!
      (=>
        (and (and (<= 0 k@38@00) (< k@38@00 hi@10@00)) (< $Perm.No $k@39@00))
        (and
          (=
            (inv@40@00 s@$ i@9@00 hi@10@00 ar@11@00 v@12@00 (Seq_index
              ar@11@00
              k@38@00))
            k@38@00)
          (img@41@00 s@$ i@9@00 hi@10@00 ar@11@00 v@12@00 (Seq_index
            ar@11@00
            k@38@00))))
      :pattern ((Seq_index ar@11@00 k@38@00))
      :qid |quant-u-17|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@41@00 s@$ i@9@00 hi@10@00 ar@11@00 v@12@00 r)
          (and
            (and
              (<= 0 (inv@40@00 s@$ i@9@00 hi@10@00 ar@11@00 v@12@00 r))
              (< (inv@40@00 s@$ i@9@00 hi@10@00 ar@11@00 v@12@00 r) hi@10@00))
            (< $Perm.No $k@39@00)))
        (=
          (Seq_index ar@11@00 (inv@40@00 s@$ i@9@00 hi@10@00 ar@11@00 v@12@00 r))
          r))
      :pattern ((inv@40@00 s@$ i@9@00 hi@10@00 ar@11@00 v@12@00 r))
      :qid |Ref__Integer_value-fctOfInv|))
    (forall ((k@44@00 Int)) (!
      (=>
        (and (and (<= 0 k@44@00) (< k@44@00 hi@10@00)) (< $Perm.No $k@45@00))
        (and
          (=
            (inv@46@00 s@$ i@9@00 hi@10@00 ar@11@00 v@12@00 (Seq_index
              ar@11@00
              k@44@00))
            k@44@00)
          (img@47@00 s@$ i@9@00 hi@10@00 ar@11@00 v@12@00 (Seq_index
            ar@11@00
            k@44@00))))
      :pattern ((Seq_index ar@11@00 k@44@00))
      :qid |Ref__Integer_value-invOfFct|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@47@00 s@$ i@9@00 hi@10@00 ar@11@00 v@12@00 r)
          (and
            (and
              (<= 0 (inv@46@00 s@$ i@9@00 hi@10@00 ar@11@00 v@12@00 r))
              (< (inv@46@00 s@$ i@9@00 hi@10@00 ar@11@00 v@12@00 r) hi@10@00))
            (< $Perm.No $k@45@00)))
        (=
          (Seq_index ar@11@00 (inv@46@00 s@$ i@9@00 hi@10@00 ar@11@00 v@12@00 r))
          r))
      :pattern ((inv@46@00 s@$ i@9@00 hi@10@00 ar@11@00 v@12@00 r))
      :qid |Ref__Integer_value-fctOfInv|))
    (forall ((r $Ref)) (!
      (and
        (=>
          (Set_in r ($FVF.domain_Ref__Integer_value (sm@48@00 s@$ i@9@00 hi@10@00 ar@11@00 v@12@00)))
          (and
            (and
              (<= 0 (inv@46@00 s@$ i@9@00 hi@10@00 ar@11@00 v@12@00 r))
              (< (inv@46@00 s@$ i@9@00 hi@10@00 ar@11@00 v@12@00 r) hi@10@00))
            (< $Perm.No $k@45@00)
            (img@47@00 s@$ i@9@00 hi@10@00 ar@11@00 v@12@00 r)))
        (=>
          (and
            (and
              (<= 0 (inv@46@00 s@$ i@9@00 hi@10@00 ar@11@00 v@12@00 r))
              (< (inv@46@00 s@$ i@9@00 hi@10@00 ar@11@00 v@12@00 r) hi@10@00))
            (< $Perm.No $k@45@00)
            (img@47@00 s@$ i@9@00 hi@10@00 ar@11@00 v@12@00 r))
          (Set_in r ($FVF.domain_Ref__Integer_value (sm@48@00 s@$ i@9@00 hi@10@00 ar@11@00 v@12@00)))))
      :pattern ((Set_in r ($FVF.domain_Ref__Integer_value (sm@48@00 s@$ i@9@00 hi@10@00 ar@11@00 v@12@00))))
      :qid |qp.fvfDomDef2|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (and
              (<= 0 (inv@46@00 s@$ i@9@00 hi@10@00 ar@11@00 v@12@00 r))
              (< (inv@46@00 s@$ i@9@00 hi@10@00 ar@11@00 v@12@00 r) hi@10@00))
            (< $Perm.No $k@45@00)
            (img@47@00 s@$ i@9@00 hi@10@00 ar@11@00 v@12@00 r))
          (ite
            (and
              (img@41@00 s@$ i@9@00 hi@10@00 ar@11@00 v@12@00 r)
              (and
                (<= 0 (inv@40@00 s@$ i@9@00 hi@10@00 ar@11@00 v@12@00 r))
                (< (inv@40@00 s@$ i@9@00 hi@10@00 ar@11@00 v@12@00 r) hi@10@00)))
            (< $Perm.No $k@39@00)
            false))
        (=
          ($FVF.lookup_Ref__Integer_value (sm@48@00 s@$ i@9@00 hi@10@00 ar@11@00 v@12@00) r)
          ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))) r)))
      :pattern (($FVF.lookup_Ref__Integer_value (sm@48@00 s@$ i@9@00 hi@10@00 ar@11@00 v@12@00) r))
      :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))) r))
      :qid |qp.fvfValDef1|))
    ($Perm.isReadVar $k@39@00)
    ($Perm.isReadVar $k@45@00)
    (=>
      (count_array%precondition s@$ i@9@00 hi@10@00 ar@11@00 v@12@00)
      (=
        (count_array s@$ i@9@00 hi@10@00 ar@11@00 v@12@00)
        (ite
          (< i@9@00 hi@10@00)
          (+
            (ite
              (=
                ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$))))) (Seq_index
                  ar@11@00
                  i@9@00))
                v@12@00)
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
                    ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (sm@48@00 s@$ i@9@00 hi@10@00 ar@11@00 v@12@00)))))) (+
              i@9@00
              1) hi@10@00 ar@11@00 v@12@00))
          0))))
  :pattern ((count_array s@$ i@9@00 hi@10@00 ar@11@00 v@12@00))
  :qid |quant-u-22|)))
(assert (forall ((s@$ $Snap) (i@9@00 Int) (hi@10@00 Int) (ar@11@00 Seq<$Ref>) (v@12@00 Int)) (!
  (=>
    (count_array%precondition s@$ i@9@00 hi@10@00 ar@11@00 v@12@00)
    (ite
      (< i@9@00 hi@10@00)
      (count_array%precondition ($Snap.combine
        $Snap.unit
        ($Snap.combine
          $Snap.unit
          ($Snap.combine
            $Snap.unit
            ($Snap.combine
              $Snap.unit
              ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (sm@48@00 s@$ i@9@00 hi@10@00 ar@11@00 v@12@00)))))) (+
        i@9@00
        1) hi@10@00 ar@11@00 v@12@00)
      true))
  :pattern ((count_array s@$ i@9@00 hi@10@00 ar@11@00 v@12@00))
  :qid |quant-u-23|)))
(assert (forall ((s@$ $Snap) (i@14@00 Int) (lo@15@00 Int) (hi@16@00 Int) (step@17@00 Int) (min@18@00 Int) (max@19@00 Int) (ar@20@00 Seq<$Ref>)) (!
  (=
    (sum_square%limited s@$ i@14@00 lo@15@00 hi@16@00 step@17@00 min@18@00 max@19@00 ar@20@00)
    (sum_square s@$ i@14@00 lo@15@00 hi@16@00 step@17@00 min@18@00 max@19@00 ar@20@00))
  :pattern ((sum_square s@$ i@14@00 lo@15@00 hi@16@00 step@17@00 min@18@00 max@19@00 ar@20@00))
  :qid |quant-u-6|)))
(assert (forall ((s@$ $Snap) (i@14@00 Int) (lo@15@00 Int) (hi@16@00 Int) (step@17@00 Int) (min@18@00 Int) (max@19@00 Int) (ar@20@00 Seq<$Ref>)) (!
  (sum_square%stateless i@14@00 lo@15@00 hi@16@00 step@17@00 min@18@00 max@19@00 ar@20@00)
  :pattern ((sum_square%limited s@$ i@14@00 lo@15@00 hi@16@00 step@17@00 min@18@00 max@19@00 ar@20@00))
  :qid |quant-u-7|)))
(assert (forall ((s@$ $Snap) (i@14@00 Int) (lo@15@00 Int) (hi@16@00 Int) (step@17@00 Int) (min@18@00 Int) (max@19@00 Int) (ar@20@00 Seq<$Ref>)) (!
  (and
    (forall ((k@51@00 Int)) (!
      (=>
        (and
          (and
            (<= min@18@00 k@51@00)
            (and
              (< k@51@00 max@19@00)
              (and
                (<= lo@15@00 (mod k@51@00 step@17@00))
                (< (mod k@51@00 step@17@00) hi@16@00))))
          (< $Perm.No $k@52@00))
        (and
          (=
            (inv@53@00 s@$ i@14@00 lo@15@00 hi@16@00 step@17@00 min@18@00 max@19@00 ar@20@00 (Seq_index
              ar@20@00
              k@51@00))
            k@51@00)
          (img@54@00 s@$ i@14@00 lo@15@00 hi@16@00 step@17@00 min@18@00 max@19@00 ar@20@00 (Seq_index
            ar@20@00
            k@51@00))))
      :pattern ((Seq_index ar@20@00 k@51@00))
      :qid |quant-u-25|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@54@00 s@$ i@14@00 lo@15@00 hi@16@00 step@17@00 min@18@00 max@19@00 ar@20@00 r)
          (and
            (and
              (<=
                min@18@00
                (inv@53@00 s@$ i@14@00 lo@15@00 hi@16@00 step@17@00 min@18@00 max@19@00 ar@20@00 r))
              (and
                (<
                  (inv@53@00 s@$ i@14@00 lo@15@00 hi@16@00 step@17@00 min@18@00 max@19@00 ar@20@00 r)
                  max@19@00)
                (and
                  (<=
                    lo@15@00
                    (mod
                      (inv@53@00 s@$ i@14@00 lo@15@00 hi@16@00 step@17@00 min@18@00 max@19@00 ar@20@00 r)
                      step@17@00))
                  (<
                    (mod
                      (inv@53@00 s@$ i@14@00 lo@15@00 hi@16@00 step@17@00 min@18@00 max@19@00 ar@20@00 r)
                      step@17@00)
                    hi@16@00))))
            (< $Perm.No $k@52@00)))
        (=
          (Seq_index
            ar@20@00
            (inv@53@00 s@$ i@14@00 lo@15@00 hi@16@00 step@17@00 min@18@00 max@19@00 ar@20@00 r))
          r))
      :pattern ((inv@53@00 s@$ i@14@00 lo@15@00 hi@16@00 step@17@00 min@18@00 max@19@00 ar@20@00 r))
      :qid |Ref__Integer_value-fctOfInv|))
    (forall ((k@57@00 Int)) (!
      (=>
        (and
          (and
            (<= min@18@00 k@57@00)
            (and
              (< k@57@00 max@19@00)
              (and
                (<= lo@15@00 (mod k@57@00 step@17@00))
                (< (mod k@57@00 step@17@00) hi@16@00))))
          (< $Perm.No $k@58@00))
        (and
          (=
            (inv@59@00 s@$ i@14@00 lo@15@00 hi@16@00 step@17@00 min@18@00 max@19@00 ar@20@00 (Seq_index
              ar@20@00
              k@57@00))
            k@57@00)
          (img@60@00 s@$ i@14@00 lo@15@00 hi@16@00 step@17@00 min@18@00 max@19@00 ar@20@00 (Seq_index
            ar@20@00
            k@57@00))))
      :pattern ((Seq_index ar@20@00 k@57@00))
      :qid |Ref__Integer_value-invOfFct|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@60@00 s@$ i@14@00 lo@15@00 hi@16@00 step@17@00 min@18@00 max@19@00 ar@20@00 r)
          (and
            (and
              (<=
                min@18@00
                (inv@59@00 s@$ i@14@00 lo@15@00 hi@16@00 step@17@00 min@18@00 max@19@00 ar@20@00 r))
              (and
                (<
                  (inv@59@00 s@$ i@14@00 lo@15@00 hi@16@00 step@17@00 min@18@00 max@19@00 ar@20@00 r)
                  max@19@00)
                (and
                  (<=
                    lo@15@00
                    (mod
                      (inv@59@00 s@$ i@14@00 lo@15@00 hi@16@00 step@17@00 min@18@00 max@19@00 ar@20@00 r)
                      step@17@00))
                  (<
                    (mod
                      (inv@59@00 s@$ i@14@00 lo@15@00 hi@16@00 step@17@00 min@18@00 max@19@00 ar@20@00 r)
                      step@17@00)
                    hi@16@00))))
            (< $Perm.No $k@58@00)))
        (=
          (Seq_index
            ar@20@00
            (inv@59@00 s@$ i@14@00 lo@15@00 hi@16@00 step@17@00 min@18@00 max@19@00 ar@20@00 r))
          r))
      :pattern ((inv@59@00 s@$ i@14@00 lo@15@00 hi@16@00 step@17@00 min@18@00 max@19@00 ar@20@00 r))
      :qid |Ref__Integer_value-fctOfInv|))
    (forall ((r $Ref)) (!
      (and
        (=>
          (Set_in r ($FVF.domain_Ref__Integer_value (sm@61@00 s@$ i@14@00 lo@15@00 hi@16@00 step@17@00 min@18@00 max@19@00 ar@20@00)))
          (and
            (and
              (<=
                min@18@00
                (inv@59@00 s@$ i@14@00 lo@15@00 hi@16@00 step@17@00 min@18@00 max@19@00 ar@20@00 r))
              (and
                (<
                  (inv@59@00 s@$ i@14@00 lo@15@00 hi@16@00 step@17@00 min@18@00 max@19@00 ar@20@00 r)
                  max@19@00)
                (and
                  (<=
                    lo@15@00
                    (mod
                      (inv@59@00 s@$ i@14@00 lo@15@00 hi@16@00 step@17@00 min@18@00 max@19@00 ar@20@00 r)
                      step@17@00))
                  (<
                    (mod
                      (inv@59@00 s@$ i@14@00 lo@15@00 hi@16@00 step@17@00 min@18@00 max@19@00 ar@20@00 r)
                      step@17@00)
                    hi@16@00))))
            (< $Perm.No $k@58@00)
            (img@60@00 s@$ i@14@00 lo@15@00 hi@16@00 step@17@00 min@18@00 max@19@00 ar@20@00 r)))
        (=>
          (and
            (and
              (<=
                min@18@00
                (inv@59@00 s@$ i@14@00 lo@15@00 hi@16@00 step@17@00 min@18@00 max@19@00 ar@20@00 r))
              (and
                (<
                  (inv@59@00 s@$ i@14@00 lo@15@00 hi@16@00 step@17@00 min@18@00 max@19@00 ar@20@00 r)
                  max@19@00)
                (and
                  (<=
                    lo@15@00
                    (mod
                      (inv@59@00 s@$ i@14@00 lo@15@00 hi@16@00 step@17@00 min@18@00 max@19@00 ar@20@00 r)
                      step@17@00))
                  (<
                    (mod
                      (inv@59@00 s@$ i@14@00 lo@15@00 hi@16@00 step@17@00 min@18@00 max@19@00 ar@20@00 r)
                      step@17@00)
                    hi@16@00))))
            (< $Perm.No $k@58@00)
            (img@60@00 s@$ i@14@00 lo@15@00 hi@16@00 step@17@00 min@18@00 max@19@00 ar@20@00 r))
          (Set_in r ($FVF.domain_Ref__Integer_value (sm@61@00 s@$ i@14@00 lo@15@00 hi@16@00 step@17@00 min@18@00 max@19@00 ar@20@00)))))
      :pattern ((Set_in r ($FVF.domain_Ref__Integer_value (sm@61@00 s@$ i@14@00 lo@15@00 hi@16@00 step@17@00 min@18@00 max@19@00 ar@20@00))))
      :qid |qp.fvfDomDef5|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (and
              (<=
                min@18@00
                (inv@59@00 s@$ i@14@00 lo@15@00 hi@16@00 step@17@00 min@18@00 max@19@00 ar@20@00 r))
              (and
                (<
                  (inv@59@00 s@$ i@14@00 lo@15@00 hi@16@00 step@17@00 min@18@00 max@19@00 ar@20@00 r)
                  max@19@00)
                (and
                  (<=
                    lo@15@00
                    (mod
                      (inv@59@00 s@$ i@14@00 lo@15@00 hi@16@00 step@17@00 min@18@00 max@19@00 ar@20@00 r)
                      step@17@00))
                  (<
                    (mod
                      (inv@59@00 s@$ i@14@00 lo@15@00 hi@16@00 step@17@00 min@18@00 max@19@00 ar@20@00 r)
                      step@17@00)
                    hi@16@00))))
            (< $Perm.No $k@58@00)
            (img@60@00 s@$ i@14@00 lo@15@00 hi@16@00 step@17@00 min@18@00 max@19@00 ar@20@00 r))
          (ite
            (and
              (img@54@00 s@$ i@14@00 lo@15@00 hi@16@00 step@17@00 min@18@00 max@19@00 ar@20@00 r)
              (and
                (<=
                  min@18@00
                  (inv@53@00 s@$ i@14@00 lo@15@00 hi@16@00 step@17@00 min@18@00 max@19@00 ar@20@00 r))
                (and
                  (<
                    (inv@53@00 s@$ i@14@00 lo@15@00 hi@16@00 step@17@00 min@18@00 max@19@00 ar@20@00 r)
                    max@19@00)
                  (and
                    (<=
                      lo@15@00
                      (mod
                        (inv@53@00 s@$ i@14@00 lo@15@00 hi@16@00 step@17@00 min@18@00 max@19@00 ar@20@00 r)
                        step@17@00))
                    (<
                      (mod
                        (inv@53@00 s@$ i@14@00 lo@15@00 hi@16@00 step@17@00 min@18@00 max@19@00 ar@20@00 r)
                        step@17@00)
                      hi@16@00)))))
            (< $Perm.No $k@52@00)
            false))
        (=
          ($FVF.lookup_Ref__Integer_value (sm@61@00 s@$ i@14@00 lo@15@00 hi@16@00 step@17@00 min@18@00 max@19@00 ar@20@00) r)
          ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))) r)))
      :pattern (($FVF.lookup_Ref__Integer_value (sm@61@00 s@$ i@14@00 lo@15@00 hi@16@00 step@17@00 min@18@00 max@19@00 ar@20@00) r))
      :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))) r))
      :qid |qp.fvfValDef4|))
    ($Perm.isReadVar $k@52@00)
    ($Perm.isReadVar $k@58@00)
    (=>
      (sum_square%precondition s@$ i@14@00 lo@15@00 hi@16@00 step@17@00 min@18@00 max@19@00 ar@20@00)
      (=
        (sum_square s@$ i@14@00 lo@15@00 hi@16@00 step@17@00 min@18@00 max@19@00 ar@20@00)
        (ite
          (< i@14@00 max@19@00)
          (+
            (ite
              (and
                (<= lo@15@00 (mod i@14@00 step@17@00))
                (< (mod i@14@00 step@17@00) hi@16@00))
              ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))) (Seq_index
                ar@20@00
                i@14@00))
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
                              ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (sm@61@00 s@$ i@14@00 lo@15@00 hi@16@00 step@17@00 min@18@00 max@19@00 ar@20@00))))))))))) (+
              i@14@00
              1) lo@15@00 hi@16@00 step@17@00 min@18@00 max@19@00 ar@20@00))
          0))))
  :pattern ((sum_square s@$ i@14@00 lo@15@00 hi@16@00 step@17@00 min@18@00 max@19@00 ar@20@00))
  :qid |quant-u-30|)))
(assert (forall ((s@$ $Snap) (i@14@00 Int) (lo@15@00 Int) (hi@16@00 Int) (step@17@00 Int) (min@18@00 Int) (max@19@00 Int) (ar@20@00 Seq<$Ref>)) (!
  (=>
    (sum_square%precondition s@$ i@14@00 lo@15@00 hi@16@00 step@17@00 min@18@00 max@19@00 ar@20@00)
    (ite
      (< i@14@00 max@19@00)
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
                        ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (sm@61@00 s@$ i@14@00 lo@15@00 hi@16@00 step@17@00 min@18@00 max@19@00 ar@20@00))))))))))) (+
        i@14@00
        1) lo@15@00 hi@16@00 step@17@00 min@18@00 max@19@00 ar@20@00)
      true))
  :pattern ((sum_square s@$ i@14@00 lo@15@00 hi@16@00 step@17@00 min@18@00 max@19@00 ar@20@00))
  :qid |quant-u-31|)))
(assert (forall ((s@$ $Snap) (i@22@00 Int) (lo@23@00 Int) (hi@24@00 Int) (step@25@00 Int) (min@26@00 Int) (max@27@00 Int) (ar@28@00 Seq<$Ref>) (v@29@00 Int)) (!
  (=
    (count_square%limited s@$ i@22@00 lo@23@00 hi@24@00 step@25@00 min@26@00 max@27@00 ar@28@00 v@29@00)
    (count_square s@$ i@22@00 lo@23@00 hi@24@00 step@25@00 min@26@00 max@27@00 ar@28@00 v@29@00))
  :pattern ((count_square s@$ i@22@00 lo@23@00 hi@24@00 step@25@00 min@26@00 max@27@00 ar@28@00 v@29@00))
  :qid |quant-u-8|)))
(assert (forall ((s@$ $Snap) (i@22@00 Int) (lo@23@00 Int) (hi@24@00 Int) (step@25@00 Int) (min@26@00 Int) (max@27@00 Int) (ar@28@00 Seq<$Ref>) (v@29@00 Int)) (!
  (count_square%stateless i@22@00 lo@23@00 hi@24@00 step@25@00 min@26@00 max@27@00 ar@28@00 v@29@00)
  :pattern ((count_square%limited s@$ i@22@00 lo@23@00 hi@24@00 step@25@00 min@26@00 max@27@00 ar@28@00 v@29@00))
  :qid |quant-u-9|)))
(assert (forall ((s@$ $Snap) (i@22@00 Int) (lo@23@00 Int) (hi@24@00 Int) (step@25@00 Int) (min@26@00 Int) (max@27@00 Int) (ar@28@00 Seq<$Ref>) (v@29@00 Int)) (!
  (and
    (forall ((k@64@00 Int)) (!
      (=>
        (and
          (and
            (<= min@26@00 k@64@00)
            (and
              (< k@64@00 max@27@00)
              (and
                (<= lo@23@00 (mod k@64@00 step@25@00))
                (< (mod k@64@00 step@25@00) hi@24@00))))
          (< $Perm.No $k@65@00))
        (and
          (=
            (inv@66@00 s@$ i@22@00 lo@23@00 hi@24@00 step@25@00 min@26@00 max@27@00 ar@28@00 v@29@00 (Seq_index
              ar@28@00
              k@64@00))
            k@64@00)
          (img@67@00 s@$ i@22@00 lo@23@00 hi@24@00 step@25@00 min@26@00 max@27@00 ar@28@00 v@29@00 (Seq_index
            ar@28@00
            k@64@00))))
      :pattern ((Seq_index ar@28@00 k@64@00))
      :qid |quant-u-33|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@67@00 s@$ i@22@00 lo@23@00 hi@24@00 step@25@00 min@26@00 max@27@00 ar@28@00 v@29@00 r)
          (and
            (and
              (<=
                min@26@00
                (inv@66@00 s@$ i@22@00 lo@23@00 hi@24@00 step@25@00 min@26@00 max@27@00 ar@28@00 v@29@00 r))
              (and
                (<
                  (inv@66@00 s@$ i@22@00 lo@23@00 hi@24@00 step@25@00 min@26@00 max@27@00 ar@28@00 v@29@00 r)
                  max@27@00)
                (and
                  (<=
                    lo@23@00
                    (mod
                      (inv@66@00 s@$ i@22@00 lo@23@00 hi@24@00 step@25@00 min@26@00 max@27@00 ar@28@00 v@29@00 r)
                      step@25@00))
                  (<
                    (mod
                      (inv@66@00 s@$ i@22@00 lo@23@00 hi@24@00 step@25@00 min@26@00 max@27@00 ar@28@00 v@29@00 r)
                      step@25@00)
                    hi@24@00))))
            (< $Perm.No $k@65@00)))
        (=
          (Seq_index
            ar@28@00
            (inv@66@00 s@$ i@22@00 lo@23@00 hi@24@00 step@25@00 min@26@00 max@27@00 ar@28@00 v@29@00 r))
          r))
      :pattern ((inv@66@00 s@$ i@22@00 lo@23@00 hi@24@00 step@25@00 min@26@00 max@27@00 ar@28@00 v@29@00 r))
      :qid |Ref__Integer_value-fctOfInv|))
    (forall ((k@70@00 Int)) (!
      (=>
        (and
          (and
            (<= min@26@00 k@70@00)
            (and
              (< k@70@00 max@27@00)
              (and
                (<= lo@23@00 (mod k@70@00 step@25@00))
                (< (mod k@70@00 step@25@00) hi@24@00))))
          (< $Perm.No $k@71@00))
        (and
          (=
            (inv@72@00 s@$ i@22@00 lo@23@00 hi@24@00 step@25@00 min@26@00 max@27@00 ar@28@00 v@29@00 (Seq_index
              ar@28@00
              k@70@00))
            k@70@00)
          (img@73@00 s@$ i@22@00 lo@23@00 hi@24@00 step@25@00 min@26@00 max@27@00 ar@28@00 v@29@00 (Seq_index
            ar@28@00
            k@70@00))))
      :pattern ((Seq_index ar@28@00 k@70@00))
      :qid |Ref__Integer_value-invOfFct|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@73@00 s@$ i@22@00 lo@23@00 hi@24@00 step@25@00 min@26@00 max@27@00 ar@28@00 v@29@00 r)
          (and
            (and
              (<=
                min@26@00
                (inv@72@00 s@$ i@22@00 lo@23@00 hi@24@00 step@25@00 min@26@00 max@27@00 ar@28@00 v@29@00 r))
              (and
                (<
                  (inv@72@00 s@$ i@22@00 lo@23@00 hi@24@00 step@25@00 min@26@00 max@27@00 ar@28@00 v@29@00 r)
                  max@27@00)
                (and
                  (<=
                    lo@23@00
                    (mod
                      (inv@72@00 s@$ i@22@00 lo@23@00 hi@24@00 step@25@00 min@26@00 max@27@00 ar@28@00 v@29@00 r)
                      step@25@00))
                  (<
                    (mod
                      (inv@72@00 s@$ i@22@00 lo@23@00 hi@24@00 step@25@00 min@26@00 max@27@00 ar@28@00 v@29@00 r)
                      step@25@00)
                    hi@24@00))))
            (< $Perm.No $k@71@00)))
        (=
          (Seq_index
            ar@28@00
            (inv@72@00 s@$ i@22@00 lo@23@00 hi@24@00 step@25@00 min@26@00 max@27@00 ar@28@00 v@29@00 r))
          r))
      :pattern ((inv@72@00 s@$ i@22@00 lo@23@00 hi@24@00 step@25@00 min@26@00 max@27@00 ar@28@00 v@29@00 r))
      :qid |Ref__Integer_value-fctOfInv|))
    (forall ((r $Ref)) (!
      (and
        (=>
          (Set_in r ($FVF.domain_Ref__Integer_value (sm@74@00 s@$ i@22@00 lo@23@00 hi@24@00 step@25@00 min@26@00 max@27@00 ar@28@00 v@29@00)))
          (and
            (and
              (<=
                min@26@00
                (inv@72@00 s@$ i@22@00 lo@23@00 hi@24@00 step@25@00 min@26@00 max@27@00 ar@28@00 v@29@00 r))
              (and
                (<
                  (inv@72@00 s@$ i@22@00 lo@23@00 hi@24@00 step@25@00 min@26@00 max@27@00 ar@28@00 v@29@00 r)
                  max@27@00)
                (and
                  (<=
                    lo@23@00
                    (mod
                      (inv@72@00 s@$ i@22@00 lo@23@00 hi@24@00 step@25@00 min@26@00 max@27@00 ar@28@00 v@29@00 r)
                      step@25@00))
                  (<
                    (mod
                      (inv@72@00 s@$ i@22@00 lo@23@00 hi@24@00 step@25@00 min@26@00 max@27@00 ar@28@00 v@29@00 r)
                      step@25@00)
                    hi@24@00))))
            (< $Perm.No $k@71@00)
            (img@73@00 s@$ i@22@00 lo@23@00 hi@24@00 step@25@00 min@26@00 max@27@00 ar@28@00 v@29@00 r)))
        (=>
          (and
            (and
              (<=
                min@26@00
                (inv@72@00 s@$ i@22@00 lo@23@00 hi@24@00 step@25@00 min@26@00 max@27@00 ar@28@00 v@29@00 r))
              (and
                (<
                  (inv@72@00 s@$ i@22@00 lo@23@00 hi@24@00 step@25@00 min@26@00 max@27@00 ar@28@00 v@29@00 r)
                  max@27@00)
                (and
                  (<=
                    lo@23@00
                    (mod
                      (inv@72@00 s@$ i@22@00 lo@23@00 hi@24@00 step@25@00 min@26@00 max@27@00 ar@28@00 v@29@00 r)
                      step@25@00))
                  (<
                    (mod
                      (inv@72@00 s@$ i@22@00 lo@23@00 hi@24@00 step@25@00 min@26@00 max@27@00 ar@28@00 v@29@00 r)
                      step@25@00)
                    hi@24@00))))
            (< $Perm.No $k@71@00)
            (img@73@00 s@$ i@22@00 lo@23@00 hi@24@00 step@25@00 min@26@00 max@27@00 ar@28@00 v@29@00 r))
          (Set_in r ($FVF.domain_Ref__Integer_value (sm@74@00 s@$ i@22@00 lo@23@00 hi@24@00 step@25@00 min@26@00 max@27@00 ar@28@00 v@29@00)))))
      :pattern ((Set_in r ($FVF.domain_Ref__Integer_value (sm@74@00 s@$ i@22@00 lo@23@00 hi@24@00 step@25@00 min@26@00 max@27@00 ar@28@00 v@29@00))))
      :qid |qp.fvfDomDef8|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (and
              (<=
                min@26@00
                (inv@72@00 s@$ i@22@00 lo@23@00 hi@24@00 step@25@00 min@26@00 max@27@00 ar@28@00 v@29@00 r))
              (and
                (<
                  (inv@72@00 s@$ i@22@00 lo@23@00 hi@24@00 step@25@00 min@26@00 max@27@00 ar@28@00 v@29@00 r)
                  max@27@00)
                (and
                  (<=
                    lo@23@00
                    (mod
                      (inv@72@00 s@$ i@22@00 lo@23@00 hi@24@00 step@25@00 min@26@00 max@27@00 ar@28@00 v@29@00 r)
                      step@25@00))
                  (<
                    (mod
                      (inv@72@00 s@$ i@22@00 lo@23@00 hi@24@00 step@25@00 min@26@00 max@27@00 ar@28@00 v@29@00 r)
                      step@25@00)
                    hi@24@00))))
            (< $Perm.No $k@71@00)
            (img@73@00 s@$ i@22@00 lo@23@00 hi@24@00 step@25@00 min@26@00 max@27@00 ar@28@00 v@29@00 r))
          (ite
            (and
              (img@67@00 s@$ i@22@00 lo@23@00 hi@24@00 step@25@00 min@26@00 max@27@00 ar@28@00 v@29@00 r)
              (and
                (<=
                  min@26@00
                  (inv@66@00 s@$ i@22@00 lo@23@00 hi@24@00 step@25@00 min@26@00 max@27@00 ar@28@00 v@29@00 r))
                (and
                  (<
                    (inv@66@00 s@$ i@22@00 lo@23@00 hi@24@00 step@25@00 min@26@00 max@27@00 ar@28@00 v@29@00 r)
                    max@27@00)
                  (and
                    (<=
                      lo@23@00
                      (mod
                        (inv@66@00 s@$ i@22@00 lo@23@00 hi@24@00 step@25@00 min@26@00 max@27@00 ar@28@00 v@29@00 r)
                        step@25@00))
                    (<
                      (mod
                        (inv@66@00 s@$ i@22@00 lo@23@00 hi@24@00 step@25@00 min@26@00 max@27@00 ar@28@00 v@29@00 r)
                        step@25@00)
                      hi@24@00)))))
            (< $Perm.No $k@65@00)
            false))
        (=
          ($FVF.lookup_Ref__Integer_value (sm@74@00 s@$ i@22@00 lo@23@00 hi@24@00 step@25@00 min@26@00 max@27@00 ar@28@00 v@29@00) r)
          ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))) r)))
      :pattern (($FVF.lookup_Ref__Integer_value (sm@74@00 s@$ i@22@00 lo@23@00 hi@24@00 step@25@00 min@26@00 max@27@00 ar@28@00 v@29@00) r))
      :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))) r))
      :qid |qp.fvfValDef7|))
    ($Perm.isReadVar $k@65@00)
    ($Perm.isReadVar $k@71@00)
    (=>
      (count_square%precondition s@$ i@22@00 lo@23@00 hi@24@00 step@25@00 min@26@00 max@27@00 ar@28@00 v@29@00)
      (=
        (count_square s@$ i@22@00 lo@23@00 hi@24@00 step@25@00 min@26@00 max@27@00 ar@28@00 v@29@00)
        (ite
          (< i@22@00 max@27@00)
          (+
            (ite
              (and
                (<= lo@23@00 (mod i@22@00 step@25@00))
                (and
                  (< (mod i@22@00 step@25@00) hi@24@00)
                  (=
                    ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))))))) (Seq_index
                      ar@28@00
                      i@22@00))
                    v@29@00)))
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
                              ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (sm@74@00 s@$ i@22@00 lo@23@00 hi@24@00 step@25@00 min@26@00 max@27@00 ar@28@00 v@29@00))))))))))) (+
              i@22@00
              1) lo@23@00 hi@24@00 step@25@00 min@26@00 max@27@00 ar@28@00 v@29@00))
          0))))
  :pattern ((count_square s@$ i@22@00 lo@23@00 hi@24@00 step@25@00 min@26@00 max@27@00 ar@28@00 v@29@00))
  :qid |quant-u-38|)))
(assert (forall ((s@$ $Snap) (i@22@00 Int) (lo@23@00 Int) (hi@24@00 Int) (step@25@00 Int) (min@26@00 Int) (max@27@00 Int) (ar@28@00 Seq<$Ref>) (v@29@00 Int)) (!
  (=>
    (count_square%precondition s@$ i@22@00 lo@23@00 hi@24@00 step@25@00 min@26@00 max@27@00 ar@28@00 v@29@00)
    (ite
      (< i@22@00 max@27@00)
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
                        ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (sm@74@00 s@$ i@22@00 lo@23@00 hi@24@00 step@25@00 min@26@00 max@27@00 ar@28@00 v@29@00))))))))))) (+
        i@22@00
        1) lo@23@00 hi@24@00 step@25@00 min@26@00 max@27@00 ar@28@00 v@29@00)
      true))
  :pattern ((count_square s@$ i@22@00 lo@23@00 hi@24@00 step@25@00 min@26@00 max@27@00 ar@28@00 v@29@00))
  :qid |quant-u-39|)))
(assert (forall ((s@$ $Snap) (i@31@00 Int) (lo@32@00 Int) (hi@33@00 Int) (ar@34@00 Seq<$Ref>)) (!
  (=
    (sum_array%limited s@$ i@31@00 lo@32@00 hi@33@00 ar@34@00)
    (sum_array s@$ i@31@00 lo@32@00 hi@33@00 ar@34@00))
  :pattern ((sum_array s@$ i@31@00 lo@32@00 hi@33@00 ar@34@00))
  :qid |quant-u-10|)))
(assert (forall ((s@$ $Snap) (i@31@00 Int) (lo@32@00 Int) (hi@33@00 Int) (ar@34@00 Seq<$Ref>)) (!
  (sum_array%stateless i@31@00 lo@32@00 hi@33@00 ar@34@00)
  :pattern ((sum_array%limited s@$ i@31@00 lo@32@00 hi@33@00 ar@34@00))
  :qid |quant-u-11|)))
(assert (forall ((s@$ $Snap) (i@31@00 Int) (lo@32@00 Int) (hi@33@00 Int) (ar@34@00 Seq<$Ref>)) (!
  (and
    (forall ((k@77@00 Int)) (!
      (=>
        (and
          (and (<= lo@32@00 k@77@00) (< k@77@00 hi@33@00))
          (< $Perm.No $k@78@00))
        (and
          (=
            (inv@79@00 s@$ i@31@00 lo@32@00 hi@33@00 ar@34@00 (Seq_index
              ar@34@00
              k@77@00))
            k@77@00)
          (img@80@00 s@$ i@31@00 lo@32@00 hi@33@00 ar@34@00 (Seq_index
            ar@34@00
            k@77@00))))
      :pattern ((Seq_index ar@34@00 k@77@00))
      :qid |quant-u-41|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@80@00 s@$ i@31@00 lo@32@00 hi@33@00 ar@34@00 r)
          (and
            (and
              (<= lo@32@00 (inv@79@00 s@$ i@31@00 lo@32@00 hi@33@00 ar@34@00 r))
              (< (inv@79@00 s@$ i@31@00 lo@32@00 hi@33@00 ar@34@00 r) hi@33@00))
            (< $Perm.No $k@78@00)))
        (=
          (Seq_index
            ar@34@00
            (inv@79@00 s@$ i@31@00 lo@32@00 hi@33@00 ar@34@00 r))
          r))
      :pattern ((inv@79@00 s@$ i@31@00 lo@32@00 hi@33@00 ar@34@00 r))
      :qid |Ref__Integer_value-fctOfInv|))
    (forall ((k@83@00 Int)) (!
      (=>
        (and
          (and (<= lo@32@00 k@83@00) (< k@83@00 hi@33@00))
          (< $Perm.No $k@84@00))
        (and
          (=
            (inv@85@00 s@$ i@31@00 lo@32@00 hi@33@00 ar@34@00 (Seq_index
              ar@34@00
              k@83@00))
            k@83@00)
          (img@86@00 s@$ i@31@00 lo@32@00 hi@33@00 ar@34@00 (Seq_index
            ar@34@00
            k@83@00))))
      :pattern ((Seq_index ar@34@00 k@83@00))
      :qid |Ref__Integer_value-invOfFct|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (img@86@00 s@$ i@31@00 lo@32@00 hi@33@00 ar@34@00 r)
          (and
            (and
              (<= lo@32@00 (inv@85@00 s@$ i@31@00 lo@32@00 hi@33@00 ar@34@00 r))
              (< (inv@85@00 s@$ i@31@00 lo@32@00 hi@33@00 ar@34@00 r) hi@33@00))
            (< $Perm.No $k@84@00)))
        (=
          (Seq_index
            ar@34@00
            (inv@85@00 s@$ i@31@00 lo@32@00 hi@33@00 ar@34@00 r))
          r))
      :pattern ((inv@85@00 s@$ i@31@00 lo@32@00 hi@33@00 ar@34@00 r))
      :qid |Ref__Integer_value-fctOfInv|))
    (forall ((r $Ref)) (!
      (and
        (=>
          (Set_in r ($FVF.domain_Ref__Integer_value (sm@87@00 s@$ i@31@00 lo@32@00 hi@33@00 ar@34@00)))
          (and
            (and
              (<= lo@32@00 (inv@85@00 s@$ i@31@00 lo@32@00 hi@33@00 ar@34@00 r))
              (< (inv@85@00 s@$ i@31@00 lo@32@00 hi@33@00 ar@34@00 r) hi@33@00))
            (< $Perm.No $k@84@00)
            (img@86@00 s@$ i@31@00 lo@32@00 hi@33@00 ar@34@00 r)))
        (=>
          (and
            (and
              (<= lo@32@00 (inv@85@00 s@$ i@31@00 lo@32@00 hi@33@00 ar@34@00 r))
              (< (inv@85@00 s@$ i@31@00 lo@32@00 hi@33@00 ar@34@00 r) hi@33@00))
            (< $Perm.No $k@84@00)
            (img@86@00 s@$ i@31@00 lo@32@00 hi@33@00 ar@34@00 r))
          (Set_in r ($FVF.domain_Ref__Integer_value (sm@87@00 s@$ i@31@00 lo@32@00 hi@33@00 ar@34@00)))))
      :pattern ((Set_in r ($FVF.domain_Ref__Integer_value (sm@87@00 s@$ i@31@00 lo@32@00 hi@33@00 ar@34@00))))
      :qid |qp.fvfDomDef11|))
    (forall ((r $Ref)) (!
      (=>
        (and
          (and
            (and
              (<= lo@32@00 (inv@85@00 s@$ i@31@00 lo@32@00 hi@33@00 ar@34@00 r))
              (< (inv@85@00 s@$ i@31@00 lo@32@00 hi@33@00 ar@34@00 r) hi@33@00))
            (< $Perm.No $k@84@00)
            (img@86@00 s@$ i@31@00 lo@32@00 hi@33@00 ar@34@00 r))
          (ite
            (and
              (img@80@00 s@$ i@31@00 lo@32@00 hi@33@00 ar@34@00 r)
              (and
                (<=
                  lo@32@00
                  (inv@79@00 s@$ i@31@00 lo@32@00 hi@33@00 ar@34@00 r))
                (< (inv@79@00 s@$ i@31@00 lo@32@00 hi@33@00 ar@34@00 r) hi@33@00)))
            (< $Perm.No $k@78@00)
            false))
        (=
          ($FVF.lookup_Ref__Integer_value (sm@87@00 s@$ i@31@00 lo@32@00 hi@33@00 ar@34@00) r)
          ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) r)))
      :pattern (($FVF.lookup_Ref__Integer_value (sm@87@00 s@$ i@31@00 lo@32@00 hi@33@00 ar@34@00) r))
      :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) r))
      :qid |qp.fvfValDef10|))
    ($Perm.isReadVar $k@78@00)
    ($Perm.isReadVar $k@84@00)
    (=>
      (sum_array%precondition s@$ i@31@00 lo@32@00 hi@33@00 ar@34@00)
      (=
        (sum_array s@$ i@31@00 lo@32@00 hi@33@00 ar@34@00)
        (ite
          (< i@31@00 hi@33@00)
          (+
            ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second s@$)))))) (Seq_index
              ar@34@00
              i@31@00))
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
                      ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (sm@87@00 s@$ i@31@00 lo@32@00 hi@33@00 ar@34@00))))))) (+
              i@31@00
              1) lo@32@00 hi@33@00 ar@34@00))
          0))))
  :pattern ((sum_array s@$ i@31@00 lo@32@00 hi@33@00 ar@34@00))
  :qid |quant-u-46|)))
(assert (forall ((s@$ $Snap) (i@31@00 Int) (lo@32@00 Int) (hi@33@00 Int) (ar@34@00 Seq<$Ref>)) (!
  (=>
    (sum_array%precondition s@$ i@31@00 lo@32@00 hi@33@00 ar@34@00)
    (ite
      (< i@31@00 hi@33@00)
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
                ($SortWrappers.$FVF<Ref__Integer_value>To$Snap (sm@87@00 s@$ i@31@00 lo@32@00 hi@33@00 ar@34@00))))))) (+
        i@31@00
        1) lo@32@00 hi@33@00 ar@34@00)
      true))
  :pattern ((sum_array s@$ i@31@00 lo@32@00 hi@33@00 ar@34@00))
  :qid |quant-u-47|)))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- Ref__loop_main_45 ----------
(declare-const diz@0@01 $Ref)
(declare-const current_thread_id@1@01 Int)
(declare-const b@2@01 Seq<$Ref>)
(declare-const a@3@01 Seq<$Ref>)
(declare-const N@4@01 Int)
(declare-const c@5@01 Seq<$Ref>)
(declare-const diz@6@01 $Ref)
(declare-const current_thread_id@7@01 Int)
(declare-const b@8@01 Seq<$Ref>)
(declare-const a@9@01 Seq<$Ref>)
(declare-const N@10@01 Int)
(declare-const c@11@01 Seq<$Ref>)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@12@01 $Snap)
(assert (= $t@12@01 ($Snap.combine ($Snap.first $t@12@01) ($Snap.second $t@12@01))))
(assert (= ($Snap.first $t@12@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@6@01 $Ref.null)))
(assert (=
  ($Snap.second $t@12@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@12@01))
    ($Snap.second ($Snap.second $t@12@01)))))
(assert (= ($Snap.first ($Snap.second $t@12@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@7@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@12@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@12@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@12@01))) $Snap.unit))
; [eval] (forall k: Int, j: Int :: { a[k], a[j] } k >= 0 && (k < |a| && (j >= 0 && (j < |a| && k != j))) ==> a[k] != a[j])
(declare-const k@13@01 Int)
(declare-const j@14@01 Int)
(push) ; 2
; [eval] k >= 0 && (k < |a| && (j >= 0 && (j < |a| && k != j))) ==> a[k] != a[j]
; [eval] k >= 0 && (k < |a| && (j >= 0 && (j < |a| && k != j)))
; [eval] k >= 0
(push) ; 3
; [then-branch: 0 | !(k@13@01 >= 0) | live]
; [else-branch: 0 | k@13@01 >= 0 | live]
(push) ; 4
; [then-branch: 0 | !(k@13@01 >= 0)]
(assert (not (>= k@13@01 0)))
(pop) ; 4
(push) ; 4
; [else-branch: 0 | k@13@01 >= 0]
(assert (>= k@13@01 0))
; [eval] k < |a|
; [eval] |a|
(push) ; 5
; [then-branch: 1 | !(k@13@01 < |a@9@01|) | live]
; [else-branch: 1 | k@13@01 < |a@9@01| | live]
(push) ; 6
; [then-branch: 1 | !(k@13@01 < |a@9@01|)]
(assert (not (< k@13@01 (Seq_length a@9@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 1 | k@13@01 < |a@9@01|]
(assert (< k@13@01 (Seq_length a@9@01)))
; [eval] j >= 0
(push) ; 7
; [then-branch: 2 | !(j@14@01 >= 0) | live]
; [else-branch: 2 | j@14@01 >= 0 | live]
(push) ; 8
; [then-branch: 2 | !(j@14@01 >= 0)]
(assert (not (>= j@14@01 0)))
(pop) ; 8
(push) ; 8
; [else-branch: 2 | j@14@01 >= 0]
(assert (>= j@14@01 0))
; [eval] j < |a|
; [eval] |a|
(push) ; 9
; [then-branch: 3 | !(j@14@01 < |a@9@01|) | live]
; [else-branch: 3 | j@14@01 < |a@9@01| | live]
(push) ; 10
; [then-branch: 3 | !(j@14@01 < |a@9@01|)]
(assert (not (< j@14@01 (Seq_length a@9@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 3 | j@14@01 < |a@9@01|]
(assert (< j@14@01 (Seq_length a@9@01)))
; [eval] k != j
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< j@14@01 (Seq_length a@9@01)) (not (< j@14@01 (Seq_length a@9@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@14@01 0)
  (and
    (>= j@14@01 0)
    (or (< j@14@01 (Seq_length a@9@01)) (not (< j@14@01 (Seq_length a@9@01)))))))
(assert (or (>= j@14@01 0) (not (>= j@14@01 0))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< k@13@01 (Seq_length a@9@01))
  (and
    (< k@13@01 (Seq_length a@9@01))
    (=>
      (>= j@14@01 0)
      (and
        (>= j@14@01 0)
        (or
          (< j@14@01 (Seq_length a@9@01))
          (not (< j@14@01 (Seq_length a@9@01))))))
    (or (>= j@14@01 0) (not (>= j@14@01 0))))))
(assert (or (< k@13@01 (Seq_length a@9@01)) (not (< k@13@01 (Seq_length a@9@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= k@13@01 0)
  (and
    (>= k@13@01 0)
    (=>
      (< k@13@01 (Seq_length a@9@01))
      (and
        (< k@13@01 (Seq_length a@9@01))
        (=>
          (>= j@14@01 0)
          (and
            (>= j@14@01 0)
            (or
              (< j@14@01 (Seq_length a@9@01))
              (not (< j@14@01 (Seq_length a@9@01))))))
        (or (>= j@14@01 0) (not (>= j@14@01 0)))))
    (or (< k@13@01 (Seq_length a@9@01)) (not (< k@13@01 (Seq_length a@9@01)))))))
(assert (or (>= k@13@01 0) (not (>= k@13@01 0))))
(push) ; 3
; [then-branch: 4 | k@13@01 >= 0 && k@13@01 < |a@9@01| && j@14@01 >= 0 && j@14@01 < |a@9@01| && k@13@01 != j@14@01 | live]
; [else-branch: 4 | !(k@13@01 >= 0 && k@13@01 < |a@9@01| && j@14@01 >= 0 && j@14@01 < |a@9@01| && k@13@01 != j@14@01) | live]
(push) ; 4
; [then-branch: 4 | k@13@01 >= 0 && k@13@01 < |a@9@01| && j@14@01 >= 0 && j@14@01 < |a@9@01| && k@13@01 != j@14@01]
(assert (and
  (>= k@13@01 0)
  (and
    (< k@13@01 (Seq_length a@9@01))
    (and
      (>= j@14@01 0)
      (and (< j@14@01 (Seq_length a@9@01)) (not (= k@13@01 j@14@01)))))))
; [eval] a[k] != a[j]
; [eval] a[k]
; [eval] a[j]
(pop) ; 4
(push) ; 4
; [else-branch: 4 | !(k@13@01 >= 0 && k@13@01 < |a@9@01| && j@14@01 >= 0 && j@14@01 < |a@9@01| && k@13@01 != j@14@01)]
(assert (not
  (and
    (>= k@13@01 0)
    (and
      (< k@13@01 (Seq_length a@9@01))
      (and
        (>= j@14@01 0)
        (and (< j@14@01 (Seq_length a@9@01)) (not (= k@13@01 j@14@01))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (>= k@13@01 0)
    (and
      (< k@13@01 (Seq_length a@9@01))
      (and
        (>= j@14@01 0)
        (and (< j@14@01 (Seq_length a@9@01)) (not (= k@13@01 j@14@01))))))
  (and
    (>= k@13@01 0)
    (< k@13@01 (Seq_length a@9@01))
    (>= j@14@01 0)
    (< j@14@01 (Seq_length a@9@01))
    (not (= k@13@01 j@14@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= k@13@01 0)
      (and
        (< k@13@01 (Seq_length a@9@01))
        (and
          (>= j@14@01 0)
          (and (< j@14@01 (Seq_length a@9@01)) (not (= k@13@01 j@14@01)))))))
  (and
    (>= k@13@01 0)
    (and
      (< k@13@01 (Seq_length a@9@01))
      (and
        (>= j@14@01 0)
        (and (< j@14@01 (Seq_length a@9@01)) (not (= k@13@01 j@14@01))))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@13@01 Int) (j@14@01 Int)) (!
  (and
    (=>
      (>= k@13@01 0)
      (and
        (>= k@13@01 0)
        (=>
          (< k@13@01 (Seq_length a@9@01))
          (and
            (< k@13@01 (Seq_length a@9@01))
            (=>
              (>= j@14@01 0)
              (and
                (>= j@14@01 0)
                (or
                  (< j@14@01 (Seq_length a@9@01))
                  (not (< j@14@01 (Seq_length a@9@01))))))
            (or (>= j@14@01 0) (not (>= j@14@01 0)))))
        (or
          (< k@13@01 (Seq_length a@9@01))
          (not (< k@13@01 (Seq_length a@9@01))))))
    (or (>= k@13@01 0) (not (>= k@13@01 0)))
    (=>
      (and
        (>= k@13@01 0)
        (and
          (< k@13@01 (Seq_length a@9@01))
          (and
            (>= j@14@01 0)
            (and (< j@14@01 (Seq_length a@9@01)) (not (= k@13@01 j@14@01))))))
      (and
        (>= k@13@01 0)
        (< k@13@01 (Seq_length a@9@01))
        (>= j@14@01 0)
        (< j@14@01 (Seq_length a@9@01))
        (not (= k@13@01 j@14@01))))
    (or
      (not
        (and
          (>= k@13@01 0)
          (and
            (< k@13@01 (Seq_length a@9@01))
            (and
              (>= j@14@01 0)
              (and (< j@14@01 (Seq_length a@9@01)) (not (= k@13@01 j@14@01)))))))
      (and
        (>= k@13@01 0)
        (and
          (< k@13@01 (Seq_length a@9@01))
          (and
            (>= j@14@01 0)
            (and (< j@14@01 (Seq_length a@9@01)) (not (= k@13@01 j@14@01))))))))
  :pattern ((Seq_index a@9@01 k@13@01) (Seq_index a@9@01 j@14@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_backward_dep_drf_c.vpr@61@12@61@100-aux|)))
(assert (forall ((k@13@01 Int) (j@14@01 Int)) (!
  (=>
    (and
      (>= k@13@01 0)
      (and
        (< k@13@01 (Seq_length a@9@01))
        (and
          (>= j@14@01 0)
          (and (< j@14@01 (Seq_length a@9@01)) (not (= k@13@01 j@14@01))))))
    (not (= (Seq_index a@9@01 k@13@01) (Seq_index a@9@01 j@14@01))))
  :pattern ((Seq_index a@9@01 k@13@01) (Seq_index a@9@01 j@14@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_backward_dep_drf_c.vpr@61@12@61@100|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@12@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@12@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@12@01))))
  $Snap.unit))
; [eval] (forall k: Int, j: Int :: { b[k], b[j] } k >= 0 && (k < |b| && (j >= 0 && (j < |b| && k != j))) ==> b[k] != b[j])
(declare-const k@15@01 Int)
(declare-const j@16@01 Int)
(push) ; 2
; [eval] k >= 0 && (k < |b| && (j >= 0 && (j < |b| && k != j))) ==> b[k] != b[j]
; [eval] k >= 0 && (k < |b| && (j >= 0 && (j < |b| && k != j)))
; [eval] k >= 0
(push) ; 3
; [then-branch: 5 | !(k@15@01 >= 0) | live]
; [else-branch: 5 | k@15@01 >= 0 | live]
(push) ; 4
; [then-branch: 5 | !(k@15@01 >= 0)]
(assert (not (>= k@15@01 0)))
(pop) ; 4
(push) ; 4
; [else-branch: 5 | k@15@01 >= 0]
(assert (>= k@15@01 0))
; [eval] k < |b|
; [eval] |b|
(push) ; 5
; [then-branch: 6 | !(k@15@01 < |b@8@01|) | live]
; [else-branch: 6 | k@15@01 < |b@8@01| | live]
(push) ; 6
; [then-branch: 6 | !(k@15@01 < |b@8@01|)]
(assert (not (< k@15@01 (Seq_length b@8@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 6 | k@15@01 < |b@8@01|]
(assert (< k@15@01 (Seq_length b@8@01)))
; [eval] j >= 0
(push) ; 7
; [then-branch: 7 | !(j@16@01 >= 0) | live]
; [else-branch: 7 | j@16@01 >= 0 | live]
(push) ; 8
; [then-branch: 7 | !(j@16@01 >= 0)]
(assert (not (>= j@16@01 0)))
(pop) ; 8
(push) ; 8
; [else-branch: 7 | j@16@01 >= 0]
(assert (>= j@16@01 0))
; [eval] j < |b|
; [eval] |b|
(push) ; 9
; [then-branch: 8 | !(j@16@01 < |b@8@01|) | live]
; [else-branch: 8 | j@16@01 < |b@8@01| | live]
(push) ; 10
; [then-branch: 8 | !(j@16@01 < |b@8@01|)]
(assert (not (< j@16@01 (Seq_length b@8@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 8 | j@16@01 < |b@8@01|]
(assert (< j@16@01 (Seq_length b@8@01)))
; [eval] k != j
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< j@16@01 (Seq_length b@8@01)) (not (< j@16@01 (Seq_length b@8@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@16@01 0)
  (and
    (>= j@16@01 0)
    (or (< j@16@01 (Seq_length b@8@01)) (not (< j@16@01 (Seq_length b@8@01)))))))
(assert (or (>= j@16@01 0) (not (>= j@16@01 0))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< k@15@01 (Seq_length b@8@01))
  (and
    (< k@15@01 (Seq_length b@8@01))
    (=>
      (>= j@16@01 0)
      (and
        (>= j@16@01 0)
        (or
          (< j@16@01 (Seq_length b@8@01))
          (not (< j@16@01 (Seq_length b@8@01))))))
    (or (>= j@16@01 0) (not (>= j@16@01 0))))))
(assert (or (< k@15@01 (Seq_length b@8@01)) (not (< k@15@01 (Seq_length b@8@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= k@15@01 0)
  (and
    (>= k@15@01 0)
    (=>
      (< k@15@01 (Seq_length b@8@01))
      (and
        (< k@15@01 (Seq_length b@8@01))
        (=>
          (>= j@16@01 0)
          (and
            (>= j@16@01 0)
            (or
              (< j@16@01 (Seq_length b@8@01))
              (not (< j@16@01 (Seq_length b@8@01))))))
        (or (>= j@16@01 0) (not (>= j@16@01 0)))))
    (or (< k@15@01 (Seq_length b@8@01)) (not (< k@15@01 (Seq_length b@8@01)))))))
(assert (or (>= k@15@01 0) (not (>= k@15@01 0))))
(push) ; 3
; [then-branch: 9 | k@15@01 >= 0 && k@15@01 < |b@8@01| && j@16@01 >= 0 && j@16@01 < |b@8@01| && k@15@01 != j@16@01 | live]
; [else-branch: 9 | !(k@15@01 >= 0 && k@15@01 < |b@8@01| && j@16@01 >= 0 && j@16@01 < |b@8@01| && k@15@01 != j@16@01) | live]
(push) ; 4
; [then-branch: 9 | k@15@01 >= 0 && k@15@01 < |b@8@01| && j@16@01 >= 0 && j@16@01 < |b@8@01| && k@15@01 != j@16@01]
(assert (and
  (>= k@15@01 0)
  (and
    (< k@15@01 (Seq_length b@8@01))
    (and
      (>= j@16@01 0)
      (and (< j@16@01 (Seq_length b@8@01)) (not (= k@15@01 j@16@01)))))))
; [eval] b[k] != b[j]
; [eval] b[k]
; [eval] b[j]
(pop) ; 4
(push) ; 4
; [else-branch: 9 | !(k@15@01 >= 0 && k@15@01 < |b@8@01| && j@16@01 >= 0 && j@16@01 < |b@8@01| && k@15@01 != j@16@01)]
(assert (not
  (and
    (>= k@15@01 0)
    (and
      (< k@15@01 (Seq_length b@8@01))
      (and
        (>= j@16@01 0)
        (and (< j@16@01 (Seq_length b@8@01)) (not (= k@15@01 j@16@01))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (>= k@15@01 0)
    (and
      (< k@15@01 (Seq_length b@8@01))
      (and
        (>= j@16@01 0)
        (and (< j@16@01 (Seq_length b@8@01)) (not (= k@15@01 j@16@01))))))
  (and
    (>= k@15@01 0)
    (< k@15@01 (Seq_length b@8@01))
    (>= j@16@01 0)
    (< j@16@01 (Seq_length b@8@01))
    (not (= k@15@01 j@16@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= k@15@01 0)
      (and
        (< k@15@01 (Seq_length b@8@01))
        (and
          (>= j@16@01 0)
          (and (< j@16@01 (Seq_length b@8@01)) (not (= k@15@01 j@16@01)))))))
  (and
    (>= k@15@01 0)
    (and
      (< k@15@01 (Seq_length b@8@01))
      (and
        (>= j@16@01 0)
        (and (< j@16@01 (Seq_length b@8@01)) (not (= k@15@01 j@16@01))))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@15@01 Int) (j@16@01 Int)) (!
  (and
    (=>
      (>= k@15@01 0)
      (and
        (>= k@15@01 0)
        (=>
          (< k@15@01 (Seq_length b@8@01))
          (and
            (< k@15@01 (Seq_length b@8@01))
            (=>
              (>= j@16@01 0)
              (and
                (>= j@16@01 0)
                (or
                  (< j@16@01 (Seq_length b@8@01))
                  (not (< j@16@01 (Seq_length b@8@01))))))
            (or (>= j@16@01 0) (not (>= j@16@01 0)))))
        (or
          (< k@15@01 (Seq_length b@8@01))
          (not (< k@15@01 (Seq_length b@8@01))))))
    (or (>= k@15@01 0) (not (>= k@15@01 0)))
    (=>
      (and
        (>= k@15@01 0)
        (and
          (< k@15@01 (Seq_length b@8@01))
          (and
            (>= j@16@01 0)
            (and (< j@16@01 (Seq_length b@8@01)) (not (= k@15@01 j@16@01))))))
      (and
        (>= k@15@01 0)
        (< k@15@01 (Seq_length b@8@01))
        (>= j@16@01 0)
        (< j@16@01 (Seq_length b@8@01))
        (not (= k@15@01 j@16@01))))
    (or
      (not
        (and
          (>= k@15@01 0)
          (and
            (< k@15@01 (Seq_length b@8@01))
            (and
              (>= j@16@01 0)
              (and (< j@16@01 (Seq_length b@8@01)) (not (= k@15@01 j@16@01)))))))
      (and
        (>= k@15@01 0)
        (and
          (< k@15@01 (Seq_length b@8@01))
          (and
            (>= j@16@01 0)
            (and (< j@16@01 (Seq_length b@8@01)) (not (= k@15@01 j@16@01))))))))
  :pattern ((Seq_index b@8@01 k@15@01) (Seq_index b@8@01 j@16@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_backward_dep_drf_c.vpr@62@12@62@100-aux|)))
(assert (forall ((k@15@01 Int) (j@16@01 Int)) (!
  (=>
    (and
      (>= k@15@01 0)
      (and
        (< k@15@01 (Seq_length b@8@01))
        (and
          (>= j@16@01 0)
          (and (< j@16@01 (Seq_length b@8@01)) (not (= k@15@01 j@16@01))))))
    (not (= (Seq_index b@8@01 k@15@01) (Seq_index b@8@01 j@16@01))))
  :pattern ((Seq_index b@8@01 k@15@01) (Seq_index b@8@01 j@16@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_backward_dep_drf_c.vpr@62@12@62@100|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))
  $Snap.unit))
; [eval] (forall k: Int, j: Int :: { c[k], c[j] } k >= 0 && (k < |c| && (j >= 0 && (j < |c| && k != j))) ==> c[k] != c[j])
(declare-const k@17@01 Int)
(declare-const j@18@01 Int)
(push) ; 2
; [eval] k >= 0 && (k < |c| && (j >= 0 && (j < |c| && k != j))) ==> c[k] != c[j]
; [eval] k >= 0 && (k < |c| && (j >= 0 && (j < |c| && k != j)))
; [eval] k >= 0
(push) ; 3
; [then-branch: 10 | !(k@17@01 >= 0) | live]
; [else-branch: 10 | k@17@01 >= 0 | live]
(push) ; 4
; [then-branch: 10 | !(k@17@01 >= 0)]
(assert (not (>= k@17@01 0)))
(pop) ; 4
(push) ; 4
; [else-branch: 10 | k@17@01 >= 0]
(assert (>= k@17@01 0))
; [eval] k < |c|
; [eval] |c|
(push) ; 5
; [then-branch: 11 | !(k@17@01 < |c@11@01|) | live]
; [else-branch: 11 | k@17@01 < |c@11@01| | live]
(push) ; 6
; [then-branch: 11 | !(k@17@01 < |c@11@01|)]
(assert (not (< k@17@01 (Seq_length c@11@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 11 | k@17@01 < |c@11@01|]
(assert (< k@17@01 (Seq_length c@11@01)))
; [eval] j >= 0
(push) ; 7
; [then-branch: 12 | !(j@18@01 >= 0) | live]
; [else-branch: 12 | j@18@01 >= 0 | live]
(push) ; 8
; [then-branch: 12 | !(j@18@01 >= 0)]
(assert (not (>= j@18@01 0)))
(pop) ; 8
(push) ; 8
; [else-branch: 12 | j@18@01 >= 0]
(assert (>= j@18@01 0))
; [eval] j < |c|
; [eval] |c|
(push) ; 9
; [then-branch: 13 | !(j@18@01 < |c@11@01|) | live]
; [else-branch: 13 | j@18@01 < |c@11@01| | live]
(push) ; 10
; [then-branch: 13 | !(j@18@01 < |c@11@01|)]
(assert (not (< j@18@01 (Seq_length c@11@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 13 | j@18@01 < |c@11@01|]
(assert (< j@18@01 (Seq_length c@11@01)))
; [eval] k != j
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< j@18@01 (Seq_length c@11@01)) (not (< j@18@01 (Seq_length c@11@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@18@01 0)
  (and
    (>= j@18@01 0)
    (or (< j@18@01 (Seq_length c@11@01)) (not (< j@18@01 (Seq_length c@11@01)))))))
(assert (or (>= j@18@01 0) (not (>= j@18@01 0))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< k@17@01 (Seq_length c@11@01))
  (and
    (< k@17@01 (Seq_length c@11@01))
    (=>
      (>= j@18@01 0)
      (and
        (>= j@18@01 0)
        (or
          (< j@18@01 (Seq_length c@11@01))
          (not (< j@18@01 (Seq_length c@11@01))))))
    (or (>= j@18@01 0) (not (>= j@18@01 0))))))
(assert (or (< k@17@01 (Seq_length c@11@01)) (not (< k@17@01 (Seq_length c@11@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= k@17@01 0)
  (and
    (>= k@17@01 0)
    (=>
      (< k@17@01 (Seq_length c@11@01))
      (and
        (< k@17@01 (Seq_length c@11@01))
        (=>
          (>= j@18@01 0)
          (and
            (>= j@18@01 0)
            (or
              (< j@18@01 (Seq_length c@11@01))
              (not (< j@18@01 (Seq_length c@11@01))))))
        (or (>= j@18@01 0) (not (>= j@18@01 0)))))
    (or (< k@17@01 (Seq_length c@11@01)) (not (< k@17@01 (Seq_length c@11@01)))))))
(assert (or (>= k@17@01 0) (not (>= k@17@01 0))))
(push) ; 3
; [then-branch: 14 | k@17@01 >= 0 && k@17@01 < |c@11@01| && j@18@01 >= 0 && j@18@01 < |c@11@01| && k@17@01 != j@18@01 | live]
; [else-branch: 14 | !(k@17@01 >= 0 && k@17@01 < |c@11@01| && j@18@01 >= 0 && j@18@01 < |c@11@01| && k@17@01 != j@18@01) | live]
(push) ; 4
; [then-branch: 14 | k@17@01 >= 0 && k@17@01 < |c@11@01| && j@18@01 >= 0 && j@18@01 < |c@11@01| && k@17@01 != j@18@01]
(assert (and
  (>= k@17@01 0)
  (and
    (< k@17@01 (Seq_length c@11@01))
    (and
      (>= j@18@01 0)
      (and (< j@18@01 (Seq_length c@11@01)) (not (= k@17@01 j@18@01)))))))
; [eval] c[k] != c[j]
; [eval] c[k]
; [eval] c[j]
(pop) ; 4
(push) ; 4
; [else-branch: 14 | !(k@17@01 >= 0 && k@17@01 < |c@11@01| && j@18@01 >= 0 && j@18@01 < |c@11@01| && k@17@01 != j@18@01)]
(assert (not
  (and
    (>= k@17@01 0)
    (and
      (< k@17@01 (Seq_length c@11@01))
      (and
        (>= j@18@01 0)
        (and (< j@18@01 (Seq_length c@11@01)) (not (= k@17@01 j@18@01))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (>= k@17@01 0)
    (and
      (< k@17@01 (Seq_length c@11@01))
      (and
        (>= j@18@01 0)
        (and (< j@18@01 (Seq_length c@11@01)) (not (= k@17@01 j@18@01))))))
  (and
    (>= k@17@01 0)
    (< k@17@01 (Seq_length c@11@01))
    (>= j@18@01 0)
    (< j@18@01 (Seq_length c@11@01))
    (not (= k@17@01 j@18@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= k@17@01 0)
      (and
        (< k@17@01 (Seq_length c@11@01))
        (and
          (>= j@18@01 0)
          (and (< j@18@01 (Seq_length c@11@01)) (not (= k@17@01 j@18@01)))))))
  (and
    (>= k@17@01 0)
    (and
      (< k@17@01 (Seq_length c@11@01))
      (and
        (>= j@18@01 0)
        (and (< j@18@01 (Seq_length c@11@01)) (not (= k@17@01 j@18@01))))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@17@01 Int) (j@18@01 Int)) (!
  (and
    (=>
      (>= k@17@01 0)
      (and
        (>= k@17@01 0)
        (=>
          (< k@17@01 (Seq_length c@11@01))
          (and
            (< k@17@01 (Seq_length c@11@01))
            (=>
              (>= j@18@01 0)
              (and
                (>= j@18@01 0)
                (or
                  (< j@18@01 (Seq_length c@11@01))
                  (not (< j@18@01 (Seq_length c@11@01))))))
            (or (>= j@18@01 0) (not (>= j@18@01 0)))))
        (or
          (< k@17@01 (Seq_length c@11@01))
          (not (< k@17@01 (Seq_length c@11@01))))))
    (or (>= k@17@01 0) (not (>= k@17@01 0)))
    (=>
      (and
        (>= k@17@01 0)
        (and
          (< k@17@01 (Seq_length c@11@01))
          (and
            (>= j@18@01 0)
            (and (< j@18@01 (Seq_length c@11@01)) (not (= k@17@01 j@18@01))))))
      (and
        (>= k@17@01 0)
        (< k@17@01 (Seq_length c@11@01))
        (>= j@18@01 0)
        (< j@18@01 (Seq_length c@11@01))
        (not (= k@17@01 j@18@01))))
    (or
      (not
        (and
          (>= k@17@01 0)
          (and
            (< k@17@01 (Seq_length c@11@01))
            (and
              (>= j@18@01 0)
              (and (< j@18@01 (Seq_length c@11@01)) (not (= k@17@01 j@18@01)))))))
      (and
        (>= k@17@01 0)
        (and
          (< k@17@01 (Seq_length c@11@01))
          (and
            (>= j@18@01 0)
            (and (< j@18@01 (Seq_length c@11@01)) (not (= k@17@01 j@18@01))))))))
  :pattern ((Seq_index c@11@01 k@17@01) (Seq_index c@11@01 j@18@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_backward_dep_drf_c.vpr@63@12@63@100-aux|)))
(assert (forall ((k@17@01 Int) (j@18@01 Int)) (!
  (=>
    (and
      (>= k@17@01 0)
      (and
        (< k@17@01 (Seq_length c@11@01))
        (and
          (>= j@18@01 0)
          (and (< j@18@01 (Seq_length c@11@01)) (not (= k@17@01 j@18@01))))))
    (not (= (Seq_index c@11@01 k@17@01) (Seq_index c@11@01 j@18@01))))
  :pattern ((Seq_index c@11@01 k@17@01) (Seq_index c@11@01 j@18@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_backward_dep_drf_c.vpr@63@12@63@100|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))
  $Snap.unit))
; [eval] N <= |a|
; [eval] |a|
(assert (<= N@10@01 (Seq_length a@9@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))))
(declare-const i@19@01 Int)
(push) ; 2
; [eval] 0 <= i && i < N
; [eval] 0 <= i
(push) ; 3
; [then-branch: 15 | !(0 <= i@19@01) | live]
; [else-branch: 15 | 0 <= i@19@01 | live]
(push) ; 4
; [then-branch: 15 | !(0 <= i@19@01)]
(assert (not (<= 0 i@19@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 15 | 0 <= i@19@01]
(assert (<= 0 i@19@01))
; [eval] i < N
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@19@01) (not (<= 0 i@19@01))))
(assert (and (<= 0 i@19@01) (< i@19@01 N@10@01)))
; [eval] a[i]
(push) ; 3
(assert (not (>= i@19@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@19@01 (Seq_length a@9@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@20@01 ($Ref) Int)
(declare-fun img@21@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@19@01 Int)) (!
  (=>
    (and (<= 0 i@19@01) (< i@19@01 N@10@01))
    (or (<= 0 i@19@01) (not (<= 0 i@19@01))))
  :pattern ((Seq_index a@9@01 i@19@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@19@01 Int) (i2@19@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@19@01) (< i1@19@01 N@10@01))
      (and (<= 0 i2@19@01) (< i2@19@01 N@10@01))
      (= (Seq_index a@9@01 i1@19@01) (Seq_index a@9@01 i2@19@01)))
    (= i1@19@01 i2@19@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@19@01 Int)) (!
  (=>
    (and (<= 0 i@19@01) (< i@19@01 N@10@01))
    (and
      (= (inv@20@01 (Seq_index a@9@01 i@19@01)) i@19@01)
      (img@21@01 (Seq_index a@9@01 i@19@01))))
  :pattern ((Seq_index a@9@01 i@19@01))
  :qid |quant-u-49|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@21@01 r) (and (<= 0 (inv@20@01 r)) (< (inv@20@01 r) N@10@01)))
    (= (Seq_index a@9@01 (inv@20@01 r)) r))
  :pattern ((inv@20@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@19@01 Int)) (!
  (=>
    (and (<= 0 i@19@01) (< i@19@01 N@10@01))
    (not (= (Seq_index a@9@01 i@19@01) $Ref.null)))
  :pattern ((Seq_index a@9@01 i@19@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))
  $Snap.unit))
; [eval] N <= |b|
; [eval] |b|
(assert (<= N@10@01 (Seq_length b@8@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))))))
(declare-const i@22@01 Int)
(push) ; 2
; [eval] 0 <= i && i < N
; [eval] 0 <= i
(push) ; 3
; [then-branch: 16 | !(0 <= i@22@01) | live]
; [else-branch: 16 | 0 <= i@22@01 | live]
(push) ; 4
; [then-branch: 16 | !(0 <= i@22@01)]
(assert (not (<= 0 i@22@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 16 | 0 <= i@22@01]
(assert (<= 0 i@22@01))
; [eval] i < N
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@22@01) (not (<= 0 i@22@01))))
(assert (and (<= 0 i@22@01) (< i@22@01 N@10@01)))
; [eval] b[i]
(push) ; 3
(assert (not (>= i@22@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@22@01 (Seq_length b@8@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@23@01 ($Ref) Int)
(declare-fun img@24@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@22@01 Int)) (!
  (=>
    (and (<= 0 i@22@01) (< i@22@01 N@10@01))
    (or (<= 0 i@22@01) (not (<= 0 i@22@01))))
  :pattern ((Seq_index b@8@01 i@22@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@22@01 Int) (i2@22@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@22@01) (< i1@22@01 N@10@01))
      (and (<= 0 i2@22@01) (< i2@22@01 N@10@01))
      (= (Seq_index b@8@01 i1@22@01) (Seq_index b@8@01 i2@22@01)))
    (= i1@22@01 i2@22@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@22@01 Int)) (!
  (=>
    (and (<= 0 i@22@01) (< i@22@01 N@10@01))
    (and
      (= (inv@23@01 (Seq_index b@8@01 i@22@01)) i@22@01)
      (img@24@01 (Seq_index b@8@01 i@22@01))))
  :pattern ((Seq_index b@8@01 i@22@01))
  :qid |quant-u-51|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@24@01 r) (and (<= 0 (inv@23@01 r)) (< (inv@23@01 r) N@10@01)))
    (= (Seq_index b@8@01 (inv@23@01 r)) r))
  :pattern ((inv@23@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@22@01 Int)) (!
  (=>
    (and (<= 0 i@22@01) (< i@22@01 N@10@01))
    (not (= (Seq_index b@8@01 i@22@01) $Ref.null)))
  :pattern ((Seq_index b@8@01 i@22@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 2
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index b@8@01 i@22@01) (Seq_index a@9@01 i@19@01))
    (=
      (and (img@24@01 r) (and (<= 0 (inv@23@01 r)) (< (inv@23@01 r) N@10@01)))
      (and (img@21@01 r) (and (<= 0 (inv@20@01 r)) (< (inv@20@01 r) N@10@01)))))
  
  :qid |quant-u-52|))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))))
  $Snap.unit))
; [eval] N <= |c|
; [eval] |c|
(assert (<= N@10@01 (Seq_length c@11@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))))))))
(declare-const i@25@01 Int)
(set-option :timeout 0)
(push) ; 2
; [eval] 0 <= i && i < N
; [eval] 0 <= i
(push) ; 3
; [then-branch: 17 | !(0 <= i@25@01) | live]
; [else-branch: 17 | 0 <= i@25@01 | live]
(push) ; 4
; [then-branch: 17 | !(0 <= i@25@01)]
(assert (not (<= 0 i@25@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 17 | 0 <= i@25@01]
(assert (<= 0 i@25@01))
; [eval] i < N
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@25@01) (not (<= 0 i@25@01))))
(assert (and (<= 0 i@25@01) (< i@25@01 N@10@01)))
; [eval] c[i]
(push) ; 3
(assert (not (>= i@25@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@25@01 (Seq_length c@11@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@26@01 ($Ref) Int)
(declare-fun img@27@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@25@01 Int)) (!
  (=>
    (and (<= 0 i@25@01) (< i@25@01 N@10@01))
    (or (<= 0 i@25@01) (not (<= 0 i@25@01))))
  :pattern ((Seq_index c@11@01 i@25@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@25@01 Int) (i2@25@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@25@01) (< i1@25@01 N@10@01))
      (and (<= 0 i2@25@01) (< i2@25@01 N@10@01))
      (= (Seq_index c@11@01 i1@25@01) (Seq_index c@11@01 i2@25@01)))
    (= i1@25@01 i2@25@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@25@01 Int)) (!
  (=>
    (and (<= 0 i@25@01) (< i@25@01 N@10@01))
    (and
      (= (inv@26@01 (Seq_index c@11@01 i@25@01)) i@25@01)
      (img@27@01 (Seq_index c@11@01 i@25@01))))
  :pattern ((Seq_index c@11@01 i@25@01))
  :qid |quant-u-54|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@27@01 r) (and (<= 0 (inv@26@01 r)) (< (inv@26@01 r) N@10@01)))
    (= (Seq_index c@11@01 (inv@26@01 r)) r))
  :pattern ((inv@26@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@25@01 Int)) (!
  (=>
    (and (<= 0 i@25@01) (< i@25@01 N@10@01))
    (not (= (Seq_index c@11@01 i@25@01) $Ref.null)))
  :pattern ((Seq_index c@11@01 i@25@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 2
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index c@11@01 i@25@01) (Seq_index b@8@01 i@22@01))
    (=
      (and (img@27@01 r) (and (<= 0 (inv@26@01 r)) (< (inv@26@01 r) N@10@01)))
      (and (img@24@01 r) (and (<= 0 (inv@23@01 r)) (< (inv@23@01 r) N@10@01)))))
  
  :qid |quant-u-55|))))
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
    (= (Seq_index c@11@01 i@25@01) (Seq_index a@9@01 i@19@01))
    (=
      (and (img@27@01 r) (and (<= 0 (inv@26@01 r)) (< (inv@26@01 r) N@10@01)))
      (and (img@21@01 r) (and (<= 0 (inv@20@01 r)) (< (inv@20@01 r) N@10@01)))))
  
  :qid |quant-u-56|))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))))))
; [eval] 0 <= 0 && 0 < N
; [eval] 0 <= 0
(set-option :timeout 0)
(push) ; 2
; [then-branch: 18 | False | live]
; [else-branch: 18 | True | live]
(push) ; 3
; [then-branch: 18 | False]
(assert false)
(pop) ; 3
(push) ; 3
; [else-branch: 18 | True]
; [eval] 0 < N
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(push) ; 2
(set-option :timeout 10)
(assert (not (not (< 0 N@10@01))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (< 0 N@10@01)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [then-branch: 19 | 0 < N@10@01 | live]
; [else-branch: 19 | !(0 < N@10@01) | live]
(set-option :timeout 0)
(push) ; 2
; [then-branch: 19 | 0 < N@10@01]
(assert (< 0 N@10@01))
; [eval] a[0]
(push) ; 3
(assert (not (< 0 (Seq_length a@9@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const sm@28@01 $FVF<Ref__Integer_value>)
; Definitional axioms for singleton-SM's value
(assert (=
  ($FVF.lookup_Ref__Integer_value (as sm@28@01  $FVF<Ref__Integer_value>) (Seq_index
    a@9@01
    0))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))))))
(assert (<=
  $Perm.No
  (ite
    (= (Seq_index a@9@01 0) (Seq_index a@9@01 0))
    (/ (to_real 1) (to_real 2))
    $Perm.No)))
(assert (<=
  (ite
    (= (Seq_index a@9@01 0) (Seq_index a@9@01 0))
    (/ (to_real 1) (to_real 2))
    $Perm.No)
  $Perm.Write))
(assert (=>
  (= (Seq_index a@9@01 0) (Seq_index a@9@01 0))
  (not (= (Seq_index a@9@01 0) $Ref.null))))
(declare-const i@29@01 Int)
(push) ; 3
; [eval] 1 <= i && i < (N - 1 < N ? N - 1 : N) + 1
; [eval] 1 <= i
(push) ; 4
; [then-branch: 20 | !(1 <= i@29@01) | live]
; [else-branch: 20 | 1 <= i@29@01 | live]
(push) ; 5
; [then-branch: 20 | !(1 <= i@29@01)]
(assert (not (<= 1 i@29@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 20 | 1 <= i@29@01]
(assert (<= 1 i@29@01))
; [eval] i < (N - 1 < N ? N - 1 : N) + 1
; [eval] (N - 1 < N ? N - 1 : N) + 1
; [eval] (N - 1 < N ? N - 1 : N)
; [eval] N - 1 < N
; [eval] N - 1
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (not (< (- N@10@01 1) N@10@01))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< (- N@10@01 1) N@10@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 21 | N@10@01 - 1 < N@10@01 | live]
; [else-branch: 21 | !(N@10@01 - 1 < N@10@01) | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 21 | N@10@01 - 1 < N@10@01]
(assert (< (- N@10@01 1) N@10@01))
; [eval] N - 1
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (< (- N@10@01 1) N@10@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=> (<= 1 i@29@01) (and (<= 1 i@29@01) (< (- N@10@01 1) N@10@01))))
(assert (or (<= 1 i@29@01) (not (<= 1 i@29@01))))
(assert (and (<= 1 i@29@01) (< i@29@01 (+ (- N@10@01 1) 1))))
; [eval] a[i]
(push) ; 4
(assert (not (>= i@29@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@29@01 (Seq_length a@9@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@30@01 ($Ref) Int)
(declare-fun img@31@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@29@01 Int)) (!
  (=>
    (and (<= 1 i@29@01) (< i@29@01 (+ (- N@10@01 1) 1)))
    (and
      (=> (<= 1 i@29@01) (and (<= 1 i@29@01) (< (- N@10@01 1) N@10@01)))
      (or (<= 1 i@29@01) (not (<= 1 i@29@01)))))
  :pattern ((Seq_index a@9@01 i@29@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@29@01 Int) (i2@29@01 Int)) (!
  (=>
    (and
      (and (<= 1 i1@29@01) (< i1@29@01 (+ (- N@10@01 1) 1)))
      (and (<= 1 i2@29@01) (< i2@29@01 (+ (- N@10@01 1) 1)))
      (= (Seq_index a@9@01 i1@29@01) (Seq_index a@9@01 i2@29@01)))
    (= i1@29@01 i2@29@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@29@01 Int)) (!
  (=>
    (and (<= 1 i@29@01) (< i@29@01 (+ (- N@10@01 1) 1)))
    (and
      (= (inv@30@01 (Seq_index a@9@01 i@29@01)) i@29@01)
      (img@31@01 (Seq_index a@9@01 i@29@01))))
  :pattern ((Seq_index a@9@01 i@29@01))
  :qid |quant-u-58|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@31@01 r)
      (and (<= 1 (inv@30@01 r)) (< (inv@30@01 r) (+ (- N@10@01 1) 1))))
    (= (Seq_index a@9@01 (inv@30@01 r)) r))
  :pattern ((inv@30@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@29@01 Int)) (!
  (=>
    (and (<= 1 i@29@01) (< i@29@01 (+ (- N@10@01 1) 1)))
    (not (= (Seq_index a@9@01 i@29@01) $Ref.null)))
  :pattern ((Seq_index a@9@01 i@29@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index a@9@01 i@29@01) (Seq_index c@11@01 i@25@01))
    (=
      (and
        (img@31@01 r)
        (and (<= 1 (inv@30@01 r)) (< (inv@30@01 r) (+ (- N@10@01 1) 1))))
      (and (img@27@01 r) (and (<= 0 (inv@26@01 r)) (< (inv@26@01 r) N@10@01)))))
  
  :qid |quant-u-59|))))
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
    (= (Seq_index a@9@01 i@29@01) (Seq_index b@8@01 i@22@01))
    (=
      (and
        (img@31@01 r)
        (and (<= 1 (inv@30@01 r)) (< (inv@30@01 r) (+ (- N@10@01 1) 1))))
      (and (img@24@01 r) (and (<= 0 (inv@23@01 r)) (< (inv@23@01 r) N@10@01)))))
  
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
    (= (Seq_index a@9@01 i@29@01) (Seq_index a@9@01 i@19@01))
    (=
      (and
        (img@31@01 r)
        (and (<= 1 (inv@30@01 r)) (< (inv@30@01 r) (+ (- N@10@01 1) 1))))
      (and (img@21@01 r) (and (<= 0 (inv@20@01 r)) (< (inv@20@01 r) N@10@01)))))
  
  :qid |quant-u-61|))))
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
(declare-const $t@32@01 $Snap)
(assert (= $t@32@01 ($Snap.combine ($Snap.first $t@32@01) ($Snap.second $t@32@01))))
(declare-const i@33@01 Int)
(push) ; 4
; [eval] 0 <= i && i < N
; [eval] 0 <= i
(push) ; 5
; [then-branch: 22 | !(0 <= i@33@01) | live]
; [else-branch: 22 | 0 <= i@33@01 | live]
(push) ; 6
; [then-branch: 22 | !(0 <= i@33@01)]
(assert (not (<= 0 i@33@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 22 | 0 <= i@33@01]
(assert (<= 0 i@33@01))
; [eval] i < N
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@33@01) (not (<= 0 i@33@01))))
(assert (and (<= 0 i@33@01) (< i@33@01 N@10@01)))
; [eval] a[i]
(push) ; 5
(assert (not (>= i@33@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@33@01 (Seq_length a@9@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@34@01 ($Ref) Int)
(declare-fun img@35@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@33@01 Int)) (!
  (=>
    (and (<= 0 i@33@01) (< i@33@01 N@10@01))
    (or (<= 0 i@33@01) (not (<= 0 i@33@01))))
  :pattern ((Seq_index a@9@01 i@33@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@33@01 Int) (i2@33@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@33@01) (< i1@33@01 N@10@01))
      (and (<= 0 i2@33@01) (< i2@33@01 N@10@01))
      (= (Seq_index a@9@01 i1@33@01) (Seq_index a@9@01 i2@33@01)))
    (= i1@33@01 i2@33@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@33@01 Int)) (!
  (=>
    (and (<= 0 i@33@01) (< i@33@01 N@10@01))
    (and
      (= (inv@34@01 (Seq_index a@9@01 i@33@01)) i@33@01)
      (img@35@01 (Seq_index a@9@01 i@33@01))))
  :pattern ((Seq_index a@9@01 i@33@01))
  :qid |quant-u-63|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@35@01 r) (and (<= 0 (inv@34@01 r)) (< (inv@34@01 r) N@10@01)))
    (= (Seq_index a@9@01 (inv@34@01 r)) r))
  :pattern ((inv@34@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@33@01 Int)) (!
  (=>
    (and (<= 0 i@33@01) (< i@33@01 N@10@01))
    (not (= (Seq_index a@9@01 i@33@01) $Ref.null)))
  :pattern ((Seq_index a@9@01 i@33@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(assert (=
  ($Snap.second $t@32@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@32@01))
    ($Snap.second ($Snap.second $t@32@01)))))
(declare-const i@36@01 Int)
(push) ; 4
; [eval] 0 <= i && i < N
; [eval] 0 <= i
(push) ; 5
; [then-branch: 23 | !(0 <= i@36@01) | live]
; [else-branch: 23 | 0 <= i@36@01 | live]
(push) ; 6
; [then-branch: 23 | !(0 <= i@36@01)]
(assert (not (<= 0 i@36@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 23 | 0 <= i@36@01]
(assert (<= 0 i@36@01))
; [eval] i < N
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@36@01) (not (<= 0 i@36@01))))
(assert (and (<= 0 i@36@01) (< i@36@01 N@10@01)))
; [eval] a[i]
(push) ; 5
(assert (not (>= i@36@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@36@01 (Seq_length a@9@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@37@01 ($Ref) Int)
(declare-fun img@38@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@36@01 Int)) (!
  (=>
    (and (<= 0 i@36@01) (< i@36@01 N@10@01))
    (or (<= 0 i@36@01) (not (<= 0 i@36@01))))
  :pattern ((Seq_index a@9@01 i@36@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@36@01 Int) (i2@36@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@36@01) (< i1@36@01 N@10@01))
      (and (<= 0 i2@36@01) (< i2@36@01 N@10@01))
      (= (Seq_index a@9@01 i1@36@01) (Seq_index a@9@01 i2@36@01)))
    (= i1@36@01 i2@36@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@36@01 Int)) (!
  (=>
    (and (<= 0 i@36@01) (< i@36@01 N@10@01))
    (and
      (= (inv@37@01 (Seq_index a@9@01 i@36@01)) i@36@01)
      (img@38@01 (Seq_index a@9@01 i@36@01))))
  :pattern ((Seq_index a@9@01 i@36@01))
  :qid |quant-u-65|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@38@01 r) (and (<= 0 (inv@37@01 r)) (< (inv@37@01 r) N@10@01)))
    (= (Seq_index a@9@01 (inv@37@01 r)) r))
  :pattern ((inv@37@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@36@01 Int)) (!
  (=>
    (and (<= 0 i@36@01) (< i@36@01 N@10@01))
    (not (= (Seq_index a@9@01 i@36@01) $Ref.null)))
  :pattern ((Seq_index a@9@01 i@36@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index a@9@01 i@36@01) (Seq_index a@9@01 i@33@01))
    (=
      (and (img@38@01 r) (and (<= 0 (inv@37@01 r)) (< (inv@37@01 r) N@10@01)))
      (and (img@35@01 r) (and (<= 0 (inv@34@01 r)) (< (inv@34@01 r) N@10@01)))))
  
  :qid |quant-u-66|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second $t@32@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@32@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@32@01))))))
(declare-const i@39@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] 0 <= i && i < N
; [eval] 0 <= i
(push) ; 5
; [then-branch: 24 | !(0 <= i@39@01) | live]
; [else-branch: 24 | 0 <= i@39@01 | live]
(push) ; 6
; [then-branch: 24 | !(0 <= i@39@01)]
(assert (not (<= 0 i@39@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 24 | 0 <= i@39@01]
(assert (<= 0 i@39@01))
; [eval] i < N
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@39@01) (not (<= 0 i@39@01))))
(assert (and (<= 0 i@39@01) (< i@39@01 N@10@01)))
; [eval] b[i]
(push) ; 5
(assert (not (>= i@39@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@39@01 (Seq_length b@8@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@40@01 ($Ref) Int)
(declare-fun img@41@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@39@01 Int)) (!
  (=>
    (and (<= 0 i@39@01) (< i@39@01 N@10@01))
    (or (<= 0 i@39@01) (not (<= 0 i@39@01))))
  :pattern ((Seq_index b@8@01 i@39@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@39@01 Int) (i2@39@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@39@01) (< i1@39@01 N@10@01))
      (and (<= 0 i2@39@01) (< i2@39@01 N@10@01))
      (= (Seq_index b@8@01 i1@39@01) (Seq_index b@8@01 i2@39@01)))
    (= i1@39@01 i2@39@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@39@01 Int)) (!
  (=>
    (and (<= 0 i@39@01) (< i@39@01 N@10@01))
    (and
      (= (inv@40@01 (Seq_index b@8@01 i@39@01)) i@39@01)
      (img@41@01 (Seq_index b@8@01 i@39@01))))
  :pattern ((Seq_index b@8@01 i@39@01))
  :qid |quant-u-68|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@41@01 r) (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) N@10@01)))
    (= (Seq_index b@8@01 (inv@40@01 r)) r))
  :pattern ((inv@40@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@39@01 Int)) (!
  (=>
    (and (<= 0 i@39@01) (< i@39@01 N@10@01))
    (not (= (Seq_index b@8@01 i@39@01) $Ref.null)))
  :pattern ((Seq_index b@8@01 i@39@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index b@8@01 i@39@01) (Seq_index a@9@01 i@36@01))
    (=
      (and (img@41@01 r) (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) N@10@01)))
      (and (img@38@01 r) (and (<= 0 (inv@37@01 r)) (< (inv@37@01 r) N@10@01)))))
  
  :qid |quant-u-69|))))
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
    (= (Seq_index b@8@01 i@39@01) (Seq_index a@9@01 i@33@01))
    (=
      (and (img@41@01 r) (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) N@10@01)))
      (and (img@35@01 r) (and (<= 0 (inv@34@01 r)) (< (inv@34@01 r) N@10@01)))))
  
  :qid |quant-u-70|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(declare-const i@42@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] 0 <= i && i < N
; [eval] 0 <= i
(push) ; 5
; [then-branch: 25 | !(0 <= i@42@01) | live]
; [else-branch: 25 | 0 <= i@42@01 | live]
(push) ; 6
; [then-branch: 25 | !(0 <= i@42@01)]
(assert (not (<= 0 i@42@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 25 | 0 <= i@42@01]
(assert (<= 0 i@42@01))
; [eval] i < N
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@42@01) (not (<= 0 i@42@01))))
(assert (and (<= 0 i@42@01) (< i@42@01 N@10@01)))
; [eval] c[i]
(push) ; 5
(assert (not (>= i@42@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@42@01 (Seq_length c@11@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@43@01 ($Ref) Int)
(declare-fun img@44@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@42@01 Int)) (!
  (=>
    (and (<= 0 i@42@01) (< i@42@01 N@10@01))
    (or (<= 0 i@42@01) (not (<= 0 i@42@01))))
  :pattern ((Seq_index c@11@01 i@42@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@42@01 Int) (i2@42@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@42@01) (< i1@42@01 N@10@01))
      (and (<= 0 i2@42@01) (< i2@42@01 N@10@01))
      (= (Seq_index c@11@01 i1@42@01) (Seq_index c@11@01 i2@42@01)))
    (= i1@42@01 i2@42@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@42@01 Int)) (!
  (=>
    (and (<= 0 i@42@01) (< i@42@01 N@10@01))
    (and
      (= (inv@43@01 (Seq_index c@11@01 i@42@01)) i@42@01)
      (img@44@01 (Seq_index c@11@01 i@42@01))))
  :pattern ((Seq_index c@11@01 i@42@01))
  :qid |quant-u-72|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@44@01 r) (and (<= 0 (inv@43@01 r)) (< (inv@43@01 r) N@10@01)))
    (= (Seq_index c@11@01 (inv@43@01 r)) r))
  :pattern ((inv@43@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@42@01 Int)) (!
  (=>
    (and (<= 0 i@42@01) (< i@42@01 N@10@01))
    (not (= (Seq_index c@11@01 i@42@01) $Ref.null)))
  :pattern ((Seq_index c@11@01 i@42@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index c@11@01 i@42@01) (Seq_index b@8@01 i@39@01))
    (=
      (and (img@44@01 r) (and (<= 0 (inv@43@01 r)) (< (inv@43@01 r) N@10@01)))
      (and (img@41@01 r) (and (<= 0 (inv@40@01 r)) (< (inv@40@01 r) N@10@01)))))
  
  :qid |quant-u-73|))))
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
    (= (Seq_index c@11@01 i@42@01) (Seq_index a@9@01 i@36@01))
    (=
      (and (img@44@01 r) (and (<= 0 (inv@43@01 r)) (< (inv@43@01 r) N@10@01)))
      (and (img@38@01 r) (and (<= 0 (inv@37@01 r)) (< (inv@37@01 r) N@10@01)))))
  
  :qid |quant-u-74|))))
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
    (= (Seq_index c@11@01 i@42@01) (Seq_index a@9@01 i@33@01))
    (=
      (and (img@44@01 r) (and (<= 0 (inv@43@01 r)) (< (inv@43@01 r) N@10@01)))
      (and (img@35@01 r) (and (<= 0 (inv@34@01 r)) (< (inv@34@01 r) N@10@01)))))
  
  :qid |quant-u-75|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
; [exec]
; inhale false
(pop) ; 3
(pop) ; 2
(push) ; 2
; [else-branch: 19 | !(0 < N@10@01)]
(assert (not (< 0 N@10@01)))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))))))
  $Snap.unit))
(declare-const i@45@01 Int)
(push) ; 3
; [eval] 1 <= i && i < (N - 1 < N ? N - 1 : N) + 1
; [eval] 1 <= i
(push) ; 4
; [then-branch: 26 | !(1 <= i@45@01) | live]
; [else-branch: 26 | 1 <= i@45@01 | live]
(push) ; 5
; [then-branch: 26 | !(1 <= i@45@01)]
(assert (not (<= 1 i@45@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 26 | 1 <= i@45@01]
(assert (<= 1 i@45@01))
; [eval] i < (N - 1 < N ? N - 1 : N) + 1
; [eval] (N - 1 < N ? N - 1 : N) + 1
; [eval] (N - 1 < N ? N - 1 : N)
; [eval] N - 1 < N
; [eval] N - 1
(push) ; 6
(push) ; 7
(set-option :timeout 10)
(assert (not (not (< (- N@10@01 1) N@10@01))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (< (- N@10@01 1) N@10@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [then-branch: 27 | N@10@01 - 1 < N@10@01 | live]
; [else-branch: 27 | !(N@10@01 - 1 < N@10@01) | dead]
(set-option :timeout 0)
(push) ; 7
; [then-branch: 27 | N@10@01 - 1 < N@10@01]
(assert (< (- N@10@01 1) N@10@01))
; [eval] N - 1
(pop) ; 7
(pop) ; 6
; Joined path conditions
(assert (< (- N@10@01 1) N@10@01))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=> (<= 1 i@45@01) (and (<= 1 i@45@01) (< (- N@10@01 1) N@10@01))))
(assert (or (<= 1 i@45@01) (not (<= 1 i@45@01))))
(assert (and (<= 1 i@45@01) (< i@45@01 (+ (- N@10@01 1) 1))))
; [eval] a[i]
(push) ; 4
(assert (not (>= i@45@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@45@01 (Seq_length a@9@01))))
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
(assert (forall ((i@45@01 Int)) (!
  (=>
    (and (<= 1 i@45@01) (< i@45@01 (+ (- N@10@01 1) 1)))
    (and
      (=> (<= 1 i@45@01) (and (<= 1 i@45@01) (< (- N@10@01 1) N@10@01)))
      (or (<= 1 i@45@01) (not (<= 1 i@45@01)))))
  :pattern ((Seq_index a@9@01 i@45@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@45@01 Int) (i2@45@01 Int)) (!
  (=>
    (and
      (and (<= 1 i1@45@01) (< i1@45@01 (+ (- N@10@01 1) 1)))
      (and (<= 1 i2@45@01) (< i2@45@01 (+ (- N@10@01 1) 1)))
      (= (Seq_index a@9@01 i1@45@01) (Seq_index a@9@01 i2@45@01)))
    (= i1@45@01 i2@45@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@45@01 Int)) (!
  (=>
    (and (<= 1 i@45@01) (< i@45@01 (+ (- N@10@01 1) 1)))
    (and
      (= (inv@46@01 (Seq_index a@9@01 i@45@01)) i@45@01)
      (img@47@01 (Seq_index a@9@01 i@45@01))))
  :pattern ((Seq_index a@9@01 i@45@01))
  :qid |quant-u-77|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@47@01 r)
      (and (<= 1 (inv@46@01 r)) (< (inv@46@01 r) (+ (- N@10@01 1) 1))))
    (= (Seq_index a@9@01 (inv@46@01 r)) r))
  :pattern ((inv@46@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@45@01 Int)) (!
  (=>
    (and (<= 1 i@45@01) (< i@45@01 (+ (- N@10@01 1) 1)))
    (not (= (Seq_index a@9@01 i@45@01) $Ref.null)))
  :pattern ((Seq_index a@9@01 i@45@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index a@9@01 i@45@01) (Seq_index c@11@01 i@25@01))
    (=
      (and
        (img@47@01 r)
        (and (<= 1 (inv@46@01 r)) (< (inv@46@01 r) (+ (- N@10@01 1) 1))))
      (and (img@27@01 r) (and (<= 0 (inv@26@01 r)) (< (inv@26@01 r) N@10@01)))))
  
  :qid |quant-u-78|))))
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
    (= (Seq_index a@9@01 i@45@01) (Seq_index b@8@01 i@22@01))
    (=
      (and
        (img@47@01 r)
        (and (<= 1 (inv@46@01 r)) (< (inv@46@01 r) (+ (- N@10@01 1) 1))))
      (and (img@24@01 r) (and (<= 0 (inv@23@01 r)) (< (inv@23@01 r) N@10@01)))))
  
  :qid |quant-u-79|))))
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
    (= (Seq_index a@9@01 i@45@01) (Seq_index a@9@01 i@19@01))
    (=
      (and
        (img@47@01 r)
        (and (<= 1 (inv@46@01 r)) (< (inv@46@01 r) (+ (- N@10@01 1) 1))))
      (and (img@21@01 r) (and (<= 0 (inv@20@01 r)) (< (inv@20@01 r) N@10@01)))))
  
  :qid |quant-u-80|))))
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
(declare-const $t@48@01 $Snap)
(assert (= $t@48@01 ($Snap.combine ($Snap.first $t@48@01) ($Snap.second $t@48@01))))
(declare-const i@49@01 Int)
(push) ; 4
; [eval] 0 <= i && i < N
; [eval] 0 <= i
(push) ; 5
; [then-branch: 28 | !(0 <= i@49@01) | live]
; [else-branch: 28 | 0 <= i@49@01 | live]
(push) ; 6
; [then-branch: 28 | !(0 <= i@49@01)]
(assert (not (<= 0 i@49@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 28 | 0 <= i@49@01]
(assert (<= 0 i@49@01))
; [eval] i < N
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@49@01) (not (<= 0 i@49@01))))
(assert (and (<= 0 i@49@01) (< i@49@01 N@10@01)))
; [eval] a[i]
(push) ; 5
(assert (not (>= i@49@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@49@01 (Seq_length a@9@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@50@01 ($Ref) Int)
(declare-fun img@51@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@49@01 Int)) (!
  (=>
    (and (<= 0 i@49@01) (< i@49@01 N@10@01))
    (or (<= 0 i@49@01) (not (<= 0 i@49@01))))
  :pattern ((Seq_index a@9@01 i@49@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@49@01 Int) (i2@49@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@49@01) (< i1@49@01 N@10@01))
      (and (<= 0 i2@49@01) (< i2@49@01 N@10@01))
      (= (Seq_index a@9@01 i1@49@01) (Seq_index a@9@01 i2@49@01)))
    (= i1@49@01 i2@49@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@49@01 Int)) (!
  (=>
    (and (<= 0 i@49@01) (< i@49@01 N@10@01))
    (and
      (= (inv@50@01 (Seq_index a@9@01 i@49@01)) i@49@01)
      (img@51@01 (Seq_index a@9@01 i@49@01))))
  :pattern ((Seq_index a@9@01 i@49@01))
  :qid |quant-u-82|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@51@01 r) (and (<= 0 (inv@50@01 r)) (< (inv@50@01 r) N@10@01)))
    (= (Seq_index a@9@01 (inv@50@01 r)) r))
  :pattern ((inv@50@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@49@01 Int)) (!
  (=>
    (and (<= 0 i@49@01) (< i@49@01 N@10@01))
    (not (= (Seq_index a@9@01 i@49@01) $Ref.null)))
  :pattern ((Seq_index a@9@01 i@49@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(assert (=
  ($Snap.second $t@48@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@48@01))
    ($Snap.second ($Snap.second $t@48@01)))))
(declare-const i@52@01 Int)
(push) ; 4
; [eval] 0 <= i && i < N
; [eval] 0 <= i
(push) ; 5
; [then-branch: 29 | !(0 <= i@52@01) | live]
; [else-branch: 29 | 0 <= i@52@01 | live]
(push) ; 6
; [then-branch: 29 | !(0 <= i@52@01)]
(assert (not (<= 0 i@52@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 29 | 0 <= i@52@01]
(assert (<= 0 i@52@01))
; [eval] i < N
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@52@01) (not (<= 0 i@52@01))))
(assert (and (<= 0 i@52@01) (< i@52@01 N@10@01)))
; [eval] a[i]
(push) ; 5
(assert (not (>= i@52@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@52@01 (Seq_length a@9@01))))
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
    (and (<= 0 i@52@01) (< i@52@01 N@10@01))
    (or (<= 0 i@52@01) (not (<= 0 i@52@01))))
  :pattern ((Seq_index a@9@01 i@52@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@52@01 Int) (i2@52@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@52@01) (< i1@52@01 N@10@01))
      (and (<= 0 i2@52@01) (< i2@52@01 N@10@01))
      (= (Seq_index a@9@01 i1@52@01) (Seq_index a@9@01 i2@52@01)))
    (= i1@52@01 i2@52@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@52@01 Int)) (!
  (=>
    (and (<= 0 i@52@01) (< i@52@01 N@10@01))
    (and
      (= (inv@53@01 (Seq_index a@9@01 i@52@01)) i@52@01)
      (img@54@01 (Seq_index a@9@01 i@52@01))))
  :pattern ((Seq_index a@9@01 i@52@01))
  :qid |quant-u-84|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@54@01 r) (and (<= 0 (inv@53@01 r)) (< (inv@53@01 r) N@10@01)))
    (= (Seq_index a@9@01 (inv@53@01 r)) r))
  :pattern ((inv@53@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@52@01 Int)) (!
  (=>
    (and (<= 0 i@52@01) (< i@52@01 N@10@01))
    (not (= (Seq_index a@9@01 i@52@01) $Ref.null)))
  :pattern ((Seq_index a@9@01 i@52@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index a@9@01 i@52@01) (Seq_index a@9@01 i@49@01))
    (=
      (and (img@54@01 r) (and (<= 0 (inv@53@01 r)) (< (inv@53@01 r) N@10@01)))
      (and (img@51@01 r) (and (<= 0 (inv@50@01 r)) (< (inv@50@01 r) N@10@01)))))
  
  :qid |quant-u-85|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second $t@48@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@48@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@48@01))))))
(declare-const i@55@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] 0 <= i && i < N
; [eval] 0 <= i
(push) ; 5
; [then-branch: 30 | !(0 <= i@55@01) | live]
; [else-branch: 30 | 0 <= i@55@01 | live]
(push) ; 6
; [then-branch: 30 | !(0 <= i@55@01)]
(assert (not (<= 0 i@55@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 30 | 0 <= i@55@01]
(assert (<= 0 i@55@01))
; [eval] i < N
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@55@01) (not (<= 0 i@55@01))))
(assert (and (<= 0 i@55@01) (< i@55@01 N@10@01)))
; [eval] b[i]
(push) ; 5
(assert (not (>= i@55@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@55@01 (Seq_length b@8@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@56@01 ($Ref) Int)
(declare-fun img@57@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@55@01 Int)) (!
  (=>
    (and (<= 0 i@55@01) (< i@55@01 N@10@01))
    (or (<= 0 i@55@01) (not (<= 0 i@55@01))))
  :pattern ((Seq_index b@8@01 i@55@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@55@01 Int) (i2@55@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@55@01) (< i1@55@01 N@10@01))
      (and (<= 0 i2@55@01) (< i2@55@01 N@10@01))
      (= (Seq_index b@8@01 i1@55@01) (Seq_index b@8@01 i2@55@01)))
    (= i1@55@01 i2@55@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@55@01 Int)) (!
  (=>
    (and (<= 0 i@55@01) (< i@55@01 N@10@01))
    (and
      (= (inv@56@01 (Seq_index b@8@01 i@55@01)) i@55@01)
      (img@57@01 (Seq_index b@8@01 i@55@01))))
  :pattern ((Seq_index b@8@01 i@55@01))
  :qid |quant-u-87|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@57@01 r) (and (<= 0 (inv@56@01 r)) (< (inv@56@01 r) N@10@01)))
    (= (Seq_index b@8@01 (inv@56@01 r)) r))
  :pattern ((inv@56@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@55@01 Int)) (!
  (=>
    (and (<= 0 i@55@01) (< i@55@01 N@10@01))
    (not (= (Seq_index b@8@01 i@55@01) $Ref.null)))
  :pattern ((Seq_index b@8@01 i@55@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index b@8@01 i@55@01) (Seq_index a@9@01 i@52@01))
    (=
      (and (img@57@01 r) (and (<= 0 (inv@56@01 r)) (< (inv@56@01 r) N@10@01)))
      (and (img@54@01 r) (and (<= 0 (inv@53@01 r)) (< (inv@53@01 r) N@10@01)))))
  
  :qid |quant-u-88|))))
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
    (= (Seq_index b@8@01 i@55@01) (Seq_index a@9@01 i@49@01))
    (=
      (and (img@57@01 r) (and (<= 0 (inv@56@01 r)) (< (inv@56@01 r) N@10@01)))
      (and (img@51@01 r) (and (<= 0 (inv@50@01 r)) (< (inv@50@01 r) N@10@01)))))
  
  :qid |quant-u-89|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(declare-const i@58@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] 0 <= i && i < N
; [eval] 0 <= i
(push) ; 5
; [then-branch: 31 | !(0 <= i@58@01) | live]
; [else-branch: 31 | 0 <= i@58@01 | live]
(push) ; 6
; [then-branch: 31 | !(0 <= i@58@01)]
(assert (not (<= 0 i@58@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 31 | 0 <= i@58@01]
(assert (<= 0 i@58@01))
; [eval] i < N
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@58@01) (not (<= 0 i@58@01))))
(assert (and (<= 0 i@58@01) (< i@58@01 N@10@01)))
; [eval] c[i]
(push) ; 5
(assert (not (>= i@58@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@58@01 (Seq_length c@11@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@59@01 ($Ref) Int)
(declare-fun img@60@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@58@01 Int)) (!
  (=>
    (and (<= 0 i@58@01) (< i@58@01 N@10@01))
    (or (<= 0 i@58@01) (not (<= 0 i@58@01))))
  :pattern ((Seq_index c@11@01 i@58@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@58@01 Int) (i2@58@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@58@01) (< i1@58@01 N@10@01))
      (and (<= 0 i2@58@01) (< i2@58@01 N@10@01))
      (= (Seq_index c@11@01 i1@58@01) (Seq_index c@11@01 i2@58@01)))
    (= i1@58@01 i2@58@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@58@01 Int)) (!
  (=>
    (and (<= 0 i@58@01) (< i@58@01 N@10@01))
    (and
      (= (inv@59@01 (Seq_index c@11@01 i@58@01)) i@58@01)
      (img@60@01 (Seq_index c@11@01 i@58@01))))
  :pattern ((Seq_index c@11@01 i@58@01))
  :qid |quant-u-91|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@60@01 r) (and (<= 0 (inv@59@01 r)) (< (inv@59@01 r) N@10@01)))
    (= (Seq_index c@11@01 (inv@59@01 r)) r))
  :pattern ((inv@59@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@58@01 Int)) (!
  (=>
    (and (<= 0 i@58@01) (< i@58@01 N@10@01))
    (not (= (Seq_index c@11@01 i@58@01) $Ref.null)))
  :pattern ((Seq_index c@11@01 i@58@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index c@11@01 i@58@01) (Seq_index b@8@01 i@55@01))
    (=
      (and (img@60@01 r) (and (<= 0 (inv@59@01 r)) (< (inv@59@01 r) N@10@01)))
      (and (img@57@01 r) (and (<= 0 (inv@56@01 r)) (< (inv@56@01 r) N@10@01)))))
  
  :qid |quant-u-92|))))
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
    (= (Seq_index c@11@01 i@58@01) (Seq_index a@9@01 i@52@01))
    (=
      (and (img@60@01 r) (and (<= 0 (inv@59@01 r)) (< (inv@59@01 r) N@10@01)))
      (and (img@54@01 r) (and (<= 0 (inv@53@01 r)) (< (inv@53@01 r) N@10@01)))))
  
  :qid |quant-u-93|))))
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
    (= (Seq_index c@11@01 i@58@01) (Seq_index a@9@01 i@49@01))
    (=
      (and (img@60@01 r) (and (<= 0 (inv@59@01 r)) (< (inv@59@01 r) N@10@01)))
      (and (img@51@01 r) (and (<= 0 (inv@50@01 r)) (< (inv@50@01 r) N@10@01)))))
  
  :qid |quant-u-94|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
; [exec]
; inhale false
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- Ref__recv_body_115 ----------
(declare-const diz@61@01 $Ref)
(declare-const current_thread_id@62@01 Int)
(declare-const a@63@01 Seq<$Ref>)
(declare-const i@64@01 Int)
(declare-const diz@65@01 $Ref)
(declare-const current_thread_id@66@01 Int)
(declare-const a@67@01 Seq<$Ref>)
(declare-const i@68@01 Int)
(push) ; 1
(declare-const $t@69@01 $Snap)
(assert (= $t@69@01 ($Snap.combine ($Snap.first $t@69@01) ($Snap.second $t@69@01))))
(assert (= ($Snap.first $t@69@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@65@01 $Ref.null)))
(assert (=
  ($Snap.second $t@69@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@69@01))
    ($Snap.second ($Snap.second $t@69@01)))))
(assert (= ($Snap.first ($Snap.second $t@69@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@66@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@69@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@69@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@69@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@69@01))) $Snap.unit))
; [eval] 0 <= i
(assert (<= 0 i@68@01))
(assert (= ($Snap.second ($Snap.second ($Snap.second $t@69@01))) $Snap.unit))
; [eval] i < |a|
; [eval] |a|
(assert (< i@68@01 (Seq_length a@67@01)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
; [eval] a[i]
(push) ; 3
(assert (not (>= i@68@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const $t@70@01 Int)
(assert (not (= (Seq_index a@67@01 i@68@01) $Ref.null)))
(pop) ; 2
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Ref__send_body_125 ----------
(declare-const diz@71@01 $Ref)
(declare-const current_thread_id@72@01 Int)
(declare-const a@73@01 Seq<$Ref>)
(declare-const i@74@01 Int)
(declare-const diz@75@01 $Ref)
(declare-const current_thread_id@76@01 Int)
(declare-const a@77@01 Seq<$Ref>)
(declare-const i@78@01 Int)
(push) ; 1
(declare-const $t@79@01 $Snap)
(assert (= $t@79@01 ($Snap.combine ($Snap.first $t@79@01) ($Snap.second $t@79@01))))
(assert (= ($Snap.first $t@79@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@75@01 $Ref.null)))
(assert (=
  ($Snap.second $t@79@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@79@01))
    ($Snap.second ($Snap.second $t@79@01)))))
(assert (= ($Snap.first ($Snap.second $t@79@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@76@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@79@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@79@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@79@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@79@01))) $Snap.unit))
; [eval] -1 <= i
; [eval] -1
(assert (<= (- 0 1) i@78@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@79@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@79@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@79@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@79@01))))
  $Snap.unit))
; [eval] i + 1 < |a|
; [eval] i + 1
; [eval] |a|
(assert (< (+ i@78@01 1) (Seq_length a@77@01)))
; [eval] a[i + 1]
; [eval] i + 1
(push) ; 2
(assert (not (>= (+ i@78@01 1) 0)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= (Seq_index a@77@01 (+ i@78@01 1)) $Ref.null)))
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
; ---------- Ref__loop_body_45 ----------
(declare-const diz@80@01 $Ref)
(declare-const current_thread_id@81@01 Int)
(declare-const b@82@01 Seq<$Ref>)
(declare-const a@83@01 Seq<$Ref>)
(declare-const i@84@01 Int)
(declare-const N@85@01 Int)
(declare-const c@86@01 Seq<$Ref>)
(declare-const diz@87@01 $Ref)
(declare-const current_thread_id@88@01 Int)
(declare-const b@89@01 Seq<$Ref>)
(declare-const a@90@01 Seq<$Ref>)
(declare-const i@91@01 Int)
(declare-const N@92@01 Int)
(declare-const c@93@01 Seq<$Ref>)
(push) ; 1
(declare-const $t@94@01 $Snap)
(assert (= $t@94@01 ($Snap.combine ($Snap.first $t@94@01) ($Snap.second $t@94@01))))
(assert (= ($Snap.first $t@94@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@87@01 $Ref.null)))
(assert (=
  ($Snap.second $t@94@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@94@01))
    ($Snap.second ($Snap.second $t@94@01)))))
(assert (= ($Snap.first ($Snap.second $t@94@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@88@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@94@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@94@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@94@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@94@01))) $Snap.unit))
; [eval] 0 <= i
(assert (<= 0 i@91@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@94@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@94@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@94@01))))
  $Snap.unit))
; [eval] i < N
(assert (< i@91@01 N@92@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))
  $Snap.unit))
; [eval] N <= |a|
; [eval] |a|
(assert (<= N@92@01 (Seq_length a@90@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01))))))
  $Snap.unit))
; [eval] N <= |b|
; [eval] |b|
(assert (<= N@92@01 (Seq_length b@89@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))))
  $Snap.unit))
; [eval] N <= |c|
; [eval] |c|
(assert (<= N@92@01 (Seq_length c@93@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))))))))
; [eval] a[i]
(push) ; 2
(assert (not (>= i@91@01 0)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(push) ; 2
(assert (not (< i@91@01 (Seq_length a@90@01))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= (Seq_index a@90@01 i@91@01) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01))))))))))))
; [eval] b[i]
(push) ; 2
(assert (not (>= i@91@01 0)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(push) ; 2
(assert (not (< i@91@01 (Seq_length b@89@01))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(push) ; 2
(set-option :timeout 10)
(assert (not (= (Seq_index a@90@01 i@91@01) (Seq_index b@89@01 i@91@01))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= (Seq_index b@89@01 i@91@01) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))))))))))
; [eval] c[i]
(set-option :timeout 0)
(push) ; 2
(assert (not (>= i@91@01 0)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(push) ; 2
(assert (not (< i@91@01 (Seq_length c@93@01))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(push) ; 2
(set-option :timeout 10)
(assert (not (= (Seq_index b@89@01 i@91@01) (Seq_index c@93@01 i@91@01))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (= (Seq_index a@90@01 i@91@01) (Seq_index c@93@01 i@91@01))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= (Seq_index c@93@01 i@91@01) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01))))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01))))))))))))))
; [eval] i == 0
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (not (= i@91@01 0))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (= i@91@01 0)))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; [then-branch: 32 | i@91@01 == 0 | live]
; [else-branch: 32 | i@91@01 != 0 | live]
(set-option :timeout 0)
(push) ; 2
; [then-branch: 32 | i@91@01 == 0]
(assert (= i@91@01 0))
; [eval] a[i]
(push) ; 3
(assert (not (>= i@91@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@91@01 (Seq_length a@90@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))))))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01))))))))))))))
; [eval] i < N - 1
; [eval] N - 1
(push) ; 3
(set-option :timeout 10)
(assert (not (not (< i@91@01 (- N@92@01 1)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< i@91@01 (- N@92@01 1))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 33 | i@91@01 < N@92@01 - 1 | live]
; [else-branch: 33 | !(i@91@01 < N@92@01 - 1) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 33 | i@91@01 < N@92@01 - 1]
(assert (< i@91@01 (- N@92@01 1)))
; [eval] a[i + 1]
; [eval] i + 1
(push) ; 4
(assert (not (>= (+ i@91@01 1) 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< (+ i@91@01 1) (Seq_length a@90@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (Seq_index a@90@01 i@91@01) (Seq_index a@90@01 (+ i@91@01 1)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (Seq_index c@93@01 i@91@01) (Seq_index a@90@01 (+ i@91@01 1)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (Seq_index b@89@01 i@91@01) (Seq_index a@90@01 (+ i@91@01 1)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (not (= (Seq_index a@90@01 (+ i@91@01 1)) $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(declare-const $t@95@01 $Snap)
(assert (= $t@95@01 ($Snap.combine ($Snap.first $t@95@01) ($Snap.second $t@95@01))))
(assert (= ($Snap.first $t@95@01) $Snap.unit))
; [eval] 0 <= i
(assert (=
  ($Snap.second $t@95@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@95@01))
    ($Snap.second ($Snap.second $t@95@01)))))
(assert (= ($Snap.first ($Snap.second $t@95@01)) $Snap.unit))
; [eval] i < N
(assert (=
  ($Snap.second ($Snap.second $t@95@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@95@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@95@01))))))
; [eval] a[i]
(push) ; 5
(assert (not (>= i@91@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@91@01 (Seq_length a@90@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@95@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@95@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@95@01)))))))
; [eval] a[i]
(push) ; 5
(assert (not (>= i@91@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@91@01 (Seq_length a@90@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@95@01))))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@95@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@95@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@95@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@95@01))))))))
; [eval] b[i]
(push) ; 5
(assert (not (>= i@91@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@91@01 (Seq_length b@89@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index a@90@01 i@91@01) (Seq_index b@89@01 i@91@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] c[i]
(set-option :timeout 0)
(push) ; 5
(assert (not (>= i@91@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@91@01 (Seq_length c@93@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index b@89@01 i@91@01) (Seq_index c@93@01 i@91@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index a@90@01 i@91@01) (Seq_index c@93@01 i@91@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [exec]
; var __flatten_5: Ref
(declare-const __flatten_5@96@01 $Ref)
; [exec]
; var __flatten_6: Int
(declare-const __flatten_6@97@01 Int)
; [exec]
; var __flatten_7: Ref
(declare-const __flatten_7@98@01 $Ref)
; [exec]
; var __flatten_8: Ref
(declare-const __flatten_8@99@01 $Ref)
; [exec]
; var __flatten_9: Int
(declare-const __flatten_9@100@01 Int)
; [exec]
; var __flatten_10: Ref
(declare-const __flatten_10@101@01 $Ref)
; [eval] i > 0
(push) ; 5
(set-option :timeout 10)
(assert (not (not (> i@91@01 0))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 34 | i@91@01 > 0 | dead]
; [else-branch: 34 | !(i@91@01 > 0) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 34 | !(i@91@01 > 0)]
(assert (not (> i@91@01 0)))
(pop) ; 5
; [eval] !(i > 0)
; [eval] i > 0
(push) ; 5
(set-option :timeout 10)
(assert (not (> i@91@01 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (> i@91@01 0))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 35 | !(i@91@01 > 0) | live]
; [else-branch: 35 | i@91@01 > 0 | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 35 | !(i@91@01 > 0)]
(assert (not (> i@91@01 0)))
; [exec]
; __flatten_5 := a[i]
; [eval] a[i]
(push) ; 6
(assert (not (>= i@91@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@91@01 (Seq_length a@90@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_5@102@01 $Ref)
(assert (= __flatten_5@102@01 (Seq_index a@90@01 i@91@01)))
; [exec]
; __flatten_7 := b[i]
; [eval] b[i]
(push) ; 6
(assert (not (>= i@91@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@91@01 (Seq_length b@89@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_7@103@01 $Ref)
(assert (= __flatten_7@103@01 (Seq_index b@89@01 i@91@01)))
; [exec]
; __flatten_6 := __flatten_7.Ref__Integer_value + 1
; [eval] __flatten_7.Ref__Integer_value + 1
(push) ; 6
(set-option :timeout 10)
(assert (not (= (Seq_index a@90@01 (+ i@91@01 1)) __flatten_7@103@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= (Seq_index a@90@01 i@91@01) __flatten_7@103@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= (Seq_index c@93@01 i@91@01) __flatten_7@103@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= (Seq_index b@89@01 i@91@01) __flatten_7@103@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_6@104@01 Int)
(assert (=
  __flatten_6@104@01
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01))))))))))
    1)))
; [exec]
; __flatten_5.Ref__Integer_value := __flatten_6
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= (Seq_index a@90@01 (+ i@91@01 1)) __flatten_5@102@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= (Seq_index a@90@01 i@91@01) __flatten_5@102@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= (Seq_index a@90@01 (+ i@91@01 1)) __flatten_5@102@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= (Seq_index c@93@01 i@91@01) __flatten_5@102@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= (Seq_index b@89@01 i@91@01) __flatten_5@102@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (not (= __flatten_5@102@01 $Ref.null)))
; [eval] i < N - 1
; [eval] N - 1
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (< i@91@01 (- N@92@01 1)))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 36 | i@91@01 < N@92@01 - 1 | live]
; [else-branch: 36 | !(i@91@01 < N@92@01 - 1) | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 36 | i@91@01 < N@92@01 - 1]
; [exec]
; __flatten_8 := c[i]
; [eval] c[i]
(push) ; 7
(assert (not (>= i@91@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@91@01 (Seq_length c@93@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_8@105@01 $Ref)
(assert (= __flatten_8@105@01 (Seq_index c@93@01 i@91@01)))
; [exec]
; __flatten_10 := a[i + 1]
; [eval] a[i + 1]
; [eval] i + 1
(push) ; 7
(assert (not (>= (+ i@91@01 1) 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< (+ i@91@01 1) (Seq_length a@90@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_10@106@01 $Ref)
(assert (= __flatten_10@106@01 (Seq_index a@90@01 (+ i@91@01 1))))
; [exec]
; __flatten_9 := __flatten_10.Ref__Integer_value + 2
; [eval] __flatten_10.Ref__Integer_value + 2
(push) ; 7
(set-option :timeout 10)
(assert (not (= __flatten_5@102@01 __flatten_10@106@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= (Seq_index a@90@01 (+ i@91@01 1)) __flatten_10@106@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_9@107@01 Int)
(assert (=
  __flatten_9@107@01
  (+
    ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01))))))))))))
    2)))
; [exec]
; __flatten_8.Ref__Integer_value := __flatten_9
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= __flatten_5@102@01 __flatten_8@105@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= (Seq_index a@90@01 (+ i@91@01 1)) __flatten_8@105@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= (Seq_index c@93@01 i@91@01) __flatten_8@105@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= __flatten_5@102@01 __flatten_8@105@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= (Seq_index a@90@01 (+ i@91@01 1)) __flatten_8@105@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= (Seq_index b@89@01 i@91@01) __flatten_8@105@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (not (= __flatten_8@105@01 $Ref.null)))
; [exec]
; Ref__send_body_125(diz, current_thread_id, a, i)
; [eval] diz != null
; [eval] current_thread_id >= 0
; [eval] -1 <= i
; [eval] -1
(set-option :timeout 0)
(push) ; 7
(assert (not (<= (- 0 1) i@91@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (<= (- 0 1) i@91@01))
; [eval] i + 1 < |a|
; [eval] i + 1
; [eval] |a|
(push) ; 7
(assert (not (< (+ i@91@01 1) (Seq_length a@90@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (< (+ i@91@01 1) (Seq_length a@90@01)))
; [eval] a[i + 1]
; [eval] i + 1
(push) ; 7
(assert (not (>= (+ i@91@01 1) 0)))
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
; [eval] i < N
; [eval] a[i]
(set-option :timeout 0)
(push) ; 7
(assert (not (>= i@91@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@91@01 (Seq_length a@90@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(set-option :timeout 10)
(assert (not (= __flatten_8@105@01 (Seq_index a@90@01 i@91@01))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] a[i]
(set-option :timeout 0)
(push) ; 7
(assert (not (>= i@91@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@91@01 (Seq_length a@90@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(set-option :timeout 10)
(assert (not (= __flatten_8@105@01 (Seq_index a@90@01 i@91@01))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= (Seq_index b@89@01 i@91@01) (Seq_index a@90@01 i@91@01))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] b[i]
(set-option :timeout 0)
(push) ; 7
(assert (not (>= i@91@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@91@01 (Seq_length b@89@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] c[i]
(push) ; 7
(assert (not (>= i@91@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@91@01 (Seq_length c@93@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
; [eval] !(i < N - 1)
; [eval] i < N - 1
; [eval] N - 1
; [then-branch: 37 | !(i@91@01 < N@92@01 - 1) | dead]
; [else-branch: 37 | i@91@01 < N@92@01 - 1 | live]
(push) ; 6
; [else-branch: 37 | i@91@01 < N@92@01 - 1]
(pop) ; 6
(pop) ; 5
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 33 | !(i@91@01 < N@92@01 - 1)]
(assert (not (< i@91@01 (- N@92@01 1))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))))))))
  $Snap.unit))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(declare-const $t@108@01 $Snap)
(assert (= $t@108@01 ($Snap.combine ($Snap.first $t@108@01) ($Snap.second $t@108@01))))
(assert (= ($Snap.first $t@108@01) $Snap.unit))
; [eval] 0 <= i
(assert (=
  ($Snap.second $t@108@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@108@01))
    ($Snap.second ($Snap.second $t@108@01)))))
(assert (= ($Snap.first ($Snap.second $t@108@01)) $Snap.unit))
; [eval] i < N
(assert (=
  ($Snap.second ($Snap.second $t@108@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@108@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@108@01))))))
; [eval] a[i]
(push) ; 5
(assert (not (>= i@91@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@91@01 (Seq_length a@90@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@108@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@108@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@108@01)))))))
; [eval] a[i]
(push) ; 5
(assert (not (>= i@91@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@91@01 (Seq_length a@90@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@108@01))))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@108@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@108@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@108@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@108@01))))))))
; [eval] b[i]
(push) ; 5
(assert (not (>= i@91@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@91@01 (Seq_length b@89@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index a@90@01 i@91@01) (Seq_index b@89@01 i@91@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] c[i]
(set-option :timeout 0)
(push) ; 5
(assert (not (>= i@91@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@91@01 (Seq_length c@93@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index b@89@01 i@91@01) (Seq_index c@93@01 i@91@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index a@90@01 i@91@01) (Seq_index c@93@01 i@91@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [exec]
; var __flatten_5: Ref
(declare-const __flatten_5@109@01 $Ref)
; [exec]
; var __flatten_6: Int
(declare-const __flatten_6@110@01 Int)
; [exec]
; var __flatten_7: Ref
(declare-const __flatten_7@111@01 $Ref)
; [exec]
; var __flatten_8: Ref
(declare-const __flatten_8@112@01 $Ref)
; [exec]
; var __flatten_9: Int
(declare-const __flatten_9@113@01 Int)
; [exec]
; var __flatten_10: Ref
(declare-const __flatten_10@114@01 $Ref)
; [eval] i > 0
(push) ; 5
(set-option :timeout 10)
(assert (not (not (> i@91@01 0))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 38 | i@91@01 > 0 | dead]
; [else-branch: 38 | !(i@91@01 > 0) | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 38 | !(i@91@01 > 0)]
(assert (not (> i@91@01 0)))
(pop) ; 5
; [eval] !(i > 0)
; [eval] i > 0
(push) ; 5
(set-option :timeout 10)
(assert (not (> i@91@01 0)))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (not (> i@91@01 0))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 39 | !(i@91@01 > 0) | live]
; [else-branch: 39 | i@91@01 > 0 | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 39 | !(i@91@01 > 0)]
(assert (not (> i@91@01 0)))
; [exec]
; __flatten_5 := a[i]
; [eval] a[i]
(push) ; 6
(assert (not (>= i@91@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@91@01 (Seq_length a@90@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_5@115@01 $Ref)
(assert (= __flatten_5@115@01 (Seq_index a@90@01 i@91@01)))
; [exec]
; __flatten_7 := b[i]
; [eval] b[i]
(push) ; 6
(assert (not (>= i@91@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@91@01 (Seq_length b@89@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_7@116@01 $Ref)
(assert (= __flatten_7@116@01 (Seq_index b@89@01 i@91@01)))
; [exec]
; __flatten_6 := __flatten_7.Ref__Integer_value + 1
; [eval] __flatten_7.Ref__Integer_value + 1
(push) ; 6
(set-option :timeout 10)
(assert (not (= (Seq_index a@90@01 i@91@01) __flatten_7@116@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= (Seq_index c@93@01 i@91@01) __flatten_7@116@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= (Seq_index b@89@01 i@91@01) __flatten_7@116@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_6@117@01 Int)
(assert (=
  __flatten_6@117@01
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01))))))))))
    1)))
; [exec]
; __flatten_5.Ref__Integer_value := __flatten_6
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= (Seq_index a@90@01 i@91@01) __flatten_5@115@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= (Seq_index c@93@01 i@91@01) __flatten_5@115@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= (Seq_index b@89@01 i@91@01) __flatten_5@115@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (not (= __flatten_5@115@01 $Ref.null)))
; [eval] i < N - 1
; [eval] N - 1
; [then-branch: 40 | i@91@01 < N@92@01 - 1 | dead]
; [else-branch: 40 | !(i@91@01 < N@92@01 - 1) | live]
(set-option :timeout 0)
(push) ; 6
; [else-branch: 40 | !(i@91@01 < N@92@01 - 1)]
(pop) ; 6
; [eval] !(i < N - 1)
; [eval] i < N - 1
; [eval] N - 1
(push) ; 6
(set-option :timeout 10)
(assert (not (< i@91@01 (- N@92@01 1))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 41 | !(i@91@01 < N@92@01 - 1) | live]
; [else-branch: 41 | i@91@01 < N@92@01 - 1 | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 41 | !(i@91@01 < N@92@01 - 1)]
; [eval] 0 <= i
; [eval] i < N
; [eval] a[i]
(push) ; 7
(assert (not (>= i@91@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@91@01 (Seq_length a@90@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] a[i]
(set-option :timeout 0)
(push) ; 7
(assert (not (>= i@91@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@91@01 (Seq_length a@90@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(set-option :timeout 10)
(assert (not (= (Seq_index c@93@01 i@91@01) (Seq_index a@90@01 i@91@01))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= (Seq_index b@89@01 i@91@01) (Seq_index a@90@01 i@91@01))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] b[i]
(set-option :timeout 0)
(push) ; 7
(assert (not (>= i@91@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@91@01 (Seq_length b@89@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] c[i]
(push) ; 7
(assert (not (>= i@91@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@91@01 (Seq_length c@93@01))))
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
; [else-branch: 32 | i@91@01 != 0]
(assert (not (= i@91@01 0)))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))))))))
  $Snap.unit))
; [eval] i < N - 1
; [eval] N - 1
(push) ; 3
(set-option :timeout 10)
(assert (not (not (< i@91@01 (- N@92@01 1)))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< i@91@01 (- N@92@01 1))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 42 | i@91@01 < N@92@01 - 1 | live]
; [else-branch: 42 | !(i@91@01 < N@92@01 - 1) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 42 | i@91@01 < N@92@01 - 1]
(assert (< i@91@01 (- N@92@01 1)))
; [eval] a[i + 1]
; [eval] i + 1
(push) ; 4
(assert (not (>= (+ i@91@01 1) 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< (+ i@91@01 1) (Seq_length a@90@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (Seq_index c@93@01 i@91@01) (Seq_index a@90@01 (+ i@91@01 1)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (Seq_index b@89@01 i@91@01) (Seq_index a@90@01 (+ i@91@01 1)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (= (Seq_index a@90@01 i@91@01) (Seq_index a@90@01 (+ i@91@01 1)))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (not (= (Seq_index a@90@01 (+ i@91@01 1)) $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(declare-const $t@118@01 $Snap)
(assert (= $t@118@01 ($Snap.combine ($Snap.first $t@118@01) ($Snap.second $t@118@01))))
(assert (= ($Snap.first $t@118@01) $Snap.unit))
; [eval] 0 <= i
(assert (=
  ($Snap.second $t@118@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@118@01))
    ($Snap.second ($Snap.second $t@118@01)))))
(assert (= ($Snap.first ($Snap.second $t@118@01)) $Snap.unit))
; [eval] i < N
(assert (=
  ($Snap.second ($Snap.second $t@118@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@118@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@118@01))))))
; [eval] a[i]
(push) ; 5
(assert (not (>= i@91@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@91@01 (Seq_length a@90@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@118@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@118@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@118@01)))))))
; [eval] a[i]
(push) ; 5
(assert (not (>= i@91@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@91@01 (Seq_length a@90@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@118@01))))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@118@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@118@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@118@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@118@01))))))))
; [eval] b[i]
(push) ; 5
(assert (not (>= i@91@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@91@01 (Seq_length b@89@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index a@90@01 i@91@01) (Seq_index b@89@01 i@91@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] c[i]
(set-option :timeout 0)
(push) ; 5
(assert (not (>= i@91@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@91@01 (Seq_length c@93@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index b@89@01 i@91@01) (Seq_index c@93@01 i@91@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index a@90@01 i@91@01) (Seq_index c@93@01 i@91@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [exec]
; var __flatten_5: Ref
(declare-const __flatten_5@119@01 $Ref)
; [exec]
; var __flatten_6: Int
(declare-const __flatten_6@120@01 Int)
; [exec]
; var __flatten_7: Ref
(declare-const __flatten_7@121@01 $Ref)
; [exec]
; var __flatten_8: Ref
(declare-const __flatten_8@122@01 $Ref)
; [exec]
; var __flatten_9: Int
(declare-const __flatten_9@123@01 Int)
; [exec]
; var __flatten_10: Ref
(declare-const __flatten_10@124@01 $Ref)
; [eval] i > 0
(push) ; 5
(set-option :timeout 10)
(assert (not (not (> i@91@01 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (> i@91@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 43 | i@91@01 > 0 | live]
; [else-branch: 43 | !(i@91@01 > 0) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 43 | i@91@01 > 0]
(assert (> i@91@01 0))
; [exec]
; Ref__recv_body_115(diz, current_thread_id, a, i)
; [eval] diz != null
; [eval] current_thread_id >= 0
; [eval] 0 <= i
; [eval] i < |a|
; [eval] |a|
(push) ; 6
(assert (not (< i@91@01 (Seq_length a@90@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (< i@91@01 (Seq_length a@90@01)))
; [eval] a[i]
(push) ; 6
(assert (not (>= i@91@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(declare-const $t@125@01 Int)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))))))
  $t@125@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; __flatten_5 := a[i]
; [eval] a[i]
(set-option :timeout 0)
(push) ; 6
(assert (not (>= i@91@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_5@126@01 $Ref)
(assert (= __flatten_5@126@01 (Seq_index a@90@01 i@91@01)))
; [exec]
; __flatten_7 := b[i]
; [eval] b[i]
(push) ; 6
(assert (not (>= i@91@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@91@01 (Seq_length b@89@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_7@127@01 $Ref)
(assert (= __flatten_7@127@01 (Seq_index b@89@01 i@91@01)))
; [exec]
; __flatten_6 := __flatten_7.Ref__Integer_value + 1
; [eval] __flatten_7.Ref__Integer_value + 1
(push) ; 6
(set-option :timeout 10)
(assert (not (= (Seq_index a@90@01 i@91@01) __flatten_7@127@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= (Seq_index a@90@01 (+ i@91@01 1)) __flatten_7@127@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= (Seq_index c@93@01 i@91@01) __flatten_7@127@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= (Seq_index b@89@01 i@91@01) __flatten_7@127@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_6@128@01 Int)
(assert (=
  __flatten_6@128@01
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01))))))))))
    1)))
; [exec]
; __flatten_5.Ref__Integer_value := __flatten_6
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= (Seq_index a@90@01 i@91@01) __flatten_5@126@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= (Seq_index a@90@01 (+ i@91@01 1)) __flatten_5@126@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= (Seq_index c@93@01 i@91@01) __flatten_5@126@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= (Seq_index b@89@01 i@91@01) __flatten_5@126@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (not (= __flatten_5@126@01 $Ref.null)))
; [eval] i < N - 1
; [eval] N - 1
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (not (< i@91@01 (- N@92@01 1)))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 44 | i@91@01 < N@92@01 - 1 | live]
; [else-branch: 44 | !(i@91@01 < N@92@01 - 1) | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 44 | i@91@01 < N@92@01 - 1]
; [exec]
; __flatten_8 := c[i]
; [eval] c[i]
(push) ; 7
(assert (not (>= i@91@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@91@01 (Seq_length c@93@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_8@129@01 $Ref)
(assert (= __flatten_8@129@01 (Seq_index c@93@01 i@91@01)))
; [exec]
; __flatten_10 := a[i + 1]
; [eval] a[i + 1]
; [eval] i + 1
(push) ; 7
(assert (not (>= (+ i@91@01 1) 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< (+ i@91@01 1) (Seq_length a@90@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_10@130@01 $Ref)
(assert (= __flatten_10@130@01 (Seq_index a@90@01 (+ i@91@01 1))))
; [exec]
; __flatten_9 := __flatten_10.Ref__Integer_value + 2
; [eval] __flatten_10.Ref__Integer_value + 2
(push) ; 7
(set-option :timeout 10)
(assert (not (= __flatten_5@126@01 __flatten_10@130@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= (Seq_index a@90@01 (+ i@91@01 1)) __flatten_10@130@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_9@131@01 Int)
(assert (=
  __flatten_9@131@01
  (+
    ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01))))))))))))
    2)))
; [exec]
; __flatten_8.Ref__Integer_value := __flatten_9
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= __flatten_5@126@01 __flatten_8@129@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= (Seq_index a@90@01 (+ i@91@01 1)) __flatten_8@129@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= (Seq_index c@93@01 i@91@01) __flatten_8@129@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= __flatten_5@126@01 __flatten_8@129@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= (Seq_index a@90@01 (+ i@91@01 1)) __flatten_8@129@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= (Seq_index b@89@01 i@91@01) __flatten_8@129@01)))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (not (= __flatten_8@129@01 $Ref.null)))
; [exec]
; Ref__send_body_125(diz, current_thread_id, a, i)
; [eval] diz != null
; [eval] current_thread_id >= 0
; [eval] -1 <= i
; [eval] -1
(set-option :timeout 0)
(push) ; 7
(assert (not (<= (- 0 1) i@91@01)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (<= (- 0 1) i@91@01))
; [eval] i + 1 < |a|
; [eval] i + 1
; [eval] |a|
(push) ; 7
(assert (not (< (+ i@91@01 1) (Seq_length a@90@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(assert (< (+ i@91@01 1) (Seq_length a@90@01)))
; [eval] a[i + 1]
; [eval] i + 1
(push) ; 7
(assert (not (>= (+ i@91@01 1) 0)))
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
; [eval] i < N
; [eval] a[i]
(set-option :timeout 0)
(push) ; 7
(assert (not (>= i@91@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(set-option :timeout 10)
(assert (not (= __flatten_8@129@01 (Seq_index a@90@01 i@91@01))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] a[i]
(set-option :timeout 0)
(push) ; 7
(assert (not (>= i@91@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(set-option :timeout 10)
(assert (not (= __flatten_8@129@01 (Seq_index a@90@01 i@91@01))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= (Seq_index b@89@01 i@91@01) (Seq_index a@90@01 i@91@01))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] b[i]
(set-option :timeout 0)
(push) ; 7
(assert (not (>= i@91@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@91@01 (Seq_length b@89@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] c[i]
(push) ; 7
(assert (not (>= i@91@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@91@01 (Seq_length c@93@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(pop) ; 6
; [eval] !(i < N - 1)
; [eval] i < N - 1
; [eval] N - 1
; [then-branch: 45 | !(i@91@01 < N@92@01 - 1) | dead]
; [else-branch: 45 | i@91@01 < N@92@01 - 1 | live]
(push) ; 6
; [else-branch: 45 | i@91@01 < N@92@01 - 1]
(pop) ; 6
(pop) ; 5
; [eval] !(i > 0)
; [eval] i > 0
(push) ; 5
(set-option :timeout 10)
(assert (not (> i@91@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 46 | !(i@91@01 > 0) | dead]
; [else-branch: 46 | i@91@01 > 0 | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 46 | i@91@01 > 0]
(assert (> i@91@01 0))
(pop) ; 5
(pop) ; 4
(pop) ; 3
(push) ; 3
; [else-branch: 42 | !(i@91@01 < N@92@01 - 1)]
(assert (not (< i@91@01 (- N@92@01 1))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))))))))
  $Snap.unit))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 4
(declare-const $t@132@01 $Snap)
(assert (= $t@132@01 ($Snap.combine ($Snap.first $t@132@01) ($Snap.second $t@132@01))))
(assert (= ($Snap.first $t@132@01) $Snap.unit))
; [eval] 0 <= i
(assert (=
  ($Snap.second $t@132@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@132@01))
    ($Snap.second ($Snap.second $t@132@01)))))
(assert (= ($Snap.first ($Snap.second $t@132@01)) $Snap.unit))
; [eval] i < N
(assert (=
  ($Snap.second ($Snap.second $t@132@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@132@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@132@01))))))
; [eval] a[i]
(push) ; 5
(assert (not (>= i@91@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@91@01 (Seq_length a@90@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@132@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@132@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@132@01)))))))
; [eval] a[i]
(push) ; 5
(assert (not (>= i@91@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@91@01 (Seq_length a@90@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second $t@132@01))))
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@132@01)))))))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@132@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@132@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@132@01))))))))
; [eval] b[i]
(push) ; 5
(assert (not (>= i@91@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@91@01 (Seq_length b@89@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index a@90@01 i@91@01) (Seq_index b@89@01 i@91@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [eval] c[i]
(set-option :timeout 0)
(push) ; 5
(assert (not (>= i@91@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@91@01 (Seq_length c@93@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index b@89@01 i@91@01) (Seq_index c@93@01 i@91@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (= (Seq_index a@90@01 i@91@01) (Seq_index c@93@01 i@91@01))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(set-option :timeout 0)
(push) ; 4
; [exec]
; var __flatten_5: Ref
(declare-const __flatten_5@133@01 $Ref)
; [exec]
; var __flatten_6: Int
(declare-const __flatten_6@134@01 Int)
; [exec]
; var __flatten_7: Ref
(declare-const __flatten_7@135@01 $Ref)
; [exec]
; var __flatten_8: Ref
(declare-const __flatten_8@136@01 $Ref)
; [exec]
; var __flatten_9: Int
(declare-const __flatten_9@137@01 Int)
; [exec]
; var __flatten_10: Ref
(declare-const __flatten_10@138@01 $Ref)
; [eval] i > 0
(push) ; 5
(set-option :timeout 10)
(assert (not (not (> i@91@01 0))))
(check-sat)
; unknown
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 5
(set-option :timeout 10)
(assert (not (> i@91@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 47 | i@91@01 > 0 | live]
; [else-branch: 47 | !(i@91@01 > 0) | dead]
(set-option :timeout 0)
(push) ; 5
; [then-branch: 47 | i@91@01 > 0]
(assert (> i@91@01 0))
; [exec]
; Ref__recv_body_115(diz, current_thread_id, a, i)
; [eval] diz != null
; [eval] current_thread_id >= 0
; [eval] 0 <= i
; [eval] i < |a|
; [eval] |a|
(push) ; 6
(assert (not (< i@91@01 (Seq_length a@90@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(assert (< i@91@01 (Seq_length a@90@01)))
; [eval] a[i]
(push) ; 6
(assert (not (>= i@91@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(declare-const $t@139@01 Int)
(assert (=
  ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))))))
  $t@139@01))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [exec]
; __flatten_5 := a[i]
; [eval] a[i]
(set-option :timeout 0)
(push) ; 6
(assert (not (>= i@91@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_5@140@01 $Ref)
(assert (= __flatten_5@140@01 (Seq_index a@90@01 i@91@01)))
; [exec]
; __flatten_7 := b[i]
; [eval] b[i]
(push) ; 6
(assert (not (>= i@91@01 0)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(push) ; 6
(assert (not (< i@91@01 (Seq_length b@89@01))))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_7@141@01 $Ref)
(assert (= __flatten_7@141@01 (Seq_index b@89@01 i@91@01)))
; [exec]
; __flatten_6 := __flatten_7.Ref__Integer_value + 1
; [eval] __flatten_7.Ref__Integer_value + 1
(push) ; 6
(set-option :timeout 10)
(assert (not (= (Seq_index a@90@01 i@91@01) __flatten_7@141@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= (Seq_index c@93@01 i@91@01) __flatten_7@141@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= (Seq_index b@89@01 i@91@01) __flatten_7@141@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_6@142@01 Int)
(assert (=
  __flatten_6@142@01
  (+
    ($SortWrappers.$SnapToInt ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01))))))))))
    1)))
; [exec]
; __flatten_5.Ref__Integer_value := __flatten_6
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= (Seq_index a@90@01 i@91@01) __flatten_5@140@01)))
(check-sat)
; unsat
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= (Seq_index c@93@01 i@91@01) __flatten_5@140@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 6
(set-option :timeout 10)
(assert (not (= (Seq_index b@89@01 i@91@01) __flatten_5@140@01)))
(check-sat)
; unknown
(pop) ; 6
; 0,02s
; (get-info :all-statistics)
(assert (not (= __flatten_5@140@01 $Ref.null)))
; [eval] i < N - 1
; [eval] N - 1
; [then-branch: 48 | i@91@01 < N@92@01 - 1 | dead]
; [else-branch: 48 | !(i@91@01 < N@92@01 - 1) | live]
(set-option :timeout 0)
(push) ; 6
; [else-branch: 48 | !(i@91@01 < N@92@01 - 1)]
(pop) ; 6
; [eval] !(i < N - 1)
; [eval] i < N - 1
; [eval] N - 1
(push) ; 6
(set-option :timeout 10)
(assert (not (< i@91@01 (- N@92@01 1))))
(check-sat)
; unknown
(pop) ; 6
; 0,00s
; (get-info :all-statistics)
; [then-branch: 49 | !(i@91@01 < N@92@01 - 1) | live]
; [else-branch: 49 | i@91@01 < N@92@01 - 1 | dead]
(set-option :timeout 0)
(push) ; 6
; [then-branch: 49 | !(i@91@01 < N@92@01 - 1)]
; [eval] 0 <= i
; [eval] i < N
; [eval] a[i]
(push) ; 7
(assert (not (>= i@91@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(set-option :timeout 10)
(assert (not false))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] a[i]
(set-option :timeout 0)
(push) ; 7
(assert (not (>= i@91@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(set-option :timeout 10)
(assert (not (= (Seq_index c@93@01 i@91@01) (Seq_index a@90@01 i@91@01))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 7
(set-option :timeout 10)
(assert (not (= (Seq_index b@89@01 i@91@01) (Seq_index a@90@01 i@91@01))))
(check-sat)
; unknown
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] b[i]
(set-option :timeout 0)
(push) ; 7
(assert (not (>= i@91@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@91@01 (Seq_length b@89@01))))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
; [eval] c[i]
(push) ; 7
(assert (not (>= i@91@01 0)))
(check-sat)
; unsat
(pop) ; 7
; 0,00s
; (get-info :all-statistics)
(push) ; 7
(assert (not (< i@91@01 (Seq_length c@93@01))))
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
(assert (not (> i@91@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
; [then-branch: 50 | !(i@91@01 > 0) | dead]
; [else-branch: 50 | i@91@01 > 0 | live]
(set-option :timeout 0)
(push) ; 5
; [else-branch: 50 | i@91@01 > 0]
(assert (> i@91@01 0))
(pop) ; 5
(pop) ; 4
(pop) ; 3
(pop) ; 2
(pop) ; 1
; ---------- Ref__guard_check_S2_S1 ----------
(declare-const diz@143@01 $Ref)
(declare-const current_thread_id@144@01 Int)
(declare-const b@145@01 Seq<$Ref>)
(declare-const a@146@01 Seq<$Ref>)
(declare-const i@147@01 Int)
(declare-const N@148@01 Int)
(declare-const c@149@01 Seq<$Ref>)
(declare-const diz@150@01 $Ref)
(declare-const current_thread_id@151@01 Int)
(declare-const b@152@01 Seq<$Ref>)
(declare-const a@153@01 Seq<$Ref>)
(declare-const i@154@01 Int)
(declare-const N@155@01 Int)
(declare-const c@156@01 Seq<$Ref>)
(push) ; 1
(declare-const $t@157@01 $Snap)
(assert (= $t@157@01 ($Snap.combine ($Snap.first $t@157@01) ($Snap.second $t@157@01))))
(assert (= ($Snap.first $t@157@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@150@01 $Ref.null)))
(assert (=
  ($Snap.second $t@157@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@157@01))
    ($Snap.second ($Snap.second $t@157@01)))))
(assert (= ($Snap.first ($Snap.second $t@157@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@151@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@157@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@157@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@157@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@157@01))) $Snap.unit))
; [eval] 0 <= i
(assert (<= 0 i@154@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@157@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@157@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@157@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@157@01))))
  $Snap.unit))
; [eval] i < N
(assert (< i@154@01 N@155@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@157@01))))
  $Snap.unit))
; [eval] i > 0
(assert (> i@154@01 0))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@158@01 $Snap)
(assert (= $t@158@01 ($Snap.combine ($Snap.first $t@158@01) ($Snap.second $t@158@01))))
(assert (= ($Snap.first $t@158@01) $Snap.unit))
; [eval] 1 <= i
(assert (<= 1 i@154@01))
(assert (= ($Snap.second $t@158@01) $Snap.unit))
; [eval] i - 1 < N - 1
; [eval] i - 1
; [eval] N - 1
(assert (< (- i@154@01 1) (- N@155@01 1)))
(pop) ; 2
(push) ; 2
; [eval] 1 <= i
(push) ; 3
(assert (not (<= 1 i@154@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (<= 1 i@154@01))
; [eval] i - 1 < N - 1
; [eval] i - 1
; [eval] N - 1
(push) ; 3
(assert (not (< (- i@154@01 1) (- N@155@01 1))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (< (- i@154@01 1) (- N@155@01 1)))
(pop) ; 2
(pop) ; 1
; ---------- Ref__resource_check_S2_S1 ----------
(declare-const diz@159@01 $Ref)
(declare-const current_thread_id@160@01 Int)
(declare-const b@161@01 Seq<$Ref>)
(declare-const a@162@01 Seq<$Ref>)
(declare-const i@163@01 Int)
(declare-const N@164@01 Int)
(declare-const c@165@01 Seq<$Ref>)
(declare-const diz@166@01 $Ref)
(declare-const current_thread_id@167@01 Int)
(declare-const b@168@01 Seq<$Ref>)
(declare-const a@169@01 Seq<$Ref>)
(declare-const i@170@01 Int)
(declare-const N@171@01 Int)
(declare-const c@172@01 Seq<$Ref>)
(push) ; 1
(declare-const $t@173@01 $Snap)
(assert (= $t@173@01 ($Snap.combine ($Snap.first $t@173@01) ($Snap.second $t@173@01))))
(assert (= ($Snap.first $t@173@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@166@01 $Ref.null)))
(assert (=
  ($Snap.second $t@173@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@173@01))
    ($Snap.second ($Snap.second $t@173@01)))))
(assert (= ($Snap.first ($Snap.second $t@173@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@167@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@173@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@173@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@173@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@173@01))) $Snap.unit))
; [eval] 0 <= i
(assert (<= 0 i@170@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@173@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@173@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@173@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@173@01))))
  $Snap.unit))
; [eval] i < N
(assert (< i@170@01 N@171@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@173@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@173@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@173@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@173@01)))))
  $Snap.unit))
; [eval] i - 1 < N - 1
; [eval] i - 1
; [eval] N - 1
(assert (< (- i@170@01 1) (- N@171@01 1)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@173@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@173@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@173@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@173@01))))))
  $Snap.unit))
; [eval] i > 0
(assert (> i@170@01 0))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@173@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@173@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@173@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@173@01)))))))
  $Snap.unit))
; [eval] N <= |a|
; [eval] |a|
(assert (<= N@171@01 (Seq_length a@169@01)))
; [eval] a[i - 1 + 1]
; [eval] i - 1 + 1
; [eval] i - 1
(push) ; 2
(assert (not (>= (+ (- i@170@01 1) 1) 0)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(push) ; 2
(assert (not (< (+ (- i@170@01 1) 1) (Seq_length a@169@01))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= (Seq_index a@169@01 (+ (- i@170@01 1) 1)) $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@174@01 $Snap)
(assert (= $t@174@01 ($Snap.combine ($Snap.first $t@174@01) ($Snap.second $t@174@01))))
(assert (= ($Snap.first $t@174@01) $Snap.unit))
; [eval] i - 1 < N - 1
; [eval] i - 1
; [eval] N - 1
; [eval] a[i]
(push) ; 3
(assert (not (>= i@170@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@170@01 (Seq_length a@169@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not (= (Seq_index a@169@01 i@170@01) $Ref.null)))
(pop) ; 2
(push) ; 2
; [eval] i - 1 < N - 1
; [eval] i - 1
; [eval] N - 1
; [eval] a[i]
(push) ; 3
(assert (not (>= i@170@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@170@01 (Seq_length a@169@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (Seq_index a@169@01 (+ (- i@170@01 1) 1)) (Seq_index a@169@01 i@170@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- Ref__example ----------
(declare-const diz@175@01 $Ref)
(declare-const current_thread_id@176@01 Int)
(declare-const a@177@01 Seq<$Ref>)
(declare-const b@178@01 Seq<$Ref>)
(declare-const c@179@01 Seq<$Ref>)
(declare-const N@180@01 Int)
(declare-const diz@181@01 $Ref)
(declare-const current_thread_id@182@01 Int)
(declare-const a@183@01 Seq<$Ref>)
(declare-const b@184@01 Seq<$Ref>)
(declare-const c@185@01 Seq<$Ref>)
(declare-const N@186@01 Int)
(set-option :timeout 0)
(push) ; 1
(declare-const $t@187@01 $Snap)
(assert (= $t@187@01 ($Snap.combine ($Snap.first $t@187@01) ($Snap.second $t@187@01))))
(assert (= ($Snap.first $t@187@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@181@01 $Ref.null)))
(assert (=
  ($Snap.second $t@187@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@187@01))
    ($Snap.second ($Snap.second $t@187@01)))))
(assert (= ($Snap.first ($Snap.second $t@187@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@182@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@187@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@187@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@187@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@187@01))) $Snap.unit))
; [eval] (forall k: Int, j: Int :: { a[k], a[j] } k >= 0 && (k < |a| && (j >= 0 && (j < |a| && k != j))) ==> a[k] != a[j])
(declare-const k@188@01 Int)
(declare-const j@189@01 Int)
(push) ; 2
; [eval] k >= 0 && (k < |a| && (j >= 0 && (j < |a| && k != j))) ==> a[k] != a[j]
; [eval] k >= 0 && (k < |a| && (j >= 0 && (j < |a| && k != j)))
; [eval] k >= 0
(push) ; 3
; [then-branch: 51 | !(k@188@01 >= 0) | live]
; [else-branch: 51 | k@188@01 >= 0 | live]
(push) ; 4
; [then-branch: 51 | !(k@188@01 >= 0)]
(assert (not (>= k@188@01 0)))
(pop) ; 4
(push) ; 4
; [else-branch: 51 | k@188@01 >= 0]
(assert (>= k@188@01 0))
; [eval] k < |a|
; [eval] |a|
(push) ; 5
; [then-branch: 52 | !(k@188@01 < |a@183@01|) | live]
; [else-branch: 52 | k@188@01 < |a@183@01| | live]
(push) ; 6
; [then-branch: 52 | !(k@188@01 < |a@183@01|)]
(assert (not (< k@188@01 (Seq_length a@183@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 52 | k@188@01 < |a@183@01|]
(assert (< k@188@01 (Seq_length a@183@01)))
; [eval] j >= 0
(push) ; 7
; [then-branch: 53 | !(j@189@01 >= 0) | live]
; [else-branch: 53 | j@189@01 >= 0 | live]
(push) ; 8
; [then-branch: 53 | !(j@189@01 >= 0)]
(assert (not (>= j@189@01 0)))
(pop) ; 8
(push) ; 8
; [else-branch: 53 | j@189@01 >= 0]
(assert (>= j@189@01 0))
; [eval] j < |a|
; [eval] |a|
(push) ; 9
; [then-branch: 54 | !(j@189@01 < |a@183@01|) | live]
; [else-branch: 54 | j@189@01 < |a@183@01| | live]
(push) ; 10
; [then-branch: 54 | !(j@189@01 < |a@183@01|)]
(assert (not (< j@189@01 (Seq_length a@183@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 54 | j@189@01 < |a@183@01|]
(assert (< j@189@01 (Seq_length a@183@01)))
; [eval] k != j
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< j@189@01 (Seq_length a@183@01)) (not (< j@189@01 (Seq_length a@183@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@189@01 0)
  (and
    (>= j@189@01 0)
    (or
      (< j@189@01 (Seq_length a@183@01))
      (not (< j@189@01 (Seq_length a@183@01)))))))
(assert (or (>= j@189@01 0) (not (>= j@189@01 0))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< k@188@01 (Seq_length a@183@01))
  (and
    (< k@188@01 (Seq_length a@183@01))
    (=>
      (>= j@189@01 0)
      (and
        (>= j@189@01 0)
        (or
          (< j@189@01 (Seq_length a@183@01))
          (not (< j@189@01 (Seq_length a@183@01))))))
    (or (>= j@189@01 0) (not (>= j@189@01 0))))))
(assert (or (< k@188@01 (Seq_length a@183@01)) (not (< k@188@01 (Seq_length a@183@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= k@188@01 0)
  (and
    (>= k@188@01 0)
    (=>
      (< k@188@01 (Seq_length a@183@01))
      (and
        (< k@188@01 (Seq_length a@183@01))
        (=>
          (>= j@189@01 0)
          (and
            (>= j@189@01 0)
            (or
              (< j@189@01 (Seq_length a@183@01))
              (not (< j@189@01 (Seq_length a@183@01))))))
        (or (>= j@189@01 0) (not (>= j@189@01 0)))))
    (or
      (< k@188@01 (Seq_length a@183@01))
      (not (< k@188@01 (Seq_length a@183@01)))))))
(assert (or (>= k@188@01 0) (not (>= k@188@01 0))))
(push) ; 3
; [then-branch: 55 | k@188@01 >= 0 && k@188@01 < |a@183@01| && j@189@01 >= 0 && j@189@01 < |a@183@01| && k@188@01 != j@189@01 | live]
; [else-branch: 55 | !(k@188@01 >= 0 && k@188@01 < |a@183@01| && j@189@01 >= 0 && j@189@01 < |a@183@01| && k@188@01 != j@189@01) | live]
(push) ; 4
; [then-branch: 55 | k@188@01 >= 0 && k@188@01 < |a@183@01| && j@189@01 >= 0 && j@189@01 < |a@183@01| && k@188@01 != j@189@01]
(assert (and
  (>= k@188@01 0)
  (and
    (< k@188@01 (Seq_length a@183@01))
    (and
      (>= j@189@01 0)
      (and (< j@189@01 (Seq_length a@183@01)) (not (= k@188@01 j@189@01)))))))
; [eval] a[k] != a[j]
; [eval] a[k]
; [eval] a[j]
(pop) ; 4
(push) ; 4
; [else-branch: 55 | !(k@188@01 >= 0 && k@188@01 < |a@183@01| && j@189@01 >= 0 && j@189@01 < |a@183@01| && k@188@01 != j@189@01)]
(assert (not
  (and
    (>= k@188@01 0)
    (and
      (< k@188@01 (Seq_length a@183@01))
      (and
        (>= j@189@01 0)
        (and (< j@189@01 (Seq_length a@183@01)) (not (= k@188@01 j@189@01))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (>= k@188@01 0)
    (and
      (< k@188@01 (Seq_length a@183@01))
      (and
        (>= j@189@01 0)
        (and (< j@189@01 (Seq_length a@183@01)) (not (= k@188@01 j@189@01))))))
  (and
    (>= k@188@01 0)
    (< k@188@01 (Seq_length a@183@01))
    (>= j@189@01 0)
    (< j@189@01 (Seq_length a@183@01))
    (not (= k@188@01 j@189@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= k@188@01 0)
      (and
        (< k@188@01 (Seq_length a@183@01))
        (and
          (>= j@189@01 0)
          (and (< j@189@01 (Seq_length a@183@01)) (not (= k@188@01 j@189@01)))))))
  (and
    (>= k@188@01 0)
    (and
      (< k@188@01 (Seq_length a@183@01))
      (and
        (>= j@189@01 0)
        (and (< j@189@01 (Seq_length a@183@01)) (not (= k@188@01 j@189@01))))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@188@01 Int) (j@189@01 Int)) (!
  (and
    (=>
      (>= k@188@01 0)
      (and
        (>= k@188@01 0)
        (=>
          (< k@188@01 (Seq_length a@183@01))
          (and
            (< k@188@01 (Seq_length a@183@01))
            (=>
              (>= j@189@01 0)
              (and
                (>= j@189@01 0)
                (or
                  (< j@189@01 (Seq_length a@183@01))
                  (not (< j@189@01 (Seq_length a@183@01))))))
            (or (>= j@189@01 0) (not (>= j@189@01 0)))))
        (or
          (< k@188@01 (Seq_length a@183@01))
          (not (< k@188@01 (Seq_length a@183@01))))))
    (or (>= k@188@01 0) (not (>= k@188@01 0)))
    (=>
      (and
        (>= k@188@01 0)
        (and
          (< k@188@01 (Seq_length a@183@01))
          (and
            (>= j@189@01 0)
            (and (< j@189@01 (Seq_length a@183@01)) (not (= k@188@01 j@189@01))))))
      (and
        (>= k@188@01 0)
        (< k@188@01 (Seq_length a@183@01))
        (>= j@189@01 0)
        (< j@189@01 (Seq_length a@183@01))
        (not (= k@188@01 j@189@01))))
    (or
      (not
        (and
          (>= k@188@01 0)
          (and
            (< k@188@01 (Seq_length a@183@01))
            (and
              (>= j@189@01 0)
              (and
                (< j@189@01 (Seq_length a@183@01))
                (not (= k@188@01 j@189@01)))))))
      (and
        (>= k@188@01 0)
        (and
          (< k@188@01 (Seq_length a@183@01))
          (and
            (>= j@189@01 0)
            (and (< j@189@01 (Seq_length a@183@01)) (not (= k@188@01 j@189@01))))))))
  :pattern ((Seq_index a@183@01 k@188@01) (Seq_index a@183@01 j@189@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_backward_dep_drf_c.vpr@162@12@162@100-aux|)))
(assert (forall ((k@188@01 Int) (j@189@01 Int)) (!
  (=>
    (and
      (>= k@188@01 0)
      (and
        (< k@188@01 (Seq_length a@183@01))
        (and
          (>= j@189@01 0)
          (and (< j@189@01 (Seq_length a@183@01)) (not (= k@188@01 j@189@01))))))
    (not (= (Seq_index a@183@01 k@188@01) (Seq_index a@183@01 j@189@01))))
  :pattern ((Seq_index a@183@01 k@188@01) (Seq_index a@183@01 j@189@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_backward_dep_drf_c.vpr@162@12@162@100|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@187@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@187@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@187@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@187@01))))
  $Snap.unit))
; [eval] (forall k: Int, j: Int :: { b[k], b[j] } k >= 0 && (k < |b| && (j >= 0 && (j < |b| && k != j))) ==> b[k] != b[j])
(declare-const k@190@01 Int)
(declare-const j@191@01 Int)
(push) ; 2
; [eval] k >= 0 && (k < |b| && (j >= 0 && (j < |b| && k != j))) ==> b[k] != b[j]
; [eval] k >= 0 && (k < |b| && (j >= 0 && (j < |b| && k != j)))
; [eval] k >= 0
(push) ; 3
; [then-branch: 56 | !(k@190@01 >= 0) | live]
; [else-branch: 56 | k@190@01 >= 0 | live]
(push) ; 4
; [then-branch: 56 | !(k@190@01 >= 0)]
(assert (not (>= k@190@01 0)))
(pop) ; 4
(push) ; 4
; [else-branch: 56 | k@190@01 >= 0]
(assert (>= k@190@01 0))
; [eval] k < |b|
; [eval] |b|
(push) ; 5
; [then-branch: 57 | !(k@190@01 < |b@184@01|) | live]
; [else-branch: 57 | k@190@01 < |b@184@01| | live]
(push) ; 6
; [then-branch: 57 | !(k@190@01 < |b@184@01|)]
(assert (not (< k@190@01 (Seq_length b@184@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 57 | k@190@01 < |b@184@01|]
(assert (< k@190@01 (Seq_length b@184@01)))
; [eval] j >= 0
(push) ; 7
; [then-branch: 58 | !(j@191@01 >= 0) | live]
; [else-branch: 58 | j@191@01 >= 0 | live]
(push) ; 8
; [then-branch: 58 | !(j@191@01 >= 0)]
(assert (not (>= j@191@01 0)))
(pop) ; 8
(push) ; 8
; [else-branch: 58 | j@191@01 >= 0]
(assert (>= j@191@01 0))
; [eval] j < |b|
; [eval] |b|
(push) ; 9
; [then-branch: 59 | !(j@191@01 < |b@184@01|) | live]
; [else-branch: 59 | j@191@01 < |b@184@01| | live]
(push) ; 10
; [then-branch: 59 | !(j@191@01 < |b@184@01|)]
(assert (not (< j@191@01 (Seq_length b@184@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 59 | j@191@01 < |b@184@01|]
(assert (< j@191@01 (Seq_length b@184@01)))
; [eval] k != j
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< j@191@01 (Seq_length b@184@01)) (not (< j@191@01 (Seq_length b@184@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@191@01 0)
  (and
    (>= j@191@01 0)
    (or
      (< j@191@01 (Seq_length b@184@01))
      (not (< j@191@01 (Seq_length b@184@01)))))))
(assert (or (>= j@191@01 0) (not (>= j@191@01 0))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< k@190@01 (Seq_length b@184@01))
  (and
    (< k@190@01 (Seq_length b@184@01))
    (=>
      (>= j@191@01 0)
      (and
        (>= j@191@01 0)
        (or
          (< j@191@01 (Seq_length b@184@01))
          (not (< j@191@01 (Seq_length b@184@01))))))
    (or (>= j@191@01 0) (not (>= j@191@01 0))))))
(assert (or (< k@190@01 (Seq_length b@184@01)) (not (< k@190@01 (Seq_length b@184@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= k@190@01 0)
  (and
    (>= k@190@01 0)
    (=>
      (< k@190@01 (Seq_length b@184@01))
      (and
        (< k@190@01 (Seq_length b@184@01))
        (=>
          (>= j@191@01 0)
          (and
            (>= j@191@01 0)
            (or
              (< j@191@01 (Seq_length b@184@01))
              (not (< j@191@01 (Seq_length b@184@01))))))
        (or (>= j@191@01 0) (not (>= j@191@01 0)))))
    (or
      (< k@190@01 (Seq_length b@184@01))
      (not (< k@190@01 (Seq_length b@184@01)))))))
(assert (or (>= k@190@01 0) (not (>= k@190@01 0))))
(push) ; 3
; [then-branch: 60 | k@190@01 >= 0 && k@190@01 < |b@184@01| && j@191@01 >= 0 && j@191@01 < |b@184@01| && k@190@01 != j@191@01 | live]
; [else-branch: 60 | !(k@190@01 >= 0 && k@190@01 < |b@184@01| && j@191@01 >= 0 && j@191@01 < |b@184@01| && k@190@01 != j@191@01) | live]
(push) ; 4
; [then-branch: 60 | k@190@01 >= 0 && k@190@01 < |b@184@01| && j@191@01 >= 0 && j@191@01 < |b@184@01| && k@190@01 != j@191@01]
(assert (and
  (>= k@190@01 0)
  (and
    (< k@190@01 (Seq_length b@184@01))
    (and
      (>= j@191@01 0)
      (and (< j@191@01 (Seq_length b@184@01)) (not (= k@190@01 j@191@01)))))))
; [eval] b[k] != b[j]
; [eval] b[k]
; [eval] b[j]
(pop) ; 4
(push) ; 4
; [else-branch: 60 | !(k@190@01 >= 0 && k@190@01 < |b@184@01| && j@191@01 >= 0 && j@191@01 < |b@184@01| && k@190@01 != j@191@01)]
(assert (not
  (and
    (>= k@190@01 0)
    (and
      (< k@190@01 (Seq_length b@184@01))
      (and
        (>= j@191@01 0)
        (and (< j@191@01 (Seq_length b@184@01)) (not (= k@190@01 j@191@01))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (>= k@190@01 0)
    (and
      (< k@190@01 (Seq_length b@184@01))
      (and
        (>= j@191@01 0)
        (and (< j@191@01 (Seq_length b@184@01)) (not (= k@190@01 j@191@01))))))
  (and
    (>= k@190@01 0)
    (< k@190@01 (Seq_length b@184@01))
    (>= j@191@01 0)
    (< j@191@01 (Seq_length b@184@01))
    (not (= k@190@01 j@191@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= k@190@01 0)
      (and
        (< k@190@01 (Seq_length b@184@01))
        (and
          (>= j@191@01 0)
          (and (< j@191@01 (Seq_length b@184@01)) (not (= k@190@01 j@191@01)))))))
  (and
    (>= k@190@01 0)
    (and
      (< k@190@01 (Seq_length b@184@01))
      (and
        (>= j@191@01 0)
        (and (< j@191@01 (Seq_length b@184@01)) (not (= k@190@01 j@191@01))))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@190@01 Int) (j@191@01 Int)) (!
  (and
    (=>
      (>= k@190@01 0)
      (and
        (>= k@190@01 0)
        (=>
          (< k@190@01 (Seq_length b@184@01))
          (and
            (< k@190@01 (Seq_length b@184@01))
            (=>
              (>= j@191@01 0)
              (and
                (>= j@191@01 0)
                (or
                  (< j@191@01 (Seq_length b@184@01))
                  (not (< j@191@01 (Seq_length b@184@01))))))
            (or (>= j@191@01 0) (not (>= j@191@01 0)))))
        (or
          (< k@190@01 (Seq_length b@184@01))
          (not (< k@190@01 (Seq_length b@184@01))))))
    (or (>= k@190@01 0) (not (>= k@190@01 0)))
    (=>
      (and
        (>= k@190@01 0)
        (and
          (< k@190@01 (Seq_length b@184@01))
          (and
            (>= j@191@01 0)
            (and (< j@191@01 (Seq_length b@184@01)) (not (= k@190@01 j@191@01))))))
      (and
        (>= k@190@01 0)
        (< k@190@01 (Seq_length b@184@01))
        (>= j@191@01 0)
        (< j@191@01 (Seq_length b@184@01))
        (not (= k@190@01 j@191@01))))
    (or
      (not
        (and
          (>= k@190@01 0)
          (and
            (< k@190@01 (Seq_length b@184@01))
            (and
              (>= j@191@01 0)
              (and
                (< j@191@01 (Seq_length b@184@01))
                (not (= k@190@01 j@191@01)))))))
      (and
        (>= k@190@01 0)
        (and
          (< k@190@01 (Seq_length b@184@01))
          (and
            (>= j@191@01 0)
            (and (< j@191@01 (Seq_length b@184@01)) (not (= k@190@01 j@191@01))))))))
  :pattern ((Seq_index b@184@01 k@190@01) (Seq_index b@184@01 j@191@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_backward_dep_drf_c.vpr@163@12@163@100-aux|)))
(assert (forall ((k@190@01 Int) (j@191@01 Int)) (!
  (=>
    (and
      (>= k@190@01 0)
      (and
        (< k@190@01 (Seq_length b@184@01))
        (and
          (>= j@191@01 0)
          (and (< j@191@01 (Seq_length b@184@01)) (not (= k@190@01 j@191@01))))))
    (not (= (Seq_index b@184@01 k@190@01) (Seq_index b@184@01 j@191@01))))
  :pattern ((Seq_index b@184@01 k@190@01) (Seq_index b@184@01 j@191@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_backward_dep_drf_c.vpr@163@12@163@100|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@187@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@187@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@187@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@187@01)))))
  $Snap.unit))
; [eval] (forall k: Int, j: Int :: { c[k], c[j] } k >= 0 && (k < |c| && (j >= 0 && (j < |c| && k != j))) ==> c[k] != c[j])
(declare-const k@192@01 Int)
(declare-const j@193@01 Int)
(push) ; 2
; [eval] k >= 0 && (k < |c| && (j >= 0 && (j < |c| && k != j))) ==> c[k] != c[j]
; [eval] k >= 0 && (k < |c| && (j >= 0 && (j < |c| && k != j)))
; [eval] k >= 0
(push) ; 3
; [then-branch: 61 | !(k@192@01 >= 0) | live]
; [else-branch: 61 | k@192@01 >= 0 | live]
(push) ; 4
; [then-branch: 61 | !(k@192@01 >= 0)]
(assert (not (>= k@192@01 0)))
(pop) ; 4
(push) ; 4
; [else-branch: 61 | k@192@01 >= 0]
(assert (>= k@192@01 0))
; [eval] k < |c|
; [eval] |c|
(push) ; 5
; [then-branch: 62 | !(k@192@01 < |c@185@01|) | live]
; [else-branch: 62 | k@192@01 < |c@185@01| | live]
(push) ; 6
; [then-branch: 62 | !(k@192@01 < |c@185@01|)]
(assert (not (< k@192@01 (Seq_length c@185@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 62 | k@192@01 < |c@185@01|]
(assert (< k@192@01 (Seq_length c@185@01)))
; [eval] j >= 0
(push) ; 7
; [then-branch: 63 | !(j@193@01 >= 0) | live]
; [else-branch: 63 | j@193@01 >= 0 | live]
(push) ; 8
; [then-branch: 63 | !(j@193@01 >= 0)]
(assert (not (>= j@193@01 0)))
(pop) ; 8
(push) ; 8
; [else-branch: 63 | j@193@01 >= 0]
(assert (>= j@193@01 0))
; [eval] j < |c|
; [eval] |c|
(push) ; 9
; [then-branch: 64 | !(j@193@01 < |c@185@01|) | live]
; [else-branch: 64 | j@193@01 < |c@185@01| | live]
(push) ; 10
; [then-branch: 64 | !(j@193@01 < |c@185@01|)]
(assert (not (< j@193@01 (Seq_length c@185@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 64 | j@193@01 < |c@185@01|]
(assert (< j@193@01 (Seq_length c@185@01)))
; [eval] k != j
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< j@193@01 (Seq_length c@185@01)) (not (< j@193@01 (Seq_length c@185@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@193@01 0)
  (and
    (>= j@193@01 0)
    (or
      (< j@193@01 (Seq_length c@185@01))
      (not (< j@193@01 (Seq_length c@185@01)))))))
(assert (or (>= j@193@01 0) (not (>= j@193@01 0))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< k@192@01 (Seq_length c@185@01))
  (and
    (< k@192@01 (Seq_length c@185@01))
    (=>
      (>= j@193@01 0)
      (and
        (>= j@193@01 0)
        (or
          (< j@193@01 (Seq_length c@185@01))
          (not (< j@193@01 (Seq_length c@185@01))))))
    (or (>= j@193@01 0) (not (>= j@193@01 0))))))
(assert (or (< k@192@01 (Seq_length c@185@01)) (not (< k@192@01 (Seq_length c@185@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= k@192@01 0)
  (and
    (>= k@192@01 0)
    (=>
      (< k@192@01 (Seq_length c@185@01))
      (and
        (< k@192@01 (Seq_length c@185@01))
        (=>
          (>= j@193@01 0)
          (and
            (>= j@193@01 0)
            (or
              (< j@193@01 (Seq_length c@185@01))
              (not (< j@193@01 (Seq_length c@185@01))))))
        (or (>= j@193@01 0) (not (>= j@193@01 0)))))
    (or
      (< k@192@01 (Seq_length c@185@01))
      (not (< k@192@01 (Seq_length c@185@01)))))))
(assert (or (>= k@192@01 0) (not (>= k@192@01 0))))
(push) ; 3
; [then-branch: 65 | k@192@01 >= 0 && k@192@01 < |c@185@01| && j@193@01 >= 0 && j@193@01 < |c@185@01| && k@192@01 != j@193@01 | live]
; [else-branch: 65 | !(k@192@01 >= 0 && k@192@01 < |c@185@01| && j@193@01 >= 0 && j@193@01 < |c@185@01| && k@192@01 != j@193@01) | live]
(push) ; 4
; [then-branch: 65 | k@192@01 >= 0 && k@192@01 < |c@185@01| && j@193@01 >= 0 && j@193@01 < |c@185@01| && k@192@01 != j@193@01]
(assert (and
  (>= k@192@01 0)
  (and
    (< k@192@01 (Seq_length c@185@01))
    (and
      (>= j@193@01 0)
      (and (< j@193@01 (Seq_length c@185@01)) (not (= k@192@01 j@193@01)))))))
; [eval] c[k] != c[j]
; [eval] c[k]
; [eval] c[j]
(pop) ; 4
(push) ; 4
; [else-branch: 65 | !(k@192@01 >= 0 && k@192@01 < |c@185@01| && j@193@01 >= 0 && j@193@01 < |c@185@01| && k@192@01 != j@193@01)]
(assert (not
  (and
    (>= k@192@01 0)
    (and
      (< k@192@01 (Seq_length c@185@01))
      (and
        (>= j@193@01 0)
        (and (< j@193@01 (Seq_length c@185@01)) (not (= k@192@01 j@193@01))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (>= k@192@01 0)
    (and
      (< k@192@01 (Seq_length c@185@01))
      (and
        (>= j@193@01 0)
        (and (< j@193@01 (Seq_length c@185@01)) (not (= k@192@01 j@193@01))))))
  (and
    (>= k@192@01 0)
    (< k@192@01 (Seq_length c@185@01))
    (>= j@193@01 0)
    (< j@193@01 (Seq_length c@185@01))
    (not (= k@192@01 j@193@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= k@192@01 0)
      (and
        (< k@192@01 (Seq_length c@185@01))
        (and
          (>= j@193@01 0)
          (and (< j@193@01 (Seq_length c@185@01)) (not (= k@192@01 j@193@01)))))))
  (and
    (>= k@192@01 0)
    (and
      (< k@192@01 (Seq_length c@185@01))
      (and
        (>= j@193@01 0)
        (and (< j@193@01 (Seq_length c@185@01)) (not (= k@192@01 j@193@01))))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@192@01 Int) (j@193@01 Int)) (!
  (and
    (=>
      (>= k@192@01 0)
      (and
        (>= k@192@01 0)
        (=>
          (< k@192@01 (Seq_length c@185@01))
          (and
            (< k@192@01 (Seq_length c@185@01))
            (=>
              (>= j@193@01 0)
              (and
                (>= j@193@01 0)
                (or
                  (< j@193@01 (Seq_length c@185@01))
                  (not (< j@193@01 (Seq_length c@185@01))))))
            (or (>= j@193@01 0) (not (>= j@193@01 0)))))
        (or
          (< k@192@01 (Seq_length c@185@01))
          (not (< k@192@01 (Seq_length c@185@01))))))
    (or (>= k@192@01 0) (not (>= k@192@01 0)))
    (=>
      (and
        (>= k@192@01 0)
        (and
          (< k@192@01 (Seq_length c@185@01))
          (and
            (>= j@193@01 0)
            (and (< j@193@01 (Seq_length c@185@01)) (not (= k@192@01 j@193@01))))))
      (and
        (>= k@192@01 0)
        (< k@192@01 (Seq_length c@185@01))
        (>= j@193@01 0)
        (< j@193@01 (Seq_length c@185@01))
        (not (= k@192@01 j@193@01))))
    (or
      (not
        (and
          (>= k@192@01 0)
          (and
            (< k@192@01 (Seq_length c@185@01))
            (and
              (>= j@193@01 0)
              (and
                (< j@193@01 (Seq_length c@185@01))
                (not (= k@192@01 j@193@01)))))))
      (and
        (>= k@192@01 0)
        (and
          (< k@192@01 (Seq_length c@185@01))
          (and
            (>= j@193@01 0)
            (and (< j@193@01 (Seq_length c@185@01)) (not (= k@192@01 j@193@01))))))))
  :pattern ((Seq_index c@185@01 k@192@01) (Seq_index c@185@01 j@193@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_backward_dep_drf_c.vpr@164@12@164@100-aux|)))
(assert (forall ((k@192@01 Int) (j@193@01 Int)) (!
  (=>
    (and
      (>= k@192@01 0)
      (and
        (< k@192@01 (Seq_length c@185@01))
        (and
          (>= j@193@01 0)
          (and (< j@193@01 (Seq_length c@185@01)) (not (= k@192@01 j@193@01))))))
    (not (= (Seq_index c@185@01 k@192@01) (Seq_index c@185@01 j@193@01))))
  :pattern ((Seq_index c@185@01 k@192@01) (Seq_index c@185@01 j@193@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_backward_dep_drf_c.vpr@164@12@164@100|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@187@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@187@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@187@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@187@01))))))
  $Snap.unit))
; [eval] |a| == N
; [eval] |a|
(assert (= (Seq_length a@183@01) N@186@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@187@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@187@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@187@01))))))))))
(declare-const i@194@01 Int)
(push) ; 2
; [eval] 0 <= i && i < N
; [eval] 0 <= i
(push) ; 3
; [then-branch: 66 | !(0 <= i@194@01) | live]
; [else-branch: 66 | 0 <= i@194@01 | live]
(push) ; 4
; [then-branch: 66 | !(0 <= i@194@01)]
(assert (not (<= 0 i@194@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 66 | 0 <= i@194@01]
(assert (<= 0 i@194@01))
; [eval] i < N
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@194@01) (not (<= 0 i@194@01))))
(assert (and (<= 0 i@194@01) (< i@194@01 N@186@01)))
; [eval] a[i]
(push) ; 3
(assert (not (>= i@194@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@194@01 (Seq_length a@183@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@195@01 ($Ref) Int)
(declare-fun img@196@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@194@01 Int)) (!
  (=>
    (and (<= 0 i@194@01) (< i@194@01 N@186@01))
    (or (<= 0 i@194@01) (not (<= 0 i@194@01))))
  :pattern ((Seq_index a@183@01 i@194@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@194@01 Int) (i2@194@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@194@01) (< i1@194@01 N@186@01))
      (and (<= 0 i2@194@01) (< i2@194@01 N@186@01))
      (= (Seq_index a@183@01 i1@194@01) (Seq_index a@183@01 i2@194@01)))
    (= i1@194@01 i2@194@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@194@01 Int)) (!
  (=>
    (and (<= 0 i@194@01) (< i@194@01 N@186@01))
    (and
      (= (inv@195@01 (Seq_index a@183@01 i@194@01)) i@194@01)
      (img@196@01 (Seq_index a@183@01 i@194@01))))
  :pattern ((Seq_index a@183@01 i@194@01))
  :qid |quant-u-96|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@196@01 r) (and (<= 0 (inv@195@01 r)) (< (inv@195@01 r) N@186@01)))
    (= (Seq_index a@183@01 (inv@195@01 r)) r))
  :pattern ((inv@195@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@194@01 Int)) (!
  (=>
    (and (<= 0 i@194@01) (< i@194@01 N@186@01))
    (not (= (Seq_index a@183@01 i@194@01) $Ref.null)))
  :pattern ((Seq_index a@183@01 i@194@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@187@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@187@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@187@01)))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@187@01))))))))
  $Snap.unit))
; [eval] |b| == N
; [eval] |b|
(assert (= (Seq_length b@184@01) N@186@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@187@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@187@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@187@01))))))))))))
(declare-const i@197@01 Int)
(push) ; 2
; [eval] 0 <= i && i < N
; [eval] 0 <= i
(push) ; 3
; [then-branch: 67 | !(0 <= i@197@01) | live]
; [else-branch: 67 | 0 <= i@197@01 | live]
(push) ; 4
; [then-branch: 67 | !(0 <= i@197@01)]
(assert (not (<= 0 i@197@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 67 | 0 <= i@197@01]
(assert (<= 0 i@197@01))
; [eval] i < N
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@197@01) (not (<= 0 i@197@01))))
(assert (and (<= 0 i@197@01) (< i@197@01 N@186@01)))
; [eval] b[i]
(push) ; 3
(assert (not (>= i@197@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@197@01 (Seq_length b@184@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@198@01 ($Ref) Int)
(declare-fun img@199@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@197@01 Int)) (!
  (=>
    (and (<= 0 i@197@01) (< i@197@01 N@186@01))
    (or (<= 0 i@197@01) (not (<= 0 i@197@01))))
  :pattern ((Seq_index b@184@01 i@197@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@197@01 Int) (i2@197@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@197@01) (< i1@197@01 N@186@01))
      (and (<= 0 i2@197@01) (< i2@197@01 N@186@01))
      (= (Seq_index b@184@01 i1@197@01) (Seq_index b@184@01 i2@197@01)))
    (= i1@197@01 i2@197@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@197@01 Int)) (!
  (=>
    (and (<= 0 i@197@01) (< i@197@01 N@186@01))
    (and
      (= (inv@198@01 (Seq_index b@184@01 i@197@01)) i@197@01)
      (img@199@01 (Seq_index b@184@01 i@197@01))))
  :pattern ((Seq_index b@184@01 i@197@01))
  :qid |quant-u-98|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@199@01 r) (and (<= 0 (inv@198@01 r)) (< (inv@198@01 r) N@186@01)))
    (= (Seq_index b@184@01 (inv@198@01 r)) r))
  :pattern ((inv@198@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@197@01 Int)) (!
  (=>
    (and (<= 0 i@197@01) (< i@197@01 N@186@01))
    (not (= (Seq_index b@184@01 i@197@01) $Ref.null)))
  :pattern ((Seq_index b@184@01 i@197@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 2
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index b@184@01 i@197@01) (Seq_index a@183@01 i@194@01))
    (=
      (and
        (img@199@01 r)
        (and (<= 0 (inv@198@01 r)) (< (inv@198@01 r) N@186@01)))
      (and
        (img@196@01 r)
        (and (<= 0 (inv@195@01 r)) (< (inv@195@01 r) N@186@01)))))
  
  :qid |quant-u-99|))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@187@01)))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@187@01))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@187@01)))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@187@01))))))))))
  $Snap.unit))
; [eval] |c| == N
; [eval] |c|
(assert (= (Seq_length c@185@01) N@186@01))
(declare-const i@200@01 Int)
(set-option :timeout 0)
(push) ; 2
; [eval] 0 <= i && i < N
; [eval] 0 <= i
(push) ; 3
; [then-branch: 68 | !(0 <= i@200@01) | live]
; [else-branch: 68 | 0 <= i@200@01 | live]
(push) ; 4
; [then-branch: 68 | !(0 <= i@200@01)]
(assert (not (<= 0 i@200@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 68 | 0 <= i@200@01]
(assert (<= 0 i@200@01))
; [eval] i < N
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@200@01) (not (<= 0 i@200@01))))
(assert (and (<= 0 i@200@01) (< i@200@01 N@186@01)))
; [eval] c[i]
(push) ; 3
(assert (not (>= i@200@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@200@01 (Seq_length c@185@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@201@01 ($Ref) Int)
(declare-fun img@202@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@200@01 Int)) (!
  (=>
    (and (<= 0 i@200@01) (< i@200@01 N@186@01))
    (or (<= 0 i@200@01) (not (<= 0 i@200@01))))
  :pattern ((Seq_index c@185@01 i@200@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@200@01 Int) (i2@200@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@200@01) (< i1@200@01 N@186@01))
      (and (<= 0 i2@200@01) (< i2@200@01 N@186@01))
      (= (Seq_index c@185@01 i1@200@01) (Seq_index c@185@01 i2@200@01)))
    (= i1@200@01 i2@200@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@200@01 Int)) (!
  (=>
    (and (<= 0 i@200@01) (< i@200@01 N@186@01))
    (and
      (= (inv@201@01 (Seq_index c@185@01 i@200@01)) i@200@01)
      (img@202@01 (Seq_index c@185@01 i@200@01))))
  :pattern ((Seq_index c@185@01 i@200@01))
  :qid |quant-u-101|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@202@01 r) (and (<= 0 (inv@201@01 r)) (< (inv@201@01 r) N@186@01)))
    (= (Seq_index c@185@01 (inv@201@01 r)) r))
  :pattern ((inv@201@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@200@01 Int)) (!
  (=>
    (and (<= 0 i@200@01) (< i@200@01 N@186@01))
    (not (= (Seq_index c@185@01 i@200@01) $Ref.null)))
  :pattern ((Seq_index c@185@01 i@200@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 2
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index c@185@01 i@200@01) (Seq_index b@184@01 i@197@01))
    (=
      (and
        (img@202@01 r)
        (and (<= 0 (inv@201@01 r)) (< (inv@201@01 r) N@186@01)))
      (and
        (img@199@01 r)
        (and (<= 0 (inv@198@01 r)) (< (inv@198@01 r) N@186@01)))))
  
  :qid |quant-u-102|))))
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
    (= (Seq_index c@185@01 i@200@01) (Seq_index a@183@01 i@194@01))
    (=
      (and
        (img@202@01 r)
        (and (<= 0 (inv@201@01 r)) (< (inv@201@01 r) N@186@01)))
      (and
        (img@196@01 r)
        (and (<= 0 (inv@195@01 r)) (< (inv@195@01 r) N@186@01)))))
  
  :qid |quant-u-103|))))
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
(declare-const $t@203@01 $Snap)
(assert (= $t@203@01 ($Snap.combine ($Snap.first $t@203@01) ($Snap.second $t@203@01))))
(assert (= ($Snap.first $t@203@01) $Snap.unit))
; [eval] |a| == N
; [eval] |a|
(assert (=
  ($Snap.second $t@203@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@203@01))
    ($Snap.second ($Snap.second $t@203@01)))))
(declare-const i@204@01 Int)
(push) ; 3
; [eval] 0 <= i && i < N
; [eval] 0 <= i
(push) ; 4
; [then-branch: 69 | !(0 <= i@204@01) | live]
; [else-branch: 69 | 0 <= i@204@01 | live]
(push) ; 5
; [then-branch: 69 | !(0 <= i@204@01)]
(assert (not (<= 0 i@204@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 69 | 0 <= i@204@01]
(assert (<= 0 i@204@01))
; [eval] i < N
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@204@01) (not (<= 0 i@204@01))))
(assert (and (<= 0 i@204@01) (< i@204@01 N@186@01)))
; [eval] a[i]
(push) ; 4
(assert (not (>= i@204@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@204@01 (Seq_length a@183@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@205@01 ($Ref) Int)
(declare-fun img@206@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@204@01 Int)) (!
  (=>
    (and (<= 0 i@204@01) (< i@204@01 N@186@01))
    (or (<= 0 i@204@01) (not (<= 0 i@204@01))))
  :pattern ((Seq_index a@183@01 i@204@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@204@01 Int) (i2@204@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@204@01) (< i1@204@01 N@186@01))
      (and (<= 0 i2@204@01) (< i2@204@01 N@186@01))
      (= (Seq_index a@183@01 i1@204@01) (Seq_index a@183@01 i2@204@01)))
    (= i1@204@01 i2@204@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@204@01 Int)) (!
  (=>
    (and (<= 0 i@204@01) (< i@204@01 N@186@01))
    (and
      (= (inv@205@01 (Seq_index a@183@01 i@204@01)) i@204@01)
      (img@206@01 (Seq_index a@183@01 i@204@01))))
  :pattern ((Seq_index a@183@01 i@204@01))
  :qid |quant-u-105|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@206@01 r) (and (<= 0 (inv@205@01 r)) (< (inv@205@01 r) N@186@01)))
    (= (Seq_index a@183@01 (inv@205@01 r)) r))
  :pattern ((inv@205@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@204@01 Int)) (!
  (=>
    (and (<= 0 i@204@01) (< i@204@01 N@186@01))
    (not (= (Seq_index a@183@01 i@204@01) $Ref.null)))
  :pattern ((Seq_index a@183@01 i@204@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second $t@203@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@203@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@203@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@203@01))) $Snap.unit))
; [eval] |b| == N
; [eval] |b|
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@203@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@203@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@203@01)))))))
(declare-const i@207@01 Int)
(push) ; 3
; [eval] 0 <= i && i < N
; [eval] 0 <= i
(push) ; 4
; [then-branch: 70 | !(0 <= i@207@01) | live]
; [else-branch: 70 | 0 <= i@207@01 | live]
(push) ; 5
; [then-branch: 70 | !(0 <= i@207@01)]
(assert (not (<= 0 i@207@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 70 | 0 <= i@207@01]
(assert (<= 0 i@207@01))
; [eval] i < N
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@207@01) (not (<= 0 i@207@01))))
(assert (and (<= 0 i@207@01) (< i@207@01 N@186@01)))
; [eval] b[i]
(push) ; 4
(assert (not (>= i@207@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@207@01 (Seq_length b@184@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@208@01 ($Ref) Int)
(declare-fun img@209@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@207@01 Int)) (!
  (=>
    (and (<= 0 i@207@01) (< i@207@01 N@186@01))
    (or (<= 0 i@207@01) (not (<= 0 i@207@01))))
  :pattern ((Seq_index b@184@01 i@207@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@207@01 Int) (i2@207@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@207@01) (< i1@207@01 N@186@01))
      (and (<= 0 i2@207@01) (< i2@207@01 N@186@01))
      (= (Seq_index b@184@01 i1@207@01) (Seq_index b@184@01 i2@207@01)))
    (= i1@207@01 i2@207@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@207@01 Int)) (!
  (=>
    (and (<= 0 i@207@01) (< i@207@01 N@186@01))
    (and
      (= (inv@208@01 (Seq_index b@184@01 i@207@01)) i@207@01)
      (img@209@01 (Seq_index b@184@01 i@207@01))))
  :pattern ((Seq_index b@184@01 i@207@01))
  :qid |quant-u-107|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@209@01 r) (and (<= 0 (inv@208@01 r)) (< (inv@208@01 r) N@186@01)))
    (= (Seq_index b@184@01 (inv@208@01 r)) r))
  :pattern ((inv@208@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@207@01 Int)) (!
  (=>
    (and (<= 0 i@207@01) (< i@207@01 N@186@01))
    (not (= (Seq_index b@184@01 i@207@01) $Ref.null)))
  :pattern ((Seq_index b@184@01 i@207@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index b@184@01 i@207@01) (Seq_index a@183@01 i@204@01))
    (=
      (and
        (img@209@01 r)
        (and (<= 0 (inv@208@01 r)) (< (inv@208@01 r) N@186@01)))
      (and
        (img@206@01 r)
        (and (<= 0 (inv@205@01 r)) (< (inv@205@01 r) N@186@01)))))
  
  :qid |quant-u-108|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@203@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@203@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@203@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@203@01)))))
  $Snap.unit))
; [eval] |c| == N
; [eval] |c|
(declare-const i@210@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i && i < N
; [eval] 0 <= i
(push) ; 4
; [then-branch: 71 | !(0 <= i@210@01) | live]
; [else-branch: 71 | 0 <= i@210@01 | live]
(push) ; 5
; [then-branch: 71 | !(0 <= i@210@01)]
(assert (not (<= 0 i@210@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 71 | 0 <= i@210@01]
(assert (<= 0 i@210@01))
; [eval] i < N
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@210@01) (not (<= 0 i@210@01))))
(assert (and (<= 0 i@210@01) (< i@210@01 N@186@01)))
; [eval] c[i]
(push) ; 4
(assert (not (>= i@210@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@210@01 (Seq_length c@185@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@211@01 ($Ref) Int)
(declare-fun img@212@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@210@01 Int)) (!
  (=>
    (and (<= 0 i@210@01) (< i@210@01 N@186@01))
    (or (<= 0 i@210@01) (not (<= 0 i@210@01))))
  :pattern ((Seq_index c@185@01 i@210@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@210@01 Int) (i2@210@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@210@01) (< i1@210@01 N@186@01))
      (and (<= 0 i2@210@01) (< i2@210@01 N@186@01))
      (= (Seq_index c@185@01 i1@210@01) (Seq_index c@185@01 i2@210@01)))
    (= i1@210@01 i2@210@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@210@01 Int)) (!
  (=>
    (and (<= 0 i@210@01) (< i@210@01 N@186@01))
    (and
      (= (inv@211@01 (Seq_index c@185@01 i@210@01)) i@210@01)
      (img@212@01 (Seq_index c@185@01 i@210@01))))
  :pattern ((Seq_index c@185@01 i@210@01))
  :qid |quant-u-110|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@212@01 r) (and (<= 0 (inv@211@01 r)) (< (inv@211@01 r) N@186@01)))
    (= (Seq_index c@185@01 (inv@211@01 r)) r))
  :pattern ((inv@211@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@210@01 Int)) (!
  (=>
    (and (<= 0 i@210@01) (< i@210@01 N@186@01))
    (not (= (Seq_index c@185@01 i@210@01) $Ref.null)))
  :pattern ((Seq_index c@185@01 i@210@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index c@185@01 i@210@01) (Seq_index b@184@01 i@207@01))
    (=
      (and
        (img@212@01 r)
        (and (<= 0 (inv@211@01 r)) (< (inv@211@01 r) N@186@01)))
      (and
        (img@209@01 r)
        (and (<= 0 (inv@208@01 r)) (< (inv@208@01 r) N@186@01)))))
  
  :qid |quant-u-111|))))
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
    (= (Seq_index c@185@01 i@210@01) (Seq_index a@183@01 i@204@01))
    (=
      (and
        (img@212@01 r)
        (and (<= 0 (inv@211@01 r)) (< (inv@211@01 r) N@186@01)))
      (and
        (img@206@01 r)
        (and (<= 0 (inv@205@01 r)) (< (inv@205@01 r) N@186@01)))))
  
  :qid |quant-u-112|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
; [exec]
; Ref__loop_main_45(diz, current_thread_id, b, a, N, c)
; [eval] diz != null
; [eval] current_thread_id >= 0
; [eval] (forall k: Int, j: Int :: { a[k], a[j] } k >= 0 && (k < |a| && (j >= 0 && (j < |a| && k != j))) ==> a[k] != a[j])
(declare-const k@213@01 Int)
(declare-const j@214@01 Int)
(push) ; 3
; [eval] k >= 0 && (k < |a| && (j >= 0 && (j < |a| && k != j))) ==> a[k] != a[j]
; [eval] k >= 0 && (k < |a| && (j >= 0 && (j < |a| && k != j)))
; [eval] k >= 0
(push) ; 4
; [then-branch: 72 | !(k@213@01 >= 0) | live]
; [else-branch: 72 | k@213@01 >= 0 | live]
(push) ; 5
; [then-branch: 72 | !(k@213@01 >= 0)]
(assert (not (>= k@213@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 72 | k@213@01 >= 0]
(assert (>= k@213@01 0))
; [eval] k < |a|
; [eval] |a|
(push) ; 6
; [then-branch: 73 | !(k@213@01 < |a@183@01|) | live]
; [else-branch: 73 | k@213@01 < |a@183@01| | live]
(push) ; 7
; [then-branch: 73 | !(k@213@01 < |a@183@01|)]
(assert (not (< k@213@01 (Seq_length a@183@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 73 | k@213@01 < |a@183@01|]
(assert (< k@213@01 (Seq_length a@183@01)))
; [eval] j >= 0
(push) ; 8
; [then-branch: 74 | !(j@214@01 >= 0) | live]
; [else-branch: 74 | j@214@01 >= 0 | live]
(push) ; 9
; [then-branch: 74 | !(j@214@01 >= 0)]
(assert (not (>= j@214@01 0)))
(pop) ; 9
(push) ; 9
; [else-branch: 74 | j@214@01 >= 0]
(assert (>= j@214@01 0))
; [eval] j < |a|
; [eval] |a|
(push) ; 10
; [then-branch: 75 | !(j@214@01 < |a@183@01|) | live]
; [else-branch: 75 | j@214@01 < |a@183@01| | live]
(push) ; 11
; [then-branch: 75 | !(j@214@01 < |a@183@01|)]
(assert (not (< j@214@01 (Seq_length a@183@01))))
(pop) ; 11
(push) ; 11
; [else-branch: 75 | j@214@01 < |a@183@01|]
(assert (< j@214@01 (Seq_length a@183@01)))
; [eval] k != j
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or (< j@214@01 (Seq_length a@183@01)) (not (< j@214@01 (Seq_length a@183@01)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@214@01 0)
  (and
    (>= j@214@01 0)
    (or
      (< j@214@01 (Seq_length a@183@01))
      (not (< j@214@01 (Seq_length a@183@01)))))))
(assert (or (>= j@214@01 0) (not (>= j@214@01 0))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< k@213@01 (Seq_length a@183@01))
  (and
    (< k@213@01 (Seq_length a@183@01))
    (=>
      (>= j@214@01 0)
      (and
        (>= j@214@01 0)
        (or
          (< j@214@01 (Seq_length a@183@01))
          (not (< j@214@01 (Seq_length a@183@01))))))
    (or (>= j@214@01 0) (not (>= j@214@01 0))))))
(assert (or (< k@213@01 (Seq_length a@183@01)) (not (< k@213@01 (Seq_length a@183@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= k@213@01 0)
  (and
    (>= k@213@01 0)
    (=>
      (< k@213@01 (Seq_length a@183@01))
      (and
        (< k@213@01 (Seq_length a@183@01))
        (=>
          (>= j@214@01 0)
          (and
            (>= j@214@01 0)
            (or
              (< j@214@01 (Seq_length a@183@01))
              (not (< j@214@01 (Seq_length a@183@01))))))
        (or (>= j@214@01 0) (not (>= j@214@01 0)))))
    (or
      (< k@213@01 (Seq_length a@183@01))
      (not (< k@213@01 (Seq_length a@183@01)))))))
(assert (or (>= k@213@01 0) (not (>= k@213@01 0))))
(push) ; 4
; [then-branch: 76 | k@213@01 >= 0 && k@213@01 < |a@183@01| && j@214@01 >= 0 && j@214@01 < |a@183@01| && k@213@01 != j@214@01 | live]
; [else-branch: 76 | !(k@213@01 >= 0 && k@213@01 < |a@183@01| && j@214@01 >= 0 && j@214@01 < |a@183@01| && k@213@01 != j@214@01) | live]
(push) ; 5
; [then-branch: 76 | k@213@01 >= 0 && k@213@01 < |a@183@01| && j@214@01 >= 0 && j@214@01 < |a@183@01| && k@213@01 != j@214@01]
(assert (and
  (>= k@213@01 0)
  (and
    (< k@213@01 (Seq_length a@183@01))
    (and
      (>= j@214@01 0)
      (and (< j@214@01 (Seq_length a@183@01)) (not (= k@213@01 j@214@01)))))))
; [eval] a[k] != a[j]
; [eval] a[k]
; [eval] a[j]
(pop) ; 5
(push) ; 5
; [else-branch: 76 | !(k@213@01 >= 0 && k@213@01 < |a@183@01| && j@214@01 >= 0 && j@214@01 < |a@183@01| && k@213@01 != j@214@01)]
(assert (not
  (and
    (>= k@213@01 0)
    (and
      (< k@213@01 (Seq_length a@183@01))
      (and
        (>= j@214@01 0)
        (and (< j@214@01 (Seq_length a@183@01)) (not (= k@213@01 j@214@01))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (>= k@213@01 0)
    (and
      (< k@213@01 (Seq_length a@183@01))
      (and
        (>= j@214@01 0)
        (and (< j@214@01 (Seq_length a@183@01)) (not (= k@213@01 j@214@01))))))
  (and
    (>= k@213@01 0)
    (< k@213@01 (Seq_length a@183@01))
    (>= j@214@01 0)
    (< j@214@01 (Seq_length a@183@01))
    (not (= k@213@01 j@214@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= k@213@01 0)
      (and
        (< k@213@01 (Seq_length a@183@01))
        (and
          (>= j@214@01 0)
          (and (< j@214@01 (Seq_length a@183@01)) (not (= k@213@01 j@214@01)))))))
  (and
    (>= k@213@01 0)
    (and
      (< k@213@01 (Seq_length a@183@01))
      (and
        (>= j@214@01 0)
        (and (< j@214@01 (Seq_length a@183@01)) (not (= k@213@01 j@214@01))))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@213@01 Int) (j@214@01 Int)) (!
  (and
    (=>
      (>= k@213@01 0)
      (and
        (>= k@213@01 0)
        (=>
          (< k@213@01 (Seq_length a@183@01))
          (and
            (< k@213@01 (Seq_length a@183@01))
            (=>
              (>= j@214@01 0)
              (and
                (>= j@214@01 0)
                (or
                  (< j@214@01 (Seq_length a@183@01))
                  (not (< j@214@01 (Seq_length a@183@01))))))
            (or (>= j@214@01 0) (not (>= j@214@01 0)))))
        (or
          (< k@213@01 (Seq_length a@183@01))
          (not (< k@213@01 (Seq_length a@183@01))))))
    (or (>= k@213@01 0) (not (>= k@213@01 0)))
    (=>
      (and
        (>= k@213@01 0)
        (and
          (< k@213@01 (Seq_length a@183@01))
          (and
            (>= j@214@01 0)
            (and (< j@214@01 (Seq_length a@183@01)) (not (= k@213@01 j@214@01))))))
      (and
        (>= k@213@01 0)
        (< k@213@01 (Seq_length a@183@01))
        (>= j@214@01 0)
        (< j@214@01 (Seq_length a@183@01))
        (not (= k@213@01 j@214@01))))
    (or
      (not
        (and
          (>= k@213@01 0)
          (and
            (< k@213@01 (Seq_length a@183@01))
            (and
              (>= j@214@01 0)
              (and
                (< j@214@01 (Seq_length a@183@01))
                (not (= k@213@01 j@214@01)))))))
      (and
        (>= k@213@01 0)
        (and
          (< k@213@01 (Seq_length a@183@01))
          (and
            (>= j@214@01 0)
            (and (< j@214@01 (Seq_length a@183@01)) (not (= k@213@01 j@214@01))))))))
  :pattern ((Seq_index a@183@01 k@213@01) (Seq_index a@183@01 j@214@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_backward_dep_drf_c.vpr@61@12@61@100-aux|)))
(push) ; 3
(assert (not (forall ((k@213@01 Int) (j@214@01 Int)) (!
  (=>
    (and
      (>= k@213@01 0)
      (and
        (< k@213@01 (Seq_length a@183@01))
        (and
          (>= j@214@01 0)
          (and (< j@214@01 (Seq_length a@183@01)) (not (= k@213@01 j@214@01))))))
    (not (= (Seq_index a@183@01 k@213@01) (Seq_index a@183@01 j@214@01))))
  :pattern ((Seq_index a@183@01 k@213@01) (Seq_index a@183@01 j@214@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_backward_dep_drf_c.vpr@61@12@61@100|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((k@213@01 Int) (j@214@01 Int)) (!
  (=>
    (and
      (>= k@213@01 0)
      (and
        (< k@213@01 (Seq_length a@183@01))
        (and
          (>= j@214@01 0)
          (and (< j@214@01 (Seq_length a@183@01)) (not (= k@213@01 j@214@01))))))
    (not (= (Seq_index a@183@01 k@213@01) (Seq_index a@183@01 j@214@01))))
  :pattern ((Seq_index a@183@01 k@213@01) (Seq_index a@183@01 j@214@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_backward_dep_drf_c.vpr@61@12@61@100|)))
; [eval] (forall k: Int, j: Int :: { b[k], b[j] } k >= 0 && (k < |b| && (j >= 0 && (j < |b| && k != j))) ==> b[k] != b[j])
(declare-const k@215@01 Int)
(declare-const j@216@01 Int)
(push) ; 3
; [eval] k >= 0 && (k < |b| && (j >= 0 && (j < |b| && k != j))) ==> b[k] != b[j]
; [eval] k >= 0 && (k < |b| && (j >= 0 && (j < |b| && k != j)))
; [eval] k >= 0
(push) ; 4
; [then-branch: 77 | !(k@215@01 >= 0) | live]
; [else-branch: 77 | k@215@01 >= 0 | live]
(push) ; 5
; [then-branch: 77 | !(k@215@01 >= 0)]
(assert (not (>= k@215@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 77 | k@215@01 >= 0]
(assert (>= k@215@01 0))
; [eval] k < |b|
; [eval] |b|
(push) ; 6
; [then-branch: 78 | !(k@215@01 < |b@184@01|) | live]
; [else-branch: 78 | k@215@01 < |b@184@01| | live]
(push) ; 7
; [then-branch: 78 | !(k@215@01 < |b@184@01|)]
(assert (not (< k@215@01 (Seq_length b@184@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 78 | k@215@01 < |b@184@01|]
(assert (< k@215@01 (Seq_length b@184@01)))
; [eval] j >= 0
(push) ; 8
; [then-branch: 79 | !(j@216@01 >= 0) | live]
; [else-branch: 79 | j@216@01 >= 0 | live]
(push) ; 9
; [then-branch: 79 | !(j@216@01 >= 0)]
(assert (not (>= j@216@01 0)))
(pop) ; 9
(push) ; 9
; [else-branch: 79 | j@216@01 >= 0]
(assert (>= j@216@01 0))
; [eval] j < |b|
; [eval] |b|
(push) ; 10
; [then-branch: 80 | !(j@216@01 < |b@184@01|) | live]
; [else-branch: 80 | j@216@01 < |b@184@01| | live]
(push) ; 11
; [then-branch: 80 | !(j@216@01 < |b@184@01|)]
(assert (not (< j@216@01 (Seq_length b@184@01))))
(pop) ; 11
(push) ; 11
; [else-branch: 80 | j@216@01 < |b@184@01|]
(assert (< j@216@01 (Seq_length b@184@01)))
; [eval] k != j
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or (< j@216@01 (Seq_length b@184@01)) (not (< j@216@01 (Seq_length b@184@01)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@216@01 0)
  (and
    (>= j@216@01 0)
    (or
      (< j@216@01 (Seq_length b@184@01))
      (not (< j@216@01 (Seq_length b@184@01)))))))
(assert (or (>= j@216@01 0) (not (>= j@216@01 0))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< k@215@01 (Seq_length b@184@01))
  (and
    (< k@215@01 (Seq_length b@184@01))
    (=>
      (>= j@216@01 0)
      (and
        (>= j@216@01 0)
        (or
          (< j@216@01 (Seq_length b@184@01))
          (not (< j@216@01 (Seq_length b@184@01))))))
    (or (>= j@216@01 0) (not (>= j@216@01 0))))))
(assert (or (< k@215@01 (Seq_length b@184@01)) (not (< k@215@01 (Seq_length b@184@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= k@215@01 0)
  (and
    (>= k@215@01 0)
    (=>
      (< k@215@01 (Seq_length b@184@01))
      (and
        (< k@215@01 (Seq_length b@184@01))
        (=>
          (>= j@216@01 0)
          (and
            (>= j@216@01 0)
            (or
              (< j@216@01 (Seq_length b@184@01))
              (not (< j@216@01 (Seq_length b@184@01))))))
        (or (>= j@216@01 0) (not (>= j@216@01 0)))))
    (or
      (< k@215@01 (Seq_length b@184@01))
      (not (< k@215@01 (Seq_length b@184@01)))))))
(assert (or (>= k@215@01 0) (not (>= k@215@01 0))))
(push) ; 4
; [then-branch: 81 | k@215@01 >= 0 && k@215@01 < |b@184@01| && j@216@01 >= 0 && j@216@01 < |b@184@01| && k@215@01 != j@216@01 | live]
; [else-branch: 81 | !(k@215@01 >= 0 && k@215@01 < |b@184@01| && j@216@01 >= 0 && j@216@01 < |b@184@01| && k@215@01 != j@216@01) | live]
(push) ; 5
; [then-branch: 81 | k@215@01 >= 0 && k@215@01 < |b@184@01| && j@216@01 >= 0 && j@216@01 < |b@184@01| && k@215@01 != j@216@01]
(assert (and
  (>= k@215@01 0)
  (and
    (< k@215@01 (Seq_length b@184@01))
    (and
      (>= j@216@01 0)
      (and (< j@216@01 (Seq_length b@184@01)) (not (= k@215@01 j@216@01)))))))
; [eval] b[k] != b[j]
; [eval] b[k]
; [eval] b[j]
(pop) ; 5
(push) ; 5
; [else-branch: 81 | !(k@215@01 >= 0 && k@215@01 < |b@184@01| && j@216@01 >= 0 && j@216@01 < |b@184@01| && k@215@01 != j@216@01)]
(assert (not
  (and
    (>= k@215@01 0)
    (and
      (< k@215@01 (Seq_length b@184@01))
      (and
        (>= j@216@01 0)
        (and (< j@216@01 (Seq_length b@184@01)) (not (= k@215@01 j@216@01))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (>= k@215@01 0)
    (and
      (< k@215@01 (Seq_length b@184@01))
      (and
        (>= j@216@01 0)
        (and (< j@216@01 (Seq_length b@184@01)) (not (= k@215@01 j@216@01))))))
  (and
    (>= k@215@01 0)
    (< k@215@01 (Seq_length b@184@01))
    (>= j@216@01 0)
    (< j@216@01 (Seq_length b@184@01))
    (not (= k@215@01 j@216@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= k@215@01 0)
      (and
        (< k@215@01 (Seq_length b@184@01))
        (and
          (>= j@216@01 0)
          (and (< j@216@01 (Seq_length b@184@01)) (not (= k@215@01 j@216@01)))))))
  (and
    (>= k@215@01 0)
    (and
      (< k@215@01 (Seq_length b@184@01))
      (and
        (>= j@216@01 0)
        (and (< j@216@01 (Seq_length b@184@01)) (not (= k@215@01 j@216@01))))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@215@01 Int) (j@216@01 Int)) (!
  (and
    (=>
      (>= k@215@01 0)
      (and
        (>= k@215@01 0)
        (=>
          (< k@215@01 (Seq_length b@184@01))
          (and
            (< k@215@01 (Seq_length b@184@01))
            (=>
              (>= j@216@01 0)
              (and
                (>= j@216@01 0)
                (or
                  (< j@216@01 (Seq_length b@184@01))
                  (not (< j@216@01 (Seq_length b@184@01))))))
            (or (>= j@216@01 0) (not (>= j@216@01 0)))))
        (or
          (< k@215@01 (Seq_length b@184@01))
          (not (< k@215@01 (Seq_length b@184@01))))))
    (or (>= k@215@01 0) (not (>= k@215@01 0)))
    (=>
      (and
        (>= k@215@01 0)
        (and
          (< k@215@01 (Seq_length b@184@01))
          (and
            (>= j@216@01 0)
            (and (< j@216@01 (Seq_length b@184@01)) (not (= k@215@01 j@216@01))))))
      (and
        (>= k@215@01 0)
        (< k@215@01 (Seq_length b@184@01))
        (>= j@216@01 0)
        (< j@216@01 (Seq_length b@184@01))
        (not (= k@215@01 j@216@01))))
    (or
      (not
        (and
          (>= k@215@01 0)
          (and
            (< k@215@01 (Seq_length b@184@01))
            (and
              (>= j@216@01 0)
              (and
                (< j@216@01 (Seq_length b@184@01))
                (not (= k@215@01 j@216@01)))))))
      (and
        (>= k@215@01 0)
        (and
          (< k@215@01 (Seq_length b@184@01))
          (and
            (>= j@216@01 0)
            (and (< j@216@01 (Seq_length b@184@01)) (not (= k@215@01 j@216@01))))))))
  :pattern ((Seq_index b@184@01 k@215@01) (Seq_index b@184@01 j@216@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_backward_dep_drf_c.vpr@62@12@62@100-aux|)))
(push) ; 3
(assert (not (forall ((k@215@01 Int) (j@216@01 Int)) (!
  (=>
    (and
      (>= k@215@01 0)
      (and
        (< k@215@01 (Seq_length b@184@01))
        (and
          (>= j@216@01 0)
          (and (< j@216@01 (Seq_length b@184@01)) (not (= k@215@01 j@216@01))))))
    (not (= (Seq_index b@184@01 k@215@01) (Seq_index b@184@01 j@216@01))))
  :pattern ((Seq_index b@184@01 k@215@01) (Seq_index b@184@01 j@216@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_backward_dep_drf_c.vpr@62@12@62@100|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((k@215@01 Int) (j@216@01 Int)) (!
  (=>
    (and
      (>= k@215@01 0)
      (and
        (< k@215@01 (Seq_length b@184@01))
        (and
          (>= j@216@01 0)
          (and (< j@216@01 (Seq_length b@184@01)) (not (= k@215@01 j@216@01))))))
    (not (= (Seq_index b@184@01 k@215@01) (Seq_index b@184@01 j@216@01))))
  :pattern ((Seq_index b@184@01 k@215@01) (Seq_index b@184@01 j@216@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_backward_dep_drf_c.vpr@62@12@62@100|)))
; [eval] (forall k: Int, j: Int :: { c[k], c[j] } k >= 0 && (k < |c| && (j >= 0 && (j < |c| && k != j))) ==> c[k] != c[j])
(declare-const k@217@01 Int)
(declare-const j@218@01 Int)
(push) ; 3
; [eval] k >= 0 && (k < |c| && (j >= 0 && (j < |c| && k != j))) ==> c[k] != c[j]
; [eval] k >= 0 && (k < |c| && (j >= 0 && (j < |c| && k != j)))
; [eval] k >= 0
(push) ; 4
; [then-branch: 82 | !(k@217@01 >= 0) | live]
; [else-branch: 82 | k@217@01 >= 0 | live]
(push) ; 5
; [then-branch: 82 | !(k@217@01 >= 0)]
(assert (not (>= k@217@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 82 | k@217@01 >= 0]
(assert (>= k@217@01 0))
; [eval] k < |c|
; [eval] |c|
(push) ; 6
; [then-branch: 83 | !(k@217@01 < |c@185@01|) | live]
; [else-branch: 83 | k@217@01 < |c@185@01| | live]
(push) ; 7
; [then-branch: 83 | !(k@217@01 < |c@185@01|)]
(assert (not (< k@217@01 (Seq_length c@185@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 83 | k@217@01 < |c@185@01|]
(assert (< k@217@01 (Seq_length c@185@01)))
; [eval] j >= 0
(push) ; 8
; [then-branch: 84 | !(j@218@01 >= 0) | live]
; [else-branch: 84 | j@218@01 >= 0 | live]
(push) ; 9
; [then-branch: 84 | !(j@218@01 >= 0)]
(assert (not (>= j@218@01 0)))
(pop) ; 9
(push) ; 9
; [else-branch: 84 | j@218@01 >= 0]
(assert (>= j@218@01 0))
; [eval] j < |c|
; [eval] |c|
(push) ; 10
; [then-branch: 85 | !(j@218@01 < |c@185@01|) | live]
; [else-branch: 85 | j@218@01 < |c@185@01| | live]
(push) ; 11
; [then-branch: 85 | !(j@218@01 < |c@185@01|)]
(assert (not (< j@218@01 (Seq_length c@185@01))))
(pop) ; 11
(push) ; 11
; [else-branch: 85 | j@218@01 < |c@185@01|]
(assert (< j@218@01 (Seq_length c@185@01)))
; [eval] k != j
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or (< j@218@01 (Seq_length c@185@01)) (not (< j@218@01 (Seq_length c@185@01)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@218@01 0)
  (and
    (>= j@218@01 0)
    (or
      (< j@218@01 (Seq_length c@185@01))
      (not (< j@218@01 (Seq_length c@185@01)))))))
(assert (or (>= j@218@01 0) (not (>= j@218@01 0))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< k@217@01 (Seq_length c@185@01))
  (and
    (< k@217@01 (Seq_length c@185@01))
    (=>
      (>= j@218@01 0)
      (and
        (>= j@218@01 0)
        (or
          (< j@218@01 (Seq_length c@185@01))
          (not (< j@218@01 (Seq_length c@185@01))))))
    (or (>= j@218@01 0) (not (>= j@218@01 0))))))
(assert (or (< k@217@01 (Seq_length c@185@01)) (not (< k@217@01 (Seq_length c@185@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= k@217@01 0)
  (and
    (>= k@217@01 0)
    (=>
      (< k@217@01 (Seq_length c@185@01))
      (and
        (< k@217@01 (Seq_length c@185@01))
        (=>
          (>= j@218@01 0)
          (and
            (>= j@218@01 0)
            (or
              (< j@218@01 (Seq_length c@185@01))
              (not (< j@218@01 (Seq_length c@185@01))))))
        (or (>= j@218@01 0) (not (>= j@218@01 0)))))
    (or
      (< k@217@01 (Seq_length c@185@01))
      (not (< k@217@01 (Seq_length c@185@01)))))))
(assert (or (>= k@217@01 0) (not (>= k@217@01 0))))
(push) ; 4
; [then-branch: 86 | k@217@01 >= 0 && k@217@01 < |c@185@01| && j@218@01 >= 0 && j@218@01 < |c@185@01| && k@217@01 != j@218@01 | live]
; [else-branch: 86 | !(k@217@01 >= 0 && k@217@01 < |c@185@01| && j@218@01 >= 0 && j@218@01 < |c@185@01| && k@217@01 != j@218@01) | live]
(push) ; 5
; [then-branch: 86 | k@217@01 >= 0 && k@217@01 < |c@185@01| && j@218@01 >= 0 && j@218@01 < |c@185@01| && k@217@01 != j@218@01]
(assert (and
  (>= k@217@01 0)
  (and
    (< k@217@01 (Seq_length c@185@01))
    (and
      (>= j@218@01 0)
      (and (< j@218@01 (Seq_length c@185@01)) (not (= k@217@01 j@218@01)))))))
; [eval] c[k] != c[j]
; [eval] c[k]
; [eval] c[j]
(pop) ; 5
(push) ; 5
; [else-branch: 86 | !(k@217@01 >= 0 && k@217@01 < |c@185@01| && j@218@01 >= 0 && j@218@01 < |c@185@01| && k@217@01 != j@218@01)]
(assert (not
  (and
    (>= k@217@01 0)
    (and
      (< k@217@01 (Seq_length c@185@01))
      (and
        (>= j@218@01 0)
        (and (< j@218@01 (Seq_length c@185@01)) (not (= k@217@01 j@218@01))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (>= k@217@01 0)
    (and
      (< k@217@01 (Seq_length c@185@01))
      (and
        (>= j@218@01 0)
        (and (< j@218@01 (Seq_length c@185@01)) (not (= k@217@01 j@218@01))))))
  (and
    (>= k@217@01 0)
    (< k@217@01 (Seq_length c@185@01))
    (>= j@218@01 0)
    (< j@218@01 (Seq_length c@185@01))
    (not (= k@217@01 j@218@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= k@217@01 0)
      (and
        (< k@217@01 (Seq_length c@185@01))
        (and
          (>= j@218@01 0)
          (and (< j@218@01 (Seq_length c@185@01)) (not (= k@217@01 j@218@01)))))))
  (and
    (>= k@217@01 0)
    (and
      (< k@217@01 (Seq_length c@185@01))
      (and
        (>= j@218@01 0)
        (and (< j@218@01 (Seq_length c@185@01)) (not (= k@217@01 j@218@01))))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@217@01 Int) (j@218@01 Int)) (!
  (and
    (=>
      (>= k@217@01 0)
      (and
        (>= k@217@01 0)
        (=>
          (< k@217@01 (Seq_length c@185@01))
          (and
            (< k@217@01 (Seq_length c@185@01))
            (=>
              (>= j@218@01 0)
              (and
                (>= j@218@01 0)
                (or
                  (< j@218@01 (Seq_length c@185@01))
                  (not (< j@218@01 (Seq_length c@185@01))))))
            (or (>= j@218@01 0) (not (>= j@218@01 0)))))
        (or
          (< k@217@01 (Seq_length c@185@01))
          (not (< k@217@01 (Seq_length c@185@01))))))
    (or (>= k@217@01 0) (not (>= k@217@01 0)))
    (=>
      (and
        (>= k@217@01 0)
        (and
          (< k@217@01 (Seq_length c@185@01))
          (and
            (>= j@218@01 0)
            (and (< j@218@01 (Seq_length c@185@01)) (not (= k@217@01 j@218@01))))))
      (and
        (>= k@217@01 0)
        (< k@217@01 (Seq_length c@185@01))
        (>= j@218@01 0)
        (< j@218@01 (Seq_length c@185@01))
        (not (= k@217@01 j@218@01))))
    (or
      (not
        (and
          (>= k@217@01 0)
          (and
            (< k@217@01 (Seq_length c@185@01))
            (and
              (>= j@218@01 0)
              (and
                (< j@218@01 (Seq_length c@185@01))
                (not (= k@217@01 j@218@01)))))))
      (and
        (>= k@217@01 0)
        (and
          (< k@217@01 (Seq_length c@185@01))
          (and
            (>= j@218@01 0)
            (and (< j@218@01 (Seq_length c@185@01)) (not (= k@217@01 j@218@01))))))))
  :pattern ((Seq_index c@185@01 k@217@01) (Seq_index c@185@01 j@218@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_backward_dep_drf_c.vpr@63@12@63@100-aux|)))
(push) ; 3
(assert (not (forall ((k@217@01 Int) (j@218@01 Int)) (!
  (=>
    (and
      (>= k@217@01 0)
      (and
        (< k@217@01 (Seq_length c@185@01))
        (and
          (>= j@218@01 0)
          (and (< j@218@01 (Seq_length c@185@01)) (not (= k@217@01 j@218@01))))))
    (not (= (Seq_index c@185@01 k@217@01) (Seq_index c@185@01 j@218@01))))
  :pattern ((Seq_index c@185@01 k@217@01) (Seq_index c@185@01 j@218@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_backward_dep_drf_c.vpr@63@12@63@100|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((k@217@01 Int) (j@218@01 Int)) (!
  (=>
    (and
      (>= k@217@01 0)
      (and
        (< k@217@01 (Seq_length c@185@01))
        (and
          (>= j@218@01 0)
          (and (< j@218@01 (Seq_length c@185@01)) (not (= k@217@01 j@218@01))))))
    (not (= (Seq_index c@185@01 k@217@01) (Seq_index c@185@01 j@218@01))))
  :pattern ((Seq_index c@185@01 k@217@01) (Seq_index c@185@01 j@218@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_backward_dep_drf_c.vpr@63@12@63@100|)))
; [eval] N <= |a|
; [eval] |a|
(push) ; 3
(assert (not (<= N@186@01 (Seq_length a@183@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (<= N@186@01 (Seq_length a@183@01)))
(declare-const i@219@01 Int)
(push) ; 3
; [eval] 0 <= i && i < N
; [eval] 0 <= i
(push) ; 4
; [then-branch: 87 | !(0 <= i@219@01) | live]
; [else-branch: 87 | 0 <= i@219@01 | live]
(push) ; 5
; [then-branch: 87 | !(0 <= i@219@01)]
(assert (not (<= 0 i@219@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 87 | 0 <= i@219@01]
(assert (<= 0 i@219@01))
; [eval] i < N
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@219@01) (not (<= 0 i@219@01))))
(assert (and (<= 0 i@219@01) (< i@219@01 N@186@01)))
; [eval] a[i]
(push) ; 4
(assert (not (>= i@219@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@219@01 (Seq_length a@183@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@220@01 ($Ref) Int)
(declare-fun img@221@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@219@01 Int)) (!
  (=>
    (and (<= 0 i@219@01) (< i@219@01 N@186@01))
    (or (<= 0 i@219@01) (not (<= 0 i@219@01))))
  :pattern ((Seq_index a@183@01 i@219@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@219@01 Int) (i2@219@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@219@01) (< i1@219@01 N@186@01))
      (and (<= 0 i2@219@01) (< i2@219@01 N@186@01))
      (= (Seq_index a@183@01 i1@219@01) (Seq_index a@183@01 i2@219@01)))
    (= i1@219@01 i2@219@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@219@01 Int)) (!
  (=>
    (and (<= 0 i@219@01) (< i@219@01 N@186@01))
    (and
      (= (inv@220@01 (Seq_index a@183@01 i@219@01)) i@219@01)
      (img@221@01 (Seq_index a@183@01 i@219@01))))
  :pattern ((Seq_index a@183@01 i@219@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@221@01 r) (and (<= 0 (inv@220@01 r)) (< (inv@220@01 r) N@186@01)))
    (= (Seq_index a@183@01 (inv@220@01 r)) r))
  :pattern ((inv@220@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((i@219@01 Int)) (!
  (= (Seq_index a@183@01 i@219@01) (Seq_index b@184@01 i@219@01))
  
  :qid |quant-u-114|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((i@219@01 Int)) (!
  (= (Seq_index a@183@01 i@219@01) (Seq_index c@185@01 i@219@01))
  
  :qid |quant-u-115|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@222@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@220@01 r)) (< (inv@220@01 r) N@186@01))
      (img@221@01 r)
      (= r (Seq_index a@183@01 (inv@220@01 r))))
    ($Perm.min
      (ite
        (and
          (img@196@01 r)
          (and (<= 0 (inv@195@01 r)) (< (inv@195@01 r) N@186@01)))
        $Perm.Write
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
(define-fun pTaken@223@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@220@01 r)) (< (inv@220@01 r) N@186@01))
      (img@221@01 r)
      (= r (Seq_index a@183@01 (inv@220@01 r))))
    ($Perm.min
      (ite
        (and
          (img@199@01 r)
          (and (<= 0 (inv@198@01 r)) (< (inv@198@01 r) N@186@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (- (/ (to_real 1) (to_real 2)) (pTaken@222@01 r)))
    $Perm.No))
(define-fun pTaken@224@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@220@01 r)) (< (inv@220@01 r) N@186@01))
      (img@221@01 r)
      (= r (Seq_index a@183@01 (inv@220@01 r))))
    ($Perm.min
      (ite
        (and
          (img@202@01 r)
          (and (<= 0 (inv@201@01 r)) (< (inv@201@01 r) N@186@01)))
        $Perm.Write
        $Perm.No)
      (- (- (/ (to_real 1) (to_real 2)) (pTaken@222@01 r)) (pTaken@223@01 r)))
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
          (img@196@01 r)
          (and (<= 0 (inv@195@01 r)) (< (inv@195@01 r) N@186@01)))
        $Perm.Write
        $Perm.No)
      (pTaken@222@01 r))
    $Perm.No)
  
  :qid |quant-u-117|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@222@01 r) $Perm.No)
  
  :qid |quant-u-118|))))
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
      (and (<= 0 (inv@220@01 r)) (< (inv@220@01 r) N@186@01))
      (img@221@01 r)
      (= r (Seq_index a@183@01 (inv@220@01 r))))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@222@01 r)) $Perm.No))
  
  :qid |quant-u-119|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@225@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@196@01 r) (and (<= 0 (inv@195@01 r)) (< (inv@195@01 r) N@186@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@225@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@187@01)))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@225@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@187@01)))))))) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@199@01 r) (and (<= 0 (inv@198@01 r)) (< (inv@198@01 r) N@186@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@225@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@187@01)))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@225@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@187@01)))))))))) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@202@01 r) (and (<= 0 (inv@201@01 r)) (< (inv@201@01 r) N@186@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@225@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@187@01))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@225@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@187@01))))))))))) r))
  :qid |qp.fvfValDef2|)))
; [eval] N <= |b|
; [eval] |b|
(set-option :timeout 0)
(push) ; 3
(assert (not (<= N@186@01 (Seq_length b@184@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (<= N@186@01 (Seq_length b@184@01)))
(declare-const i@226@01 Int)
(push) ; 3
; [eval] 0 <= i && i < N
; [eval] 0 <= i
(push) ; 4
; [then-branch: 88 | !(0 <= i@226@01) | live]
; [else-branch: 88 | 0 <= i@226@01 | live]
(push) ; 5
; [then-branch: 88 | !(0 <= i@226@01)]
(assert (not (<= 0 i@226@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 88 | 0 <= i@226@01]
(assert (<= 0 i@226@01))
; [eval] i < N
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@226@01) (not (<= 0 i@226@01))))
(assert (and (<= 0 i@226@01) (< i@226@01 N@186@01)))
; [eval] b[i]
(push) ; 4
(assert (not (>= i@226@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@226@01 (Seq_length b@184@01))))
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
(assert (forall ((i@226@01 Int)) (!
  (=>
    (and (<= 0 i@226@01) (< i@226@01 N@186@01))
    (or (<= 0 i@226@01) (not (<= 0 i@226@01))))
  :pattern ((Seq_index b@184@01 i@226@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@226@01 Int) (i2@226@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@226@01) (< i1@226@01 N@186@01))
      (and (<= 0 i2@226@01) (< i2@226@01 N@186@01))
      (= (Seq_index b@184@01 i1@226@01) (Seq_index b@184@01 i2@226@01)))
    (= i1@226@01 i2@226@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@226@01 Int)) (!
  (=>
    (and (<= 0 i@226@01) (< i@226@01 N@186@01))
    (and
      (= (inv@227@01 (Seq_index b@184@01 i@226@01)) i@226@01)
      (img@228@01 (Seq_index b@184@01 i@226@01))))
  :pattern ((Seq_index b@184@01 i@226@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@228@01 r) (and (<= 0 (inv@227@01 r)) (< (inv@227@01 r) N@186@01)))
    (= (Seq_index b@184@01 (inv@227@01 r)) r))
  :pattern ((inv@227@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((i@226@01 Int)) (!
  (= (Seq_index b@184@01 i@226@01) (Seq_index c@185@01 i@226@01))
  
  :qid |quant-u-121|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((i@226@01 Int)) (!
  (= (Seq_index b@184@01 i@226@01) (Seq_index a@183@01 i@226@01))
  
  :qid |quant-u-122|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@229@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@227@01 r)) (< (inv@227@01 r) N@186@01))
      (img@228@01 r)
      (= r (Seq_index b@184@01 (inv@227@01 r))))
    ($Perm.min
      (ite
        (and
          (img@199@01 r)
          (and (<= 0 (inv@198@01 r)) (< (inv@198@01 r) N@186@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
(define-fun pTaken@230@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@227@01 r)) (< (inv@227@01 r) N@186@01))
      (img@228@01 r)
      (= r (Seq_index b@184@01 (inv@227@01 r))))
    ($Perm.min
      (ite
        (and
          (img@202@01 r)
          (and (<= 0 (inv@201@01 r)) (< (inv@201@01 r) N@186@01)))
        $Perm.Write
        $Perm.No)
      (- (/ (to_real 1) (to_real 2)) (pTaken@229@01 r)))
    $Perm.No))
(define-fun pTaken@231@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@227@01 r)) (< (inv@227@01 r) N@186@01))
      (img@228@01 r)
      (= r (Seq_index b@184@01 (inv@227@01 r))))
    ($Perm.min
      (ite
        (and
          (img@196@01 r)
          (and (<= 0 (inv@195@01 r)) (< (inv@195@01 r) N@186@01)))
        (- $Perm.Write (pTaken@222@01 r))
        $Perm.No)
      (- (- (/ (to_real 1) (to_real 2)) (pTaken@229@01 r)) (pTaken@230@01 r)))
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
          (img@199@01 r)
          (and (<= 0 (inv@198@01 r)) (< (inv@198@01 r) N@186@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@229@01 r))
    $Perm.No)
  
  :qid |quant-u-124|))))
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
      (and (<= 0 (inv@227@01 r)) (< (inv@227@01 r) N@186@01))
      (img@228@01 r)
      (= r (Seq_index b@184@01 (inv@227@01 r))))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@229@01 r)) $Perm.No))
  
  :qid |quant-u-125|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@232@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@202@01 r) (and (<= 0 (inv@201@01 r)) (< (inv@201@01 r) N@186@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@232@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@187@01))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@232@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@187@01))))))))))) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@199@01 r) (and (<= 0 (inv@198@01 r)) (< (inv@198@01 r) N@186@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@232@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@187@01)))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@232@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@187@01)))))))))) r))
  :qid |qp.fvfValDef4|)))
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@196@01 r)
        (and (<= 0 (inv@195@01 r)) (< (inv@195@01 r) N@186@01)))
      (< $Perm.No (- $Perm.Write (pTaken@222@01 r)))
      false)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@232@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@187@01)))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@232@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@187@01)))))))) r))
  :qid |qp.fvfValDef5|)))
; [eval] N <= |c|
; [eval] |c|
(set-option :timeout 0)
(push) ; 3
(assert (not (<= N@186@01 (Seq_length c@185@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (<= N@186@01 (Seq_length c@185@01)))
(declare-const i@233@01 Int)
(push) ; 3
; [eval] 0 <= i && i < N
; [eval] 0 <= i
(push) ; 4
; [then-branch: 89 | !(0 <= i@233@01) | live]
; [else-branch: 89 | 0 <= i@233@01 | live]
(push) ; 5
; [then-branch: 89 | !(0 <= i@233@01)]
(assert (not (<= 0 i@233@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 89 | 0 <= i@233@01]
(assert (<= 0 i@233@01))
; [eval] i < N
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@233@01) (not (<= 0 i@233@01))))
(assert (and (<= 0 i@233@01) (< i@233@01 N@186@01)))
; [eval] c[i]
(push) ; 4
(assert (not (>= i@233@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@233@01 (Seq_length c@185@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@234@01 ($Ref) Int)
(declare-fun img@235@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@233@01 Int)) (!
  (=>
    (and (<= 0 i@233@01) (< i@233@01 N@186@01))
    (or (<= 0 i@233@01) (not (<= 0 i@233@01))))
  :pattern ((Seq_index c@185@01 i@233@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@233@01 Int) (i2@233@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@233@01) (< i1@233@01 N@186@01))
      (and (<= 0 i2@233@01) (< i2@233@01 N@186@01))
      (= (Seq_index c@185@01 i1@233@01) (Seq_index c@185@01 i2@233@01)))
    (= i1@233@01 i2@233@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@233@01 Int)) (!
  (=>
    (and (<= 0 i@233@01) (< i@233@01 N@186@01))
    (and
      (= (inv@234@01 (Seq_index c@185@01 i@233@01)) i@233@01)
      (img@235@01 (Seq_index c@185@01 i@233@01))))
  :pattern ((Seq_index c@185@01 i@233@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@235@01 r) (and (<= 0 (inv@234@01 r)) (< (inv@234@01 r) N@186@01)))
    (= (Seq_index c@185@01 (inv@234@01 r)) r))
  :pattern ((inv@234@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((i@233@01 Int)) (!
  (= (Seq_index c@185@01 i@233@01) (Seq_index a@183@01 i@233@01))
  
  :qid |quant-u-127|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@236@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@234@01 r)) (< (inv@234@01 r) N@186@01))
      (img@235@01 r)
      (= r (Seq_index c@185@01 (inv@234@01 r))))
    ($Perm.min
      (ite
        (and
          (img@202@01 r)
          (and (<= 0 (inv@201@01 r)) (< (inv@201@01 r) N@186@01)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@237@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@234@01 r)) (< (inv@234@01 r) N@186@01))
      (img@235@01 r)
      (= r (Seq_index c@185@01 (inv@234@01 r))))
    ($Perm.min
      (ite
        (and
          (img@196@01 r)
          (and (<= 0 (inv@195@01 r)) (< (inv@195@01 r) N@186@01)))
        (- $Perm.Write (pTaken@222@01 r))
        $Perm.No)
      (- $Perm.Write (pTaken@236@01 r)))
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
          (img@202@01 r)
          (and (<= 0 (inv@201@01 r)) (< (inv@201@01 r) N@186@01)))
        $Perm.Write
        $Perm.No)
      (pTaken@236@01 r))
    $Perm.No)
  
  :qid |quant-u-129|))))
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
      (and (<= 0 (inv@234@01 r)) (< (inv@234@01 r) N@186@01))
      (img@235@01 r)
      (= r (Seq_index c@185@01 (inv@234@01 r))))
    (= (- $Perm.Write (pTaken@236@01 r)) $Perm.No))
  
  :qid |quant-u-130|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@238@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@196@01 r)
        (and (<= 0 (inv@195@01 r)) (< (inv@195@01 r) N@186@01)))
      (< $Perm.No (- $Perm.Write (pTaken@222@01 r)))
      false)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@238@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@187@01)))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@238@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@187@01)))))))) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@202@01 r) (and (<= 0 (inv@201@01 r)) (< (inv@201@01 r) N@186@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@238@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@187@01))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@238@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@187@01))))))))))) r))
  :qid |qp.fvfValDef7|)))
; [eval] 0 <= 0 && 0 < N
; [eval] 0 <= 0
(set-option :timeout 0)
(push) ; 3
; [then-branch: 90 | False | live]
; [else-branch: 90 | True | live]
(push) ; 4
; [then-branch: 90 | False]
(assert false)
(pop) ; 4
(push) ; 4
; [else-branch: 90 | True]
; [eval] 0 < N
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(push) ; 3
(set-option :timeout 10)
(assert (not (not (< 0 N@186@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (< 0 N@186@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [then-branch: 91 | 0 < N@186@01 | live]
; [else-branch: 91 | !(0 < N@186@01) | live]
(set-option :timeout 0)
(push) ; 3
; [then-branch: 91 | 0 < N@186@01]
(assert (< 0 N@186@01))
; [eval] a[0]
(push) ; 4
(assert (not (< 0 (Seq_length a@183@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@239@01 ((r $Ref)) $Perm
  (ite
    (= r (Seq_index a@183@01 0))
    ($Perm.min
      (ite
        (and
          (img@196@01 r)
          (and (<= 0 (inv@195@01 r)) (< (inv@195@01 r) N@186@01)))
        (- $Perm.Write (pTaken@222@01 r))
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
          (img@196@01 r)
          (and (<= 0 (inv@195@01 r)) (< (inv@195@01 r) N@186@01)))
        (- $Perm.Write (pTaken@222@01 r))
        $Perm.No)
      (pTaken@239@01 r))
    $Perm.No)
  
  :qid |quant-u-132|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (= (pTaken@239@01 r) $Perm.No)
  
  :qid |quant-u-133|))))
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
    (= r (Seq_index a@183@01 0))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@239@01 r)) $Perm.No))
  
  :qid |quant-u-134|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@240@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values (instantiated)
(assert (=>
  (ite
    (and
      (img@196@01 (Seq_index a@183@01 0))
      (and
        (<= 0 (inv@195@01 (Seq_index a@183@01 0)))
        (< (inv@195@01 (Seq_index a@183@01 0)) N@186@01)))
    (< $Perm.No (- $Perm.Write (pTaken@222@01 (Seq_index a@183@01 0))))
    false)
  (=
    ($FVF.lookup_Ref__Integer_value (as sm@240@01  $FVF<Ref__Integer_value>) (Seq_index
      a@183@01
      0))
    ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@187@01)))))))) (Seq_index
      a@183@01
      0)))))
(declare-const i@241@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] 1 <= i && i < (N - 1 < N ? N - 1 : N) + 1
; [eval] 1 <= i
(push) ; 5
; [then-branch: 92 | !(1 <= i@241@01) | live]
; [else-branch: 92 | 1 <= i@241@01 | live]
(push) ; 6
; [then-branch: 92 | !(1 <= i@241@01)]
(assert (not (<= 1 i@241@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 92 | 1 <= i@241@01]
(assert (<= 1 i@241@01))
; [eval] i < (N - 1 < N ? N - 1 : N) + 1
; [eval] (N - 1 < N ? N - 1 : N) + 1
; [eval] (N - 1 < N ? N - 1 : N)
; [eval] N - 1 < N
; [eval] N - 1
(push) ; 7
(push) ; 8
(set-option :timeout 10)
(assert (not (not (< (- N@186@01 1) N@186@01))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (< (- N@186@01 1) N@186@01)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 93 | N@186@01 - 1 < N@186@01 | live]
; [else-branch: 93 | !(N@186@01 - 1 < N@186@01) | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 93 | N@186@01 - 1 < N@186@01]
(assert (< (- N@186@01 1) N@186@01))
; [eval] N - 1
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (< (- N@186@01 1) N@186@01))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=> (<= 1 i@241@01) (and (<= 1 i@241@01) (< (- N@186@01 1) N@186@01))))
(assert (or (<= 1 i@241@01) (not (<= 1 i@241@01))))
(assert (and (<= 1 i@241@01) (< i@241@01 (+ (- N@186@01 1) 1))))
; [eval] a[i]
(push) ; 5
(assert (not (>= i@241@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@241@01 (Seq_length a@183@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@242@01 ($Ref) Int)
(declare-fun img@243@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@241@01 Int)) (!
  (=>
    (and (<= 1 i@241@01) (< i@241@01 (+ (- N@186@01 1) 1)))
    (and
      (=> (<= 1 i@241@01) (and (<= 1 i@241@01) (< (- N@186@01 1) N@186@01)))
      (or (<= 1 i@241@01) (not (<= 1 i@241@01)))))
  :pattern ((Seq_index a@183@01 i@241@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@241@01 Int) (i2@241@01 Int)) (!
  (=>
    (and
      (and (<= 1 i1@241@01) (< i1@241@01 (+ (- N@186@01 1) 1)))
      (and (<= 1 i2@241@01) (< i2@241@01 (+ (- N@186@01 1) 1)))
      (= (Seq_index a@183@01 i1@241@01) (Seq_index a@183@01 i2@241@01)))
    (= i1@241@01 i2@241@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@241@01 Int)) (!
  (=>
    (and (<= 1 i@241@01) (< i@241@01 (+ (- N@186@01 1) 1)))
    (and
      (= (inv@242@01 (Seq_index a@183@01 i@241@01)) i@241@01)
      (img@243@01 (Seq_index a@183@01 i@241@01))))
  :pattern ((Seq_index a@183@01 i@241@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@243@01 r)
      (and (<= 1 (inv@242@01 r)) (< (inv@242@01 r) (+ (- N@186@01 1) 1))))
    (= (Seq_index a@183@01 (inv@242@01 r)) r))
  :pattern ((inv@242@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@244@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 1 (inv@242@01 r)) (< (inv@242@01 r) (+ (- N@186@01 1) 1)))
      (img@243@01 r)
      (= r (Seq_index a@183@01 (inv@242@01 r))))
    ($Perm.min
      (ite
        (and
          (img@196@01 r)
          (and (<= 0 (inv@195@01 r)) (< (inv@195@01 r) N@186@01)))
        (- (- $Perm.Write (pTaken@222@01 r)) (pTaken@239@01 r))
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
          (img@196@01 r)
          (and (<= 0 (inv@195@01 r)) (< (inv@195@01 r) N@186@01)))
        (- (- $Perm.Write (pTaken@222@01 r)) (pTaken@239@01 r))
        $Perm.No)
      (pTaken@244@01 r))
    $Perm.No)
  
  :qid |quant-u-137|))))
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
      (and (<= 1 (inv@242@01 r)) (< (inv@242@01 r) (+ (- N@186@01 1) 1)))
      (img@243@01 r)
      (= r (Seq_index a@183@01 (inv@242@01 r))))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@244@01 r)) $Perm.No))
  
  :qid |quant-u-138|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@245@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@196@01 r)
        (and (<= 0 (inv@195@01 r)) (< (inv@195@01 r) N@186@01)))
      (< $Perm.No (- (- $Perm.Write (pTaken@222@01 r)) (pTaken@239@01 r)))
      false)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@245@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@187@01)))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@245@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@187@01)))))))) r))
  :qid |qp.fvfValDef9|)))
(declare-const $t@246@01 $Snap)
(assert (= $t@246@01 ($Snap.combine ($Snap.first $t@246@01) ($Snap.second $t@246@01))))
(declare-const i@247@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] 0 <= i && i < N
; [eval] 0 <= i
(push) ; 5
; [then-branch: 94 | !(0 <= i@247@01) | live]
; [else-branch: 94 | 0 <= i@247@01 | live]
(push) ; 6
; [then-branch: 94 | !(0 <= i@247@01)]
(assert (not (<= 0 i@247@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 94 | 0 <= i@247@01]
(assert (<= 0 i@247@01))
; [eval] i < N
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@247@01) (not (<= 0 i@247@01))))
(assert (and (<= 0 i@247@01) (< i@247@01 N@186@01)))
; [eval] a[i]
(push) ; 5
(assert (not (>= i@247@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@247@01 (Seq_length a@183@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@248@01 ($Ref) Int)
(declare-fun img@249@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@247@01 Int)) (!
  (=>
    (and (<= 0 i@247@01) (< i@247@01 N@186@01))
    (or (<= 0 i@247@01) (not (<= 0 i@247@01))))
  :pattern ((Seq_index a@183@01 i@247@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@247@01 Int) (i2@247@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@247@01) (< i1@247@01 N@186@01))
      (and (<= 0 i2@247@01) (< i2@247@01 N@186@01))
      (= (Seq_index a@183@01 i1@247@01) (Seq_index a@183@01 i2@247@01)))
    (= i1@247@01 i2@247@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@247@01 Int)) (!
  (=>
    (and (<= 0 i@247@01) (< i@247@01 N@186@01))
    (and
      (= (inv@248@01 (Seq_index a@183@01 i@247@01)) i@247@01)
      (img@249@01 (Seq_index a@183@01 i@247@01))))
  :pattern ((Seq_index a@183@01 i@247@01))
  :qid |quant-u-140|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@249@01 r) (and (<= 0 (inv@248@01 r)) (< (inv@248@01 r) N@186@01)))
    (= (Seq_index a@183@01 (inv@248@01 r)) r))
  :pattern ((inv@248@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@247@01 Int)) (!
  (=>
    (and (<= 0 i@247@01) (< i@247@01 N@186@01))
    (not (= (Seq_index a@183@01 i@247@01) $Ref.null)))
  :pattern ((Seq_index a@183@01 i@247@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(assert (=
  ($Snap.second $t@246@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@246@01))
    ($Snap.second ($Snap.second $t@246@01)))))
(declare-const i@250@01 Int)
(push) ; 4
; [eval] 0 <= i && i < N
; [eval] 0 <= i
(push) ; 5
; [then-branch: 95 | !(0 <= i@250@01) | live]
; [else-branch: 95 | 0 <= i@250@01 | live]
(push) ; 6
; [then-branch: 95 | !(0 <= i@250@01)]
(assert (not (<= 0 i@250@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 95 | 0 <= i@250@01]
(assert (<= 0 i@250@01))
; [eval] i < N
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@250@01) (not (<= 0 i@250@01))))
(assert (and (<= 0 i@250@01) (< i@250@01 N@186@01)))
; [eval] a[i]
(push) ; 5
(assert (not (>= i@250@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@250@01 (Seq_length a@183@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@251@01 ($Ref) Int)
(declare-fun img@252@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@250@01 Int)) (!
  (=>
    (and (<= 0 i@250@01) (< i@250@01 N@186@01))
    (or (<= 0 i@250@01) (not (<= 0 i@250@01))))
  :pattern ((Seq_index a@183@01 i@250@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@250@01 Int) (i2@250@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@250@01) (< i1@250@01 N@186@01))
      (and (<= 0 i2@250@01) (< i2@250@01 N@186@01))
      (= (Seq_index a@183@01 i1@250@01) (Seq_index a@183@01 i2@250@01)))
    (= i1@250@01 i2@250@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@250@01 Int)) (!
  (=>
    (and (<= 0 i@250@01) (< i@250@01 N@186@01))
    (and
      (= (inv@251@01 (Seq_index a@183@01 i@250@01)) i@250@01)
      (img@252@01 (Seq_index a@183@01 i@250@01))))
  :pattern ((Seq_index a@183@01 i@250@01))
  :qid |quant-u-142|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@252@01 r) (and (<= 0 (inv@251@01 r)) (< (inv@251@01 r) N@186@01)))
    (= (Seq_index a@183@01 (inv@251@01 r)) r))
  :pattern ((inv@251@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@250@01 Int)) (!
  (=>
    (and (<= 0 i@250@01) (< i@250@01 N@186@01))
    (not (= (Seq_index a@183@01 i@250@01) $Ref.null)))
  :pattern ((Seq_index a@183@01 i@250@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index a@183@01 i@250@01) (Seq_index a@183@01 i@247@01))
    (=
      (and
        (img@252@01 r)
        (and (<= 0 (inv@251@01 r)) (< (inv@251@01 r) N@186@01)))
      (and
        (img@249@01 r)
        (and (<= 0 (inv@248@01 r)) (< (inv@248@01 r) N@186@01)))))
  
  :qid |quant-u-143|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second $t@246@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@246@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@246@01))))))
(declare-const i@253@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] 0 <= i && i < N
; [eval] 0 <= i
(push) ; 5
; [then-branch: 96 | !(0 <= i@253@01) | live]
; [else-branch: 96 | 0 <= i@253@01 | live]
(push) ; 6
; [then-branch: 96 | !(0 <= i@253@01)]
(assert (not (<= 0 i@253@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 96 | 0 <= i@253@01]
(assert (<= 0 i@253@01))
; [eval] i < N
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@253@01) (not (<= 0 i@253@01))))
(assert (and (<= 0 i@253@01) (< i@253@01 N@186@01)))
; [eval] b[i]
(push) ; 5
(assert (not (>= i@253@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@253@01 (Seq_length b@184@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@254@01 ($Ref) Int)
(declare-fun img@255@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@253@01 Int)) (!
  (=>
    (and (<= 0 i@253@01) (< i@253@01 N@186@01))
    (or (<= 0 i@253@01) (not (<= 0 i@253@01))))
  :pattern ((Seq_index b@184@01 i@253@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@253@01 Int) (i2@253@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@253@01) (< i1@253@01 N@186@01))
      (and (<= 0 i2@253@01) (< i2@253@01 N@186@01))
      (= (Seq_index b@184@01 i1@253@01) (Seq_index b@184@01 i2@253@01)))
    (= i1@253@01 i2@253@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@253@01 Int)) (!
  (=>
    (and (<= 0 i@253@01) (< i@253@01 N@186@01))
    (and
      (= (inv@254@01 (Seq_index b@184@01 i@253@01)) i@253@01)
      (img@255@01 (Seq_index b@184@01 i@253@01))))
  :pattern ((Seq_index b@184@01 i@253@01))
  :qid |quant-u-145|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@255@01 r) (and (<= 0 (inv@254@01 r)) (< (inv@254@01 r) N@186@01)))
    (= (Seq_index b@184@01 (inv@254@01 r)) r))
  :pattern ((inv@254@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@253@01 Int)) (!
  (=>
    (and (<= 0 i@253@01) (< i@253@01 N@186@01))
    (not (= (Seq_index b@184@01 i@253@01) $Ref.null)))
  :pattern ((Seq_index b@184@01 i@253@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index b@184@01 i@253@01) (Seq_index a@183@01 i@250@01))
    (=
      (and
        (img@255@01 r)
        (and (<= 0 (inv@254@01 r)) (< (inv@254@01 r) N@186@01)))
      (and
        (img@252@01 r)
        (and (<= 0 (inv@251@01 r)) (< (inv@251@01 r) N@186@01)))))
  
  :qid |quant-u-146|))))
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
    (= (Seq_index b@184@01 i@253@01) (Seq_index a@183@01 i@247@01))
    (=
      (and
        (img@255@01 r)
        (and (<= 0 (inv@254@01 r)) (< (inv@254@01 r) N@186@01)))
      (and
        (img@249@01 r)
        (and (<= 0 (inv@248@01 r)) (< (inv@248@01 r) N@186@01)))))
  
  :qid |quant-u-147|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(declare-const i@256@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] 0 <= i && i < N
; [eval] 0 <= i
(push) ; 5
; [then-branch: 97 | !(0 <= i@256@01) | live]
; [else-branch: 97 | 0 <= i@256@01 | live]
(push) ; 6
; [then-branch: 97 | !(0 <= i@256@01)]
(assert (not (<= 0 i@256@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 97 | 0 <= i@256@01]
(assert (<= 0 i@256@01))
; [eval] i < N
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@256@01) (not (<= 0 i@256@01))))
(assert (and (<= 0 i@256@01) (< i@256@01 N@186@01)))
; [eval] c[i]
(push) ; 5
(assert (not (>= i@256@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@256@01 (Seq_length c@185@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@257@01 ($Ref) Int)
(declare-fun img@258@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@256@01 Int)) (!
  (=>
    (and (<= 0 i@256@01) (< i@256@01 N@186@01))
    (or (<= 0 i@256@01) (not (<= 0 i@256@01))))
  :pattern ((Seq_index c@185@01 i@256@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@256@01 Int) (i2@256@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@256@01) (< i1@256@01 N@186@01))
      (and (<= 0 i2@256@01) (< i2@256@01 N@186@01))
      (= (Seq_index c@185@01 i1@256@01) (Seq_index c@185@01 i2@256@01)))
    (= i1@256@01 i2@256@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@256@01 Int)) (!
  (=>
    (and (<= 0 i@256@01) (< i@256@01 N@186@01))
    (and
      (= (inv@257@01 (Seq_index c@185@01 i@256@01)) i@256@01)
      (img@258@01 (Seq_index c@185@01 i@256@01))))
  :pattern ((Seq_index c@185@01 i@256@01))
  :qid |quant-u-149|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@258@01 r) (and (<= 0 (inv@257@01 r)) (< (inv@257@01 r) N@186@01)))
    (= (Seq_index c@185@01 (inv@257@01 r)) r))
  :pattern ((inv@257@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@256@01 Int)) (!
  (=>
    (and (<= 0 i@256@01) (< i@256@01 N@186@01))
    (not (= (Seq_index c@185@01 i@256@01) $Ref.null)))
  :pattern ((Seq_index c@185@01 i@256@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index c@185@01 i@256@01) (Seq_index b@184@01 i@253@01))
    (=
      (and
        (img@258@01 r)
        (and (<= 0 (inv@257@01 r)) (< (inv@257@01 r) N@186@01)))
      (and
        (img@255@01 r)
        (and (<= 0 (inv@254@01 r)) (< (inv@254@01 r) N@186@01)))))
  
  :qid |quant-u-150|))))
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
    (= (Seq_index c@185@01 i@256@01) (Seq_index a@183@01 i@250@01))
    (=
      (and
        (img@258@01 r)
        (and (<= 0 (inv@257@01 r)) (< (inv@257@01 r) N@186@01)))
      (and
        (img@252@01 r)
        (and (<= 0 (inv@251@01 r)) (< (inv@251@01 r) N@186@01)))))
  
  :qid |quant-u-151|))))
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
    (= (Seq_index c@185@01 i@256@01) (Seq_index a@183@01 i@247@01))
    (=
      (and
        (img@258@01 r)
        (and (<= 0 (inv@257@01 r)) (< (inv@257@01 r) N@186@01)))
      (and
        (img@249@01 r)
        (and (<= 0 (inv@248@01 r)) (< (inv@248@01 r) N@186@01)))))
  
  :qid |quant-u-152|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] |a| == N
; [eval] |a|
(declare-const i@259@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] 0 <= i && i < N
; [eval] 0 <= i
(push) ; 5
; [then-branch: 98 | !(0 <= i@259@01) | live]
; [else-branch: 98 | 0 <= i@259@01 | live]
(push) ; 6
; [then-branch: 98 | !(0 <= i@259@01)]
(assert (not (<= 0 i@259@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 98 | 0 <= i@259@01]
(assert (<= 0 i@259@01))
; [eval] i < N
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@259@01) (not (<= 0 i@259@01))))
(assert (and (<= 0 i@259@01) (< i@259@01 N@186@01)))
; [eval] a[i]
(push) ; 5
(assert (not (>= i@259@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@259@01 (Seq_length a@183@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@260@01 ($Ref) Int)
(declare-fun img@261@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@259@01 Int)) (!
  (=>
    (and (<= 0 i@259@01) (< i@259@01 N@186@01))
    (or (<= 0 i@259@01) (not (<= 0 i@259@01))))
  :pattern ((Seq_index a@183@01 i@259@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@259@01 Int) (i2@259@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@259@01) (< i1@259@01 N@186@01))
      (and (<= 0 i2@259@01) (< i2@259@01 N@186@01))
      (= (Seq_index a@183@01 i1@259@01) (Seq_index a@183@01 i2@259@01)))
    (= i1@259@01 i2@259@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@259@01 Int)) (!
  (=>
    (and (<= 0 i@259@01) (< i@259@01 N@186@01))
    (and
      (= (inv@260@01 (Seq_index a@183@01 i@259@01)) i@259@01)
      (img@261@01 (Seq_index a@183@01 i@259@01))))
  :pattern ((Seq_index a@183@01 i@259@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@261@01 r) (and (<= 0 (inv@260@01 r)) (< (inv@260@01 r) N@186@01)))
    (= (Seq_index a@183@01 (inv@260@01 r)) r))
  :pattern ((inv@260@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((i@259@01 Int)) (!
  (= (Seq_index a@183@01 i@259@01) (Seq_index b@184@01 i@259@01))
  
  :qid |quant-u-154|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((i@259@01 Int)) (!
  (= (Seq_index a@183@01 i@259@01) (Seq_index c@185@01 i@259@01))
  
  :qid |quant-u-155|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@262@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@260@01 r)) (< (inv@260@01 r) N@186@01))
      (img@261@01 r)
      (= r (Seq_index a@183@01 (inv@260@01 r))))
    ($Perm.min
      (ite
        (and
          (img@249@01 r)
          (and (<= 0 (inv@248@01 r)) (< (inv@248@01 r) N@186@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@263@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@260@01 r)) (< (inv@260@01 r) N@186@01))
      (img@261@01 r)
      (= r (Seq_index a@183@01 (inv@260@01 r))))
    ($Perm.min
      (ite
        (and
          (img@252@01 r)
          (and (<= 0 (inv@251@01 r)) (< (inv@251@01 r) N@186@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (- $Perm.Write (pTaken@262@01 r)))
    $Perm.No))
(define-fun pTaken@264@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@260@01 r)) (< (inv@260@01 r) N@186@01))
      (img@261@01 r)
      (= r (Seq_index a@183@01 (inv@260@01 r))))
    ($Perm.min
      (ite
        (and
          (img@255@01 r)
          (and (<= 0 (inv@254@01 r)) (< (inv@254@01 r) N@186@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (- (- $Perm.Write (pTaken@262@01 r)) (pTaken@263@01 r)))
    $Perm.No))
(define-fun pTaken@265@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@260@01 r)) (< (inv@260@01 r) N@186@01))
      (img@261@01 r)
      (= r (Seq_index a@183@01 (inv@260@01 r))))
    ($Perm.min
      (ite
        (and
          (img@258@01 r)
          (and (<= 0 (inv@257@01 r)) (< (inv@257@01 r) N@186@01)))
        $Perm.Write
        $Perm.No)
      (-
        (- (- $Perm.Write (pTaken@262@01 r)) (pTaken@263@01 r))
        (pTaken@264@01 r)))
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
          (img@249@01 r)
          (and (<= 0 (inv@248@01 r)) (< (inv@248@01 r) N@186@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@262@01 r))
    $Perm.No)
  
  :qid |quant-u-157|))))
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
      (and (<= 0 (inv@260@01 r)) (< (inv@260@01 r) N@186@01))
      (img@261@01 r)
      (= r (Seq_index a@183@01 (inv@260@01 r))))
    (= (- $Perm.Write (pTaken@262@01 r)) $Perm.No))
  
  :qid |quant-u-158|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Chunk depleted?
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 500)
(assert (not (forall ((r $Ref)) (!
  (=
    (-
      (ite
        (and
          (img@252@01 r)
          (and (<= 0 (inv@251@01 r)) (< (inv@251@01 r) N@186@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@263@01 r))
    $Perm.No)
  
  :qid |quant-u-159|))))
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
      (and (<= 0 (inv@260@01 r)) (< (inv@260@01 r) N@186@01))
      (img@261@01 r)
      (= r (Seq_index a@183@01 (inv@260@01 r))))
    (= (- (- $Perm.Write (pTaken@262@01 r)) (pTaken@263@01 r)) $Perm.No))
  
  :qid |quant-u-160|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@266@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@249@01 r) (and (<= 0 (inv@248@01 r)) (< (inv@248@01 r) N@186@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@266@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first $t@246@01)) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@266@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first $t@246@01)) r))
  :qid |qp.fvfValDef10|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@252@01 r) (and (<= 0 (inv@251@01 r)) (< (inv@251@01 r) N@186@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@266@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@246@01))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@266@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@246@01))) r))
  :qid |qp.fvfValDef11|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@255@01 r) (and (<= 0 (inv@254@01 r)) (< (inv@254@01 r) N@186@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@266@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second $t@246@01)))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@266@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second $t@246@01)))) r))
  :qid |qp.fvfValDef12|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@258@01 r) (and (<= 0 (inv@257@01 r)) (< (inv@257@01 r) N@186@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@266@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second $t@246@01)))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@266@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second $t@246@01)))) r))
  :qid |qp.fvfValDef13|)))
; [eval] |b| == N
; [eval] |b|
(declare-const i@267@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] 0 <= i && i < N
; [eval] 0 <= i
(push) ; 5
; [then-branch: 99 | !(0 <= i@267@01) | live]
; [else-branch: 99 | 0 <= i@267@01 | live]
(push) ; 6
; [then-branch: 99 | !(0 <= i@267@01)]
(assert (not (<= 0 i@267@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 99 | 0 <= i@267@01]
(assert (<= 0 i@267@01))
; [eval] i < N
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@267@01) (not (<= 0 i@267@01))))
(assert (and (<= 0 i@267@01) (< i@267@01 N@186@01)))
; [eval] b[i]
(push) ; 5
(assert (not (>= i@267@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@267@01 (Seq_length b@184@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@268@01 ($Ref) Int)
(declare-fun img@269@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@267@01 Int)) (!
  (=>
    (and (<= 0 i@267@01) (< i@267@01 N@186@01))
    (or (<= 0 i@267@01) (not (<= 0 i@267@01))))
  :pattern ((Seq_index b@184@01 i@267@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@267@01 Int) (i2@267@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@267@01) (< i1@267@01 N@186@01))
      (and (<= 0 i2@267@01) (< i2@267@01 N@186@01))
      (= (Seq_index b@184@01 i1@267@01) (Seq_index b@184@01 i2@267@01)))
    (= i1@267@01 i2@267@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@267@01 Int)) (!
  (=>
    (and (<= 0 i@267@01) (< i@267@01 N@186@01))
    (and
      (= (inv@268@01 (Seq_index b@184@01 i@267@01)) i@267@01)
      (img@269@01 (Seq_index b@184@01 i@267@01))))
  :pattern ((Seq_index b@184@01 i@267@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@269@01 r) (and (<= 0 (inv@268@01 r)) (< (inv@268@01 r) N@186@01)))
    (= (Seq_index b@184@01 (inv@268@01 r)) r))
  :pattern ((inv@268@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((i@267@01 Int)) (!
  (= (Seq_index b@184@01 i@267@01) (Seq_index c@185@01 i@267@01))
  
  :qid |quant-u-162|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@270@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@268@01 r)) (< (inv@268@01 r) N@186@01))
      (img@269@01 r)
      (= r (Seq_index b@184@01 (inv@268@01 r))))
    ($Perm.min
      (ite
        (and
          (img@255@01 r)
          (and (<= 0 (inv@254@01 r)) (< (inv@254@01 r) N@186@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
(define-fun pTaken@271@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@268@01 r)) (< (inv@268@01 r) N@186@01))
      (img@269@01 r)
      (= r (Seq_index b@184@01 (inv@268@01 r))))
    ($Perm.min
      (ite
        (and
          (img@258@01 r)
          (and (<= 0 (inv@257@01 r)) (< (inv@257@01 r) N@186@01)))
        $Perm.Write
        $Perm.No)
      (- (/ (to_real 1) (to_real 2)) (pTaken@270@01 r)))
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
          (img@255@01 r)
          (and (<= 0 (inv@254@01 r)) (< (inv@254@01 r) N@186@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@270@01 r))
    $Perm.No)
  
  :qid |quant-u-164|))))
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
      (and (<= 0 (inv@268@01 r)) (< (inv@268@01 r) N@186@01))
      (img@269@01 r)
      (= r (Seq_index b@184@01 (inv@268@01 r))))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@270@01 r)) $Perm.No))
  
  :qid |quant-u-165|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@272@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@258@01 r) (and (<= 0 (inv@257@01 r)) (< (inv@257@01 r) N@186@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@272@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second $t@246@01)))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@272@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second $t@246@01)))) r))
  :qid |qp.fvfValDef14|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@255@01 r) (and (<= 0 (inv@254@01 r)) (< (inv@254@01 r) N@186@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@272@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second $t@246@01)))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@272@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second $t@246@01)))) r))
  :qid |qp.fvfValDef15|)))
; [eval] |c| == N
; [eval] |c|
(declare-const i@273@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] 0 <= i && i < N
; [eval] 0 <= i
(push) ; 5
; [then-branch: 100 | !(0 <= i@273@01) | live]
; [else-branch: 100 | 0 <= i@273@01 | live]
(push) ; 6
; [then-branch: 100 | !(0 <= i@273@01)]
(assert (not (<= 0 i@273@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 100 | 0 <= i@273@01]
(assert (<= 0 i@273@01))
; [eval] i < N
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@273@01) (not (<= 0 i@273@01))))
(assert (and (<= 0 i@273@01) (< i@273@01 N@186@01)))
; [eval] c[i]
(push) ; 5
(assert (not (>= i@273@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@273@01 (Seq_length c@185@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@274@01 ($Ref) Int)
(declare-fun img@275@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@273@01 Int)) (!
  (=>
    (and (<= 0 i@273@01) (< i@273@01 N@186@01))
    (or (<= 0 i@273@01) (not (<= 0 i@273@01))))
  :pattern ((Seq_index c@185@01 i@273@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@273@01 Int) (i2@273@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@273@01) (< i1@273@01 N@186@01))
      (and (<= 0 i2@273@01) (< i2@273@01 N@186@01))
      (= (Seq_index c@185@01 i1@273@01) (Seq_index c@185@01 i2@273@01)))
    (= i1@273@01 i2@273@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@273@01 Int)) (!
  (=>
    (and (<= 0 i@273@01) (< i@273@01 N@186@01))
    (and
      (= (inv@274@01 (Seq_index c@185@01 i@273@01)) i@273@01)
      (img@275@01 (Seq_index c@185@01 i@273@01))))
  :pattern ((Seq_index c@185@01 i@273@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@275@01 r) (and (<= 0 (inv@274@01 r)) (< (inv@274@01 r) N@186@01)))
    (= (Seq_index c@185@01 (inv@274@01 r)) r))
  :pattern ((inv@274@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@276@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@274@01 r)) (< (inv@274@01 r) N@186@01))
      (img@275@01 r)
      (= r (Seq_index c@185@01 (inv@274@01 r))))
    ($Perm.min
      (ite
        (and
          (img@258@01 r)
          (and (<= 0 (inv@257@01 r)) (< (inv@257@01 r) N@186@01)))
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
          (img@258@01 r)
          (and (<= 0 (inv@257@01 r)) (< (inv@257@01 r) N@186@01)))
        $Perm.Write
        $Perm.No)
      (pTaken@276@01 r))
    $Perm.No)
  
  :qid |quant-u-168|))))
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
      (and (<= 0 (inv@274@01 r)) (< (inv@274@01 r) N@186@01))
      (img@275@01 r)
      (= r (Seq_index c@185@01 (inv@274@01 r))))
    (= (- $Perm.Write (pTaken@276@01 r)) $Perm.No))
  
  :qid |quant-u-169|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@277@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@258@01 r) (and (<= 0 (inv@257@01 r)) (< (inv@257@01 r) N@186@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@277@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second $t@246@01)))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@277@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second $t@246@01)))) r))
  :qid |qp.fvfValDef16|)))
(pop) ; 3
(set-option :timeout 0)
(push) ; 3
; [else-branch: 91 | !(0 < N@186@01)]
(assert (not (< 0 N@186@01)))
(declare-const i@278@01 Int)
(push) ; 4
; [eval] 1 <= i && i < (N - 1 < N ? N - 1 : N) + 1
; [eval] 1 <= i
(push) ; 5
; [then-branch: 101 | !(1 <= i@278@01) | live]
; [else-branch: 101 | 1 <= i@278@01 | live]
(push) ; 6
; [then-branch: 101 | !(1 <= i@278@01)]
(assert (not (<= 1 i@278@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 101 | 1 <= i@278@01]
(assert (<= 1 i@278@01))
; [eval] i < (N - 1 < N ? N - 1 : N) + 1
; [eval] (N - 1 < N ? N - 1 : N) + 1
; [eval] (N - 1 < N ? N - 1 : N)
; [eval] N - 1 < N
; [eval] N - 1
(push) ; 7
(push) ; 8
(set-option :timeout 10)
(assert (not (not (< (- N@186@01 1) N@186@01))))
(check-sat)
; unknown
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 8
(set-option :timeout 10)
(assert (not (< (- N@186@01 1) N@186@01)))
(check-sat)
; unsat
(pop) ; 8
; 0,00s
; (get-info :all-statistics)
; [then-branch: 102 | N@186@01 - 1 < N@186@01 | live]
; [else-branch: 102 | !(N@186@01 - 1 < N@186@01) | dead]
(set-option :timeout 0)
(push) ; 8
; [then-branch: 102 | N@186@01 - 1 < N@186@01]
(assert (< (- N@186@01 1) N@186@01))
; [eval] N - 1
(pop) ; 8
(pop) ; 7
; Joined path conditions
(assert (< (- N@186@01 1) N@186@01))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=> (<= 1 i@278@01) (and (<= 1 i@278@01) (< (- N@186@01 1) N@186@01))))
(assert (or (<= 1 i@278@01) (not (<= 1 i@278@01))))
(assert (and (<= 1 i@278@01) (< i@278@01 (+ (- N@186@01 1) 1))))
; [eval] a[i]
(push) ; 5
(assert (not (>= i@278@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@278@01 (Seq_length a@183@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@279@01 ($Ref) Int)
(declare-fun img@280@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@278@01 Int)) (!
  (=>
    (and (<= 1 i@278@01) (< i@278@01 (+ (- N@186@01 1) 1)))
    (and
      (=> (<= 1 i@278@01) (and (<= 1 i@278@01) (< (- N@186@01 1) N@186@01)))
      (or (<= 1 i@278@01) (not (<= 1 i@278@01)))))
  :pattern ((Seq_index a@183@01 i@278@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@278@01 Int) (i2@278@01 Int)) (!
  (=>
    (and
      (and (<= 1 i1@278@01) (< i1@278@01 (+ (- N@186@01 1) 1)))
      (and (<= 1 i2@278@01) (< i2@278@01 (+ (- N@186@01 1) 1)))
      (= (Seq_index a@183@01 i1@278@01) (Seq_index a@183@01 i2@278@01)))
    (= i1@278@01 i2@278@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@278@01 Int)) (!
  (=>
    (and (<= 1 i@278@01) (< i@278@01 (+ (- N@186@01 1) 1)))
    (and
      (= (inv@279@01 (Seq_index a@183@01 i@278@01)) i@278@01)
      (img@280@01 (Seq_index a@183@01 i@278@01))))
  :pattern ((Seq_index a@183@01 i@278@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and
      (img@280@01 r)
      (and (<= 1 (inv@279@01 r)) (< (inv@279@01 r) (+ (- N@186@01 1) 1))))
    (= (Seq_index a@183@01 (inv@279@01 r)) r))
  :pattern ((inv@279@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@281@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 1 (inv@279@01 r)) (< (inv@279@01 r) (+ (- N@186@01 1) 1)))
      (img@280@01 r)
      (= r (Seq_index a@183@01 (inv@279@01 r))))
    ($Perm.min
      (ite
        (and
          (img@196@01 r)
          (and (<= 0 (inv@195@01 r)) (< (inv@195@01 r) N@186@01)))
        (- $Perm.Write (pTaken@222@01 r))
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
          (img@196@01 r)
          (and (<= 0 (inv@195@01 r)) (< (inv@195@01 r) N@186@01)))
        (- $Perm.Write (pTaken@222@01 r))
        $Perm.No)
      (pTaken@281@01 r))
    $Perm.No)
  
  :qid |quant-u-172|))))
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
      (and (<= 1 (inv@279@01 r)) (< (inv@279@01 r) (+ (- N@186@01 1) 1)))
      (img@280@01 r)
      (= r (Seq_index a@183@01 (inv@279@01 r))))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@281@01 r)) $Perm.No))
  
  :qid |quant-u-173|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@282@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (ite
      (and
        (img@196@01 r)
        (and (<= 0 (inv@195@01 r)) (< (inv@195@01 r) N@186@01)))
      (< $Perm.No (- $Perm.Write (pTaken@222@01 r)))
      false)
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@282@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@187@01)))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@282@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@187@01)))))))) r))
  :qid |qp.fvfValDef17|)))
(declare-const $t@283@01 $Snap)
(assert (= $t@283@01 ($Snap.combine ($Snap.first $t@283@01) ($Snap.second $t@283@01))))
(declare-const i@284@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] 0 <= i && i < N
; [eval] 0 <= i
(push) ; 5
; [then-branch: 103 | !(0 <= i@284@01) | live]
; [else-branch: 103 | 0 <= i@284@01 | live]
(push) ; 6
; [then-branch: 103 | !(0 <= i@284@01)]
(assert (not (<= 0 i@284@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 103 | 0 <= i@284@01]
(assert (<= 0 i@284@01))
; [eval] i < N
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@284@01) (not (<= 0 i@284@01))))
(assert (and (<= 0 i@284@01) (< i@284@01 N@186@01)))
; [eval] a[i]
(push) ; 5
(assert (not (>= i@284@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@284@01 (Seq_length a@183@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@285@01 ($Ref) Int)
(declare-fun img@286@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@284@01 Int)) (!
  (=>
    (and (<= 0 i@284@01) (< i@284@01 N@186@01))
    (or (<= 0 i@284@01) (not (<= 0 i@284@01))))
  :pattern ((Seq_index a@183@01 i@284@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@284@01 Int) (i2@284@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@284@01) (< i1@284@01 N@186@01))
      (and (<= 0 i2@284@01) (< i2@284@01 N@186@01))
      (= (Seq_index a@183@01 i1@284@01) (Seq_index a@183@01 i2@284@01)))
    (= i1@284@01 i2@284@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@284@01 Int)) (!
  (=>
    (and (<= 0 i@284@01) (< i@284@01 N@186@01))
    (and
      (= (inv@285@01 (Seq_index a@183@01 i@284@01)) i@284@01)
      (img@286@01 (Seq_index a@183@01 i@284@01))))
  :pattern ((Seq_index a@183@01 i@284@01))
  :qid |quant-u-175|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@286@01 r) (and (<= 0 (inv@285@01 r)) (< (inv@285@01 r) N@186@01)))
    (= (Seq_index a@183@01 (inv@285@01 r)) r))
  :pattern ((inv@285@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@284@01 Int)) (!
  (=>
    (and (<= 0 i@284@01) (< i@284@01 N@186@01))
    (not (= (Seq_index a@183@01 i@284@01) $Ref.null)))
  :pattern ((Seq_index a@183@01 i@284@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(assert (=
  ($Snap.second $t@283@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@283@01))
    ($Snap.second ($Snap.second $t@283@01)))))
(declare-const i@287@01 Int)
(push) ; 4
; [eval] 0 <= i && i < N
; [eval] 0 <= i
(push) ; 5
; [then-branch: 104 | !(0 <= i@287@01) | live]
; [else-branch: 104 | 0 <= i@287@01 | live]
(push) ; 6
; [then-branch: 104 | !(0 <= i@287@01)]
(assert (not (<= 0 i@287@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 104 | 0 <= i@287@01]
(assert (<= 0 i@287@01))
; [eval] i < N
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@287@01) (not (<= 0 i@287@01))))
(assert (and (<= 0 i@287@01) (< i@287@01 N@186@01)))
; [eval] a[i]
(push) ; 5
(assert (not (>= i@287@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@287@01 (Seq_length a@183@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@288@01 ($Ref) Int)
(declare-fun img@289@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@287@01 Int)) (!
  (=>
    (and (<= 0 i@287@01) (< i@287@01 N@186@01))
    (or (<= 0 i@287@01) (not (<= 0 i@287@01))))
  :pattern ((Seq_index a@183@01 i@287@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@287@01 Int) (i2@287@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@287@01) (< i1@287@01 N@186@01))
      (and (<= 0 i2@287@01) (< i2@287@01 N@186@01))
      (= (Seq_index a@183@01 i1@287@01) (Seq_index a@183@01 i2@287@01)))
    (= i1@287@01 i2@287@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@287@01 Int)) (!
  (=>
    (and (<= 0 i@287@01) (< i@287@01 N@186@01))
    (and
      (= (inv@288@01 (Seq_index a@183@01 i@287@01)) i@287@01)
      (img@289@01 (Seq_index a@183@01 i@287@01))))
  :pattern ((Seq_index a@183@01 i@287@01))
  :qid |quant-u-177|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@289@01 r) (and (<= 0 (inv@288@01 r)) (< (inv@288@01 r) N@186@01)))
    (= (Seq_index a@183@01 (inv@288@01 r)) r))
  :pattern ((inv@288@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@287@01 Int)) (!
  (=>
    (and (<= 0 i@287@01) (< i@287@01 N@186@01))
    (not (= (Seq_index a@183@01 i@287@01) $Ref.null)))
  :pattern ((Seq_index a@183@01 i@287@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index a@183@01 i@287@01) (Seq_index a@183@01 i@284@01))
    (=
      (and
        (img@289@01 r)
        (and (<= 0 (inv@288@01 r)) (< (inv@288@01 r) N@186@01)))
      (and
        (img@286@01 r)
        (and (<= 0 (inv@285@01 r)) (< (inv@285@01 r) N@186@01)))))
  
  :qid |quant-u-178|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second $t@283@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@283@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@283@01))))))
(declare-const i@290@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] 0 <= i && i < N
; [eval] 0 <= i
(push) ; 5
; [then-branch: 105 | !(0 <= i@290@01) | live]
; [else-branch: 105 | 0 <= i@290@01 | live]
(push) ; 6
; [then-branch: 105 | !(0 <= i@290@01)]
(assert (not (<= 0 i@290@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 105 | 0 <= i@290@01]
(assert (<= 0 i@290@01))
; [eval] i < N
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@290@01) (not (<= 0 i@290@01))))
(assert (and (<= 0 i@290@01) (< i@290@01 N@186@01)))
; [eval] b[i]
(push) ; 5
(assert (not (>= i@290@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@290@01 (Seq_length b@184@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@291@01 ($Ref) Int)
(declare-fun img@292@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@290@01 Int)) (!
  (=>
    (and (<= 0 i@290@01) (< i@290@01 N@186@01))
    (or (<= 0 i@290@01) (not (<= 0 i@290@01))))
  :pattern ((Seq_index b@184@01 i@290@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@290@01 Int) (i2@290@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@290@01) (< i1@290@01 N@186@01))
      (and (<= 0 i2@290@01) (< i2@290@01 N@186@01))
      (= (Seq_index b@184@01 i1@290@01) (Seq_index b@184@01 i2@290@01)))
    (= i1@290@01 i2@290@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@290@01 Int)) (!
  (=>
    (and (<= 0 i@290@01) (< i@290@01 N@186@01))
    (and
      (= (inv@291@01 (Seq_index b@184@01 i@290@01)) i@290@01)
      (img@292@01 (Seq_index b@184@01 i@290@01))))
  :pattern ((Seq_index b@184@01 i@290@01))
  :qid |quant-u-180|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@292@01 r) (and (<= 0 (inv@291@01 r)) (< (inv@291@01 r) N@186@01)))
    (= (Seq_index b@184@01 (inv@291@01 r)) r))
  :pattern ((inv@291@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@290@01 Int)) (!
  (=>
    (and (<= 0 i@290@01) (< i@290@01 N@186@01))
    (not (= (Seq_index b@184@01 i@290@01) $Ref.null)))
  :pattern ((Seq_index b@184@01 i@290@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index b@184@01 i@290@01) (Seq_index a@183@01 i@287@01))
    (=
      (and
        (img@292@01 r)
        (and (<= 0 (inv@291@01 r)) (< (inv@291@01 r) N@186@01)))
      (and
        (img@289@01 r)
        (and (<= 0 (inv@288@01 r)) (< (inv@288@01 r) N@186@01)))))
  
  :qid |quant-u-181|))))
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
    (= (Seq_index b@184@01 i@290@01) (Seq_index a@183@01 i@284@01))
    (=
      (and
        (img@292@01 r)
        (and (<= 0 (inv@291@01 r)) (< (inv@291@01 r) N@186@01)))
      (and
        (img@286@01 r)
        (and (<= 0 (inv@285@01 r)) (< (inv@285@01 r) N@186@01)))))
  
  :qid |quant-u-182|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(declare-const i@293@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] 0 <= i && i < N
; [eval] 0 <= i
(push) ; 5
; [then-branch: 106 | !(0 <= i@293@01) | live]
; [else-branch: 106 | 0 <= i@293@01 | live]
(push) ; 6
; [then-branch: 106 | !(0 <= i@293@01)]
(assert (not (<= 0 i@293@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 106 | 0 <= i@293@01]
(assert (<= 0 i@293@01))
; [eval] i < N
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@293@01) (not (<= 0 i@293@01))))
(assert (and (<= 0 i@293@01) (< i@293@01 N@186@01)))
; [eval] c[i]
(push) ; 5
(assert (not (>= i@293@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@293@01 (Seq_length c@185@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@294@01 ($Ref) Int)
(declare-fun img@295@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@293@01 Int)) (!
  (=>
    (and (<= 0 i@293@01) (< i@293@01 N@186@01))
    (or (<= 0 i@293@01) (not (<= 0 i@293@01))))
  :pattern ((Seq_index c@185@01 i@293@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@293@01 Int) (i2@293@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@293@01) (< i1@293@01 N@186@01))
      (and (<= 0 i2@293@01) (< i2@293@01 N@186@01))
      (= (Seq_index c@185@01 i1@293@01) (Seq_index c@185@01 i2@293@01)))
    (= i1@293@01 i2@293@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@293@01 Int)) (!
  (=>
    (and (<= 0 i@293@01) (< i@293@01 N@186@01))
    (and
      (= (inv@294@01 (Seq_index c@185@01 i@293@01)) i@293@01)
      (img@295@01 (Seq_index c@185@01 i@293@01))))
  :pattern ((Seq_index c@185@01 i@293@01))
  :qid |quant-u-184|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@295@01 r) (and (<= 0 (inv@294@01 r)) (< (inv@294@01 r) N@186@01)))
    (= (Seq_index c@185@01 (inv@294@01 r)) r))
  :pattern ((inv@294@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@293@01 Int)) (!
  (=>
    (and (<= 0 i@293@01) (< i@293@01 N@186@01))
    (not (= (Seq_index c@185@01 i@293@01) $Ref.null)))
  :pattern ((Seq_index c@185@01 i@293@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index c@185@01 i@293@01) (Seq_index b@184@01 i@290@01))
    (=
      (and
        (img@295@01 r)
        (and (<= 0 (inv@294@01 r)) (< (inv@294@01 r) N@186@01)))
      (and
        (img@292@01 r)
        (and (<= 0 (inv@291@01 r)) (< (inv@291@01 r) N@186@01)))))
  
  :qid |quant-u-185|))))
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
    (= (Seq_index c@185@01 i@293@01) (Seq_index a@183@01 i@287@01))
    (=
      (and
        (img@295@01 r)
        (and (<= 0 (inv@294@01 r)) (< (inv@294@01 r) N@186@01)))
      (and
        (img@289@01 r)
        (and (<= 0 (inv@288@01 r)) (< (inv@288@01 r) N@186@01)))))
  
  :qid |quant-u-186|))))
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
    (= (Seq_index c@185@01 i@293@01) (Seq_index a@183@01 i@284@01))
    (=
      (and
        (img@295@01 r)
        (and (<= 0 (inv@294@01 r)) (< (inv@294@01 r) N@186@01)))
      (and
        (img@286@01 r)
        (and (<= 0 (inv@285@01 r)) (< (inv@285@01 r) N@186@01)))))
  
  :qid |quant-u-187|))))
(check-sat)
; unknown
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] |a| == N
; [eval] |a|
(declare-const i@296@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] 0 <= i && i < N
; [eval] 0 <= i
(push) ; 5
; [then-branch: 107 | !(0 <= i@296@01) | live]
; [else-branch: 107 | 0 <= i@296@01 | live]
(push) ; 6
; [then-branch: 107 | !(0 <= i@296@01)]
(assert (not (<= 0 i@296@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 107 | 0 <= i@296@01]
(assert (<= 0 i@296@01))
; [eval] i < N
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@296@01) (not (<= 0 i@296@01))))
(assert (and (<= 0 i@296@01) (< i@296@01 N@186@01)))
; [eval] a[i]
(push) ; 5
(assert (not (>= i@296@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@296@01 (Seq_length a@183@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@297@01 ($Ref) Int)
(declare-fun img@298@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@296@01 Int)) (!
  (=>
    (and (<= 0 i@296@01) (< i@296@01 N@186@01))
    (or (<= 0 i@296@01) (not (<= 0 i@296@01))))
  :pattern ((Seq_index a@183@01 i@296@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@296@01 Int) (i2@296@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@296@01) (< i1@296@01 N@186@01))
      (and (<= 0 i2@296@01) (< i2@296@01 N@186@01))
      (= (Seq_index a@183@01 i1@296@01) (Seq_index a@183@01 i2@296@01)))
    (= i1@296@01 i2@296@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@296@01 Int)) (!
  (=>
    (and (<= 0 i@296@01) (< i@296@01 N@186@01))
    (and
      (= (inv@297@01 (Seq_index a@183@01 i@296@01)) i@296@01)
      (img@298@01 (Seq_index a@183@01 i@296@01))))
  :pattern ((Seq_index a@183@01 i@296@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@298@01 r) (and (<= 0 (inv@297@01 r)) (< (inv@297@01 r) N@186@01)))
    (= (Seq_index a@183@01 (inv@297@01 r)) r))
  :pattern ((inv@297@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((i@296@01 Int)) (!
  (= (Seq_index a@183@01 i@296@01) (Seq_index b@184@01 i@296@01))
  
  :qid |quant-u-189|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((i@296@01 Int)) (!
  (= (Seq_index a@183@01 i@296@01) (Seq_index c@185@01 i@296@01))
  
  :qid |quant-u-190|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@299@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@297@01 r)) (< (inv@297@01 r) N@186@01))
      (img@298@01 r)
      (= r (Seq_index a@183@01 (inv@297@01 r))))
    ($Perm.min
      (ite
        (and
          (img@286@01 r)
          (and (<= 0 (inv@285@01 r)) (< (inv@285@01 r) N@186@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@300@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@297@01 r)) (< (inv@297@01 r) N@186@01))
      (img@298@01 r)
      (= r (Seq_index a@183@01 (inv@297@01 r))))
    ($Perm.min
      (ite
        (and
          (img@289@01 r)
          (and (<= 0 (inv@288@01 r)) (< (inv@288@01 r) N@186@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (- $Perm.Write (pTaken@299@01 r)))
    $Perm.No))
(define-fun pTaken@301@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@297@01 r)) (< (inv@297@01 r) N@186@01))
      (img@298@01 r)
      (= r (Seq_index a@183@01 (inv@297@01 r))))
    ($Perm.min
      (ite
        (and
          (img@292@01 r)
          (and (<= 0 (inv@291@01 r)) (< (inv@291@01 r) N@186@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (- (- $Perm.Write (pTaken@299@01 r)) (pTaken@300@01 r)))
    $Perm.No))
(define-fun pTaken@302@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@297@01 r)) (< (inv@297@01 r) N@186@01))
      (img@298@01 r)
      (= r (Seq_index a@183@01 (inv@297@01 r))))
    ($Perm.min
      (ite
        (and
          (img@295@01 r)
          (and (<= 0 (inv@294@01 r)) (< (inv@294@01 r) N@186@01)))
        $Perm.Write
        $Perm.No)
      (-
        (- (- $Perm.Write (pTaken@299@01 r)) (pTaken@300@01 r))
        (pTaken@301@01 r)))
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
          (img@286@01 r)
          (and (<= 0 (inv@285@01 r)) (< (inv@285@01 r) N@186@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@299@01 r))
    $Perm.No)
  
  :qid |quant-u-192|))))
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
      (and (<= 0 (inv@297@01 r)) (< (inv@297@01 r) N@186@01))
      (img@298@01 r)
      (= r (Seq_index a@183@01 (inv@297@01 r))))
    (= (- $Perm.Write (pTaken@299@01 r)) $Perm.No))
  
  :qid |quant-u-193|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@303@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@286@01 r) (and (<= 0 (inv@285@01 r)) (< (inv@285@01 r) N@186@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@303@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first $t@283@01)) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@303@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first $t@283@01)) r))
  :qid |qp.fvfValDef18|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@289@01 r) (and (<= 0 (inv@288@01 r)) (< (inv@288@01 r) N@186@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@303@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@283@01))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@303@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@283@01))) r))
  :qid |qp.fvfValDef19|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@292@01 r) (and (<= 0 (inv@291@01 r)) (< (inv@291@01 r) N@186@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@303@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second $t@283@01)))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@303@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second $t@283@01)))) r))
  :qid |qp.fvfValDef20|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@295@01 r) (and (<= 0 (inv@294@01 r)) (< (inv@294@01 r) N@186@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@303@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second $t@283@01)))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@303@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second $t@283@01)))) r))
  :qid |qp.fvfValDef21|)))
; [eval] |b| == N
; [eval] |b|
(declare-const i@304@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] 0 <= i && i < N
; [eval] 0 <= i
(push) ; 5
; [then-branch: 108 | !(0 <= i@304@01) | live]
; [else-branch: 108 | 0 <= i@304@01 | live]
(push) ; 6
; [then-branch: 108 | !(0 <= i@304@01)]
(assert (not (<= 0 i@304@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 108 | 0 <= i@304@01]
(assert (<= 0 i@304@01))
; [eval] i < N
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@304@01) (not (<= 0 i@304@01))))
(assert (and (<= 0 i@304@01) (< i@304@01 N@186@01)))
; [eval] b[i]
(push) ; 5
(assert (not (>= i@304@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@304@01 (Seq_length b@184@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@305@01 ($Ref) Int)
(declare-fun img@306@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@304@01 Int)) (!
  (=>
    (and (<= 0 i@304@01) (< i@304@01 N@186@01))
    (or (<= 0 i@304@01) (not (<= 0 i@304@01))))
  :pattern ((Seq_index b@184@01 i@304@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@304@01 Int) (i2@304@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@304@01) (< i1@304@01 N@186@01))
      (and (<= 0 i2@304@01) (< i2@304@01 N@186@01))
      (= (Seq_index b@184@01 i1@304@01) (Seq_index b@184@01 i2@304@01)))
    (= i1@304@01 i2@304@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@304@01 Int)) (!
  (=>
    (and (<= 0 i@304@01) (< i@304@01 N@186@01))
    (and
      (= (inv@305@01 (Seq_index b@184@01 i@304@01)) i@304@01)
      (img@306@01 (Seq_index b@184@01 i@304@01))))
  :pattern ((Seq_index b@184@01 i@304@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@306@01 r) (and (<= 0 (inv@305@01 r)) (< (inv@305@01 r) N@186@01)))
    (= (Seq_index b@184@01 (inv@305@01 r)) r))
  :pattern ((inv@305@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((i@304@01 Int)) (!
  (= (Seq_index b@184@01 i@304@01) (Seq_index c@185@01 i@304@01))
  
  :qid |quant-u-195|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((i@304@01 Int)) (!
  (= (Seq_index b@184@01 i@304@01) (Seq_index a@183@01 i@304@01))
  
  :qid |quant-u-196|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@307@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@305@01 r)) (< (inv@305@01 r) N@186@01))
      (img@306@01 r)
      (= r (Seq_index b@184@01 (inv@305@01 r))))
    ($Perm.min
      (ite
        (and
          (img@295@01 r)
          (and (<= 0 (inv@294@01 r)) (< (inv@294@01 r) N@186@01)))
        $Perm.Write
        $Perm.No)
      (/ (to_real 1) (to_real 2)))
    $Perm.No))
(define-fun pTaken@308@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@305@01 r)) (< (inv@305@01 r) N@186@01))
      (img@306@01 r)
      (= r (Seq_index b@184@01 (inv@305@01 r))))
    ($Perm.min
      (ite
        (and
          (img@292@01 r)
          (and (<= 0 (inv@291@01 r)) (< (inv@291@01 r) N@186@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (- (/ (to_real 1) (to_real 2)) (pTaken@307@01 r)))
    $Perm.No))
(define-fun pTaken@309@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@305@01 r)) (< (inv@305@01 r) N@186@01))
      (img@306@01 r)
      (= r (Seq_index b@184@01 (inv@305@01 r))))
    ($Perm.min
      (ite
        (and
          (img@289@01 r)
          (and (<= 0 (inv@288@01 r)) (< (inv@288@01 r) N@186@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (- (- (/ (to_real 1) (to_real 2)) (pTaken@307@01 r)) (pTaken@308@01 r)))
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
          (img@295@01 r)
          (and (<= 0 (inv@294@01 r)) (< (inv@294@01 r) N@186@01)))
        $Perm.Write
        $Perm.No)
      (pTaken@307@01 r))
    $Perm.No)
  
  :qid |quant-u-198|))))
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
      (and (<= 0 (inv@305@01 r)) (< (inv@305@01 r) N@186@01))
      (img@306@01 r)
      (= r (Seq_index b@184@01 (inv@305@01 r))))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@307@01 r)) $Perm.No))
  
  :qid |quant-u-199|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@310@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@295@01 r) (and (<= 0 (inv@294@01 r)) (< (inv@294@01 r) N@186@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@310@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second $t@283@01)))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@310@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second $t@283@01)))) r))
  :qid |qp.fvfValDef22|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@292@01 r) (and (<= 0 (inv@291@01 r)) (< (inv@291@01 r) N@186@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@310@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second $t@283@01)))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@310@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second $t@283@01)))) r))
  :qid |qp.fvfValDef23|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@289@01 r) (and (<= 0 (inv@288@01 r)) (< (inv@288@01 r) N@186@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@310@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@283@01))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@310@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@283@01))) r))
  :qid |qp.fvfValDef24|)))
; [eval] |c| == N
; [eval] |c|
(declare-const i@311@01 Int)
(set-option :timeout 0)
(push) ; 4
; [eval] 0 <= i && i < N
; [eval] 0 <= i
(push) ; 5
; [then-branch: 109 | !(0 <= i@311@01) | live]
; [else-branch: 109 | 0 <= i@311@01 | live]
(push) ; 6
; [then-branch: 109 | !(0 <= i@311@01)]
(assert (not (<= 0 i@311@01)))
(pop) ; 6
(push) ; 6
; [else-branch: 109 | 0 <= i@311@01]
(assert (<= 0 i@311@01))
; [eval] i < N
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@311@01) (not (<= 0 i@311@01))))
(assert (and (<= 0 i@311@01) (< i@311@01 N@186@01)))
; [eval] c[i]
(push) ; 5
(assert (not (>= i@311@01 0)))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(push) ; 5
(assert (not (< i@311@01 (Seq_length c@185@01))))
(check-sat)
; unsat
(pop) ; 5
; 0,00s
; (get-info :all-statistics)
(pop) ; 4
(declare-fun inv@312@01 ($Ref) Int)
(declare-fun img@313@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@311@01 Int)) (!
  (=>
    (and (<= 0 i@311@01) (< i@311@01 N@186@01))
    (or (<= 0 i@311@01) (not (<= 0 i@311@01))))
  :pattern ((Seq_index c@185@01 i@311@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 4
(assert (not (forall ((i1@311@01 Int) (i2@311@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@311@01) (< i1@311@01 N@186@01))
      (and (<= 0 i2@311@01) (< i2@311@01 N@186@01))
      (= (Seq_index c@185@01 i1@311@01) (Seq_index c@185@01 i2@311@01)))
    (= i1@311@01 i2@311@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@311@01 Int)) (!
  (=>
    (and (<= 0 i@311@01) (< i@311@01 N@186@01))
    (and
      (= (inv@312@01 (Seq_index c@185@01 i@311@01)) i@311@01)
      (img@313@01 (Seq_index c@185@01 i@311@01))))
  :pattern ((Seq_index c@185@01 i@311@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@313@01 r) (and (<= 0 (inv@312@01 r)) (< (inv@312@01 r) N@186@01)))
    (= (Seq_index c@185@01 (inv@312@01 r)) r))
  :pattern ((inv@312@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((i@311@01 Int)) (!
  (= (Seq_index c@185@01 i@311@01) (Seq_index a@183@01 i@311@01))
  
  :qid |quant-u-201|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 4
(set-option :timeout 10)
(assert (not (forall ((i@311@01 Int)) (!
  (= (Seq_index c@185@01 i@311@01) (Seq_index b@184@01 i@311@01))
  
  :qid |quant-u-202|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@314@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@312@01 r)) (< (inv@312@01 r) N@186@01))
      (img@313@01 r)
      (= r (Seq_index c@185@01 (inv@312@01 r))))
    ($Perm.min
      (ite
        (and
          (img@289@01 r)
          (and (<= 0 (inv@288@01 r)) (< (inv@288@01 r) N@186@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@315@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@312@01 r)) (< (inv@312@01 r) N@186@01))
      (img@313@01 r)
      (= r (Seq_index c@185@01 (inv@312@01 r))))
    ($Perm.min
      (ite
        (and
          (img@292@01 r)
          (and (<= 0 (inv@291@01 r)) (< (inv@291@01 r) N@186@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (- $Perm.Write (pTaken@314@01 r)))
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
          (img@289@01 r)
          (and (<= 0 (inv@288@01 r)) (< (inv@288@01 r) N@186@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@314@01 r))
    $Perm.No)
  
  :qid |quant-u-204|))))
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
      (and (<= 0 (inv@312@01 r)) (< (inv@312@01 r) N@186@01))
      (img@313@01 r)
      (= r (Seq_index c@185@01 (inv@312@01 r))))
    (= (- $Perm.Write (pTaken@314@01 r)) $Perm.No))
  
  :qid |quant-u-205|))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@316@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@289@01 r) (and (<= 0 (inv@288@01 r)) (< (inv@288@01 r) N@186@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@316@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@283@01))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@316@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@283@01))) r))
  :qid |qp.fvfValDef25|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@292@01 r) (and (<= 0 (inv@291@01 r)) (< (inv@291@01 r) N@186@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@316@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second $t@283@01)))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@316@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second $t@283@01)))) r))
  :qid |qp.fvfValDef26|)))
(pop) ; 3
(pop) ; 2
(pop) ; 1
