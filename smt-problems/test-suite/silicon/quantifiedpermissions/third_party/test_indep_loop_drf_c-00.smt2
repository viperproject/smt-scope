(get-info :version)
; (:version "4.8.7")
; Started: 2024-11-17 20:23:40
; Silicon.version: 1.1-SNAPSHOT (4d756c79+)
; Input file: /silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_indep_loop_drf_c.vpr
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
; [eval] N <= |a|
; [eval] |a|
(assert (<= N@10@01 (Seq_length a@9@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@12@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@12@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@12@01))))
  $Snap.unit))
; [eval] N <= |b|
; [eval] |b|
(assert (<= N@10@01 (Seq_length b@8@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))
  $Snap.unit))
; [eval] N <= |c|
; [eval] |c|
(assert (<= N@10@01 (Seq_length c@11@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))
  $Snap.unit))
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
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_indep_loop_drf_c.vpr@62@12@62@100-aux|)))
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
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_indep_loop_drf_c.vpr@62@12@62@100|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))
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
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_indep_loop_drf_c.vpr@63@12@63@100-aux|)))
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
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_indep_loop_drf_c.vpr@63@12@63@100|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))
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
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_indep_loop_drf_c.vpr@64@12@64@100-aux|)))
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
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_indep_loop_drf_c.vpr@64@12@64@100|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))))))
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
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@12@01)))))))))))))
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
; [eval] c[i]
(push) ; 3
(assert (not (>= i@22@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@22@01 (Seq_length c@11@01))))
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
  :pattern ((Seq_index c@11@01 i@22@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@22@01 Int) (i2@22@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@22@01) (< i1@22@01 N@10@01))
      (and (<= 0 i2@22@01) (< i2@22@01 N@10@01))
      (= (Seq_index c@11@01 i1@22@01) (Seq_index c@11@01 i2@22@01)))
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
      (= (inv@23@01 (Seq_index c@11@01 i@22@01)) i@22@01)
      (img@24@01 (Seq_index c@11@01 i@22@01))))
  :pattern ((Seq_index c@11@01 i@22@01))
  :qid |quant-u-51|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@24@01 r) (and (<= 0 (inv@23@01 r)) (< (inv@23@01 r) N@10@01)))
    (= (Seq_index c@11@01 (inv@23@01 r)) r))
  :pattern ((inv@23@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@22@01 Int)) (!
  (=>
    (and (<= 0 i@22@01) (< i@22@01 N@10@01))
    (not (= (Seq_index c@11@01 i@22@01) $Ref.null)))
  :pattern ((Seq_index c@11@01 i@22@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 2
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index c@11@01 i@22@01) (Seq_index a@9@01 i@19@01))
    (=
      (and (img@24@01 r) (and (<= 0 (inv@23@01 r)) (< (inv@23@01 r) N@10@01)))
      (and (img@21@01 r) (and (<= 0 (inv@20@01 r)) (< (inv@20@01 r) N@10@01)))))
  
  :qid |quant-u-52|))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
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
; [eval] b[i]
(push) ; 3
(assert (not (>= i@25@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@25@01 (Seq_length b@8@01))))
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
  :pattern ((Seq_index b@8@01 i@25@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@25@01 Int) (i2@25@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@25@01) (< i1@25@01 N@10@01))
      (and (<= 0 i2@25@01) (< i2@25@01 N@10@01))
      (= (Seq_index b@8@01 i1@25@01) (Seq_index b@8@01 i2@25@01)))
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
      (= (inv@26@01 (Seq_index b@8@01 i@25@01)) i@25@01)
      (img@27@01 (Seq_index b@8@01 i@25@01))))
  :pattern ((Seq_index b@8@01 i@25@01))
  :qid |quant-u-54|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@27@01 r) (and (<= 0 (inv@26@01 r)) (< (inv@26@01 r) N@10@01)))
    (= (Seq_index b@8@01 (inv@26@01 r)) r))
  :pattern ((inv@26@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@25@01 Int)) (!
  (=>
    (and (<= 0 i@25@01) (< i@25@01 N@10@01))
    (not (= (Seq_index b@8@01 i@25@01) $Ref.null)))
  :pattern ((Seq_index b@8@01 i@25@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 2
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index b@8@01 i@25@01) (Seq_index c@11@01 i@22@01))
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
    (= (Seq_index b@8@01 i@25@01) (Seq_index a@9@01 i@19@01))
    (=
      (and (img@27@01 r) (and (<= 0 (inv@26@01 r)) (< (inv@26@01 r) N@10@01)))
      (and (img@21@01 r) (and (<= 0 (inv@20@01 r)) (< (inv@20@01 r) N@10@01)))))
  
  :qid |quant-u-56|))))
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
(declare-const $t@28@01 $Snap)
(assert (= $t@28@01 ($Snap.combine ($Snap.first $t@28@01) ($Snap.second $t@28@01))))
(declare-const i@29@01 Int)
(push) ; 3
; [eval] 0 <= i && i < N
; [eval] 0 <= i
(push) ; 4
; [then-branch: 18 | !(0 <= i@29@01) | live]
; [else-branch: 18 | 0 <= i@29@01 | live]
(push) ; 5
; [then-branch: 18 | !(0 <= i@29@01)]
(assert (not (<= 0 i@29@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 18 | 0 <= i@29@01]
(assert (<= 0 i@29@01))
; [eval] i < N
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@29@01) (not (<= 0 i@29@01))))
(assert (and (<= 0 i@29@01) (< i@29@01 N@10@01)))
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
    (and (<= 0 i@29@01) (< i@29@01 N@10@01))
    (or (<= 0 i@29@01) (not (<= 0 i@29@01))))
  :pattern ((Seq_index a@9@01 i@29@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@29@01 Int) (i2@29@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@29@01) (< i1@29@01 N@10@01))
      (and (<= 0 i2@29@01) (< i2@29@01 N@10@01))
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
    (and (<= 0 i@29@01) (< i@29@01 N@10@01))
    (and
      (= (inv@30@01 (Seq_index a@9@01 i@29@01)) i@29@01)
      (img@31@01 (Seq_index a@9@01 i@29@01))))
  :pattern ((Seq_index a@9@01 i@29@01))
  :qid |quant-u-58|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@31@01 r) (and (<= 0 (inv@30@01 r)) (< (inv@30@01 r) N@10@01)))
    (= (Seq_index a@9@01 (inv@30@01 r)) r))
  :pattern ((inv@30@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@29@01 Int)) (!
  (=>
    (and (<= 0 i@29@01) (< i@29@01 N@10@01))
    (not (= (Seq_index a@9@01 i@29@01) $Ref.null)))
  :pattern ((Seq_index a@9@01 i@29@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(assert (=
  ($Snap.second $t@28@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@28@01))
    ($Snap.second ($Snap.second $t@28@01)))))
(declare-const i@32@01 Int)
(push) ; 3
; [eval] 0 <= i && i < N
; [eval] 0 <= i
(push) ; 4
; [then-branch: 19 | !(0 <= i@32@01) | live]
; [else-branch: 19 | 0 <= i@32@01 | live]
(push) ; 5
; [then-branch: 19 | !(0 <= i@32@01)]
(assert (not (<= 0 i@32@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 19 | 0 <= i@32@01]
(assert (<= 0 i@32@01))
; [eval] i < N
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@32@01) (not (<= 0 i@32@01))))
(assert (and (<= 0 i@32@01) (< i@32@01 N@10@01)))
; [eval] c[i]
(push) ; 4
(assert (not (>= i@32@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@32@01 (Seq_length c@11@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@33@01 ($Ref) Int)
(declare-fun img@34@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@32@01 Int)) (!
  (=>
    (and (<= 0 i@32@01) (< i@32@01 N@10@01))
    (or (<= 0 i@32@01) (not (<= 0 i@32@01))))
  :pattern ((Seq_index c@11@01 i@32@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@32@01 Int) (i2@32@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@32@01) (< i1@32@01 N@10@01))
      (and (<= 0 i2@32@01) (< i2@32@01 N@10@01))
      (= (Seq_index c@11@01 i1@32@01) (Seq_index c@11@01 i2@32@01)))
    (= i1@32@01 i2@32@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@32@01 Int)) (!
  (=>
    (and (<= 0 i@32@01) (< i@32@01 N@10@01))
    (and
      (= (inv@33@01 (Seq_index c@11@01 i@32@01)) i@32@01)
      (img@34@01 (Seq_index c@11@01 i@32@01))))
  :pattern ((Seq_index c@11@01 i@32@01))
  :qid |quant-u-60|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@34@01 r) (and (<= 0 (inv@33@01 r)) (< (inv@33@01 r) N@10@01)))
    (= (Seq_index c@11@01 (inv@33@01 r)) r))
  :pattern ((inv@33@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@32@01 Int)) (!
  (=>
    (and (<= 0 i@32@01) (< i@32@01 N@10@01))
    (not (= (Seq_index c@11@01 i@32@01) $Ref.null)))
  :pattern ((Seq_index c@11@01 i@32@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index c@11@01 i@32@01) (Seq_index a@9@01 i@29@01))
    (=
      (and (img@34@01 r) (and (<= 0 (inv@33@01 r)) (< (inv@33@01 r) N@10@01)))
      (and (img@31@01 r) (and (<= 0 (inv@30@01 r)) (< (inv@30@01 r) N@10@01)))))
  
  :qid |quant-u-61|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const i@35@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i && i < N
; [eval] 0 <= i
(push) ; 4
; [then-branch: 20 | !(0 <= i@35@01) | live]
; [else-branch: 20 | 0 <= i@35@01 | live]
(push) ; 5
; [then-branch: 20 | !(0 <= i@35@01)]
(assert (not (<= 0 i@35@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 20 | 0 <= i@35@01]
(assert (<= 0 i@35@01))
; [eval] i < N
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@35@01) (not (<= 0 i@35@01))))
(assert (and (<= 0 i@35@01) (< i@35@01 N@10@01)))
; [eval] b[i]
(push) ; 4
(assert (not (>= i@35@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@35@01 (Seq_length b@8@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@36@01 ($Ref) Int)
(declare-fun img@37@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@35@01 Int)) (!
  (=>
    (and (<= 0 i@35@01) (< i@35@01 N@10@01))
    (or (<= 0 i@35@01) (not (<= 0 i@35@01))))
  :pattern ((Seq_index b@8@01 i@35@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@35@01 Int) (i2@35@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@35@01) (< i1@35@01 N@10@01))
      (and (<= 0 i2@35@01) (< i2@35@01 N@10@01))
      (= (Seq_index b@8@01 i1@35@01) (Seq_index b@8@01 i2@35@01)))
    (= i1@35@01 i2@35@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@35@01 Int)) (!
  (=>
    (and (<= 0 i@35@01) (< i@35@01 N@10@01))
    (and
      (= (inv@36@01 (Seq_index b@8@01 i@35@01)) i@35@01)
      (img@37@01 (Seq_index b@8@01 i@35@01))))
  :pattern ((Seq_index b@8@01 i@35@01))
  :qid |quant-u-63|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@37@01 r) (and (<= 0 (inv@36@01 r)) (< (inv@36@01 r) N@10@01)))
    (= (Seq_index b@8@01 (inv@36@01 r)) r))
  :pattern ((inv@36@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@35@01 Int)) (!
  (=>
    (and (<= 0 i@35@01) (< i@35@01 N@10@01))
    (not (= (Seq_index b@8@01 i@35@01) $Ref.null)))
  :pattern ((Seq_index b@8@01 i@35@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index b@8@01 i@35@01) (Seq_index c@11@01 i@32@01))
    (=
      (and (img@37@01 r) (and (<= 0 (inv@36@01 r)) (< (inv@36@01 r) N@10@01)))
      (and (img@34@01 r) (and (<= 0 (inv@33@01 r)) (< (inv@33@01 r) N@10@01)))))
  
  :qid |quant-u-64|))))
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
    (= (Seq_index b@8@01 i@35@01) (Seq_index a@9@01 i@29@01))
    (=
      (and (img@37@01 r) (and (<= 0 (inv@36@01 r)) (< (inv@36@01 r) N@10@01)))
      (and (img@31@01 r) (and (<= 0 (inv@30@01 r)) (< (inv@30@01 r) N@10@01)))))
  
  :qid |quant-u-65|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
; [exec]
; inhale false
(pop) ; 2
(pop) ; 1
; ---------- Ref__loop_body_45 ----------
(declare-const diz@38@01 $Ref)
(declare-const current_thread_id@39@01 Int)
(declare-const b@40@01 Seq<$Ref>)
(declare-const a@41@01 Seq<$Ref>)
(declare-const i@42@01 Int)
(declare-const N@43@01 Int)
(declare-const c@44@01 Seq<$Ref>)
(declare-const diz@45@01 $Ref)
(declare-const current_thread_id@46@01 Int)
(declare-const b@47@01 Seq<$Ref>)
(declare-const a@48@01 Seq<$Ref>)
(declare-const i@49@01 Int)
(declare-const N@50@01 Int)
(declare-const c@51@01 Seq<$Ref>)
(push) ; 1
(declare-const $t@52@01 $Snap)
(assert (= $t@52@01 ($Snap.combine ($Snap.first $t@52@01) ($Snap.second $t@52@01))))
(assert (= ($Snap.first $t@52@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@45@01 $Ref.null)))
(assert (=
  ($Snap.second $t@52@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@52@01))
    ($Snap.second ($Snap.second $t@52@01)))))
(assert (= ($Snap.first ($Snap.second $t@52@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@46@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@52@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@52@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@52@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@52@01))) $Snap.unit))
; [eval] 0 <= i
(assert (<= 0 i@49@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@52@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@52@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@52@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@52@01))))
  $Snap.unit))
; [eval] i < N
(assert (< i@49@01 N@50@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@52@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@52@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@52@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@52@01)))))
  $Snap.unit))
; [eval] N <= |a|
; [eval] |a|
(assert (<= N@50@01 (Seq_length a@48@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@52@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@52@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@52@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@52@01))))))
  $Snap.unit))
; [eval] N <= |b|
; [eval] |b|
(assert (<= N@50@01 (Seq_length b@47@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@52@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@52@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@52@01))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@52@01)))))))
  $Snap.unit))
; [eval] N <= |c|
; [eval] |c|
(assert (<= N@50@01 (Seq_length c@51@01)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@52@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@52@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@52@01)))))))))))
; [eval] a[i]
(push) ; 2
(assert (not (>= i@49@01 0)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(push) ; 2
(assert (not (< i@49@01 (Seq_length a@48@01))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= (Seq_index a@48@01 i@49@01) $Ref.null)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@52@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@52@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@52@01))))))))))))
; [eval] c[i]
(push) ; 2
(assert (not (>= i@49@01 0)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(push) ; 2
(assert (not (< i@49@01 (Seq_length c@51@01))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(push) ; 2
(set-option :timeout 10)
(assert (not (= (Seq_index a@48@01 i@49@01) (Seq_index c@51@01 i@49@01))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= (Seq_index c@51@01 i@49@01) $Ref.null)))
; [eval] b[i]
(set-option :timeout 0)
(push) ; 2
(assert (not (>= i@49@01 0)))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(push) ; 2
(assert (not (< i@49@01 (Seq_length b@47@01))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(push) ; 2
(set-option :timeout 10)
(assert (not (= (Seq_index c@51@01 i@49@01) (Seq_index b@47@01 i@49@01))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 2
(set-option :timeout 10)
(assert (not (= (Seq_index a@48@01 i@49@01) (Seq_index b@47@01 i@49@01))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (not (= (Seq_index b@47@01 i@49@01) $Ref.null)))
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
(set-option :timeout 0)
(push) ; 2
(declare-const $t@53@01 $Snap)
(assert (= $t@53@01 ($Snap.combine ($Snap.first $t@53@01) ($Snap.second $t@53@01))))
(assert (= ($Snap.first $t@53@01) $Snap.unit))
; [eval] 0 <= i
(assert (=
  ($Snap.second $t@53@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@53@01))
    ($Snap.second ($Snap.second $t@53@01)))))
(assert (= ($Snap.first ($Snap.second $t@53@01)) $Snap.unit))
; [eval] i < N
(assert (=
  ($Snap.second ($Snap.second $t@53@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@53@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@53@01))))))
; [eval] a[i]
(push) ; 3
(assert (not (>= i@49@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@49@01 (Seq_length a@48@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@53@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@53@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@53@01)))))))
; [eval] c[i]
(push) ; 3
(assert (not (>= i@49@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@49@01 (Seq_length c@51@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (Seq_index a@48@01 i@49@01) (Seq_index c@51@01 i@49@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] b[i]
(set-option :timeout 0)
(push) ; 3
(assert (not (>= i@49@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@49@01 (Seq_length b@47@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (Seq_index c@51@01 i@49@01) (Seq_index b@47@01 i@49@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (Seq_index a@48@01 i@49@01) (Seq_index b@47@01 i@49@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(set-option :timeout 0)
(push) ; 2
; [exec]
; var __flatten_2: Ref
(declare-const __flatten_2@54@01 $Ref)
; [exec]
; var __flatten_3: Int
(declare-const __flatten_3@55@01 Int)
; [exec]
; var __flatten_4: Ref
(declare-const __flatten_4@56@01 $Ref)
; [exec]
; var __flatten_5: Ref
(declare-const __flatten_5@57@01 $Ref)
; [exec]
; var __flatten_6: Int
(declare-const __flatten_6@58@01 Int)
; [exec]
; var __flatten_7: Ref
(declare-const __flatten_7@59@01 $Ref)
; [exec]
; __flatten_2 := a[i]
; [eval] a[i]
(push) ; 3
(assert (not (>= i@49@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@49@01 (Seq_length a@48@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_2@60@01 $Ref)
(assert (= __flatten_2@60@01 (Seq_index a@48@01 i@49@01)))
; [exec]
; __flatten_4 := b[i]
; [eval] b[i]
(push) ; 3
(assert (not (>= i@49@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@49@01 (Seq_length b@47@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_4@61@01 $Ref)
(assert (= __flatten_4@61@01 (Seq_index b@47@01 i@49@01)))
; [exec]
; __flatten_3 := __flatten_4.Ref__Integer_value + 1
; [eval] __flatten_4.Ref__Integer_value + 1
(push) ; 3
(set-option :timeout 10)
(assert (not (= (Seq_index b@47@01 i@49@01) __flatten_4@61@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_3@62@01 Int)
(assert (=
  __flatten_3@62@01
  (+
    ($SortWrappers.$SnapToInt ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@52@01))))))))))
    1)))
; [exec]
; __flatten_2.Ref__Integer_value := __flatten_3
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (Seq_index b@47@01 i@49@01) __flatten_2@60@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (Seq_index c@51@01 i@49@01) __flatten_2@60@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (Seq_index a@48@01 i@49@01) __flatten_2@60@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (Seq_index b@47@01 i@49@01) __flatten_2@60@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (Seq_index c@51@01 i@49@01) __flatten_2@60@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not (= __flatten_2@60@01 $Ref.null)))
; [exec]
; __flatten_5 := c[i]
; [eval] c[i]
(set-option :timeout 0)
(push) ; 3
(assert (not (>= i@49@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@49@01 (Seq_length c@51@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_5@63@01 $Ref)
(assert (= __flatten_5@63@01 (Seq_index c@51@01 i@49@01)))
; [exec]
; __flatten_7 := a[i]
; [eval] a[i]
(push) ; 3
(assert (not (>= i@49@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@49@01 (Seq_length a@48@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_7@64@01 $Ref)
(assert (= __flatten_7@64@01 (Seq_index a@48@01 i@49@01)))
; [exec]
; __flatten_6 := __flatten_7.Ref__Integer_value + 2
; [eval] __flatten_7.Ref__Integer_value + 2
(push) ; 3
(set-option :timeout 10)
(assert (not (= __flatten_2@60@01 __flatten_7@64@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const __flatten_6@65@01 Int)
(assert (= __flatten_6@65@01 (+ __flatten_3@62@01 2)))
; [exec]
; __flatten_5.Ref__Integer_value := __flatten_6
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= __flatten_2@60@01 __flatten_5@63@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (Seq_index b@47@01 i@49@01) __flatten_5@63@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (Seq_index c@51@01 i@49@01) __flatten_5@63@01)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= __flatten_2@60@01 __flatten_5@63@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (= (Seq_index b@47@01 i@49@01) __flatten_5@63@01)))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (not (= __flatten_5@63@01 $Ref.null)))
; [eval] 0 <= i
; [eval] i < N
; [eval] a[i]
(set-option :timeout 0)
(push) ; 3
(assert (not (>= i@49@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@49@01 (Seq_length a@48@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(set-option :timeout 10)
(assert (not (= __flatten_5@63@01 (Seq_index a@48@01 i@49@01))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] c[i]
(set-option :timeout 0)
(push) ; 3
(assert (not (>= i@49@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@49@01 (Seq_length c@51@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; [eval] b[i]
(push) ; 3
(assert (not (>= i@49@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@49@01 (Seq_length b@47@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(pop) ; 1
; ---------- Ref__example ----------
(declare-const diz@66@01 $Ref)
(declare-const current_thread_id@67@01 Int)
(declare-const a@68@01 Seq<$Ref>)
(declare-const b@69@01 Seq<$Ref>)
(declare-const c@70@01 Seq<$Ref>)
(declare-const N@71@01 Int)
(declare-const diz@72@01 $Ref)
(declare-const current_thread_id@73@01 Int)
(declare-const a@74@01 Seq<$Ref>)
(declare-const b@75@01 Seq<$Ref>)
(declare-const c@76@01 Seq<$Ref>)
(declare-const N@77@01 Int)
(push) ; 1
(declare-const $t@78@01 $Snap)
(assert (= $t@78@01 ($Snap.combine ($Snap.first $t@78@01) ($Snap.second $t@78@01))))
(assert (= ($Snap.first $t@78@01) $Snap.unit))
; [eval] diz != null
(assert (not (= diz@72@01 $Ref.null)))
(assert (=
  ($Snap.second $t@78@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@78@01))
    ($Snap.second ($Snap.second $t@78@01)))))
(assert (= ($Snap.first ($Snap.second $t@78@01)) $Snap.unit))
; [eval] current_thread_id >= 0
(assert (>= current_thread_id@73@01 0))
(assert (=
  ($Snap.second ($Snap.second $t@78@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@78@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@78@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@78@01))) $Snap.unit))
; [eval] (forall k: Int, j: Int :: { a[k], a[j] } k >= 0 && (k < |a| && (j >= 0 && (j < |a| && k != j))) ==> a[k] != a[j])
(declare-const k@79@01 Int)
(declare-const j@80@01 Int)
(push) ; 2
; [eval] k >= 0 && (k < |a| && (j >= 0 && (j < |a| && k != j))) ==> a[k] != a[j]
; [eval] k >= 0 && (k < |a| && (j >= 0 && (j < |a| && k != j)))
; [eval] k >= 0
(push) ; 3
; [then-branch: 21 | !(k@79@01 >= 0) | live]
; [else-branch: 21 | k@79@01 >= 0 | live]
(push) ; 4
; [then-branch: 21 | !(k@79@01 >= 0)]
(assert (not (>= k@79@01 0)))
(pop) ; 4
(push) ; 4
; [else-branch: 21 | k@79@01 >= 0]
(assert (>= k@79@01 0))
; [eval] k < |a|
; [eval] |a|
(push) ; 5
; [then-branch: 22 | !(k@79@01 < |a@74@01|) | live]
; [else-branch: 22 | k@79@01 < |a@74@01| | live]
(push) ; 6
; [then-branch: 22 | !(k@79@01 < |a@74@01|)]
(assert (not (< k@79@01 (Seq_length a@74@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 22 | k@79@01 < |a@74@01|]
(assert (< k@79@01 (Seq_length a@74@01)))
; [eval] j >= 0
(push) ; 7
; [then-branch: 23 | !(j@80@01 >= 0) | live]
; [else-branch: 23 | j@80@01 >= 0 | live]
(push) ; 8
; [then-branch: 23 | !(j@80@01 >= 0)]
(assert (not (>= j@80@01 0)))
(pop) ; 8
(push) ; 8
; [else-branch: 23 | j@80@01 >= 0]
(assert (>= j@80@01 0))
; [eval] j < |a|
; [eval] |a|
(push) ; 9
; [then-branch: 24 | !(j@80@01 < |a@74@01|) | live]
; [else-branch: 24 | j@80@01 < |a@74@01| | live]
(push) ; 10
; [then-branch: 24 | !(j@80@01 < |a@74@01|)]
(assert (not (< j@80@01 (Seq_length a@74@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 24 | j@80@01 < |a@74@01|]
(assert (< j@80@01 (Seq_length a@74@01)))
; [eval] k != j
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< j@80@01 (Seq_length a@74@01)) (not (< j@80@01 (Seq_length a@74@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@80@01 0)
  (and
    (>= j@80@01 0)
    (or (< j@80@01 (Seq_length a@74@01)) (not (< j@80@01 (Seq_length a@74@01)))))))
(assert (or (>= j@80@01 0) (not (>= j@80@01 0))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< k@79@01 (Seq_length a@74@01))
  (and
    (< k@79@01 (Seq_length a@74@01))
    (=>
      (>= j@80@01 0)
      (and
        (>= j@80@01 0)
        (or
          (< j@80@01 (Seq_length a@74@01))
          (not (< j@80@01 (Seq_length a@74@01))))))
    (or (>= j@80@01 0) (not (>= j@80@01 0))))))
(assert (or (< k@79@01 (Seq_length a@74@01)) (not (< k@79@01 (Seq_length a@74@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= k@79@01 0)
  (and
    (>= k@79@01 0)
    (=>
      (< k@79@01 (Seq_length a@74@01))
      (and
        (< k@79@01 (Seq_length a@74@01))
        (=>
          (>= j@80@01 0)
          (and
            (>= j@80@01 0)
            (or
              (< j@80@01 (Seq_length a@74@01))
              (not (< j@80@01 (Seq_length a@74@01))))))
        (or (>= j@80@01 0) (not (>= j@80@01 0)))))
    (or (< k@79@01 (Seq_length a@74@01)) (not (< k@79@01 (Seq_length a@74@01)))))))
(assert (or (>= k@79@01 0) (not (>= k@79@01 0))))
(push) ; 3
; [then-branch: 25 | k@79@01 >= 0 && k@79@01 < |a@74@01| && j@80@01 >= 0 && j@80@01 < |a@74@01| && k@79@01 != j@80@01 | live]
; [else-branch: 25 | !(k@79@01 >= 0 && k@79@01 < |a@74@01| && j@80@01 >= 0 && j@80@01 < |a@74@01| && k@79@01 != j@80@01) | live]
(push) ; 4
; [then-branch: 25 | k@79@01 >= 0 && k@79@01 < |a@74@01| && j@80@01 >= 0 && j@80@01 < |a@74@01| && k@79@01 != j@80@01]
(assert (and
  (>= k@79@01 0)
  (and
    (< k@79@01 (Seq_length a@74@01))
    (and
      (>= j@80@01 0)
      (and (< j@80@01 (Seq_length a@74@01)) (not (= k@79@01 j@80@01)))))))
; [eval] a[k] != a[j]
; [eval] a[k]
; [eval] a[j]
(pop) ; 4
(push) ; 4
; [else-branch: 25 | !(k@79@01 >= 0 && k@79@01 < |a@74@01| && j@80@01 >= 0 && j@80@01 < |a@74@01| && k@79@01 != j@80@01)]
(assert (not
  (and
    (>= k@79@01 0)
    (and
      (< k@79@01 (Seq_length a@74@01))
      (and
        (>= j@80@01 0)
        (and (< j@80@01 (Seq_length a@74@01)) (not (= k@79@01 j@80@01))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (>= k@79@01 0)
    (and
      (< k@79@01 (Seq_length a@74@01))
      (and
        (>= j@80@01 0)
        (and (< j@80@01 (Seq_length a@74@01)) (not (= k@79@01 j@80@01))))))
  (and
    (>= k@79@01 0)
    (< k@79@01 (Seq_length a@74@01))
    (>= j@80@01 0)
    (< j@80@01 (Seq_length a@74@01))
    (not (= k@79@01 j@80@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= k@79@01 0)
      (and
        (< k@79@01 (Seq_length a@74@01))
        (and
          (>= j@80@01 0)
          (and (< j@80@01 (Seq_length a@74@01)) (not (= k@79@01 j@80@01)))))))
  (and
    (>= k@79@01 0)
    (and
      (< k@79@01 (Seq_length a@74@01))
      (and
        (>= j@80@01 0)
        (and (< j@80@01 (Seq_length a@74@01)) (not (= k@79@01 j@80@01))))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@79@01 Int) (j@80@01 Int)) (!
  (and
    (=>
      (>= k@79@01 0)
      (and
        (>= k@79@01 0)
        (=>
          (< k@79@01 (Seq_length a@74@01))
          (and
            (< k@79@01 (Seq_length a@74@01))
            (=>
              (>= j@80@01 0)
              (and
                (>= j@80@01 0)
                (or
                  (< j@80@01 (Seq_length a@74@01))
                  (not (< j@80@01 (Seq_length a@74@01))))))
            (or (>= j@80@01 0) (not (>= j@80@01 0)))))
        (or
          (< k@79@01 (Seq_length a@74@01))
          (not (< k@79@01 (Seq_length a@74@01))))))
    (or (>= k@79@01 0) (not (>= k@79@01 0)))
    (=>
      (and
        (>= k@79@01 0)
        (and
          (< k@79@01 (Seq_length a@74@01))
          (and
            (>= j@80@01 0)
            (and (< j@80@01 (Seq_length a@74@01)) (not (= k@79@01 j@80@01))))))
      (and
        (>= k@79@01 0)
        (< k@79@01 (Seq_length a@74@01))
        (>= j@80@01 0)
        (< j@80@01 (Seq_length a@74@01))
        (not (= k@79@01 j@80@01))))
    (or
      (not
        (and
          (>= k@79@01 0)
          (and
            (< k@79@01 (Seq_length a@74@01))
            (and
              (>= j@80@01 0)
              (and (< j@80@01 (Seq_length a@74@01)) (not (= k@79@01 j@80@01)))))))
      (and
        (>= k@79@01 0)
        (and
          (< k@79@01 (Seq_length a@74@01))
          (and
            (>= j@80@01 0)
            (and (< j@80@01 (Seq_length a@74@01)) (not (= k@79@01 j@80@01))))))))
  :pattern ((Seq_index a@74@01 k@79@01) (Seq_index a@74@01 j@80@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_indep_loop_drf_c.vpr@107@12@107@100-aux|)))
(assert (forall ((k@79@01 Int) (j@80@01 Int)) (!
  (=>
    (and
      (>= k@79@01 0)
      (and
        (< k@79@01 (Seq_length a@74@01))
        (and
          (>= j@80@01 0)
          (and (< j@80@01 (Seq_length a@74@01)) (not (= k@79@01 j@80@01))))))
    (not (= (Seq_index a@74@01 k@79@01) (Seq_index a@74@01 j@80@01))))
  :pattern ((Seq_index a@74@01 k@79@01) (Seq_index a@74@01 j@80@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_indep_loop_drf_c.vpr@107@12@107@100|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@78@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@78@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@78@01)))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@78@01))))
  $Snap.unit))
; [eval] (forall k: Int, j: Int :: { b[k], b[j] } k >= 0 && (k < |b| && (j >= 0 && (j < |b| && k != j))) ==> b[k] != b[j])
(declare-const k@81@01 Int)
(declare-const j@82@01 Int)
(push) ; 2
; [eval] k >= 0 && (k < |b| && (j >= 0 && (j < |b| && k != j))) ==> b[k] != b[j]
; [eval] k >= 0 && (k < |b| && (j >= 0 && (j < |b| && k != j)))
; [eval] k >= 0
(push) ; 3
; [then-branch: 26 | !(k@81@01 >= 0) | live]
; [else-branch: 26 | k@81@01 >= 0 | live]
(push) ; 4
; [then-branch: 26 | !(k@81@01 >= 0)]
(assert (not (>= k@81@01 0)))
(pop) ; 4
(push) ; 4
; [else-branch: 26 | k@81@01 >= 0]
(assert (>= k@81@01 0))
; [eval] k < |b|
; [eval] |b|
(push) ; 5
; [then-branch: 27 | !(k@81@01 < |b@75@01|) | live]
; [else-branch: 27 | k@81@01 < |b@75@01| | live]
(push) ; 6
; [then-branch: 27 | !(k@81@01 < |b@75@01|)]
(assert (not (< k@81@01 (Seq_length b@75@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 27 | k@81@01 < |b@75@01|]
(assert (< k@81@01 (Seq_length b@75@01)))
; [eval] j >= 0
(push) ; 7
; [then-branch: 28 | !(j@82@01 >= 0) | live]
; [else-branch: 28 | j@82@01 >= 0 | live]
(push) ; 8
; [then-branch: 28 | !(j@82@01 >= 0)]
(assert (not (>= j@82@01 0)))
(pop) ; 8
(push) ; 8
; [else-branch: 28 | j@82@01 >= 0]
(assert (>= j@82@01 0))
; [eval] j < |b|
; [eval] |b|
(push) ; 9
; [then-branch: 29 | !(j@82@01 < |b@75@01|) | live]
; [else-branch: 29 | j@82@01 < |b@75@01| | live]
(push) ; 10
; [then-branch: 29 | !(j@82@01 < |b@75@01|)]
(assert (not (< j@82@01 (Seq_length b@75@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 29 | j@82@01 < |b@75@01|]
(assert (< j@82@01 (Seq_length b@75@01)))
; [eval] k != j
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< j@82@01 (Seq_length b@75@01)) (not (< j@82@01 (Seq_length b@75@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@82@01 0)
  (and
    (>= j@82@01 0)
    (or (< j@82@01 (Seq_length b@75@01)) (not (< j@82@01 (Seq_length b@75@01)))))))
(assert (or (>= j@82@01 0) (not (>= j@82@01 0))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< k@81@01 (Seq_length b@75@01))
  (and
    (< k@81@01 (Seq_length b@75@01))
    (=>
      (>= j@82@01 0)
      (and
        (>= j@82@01 0)
        (or
          (< j@82@01 (Seq_length b@75@01))
          (not (< j@82@01 (Seq_length b@75@01))))))
    (or (>= j@82@01 0) (not (>= j@82@01 0))))))
(assert (or (< k@81@01 (Seq_length b@75@01)) (not (< k@81@01 (Seq_length b@75@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= k@81@01 0)
  (and
    (>= k@81@01 0)
    (=>
      (< k@81@01 (Seq_length b@75@01))
      (and
        (< k@81@01 (Seq_length b@75@01))
        (=>
          (>= j@82@01 0)
          (and
            (>= j@82@01 0)
            (or
              (< j@82@01 (Seq_length b@75@01))
              (not (< j@82@01 (Seq_length b@75@01))))))
        (or (>= j@82@01 0) (not (>= j@82@01 0)))))
    (or (< k@81@01 (Seq_length b@75@01)) (not (< k@81@01 (Seq_length b@75@01)))))))
(assert (or (>= k@81@01 0) (not (>= k@81@01 0))))
(push) ; 3
; [then-branch: 30 | k@81@01 >= 0 && k@81@01 < |b@75@01| && j@82@01 >= 0 && j@82@01 < |b@75@01| && k@81@01 != j@82@01 | live]
; [else-branch: 30 | !(k@81@01 >= 0 && k@81@01 < |b@75@01| && j@82@01 >= 0 && j@82@01 < |b@75@01| && k@81@01 != j@82@01) | live]
(push) ; 4
; [then-branch: 30 | k@81@01 >= 0 && k@81@01 < |b@75@01| && j@82@01 >= 0 && j@82@01 < |b@75@01| && k@81@01 != j@82@01]
(assert (and
  (>= k@81@01 0)
  (and
    (< k@81@01 (Seq_length b@75@01))
    (and
      (>= j@82@01 0)
      (and (< j@82@01 (Seq_length b@75@01)) (not (= k@81@01 j@82@01)))))))
; [eval] b[k] != b[j]
; [eval] b[k]
; [eval] b[j]
(pop) ; 4
(push) ; 4
; [else-branch: 30 | !(k@81@01 >= 0 && k@81@01 < |b@75@01| && j@82@01 >= 0 && j@82@01 < |b@75@01| && k@81@01 != j@82@01)]
(assert (not
  (and
    (>= k@81@01 0)
    (and
      (< k@81@01 (Seq_length b@75@01))
      (and
        (>= j@82@01 0)
        (and (< j@82@01 (Seq_length b@75@01)) (not (= k@81@01 j@82@01))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (>= k@81@01 0)
    (and
      (< k@81@01 (Seq_length b@75@01))
      (and
        (>= j@82@01 0)
        (and (< j@82@01 (Seq_length b@75@01)) (not (= k@81@01 j@82@01))))))
  (and
    (>= k@81@01 0)
    (< k@81@01 (Seq_length b@75@01))
    (>= j@82@01 0)
    (< j@82@01 (Seq_length b@75@01))
    (not (= k@81@01 j@82@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= k@81@01 0)
      (and
        (< k@81@01 (Seq_length b@75@01))
        (and
          (>= j@82@01 0)
          (and (< j@82@01 (Seq_length b@75@01)) (not (= k@81@01 j@82@01)))))))
  (and
    (>= k@81@01 0)
    (and
      (< k@81@01 (Seq_length b@75@01))
      (and
        (>= j@82@01 0)
        (and (< j@82@01 (Seq_length b@75@01)) (not (= k@81@01 j@82@01))))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@81@01 Int) (j@82@01 Int)) (!
  (and
    (=>
      (>= k@81@01 0)
      (and
        (>= k@81@01 0)
        (=>
          (< k@81@01 (Seq_length b@75@01))
          (and
            (< k@81@01 (Seq_length b@75@01))
            (=>
              (>= j@82@01 0)
              (and
                (>= j@82@01 0)
                (or
                  (< j@82@01 (Seq_length b@75@01))
                  (not (< j@82@01 (Seq_length b@75@01))))))
            (or (>= j@82@01 0) (not (>= j@82@01 0)))))
        (or
          (< k@81@01 (Seq_length b@75@01))
          (not (< k@81@01 (Seq_length b@75@01))))))
    (or (>= k@81@01 0) (not (>= k@81@01 0)))
    (=>
      (and
        (>= k@81@01 0)
        (and
          (< k@81@01 (Seq_length b@75@01))
          (and
            (>= j@82@01 0)
            (and (< j@82@01 (Seq_length b@75@01)) (not (= k@81@01 j@82@01))))))
      (and
        (>= k@81@01 0)
        (< k@81@01 (Seq_length b@75@01))
        (>= j@82@01 0)
        (< j@82@01 (Seq_length b@75@01))
        (not (= k@81@01 j@82@01))))
    (or
      (not
        (and
          (>= k@81@01 0)
          (and
            (< k@81@01 (Seq_length b@75@01))
            (and
              (>= j@82@01 0)
              (and (< j@82@01 (Seq_length b@75@01)) (not (= k@81@01 j@82@01)))))))
      (and
        (>= k@81@01 0)
        (and
          (< k@81@01 (Seq_length b@75@01))
          (and
            (>= j@82@01 0)
            (and (< j@82@01 (Seq_length b@75@01)) (not (= k@81@01 j@82@01))))))))
  :pattern ((Seq_index b@75@01 k@81@01) (Seq_index b@75@01 j@82@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_indep_loop_drf_c.vpr@108@12@108@100-aux|)))
(assert (forall ((k@81@01 Int) (j@82@01 Int)) (!
  (=>
    (and
      (>= k@81@01 0)
      (and
        (< k@81@01 (Seq_length b@75@01))
        (and
          (>= j@82@01 0)
          (and (< j@82@01 (Seq_length b@75@01)) (not (= k@81@01 j@82@01))))))
    (not (= (Seq_index b@75@01 k@81@01) (Seq_index b@75@01 j@82@01))))
  :pattern ((Seq_index b@75@01 k@81@01) (Seq_index b@75@01 j@82@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_indep_loop_drf_c.vpr@108@12@108@100|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@78@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@78@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@78@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@78@01)))))
  $Snap.unit))
; [eval] (forall k: Int, j: Int :: { c[k], c[j] } k >= 0 && (k < |c| && (j >= 0 && (j < |c| && k != j))) ==> c[k] != c[j])
(declare-const k@83@01 Int)
(declare-const j@84@01 Int)
(push) ; 2
; [eval] k >= 0 && (k < |c| && (j >= 0 && (j < |c| && k != j))) ==> c[k] != c[j]
; [eval] k >= 0 && (k < |c| && (j >= 0 && (j < |c| && k != j)))
; [eval] k >= 0
(push) ; 3
; [then-branch: 31 | !(k@83@01 >= 0) | live]
; [else-branch: 31 | k@83@01 >= 0 | live]
(push) ; 4
; [then-branch: 31 | !(k@83@01 >= 0)]
(assert (not (>= k@83@01 0)))
(pop) ; 4
(push) ; 4
; [else-branch: 31 | k@83@01 >= 0]
(assert (>= k@83@01 0))
; [eval] k < |c|
; [eval] |c|
(push) ; 5
; [then-branch: 32 | !(k@83@01 < |c@76@01|) | live]
; [else-branch: 32 | k@83@01 < |c@76@01| | live]
(push) ; 6
; [then-branch: 32 | !(k@83@01 < |c@76@01|)]
(assert (not (< k@83@01 (Seq_length c@76@01))))
(pop) ; 6
(push) ; 6
; [else-branch: 32 | k@83@01 < |c@76@01|]
(assert (< k@83@01 (Seq_length c@76@01)))
; [eval] j >= 0
(push) ; 7
; [then-branch: 33 | !(j@84@01 >= 0) | live]
; [else-branch: 33 | j@84@01 >= 0 | live]
(push) ; 8
; [then-branch: 33 | !(j@84@01 >= 0)]
(assert (not (>= j@84@01 0)))
(pop) ; 8
(push) ; 8
; [else-branch: 33 | j@84@01 >= 0]
(assert (>= j@84@01 0))
; [eval] j < |c|
; [eval] |c|
(push) ; 9
; [then-branch: 34 | !(j@84@01 < |c@76@01|) | live]
; [else-branch: 34 | j@84@01 < |c@76@01| | live]
(push) ; 10
; [then-branch: 34 | !(j@84@01 < |c@76@01|)]
(assert (not (< j@84@01 (Seq_length c@76@01))))
(pop) ; 10
(push) ; 10
; [else-branch: 34 | j@84@01 < |c@76@01|]
(assert (< j@84@01 (Seq_length c@76@01)))
; [eval] k != j
(pop) ; 10
(pop) ; 9
; Joined path conditions
; Joined path conditions
(assert (or (< j@84@01 (Seq_length c@76@01)) (not (< j@84@01 (Seq_length c@76@01)))))
(pop) ; 8
(pop) ; 7
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@84@01 0)
  (and
    (>= j@84@01 0)
    (or (< j@84@01 (Seq_length c@76@01)) (not (< j@84@01 (Seq_length c@76@01)))))))
(assert (or (>= j@84@01 0) (not (>= j@84@01 0))))
(pop) ; 6
(pop) ; 5
; Joined path conditions
; Joined path conditions
(assert (=>
  (< k@83@01 (Seq_length c@76@01))
  (and
    (< k@83@01 (Seq_length c@76@01))
    (=>
      (>= j@84@01 0)
      (and
        (>= j@84@01 0)
        (or
          (< j@84@01 (Seq_length c@76@01))
          (not (< j@84@01 (Seq_length c@76@01))))))
    (or (>= j@84@01 0) (not (>= j@84@01 0))))))
(assert (or (< k@83@01 (Seq_length c@76@01)) (not (< k@83@01 (Seq_length c@76@01)))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= k@83@01 0)
  (and
    (>= k@83@01 0)
    (=>
      (< k@83@01 (Seq_length c@76@01))
      (and
        (< k@83@01 (Seq_length c@76@01))
        (=>
          (>= j@84@01 0)
          (and
            (>= j@84@01 0)
            (or
              (< j@84@01 (Seq_length c@76@01))
              (not (< j@84@01 (Seq_length c@76@01))))))
        (or (>= j@84@01 0) (not (>= j@84@01 0)))))
    (or (< k@83@01 (Seq_length c@76@01)) (not (< k@83@01 (Seq_length c@76@01)))))))
(assert (or (>= k@83@01 0) (not (>= k@83@01 0))))
(push) ; 3
; [then-branch: 35 | k@83@01 >= 0 && k@83@01 < |c@76@01| && j@84@01 >= 0 && j@84@01 < |c@76@01| && k@83@01 != j@84@01 | live]
; [else-branch: 35 | !(k@83@01 >= 0 && k@83@01 < |c@76@01| && j@84@01 >= 0 && j@84@01 < |c@76@01| && k@83@01 != j@84@01) | live]
(push) ; 4
; [then-branch: 35 | k@83@01 >= 0 && k@83@01 < |c@76@01| && j@84@01 >= 0 && j@84@01 < |c@76@01| && k@83@01 != j@84@01]
(assert (and
  (>= k@83@01 0)
  (and
    (< k@83@01 (Seq_length c@76@01))
    (and
      (>= j@84@01 0)
      (and (< j@84@01 (Seq_length c@76@01)) (not (= k@83@01 j@84@01)))))))
; [eval] c[k] != c[j]
; [eval] c[k]
; [eval] c[j]
(pop) ; 4
(push) ; 4
; [else-branch: 35 | !(k@83@01 >= 0 && k@83@01 < |c@76@01| && j@84@01 >= 0 && j@84@01 < |c@76@01| && k@83@01 != j@84@01)]
(assert (not
  (and
    (>= k@83@01 0)
    (and
      (< k@83@01 (Seq_length c@76@01))
      (and
        (>= j@84@01 0)
        (and (< j@84@01 (Seq_length c@76@01)) (not (= k@83@01 j@84@01))))))))
(pop) ; 4
(pop) ; 3
; Joined path conditions
(assert (=>
  (and
    (>= k@83@01 0)
    (and
      (< k@83@01 (Seq_length c@76@01))
      (and
        (>= j@84@01 0)
        (and (< j@84@01 (Seq_length c@76@01)) (not (= k@83@01 j@84@01))))))
  (and
    (>= k@83@01 0)
    (< k@83@01 (Seq_length c@76@01))
    (>= j@84@01 0)
    (< j@84@01 (Seq_length c@76@01))
    (not (= k@83@01 j@84@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= k@83@01 0)
      (and
        (< k@83@01 (Seq_length c@76@01))
        (and
          (>= j@84@01 0)
          (and (< j@84@01 (Seq_length c@76@01)) (not (= k@83@01 j@84@01)))))))
  (and
    (>= k@83@01 0)
    (and
      (< k@83@01 (Seq_length c@76@01))
      (and
        (>= j@84@01 0)
        (and (< j@84@01 (Seq_length c@76@01)) (not (= k@83@01 j@84@01))))))))
(pop) ; 2
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@83@01 Int) (j@84@01 Int)) (!
  (and
    (=>
      (>= k@83@01 0)
      (and
        (>= k@83@01 0)
        (=>
          (< k@83@01 (Seq_length c@76@01))
          (and
            (< k@83@01 (Seq_length c@76@01))
            (=>
              (>= j@84@01 0)
              (and
                (>= j@84@01 0)
                (or
                  (< j@84@01 (Seq_length c@76@01))
                  (not (< j@84@01 (Seq_length c@76@01))))))
            (or (>= j@84@01 0) (not (>= j@84@01 0)))))
        (or
          (< k@83@01 (Seq_length c@76@01))
          (not (< k@83@01 (Seq_length c@76@01))))))
    (or (>= k@83@01 0) (not (>= k@83@01 0)))
    (=>
      (and
        (>= k@83@01 0)
        (and
          (< k@83@01 (Seq_length c@76@01))
          (and
            (>= j@84@01 0)
            (and (< j@84@01 (Seq_length c@76@01)) (not (= k@83@01 j@84@01))))))
      (and
        (>= k@83@01 0)
        (< k@83@01 (Seq_length c@76@01))
        (>= j@84@01 0)
        (< j@84@01 (Seq_length c@76@01))
        (not (= k@83@01 j@84@01))))
    (or
      (not
        (and
          (>= k@83@01 0)
          (and
            (< k@83@01 (Seq_length c@76@01))
            (and
              (>= j@84@01 0)
              (and (< j@84@01 (Seq_length c@76@01)) (not (= k@83@01 j@84@01)))))))
      (and
        (>= k@83@01 0)
        (and
          (< k@83@01 (Seq_length c@76@01))
          (and
            (>= j@84@01 0)
            (and (< j@84@01 (Seq_length c@76@01)) (not (= k@83@01 j@84@01))))))))
  :pattern ((Seq_index c@76@01 k@83@01) (Seq_index c@76@01 j@84@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_indep_loop_drf_c.vpr@109@12@109@100-aux|)))
(assert (forall ((k@83@01 Int) (j@84@01 Int)) (!
  (=>
    (and
      (>= k@83@01 0)
      (and
        (< k@83@01 (Seq_length c@76@01))
        (and
          (>= j@84@01 0)
          (and (< j@84@01 (Seq_length c@76@01)) (not (= k@83@01 j@84@01))))))
    (not (= (Seq_index c@76@01 k@83@01) (Seq_index c@76@01 j@84@01))))
  :pattern ((Seq_index c@76@01 k@83@01) (Seq_index c@76@01 j@84@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_indep_loop_drf_c.vpr@109@12@109@100|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@78@01)))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@78@01))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@78@01)))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@78@01))))))
  $Snap.unit))
; [eval] |a| == N
; [eval] |a|
(assert (= (Seq_length a@74@01) N@77@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@78@01))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@78@01)))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@78@01))))))))))
(declare-const i@85@01 Int)
(push) ; 2
; [eval] 0 <= i && i < N
; [eval] 0 <= i
(push) ; 3
; [then-branch: 36 | !(0 <= i@85@01) | live]
; [else-branch: 36 | 0 <= i@85@01 | live]
(push) ; 4
; [then-branch: 36 | !(0 <= i@85@01)]
(assert (not (<= 0 i@85@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 36 | 0 <= i@85@01]
(assert (<= 0 i@85@01))
; [eval] i < N
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@85@01) (not (<= 0 i@85@01))))
(assert (and (<= 0 i@85@01) (< i@85@01 N@77@01)))
; [eval] a[i]
(push) ; 3
(assert (not (>= i@85@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@85@01 (Seq_length a@74@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@86@01 ($Ref) Int)
(declare-fun img@87@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@85@01 Int)) (!
  (=>
    (and (<= 0 i@85@01) (< i@85@01 N@77@01))
    (or (<= 0 i@85@01) (not (<= 0 i@85@01))))
  :pattern ((Seq_index a@74@01 i@85@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@85@01 Int) (i2@85@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@85@01) (< i1@85@01 N@77@01))
      (and (<= 0 i2@85@01) (< i2@85@01 N@77@01))
      (= (Seq_index a@74@01 i1@85@01) (Seq_index a@74@01 i2@85@01)))
    (= i1@85@01 i2@85@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@85@01 Int)) (!
  (=>
    (and (<= 0 i@85@01) (< i@85@01 N@77@01))
    (and
      (= (inv@86@01 (Seq_index a@74@01 i@85@01)) i@85@01)
      (img@87@01 (Seq_index a@74@01 i@85@01))))
  :pattern ((Seq_index a@74@01 i@85@01))
  :qid |quant-u-67|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@87@01 r) (and (<= 0 (inv@86@01 r)) (< (inv@86@01 r) N@77@01)))
    (= (Seq_index a@74@01 (inv@86@01 r)) r))
  :pattern ((inv@86@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@85@01 Int)) (!
  (=>
    (and (<= 0 i@85@01) (< i@85@01 N@77@01))
    (not (= (Seq_index a@74@01 i@85@01) $Ref.null)))
  :pattern ((Seq_index a@74@01 i@85@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@78@01)))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@78@01))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@78@01)))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@78@01))))))))
  $Snap.unit))
; [eval] |c| == N
; [eval] |c|
(assert (= (Seq_length c@76@01) N@77@01))
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@78@01))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@78@01)))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@78@01))))))))))))
(declare-const i@88@01 Int)
(push) ; 2
; [eval] 0 <= i && i < N
; [eval] 0 <= i
(push) ; 3
; [then-branch: 37 | !(0 <= i@88@01) | live]
; [else-branch: 37 | 0 <= i@88@01 | live]
(push) ; 4
; [then-branch: 37 | !(0 <= i@88@01)]
(assert (not (<= 0 i@88@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 37 | 0 <= i@88@01]
(assert (<= 0 i@88@01))
; [eval] i < N
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@88@01) (not (<= 0 i@88@01))))
(assert (and (<= 0 i@88@01) (< i@88@01 N@77@01)))
; [eval] c[i]
(push) ; 3
(assert (not (>= i@88@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@88@01 (Seq_length c@76@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@89@01 ($Ref) Int)
(declare-fun img@90@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@88@01 Int)) (!
  (=>
    (and (<= 0 i@88@01) (< i@88@01 N@77@01))
    (or (<= 0 i@88@01) (not (<= 0 i@88@01))))
  :pattern ((Seq_index c@76@01 i@88@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@88@01 Int) (i2@88@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@88@01) (< i1@88@01 N@77@01))
      (and (<= 0 i2@88@01) (< i2@88@01 N@77@01))
      (= (Seq_index c@76@01 i1@88@01) (Seq_index c@76@01 i2@88@01)))
    (= i1@88@01 i2@88@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@88@01 Int)) (!
  (=>
    (and (<= 0 i@88@01) (< i@88@01 N@77@01))
    (and
      (= (inv@89@01 (Seq_index c@76@01 i@88@01)) i@88@01)
      (img@90@01 (Seq_index c@76@01 i@88@01))))
  :pattern ((Seq_index c@76@01 i@88@01))
  :qid |quant-u-69|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@90@01 r) (and (<= 0 (inv@89@01 r)) (< (inv@89@01 r) N@77@01)))
    (= (Seq_index c@76@01 (inv@89@01 r)) r))
  :pattern ((inv@89@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@88@01 Int)) (!
  (=>
    (and (<= 0 i@88@01) (< i@88@01 N@77@01))
    (not (= (Seq_index c@76@01 i@88@01) $Ref.null)))
  :pattern ((Seq_index c@76@01 i@88@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 2
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index c@76@01 i@88@01) (Seq_index a@74@01 i@85@01))
    (=
      (and (img@90@01 r) (and (<= 0 (inv@89@01 r)) (< (inv@89@01 r) N@77@01)))
      (and (img@87@01 r) (and (<= 0 (inv@86@01 r)) (< (inv@86@01 r) N@77@01)))))
  
  :qid |quant-u-70|))))
(check-sat)
; unknown
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@78@01)))))))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@78@01))))))))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@78@01)))))))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@78@01))))))))))
  $Snap.unit))
; [eval] |b| == N
; [eval] |b|
(assert (= (Seq_length b@75@01) N@77@01))
(declare-const i@91@01 Int)
(set-option :timeout 0)
(push) ; 2
; [eval] 0 <= i && i < N
; [eval] 0 <= i
(push) ; 3
; [then-branch: 38 | !(0 <= i@91@01) | live]
; [else-branch: 38 | 0 <= i@91@01 | live]
(push) ; 4
; [then-branch: 38 | !(0 <= i@91@01)]
(assert (not (<= 0 i@91@01)))
(pop) ; 4
(push) ; 4
; [else-branch: 38 | 0 <= i@91@01]
(assert (<= 0 i@91@01))
; [eval] i < N
(pop) ; 4
(pop) ; 3
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@91@01) (not (<= 0 i@91@01))))
(assert (and (<= 0 i@91@01) (< i@91@01 N@77@01)))
; [eval] b[i]
(push) ; 3
(assert (not (>= i@91@01 0)))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(push) ; 3
(assert (not (< i@91@01 (Seq_length b@75@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(pop) ; 2
(declare-fun inv@92@01 ($Ref) Int)
(declare-fun img@93@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@91@01 Int)) (!
  (=>
    (and (<= 0 i@91@01) (< i@91@01 N@77@01))
    (or (<= 0 i@91@01) (not (<= 0 i@91@01))))
  :pattern ((Seq_index b@75@01 i@91@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 2
(assert (not (forall ((i1@91@01 Int) (i2@91@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@91@01) (< i1@91@01 N@77@01))
      (and (<= 0 i2@91@01) (< i2@91@01 N@77@01))
      (= (Seq_index b@75@01 i1@91@01) (Seq_index b@75@01 i2@91@01)))
    (= i1@91@01 i2@91@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 2
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@91@01 Int)) (!
  (=>
    (and (<= 0 i@91@01) (< i@91@01 N@77@01))
    (and
      (= (inv@92@01 (Seq_index b@75@01 i@91@01)) i@91@01)
      (img@93@01 (Seq_index b@75@01 i@91@01))))
  :pattern ((Seq_index b@75@01 i@91@01))
  :qid |quant-u-72|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@93@01 r) (and (<= 0 (inv@92@01 r)) (< (inv@92@01 r) N@77@01)))
    (= (Seq_index b@75@01 (inv@92@01 r)) r))
  :pattern ((inv@92@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@91@01 Int)) (!
  (=>
    (and (<= 0 i@91@01) (< i@91@01 N@77@01))
    (not (= (Seq_index b@75@01 i@91@01) $Ref.null)))
  :pattern ((Seq_index b@75@01 i@91@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 2
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index b@75@01 i@91@01) (Seq_index c@76@01 i@88@01))
    (=
      (and (img@93@01 r) (and (<= 0 (inv@92@01 r)) (< (inv@92@01 r) N@77@01)))
      (and (img@90@01 r) (and (<= 0 (inv@89@01 r)) (< (inv@89@01 r) N@77@01)))))
  
  :qid |quant-u-73|))))
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
    (= (Seq_index b@75@01 i@91@01) (Seq_index a@74@01 i@85@01))
    (=
      (and (img@93@01 r) (and (<= 0 (inv@92@01 r)) (< (inv@92@01 r) N@77@01)))
      (and (img@87@01 r) (and (<= 0 (inv@86@01 r)) (< (inv@86@01 r) N@77@01)))))
  
  :qid |quant-u-74|))))
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
(declare-const $t@94@01 $Snap)
(assert (= $t@94@01 ($Snap.combine ($Snap.first $t@94@01) ($Snap.second $t@94@01))))
(assert (= ($Snap.first $t@94@01) $Snap.unit))
; [eval] |a| == N
; [eval] |a|
(assert (=
  ($Snap.second $t@94@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@94@01))
    ($Snap.second ($Snap.second $t@94@01)))))
(declare-const i@95@01 Int)
(push) ; 3
; [eval] 0 <= i && i < N
; [eval] 0 <= i
(push) ; 4
; [then-branch: 39 | !(0 <= i@95@01) | live]
; [else-branch: 39 | 0 <= i@95@01 | live]
(push) ; 5
; [then-branch: 39 | !(0 <= i@95@01)]
(assert (not (<= 0 i@95@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 39 | 0 <= i@95@01]
(assert (<= 0 i@95@01))
; [eval] i < N
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@95@01) (not (<= 0 i@95@01))))
(assert (and (<= 0 i@95@01) (< i@95@01 N@77@01)))
; [eval] a[i]
(push) ; 4
(assert (not (>= i@95@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@95@01 (Seq_length a@74@01))))
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
(assert (forall ((i@95@01 Int)) (!
  (=>
    (and (<= 0 i@95@01) (< i@95@01 N@77@01))
    (or (<= 0 i@95@01) (not (<= 0 i@95@01))))
  :pattern ((Seq_index a@74@01 i@95@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@95@01 Int) (i2@95@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@95@01) (< i1@95@01 N@77@01))
      (and (<= 0 i2@95@01) (< i2@95@01 N@77@01))
      (= (Seq_index a@74@01 i1@95@01) (Seq_index a@74@01 i2@95@01)))
    (= i1@95@01 i2@95@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@95@01 Int)) (!
  (=>
    (and (<= 0 i@95@01) (< i@95@01 N@77@01))
    (and
      (= (inv@96@01 (Seq_index a@74@01 i@95@01)) i@95@01)
      (img@97@01 (Seq_index a@74@01 i@95@01))))
  :pattern ((Seq_index a@74@01 i@95@01))
  :qid |quant-u-76|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@97@01 r) (and (<= 0 (inv@96@01 r)) (< (inv@96@01 r) N@77@01)))
    (= (Seq_index a@74@01 (inv@96@01 r)) r))
  :pattern ((inv@96@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@95@01 Int)) (!
  (=>
    (and (<= 0 i@95@01) (< i@95@01 N@77@01))
    (not (= (Seq_index a@74@01 i@95@01) $Ref.null)))
  :pattern ((Seq_index a@74@01 i@95@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(assert (=
  ($Snap.second ($Snap.second $t@94@01))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second $t@94@01)))
    ($Snap.second ($Snap.second ($Snap.second $t@94@01))))))
(assert (= ($Snap.first ($Snap.second ($Snap.second $t@94@01))) $Snap.unit))
; [eval] |c| == N
; [eval] |c|
(assert (=
  ($Snap.second ($Snap.second ($Snap.second $t@94@01)))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second $t@94@01))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))))
(declare-const i@98@01 Int)
(push) ; 3
; [eval] 0 <= i && i < N
; [eval] 0 <= i
(push) ; 4
; [then-branch: 40 | !(0 <= i@98@01) | live]
; [else-branch: 40 | 0 <= i@98@01 | live]
(push) ; 5
; [then-branch: 40 | !(0 <= i@98@01)]
(assert (not (<= 0 i@98@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 40 | 0 <= i@98@01]
(assert (<= 0 i@98@01))
; [eval] i < N
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@98@01) (not (<= 0 i@98@01))))
(assert (and (<= 0 i@98@01) (< i@98@01 N@77@01)))
; [eval] c[i]
(push) ; 4
(assert (not (>= i@98@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@98@01 (Seq_length c@76@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@99@01 ($Ref) Int)
(declare-fun img@100@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@98@01 Int)) (!
  (=>
    (and (<= 0 i@98@01) (< i@98@01 N@77@01))
    (or (<= 0 i@98@01) (not (<= 0 i@98@01))))
  :pattern ((Seq_index c@76@01 i@98@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@98@01 Int) (i2@98@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@98@01) (< i1@98@01 N@77@01))
      (and (<= 0 i2@98@01) (< i2@98@01 N@77@01))
      (= (Seq_index c@76@01 i1@98@01) (Seq_index c@76@01 i2@98@01)))
    (= i1@98@01 i2@98@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@98@01 Int)) (!
  (=>
    (and (<= 0 i@98@01) (< i@98@01 N@77@01))
    (and
      (= (inv@99@01 (Seq_index c@76@01 i@98@01)) i@98@01)
      (img@100@01 (Seq_index c@76@01 i@98@01))))
  :pattern ((Seq_index c@76@01 i@98@01))
  :qid |quant-u-78|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@100@01 r) (and (<= 0 (inv@99@01 r)) (< (inv@99@01 r) N@77@01)))
    (= (Seq_index c@76@01 (inv@99@01 r)) r))
  :pattern ((inv@99@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@98@01 Int)) (!
  (=>
    (and (<= 0 i@98@01) (< i@98@01 N@77@01))
    (not (= (Seq_index c@76@01 i@98@01) $Ref.null)))
  :pattern ((Seq_index c@76@01 i@98@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index c@76@01 i@98@01) (Seq_index a@74@01 i@95@01))
    (=
      (and (img@100@01 r) (and (<= 0 (inv@99@01 r)) (< (inv@99@01 r) N@77@01)))
      (and (img@97@01 r) (and (<= 0 (inv@96@01 r)) (< (inv@96@01 r) N@77@01)))))
  
  :qid |quant-u-79|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (=
  ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01))))
  ($Snap.combine
    ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))
    ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01))))))))
(assert (=
  ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@94@01)))))
  $Snap.unit))
; [eval] |b| == N
; [eval] |b|
(declare-const i@101@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i && i < N
; [eval] 0 <= i
(push) ; 4
; [then-branch: 41 | !(0 <= i@101@01) | live]
; [else-branch: 41 | 0 <= i@101@01 | live]
(push) ; 5
; [then-branch: 41 | !(0 <= i@101@01)]
(assert (not (<= 0 i@101@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 41 | 0 <= i@101@01]
(assert (<= 0 i@101@01))
; [eval] i < N
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@101@01) (not (<= 0 i@101@01))))
(assert (and (<= 0 i@101@01) (< i@101@01 N@77@01)))
; [eval] b[i]
(push) ; 4
(assert (not (>= i@101@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@101@01 (Seq_length b@75@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@102@01 ($Ref) Int)
(declare-fun img@103@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@101@01 Int)) (!
  (=>
    (and (<= 0 i@101@01) (< i@101@01 N@77@01))
    (or (<= 0 i@101@01) (not (<= 0 i@101@01))))
  :pattern ((Seq_index b@75@01 i@101@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@101@01 Int) (i2@101@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@101@01) (< i1@101@01 N@77@01))
      (and (<= 0 i2@101@01) (< i2@101@01 N@77@01))
      (= (Seq_index b@75@01 i1@101@01) (Seq_index b@75@01 i2@101@01)))
    (= i1@101@01 i2@101@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@101@01 Int)) (!
  (=>
    (and (<= 0 i@101@01) (< i@101@01 N@77@01))
    (and
      (= (inv@102@01 (Seq_index b@75@01 i@101@01)) i@101@01)
      (img@103@01 (Seq_index b@75@01 i@101@01))))
  :pattern ((Seq_index b@75@01 i@101@01))
  :qid |quant-u-81|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@103@01 r) (and (<= 0 (inv@102@01 r)) (< (inv@102@01 r) N@77@01)))
    (= (Seq_index b@75@01 (inv@102@01 r)) r))
  :pattern ((inv@102@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@101@01 Int)) (!
  (=>
    (and (<= 0 i@101@01) (< i@101@01 N@77@01))
    (not (= (Seq_index b@75@01 i@101@01) $Ref.null)))
  :pattern ((Seq_index b@75@01 i@101@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index b@75@01 i@101@01) (Seq_index c@76@01 i@98@01))
    (=
      (and (img@103@01 r) (and (<= 0 (inv@102@01 r)) (< (inv@102@01 r) N@77@01)))
      (and (img@100@01 r) (and (<= 0 (inv@99@01 r)) (< (inv@99@01 r) N@77@01)))))
  
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
    (= (Seq_index b@75@01 i@101@01) (Seq_index a@74@01 i@95@01))
    (=
      (and (img@103@01 r) (and (<= 0 (inv@102@01 r)) (< (inv@102@01 r) N@77@01)))
      (and (img@97@01 r) (and (<= 0 (inv@96@01 r)) (< (inv@96@01 r) N@77@01)))))
  
  :qid |quant-u-83|))))
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
; [eval] N <= |a|
; [eval] |a|
(push) ; 3
(assert (not (<= N@77@01 (Seq_length a@74@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (<= N@77@01 (Seq_length a@74@01)))
; [eval] N <= |b|
; [eval] |b|
(push) ; 3
(assert (not (<= N@77@01 (Seq_length b@75@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (<= N@77@01 (Seq_length b@75@01)))
; [eval] N <= |c|
; [eval] |c|
(push) ; 3
(assert (not (<= N@77@01 (Seq_length c@76@01))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (<= N@77@01 (Seq_length c@76@01)))
; [eval] (forall k: Int, j: Int :: { a[k], a[j] } k >= 0 && (k < |a| && (j >= 0 && (j < |a| && k != j))) ==> a[k] != a[j])
(declare-const k@104@01 Int)
(declare-const j@105@01 Int)
(push) ; 3
; [eval] k >= 0 && (k < |a| && (j >= 0 && (j < |a| && k != j))) ==> a[k] != a[j]
; [eval] k >= 0 && (k < |a| && (j >= 0 && (j < |a| && k != j)))
; [eval] k >= 0
(push) ; 4
; [then-branch: 42 | !(k@104@01 >= 0) | live]
; [else-branch: 42 | k@104@01 >= 0 | live]
(push) ; 5
; [then-branch: 42 | !(k@104@01 >= 0)]
(assert (not (>= k@104@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 42 | k@104@01 >= 0]
(assert (>= k@104@01 0))
; [eval] k < |a|
; [eval] |a|
(push) ; 6
; [then-branch: 43 | !(k@104@01 < |a@74@01|) | live]
; [else-branch: 43 | k@104@01 < |a@74@01| | live]
(push) ; 7
; [then-branch: 43 | !(k@104@01 < |a@74@01|)]
(assert (not (< k@104@01 (Seq_length a@74@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 43 | k@104@01 < |a@74@01|]
(assert (< k@104@01 (Seq_length a@74@01)))
; [eval] j >= 0
(push) ; 8
; [then-branch: 44 | !(j@105@01 >= 0) | live]
; [else-branch: 44 | j@105@01 >= 0 | live]
(push) ; 9
; [then-branch: 44 | !(j@105@01 >= 0)]
(assert (not (>= j@105@01 0)))
(pop) ; 9
(push) ; 9
; [else-branch: 44 | j@105@01 >= 0]
(assert (>= j@105@01 0))
; [eval] j < |a|
; [eval] |a|
(push) ; 10
; [then-branch: 45 | !(j@105@01 < |a@74@01|) | live]
; [else-branch: 45 | j@105@01 < |a@74@01| | live]
(push) ; 11
; [then-branch: 45 | !(j@105@01 < |a@74@01|)]
(assert (not (< j@105@01 (Seq_length a@74@01))))
(pop) ; 11
(push) ; 11
; [else-branch: 45 | j@105@01 < |a@74@01|]
(assert (< j@105@01 (Seq_length a@74@01)))
; [eval] k != j
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or (< j@105@01 (Seq_length a@74@01)) (not (< j@105@01 (Seq_length a@74@01)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@105@01 0)
  (and
    (>= j@105@01 0)
    (or
      (< j@105@01 (Seq_length a@74@01))
      (not (< j@105@01 (Seq_length a@74@01)))))))
(assert (or (>= j@105@01 0) (not (>= j@105@01 0))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< k@104@01 (Seq_length a@74@01))
  (and
    (< k@104@01 (Seq_length a@74@01))
    (=>
      (>= j@105@01 0)
      (and
        (>= j@105@01 0)
        (or
          (< j@105@01 (Seq_length a@74@01))
          (not (< j@105@01 (Seq_length a@74@01))))))
    (or (>= j@105@01 0) (not (>= j@105@01 0))))))
(assert (or (< k@104@01 (Seq_length a@74@01)) (not (< k@104@01 (Seq_length a@74@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= k@104@01 0)
  (and
    (>= k@104@01 0)
    (=>
      (< k@104@01 (Seq_length a@74@01))
      (and
        (< k@104@01 (Seq_length a@74@01))
        (=>
          (>= j@105@01 0)
          (and
            (>= j@105@01 0)
            (or
              (< j@105@01 (Seq_length a@74@01))
              (not (< j@105@01 (Seq_length a@74@01))))))
        (or (>= j@105@01 0) (not (>= j@105@01 0)))))
    (or
      (< k@104@01 (Seq_length a@74@01))
      (not (< k@104@01 (Seq_length a@74@01)))))))
(assert (or (>= k@104@01 0) (not (>= k@104@01 0))))
(push) ; 4
; [then-branch: 46 | k@104@01 >= 0 && k@104@01 < |a@74@01| && j@105@01 >= 0 && j@105@01 < |a@74@01| && k@104@01 != j@105@01 | live]
; [else-branch: 46 | !(k@104@01 >= 0 && k@104@01 < |a@74@01| && j@105@01 >= 0 && j@105@01 < |a@74@01| && k@104@01 != j@105@01) | live]
(push) ; 5
; [then-branch: 46 | k@104@01 >= 0 && k@104@01 < |a@74@01| && j@105@01 >= 0 && j@105@01 < |a@74@01| && k@104@01 != j@105@01]
(assert (and
  (>= k@104@01 0)
  (and
    (< k@104@01 (Seq_length a@74@01))
    (and
      (>= j@105@01 0)
      (and (< j@105@01 (Seq_length a@74@01)) (not (= k@104@01 j@105@01)))))))
; [eval] a[k] != a[j]
; [eval] a[k]
; [eval] a[j]
(pop) ; 5
(push) ; 5
; [else-branch: 46 | !(k@104@01 >= 0 && k@104@01 < |a@74@01| && j@105@01 >= 0 && j@105@01 < |a@74@01| && k@104@01 != j@105@01)]
(assert (not
  (and
    (>= k@104@01 0)
    (and
      (< k@104@01 (Seq_length a@74@01))
      (and
        (>= j@105@01 0)
        (and (< j@105@01 (Seq_length a@74@01)) (not (= k@104@01 j@105@01))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (>= k@104@01 0)
    (and
      (< k@104@01 (Seq_length a@74@01))
      (and
        (>= j@105@01 0)
        (and (< j@105@01 (Seq_length a@74@01)) (not (= k@104@01 j@105@01))))))
  (and
    (>= k@104@01 0)
    (< k@104@01 (Seq_length a@74@01))
    (>= j@105@01 0)
    (< j@105@01 (Seq_length a@74@01))
    (not (= k@104@01 j@105@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= k@104@01 0)
      (and
        (< k@104@01 (Seq_length a@74@01))
        (and
          (>= j@105@01 0)
          (and (< j@105@01 (Seq_length a@74@01)) (not (= k@104@01 j@105@01)))))))
  (and
    (>= k@104@01 0)
    (and
      (< k@104@01 (Seq_length a@74@01))
      (and
        (>= j@105@01 0)
        (and (< j@105@01 (Seq_length a@74@01)) (not (= k@104@01 j@105@01))))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@104@01 Int) (j@105@01 Int)) (!
  (and
    (=>
      (>= k@104@01 0)
      (and
        (>= k@104@01 0)
        (=>
          (< k@104@01 (Seq_length a@74@01))
          (and
            (< k@104@01 (Seq_length a@74@01))
            (=>
              (>= j@105@01 0)
              (and
                (>= j@105@01 0)
                (or
                  (< j@105@01 (Seq_length a@74@01))
                  (not (< j@105@01 (Seq_length a@74@01))))))
            (or (>= j@105@01 0) (not (>= j@105@01 0)))))
        (or
          (< k@104@01 (Seq_length a@74@01))
          (not (< k@104@01 (Seq_length a@74@01))))))
    (or (>= k@104@01 0) (not (>= k@104@01 0)))
    (=>
      (and
        (>= k@104@01 0)
        (and
          (< k@104@01 (Seq_length a@74@01))
          (and
            (>= j@105@01 0)
            (and (< j@105@01 (Seq_length a@74@01)) (not (= k@104@01 j@105@01))))))
      (and
        (>= k@104@01 0)
        (< k@104@01 (Seq_length a@74@01))
        (>= j@105@01 0)
        (< j@105@01 (Seq_length a@74@01))
        (not (= k@104@01 j@105@01))))
    (or
      (not
        (and
          (>= k@104@01 0)
          (and
            (< k@104@01 (Seq_length a@74@01))
            (and
              (>= j@105@01 0)
              (and (< j@105@01 (Seq_length a@74@01)) (not (= k@104@01 j@105@01)))))))
      (and
        (>= k@104@01 0)
        (and
          (< k@104@01 (Seq_length a@74@01))
          (and
            (>= j@105@01 0)
            (and (< j@105@01 (Seq_length a@74@01)) (not (= k@104@01 j@105@01))))))))
  :pattern ((Seq_index a@74@01 k@104@01) (Seq_index a@74@01 j@105@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_indep_loop_drf_c.vpr@62@12@62@100-aux|)))
(push) ; 3
(assert (not (forall ((k@104@01 Int) (j@105@01 Int)) (!
  (=>
    (and
      (>= k@104@01 0)
      (and
        (< k@104@01 (Seq_length a@74@01))
        (and
          (>= j@105@01 0)
          (and (< j@105@01 (Seq_length a@74@01)) (not (= k@104@01 j@105@01))))))
    (not (= (Seq_index a@74@01 k@104@01) (Seq_index a@74@01 j@105@01))))
  :pattern ((Seq_index a@74@01 k@104@01) (Seq_index a@74@01 j@105@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_indep_loop_drf_c.vpr@62@12@62@100|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((k@104@01 Int) (j@105@01 Int)) (!
  (=>
    (and
      (>= k@104@01 0)
      (and
        (< k@104@01 (Seq_length a@74@01))
        (and
          (>= j@105@01 0)
          (and (< j@105@01 (Seq_length a@74@01)) (not (= k@104@01 j@105@01))))))
    (not (= (Seq_index a@74@01 k@104@01) (Seq_index a@74@01 j@105@01))))
  :pattern ((Seq_index a@74@01 k@104@01) (Seq_index a@74@01 j@105@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_indep_loop_drf_c.vpr@62@12@62@100|)))
; [eval] (forall k: Int, j: Int :: { b[k], b[j] } k >= 0 && (k < |b| && (j >= 0 && (j < |b| && k != j))) ==> b[k] != b[j])
(declare-const k@106@01 Int)
(declare-const j@107@01 Int)
(push) ; 3
; [eval] k >= 0 && (k < |b| && (j >= 0 && (j < |b| && k != j))) ==> b[k] != b[j]
; [eval] k >= 0 && (k < |b| && (j >= 0 && (j < |b| && k != j)))
; [eval] k >= 0
(push) ; 4
; [then-branch: 47 | !(k@106@01 >= 0) | live]
; [else-branch: 47 | k@106@01 >= 0 | live]
(push) ; 5
; [then-branch: 47 | !(k@106@01 >= 0)]
(assert (not (>= k@106@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 47 | k@106@01 >= 0]
(assert (>= k@106@01 0))
; [eval] k < |b|
; [eval] |b|
(push) ; 6
; [then-branch: 48 | !(k@106@01 < |b@75@01|) | live]
; [else-branch: 48 | k@106@01 < |b@75@01| | live]
(push) ; 7
; [then-branch: 48 | !(k@106@01 < |b@75@01|)]
(assert (not (< k@106@01 (Seq_length b@75@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 48 | k@106@01 < |b@75@01|]
(assert (< k@106@01 (Seq_length b@75@01)))
; [eval] j >= 0
(push) ; 8
; [then-branch: 49 | !(j@107@01 >= 0) | live]
; [else-branch: 49 | j@107@01 >= 0 | live]
(push) ; 9
; [then-branch: 49 | !(j@107@01 >= 0)]
(assert (not (>= j@107@01 0)))
(pop) ; 9
(push) ; 9
; [else-branch: 49 | j@107@01 >= 0]
(assert (>= j@107@01 0))
; [eval] j < |b|
; [eval] |b|
(push) ; 10
; [then-branch: 50 | !(j@107@01 < |b@75@01|) | live]
; [else-branch: 50 | j@107@01 < |b@75@01| | live]
(push) ; 11
; [then-branch: 50 | !(j@107@01 < |b@75@01|)]
(assert (not (< j@107@01 (Seq_length b@75@01))))
(pop) ; 11
(push) ; 11
; [else-branch: 50 | j@107@01 < |b@75@01|]
(assert (< j@107@01 (Seq_length b@75@01)))
; [eval] k != j
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or (< j@107@01 (Seq_length b@75@01)) (not (< j@107@01 (Seq_length b@75@01)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@107@01 0)
  (and
    (>= j@107@01 0)
    (or
      (< j@107@01 (Seq_length b@75@01))
      (not (< j@107@01 (Seq_length b@75@01)))))))
(assert (or (>= j@107@01 0) (not (>= j@107@01 0))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< k@106@01 (Seq_length b@75@01))
  (and
    (< k@106@01 (Seq_length b@75@01))
    (=>
      (>= j@107@01 0)
      (and
        (>= j@107@01 0)
        (or
          (< j@107@01 (Seq_length b@75@01))
          (not (< j@107@01 (Seq_length b@75@01))))))
    (or (>= j@107@01 0) (not (>= j@107@01 0))))))
(assert (or (< k@106@01 (Seq_length b@75@01)) (not (< k@106@01 (Seq_length b@75@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= k@106@01 0)
  (and
    (>= k@106@01 0)
    (=>
      (< k@106@01 (Seq_length b@75@01))
      (and
        (< k@106@01 (Seq_length b@75@01))
        (=>
          (>= j@107@01 0)
          (and
            (>= j@107@01 0)
            (or
              (< j@107@01 (Seq_length b@75@01))
              (not (< j@107@01 (Seq_length b@75@01))))))
        (or (>= j@107@01 0) (not (>= j@107@01 0)))))
    (or
      (< k@106@01 (Seq_length b@75@01))
      (not (< k@106@01 (Seq_length b@75@01)))))))
(assert (or (>= k@106@01 0) (not (>= k@106@01 0))))
(push) ; 4
; [then-branch: 51 | k@106@01 >= 0 && k@106@01 < |b@75@01| && j@107@01 >= 0 && j@107@01 < |b@75@01| && k@106@01 != j@107@01 | live]
; [else-branch: 51 | !(k@106@01 >= 0 && k@106@01 < |b@75@01| && j@107@01 >= 0 && j@107@01 < |b@75@01| && k@106@01 != j@107@01) | live]
(push) ; 5
; [then-branch: 51 | k@106@01 >= 0 && k@106@01 < |b@75@01| && j@107@01 >= 0 && j@107@01 < |b@75@01| && k@106@01 != j@107@01]
(assert (and
  (>= k@106@01 0)
  (and
    (< k@106@01 (Seq_length b@75@01))
    (and
      (>= j@107@01 0)
      (and (< j@107@01 (Seq_length b@75@01)) (not (= k@106@01 j@107@01)))))))
; [eval] b[k] != b[j]
; [eval] b[k]
; [eval] b[j]
(pop) ; 5
(push) ; 5
; [else-branch: 51 | !(k@106@01 >= 0 && k@106@01 < |b@75@01| && j@107@01 >= 0 && j@107@01 < |b@75@01| && k@106@01 != j@107@01)]
(assert (not
  (and
    (>= k@106@01 0)
    (and
      (< k@106@01 (Seq_length b@75@01))
      (and
        (>= j@107@01 0)
        (and (< j@107@01 (Seq_length b@75@01)) (not (= k@106@01 j@107@01))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (>= k@106@01 0)
    (and
      (< k@106@01 (Seq_length b@75@01))
      (and
        (>= j@107@01 0)
        (and (< j@107@01 (Seq_length b@75@01)) (not (= k@106@01 j@107@01))))))
  (and
    (>= k@106@01 0)
    (< k@106@01 (Seq_length b@75@01))
    (>= j@107@01 0)
    (< j@107@01 (Seq_length b@75@01))
    (not (= k@106@01 j@107@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= k@106@01 0)
      (and
        (< k@106@01 (Seq_length b@75@01))
        (and
          (>= j@107@01 0)
          (and (< j@107@01 (Seq_length b@75@01)) (not (= k@106@01 j@107@01)))))))
  (and
    (>= k@106@01 0)
    (and
      (< k@106@01 (Seq_length b@75@01))
      (and
        (>= j@107@01 0)
        (and (< j@107@01 (Seq_length b@75@01)) (not (= k@106@01 j@107@01))))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@106@01 Int) (j@107@01 Int)) (!
  (and
    (=>
      (>= k@106@01 0)
      (and
        (>= k@106@01 0)
        (=>
          (< k@106@01 (Seq_length b@75@01))
          (and
            (< k@106@01 (Seq_length b@75@01))
            (=>
              (>= j@107@01 0)
              (and
                (>= j@107@01 0)
                (or
                  (< j@107@01 (Seq_length b@75@01))
                  (not (< j@107@01 (Seq_length b@75@01))))))
            (or (>= j@107@01 0) (not (>= j@107@01 0)))))
        (or
          (< k@106@01 (Seq_length b@75@01))
          (not (< k@106@01 (Seq_length b@75@01))))))
    (or (>= k@106@01 0) (not (>= k@106@01 0)))
    (=>
      (and
        (>= k@106@01 0)
        (and
          (< k@106@01 (Seq_length b@75@01))
          (and
            (>= j@107@01 0)
            (and (< j@107@01 (Seq_length b@75@01)) (not (= k@106@01 j@107@01))))))
      (and
        (>= k@106@01 0)
        (< k@106@01 (Seq_length b@75@01))
        (>= j@107@01 0)
        (< j@107@01 (Seq_length b@75@01))
        (not (= k@106@01 j@107@01))))
    (or
      (not
        (and
          (>= k@106@01 0)
          (and
            (< k@106@01 (Seq_length b@75@01))
            (and
              (>= j@107@01 0)
              (and (< j@107@01 (Seq_length b@75@01)) (not (= k@106@01 j@107@01)))))))
      (and
        (>= k@106@01 0)
        (and
          (< k@106@01 (Seq_length b@75@01))
          (and
            (>= j@107@01 0)
            (and (< j@107@01 (Seq_length b@75@01)) (not (= k@106@01 j@107@01))))))))
  :pattern ((Seq_index b@75@01 k@106@01) (Seq_index b@75@01 j@107@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_indep_loop_drf_c.vpr@63@12@63@100-aux|)))
(push) ; 3
(assert (not (forall ((k@106@01 Int) (j@107@01 Int)) (!
  (=>
    (and
      (>= k@106@01 0)
      (and
        (< k@106@01 (Seq_length b@75@01))
        (and
          (>= j@107@01 0)
          (and (< j@107@01 (Seq_length b@75@01)) (not (= k@106@01 j@107@01))))))
    (not (= (Seq_index b@75@01 k@106@01) (Seq_index b@75@01 j@107@01))))
  :pattern ((Seq_index b@75@01 k@106@01) (Seq_index b@75@01 j@107@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_indep_loop_drf_c.vpr@63@12@63@100|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((k@106@01 Int) (j@107@01 Int)) (!
  (=>
    (and
      (>= k@106@01 0)
      (and
        (< k@106@01 (Seq_length b@75@01))
        (and
          (>= j@107@01 0)
          (and (< j@107@01 (Seq_length b@75@01)) (not (= k@106@01 j@107@01))))))
    (not (= (Seq_index b@75@01 k@106@01) (Seq_index b@75@01 j@107@01))))
  :pattern ((Seq_index b@75@01 k@106@01) (Seq_index b@75@01 j@107@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_indep_loop_drf_c.vpr@63@12@63@100|)))
; [eval] (forall k: Int, j: Int :: { c[k], c[j] } k >= 0 && (k < |c| && (j >= 0 && (j < |c| && k != j))) ==> c[k] != c[j])
(declare-const k@108@01 Int)
(declare-const j@109@01 Int)
(push) ; 3
; [eval] k >= 0 && (k < |c| && (j >= 0 && (j < |c| && k != j))) ==> c[k] != c[j]
; [eval] k >= 0 && (k < |c| && (j >= 0 && (j < |c| && k != j)))
; [eval] k >= 0
(push) ; 4
; [then-branch: 52 | !(k@108@01 >= 0) | live]
; [else-branch: 52 | k@108@01 >= 0 | live]
(push) ; 5
; [then-branch: 52 | !(k@108@01 >= 0)]
(assert (not (>= k@108@01 0)))
(pop) ; 5
(push) ; 5
; [else-branch: 52 | k@108@01 >= 0]
(assert (>= k@108@01 0))
; [eval] k < |c|
; [eval] |c|
(push) ; 6
; [then-branch: 53 | !(k@108@01 < |c@76@01|) | live]
; [else-branch: 53 | k@108@01 < |c@76@01| | live]
(push) ; 7
; [then-branch: 53 | !(k@108@01 < |c@76@01|)]
(assert (not (< k@108@01 (Seq_length c@76@01))))
(pop) ; 7
(push) ; 7
; [else-branch: 53 | k@108@01 < |c@76@01|]
(assert (< k@108@01 (Seq_length c@76@01)))
; [eval] j >= 0
(push) ; 8
; [then-branch: 54 | !(j@109@01 >= 0) | live]
; [else-branch: 54 | j@109@01 >= 0 | live]
(push) ; 9
; [then-branch: 54 | !(j@109@01 >= 0)]
(assert (not (>= j@109@01 0)))
(pop) ; 9
(push) ; 9
; [else-branch: 54 | j@109@01 >= 0]
(assert (>= j@109@01 0))
; [eval] j < |c|
; [eval] |c|
(push) ; 10
; [then-branch: 55 | !(j@109@01 < |c@76@01|) | live]
; [else-branch: 55 | j@109@01 < |c@76@01| | live]
(push) ; 11
; [then-branch: 55 | !(j@109@01 < |c@76@01|)]
(assert (not (< j@109@01 (Seq_length c@76@01))))
(pop) ; 11
(push) ; 11
; [else-branch: 55 | j@109@01 < |c@76@01|]
(assert (< j@109@01 (Seq_length c@76@01)))
; [eval] k != j
(pop) ; 11
(pop) ; 10
; Joined path conditions
; Joined path conditions
(assert (or (< j@109@01 (Seq_length c@76@01)) (not (< j@109@01 (Seq_length c@76@01)))))
(pop) ; 9
(pop) ; 8
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= j@109@01 0)
  (and
    (>= j@109@01 0)
    (or
      (< j@109@01 (Seq_length c@76@01))
      (not (< j@109@01 (Seq_length c@76@01)))))))
(assert (or (>= j@109@01 0) (not (>= j@109@01 0))))
(pop) ; 7
(pop) ; 6
; Joined path conditions
; Joined path conditions
(assert (=>
  (< k@108@01 (Seq_length c@76@01))
  (and
    (< k@108@01 (Seq_length c@76@01))
    (=>
      (>= j@109@01 0)
      (and
        (>= j@109@01 0)
        (or
          (< j@109@01 (Seq_length c@76@01))
          (not (< j@109@01 (Seq_length c@76@01))))))
    (or (>= j@109@01 0) (not (>= j@109@01 0))))))
(assert (or (< k@108@01 (Seq_length c@76@01)) (not (< k@108@01 (Seq_length c@76@01)))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (=>
  (>= k@108@01 0)
  (and
    (>= k@108@01 0)
    (=>
      (< k@108@01 (Seq_length c@76@01))
      (and
        (< k@108@01 (Seq_length c@76@01))
        (=>
          (>= j@109@01 0)
          (and
            (>= j@109@01 0)
            (or
              (< j@109@01 (Seq_length c@76@01))
              (not (< j@109@01 (Seq_length c@76@01))))))
        (or (>= j@109@01 0) (not (>= j@109@01 0)))))
    (or
      (< k@108@01 (Seq_length c@76@01))
      (not (< k@108@01 (Seq_length c@76@01)))))))
(assert (or (>= k@108@01 0) (not (>= k@108@01 0))))
(push) ; 4
; [then-branch: 56 | k@108@01 >= 0 && k@108@01 < |c@76@01| && j@109@01 >= 0 && j@109@01 < |c@76@01| && k@108@01 != j@109@01 | live]
; [else-branch: 56 | !(k@108@01 >= 0 && k@108@01 < |c@76@01| && j@109@01 >= 0 && j@109@01 < |c@76@01| && k@108@01 != j@109@01) | live]
(push) ; 5
; [then-branch: 56 | k@108@01 >= 0 && k@108@01 < |c@76@01| && j@109@01 >= 0 && j@109@01 < |c@76@01| && k@108@01 != j@109@01]
(assert (and
  (>= k@108@01 0)
  (and
    (< k@108@01 (Seq_length c@76@01))
    (and
      (>= j@109@01 0)
      (and (< j@109@01 (Seq_length c@76@01)) (not (= k@108@01 j@109@01)))))))
; [eval] c[k] != c[j]
; [eval] c[k]
; [eval] c[j]
(pop) ; 5
(push) ; 5
; [else-branch: 56 | !(k@108@01 >= 0 && k@108@01 < |c@76@01| && j@109@01 >= 0 && j@109@01 < |c@76@01| && k@108@01 != j@109@01)]
(assert (not
  (and
    (>= k@108@01 0)
    (and
      (< k@108@01 (Seq_length c@76@01))
      (and
        (>= j@109@01 0)
        (and (< j@109@01 (Seq_length c@76@01)) (not (= k@108@01 j@109@01))))))))
(pop) ; 5
(pop) ; 4
; Joined path conditions
(assert (=>
  (and
    (>= k@108@01 0)
    (and
      (< k@108@01 (Seq_length c@76@01))
      (and
        (>= j@109@01 0)
        (and (< j@109@01 (Seq_length c@76@01)) (not (= k@108@01 j@109@01))))))
  (and
    (>= k@108@01 0)
    (< k@108@01 (Seq_length c@76@01))
    (>= j@109@01 0)
    (< j@109@01 (Seq_length c@76@01))
    (not (= k@108@01 j@109@01)))))
; Joined path conditions
(assert (or
  (not
    (and
      (>= k@108@01 0)
      (and
        (< k@108@01 (Seq_length c@76@01))
        (and
          (>= j@109@01 0)
          (and (< j@109@01 (Seq_length c@76@01)) (not (= k@108@01 j@109@01)))))))
  (and
    (>= k@108@01 0)
    (and
      (< k@108@01 (Seq_length c@76@01))
      (and
        (>= j@109@01 0)
        (and (< j@109@01 (Seq_length c@76@01)) (not (= k@108@01 j@109@01))))))))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (forall ((k@108@01 Int) (j@109@01 Int)) (!
  (and
    (=>
      (>= k@108@01 0)
      (and
        (>= k@108@01 0)
        (=>
          (< k@108@01 (Seq_length c@76@01))
          (and
            (< k@108@01 (Seq_length c@76@01))
            (=>
              (>= j@109@01 0)
              (and
                (>= j@109@01 0)
                (or
                  (< j@109@01 (Seq_length c@76@01))
                  (not (< j@109@01 (Seq_length c@76@01))))))
            (or (>= j@109@01 0) (not (>= j@109@01 0)))))
        (or
          (< k@108@01 (Seq_length c@76@01))
          (not (< k@108@01 (Seq_length c@76@01))))))
    (or (>= k@108@01 0) (not (>= k@108@01 0)))
    (=>
      (and
        (>= k@108@01 0)
        (and
          (< k@108@01 (Seq_length c@76@01))
          (and
            (>= j@109@01 0)
            (and (< j@109@01 (Seq_length c@76@01)) (not (= k@108@01 j@109@01))))))
      (and
        (>= k@108@01 0)
        (< k@108@01 (Seq_length c@76@01))
        (>= j@109@01 0)
        (< j@109@01 (Seq_length c@76@01))
        (not (= k@108@01 j@109@01))))
    (or
      (not
        (and
          (>= k@108@01 0)
          (and
            (< k@108@01 (Seq_length c@76@01))
            (and
              (>= j@109@01 0)
              (and (< j@109@01 (Seq_length c@76@01)) (not (= k@108@01 j@109@01)))))))
      (and
        (>= k@108@01 0)
        (and
          (< k@108@01 (Seq_length c@76@01))
          (and
            (>= j@109@01 0)
            (and (< j@109@01 (Seq_length c@76@01)) (not (= k@108@01 j@109@01))))))))
  :pattern ((Seq_index c@76@01 k@108@01) (Seq_index c@76@01 j@109@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_indep_loop_drf_c.vpr@64@12@64@100-aux|)))
(push) ; 3
(assert (not (forall ((k@108@01 Int) (j@109@01 Int)) (!
  (=>
    (and
      (>= k@108@01 0)
      (and
        (< k@108@01 (Seq_length c@76@01))
        (and
          (>= j@109@01 0)
          (and (< j@109@01 (Seq_length c@76@01)) (not (= k@108@01 j@109@01))))))
    (not (= (Seq_index c@76@01 k@108@01) (Seq_index c@76@01 j@109@01))))
  :pattern ((Seq_index c@76@01 k@108@01) (Seq_index c@76@01 j@109@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_indep_loop_drf_c.vpr@64@12@64@100|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(assert (forall ((k@108@01 Int) (j@109@01 Int)) (!
  (=>
    (and
      (>= k@108@01 0)
      (and
        (< k@108@01 (Seq_length c@76@01))
        (and
          (>= j@109@01 0)
          (and (< j@109@01 (Seq_length c@76@01)) (not (= k@108@01 j@109@01))))))
    (not (= (Seq_index c@76@01 k@108@01) (Seq_index c@76@01 j@109@01))))
  :pattern ((Seq_index c@76@01 k@108@01) (Seq_index c@76@01 j@109@01))
  :qid |prog./silicon/silver/src/test/resources/quantifiedpermissions/third_party/test_indep_loop_drf_c.vpr@64@12@64@100|)))
(declare-const i@110@01 Int)
(push) ; 3
; [eval] 0 <= i && i < N
; [eval] 0 <= i
(push) ; 4
; [then-branch: 57 | !(0 <= i@110@01) | live]
; [else-branch: 57 | 0 <= i@110@01 | live]
(push) ; 5
; [then-branch: 57 | !(0 <= i@110@01)]
(assert (not (<= 0 i@110@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 57 | 0 <= i@110@01]
(assert (<= 0 i@110@01))
; [eval] i < N
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@110@01) (not (<= 0 i@110@01))))
(assert (and (<= 0 i@110@01) (< i@110@01 N@77@01)))
; [eval] a[i]
(push) ; 4
(assert (not (>= i@110@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@110@01 (Seq_length a@74@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@111@01 ($Ref) Int)
(declare-fun img@112@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@110@01 Int)) (!
  (=>
    (and (<= 0 i@110@01) (< i@110@01 N@77@01))
    (or (<= 0 i@110@01) (not (<= 0 i@110@01))))
  :pattern ((Seq_index a@74@01 i@110@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@110@01 Int) (i2@110@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@110@01) (< i1@110@01 N@77@01))
      (and (<= 0 i2@110@01) (< i2@110@01 N@77@01))
      (= (Seq_index a@74@01 i1@110@01) (Seq_index a@74@01 i2@110@01)))
    (= i1@110@01 i2@110@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@110@01 Int)) (!
  (=>
    (and (<= 0 i@110@01) (< i@110@01 N@77@01))
    (and
      (= (inv@111@01 (Seq_index a@74@01 i@110@01)) i@110@01)
      (img@112@01 (Seq_index a@74@01 i@110@01))))
  :pattern ((Seq_index a@74@01 i@110@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@112@01 r) (and (<= 0 (inv@111@01 r)) (< (inv@111@01 r) N@77@01)))
    (= (Seq_index a@74@01 (inv@111@01 r)) r))
  :pattern ((inv@111@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((i@110@01 Int)) (!
  (= (Seq_index a@74@01 i@110@01) (Seq_index c@76@01 i@110@01))
  
  :qid |quant-u-85|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((i@110@01 Int)) (!
  (= (Seq_index a@74@01 i@110@01) (Seq_index b@75@01 i@110@01))
  
  :qid |quant-u-86|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@113@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@111@01 r)) (< (inv@111@01 r) N@77@01))
      (img@112@01 r)
      (= r (Seq_index a@74@01 (inv@111@01 r))))
    ($Perm.min
      (ite
        (and (img@87@01 r) (and (<= 0 (inv@86@01 r)) (< (inv@86@01 r) N@77@01)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@114@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@111@01 r)) (< (inv@111@01 r) N@77@01))
      (img@112@01 r)
      (= r (Seq_index a@74@01 (inv@111@01 r))))
    ($Perm.min
      (ite
        (and (img@90@01 r) (and (<= 0 (inv@89@01 r)) (< (inv@89@01 r) N@77@01)))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@113@01 r)))
    $Perm.No))
(define-fun pTaken@115@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@111@01 r)) (< (inv@111@01 r) N@77@01))
      (img@112@01 r)
      (= r (Seq_index a@74@01 (inv@111@01 r))))
    ($Perm.min
      (ite
        (and (img@93@01 r) (and (<= 0 (inv@92@01 r)) (< (inv@92@01 r) N@77@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (- (- $Perm.Write (pTaken@113@01 r)) (pTaken@114@01 r)))
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
        (and (img@87@01 r) (and (<= 0 (inv@86@01 r)) (< (inv@86@01 r) N@77@01)))
        $Perm.Write
        $Perm.No)
      (pTaken@113@01 r))
    $Perm.No)
  
  :qid |quant-u-88|))))
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
      (and (<= 0 (inv@111@01 r)) (< (inv@111@01 r) N@77@01))
      (img@112@01 r)
      (= r (Seq_index a@74@01 (inv@111@01 r))))
    (= (- $Perm.Write (pTaken@113@01 r)) $Perm.No))
  
  :qid |quant-u-89|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@116@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@87@01 r) (and (<= 0 (inv@86@01 r)) (< (inv@86@01 r) N@77@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@116@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@78@01)))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@116@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@78@01)))))))) r))
  :qid |qp.fvfValDef0|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@90@01 r) (and (<= 0 (inv@89@01 r)) (< (inv@89@01 r) N@77@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@116@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@78@01)))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@116@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@78@01)))))))))) r))
  :qid |qp.fvfValDef1|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@93@01 r) (and (<= 0 (inv@92@01 r)) (< (inv@92@01 r) N@77@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@116@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@78@01))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@116@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@78@01))))))))))) r))
  :qid |qp.fvfValDef2|)))
(declare-const i@117@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i && i < N
; [eval] 0 <= i
(push) ; 4
; [then-branch: 58 | !(0 <= i@117@01) | live]
; [else-branch: 58 | 0 <= i@117@01 | live]
(push) ; 5
; [then-branch: 58 | !(0 <= i@117@01)]
(assert (not (<= 0 i@117@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 58 | 0 <= i@117@01]
(assert (<= 0 i@117@01))
; [eval] i < N
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@117@01) (not (<= 0 i@117@01))))
(assert (and (<= 0 i@117@01) (< i@117@01 N@77@01)))
; [eval] c[i]
(push) ; 4
(assert (not (>= i@117@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@117@01 (Seq_length c@76@01))))
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
    (and (<= 0 i@117@01) (< i@117@01 N@77@01))
    (or (<= 0 i@117@01) (not (<= 0 i@117@01))))
  :pattern ((Seq_index c@76@01 i@117@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@117@01 Int) (i2@117@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@117@01) (< i1@117@01 N@77@01))
      (and (<= 0 i2@117@01) (< i2@117@01 N@77@01))
      (= (Seq_index c@76@01 i1@117@01) (Seq_index c@76@01 i2@117@01)))
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
    (and (<= 0 i@117@01) (< i@117@01 N@77@01))
    (and
      (= (inv@118@01 (Seq_index c@76@01 i@117@01)) i@117@01)
      (img@119@01 (Seq_index c@76@01 i@117@01))))
  :pattern ((Seq_index c@76@01 i@117@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@119@01 r) (and (<= 0 (inv@118@01 r)) (< (inv@118@01 r) N@77@01)))
    (= (Seq_index c@76@01 (inv@118@01 r)) r))
  :pattern ((inv@118@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((i@117@01 Int)) (!
  (= (Seq_index c@76@01 i@117@01) (Seq_index b@75@01 i@117@01))
  
  :qid |quant-u-91|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@120@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@118@01 r)) (< (inv@118@01 r) N@77@01))
      (img@119@01 r)
      (= r (Seq_index c@76@01 (inv@118@01 r))))
    ($Perm.min
      (ite
        (and (img@90@01 r) (and (<= 0 (inv@89@01 r)) (< (inv@89@01 r) N@77@01)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@121@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@118@01 r)) (< (inv@118@01 r) N@77@01))
      (img@119@01 r)
      (= r (Seq_index c@76@01 (inv@118@01 r))))
    ($Perm.min
      (ite
        (and (img@93@01 r) (and (<= 0 (inv@92@01 r)) (< (inv@92@01 r) N@77@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (- $Perm.Write (pTaken@120@01 r)))
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
        (and (img@90@01 r) (and (<= 0 (inv@89@01 r)) (< (inv@89@01 r) N@77@01)))
        $Perm.Write
        $Perm.No)
      (pTaken@120@01 r))
    $Perm.No)
  
  :qid |quant-u-93|))))
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
      (and (<= 0 (inv@118@01 r)) (< (inv@118@01 r) N@77@01))
      (img@119@01 r)
      (= r (Seq_index c@76@01 (inv@118@01 r))))
    (= (- $Perm.Write (pTaken@120@01 r)) $Perm.No))
  
  :qid |quant-u-94|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@122@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@93@01 r) (and (<= 0 (inv@92@01 r)) (< (inv@92@01 r) N@77@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@78@01))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@78@01))))))))))) r))
  :qid |qp.fvfValDef3|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@90@01 r) (and (<= 0 (inv@89@01 r)) (< (inv@89@01 r) N@77@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@78@01)))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@122@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@78@01)))))))))) r))
  :qid |qp.fvfValDef4|)))
(declare-const i@123@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i && i < N
; [eval] 0 <= i
(push) ; 4
; [then-branch: 59 | !(0 <= i@123@01) | live]
; [else-branch: 59 | 0 <= i@123@01 | live]
(push) ; 5
; [then-branch: 59 | !(0 <= i@123@01)]
(assert (not (<= 0 i@123@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 59 | 0 <= i@123@01]
(assert (<= 0 i@123@01))
; [eval] i < N
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@123@01) (not (<= 0 i@123@01))))
(assert (and (<= 0 i@123@01) (< i@123@01 N@77@01)))
; [eval] b[i]
(push) ; 4
(assert (not (>= i@123@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@123@01 (Seq_length b@75@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@124@01 ($Ref) Int)
(declare-fun img@125@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@123@01 Int)) (!
  (=>
    (and (<= 0 i@123@01) (< i@123@01 N@77@01))
    (or (<= 0 i@123@01) (not (<= 0 i@123@01))))
  :pattern ((Seq_index b@75@01 i@123@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@123@01 Int) (i2@123@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@123@01) (< i1@123@01 N@77@01))
      (and (<= 0 i2@123@01) (< i2@123@01 N@77@01))
      (= (Seq_index b@75@01 i1@123@01) (Seq_index b@75@01 i2@123@01)))
    (= i1@123@01 i2@123@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@123@01 Int)) (!
  (=>
    (and (<= 0 i@123@01) (< i@123@01 N@77@01))
    (and
      (= (inv@124@01 (Seq_index b@75@01 i@123@01)) i@123@01)
      (img@125@01 (Seq_index b@75@01 i@123@01))))
  :pattern ((Seq_index b@75@01 i@123@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@125@01 r) (and (<= 0 (inv@124@01 r)) (< (inv@124@01 r) N@77@01)))
    (= (Seq_index b@75@01 (inv@124@01 r)) r))
  :pattern ((inv@124@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@126@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@124@01 r)) (< (inv@124@01 r) N@77@01))
      (img@125@01 r)
      (= r (Seq_index b@75@01 (inv@124@01 r))))
    ($Perm.min
      (ite
        (and (img@93@01 r) (and (<= 0 (inv@92@01 r)) (< (inv@92@01 r) N@77@01)))
        (/ (to_real 1) (to_real 2))
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
        (and (img@93@01 r) (and (<= 0 (inv@92@01 r)) (< (inv@92@01 r) N@77@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@126@01 r))
    $Perm.No)
  
  :qid |quant-u-97|))))
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
      (and (<= 0 (inv@124@01 r)) (< (inv@124@01 r) N@77@01))
      (img@125@01 r)
      (= r (Seq_index b@75@01 (inv@124@01 r))))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@126@01 r)) $Perm.No))
  
  :qid |quant-u-98|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@127@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@93@01 r) (and (<= 0 (inv@92@01 r)) (< (inv@92@01 r) N@77@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@127@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@78@01))))))))))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@127@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second ($Snap.second $t@78@01))))))))))) r))
  :qid |qp.fvfValDef5|)))
(declare-const $t@128@01 $Snap)
(assert (= $t@128@01 ($Snap.combine ($Snap.first $t@128@01) ($Snap.second $t@128@01))))
(declare-const i@129@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i && i < N
; [eval] 0 <= i
(push) ; 4
; [then-branch: 60 | !(0 <= i@129@01) | live]
; [else-branch: 60 | 0 <= i@129@01 | live]
(push) ; 5
; [then-branch: 60 | !(0 <= i@129@01)]
(assert (not (<= 0 i@129@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 60 | 0 <= i@129@01]
(assert (<= 0 i@129@01))
; [eval] i < N
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@129@01) (not (<= 0 i@129@01))))
(assert (and (<= 0 i@129@01) (< i@129@01 N@77@01)))
; [eval] a[i]
(push) ; 4
(assert (not (>= i@129@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@129@01 (Seq_length a@74@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@130@01 ($Ref) Int)
(declare-fun img@131@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@129@01 Int)) (!
  (=>
    (and (<= 0 i@129@01) (< i@129@01 N@77@01))
    (or (<= 0 i@129@01) (not (<= 0 i@129@01))))
  :pattern ((Seq_index a@74@01 i@129@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@129@01 Int) (i2@129@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@129@01) (< i1@129@01 N@77@01))
      (and (<= 0 i2@129@01) (< i2@129@01 N@77@01))
      (= (Seq_index a@74@01 i1@129@01) (Seq_index a@74@01 i2@129@01)))
    (= i1@129@01 i2@129@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@129@01 Int)) (!
  (=>
    (and (<= 0 i@129@01) (< i@129@01 N@77@01))
    (and
      (= (inv@130@01 (Seq_index a@74@01 i@129@01)) i@129@01)
      (img@131@01 (Seq_index a@74@01 i@129@01))))
  :pattern ((Seq_index a@74@01 i@129@01))
  :qid |quant-u-100|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@131@01 r) (and (<= 0 (inv@130@01 r)) (< (inv@130@01 r) N@77@01)))
    (= (Seq_index a@74@01 (inv@130@01 r)) r))
  :pattern ((inv@130@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@129@01 Int)) (!
  (=>
    (and (<= 0 i@129@01) (< i@129@01 N@77@01))
    (not (= (Seq_index a@74@01 i@129@01) $Ref.null)))
  :pattern ((Seq_index a@74@01 i@129@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(assert (=
  ($Snap.second $t@128@01)
  ($Snap.combine
    ($Snap.first ($Snap.second $t@128@01))
    ($Snap.second ($Snap.second $t@128@01)))))
(declare-const i@132@01 Int)
(push) ; 3
; [eval] 0 <= i && i < N
; [eval] 0 <= i
(push) ; 4
; [then-branch: 61 | !(0 <= i@132@01) | live]
; [else-branch: 61 | 0 <= i@132@01 | live]
(push) ; 5
; [then-branch: 61 | !(0 <= i@132@01)]
(assert (not (<= 0 i@132@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 61 | 0 <= i@132@01]
(assert (<= 0 i@132@01))
; [eval] i < N
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@132@01) (not (<= 0 i@132@01))))
(assert (and (<= 0 i@132@01) (< i@132@01 N@77@01)))
; [eval] c[i]
(push) ; 4
(assert (not (>= i@132@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@132@01 (Seq_length c@76@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@133@01 ($Ref) Int)
(declare-fun img@134@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@132@01 Int)) (!
  (=>
    (and (<= 0 i@132@01) (< i@132@01 N@77@01))
    (or (<= 0 i@132@01) (not (<= 0 i@132@01))))
  :pattern ((Seq_index c@76@01 i@132@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@132@01 Int) (i2@132@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@132@01) (< i1@132@01 N@77@01))
      (and (<= 0 i2@132@01) (< i2@132@01 N@77@01))
      (= (Seq_index c@76@01 i1@132@01) (Seq_index c@76@01 i2@132@01)))
    (= i1@132@01 i2@132@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@132@01 Int)) (!
  (=>
    (and (<= 0 i@132@01) (< i@132@01 N@77@01))
    (and
      (= (inv@133@01 (Seq_index c@76@01 i@132@01)) i@132@01)
      (img@134@01 (Seq_index c@76@01 i@132@01))))
  :pattern ((Seq_index c@76@01 i@132@01))
  :qid |quant-u-102|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@134@01 r) (and (<= 0 (inv@133@01 r)) (< (inv@133@01 r) N@77@01)))
    (= (Seq_index c@76@01 (inv@133@01 r)) r))
  :pattern ((inv@133@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@132@01 Int)) (!
  (=>
    (and (<= 0 i@132@01) (< i@132@01 N@77@01))
    (not (= (Seq_index c@76@01 i@132@01) $Ref.null)))
  :pattern ((Seq_index c@76@01 i@132@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index c@76@01 i@132@01) (Seq_index a@74@01 i@129@01))
    (=
      (and (img@134@01 r) (and (<= 0 (inv@133@01 r)) (< (inv@133@01 r) N@77@01)))
      (and (img@131@01 r) (and (<= 0 (inv@130@01 r)) (< (inv@130@01 r) N@77@01)))))
  
  :qid |quant-u-103|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(declare-const i@135@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i && i < N
; [eval] 0 <= i
(push) ; 4
; [then-branch: 62 | !(0 <= i@135@01) | live]
; [else-branch: 62 | 0 <= i@135@01 | live]
(push) ; 5
; [then-branch: 62 | !(0 <= i@135@01)]
(assert (not (<= 0 i@135@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 62 | 0 <= i@135@01]
(assert (<= 0 i@135@01))
; [eval] i < N
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@135@01) (not (<= 0 i@135@01))))
(assert (and (<= 0 i@135@01) (< i@135@01 N@77@01)))
; [eval] b[i]
(push) ; 4
(assert (not (>= i@135@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@135@01 (Seq_length b@75@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@136@01 ($Ref) Int)
(declare-fun img@137@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@135@01 Int)) (!
  (=>
    (and (<= 0 i@135@01) (< i@135@01 N@77@01))
    (or (<= 0 i@135@01) (not (<= 0 i@135@01))))
  :pattern ((Seq_index b@75@01 i@135@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@135@01 Int) (i2@135@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@135@01) (< i1@135@01 N@77@01))
      (and (<= 0 i2@135@01) (< i2@135@01 N@77@01))
      (= (Seq_index b@75@01 i1@135@01) (Seq_index b@75@01 i2@135@01)))
    (= i1@135@01 i2@135@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@135@01 Int)) (!
  (=>
    (and (<= 0 i@135@01) (< i@135@01 N@77@01))
    (and
      (= (inv@136@01 (Seq_index b@75@01 i@135@01)) i@135@01)
      (img@137@01 (Seq_index b@75@01 i@135@01))))
  :pattern ((Seq_index b@75@01 i@135@01))
  :qid |quant-u-105|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@137@01 r) (and (<= 0 (inv@136@01 r)) (< (inv@136@01 r) N@77@01)))
    (= (Seq_index b@75@01 (inv@136@01 r)) r))
  :pattern ((inv@136@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Permissions are non-negative
; Field permissions are at most one
; Permission implies non-null receiver
(assert (forall ((i@135@01 Int)) (!
  (=>
    (and (<= 0 i@135@01) (< i@135@01 N@77@01))
    (not (= (Seq_index b@75@01 i@135@01) $Ref.null)))
  :pattern ((Seq_index b@75@01 i@135@01))
  :qid |Ref__Integer_value-permImpliesNonNull|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((r $Ref)) (!
  (and
    (= (Seq_index b@75@01 i@135@01) (Seq_index c@76@01 i@132@01))
    (=
      (and (img@137@01 r) (and (<= 0 (inv@136@01 r)) (< (inv@136@01 r) N@77@01)))
      (and (img@134@01 r) (and (<= 0 (inv@133@01 r)) (< (inv@133@01 r) N@77@01)))))
  
  :qid |quant-u-106|))))
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
    (= (Seq_index b@75@01 i@135@01) (Seq_index a@74@01 i@129@01))
    (=
      (and (img@137@01 r) (and (<= 0 (inv@136@01 r)) (< (inv@136@01 r) N@77@01)))
      (and (img@131@01 r) (and (<= 0 (inv@130@01 r)) (< (inv@130@01 r) N@77@01)))))
  
  :qid |quant-u-107|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; State saturation: after contract
(set-option :timeout 50)
(check-sat)
; unknown
; [eval] |a| == N
; [eval] |a|
(declare-const i@138@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i && i < N
; [eval] 0 <= i
(push) ; 4
; [then-branch: 63 | !(0 <= i@138@01) | live]
; [else-branch: 63 | 0 <= i@138@01 | live]
(push) ; 5
; [then-branch: 63 | !(0 <= i@138@01)]
(assert (not (<= 0 i@138@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 63 | 0 <= i@138@01]
(assert (<= 0 i@138@01))
; [eval] i < N
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@138@01) (not (<= 0 i@138@01))))
(assert (and (<= 0 i@138@01) (< i@138@01 N@77@01)))
; [eval] a[i]
(push) ; 4
(assert (not (>= i@138@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@138@01 (Seq_length a@74@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@139@01 ($Ref) Int)
(declare-fun img@140@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@138@01 Int)) (!
  (=>
    (and (<= 0 i@138@01) (< i@138@01 N@77@01))
    (or (<= 0 i@138@01) (not (<= 0 i@138@01))))
  :pattern ((Seq_index a@74@01 i@138@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@138@01 Int) (i2@138@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@138@01) (< i1@138@01 N@77@01))
      (and (<= 0 i2@138@01) (< i2@138@01 N@77@01))
      (= (Seq_index a@74@01 i1@138@01) (Seq_index a@74@01 i2@138@01)))
    (= i1@138@01 i2@138@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@138@01 Int)) (!
  (=>
    (and (<= 0 i@138@01) (< i@138@01 N@77@01))
    (and
      (= (inv@139@01 (Seq_index a@74@01 i@138@01)) i@138@01)
      (img@140@01 (Seq_index a@74@01 i@138@01))))
  :pattern ((Seq_index a@74@01 i@138@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@140@01 r) (and (<= 0 (inv@139@01 r)) (< (inv@139@01 r) N@77@01)))
    (= (Seq_index a@74@01 (inv@139@01 r)) r))
  :pattern ((inv@139@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((i@138@01 Int)) (!
  (= (Seq_index a@74@01 i@138@01) (Seq_index c@76@01 i@138@01))
  
  :qid |quant-u-109|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
(set-option :timeout 0)
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((i@138@01 Int)) (!
  (= (Seq_index a@74@01 i@138@01) (Seq_index b@75@01 i@138@01))
  
  :qid |quant-u-110|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@141@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@139@01 r)) (< (inv@139@01 r) N@77@01))
      (img@140@01 r)
      (= r (Seq_index a@74@01 (inv@139@01 r))))
    ($Perm.min
      (ite
        (and
          (img@131@01 r)
          (and (<= 0 (inv@130@01 r)) (< (inv@130@01 r) N@77@01)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@142@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@139@01 r)) (< (inv@139@01 r) N@77@01))
      (img@140@01 r)
      (= r (Seq_index a@74@01 (inv@139@01 r))))
    ($Perm.min
      (ite
        (and
          (img@134@01 r)
          (and (<= 0 (inv@133@01 r)) (< (inv@133@01 r) N@77@01)))
        $Perm.Write
        $Perm.No)
      (- $Perm.Write (pTaken@141@01 r)))
    $Perm.No))
(define-fun pTaken@143@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@139@01 r)) (< (inv@139@01 r) N@77@01))
      (img@140@01 r)
      (= r (Seq_index a@74@01 (inv@139@01 r))))
    ($Perm.min
      (ite
        (and
          (img@137@01 r)
          (and (<= 0 (inv@136@01 r)) (< (inv@136@01 r) N@77@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (- (- $Perm.Write (pTaken@141@01 r)) (pTaken@142@01 r)))
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
          (img@131@01 r)
          (and (<= 0 (inv@130@01 r)) (< (inv@130@01 r) N@77@01)))
        $Perm.Write
        $Perm.No)
      (pTaken@141@01 r))
    $Perm.No)
  
  :qid |quant-u-112|))))
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
      (and (<= 0 (inv@139@01 r)) (< (inv@139@01 r) N@77@01))
      (img@140@01 r)
      (= r (Seq_index a@74@01 (inv@139@01 r))))
    (= (- $Perm.Write (pTaken@141@01 r)) $Perm.No))
  
  :qid |quant-u-113|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@144@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@131@01 r) (and (<= 0 (inv@130@01 r)) (< (inv@130@01 r) N@77@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@144@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first $t@128@01)) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@144@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first $t@128@01)) r))
  :qid |qp.fvfValDef6|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@134@01 r) (and (<= 0 (inv@133@01 r)) (< (inv@133@01 r) N@77@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@144@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@128@01))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@144@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@128@01))) r))
  :qid |qp.fvfValDef7|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@137@01 r) (and (<= 0 (inv@136@01 r)) (< (inv@136@01 r) N@77@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@144@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second $t@128@01))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@144@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second $t@128@01))) r))
  :qid |qp.fvfValDef8|)))
; [eval] |c| == N
; [eval] |c|
(declare-const i@145@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i && i < N
; [eval] 0 <= i
(push) ; 4
; [then-branch: 64 | !(0 <= i@145@01) | live]
; [else-branch: 64 | 0 <= i@145@01 | live]
(push) ; 5
; [then-branch: 64 | !(0 <= i@145@01)]
(assert (not (<= 0 i@145@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 64 | 0 <= i@145@01]
(assert (<= 0 i@145@01))
; [eval] i < N
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@145@01) (not (<= 0 i@145@01))))
(assert (and (<= 0 i@145@01) (< i@145@01 N@77@01)))
; [eval] c[i]
(push) ; 4
(assert (not (>= i@145@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@145@01 (Seq_length c@76@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@146@01 ($Ref) Int)
(declare-fun img@147@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@145@01 Int)) (!
  (=>
    (and (<= 0 i@145@01) (< i@145@01 N@77@01))
    (or (<= 0 i@145@01) (not (<= 0 i@145@01))))
  :pattern ((Seq_index c@76@01 i@145@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@145@01 Int) (i2@145@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@145@01) (< i1@145@01 N@77@01))
      (and (<= 0 i2@145@01) (< i2@145@01 N@77@01))
      (= (Seq_index c@76@01 i1@145@01) (Seq_index c@76@01 i2@145@01)))
    (= i1@145@01 i2@145@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@145@01 Int)) (!
  (=>
    (and (<= 0 i@145@01) (< i@145@01 N@77@01))
    (and
      (= (inv@146@01 (Seq_index c@76@01 i@145@01)) i@145@01)
      (img@147@01 (Seq_index c@76@01 i@145@01))))
  :pattern ((Seq_index c@76@01 i@145@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@147@01 r) (and (<= 0 (inv@146@01 r)) (< (inv@146@01 r) N@77@01)))
    (= (Seq_index c@76@01 (inv@146@01 r)) r))
  :pattern ((inv@146@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
(push) ; 3
(set-option :timeout 10)
(assert (not (forall ((i@145@01 Int)) (!
  (= (Seq_index c@76@01 i@145@01) (Seq_index b@75@01 i@145@01))
  
  :qid |quant-u-115|))))
(check-sat)
; unknown
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Precomputing data for removing quantified permissions
(define-fun pTaken@148@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@146@01 r)) (< (inv@146@01 r) N@77@01))
      (img@147@01 r)
      (= r (Seq_index c@76@01 (inv@146@01 r))))
    ($Perm.min
      (ite
        (and
          (img@134@01 r)
          (and (<= 0 (inv@133@01 r)) (< (inv@133@01 r) N@77@01)))
        $Perm.Write
        $Perm.No)
      $Perm.Write)
    $Perm.No))
(define-fun pTaken@149@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@146@01 r)) (< (inv@146@01 r) N@77@01))
      (img@147@01 r)
      (= r (Seq_index c@76@01 (inv@146@01 r))))
    ($Perm.min
      (ite
        (and
          (img@137@01 r)
          (and (<= 0 (inv@136@01 r)) (< (inv@136@01 r) N@77@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (- $Perm.Write (pTaken@148@01 r)))
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
          (img@134@01 r)
          (and (<= 0 (inv@133@01 r)) (< (inv@133@01 r) N@77@01)))
        $Perm.Write
        $Perm.No)
      (pTaken@148@01 r))
    $Perm.No)
  
  :qid |quant-u-117|))))
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
      (and (<= 0 (inv@146@01 r)) (< (inv@146@01 r) N@77@01))
      (img@147@01 r)
      (= r (Seq_index c@76@01 (inv@146@01 r))))
    (= (- $Perm.Write (pTaken@148@01 r)) $Perm.No))
  
  :qid |quant-u-118|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@150@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@137@01 r) (and (<= 0 (inv@136@01 r)) (< (inv@136@01 r) N@77@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@150@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second $t@128@01))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@150@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second $t@128@01))) r))
  :qid |qp.fvfValDef9|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@134@01 r) (and (<= 0 (inv@133@01 r)) (< (inv@133@01 r) N@77@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@150@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@128@01))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@150@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.first ($Snap.second $t@128@01))) r))
  :qid |qp.fvfValDef10|)))
; [eval] |b| == N
; [eval] |b|
(declare-const i@151@01 Int)
(set-option :timeout 0)
(push) ; 3
; [eval] 0 <= i && i < N
; [eval] 0 <= i
(push) ; 4
; [then-branch: 65 | !(0 <= i@151@01) | live]
; [else-branch: 65 | 0 <= i@151@01 | live]
(push) ; 5
; [then-branch: 65 | !(0 <= i@151@01)]
(assert (not (<= 0 i@151@01)))
(pop) ; 5
(push) ; 5
; [else-branch: 65 | 0 <= i@151@01]
(assert (<= 0 i@151@01))
; [eval] i < N
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (or (<= 0 i@151@01) (not (<= 0 i@151@01))))
(assert (and (<= 0 i@151@01) (< i@151@01 N@77@01)))
; [eval] b[i]
(push) ; 4
(assert (not (>= i@151@01 0)))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(push) ; 4
(assert (not (< i@151@01 (Seq_length b@75@01))))
(check-sat)
; unsat
(pop) ; 4
; 0,00s
; (get-info :all-statistics)
(pop) ; 3
(declare-fun inv@152@01 ($Ref) Int)
(declare-fun img@153@01 ($Ref) Bool)
; Nested auxiliary terms: globals
; Nested auxiliary terms: non-globals
(assert (forall ((i@151@01 Int)) (!
  (=>
    (and (<= 0 i@151@01) (< i@151@01 N@77@01))
    (or (<= 0 i@151@01) (not (<= 0 i@151@01))))
  :pattern ((Seq_index b@75@01 i@151@01))
  :qid |Ref__Integer_value-aux|)))
; Check receiver injectivity
(push) ; 3
(assert (not (forall ((i1@151@01 Int) (i2@151@01 Int)) (!
  (=>
    (and
      (and (<= 0 i1@151@01) (< i1@151@01 N@77@01))
      (and (<= 0 i2@151@01) (< i2@151@01 N@77@01))
      (= (Seq_index b@75@01 i1@151@01) (Seq_index b@75@01 i2@151@01)))
    (= i1@151@01 i2@151@01))
  
  :qid |Ref__Integer_value-rcvrInj|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Definitional axioms for inverse functions
(assert (forall ((i@151@01 Int)) (!
  (=>
    (and (<= 0 i@151@01) (< i@151@01 N@77@01))
    (and
      (= (inv@152@01 (Seq_index b@75@01 i@151@01)) i@151@01)
      (img@153@01 (Seq_index b@75@01 i@151@01))))
  :pattern ((Seq_index b@75@01 i@151@01))
  :qid |Ref__Integer_value-invOfFct|)))
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@153@01 r) (and (<= 0 (inv@152@01 r)) (< (inv@152@01 r) N@77@01)))
    (= (Seq_index b@75@01 (inv@152@01 r)) r))
  :pattern ((inv@152@01 r))
  :qid |Ref__Integer_value-fctOfInv|)))
; Precomputing data for removing quantified permissions
(define-fun pTaken@154@01 ((r $Ref)) $Perm
  (ite
    (and
      (and (<= 0 (inv@152@01 r)) (< (inv@152@01 r) N@77@01))
      (img@153@01 r)
      (= r (Seq_index b@75@01 (inv@152@01 r))))
    ($Perm.min
      (ite
        (and
          (img@137@01 r)
          (and (<= 0 (inv@136@01 r)) (< (inv@136@01 r) N@77@01)))
        (/ (to_real 1) (to_real 2))
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
          (img@137@01 r)
          (and (<= 0 (inv@136@01 r)) (< (inv@136@01 r) N@77@01)))
        (/ (to_real 1) (to_real 2))
        $Perm.No)
      (pTaken@154@01 r))
    $Perm.No)
  
  :qid |quant-u-121|))))
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
      (and (<= 0 (inv@152@01 r)) (< (inv@152@01 r) N@77@01))
      (img@153@01 r)
      (= r (Seq_index b@75@01 (inv@152@01 r))))
    (= (- (/ (to_real 1) (to_real 2)) (pTaken@154@01 r)) $Perm.No))
  
  :qid |quant-u-122|))))
(check-sat)
; unsat
(pop) ; 3
; 0,00s
; (get-info :all-statistics)
; Final check if taken enough permissions
; Done removing quantified permissions
(declare-const sm@155@01 $FVF<Ref__Integer_value>)
; Definitional axioms for snapshot map values
(assert (forall ((r $Ref)) (!
  (=>
    (and (img@137@01 r) (and (<= 0 (inv@136@01 r)) (< (inv@136@01 r) N@77@01)))
    (=
      ($FVF.lookup_Ref__Integer_value (as sm@155@01  $FVF<Ref__Integer_value>) r)
      ($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second $t@128@01))) r)))
  :pattern (($FVF.lookup_Ref__Integer_value (as sm@155@01  $FVF<Ref__Integer_value>) r))
  :pattern (($FVF.lookup_Ref__Integer_value ($SortWrappers.$SnapTo$FVF<Ref__Integer_value> ($Snap.second ($Snap.second $t@128@01))) r))
  :qid |qp.fvfValDef11|)))
(pop) ; 2
(pop) ; 1
